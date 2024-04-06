import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class fetchdata {
  String loc;
  String now = "";
   String link;

  fetchdata({required this.loc, required this.link});



  Future<void> fetchtime() async {
    // await Future.delayed(Duration(seconds: 3), (){
    //   print('---------------DIVYA-----------------');
    // });
    // String ret =  await Future.delayed(Duration(seconds: 3), (){
    //   return '---------------SAHITHI-----------------';
    // });
    // print(ret);

    // Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    // Map data = jsonDecode(response.body);
    // print(data);
  try{
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$link'));
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 6);
    DateTime time = DateTime.parse(datetime);
    Duration offsetDuration = Duration(
        hours: int.parse(offset.substring(0, 2)),
        minutes: int.parse(offset.substring(3, 5)));
    time = time.add(offsetDuration);
    now = time.toString();
     print(now);
      now = DateFormat('HH:mm').format(time);
     print(now);
  }
  catch(err){
    print('Error occured $err');
    now = 'Error in fetching time';
  }
  }
}
