import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/tema.dart';

class ListNews extends StatelessWidget {
  final List<Article> listnews;

  const ListNews(this.listnews);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.listnews.length,
        itemBuilder: (BuildContext context, int index) {
          return _Noticia(news: this.listnews[index], index: index);
        });
  }
}

class _Noticia extends StatelessWidget {
  final Article news;
  final index;

  const _Noticia({required this.news, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TargetaTopBar(
          news: news,
          index: index,
        ),
        _TargetaTitulo(news: news),
        _TargetaImagen(news: news),
        _TargetaBody(news),
        _TargetaBotones(),
        SizedBox(
          height: 10,
        ),
        Divider(),
      ],
    );
  }
}

class _TargetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            fillColor: miTema.accentColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border),
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more),
          )
        ],
      ),
    );
  }
}

class _TargetaBody extends StatelessWidget {
  final Article news;

  const _TargetaBody(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text((news.description != null) ? news.description! : ''),
    );
  }
}

class _TargetaImagen extends StatelessWidget {
  final Article news;

  const _TargetaImagen({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (news.urlToImage != null)
                ? FadeInImage(
                    placeholder: AssetImage('assets/img/giphy.gif'),
                    image: NetworkImage(news.urlToImage!))
                : Image(image: AssetImage('assets/img/no-image.png'))),
      ),
    );
  }
}

class _TargetaTitulo extends StatelessWidget {
  final Article news;

  const _TargetaTitulo({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        news.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TargetaTopBar extends StatelessWidget {
  final Article news;
  final int index;

  const _TargetaTopBar({required this.news, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          children: <Widget>[
            Text(
              '${index + 1} ',
              style: TextStyle(color: miTema.accentColor),
            ),
            Text(
              '${news.source.name} ',
            )
          ],
        ));
  }
}
