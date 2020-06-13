import 'package:intl/intl.dart';


class Utils {
  /*
Default latitude and longitude for Lennox Forest.
Absolutely todo:get rid of this crap...
 */

  //TODO: Implement default location choices as enums+map?
  //Really want to refactor this - these two methods don't make sense - too granular!

  static String getLat(String location){

    switch (location){
      case "Lennox Forest":
        return "55.968999";

      case "Falkland Bike Park":
        //return "19.112045"; //Mumbai for testing
        return "56.249925";

      default:
        //Code here to
        break;


    }



  }

  static String getLon(String location){

    switch (location) {
      case "Lennox Forest":
        return "-4.226788";

      case "Falkland Bike Park":
        //return "72.874310"; //Mumbai for testing
        return "-3.223234";

      default:
      //Code here to
        break;
    }

  }

  /*
  Accepts unix timestamp as input and returns date formatted as "FRI, Apr 10"
   */
  static String getFormattedDate(DateTime dt){
    return new DateFormat("EEE, MMM d").format(dt);

  }


}