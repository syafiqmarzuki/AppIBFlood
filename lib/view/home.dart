//import 'dart:ffi';
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'notifikasi.dart';
import 'package:ibflood/model/debit.dart';
import 'package:ibflood/model/sungai.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF11249F),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.only(top: 25),
            child: _header(),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Update Terkini',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      _dateString.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _timeString.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 35),
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                StreamBuilder(

                    stream: _databaseReference.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          !snapshot.hasError &&
                          snapshot.data.snapshot.value != null) {
                        var _sungai = Sungai.fromJson(
                            snapshot.data.snapshot.value['Sungai']);
                        var _debit = Debit.fromJson(
                            snapshot.data.snapshot.value['Debit']);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _monitoring(
                              _sungai.ketinggian.toString(),
                              "Sungai",
                              "Status - ${_sungai.status} ",
                            ),
                            _monitoring(_debit.ketinggian.toString(),
                                "Debit Tumpah", "Status - ${_debit.status} "),
                          ],
                        );
                        //end

                      } else {}
                      return Container();
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 130.0),
              shape: StadiumBorder(),
              textColor: Colors.black,
              color: Colors.white,
              child: Text("History Hari Ini"),
              onPressed: () {
                print("Klik");
              }),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 120.0),
              shape: StadiumBorder(),
              textColor: Colors.black,
              color: Colors.white,
              child: Text("History Bulan Ini"),
              onPressed: () {
                print("KLik");
              })
        ],
      ),
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _appBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'IBF',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Information Brebes Flood',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Aplikasi yang untuk memonitoring\nkeadaan ketinggian di Sungai dan Debit Tumpah',
            style: TextStyle(color: Colors.white, height: 1.5),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }

  Widget _monitoring(String ketinggian, String status, String lokasi) {
    return Column(
      children: <Widget>[
        Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 3,
              )
            ],
          ),
          padding: EdgeInsets.only(top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                status,
                style: TextStyle(color: Colors.deepOrange, fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Text(ketinggian,
                  style: TextStyle(color: Colors.deepOrange, fontSize: 50)),
              SizedBox(
                height: 15,
              ),
              Text(lokasi,
                  style: TextStyle(color: Colors.deepOrange, fontSize: 15)),
            ],
          ),
          margin: EdgeInsets.only(right: 20),
        ),
      ],
    );
  }

  Widget _appBar() {
    return Row(
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
              MaterialPageRoute(builder: (context) => Notifikasi()),
            );
          },
        ),
        Image.asset('assets/img/logokecil.png'),
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Notifikasi()),
            );
          },
        ),
      ],
    );
  }

  // setTanggal waktu sekarang

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
}
