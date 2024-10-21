import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider package
import 'package:storeapp/cart_provider.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/screens/home_page.dart';
import 'package:storeapp/screens/update_product_page.dart';
import 'package:storeapp/screens/product_detailed_screen.dart'; // Import ProductDetailsPage
import 'package:storeapp/screens/cart_screen.dart'; // Import CartScreen
import 'package:storeapp/screens/onboarding_screen.dart'; // Import OnBoardingScreen
import 'package:storeapp/screens/splash_screen.dart'; // Import SplashScreen

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(), // Initialize CartProvider
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id, // Set SplashScreen as initial route
        routes: {
          SplashScreen.id: (context) =>
              SplashScreen(), // Add SplashScreen route
          HomePage.id: (context) => HomePage(),
          UpdateProductPage.id: (context) => UpdateProductPage(),
          OnBoard.id: (context) => OnBoard(),
          ProductDetailsPage.id: (context) => ProductDetailsPage(
                product:
                    ModalRoute.of(context)!.settings.arguments as ProductModel,
              ),
          CartScreen.id: (context) => CartScreen(), // Add CartScreen route
        },
      ),
    );
  }
}
