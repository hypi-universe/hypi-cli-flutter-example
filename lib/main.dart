import 'dart:convert';
import 'package:artemis/artemis.dart';
import 'package:http/http.dart' as http;
import 'package:codegen/models/graphql/graphql_api.graphql.dart';

class AuthenticatedClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    var myData = {};
    myData["domain"] = 'ricking.apps.hypi.app';
    myData["token"] = 'eyJhbGciOiJSUzI1NiJ9.eyJoeXBpLmxvZ2luIjp0cnVlLCJoeXBpLnVzZXJuYW1lIjoiZW1hbi5jc2UyMDA4QGdtYWlsLmNvbSIsImh5cGkuZW1haWwiOiJlbWFuLmNzZTIwMDhAZ21haWwuY29tIiwiYXVkIjoiMDFGMkdaQkpLSDZSM1RDNkVKRFJFNU5IRzQiLCJpYXQiOjE2MTgyMzEwMDQsImV4cCI6MTYyMDgyMzAwNCwic3ViIjoiMDFGMkdaQkpLQUgxSkNDQlZaUzI0TVQ3VlIiLCJuYmYiOjE2MTgyMzEwMDR9.CMsMC09C9dpjAflKbiFGpEcvYbSVvETdnY62lhxBGgBIwrhvckFBfTbLzl-cKWZn8dmVRWzBlcoZM99h0z0dJI2nC9lKRI254tZqicKYT4IUnVWhy9wDq76ZntE63Q5HdQJoPpiEhDyJNmzdU-PQJ5p2iOanA-rxGCGCyT6TKuYnEG24pnezCkj8BcSeXBswW_vWtTqx_zdZKvRQuK_DxIK7adPgcJdqtZnRR-wI39ph2I69Z0zJWLoK5a29M2FNlr5AoMYcx0Di-aF4gKSFkRRjl9TEyCQRNQ5S_0LZLTtwzoIJMV7bBmj0G_Ee-3gJUTuiMuzA1HMM8qHyGPplYA';

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
