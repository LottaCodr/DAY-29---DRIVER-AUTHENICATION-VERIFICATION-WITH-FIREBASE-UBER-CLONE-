import 'package:drivers_app/authentication/car_info_screen.dart';
import 'package:drivers_app/authentication/login_screen.dart';
import 'package:drivers_app/widgets/progess_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global/global.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  //form validation
  validateForm() {
    if (nameTextEditingController.text.length < 3) {
      Fluttertoast.showToast(msg: 'Name must be at least 3 characters.');
    } else if (phoneTextEditingController.text.length < 11 ||
        phoneTextEditingController.text.length > 11) {
      Fluttertoast.showToast(msg: 'Invalid Phone number');
    } else if (!emailTextEditingController.text.contains('@') ||
        emailTextEditingController.text.contains(',') ||
        emailTextEditingController.text.contains('..') ||
        emailTextEditingController.text.contains('?')) {
      Fluttertoast.showToast(msg: 'Invalid Email');
    } else if (passwordTextEditingController.text.length < 4) {
      Fluttertoast.showToast(msg: 'Password must contain least 6 characters');
    } else {
      saveDriverInfoNow();
    }
  }

  saveDriverInfoNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(message: 'Processing, please wait');
        });

    final User? firebaseUser = (await fAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text.trim(),
                password: passwordTextEditingController.text.trim())
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: 'Error: $msg');
    }))
        .user;
    if (firebaseUser != null) {
      Map driverMap = {
        'id': firebaseUser.uid,
        'name': nameTextEditingController.text.trim(),
        'email': emailTextEditingController.text.trim(),
        'phone': phoneTextEditingController.text.trim(),
      };

      DatabaseReference driversRef =
          FirebaseDatabase.instance.ref().child('drivers');
      driversRef.child(firebaseUser.uid).set(driverMap);

      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: 'Account has been created');
      Navigator.push(context, MaterialPageRoute(builder: (e)=> CarInfoScreen()));
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: 'Account has not been created');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('images/1.png'),
              ),
              const Text(
                'Register as Driver',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: nameTextEditingController,
                decoration: InputDecoration(
                    labelText: 'Name',
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
                controller: emailTextEditingController,
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
                controller: phoneTextEditingController,
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
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    hintText: '***********',
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
              const SizedBox(
                height: 10,
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
                    'Create Account',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (e) => const LoginScreen()));
                  },
                  child: const Text('Already have an account? Login here'))
            ],
          ),
        ),
      ),
    );
  }
}
