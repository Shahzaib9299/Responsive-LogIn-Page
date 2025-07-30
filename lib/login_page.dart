import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ForgetPage.dart';
import 'package:my_app/HomePage.dart';
import 'package:my_app/SignUp_page.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final _formkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final userAuth = FirebaseAuth.instance;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  void login() async {
    try {
      await userAuth.signInWithEmailAndPassword(
        email: emailcontroller.text.toString(),
        password: passwordcontroller.text.toString(),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home_page()));
    } catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Welcome Here",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'this is your login page',
                style: TextStyle(fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                    hintText: "Enter an Email address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.email)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter ann email address";
                  }
                  if (!value.contains("@")) {
                    return "Email is not valid";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                controller: passwordcontroller,
                decoration: const InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    label: Text('Password'),
                    prefixIcon: Icon(Icons.lock)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your password";
                  }
                  if (value.length < 8) {
                    return "Password must be 8 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Forget_page()));
                    },
                    child: const Text(
                      'Forget Password!',
                      style: TextStyle(color: Colors.blue),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    // if (_formkey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Home_page()));
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Dont have an acount?',
                    textAlign: TextAlign.left,
                  ),
                  InkWell(
                    onTap: () {
                      print('Sign Up Clicked');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp_page()));
                    },
                    child: const Text(' Sign up',
                        style: TextStyle(color: Colors.blue),
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
