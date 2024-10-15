import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/constants_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
    dio.interceptors.add(
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90,
            enabled: kDebugMode,
            filter: (options, args){
              // don't print requests with uris containing '/posts'
              if(options.path.contains('/posts')){
                return false;
              }
              // don't print responses with unit8 list data
              return !args.isResponse || !args.hasUint8ListData;
            }
    //   name: omar
    //  email: omartarek55@gmail.com
    //  password: 12345678
    //  rePassword: 12345678
    //  phone: 01127782643
        ));
  }

  Future<Response> getData(
      {required String endPoint,
      Map<String, dynamic>? param,
      Map<String, dynamic>? headers}) async {
    return dio.get(AppConstants.baseURL + endPoint,
        queryParameters: param, options: Options(headers: headers));
  }

  Future<Response> postData(
      {required String endPoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    return dio.post(AppConstants.baseURL + endPoint,
        data: body, options: Options(headers: headers));
  }
}
