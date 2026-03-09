part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

sealed class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistSuccessState extends WishlistActionState {
  final List<ProductDataModel> wishlistItem;

  WishlistSuccessState({required this.wishlistItem});
}
