import 'package:flutter/material.dart';
import 'package:instashop/widget/basket.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import 'cartegorytem.dart';
class CategoryGrid extends StatelessWidget {
  const CategoryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final info = Provider.of<Cart>(context);
    return info.totalWeight>0? Basket(
      weight: info.totalWeight,
      amount: info.totalAmount,
      value: info.totalItem,
      child: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: 60,
        itemBuilder: (ctx, i) => CategoryItem(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: .65,
          crossAxisSpacing: 8,
          mainAxisSpacing: 16,
        ),
      ),
    ) :GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: 60,
      itemBuilder: (ctx, i) => CategoryItem(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: .65,
        crossAxisSpacing: 8,
        mainAxisSpacing: 16,
      ),
    );
  }
}






