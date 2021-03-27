import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';

import 'bloc.dart';

import 'package:codegen/repositories/product.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository productRepository;

  HomeBloc({
    @required this.productRepository,
  });

  @override
  get initialState => HomeInitialState();

  @override
  Stream<HomeState> mapEventToState(event) async* {
    if (event is HomeLoadEvent) {
      try {
        yield HomeLoadingState();
        final products = await productRepository.getProducts();
        yield HomeLoadedState(
          products: products,
        );
      } catch (error) {
        yield HomeErrorState();
      }
    }
  }
}