import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instashop/widget/badge.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import '../provider/product.dart';
import 'badge1.dart';

class SelectedItem extends StatelessWidget {

  final String productId;
  final double price;
  final int quantity;
  final String title;
  final double weight;

  SelectedItem(
      this.productId,
      this.price,
      this.quantity,
      this.title,
      this.weight
      );

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final info = Provider.of<Cart>(context,listen: false);
    dynamic totalweight = (quantity*weight);
    totalweight = totalweight.toStringAsFixed(2);
    dynamic totalprice = (quantity*price);
    totalprice = totalprice.toStringAsFixed(2);
    return Container(
      margin: EdgeInsets.only(left: deviceSize.width*.0416667),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.values.last,
            children: [
              Badge1(
                value: quantity,
                color: Colors.green,
                child: Container(
                  height: deviceSize.height*.136,
                  width: deviceSize.width*.2651,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),

                ),
              ),
              SizedBox(width: deviceSize.height*.01470588235,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,softWrap:true, style: TextStyle(fontWeight:FontWeight.w900,fontSize: deviceSize.height*.0271,color: Colors.white),overflow: TextOverflow.visible,),
                    SizedBox(height: deviceSize.height*.00613,),
                    Text('$totalprice tk',style: TextStyle(fontWeight:FontWeight.w500,fontSize: deviceSize.height*.0271,color: Colors.white),),
                    SizedBox(height: deviceSize.height*.027,),
                    Text('$totalweight gr',style: TextStyle(fontWeight:FontWeight.w400,fontSize: deviceSize.height*.0271,color: Colors.white),),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: (){
                    info.addItem(productId, price, title, weight);
                  }, icon: Icon(Icons.add_circle_outline,color: Colors.white,)),
                  IconButton(onPressed: (){
                    quantity>1?info.lessItem(productId):info.removeItem(productId);

                  }, icon: Icon(Icons.minimize,color: Colors.white,)),
                ],
              )

            ],
          ),
          Divider(color: Colors.white12,thickness: 1.2,),

        ],
      ),
    );
  }
}
