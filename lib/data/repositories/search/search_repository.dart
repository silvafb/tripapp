import 'dart:convert';

import '/data/endpoints/endpoints.dart';
import '/data/http/http.dart';

abstract class SearchRepository {
  Future<Map<String, dynamic>> search({ required Map<String, dynamic> filters });
}

class SearchRepositoryImp implements SearchRepository {

  HttpClient httpClient;
  SearchRepositoryImp({ required this.httpClient});

  @override
  Future<Map<String, dynamic>> search({ required Map<String, dynamic> filters }) async {
    final url = "${EndPointsImp().searchOrder}?limite=20&filtros=${jsonEncode(filters)}";
    final response = await httpClient.get(url);
    return response;
  }
}