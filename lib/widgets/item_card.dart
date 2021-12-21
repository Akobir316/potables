import 'package:flutter/material.dart';
import 'package:potables/models/cart.dart';
import 'package:potables/models/product.dart';
import 'package:potables/pages/item_page.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(int.parse(product.color)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ItemPage(
                    id: product.id,
                  ),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(product.imgUrl), fit: BoxFit.cover),
                  ),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  // ignore: unnecessary_string_interpolations
                  child: Text('${product.title}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${product.price}'),
                IconButton(
                  onPressed: () {
                    Provider.of<CartDataProvider>(context, listen: false)
                        .addItem(
                      productId: product.id,
                      price: product.price,
                      title: product.title,
                      imgUrl: product.imgUrl,
                    );
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.black12,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
