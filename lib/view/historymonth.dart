import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';


class HistoryMonth extends StatefulWidget {
  @override
  _HistoryMonthState createState() => _HistoryMonthState();
}

class _HistoryMonthState extends State<HistoryMonth> {
  DateFormat dateFormat;

  
  Map data;
  List monthData;
  double convert;
  

  Future getData() async{
    http.Response response = await http.get('https://ibflood.herokuapp.com/api/report/monthnow');
    //http.Response response = await http.get('http://192.168.43.136/api/report/monthnow');

    data = json.decode(response.body);
    setState(() {
      monthData = data['data'];
    });
  }

  var dateParse;
  var formateddate;
  String date;
  String inputan;
  DateTime datetime;

  @override
  void initState(){
    super.initState();
    getData();
    //dateFormat =  DateFormat('yyyy-MM-d');
    //datetime = DateTime('d-mm-YYYY');
     //formattime = DateTime.parse('d-m-yyyy');
    //formattime = DateTime();
    //dateFormat.parse(inputan);
    //dateParse = DateTime.parse(date);
    //formateddate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Bulan Ini'),
        backgroundColor: Color(0xFF11249F),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: monthData == null ? 0 : monthData.length,
          itemBuilder: (BuildContext context, int index){
               // int y = int.tryParse(abc.toString().split('.')[1].substring(0,4));
            //print(int.tryParse(monthData[index]['sungai']).toString().split('')[1].substring(0,2));
          // print(monthData[index]['sungai']);
          //convert = monthData[index]['sungai']
          //print(monthData[index]['sungai'].toString());
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
                          child: Icon(Icons.date_range, color: Colors.white,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(DateFormat('d-M-yyyy').format(DateTime.parse(monthData[index]['day'])), style: TextStyle(color: Colors.white, fontSize: 15),),
                        ),

                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Ketinggian Sungai - '),
                        Text(monthData[index]['sungai']),
                        Text(' cm'),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Ketinggian Debit Tumpah - '),
                        Text(monthData[index]['debittumpah']),
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