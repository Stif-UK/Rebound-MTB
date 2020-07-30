import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:rebound_mtb/model/StrapiNewsModel.dart';
import 'package:markdown/markdown.dart' as md;

class NewsArticleWidget extends StatefulWidget {
  final StrapiNewsModel article;

  NewsArticleWidget({@required this.article});

  @override
  _NewsArticleWidgetState createState() => _NewsArticleWidgetState(article);

}


class _NewsArticleWidgetState extends State<NewsArticleWidget>{
    StrapiNewsModel article;

    _NewsArticleWidgetState(this.article);


  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.grey,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text("${article.headline}"),
    ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        child: IconButton(
          icon: Icon(Icons.close,
          color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ) ,
      body: Container(
        child: Markdown(
            data: article.body,
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
              .copyWith(textScaleFactor: 1.5),
        )
      )

    );
  }
}


