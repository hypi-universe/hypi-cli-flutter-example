import 'package:flutter/material.dart';
import 'package:artemis/artemis.dart';
import 'package:codegen/models/graphql/graphql.graphql.dart';
import 'package:codegen/auth.dart';
import 'package:codegen/models/products.dart';

void main() async {
  final products = await Products.getProducts();
  runApp(
    ProductsApp(
      products: List<ListItem>.of(products.map((product) => ProductItem(product.node.title, product.node.description))),
    ),
  );
}

class ProductsApp extends StatelessWidget {
  final List<ListItem> products;

  const ProductsApp({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Products List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: products.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = products[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ),
      ),
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a product.
class ProductItem implements ListItem {
  final String title;
  final String description;

  ProductItem(this.title, this.description);

  @override
  Widget buildTitle(BuildContext context) => Text(title);

  @override
  Widget buildSubtitle(BuildContext context) => Text(description);
}
