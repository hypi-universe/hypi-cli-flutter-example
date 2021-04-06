import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink _httpLink = HttpLink(
  uri: 'https://api.hypi.app/graphql',
  headers: <String, String>{
    'Authorization': 'Bearer eyJhbGciOiJSUzI1NiJ9.eyJoeXBpLmxvZ2luIjp0cnVlLCJoeXBpLnVzZXJuYW1lIjoiZW1hbi5jc2UyMDA4QGdtYWlsLmNvbSIsImh5cGkuZW1haWwiOiJlbWFuLmNzZTIwMDhAZ21haWwuY29tIiwiYXVkIjoiMDFGMkdaQkpLSDZSM1RDNkVKRFJFNU5IRzQiLCJpYXQiOjE2MTc3MjQ3MDUsImV4cCI6MTYyMDMxNjcwNSwic3ViIjoiMDFGMkdaQkpLQUgxSkNDQlZaUzI0TVQ3VlIiLCJuYmYiOjE2MTc3MjQ3MDV9.PZALeFiFCFisNf1ll6AIDj387WAen3xzgcTS3UBe2J3F3WNS05jcPXqQoCk6LEJyJp2wJr1sC5v9OutDUVxm9aaVTmIvEUrdR7YBfZauytcOY7xWzMvH3kbp6zUElNh7OjLbxu8KVzPKAnjdarSZPP0fwpdonb0Mh_yISyVRDWGckw2qwH8BmbGhKN6UwM8xjVLePc0d9qDj_CQ_XroqyZHjCN0Nbf1pP0edM4C1dUEKWJrAEIjDTiBitCtQHF8bv_z53eTSPCfjdueNhwwXGUIIz2-axn2ki31k6OUmopYzkZvnBuUltRueBEALFmJK12p6q_iGVtnZ389MJWbemA',
    'hypi-domain' : 'my-dom.com',
  },
);

final Link _link = _httpLink;

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: _link,
  ),
);