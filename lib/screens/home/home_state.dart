import 'package:flutter/foundation.dart';
import 'package:codegen/models/graphql/graphql_api.dart';

class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<ProductsData$Query$Find$Edges> products;
  HomeLoadedState({
    @required this.products,
  });
}

class HomeErrorState extends HomeState {}