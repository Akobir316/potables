import 'package:flutter/material.dart';
import 'package:potables/models/cart.dart';
import 'package:potables/widgets/cart_item_list.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзинка'),
      ),
      body: cartData.cartItems.isEmpty
          ? Card(
              elevation: 5,
              margin: const EdgeInsets.all(30),
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: double.infinity,
                child: const Text(
                  'Корзина пустая',
                ),
              ),
            )
          : Column(
              children: [
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Стоимость: ' + cartData.totalAmount.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        cartData.clear();
                      },
                      color: Theme.of(context).primaryColor,
                      child: Text('Купить'),
                    ),
                  ],
                ),
                Divider(),
                Expanded(
                    child: CartItemList(
                  cartData: cartData,
                )),
              ],
            ),
    );
  }
}
