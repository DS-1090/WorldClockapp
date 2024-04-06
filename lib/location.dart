import 'package:flutter/material.dart';
import 'package:weather_app/fetchdata.dart';
class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  int count = 0;
  List<fetchdata> locations = [
    fetchdata(link: 'Europe/London', loc: 'London'),
    fetchdata(link: 'Europe/Berlin', loc: 'Athens' ),
    fetchdata(link: 'Africa/Cairo', loc: 'Cairo' ),
    fetchdata(link: 'Africa/Nairobi', loc: 'Nairobi' ),
    fetchdata(link: 'America/Chicago', loc: 'Chicago' ),
    fetchdata(link: 'America/New_York', loc: 'New York' ),
    fetchdata(link: 'Asia/Seoul', loc: 'Seoul' ),
    fetchdata(link: 'Asia/Jakarta', loc: 'Jakarta' ),
    fetchdata(link: 'Asia/Kolkata', loc: 'Kolkata' ),
    fetchdata(loc: 'Salta', link: 'America/Argentina/Salta'),
    fetchdata(loc: 'Johannesburg', link: 'Africa/Johannesburg'),

  ];

  void updatetime(index) async{
    fetchdata ob = locations[index];
     await ob.fetchtime();
    Navigator.pop(context,{
      'time': ob.now,  // Assuming 'now' contains the fetched time
      'location': ob.loc,
    });
  }

  Widget build(BuildContext context) {
    print('build run');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[800],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),

      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context,index ){
            return Card(
              color: Colors.lightBlue[50],
              child: ListTile(
                title: Text(locations[index].loc),

                 onTap: (){
                    updatetime(index);
                 },
              ),
            );

          }
      )
      // ElevatedButton(
      //   onPressed: () {
      //     setState(() {
      //       count += 1;
      //     });
      //   },
      //   child: Text('count is ${count}'),
      //  ),
    );
  }
}
