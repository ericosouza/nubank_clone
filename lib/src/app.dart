import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nu_finances/src/root_page.dart';
import 'package:nu_finances/src/ui/authentication/login_page.dart';
import 'package:nu_finances/src/ui/home/home_page.dart';

class NuFinance extends StatelessWidget {
  const NuFinance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nu Finance",
      theme: ThemeData(
        primaryColor: Colors.purpleAccent
      ),
      initialRoute: RootPage.routeName,
      routes: {
        RootPage.routeName: (context) => const RootPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        HomePage.routeName: (context) => const HomePage(),
      },
    );
  }
}
