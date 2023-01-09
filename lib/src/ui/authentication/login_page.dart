import 'package:flutter/material.dart';
import 'package:nu_finances/src/utils/values/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String routeName = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorMainPurple,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: const <Widget>[
          Center(
            child: Text(
              "Login Page",
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
