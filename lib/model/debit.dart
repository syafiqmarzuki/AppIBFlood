//import 'package:firebase_database/firebase_database.dart';
class Debit{
 final double ketinggian;
 final String status;

Debit({ this.ketinggian, this.status });

 factory Debit.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return Debit(
        ketinggian: parser(json['Ketinggian']),
        status: json['Status']);
  }

}