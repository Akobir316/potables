import 'package:flutter/material.dart';
import 'package:potables/models/cart.dart';
import 'package:potables/pages/item_page.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final cartData;
  final index;
  const CartItem({Key? key, this.cartData, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                ItemPage(id: cartData.cartItems.keys.toList()[index]),
          ),
        );
      },
      child: Container(
        child: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(
                    cartData.cartItems.values.toList()[index].imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(cartData.cartItems.values.toList()[index].title),
          subtitle:
              Text('Цена:${cartData.cartItems.values.toList()[index].price}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Provider.of<CartDataProvider>(context, listen: false)
                      .updateItemsSubOne(
                          cartData.cartItems.keys.toList()[index]);
                },
                icon: Icon(Icons.remove_circle_outline),
              ),
              Text('x${cartData.cartItems.values.toList()[index].number}'),
              IconButton(
                onPressed: () {
                  Provider.of<CartDataProvider>(context, listen: false)
                      .updateItemsAddOne(
                          cartData.cartItems.keys.toList()[index]);
                },
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
