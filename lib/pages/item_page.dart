import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potables/models/cart.dart';
import 'package:potables/models/product.dart';
import 'package:potables/pages/cart_page.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatelessWidget {
  final String id;
  const ItemPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ProductDataProvider().getElementById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.title,
          style: GoogleFonts.marmelad(),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Hero(
              tag: data.imgUrl,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(
                      data.title,
                      style: TextStyle(fontSize: 26),
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Text(
                          'Цена: ',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          '${data.price}',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                    const Divider(),
                    Text(data.description),
                    const SizedBox(
                      height: 20,
                    ),
                    Provider.of<CartDataProvider>(context)
                            .cartItems
                            .containsKey(id)
                        ? Column(
                            children: [
                              const Text(
                                'Товар уже добавлен в корзину',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              MaterialButton(
                                child: Text('Перейти в корзину'),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => CartPage(),
                                    ),
                                  );
                                },
                                color: Color(0xFFCCFF90),
                              ),
                            ],
                          )
                        : MaterialButton(
                            color: Theme.of(context).primaryColor,
                            child: Text('Добавить в корзину'),
                            onPressed: () {
                              Provider.of<CartDataProvider>(context,
                                      listen: false)
                                  .addItem(
                                productId: data.id,
                                imgUrl: data.imgUrl,
                                title: data.title,
                                price: data.price,
                              );
                            }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
