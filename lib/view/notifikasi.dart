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
        backgroundColor: Color(0xFF11249F),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.report, color: Colors.red,),
                  title: Text('12-06-2020 14:00', textAlign: TextAlign.right,),
                  subtitle: Text('Kondisi ketinggian air pada sungai sudah mencapai 35 cm. Harap menyelamatkan diri.'),
                 
                ),
              )
            ],
          ), 
        )
    );
  }
}