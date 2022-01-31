abstract class HttpClient {
  Future<Map<String, dynamic>> get(url, {Map<String, String>? headers});
  Future<Map<String, dynamic>> post(url, {Map<String, String>? headers, dynamic body});
  Future<Map<String, dynamic>> put(url, {Map<String, String>? headers, dynamic body});
}