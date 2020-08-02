import 'package:flutter/material.dart';
import 'package:rebound_mtb/model/StrapiNewsModel.dart';
import 'package:rebound_mtb/network/StrapiNetwork.dart';
import 'package:rebound_mtb/ui/Dialogs/Alerts.dart' as alerts;
import 'package:rebound_mtb/ui/newsUI/NewsArticleWidget.dart';
import 'package:rebound_mtb/util/utils.dart' as utils;




class NewsWidget extends StatefulWidget {
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}



class _NewsWidgetState extends State<NewsWidget> {
  DateTime lastRefreshed = DateTime.now();
  Future<List<StrapiNewsModel>> newsObject;

  @override
  void initState() {
    super.initState();
    print("Initialising the news widget and making the API call");
    newsObject = StrapiNetwork().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshNews,
      child: Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.fromLTRB(1.0, 15.0, 1.0, 5.0),
          child: FutureBuilder<List<StrapiNewsModel>>(
              future: newsObject,
              builder: (BuildContext context,
                  AsyncSnapshot<List<StrapiNewsModel>> news) {

                if (news.hasData) {
                  return ListView.separated(

                    shrinkWrap: true,
                      itemCount: news.data.length,
                      separatorBuilder: (context, index){
                      return Divider(
                        color: Colors.blue,
                      );
                      },
                      itemBuilder: (context, index){
                      return ListTile(
                        title: Text(news.data[index].headline,
                        ),
                        trailing: Container(
                        child: CircleAvatar(
                        backgroundImage: NetworkImage("http://178.128.164.111${news.data[index].coverImage.formats.thumbnail.url}"),
                        ),
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(2.0), // border width
                          decoration: new BoxDecoration(
                          color: Colors.blue, // border color
                          shape: BoxShape.circle,
                          ),
                        ),
                        leading: Text("${utils.Utils.getFormattedDate(DateTime.parse(news.data[index].createdAt))}"),
                        onTap: (){openArticle(news.data[index]);},
                      );
                      }
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



              })),
    );
  }


  void openArticle(StrapiNewsModel article) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => NewsArticleWidget(article: article)
    ));
  }

  Future<void> _refreshNews() async {
    //Only call the API to refresh the news list if 5 minutes have passed since the last API call
    var difference = DateTime.now().difference(lastRefreshed).inSeconds;
    print("Time since last news API call: $difference seconds");

    if(difference>300){
      setState(() {
        newsObject = StrapiNetwork().getNews();
        newsObject.then((value) => print("Refreshed the news successfully"),
        onError: (error){
          alerts.Alerts.failedAPICallAlert(context, error.toString());
        });
        lastRefreshed = DateTime.now();
      });

      return newsObject;
    }
    else{
      print("No need to refresh the news. Time since last refresh is only $difference seconds");
    }
  }
}
