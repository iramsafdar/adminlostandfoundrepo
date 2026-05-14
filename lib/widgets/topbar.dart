// import 'package:flutter/material.dart';
//
// class TopBar extends StatelessWidget {
//   final String title;
//
//   const TopBar({
//     super.key,
//     required this.title,
//   });
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       padding: const EdgeInsets.symmetric(horizontal: 25),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             // Very light black shadow
//             // 0.05
//             // = 5% visible.
//             blurRadius: 8,
//             // Makes shadow soft/blurry.
//             offset: const Offset(0, 2),
//           //   SHADOW POSITION
//           //     Moves shadow:0 horizontally :2 vertically downward
//           ),
//         ],
//       ),
//
//       child: Row(
//         children: [
//
//           // 🔷 PAGE TITLE
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 26,
//               fontWeight: FontWeight.bold,
//               color: darkBlue,
//             ),
//           ),
//
//           const Spacer(),
//           // Pushes everything after it to the right side.
//           //in row spacer moves right and column moves bottom
//
//           // 🔍 SEARCH BAR
//           // Container(
//           //   width: 300,
//           //   height: 45,
//           //
//           //   decoration: BoxDecoration(
//           //     color: bgColor,
//           //     borderRadius: BorderRadius.circular(12),
//           //   ),
//           //
//           //   child: const TextField(
//           //     decoration: InputDecoration(
//           //       hintText: "Search...",
//           //       prefixIcon: Icon(Icons.search),
//           //       border: InputBorder.none,
//           //       contentPadding: EdgeInsets.symmetric(vertical: 12),
//           //     ),
//           //   ),
//           // ),
//
//           const SizedBox(width: 20),
//
//           // 🔔 NOTIFICATION ICON
//           Container(
//             padding: const EdgeInsets.all(10),
//
//             decoration: BoxDecoration(
//               color: bgColor,
//               borderRadius: BorderRadius.circular(12),
//             ),
//
//             child: const Icon(
//               Icons.notifications_none,
//               color: darkBlue,
//             ),
//           ),
//
//           const SizedBox(width: 20),
//
//           // 👤 ADMIN PROFILE
//           Row(
//             children: [
//
//               const CircleAvatar(
//                 radius: 20,
//                 backgroundColor: darkBlue,
//                 child: Icon(
//                   Icons.person,
//                   color: Colors.white,
//                 ),
//               ),
//
//               const SizedBox(width: 10),
//
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 // Centers text vertically. main axis
//                 crossAxisAlignment: CrossAxisAlignment.start,
//
//                 children: const [
//
//                   Text(
//                     "Admin",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//
//                   Text(
//                     "Administrator",
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

//
//
// import 'package:flutter/material.dart';
//
// import '../ui/screens/profilescren.dart';
//
// class TopBar extends StatelessWidget {
//
//   final String title;
//
//   const TopBar({
//     super.key,
//     required this.title,
//   });
//
//   static const Color darkBlue =
//   Color(0xFF2A417F);
//
//   static const Color bgColor =
//   Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//
//     // ✅ OVERFLOW FIXES ADDED
//     // 1. LayoutBuilder
//     // 2. Flexible title
//     // 3. Wrap admin text safely
//     // 4. Hide extra spacing problems
//     // 5. Responsive small-screen layout
//
//     return LayoutBuilder(
//
//       builder: (context, constraints) {
//
//         final isSmall =
//             constraints.maxWidth < 700;
//
//         return Container(
//
//           // ✅ HEIGHT AUTO FOR SMALL SCREENS
//           padding:
//           const EdgeInsets.symmetric(
//             horizontal: 25,
//             vertical: 15,
//           ),
//
//           decoration: BoxDecoration(
//
//             color: Colors.white,
//
//             boxShadow: [
//
//               BoxShadow(
//                 color:
//                 Colors.black.withOpacity(0.05),
//
//                 blurRadius: 8,
//
//                 offset:
//                 const Offset(0, 2),
//               ),
//             ],
//           ),
//
//           child: isSmall
//
//           // ✅ SMALL SCREEN LAYOUT
//               ? Column(
//
//             crossAxisAlignment:
//             CrossAxisAlignment.start,
//
//             children: [
//
//               // 🔷 TITLE
//               Text(
//
//                 title,
//
//                 overflow:
//                 TextOverflow.ellipsis,
//
//                 style: const TextStyle(
//
//                   fontSize: 24,
//
//                   fontWeight:
//                   FontWeight.bold,
//
//                   color: darkBlue,
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               // 🔷 RIGHT SECTION
//               Row(
//
//                 children: [
//
//                   // 🔔 NOTIFICATION
//                   // Container(
//                   //
//                   //   padding:
//                   //   const EdgeInsets.all(10),
//                   //
//                   //   decoration:
//                   //   BoxDecoration(
//                   //
//                   //     color: bgColor,
//                   //
//                   //     borderRadius:
//                   //     BorderRadius.circular(
//                   //         12),
//                   //   ),
//                   //
//                   //   child: const Icon(
//                   //
//                   //     Icons.notifications_none,
//                   //
//                   //     color: darkBlue,
//                   //   ),
//                   // ),
//
//                   const SizedBox(width: 15),
//
//                   // 👤 PROFILE
//                   Expanded(
//                     child: GestureDetector(
//
//                       // 🔷 OPEN PROFILE SCREEN ON TAP
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const AdminProfileScreen(),
//                           ),
//                         );
//                       },
//
//                       child: Row(
//                         children: [
//
//                           // 🔷 PROFILE PICTURE (FROM FIREBASE LATER)
//                           const CircleAvatar(
//                             radius: 20,
//                             backgroundColor: darkBlue,
//                             child: Icon(
//                               Icons.person,
//                               color: Colors.white,
//                             ),
//                           ),
//
//                           const SizedBox(width: 10),
//
//                           Expanded(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//
//                               children: const [
//
//                                 Text(
//                                   "Admin",
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//
//                                 Text(
//                                   "Tap to edit profile",
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           )
//
//           // ✅ LARGE SCREEN LAYOUT
//               : Row(
//
//             children: [
//
//               // 🔷 PAGE TITLE
//               Expanded(
//
//                 child: Text(
//
//                   title,
//
//                   overflow:
//                   TextOverflow.ellipsis,
//
//                   style: const TextStyle(
//
//                     fontSize: 26,
//
//                     fontWeight:
//                     FontWeight.bold,
//
//                     color: darkBlue,
//                   ),
//                 ),
//               ),
//
//               const SizedBox(width: 20),
//
//               // 🔔 NOTIFICATION ICON
//               Container(
//
//                 padding:
//                 const EdgeInsets.all(10),
//
//                 decoration: BoxDecoration(
//
//                   color: bgColor,
//
//                   borderRadius:
//                   BorderRadius.circular(12),
//                 ),
//
//                 child: const Icon(
//
//                   Icons.notifications_none,
//
//                   color: darkBlue,
//                 ),
//               ),
//
//               const SizedBox(width: 20),
//
//               // 👤 ADMIN PROFILE
//               Row(
//
//                 children: [
//
//                   const CircleAvatar(
//
//                     radius: 20,
//
//                     backgroundColor:
//                     darkBlue,
//
//                     child: Icon(
//
//                       Icons.person,
//
//                       color: Colors.white,
//                     ),
//                   ),
//
//                   const SizedBox(width: 10),
//
//                   Column(
//
//                     mainAxisAlignment:
//                     MainAxisAlignment.center,
//
//                     crossAxisAlignment:
//                     CrossAxisAlignment.start,
//
//                     children: const [
//
//                       Text(
//
//                         "Admin",
//
//                         style: TextStyle(
//                           fontWeight:
//                           FontWeight.bold,
//                         ),
//                       ),
//
//                       Text(
//
//                         "Administrator",
//
//                         style: TextStyle(
//
//                           fontSize: 12,
//
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// import '../ui/screens/profilescren.dart';
//
// class TopBar extends StatelessWidget {
//   final String title;
//
//   const TopBar({
//     super.key,
//     required this.title,
//   });
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isSmall = constraints.maxWidth < 700;
//
//         return Container(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 25,
//             vertical: 15,
//           ),
//
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 8,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//
//           // =====================================================
//           // SMALL SCREEN LAYOUT
//           // =====================================================
//           child: isSmall
//               ? Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               Text(
//                 title,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: darkBlue,
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               Row(
//                 children: [
//
//                   const SizedBox(width: 15),
//
//                   // 👤 PROFILE (FIXED - NOW CLICKABLE)
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                             const AdminProfileScreen(),
//                           ),
//                         );
//                       },
//
//                       child: Row(
//                         children: const [
//
//                           CircleAvatar(
//                             radius: 20,
//                             backgroundColor: darkBlue,
//                             child: Icon(
//                               Icons.person,
//                               color: Colors.white,
//                             ),
//                           ),
//
//                           SizedBox(width: 10),
//
//                           Expanded(
//                             child: Column(
//                               mainAxisAlignment:
//                               MainAxisAlignment.center,
//                               crossAxisAlignment:
//                               CrossAxisAlignment.start,
//
//                               children: [
//                                 Text(
//                                   "Admin",
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//
//                                 Text(
//                                   "Tap to edit profile",
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           )
//
//           // =====================================================
//           // LARGE SCREEN LAYOUT
//           // =====================================================
//               : Row(
//             children: [
//
//               Expanded(
//                 child: Text(
//                   title,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold,
//                     color: darkBlue,
//                   ),
//                 ),
//               ),
//
//               const SizedBox(width: 20),
//
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: bgColor,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Icon(
//                   Icons.notifications_none,
//                   color: darkBlue,
//                 ),
//               ),
//
//               const SizedBox(width: 20),
//
//               // 👤 PROFILE (FIXED - NOW CLICKABLE)
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                       const AdminProfileScreen(),
//                     ),
//                   );
//                 },
//
//                 child: Row(
//                   children: const [
//
//                     CircleAvatar(
//                       radius: 20,
//                       backgroundColor: darkBlue,
//                       child: Icon(
//                         Icons.person,
//                         color: Colors.white,
//                       ),
//                     ),
//
//                     SizedBox(width: 10),
//
//                     Column(
//                       mainAxisAlignment:
//                       MainAxisAlignment.center,
//                       crossAxisAlignment:
//                       CrossAxisAlignment.start,
//
//                       children: [
//                         Text(
//                           "Admin",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//
//                         Text(
//                           "Administrator",
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../ui/screens/profilescren.dart';
//
// class TopBar extends StatelessWidget {
//   final String title;
//
//   const TopBar({
//     super.key,
//     required this.title,
//   });
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//     final uid = FirebaseAuth.instance.currentUser?.uid;
//
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isSmall = constraints.maxWidth < 700;
//
//         return Container(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 25,
//             vertical: 15,
//           ),
//
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 8,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//
//           // =====================================================
//           // SMALL SCREEN
//           // =====================================================
//           child: isSmall
//               ? Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               Text(
//                 title,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: darkBlue,
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               if (uid == null)
//                 const Text("No user logged in")
//
//               else
//                 StreamBuilder<DocumentSnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection("Users")
//                       .doc(uid)
//                       .snapshots(),
//                   builder: (context, snapshot) {
//
//                     if (!snapshot.hasData) {
//                       return const Text("Loading...");
//                     }
//
//                     final data = snapshot.data!.data()
//                     as Map<String, dynamic>? ??
//                         {};
//
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                             const AdminProfileScreen(),
//                           ),
//                         );
//                       },
//
//                       child: Row(
//                         children: [
//
//                           const CircleAvatar(
//                             radius: 20,
//                             backgroundColor: darkBlue,
//                             child: Icon(
//                               Icons.person,
//                               color: Colors.white,
//                             ),
//                           ),
//
//                           const SizedBox(width: 10),
//
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment:
//                               CrossAxisAlignment.start,
//                               children: [
//
//                                 Text(
//                                   data['name'] ?? "No Name",
//                                   overflow: TextOverflow.ellipsis,
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//
//                                 Text(
//                                   data['email'] ?? "No Email",
//                                   overflow: TextOverflow.ellipsis,
//                                   style: const TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//             ],
//           )
//
//           // =====================================================
//           // LARGE SCREEN
//           // =====================================================
//               : Row(
//             children: [
//
//               Expanded(
//                 child: Text(
//                   title,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold,
//                     color: darkBlue,
//                   ),
//                 ),
//               ),
//
//               const SizedBox(width: 20),
//
//               // Container(
//               //   padding: const EdgeInsets.all(10),
//               //   decoration: BoxDecoration(
//               //     color: bgColor,
//               //     borderRadius: BorderRadius.circular(12),
//               //   ),
//               //   child: const Icon(
//               //     Icons.notifications_none,
//               //     color: darkBlue,
//               //   ),
//               // ),
//
//               const SizedBox(width: 20),
//
//               if (uid == null)
//                 const Text("No user")
//
//               else
//                 StreamBuilder<DocumentSnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection("Users")
//                       .doc(uid)
//                       .snapshots(),
//                   builder: (context, snapshot) {
//
//                     if (!snapshot.hasData) {
//                       return const Text("Loading...");
//                     }
//
//                     final data = snapshot.data!.data()
//                     as Map<String, dynamic>? ??
//                         {};
//
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                             const AdminProfileScreen(),
//                           ),
//                         );
//                       },
//
//                       child: Row(
//                         children: [
//
//                           const CircleAvatar(
//                             radius: 20,
//                             backgroundColor: darkBlue,
//                             child: Icon(
//                               Icons.person,
//                               color: Colors.white,
//                             ),
//                           ),
//
//                           const SizedBox(width: 10),
//
//                           Column(
//                             crossAxisAlignment:
//                             CrossAxisAlignment.start,
//                             children: [
//
//                               Text(
//                                 data['name'] ?? "No Name",
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//
//                               Text(
//                                 data['email'] ?? "No Email",
//                                 style: const TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class TopBar extends StatelessWidget {
//   final String title;
//
//   const TopBar({
//     super.key,
//     required this.title,
//   });
//
//   static const Color darkBlue = Color(0xFF2A417F);
//
//   // =====================================================
//   // 🔷 EDIT PROFILE BOTTOM SHEET
//   // =====================================================
//   void _openEditSheet(BuildContext context, Map<String, dynamic> data, String uid) {
//     final nameController = TextEditingController(text: data['name'] ?? '');
//
//     File? imageFile;
//     String? imageUrl = data['imageUrl'];
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return Padding(
//               padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom,
//                 left: 20,
//                 right: 20,
//                 top: 20,
//               ),
//
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//
//                   const Text(
//                     "Edit Profile",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // =====================================================
//                   // 🔷 PROFILE IMAGE
//                   // =====================================================
//                   GestureDetector(
//                     onTap: () async {
//                       final picked = await ImagePicker().pickImage(
//                         source: ImageSource.gallery,
//                       );
//
//                       if (picked != null) {
//                         setState(() {
//                           imageFile = File(picked.path);
//                         });
//                       }
//                     },
//
//                     child: CircleAvatar(
//                       radius: 45,
//                       backgroundImage: imageFile != null
//                           ? FileImage(imageFile!)
//                           : (imageUrl != null
//                           ? NetworkImage(imageUrl!)
//                           : null) as ImageProvider?,
//                       child: imageFile == null && imageUrl == null
//                           ? const Icon(Icons.camera_alt)
//                           : null,
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // =====================================================
//                   // 🔷 NAME FIELD
//                   // =====================================================
//                   TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(
//                       labelText: "Name",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // =====================================================
//                   // 🔷 SAVE BUTTON
//                   // =====================================================
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: darkBlue,
//                     ),
//
//                     onPressed: () async {
//
//                       String finalImageUrl = imageUrl ?? "";
//
//                       // ===============================
//                       // Upload image if changed
//                       // ===============================
//                       if (imageFile != null) {
//                         final ref = FirebaseStorage.instance
//                             .ref()
//                             .child("profile_images/$uid.jpg");
//
//                         await ref.putFile(imageFile!);
//                         finalImageUrl = await ref.getDownloadURL();
//                       }
//
//                       // ===============================
//                       // Update Firestore
//                       // ===============================
//                       await FirebaseFirestore.instance
//                           .collection("Users")
//                           .doc(uid)
//                           .update({
//                         "name": nameController.text.trim(),
//                         "imageUrl": finalImageUrl,
//                       });
//
//                       Navigator.pop(context);
//                     },
//
//                     child: const Text("Save"),
//                   ),
//
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final uid = FirebaseAuth.instance.currentUser?.uid;
//
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 8,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//
//           child: uid == null
//               ? const Text("No user logged in")
//
//               : StreamBuilder<DocumentSnapshot>(
//             stream: FirebaseFirestore.instance
//                 .collection("Users")
//                 .doc(uid)
//                 .snapshots(),
//
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Text("Loading...");
//               }
//
//               final data =
//                   snapshot.data!.data() as Map<String, dynamic>? ?? {};
//
//               return Row(
//                 children: [
//
//                   // =====================================================
//                   // 🔷 PROFILE IMAGE
//                   // =====================================================
//                   CircleAvatar(
//                     radius: 20,
//                     backgroundImage: data['imageUrl'] != null
//                         ? NetworkImage(data['imageUrl'])
//                         : null,
//                     child: data['imageUrl'] == null
//                         ? const Icon(Icons.person, color: Colors.white)
//                         : null,
//                     backgroundColor: darkBlue,
//                   ),
//
//                   const SizedBox(width: 10),
//
//                   // =====================================================
//                   // 🔷 NAME + EMAIL
//                   // =====================================================
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//
//                         Text(
//                           data['name'] ?? "No Name",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//
//                         Text(
//                           data['email'] ?? "No Email",
//                           style: const TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   // =====================================================
//                   // 🔷 PENCIL ICON (EDIT BUTTON)
//                   // =====================================================
//                   IconButton(
//                     icon: const Icon(Icons.edit, size: 18),
//                     onPressed: () {
//                       _openEditSheet(context, data, uid);
//                     },
//                   ),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class TopBar extends StatelessWidget {
//   final String title;
//
//   const TopBar({
//     super.key,
//     required this.title,
//   });
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   // =====================================================
//   // ✏️ ONLY NEW ADDITION: EDIT BOTTOM SHEET
//   // =====================================================
//   void _openEditSheet(
//       BuildContext context,
//       String uid,
//       Map<String, dynamic> data,
//       ) {
//     final nameController =
//     TextEditingController(text: data['name'] ?? '');
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//             left: 20,
//             right: 20,
//             top: 20,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//
//               const Text(
//                 "Edit Profile",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   labelText: "Name",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: darkBlue,
//                 ),
//
//                 onPressed: () async {
//                   await FirebaseFirestore.instance
//                       .collection("Users")
//                       .doc(uid)
//                       .update({
//                     "name": nameController.text.trim(),
//                   });
//
//                   Navigator.pop(context);
//                 },
//
//                 child: const Text("Save"),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final uid = FirebaseAuth.instance.currentUser?.uid;
//
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isSmall = constraints.maxWidth < 700;
//
//         return Container(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 25,
//             vertical: 15,
//           ),
//
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 8,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//
//           // =====================================================
//           // SMALL SCREEN (UNCHANGED + ONLY EDIT ICON ADDED)
//           // =====================================================
//           child: isSmall
//               ? Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               Text(
//                 title,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: darkBlue,
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               if (uid == null)
//                 const Text("No user logged in")
//               else
//                 StreamBuilder<DocumentSnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection("Users")
//                       .doc(uid)
//                       .snapshots(),
//
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) {
//                       return const Text("Loading...");
//                     }
//
//                     final data = snapshot.data!.data()
//                     as Map<String, dynamic>? ??
//                         {};
//
//                     return Row(
//                       children: [
//
//                         const CircleAvatar(
//                           radius: 20,
//                           backgroundColor: darkBlue,
//                           child: Icon(
//                             Icons.person,
//                             color: Colors.white,
//                           ),
//                         ),
//
//                         const SizedBox(width: 10),
//
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment:
//                             CrossAxisAlignment.start,
//                             children: [
//
//                               Text(
//                                 data['name'] ?? "No Name",
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//
//                               Text(
//                                 data['email'] ?? "No Email",
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//
//                         // =====================================================
//                         // ✏️ ONLY NEW ADDITION: EDIT ICON
//                         // =====================================================
//                         IconButton(
//                           icon: const Icon(Icons.edit, size: 18),
//                           onPressed: () {
//                             _openEditSheet(context, uid!, data);
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//             ],
//           )
//
//           // =====================================================
//           // LARGE SCREEN (UNCHANGED + ONLY EDIT ICON ADDED)
//           // =====================================================
//               : Row(
//             children: [
//
//               Expanded(
//                 child: Text(
//                   title,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold,
//                     color: darkBlue,
//                   ),
//                 ),
//               ),
//
//               const SizedBox(width: 20),
//
//               if (uid == null)
//                 const Text("No user")
//               else
//                 StreamBuilder<DocumentSnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection("Users")
//                       .doc(uid)
//                       .snapshots(),
//
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) {
//                       return const Text("Loading...");
//                     }
//
//                     final data = snapshot.data!.data()
//                     as Map<String, dynamic>? ??
//                         {};
//
//                     return Row(
//                       children: [
//
//                         const CircleAvatar(
//                           radius: 20,
//                           backgroundColor: darkBlue,
//                           child: Icon(
//                             Icons.person,
//                             color: Colors.white,
//                           ),
//                         ),
//
//                         const SizedBox(width: 10),
//
//                         Column(
//                           crossAxisAlignment:
//                           CrossAxisAlignment.start,
//                           children: [
//
//                             Text(
//                               data['name'] ?? "No Name",
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//
//                             Text(
//                               data['email'] ?? "No Email",
//                               style: const TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ],
//                         ),
//
//                         // =====================================================
//                         // ✏️ ONLY NEW ADDITION: EDIT ICON
//                         // =====================================================
//                         IconButton(
//                           icon: const Icon(Icons.edit, size: 18),
//                           onPressed: () {
//                             _openEditSheet(context, uid!, data);
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

//
// import 'dart:io';
// import 'dart:convert';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
//
// class TopBar extends StatelessWidget {
//   final String title;
//
//   const TopBar({
//     super.key,
//     required this.title,
//   });
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   // =====================================================
//   // 🔥 IMAGE UPLOAD (ImageBB)
//   // =====================================================
//   Future<String?> _uploadImageToImageBB(File imageFile) async {
//     String apiKey = "88ede5a6db642da3d588c069490e8601";
//
//     var request = http.MultipartRequest(
//       'POST',
//       Uri.parse("https://api.imgbb.com/1/upload?key=$apiKey"),
//     );
//
//     request.files.add(
//       await http.MultipartFile.fromPath('image', imageFile.path),
//     );
//
//     var response = await request.send();
//
//     if (response.statusCode == 200) {
//       var responseData = await http.Response.fromStream(response);
//       var jsonData = json.decode(responseData.body);
//       return jsonData['data']['url'];
//     }
//
//     return null;
//   }
//
//   // =====================================================
//   // 🔥 EDIT PROFILE DIALOG (FIXED)
//   // =====================================================
//   void _showEditDialog(
//       BuildContext context,
//       String uid,
//       Map<String, dynamic> data,
//       ) {
//     final nameController =
//     TextEditingController(text: data['name'] ?? '');
//
//     File? selectedImage;
//     bool isSaving = false;
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               title: const Text("Edit Profile"),
//
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//
//                   // ================= IMAGE =================
//                   GestureDetector(
//                     onTap: () async {
//                       final picked = await ImagePicker()
//                           .pickImage(source: ImageSource.gallery);
//
//                       if (picked != null) {
//                         setState(() {
//                           selectedImage = File(picked.path);
//                         });
//                       }
//                     },
//
//                     child: CircleAvatar(
//                       radius: 45,
//
//                       backgroundColor: Colors.grey.shade200,
//
//                       // 🔥 FIX: FORCE PROPER IMAGE REFRESH
//                       child: ClipOval(
//                         child: selectedImage != null
//                             ? Image.file(
//                           selectedImage!,
//                           width: 90,
//                           height: 90,
//                           fit: BoxFit.cover,
//                         )
//                             : (data['imageUrl'] != null
//                             ? Image.network(
//                           data['imageUrl'],
//                           width: 90,
//                           height: 90,
//                           fit: BoxFit.cover,
//                         )
//                             : const Icon(Icons.person, size: 40)),
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 15),
//
//                   // ================= NAME =================
//                   TextField(
//                     controller: nameController,
//                     decoration:
//                     const InputDecoration(labelText: "Name"),
//                   ),
//                 ],
//               ),
//
//               actions: [
//
//                 TextButton(
//                   onPressed: isSaving ? null : () => Navigator.pop(context),
//                   child: const Text("Cancel"),
//                 ),
//
//                 ElevatedButton(
//                   onPressed: isSaving
//                       ? null
//                       : () async {
//                     setState(() {
//                       isSaving = true;
//                     });
//
//                     try {
//                       String? imageUrl = data['imageUrl'];
//
//                       // 🔥 upload image if changed
//                       if (selectedImage != null) {
//                         imageUrl =
//                         await _uploadImageToImageBB(selectedImage!);
//                       }
//
//                       await FirebaseFirestore.instance
//                           .collection("Users")
//                           .doc(uid)
//                           .update({
//                         "name": nameController.text.trim(),
//                         "imageUrl": imageUrl,
//                       });
//
//                       // 🔥 SUCCESS MESSAGE (IMPORTANT FIX)
//                       Navigator.pop(context);
//
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text("Profile updated successfully"),
//                           backgroundColor: Colors.green,
//                         ),
//                       );
//                     } catch (e) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text("Update failed: $e"),
//                           backgroundColor: Colors.red,
//                         ),
//                       );
//                     } finally {
//                       setState(() {
//                         isSaving = false;
//                       });
//                     }
//                   },
//
//                   child: isSaving
//                       ? const SizedBox(
//                     height: 18,
//                     width: 18,
//                     child: CircularProgressIndicator(
//                       strokeWidth: 2,
//                     ),
//                   )
//                       : const Text("Save"),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
//
//   // =====================================================
//   // BUILD METHOD (UNCHANGED STRUCTURE)
//   // =====================================================
//   @override
//   Widget build(BuildContext context) {
//
//     final uid = FirebaseAuth.instance.currentUser?.uid;
//
//     return LayoutBuilder(
//       builder: (context, constraints) {
//
//         final isSmall = constraints.maxWidth < 700;
//
//         return Container(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 25,
//             vertical: 15,
//           ),
//
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 8,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//
//           child: isSmall
//               ? Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: darkBlue,
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               uid == null
//                   ? const Text("No user logged in")
//                   : StreamBuilder<DocumentSnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection("Users")
//                     .doc(uid)
//                     .snapshots(),
//
//                 builder: (context, snapshot) {
//
//                   if (!snapshot.hasData) {
//                     return const Text("Loading...");
//                   }
//
//                   final data = snapshot.data!.data()
//                   as Map<String, dynamic>;
//
//                   return Row(
//                     children: [
//
//                       CircleAvatar(
//                         radius: 20,
//                         backgroundImage:
//                         data['imageUrl'] != null
//                             ? NetworkImage(data['imageUrl'])
//                             : null,
//                         child: data['imageUrl'] == null
//                             ? const Icon(Icons.person)
//                             : null,
//                       ),
//
//                       const SizedBox(width: 10),
//
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment:
//                           CrossAxisAlignment.start,
//                           children: [
//
//                             Text(
//                               data['name'] ?? "No Name",
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//
//                             Text(
//                               data['email'] ?? "No Email",
//                               style: const TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       IconButton(
//                         icon: const Icon(
//                           Icons.edit,
//                           color: darkBlue,
//                         ),
//                         onPressed: () {
//                           _showEditDialog(context, uid, data);
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ],
//           )
//               : Row(
//             children: [
//
//               Expanded(
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold,
//                     color: darkBlue,
//                   ),
//                 ),
//               ),
//
//               uid == null
//                   ? const Text("No user")
//                   : StreamBuilder<DocumentSnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection("Users")
//                     .doc(uid)
//                     .snapshots(),
//
//                 builder: (context, snapshot) {
//
//                   if (!snapshot.hasData) {
//                     return const Text("Loading...");
//                   }
//
//                   final data = snapshot.data!.data()
//                   as Map<String, dynamic>;
//
//                   return Row(
//                     children: [
//
//                       CircleAvatar(
//                         radius: 20,
//                         backgroundImage:
//                         data['imageUrl'] != null
//                             ? NetworkImage(data['imageUrl'])
//                             : null,
//                         child: data['imageUrl'] == null
//                             ? const Icon(Icons.person)
//                             : null,
//                       ),
//
//                       const SizedBox(width: 10),
//
//                       Column(
//                         crossAxisAlignment:
//                         CrossAxisAlignment.start,
//                         children: [
//
//                           Text(
//                             data['name'] ?? "No Name",
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//
//                           Text(
//                             data['email'] ?? "No Email",
//                             style: const TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       IconButton(
//                         icon: const Icon(
//                           Icons.edit,
//                           color: darkBlue,
//                         ),
//                         onPressed: () {
//                           _showEditDialog(context, uid, data);
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

//
// import 'dart:typed_data';
// import 'dart:convert';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
//
// class TopBar extends StatelessWidget {
//   final String title;
//
//   const TopBar({
//     super.key,
//     required this.title,
//   });
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   // =====================================================
//   // 🔥 IMAGE UPLOAD (WEB + MOBILE FIXED)
//   // =====================================================
//   Future<String?> _uploadImageToImageBB(Uint8List imageBytes) async {
//     String apiKey = "88ede5a6db642da3d588c069490e8601";
//
//     var request = http.MultipartRequest(
//       'POST',
//       Uri.parse("https://api.imgbb.com/1/upload?key=$apiKey"),
//     );
//
//     request.files.add(
//       http.MultipartFile.fromBytes(
//         'image',
//         imageBytes,
//         filename: "profile.jpg",
//       ),
//     );
//
//     var response = await request.send();
//
//     if (response.statusCode == 200) {
//       var responseData = await http.Response.fromStream(response);
//       var jsonData = json.decode(responseData.body);
//       return jsonData['data']['url'];
//     }
//
//     return null;
//   }
//
//   // =====================================================
//   // 🔥 BOTTOM SHEET EDIT PROFILE
//   // =====================================================
//   void _openEditSheet(
//       BuildContext context,
//       String uid,
//       Map<String, dynamic> data,
//       ) {
//     final nameController =
//     TextEditingController(text: data['name'] ?? '');
//
//     Uint8List? selectedImage;
//     bool isSaving = false;
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return Padding(
//               padding: EdgeInsets.only(
//                 left: 20,
//                 right: 20,
//                 top: 20,
//                 bottom: MediaQuery.of(context).viewInsets.bottom + 20,
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//
//                   const Text(
//                     "Edit Profile",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: darkBlue,
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // =====================================================
//                   // 🔥 IMAGE PICKER (WEB FIXED)
//                   // =====================================================
//                   GestureDetector(
//                     onTap: () async {
//                       final picked = await ImagePicker()
//                           .pickImage(source: ImageSource.gallery);
//
//                       if (picked != null) {
//                         final bytes = await picked.readAsBytes();
//
//                         setState(() {
//                           selectedImage = bytes;
//                         });
//                       }
//                     },
//                     child: CircleAvatar(
//                       radius: 45,
//                       backgroundColor: Colors.grey.shade200,
//                       child: ClipOval(
//                         child: selectedImage != null
//                             ? Image.memory(
//                           selectedImage!,
//                           width: 90,
//                           height: 90,
//                           fit: BoxFit.cover,
//                         )
//                             : (data['imageUrl'] != null
//                             ? Image.network(
//                           data['imageUrl'],
//                           width: 90,
//                           height: 90,
//                           fit: BoxFit.cover,
//                         )
//                             : const Icon(Icons.person, size: 40)),
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 15),
//
//                   // =====================================================
//                   // 🔥 NAME FIELD
//                   // =====================================================
//                   TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(
//                       labelText: "Name",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // =====================================================
//                   // 🔥 SAVE BUTTON
//                   // =====================================================
//                   ElevatedButton(
//                     onPressed: isSaving
//                         ? null
//                         : () async {
//                       setState(() {
//                         isSaving = true;
//                       });
//
//                       try {
//                         String? imageUrl = data['imageUrl'];
//
//                         // upload image if new selected
//                         if (selectedImage != null) {
//                           imageUrl =
//                           await _uploadImageToImageBB(
//                               selectedImage!);
//                         }
//
//                         await FirebaseFirestore.instance
//                             .collection("Users")
//                             .doc(uid)
//                             .update({
//                           "name": nameController.text.trim(),
//                           "imageUrl": imageUrl,
//                         });
//
//                         Navigator.pop(context);
//
//                         ScaffoldMessenger.of(context)
//                             .showSnackBar(
//                           const SnackBar(
//                             content: Text(
//                                 "Profile updated successfully"),
//                             backgroundColor: Colors.green,
//                           ),
//                         );
//                       } catch (e) {
//                         ScaffoldMessenger.of(context)
//                             .showSnackBar(
//                           SnackBar(
//                             content: Text("Error: $e"),
//                             backgroundColor: Colors.red,
//                           ),
//                         );
//                       } finally {
//                         setState(() {
//                           isSaving = false;
//                         });
//                       }
//                     },
//                     child: isSaving
//                         ? const SizedBox(
//                       height: 18,
//                       width: 18,
//                       child: CircularProgressIndicator(
//                         strokeWidth: 2,
//                       ),
//                     )
//                         : const Text("Save"),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   // =====================================================
//   // 🔥 BUILD UI (UNCHANGED STRUCTURE)
//   // =====================================================
//   @override
//   Widget build(BuildContext context) {
//     final uid = FirebaseAuth.instance.currentUser?.uid;
//
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isSmall = constraints.maxWidth < 700;
//
//         return Container(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 25,
//             vertical: 15,
//           ),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 8,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//           child: isSmall
//               ? Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: darkBlue,
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               uid == null
//                   ? const Text("No user logged in")
//                   : StreamBuilder<DocumentSnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection("Users")
//                     .doc(uid)
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return const Text("Loading...");
//                   }
//
//                   final data = snapshot.data!.data()
//                   as Map<String, dynamic>? ??
//                       {};
//
//                   return Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 20,
//                         backgroundImage:
//                         data['imageUrl'] != null
//                             ? NetworkImage(
//                             data['imageUrl'])
//                             : null,
//                         child: data['imageUrl'] == null
//                             ? const Icon(Icons.person)
//                             : null,
//                       ),
//
//                       const SizedBox(width: 10),
//
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment:
//                           CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               data['name'] ?? "No Name",
//                               style: const TextStyle(
//                                 fontWeight:
//                                 FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               data['email'] ?? "No Email",
//                               style: const TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       IconButton(
//                         icon: const Icon(Icons.edit,
//                             color: darkBlue),
//                         onPressed: () {
//                           _openEditSheet(
//                               context, uid, data);
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ],
//           )
//               : Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold,
//                     color: darkBlue,
//                   ),
//                 ),
//               ),
//
//               uid == null
//                   ? const Text("No user")
//                   : StreamBuilder<DocumentSnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection("Users")
//                     .doc(uid)
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return const Text("Loading...");
//                   }
//
//                   final data = snapshot.data!.data()
//                   as Map<String, dynamic>? ??
//                       {};
//
//                   return Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 20,
//                         backgroundImage:
//                         data['imageUrl'] != null
//                             ? NetworkImage(
//                             data['imageUrl'])
//                             : null,
//                         child: data['imageUrl'] == null
//                             ? const Icon(Icons.person)
//                             : null,
//                       ),
//
//                       const SizedBox(width: 10),
//
//                       Column(
//                         crossAxisAlignment:
//                         CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             data['name'] ?? "No Name",
//                             style: const TextStyle(
//                               fontWeight:
//                               FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             data['email'] ?? "No Email",
//                             style: const TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       IconButton(
//                         icon: const Icon(Icons.edit,
//                             color: darkBlue),
//                         onPressed: () {
//                           _openEditSheet(
//                               context, uid, data);
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'dart:typed_data';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class TopBar extends StatelessWidget {
  final String title;

  const TopBar({
    super.key,
    required this.title,
  });

  static const Color darkBlue = Color(0xFF2A417F);
  static const Color bgColor = Color(0xFFEFF5FB);

  // =====================================================
  // 🔥 IMAGE UPLOAD (ImageBB)
  // =====================================================
  Future<String?> _uploadImageToImageBB(Uint8List imageBytes) async {
    String apiKey = "88ede5a6db642da3d588c069490e8601";

    var request = http.MultipartRequest(
      'POST',
      Uri.parse("https://api.imgbb.com/1/upload?key=$apiKey"),
    );

    request.files.add(
      http.MultipartFile.fromBytes(
        'image',
        imageBytes,
        filename: "profile.jpg",
      ),
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await http.Response.fromStream(response);
      var jsonData = json.decode(responseData.body);
      return jsonData['data']['url'];
    }

    return null;
  }

  // =====================================================
  // 🔥 EDIT PROFILE DIALOG (CENTERED FIXED)
  // =====================================================
  void _openEditDialog(
      BuildContext context,
      String uid,
      Map<String, dynamic> data,
      ) {
    final nameController =
    TextEditingController(text: data['name'] ?? '');

    Uint8List? selectedImage;
    bool isSaving = false;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 320,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        const Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: darkBlue,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ================= IMAGE =================
                        GestureDetector(
                          onTap: () async {
                            final picked = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);

                            if (picked != null) {
                              final bytes = await picked.readAsBytes();

                              setState(() {
                                selectedImage = bytes;
                              });
                            }
                          },
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.grey.shade200,
                            child: ClipOval(
                              child: selectedImage != null
                                  ? Image.memory(
                                selectedImage!,
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              )
                                  : (data['imageUrl'] != null
                                  ? Image.network(
                                data['imageUrl'],
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              )
                                  : const Icon(Icons.person, size: 40)),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        // ================= NAME =================
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ================= SAVE =================
                        ElevatedButton(
                          onPressed: isSaving
                              ? null
                              : () async {
                            setState(() {
                              isSaving = true;
                            });

                            try {
                              String? imageUrl = data['imageUrl'];

                              if (selectedImage != null) {
                                imageUrl =
                                await _uploadImageToImageBB(
                                    selectedImage!);
                              }

                              await FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(uid)
                                  .update({
                                "name": nameController.text.trim(),
                                "imageUrl": imageUrl,
                              });

                              Navigator.pop(context);

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Profile updated successfully"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                SnackBar(
                                  content: Text("Error: $e"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }

                            setState(() {
                              isSaving = false;
                            });
                          },
                          child: isSaving
                              ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                              : const Text("Save"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // =====================================================
  // BUILD UI (UNCHANGED STRUCTURE)
  // =====================================================
  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = constraints.maxWidth < 700;

        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),

          child: isSmall
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: darkBlue,
                ),
              ),

              const SizedBox(height: 15),

              uid == null
                  ? const Text("No user logged in")
                  : StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Users")
                    .doc(uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Loading...");
                  }

                  final data = snapshot.data!.data()
                  as Map<String, dynamic>? ??
                      {};

                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: data['imageUrl'] != null
                            ? NetworkImage(data['imageUrl'])
                            : null,
                        child: data['imageUrl'] == null
                            ? const Icon(Icons.person)
                            : null,
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['name'] ?? "No Name",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              data['email'] ?? "No Email",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        icon: const Icon(Icons.edit,
                            color: darkBlue),
                        onPressed: () {
                          _openEditDialog(context, uid, data);
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          )
              : Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: darkBlue,
                  ),
                ),
              ),

              uid == null
                  ? const Text("No user")
                  : StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Users")
                    .doc(uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Loading...");
                  }

                  final data = snapshot.data!.data()
                  as Map<String, dynamic>? ??
                      {};

                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: data['imageUrl'] != null
                            ? NetworkImage(data['imageUrl'])
                            : null,
                        child: data['imageUrl'] == null
                            ? const Icon(Icons.person)
                            : null,
                      ),

                      const SizedBox(width: 10),

                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['name'] ?? "No Name",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            data['email'] ?? "No Email",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                      IconButton(
                        icon: const Icon(Icons.edit,
                            color: darkBlue),
                        onPressed: () {
                          _openEditDialog(context, uid, data);
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}