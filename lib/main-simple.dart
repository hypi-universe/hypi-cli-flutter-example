
import 'package:artemis/artemis.dart';
import 'package:http/http.dart' as http;
import 'package:codegen/models/graphql/graphql_api.graphql.dart';
import 'dart:async';

class AuthenticatedClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Authorization'] =
        'Bearer eyJhbGciOiJSUzI1NiJ9.eyJoeXBpLmxvZ2luIjp0cnVlLCJoeXBpLnVzZXJuYW1lIjoiZW1hbi5jc2UyMDA4QGdtYWlsLmNvbSIsImh5cGkuZW1haWwiOiJlbWFuLmNzZTIwMDhAZ21haWwuY29tIiwiYXVkIjoiMDFGMkdaQkpLSDZSM1RDNkVKRFJFNU5IRzQiLCJpYXQiOjE2MTc3MjQ3MDUsImV4cCI6MTYyMDMxNjcwNSwic3ViIjoiMDFGMkdaQkpLQUgxSkNDQlZaUzI0TVQ3VlIiLCJuYmYiOjE2MTc3MjQ3MDV9.PZALeFiFCFisNf1ll6AIDj387WAen3xzgcTS3UBe2J3F3WNS05jcPXqQoCk6LEJyJp2wJr1sC5v9OutDUVxm9aaVTmIvEUrdR7YBfZauytcOY7xWzMvH3kbp6zUElNh7OjLbxu8KVzPKAnjdarSZPP0fwpdonb0Mh_yISyVRDWGckw2qwH8BmbGhKN6UwM8xjVLePc0d9qDj_CQ_XroqyZHjCN0Nbf1pP0edM4C1dUEKWJrAEIjDTiBitCtQHF8bv_z53eTSPCfjdueNhwwXGUIIz2-axn2ki31k6OUmopYzkZvnBuUltRueBEALFmJK12p6q_iGVtnZ389MJWbemA';
    request.headers['hypi-domain'] = 'my-dom.com';
    return _inner.send(request);
  }
}

void main() async {
  final client = ArtemisClient(
    'https://api.hypi.app/graphql',
    httpClient: AuthenticatedClient(),
  );

  final query = ProductsDataQuery(variables: ProductsDataArguments(arcql: '*'));
  final response = await client.execute(query);
  client.dispose();

  if (response.hasErrors) {
    return print('Error: ${response.errors.map((e) => e.message).toList()}');
  }

  print(response.data);
  (response?.data?.find?.edges ?? [])
      .map((r) => r.node.title)
      .forEach(print);
  print('Hello after response print');
}