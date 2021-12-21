import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potables/models/cart.dart';
import 'package:potables/models/product.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataProvider>(
            create: (context) => ProductDataProvider()),
        ChangeNotifierProvider<CartDataProvider>(
            create: (context) => CartDataProvider()),
      ],
      child: MaterialApp(
        title: 'Demo App',
        theme: ThemeData(
            primarySwatch: Colors.amber,
            //backgroundColor: Colors.white,
            textTheme: GoogleFonts.marmeladTextTheme(
          Theme.of(context).textTheme,
        )),
        home: HomePage(),
      ),
    );
  }
}
