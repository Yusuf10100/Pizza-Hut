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
      body: Container(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  color: Colors.black54,
                  onPressed: () {
                    loginSheet(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                MaterialButton(
                  color: Colors.black54,
                  onPressed: () {
                    registerSheet(context);
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  loginSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(color: Colors.blueGrey.shade700),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter email',
                          hintStyle: TextStyle(color: Colors.white)),
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Enter password',
                          hintStyle: TextStyle(color: Colors.white)),
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MaterialButton(
                      color: Colors.red,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () =>
                          Provider.of<Authentication>(context, listen: false)
                              .loginIntoAccount(
                                  emailController.text, passwordController.text)
                              .whenComplete(() {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: HomePage(),
                                    type: PageTransitionType.leftToRight));
                          }))
                ],
              ),
            ),
          );
        });
  }

  registerSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(color: Colors.blueGrey.shade700),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter email',
                          hintStyle: TextStyle(color: Colors.white)),
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Enter password',
                          hintStyle: TextStyle(color: Colors.white)),
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MaterialButton(
                      color: Colors.red,
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () =>
                          Provider.of<Authentication>(context, listen: false)
                              .createNewAccount(
                                  emailController.text, passwordController.text)
                              .whenComplete(() {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: HomePage(),
                                    type: PageTransitionType.leftToRight));
                          }))
                ],
              ),
            ),
          );
        });
  }
}
