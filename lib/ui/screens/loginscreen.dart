// import 'package:adminpanellostandfound/ui/screens/dashboardscreen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:lost_and_found/ui/screens/chooselostandfoundscreen.dart';
// import 'package:adminpanellostandfound/ui/screens/signupscreen.dart';
// import 'package:adminpanellostandfound/utils/utils.dart';
// // import '../../services/notification_service.dart';
// // import 'forgotpassword.dart';
// // import 'BottomNavScreen.dart';
// import '../../services/notificationservice.dart';
// import 'forgotpasswordscreen.dart';
//
// class LoginScreen extends StatefulWidget {
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool loading = false;
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color goldenOrange = Color(0xFFF09E27);
//
//   final _auth = FirebaseAuth.instance;
//   final _db = FirebaseFirestore.instance;
//
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   bool _obscurePassword = true;
//   final _formKey = GlobalKey<FormState>();
//
//   void Login() {
//     setState(() {
//       loading = true;
//     });
//
//     _auth
//         .signInWithEmailAndPassword(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//     )
//         .then((value) async {
//       setState(() {
//         loading = false;
//       });
//
//       // ✅ Update / Store user email in Users collection
//       final user = _auth.currentUser;
//       if (user != null) {
//         // String? fcmToken = await FirebaseMessaging.instance.getToken();
//         NotificationService notificationService = NotificationService();
//         final deviceToken = await notificationService.getDeviceToken();
//
//         print("✅deviccccccce token ${deviceToken}");
//         // await _db.collection("Users").doc(user.uid).set({
//         //   "uid": user.uid,
//         //   "email": user.email,
//         //   "lastLogin": DateTime.now(),
//         //   "fcmToken": deviceToken ?? '',
//         // }, SetOptions(merge: true)); // merge avoids overwriting other fields
//         await _db.collection("Users").doc(user.uid).set({
//
//           "uid": user.uid,
//           "email": user.email,
//           "lastLogin": FieldValue.serverTimestamp(),
//           "fcmToken": deviceToken ?? '',
//
//         }, SetOptions(merge: true));
//         //Merge ensures that:
//         // Only the provided fields (uid, email, lastLogin) are updated.
//         // Other fields in the document are not overwritten.
//       }
//
//       Utils().toastMessage2("Login Successful.");
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => DashboardScreen()),
//       );
//     })
//         .onError((error, stackTrace) {
//       setState(() {
//         loading = false;
//       });
//       Utils().toastMessage(error.toString());
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFEFF5FB),
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Color(0xFFEFF5FB)),
//         title: const Text('Login', style: TextStyle(color: Color(0xFFEFF5FB))),
//         backgroundColor: darkBlue,
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Card(
//             color: Color(0xFFEFF5FB),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             elevation: 6,
//             child: Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const SizedBox(height: 30),
//
//                     // Email field
//                     TextFormField(
//                       controller: emailController,
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         prefixIcon: const Icon(
//                           Icons.email,
//                           color: Color(0xFF2A417F),
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         if (!RegExp(r'^\d{8}-\d{3}@uog\.edu\.pk$')
//                             .hasMatch(value)) {
//                           return 'Enter a valid UOG ID email';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 20),
//
//                     // Password field
//                     TextFormField(
//                       controller: passwordController,
//                       obscureText: _obscurePassword,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         prefixIcon: const Icon(
//                           Icons.lock,
//                           color: Color(0xFF2A417F),
//                         ),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _obscurePassword
//                                 ? Icons.visibility_off
//                                 : Icons.visibility,
//                             color: Color(0xFF2A417F),
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _obscurePassword = !_obscurePassword;
//                             });
//                           },
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your password';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 15),
//
//                     // Forgot password link
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ForgotPassword(),
//                             ),
//                           );
//                         },
//                         child: Text(
//                           'Forgot Password?',
//                           style: TextStyle(color: darkBlue),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//
//                     // Login button
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//
//                           if (_formKey.currentState!.validate()) {
//                             Login();
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: goldenOrange,
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: loading
//                             ? CircularProgressIndicator(
//                           strokeWidth: 3,
//                           color: Colors.white,
//                         )
//                             : const Text(
//                           'Login',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Color(0xFFEFF5FB),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//
//                     // Register link
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text("Don't have an account? "),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => Signup()),
//                             );
//                           },
//                           child: Text(
//                             'Sign up',
//                             style: TextStyle(
//                               color: darkBlue,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../../services/notificationservice.dart';
// import '../../utils/utils.dart';
// import 'dashboardscreen.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool loading = false;
//
//   final _auth = FirebaseAuth.instance;
//   final _db = FirebaseFirestore.instance;
//
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   final _formKey = GlobalKey<FormState>();
//
//   // 🔐 LOGIN FUNCTION
//   void login() async {
//     setState(() {
//       loading = true;
//     });
//
//     try {
//       // STEP 1: Firebase Auth login
//       UserCredential result = await _auth.signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//
//       User? user = result.user;
//
//       if (user == null) {
//         throw Exception("Login failed");
//       }
//
//       // STEP 2: Firestore reference
//       final docRef = _db.collection("Users").doc(user.uid);
//       final docSnapshot = await docRef.get();
//
//       // STEP 3: Get FCM token (automatic)
//       NotificationService notificationService = NotificationService();
//       final deviceToken = await notificationService.getDeviceToken();
//
//       // STEP 4: If user document doesn't exist → create it
//       if (!docSnapshot.exists) {
//         await docRef.set({
//           "uid": user.uid,
//           "email": user.email,
//           "name": "Unknown",
//           "role": "admin",
//           "createdAt": FieldValue.serverTimestamp(),
//           "lastLogin": FieldValue.serverTimestamp(),
//           "fcmToken": deviceToken ?? "",
//         });
//       } else {
//         // STEP 5: Update login info only
//         await docRef.set({
//           "lastLogin": FieldValue.serverTimestamp(),
//           "fcmToken": deviceToken ?? "",
//         }, SetOptions(merge: true));
//       }
//
//       // STEP 6: Fetch updated role
//       // final userData = await docRef.get();
//       // String role = userData["role"];
// // STEP 6: Fetch updated user data
//       DocumentSnapshot doccSnapshot = await docRef.get();
//
//       if (!doccSnapshot.exists) {
//         throw Exception("User document does not exist");
//       }
//
//       Map<String, dynamic> userData =
//       docSnapshot.data() as Map<String, dynamic>;
//
//       String role = userData["role"] ?? "user";
//       // STEP 7: Role-based navigation
//       if (role == "admin") {
//         // Admin dashboard
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => DashboardScreen()),
//         );
//       } else {
//         // User dashboard (you can change later)
//         // Navigator.pushReplacement(
//         //   context,
//         //   MaterialPageRoute(builder: (context) => DashboardScreen()),
//         // );
//       }
//
//       Utils().toastMessage2("Login Successful");
//
//     } catch (e) {
//       Utils().toastMessage(e.toString());
//     } finally {
//       setState(() {
//         loading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFEFF5FB),
//
//       appBar: AppBar(
//         title: const Text("Login"),
//         backgroundColor: const Color(0xFF2A417F),
//       ),
//
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//
//           child: Form(
//             key: _formKey,
//
//             child: Column(
//               children: [
//
//                 // 📧 EMAIL FIELD
//                 TextFormField(
//                   controller: emailController,
//                   decoration: const InputDecoration(
//                     labelText: "Email",
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Enter email";
//                     }
//                     return null;
//                   },
//                 ),
//
//                 const SizedBox(height: 15),
//
//                 // 🔒 PASSWORD FIELD
//                 TextFormField(
//                   controller: passwordController,
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: "Password",
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Enter password";
//                     }
//                     return null;
//                   },
//                 ),
//
//                 const SizedBox(height: 25),
//
//                 // 🔘 LOGIN BUTTON
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         login();
//                       }
//                     },
//                     child: loading
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Text("Login"),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/notifications/notificationservice.dart';
import '../../utils/utils.dart';
import 'dashboardscreen.dart';
import 'forgotpasswordscreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;

  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // 🎨 SAME UI COLORS AS YOUR FIRST SCREEN
  static const Color darkBlue = Color(0xFF2A417F);
  static const Color goldenOrange = Color(0xFFF09E27);
  static const Color bgColor = Color(0xFFEFF5FB);

  // 🔐 LOGIN FUNCTION (UNCHANGED LOGIC)
  void login() async {
    setState(() {
      loading = true;
    });

    try {
      // STEP 1: Firebase Auth login
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      User? user = result.user;

      if (user == null) {
        throw Exception("Login failed");
      }

      // STEP 2: Firestore reference
      final docRef = _db.collection("Users").doc(user.uid);
      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        throw Exception("User data not found");
      }

      Map<String, dynamic> userData =
      docSnapshot.data() as Map<String, dynamic>;

      // ✅ STEP 3: BLOCK CHECK (IMPORTANT PART)
      String status =
      (userData["status"] ?? "active").toString().toLowerCase();

      if (status == "blocked") {
        await _auth.signOut(); // important: immediately logout

        Utils().toastMessage("Your account is blocked by admin");

        setState(() {
          loading = false;
        });
        return; // stop login flow
      }

      // STEP 4: FCM token
      NotificationService notificationService = NotificationService();
      final deviceToken = await notificationService.getDeviceToken();

      // STEP 5: update login info
      await docRef.set({
        "lastLogin": FieldValue.serverTimestamp(),
        "fcmToken": deviceToken ?? "",
      }, SetOptions(merge: true));

      // STEP 6: role check
      String role =
      (userData["role"] ?? "user").toString().toLowerCase();

      if (role == "admin") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      } else {
        Utils().toastMessage("Access denied: not admin");
        await _auth.signOut();
      }

      Utils().toastMessage2("Login Successful");

    } catch (e) {
      Utils().toastMessage(e.toString());
    } finally {
      setState(() {
        loading = false;
      });
    }
  }
  // void login() async {
  //   setState(() {
  //     loading = true;
  //   });
  //
  //   try {
  //     // STEP 1: Firebase Auth login
  //     UserCredential result = await _auth.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     );
  //
  //     User? user = result.user;
  //
  //     if (user == null) {
  //       throw Exception("Login failed");
  //     }
  //
  //     // STEP 2: Firestore reference
  //     final docRef = _db.collection("Users").doc(user.uid);
  //     print(user.uid);
  //     final docSnapshot = await docRef.get();
  //
  //     // STEP 3: FCM token
  //     NotificationService notificationService = NotificationService();
  //     final deviceToken = await notificationService.getDeviceToken();
  //
  //     // STEP 4: create or update doc
  //     if (!docSnapshot.exists) {
  //       // await docRef.set({
  //       //   "uid": user.uid,
  //       //   "email": user.email,
  //       //   "name": "Unknown",
  //       //   "role": "admin",
  //       //   "createdAt": FieldValue.serverTimestamp(),
  //       //   "lastLogin": FieldValue.serverTimestamp(),
  //       //   "fcmToken": deviceToken ?? "",
  //       // });
  //     } else {
  //       await docRef.set({
  //         "lastLogin": FieldValue.serverTimestamp(),
  //         "fcmToken": deviceToken ?? "",
  //       }, SetOptions(merge: true));
  //     }
  //
  //     // STEP 5: fetch role safely
  //     DocumentSnapshot updatedSnapshot = await docRef.get();
  //
  //     if (!updatedSnapshot.exists) {
  //       throw Exception("User document does not exist");
  //     }
  //
  //     Map<String, dynamic> userData =
  //     updatedSnapshot.data() as Map<String, dynamic>;
  //
  //     String role = (userData["role"] ?? "user").toString().trim().toLowerCase();
  //     print("RAW ROLE FROM FIRESTORE: '${userData["role"]}'");
  //     // STEP 6: navigation
  //     if (role == "admin") {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => DashboardScreen()),
  //       );
  //     }
  //     else
  //       {
  //         Utils().toastMessage("Access denied: not admin");
  //       }
  //
  //     Utils().toastMessage2("Login Successful");
  //   } catch (e) {
  //     Utils().toastMessage(e.toString());
  //   } finally {
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        iconTheme: const IconThemeData(color: bgColor),
        title: const Text(
          "Login",
          style: TextStyle(color: bgColor),
        ),
        backgroundColor: darkBlue,
        centerTitle: true,
        elevation: 0,
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Card(
            color: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 6,

            child: Padding(
              padding: const EdgeInsets.all(24.0),

              child: Form(
                key: _formKey,

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    const SizedBox(height: 20),

                    // 📧 EMAIL FIELD
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: const Icon(
                          Icons.email,
                          color: darkBlue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter email";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 15),

                    // 🔒 PASSWORD FIELD
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: darkBlue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

// 🔑 FORGOT PASSWORD
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {

                          // Navigate to forgot password screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ),
                          );

                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: darkBlue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    const SizedBox(height: 25),

                    // 🔘 LOGIN BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            login();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: goldenOrange,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: loading
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : const Text(
                          "Login",
                          style: TextStyle(color: bgColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}