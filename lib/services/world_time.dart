import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location; // location name for UI
  String time = ""; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime = false; // true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    // make the request
    try {
      Response response =
          await get(Uri.http('worldtimeapi.org', '/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      String plusOrMinus = data['utc_offset'].substring(0, 1);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      if (plusOrMinus == '-') {
        now = now.subtract(Duration(hours: int.parse(offset)));
      } else {
        now = now.add(Duration(hours: int.parse(offset)));
      }

      // set the time property
      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('could not get time data');
    }
  }
}
