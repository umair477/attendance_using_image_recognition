import 'package:drug_addiction/constants.dart';
import 'package:drug_addiction/core/constants/colors.dart';
import 'package:drug_addiction/core/constants/text_styles.dart';
import 'package:drug_addiction/ui/custom_widgets/custom_button.dart';
import 'package:drug_addiction/ui/custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginModel(),
      child: Consumer<LoginModel>(builder: (context, model, child) {
        return Scaffold(
          backgroundColor: backGroundColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Form(
                key: model.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Image.asset(
                        logo,
                        color: whiteColor,
                      ),
                    ),

                    /// [AntonX] logo and [TextFields] Area ...
                    ///
                    textFieldsAndLogo(model),

                    /// [SingUp] Button and [Login] option Area ...
                    ///
                    signUpButton(model),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget textFieldsAndLogo(LoginModel model) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        CustomTextFields(
          icon: Icons.person,
          hintText: 'Username',
          controller: model.emailController,
          onChange: (value) {},
          message: 'Email is required',
        ),
        SizedBox(
          height: 20,
        ),
        CustomTextFields(
          icon: Icons.lock_outline,
          hintText: 'Password',
          controller: model.passwordController,
          onChange: (value) {},
          message: 'Password is required',
          isObsecure: true,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
                // onTap: () => Navigator.pushNamed(context, 'forgotPassword'),
                child: Text('Forgot Password?',
                    style: halfBoldTextStyle.copyWith(color: whiteColor))),
          ],
        ),
      ],
    );
  }

  Widget signUpButton(LoginModel model) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.23,
        ),
        CustomButton(
          title: 'Login',
          textColor: whiteColor,
          buttonColor: activeColor,
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'dashboard');
          },
          elevation: 0.0,
        ),
      ],
    );
  }
}

// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[
//     Text("Don't have an account? "),
//     GestureDetector(
//       onTap: () {
//         Navigator.pushReplacementNamed(context, 'signupScreen');
//       },
//       child: Container(
//           padding: EdgeInsets.only(
//             bottom: 3, // Space between underline and text
//           ),
//           decoration: BoxDecoration(
//               border: Border(
//                   bottom: BorderSide(
//             color: redColor,
//             width: 2.0, // Underline thickness
//           ))),
//           child: Text('Signup',
//               style:
//                   halfBoldTextStyle.copyWith(color: lightBlueColor))),
//     )
//   ],
// )
