import 'package:nu_finances/src/resources/authentication_resource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Repository {
  final _authResources = AuthenticationResource();

  /// Authentication
  Stream<User?> get onAuthStateChange => _authResources.onAuthStateChange;
}