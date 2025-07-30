import 'package:flutter/material.dart';
import 'package:my_app/SignUp_page.dart';

class Forget_page extends StatelessWidget {
  const Forget_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MaterialApp(
        home: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Forget Password',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Enter your Email Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Password'),
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Enter your Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp_page(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                  ),
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
