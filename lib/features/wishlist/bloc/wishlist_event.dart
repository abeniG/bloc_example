part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

final class WishlistIntialEvent extends WishlistEvent {}

final class WishlistRemoveEvent extends WishlistEvent {}
