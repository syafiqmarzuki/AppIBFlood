import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

//import 'package:firebase_messaging/firebase_messaging.dart';


class Notifikasi extends StatefulWidget {
  @override
  _NotifikasiState createState() => _NotifikasiState();
}



class _NotifikasiState extends State<Notifikasi> {

  Map data;
  List notifData;

   Future getData() async{
    http.Response response = await http.get('https://ibflood.herokuapp.com/api/notif');
    data = json.decode(response.body);
    setState(() {
      notifData = data['data'];
    });
  }

  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
        title: Text("Notifikasi"),
        backgroundColor: Color(0xFF11249F),
        ),
        body: Container(
        child: ListView.builder(
          itemCount: notifData == null ? 0 : notifData.length,
          itemBuilder: (BuildContext context, int index){
           return Card(
                child: ListTile(
                  leading: Icon(Icons.report, color: Colors.red,),
                  title: Text(DateFormat('d-M-yyyy H:m').format(DateTime.parse(notifData[index]['created_at'])), textAlign: TextAlign.right,),
                  subtitle: Text(notifData[index]['isi_notif']),
                 
                )
              );
          })
      ),
    );
  }
}