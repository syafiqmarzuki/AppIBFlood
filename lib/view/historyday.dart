import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HistoryDay extends StatefulWidget {
  @override
  _HistoryDayState createState() => _HistoryDayState();
}

class _HistoryDayState extends State<HistoryDay> {

  int current_step = 0;

  List<Step> stepsHisotry = [
    Step(
      title: Text('01:00'),
      content: Column(children: <Widget>[
        Text('Ketinggian Sungai  = 14 CM'),
        Text('Ketinggian Debit Tumpah  = 14 CM'),
      ],),
      isActive: true,
    ),
    Step(
      title: Text('02:00'),
      content: Column(children: <Widget>[
        Text('Ketinggian Sungai  = 14 CM'),
        Text('Ketinggian Debit Tumpah  = 14 CM'),
      ],),
      isActive: true,
    ),
    Step(
      title: Text('03:00'),
      content: Column(children: <Widget>[
        Text('Ketinggian Sungai  = 14 CM'),
        Text('Ketinggian Debit Tumpah  = 14 CM'),
      ],),
      isActive: true,
    ),
    Step(
      title: Text('04:00'),
      content: Column(children: <Widget>[
        Text('Ketinggian Sungai  = 14 CM'),
        Text('Ketinggian Debit Tumpah  = 14 CM'),
      ],),
      isActive: true,
    ),
    Step(
      title: Text('05:00'),
      content: Column(children: <Widget>[
        Text('Ketinggian Sungai  = 14 CM'),
        Text('Ketinggian Debit Tumpah  = 14 CM'),
      ],),
      isActive: true,
    ),
    Step(
      title: Text('06:00'),
      content: Column(children: <Widget>[
        Text('Ketinggian Sungai  = 14 CM'),
        Text('Ketinggian Debit Tumpah  = 14 CM'),
      ],),
      isActive: true,
    ),
    Step(
      title: Text('07:00'),
      content: Column(children: <Widget>[
        Text('Ketinggian Sungai  = 14 CM'),
        Text('Ketinggian Debit Tumpah  = 14 CM'),
      ],),
      isActive: true,
    ),
     Step(
      title: Text('08:00'),
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
        title: Text('History Hari Ini'),
        backgroundColor: Color(0xFF11249F),
      ),
      body: Container(
        child: Stepper(
          currentStep: this.current_step,
          type: StepperType.vertical,
          steps: stepsHisotry,
          onStepTapped: (stepsHisotry){
            setState(() {
              current_step = stepsHisotry;
              
            });
          },
        ),
      ),
      
    );
  }
}