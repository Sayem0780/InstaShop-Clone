import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);
  static const routeName = '/checkoutpage';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Container(
            height: deviceSize.height*.7,
            margin: EdgeInsets.only(top: 10),
            width: deviceSize.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 12,right: 12),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Buyer ADDRESS',style: TextStyle(fontWeight: FontWeight.w400),),
                    SizedBox(
                      height: deviceSize.height * .02315,
                    ),
                    Container(
                      height: deviceSize.height*.1,
                      child: ListTile(
                        leading: Icon(Icons.location_on_outlined),
                        title: Text('Sayem Muhaimin ',overflow: TextOverflow.clip,),
                        subtitle: Text('Residence: Bou Bazar HaliShar Masjid,Chittagong,BanglaDesh',overflow: TextOverflow.clip,),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    Text('Seller ADDRESS',style: TextStyle(fontWeight: FontWeight.w400),),
                    SizedBox(
                      height: deviceSize.height * .02315,
                    ),
                    Container(
                      height: deviceSize.height*.1,
                      child: ListTile(
                        leading: Icon(Icons.location_on_outlined),
                        title: Text('Family Bazar',overflow: TextOverflow.clip,),
                        subtitle: Text('Bou Bazar HaliShar Masjid,Chittagong,BanglaDesh',overflow: TextOverflow.clip,),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    Divider(),
                    Text('Payment',style: TextStyle(fontWeight: FontWeight.w500),),
                    SizedBox(
                      height: deviceSize.height * .02315,
                    ),
                    Container(
                      height: deviceSize.height*.09,
                      child: ListTile(
                        leading: Icon(Icons.payment),
                        title: Text('Cash on delivery',overflow: TextOverflow.clip,),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),

                Container(
                          padding: EdgeInsets.only(left: 15,top: 15,right: 15),
                          width: deviceSize.width*.95,
                          height: deviceSize.height*.09,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0x79C9B8B8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Bring Change For...',style: TextStyle(fontSize: 20,color: Color(
                                  0xFF635D5D)),),
                              Icon(Icons.arrow_drop_down_outlined,size: 25,),
                            ],
                          ),
                        ),



                    Divider(thickness: 1,color: Colors.black,),

                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              height: deviceSize.height * .1512,
              width: deviceSize.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Total',style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                      Text('500 tk',style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(
                    height: deviceSize.height * .0732,
                    width: deviceSize.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green,
                    ),
                    child: GestureDetector(
                        onTap: () {},
                        child: Center(
                            child: Text(
                              'CONFIRM ORDER',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
