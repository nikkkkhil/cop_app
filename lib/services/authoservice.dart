import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mongo_dart/mongo_dart.dart';

class AuthService {
  Dio dio = new Dio();
  var mongourl = "http://127.0.0.1:5000";
  login(name, password) async {
    // print(name);
    // print(password);
    // name = 'john';
    // password = 123;

    try {
      return await dio.post('https://flutterauthen.herokuapp.com/authenticate',
          data: {"uploadid": name, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      if (e.response == null) {
        print('im here4');
        // Fluttertoast.showToast(
        //     msg: "no server",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     backgroundColor: Colors.white,
        //     textColor: Colors.red,
        //     fontSize: 16.0);
        return 'noserver';
      } else {
        print('im here5');
        Fluttertoast.showToast(
            msg: e.response.data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
        return 'error';
      }
    }
  }

  addStaff(var name, var phoneno, var uploadid, var password) async {
    try {
      print("$name, $phoneno, $uploadid, $password");
      final response = await dio.post(
          "https://flutterauthen.herokuapp.com/adduser",
          data: {
            'Name': name,
            'phoneno': phoneno,
            'uploadid': uploadid,
            'password': password
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
      print(response);

      return response;
    } on DioError catch (e) {
      // throw (e);
      Fluttertoast.showToast(
          msg: e.response.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  uploadpdf(var name, var path, var topic, var details) async {
    try {
      print("$name, $path, $topic ,$details");
      final response = await dio.post(
          "https://coppython.herokuapp.com/uploadpdf/$name/$topic/$details",
          data: FormData.fromMap({
            // 'name': name,
            "file": await MultipartFile.fromFile(path, filename: name),
          }));
      print(response);

      return response;
    } on DioError catch (e) {
      throw (e);
      // Fluttertoast.showToast(
      //     msg: e.response.data['msg'],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.blue,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

  deleteStaff(var new_name, var phno, var user_id, var pasword) async {
    try {
      print("$new_name, $phno, $user_id, $pasword");
      final response = await dio.post(
          "https://coppython.herokuapp.com/delete/staff",
          data: FormData.fromMap({
            'name': new_name,
            'phoneno': phno,
            'uploadid': user_id,
            'password': pasword
          }));
      print(response);

      return response;
    } on DioError catch (e) {
      throw (e);
      // Fluttertoast.showToast(
      //     msg: e.response.data['msg'],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.blue,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

  getallStaff(usertype, activity) async {
    try {
      print("$usertype, $activity");
      final response = await dio
          .get("https://coppython.herokuapp.com/readall/$usertype/$activity");
      print(response);

      return response;
    } on DioError catch (e) {
      throw (e);
      // Fluttertoast.showToast(
      //     msg: e.response.data['msg'],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.blue,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

  getpdf() async {
    try {
      final response =
          await dio.get("https://coppython.herokuapp.com/readallpdf");
      print(response);

      return response;
    } on DioError catch (e) {
      throw (e);
      // Fluttertoast.showToast(
      //     msg: e.response.data['msg'],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.blue,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

  checkStaff(filter, subfilter, value) async {
    try {
      print("$filter, $subfilter, $value");
      final response = await dio
          .get("https://coppython.herokuapp.com/check/staff/$subfilter/$value");
      print(response);

      return response;
    } on DioError catch (e) {
      throw (e);
      // Fluttertoast.showToast(
      //     msg: e.response.data['msg'],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.blue,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

  readStaff(filter, subfilter, value) async {
    try {
      print("$filter, $subfilter, $value");
      final response = await dio.get(
          "https://coppython.herokuapp.com/read/$filter/$subfilter/$value");
      print(response);

      return response;
    } on DioError catch (e) {
      throw (e);
      // Fluttertoast.showToast(
      //     msg: e.response.data['msg'],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.blue,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

  getinfo(token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    return await dio.get('https://flutterauthen.herokuapp.com/getinfo');
  }

  addUser(name, password) async {
    return await dio.post("https://flutterauthen.herokuapp.com/adduser",
        data: {'name': name, 'password': password},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
}
