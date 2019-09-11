import 'dart:async';
import 'package:geocoder/geocoder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../util/dbhelper.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/geolocation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//import 'package:location/location.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
class Map extends StatefulWidget{

    createState() => MapState();
}

class MapState extends State<Map>{
  var height = 455.0;//height of search container
  var margin = 820.0;//margin of search container
  var clickText = "";
  var locationBoxEnabled = false;
  FocusNode location = new FocusNode();
  FocusNode search = new FocusNode();//focus controller for search textbox
  Completer<GoogleMapController> _controller = Completer(); //completer for google map
  @override

  Widget build(BuildContext context){
    SystemChrome.setEnabledSystemUIOverlays([]); //to hide navigation bar and activity bar
    double defaultScreenWidth = 400.0;
      double defaultScreenHeight = 810.0;

      ScreenUtil.instance = ScreenUtil(width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true)..init(context);

      location.unfocus();
       search.addListener((){
        if(!search.hasFocus){
          setState(() {
              //height = 0.0;
              margin = 350.0; 
          });
        }else{
          setState(() {
              height = 840.0;
              margin = 0.0; 
          });
        }
    });
    return 
      Scaffold(
        
        // bottomNavigationBar: BottomNavigationBar(
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       title: Text("Trip History"),
        //       icon: Icon(
        //         Icons.history,
        //         color: Colors.blue,
        //       ),

              
        //     ),

        //     BottomNavigationBarItem(
        //       title: Text("Favorite places"),
        //       icon: Icon(
        //         Icons.favorite,
        //         color: Colors.blue,
        //       ),

              
        //     ),

        //     BottomNavigationBarItem(
        //       title: Text("Settings"),
        //       icon: Icon(
        //         Icons.settings,
        //         color: Colors.blue,
        //       ),

              
        //     )


        //   ],
        // ),
        
        body: 
      Container( //Container that houses the entire components
        
        color: Color.fromRGBO(235, 185, 50, 1),
        child: Stack(
          children: <Widget>[
            Container( //Container for the map itself
              margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(0)),
              height: ScreenUtil.instance.setHeight(500),
              child:
            GoogleMap( //Creates google map.
              
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(target: LatLng(6.890414,3.722405), zoom: 12),
              onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
              },
              myLocationEnabled: true,
              markers: {
                
                currentLocationMarker
              },
            ),
            ),

            Container( //Container for account Icon
              height: ScreenUtil.instance.setHeight(25.0),
              width: ScreenUtil.instance.setWidth(25.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white)
              ),
              child:
              SizedBox(
              
              height: ScreenUtil.instance.setHeight(18.0),
              width: ScreenUtil.instance.setWidth(18.0),
              child: IconButton(
                 
                icon: Icon(
                  
                  Icons.person_outline,
                  size: ScreenUtil.instance.setSp(50),
                  color: Colors.yellow,
                ),
                onPressed: (){},
              )
              )
            ),//End of container for account Icon


            Container(//Container for instruction to tap text
              margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(70),
              top: ScreenUtil.instance.setHeight(30),
              ),
              child:
            Text("Tap a location on the map to book ride",
            style: TextStyle(
              color: Colors.grey,
              fontFamily: 'Open-Sans',
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil.instance.setSp(13)
            )
            ),
            ), //End of container for insturction to search text



            Container(//For search button
              
              margin: EdgeInsets.only(top:ScreenUtil.instance.setHeight(550),
              left: ScreenUtil.instance.setWidth(120)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: Color.fromRGBO(99, 4, 96, 1),
              ),
              width: ScreenUtil.instance.setWidth(150),
              height: ScreenUtil.instance.setHeight(150),
              
              
              child:
              Center(child: 
              ButtonTheme(
                  minWidth: ScreenUtil.instance.setWidth(190),
                  height: ScreenUtil.instance.setHeight(50),
                  child:
              IconButton(
                
                icon: Icon(Icons.search,
                color: Colors.white,
                ),
                
                onPressed: (){
                  setState(() {
                   //height = 455.0; 
                   margin = 350;
                  });
                },
              )
              )
              ),
            ),//End of container for search icon



            Container(//Container for bottom navigation
              margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(740)),
              padding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(10)),
              color: Colors.blue,
              height: ScreenUtil.instance.setHeight(70),
              child: 



              Column(
                children: <Widget>[
                  Row(
                    
                    children: <Widget>[
                      Expanded(//Contaioner for history button
                        child: IconButton(
                          icon: Icon(
                            Icons.history,
                            color: Colors.white
                          ),
                          onPressed: (){},
                        )
                      ),//End of conttainer for history button

                      Expanded(//Container for favorite button
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.white
                          ),
                          onPressed: (){},
                        )
                      ),//End of container for favorite button

                      Expanded(//Container for settings button
                        child: IconButton(
                          icon: Icon(
                            Icons.settings,
                            color: Colors.white
                          ),
                          onPressed: (){},
                        )
                      )//End of container for settings button


                    ],
                  )
                ],
              )
            ),

            
          AnimatedContainer(//Search container itself
            height: ScreenUtil.instance.setHeight(height),
            width: ScreenUtil.instance.setWidth(600),
            padding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(10), left: ScreenUtil.instance.setWidth(10)),
            margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(margin)),
            duration: Duration(milliseconds: 300),
            child: ListView(children: <Widget>[
              Container(//Conatiner for close button at the top of the container
                width: ScreenUtil.instance.setWidth(40),
                child: 
              ButtonTheme(
                  //buttonColor: Colors.red,
                  minWidth: ScreenUtil.instance.setWidth(100),
                  height: ScreenUtil.instance.setHeight(80),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                  child: IconButton(
                      
                      color: Colors.red,
                      icon: Icon(Icons.cancel,
                      
                      color: Colors.red,
                      ),
                      onPressed: (){
                        setState(() {
                          //height = 0.0;
                          
                          search.unfocus(); 
                          
                          margin = 820.0;
                         });
                      },
                  )
              )
              
              ),//End of container for close button at the top of main container

              Container(//Conatiner for search textbox
                width: ScreenUtil.instance.setWidth(350),
                child:
              TextField(
                  enabled: locationBoxEnabled,
                
                  focusNode: location,
                  decoration: InputDecoration(
                    
                    hintText: 'Your location',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), 
                    borderSide: BorderSide(
                      color: Colors.orange
                    )
                    ),
                    
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow)
                    ),

                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow)
                    ),
                    prefixIcon: Icon(Icons.my_location)
                  ),
              ),
              
              ),

              Container(
                height: 5,
                margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(0), bottom: ScreenUtil.instance.setHeight(0)),
                child: IconButton(
                  icon: Icon(Icons.stop,
                  color: Colors.yellow,),
                  onPressed: (){},
                )
              ),

              Container(
                height: 15,
                margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(0), bottom: ScreenUtil.instance.setHeight(0)),
                child: IconButton(
                  icon: Icon(Icons.stop,
                  color: Colors.yellow,),
                  onPressed: (){},
                )
              ),

              Container(
                margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(0), bottom: ScreenUtil.instance.setHeight(10)),
                child: IconButton(
                  icon: Icon(Icons.arrow_downward,
                  color: Colors.yellow,),
                  onPressed: (){},
                )
              ),
              
              Container(//Conatiner for search textbox
                width: ScreenUtil.instance.setWidth(350),
                //padding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(30)),
                child:
              TextField(
                  focusNode: search,
                  decoration: InputDecoration(
                    hintText: 'Where to?',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), 
                    borderSide: BorderSide(
                      color: Colors.orange
                    )
                    ),
                    
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow)
                    ),

                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow)
                    ),
                    prefixIcon: Icon(Icons.search)
                  ),
              ),
              
              ), //End of conatiner for search textbox
              
              Container(
              
              margin:  EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(10)),
              child: 
              ButtonTheme(
                
                padding: EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(10)),
                height: ScreenUtil.instance.setHeight(90),
                child:
                MaterialButton(
                  
                  color: Colors.blue,
                  
                  child: Text("San Francisco"),
                  onPressed: (){},
                ),
              ),
              ),

                Container(
              margin:  EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(10)),
              child:
              ButtonTheme(
                padding: EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(10)),
                height: ScreenUtil.instance.setHeight(90),
                child:
                FlatButton(
                  color: Colors.blue,
                  
                  child: Text("Lagos"),
                  onPressed: (){},
                ),
              ),
              ),



                Container(
              margin:  EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(10)),
              child:
              ButtonTheme(
                padding: EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(10)),
                height: ScreenUtil.instance.setHeight(90),
                child:
                FlatButton(
                  color: Colors.blue,
                  
                  child: Text("Nigeria"),
                  onPressed: (){},
                ),
              ),
              ),


                Container(
              margin:  EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(10)),
              child:
              ButtonTheme(
                padding: EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(10)),
                height: ScreenUtil.instance.setHeight(90),
                child:
                FlatButton(
                  color: Colors.blue,
                  
                  child: Text("South-Africa"),
                  onPressed: (){},
                ),
              ),
              ),


                Container(
              margin:  EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(10)),
              child:
              ButtonTheme(
                padding: EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(10)),
                height: ScreenUtil.instance.setHeight(90),
                child:
                FlatButton(
                  color: Colors.blue,
                  
                  child: Text("Zambia"),
                  onPressed: (){},
                ),
              ),
              ),

              
            ],),
            
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Color.fromRGBO(255, 255, 255, 1),

               //border: Border.all(color: Colors.black, width: 1),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(2.0, 3.0),
                    blurRadius: 5.0

                  )
                ]
          ),
          ),
          

          //   Container(
          //     height: ScreenUtil.instance.setHeight(350),
          //     margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(430)),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(5.0),
          //       color: Color.fromRGBO(255, 255, 255, 1),

          //      //border: Border.all(color: Colors.black, width: 1),
          //       boxShadow: <BoxShadow>[
          //         BoxShadow(
          //           color: Colors.black,
          //           offset: Offset(2.0, 3.0),
          //           blurRadius: 5.0

          //         )
          //       ]
          // ),
          //   )
          ],
        )
      )
      );
     
    
  }

  

  

}

Marker currentLocationMarker = Marker(
  icon: BitmapDescriptor.fromAsset('images/you.png'),
  
  markerId: MarkerId("userlocation"),
  position: LatLng(6.890414,3.722405),
  infoWindow: InfoWindow(title: 'This is where you are.')
);

