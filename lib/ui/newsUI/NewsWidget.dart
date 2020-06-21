import 'package:flutter/material.dart';
import 'package:rebound_mtb/model/StrapiNewsDemo.dart';
import 'package:rebound_mtb/network/StrapiNetwork.dart';
import 'package:rebound_mtb/ui/newsUI/NewsWidgetContent.dart';



class NewsWidget extends StatefulWidget {
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}



class _NewsWidgetState extends State<NewsWidget> {
  String _newsHeader = "";
  Future<StrapiNewsDemo> newsObject;

  @override
  void initState() {
    // TODO: Update initialisation of location
    super.initState();
    print("Initialising the news widget and making the API call");
    newsObject = StrapiNetwork().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: FutureBuilder<StrapiNewsDemo>(
            future: newsObject,
            builder: (BuildContext context,
                AsyncSnapshot<StrapiNewsDemo> snapshot) {
              if (snapshot.hasData) {
                return Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("We've got some data!"),
                    SizedBox(
                      height: 50,
                    ),
                    //Get the data

                    NewsWidgetContent(snapshot),
                  ],
                );
              }
              else {
                return Container(
                    child: Center(child: CircularProgressIndicator(),)
                );
              };
            }));
  }

}
