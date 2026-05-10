// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class DuplicateAlertsScreen extends StatelessWidget {
//   const DuplicateAlertsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Duplicate Alerts"),
//         backgroundColor: Colors.blue,
//       ),
//
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection("duplicate_alerts")
//             .where("status", isEqualTo: "pending")
//             .orderBy("createdAt", descending: true)
//             .snapshots(),
//         builder: (context, snapshot) {
//
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           final docs = snapshot.data!.docs;
//
//           if (docs.isEmpty) {
//             return const Center(
//               child: Text("No duplicate alerts found"),
//             );
//           }
//
//           return ListView.builder(
//             itemCount: docs.length,
//             itemBuilder: (context, index) {
//
//               final data =
//               docs[index].data() as Map<String, dynamic>;
//               return Card(
//                 margin: const EdgeInsets.all(10),
//                 child: ExpansionTile(
//                   leading: const Icon(Icons.warning, color: Colors.red),
//
//                   title: Text(data["itemName"] ?? "Unknown Item"),
//
//                   subtitle: Text(
//                     "Similarity: ${data["similarity"]}",
//                   ),
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: FutureBuilder(
//                           future: Future.wait([
//                             FirebaseFirestore.instance
//                                 .collection("items")
//                                 .doc(data["itemId"])
//                                 .get(),
//                             FirebaseFirestore.instance
//                                 .collection("items")
//                                 .doc(data["duplicateItemId"])
//                                 .get(),
//                           ]),
//
//                           builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
//
//                             if (!snapshot.hasData) {
//                               return const Center(
//                                 child: CircularProgressIndicator(),
//                               );
//                             }
//                             if (snapshot.hasError) {
//                               return Text(snapshot.error.toString());
//                             }
//
//                             final original = snapshot.data![0].data();
//                             final duplicate = snapshot.data![1].data();
//                             return Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//
//                                 // 🔥 Original Item UI here
//                                 const Text("Original Item"),
//                                 Text("Name: ${original['itemName']}"),
//                                 Text("Description: ${original['description']}"),
//                                 Text("Location: ${original['location']}"),
//
//                                 if (original['imageUrl'] != null)
//                                   Image.network(original['imageUrl'], height: 120),
//
//                                 const Divider(),
//
//                                 // 🔥 Duplicate Item UI here
//                                 const Text("Duplicate Item"),
//                                 Text("Name: ${duplicate['itemName']}"),
//                                 Text("Description: ${duplicate['description']}"),
//                                 Text("Location: ${duplicate['location']}"),
//
//                                 if (duplicate['imageUrl'] != null)
//                                   Image.network(duplicate['imageUrl'], height: 120),
//
//                                 // ✅ THIS IS WHERE YOUR ROW GOES
//                                 const SizedBox(height: 20),
//
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
//
//                                     ElevatedButton.icon(
//                                       onPressed: () async {
//                                         await FirebaseFirestore.instance
//                                             .collection("duplicate_alerts")
//                                             .doc(data["itemId"])
//                                             .update({
//                                           "status": "confirmed",
//                                         });
//                                       },
//                                       icon: const Icon(Icons.check),
//                                       label: const Text("Confirm"),
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.green,
//                                       ),
//                                     ),
//
//                                     ElevatedButton.icon(
//                                       onPressed: () async {
//                                         await FirebaseFirestore.instance
//                                             .collection("duplicate_alerts")
//                                             .doc(data["itemId"])
//                                             .delete();
//                                       },
//                                       icon: const Icon(Icons.close),
//                                       label: const Text("Ignore"),
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.grey,
//                                       ),
//                                     ),
//
//                                     ElevatedButton.icon(
//                                       onPressed: () async {
//                                         await FirebaseFirestore.instance
//                                             .collection("items")
//                                             .doc(data["duplicateItemId"])
//                                             .delete();
//
//                                         await FirebaseFirestore.instance
//                                             .collection("duplicate_alerts")
//                                             .doc(data["itemId"])
//                                             .delete();
//                                       },
//                                       icon: const Icon(Icons.delete),
//                                       label: const Text("Delete Item"),
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.red,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             );
//                             // return Column(
//                             //   crossAxisAlignment: CrossAxisAlignment.start,
//                             //   children: [
//                             //
//                             //     // 🔥 ORIGINAL ITEM
//                             //     const Text(
//                             //       "Original Item",
//                             //       style: TextStyle(
//                             //           fontSize: 16,
//                             //           fontWeight: FontWeight.bold),
//                             //     ),
//                             //
//                             //     const SizedBox(height: 5),
//                             //
//                             //     Text("Name: ${original['itemName']}"),
//                             //     Text("Description: ${original['description']}"),
//                             //     Text("Location: ${original['location']}"),
//                             //
//                             //     const SizedBox(height: 10),
//                             //
//                             //     if (original['imageUrl'] != null)
//                             //       Image.network(
//                             //         original['imageUrl'],
//                             //         height: 120,
//                             //       ),
//                             //
//                             //     const Divider(),
//                             //
//                             //     // 🔥 DUPLICATE ITEM
//                             //     const Text(
//                             //       "Duplicate Item",
//                             //       style: TextStyle(
//                             //           fontSize: 16,
//                             //           fontWeight: FontWeight.bold),
//                             //     ),
//                             //
//                             //     const SizedBox(height: 5),
//                             //
//                             //     Text("Name: ${duplicate['itemName']}"),
//                             //     Text("Description: ${duplicate['description']}"),
//                             //     Text("Location: ${duplicate['location']}"),
//                             //
//                             //     const SizedBox(height: 10),
//                             //
//                             //     if (duplicate['imageUrl'] != null)
//                             //       Image.network(
//                             //         duplicate['imageUrl'],
//                             //         height: 120,
//                             //       ),
//                             //   ],
//                             // );
//
//                           },
//                         ),
//                       ),
//                     ]
//                   // children: [
//                   //   Padding(
//                   //     padding: const EdgeInsets.all(12.0),
//                   //     child: Column(
//                   //       crossAxisAlignment: CrossAxisAlignment.start,
//                   //       children: [
//                   //
//                   //         Text(
//                   //           "Original Item ID: ${data["itemId"]}",
//                   //         ),
//                   //
//                   //         Text(
//                   //           "Duplicate Item ID: ${data["duplicateItemId"]}",
//                   //         ),
//                   //
//                   //         const SizedBox(height: 10),
//                   //
//                   //         // 🔥 We will load items next step
//                   //         const Text(
//                   //           "Loading item details...",
//                   //           style: TextStyle(color: Colors.grey),
//                   //         ),
//                   //       ],
//                   //     ),
//                   //   )
//                   // ],
//                 ),
//               );
//               // return Card(
//               //   margin: const EdgeInsets.all(10),
//               //   child: ListTile(
//               //     title: Text(data["itemName"] ?? "Unknown Item"),
//               //     subtitle: Text(
//               //       "Similarity: ${data["similarity"]}",
//               //     ),
//               //
//               //     trailing: const Icon(Icons.warning, color: Colors.red),
//               //   ),
//               // );
//             },
//           );
//         },
//       ),
//     );
//   }
// }



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class DuplicateAlertsScreen extends StatelessWidget {
//   const DuplicateAlertsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final alertsRef =
//     FirebaseFirestore.instance.collection("duplicate_alerts");
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Duplicate Alerts"),
//         backgroundColor: Colors.blue,
//       ),
//
//       body: StreamBuilder<QuerySnapshot>(
//         stream: alertsRef
//             .where("status", isEqualTo: "pending")
//             .orderBy("createdAt", descending: true)
//             .snapshots(),
//         builder: (context, snapshot) {
//
//           // 🔴 Error handling (IMPORTANT FIX)
//           if (snapshot.hasError) {
//             return Center(
//               child: Text("Error: ${snapshot.error}"),
//             );
//           }
//
//           // 🟡 Loading state
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           final docs = snapshot.data?.docs ?? [];
//
//           if (docs.isEmpty) {
//             return const Center(child: Text("No duplicate alerts found"));
//           }
//
//           return ListView.builder(
//             itemCount: docs.length,
//             itemBuilder: (context, index) {
//               final alertDoc = docs[index];
//               final data = alertDoc.data() as Map<String, dynamic>;
//
//               final alertId = alertDoc.id; // ✅ FIXED (IMPORTANT)
//
//               return DuplicateAlertCard(
//                 alertId: alertId,
//                 data: data,
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class DuplicateAlertCard extends StatelessWidget {
//   final String alertId;
//   final Map<String, dynamic> data;
//
//   const DuplicateAlertCard({
//     super.key,
//     required this.alertId,
//     required this.data,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final itemId = data["itemId"];
//     final duplicateItemId = data["duplicateItemId"];
//
//     return Card(
//       margin: const EdgeInsets.all(10),
//       child: ExpansionTile(
//         leading: const Icon(Icons.warning, color: Colors.red),
//         title: Text(data["itemName"] ?? "Unknown Item"),
//         subtitle: Text("Similarity: ${data["similarity"] ?? 0}"),
//
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: FutureBuilder<List<DocumentSnapshot>>(
//               future: Future.wait([
//                 FirebaseFirestore.instance
//                     .collection("items")
//                     .doc(itemId)
//                     .get(),
//                 FirebaseFirestore.instance
//                     .collection("items")
//                     .doc(duplicateItemId)
//                     .get(),
//               ]),
//
//               builder: (context, snapshot) {
//
//                 if (snapshot.hasError) {
//                   return Text("Error loading items");
//                 }
//                 if (snapshot.hasError) {
//                   print("🔥 Firestore Stream Error: ${snapshot.error}");
//                 }
//                 if (snapshot.hasError) {
//                   debugPrint("🔥 Firestore Stream Error:");
//                   debugPrint(snapshot.error.toString());
//
//                   // IMPORTANT: rethrow to trigger console index link
//                   throw snapshot.error!;
//                 }
//
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//
//                 final docs = snapshot.data ?? [];
//                 if (docs.length < 2) {
//                   return const Text("Item data not found");
//                 }
//
//                 final original =
//                     docs[0].data() as Map<String, dynamic>? ?? {};
//                 final duplicate =
//                     docs[1].data() as Map<String, dynamic>? ?? {};
//
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildItemSection("Original Item", original),
//                     const Divider(),
//                     _buildItemSection("Duplicate Item", duplicate),
//                     const SizedBox(height: 20),
//
//                     _buildActions(context, duplicateItemId),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildItemSection(String title, Map<String, dynamic> item) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title,
//             style: const TextStyle(
//                 fontSize: 16, fontWeight: FontWeight.bold)),
//         const SizedBox(height: 8),
//
//         Text("Name: ${item["itemName"] ?? "N/A"}"),
//         Text("Description: ${item["description"] ?? "N/A"}"),
//         Text("Location: ${item["location"] ?? "N/A"}"),
//
//         const SizedBox(height: 10),
//
//         if (item["imageUrl"] != null)
//           Image.network(
//             item["imageUrl"],
//             height: 120,
//             fit: BoxFit.cover,
//           ),
//       ],
//     );
//   }
//
//   Widget _buildActions(BuildContext context, String duplicateItemId) {
//     final alertsRef =
//     FirebaseFirestore.instance.collection("duplicate_alerts");
//
//     final itemsRef = FirebaseFirestore.instance.collection("items");
//
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         ElevatedButton.icon(
//           onPressed: () async {
//             await alertsRef.doc(alertId).update({
//               "status": "confirmed",
//             });
//           },
//           icon: const Icon(Icons.check),
//           label: const Text("Confirm"),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.green,
//           ),
//         ),
//
//         ElevatedButton.icon(
//           onPressed: () async {
//             await alertsRef.doc(alertId).delete();
//           },
//           icon: const Icon(Icons.close),
//           label: const Text("Ignore"),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.grey,
//           ),
//         ),
//
//         ElevatedButton.icon(
//           onPressed: () async {
//             await itemsRef.doc(duplicateItemId).delete();
//             await alertsRef.doc(alertId).delete();
//           },
//           icon: const Icon(Icons.delete),
//           label: const Text("Delete"),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.red,
//           ),
//         ),
//       ],
//     );
//   }
// }

//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class DuplicateAlertsScreen extends StatelessWidget {
//   const DuplicateAlertsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final alertsRef =
//     FirebaseFirestore.instance.collection("duplicate_alerts");
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Duplicate Alerts"),
//         backgroundColor: Colors.blue,
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: alertsRef
//             .where("status", isEqualTo: "pending")
//             .orderBy("createdAt", descending: true)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           final docs = snapshot.data?.docs ?? [];
//
//           if (docs.isEmpty) {
//             return const Center(child: Text("No duplicate alerts found"));
//           }
//
//           return ListView.builder(
//             itemCount: docs.length,
//             itemBuilder: (context, index) {
//               final doc = docs[index];
//               final data = doc.data() as Map<String, dynamic>;
//
//               return DuplicateAlertCard(
//                 alertId: doc.id,
//                 data: data,
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class DuplicateAlertCard extends StatelessWidget {
//   final String alertId;
//   final Map<String, dynamic> data;
//
//   const DuplicateAlertCard({
//     super.key,
//     required this.alertId,
//     required this.data,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       child: ListTile(
//         leading: const Icon(Icons.warning, color: Colors.red),
//         title: Text(data["itemName"] ?? "Unknown Item"),
//         subtitle: Text("Similarity: ${data["similarity"] ?? 0}%"),
//
//         trailing: IconButton(
//           icon: const Icon(Icons.visibility, color: Colors.blue),
//           onPressed: () {
//             _openDetails(context);
//           },
//         ),
//       ),
//     );
//   }
//
//   void _openDetails(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.white,
//       builder: (_) {
//         return FutureBuilder<List<DocumentSnapshot>>(
//           future: Future.wait([
//             FirebaseFirestore.instance
//                 .collection("items")
//                 .doc(data["itemId"])
//                 .get(),
//             FirebaseFirestore.instance
//                 .collection("items")
//                 .doc(data["duplicateItemId"])
//                 .get(),
//           ]),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return const SizedBox(
//                 height: 300,
//                 child: Center(child: CircularProgressIndicator()),
//               );
//             }
//
//             final docs = snapshot.data!;
//             final original =
//                 docs[0].data() as Map<String, dynamic>? ?? {};
//             final duplicate =
//                 docs[1].data() as Map<String, dynamic>? ?? {};
//
//             return Padding(
//               padding: const EdgeInsets.all(16),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Duplicate Alert Details",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//
//                     const SizedBox(height: 12),
//
//                     _buildSection("Original Item", original),
//                     const Divider(),
//                     _buildSection("Duplicate Item", duplicate),
//
//                     const SizedBox(height: 20),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () async {
//                             await FirebaseFirestore.instance
//                                 .collection("duplicate_alerts")
//                                 .doc(alertId)
//                                 .update({"status": "confirmed"});
//                             Navigator.pop(context);
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.green,
//                           ),
//                           child: const Text("Confirm"),
//                         ),
//
//                         ElevatedButton(
//                           onPressed: () async {
//                             await FirebaseFirestore.instance
//                                 .collection("duplicate_alerts")
//                                 .doc(alertId)
//                                 .delete();
//                             Navigator.pop(context);
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.grey,
//                           ),
//                           child: const Text("Ignore"),
//                         ),
//
//                         ElevatedButton(
//                           onPressed: () async {
//                             await FirebaseFirestore.instance
//                                 .collection("items")
//                                 .doc(data["duplicateItemId"])
//                                 .delete();
//
//                             await FirebaseFirestore.instance
//                                 .collection("duplicate_alerts")
//                                 .doc(alertId)
//                                 .delete();
//
//                             Navigator.pop(context);
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.red,
//                           ),
//                           child: const Text("Delete"),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildSection(String title, Map<String, dynamic> item) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text("Name: ${item["itemName"] ?? "N/A"}"),
//         Text("Description: ${item["description"] ?? "N/A"}"),
//         Text("Location: ${item["location"] ?? "N/A"}"),
//         const SizedBox(height: 10),
//         if (item["imageUrl"] != null)
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.network(
//               item["imageUrl"],
//               height: 120,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//       ],
//     );
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class DuplicateAlertsScreen extends StatelessWidget {
//   const DuplicateAlertsScreen({super.key});
//
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//     final alertsRef =
//     FirebaseFirestore.instance.collection("duplicate_alerts");
//
//     return Scaffold(
//       backgroundColor: bgColor,
//       appBar: AppBar(
//         title: const Text("Duplicate Alerts"),
//         backgroundColor: Colors.blue,
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: alertsRef
//             .where("status", isEqualTo: "pending")
//             .orderBy("createdAt", descending: true)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           final docs = snapshot.data?.docs ?? [];
//
//           if (docs.isEmpty) {
//             return const Center(
//               child: Text("No duplicate alerts found"),
//             );
//           }
//
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: docs.length,
//             itemBuilder: (context, index) {
//               final doc = docs[index];
//               final data = doc.data() as Map<String, dynamic>;
//
//               return _AlertCard(
//                 alertId: doc.id,
//                 data: data,
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class _AlertCard extends StatelessWidget {
//   final String alertId;
//   final Map<String, dynamic> data;
//
//   const _AlertCard({
//     required this.alertId,
//     required this.data,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 8,
//           ),
//         ],
//       ),
//       child: ListTile(
//         contentPadding: EdgeInsets.zero,
//
//         leading: const Icon(
//           Icons.warning_amber_rounded,
//           color: Colors.red,
//           size: 30,
//         ),
//
//         title: Text(
//           data["itemName"] ?? "Unknown Item",
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//
//         subtitle: Text(
//           "Similarity: ${(data["similarity"] ?? 0.0) * 100}%",
//         ),
//
//         trailing: IconButton(
//           icon: const Icon(Icons.visibility, color: Colors.blue),
//           onPressed: () {
//             _openDetails(context, alertId, data);
//           },
//         ),
//       ),
//     );
//   }
//
//   void _openDetails(
//       BuildContext context,
//       String alertId,
//       Map<String, dynamic> data,
//       ) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (_) {
//         return DraggableScrollableSheet(
//           initialChildSize: 0.92,
//           minChildSize: 0.6,
//           maxChildSize: 0.95,
//           builder: (context, scrollController) {
//             return Container(
//               decoration: const BoxDecoration(
//                 color: Color(0xFFEFF5FB),
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(20),
//                 ),
//               ),
//               child: FutureBuilder<List<DocumentSnapshot>>(
//                 future: Future.wait([
//                   FirebaseFirestore.instance
//                       .collection("items")
//                       .doc(data["itemId"])
//                       .get(),
//                   FirebaseFirestore.instance
//                       .collection("items")
//                       .doc(data["duplicateItemId"])
//                       .get(),
//                 ]),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//
//                   final docs = snapshot.data!;
//                   final original =
//                       docs[0].data() as Map<String, dynamic>? ?? {};
//                   final duplicate =
//                       docs[1].data() as Map<String, dynamic>? ?? {};
//
//                   return Column(
//                     children: [
//
//                       // 🔷 HEADER (like your dashboard style)
//                       Container(
//                         padding: const EdgeInsets.all(16),
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.vertical(
//                             top: Radius.circular(20),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               "Duplicate Review",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.close),
//                               onPressed: () =>
//                                   Navigator.pop(context),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // 🔷 CONTENT
//                       Expanded(
//                         child: SingleChildScrollView(
//                           controller: scrollController,
//                           padding: const EdgeInsets.all(16),
//                           child: Column(
//                             children: [
//
//                               _itemCard(
//                                 "Original Item",
//                                 original,
//                               ),
//
//                               const SizedBox(height: 12),
//
//                               _itemCard(
//                                 "Duplicate Item",
//                                 duplicate,
//                               ),
//
//                               const SizedBox(height: 20),
//
//                               // 🔷 ACTION PANEL
//                               Container(
//                                 padding: const EdgeInsets.all(14),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius:
//                                   BorderRadius.circular(16),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment
//                                       .spaceBetween,
//                                   children: [
//
//                                     ElevatedButton.icon(
//                                       onPressed: () async {
//                                         await FirebaseFirestore
//                                             .instance
//                                             .collection(
//                                             "duplicate_alerts")
//                                             .doc(alertId)
//                                             .update({
//                                           "status": "confirmed",
//                                         });
//
//                                         Navigator.pop(context);
//                                       },
//                                       icon: const Icon(Icons.check),
//                                       label: const Text("Confirm"),
//                                       style:
//                                       ElevatedButton.styleFrom(
//                                         backgroundColor:
//                                         Colors.green,
//                                       ),
//                                     ),
//
//                                     ElevatedButton.icon(
//                                       onPressed: () async {
//                                         await FirebaseFirestore
//                                             .instance
//                                             .collection(
//                                             "duplicate_alerts")
//                                             .doc(alertId)
//                                             .delete();
//
//                                         Navigator.pop(context);
//                                       },
//                                       icon: const Icon(Icons.close),
//                                       label: const Text("Ignore"),
//                                       style:
//                                       ElevatedButton.styleFrom(
//                                         backgroundColor:
//                                         Colors.grey,
//                                       ),
//                                     ),
//
//                                     // ElevatedButton.icon(
//                                     //   onPressed: () async {
//                                     //     await FirebaseFirestore
//                                     //         .instance
//                                     //         .collection("items")
//                                     //         .doc(
//                                     //       data[
//                                     //       "duplicateItemId"],
//                                     //     )
//                                     //         .delete();
//                                     //
//                                     //     await FirebaseFirestore
//                                     //         .instance
//                                     //         .collection(
//                                     //         "duplicate_alerts")
//                                     //         .doc(alertId)
//                                     //         .delete();
//                                     //
//                                     //     Navigator.pop(context);
//                                     //   },
//                                     //   icon: const Icon(Icons.delete),
//                                     //   label: const Text("Delete"),
//                                     //   style:
//                                     //   ElevatedButton.styleFrom(
//                                     //     backgroundColor: Colors.red,
//                                     //   ),
//                                     // ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _itemCard(String title, Map<String, dynamic> item) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 8,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text("Name: ${item["itemName"] ?? "N/A"}"),
//           Text("Description: ${item["description"] ?? "N/A"}"),
//           Text("Location: ${item["location"] ?? "N/A"}"),
//           const SizedBox(height: 10),
//           if (item["imageUrl"] != null)
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.network(
//                 item["imageUrl"],
//                 height: 140,
//                 width: double.infinity,
//                 fit: BoxFit.fill,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class DuplicateAlertsScreen extends StatelessWidget {
//   const DuplicateAlertsScreen({super.key});
//
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//     final alertsRef =
//     FirebaseFirestore.instance.collection("duplicate_alerts");
//
//     return Scaffold(
//       backgroundColor: bgColor,
//       appBar: AppBar(
//         title: const Text("Duplicate Alerts"),
//         backgroundColor: Colors.blue,
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: alertsRef
//             .where("status", isEqualTo: "pending")
//             .orderBy("createdAt", descending: true)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           final docs = snapshot.data?.docs ?? [];
//
//           if (docs.isEmpty) {
//             return const Center(child: Text("No duplicate alerts found"));
//           }
//
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: docs.length,
//             itemBuilder: (context, index) {
//               final doc = docs[index];
//               final data = doc.data() as Map<String, dynamic>;
//
//               return _AlertCard(
//                 alertId: doc.id,
//                 data: data,
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class _AlertCard extends StatelessWidget {
//   final String alertId;
//   final Map<String, dynamic> data;
//
//   const _AlertCard({
//     required this.alertId,
//     required this.data,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 8,
//           ),
//         ],
//       ),
//       child: ListTile(
//         contentPadding: EdgeInsets.zero,
//         leading: const Icon(
//           Icons.warning_amber_rounded,
//           color: Colors.red,
//           size: 30,
//         ),
//         title: Text(
//           data["itemName"] ?? "Unknown Item",
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text(
//           "Similarity: ${(data["similarity"] ?? 0.0) * 100}%",
//         ),
//         trailing: IconButton(
//           icon: const Icon(Icons.visibility, color: Colors.blue),
//           onPressed: () {
//             _openDetails(context, alertId, data);
//           },
//         ),
//       ),
//     );
//   }
//
//   void _openDetails(
//       BuildContext context,
//       String alertId,
//       Map<String, dynamic> data,
//       ) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (_) {
//         return DraggableScrollableSheet(
//           initialChildSize: 0.92,
//           minChildSize: 0.6,
//           maxChildSize: 0.95,
//           builder: (context, scrollController) {
//             return Container(
//               decoration: const BoxDecoration(
//                 color: Color(0xFFEFF5FB),
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//               ),
//               child: FutureBuilder<List<DocumentSnapshot>>(
//                 future: Future.wait([
//                   FirebaseFirestore.instance
//                       .collection("items")
//                       .doc(data["itemId"])
//                       .get(),
//                   FirebaseFirestore.instance
//                       .collection("items")
//                       .doc(data["duplicateItemId"])
//                       .get(),
//                 ]),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//
//                   final docs = snapshot.data!;
//                   final original =
//                       docs[0].data() as Map<String, dynamic>? ?? {};
//                   final duplicate =
//                       docs[1].data() as Map<String, dynamic>? ?? {};
//
//                   return Column(
//                     children: [
//                       // HEADER
//                       Container(
//                         padding: const EdgeInsets.all(16),
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.vertical(
//                             top: Radius.circular(20),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               "Duplicate Review",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.close),
//                               onPressed: () => Navigator.pop(context),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // CONTENT
//                       Expanded(
//                         child: SingleChildScrollView(
//                           controller: scrollController,
//                           padding: const EdgeInsets.all(16),
//                           child: Column(
//                             children: [
//                               _itemCard("Original Item", original),
//                               const SizedBox(height: 12),
//                               _itemCard("Duplicate Item", duplicate),
//                               const SizedBox(height: 20),
//
//                               // 🔥 ACTION BUTTONS MOVED OUTSIDE CARD + RIGHT ALIGNED
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   ElevatedButton.icon(
//                                     onPressed: () async {
//                                       await FirebaseFirestore.instance
//                                           .collection("duplicate_alerts")
//                                           .doc(alertId)
//                                           .update({"status": "confirmed"});
//
//                                       Navigator.pop(context);
//                                     },
//                                     icon: const Icon(Icons.check),
//                                     label: const Text("Confirm"),
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.green,
//                                     ),
//                                   ),
//
//                                   const SizedBox(width: 10),
//
//                                   ElevatedButton.icon(
//                                     onPressed: () async {
//                                       await FirebaseFirestore.instance
//                                           .collection("duplicate_alerts")
//                                           .doc(alertId)
//                                           .delete();
//
//                                       Navigator.pop(context);
//                                     },
//                                     icon: const Icon(Icons.close),
//                                     label: const Text("Ignore"),
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _itemCard(String title, Map<String, dynamic> item) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 8,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text("Name: ${item["itemName"] ?? "N/A"}"),
//           Text("Description: ${item["description"] ?? "N/A"}"),
//           Text("Location: ${item["location"] ?? "N/A"}"),
//           const SizedBox(height: 10),
//           if (item["imageUrl"] != null)
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.network(
//                 item["imageUrl"],
//                 height: 140,
//                 width: double.infinity,
//                 fit: BoxFit.fill,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class DuplicateAlertsScreen extends StatelessWidget {
//   const DuplicateAlertsScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//     final alertsRef =
//     FirebaseFirestore.instance.collection("duplicate_alerts");
//
//     return Scaffold(
//       backgroundColor: bgColor,
//
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: darkBlue,
//         title: const Text(
//           "Duplicate Alerts",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//
//         child: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(20),
//
//           decoration: BoxDecoration(
//             color: Colors.white,
//
//             borderRadius: BorderRadius.circular(18),
//
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 10,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//
//           child: StreamBuilder<QuerySnapshot>(
//             stream: alertsRef
//                 .where("status", isEqualTo: "pending")
//                 .orderBy("createdAt", descending: true)
//                 .snapshots(),
//
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return Center(
//                   child: Text("Error: ${snapshot.error}"),
//                 );
//               }
//
//               if (snapshot.connectionState ==
//                   ConnectionState.waiting) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//
//               final docs = snapshot.data?.docs ?? [];
//
//               if (docs.isEmpty) {
//                 return const Center(
//                   child: Text(
//                     "No duplicate alerts found",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 );
//               }
//
//               return Column(
//                 crossAxisAlignment:
//                 CrossAxisAlignment.start,
//
//                 children: [
//
//                   // 🔷 HEADER
//                   Row(
//                     mainAxisAlignment:
//                     MainAxisAlignment.spaceBetween,
//
//                     children: [
//                       const Text(
//                         "Potential Duplicate Items",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//
//                       Container(
//                         padding:
//                         const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 10,
//                         ),
//
//                         decoration: BoxDecoration(
//                           color: Colors.red
//                               .withOpacity(0.1),
//
//                           borderRadius:
//                           BorderRadius.circular(12),
//                         ),
//
//                         child: Text(
//                           "${docs.length} Pending",
//                           style: const TextStyle(
//                             color: Colors.red,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 25),
//
//                   // 🔷 TABLE
//                   Expanded(
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//
//                       child: DataTable(
//
//                         columnSpacing: 50,
//
//                         headingRowHeight: 60,
//                         dataRowMinHeight: 90,
//                         dataRowMaxHeight: 100,
//
//                         headingRowColor:
//                         MaterialStateProperty.all(
//                           bgColor,
//                         ),
//
//                         border: TableBorder(
//                           horizontalInside: BorderSide(
//                             color: Colors.grey
//                                 .withOpacity(0.2),
//                           ),
//                         ),
//
//                         columns: const [
//
//                           // WARNING
//                           // DataColumn(
//                           //   label: Icon(
//                           //     Icons.warning_amber_rounded,
//                           //     color: Colors.red,
//                           //   ),
//                           // ),
//
//                           // ITEM
//                           DataColumn(
//                             label: Text(
//                               "Item Name",
//                               style: TextStyle(
//                                 fontWeight:
//                                 FontWeight.bold,
//                               ),
//                             ),
//                           ),
//
//                           // SIMILARITY
//                           DataColumn(
//                             label: Text(
//                               "Similarity",
//                               style: TextStyle(
//                                 fontWeight:
//                                 FontWeight.bold,
//                               ),
//                             ),
//                           ),
//
//                           // DETECTED ON
//                           DataColumn(
//                             label: Text(
//                               "Detected On",
//                               style: TextStyle(
//                                 fontWeight:
//                                 FontWeight.bold,
//                               ),
//                             ),
//                           ),
//
//                           // ACTIONS
//                           DataColumn(
//                             label: Text(
//                               "Actions",
//                               style: TextStyle(
//                                 fontWeight:
//                                 FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//
//                         rows: docs.map((doc) {
//                           final data =
//                           doc.data()
//                           as Map<String, dynamic>;
//
//                           final similarity =
//                           ((data["similarity"] ??
//                               0.0) *
//                               100)
//                               .toStringAsFixed(0);
//
//                           final timestamp =
//                           data["createdAt"]
//                           as Timestamp?;
//
//                           final date =
//                           timestamp != null
//                               ? "${timestamp.toDate().day}/${timestamp.toDate().month}/${timestamp.toDate().year}"
//                               : "N/A";
//
//                           return DataRow(
//                             cells: [
//
//                               // 🔴 WARNING ICON
//                               // const DataCell(
//                               //   Icon(
//                               //     Icons
//                               //         .warning_amber_rounded,
//                               //     color: Colors.red,
//                               //     size: 28,
//                               //   ),
//                               // ),
//
//                               // 🔷 ITEM
//                               DataCell(
//                                 SizedBox(
//                                   width: 300,
//
//                                   child: Row(
//                                     children: [
//
//
//                                       Container(
//                                         width: 45,
//                                         height: 45,
//
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(10),
//
//                                           image: data['duplicateImageUrl'] != null
//                                               ? DecorationImage(
//                                             image: NetworkImage(
//                                               data['duplicateImageUrl'],
//                                             ),
//                                             fit: BoxFit.cover,
//                                           )
//                                               : null,
//
//                                           color: Colors.black12,
//                                         ),
//
//                                         child: data['duplicateImageUrl'] == null
//                                             ? const Icon(Icons.inventory_2)
//                                             : null,
//                                       ),
//
//                                       const SizedBox(
//                                           width: 14),
//
//                                       Expanded(
//                                         child: Column(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .center,
//
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment
//                                               .start,
//
//                                           children: [
//                                             Text(
//                                               data["itemName"] ??
//                                                   "Unknown Item",
//
//                                               overflow:
//                                               TextOverflow
//                                                   .ellipsis,
//
//                                               style:
//                                               const TextStyle(
//                                                 fontWeight:
//                                                 FontWeight
//                                                     .bold,
//
//                                                 fontSize:
//                                                 15,
//                                               ),
//                                             ),
//
//                                             const SizedBox(
//                                                 height: 4),
//
//                                             // Text(
//                                             //   "Potential duplicate detected",
//                                             //
//                                             //   style:
//                                             //   TextStyle(
//                                             //     color: Colors
//                                             //         .grey[600],
//                                             //
//                                             //     fontSize:
//                                             //     13,
//                                             //   ),
//                                             // ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                               // 🔷 SIMILARITY
//                               DataCell(
//                                 Container(
//                                   padding:
//                                   const EdgeInsets
//                                       .symmetric(
//                                     horizontal: 16,
//                                     vertical: 8,
//                                   ),
//
//                                   decoration:
//                                   BoxDecoration(
//                                     color: Colors.red
//                                         .withOpacity(
//                                         0.12),
//
//                                     borderRadius:
//                                     BorderRadius
//                                         .circular(
//                                         20),
//                                   ),
//
//                                   child: Text(
//                                     "$similarity%",
//
//                                     style:
//                                     const TextStyle(
//                                       color: Colors.red,
//                                       fontWeight:
//                                       FontWeight
//                                           .bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//
//                               // 🔷 DATE
//                               DataCell(
//                                 Text(
//                                   date,
//                                   style: const TextStyle(
//                                     fontWeight:
//                                     FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//
//                               // 🔷 ACTION
//                               DataCell(
//                                 Container(
//                                   decoration:
//                                   BoxDecoration(
//                                   //   border: Border.all(
//                                   //     color: Colors.blue
//                                   //         .withOpacity(
//                                   //         0.2),
//                                   //   ),
//
//                                     borderRadius:
//                                     BorderRadius
//                                         .circular(
//                                         12),
//                                   ),
//
//                                   child: IconButton(
//                                     tooltip:
//                                     "View Details",
//
//                                     icon: const Icon(
//                                       Icons.visibility,
//                                       color: Colors.blue,
//                                     ),
//
//                                     onPressed: () {
//                                       _openDetails(
//                                         context,
//                                         doc.id,
//                                         data,
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _openDetails(
//       BuildContext context,
//       String alertId,
//       Map<String, dynamic> data,
//       ) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//
//       builder: (_) {
//         return DraggableScrollableSheet(
//           initialChildSize: 0.92,
//           minChildSize: 0.6,
//           maxChildSize: 0.95,
//
//           builder: (context, scrollController) {
//             return Container(
//               decoration: const BoxDecoration(
//                 color: bgColor,
//
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(24),
//                 ),
//               ),
//
//               child: FutureBuilder<
//                   List<DocumentSnapshot>>(
//                 future: Future.wait([
//
//                   FirebaseFirestore.instance
//                       .collection("items")
//                       .doc(data["itemId"])
//                       .get(),
//
//                   FirebaseFirestore.instance
//                       .collection("items")
//                       .doc(data["duplicateItemId"])
//                       .get(),
//                 ]),
//
//                 builder: (context, snapshot) {
//
//                   if (!snapshot.hasData) {
//                     return const Center(
//                       child:
//                       CircularProgressIndicator(),
//                     );
//                   }
//
//                   final docs = snapshot.data!;
//
//                   final original =
//                       docs[0].data()
//                       as Map<String, dynamic>? ??
//                           {};
//
//                   final duplicate =
//                       docs[1].data()
//                       as Map<String, dynamic>? ??
//                           {};
//
//                   return Column(
//                     children: [
//
//                       // 🔷 HEADER
//                       Container(
//                         padding:
//                         const EdgeInsets.all(20),
//
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//
//                           borderRadius:
//                           BorderRadius.vertical(
//                             top: Radius.circular(24),
//                           ),
//                         ),
//
//                         child: Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment
//                               .spaceBetween,
//
//                           children: [
//
//                             const Text(
//                               "Duplicate Review",
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight:
//                                 FontWeight.bold,
//                               ),
//                             ),
//
//                             IconButton(
//                               icon:
//                               const Icon(Icons.close),
//
//                               onPressed: () =>
//                                   Navigator.pop(
//                                       context),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // 🔷 CONTENT
//                       Expanded(
//                         child: SingleChildScrollView(
//                           controller: scrollController,
//
//                           padding:
//                           const EdgeInsets.all(20),
//
//                           child: Column(
//                             children: [
//
//                               Row(
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment
//                                     .start,
//
//                                 children: [
//
//                                   Expanded(
//                                     child: _itemCard(
//                                       "Original Item",
//                                       original,
//                                       Colors.green,
//                                     ),
//                                   ),
//
//                                   const SizedBox(
//                                       width: 20),
//
//                                   Expanded(
//                                     child: _itemCard(
//                                       "Duplicate Item",
//                                       duplicate,
//                                       Colors.blue,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                               const SizedBox(height: 30),
//
//                               Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment
//                                     .end,
//
//                                 children: [
//
//                                   ElevatedButton.icon(
//                                     onPressed: () async {
//
//                                       await FirebaseFirestore
//                                           .instance
//                                           .collection(
//                                           "duplicate_alerts")
//                                           .doc(alertId)
//                                           .update({
//                                         "status":
//                                         "confirmed"
//                                       });
//
//                                       Navigator.pop(
//                                           context);
//                                     },
//
//                                     icon: const Icon(
//                                         Icons.check),
//
//                                     label: const Text(
//                                         "Confirm"),
//
//                                     style:
//                                     ElevatedButton
//                                         .styleFrom(
//                                       backgroundColor:
//                                       Colors.green,
//
//                                       padding:
//                                       const EdgeInsets
//                                           .symmetric(
//                                         horizontal: 22,
//                                         vertical: 16,
//                                       ),
//
//                                       shape:
//                                       RoundedRectangleBorder(
//                                         borderRadius:
//                                         BorderRadius
//                                             .circular(
//                                             12),
//                                       ),
//                                     ),
//                                   ),
//
//                                   const SizedBox(
//                                       width: 12),
//
//                                   ElevatedButton.icon(
//                                     onPressed: () async {
//
//                                       await FirebaseFirestore
//                                           .instance
//                                           .collection(
//                                           "duplicate_alerts")
//                                           .doc(alertId)
//                                           .delete();
//
//                                       Navigator.pop(
//                                           context);
//                                     },
//
//                                     icon: const Icon(
//                                         Icons.close),
//
//                                     label:
//                                     const Text("Ignore"),
//
//                                     style:
//                                     ElevatedButton
//                                         .styleFrom(
//                                       backgroundColor:
//                                       Colors.grey,
//
//                                       padding:
//                                       const EdgeInsets
//                                           .symmetric(
//                                         horizontal: 22,
//                                         vertical: 16,
//                                       ),
//
//                                       shape:
//                                       RoundedRectangleBorder(
//                                         borderRadius:
//                                         BorderRadius
//                                             .circular(
//                                             12),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _itemCard(
//       String title,
//       Map<String, dynamic> item,
//       Color color,
//       ) {
//     return Container(
//       padding: const EdgeInsets.all(18),
//
//       decoration: BoxDecoration(
//         color: Colors.white,
//
//         borderRadius: BorderRadius.circular(18),
//
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 8,
//           ),
//         ],
//       ),
//
//       child: Column(
//         crossAxisAlignment:
//         CrossAxisAlignment.start,
//
//         children: [
//
//           // 🔷 TITLE
//           Container(
//             padding:
//             const EdgeInsets.symmetric(
//               horizontal: 14,
//               vertical: 10,
//             ),
//
//             decoration: BoxDecoration(
//               color: color.withOpacity(0.1),
//
//               borderRadius:
//               BorderRadius.circular(12),
//             ),
//
//             child: Row(
//               children: [
//
//                 Icon(
//                   Icons.verified,
//                   color: color,
//                   size: 20,
//                 ),
//
//                 const SizedBox(width: 10),
//
//                 Text(
//                   title,
//
//                   style: TextStyle(
//                     color: color,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 18),
//
//           // 🔷 IMAGE
//           if (item["imageUrl"] != null)
//             ClipRRect(
//               borderRadius:
//               BorderRadius.circular(14),
//
//               child: Image.network(
//                 item["imageUrl"],
//
//                 height: 220,
//                 width: double.infinity,
//
//                 fit: BoxFit.cover,
//               ),
//             ),
//
//           const SizedBox(height: 18),
//
//           Text(
//             item["itemName"] ?? "N/A",
//
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           const SizedBox(height: 10),
//
//           Text(
//             item["description"] ?? "No description",
//
//             style: TextStyle(
//               color: Colors.grey[700],
//               height: 1.5,
//             ),
//           ),
//
//           const SizedBox(height: 14),
//
//           Row(
//             children: [
//
//               const Icon(
//                 Icons.location_on,
//                 size: 18,
//                 color: Colors.grey,
//               ),
//
//               const SizedBox(width: 6),
//
//               Expanded(
//                 child: Text(
//                   item["location"] ?? "N/A",
//
//                   style: TextStyle(
//                     color: Colors.grey[700],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class DuplicateAlertsScreen extends StatelessWidget {
//   const DuplicateAlertsScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//     final alertsRef =
//     FirebaseFirestore.instance.collection("duplicate_alerts");
//
//     return Container(
//       color: bgColor,
//
//       child: Padding(
//         padding: const EdgeInsets.all(25),
//
//         child: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(20),
//
//           decoration: BoxDecoration(
//             color: Colors.white,
//
//             borderRadius: BorderRadius.circular(18),
//
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 10,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//
//           child: StreamBuilder<QuerySnapshot>(
//             stream: alertsRef
//                 .where("status", isEqualTo: "pending")
//                 .orderBy("createdAt", descending: true)
//                 .snapshots(),
//
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return Center(
//                   child: Text("Error: ${snapshot.error}"),
//                 );
//               }
//
//               if (snapshot.connectionState ==
//                   ConnectionState.waiting) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//
//               final docs = snapshot.data?.docs ?? [];
//
//               if (docs.isEmpty) {
//                 return const Center(
//                   child: Text(
//                     "No duplicate alerts found",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 );
//               }
//
//               return Column(
//                 crossAxisAlignment:
//                 CrossAxisAlignment.start,
//
//                 children: [
//
//                   // 🔷 HEADER
//                   Row(
//                     mainAxisAlignment:
//                     MainAxisAlignment.spaceBetween,
//
//                     children: [
//                       const Text(
//                         "Potential Duplicate Items",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//
//                       Container(
//                         padding:
//                         const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 10,
//                         ),
//
//                         decoration: BoxDecoration(
//                           color: Colors.red
//                               .withOpacity(0.1),
//
//                           borderRadius:
//                           BorderRadius.circular(12),
//                         ),
//
//                         child: Text(
//                           "${docs.length} Pending",
//                           style: const TextStyle(
//                             color: Colors.red,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 25),
//
//                   // 🔷 TABLE
//                   Expanded(
//                     child: SingleChildScrollView(
//                       scrollDirection:
//                       Axis.horizontal,
//
//                       child: DataTable(
//
//                         columnSpacing: 50,
//
//                         headingRowHeight: 60,
//                         dataRowMinHeight: 90,
//                         dataRowMaxHeight: 100,
//
//                         headingRowColor:
//                         MaterialStateProperty.all(
//                           bgColor,
//                         ),
//
//                         border: TableBorder(
//                           horizontalInside: BorderSide(
//                             color: Colors.grey
//                                 .withOpacity(0.2),
//                           ),
//                         ),
//
//                         columns: const [
//
//                           // ITEM
//                           DataColumn(
//                             label: Text(
//                               "Item Name",
//                               style: TextStyle(
//                                 fontWeight:
//                                 FontWeight.bold,
//                               ),
//                             ),
//                           ),
//
//                           // SIMILARITY
//                           DataColumn(
//                             label: Text(
//                               "Similarity",
//                               style: TextStyle(
//                                 fontWeight:
//                                 FontWeight.bold,
//                               ),
//                             ),
//                           ),
//
//                           // DETECTED ON
//                           DataColumn(
//                             label: Text(
//                               "Detected On",
//                               style: TextStyle(
//                                 fontWeight:
//                                 FontWeight.bold,
//                               ),
//                             ),
//                           ),
//
//                           // ACTIONS
//                           DataColumn(
//                             label: Text(
//                               "Actions",
//                               style: TextStyle(
//                                 fontWeight:
//                                 FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//
//                         rows: docs.map((doc) {
//                           final data =
//                           doc.data()
//                           as Map<String, dynamic>;
//
//                           final similarity =
//                           ((data["similarity"] ??
//                               0.0) *
//                               100)
//                               .toStringAsFixed(0);
//
//                           final timestamp =
//                           data["createdAt"]
//                           as Timestamp?;
//
//                           final date =
//                           timestamp != null
//                               ? "${timestamp.toDate().day}/${timestamp.toDate().month}/${timestamp.toDate().year}"
//                               : "N/A";
//
//                           return DataRow(
//                             cells: [
//
//                               // 🔷 ITEM
//                               DataCell(
//                                 SizedBox(
//                                   width: 300,
//
//                                   child: Row(
//                                     children: [
//
//                                       Container(
//                                         width: 45,
//                                         height: 45,
//
//                                         decoration:
//                                         BoxDecoration(
//                                           borderRadius:
//                                           BorderRadius.circular(
//                                               10),
//
//                                           image: data[
//                                           'duplicateImageUrl'] !=
//                                               null
//                                               ? DecorationImage(
//                                             image:
//                                             NetworkImage(
//                                               data[
//                                               'duplicateImageUrl'],
//                                             ),
//                                             fit:
//                                             BoxFit.cover,
//                                           )
//                                               : null,
//
//                                           color:
//                                           Colors.black12,
//                                         ),
//
//                                         child: data[
//                                         'duplicateImageUrl'] ==
//                                             null
//                                             ? const Icon(
//                                           Icons
//                                               .inventory_2,
//                                         )
//                                             : null,
//                                       ),
//
//                                       const SizedBox(
//                                           width: 14),
//
//                                       Expanded(
//                                         child: Column(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .center,
//
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment
//                                               .start,
//
//                                           children: [
//                                             Text(
//                                               data["itemName"] ??
//                                                   "Unknown Item",
//
//                                               overflow:
//                                               TextOverflow
//                                                   .ellipsis,
//
//                                               style:
//                                               const TextStyle(
//                                                 fontWeight:
//                                                 FontWeight
//                                                     .bold,
//
//                                                 fontSize:
//                                                 15,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                               // 🔷 SIMILARITY
//                               DataCell(
//                                 Container(
//                                   padding:
//                                   const EdgeInsets
//                                       .symmetric(
//                                     horizontal: 16,
//                                     vertical: 8,
//                                   ),
//
//                                   decoration:
//                                   BoxDecoration(
//                                     color: Colors.red
//                                         .withOpacity(
//                                         0.12),
//
//                                     borderRadius:
//                                     BorderRadius
//                                         .circular(
//                                         20),
//                                   ),
//
//                                   child: Text(
//                                     "$similarity%",
//
//                                     style:
//                                     const TextStyle(
//                                       color: Colors.red,
//                                       fontWeight:
//                                       FontWeight
//                                           .bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//
//                               // 🔷 DATE
//                               DataCell(
//                                 Text(
//                                   date,
//                                   style: const TextStyle(
//                                     fontWeight:
//                                     FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//
//                               // 🔷 ACTION
//                               DataCell(
//                                 Container(
//                                   decoration:
//                                   BoxDecoration(
//                                     borderRadius:
//                                     BorderRadius
//                                         .circular(
//                                         12),
//                                   ),
//
//                                   child: IconButton(
//                                     tooltip:
//                                     "View Details",
//
//                                     icon: const Icon(
//                                       Icons.visibility,
//                                       color: Colors.blue,
//                                     ),
//
//                                     onPressed: () {
//                                       _openDetails(
//                                         context,
//                                         doc.id,
//                                         data,
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _openDetails(
//       BuildContext context,
//       String alertId,
//       Map<String, dynamic> data,
//       ) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//
//       builder: (_) {
//         return DraggableScrollableSheet(
//           initialChildSize: 0.92,
//           minChildSize: 0.6,
//           maxChildSize: 0.95,
//
//           builder: (context, scrollController) {
//             return Container(
//               decoration: const BoxDecoration(
//                 color: bgColor,
//
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(24),
//                 ),
//               ),
//
//               child: FutureBuilder<
//                   List<DocumentSnapshot>>(
//                 future: Future.wait([
//
//                   FirebaseFirestore.instance
//                       .collection("items")
//                       .doc(data["itemId"])
//                       .get(),
//
//                   FirebaseFirestore.instance
//                       .collection("items")
//                       .doc(data["duplicateItemId"])
//                       .get(),
//                 ]),
//
//                 builder: (context, snapshot) {
//
//                   if (!snapshot.hasData) {
//                     return const Center(
//                       child:
//                       CircularProgressIndicator(),
//                     );
//                   }
//
//                   final docs = snapshot.data!;
//
//                   final original =
//                       docs[0].data()
//                       as Map<String, dynamic>? ??
//                           {};
//
//                   final duplicate =
//                       docs[1].data()
//                       as Map<String, dynamic>? ??
//                           {};
//
//                   return Column(
//                     children: [
//
//                       // 🔷 HEADER
//                       Container(
//                         padding:
//                         const EdgeInsets.all(20),
//
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//
//                           borderRadius:
//                           BorderRadius.vertical(
//                             top: Radius.circular(24),
//                           ),
//                         ),
//
//                         child: Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment
//                               .spaceBetween,
//
//                           children: [
//
//                             const Text(
//                               "Duplicate Review",
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight:
//                                 FontWeight.bold,
//                               ),
//                             ),
//
//                             IconButton(
//                               icon:
//                               const Icon(Icons.close),
//
//                               onPressed: () =>
//                                   Navigator.pop(
//                                       context),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // 🔷 CONTENT
//                       Expanded(
//                         child: SingleChildScrollView(
//                           controller: scrollController,
//
//                           padding:
//                           const EdgeInsets.all(20),
//
//                           child: Column(
//                             children: [
//
//                               Row(
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment
//                                     .start,
//
//                                 children: [
//
//                                   Expanded(
//                                     child: _itemCard(
//                                       "Original Item",
//                                       original,
//                                       Colors.green,
//                                     ),
//                                   ),
//
//                                   const SizedBox(
//                                       width: 20),
//
//                                   Expanded(
//                                     child: _itemCard(
//                                       "Duplicate Item",
//                                       duplicate,
//                                       Colors.blue,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                               const SizedBox(height: 30),
//
//                               Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment
//                                     .end,
//
//                                 children: [
//
//                                   ElevatedButton.icon(
//                                     onPressed: () async {
//
//                                       await FirebaseFirestore
//                                           .instance
//                                           .collection(
//                                           "duplicate_alerts")
//                                           .doc(alertId)
//                                           .update({
//                                         "status":
//                                         "confirmed"
//                                       });
//
//                                       Navigator.pop(
//                                           context);
//                                     },
//
//                                     icon: const Icon(
//                                         Icons.check),
//
//                                     label: const Text(
//                                         "Confirm"),
//
//                                     style:
//                                     ElevatedButton
//                                         .styleFrom(
//                                       backgroundColor:
//                                       Colors.green,
//
//                                       padding:
//                                       const EdgeInsets
//                                           .symmetric(
//                                         horizontal: 22,
//                                         vertical: 16,
//                                       ),
//
//                                       shape:
//                                       RoundedRectangleBorder(
//                                         borderRadius:
//                                         BorderRadius
//                                             .circular(
//                                             12),
//                                       ),
//                                     ),
//                                   ),
//
//                                   const SizedBox(
//                                       width: 12),
//
//                                   ElevatedButton.icon(
//                                     onPressed: () async {
//
//                                       await FirebaseFirestore
//                                           .instance
//                                           .collection(
//                                           "duplicate_alerts")
//                                           .doc(alertId)
//                                           .delete();
//
//                                       Navigator.pop(
//                                           context);
//                                     },
//
//                                     icon: const Icon(
//                                         Icons.close),
//
//                                     label:
//                                     const Text("Ignore"),
//
//                                     style:
//                                     ElevatedButton
//                                         .styleFrom(
//                                       backgroundColor:
//                                       Colors.grey,
//
//                                       padding:
//                                       const EdgeInsets
//                                           .symmetric(
//                                         horizontal: 22,
//                                         vertical: 16,
//                                       ),
//
//                                       shape:
//                                       RoundedRectangleBorder(
//                                         borderRadius:
//                                         BorderRadius
//                                             .circular(
//                                             12),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _itemCard(
//       String title,
//       Map<String, dynamic> item,
//       Color color,
//       ) {
//     return Container(
//       padding: const EdgeInsets.all(18),
//
//       decoration: BoxDecoration(
//         color: Colors.white,
//
//         borderRadius: BorderRadius.circular(18),
//
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 8,
//           ),
//         ],
//       ),
//
//       child: Column(
//         crossAxisAlignment:
//         CrossAxisAlignment.start,
//
//         children: [
//
//           // 🔷 TITLE
//           Container(
//             padding:
//             const EdgeInsets.symmetric(
//               horizontal: 14,
//               vertical: 10,
//             ),
//
//             decoration: BoxDecoration(
//               color: color.withOpacity(0.1),
//
//               borderRadius:
//               BorderRadius.circular(12),
//             ),
//
//             child: Row(
//               children: [
//
//                 Icon(
//                   Icons.verified,
//                   color: color,
//                   size: 20,
//                 ),
//
//                 const SizedBox(width: 10),
//
//                 Text(
//                   title,
//
//                   style: TextStyle(
//                     color: color,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 18),
//
//           // 🔷 IMAGE
//           if (item["imageUrl"] != null)
//             ClipRRect(
//               borderRadius:
//               BorderRadius.circular(14),
//
//               child: Image.network(
//                 item["imageUrl"],
//
//                 height: 220,
//                 width: double.infinity,
//
//                 fit: BoxFit.cover,
//               ),
//             ),
//
//           const SizedBox(height: 18),
//
//           Text(
//             item["itemName"] ?? "N/A",
//
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           const SizedBox(height: 10),
//
//           Text(
//             item["description"] ??
//                 "No description",
//
//             style: TextStyle(
//               color: Colors.grey[700],
//               height: 1.5,
//             ),
//           ),
//
//           const SizedBox(height: 14),
//
//           Row(
//             children: [
//
//               const Icon(
//                 Icons.location_on,
//                 size: 18,
//                 color: Colors.grey,
//               ),
//
//               const SizedBox(width: 6),
//
//               Expanded(
//                 child: Text(
//                   item["location"] ?? "N/A",
//
//                   style: TextStyle(
//                     color: Colors.grey[700],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class DuplicateAlertsScreen extends StatelessWidget {
//   const DuplicateAlertsScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//
//     final alertsRef =
//     FirebaseFirestore.instance
//         .collection("duplicate_alerts");
//
//     return Container(
//       color: bgColor,
//
//       child: Padding(
//         padding: const EdgeInsets.all(25),
//
//         child: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(20),
//
//           decoration: BoxDecoration(
//             color: Colors.white,
//
//             borderRadius:
//             BorderRadius.circular(18),
//
//             boxShadow: [
//               BoxShadow(
//                 color:
//                 Colors.black.withOpacity(0.05),
//
//                 blurRadius: 10,
//
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//
//           child: StreamBuilder<QuerySnapshot>(
//
//             stream: alertsRef
//                 .where(
//               "status",
//               isEqualTo: "pending",
//             )
//                 .orderBy(
//               "createdAt",
//               descending: true,
//             )
//                 .snapshots(),
//
//             builder: (context, snapshot) {
//
//               // 🔷 ERROR
//               if (snapshot.hasError) {
//
//                 return Center(
//                   child: Text(
//                     "Error: ${snapshot.error}",
//                   ),
//                 );
//               }
//
//               // 🔷 LOADING
//               if (snapshot.connectionState ==
//                   ConnectionState.waiting) {
//
//                 return const Center(
//                   child:
//                   CircularProgressIndicator(),
//                 );
//               }
//
//               final docs =
//                   snapshot.data?.docs ?? [];
//
//               // 🔷 EMPTY
//               if (docs.isEmpty) {
//
//                 return const Center(
//                   child: Padding(
//                     padding: EdgeInsets.all(40),
//
//                     child: Text(
//                       "No duplicate alerts found",
//
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 );
//               }
//
//               return Column(
//                 crossAxisAlignment:
//                 CrossAxisAlignment.start,
//
//                 children: [
//
//                   // 🔷 HEADER
//                   Row(
//                     mainAxisAlignment:
//                     MainAxisAlignment
//                         .spaceBetween,
//
//                     children: [
//
//                       const Text(
//                         "Potential Duplicate Items",
//
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight:
//                           FontWeight.bold,
//                         ),
//                       ),
//
//                       Container(
//                         padding:
//                         const EdgeInsets
//                             .symmetric(
//                           horizontal: 16,
//                           vertical: 10,
//                         ),
//
//                         decoration: BoxDecoration(
//                           color: Colors.red
//                               .withOpacity(0.1),
//
//                           borderRadius:
//                           BorderRadius
//                               .circular(12),
//                         ),
//
//                         child: Text(
//                           "${docs.length} Pending",
//
//                           style:
//                           const TextStyle(
//                             color: Colors.red,
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 25),
//
//                   // ✅ FIXED TABLE
//                   SizedBox(
//                     height: 500,
//
//                     child:
//                     SingleChildScrollView(
//                       scrollDirection:
//                       Axis.horizontal,
//
//                       child: DataTable(
//
//                         columnSpacing: 50,
//
//                         headingRowHeight: 60,
//
//                         dataRowMinHeight: 90,
//
//                         dataRowMaxHeight: 100,
//
//                         headingRowColor:
//                         MaterialStateProperty
//                             .all(bgColor),
//
//                         border: TableBorder(
//                           horizontalInside:
//                           BorderSide(
//                             color: Colors.grey
//                                 .withOpacity(
//                                 0.2),
//                           ),
//                         ),
//
//                         columns: const [
//
//                           // 🔷 ITEM
//                           DataColumn(
//                             label: Text(
//                               "Item Name",
//
//                               style: TextStyle(
//                                 fontWeight:
//                                 FontWeight
//                                     .bold,
//                               ),
//                             ),
//                           ),
//
//                           // 🔷 SIMILARITY
//                           DataColumn(
//                             label: Text(
//                               "Similarity",
//
//                               style: TextStyle(
//                                 fontWeight:
//                                 FontWeight
//                                     .bold,
//                               ),
//                             ),
//                           ),
//
//                           // 🔷 DATE
//                           DataColumn(
//                             label: Text(
//                               "Detected On",
//
//                               style: TextStyle(
//                                 fontWeight:
//                                 FontWeight
//                                     .bold,
//                               ),
//                             ),
//                           ),
//
//                           // 🔷 ACTIONS
//                           DataColumn(
//                             label: Text(
//                               "Actions",
//
//                               style: TextStyle(
//                                 fontWeight:
//                                 FontWeight
//                                     .bold,
//                               ),
//                             ),
//                           ),
//                         ],
//
//                         rows:
//                         docs.map((doc) {
//
//                           final data =
//                           doc.data()
//                           as Map<String,
//                               dynamic>;
//
//                           final similarity =
//                           ((data[
//                           "similarity"] ??
//                               0.0) *
//                               100)
//                               .toStringAsFixed(
//                               0);
//
//                           final timestamp =
//                           data["createdAt"]
//                           as Timestamp?;
//
//                           final date =
//                           timestamp != null
//                               ? "${timestamp.toDate().day}/${timestamp.toDate().month}/${timestamp.toDate().year}"
//                               : "N/A";
//
//                           return DataRow(
//                             cells: [
//
//                               // 🔷 ITEM CELL
//                               DataCell(
//                                 SizedBox(
//                                   width: 320,
//
//                                   child: Row(
//                                     children: [
//
//                                       // IMAGE
//                                       Container(
//                                         width: 50,
//                                         height: 50,
//
//                                         decoration:
//                                         BoxDecoration(
//                                           borderRadius:
//                                           BorderRadius
//                                               .circular(
//                                               10),
//
//                                           image: data[
//                                           "duplicateImageUrl"] !=
//                                               null
//                                               ? DecorationImage(
//                                             image:
//                                             NetworkImage(
//                                               data[
//                                               "duplicateImageUrl"],
//                                             ),
//
//                                             fit: BoxFit
//                                                 .cover,
//                                           )
//                                               : null,
//
//                                           color: Colors
//                                               .black12,
//                                         ),
//
//                                         child: data[
//                                         "duplicateImageUrl"] ==
//                                             null
//                                             ? const Icon(
//                                           Icons
//                                               .inventory_2,
//                                         )
//                                             : null,
//                                       ),
//
//                                       const SizedBox(
//                                           width:
//                                           14),
//
//                                       // NAME
//                                       Expanded(
//                                         child: Text(
//                                           data["itemName"] ??
//                                               "Unknown Item",
//
//                                           overflow:
//                                           TextOverflow
//                                               .ellipsis,
//
//                                           style:
//                                           const TextStyle(
//                                             fontWeight:
//                                             FontWeight
//                                                 .bold,
//
//                                             fontSize:
//                                             15,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                               // 🔷 SIMILARITY
//                               DataCell(
//                                 Container(
//                                   padding:
//                                   const EdgeInsets
//                                       .symmetric(
//                                     horizontal:
//                                     16,
//                                     vertical: 8,
//                                   ),
//
//                                   decoration:
//                                   BoxDecoration(
//                                     color: Colors
//                                         .red
//                                         .withOpacity(
//                                         0.12),
//
//                                     borderRadius:
//                                     BorderRadius
//                                         .circular(
//                                         20),
//                                   ),
//
//                                   child: Text(
//                                     "$similarity%",
//
//                                     style:
//                                     const TextStyle(
//                                       color:
//                                       Colors.red,
//
//                                       fontWeight:
//                                       FontWeight
//                                           .bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//
//                               // 🔷 DATE
//                               DataCell(
//                                 Text(
//                                   date,
//
//                                   style:
//                                   const TextStyle(
//                                     fontWeight:
//                                     FontWeight
//                                         .w500,
//                                   ),
//                                 ),
//                               ),
//
//                               // 🔷 ACTIONS
//                               DataCell(
//
//                                 IconButton(
//                                   tooltip:
//                                   "View Details",
//
//                                   icon:
//                                   const Icon(
//                                     Icons
//                                         .visibility,
//
//                                     color:
//                                     Colors.blue,
//                                   ),
//
//                                   onPressed: () {
//
//                                     _openDetails(
//                                       context,
//                                       doc.id,
//                                       data,
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   // 🔷 OPEN DETAILS
//   void _openDetails(
//       BuildContext context,
//       String alertId,
//       Map<String, dynamic> data,
//       ) {
//
//     showModalBottomSheet(
//
//       context: context,
//
//       isScrollControlled: true,
//
//       backgroundColor: Colors.transparent,
//
//       builder: (_) {
//
//         return DraggableScrollableSheet(
//
//           initialChildSize: 0.92,
//
//           minChildSize: 0.6,
//
//           maxChildSize: 0.95,
//
//           builder: (context, scrollController) {
//
//             return Container(
//
//               decoration: const BoxDecoration(
//                 color: bgColor,
//
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(24),
//                 ),
//               ),
//
//               child: FutureBuilder<
//                   List<DocumentSnapshot>>(
//
//                 future: Future.wait([
//
//                   FirebaseFirestore.instance
//                       .collection("items")
//                       .doc(data["itemId"])
//                       .get(),
//
//                   FirebaseFirestore.instance
//                       .collection("items")
//                       .doc(data["duplicateItemId"])
//                       .get(),
//                 ]),
//
//                 builder: (context, snapshot) {
//
//                   // 🔷 LOADING
//                   if (snapshot.connectionState ==
//                       ConnectionState.waiting) {
//
//                     return const Center(
//                       child:
//                       CircularProgressIndicator(),
//                     );
//                   }
//
//                   // 🔷 ERROR
//                   if (snapshot.hasError) {
//
//                     return Center(
//                       child: Text(
//                         "Error: ${snapshot.error}",
//                       ),
//                     );
//                   }
//
//                   if (!snapshot.hasData) {
//
//                     return const Center(
//                       child: Text(
//                         "No data found",
//                       ),
//                     );
//                   }
//
//                   final docs = snapshot.data!;
//
//                   final original =
//                       docs[0].data()
//                       as Map<String, dynamic>? ??
//                           {};
//
//                   final duplicate =
//                       docs[1].data()
//                       as Map<String, dynamic>? ??
//                           {};
//
//                   return Column(
//                     children: [
//
//                       // 🔷 HEADER
//                       Container(
//                         padding:
//                         const EdgeInsets.all(20),
//
//                         decoration:
//                         const BoxDecoration(
//                           color: Colors.white,
//
//                           borderRadius:
//                           BorderRadius.vertical(
//                             top:
//                             Radius.circular(24),
//                           ),
//                         ),
//
//                         child: Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment
//                               .spaceBetween,
//
//                           children: [
//
//                             const Text(
//                               "Duplicate Review",
//
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight:
//                                 FontWeight.bold,
//                               ),
//                             ),
//
//                             IconButton(
//                               icon:
//                               const Icon(Icons.close),
//
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // 🔷 CONTENT
//                       Expanded(
//                         child: SingleChildScrollView(
//                           controller: scrollController,
//
//                           padding:
//                           const EdgeInsets.all(20),
//
//                           child: Column(
//                             children: [
//
//                               Row(
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment
//                                     .start,
//
//                                 children: [
//
//                                   // 🔷 ORIGINAL ITEM
//                                   Expanded(
//                                     child: _itemCard(
//                                       "Original Item",
//                                       original,
//                                       Colors.green,
//                                     ),
//                                   ),
//
//                                   const SizedBox(
//                                       width: 20),
//
//                                   // 🔷 DUPLICATE ITEM
//                                   Expanded(
//                                     child: _itemCard(
//                                       "Duplicate Item",
//                                       duplicate,
//                                       Colors.blue,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                               const SizedBox(
//                                   height: 30),
//
//                               // 🔷 ACTION BUTTONS
//                               Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.end,
//
//                                 children: [
//
//                                   // ✅ CONFIRM
//                                   ElevatedButton.icon(
//
//                                     onPressed: () async {
//
//                                       await FirebaseFirestore
//                                           .instance
//                                           .collection(
//                                           "duplicate_alerts")
//                                           .doc(alertId)
//                                           .update({
//                                         "status":
//                                         "confirmed",
//                                       });
//
//                                       Navigator.pop(
//                                           context);
//                                     },
//
//                                     icon: const Icon(
//                                         Icons.check),
//
//                                     label:
//                                     const Text("Confirm"),
//
//                                     style:
//                                     ElevatedButton
//                                         .styleFrom(
//
//                                       backgroundColor:
//                                       Colors.green,
//
//                                       foregroundColor:
//                                       Colors.white,
//
//                                       padding:
//                                       const EdgeInsets
//                                           .symmetric(
//                                         horizontal: 22,
//                                         vertical: 16,
//                                       ),
//
//                                       shape:
//                                       RoundedRectangleBorder(
//                                         borderRadius:
//                                         BorderRadius
//                                             .circular(
//                                             12),
//                                       ),
//                                     ),
//                                   ),
//
//                                   const SizedBox(
//                                       width: 12),
//
//                                   // ❌ IGNORE
//                                   ElevatedButton.icon(
//
//                                     onPressed: () async {
//
//                                       await FirebaseFirestore
//                                           .instance
//                                           .collection(
//                                           "duplicate_alerts")
//                                           .doc(alertId)
//                                           .delete();
//
//                                       Navigator.pop(
//                                           context);
//                                     },
//
//                                     icon: const Icon(
//                                         Icons.close),
//
//                                     label:
//                                     const Text("Ignore"),
//
//                                     style:
//                                     ElevatedButton
//                                         .styleFrom(
//
//                                       backgroundColor:
//                                       Colors.grey,
//
//                                       foregroundColor:
//                                       Colors.white,
//
//                                       padding:
//                                       const EdgeInsets
//                                           .symmetric(
//                                         horizontal: 22,
//                                         vertical: 16,
//                                       ),
//
//                                       shape:
//                                       RoundedRectangleBorder(
//                                         borderRadius:
//                                         BorderRadius
//                                             .circular(
//                                             12),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//   // void _openDetails(
//   //     BuildContext context,
//   //     String alertId,
//   //     Map<String, dynamic> data,
//   //     ) {
//   //
//   //   showModalBottomSheet(
//   //
//   //     context: context,
//   //
//   //     isScrollControlled: true,
//   //
//   //     backgroundColor:
//   //     Colors.transparent,
//   //
//   //     builder: (_) {
//   //
//   //       return DraggableScrollableSheet(
//   //
//   //         initialChildSize: 0.92,
//   //
//   //         minChildSize: 0.6,
//   //
//   //         maxChildSize: 0.95,
//   //
//   //         builder:
//   //             (context, scrollController) {
//   //
//   //           return Container(
//   //
//   //             decoration:
//   //             const BoxDecoration(
//   //               color: bgColor,
//   //
//   //               borderRadius:
//   //               BorderRadius.vertical(
//   //                 top:
//   //                 Radius.circular(24),
//   //               ),
//   //             ),
//   //
//   //             child: FutureBuilder<
//   //                 List<DocumentSnapshot>>(
//   //               future: Future.wait([
//   //
//   //                 FirebaseFirestore
//   //                     .instance
//   //                     .collection("items")
//   //                     .doc(data["itemId"])
//   //                     .get(),
//   //
//   //                 FirebaseFirestore
//   //                     .instance
//   //                     .collection("items")
//   //                     .doc(data[
//   //                 "duplicateItemId"])
//   //                     .get(),
//   //               ]),
//   //
//   //               builder:
//   //                   (context, snapshot) {
//   //
//   //                 if (!snapshot.hasData) {
//   //
//   //                   return const Center(
//   //                     child:
//   //                     CircularProgressIndicator(),
//   //                   );
//   //                 }
//   //
//   //                 final docs =
//   //                 snapshot.data!;
//   //
//   //                 final original =
//   //                     docs[0].data()
//   //                     as Map<String,
//   //                         dynamic>? ??
//   //                         {};
//   //
//   //                 final duplicate =
//   //                     docs[1].data()
//   //                     as Map<String,
//   //                         dynamic>? ??
//   //                         {};
//   //
//   //                 return Center(
//   //                   child: Padding(
//   //                     padding:
//   //                     const EdgeInsets
//   //                         .all(20),
//   //
//   //                     child: Text(
//   //                       "Details Loaded Successfully",
//   //
//   //                       style:
//   //                       const TextStyle(
//   //                         fontSize: 22,
//   //                         fontWeight:
//   //                         FontWeight.bold,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                 );
//   //               },
//   //             ),
//   //           );
//   //         },
//   //       );
//   //     },
//   //
//   //   );
//   // }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DuplicateAlertsScreen extends StatelessWidget {
  const DuplicateAlertsScreen({super.key});

  static const Color darkBlue = Color(0xFF2A417F);
  static const Color orange = Color(0xFFF09E27);
  static const Color bgColor = Color(0xFFEFF5FB);

  @override
  Widget build(BuildContext context) {

    final alertsRef =
    FirebaseFirestore.instance
        .collection("duplicate_alerts");

    return Container(
      color: bgColor,

      child: Padding(
        padding: const EdgeInsets.all(25),

        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius:
            BorderRadius.circular(18),

            boxShadow: [
              BoxShadow(
                color:
                Colors.black.withOpacity(0.05),

                blurRadius: 10,

                offset: const Offset(0, 4),
              ),
            ],
          ),

          child: StreamBuilder<QuerySnapshot>(

            stream: alertsRef
                .where(
              "status",
              isEqualTo: "pending",
            )
                .orderBy(
              "createdAt",
              descending: true,
            )
                .snapshots(),

            builder: (context, snapshot) {

              // 🔷 ERROR
              if (snapshot.hasError) {

                return Center(
                  child: Text(
                    "Error: ${snapshot.error}",
                  ),
                );
              }

              // 🔷 LOADING
              if (snapshot.connectionState ==
                  ConnectionState.waiting) {

                return const Center(
                  child:
                  CircularProgressIndicator(),
                );
              }

              final docs =
                  snapshot.data?.docs ?? [];

              // 🔷 EMPTY
              if (docs.isEmpty) {

                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(40),

                    child: Text(
                      "No duplicate alerts found",

                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }

              return Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  // 🔷 HEADER
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                    children: [

                      const Text(
                        "Potential Duplicate Items",

                        style: TextStyle(
                          fontSize: 22,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      Container(
                        padding:
                        const EdgeInsets
                            .symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.red
                              .withOpacity(0.1),

                          borderRadius:
                          BorderRadius
                              .circular(12),
                        ),

                        child: Text(
                          "${docs.length} Pending",

                          style:
                          const TextStyle(
                            color: Colors.red,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // ✅ FIXED TABLE
                  SizedBox(
                    height: 500,

                    child:
                    SingleChildScrollView(
                      scrollDirection:
                      Axis.horizontal,

                      child: DataTable(

                        columnSpacing: 50,

                        headingRowHeight: 60,

                        dataRowMinHeight: 90,

                        dataRowMaxHeight: 100,

                        headingRowColor:
                        MaterialStateProperty
                            .all(bgColor),

                        border: TableBorder(
                          horizontalInside:
                          BorderSide(
                            color: Colors.grey
                                .withOpacity(
                                0.2),
                          ),
                        ),

                        columns: const [

                          // 🔷 ITEM
                          DataColumn(
                            label: Text(
                              "Item Name",

                              style: TextStyle(
                                fontWeight:
                                FontWeight
                                    .bold,
                              ),
                            ),
                          ),

                          // 🔷 SIMILARITY
                          DataColumn(
                            label: Text(
                              "Similarity",

                              style: TextStyle(
                                fontWeight:
                                FontWeight
                                    .bold,
                              ),
                            ),
                          ),

                          // 🔷 DATE
                          DataColumn(
                            label: Text(
                              "Detected On",

                              style: TextStyle(
                                fontWeight:
                                FontWeight
                                    .bold,
                              ),
                            ),
                          ),

                          // 🔷 ACTIONS
                          DataColumn(
                            label: Text(
                              "Actions",

                              style: TextStyle(
                                fontWeight:
                                FontWeight
                                    .bold,
                              ),
                            ),
                          ),
                        ],

                        rows:
                        docs.map((doc) {

                          final data =
                          doc.data()
                          as Map<String,
                              dynamic>;

                          final similarity =
                          ((data[
                          "similarity"] ??
                              0.0) *
                              100)
                              .toStringAsFixed(
                              0);

                          final timestamp =
                          data["createdAt"]
                          as Timestamp?;

                          final date =
                          timestamp != null
                              ? "${timestamp.toDate().day}/${timestamp.toDate().month}/${timestamp.toDate().year}"
                              : "N/A";

                          return DataRow(
                            cells: [

                              // 🔷 ITEM CELL
                              DataCell(
                                SizedBox(
                                  width: 320,

                                  child: Row(
                                    children: [

                                      // IMAGE
                                      Container(
                                        width: 50,
                                        height: 50,

                                        decoration:
                                        BoxDecoration(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              10),

                                          image: data[
                                          "duplicateImageUrl"] !=
                                              null
                                              ? DecorationImage(
                                            image:
                                            NetworkImage(
                                              data[
                                              "duplicateImageUrl"],
                                            ),

                                            fit: BoxFit
                                                .cover,
                                          )
                                              : null,

                                          color: Colors
                                              .black12,
                                        ),

                                        child: data[
                                        "duplicateImageUrl"] ==
                                            null
                                            ? const Icon(
                                          Icons
                                              .inventory_2,
                                        )
                                            : null,
                                      ),

                                      const SizedBox(
                                          width:
                                          14),

                                      // NAME
                                      Expanded(
                                        child: Text(
                                          data["itemName"] ??
                                              "Unknown Item",

                                          overflow:
                                          TextOverflow
                                              .ellipsis,

                                          style:
                                          const TextStyle(
                                            fontWeight:
                                            FontWeight
                                                .bold,

                                            fontSize:
                                            15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // 🔷 SIMILARITY
                              DataCell(
                                Container(
                                  padding:
                                  const EdgeInsets
                                      .symmetric(
                                    horizontal:
                                    16,
                                    vertical: 8,
                                  ),

                                  decoration:
                                  BoxDecoration(
                                    color: Colors
                                        .red
                                        .withOpacity(
                                        0.12),

                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        20),
                                  ),

                                  child: Text(
                                    "$similarity%",

                                    style:
                                    const TextStyle(
                                      color:
                                      Colors.red,

                                      fontWeight:
                                      FontWeight
                                          .bold,
                                    ),
                                  ),
                                ),
                              ),

                              // 🔷 DATE
                              DataCell(
                                Text(
                                  date,

                                  style:
                                  const TextStyle(
                                    fontWeight:
                                    FontWeight
                                        .w500,
                                  ),
                                ),
                              ),

                              // 🔷 ACTIONS
                              DataCell(

                                IconButton(
                                  tooltip:
                                  "View Details",

                                  icon:
                                  const Icon(
                                    Icons
                                        .visibility,

                                    color:
                                    Colors.blue,
                                  ),

                                  onPressed: () {

                                    _openDetails(
                                      context,
                                      doc.id,
                                      data,
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // 🔷 OPEN DETAILS
  void _openDetails(
      BuildContext context,
      String alertId,
      Map<String, dynamic> data,
      ) {

    showModalBottomSheet(

      context: context,

      isScrollControlled: true,

      backgroundColor: Colors.transparent,

      builder: (_) {

        return DraggableScrollableSheet(

          initialChildSize: 0.92,

          minChildSize: 0.6,

          maxChildSize: 0.95,

          builder: (context, scrollController) {

            return Container(

              decoration: const BoxDecoration(
                color: bgColor,

                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),

              child: FutureBuilder<
                  List<DocumentSnapshot>>(

                future: Future.wait([

                  FirebaseFirestore.instance
                      .collection("items")
                      .doc(data["itemId"])
                      .get(),

                  FirebaseFirestore.instance
                      .collection("items")
                      .doc(data["duplicateItemId"])
                      .get(),
                ]),

                builder: (context, snapshot) {

                  // 🔷 LOADING
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {

                    return const Center(
                      child:
                      CircularProgressIndicator(),
                    );
                  }

                  // 🔷 ERROR
                  if (snapshot.hasError) {

                    return Center(
                      child: Text(
                        "Error: ${snapshot.error}",
                      ),
                    );
                  }

                  if (!snapshot.hasData) {

                    return const Center(
                      child: Text(
                        "No data found",
                      ),
                    );
                  }

                  final docs = snapshot.data!;

                  final original =
                      docs[0].data()
                      as Map<String, dynamic>? ??
                          {};

                  final duplicate =
                      docs[1].data()
                      as Map<String, dynamic>? ??
                          {};

                  return Column(
                    children: [

                      // 🔷 HEADER
                      Container(
                        padding:
                        const EdgeInsets.all(20),

                        decoration:
                        const BoxDecoration(
                          color: Colors.white,

                          borderRadius:
                          BorderRadius.vertical(
                            top:
                            Radius.circular(24),
                          ),
                        ),

                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,

                          children: [

                            const Text(
                              "Duplicate Review",

                              style: TextStyle(
                                fontSize: 20,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),

                            IconButton(
                              icon:
                              const Icon(Icons.close),

                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),

                      // 🔷 CONTENT
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,

                          padding:
                          const EdgeInsets.all(20),

                          child: Column(
                            children: [

                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,

                                children: [

                                  // 🔷 ORIGINAL ITEM
                                  Expanded(
                                    child: _itemCard(
                                      "Original Item",
                                      original,
                                      Colors.green,
                                    ),
                                  ),

                                  const SizedBox(
                                      width: 20),

                                  // 🔷 DUPLICATE ITEM
                                  Expanded(
                                    child: _itemCard(
                                      "Duplicate Item",
                                      duplicate,
                                      Colors.blue,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                  height: 30),

                              // 🔷 ACTION BUTTONS
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.end,

                                children: [

                                  // ✅ CONFIRM
                                  ElevatedButton.icon(

                                    onPressed: () async {

                                      await FirebaseFirestore
                                          .instance
                                          .collection(
                                          "duplicate_alerts")
                                          .doc(alertId)
                                          .update({
                                        "status":
                                        "confirmed",
                                      });

                                      Navigator.pop(
                                          context);
                                    },

                                    icon: const Icon(
                                        Icons.check),

                                    label:
                                    const Text("Confirm"),

                                    style:
                                    ElevatedButton
                                        .styleFrom(

                                      backgroundColor:
                                      Colors.green,

                                      foregroundColor:
                                      Colors.white,

                                      padding:
                                      const EdgeInsets
                                          .symmetric(
                                        horizontal: 22,
                                        vertical: 16,
                                      ),

                                      shape:
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            12),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                      width: 12),

                                  // ❌ IGNORE
                                  ElevatedButton.icon(

                                    onPressed: () async {

                                      await FirebaseFirestore
                                          .instance
                                          .collection(
                                          "duplicate_alerts")
                                          .doc(alertId)
                                          .delete();

                                      Navigator.pop(
                                          context);
                                    },

                                    icon: const Icon(
                                        Icons.close),

                                    label:
                                    const Text("Ignore"),

                                    style:
                                    ElevatedButton
                                        .styleFrom(

                                      backgroundColor:
                                      Colors.grey,

                                      foregroundColor:
                                      Colors.white,

                                      padding:
                                      const EdgeInsets
                                          .symmetric(
                                        horizontal: 22,
                                        vertical: 16,
                                      ),

                                      shape:
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  // 🔷 ITEM CARD
  Widget _itemCard(
      String title,
      Map<String, dynamic> item,
      Color color,
      ) {

    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
        BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color:
            Colors.black.withOpacity(0.05),

            blurRadius: 8,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          // 🔷 TITLE
          Container(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),

            decoration: BoxDecoration(
              color: color.withOpacity(0.1),

              borderRadius:
              BorderRadius.circular(12),
            ),

            child: Row(
              children: [

                Icon(
                  Icons.verified,
                  color: color,
                  size: 20,
                ),

                const SizedBox(width: 10),

                Text(
                  title,

                  style: TextStyle(
                    color: color,
                    fontWeight:
                    FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // 🔷 IMAGE
          if (item["imageUrl"] != null)
            ClipRRect(
              borderRadius:
              BorderRadius.circular(14),

              child: Image.network(
                item["imageUrl"],

                height: 220,
                width: double.infinity,

                fit: BoxFit.cover,
              ),
            ),

          const SizedBox(height: 18),

          // 🔷 NAME
          Text(
            item["itemName"] ?? "N/A",

            style: const TextStyle(
              fontSize: 20,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // 🔷 DESCRIPTION
          Text(
            item["description"] ??
                "No description",

            style: TextStyle(
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),

          const SizedBox(height: 14),

          // 🔷 LOCATION
          Row(
            children: [

              const Icon(
                Icons.location_on,
                size: 18,
                color: Colors.grey,
              ),

              const SizedBox(width: 6),

              Expanded(
                child: Text(
                  item["location"] ?? "N/A",

                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}