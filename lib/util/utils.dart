import 'package:intl/intl.dart';


class Utils {
  /*
Default latitude and longitude for Lennox Forest.
Absolutely todo:get rid of this crap...
 */


  static String getLat(){
    return "55.968999";
  }

  static String getLon(){
    return "-4.226788";
  }

  /*
  Accepts unix timestamp as input and returns date formatted as "FRI, Apr 10"
   */
  static String getFormattedDate(DateTime dt){
    return new DateFormat("EEE, MMM d").format(dt);

  }


}