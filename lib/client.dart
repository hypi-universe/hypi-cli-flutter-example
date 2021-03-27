import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink _httpLink = HttpLink(
  uri: 'https://api.hypi.app/graphql',
  headers: <String, String>{
    'Authorization': 'Bearer eyJhbGciOiJSUzI1NiJ9.eyJoeXBpLmluc3RhbmNlIjp7InJlYWxtIjoiZW1hbiIsIm5hbWUiOiJzdG9yZSIsInJlbGVhc2UiOiJsYXRlc3QifSwiaHlwaS5sb2dpbiI6dHJ1ZSwiaHlwaS5wdXJwb3NlIjoibG9naW4iLCJoeXBpLnVzZXJuYW1lIjoiZW1hbi5jc2UyMDA4QGdtYWlsLmNvbSIsImh5cGkuZW1haWwiOiJlbWFuLmNzZTIwMDhAZ21haWwuY29tIiwiYXVkIjoiZW1hbiIsImlhdCI6MTYxNDYyMDI1MCwiZXhwIjoxNjE3MjEyMjUwLCJzdWIiOiIwMUVOM1NCSkFDMzJBTkdQQjhKUVBQMFlTNCIsIm5iZiI6MTYxNDYyMDI1MH0.UOLOJyb_edS9b9tNQUekVDMA9mXvu9_6vY1Lfnprv4mS9YemmWl_Hp9vi1jAw-JAhI88VRwuVQO_Oj2cxbY1X8FPCQZEK7EdVupNjr4ReC3z8zeM3EUVOXzwIlJcNQ1GgWljVpVaQsObPl8EAVN9PAGShTn8WC1bC1aWyOqRgwraj9cDJNdf8c2EYrJFvcnkHf2SNl9FAPgPDj3pX3d65UJX6EPE9ptdwXgQm78_IXY8HGdYN6n86i57579pTVycDi24iXGn62kOskRurlne5yL2ecrPuYl-9gVlGxZALpkh8aSevwyQGBxnIUJ2BZBoDqsFkBcq-qcxKiCW0aObgw',
    'hypi-domain' : 'conveyors.apps.hypi.app',
  },
);

final Link _link = _httpLink;

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: _link,
  ),
);