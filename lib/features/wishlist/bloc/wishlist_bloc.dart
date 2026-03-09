import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vanillacontacts_course/data/wishlist_items.dart';
import 'package:vanillacontacts_course/features/home/models/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistIntialEvent>(wishlistIntialEvent);
  }

  FutureOr<void> wishlistIntialEvent(
      WishlistIntialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItem: wishListItems));
  }
}
