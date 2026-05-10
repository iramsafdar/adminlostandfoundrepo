// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class UsersScreen extends StatelessWidget {
//   const UsersScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//
//         children: [
//
//           // 🔷 HEADER
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//             children: [
//
//               const Text(
//                 "Manage Users",
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//
//               ElevatedButton.icon(
//                 onPressed: () {},
//
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: orange,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 18,
//                     vertical: 14,
//                   ),
//
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//
//                 icon: const Icon(
//                   Icons.person_add,
//                   color: Colors.white,
//                 ),
//
//                 label: const Text(
//                   "Add User",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 25),
//
//           // 🔍 SEARCH BAR
//           Container(
//             width: 350,
//             height: 50,
//
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 6,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//
//             child: const TextField(
//               decoration: InputDecoration(
//                 hintText: "Search users...",
//                 prefixIcon: Icon(Icons.search),
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.symmetric(vertical: 14),
//               ),
//             ),
//           ),
//
//           const SizedBox(height: 30),
//
//           // 🔷 USERS TABLE
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(20),
//
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 8,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//
//
//             // Flutter table widget.
//                        // Used for rows + columns.
//             child:
//             // DataTable(
//             //   //Changes header row background color.
//             //   headingRowColor: MaterialStateProperty.all(
//             //     bgColor,
//             //   ),
//             //
//             //   columns: const [
//             //     // datacolumn: Creates table column.
//             //     DataColumn(
//             //       label: Text(
//             //         "Name",
//             //         style: TextStyle(fontWeight: FontWeight.bold),
//             //       ),
//             //     ),
//             //
//             //     DataColumn(
//             //       label: Text(
//             //         "Email",
//             //         style: TextStyle(fontWeight: FontWeight.bold),
//             //       ),
//             //     ),
//             //
//             //     DataColumn(
//             //       label: Text(
//             //         "Posts",
//             //         style: TextStyle(fontWeight: FontWeight.bold),
//             //       ),
//             //     ),
//             //
//             //     DataColumn(
//             //       label: Text(
//             //         "Claims",
//             //         style: TextStyle(fontWeight: FontWeight.bold),
//             //       ),
//             //     ),
//             //
//             //     DataColumn(
//             //       label: Text(
//             //         "Status",
//             //         style: TextStyle(fontWeight: FontWeight.bold),
//             //       ),
//             //     ),
//             //
//             //     DataColumn(
//             //       label: Text(
//             //         "Actions",
//             //         style: TextStyle(fontWeight: FontWeight.bold),
//             //       ),
//             //     ),
//             //   ],
//             //
//             //   rows: [
//             //
//             //     // _buildUserRow(
//             //     //   name: "Ali",
//             //     //   email: "ali@gmail.com",
//             //     //   posts: "12",
//             //     //   claims: "4",
//             //     //   status: "Active",
//             //     // ),
//             //     //
//             //     // _buildUserRow(
//             //     //   name: "Sara",
//             //     //   email: "sara@gmail.com",
//             //     //   posts: "7",
//             //     //   claims: "2",
//             //     //   status: "Active",
//             //     // ),
//             //     //
//             //     // _buildUserRow(
//             //     //   name: "Ahmed",
//             //     //   email: "ahmed@gmail.com",
//             //     //   posts: "15",
//             //     //   claims: "6",
//             //     //   status: "Blocked",
//             //     // ),
//             //   ],
//             // ),
//             StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('Users')
//                   .snapshots(),
//
//               builder: (context, snapshot) {
//
//                 if (snapshot.connectionState ==
//                     ConnectionState.waiting) {
//
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//
//                 if (!snapshot.hasData ||
//                     snapshot.data!.docs.isEmpty) {
//
//                   return const Center(
//                     child: Text("No users found"),
//                   );
//                 }
//
//                 final users = snapshot.data!.docs;
//
//                 return Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(20),
//
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         blurRadius: 8,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//
//                   child: DataTable(
//
//                     headingRowColor:
//                     MaterialStateProperty.all(bgColor),
//
//                     columns: const [
//
//                       DataColumn(
//                         label: Text(
//                           "Name",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//
//                       DataColumn(
//                         label: Text(
//                           "Email",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//
//                       DataColumn(
//                         label: Text(
//                           "Role",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//
//                       DataColumn(
//                         label: Text(
//                           "Status",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//
//                       DataColumn(
//                         label: Text(
//                           "Actions",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                     // Go through every item in users one by one,
//                     rows: users.map((doc) {
//
//                       final data =
//                       doc.data() as Map<String, dynamic>;
//
//                       return DataRow(
//                         cells: [
//
//                           // NAME
//                           DataCell(
//                             Text(data['name'] ?? ''),
//                           ),
//
//                           // EMAIL
//                           DataCell(
//                             Text(data['email'] ?? ''),
//                           ),
//
//                           // ROLE
//                           DataCell(
//                             Text(data['role'] ?? 'user'),
//                           ),
//
//                           // STATUS
//                           DataCell(
//
//                             Container(
//                               padding:
//                               const EdgeInsets.symmetric(
//                                 horizontal: 12,
//                                 vertical: 6,
//                               ),
//
//                               decoration: BoxDecoration(
//                                 color:
//                                 Colors.green.withOpacity(0.15),
//
//                                 borderRadius:
//                                 BorderRadius.circular(20),
//                               ),
//
//                               child: const Text(
//                                 "Active",
//
//                                 style: TextStyle(
//                                   color: Colors.green,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                           // ACTIONS
//                           DataCell(
//
//                             Row(
//                               children: [
//
//                                 IconButton(
//                                   onPressed: () {},
//                                   icon: const Icon(
//                                     Icons.visibility,
//                                     color: Colors.blue,
//                                   ),
//                                 ),
//
//                                 IconButton(
//                                   onPressed: () {},
//                                   icon: const Icon(
//                                     Icons.block,
//                                     color: Colors.orange,
//                                   ),
//                                 ),
//
//                                 IconButton(
//                                   onPressed: () {},
//                                   icon: const Icon(
//                                     Icons.delete,
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//
//                     }).toList(),
//                   ),
//                 );
//               },
//             )
//           ),
//         ],
//       ),
//     );
//   }
//
//   // 🔷 USER ROW
//   DataRow _buildUserRow({
//     required String name,
//     required String email,
//     required String posts,
//     required String claims,
//     required String status,
//   }) {
//
//     return DataRow(
//       cells: [
//
//         DataCell(Text(name)),
//
//         DataCell(Text(email)),
//
//         DataCell(Text(posts)),
//
//         DataCell(Text(claims)),
//
//         DataCell(
//
//           Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 12,
//               vertical: 6,
//             ),
//
//             decoration: BoxDecoration(
//               color: status == "Active"
//                   ? Colors.green.withOpacity(0.15)
//                   : Colors.red.withOpacity(0.15),
//
//               borderRadius: BorderRadius.circular(20),
//             ),
//
//             child: Text(
//               status,
//               style: TextStyle(
//                 color: status == "Active"
//                     ? Colors.green
//                     : Colors.red,
//
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//
//         DataCell(
//
//           Row(
//             children: [
//
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.visibility,
//                   color: Colors.blue,
//                 ),
//               ),
//
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.block,
//                   color: Colors.orange,
//                 ),
//               ),
//
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.delete,
//                   color: Colors.red,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class UsersScreen extends StatefulWidget {
//   const UsersScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   State<UsersScreen> createState() => _UsersScreenState();
// }
//
// class _UsersScreenState extends State<UsersScreen> {
//
//   // 🔍 SEARCH CONTROLLER
//   final TextEditingController searchController =
//   TextEditingController();
//
//   String searchQuery = "";
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25),
//
//       child: Column(
//         crossAxisAlignment:
//         CrossAxisAlignment.start,
//
//         children: [
//
//           // 🔷 HEADER
//           Row(
//             mainAxisAlignment:
//             MainAxisAlignment.spaceBetween,
//
//             children: [
//
//               const Text(
//                 "Manage Users",
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//
//               ElevatedButton.icon(
//                 onPressed: () {},
//
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor:
//                   UsersScreen.orange,
//
//                   padding:
//                   const EdgeInsets.symmetric(
//                     horizontal: 18,
//                     vertical: 14,
//                   ),
//
//                   shape: RoundedRectangleBorder(
//                     borderRadius:
//                     BorderRadius.circular(12),
//                   ),
//                 ),
//
//                 icon: const Icon(
//                   Icons.person_add,
//                   color: Colors.white,
//                 ),
//
//                 label: const Text(
//                   "Add User",
//                   style:
//                   TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 25),
//
//           // 🔍 SEARCH BAR
//           Container(
//             width: 350,
//             height: 50,
//
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius:
//               BorderRadius.circular(12),
//
//               boxShadow: [
//                 BoxShadow(
//                   color:
//                   Colors.black.withOpacity(0.05),
//
//                   blurRadius: 6,
//
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//
//             child: TextField(
//               controller: searchController,
//
//               decoration: const InputDecoration(
//                 hintText: "Search users...",
//
//                 prefixIcon:
//                 Icon(Icons.search),
//
//                 border: InputBorder.none,
//
//                 contentPadding:
//                 EdgeInsets.symmetric(
//                   vertical: 14,
//                 ),
//               ),
//
//               onChanged: (value) {
//
//                 setState(() {
//                   searchQuery =
//                       value.toLowerCase();
//                 });
//               },
//             ),
//           ),
//
//           const SizedBox(height: 30),
//
//           // 🔷 USERS TABLE
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(20),
//
//             decoration: BoxDecoration(
//               color: Colors.white,
//
//               borderRadius:
//               BorderRadius.circular(16),
//
//               boxShadow: [
//                 BoxShadow(
//                   color:
//                   Colors.black.withOpacity(0.05),
//
//                   blurRadius: 8,
//
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//
//             child:
//             StreamBuilder<QuerySnapshot>(
//
//               stream: FirebaseFirestore.instance
//                   .collection('Users')
//                   .snapshots(),
//
//               builder: (context, snapshot) {
//
//                 if (snapshot.connectionState ==
//                     ConnectionState.waiting) {
//
//                   return const Center(
//                     child:
//                     CircularProgressIndicator(),
//                   );
//                 }
//
//                 if (!snapshot.hasData ||
//                     snapshot.data!.docs.isEmpty) {
//
//                   return const Center(
//                     child:
//                     Text("No users found"),
//                   );
//                 }
//
//                 final users =
//                     snapshot.data!.docs;
//
//                 return SingleChildScrollView(
//                   scrollDirection:
//                   Axis.horizontal,
//
//                   child: DataTable(
//
//                     headingRowColor:
//                     MaterialStateProperty.all(
//                       UsersScreen.bgColor,
//                     ),
//
//                     columns: const [
//
//                       // 👤 NAME
//                       DataColumn(
//                         label: Text(
//                           "Name",
//
//                           style: TextStyle(
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//
//                       // 📧 EMAIL
//                       DataColumn(
//                         label: Text(
//                           "Email",
//
//                           style: TextStyle(
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//
//                       // 🔷 ROLE
//                       DataColumn(
//                         label: Text(
//                           "Role",
//
//                           style: TextStyle(
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//
//                       // 🟢 STATUS
//                       DataColumn(
//                         label: Text(
//                           "Status",
//
//                           style: TextStyle(
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//
//                       // ⚙ ACTIONS
//                       DataColumn(
//                         label: Text(
//                           "Actions",
//
//                           style: TextStyle(
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//
//                     rows:
//                     users.map<DataRow?>((doc) {
//
//                       final data =
//                       doc.data()
//                       as Map<String, dynamic>;
//
//                       // 🔍 SEARCH DATA
//                       final name =
//                       (data['name'] ?? '')
//                           .toString();
//
//                       final email =
//                       (data['email'] ?? '')
//                           .toString();
//
//                       final lowerName =
//                       name.toLowerCase();
//
//                       final lowerEmail =
//                       email.toLowerCase();
//
//                       // 🔍 SEARCH FILTER
//                       if (!lowerName.contains(
//                           searchQuery) &&
//                           !lowerEmail.contains(
//                               searchQuery)) {
//
//                         return null;
//                       }
//
//                       final role =
//                       (data['role'] ?? 'user')
//                           .toString();
//
//                       return DataRow(
//                         cells: [
//
//                           // 👤 NAME
//                           DataCell(
//
//                             Row(
//                               children: [
//
//                                 CircleAvatar(
//                                   radius: 18,
//
//                                   backgroundColor:
//                                   UsersScreen
//                                       .darkBlue,
//
//                                   child: Text(
//                                     name.isNotEmpty
//                                         ? name[0]
//                                         .toUpperCase()
//                                         : "U",
//
//                                     style:
//                                     const TextStyle(
//                                       color:
//                                       Colors.white,
//
//                                       fontWeight:
//                                       FontWeight
//                                           .bold,
//                                     ),
//                                   ),
//                                 ),
//
//                                 const SizedBox(
//                                     width: 10),
//
//                                 Text(name),
//                               ],
//                             ),
//                           ),
//
//                           // 📧 EMAIL
//                           DataCell(
//                             Text(email),
//                           ),
//
//                           // 🔷 ROLE
//                           DataCell(
//
//                             Container(
//                               padding:
//                               const EdgeInsets
//                                   .symmetric(
//                                 horizontal: 12,
//                                 vertical: 6,
//                               ),
//
//                               decoration:
//                               BoxDecoration(
//
//                                 color: role ==
//                                     "admin"
//                                     ? Colors.purple
//                                     .withOpacity(
//                                     0.15)
//                                     : Colors.blue
//                                     .withOpacity(
//                                     0.15),
//
//                                 borderRadius:
//                                 BorderRadius
//                                     .circular(
//                                     20),
//                               ),
//
//                               child: Text(
//                                 role.toUpperCase(),
//
//                                 style: TextStyle(
//                                   color: role ==
//                                       "admin"
//                                       ? Colors
//                                       .purple
//                                       : Colors
//                                       .blue,
//
//                                   fontWeight:
//                                   FontWeight
//                                       .bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                           // 🟢 STATUS
//                           DataCell(
//
//                             Container(
//                               padding:
//                               const EdgeInsets
//                                   .symmetric(
//                                 horizontal: 12,
//                                 vertical: 6,
//                               ),
//
//                               decoration:
//                               BoxDecoration(
//                                 color: Colors.green
//                                     .withOpacity(
//                                     0.15),
//
//                                 borderRadius:
//                                 BorderRadius
//                                     .circular(
//                                     20),
//                               ),
//
//                               child: const Text(
//                                 "Active",
//
//                                 style: TextStyle(
//                                   color:
//                                   Colors.green,
//
//                                   fontWeight:
//                                   FontWeight
//                                       .bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                           // ⚙ ACTIONS
//                           DataCell(
//
//                             Row(
//                               children: [
//
//                                 // 👁 VIEW
//                                 IconButton(
//                                   onPressed: () {},
//
//                                   icon:
//                                   const Icon(
//                                     Icons
//                                         .visibility,
//
//                                     color:
//                                     Colors.blue,
//                                   ),
//                                 ),
//
//                                 // 🚫 BLOCK
//                                 IconButton(
//                                   onPressed: () {},
//
//                                   icon:
//                                   const Icon(
//                                     Icons.block,
//
//                                     color: Colors
//                                         .orange,
//                                   ),
//                                 ),
//
//                                 // 🗑 DELETE
//                                 IconButton(
//                                   onPressed:
//                                       () async {
//
//                                     await FirebaseFirestore
//                                         .instance
//                                         .collection(
//                                         'Users')
//                                         .doc(doc.id)
//                                         .delete();
//                                   },
//
//                                   icon:
//                                   const Icon(
//                                     Icons.delete,
//
//                                     color:
//                                     Colors.red,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//
//                     }).whereType<DataRow>().toList(),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Datatable -> column: [datacoulumns] ->label
// Datatable -> rows: [datarows] ->datacell->text
//

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../../services/notifications/send_notification_service.dart';
//
// class UsersScreen extends StatefulWidget {
//   const UsersScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   State<UsersScreen> createState() => _UsersScreenState();
// }
//
// class _UsersScreenState extends State<UsersScreen> {
//   Future<void> toggleUserStatus({
//     required String docId,
//     required String currentStatus,
//     required String fcmToken,
//     required String userName,
//   }) async {
//
//     final newStatus =
//     currentStatus == "blocked"
//         ? "active"
//         : "blocked";
//
//     // 🔷 UPDATE FIRESTORE
//     await FirebaseFirestore.instance
//         .collection('Users')
//         .doc(docId)
//         .update({
//       'status': newStatus,
//     });
//
//     // 🔷 SEND NOTIFICATION
//     await SendNotificationService.sendNotification(
//
//       token: fcmToken,
//
//       title: newStatus == "blocked"
//           ? "Account Blocked"
//           : "Account Activated",
//
//       body: newStatus == "blocked"
//           ? "Your account has been blocked by admin."
//           : "Congratulations!🎉 Your account has been activated again.",
//
//       data: {
//         "screen": "home"
//       },
//     );
//
//     // 🔷 SUCCESS MESSAGE
//     ScaffoldMessenger.of(context).showSnackBar(
//
//       SnackBar(
//
//         backgroundColor: Colors.green,
//
//         content: Text(
//           "$userName is now $newStatus",
//         ),
//       ),
//     );
//   }
//
//   void showUserDetails({
//
//     required Map<String, dynamic> data,
//
//   }) {
//
//     showDialog(
//
//       context: context,
//
//       builder: (context) {
//
//         return AlertDialog(
//
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//
//           title: const Text(
//             "User Details",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           content: SizedBox(
//
//             width: 400,
//
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//
//               children: [
//
//                 // 👤 AVATAR
//                 CircleAvatar(
//                   radius: 40,
//                   backgroundColor: UsersScreen.darkBlue,
//
//                   child: Text(
//
//                     data['name'] != null
//                         ? data['name'][0].toUpperCase()
//                         : "U",
//
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 _detailRow(
//                   "Name",
//                   data['name'] ?? "N/A",
//                 ),
//
//                 _detailRow(
//                   "Email",
//                   data['email'] ?? "N/A",
//                 ),
//
//                 _detailRow(
//                   "Role",
//                   data['role'] ?? "user",
//                 ),
//
//                 _detailRow(
//                   "Status",
//                   data['status'] ?? "active",
//                 ),
//
//                 _detailRow(
//                   "UID",
//                   data['uid'] ?? "N/A",
//                 ),
//
//                 _detailRow(
//                   "FCM Token",
//                   data['fcmToken'] != null
//                       ? "Available"
//                       : "Not Found",
//                 ),
//               ],
//             ),
//           ),
//
//           actions: [
//
//             TextButton(
//
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//
//               child: const Text("Close"),
//             ),
//           ],
//         );
//       },
//     );
//   }
//   Widget _detailRow(
//       String title,
//       String value,
//       ) {
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//
//         children: [
//
//           SizedBox(
//             width: 100,
//
//             child: Text(
//
//               "$title:",
//
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//
//           Expanded(
//             child: Text(value),
//           ),
//         ],
//       ),
//     );
//   }
//   final TextEditingController searchController = TextEditingController();
//   String searchQuery = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//
//         children: [
//
//           // 🔷 HEADER
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//             children: const [
//               Text(
//                 "Manage Users",
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 25),
//
//           // 🔍 SEARCH BAR
//           Container(
//             width: 350,
//             height: 50,
//
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 6,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//
//             child: TextField(
//               controller: searchController,
//               decoration: const InputDecoration(
//                 hintText: "Search users...",
//                 prefixIcon: Icon(Icons.search),
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.symmetric(vertical: 14),
//               ),
//
//               onChanged: (value) {
//                 setState(() {
//                   searchQuery = value.toLowerCase();
//                 });
//               },
//             ),
//           ),
//
//           const SizedBox(height: 30),
//
//           // 🔷 USERS TABLE
//
//           Container(
//
//
//             width: 800,
//             padding: const EdgeInsets.all(20),
//
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 8,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('Users')
//                   .snapshots(),
//
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//
//                 final users = snapshot.data!.docs;
//
//                 return SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//
//                   child: DataTable(
//                     columnSpacing: 40,
//                     horizontalMargin: 20,
//
//                     headingRowColor:
//                     MaterialStateProperty.all(UsersScreen.bgColor),
//
//                     columns: const [
//                       DataColumn(label: Text("Name")),
//                       DataColumn(label: Text("Email")),
//                       DataColumn(label: Text("Role")),
//                       DataColumn(label: Text("Status")),
//                       DataColumn(label: Text("Actions")),
//                     ],
//
//                     rows: users.map((doc) {
//                       final data =
//                       doc.data() as Map<String, dynamic>;
//
//                       final name = (data['name'] ?? '').toString();
//                       final email = (data['email'] ?? '').toString();
//                       final role = (data['role'] ?? 'user').toString();
//                       final status =
//                       (data['status'] ?? 'active').toString();
//
//                       final fcmToken =
//                       (data['fcmToken'] ?? '').toString();
//                       // final status =
//                       // (data['status'] ?? 'active').toString();
//
//                       // 🔍 SEARCH FILTER
//                       if (!name.toLowerCase().contains(searchQuery) &&
//                           !email.toLowerCase().contains(searchQuery)) {
//                         return null;
//                       }
//
//                       return DataRow(
//                         cells: [
//
//                           // 👤 NAME
//                           DataCell(
//                             Row(
//                               children: [
//                                 CircleAvatar(
//                                   backgroundColor:
//                                   UsersScreen.darkBlue,
//                                   child: Text(
//                                     name.isNotEmpty
//                                         ? name[0].toUpperCase()
//                                         : "U",
//                                     style: const TextStyle(
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 20),
//                                 Text(name),
//                               ],
//                             ),
//                           ),
//
//                           // 📧 EMAIL
//                           DataCell(Text(email)),
//
//                           // 🔷 ROLE
//                           DataCell(
//                             Text(role.toUpperCase()),
//                           ),
//
//                           // 🟢 STATUS (REAL FIRESTORE VALUE)
//                           DataCell(
//
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 12,
//                                 vertical: 6,
//                               ),
//
//                               decoration: BoxDecoration(
//
//                                 color: status == "blocked"
//                                     ? Colors.red.withOpacity(0.15)
//                                     : Colors.green.withOpacity(0.15),
//
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//
//                               child: Text(
//
//                                 status.toUpperCase(),
//
//                                 style: TextStyle(
//
//                                   color: status == "blocked"
//                                       ? Colors.red
//                                       : Colors.green,
//
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           // DataCell(
//                           //   Container(
//                           //     padding: const EdgeInsets.symmetric(
//                           //       horizontal: 12,
//                           //       vertical: 6,
//                           //     ),
//                           //     decoration: BoxDecoration(
//                           //       color: status == "active"
//                           //           ? Colors.green.withOpacity(0.15)
//                           //           : Colors.red.withOpacity(0.15),
//                           //       borderRadius: BorderRadius.circular(20),
//                           //     ),
//                           //     child: Text(
//                           //       status.toUpperCase(),
//                           //       style: TextStyle(
//                           //         color: status == "active"
//                           //             ? Colors.green
//                           //             : Colors.red,
//                           //         fontWeight: FontWeight.bold,
//                           //       ),
//                           //     ),
//                           //   ),
//                           // ),
//
//                           // ⚙ ACTIONS
//                           DataCell(
//                             Row(
//                               children: [
//
//                                 // 👁 VIEW
//                                 IconButton(
//
//                                   onPressed: () {
//
//                                     showUserDetails(
//                                       data: data,
//                                     );
//                                   },
//
//                                   icon: const Icon(
//                                     Icons.visibility,
//                                     color: Colors.blue,
//                                   ),
//                                 ),
//
//                                 // 🚫 BLOCK USER (only if active)
//                                 if (status == "active")
//                                   IconButton(
//
//                                     onPressed: () async {
//
//                                       await toggleUserStatus(
//
//                                         docId: doc.id,
//
//                                         currentStatus: status,
//
//                                         fcmToken: fcmToken,
//
//                                         userName: name,
//                                       );
//                                     },
//
//                                     icon: Icon(
//
//                                       status == "blocked"
//                                           ? Icons.lock_open
//                                           : Icons.block,
//
//                                       color: status == "blocked"
//                                           ? Colors.green
//                                           : Colors.orange,
//                                     ),
//                                   ),
//                                 // IconButton(
//                                 //   tooltip: "Block User",
//                                 //   onPressed: () async {
//                                 //     await FirebaseFirestore.instance
//                                 //         .collection('Users')
//                                 //         .doc(doc.id)
//                                 //         .update({
//                                 //       'status': 'blocked',
//                                 //     });
//                                 //   },
//                                 //   icon: const Icon(
//                                 //     Icons.block,
//                                 //     color: Colors.red,
//                                 //   ),
//                                 // ),
//
//                                 // ✅ UNBLOCK USER (only if blocked)
//                                 // if (status == "blocked")
//                                 //   IconButton(
//                                 //     tooltip: "Unblock User",
//                                 //     onPressed: () async {
//                                 //       await FirebaseFirestore.instance
//                                 //           .collection('Users')
//                                 //           .doc(doc.id)
//                                 //           .update({
//                                 //         'status': 'active',
//                                 //       });
//                                 //     },
//                                 //     icon: const Icon(
//                                 //       Icons.lock_open,
//                                 //       color: Colors.green,
//                                 //     ),
//                                 //   ),
//                                 if (status == "blocked")
//                                   IconButton(
//                                     tooltip: "Unblock User",
//                                     onPressed: () async {
//
//                                       await toggleUserStatus(
//                                         docId: doc.id,
//                                         currentStatus: status,
//                                         fcmToken: fcmToken,
//                                         userName: name,
//                                       );
//                                     },
//
//                                     icon: const Icon(
//                                       Icons.lock_open,
//                                       color: Colors.green,
//                                     ),
//                                   ),
//                               ],
//                             ),
//                           ),
//                           // DataCell(
//                           //   Row(
//                           //     children: [
//                           //
//                           //       // 👁 VIEW (future use)
//                           //       IconButton(
//                           //         onPressed: () {},
//                           //         icon: const Icon(Icons.visibility,
//                           //             color: Colors.blue),
//                           //       ),
//                           //
//                           //       // 🚫 BLOCK / UNBLOCK TOGGLE
//                           //       IconButton(
//                           //         onPressed: () async {
//                           //           final newStatus =
//                           //           status == "active"
//                           //               ? "blocked"
//                           //               : "active";
//                           //
//                           //           await FirebaseFirestore.instance
//                           //               .collection('Users')
//                           //               .doc(doc.id)
//                           //               .update({
//                           //             'status': newStatus,
//                           //           });
//                           //         },
//                           //
//                           //         icon: Icon(
//                           //           status == "active"
//                           //               ? Icons.block
//                           //               : Icons.check_circle,
//                           //           color: status == "active"
//                           //               ? Colors.orange
//                           //               : Colors.green,
//                           //         ),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                         ],
//                       );
//                     }).whereType<DataRow>().toList(),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../services/notifications/send_notification_service.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  static const Color darkBlue = Color(0xFF2A417F);
  static const Color orange = Color(0xFFF09E27);
  static const Color bgColor = Color(0xFFEFF5FB);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  final TextEditingController searchController =
  TextEditingController();

  String searchQuery = "";

  Future<void> toggleUserStatus({
    required String docId,
    required String currentStatus,
    required String fcmToken,
    required String userName,
  }) async {

    final newStatus =
    currentStatus == "blocked"
        ? "active"
        : "blocked";

    // 🔷 UPDATE FIRESTORE
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(docId)
        .update({
      'status': newStatus,
    });

    // 🔷 SEND NOTIFICATION
    await SendNotificationService.sendNotification(

      token: fcmToken,

      title: newStatus == "blocked"
          ? "Account Blocked"
          : "Account Activated",

      body: newStatus == "blocked"
          ? "Your account has been blocked by admin."
          : "Congratulations!🎉 Your account has been activated again.",

      data: {
        "screen": "home"
      },
    );

    // 🔷 SUCCESS MESSAGE
    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(

        backgroundColor: Colors.green,

        content: Text(
          "$userName is now $newStatus",
        ),
      ),
    );
  }

  void showUserDetails({

    required Map<String, dynamic> data,

  }) {

    showDialog(

      context: context,

      builder: (context) {

        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          title: const Text(
            "User Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          content: SizedBox(

            width: 400,

            child: SingleChildScrollView(

              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [

                  // 👤 AVATAR
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: UsersScreen.darkBlue,

                    child: Text(

                      data['name'] != null
                          ? data['name'][0].toUpperCase()
                          : "U",

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  _detailRow(
                    "Name",
                    data['name'] ?? "N/A",
                  ),

                  _detailRow(
                    "Email",
                    data['email'] ?? "N/A",
                  ),

                  _detailRow(
                    "Role",
                    data['role'] ?? "user",
                  ),

                  _detailRow(
                    "Status",
                    data['status'] ?? "active",
                  ),

                  _detailRow(
                    "UID",
                    data['uid'] ?? "N/A",
                  ),

                  _detailRow(
                    "FCM Token",
                    data['fcmToken'] != null
                        ? "Available"
                        : "Not Found",
                  ),
                ],
              ),
            ),
          ),

          actions: [

            TextButton(

              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  Widget _detailRow(
      String title,
      String value,
      ) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          SizedBox(
            width: 100,

            child: Text(

              "$title:",

              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // ✅ FIXED OVERFLOW ISSUES
    // 1. Added LayoutBuilder
    // 2. Added ConstrainedBox
    // 3. Replaced Row with Wrap
    // 4. Removed fixed width: 800
    // 5. Added horizontal scrolling
    // 6. Added safe width for search bar

    return LayoutBuilder(

      builder: (context, constraints) {

        return SingleChildScrollView(
          padding: const EdgeInsets.all(25),

          child: ConstrainedBox(

            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                // 🔷 HEADER
                Wrap(

                  spacing: 15,
                  runSpacing: 15,

                  alignment:
                  WrapAlignment.spaceBetween,

                  children: const [

                    Text(
                      "Manage Users",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // 🔍 SEARCH BAR
                SingleChildScrollView(

                  scrollDirection: Axis.horizontal,

                  child: Container(

                    width: 350,
                    height: 50,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(12),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),

                    child: TextField(
                      controller: searchController,

                      decoration: const InputDecoration(
                        hintText: "Search users...",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,

                        contentPadding:
                        EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                      ),

                      onChanged: (value) {

                        setState(() {
                          searchQuery =
                              value.toLowerCase();
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // 🔷 USERS TABLE
                Container(

                  // ✅ Removed fixed width: 800
                  width: double.infinity,

                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(16),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,

                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  child: StreamBuilder<QuerySnapshot>(

                    stream: FirebaseFirestore.instance
                        .collection('Users')
                        .snapshots(),

                    builder: (context, snapshot) {

                      if (!snapshot.hasData) {

                        return const Center(
                          child:
                          CircularProgressIndicator(),
                        );
                      }

                      final users =
                          snapshot.data!.docs;

                      return SingleChildScrollView(

                        scrollDirection:
                        Axis.horizontal,

                        child: DataTable(

                          columnSpacing: 40,
                          horizontalMargin: 20,

                          headingRowColor:
                          MaterialStateProperty.all(
                            UsersScreen.bgColor,
                          ),

                          columns: const [

                            DataColumn(
                              label: Text("Name"),
                            ),

                            DataColumn(
                              label: Text("Email"),
                            ),

                            DataColumn(
                              label: Text("Role"),
                            ),

                            DataColumn(
                              label: Text("Status"),
                            ),

                            DataColumn(
                              label: Text("Actions"),
                            ),
                          ],

                          rows:
                          users.map((doc) {

                            final data =
                            doc.data()
                            as Map<String, dynamic>;

                            final name =
                            (data['name'] ?? '')
                                .toString();

                            final email =
                            (data['email'] ?? '')
                                .toString();

                            final role =
                            (data['role'] ?? 'user')
                                .toString();

                            final status =
                            (data['status'] ??
                                'active')
                                .toString();

                            final fcmToken =
                            (data['fcmToken'] ?? '')
                                .toString();

                            // 🔍 SEARCH FILTER
                            if (!name
                                .toLowerCase()
                                .contains(searchQuery) &&
                                !email
                                    .toLowerCase()
                                    .contains(searchQuery)) {

                              return null;
                            }

                            return DataRow(

                              cells: [

                                // 👤 NAME
                                DataCell(

                                  Row(
                                    children: [

                                      CircleAvatar(
                                        backgroundColor:
                                        UsersScreen
                                            .darkBlue,

                                        child: Text(

                                          name.isNotEmpty
                                              ? name[0]
                                              .toUpperCase()
                                              : "U",

                                          style:
                                          const TextStyle(
                                            color:
                                            Colors.white,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                          width: 20),

                                      Text(name),
                                    ],
                                  ),
                                ),

                                // 📧 EMAIL
                                DataCell(
                                  Text(email),
                                ),

                                // 🔷 ROLE
                                DataCell(
                                  Text(
                                    role.toUpperCase(),
                                  ),
                                ),

                                // 🟢 STATUS
                                DataCell(

                                  Container(
                                    padding:
                                    const EdgeInsets
                                        .symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),

                                    decoration:
                                    BoxDecoration(

                                      color:
                                      status == "blocked"
                                          ? Colors.red
                                          .withOpacity(
                                          0.15)
                                          : Colors.green
                                          .withOpacity(
                                          0.15),

                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          20),
                                    ),

                                    child: Text(

                                      status.toUpperCase(),

                                      style: TextStyle(

                                        color:
                                        status == "blocked"
                                            ? Colors.red
                                            : Colors.green,

                                        fontWeight:
                                        FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),

                                // ⚙ ACTIONS
                                DataCell(

                                  Row(
                                    children: [

                                      // 👁 VIEW
                                      IconButton(

                                        tooltip:
                                        "View User",

                                        onPressed: () {

                                          showUserDetails(
                                            data: data,
                                          );
                                        },

                                        icon: const Icon(
                                          Icons.visibility,
                                          color: Colors.blue,
                                        ),
                                      ),

                                      // 🚫 BLOCK USER
                                      if (status == "active")

                                        IconButton(

                                          tooltip:
                                          "Block User",

                                          onPressed:
                                              () async {

                                            await toggleUserStatus(

                                              docId: doc.id,

                                              currentStatus:
                                              status,

                                              fcmToken:
                                              fcmToken,

                                              userName:
                                              name,
                                            );
                                          },

                                          icon: const Icon(

                                            Icons.block,

                                            color:
                                            Colors.orange,
                                          ),
                                        ),

                                      // ✅ UNBLOCK USER
                                      if (status == "blocked")

                                        IconButton(

                                          tooltip:
                                          "Unblock User",

                                          onPressed:
                                              () async {

                                            await toggleUserStatus(

                                              docId: doc.id,

                                              currentStatus:
                                              status,

                                              fcmToken:
                                              fcmToken,

                                              userName:
                                              name,
                                            );
                                          },

                                          icon: const Icon(

                                            Icons.lock_open,

                                            color:
                                            Colors.green,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            );

                          }).whereType<DataRow>().toList(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}