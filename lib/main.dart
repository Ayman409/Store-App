import 'package:flutter/material.dart';
import 'package:store_app/Screens/home_page.dart';
import 'package:store_app/Screens/update_product_page.dart';
import 'package:store_app/services/get_all_product_services.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProductPage.id: (contex) {
          return UpdateProductPage();
        },
      },
      initialRoute: HomePage.id,
    );
  }
}
