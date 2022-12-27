import 'package:flutter/material.dart';
import 'package:instashop/provider/cart.dart';
import 'package:instashop/widget/productitem.dart';
import '/provider/products.dart';
import 'package:provider/provider.dart';
import 'basket.dart';

class ProductItemGrid extends StatelessWidget {
  const ProductItemGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context,listen: true);
    final product = productData.items;
    final info = Provider.of<Cart>(context);
    return Basket(
      weight: info.totalWeight,
      amount: info.totalAmount,
      value: info.totalItem,
      child: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: product.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: product[i],
          child: ProductItem(),

        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 8,
          mainAxisSpacing: 16,
        ),
      ),
    );
  }
}
