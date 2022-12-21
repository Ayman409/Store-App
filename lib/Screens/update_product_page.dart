import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';

import '../widgets/input_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'updateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image;

  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AInputField(
              textInputType: TextInputType.name,
              hint: 'Product Name',
              onchanged: (data) {
                productName = data;
              },
            ),
            const SizedBox(
              height: 11,
            ),
            AInputField(
              textInputType: TextInputType.name,
              hint: 'Description ',
              onchanged: (data) {
                description = data;
              },
            ),
            const SizedBox(
              height: 11,
            ),
            AInputField(
              textInputType: TextInputType.number,
              hint: 'Price',
              onchanged: (data) {
                price = data;
              },
            ),
            const SizedBox(
              height: 11,
            ),
            AInputField(
              onchanged: (data) {
                image = data;
              },
              hint: 'Image',
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  isLoading = true;
                  setState(() {});
                  try {
                    await updateProduct(product);
                    print('Success');
                  } catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
                child: Text('Update'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProduct().updateProduct(
      id: product.id!,
      title: productName == null ? product.title! : productName!,
      price: price == null ? product.price!.toString() : price!,
      description: description == null ? product.description! : description!,
      image: image == null ? product.image! : image!,
      category: product.category.toString(),
    );
  }
}
