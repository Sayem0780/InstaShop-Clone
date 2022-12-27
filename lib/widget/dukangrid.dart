import 'package:flutter/material.dart';
import 'dukan.dart';

class DukanGrid extends StatelessWidget {
  const DukanGrid({Key? key}) : super(key: key);
  static const routeName = '/dukan';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: 10,
      itemBuilder: (ctx, i) => Dukan(deviceSize: deviceSize ,),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 19/10,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
      ),
    );
  }
}
