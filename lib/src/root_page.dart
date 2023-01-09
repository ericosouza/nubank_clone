import 'package:flutter/material.dart';
import 'package:nu_finances/src/resources/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nu_finances/src/ui/authentication/login_page.dart';
import 'package:nu_finances/src/ui/home/home_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  static const String routeName = 'root_page';

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final Repository _repository = Repository();
  late Stream<User?> _currentUser;

  @override
  void initState() {
    _currentUser = _repository.onAuthStateChange;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _currentUser,
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          return snapshot.hasData ? HomePage() : LoginPage();
        },
    );
  }
}
