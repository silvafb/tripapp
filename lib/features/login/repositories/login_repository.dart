import 'package:qeapp_trip/data/http/http.dart';

abstract class LoginRepository {
  Future<Map<String, dynamic>> authentication({ required String login, required String password });
}

class LoginRepositoryImp implements LoginRepository {

  HttpClient httpClient;
  LoginRepositoryImp(HttpClient this.httpClient);

  @override
  Future<Map<String, dynamic>> authentication({ required String login, required String password }) async {
    final result = await httpClient.post("YOUR ENDPOINT", body: {'login': login, 'senha': password});
    return result;
  }
}