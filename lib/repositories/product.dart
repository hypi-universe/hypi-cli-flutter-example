import 'package:flutter/foundation.dart';
import 'package:codegen/models/graphql/graphql_api.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductRepository {
  final GraphQLClient client;

  ProductRepository({
    @required this.client,
  });

  Future<List<ProductsData$Query$Find$Edges>> getProducts() async {
    final results = await client.query(
      QueryOptions(
        documentNode: ProductsDataQuery().document,
      ),
    );
    print(results);
    if (results.hasException) {
      throw results.exception;
    } else {
      return ProductsData$Query.fromJson(results.data).find.edges;
    }
  }
}