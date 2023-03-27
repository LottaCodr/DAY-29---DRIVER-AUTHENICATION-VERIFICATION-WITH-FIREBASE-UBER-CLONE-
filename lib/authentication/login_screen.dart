import 'package:drivers_app/authentication/signup_screen.dart';
import 'package:drivers_app/splash_screen/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global/global.dart';
import '../widgets/progess_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  validateForm() {
    if (!emailController.text.contains('@') ||
        emailController.text.contains(',') ||
        emailController.text.contains('..') ||
        emailController.text.contains('?')) {
      Fluttertoast.showToast(msg: 'Invalid Email');
    } else if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Password must contain least 6 characters');
    } else {
      loginDriverNow();
    }
  }

  loginDriverNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(message: 'Processing, please wait');
        });

    final User? firebaseUser = (await fAuth
            .signInWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim())
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: 'Error: $msg');
    }))
        .user;
    if (firebaseUser != null) {
      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: 'Login Successful');
      Navigator.push(
          context, MaterialPageRoute(builder: (e) => const MySplashScreen()));
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: 'Error occured during login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset('images/1.png'),
              const Text(
                'Login as Driver',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    hintText: 'Lotaaa Nnaaaaa',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor))),
              ),
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: passwordController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Phone',
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    hintText: '000-0000-0000',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor))),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColor)),
                  onPressed: () {
                    validateForm();
                    //Navigator.push(context, MaterialPageRoute(builder: (e)=> CarInfoScreen()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (e) => const SignupScreen()));
                  },
                  child: const Text("Don't an account? Login here"))
            ],
          ),
        ),
      ),
    );
  }
}
