import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:videosIn/src/helpers/util/utility.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'controller/controller.dart';

class SignUpScreen extends WidgetModule {
  @override
  List<Bind> get binds => [Bind((i) => SignUpController())];

  @override
  Widget get view => _SignUpScreen();
}

class _SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ModularState<_SignUpScreen, SignUpController> {
  final controller = SignUpController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: Utility.screenHeight(context),
              child: Observer(
                builder: (_) => Stack(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Welcome to,",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          )),
                      Center(
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Videos",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
                                  ),
                                ),
                                Text(
                                  "In",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Form(
                        key: controller.formKey,
                        child: Column(children: [
                          TextFormField(
                            obscureText: false,
                            onSaved: (email) {
                              controller.email = email;
                            },
                            validator: (email) {
                              return controller.validateEmail(email)
                                  ? null
                                  : "Invalid Email";
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(15.0),
                              labelText: 'Email',
                            ),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            obscureText: true,
                            controller: controller.passwordController,
                            onSaved: (password) {
                              controller.password = password;
                            },
                            validator: (password) {
                              return controller.validatePassword(password)
                                  ? null
                                  : 'Short Password';
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(15.0),
                              labelText: 'password',
                            ),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            obscureText: true,
                            onSaved: (cPassword) {
                              controller.confirmPassword = cPassword;
                            },
                            validator: (cPassword) {
                              return controller
                                      .validateConfirmPassword(cPassword)
                                  ? null
                                  : 'Password do not match';
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(15.0),
                              labelText: 'confirm password',
                            ),
                          ),
                          SizedBox(height: 20),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            onPressed: () {
                              Modular.to.pop();
                            },
                            child: Text("Sign IN"),
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            onPressed: () {
                              controller.formValidate();
                            },
                            child: Text("Register"),
                          )
                        ]),
                      ),
                    ],
                  ),
                  if (controller.isLoading)
                    Container(
                      height: Utility.screenHeight(context),
                      color: Color.fromRGBO(70, 70, 70, 0.3),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
