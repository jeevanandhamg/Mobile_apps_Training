import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
   final String title;
   final String price;
   final String imageUrl;
   final Color backgroundColor;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl, required this.backgroundColor,
    });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: Theme.of(context).textTheme.titleMedium,),
              const SizedBox(height: 5,),
              Text('\$$price',style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 5,),
              Center(child: Image.asset(imageUrl,height: 175,))
            ],
          ),
        ),
      ),
    );
  }
}