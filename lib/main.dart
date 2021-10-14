import 'dart:convert';
import 'package:artemis/artemis.dart';
import 'package:http/http.dart' as http;
import 'package:codegen/models/graphql/graphql.graphql.dart';

class AuthenticatedClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    var myData = {};
    myData["domain"] = 'hubcaps.apps.hypi.app';
    myData["token"] = 'eyJhbGciOiJSUzI1NiJ9.eyJoeXBpLmxvZ2luIjp0cnVlLCJoeXBpLnVzZXJuYW1lIjoiZW1hbi5jc2UyMDA4QGdtYWlsLmNvbSIsImh5cGkuZW1haWwiOiJlbWFuLmNzZTIwMDhAZ21haWwuY29tIiwiYXVkIjoiMDFGMkdaQkpLSDZSM1RDNkVKRFJFNU5IRzQiLCJpYXQiOjE2MzM1MDcyNTEsImV4cCI6MTYzNjA5OTI1MSwic3ViIjoiMDFGMkdaQkpLQUgxSkNDQlZaUzI0TVQ3VlIiLCJuYmYiOjE2MzM1MDcyNTF9.dS3gftDbCWJYaVJIS1yrDTYVSkH29ucJ8_ehwmuSz5yB7k95lfQeP2yCHi06yvdvtPVCgKht0iBqXKtznzd5GpToikvT9bfxVifNYjSjp4QAUGKCzqkjmj6EOOn1-KB2zQ8u9n_eew3SbR3450_hkIAAOMob3omrSr-3ZkzJeLYonwj9G9_6-oOuDp-GaNPFrF5hO7IF5siMi0x9XqhtRcHIca0JSzYbFhkDAX2Ohetv29PjZWaN6UrzLpjtlTadAXadmFN7i6YRpV1SzdNBOH3pCXUsVMuQABwXYV__d9k_LR6xJZldu42x4AKWUAHb1HMilNz2Cng_3dPwpQH6Zw';

    request.headers['Authorization'] = 'Bearer ' + myData["token"];
    request.headers['hypi-domain'] = myData["domain"];
    return _inner.send(request);
  }
}

void main() async {
  final client = ArtemisClient(
    'https://api.hypi.app/graphql',
    httpClient: AuthenticatedClient(),
  );

  final query = ProductsDataQuery(
    variables: ProductsDataArguments(arcql: '*'),
  );

  final response = await client.execute(query);
  client.dispose();

  if (response.hasErrors) {
    return print('Error: ${response.errors.map((e) => e.message).toList()}');
  }
  (response?.data?.find?.edges ?? []).map((r) => "Product title is :" + r.node.title).forEach(print);

  
}
