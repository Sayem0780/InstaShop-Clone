import 'package:flutter/material.dart';
import 'package:instashop/provider/product.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';

class Badge extends StatelessWidget {
   Badge({
    required this.child,
    required this.value,
    //required this.color,
  });

  final Widget child;
  int value;
  //final Color color;
  @override
  Widget build(BuildContext context) {
    final info = Provider.of<Cart>(context,listen: true);
    final product = Provider.of<Product>(context,listen: true);
    print(value);
    return value==0?Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0x0),
            ),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              '',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.white
              ),
            ),
          ),
        ),
      ],
    ):Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
           right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.green,
            ),
            constraints: BoxConstraints(
              minWidth: 18,
              minHeight: 16,
            ),
            child: Text(
              '$value',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Positioned(
          left: 8,
          top: 8,
          child: GestureDetector(
            onTap: (){value>1?info.lessItem(product.id):info.removeItem(product.id);},
            child: Container(
              padding: EdgeInsets.all(2.0),
              // color: Theme.of(context).accentColor,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.red,
              ),
              constraints: BoxConstraints(
                maxWidth: 25,
                maxHeight: 25,
              ),
              child: Container(
                  child: Center(child: Text('-', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,height: .65),)),
                ),

            ),
          ),
        ),
      ],
    );
  }
}
