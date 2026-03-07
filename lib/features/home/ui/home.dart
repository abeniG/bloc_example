import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vanillacontacts_course/features/cart/ui/cart.dart';
import 'package:vanillacontacts_course/features/home/ui/product_tile_widget.dart';
import 'package:vanillacontacts_course/features/wishlist/ui/wishlist.dart';

import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Wishlist()));
        }
      },
      builder: (context, state) {
        switch (state) {
          case HomeLoadingState _:
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                centerTitle: true,
                title: const Text(
                  'Grocery App',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: const Center(child: CircularProgressIndicator()),
            );
          case HomeLoadedSuccessState _:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  centerTitle: true,
                  title: const Text(
                    'Grocery App',
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        homeBloc.add(
                          HomeWishListButtonNavigateEvent(),
                        );
                      },
                      icon: const Icon(Icons.favorite_outline),
                    ),
                    IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductCartButtonClickedEvent());
                      },
                      icon: const Icon(Icons.shopping_bag_outlined),
                    ),
                  ],
                ),
                body: ListView.builder(
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) {
                      return ProductTileWidget(
                        productDataModel: successState.products[index],
                      );
                    }));

          case HomeErrorState _:
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                centerTitle: true,
                title: const Text(
                  'Grocery App',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: const Center(
                child: Text("Error"),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
