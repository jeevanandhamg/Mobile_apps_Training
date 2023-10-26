import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/home_page.dart';
import 'package:shop_app/product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping app',
        
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254,206,1,1),
            primary: const Color.fromRGBO(254,206,1,1)
            ),
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.black
              )
            ),
          fontFamily: 'Lato',
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1)
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          )
    
        ),
        home: HomePage(),
        
      ),
    );
  }
}
