import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/paket.dart';
import "../services/dio_service.dart";

class Pakets with ChangeNotifier {
  List<Paket> _pakets = [];

  @override
  void initState() async {
    Response response;
    var dio = Dio();
    response = await dio.get('http://localhost:8080/api/paket/');
    print(response.data.toString());
  }

  List<Paket> get pakets {
    return [..._pakets];
  }
}
