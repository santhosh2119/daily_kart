import 'package:daily_kart/base/apis.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  late String _userId;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_userId != null) {
      return _userId;
    }
    return null;
  }

  Future mobileRegistrationOTP(String mobileNumber) async {
    print(mobileNumber);
    final url = Uri.parse((Api.registerWithOut));
    try {
      final response = await http.post(url,
          // headers: {"auth_token": "$token"},
          body: {"mobile": "91" + mobileNumber});
      var _userDetails = json.decode(response.body);

      print(_userDetails["stauts"]);
      //  print(response.statusCode);
      //print( _userDetails["additional_info"]);
      if (response.statusCode < 400) {
        // print("otp details length : ${_userDetails.length}  otp details from response: $_userDetails");
        //token=  mobileNumber;
        return [true, _userDetails];
      } else {
        return [false, _userDetails];
      }
    } catch (error) {
      if (error.toString().contains("SocketException")) {
        throw "Could not Verify OTP. Check your internet connection";
      } else {
        rethrow;
      }
    }
  }

  Future<void> loginIn(String phone, String password) async {
    final url = Uri.parse(Api.login);

    try {
      final response = await http.post(url, body: {
        "mobile": phone,
        "password": password,
      });
      final data = json.decode(response.body);

      _userId = data['ResultData']['member_id'];

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future verifyOtp(String mobileNumber, String otp) async {
    try {
      var url = Uri.parse(Api.login);

      final response = await http
          .post(url, body: {"mobile": "91" + mobileNumber, "otp": otp});
      print(response.body);
      var _userDetails = json.decode(response.body);

      print(_userDetails["stauts"]);
      //  print(response.statusCode);
      //print( _userDetails["additional_info"]);
      if (response.statusCode < 400) {
        // print("otp details length : ${_userDetails.length}  otp details from response: $_userDetails");
        //token=  mobileNumber;
        return [true, _userDetails];
      } else {
        return [false, _userDetails];
      }
    } catch (error) {
      rethrow;
    }
  }
}
