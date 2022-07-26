import 'package:fortune_telling/abstract_implementation/service/base_service.dart';
import 'package:fortune_telling/abstract_implementation/service/firebase_service.dart';
import 'package:fortune_telling/abstract_implementation/service/test_service.dart';

void main() {
  FirebaseService firebase = FirebaseService();

  firebase.createUser(UserModel());
  firebase.deleteUser("723482673487");
}
