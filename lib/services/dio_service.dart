import '../models/user.dart';
import 'package:dio/dio.dart';
import 'logging.dart';

class DioService {
  final Dio _dio = Dio(
    BaseOptions(
      // baseUrl: 'https://skripsi-spk-saw.herokuapp.com/api',
      baseUrl: 'https://localhost:8080/api/',
    ),
  )..interceptors.add(Logging());

  Future<User?> login() async {
    User? result;
    try {
      print('login');
      Response response = await _dio.get('/paket' 
      // ,data: {
      //   'email': 'admin@admin.com',
      //   'password': 'admin',
      // }
      );
      print(response);
      result = User.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
    }
    return result;
  }
}
