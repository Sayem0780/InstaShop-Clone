import 'package:flutter/material.dart';
import 'package:instashop/screens/categorypage.dart';
class Dukan extends StatelessWidget {
  const Dukan({
    Key? key,
    required this.deviceSize,
  }) : super(key: key);

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(CategoryPage.routeName);
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: GridTile(
                    child: Container(
                      height: deviceSize.height*.25,
                      width: deviceSize.width,
                      //const Color(0xFFCEAD0C),
                      decoration: BoxDecoration(
                        color: Color(0xA6F1EBEB),
                        borderRadius: BorderRadius.circular(13),
                        /*boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurStyle: BlurStyle.normal,
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                            offset: Offset(5,10),
                          )
                        ],*/
                      ),
                    ),
                  footer: GridTileBar(
                    backgroundColor: Color(0xF0FFFFFF),
                    trailing: Icon(Icons.perm_identity_rounded,color: Colors.blue,size: 40,),
                    title: Text("Family Bazar",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black),textScaleFactor: 2,),
                    subtitle:Text("Bou Bazar,Ketura Majsid",style: TextStyle(fontSize: 5,fontWeight: FontWeight.w500,color: Colors.black54),textScaleFactor: 4,) ,
                  )),
            ),
          ),
        );
  }
}