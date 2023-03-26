import 'package:drivers_app/authentication/car_info_screen.dart';
import 'package:drivers_app/authentication/login_screen.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Image.asset('images/1.png'),

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
                decoration:  InputDecoration(
                    labelText: 'Name',
                    labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
                    hintText: 'Lotaaa Nnaaaaa',
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor))),
              ),
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration:  InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
                    hintText: 'Lotaaa Nnaaaaa',
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor))),
              ),
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: phoneTextEditingController,
                keyboardType: TextInputType.number,
                decoration:  InputDecoration(
                    labelText: 'Phone',
                    labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
                    hintText: '000-0000-0000',
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor))),
              ),
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
                    hintText: '***********',
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor))),
              ),
              const SizedBox(height: 10,),


              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColor)
                ),
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (e)=> CarInfoScreen()));
                  },
                  child: const Text('Create Account',
                    style: TextStyle(
                      color: Colors.white
                    ) ,)),

              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (e)=> LoginScreen()));
              },
                  child: const Text('Already have an account? Login here'))

            ],
          ),
        ),
      ),
    );
  }
}
