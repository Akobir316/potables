import 'package:flutter/material.dart';
import 'package:potables/models/product.dart';
import 'package:potables/widgets/bottom_bar.dart';
import 'package:potables/widgets/catalog_list_tile.dart';
import 'package:potables/widgets/item_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);
    
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              )),
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
         Container(
               
                child: const ListTile(
                  title: Text(
                    'Освежающие напитки',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Больше чем 100 видов напитков',
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.panorama_horizontal),
                ),
              ),
              Container(
                height: 290,
                padding: const EdgeInsets.all(5),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productData.items.length,
                    itemBuilder: (context, int index) =>
                        ChangeNotifierProvider.value(
                          value: productData.items[index],
                          child: const ItemCard(),
                        )),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text('Каталог коктейлей'),
              ),
              ...productData.items.map((e) {
                return CatalogListTile(
                  imgUrl: e.imgUrl,
                );
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
