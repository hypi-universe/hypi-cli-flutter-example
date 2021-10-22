import 'package:artemis/artemis.dart';
import 'package:codegen/models/graphql/graphql.graphql.dart';
import 'package:codegen/auth.dart';

class Products {
  final List<int> _products = [];

  static Future<List<ProductsData$Query$Find$Edges>> getProducts() async {
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
      print('Error: ${response.errors.map((e) => e.message).toList()}');
      return [];
    }
    return (response?.data?.find?.edges ?? []);
  }
}
