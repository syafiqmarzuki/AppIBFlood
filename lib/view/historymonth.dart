import 'package:flutter/material.dart';
class HistoryMonth extends StatefulWidget {
  @override
  _HistoryMonthState createState() => _HistoryMonthState();
}

class _HistoryMonthState extends State<HistoryMonth> {

  int current_step = 0;

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
    Step(
      title: Text('03/02/2020'),
      content: Column(children: <Widget>[
        Text('Ketinggian Sungai  = 14 CM'),
        Text('Ketinggian Debit Tumpah  = 14 CM'),
      ],),
      isActive: true,
    ),
    Step(
      title: Text('04/02/2020'),
      content: Column(children: <Widget>[
        Text('Ketinggian Sungai  = 14 CM'),
        Text('Ketinggian Debit Tumpah  = 14 CM'),
      ],),
      isActive: true,
    ),
    Step(
      title: Text('05/02/2020'),
      content: Column(children: <Widget>[
        Text('Ketinggian Sungai  = 14 CM'),
        Text('Ketinggian Debit Tumpah  = 14 CM'),
      ],),
      isActive: true,
    ),
    Step(
      title: Text('06/02/2020'),
      content: Column(children: <Widget>[
        Text('Ketinggian Sungai  = 14 CM'),
        Text('Ketinggian Debit Tumpah  = 14 CM'),
      ],),
      isActive: true,
    ),
    Step(
      title: Text('07/02/2020'),
      content: Column(children: <Widget>[
        Text('Ketinggian Sungai  = 14 CM'),
        Text('Ketinggian Debit Tumpah  = 14 CM'),
      ],),
      isActive: true,
    ),
     Step(
      title: Text('08/02/2020'),
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