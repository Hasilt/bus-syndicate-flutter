import 'package:flutter/material.dart';
import 'locator.dart';
import 'routes.dart';
import 'package:hackstudio_flutter/ui/login/login_page.dart';

void main() async {
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) => generateRoute(settings),
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: LoginPage(),
    );
  }
}
