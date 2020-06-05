import 'package:http/http.dart';
import 'package:rebound_mtb/model/ThreeWordsModel.dart';
import 'package:rebound_mtb/util/api_keys.dart' as keys;
import 'dart:convert';

class what_three_words_network {
  Future<ThreeWordsModel> getThreeWords(double lat, double long) async {
    var finalUrl = "https://api.what3words.com/v3/convert-to-3wa?coordinates="+lat.toString()+","+long.toString()+"&key="+keys.api_keys.getThreeWordsKey();

    final response = await get(Uri.encodeFull(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}"+" - called");

    if(response.statusCode == 200){
      print(ThreeWordsModel.fromJson(json.decode(response.body)));
      return ThreeWordsModel.fromJson(json.decode(response.body));

    }else{
      throw Exception("Error getting 3 Words response: " + response.statusCode.toString() +response.body.toString());
    }

  }
}