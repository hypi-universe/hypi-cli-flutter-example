import 'dart:io';

import 'package:codegen/client.dart';
import 'package:codegen/screens/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:codegen/screens/home/bloc.dart';
import 'package:codegen/repositories/product.dart';

GraphQLClient _client = client.value;
ProductRepository productRepository = ProductRepository(
  client: _client,
);

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Architecture demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => HomeBloc(
          productRepository: productRepository,
        )..add(HomeLoadEvent()),
        child: HomeScreen(),
      ),
    );
  }
}
