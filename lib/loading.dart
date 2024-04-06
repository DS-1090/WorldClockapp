import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'fetchdata.dart';
import 'Home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String currentTime="";

  @override
  void settime() async {
    fetchdata ob = fetchdata(loc: 'Kolkata', link: 'Asia/Kolkata');
    await ob.fetchtime();
    setState(() {
      currentTime = ob.now;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
        settings: RouteSettings(
          arguments: {
            'location': ob.loc,
            'time': ob.now,
          },
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    print('init run');
    settime();
  }

  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[700],
      body: Center(
        //padding: EdgeInsets.all(40.0),
        //child: Text('Loading $currentTime'),
        child:  SpinKitDualRing(
          color: Colors.white,
          size: 50.0,
        ),

      )
    );
  }
}



