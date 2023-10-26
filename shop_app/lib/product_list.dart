import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/product_card.dart';
import 'package:shop_app/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ["All","Adidad","Puma","Bata"];
late String selectedFilter;
@override
  void initState() {
    // TODO: implement initState
    selectedFilter = filters[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(225, 225, 225, 1),
                    ),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(50))
                  );
    return  SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border
                ),
                
              ))
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(

              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                         selectedFilter = filters[index];
                      });
                     
                    },
                    child: Chip(
                      backgroundColor:selectedFilter==filters[index]?Theme.of(context).colorScheme.primary: Color.fromRGBO(245, 247, 249, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1)
                      ),
                      label: Text(filters[index]),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                  ),
                );
              },
              ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product  = products[index]; 
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsPage(product: product);
                        }
                        )
                    );
                  },
                  child: ProductCard(
                    title: product['title'] as String, 
                    price: product['price'] as String, 
                    imageUrl: product['imageUrl'] as String, 
                    backgroundColor: index%2==0?Color.fromRGBO(216, 240,253, 1):Color.fromRGBO(245, 247, 249, 1),
                    ),
                );
              },
              ),
          )
        ],
      ),
    );
  }
}