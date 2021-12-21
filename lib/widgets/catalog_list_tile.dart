import 'package:flutter/material.dart';
import 'package:potables/pages/catalog_page.dart';

class CatalogListTile extends StatelessWidget {
  final imgUrl;
  const CatalogListTile({Key? key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CatalogPage(imgUrl: imgUrl)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.cover,
                )),
          ),
          title: const Text('Летний освежающий набор'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('09:00 - 00:00'),
              Row(
                children: const <Widget>[
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.amberAccent,
                  ),
                  Text('4.7'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
