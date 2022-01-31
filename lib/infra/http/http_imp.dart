import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '/data/http/http.dart';
import '/data/http/http_errorr.dart';

import '/infra/cache/local_storage_imp.dart';

class HttpClientImp implements HttpClient {

  final localStorage = LocalStorageImp();

  @override
  Future<Map<String, dynamic>> get(url, {Map<String, String>? headers}) async {

    ConnectivityResult result = ConnectivityResult.none;
    result = await Connectivity().checkConnectivity();
    
    if(result == ConnectivityResult.none) {
      throw HttpError.badRequest;
    }

    try {
      String? authorization = await localStorage.getItem('request', 'authorization');
      if(authorization != null){
        headers == null ? headers = {"authorization": authorization} : headers['authorization'] = authorization;
      }
      final response = await http.get(Uri.parse(url), headers: headers);
      await localStorage.setItem('request', 'authorization', response.headers['authorization']);
      authorization = await localStorage.getItem('request', 'authorization');
      return _handleResponse(response);
    } catch (e) {
      throw HttpError.serverError;
    }
  }

  @override
  Future<Map<String, dynamic>> post(url, {Map<String, String>? headers, body}) async {

    ConnectivityResult result = ConnectivityResult.none;
    result = await Connectivity().checkConnectivity();

    if(result == ConnectivityResult.none) {
      throw HttpError.badRequest;
    }

    try {
      String? authorization = await localStorage.getItem('request', 'autorization');
      if(authorization != null) {
        headers == null ? headers = {"authorization": authorization} : headers['authorization'] = authorization;
      }
      final response = await http.post(Uri.parse(url), body: body, headers: headers);
      await localStorage.setItem('request', 'authorization', response.headers['authorization']);
      authorization = await localStorage.getItem('request', 'authorization');
      return _handleResponse(response);
    } catch (e) {
      throw HttpError.serverError;
    }
  }

  @override
  Future<Map<String, dynamic>> put(url, {Map<String, String>? headers, body}) async {
    
    ConnectivityResult result = ConnectivityResult.none;
    result = await Connectivity().checkConnectivity();

    if(result == ConnectivityResult.none) {
      throw HttpError.badRequest;
    }

    try {
      String? authorization = await localStorage.getItem('request', 'authorization');
      if(authorization != null){
        headers == null ? headers = {"authorization": authorization} : headers['authorization'] = authorization;
      }
      final response = await http.put(Uri.parse(url), body: body, headers: headers);
      await localStorage.setItem('request', 'authorization', response.headers['authorization']);
      authorization = await localStorage.getItem('request', 'authorization');
      return _handleResponse(response);
    } catch (e) {
      throw HttpError.serverError;
    }
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200: return response.body.isEmpty ? null : jsonDecode(response.body);
      case 204: return null;
      case 400: throw HttpError.badRequest;
      case 401: throw HttpError.unauthorized;
      case 403: throw HttpError.forbidden;
      case 404: throw HttpError.notFound;
      default: throw HttpError.serverError;
    }
  }

}