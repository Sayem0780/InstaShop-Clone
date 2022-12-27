import 'package:flutter/material.dart';
import 'package:instashop/provider/product.dart';
import 'package:instashop/screens/selecteditemPage.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class Basket extends StatelessWidget {
  Basket({
    required this.child,
    required this.value,
    required this.amount,
    required this.weight,
    //required this.color,
  });

  final Widget child;
  dynamic value;
  dynamic amount;
  dynamic weight;
  //final Color color;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    print(value);
    amount = amount.toStringAsFixed(2);
    double weight1 = double.parse(weight.toStringAsFixed(2));
    return value>0?Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          bottom: 01,
          right: 5,
          left: 5,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(2.0),
              height: deviceSize.height*.1,
              width: deviceSize.width*8,
              // color: Theme.of(context).accentColor,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.green,
              ),
              constraints: BoxConstraints(
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushReplacementNamed(SelectedItemPage.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: deviceSize.width*.115741,
                      height: deviceSize.height*.06127451,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.black12
                      ),
                      child: Center(
                        child: Text(
                          '$value',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: deviceSize.width*.0463,
                              color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'View Basket ('+'$amount tk) ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                          fontSize: deviceSize.width*.05093,
                          color: Colors.white
                      ),
                    ),

                    Text(
                      '$weight1 kg',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: deviceSize.width*.05093,
                          color: Colors.white
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ):  Stack(
        alignment: Alignment.center,
      children: [
        child,
        Positioned(
        bottom: 01,
        right: 5,
        left: 5,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(2.0),
            height: deviceSize.height*.08,
            width: deviceSize.width*75,
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.green,
            ),
            constraints: BoxConstraints(
            ),
            child: Center(child: Text("Tap to select the products",style: TextStyle(fontSize:deviceSize.width*.05093,fontWeight:FontWeight.bold,color: Colors.white),)),
          ),
        ),
      ),]
    );
  }
}
