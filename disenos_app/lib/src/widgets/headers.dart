import 'package:flutter/material.dart';


class HeaderSquare extends StatelessWidget {
  const HeaderSquare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}


class HeaderCircular extends StatelessWidget {
  const HeaderCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration:  const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)
          ),
        
        color: Color(0xff615AAB),),
    );
  }
}

class HeaderDiagonally extends StatelessWidget {
  const HeaderDiagonally({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: const Color(0xff615AAB),
      child: CustomPaint(painter:_HeaderDiagonallyPaint() ,),
    );
  }
}
class _HeaderDiagonallyPaint extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
     final paint = Paint();

     //Propiedades
     paint.color = const Color(0xff615AAB);
     paint.style = PaintingStyle.fill; 
     //paint.style = PaintingStyle.stroke; 
     paint.strokeWidth = 5.0;

     final path = Path();

     path.moveTo(0, size.height * 0.35);
     path.lineTo(size.width,size.height * 0.30 );
     path.lineTo(size.width,0 );
     path.lineTo(0,0 );
     ///path.lineTo(0,size.height * 0.4);

     canvas.drawPath(path , paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}


class HeaderVertically extends StatelessWidget {
  const HeaderVertically({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: const Color(0xff615AAB),
      child: CustomPaint(painter:_HeaderVerticallyPaint() ,),
    );
  }
}
class _HeaderVerticallyPaint extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
     final paint = Paint();

     //Propiedades
     paint.color = const Color(0xff615AAB);
     paint.style = PaintingStyle.fill; 
     //paint.style = PaintingStyle.stroke; 
     paint.strokeWidth = 5.0;

     final path = Path();

     //path.lineTo(size.width,size.height );
     path.lineTo(size.width,size.height  );
     //path.lineTo(size.width,0 );
     path.lineTo(0,size.height);
     //path.lineTo(0,0 );

     canvas.drawPath(path , paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}

class HeaderPico extends StatelessWidget {
  const HeaderPico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: const Color(0xff615AAB),
      child: CustomPaint(painter:_HeaderPicoPaint() ,),
    );
  }
}
class _HeaderPicoPaint extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
     final paint = Paint();

     //Propiedades
     paint.color = const Color(0xff615AAB);
     paint.style = PaintingStyle.fill; 
     //paint.style = PaintingStyle.stroke; 
     paint.strokeWidth = 5.0;

     final path = Path();

    
     path.lineTo(0,size.height * 0.25);
     path.lineTo(size.width * 0.5, size.height * 0.30  );
     path.lineTo(size.width , size.height * 0.25 );
     path.lineTo(size.width , 0 );
     
     //path.lineTo(0,0 );

     canvas.drawPath(path , paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}