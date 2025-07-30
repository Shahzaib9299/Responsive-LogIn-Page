import 'package:flutter/material.dart';
import 'package:my_app/Studednt.dart';

class Teachers_data extends StatefulWidget {
  const Teachers_data({super.key});

  @override
  State<Teachers_data> createState() => _Teachers_data();
}

class _Teachers_data extends State<Teachers_data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
            child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Faculty Data',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40, fontFamily: AutofillHints.organizationName),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    label: Text("Teacher Name"),
                    prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    label: Text('Education'),
                    prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    label: Text('Specialization'),
                    prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    InkWell(onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const student_data()));
                    });
                  },
                  child: const Text('Store')),
            ],
          ),
        )),
      ),
    );
  }
}
