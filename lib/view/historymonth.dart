import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class HistoryMonth extends StatefulWidget {
  @override
  _HistoryMonthState createState() => _HistoryMonthState();
}

class _HistoryMonthState extends State<HistoryMonth> {

  Map data;
  List monthData;

  Future getData() async{
    http.Response response = await http.get('https://webibf.herokuapp.com/api/report/monthnow');
    data = json.decode(response.body);
    setState(() {
      monthData = data['data'];
    });
  }

  int current_step = 0;
  

  @override
  void initState(){
    super.initState();
    getData();

  }


  List<Step> stepsHisotry = [
    
    
    Step(
      title: Text('01/02/2020'),
      content: Column(children: <Widget>[
        Text('Ketinggian Sungai  = 14 CM'),
        Text('Ketinggian Debit Tumpah  = 14 CM'),
      ],),
      isActive: true,
    ),
    Step(
      title: Text('02/02/2020'),
      content: Column(children: <Widget>[
        Text('Ketinggian Sungai  = 14 CM'),
        Text('Ketinggian Debit Tumpah  = 14 CM'),
      ],),
      isActive: true,
    ),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Bulan'),
        backgroundColor: Color(0xFF11249F),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: monthData == null ? 0 : monthData.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              title: Text(monthData[index]['day']),
              subtitle: Text(monthData[index]['sungai']),
              trailing: Text(monthData[index]['debittumpah']),
              );
          })
      ),
      
    );
  }
}