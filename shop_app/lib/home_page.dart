import 'package:flutter/material.dart';
import 'package:shop_app/cart_page.dart';

import 'package:shop_app/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final List<String> filters = const ["All","Adidad","Puma","Bata"];
late String selectedFilter;
int currentPage = 0;
List<Widget> pages  = [ProductList(), CartPage()];

@override
  void initState() {
    // TODO: implement initState
    selectedFilter = filters[0];
    super.initState();
  
  }
  @override
  Widget build(BuildContext context) {



    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart'
          ),
        ],
      ),
        body: IndexedStack(
          index: currentPage,
          children: pages,
        ));
  }
}
