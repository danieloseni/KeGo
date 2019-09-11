import 'package:flutter/material.dart';
import 'register.dart'; 
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../util/dbhelper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
       return Center(    
                   
           child:Trip()
           
              //  alignment: Alignment.center,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage('images/alarm.jpg'),
              //     fit: BoxFit.cover 
              //   )
                
              // ),
              //padding: EdgeInsets.only(top: 50.0, left: 79.0),
              
              //margin: EdgeInsets.all(70.0),
              //margin: EdgeInsets.only(left:70.0),
              // child:Column(
              //   children: <Widget>[Row(children: <Widget>[
              //   Expanded(child:Text(sayHello(), textDirection: TextDirection.ltr, 
              //     style: TextStyle(color: Colors.white, fontSize: 36.0,
              //     decoration: TextDecoration.none,
              //     fontFamily: 'Monoton',
              //     fontWeight: FontWeight.bold
              //     ),

              //   )
              //   ),

              //   Expanded(child:Text("The time is 12: 55", textDirection: TextDirection.ltr,
              //   style: TextStyle(
              //     fontSize: 20.0,
              //     color: Colors.yellow,
              //     fontWeight: FontWeight.bold
              //   ),)
              //   ),
              // ],
              // ),
              
              // Row(children: <Widget>[
              //   Expanded(child:Text(sayHello(), textDirection: TextDirection.ltr, 
              //     style: TextStyle(color: Colors.white, fontSize: 36.0,
              //     decoration: TextDecoration.none,
              //     fontFamily: 'Monoton',
              //     fontWeight: FontWeight.bold
              //     ),

              //   )
              //   ),

              //   Expanded(child:Text("The time is 12: 55", textDirection: TextDirection.ltr,
              //   style: TextStyle(
              //     fontSize: 20.0,
              //     color: Colors.yellow,
              //     fontWeight: FontWeight.bold
              //   ),)
              //   ),
              // ],
              // ),
              // ImageWidget()],

              
              // ),
              
              //child: ImageWidget(),
              // child: Container(child: Theme(
              //   data: ThemeData(
              //     primaryColor: Colors.white,
              //     primaryColorDark: Colors.red
                  
              //   ),
              //   child:TextField(
              //     textDirection: TextDirection.ltr,
              // style: TextStyle(
              //   height: 1.0,
              //   color: Colors.white
              // ),
              // decoration: InputDecoration(
              //   hintText: 'email',
              //   hintStyle: TextStyle(color: Colors.grey),
              //   border: OutlineInputBorder(
                  
              //     borderSide: BorderSide(color: Colors.white)
                  
              //   ),
                
                
                
                
                
              //   icon: Icon(Icons.person)
              // ),
              
              // ),
              // ),
              
              // width: 500.0
              
              
              
              
          
       );
        
      
  }

  

  String sayHello(){
    String hello = "This if flutter";
    DateTime date = DateTime.now();
    if(date.hour < 12){
      hello = "Good Morning";
    }else if(date.hour > 12 && date.hour < 16){
      hello = "Good Afternoon";
    }else{
      hello = "Good Evening";
    }
    return hello;
  }

}

// class ImageWidget extends StatelessWidget{
//     @override
//     Widget build(BuildContext context){
//       AssetImage image = AssetImage('alarm.jpg');
//       Image images = Image(image: image, width:1000.0, height: 400.0);
//       return Container(child: images);
//     }
//   }

//   class InputItems extends StatefulWidget{
//     @override
//     State<StatefulWidget> createState() => _InputItemsState();
//   }

//   class _InputItemsState extends State<InputItems>{
//     String name = '';
//     final _currencies = ['Dollars', 'Euros', 'Pounds'];
//     String _currency = 'Dollars';
//     @override
//     Widget build(BuildContext context){
//       return Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.only(top: 550, left: 300),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('images/alarm.jpg'),
//             fit: BoxFit.cover
//           )
//         ),
//         child: Column(
          
//           children: <Widget>[

//             TextField(
//               style: TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//                 hintText: 'Email Address',
//                 hintStyle: TextStyle(color: Colors.white),
//                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,
                

//                 ))
//               ),
              
//             ),
//             DropdownButton<String>(
//               style: TextStyle(color: Colors.pink),
//               items: _currencies.map((String value){
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value)
//                 );
//               }).toList(),
//               value: _currency,
//               onChanged: (String value){
//                 _dropDownChanged(value);
//               },

//             )
//           ],
//         )
//       );
//     }

//     _dropDownChanged(String value){
//       setState(() {
//         this._currency = value;
//       });
//     }


    
//   }



  class Trip extends StatefulWidget{
    @override
    createState() => _TripState();
  }

  class _TripState extends State<Trip>{
    void changePage(){
      Navigator.pop(context);
    }
    String email = "";
    String password = "";
    String error = "";
    Widget variable = Container();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    @override
    Widget build(BuildContext context){
      double defaultScreenWidth = 400.0;
      double defaultScreenHeight = 810.0;

      ScreenUtil.instance = ScreenUtil(width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true)..init(context);

      TextStyle textstyle = Theme.of(context).textTheme.title;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body:Center(child:Container(
          // constraints: BoxConstraints(
          //   minHeight: ,
          //   maxHeight:,
          //   minWidth: 300,
          //   maxWidth: 300,
          // ),
          decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),

               //border: Border.all(color: Colors.black, width: 1),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Color.fromRGBO(255, 255, 255, .3),
                    offset: Offset(2.0, 3.0),
                    blurRadius: 5.0

                  )
                ]
          ),
          width: ScreenUtil.instance.setWidth(400.0),
          height: ScreenUtil.instance.setHeight(700.0),
          
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              Container(child: Text("LOGIN", textDirection: TextDirection.ltr, style: TextStyle(
                fontSize: ScreenUtil.instance.setSp(25.0),
                fontFamily: 'Open-Sans',
                fontWeight: FontWeight.bold,
                
              ),
              
              ),
              margin: EdgeInsets.only(right: 0, bottom: ScreenUtil.instance.setWidth(30.0)),
              ),

              Container(
                child: Text("${error}",
                style: TextStyle(
                  color: Colors.red
                ))
              ),
              Container(child:TextField(
                  controller: emailController,
                  style: TextStyle(color: Colors.red, fontSize: ScreenUtil.instance.setSp(25), ),
                  decoration: InputDecoration(
                    hintText: 'joyce@gmail.com',
                    labelText: 'Email',
                    hintStyle: TextStyle(color: Colors.brown),
                    labelStyle: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(20)
                    ), 
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                    contentPadding: EdgeInsets.only(left:ScreenUtil.instance.setWidth(5),bottom: ScreenUtil.instance.setHeight(15),top: ScreenUtil.instance.setHeight(15)),
                    icon: Icon(Icons.person)
                  ),
                  
                  keyboardType: TextInputType.emailAddress,
              ),
              width: ScreenUtil.instance.setWidth(300),
              ),

              Container(child:TextField(
                  controller: passwordController,
                  style: TextStyle(color: Colors.red, fontSize: ScreenUtil.instance.setSp(25), ),
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: '',
                    labelText: 'Password',
                    hintStyle: TextStyle(color: Colors.brown),
                    //textstyle,
                    labelStyle: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(20)

                    ), 
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                    contentPadding: EdgeInsets.only(left:ScreenUtil.instance.setWidth(5),bottom: ScreenUtil.instance.setHeight(15),top: ScreenUtil.instance.setHeight(15))
                  ),
                  keyboardType: TextInputType.text,
              ),
              width: ScreenUtil.instance.setWidth(300),
              margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(20)),
              ),

              Container(
                child:ButtonTheme(
                  minWidth: ScreenUtil.instance.setWidth(120),
                  height: ScreenUtil.instance.setHeight(50),
                  
                child:RaisedButton(
                 child: Text("LOGIN", style: TextStyle(
                   fontFamily: 'Open-Sans',
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil.instance.setSp(20)
                 ),
                                  
                 ),
                 
                color: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                 
                  onPressed: (){
                    
                    
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context){
                    //     return AlertDialog(
                    //       title: Text("Email and password"),
                    //       content: Text("Received"),
                    //       actions: <Widget>[
                    //         FlatButton(
                    //           child: Text("Close"),
                    //           onPressed: (){Navigator.of(context).pop();}
                    //         )
                    //       ],
                    //     );
                    //   }
                    // );

                    //passwordController.text = "";
                    
                    setState((){
                      error = "";
                      
                   
                    });
                    
                      Post newPost = new Post(email: emailController.text, password: passwordController.text);
                      variable = FutureBuilder<Post>(
                      future: emailController.text == "" || passwordController.text == "" ? "" : Post.createPost('http://192.168.43.113:85/api/login', body: newPost.toMap() ),
                        builder: (context, snapshot){
                          if(snapshot.hasData){
                              Future<String> report;
                              error = "Login Successful";
                              DbHelper dbHelper = new DbHelper();
                              dbHelper.initializeDb();
                              dbHelper.theData = "${snapshot.data.token}";
                              report =  dbHelper.insertToken();
                              // dbHelper.initializeDb().then((result)=>dbHelper.theData = "${snapshot.data.token}").then(
                              //   (result)=> report = dbHelper.insertToken()
                              // );
                              
                              
                              if(report.toString() == "Successfully Inserted"){
                                  return Text("${snapshot.data.token}");

                                  //return Text("$report");
                                  //return Text("Inserted Successfully");
                              }else{
                                return Text("yes");
                               // return Text("$report");
                                //return Text("Could not insert");
                              }
                              
                              
                          
                          }else if(snapshot.hasError){
                                           
                               error = "Username or password incorrect";
                               return Text("Please ensure that your are connected to the internet.");
                               //return Text("${snapshot.error}");
                          
                           
                          }
                          return CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.black
                            ),
                          );
                        }
                    );
                    
                    
                      
                    
                     

                    
                  }
                 
                ) ,
                ),
                margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(30.0), bottom: ScreenUtil.instance.setHeight(0), left:ScreenUtil.instance.setWidth(35))
              
              ),
              Container(
                margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(35.0), top: ScreenUtil.instance.setHeight(0)),
                child: FlatButton(
                  child: Text("Forgot password",
                  style: TextStyle(
                    fontFamily: 'Open-Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil.instance.setSp(15)
                  ),
                  ),
                  onPressed: (){},
                )
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(0), left: ScreenUtil.instance.setWidth(30)),
                child: FlatButton(
                  child: Text("Register",
                  style: TextStyle(
                    fontFamily: 'Open-Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil.instance.setSp(15)

                  ),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Register())
                    );
                  },
                )
              ),

              Container(
                child: variable
              )
              // Container(child:
              //   Image.asset(
              //     "images/loading.gif"
              //   )
              // )

            ],
          )
        )
        )
        );
    }

   
    
  }

  class Post{
  final String token;
  final String email;
  final String password;
  

  Post({this.email,this.password,this.token});
  //Post({this.token});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      token: json['success']['token']
    );
  }

  

  Map toMap(){
    var map = new Map<String, dynamic>();
    
    map["email"] = email;
    
    map["password"] = password;
  

    return map;
  }

  static Future<Post> createPost(String url,  {Map body}) async{
    // String firstnameError;
    // String lastnameError;
    // String emailError;
    // String passwordError;
    // String confirmPasswordError;
    // String phoneError;
    return http.post(url, body: body).then((http.Response response){
      final int statusCode = response.statusCode;
     
      if(statusCode == 500){
          //_TripState tp = new _TripState();
           
      }

     if(statusCode == 200){
      
       //tp.changePage();
     }
      // if(statusCode < 200 || statusCode > 400 || json == null){
      //   throw new Exception("Error while fetching data");
      // }
      return Post.fromJson(json.decode(response.body));
    });
  }
}

  // class Post{
  //   //final int userId;
  //   final int id;
  //   final String title;
  //   final String body;

  //   Post({this.id, this.title, this.body});

  //   factory Post.fromJson(Map<String, dynamic> json){
      
  //     var variable = Post(
  //       id: json['data']['id'],
  //       title: json['data']['title'],
  //       body: json['data']['body']
  //     );

  //     return variable;
  //   }

  //   static Future<Post> fetchPost(var id) async{
  //     var url = 'http://192.168.43.113:85/api/article/${id}';
  //     //var url = 'http://192.168.43.113:85/api/login';
  //     final response = await http.get(url, headers: {
  //       HttpHeaders.authorizationHeader: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjkyZWRiMDRhODU1NjNjNzAzYWIxZDA4ZjY5YmE1YjVlNGM5ZjQzYjVmMjRiMTVlMzk3YWIwODIxZWRlZDA2ZTU2YTM1Yzc0ZjRhZDA3NTg1In0.eyJhdWQiOiI0IiwianRpIjoiOTJlZGIwNGE4NTU2M2M3MDNhYjFkMDhmNjliYTViNWU0YzlmNDNiNWYyNGIxNWUzOTdhYjA4MjFlZGVkMDZlNTZhMzVjNzRmNGFkMDc1ODUiLCJpYXQiOjE1NjU4MDE1OTcsIm5iZiI6MTU2NTgwMTU5NywiZXhwIjoxNTk3NDIzOTk3LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.Dyi4kwlXzkLJNatDzTJCLvyIq13lm-4k3ZA0TfoW5b1Q7TRrmpZWltOYKQgYyeNPbZ2jQqFkJ0aGUbaSeYbvIzw3Q0My8pQT2OREVO3UtG0blmzkXw_z8-yI4fEVGaMP6bgLj-2giw4QzJyNmwViswgoEXCuwf0zJzLI0hl9P5oREz2tN2Foa-NrauGoUWjj7dWhJGqJ_rwpME_Biu9InsWJ6K0KYYgzHBXVGIu2bhop_G4ilf79-tIeSTeIEyi0bxDg7u2jR_mHPYvUCWT4Q8jO1K5-FZExES5Bq__qxavfXneQurSBPwnbTMSmDMVRH57mhHv89hTNQwUe2sdwoMoIHm4Awde62zr793B9FDkf8EQUR6HkUjywNwn-2hUIWi901Z6haiVSEnRWrsail0pStwFdJopaB-i_5GBJVlByTP1-w8sJQHiS9qnOjFG0yVqdr9COTpQ_YisPHv3vpWyLmj3oyeYIg31tC2KpHSQRCcgWCESfzgngz2IgdolEXUenWohnEdIKgf8zFhNVblSJ-XEWGT-e9BYRvz3309crUkQE4UdCBDDoJpeoDb8RaCcBDU-aljCam3E5n77I6g_zYY0MPcVE9FFFuSAtgyeu4bDe78s5czwJr-4ewdEYo4XKQIn9d0uf8Rc-9Eh-H_TkaWmRupeI1fRiPqI2QUc"
  //     });

  //     if(response.statusCode == 200){
  //       var decoded = jsonDecode(response.body);
  //       var value = Post.fromJson(decoded);
  //       return value;
  //     }else{
  //       //return Exception('Failed to load post');
  //       //return Post.fromJson(json.decode(response.body));
  //       throw Exception('Failed to load post');
  //     }
  //   }

    
  // }


  
