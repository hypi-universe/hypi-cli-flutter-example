import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Architecture demo'),
      ),
      body: Container(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is HomeLoadedState) {
              final products = state.products;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
                    key: Key(product.node.hypi.id),
                    title: Text(product.node.title),
                    subtitle: Text('By: ${product.node.description}'),
                  );
                },
              );
            } else {
              return Container(
                child: Center(
                  child: Text('You have an error'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
