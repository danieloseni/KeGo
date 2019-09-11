import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';



class DbHelper{
 static final DbHelper _dbHelper = new DbHelper._internal();
 String table = "tokentable";
 String token = "token"; 

String theData;


 DbHelper._internal();

 factory DbHelper(){
   return _dbHelper;
 }


static Database _db;

Future<Database> get db async{
  if(_db == null){
    _db = await initializeDb();
  }

  return _db;
}
 Future<Database> initializeDb() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "tokens.db";
    var dbTokens = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbTokens;
 }

 Map toMap(){
    var map = new Map<String, dynamic>();
    map["token"] = token;
    
    return map;
  }

 void _createDb(Database db, int newVersion) async{
   await db.execute(
     "CREATE TABLE $table($token TEXT)"
   );
 }

  Map<String, dynamic> row () {
    var map = new Map<String, dynamic>();
      map[_dbHelper.token] = _dbHelper.theData;
      return map;
    
  }

  // factory DbHelper.fromJson(Map<String, dynamic> json){
  //   return DbHelper(
  //     token: json['success']['token']
  //   );
  // }

 Future<String> insertToken() async{
   Database db = await this.db;
  int id = await db.rawInsert("INSERT INTO $table($token) VALUES(?)", [theData]);
  //List id = db.rawInsert("INSERT INTO $table($token) VALUES(?)", [theData]);
   //await db.insert(table, row());
   var del = await db.rawDelete("DELETE from $table where 1=1");
   var response = await db.rawQuery("SELECT * from $table",null);
   print(response);
   
   
   
      //return "Successfully Inserted";
 }
 
 Future<List> selectToken() async{
   Database db = await this.db;
    int id = await db.rawInsert("INSERT INTO $table($token) VALUES(?)", [theData]);
  
   //await db.insert(table, row());
   
   var response = await db.rawQuery("SELECT * from $table",null);
   return response;
   
 }
}