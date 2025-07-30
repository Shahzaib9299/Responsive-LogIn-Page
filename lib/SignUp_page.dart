import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/HomePage.dart';
import 'package:my_app/login_page.dart';

class SignUp_page extends StatefulWidget {
  const SignUp_page({super.key});

  @override
  State<SignUp_page> createState() => _SignUp_pageState();
}

class _SignUp_pageState extends State<SignUp_page> {
  final _formKey = GlobalKey<FormState>();
  final String Gender = 'Male';
  bool ischeck = false;
  final auth = FirebaseAuth.instance;

  void signUp() async {
    try {
      final user = await auth.createUserWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
      if (user.user != null) {
        print("User data is: ${user.user!.uid}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final dateofbirthpasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Sign Up to your Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: namecontroller,
                  decoration: const InputDecoration(
                      hintText: 'Enter your full name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      label: Text("Name"),
                      prefixIcon: Icon(Icons.person)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your name";
                    }
                    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      return "Only characters are allowed";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                      hintText: 'Enter an Email Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      label: Text("Email"),
                      prefixIcon: Icon(Icons.email)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "email is required";
                    }
                    if (!value.contains("@")) {
                      return "email is not valid";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: phonenumbercontroller,
                    decoration: const InputDecoration(
                        hintText: 'Enter your Phone Number',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        label: Text("Phone Number"),
                        prefixIcon: Icon(Icons.phone)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your phone number";
                      }
                      if (!RegExp(r'^\d+$').hasMatch(value)) {
                        return "Only numbers are allowed";
                      }
                      if (value.length < 12) {
                        return "Put minimum 12 digits in Phone Number";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordcontroller,
                  decoration: const InputDecoration(
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.lock)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "password is empty";
                    }
                    if (value.length < 8) {
                      return "value must be 8 character";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: confirmpasswordcontroller,
                  decoration: const InputDecoration(
                      hintText: 'Confirm your password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      label: Text("Confirm Password"),
                      prefixIcon: Icon(Icons.password)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: dateofbirthpasswordcontroller,
                  decoration: const InputDecoration(
                      hintText: 'Enter your Date of Birth',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      label: Text("DoB"),
                      prefixIcon: Icon(Icons.calendar_month)),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Row(
                //   children: [
                //     Radio(
                //         value: 'Male',
                //         groupValue: Gender,
                //         onChanged: (value) {
                //           print("Male");
                //           setState(() {
                //             Gender = value.toString();
                //           });
                //         }),
                //     Text('Male'),
                //     SizedBox(
                //       height: 10,
                //     ),
                //     Radio(
                //         value: 'Female',
                //         groupValue: Gender,
                //         onChanged: (value) {
                //           print("Female");
                //           setState(() {
                //             Gender = value.toString();
                //           });
                //         }),
                //     Text('Female'),
                //   ],
                // ),
                Row(
                  children: [
                    Checkbox(
                        value: ischeck,
                        onChanged: (value) {
                          print("Checkbox");
                        }),
                    const Text('I agree to the terms and conditions'),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("signUp clicked");
                      signUp();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home_page()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Already have an account',
                      textAlign: TextAlign.left,
                    ),
                    InkWell(
                      onTap: () {
                        print('Sign In Clicked');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const login_page()));
                      },
                      child: const Text(' Log In',
                          style: TextStyle(color: Colors.blue),
                          textAlign: TextAlign.left),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
