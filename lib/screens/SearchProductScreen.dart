import 'package:flutter/material.dart';


class Searchproductscreen extends StatefulWidget {
  const Searchproductscreen({super.key});

  @override
  State<Searchproductscreen> createState() => _SearchproductscreenState();
}

class _SearchproductscreenState extends State<Searchproductscreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Search Product'),
        ListView.separated(
          itemCount: 10,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Item '), 
              trailing: Icon(Icons.chevron_right),
              
            ) ;
          },
        ),
      ],
    );
  }
}