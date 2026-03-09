import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vanillacontacts_course/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:vanillacontacts_course/features/wishlist/ui/wishlist_tile_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistIntialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Wishlist',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                itemCount: successState.wishlistItem.length,
                itemBuilder: (context, index) {
                  return WishlistTileWidget(
                    wishlistBloc: wishlistBloc,
                    productDataModel: successState.wishlistItem[index],
                  );
                },
              );
          }
          return Container();
        },
      ),
    );
  }
}
