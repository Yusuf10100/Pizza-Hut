import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizza_hut/providers/authentication.dart';
import 'package:pizza_hut/views/home_page.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return Container(
          decoration: BoxDecoration(color: Colors.white24),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Pizza',
                  style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Hut',
                      style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter email',
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: emailController,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: passwordController,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        MaterialButton(
                            color: Colors.red,
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => Provider.of<Authentication>(
                                        context,
                                        listen: false)
                                    .loginIntoAccount(emailController.text,
                                        passwordController.text)
                                    .whenComplete(() {
                                  if (Provider.of<Authentication>(context,
                                              listen: false)
                                          .getErrorMessage ==
                                      '') {
                                    Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                            child: HomePage(),
                                            type: PageTransitionType
                                                .leftToRight));
                                  } else {
                                    SnackBar errorSnackBar = SnackBar(
                                        content: Text(
                                      Provider.of<Authentication>(context,
                                              listen: false)
                                          .getErrorMessage,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ));
                                    Scaffold.of(context)
                                        .showSnackBar(errorSnackBar);
                                  }
                                })),
                        MaterialButton(
                            color: Colors.red,
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => Provider.of<Authentication>(
                                        context,
                                        listen: false)
                                    .createNewAccount(emailController.text,
                                        passwordController.text)
                                    .whenComplete(() {
                                  if (Provider.of<Authentication>(context,
                                              listen: false)
                                          .getErrorMessage ==
                                      '') {
                                    Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                            child: HomePage(),
                                            type: PageTransitionType
                                                .leftToRight));
                                  } else {
                                    SnackBar errorSnackBar = SnackBar(
                                        content: Text(
                                      Provider.of<Authentication>(context,
                                              listen: false)
                                          .getErrorMessage,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ));
                                    Scaffold.of(context)
                                        .showSnackBar(errorSnackBar);
                                  }
                                })),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
