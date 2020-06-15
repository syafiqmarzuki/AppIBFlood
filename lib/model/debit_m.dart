//import 'package:firebase_database/firebase_database.dart';
class DebitM{
 final double ketinggian;
 final String status;

DebitM({ this.ketinggian, this.status });

 factory DebitM.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return DebitM(
        ketinggian: parser(json['Ketinggian']),
        status: json['Status']);
  }

}