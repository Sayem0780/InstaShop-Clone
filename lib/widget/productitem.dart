import 'package:flutter/material.dart';
import 'package:instashop/provider/cart.dart';
import 'package:instashop/widget/badge.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart';

class ProductItem extends StatefulWidget {
  ProductItem({Key? key}) : super(key: key);
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final info = Provider.of<Cart>(context,listen: true);
   final product = Provider.of<Product>(context,listen: false);

    return Container(
      child: GestureDetector(
        onTap: () {info.addItem(product.id,product.price, product.title,product.weight,);},
        child: Badge(
          value: (info.items[product.id])?.quantity ??0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GridTile(
              child: Container(
                height: 20,
                /*child: Image.network(
                      info.items[product.id]!.imageUrl,
                    fit: BoxFit.cover,
                  ),*/
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey,
                      width: .8,
                    )),
              ),
              footer: GridTileBar(
                backgroundColor: Color(0xA6F1EBEB),
                title: Text(
                 product.title,
                  textScaleFactor: 1.3,
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.black87),
                ),
                subtitle: Text(
                  product.weight.toString()+'gr',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54),
                ),
                trailing: Text(
                  product.price.toString()+"tk",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
