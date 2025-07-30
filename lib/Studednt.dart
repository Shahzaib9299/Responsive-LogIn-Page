import 'package:flutter/material.dart';

class student_data extends StatefulWidget {
  const student_data({super.key});

  @override
  State<student_data> createState() => _student_dataState();
}

class _student_dataState extends State<student_data> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController Fathernamecontroller = TextEditingController();
  final TextEditingController BatchNocontroller = TextEditingController();
  final TextEditingController Semestercontroller = TextEditingController();
  final TextEditingController CGPAcontroller = TextEditingController();

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
              'Student Data',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40, fontFamily: AutofillHints.organizationName),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: namecontroller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  label: Text('Name'),
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
              controller: Fathernamecontroller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  label: Text('Father Name'),
                  prefixIcon: Icon(Icons.person)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter your father name";
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
                controller: BatchNocontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    label: Text('Batch No'),
                    prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your batch number";
                  }
                  if (!RegExp(r'^\d+$').hasMatch(value)) {
                    return "Only numbers are allowed";
                  }
                  if (value.length < 3) {
                    return "Put minimum 3 digits in Phone Number";
                  }
                  return null;
                }),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: Semestercontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    label: Text('Semester'),
                    prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your phone number";
                  }
                  if (!RegExp(r'^\d+$').hasMatch(value)) {
                    return "Only numbers are allowed";
                  }
                  if (value.length < 8) {
                    return "Put minimum 8 digits in Phone Number";
                  }
                  return null;
                }),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: CGPAcontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    label: Text('CGPA'),
                    prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your CGPA";
                  }
                  if (!RegExp(r'^\d+$').hasMatch(value)) {
                    return "Only numbers are allowed";
                  }
                  if (value.length < 12) {
                    return "Put minimum 4 digits in Phone Number";
                  }
                  return null;
                }),
            ElevatedButton(onPressed: () {}, child: const Text('Submit'))
          ],
        ),
      ))),
    );
  }
}
