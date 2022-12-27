import 'package:flutter/material.dart';
import 'package:instashop/widget/dukangrid.dart';
import 'package:instashop/widget/locationbox.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: Icon(Icons.shopping_basket_rounded),
          title: Text(
            'MudiDukan',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.email),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight / 1.25),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(left: 8),
                  height: (deviceSize.height / 20),
                  width: (deviceSize.width - (deviceSize.width / 50)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Search For any shop or product"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    SizedBox(height: 5,),
                    LocationBox(),
                    Container(
                      //margin: EdgeInsets.only(bottom: 1),
                        height: deviceSize.height*.665,
                        child: DukanGrid()),
                    SizedBox(height: 10,)
                  ],
                ),
          ),
        ),
    );
  }
}
