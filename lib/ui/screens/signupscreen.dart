import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:lost_and_found/services/notification_service.dart';
// import 'package:lost_and_found/ui/screens/login_screen.dart';
// import 'package:lost_and_found/ui/screens/chooselostandfoundscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:lost_and_found/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../services/notifications/notificationservice.dart';
import '../../utils/utils.dart';
import 'loginscreen.dart'; // 👈 Added

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool loading = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF5FB),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFEFF5FB)),
        title: Text('Sign Up', style: TextStyle(color: Color(0xFFEFF5FB))),
        backgroundColor: const Color(0xFF2A417F),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2A417F),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 2,
                color: Color(0xFFEFF5FB),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        const SizedBox(height: 25),

                        _buildTextField(
                          controller: _nameController,
                          label: "Full Name",
                          icon: Icons.person,
                          validator: (value) =>
                          value!.isEmpty ? "Please enter your full name" : null,
                        ),
                        const SizedBox(height: 15),

                        _buildTextField(
                          controller: _emailController,
                          label: "Email",
                          icon: Icons.email,
                          validator: (value) {
                            if (value!.isEmpty) return "Please enter your email";

                            final uogEmailPattern =
                            RegExp(r'^\d{8}-\d{3}@uog\.edu\.pk$');

                            if (!uogEmailPattern.hasMatch(value.trim())) {
                              return "Enter a valid UOG ID email.";
                              setState(() {
                                loading = false;
                              });
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        _buildTextField(
                          controller: _passwordController,
                          label: "Password",
                          icon: Icons.lock,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) return "Please enter a password";
                            if (value.length < 6)
                              return "Password must be at least 6 characters";
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        _buildTextField(
                          controller: _confirmPasswordController,
                          label: "Confirm Password",
                          icon: Icons.lock,
                          obscureText: true,
                          validator: (value) {
                            if (value != _passwordController.text)
                              return "Passwords do not match";
                            return null;
                          },
                        ),
                        const SizedBox(height: 25),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF09E27),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () async{
                              NotificationService notificationService = NotificationService();

                              setState(() {
                                loading = true;
                              });
                              if (_formKey.currentState!.validate()) {
                                _auth
                                    .createUserWithEmailAndPassword(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim())
                                    .then((value) async {
                                  final deviceToken = await notificationService.getDeviceToken();
                                  // 👇 Add user email in Firestore
                                  // await FirebaseFirestore.instance
                                  //     .collection('users')
                                  //     .doc(value.user!.uid)
                                  //     .set({
                                  //   'email': _emailController.text.trim(),
                                  //   'name': _nameController.text.trim(),
                                  //   'uid': value.user!.uid,
                                  //   'userDeviceToken' :  deviceToken ?? '',
                                  //
                                  // });
                                  await FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(value.user!.uid)
                                      .set({

                                    'uid': value.user!.uid,
                                    'name': _nameController.text.trim(),
                                    'email': _emailController.text.trim(),
                                    'role': 'admin',
                                    'fcmToken': deviceToken ?? '',
                                    'createdAt': FieldValue.serverTimestamp(),

                                  });

                                  Utils().toastMessage2("Sign up successful");

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                  setState(() {
                                    loading = false;
                                  });
                                }).onError((error, stackTrace) {
                                  setState(() {
                                    loading = false;
                                  });
                                  Utils().toastMessage(error.toString());
                                });
                              }
                            },
                            child: loading
                                ? CircularProgressIndicator(
                                strokeWidth: 3, color: Colors.white)
                                : const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xFFEFF5FB)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Color(0xFF2A417F)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFF2A417F)),
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}