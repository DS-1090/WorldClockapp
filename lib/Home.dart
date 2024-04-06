
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> datarecv = {};
  int count =0;
  bool isday= false;
  Image? img;
   @override
  Widget build(BuildContext context) {
    try{
      if(count == 0) {
        setState(() {
          count =9999;
        });
         datarecv = (ModalRoute
            .of(context)
            ?.settings
            .arguments as Map<String, dynamic>?)!;

        print('-----NEW=$datarecv----------');
        int curr = int.parse(datarecv?['time'].substring(0, 2));
        isday = curr > 6 && curr < 18 ? true : false;
      }
  }
    catch(err){
      print(err);
    }
    int curr = int.parse(datarecv?['time'].substring(0, 2));
    isday = curr > 6 && curr < 18 ? true : false;

    return Scaffold(
      body: Center(
        child: SafeArea(
              child: Center(
                //padding: const EdgeInsets.fromLTRB(10.0,40.0,10.0,10.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: isday
                          ? NetworkImage('https://images.pexels.com/photos/258149/pexels-photo-258149.jpeg')
                          : NetworkImage('https://images.pexels.com/photos/2469122/pexels-photo-2469122.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(60.0,130.0,60.0,0.0),
                    child: Column(
                    children: [

                         ElevatedButton(
                          onPressed: () async{
                          dynamic res = await Navigator.pushNamed(context, '/location');
                          print('=-------------------------------------res: $res=--------------------------------');
                          setState(() {
                            datarecv = {
                              'time': res['time'],
                              'location': res['location'],
                            };
                            print('--------------datarecv: $datarecv-----------------');
                          });
                        },
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.white,
                             foregroundColor: Colors.lightBlue[800],
                           ),

                            child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                             Icon(
                             Icons.edit_location,
                             ),
                               Text('Choose Location'),
                             ],
                             ),

                            ),
                      SizedBox(height:30.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            datarecv?['location'] ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                            ),
                          ),
                          SizedBox(height:20.0, width: 20.0,),
                          Text(
                            datarecv?['time'] ?? '',
                            style: TextStyle(
                              //color: Colors.deepPurple[400],
                              color: Colors.white,
                              fontSize: 60.0,
                            ),

                          )
                        ],
                      ),


                    ],
                    ),
                  ),
                ),
              ),
              ),
      )
     );
  }
}
