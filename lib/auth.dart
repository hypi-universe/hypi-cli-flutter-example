import 'package:http/http.dart' as http;
import './my_config.dart' as config show domain, token;

class AuthenticatedClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    var myData = {};
    myData["domain"] = config.domain;
    myData["token"] = config.token;

    request.headers['Authorization'] = 'Bearer ' + myData["token"];
    request.headers['hypi-domain'] = myData["domain"];
    return _inner.send(request);
  }
}