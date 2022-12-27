import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instashop/screens/checkoutpage.dart';
import 'package:instashop/widget/selecteditem.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class SelectedItemPage extends StatelessWidget {
  const SelectedItemPage({Key? key}) : super(key: key);
  static const routeName = '/selectionpage';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    print(deviceSize.width);
    print(deviceSize.height);
    final cart = Provider.of<Cart>(context);
    double weight = cart.totalWeight;
    double deliveryCharge;

    if (weight==0) {
      deliveryCharge = 0;
    }else if (weight > 0 && weight < 5) {
      deliveryCharge = 25;
    }else if (weight > 5 && weight < 10) {
      deliveryCharge = 25;
    } else if (weight > 10 && weight < 20) {
      deliveryCharge = 30;
    } else if (weight > 20 && weight < 30) {
      deliveryCharge = 35;
    } else if (weight > 30 && weight < 35) {
      deliveryCharge = 40;
    } else if (weight > 35 && weight < 50) {
      deliveryCharge = 50;
    } else if (weight > 50 && weight < 60) {
      deliveryCharge = 60;
    } else if (weight > 60 && weight < 80) {
      deliveryCharge = 80;
    } else if (weight > 80 && weight < 100) {
      deliveryCharge = 120;
    } else {
      deliveryCharge = 200;
    }
    dynamic amount = cart.totalAmount + deliveryCharge;
    amount = amount.toStringAsFixed(2);
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: Icon(Icons.clear),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Basket',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Color(0xD34B4949),
      ),
      backgroundColor: Color(0xD33B3A3A),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: deviceSize.width * .0579,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Items',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          cart.clear();
                          Navigator.of(context).pop();
                        },
                        child: Text('Remove All',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22)))
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (ctx, i) => SelectedItem(
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].title,
                    cart.items.values.toList()[i].weight,
                  ),
                ),
              ),
              SizedBox(
                height: deviceSize.height * .02315,
              ),
              Container(
                color: Colors.black,
                height: deviceSize.height * .1912,
                width: deviceSize.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: deviceSize.height * .02315,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'BDT ' + '$amount' + 'tk',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: deviceSize.height*.0271,
                              fontWeight: FontWeight.w900),
                        ),
                        Container(
                            padding: EdgeInsets.all(2),
                            height: deviceSize.height * .0422,
                            width: deviceSize.width * .35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.green,
                            ),
                            child: Center(
                                child: Text(
                              'Add Discount',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: deviceSize.height * .02033,
                                  fontWeight: FontWeight.bold),
                            )))
                      ],
                    ),
                    SizedBox(
                      height: deviceSize.height * .0039,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'incl.VAT & incl BDT $deliveryCharge tk service fee',
                          style: TextStyle(
                              color: Color(0xFFADADAD),
                              fontSize: deviceSize.height * .01833,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(width: deviceSize.width*.02108,)
                      ],
                    ),
                    SizedBox(
                      height: deviceSize.height * .01630,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(CheckOutPage.routeName);
                      },
                      child: Container(
                          height: deviceSize.height * .0732,
                          width: deviceSize.width * .9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.pink,
                          ),
                          child: Center(
                              child: Text(
                            'Next',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceSize.height * .040651,
                                fontWeight: FontWeight.bold),
                          ))),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
              left: deviceSize.width*.38889,
              bottom: deviceSize.height * .17208672087,
              child: Container(
                  height: deviceSize.height * .1084010841,
                  width: deviceSize.width*.222222,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    color: Color(0xEB181717),
                    borderRadius: BorderRadius.circular(deviceSize.width*82/deviceSize.height),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '30 min',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textScaleFactor: 1.8,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
