import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:videosIn/src/helpers/util/utility.dart';
import 'package:videosIn/src/modules/auth/module.dart';

import 'controller/controller.dart';

class SignInScreen extends StatelessWidget {
  final controller = SignInController();
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
                    children: <Widget>[
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            "Welcome to,",
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(5, 5),
                                  color: Colors.black38,
                                  blurRadius: 5),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          height: 200,
                          width: 200,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Videos",
                                  style: TextStyle(fontSize: 30),
                                ),
                                Text(
                                  "In",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Form(
                        key: controller.key,
                        child: Column(
                          children: [
                            TextFormField(
                              obscureText: false,
                              onSaved: (value) {
                                controller.email = value;
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
                              onSaved: (value) {
                                controller.password = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(15.0),
                                labelText: 'password',
                              ),
                            ),
                            SizedBox(height: 10),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              onPressed: () async {
                                controller.validateForm();
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              onPressed: () {
                                Modular.to.pushNamed(AuthModule.SIGNUP_SCREEN);
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
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
