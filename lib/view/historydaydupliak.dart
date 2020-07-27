import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';


class HistoryDDay extends StatefulWidget {
  @override
  _HistoryDDayState createState() => _HistoryDDayState();
}

class _HistoryDDayState extends State<HistoryDDay> {
    DateFormat dateFormat;

  
  Map data;
  List dayData;

  Future getData() async{
    http.Response response = await http.get('https://ibflood.herokuapp.com/api/report/daynow');
    data = json.decode(response.body);
    setState(() {
      dayData = data['data'];
    });
  }

  @override
  void initState(){
    super.initState();
    getData();
   // print(monthData);

  }


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Hari Ini'),
        backgroundColor: Color(0xFF11249F),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: dayData == null ? 0 : dayData.length,
          itemBuilder: (BuildContext context, int index){
            //print(DateFormat('H:m').format(DateTime.parse(monthData[index]['updated_at'])));
            //print(DateFormat('d-M-yyyy').format(DateTime.parse(monthData[index]['created_at'])));
            //print(monthData[index]['created_at']);
            //print(monthData[index]['updated_at']);

            return Card(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Color(0xFF11249F),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(Icons.av_timer, color: Colors.white,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(dayData[index]['created_at'], style: TextStyle(color: Colors.white, fontSize: 15),),
                        ),

                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Ketinggian Sungai - '),
                        Text(dayData[index]['sungai']),
                        Text(' cm'),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Ketinggian Debit Tumpah - '),
                        Text(dayData[index]['debittumpah']),
                        Text(' cm'),
                      ],
                    ),
                ],
              ),
              );
          })
      ),
      
    );
  }
}