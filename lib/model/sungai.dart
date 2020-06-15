//import 'package:firebase_database/firebase_database.dart';
class Sungai{
 final double ketinggian;
 final String status;

Sungai({ this.ketinggian, this.status });

 factory Sungai.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return Sungai(
        ketinggian: parser(json['Ketinggian']),
        status: json['Status']);
  }

}