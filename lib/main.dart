import 'package:flutter/material.dart';
import 'package:min_shop/cart_provider.dart';
import 'package:min_shop/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Mini Shop",
        theme: ThemeData(
          fontFamily: "Manrope",
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
          ),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 23)),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          useMaterial3: true,
        ),
        home: Provider(
            create: (context) => "How are you doing!", child: const HomePage()),
      ),
    );
  }
}
