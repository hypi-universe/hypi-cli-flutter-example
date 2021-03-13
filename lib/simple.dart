import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:codegen/models/graphql/graphql_api.graphql.dart';

class Simple extends StatefulWidget {
  @override
  _SimpleState createState() => _SimpleState();
}

class _SimpleState extends State<Simple> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple example'),
      ),
      body: Query(
        options: QueryOptions(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          // ignore: deprecated_member_use
          documentNode: ProductsDataQuery(variables: ProductsDataArguments(arcql: '*')).document,
        ),
        builder: (
            QueryResult result, {
              Future<QueryResult> Function() refetch,
              FetchMore fetchMore,
            }) {
          print(result.source);
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final allProducts =
          ProductsData$Query.fromJson(result.data).find.edges;

          return ListView.builder(
            itemBuilder: (_, index) {
              return ListTile(
                leading: Text(_counter.toString()),
                title: Text(allProducts[index].node.props[1]),
                subtitle: Text(allProducts[index].node.props[2]),
                trailing: FlatButton.icon(
                    onPressed: () => setState(() => _counter++),
                    icon: Icon(Icons.plus_one),
                    label: Text('')),
              );
            },
            itemCount: allProducts.length,
          );
        },
      ),
    );
  }
}
