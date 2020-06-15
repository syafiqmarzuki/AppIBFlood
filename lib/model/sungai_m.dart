//import 'package:firebase_database/firebase_database.dart';
class SungaiM{
 final double ketinggian;
 final String status;

SungaiM({ this.ketinggian, this.status });

 factory SungaiM.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return SungaiM(
        ketinggian: parser(json['Ketinggian']),
        status: json['Status']);
  }

}