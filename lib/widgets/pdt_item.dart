import 'dart:io';

import 'package:flutter/material.dart';
import 'package:green_arot_flutter/consts/consts.dart';
import 'package:green_arot_flutter/models/products.dart';
import 'package:green_arot_flutter/screens/pdt_detail_screen.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class PdtItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  PdtItem({required this.name, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailPage.routeName, arguments: pdt.id);
      },
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridTile(
            child: Image.network(imageUrl),
            footer: GridTileBar(
              backgroundColor: darkGreen,
              title: Text(name),
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Scaffold.of(context).showInSnackBar(SnackBar(
                  //     duration: Duration(seconds: 3),
                  //     content: Text("Item added to the Cart")));
                  // cart.addItem(pdt.id, pdt.name, pdt.price);
                },
              ),
            ),
          )),
    );
  }
}
