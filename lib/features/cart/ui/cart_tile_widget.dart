import 'package:flutter/material.dart';
import 'package:vanillacontacts_course/features/home/bloc/home_bloc.dart';
import 'package:vanillacontacts_course/features/home/models/home_product_data_model.dart';

import '../bloc/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget(
      {super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            border: Border.all(color: Colors.black)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productDataModel.imageUrl)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              productDataModel.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              productDataModel.description,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${productDataModel.price}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // cartBloc.add(HomeProductWishListButtonClickedEvent(
                        //     clickedProduct: productDataModel));
                      },
                      icon: const Icon(Icons.favorite_outline),
                    ),
                    IconButton(
                      onPressed: () {
                        // cartBloc.add(HomeProductCartButtonClickedEvent(
                        //   clickedProduct: productDataModel,
                        // ));
                      },
                      icon: const Icon(Icons.shopping_bag_outlined),
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
