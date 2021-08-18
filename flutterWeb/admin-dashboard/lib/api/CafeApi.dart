import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';


class CafeApi {

  static Dio _dio = new Dio();
  
  static void configureDio() {

    // Base del url
    _dio.options.baseUrl = 'http://localhost:8081/api';

    // Configurar Headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };

  }

  static Future httpGet( String path ) async {
    try {
      
      final resp = await _dio.get(path);

      return resp.data;


    } catch (e) {
      throw('Error en el Get');
    }
  }

  static Future post( String path, Map<String, dynamic> data ) async {

    final formData = FormData.fromMap(data);

    try {
        
      final resp = await _dio.post(path, data: formData );
      return resp.data;

    } catch (e) {
      throw('Error en el Post');
    }
  }

  static Future put( String path, Map<String, dynamic> data ) async {

    final formData = FormData.fromMap(data);

    try {
        
      final resp = await _dio.put(path, data: formData );
      return resp.data;

    } catch (e) {
      throw('Error en el Put');
    }
  }
   
   static Future delete( String path, Map<String, dynamic> data ) async {

    final formData = FormData.fromMap(data);

    try {
        
      final resp = await _dio.delete(path, data: formData );
      return resp.data;

    } catch (e) {
      throw('Error en el Delete');
    }
  }
}