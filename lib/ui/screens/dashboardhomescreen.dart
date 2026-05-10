// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../../widgets/dashboardcard.dart';
//
// class DashboardHomeScreen extends StatelessWidget {
//   const DashboardHomeScreen({super.key});
//
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Padding(
//       padding: const EdgeInsets.all(25),
//
//       child: SingleChildScrollView(
//
//         child: Column(
//           crossAxisAlignment:
//           CrossAxisAlignment.start,
//
//           children: [
//
//             const Text(
//               "Dashboard",
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//
//             const SizedBox(height: 30),
//
//             // 🔷 STATISTICS
//             StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('Users')
//                   .snapshots(),
//
//               builder: (context, usersSnapshot) {
//
//                 return StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('items')
//                       .snapshots(),
//
//                   builder: (context, itemsSnapshot) {
//
//                     return StreamBuilder<QuerySnapshot>(
//                       stream: FirebaseFirestore.instance
//                           .collection('claims')
//                           .snapshots(),
//
//                       builder: (context, claimsSnapshot) {
//
//                         if (usersSnapshot.connectionState ==
//                             ConnectionState.waiting ||
//
//                             itemsSnapshot.connectionState ==
//                                 ConnectionState.waiting ||
//
//                             claimsSnapshot.connectionState ==
//                                 ConnectionState.waiting) {
//
//                           return const Center(
//                             child:
//                             CircularProgressIndicator(),
//                           );
//                         }
//
//                         // 🔷 COUNTS
//                         final totalUsers =
//                             usersSnapshot.data?.docs.length ?? 0;
//
//                         final totalItems =
//                             itemsSnapshot.data?.docs.length ?? 0;
//
//                         final totalClaims =
//                             claimsSnapshot.data?.docs.length ?? 0;
//
//                         // 🔷 LOST ITEMS
//                         final lostItems =
//                             itemsSnapshot.data?.docs.where((doc) {
//
//                               final data =
//                               doc.data()
//                               as Map<String, dynamic>;
//
//                               return data['type'] == 'lost';
//
//                             }).length ?? 0;
//
//                         // 🔷 FOUND ITEMS
//                         final foundItems =
//                             itemsSnapshot.data?.docs.where((doc) {
//
//                               final data =
//                               doc.data()
//                               as Map<String, dynamic>;
//
//                               return data['type'] == 'found';
//
//                             }).length ?? 0;
//
//                         // 🔷 PENDING CLAIMS
//                         final pendingClaims =
//                             claimsSnapshot.data?.docs.where((doc) {
//
//                               final data =
//                               doc.data()
//                               as Map<String, dynamic>;
//
//                               return data['status'] ==
//                                   'pending';
//
//                             }).length ?? 0;
//
//                         return Column(
//                           children: [
//
//                             Row(
//                               children: [
//
//                                 Expanded(
//                                   child: DashboardCard(
//                                     title: "Total Users",
//                                     value:
//                                     totalUsers.toString(),
//                                     icon: Icons.people,
//                                     color: Colors.blue,
//                                   ),
//                                 ),
//
//                                 const SizedBox(width: 20),
//
//                                 Expanded(
//                                   child: DashboardCard(
//                                     title: "Total Items",
//                                     value:
//                                     totalItems.toString(),
//                                     icon:
//                                     Icons.inventory_2,
//                                     color: Colors.orange,
//                                   ),
//                                 ),
//
//                                 const SizedBox(width: 20),
//
//                                 Expanded(
//                                   child: DashboardCard(
//                                     title: "Lost Items",
//                                     value:
//                                     lostItems.toString(),
//                                     icon:
//                                     Icons.search_off,
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//                             const SizedBox(height: 20),
//
//                             Row(
//                               children: [
//
//                                 Expanded(
//                                   child: DashboardCard(
//                                     title: "Found Items",
//                                     value:
//                                     foundItems.toString(),
//                                     icon:
//                                     Icons.check_circle,
//                                     color: Colors.green,
//                                   ),
//                                 ),
//
//                                 const SizedBox(width: 20),
//
//                                 Expanded(
//                                   child: DashboardCard(
//                                     title:
//                                     "Pending Claims",
//                                     value:
//                                     pendingClaims
//                                         .toString(),
//                                     icon:
//                                     Icons.pending_actions,
//                                     color: Colors.purple,
//                                   ),
//                                 ),
//
//                                 const SizedBox(width: 20),
//
//                                 Expanded(
//                                   child: DashboardCard(
//                                     title: "Total Claims",
//                                     value:
//                                     totalClaims.toString(),
//                                     icon:
//                                     Icons.assignment,
//                                     color: Colors.teal,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                 );
//               },
//             ),
//
//             const SizedBox(height: 40),
//
//             // 🔷 RECENT ACTIVITY TITLE
//             const Text(
//               "Recent Activity",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//
//             const SizedBox(height: 20),
//
//             // 🔷 RECENT ACTIVITY CONTAINER
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius:
//                 BorderRadius.circular(16),
//
//                 boxShadow: [
//                   BoxShadow(
//                     color:
//                     Colors.black.withOpacity(0.05),
//                     blurRadius: 8,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//
//               child: Column(
//                 children: const [
//
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor:
//                       Colors.orange,
//                       child: Icon(
//                         Icons.inventory,
//                         color: Colors.white,
//                       ),
//                     ),
//
//                     title: Text(
//                       "New Lost Item Added",
//                     ),
//
//                     subtitle: Text(
//                       "2 minutes ago",
//                     ),
//                   ),
//
//                   Divider(),
//
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor:
//                       Colors.green,
//                       child: Icon(
//                         Icons.check_circle,
//                         color: Colors.white,
//                       ),
//                     ),
//
//                     title: Text(
//                       "Claim Approved",
//                     ),
//
//                     subtitle: Text(
//                       "10 minutes ago",
//                     ),
//                   ),
//
//                   Divider(),
//
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor:
//                       Colors.blue,
//                       child: Icon(
//                         Icons.person,
//                         color: Colors.white,
//                       ),
//                     ),
//
//                     title: Text(
//                       "New User Registered",
//                     ),
//
//                     subtitle: Text(
//                       "30 minutes ago",
//
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class DashboardHomeScreen extends StatelessWidget {
//   const DashboardHomeScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           // 🔷 TITLE
//           const Text(
//             "Dashboard Overview",
//             style: TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//               color: darkBlue,
//             ),
//           ),
//
//           const SizedBox(height: 25),
//
//           // 🔥 FIREBASE DATA
//           StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance.collection('Users').snapshots(),
//             builder: (context, usersSnap) {
//               return StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance.collection('items').snapshots(),
//                 builder: (context, itemsSnap) {
//                   return StreamBuilder<QuerySnapshot>(
//                     stream: FirebaseFirestore.instance.collection('claims').snapshots(),
//                     builder: (context, claimsSnap) {
//
//                       if (!usersSnap.hasData ||
//                           !itemsSnap.hasData ||
//                           !claimsSnap.hasData) {
//                         return const Center(child: CircularProgressIndicator());
//                       }
//
//                       final users = usersSnap.data!.docs.length;
//                       final items = itemsSnap.data!.docs.length;
//                       final claims = claimsSnap.data!.docs.length;
//
//                       final lost = itemsSnap.data!.docs.where((d) {
//                         final data = d.data() as Map<String, dynamic>;
//                         return data['type'] == 'lost';
//                       }).length;
//
//                       final found = itemsSnap.data!.docs.where((d) {
//                         final data = d.data() as Map<String, dynamic>;
//                         return data['type'] == 'found';
//                       }).length;
//
//                       final pending = claimsSnap.data!.docs.where((d) {
//                         final data = d.data() as Map<String, dynamic>;
//                         return data['status'] == 'pending';
//                       }).length;
//
//                       return Column(
//                         children: [
//
//                           // 🔷 TOP CARDS
//                           Row(
//                             children: [
//
//                               _card("Users", users.toString(), Icons.people, Colors.blue),
//                               const SizedBox(width: 20),
//                               _card("Items", items.toString(), Icons.inventory, Colors.orange),
//                               const SizedBox(width: 20),
//                               _card("Claims", claims.toString(), Icons.assignment, Colors.purple),
//                             ],
//                           ),
//
//                           const SizedBox(height: 20),
//
//                           Row(
//                             children: [
//
//                               _card("Lost Items", lost.toString(), Icons.search_off, Colors.red),
//                               const SizedBox(width: 20),
//                               _card("Found Items", found.toString(), Icons.check_circle, Colors.green),
//                               const SizedBox(width: 20),
//                               _card("Pending Claims", pending.toString(), Icons.pending, Colors.amber),
//                             ],
//                           ),
//
//                           const SizedBox(height: 30),
//
//                           // 🔷 RECENT ACTIVITY
//                           const Text(
//                             "Recent Activity",
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//
//                           const SizedBox(height: 15),
//
//                           Container(
//                             width: double.infinity,
//                             padding: const EdgeInsets.all(20),
//
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(16),
//
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.05),
//                                   blurRadius: 8,
//                                   offset: const Offset(0, 3),
//                                 ),
//                               ],
//                             ),
//
//                             child: StreamBuilder<QuerySnapshot>(
//                               stream: FirebaseFirestore.instance
//                                   .collection('items')
//                                   .orderBy('createdAt', descending: true)
//                                   .limit(5)
//                                   .snapshots(),
//
//                               builder: (context, snap) {
//
//                                 if (!snap.hasData) {
//                                   return const Center(child: CircularProgressIndicator());
//                                 }
//
//                                 final docs = snap.data!.docs;
//
//                                 return Column(
//                                   children: docs.map((d) {
//
//                                     final data = d.data() as Map<String, dynamic>;
//
//                                     return ListTile(
//                                       leading: CircleAvatar(
//                                         backgroundColor: darkBlue,
//                                         child: const Icon(Icons.inventory, color: Colors.white),
//                                       ),
//
//                                       title: Text(data['itemName'] ?? 'Item'),
//                                       subtitle: Text(data['type'] ?? ''),
//                                       trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//                                     );
//                                   }).toList(),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   // 🔷 CARD WIDGET
//   Widget _card(String title, String value, IconData icon, Color color) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(20),
//
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 8,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//
//         child: Row(
//           children: [
//
//             Container(
//               padding: const EdgeInsets.all(12),
//
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.15),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//
//               child: Icon(icon, color: color),
//             ),
//
//             const SizedBox(width: 15),
//
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 Text(title, style: const TextStyle(color: Colors.grey)),
//
//                 const SizedBox(height: 5),
//
//                 Text(
//                   value,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../../services/dashboard_service.dart';
// import '../../widgets/dashboardcard.dart';
// // import '../services/dashboard_service.dart';
// // import '../widgets/dashboardcard.dart';
//
// class DashboardHomeScreen extends StatelessWidget {
//   const DashboardHomeScreen({super.key});
//
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//     final service = DashboardService();
//
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//
//         children: [
//
//           // 🔷 TITLE
//           const Text(
//             "Dashboard",
//             style: TextStyle(
//               fontSize: 32,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           const SizedBox(height: 30),
//
//           // 🔷 CARDS ROW 1
//           Row(
//             children: [
//
//               StreamBuilder<int>(
//                 stream: service.getUsersCount(),
//                 builder: (context, snapshot) {
//                   return DashboardCard(
//                     title: "Users",
//                     value: (snapshot.data ?? 0).toString(),
//                     icon: Icons.people,
//                     color: Colors.blue,
//                   );
//                 },
//               ),
//
//               const SizedBox(width: 20),
//
//               StreamBuilder<int>(
//                 stream: service.getItemsCount(),
//                 builder: (context, snapshot) {
//                   return DashboardCard(
//                     title: "Items",
//                     value: (snapshot.data ?? 0).toString(),
//                     icon: Icons.inventory_2,
//                     color: Colors.orange,
//                   );
//                 },
//               ),
//
//               const SizedBox(width: 20),
//
//               StreamBuilder<int>(
//                 stream: service.getClaimsCount(),
//                 builder: (context, snapshot) {
//                   return DashboardCard(
//                     title: "Claims",
//                     value: (snapshot.data ?? 0).toString(),
//                     icon: Icons.assignment,
//                     color: Colors.purple,
//                   );
//                 },
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 20),
//
//           // 🔷 CARDS ROW 2
//           Row(
//             children: [
//
//               StreamBuilder<int>(
//                 stream: service.getLostItemsCount(),
//                 builder: (context, snapshot) {
//                   return DashboardCard(
//                     title: "Lost Items",
//                     value: (snapshot.data ?? 0).toString(),
//                     icon: Icons.search_off,
//                     color: Colors.red,
//                   );
//                 },
//               ),
//
//               const SizedBox(width: 20),
//
//               StreamBuilder<int>(
//                 stream: service.getFoundItemsCount(),
//                 builder: (context, snapshot) {
//                   return DashboardCard(
//                     title: "Found Items",
//                     value: (snapshot.data ?? 0).toString(),
//                     icon: Icons.check_circle,
//                     color: Colors.green,
//                   );
//                 },
//               ),
//
//               const SizedBox(width: 20),
//
//               StreamBuilder<int>(
//                 stream: service.getPendingClaimsCount(),
//                 builder: (context, snapshot) {
//                   return DashboardCard(
//                     title: "Pending Claims",
//                     value: (snapshot.data ?? 0).toString(),
//                     icon: Icons.pending_actions,
//                     color: Colors.amber,
//                   );
//                 },
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 40),
//
//           // 🔷 RECENT ACTIVITY TITLE
//           const Text(
//             "Recent Activity",
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           // 🔷 RECENT ACTIVITY LIST (LIVE FIRESTORE)
//           // 🔷 LIVE ACTIVITY CONTAINER
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(20),
//
//             decoration: BoxDecoration(
//               color: Colors.white,
//
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
//             child: StreamBuilder<QuerySnapshot>(
//
//               stream: FirebaseFirestore.instance
//                   .collection('activity')
//                   .orderBy(
//                 'createdAt',
//                 descending: true,
//               )
//                   .limit(10)
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
//                     child: Text("No recent activity"),
//                   );
//                 }
//
//                 final activities =
//                     snapshot.data!.docs;
//
//                 return Column(
//
//                   children:
//                   activities.map((doc) {
//
//                     final data =
//                     doc.data()
//                     as Map<String, dynamic>;
//
//                     final type =
//                         data['type'] ?? '';
//
//                     IconData icon;
//                     Color color;
//
//                     // 🔷 ICON + COLOR
//                     switch (type) {
//
//                       case "user":
//                         icon = Icons.person;
//                         color = Colors.blue;
//                         break;
//
//                       case "lost":
//                         icon = Icons.search_off;
//                         color = Colors.orange;
//                         break;
//
//                       case "found":
//                         icon = Icons.check_circle;
//                         color = Colors.green;
//                         break;
//
//                       case "claim":
//                         icon = Icons.assignment;
//                         color = Colors.purple;
//                         break;
//
//                       case "approved":
//                         icon = Icons.verified;
//                         color = Colors.green;
//                         break;
//
//                       case "rejected":
//                         icon = Icons.cancel;
//                         color = Colors.red;
//                         break;
//
//                       default:
//                         icon = Icons.notifications;
//                         color = Colors.grey;
//                     }
//
//                     return Column(
//                       children: [
//
//                         ListTile(
//
//                           leading: CircleAvatar(
//                             backgroundColor: color,
//
//                             child: Icon(
//                               icon,
//                               color: Colors.white,
//                             ),
//                           ),
//
//                           title: Text(
//                             data['title'] ?? '',
//                           ),
//
//                           subtitle: Column(
//                             crossAxisAlignment:
//                             CrossAxisAlignment.start,
//
//                             children: [
//
//                               Text(
//                                 data['subtitle'] ?? '',
//                               ),
//
//                               const SizedBox(height: 4),
//
//                               Text(
//                                 data['createdAt'] != null
//                                     ? (data['createdAt']
//                                 as Timestamp)
//                                     .toDate()
//                                     .toString()
//                                     .substring(0, 16)
//                                     : '',
//
//                                 style: const TextStyle(
//                                   fontSize: 11,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//
//                         const Divider(),
//                       ],
//                     );
//
//                   }).toList(),
//                 );
//               },
//             ),
//           ),
//           // Container(
//           //   width: double.infinity,
//           //   padding: const EdgeInsets.all(20),
//           //
//           //   decoration: BoxDecoration(
//           //     color: Colors.white,
//           //     borderRadius: BorderRadius.circular(16),
//           //
//           //     boxShadow: [
//           //       BoxShadow(
//           //         color: Colors.black.withOpacity(0.05),
//           //         blurRadius: 8,
//           //         offset: const Offset(0, 3),
//           //       ),
//           //     ],
//           //   ),
//           //
//           //   child: StreamBuilder<QuerySnapshot>(
//           //     stream: FirebaseFirestore.instance
//           //         .collection('items')
//           //         .orderBy('createdAt', descending: true)
//           //         .limit(5)
//           //         .snapshots(),
//           //
//           //     builder: (context, snapshot) {
//           //
//           //       if (!snapshot.hasData) {
//           //         return const Center(
//           //           child: CircularProgressIndicator(),
//           //         );
//           //       }
//           //
//           //       final docs = snapshot.data!.docs;
//           //
//           //       if (docs.isEmpty) {
//           //         return const Text("No recent activity");
//           //       }
//           //
//           //       return Column(
//           //         children: docs.map((doc) {
//           //           final data = doc.data() as Map<String, dynamic>;
//           //
//           //           return ListTile(
//           //             leading: CircleAvatar(
//           //               backgroundColor: data['type'] == 'lost'
//           //                   ? Colors.red
//           //                   : Colors.green,
//           //               child: Icon(
//           //                 data['type'] == 'lost'
//           //                     ? Icons.search_off
//           //                     : Icons.check,
//           //                 color: Colors.white,
//           //               ),
//           //             ),
//           //
//           //             title: Text(data['itemName'] ?? "Item"),
//           //             subtitle: Text(
//           //               data['type'] == 'lost'
//           //                   ? "Lost Item added"
//           //                   : "Found Item added",
//           //             ),
//           //           );
//           //         }).toList(),
//           //       );
//           //     },
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }





//```dart id="m4g8tf"
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../services/dashboard_service.dart';
import '../../widgets/dashboardcard.dart';

class DashboardHomeScreen extends StatelessWidget {
const DashboardHomeScreen({super.key});

static const Color bgColor = Color(0xFFEFF5FB);

@override
Widget build(BuildContext context) {

final service = DashboardService();

// ✅ OVERFLOW FIXES ADDED
// 1. LayoutBuilder
// 2. ConstrainedBox
// 3. Wrap instead of Row
// 4. Responsive card wrapping
// 5. Safe scrolling

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

// 🔷 TITLE
// const Text(
// "Dashboard",
// style: TextStyle(
// fontSize: 32,
// fontWeight: FontWeight.bold,
// ),
// ),

const SizedBox(height: 30),

// 🔷 CARDS ROW 1
// ✅ CHANGED ROW → WRAP
Wrap(

spacing: 20,
runSpacing: 20,

children: [

StreamBuilder<int>(
stream: service.getUsersCount(),

builder: (context, snapshot) {

return DashboardCard(
title: "Users",

value:
(snapshot.data ?? 0)
    .toString(),

icon: Icons.people,

color: Colors.blue,
);
},
),

StreamBuilder<int>(
stream: service.getItemsCount(),

builder: (context, snapshot) {

return DashboardCard(

title: "Items",

value:
(snapshot.data ?? 0)
    .toString(),

icon:
Icons.inventory_2,

color: Colors.orange,
);
},
),

StreamBuilder<int>(
stream:
service.getClaimsCount(),

builder: (context, snapshot) {

return DashboardCard(

title: "Claims",

value:
(snapshot.data ?? 0)
    .toString(),

icon:
Icons.assignment,

color: Colors.purple,
);
},
),
],
),

const SizedBox(height: 20),

// 🔷 CARDS ROW 2
// ✅ CHANGED ROW → WRAP
Wrap(

spacing: 20,
runSpacing: 20,

children: [

StreamBuilder<int>(
stream:
service.getLostItemsCount(),

builder: (context, snapshot) {

return DashboardCard(

title: "Lost Items",

value:
(snapshot.data ?? 0)
    .toString(),

icon:
Icons.search_off,

color: Colors.red,
);
},
),

StreamBuilder<int>(
stream:
service.getFoundItemsCount(),

builder: (context, snapshot) {

return DashboardCard(

title: "Found Items",

value:
(snapshot.data ?? 0)
    .toString(),

icon:
Icons.check_circle,

color: Colors.green,
);
},
),

StreamBuilder<int>(
stream:
service.getPendingClaimsCount(),

builder: (context, snapshot) {

return DashboardCard(

title:
"Pending Claims",

value:
(snapshot.data ?? 0)
    .toString(),

icon:
Icons.pending_actions,

color: Colors.amber,
);
},
),
],
),

const SizedBox(height: 40),

// 🔷 RECENT ACTIVITY TITLE
const Text(

"Recent Activity",

style: TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 20),

// 🔷 LIVE ACTIVITY CONTAINER
Container(

width: double.infinity,

padding:
const EdgeInsets.all(20),

decoration: BoxDecoration(

color: Colors.white,

borderRadius:
BorderRadius.circular(16),

boxShadow: [

BoxShadow(
color: Colors.black
    .withOpacity(0.05),

blurRadius: 8,

offset:
const Offset(0, 3),
),
],
),

child: StreamBuilder<QuerySnapshot>(

stream: FirebaseFirestore
    .instance
    .collection('activity')
    .orderBy(
'createdAt',
descending: true,
)
    .limit(10)
    .snapshots(),

builder: (context, snapshot) {

if (snapshot.connectionState ==
ConnectionState.waiting) {

return const Center(
child:
CircularProgressIndicator(),
);
}

if (!snapshot.hasData ||
snapshot.data!.docs.isEmpty) {

return const Center(
child: Text(
"No recent activity",
),
);
}

final activities =
snapshot.data!.docs;

return Column(

children:
activities.map((doc) {

final data =
doc.data()
as Map<String, dynamic>;

final type =
data['type'] ?? '';

IconData icon;
Color color;

// 🔷 ICON + COLOR
switch (type) {

case "user":
icon = Icons.person;
color = Colors.blue;
break;

case "lost":
icon =
Icons.search_off;
color =
Colors.orange;
break;

case "found":
icon =
Icons.check_circle;
color =
Colors.green;
break;

case "claim":
icon =
Icons.assignment;
color =
Colors.purple;
break;

case "approved":
icon =
Icons.verified;
color =
Colors.green;
break;

case "rejected":
icon = Icons.cancel;
color = Colors.red;
break;

default:
icon =
Icons.notifications;
color = Colors.grey;
}

return Column(

children: [

ListTile(

leading: CircleAvatar(

backgroundColor:
color,

child: Icon(

icon,

color:
Colors.white,
),
),

title: Text(
data['title'] ??
'',
),

subtitle: Column(

crossAxisAlignment:
CrossAxisAlignment
    .start,

children: [

Text(
data['subtitle'] ??
'',
),

const SizedBox(
height: 4),

Text(

data['createdAt'] !=
null
? (data['createdAt']
as Timestamp)
    .toDate()
    .toString()
    .substring(
0,
16)
    : '',

style:
const TextStyle(
fontSize: 11,
color:
Colors.grey,
),
),
],
),
),

const Divider(),
],
);

}).toList(),
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

