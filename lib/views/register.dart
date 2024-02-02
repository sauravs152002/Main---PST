import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mainproject_crop/services/firebase_auth.dart';
import 'package:mainproject_crop/views/emailverfication.dart';
import 'package:mainproject_crop/views/profile_pages/editprofile.dart';


import '../services/database.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _namecontroller = TextEditingController();
  // ignore: unused_field
  bool _isloading = false;
  signuphere() async {
    _isloading = true;
    String s = await FireAuth.signUp(
        emailController: _emailController.text.trim(),
        name: _namecontroller.text.trim(),
        passwordController: _passwordController.text.trim());
    var user = await FirebaseAuth.instance.currentUser;
   // await user!.sendEmailVerification();

    if (s == "success") {
      await FirebaseFirestore.instance
          .collection('Profile')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'name': _namecontroller.text.trim(),
        'email': _emailController.text.trim(),
        'phone': '',
       
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VerificationScreen()),
      );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => EditProfilePage()),
          (route) => false);
    } else {
      setState(() {
        _isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 111, 20, 201),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        color: Color.fromARGB(255, 111, 20, 201),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "Register",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: _namecontroller,
                  decoration: const InputDecoration(
                      filled: true,
                      hintText: "Name",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 179, 176, 186)),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      filled: true,
                      hintText: "Enter Email ",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 179, 176, 186)),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      filled: true,
                      hintText: "Enter password",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 179, 176, 186)),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    signuphere();
                  },
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(300, 50)),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
                  child: const Text("Sign up"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}