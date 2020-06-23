import 'package:flutter/material.dart';
import 'package:rebound_mtb/model/StrapiNewsDemo.dart';
import 'package:rebound_mtb/network/StrapiNetwork.dart';
import 'package:rebound_mtb/ui/newsUI/NewsWidgetContent.dart';
import 'package:rebound_mtb/ui/Dialogs/Alerts.dart' as alerts;




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
                return ListView(

                  children: <Widget>[
                    NewsWidgetContent(snapshot)
                  ],
                );
              }
              else {
                newsObject.then((value) => (print("Got the news!")),
                    onError: (error) {
                      alerts.Alerts.failedAPICallAlert(
                          context, error.toString());
                    }
                );
                return Container(
                    child: Center(child: CircularProgressIndicator(),)
                );
              }



            }));
  }

}
