import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adminpanellostandfound/utils/utils.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // Colors
  static const Color darkBlue = Color(0xFF2A417F);
  static const Color goldenOrange = Color(0xFFF09E27);
  final auth = FirebaseAuth.instance;

  // Controller
  final TextEditingController emailController = TextEditingController();
  bool loading = false;

  void _resetPassword() {
    setState(() {
      loading = true;
    });
    auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value) {
      setState(() {
        loading = false;
      });
      Utils().toastMessage2("We have sent you email to recover password, Please check your email");
    },).onError((error, stackTrace) {
      setState(() {
        loading = false;
      });
      Utils().toastMessage(error.toString());
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF5FB), // Light background
      appBar: AppBar(
        iconTheme: IconThemeData(
            color:Color(0xFFEFF5FB) // 👈 change arrow color
        ),
        title: const Text(
          'Forgot Password',
          style: TextStyle(color: Color(0xFFEFF5FB)),
        ),
        backgroundColor: darkBlue,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Card(
            color: Color(0xFFEFF5FB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.lock_reset,
                    color: goldenOrange,
                    size: 60,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Reset Your Password',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: darkBlue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Enter your registered email address and we’ll send you a link to reset your password.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 30),

                  // Email Field
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email, color: darkBlue,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Reset Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _resetPassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: goldenOrange,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: loading ? CircularProgressIndicator(strokeWidth: 3,color: Colors.white,) : const Text(
                        'Send Reset Link',
                        style: TextStyle(fontSize: 16, color: Color(0xFFEFF5FB)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Back to Login
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back to Login',
                      style: TextStyle(color: darkBlue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//updated
