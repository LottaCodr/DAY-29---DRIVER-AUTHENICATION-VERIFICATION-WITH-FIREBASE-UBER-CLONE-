import 'package:drivers_app/authentication/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                    //Navigator.push(context, MaterialPageRoute(builder: (e)=> CarInfoScreen()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (e) => SignupScreen()));
                  },
                  child: const Text("Don't an account? Login here"))
            ],
          ),
        ),
      ),
    );
  }
}
