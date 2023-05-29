import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginModel();

//   loginWithEmailPassword() async {
//     setState(ViewState.busy);
//     authResult = await _authService.loginWithEmailPassword(
//         email: users.email, password: users.password);
// //     if (authResult.status) {
// //       final newToken = await FirebaseMessaging().getToken();
// //       _dbService.updateFcmToken(newToken, authResult.user.uid);
// //       FirebaseMessaging().subscribeToTopic('students');
// // //      /// if true, login success
// // ////      final token = await FirebaseMessaging().getToken();
// // ////      _dbService.updateFcmToken(token, authResult.user.uid);
// //     }
//     setState(ViewState.idle);
//   }
}
