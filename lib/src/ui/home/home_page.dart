import 'package:flutter/material.dart';
import 'package:nu_finances/src/utils/values/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorMainPurple,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: const <Widget>[
          Center(
            child: Text(
              "Home Page",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0
              ),
            ),
          )
        ],
      ),
    );
  }
}
