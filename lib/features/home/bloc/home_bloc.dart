import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vanillacontacts_course/data/grocery_data.dart';
import 'package:vanillacontacts_course/data/wishlist_items.dart';
import 'package:vanillacontacts_course/features/home/models/home_product_data_model.dart';

import '../../../data/cart_items.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishListButtonClickedEvent>(
      homeProductWishListButtonClickedEvent,
    );
    on<HomeProductCartButtonClickedEvent>(
      homeProductCartButtonClickedEvent,
    );
    on<HomeWishListButtonNavigateEvent>(
      homeWishListButtonNavigateEvent,
    );
    on<HomeCartButtonNavigateEvent>(
      homeCartButtonNavigateEvent,
    );
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
      products: GroceryData.groceryProducts
          .map((p) => ProductDataModel(
              id: p['id'],
              name: p['name'],
              description: p['category'],
              price: p['price'],
              imageUrl: p['image']))
          .toList(),
    ));
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print('wish list clicked ');
    wishListItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('cart clicked ');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishListButtonNavigateEvent(
      HomeWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('wishlist navigate clicked ');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('cart navigate clicked ');
    emit(HomeNavigateToCartPageActionState());
  }
}
