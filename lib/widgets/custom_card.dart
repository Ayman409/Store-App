import 'package:flutter/material.dart';
import 'package:store_app/Screens/update_product_page.dart';
import 'package:store_app/models/product_model.dart';

class CusomCard extends StatelessWidget {
  CusomCard({
    required this.product,
    Key? key,
  }) : super(key: key);
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, UpdateProductPage.id,
          arguments: product),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 150,
            width: 190,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 50,
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  offset: Offset(10, 10)),
            ]),
            child: Card(
              elevation: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title!.substring(0, 8),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 1,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${product.price}',
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            bottom: 90,
            child: Image.network(
              product.image!,
              width: 100,
              // 'https://purepng.com/public/uploads/large/purepng.com-puma-travel-bagclothingtravel-bagbag-object-travel-traveller-tourist-luggage-trip-vacation-journey-631522329672o7r0r.png',
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
