import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

import '../model/debit.dart';
import '../model/sungai.dart';
import 'notifikasi.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _timeString, _dateString;
  var _databaseReference = FirebaseDatabase().reference().child('Raspi3');

  @override
  void initState() {
    _timeString = _formatTime(DateTime.now());
    _dateString = _formatDate(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());

    super.initState();
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat("EEEE - dd/MM/yyyy").format(dateTime);
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat("HH:mm").format(dateTime);
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDate = _formatDate(now);
    final String formattedTime = _formatTime(now);

    setState(() {
      _timeString = formattedTime;
      _dateString = formattedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF11249F),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.info,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Notifikasi()),
                            );
                          }),
                      Image.asset('assets/img/logokecil.png'),
                      IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Notifikasi()),
                            );
                          })
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Text("IBF",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold))),
                  Text(
                    "Information Brebes Flood",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Aplikasi yang untuk memonitoring\nkeadaan ketinggian di Sungai dan Debit Tumpah.",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Update terkini",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                      child: Column(
                    children: <Widget>[
                      Text(
                        _dateString.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _timeString.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            StreamBuilder(
                                stream: _databaseReference.onValue,
                                builder: (_, snapshot) {
                                  if (snapshot.hasData &&
                                      !snapshot.hasError &&
                                      snapshot.data.snapshot.value != null) {
                                    var _sungai = Sungai.fromJson(
                                        snapshot.data.snapshot.value['Sungai']);
                                    return Column(
                                      children: <Widget>[
                                        Text(
                                          "Sungai",
                                          overflow: TextOverflow.clip,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            _sungai.ketinggian.toString(),
                                            overflow: TextOverflow.clip,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          "Status - ${_sungai.status}",
                                          overflow: TextOverflow.clip,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.red),
                                        )
                                      ],
                                    );
                                  } else {
                                    return Text("~");
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: StreamBuilder(
                          stream: _databaseReference.onValue,
                          builder: (_, snapshot) {
                            if (snapshot.hasData &&
                                !snapshot.hasError &&
                                snapshot.data.snapshot.value != null) {
                              var _debit = Debit.fromJson(
                                  snapshot.data.snapshot.value['Debit']);

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Debit tumpah",
                                    overflow: TextOverflow.clip,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _debit.ketinggian.toString(),
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    "Status - ${_debit.status}",
                                    style: TextStyle(
                                        color: Colors.red,),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              );
                            } else {
                              return Text("~");
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RaisedButton(
                  color: Colors.white,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 120.0),
                  shape: StadiumBorder(),
                  textColor: Colors.black,
                  child: Text(
                    "History hari ini",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    print("Ya");
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: RaisedButton(
                  color: Colors.white,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 120.0),
                  shape: StadiumBorder(),
                  textColor: Colors.black,
                  child: Text(
                    "History bulan ini",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    print("Ya");
                  }),
            )
          ],
        ),
      ),
    );
  }
}
