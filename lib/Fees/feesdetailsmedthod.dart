import 'dart:convert';

import 'package:cclms/class/exceptionhanleing.dart';
import 'package:cclms/class/intalldetails.dart';
import 'package:cclms/getx.dart';
import 'package:cclms/urllink.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class FeesDetail {
  // Internet x = Internet('internet');
  late SharedPreferences sp;
  Getx obj = Getx();
  RxInt totalpayment = 0.obs;
  Future<dynamic> fetchErpInstallmentFees() async {
    try {
      sp = await SharedPreferences.getInstance();

      Map data = {
        'student_id': sp.getString('id'),
      };
      final token = sp.getString('token');

      await http
          .post(
            Uri.parse('${UrlLink.baseurl}student/feesStructure'),
            headers: {
              'Authorization': 'Bearer $token',
            },
            body: data,
            encoding: Encoding.getByName("utf-8"),
          )
          .timeout(Duration(seconds: 1))
          .then((response) {
        if (response.statusCode != 200) {
          throw Internet('Timeout');
        } else {
          var jsondata = json.decode(response.body);

          if (response.statusCode == 200) {
            if (jsondata['status'] == 1) {
              obj.details.clear();
              for (int i = 0; i < jsondata['info'].length; i++) {
                InstallDetails fees = InstallDetails(
                    id: jsondata['info'][i]['id'].toString(),
                    status: jsondata['info'][i]['status'].toString(),
                    fees_structure_id:
                        jsondata['info'][i]['fees_structure_id'].toString(),
                    fees_type: jsondata['info'][i]['fees_type'].toString(),
                    due_date: jsondata['info'][i]['due_date'].toString(),
                    amount: int.parse(jsondata['info'][i]['amount']),
                    created_at: jsondata['info'][i]['created_at'].toString(),
                    updated_at: jsondata['info'][i]['updated_at'].toString(),
                    payamount: jsondata['info'][i]['payamount'],
                    fine: jsondata['info'][i]['fine']);

                obj.details.add(fees);
              }
              obj.nodata.value = false;
              return obj.details;
            } else {
              obj.nodata.value = true;
            }
          }
        }
      });
    } catch (e) {
      obj.nodata.value = true;
    }
  }
}
