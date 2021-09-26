import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:file_picker/file_picker.dart';

import 'package:admin_dashboard/providers/providers.dart';

import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';

import 'package:email_validator/email_validator.dart';
import 'package:admin_dashboard/models/customer.dart';

import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';

class CustomerView extends StatefulWidget {
  final String uid;

  const CustomerView({Key? key, required this.uid}) : super(key: key);

  @override
  _CustomerViewState createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  Customer? customer;

  @override
  void initState() {
    super.initState();
    final customerProvider =
        Provider.of<CustomersProvider>(context, listen: false);
    final customerformProvider =
        Provider.of<CustomerFormProvider>(context, listen: false);

    customerProvider.getCustomerById(widget.uid).then((customerDB) {
      if (customerDB != null) {
        customerformProvider.customer = customerDB;
        customerformProvider.formKey =
            new GlobalKey<FormState>(); // para inicializar de nuevo el formkey.

        setState(() {
          this.customer = customerDB;
        });
      } else {
        NavigationService.replaceTo(
            '/dashboard/customers'); // para sacar el usuario a esta pantalla cuando ingresa un uid que no existe.
      }
    });
  }

  // creado cuan se ingresa un customer que no existe.
  @override
  void dispose() {
    this.customer = null;
    Provider.of<CustomerFormProvider>(context, listen: false).customer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Customer View', style: CustomLabels.h1),
          SizedBox(height: 10),
          if (customer == null)
            WhiteCard(
                child: Container(
              alignment: Alignment.center,
              height: 300,
              child: CircularProgressIndicator(),
            )),
          //Text('${customer?.nombre}')
          if (customer != null) _CustomerViewBody()
        ],
      ),
    );
  }
}

class _CustomerViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: {0: FixedColumnWidth(250)},
        // Ancho de la columna
        children: [
          TableRow(children: [
            // Avatar
            _AvatarContainer(),
            // Form
            _CustomersViewForm()
          ])
        ],
      ),
    );
  }
}

class _CustomersViewForm extends StatelessWidget {
  const _CustomersViewForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customerformProvider = Provider.of<CustomerFormProvider>(context);
    final customer = customerformProvider.customer!;

    return WhiteCard(
        title: 'Informacion General',
        child: Form(
            key: customerformProvider.formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  initialValue: customer.nombre,
                  decoration: CustomInputs.formInputDecoration(
                      hint: 'Nombre Customers',
                      label: 'Nombre',
                      icon: Icons.supervised_user_circle_outlined),
                  onChanged: (value) =>
                      customerformProvider.copyCustomerWith(nombre: value),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Ingrese un nombre.';
                    if (value.length < 2)
                      return 'Elnombre debe de ser de dos letras como minimo.';
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: customer.correo,
                  decoration: CustomInputs.formInputDecoration(
                      hint: 'Email Customers',
                      label: 'Email',
                      icon: Icons.mark_email_read_outlined),
                  onChanged: (value) =>
                      customerformProvider.copyCustomerWith(correo: value),
                  validator: (value) {
                    if (!EmailValidator.validate(value ?? ''))
                      return 'Email no válido';

                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 100),
                  child: ElevatedButton(
                      onPressed: () async {
                        // PUT - Actulizar Usuario
                        final saved =
                            await customerformProvider.updateCustomer();
                        if (saved) {
                          NotificationsService.showSnackbar(
                              'Usuario actualizado');
                          Provider.of<CustomersProvider>(context, listen: false)
                              .refreshCustomers(customer);
                        } else {
                          NotificationsService.showSnackbarError(
                              'No se pudo actualizar');
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.indigo),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      child: Row(
                        children: [
                          Icon(Icons.save_outlined),
                          Text(' Guardar ')
                        ],
                      )),
                )
              ],
            )));
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormPrvider = Provider.of<CustomerFormProvider>(context);
    final customer = userFormPrvider.customer!;

    final img = (customer.img == null)
        ? Image(image: AssetImage('no-image.jpg'))
        : FadeInImage.assetNetwork(
            placeholder: 'loader.gif', image: customer.img!);

    return WhiteCard(
        width: 250,
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Profile',
                style: CustomLabels.h2,
              ),
              SizedBox(height: 20),
              Container(
                width: 150,
                height: 160,
                child: Stack(
                  children: [
                    ClipOval(child: img),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white, width: 5)),
                        child: FloatingActionButton(
                          backgroundColor: Colors.indigo,
                          elevation: 0,
                          onPressed: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg', 'jpeg', 'png'],
                                    allowMultiple: false);

                            if (result != null) {
                              //PlatformFile file = result.files.first;
                              NotificationsService.showBusyIndicator(context);

                              final resp = await userFormPrvider.uploadImage(
                                  '/uploads/usuarios/${customer.uid}',
                                  result.files.first.bytes!);

                              Provider.of<CustomersProvider>(context,
                                      listen: false)
                                  .refreshCustomers(resp);

                              Navigator.of(context).pop();
                            } else {
                              // User canceled the picker
                            }
                          },
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                customer.nombre,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
