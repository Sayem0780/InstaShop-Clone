import 'package:flutter/material.dart';
import 'package:instashop/screens/productpage.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final height = deviceSize.height*.17156862745;

    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(ProductPage.routeName);
      },
      child: Column(
        children: [
          Container(
            height: height,
            width: deviceSize.width,
            decoration: BoxDecoration(
                color: Color(0xA6F1EBEB),
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 4),

              child: Text("Mudi Mal ",textScaleFactor: 1.2,softWrap:true, style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),)
          ),
        ],
      ),
    );
  }
}