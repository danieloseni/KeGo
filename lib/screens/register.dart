import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Register extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    SystemChrome.setEnabledSystemUIOverlays([]);
     double defaultScreenWidth = 400.0;
      double defaultScreenHeight = 810.0;

      ScreenUtil.instance = ScreenUtil(width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true)..init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
    
    Container(
    
    decoration: BoxDecoration(
      image: DecorationImage(
      image: AssetImage('images/background.jpg'),
      fit: BoxFit.cover
      )
    ),

    child: 
    Center(    
                   
           child:
           Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(30)),
                child: Text("TricycleApp",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil.instance.setSp(30),
                color: Color.fromRGBO(235, 185, 50, 1)
              ))
              ),
              Reg(),

              Container(
                margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(30)),
                child: Text("Powered by TricycleApp",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil.instance.setSp(15),
                color: Color.fromRGBO(200, 200, 200, 1)
              ))
              ),

           ]
             
                
     )       
              
    ) 
    )  
       );
  }
}

class Reg extends StatefulWidget{
  @override
  createState() => _RegState();
}

class _RegState extends State<Reg>{

  void changePage(){
    Navigator.pop(context);
  }
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  TextEditingController phone = TextEditingController();

  static String firstnameError;
  static String lastnameError;
  static String emailError;
  static String passwordError;
  static String confirmPasswordError;
  static String phoneError;
  @override
  Widget build(BuildContext context){
    double defaultScreenWidth = 400.0;
      double defaultScreenHeight = 810.0;

      ScreenUtil.instance = ScreenUtil(width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true)..init(context);
    TextStyle textstyle = Theme.of(context).textTheme.title;
        return Container(
          // constraints: BoxConstraints(
          //   minHeight: ,
          //   maxHeight:,
          //   minWidth: 300,
          //   maxWidth: 300,
          // ),
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
          width: ScreenUtil.instance.setWidth(350),
          height: ScreenUtil.instance.setHeight(650),
          margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(15)),
          
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              Container(
                width: ScreenUtil.instance.setWidth(100),
                height: ScreenUtil.instance.setHeight(100),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100)
                ),
                
                
              ),
              

              Container(
                width: ScreenUtil.instance.setWidth(300),
                margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(20)),
                child:
                Row(
                  
                  children: <Widget>[
                  Expanded(child:Container(
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1.0, color: Colors.grey))
                    ),
                    child:TextField(
                      controller: firstname,
                      style: TextStyle(
                          
                          fontFamily: 'Open-Sans',
                          color: Colors.grey,
                          fontWeight: FontWeight.w600
                      ),
                    textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: firstnameError,
                        labelStyle: TextStyle(color: Colors.red, fontSize: ScreenUtil.instance.setSp(15), backgroundColor: Colors.transparent),
                        //contentPadding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(40)),
                        hintText: 'Firstname',
                        hintStyle: TextStyle(
                          fontFamily: 'Open-Sans',

                        )
                      )
                      ),
                )
                  ),

                  Expanded(child:Container(
                    decoration: BoxDecoration(
                       border: Border(left: BorderSide(width: 1.0, color: Colors.grey)),
                    ),
                    child:TextField(
                      controller: lastname,
                      style: TextStyle(
                          fontFamily: 'Open-Sans',
                          color: Colors.grey,
                          fontWeight: FontWeight.w600
                      ),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: lastnameError,
                        labelStyle: TextStyle(color: Colors.red, fontSize: ScreenUtil.instance.setSp(15), backgroundColor: Colors.transparent),
                   
                      //contentPadding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(40)),
                      hintText: 'Lastname',
                      hintStyle: TextStyle(
                        fontFamily: 'Open-Sans',
                        
                      )
                    )
                )
                  )
                  )
                ],)
                
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(25)),
                width: ScreenUtil.instance.setWidth(300),
                child:TextField(
                  controller: email,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                          fontFamily: 'Open-Sans',
                          color: Colors.grey,
                          fontWeight: FontWeight.w600
                      ),
                  decoration: InputDecoration(
                    labelText: emailError,
                    labelStyle: TextStyle(color: Colors.red, fontSize: ScreenUtil.instance.setSp(15), backgroundColor: Colors.transparent),
                    //prefixIcon: Icon(Icons.email),
                    icon: Icon(Icons.mail
                    ),
                    hintText: 'Email',
                    
                    //labelText: 'Email',
                    //hintStyle: TextStyle(color: Colors.brown),
                    //labelStyle: textstyle, 
                    //border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                    //contentPadding: EdgeInsets.only(left:10,bottom: 20,top: 20)
                  ),
                  keyboardType: TextInputType.text,
              ),
              
              ),

              Container(
                width: ScreenUtil.instance.setWidth(300),
                margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(20)),
                child:
                Row(
                  
                  children: <Widget>[
                  Expanded(child:Container(
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1.0, color: Colors.grey))
                    ),
                    child:TextField(
                      obscureText: true,
                      controller: password,
                      style: TextStyle(
                          fontFamily: 'Open-Sans',
                          color: Colors.grey,
                          fontWeight: FontWeight.w600
                      ),
                    //textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: passwordError,
                        labelStyle: TextStyle(color: Colors.red, fontSize: ScreenUtil.instance.setSp(15), backgroundColor: Colors.transparent),
                        prefixIcon: Icon(Icons.lock),
                        //contentPadding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(40)),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontFamily: 'Open-Sans',

                        )
                      )
                      ),
                )
                  ),

                  Expanded(child:Container(
                    decoration: BoxDecoration(
                       border: Border(left: BorderSide(width: 1.0, color: Colors.grey)),
                    ),
                    child:TextField(
                      obscureText: true,
                      controller: confirm,
                      style: TextStyle(
                          fontFamily: 'Open-Sans',
                          color: Colors.grey,
                          fontWeight: FontWeight.w600
                      ),
                    //textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: confirmPasswordError,
                        labelStyle: TextStyle(color: Colors.red, fontSize: ScreenUtil.instance.setSp(15), backgroundColor: Colors.transparent),
                      prefixIcon: Icon(Icons.lock),
                      //contentPadding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(40)),
                      hintText: 'Confirm',
                      hintStyle: TextStyle(
                        fontFamily: 'Open-Sans',
                        
                      )
                    )
                )
                  )
                  )
                ],)
                
              ),

              Container(
                margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(25)),
                width: ScreenUtil.instance.setWidth(300),
                child:TextField(
                  controller: phone,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                          fontFamily: 'Open-Sans',
                          color: Colors.grey,
                          fontWeight: FontWeight.w600
                  ),
                  decoration: InputDecoration(
                    labelText: phoneError,
                        labelStyle: TextStyle(color: Colors.red, fontSize: ScreenUtil.instance.setSp(15), backgroundColor: Colors.transparent),
                    //prefixIcon: Icon(Icons.email),
                    icon: Icon(Icons.phone
                    ),
                    hintText: 'Phone Number',
                    
                    //labelText: 'Email',
                    //hintStyle: TextStyle(color: Colors.brown),
                    //labelStyle: textstyle, 
                    //border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                    //contentPadding: EdgeInsets.only(left:10,bottom: 20,top: 20)
                  ),
                  keyboardType: TextInputType.number,
              ),
              
              ),         

              


              Container(
                margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(10), top: ScreenUtil.instance.setHeight(30)),
                child:ButtonTheme(
                  minWidth: ScreenUtil.instance.setWidth(130),
                  height: ScreenUtil.instance.setHeight(50),
                  child: RaisedButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

                  child: Text("Sign Up",
                  style: TextStyle(
                    fontFamily: 'Open-Sans',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  ),
                  onPressed: () async{
                     Post newPost = new Post(firstname: firstname.text, lastname: lastname.text,
                     email: email.text,
                     password: password.text,
                     confirm: confirm.text,
                     phone: phone.text);
                     Post p = await Post.createPost('http://192.168.43.113:85/api/register', body: newPost.toMap());
                     setState(() {
                       Post.createPost('http://192.168.43.113:85/api/register', body: newPost.toMap());
                     });
                     print(p.token);
                    //Navigator.pop(context);
                  },
                )
              ),
              )

            ]
          )
        );
  }
}

class Post{
  final String token;
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  final String confirm;
  final String phone;

  Post({this.firstname,this.lastname,this.email,this.password,this.confirm,this.phone,this.token});
  //Post({this.token});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      token: json['token']
    );
  }

  static Map fetchErrors(Map<String, dynamic> json){
    //Post array;
    var map = new Map<String, dynamic>();
    if(json['error'].containsKey("firstname")){
        map["firstname"] = "Enter your";
         // map["firstname"] = "Enter your firstname";
      
    }
    if(json['error'].containsKey('lastname')){
      map["lastname"] = "Enter your lastname";
    }
    if(json["error"].containsKey("phone")){
      if(json["error"]["phone"].toString().contains("required")){
          map["phone"] = "Enter your phone number";
      }else if(json["error"]["phone"].toString().contains("taken")){
          map["phone"] = "Already used phone number";
      }
    }
    if(json["error"].containsKey("email")){
      if(json["error"]["email"].toString().contains("required")){
        map["email"] = "Please provide your email";
      }else if(json["error"]["email"].toString().contains("taken")){
        map["email"] = "Email has been used before";
      }else if(json['error']['email'].toString().contains("valid")){
        map["email"] = "Please enter a valid email";
      }
    }

    if(json["error"].containsKey("password")){
      if(json["error"]["password"].toString().contains("required")){
        map["password"] = "Create a password";
      }
    }

    if(json["error"].containsKey("c_password")){
      if(json["error"]["c_password"].toString().contains("required")){
        map["confirm"] = "Confirm the password entered";
      }else if(json["error"]["c_password"].toString().contains("match")){
        map["confirm"] = "The passwords do not match";
      }
    }

    return map;
  }

  Map toMap(){
    var map = new Map<String, dynamic>();
    map["firstname"] = firstname;
    map["lastname"] = lastname;
    map["email"] = email;
    map["phone"] = phone;
    map["password"] = password;
    map["c_password"] = confirm;

    return map;
  }

  static Future<Post> createPost(String url, {Map body}) async{
    // String firstnameError;
    // String lastnameError;
    // String emailError;
    // String passwordError;
    // String confirmPasswordError;
    // String phoneError;
    return http.post(url, body: body).then((http.Response response){
      final int statusCode = response.statusCode;
     
      if(statusCode == 400){
        var theData = fetchErrors(jsonDecode(response.body));

        
        if(theData.containsKey("firstname")){
          _RegState.firstnameError = theData['firstname'];
        }
        if(theData.containsKey("lastname")){
          _RegState.lastnameError = theData['lastname'];
        }
        if(theData.containsKey("email")){
          _RegState.emailError = theData['email'];
        }
        if(theData.containsKey("phone")){
          _RegState.phoneError = theData['phone'];
        }
        if(theData.containsKey("password")){
          _RegState.passwordError = theData['password'];
        }
        if(theData.containsKey("confirm")){
          _RegState.confirmPasswordError = theData['confirm'];
        }
        
      }

     if(statusCode == 200){
       _RegState classregstate = new _RegState();
       classregstate.changePage();
     }
      if(statusCode < 200 || statusCode > 400 || json == null){
        throw new Exception("Error while fetching data");
      }
      return Post.fromJson(json.decode(response.body));
    });
  }
}