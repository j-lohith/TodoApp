import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart_app/templates/data/data_provider.dart';
import 'package:shoe_mart_app/templates/home_page.dart';

class ShoeMartApp extends StatelessWidget {
  const ShoeMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => DataProvider(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(246, 178, 216, 6),
          ),
          fontFamily: "Parkinsans",
          inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                color: Color.fromRGBO(54, 52, 52, 0.847),
              ),
              prefixIconColor: Color.fromRGBO(54, 80, 80, 0.847)),
        ),
        home: const HomePage(),
        // home: const DetailsPage(
        //   product: products,
        // ),
        
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
