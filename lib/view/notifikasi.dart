import 'package:flutter/material.dart';

class Notifikasi extends StatefulWidget {
  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
        title: Text("Notifikasi"),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context,index){
            return ListTile(
              title: Text('35 CM'),
              subtitle: Text('Kondisi akan ada datangya banjir kiriman'),
              trailing: Text('12-12-2020 : 14:00'),
              );
            },
          ), 
        )
    );
  }
}