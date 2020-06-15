import 'package:flutter/material.dart';
class HistoryMonth extends StatefulWidget {
  @override
  _HistoryMonthState createState() => _HistoryMonthState();
}

class _HistoryMonthState extends State<HistoryMonth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Bulan'),
        backgroundColor: Color(0xFF11249F),
      ),
      
    );
  }
}