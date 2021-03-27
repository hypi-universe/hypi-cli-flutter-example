
import 'package:artemis/artemis.dart';
import 'package:http/http.dart' as http;
import 'package:codegen/models/graphql/graphql_api.graphql.dart';
import 'dart:async';

class AuthenticatedClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Authorization'] =
        'Bearer eyJhbGciOiJSUzI1NiJ9.eyJoeXBpLmluc3RhbmNlIjp7InJlYWxtIjoiZW1hbiIsIm5hbWUiOiJzdG9yZSIsInJlbGVhc2UiOiJsYXRlc3QifSwiaHlwaS5sb2dpbiI6dHJ1ZSwiaHlwaS5wdXJwb3NlIjoibG9naW4iLCJoeXBpLnVzZXJuYW1lIjoiZW1hbi5jc2UyMDA4QGdtYWlsLmNvbSIsImh5cGkuZW1haWwiOiJlbWFuLmNzZTIwMDhAZ21haWwuY29tIiwiYXVkIjoiZW1hbiIsImlhdCI6MTYxNDYyMDI1MCwiZXhwIjoxNjE3MjEyMjUwLCJzdWIiOiIwMUVOM1NCSkFDMzJBTkdQQjhKUVBQMFlTNCIsIm5iZiI6MTYxNDYyMDI1MH0.UOLOJyb_edS9b9tNQUekVDMA9mXvu9_6vY1Lfnprv4mS9YemmWl_Hp9vi1jAw-JAhI88VRwuVQO_Oj2cxbY1X8FPCQZEK7EdVupNjr4ReC3z8zeM3EUVOXzwIlJcNQ1GgWljVpVaQsObPl8EAVN9PAGShTn8WC1bC1aWyOqRgwraj9cDJNdf8c2EYrJFvcnkHf2SNl9FAPgPDj3pX3d65UJX6EPE9ptdwXgQm78_IXY8HGdYN6n86i57579pTVycDi24iXGn62kOskRurlne5yL2ecrPuYl-9gVlGxZALpkh8aSevwyQGBxnIUJ2BZBoDqsFkBcq-qcxKiCW0aObgw';
    request.headers['hypi-domain'] = 'conveyors.apps.hypi.app';
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
//  if (response.data.find.edges.isNotEmpty) {
//    final products = response.data.find.edges.whereType<ProductsData$Query$Find$Edges>();
//    print(products.first.node.props);
//  }
  print(response.data);
  (response?.data?.find?.edges ?? [])
      .map((r) => r.node.title)
      .forEach(print);
  print('Hello after response print');
//  final node = response.data.find.edges[0].node;
//  print(node.props);
//  runApp(MyApp());
}
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Welcome to Flutter',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Welcome to Flutter'),
//        ),
//        body: Center(
//          child: Text('Hello World'),
//        ),
//      ),
//    );
//
//  }
//}
