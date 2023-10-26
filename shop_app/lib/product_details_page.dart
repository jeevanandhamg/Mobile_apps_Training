import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
   final product;

   

  const ProductDetailsPage({
    super.key,
    required this.product
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
    int selectedSize = 0;

   @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    
  }
void onAddToCart() {
  if(selectedSize!=0) {
    Provider.of<CartProvider>(context,listen: false).addProduct(
      {
    'id': widget.product['id'],
    'title': widget.product['title'],
    'price': widget.product['price'],
    'size': selectedSize,
    'company':widget.product['company'],
    'imageUrl':widget.product['imageUrl']
  },
  
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Product added successful'))
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please select size'))
    );
  }
   }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'],
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            
            child: SizedBox(
              height: 300,
              child: Image.asset(widget.product['imageUrl'] as String)),
          ),
          Spacer(flex: 2),
          Container(
            height: 250,
            padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              color:Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40)
            ),
            child: Column(
              children: [
                Text('\$${widget.product['price']}',
                style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 8,),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size = widget.product['sizes'][index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(label: Text(
                            size.toString()
                          ),
                          backgroundColor: selectedSize==size?Theme.of(context).colorScheme.primary: Color.fromRGBO(245, 247, 249, 1),
                          ),
                        ),
                      );
                    },
                    ),
                ),
                // const SizedBox(height: 8,),
                ElevatedButton(
                  onPressed: onAddToCart, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: const Size(double.infinity, 50 )
                  ),
                  child: const Text('Add to Cart',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                  ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}