import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  final String imgUrl;
  const CatalogPage({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог коктейлей'),
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
          childAspectRatio: 1,
          children: [
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String image) => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5),
          ],
          color: Colors.lime,
        ),
        child: const Text(
          'Коктейль',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            backgroundColor: Colors.black45,
          ),
        ),
      );
}
