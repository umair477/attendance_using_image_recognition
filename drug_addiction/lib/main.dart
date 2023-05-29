import 'package:drug_addiction/core/view_models/pick_images_view_model.dart';
import 'package:drug_addiction/rooter.dart';
import 'package:drug_addiction/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String URL = 'http://192.168.191.157:3000/';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PickImagesViewModel(),
        )
      ],
      child: MaterialApp(
          theme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          title: 'Drug Detection',
          onGenerateRoute: Rooter.generateRoute,
          initialRoute: '/',
          home: SplashScreen()),
    );
  }
}
