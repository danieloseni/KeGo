import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'dart:async';
class StartPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    
      //await Future.delayed(Duration(seconds: 3));
    

 }
 

}  

class ShowDisplay extends StatefulWidget{
  @override
  createState() => _ShowDisplayState();
}

class _ShowDisplayState extends State<ShowDisplay>{
  Widget variable = Container();
  Future delay() async{
    await Future.delayed(Duration(seconds: 15), (){
        //Navigator.push(context, MaterialPageRoute(builder: (context) => Login()) 
        Navigator.pushReplacement(context, PageRouteBuilder(
  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Login();
  },
  transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(-4.0, 0.0),
        ).animate(secondaryAnimation),
        child: child,
      ),
    );
  },
    )
);



          
        

    });
  }
  
  
  
  
   
  Future showGIf() async{
    await Future.delayed(Duration(seconds: 5), (){
        setState((){
        variable = CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.white
          ),
        );
        //variable = Image.asset('images/loadings.gif');
        });
        delay();
    });
  }

  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showGIf());
  }

  
  @override
  
  Widget build(BuildContext context){
    return Scaffold(
         body: Container(
           color: Color.fromRGBO(99, 4, 96, 1),
          child: Center(
            child:Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 150),
                child:
                Image.asset('images/keke.png')
              ),

              Container(
                margin: EdgeInsets.only(top: 30),
                child: 
              Text("TricycleApp",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: 'Open-Sans'
              )),
              ),
              Container(
                child: variable
              )
            ],
            )
            ),
      )
      
    );
  }
  
  
  
}

