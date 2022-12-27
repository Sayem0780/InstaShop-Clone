import 'package:flutter/material.dart';
import 'package:instashop/widget/dukan.dart';
class LocationBox extends StatelessWidget {
  const LocationBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(12),
      height: (deviceSize.height*.10),
      width: (deviceSize.width - (deviceSize.width / 50)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
          border: Border.all(
            color: Color(0xFFCECECE),
            width: .7,
          )
      ),
      child:  ListTile(
        leading: IconButton(onPressed: (){
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => Dukan(deviceSize: deviceSize),
            ),
                (route) =>true,); //if you want to disable back feature set to false
        },icon: Icon(Icons.location_on_outlined,color: Colors.black,),),
        title: Text("Delivering to",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black54),textScaleFactor: 1,),
        subtitle: Text("Ketura Majid,Bou Bazar",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),textScaleFactor: 2,softWrap: true,),
        trailing: Icon(Icons.arrow_forward_ios),
      )

      /*Row(
          children: [
            Icon(Icons.location_on_outlined,color: Colors.black,),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text("Delivering to",style: TextStyle(fontSize: 5,fontWeight: FontWeight.w500,color: Colors.black54),textScaleFactor: 1,),
                Text("Ketura Majid,Bou Bazar",style: TextStyle(fontSize: 5,fontWeight: FontWeight.bold,color: Colors.redAccent),textScaleFactor: 2,),

              ],
            ),
          ],

        ),*/
    );
  }
}
