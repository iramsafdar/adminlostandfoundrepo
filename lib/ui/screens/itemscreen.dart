




// //
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../../services/notifications/send_notification_service.dart';
// // import '../services/send_notification_service.dart';
// import 'itemdetaildialog.dart';
//
// class ItemsScreen extends StatefulWidget {
//   const ItemsScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   State<ItemsScreen> createState() => _ItemsScreenState();
// }
//
// class _ItemsScreenState extends State<ItemsScreen> {
//
//   // 🔍 SEARCH
//   final TextEditingController searchController =
//   TextEditingController();
//
//   String searchQuery = "";
//
//   // 🔷 FILTERS
//   String selectedType = "All Items";
//   String selectedCategory = "All Categories";
//   String selectedStatus = "All Status";
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
//             mainAxisAlignment:
//             MainAxisAlignment.spaceBetween,
//
//             children: [
//
//               const Text(
//                 "Manage Items",
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
//                   ItemsScreen.orange,
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
//                   Icons.add,
//                   color: Colors.white,
//                 ),
//
//                 label: const Text(
//                   "Add Item",
//                   style:
//                   TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 25),
//
//           // 🔷 FILTERS
//           Row(
//             children: [
//
//               // 🔍 SEARCH
//               Expanded(
//                 child: TextField(
//                   controller: searchController,
//
//                   decoration: InputDecoration(
//                     hintText: "Search items...",
//
//                     prefixIcon:
//                     const Icon(Icons.search),
//
//                     filled: true,
//                     fillColor: Colors.white,
//
//                     border: OutlineInputBorder(
//                       borderRadius:
//                       BorderRadius.circular(12),
//
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//
//                   onChanged: (value) {
//
//                     setState(() {
//                       searchQuery =
//                           value.toLowerCase();
//                     });
//                   },
//                 ),
//               ),
//
//               const SizedBox(width: 20),
//
//               // 🔷 TYPE FILTER
//               Container(
//                 padding:
//                 const EdgeInsets.symmetric(
//                     horizontal: 14),
//
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:
//                   BorderRadius.circular(12),
//
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black
//                           .withOpacity(0.05),
//
//                       blurRadius: 6,
//
//                       offset:
//                       const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//
//                 child: DropdownButton<String>(
//                   underline: const SizedBox(),
//
//                   value: selectedType,
//
//                   items: const [
//
//                     DropdownMenuItem(
//                       value: "All Items",
//                       child: Text("All Items"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "lost",
//                       child: Text("Lost"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "found",
//                       child: Text("Found"),
//                     ),
//                   ],
//
//                   onChanged: (value) {
//
//                     setState(() {
//                       selectedType = value!;
//                     });
//                   },
//                 ),
//               ),
//
//               const SizedBox(width: 20),
//
//               // 🔷 CATEGORY FILTER
//               Container(
//                 padding:
//                 const EdgeInsets.symmetric(
//                     horizontal: 14),
//
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:
//                   BorderRadius.circular(12),
//
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black
//                           .withOpacity(0.05),
//
//                       blurRadius: 6,
//
//                       offset:
//                       const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//
//                 child: DropdownButton<String>(
//                   underline: const SizedBox(),
//
//                   value: selectedCategory,
//
//                   items: const [
//
//                     DropdownMenuItem(
//                       value: "All Categories",
//                       child:
//                       Text("All Categories"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "Student ID Card",
//                       child:
//                       Text("Student ID Card"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "Keys",
//                       child: Text("Keys"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "Electronics",
//                       child:
//                       Text("Electronics"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "Clothing",
//                       child: Text("Clothing"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "Documents",
//                       child:
//                       Text("Documents"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "Others",
//                       child: Text("Others"),
//                     ),
//                   ],
//
//                   onChanged: (value) {
//
//                     setState(() {
//                       selectedCategory =
//                       value!;
//                     });
//                   },
//                 ),
//               ),
//
//               const SizedBox(width: 20),
//
//               // 🔷 STATUS FILTER
//               Container(
//                 padding:
//                 const EdgeInsets.symmetric(
//                     horizontal: 14),
//
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:
//                   BorderRadius.circular(12),
//
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black
//                           .withOpacity(0.05),
//
//                       blurRadius: 6,
//
//                       offset:
//                       const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//
//                 child: DropdownButton<String>(
//                   underline: const SizedBox(),
//
//                   value: selectedStatus,
//
//                   items: const [
//
//                     DropdownMenuItem(
//                       value: "All Status",
//                       child:
//                       Text("All Status"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "lost",
//                       child: Text("Lost"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "found",
//                       child: Text("Found"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "claim pending",
//                       child:
//                       Text("Claim Pending"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "claim approved",
//                       child:
//                       Text("Claim Approved"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "claim rejected",
//                       child:
//                       Text("Claim Rejected"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "returned",
//                       child: Text("Returned"),
//                     ),
//                   ],
//
//                   onChanged: (value) {
//
//                     setState(() {
//                       selectedStatus =
//                       value!;
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 30),
//
//           // 🔷 ITEMS TABLE
//           Container(
//             width: 880,
//
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
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('items')
//                   .orderBy(
//                 'createdAt',
//                 descending: true,
//               )
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
//                     child: Text("No items found"),
//                   );
//                 }
//
//                 final items =
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
//                       ItemsScreen.bgColor,
//                     ),
//
//                     columns: const [
//
//                       DataColumn(
//                         label: Text(
//                           "Item",
//                           style: TextStyle(
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//
//                       DataColumn(
//                         label: Text(
//                           "Type",
//                           style: TextStyle(
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//
//                       DataColumn(
//                         label: Text(
//                           "Category",
//                           style: TextStyle(
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//
//                       DataColumn(
//                         label: Text(
//                           "Status",
//                           style: TextStyle(
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//
//                       DataColumn(
//                         label: Text(
//                           "Created",
//                           style: TextStyle(
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//
//                       DataColumn(
//                         label: Text(
//                           "Actions",
//                           style: TextStyle(
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//
//                     rows:
//                     items.map<DataRow?>((doc) {
//
//                       final data =
//                       doc.data()
//                       as Map<String, dynamic>;
//
//                       final itemName =
//                       (data['itemName'] ?? '')
//                           .toString();
//
//                       final lowerName =
//                       itemName.toLowerCase();
//
//                       final itemType =
//                       (data['type'] ?? '')
//                           .toString();
//
//                       final category =
//                       (data['category'] ?? '')
//                           .toString();
//
//                       final status =
//                       (data['status'] ?? '')
//                           .toString();
//
//                       // 🔍 SEARCH FILTER
//                       if (!lowerName.contains(
//                           searchQuery)) {
//                         return null;
//                       }
//
//                       // 🔷 TYPE FILTER
//                       if (selectedType !=
//                           "All Items" &&
//                           itemType !=
//                               selectedType) {
//                         return null;
//                       }
//
//                       // 🔷 CATEGORY FILTER
//                       if (selectedCategory !=
//                           "All Categories" &&
//                           category !=
//                               selectedCategory) {
//                         return null;
//                       }
//
//                       // 🔷 STATUS FILTER
//                       // If the selected filter does NOT match the item’s status, hide this row.
//                       if (selectedStatus !=
//                           "All Status" &&
//                           status.toLowerCase() !=
//                               selectedStatus
//                                   .toLowerCase()) {
//                         return null;
//                       }
//
//                       return DataRow(
//                         cells: [
//
//                           // 🔷 ITEM
//                           DataCell(
//                             Row(
//                               children: [
//
//                                 Container(
//                                   width: 45,
//                                   height: 45,
//
//                                   decoration:
//                                   BoxDecoration(
//                                     borderRadius:
//                                     BorderRadius
//                                         .circular(
//                                         10),
//
//                                     image: data[
//                                     'imageUrl'] !=
//                                         null
//                                         ? DecorationImage(
//                                       image:
//                                       NetworkImage(
//                                         data[
//                                         'imageUrl'],
//                                       ),
//
//                                       fit: BoxFit
//                                           .cover,
//                                     )
//                                         : null,
//
//                                     color:
//                                     ItemsScreen
//                                         .bgColor,
//                                   ),
//
//                                   child: data[
//                                   'imageUrl'] ==
//                                       null
//                                       ? const Icon(
//                                     Icons
//                                         .inventory_2,
//                                   )
//                                       : null,
//                                 ),
//
//                                 const SizedBox(
//                                     width: 10),
//
//                                 Text(itemName),
//                               ],
//                             ),
//                           ),
//
//                           // 🔷 TYPE
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
//                                 color: itemType ==
//                                     "lost"
//                                     ? Colors.orange
//                                     .withOpacity(
//                                     0.15)
//                                     : Colors.green
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
//                                 itemType
//                                     .toUpperCase(),
//
//                                 style: TextStyle(
//                                   color: itemType ==
//                                       "lost"
//                                       ? Colors
//                                       .orange
//                                       : Colors
//                                       .green,
//
//                                   fontWeight:
//                                   FontWeight
//                                       .bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                           // 🔷 CATEGORY
//                           DataCell(
//                             Text(category),
//                           ),
//
//                           // 🔷 STATUS
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
//                                 color:
//                                 _getStatusColor(
//                                     status)
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
//                                 status.toUpperCase(),
//
//                                 style: TextStyle(
//                                   color:
//                                   _getStatusColor(
//                                       status),
//
//                                   fontWeight:
//                                   FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                           // 🔷 CREATED
//                           DataCell(
//                             Text(
//                               data['dateLost']
//                                   ?? '',
//                             ),
//                           ),
//
//                           // 🔷 ACTIONS
//                           DataCell(
//
//                             Row(
//                               children: [
//
//                                 // 👁 VIEW
//                                 IconButton(
//                                   tooltip:"View Item",
//                                   onPressed: () {
//
//                                     showDialog(
//                                       context: context,
//
//                                       builder: (context) {
//
//                                         return ItemDetailDialog(
//                                           data: data,
//                                         );
//                                       },
//                                     );
//                                   },
//
//                                   icon: const Icon(
//                                     Icons.visibility,
//                                     color: Colors.blue,
//                                   ),
//                                 ),
//
//                                 // 🚩 FLAG ITEM
//                                 // 🚩 FLAG + AUTO NOTIFICATION
//                                 IconButton(
//                                   tooltip:"Flag Item",
//                                   onPressed: () async {
//
//                                     try {
//                                       // ✅ CHECK IF ALREADY FLAGGED
//                                       if (data['flagged'] == true) {
//
//                                         ScaffoldMessenger.of(context).showSnackBar(
//                                           const SnackBar(
//                                             content: Text("Item is already flagged"),
//                                           ),
//                                         );
//
//                                         return;
//                                       }
//
//                                       // 🔥 STEP 1: FLAG ITEM
//                                       await FirebaseFirestore.instance
//                                           .collection('items')
//                                           .doc(doc.id)
//                                           .update({
//                                         "flagged": true,
//                                       });
//
//                                       // 🔥 STEP 2: GET USER TOKEN
//                                       final token = data['fcmToken'];
//
//                                       // 🔥 STEP 3: SEND NOTIFICATION
//                                       if (token != null &&
//                                           token.toString().isNotEmpty) {
//
//                                         await SendNotificationService
//                                             .sendNotificationUsingApi(
//
//                                           token: token,
//
//                                           title: "⚠ Item Hidden by Admin",
//
//                                           body:
//                                           "Your item '${data['itemName']}' was temporarily hidden due to suspicious or incorrect information.",
//
//                                           data: {
//                                             "screen": "itemDetail",
//                                             "itemId": doc.id,
//                                           },
//                                         );
//                                       }
//
//                                       // 🔥 STEP 4: SUCCESS MESSAGE
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         const SnackBar(
//                                           content: Text(
//                                             "Item flagged successfully",
//                                           ),
//                                         ),
//                                       );
//
//                                     } catch (e) {
//
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         SnackBar(
//                                           content: Text(
//                                             "Error: $e",
//                                           ),
//                                         ),
//                                       );
//                                     }
//                                   },
//
//                                   icon: const Icon(
//                                     Icons.flag,
//                                     color: Colors.orange,
//                                   ),
//                                 ),
//
//                                 // 📩 SEND WARNING
//                                 // IconButton(
//                                 //   onPressed:
//                                 //       () async {
//                                 //
//                                 //     final token =
//                                 //     data['fcmToken'];
//                                 //
//                                 //     if (token !=
//                                 //         null) {
//                                 //
//                                 //       await SendNotificationService
//                                 //           .sendNotificationUsingApi(
//                                 //         token:
//                                 //         token,
//                                 //
//                                 //         title:
//                                 //         "Item Warning",
//                                 //
//                                 //         body:
//                                 //         "Your item has been temporarily hidden due to suspicious or incorrect information. Please repost with accurate details if necessary.",
//                                 //
//                                 //         data: {
//                                 //           "screen":
//                                 //           "itemDetail",
//                                 //           "itemId":
//                                 //           doc.id,
//                                 //         },
//                                 //       );
//                                 //
//                                 //       ScaffoldMessenger.of(
//                                 //           context)
//                                 //           .showSnackBar(
//                                 //         const SnackBar(
//                                 //           content: Text(
//                                 //             "Notification Sent",
//                                 //           ),
//                                 //         ),
//                                 //       );
//                                 //     }
//                                 //   },
//                                 //
//                                 //   icon:
//                                 //   const Icon(
//                                 //     Icons.notifications,
//                                 //
//                                 //     color:
//                                 //     Colors.purple,
//                                 //   ),
//                                 // ),
//
//                                 // 🗑 DELETE
//                                 IconButton(
//                                 tooltip:"Delete Item",
//                                   onPressed:
//                                       () async {
//
//                                     final confirm =
//                                     await showDialog(
//                                       context:
//                                       context,
//
//                                       builder:
//                                           (context) {
//
//                                         return AlertDialog(
//                                           title:
//                                           const Text(
//                                             "Delete Item",
//                                           ),
//
//                                           content:
//                                           const Text(
//                                             "Are you sure you want to delete this item?",
//                                           ),
//
//                                           actions: [
//
//                                             TextButton(
//                                               onPressed:
//                                                   () {
//                                                 Navigator.pop(
//                                                     context,
//                                                     false);
//                                               },
//
//                                               child:
//                                               const Text(
//                                                 "Cancel",
//                                               ),
//                                             ),
//
//                                             ElevatedButton(
//                                               onPressed:
//                                                   () {
//                                                 Navigator.pop(
//                                                     context,
//                                                     true);
//                                               },
//
//                                               style:
//                                               ElevatedButton.styleFrom(
//                                                 backgroundColor:
//                                                 Colors.red,
//                                               ),
//
//                                               child:
//                                               const Text(
//                                                 "Delete",
//                                               ),
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                     );
//
//                                     if (confirm ==
//                                         true) {
//
//                                       await FirebaseFirestore
//                                           .instance
//                                           .collection(
//                                           'items')
//                                           .doc(doc.id)
//                                           .delete();
//
//                                       ScaffoldMessenger.of(
//                                           context)
//                                           .showSnackBar(
//                                         const SnackBar(
//                                           content: Text(
//                                             "Item deleted successfully",
//                                           ),
//                                         ),
//                                       );
//                                     }
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
//
//   // 🔷 STATUS COLORS
//   Color _getStatusColor(String status) {
//
//     switch (status.toLowerCase()) {
//
//       case "lost":
//         return Colors.orange;
//
//       case "found":
//         return Colors.green;
//
//       case "claim pending":
//         return Colors.amber;
//
//       case "claim approved":
//         return Colors.green;
//
//       case "claim rejected":
//         return Colors.red;
//
//       case "returned":
//         return Colors.blue;
//
//       default:
//         return Colors.grey;
//     }
//   }
// }

//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../../services/notifications/send_notification_service.dart';
// import 'duplicatealertscreen.dart';
// import 'itemdetaildialog.dart';
//
// class ItemsScreen extends StatefulWidget {
//   const ItemsScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   State<ItemsScreen> createState() => _ItemsScreenState();
// }
//
// class _ItemsScreenState extends State<ItemsScreen> {
//
//   // 🔍 SEARCH
//   final TextEditingController searchController =
//   TextEditingController();
//
//   String searchQuery = "";
//
//   // 🔷 FILTERS
//   String selectedType = "All Items";
//   String selectedCategory = "All Categories";
//   String selectedStatus = "All Status";
//
//   @override
//   Widget build(BuildContext context) {
//
//     // ✅ CHANGE 1
//     // Added LayoutBuilder + ConstrainedBox
//     // This prevents layout overflow on smaller screens
//
//     return LayoutBuilder(
//       // Gives current available screen width,
//       // so widgets can adjust themselves according to the remaining space.
//       builder: (context, constraints) {
//
//         return SingleChildScrollView(
//           padding: const EdgeInsets.all(25),
//
//           child: ConstrainedBox(
//             // Forces the UI to stay inside the available screen width instead of overflowing outside.
//             constraints: BoxConstraints(
//               minWidth: constraints.maxWidth,
//             //   take remainig availbale space
//             ),
//             //TextOverflow.ellipsis
//             child: Column(
//               crossAxisAlignment:
//               CrossAxisAlignment.start,
//
//               children: [
//
//                 // 🔷 HEADER
//                 Wrap(
//                   //with wrap doesnot reamin innone line if soace is less they mocve to next line
//                   spacing: 15,
//                   runSpacing: 15,
//
//                   children: [
//
//                     const Text(
//                       "Manage Items",
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const DuplicateAlertsScreen(),
//                           ),
//                         );
//                       },
//                       icon: const Icon(Icons.warning),
//                       label: const Text("Duplicate Alerts"),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.redAccent,
//                       ),
//                     ),
//
//                     ElevatedButton.icon(
//                       onPressed: () {},
//
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor:
//                         ItemsScreen.orange,
//
//                         padding:
//                         const EdgeInsets.symmetric(
//                           horizontal: 18,
//                           vertical: 14,
//                         ),
//
//                         shape: RoundedRectangleBorder(
//                           borderRadius:
//                           BorderRadius.circular(12),
//                         ),
//                       ),
//
//                       icon: const Icon(
//                         Icons.add,
//                         color: Colors.white,
//                       ),
//
//                       label: const Text(
//                         "Add Item",
//                         style:
//                         TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 25),
//
//                 // ✅ CHANGE 2
//                 // Added horizontal scrolling to filter row
//                 // Prevents RenderFlex overflow
//
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//
//                   child: Row(
//                     children: [
//
//                       // 🔍 SEARCH
//                       SizedBox(
//                         width: 300,
//
//                         child: TextField(
//                           controller: searchController,
//
//                           decoration: InputDecoration(
//                             hintText: "Search items...",
//
//                             prefixIcon:
//                             const Icon(Icons.search),
//
//                             filled: true,
//                             fillColor: Colors.white,
//
//                             border: OutlineInputBorder(
//                               borderRadius:
//                               BorderRadius.circular(12),
//
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//
//                           onChanged: (value) {
//
//                             setState(() {
//                               searchQuery =
//                                   value.toLowerCase();
//                             });
//                           },
//                         ),
//                       ),
//
//                       const SizedBox(width: 20),
//
//                       // 🔷 TYPE FILTER
//                       Container(
//                         padding:
//                         const EdgeInsets.symmetric(
//                             horizontal: 14),
//
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius:
//                           BorderRadius.circular(12),
//
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black
//                                   .withOpacity(0.05),
//
//                               blurRadius: 6,
//
//                               offset:
//                               const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//
//                         child: DropdownButton<String>(
//                           underline: const SizedBox(),
//
//                           value: selectedType,
//
//                           items: const [
//
//                             DropdownMenuItem(
//                               value: "All Items",
//                               child: Text("All Items"),
//                             ),
//
//                             DropdownMenuItem(
//                               value: "lost",
//                               child: Text("Lost"),
//                             ),
//
//                             DropdownMenuItem(
//                               value: "found",
//                               child: Text("Found"),
//                             ),
//                           ],
//
//                           onChanged: (value) {
//
//                             setState(() {
//                               selectedType = value!;
//                             });
//                           },
//                         ),
//                       ),
//
//                       const SizedBox(width: 20),
//
//                       // 🔷 CATEGORY FILTER
//                       Container(
//                         padding:
//                         const EdgeInsets.symmetric(
//                             horizontal: 14),
//
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius:
//                           BorderRadius.circular(12),
//
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black
//                                   .withOpacity(0.05),
//
//                               blurRadius: 6,
//
//                               offset:
//                               const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//
//                         child: DropdownButton<String>(
//                           underline: const SizedBox(),
//
//                           value: selectedCategory,
//
//                           items: const [
//
//                             DropdownMenuItem(
//                               value: "All Categories",
//                               child:
//                               Text("All Categories"),
//                             ),
//
//                             DropdownMenuItem(
//                               value: "Student ID Card",
//                               child:
//                               Text("Student ID Card"),
//                             ),
//
//                             DropdownMenuItem(
//                               value: "Keys",
//                               child: Text("Keys"),
//                             ),
//
//                             DropdownMenuItem(
//                               value: "Electronics",
//                               child:
//                               Text("Electronics"),
//                             ),
//
//                             DropdownMenuItem(
//                               value: "Clothing",
//                               child: Text("Clothing"),
//                             ),
//
//                             DropdownMenuItem(
//                               value: "Documents",
//                               child:
//                               Text("Documents"),
//                             ),
//
//                             DropdownMenuItem(
//                               value: "Others",
//                               child: Text("Others"),
//                             ),
//                           ],
//
//                           onChanged: (value) {
//
//                             setState(() {
//                               selectedCategory =
//                               value!;
//                             });
//                           },
//                         ),
//                       ),
//
//                       const SizedBox(width: 20),
//
//                       // 🔷 STATUS FILTER
//                       Container(
//                         padding:
//                         const EdgeInsets.symmetric(
//                             horizontal: 14),
//
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius:
//                           BorderRadius.circular(12),
//
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black
//                                   .withOpacity(0.05),
//
//                               blurRadius: 6,
//
//                               offset:
//                               const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//
//                         child: DropdownButton<String>(
//                           underline: const SizedBox(),
//
//                           value: selectedStatus,
//
//                           items: const [
//
//                             DropdownMenuItem(
//                               value: "All Status",
//                               child:
//                               Text("All Status"),
//                             ),
//
//                             DropdownMenuItem(
//                               value: "lost",
//                               child: Text("Lost"),
//                             ),
//
//                             DropdownMenuItem(
//                               value: "found",
//                               child: Text("Found"),
//                             ),
//
//                             DropdownMenuItem(
//                               value: "claim pending",
//                               child:
//                               Text("Claim Pending"),
//                             ),
//
//                             DropdownMenuItem(
//                               value: "claim approved",
//                               child:
//                               Text("Claim Approved"),
//                             ),
//
//                             DropdownMenuItem(
//                               value: "claim rejected",
//                               child:
//                               Text("Claim Rejected"),
//                             ),
//
//                             DropdownMenuItem(
//                               value: "returned",
//                               child: Text("Returned"),
//                             ),
//                           ],
//
//                           onChanged: (value) {
//
//                             setState(() {
//                               selectedStatus =
//                               value!;
//                             });
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 30),
//
//                 // 🔷 ITEMS TABLE
//                 Container(
//
//                   // ✅ CHANGE 3
//                   // Removed fixed width: 880
//                   // Added double.infinity
//
//                   width: double.infinity,
//
//                   padding: const EdgeInsets.all(20),
//
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//
//                     borderRadius:
//                     BorderRadius.circular(16),
//
//                     boxShadow: [
//                       BoxShadow(
//                         color:
//                         Colors.black.withOpacity(0.05),
//
//                         blurRadius: 8,
//
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//
//                   child: StreamBuilder<QuerySnapshot>(
//                     stream: FirebaseFirestore.instance
//                         .collection('items')
//                         .orderBy(
//                       'createdAt',
//                       descending: true,
//                     )
//                         .snapshots(),
//
//                     builder: (context, snapshot) {
//
//                       if (snapshot.connectionState ==
//                           ConnectionState.waiting) {
//
//                         return const Center(
//                           child:
//                           CircularProgressIndicator(),
//                         );
//                       }
//
//                       if (!snapshot.hasData ||
//                           snapshot.data!.docs.isEmpty) {
//
//                         return const Center(
//                           child: Text("No items found"),
//                         );
//                       }
//
//                       final items =
//                           snapshot.data!.docs;
//
//                       return SingleChildScrollView(
//                         scrollDirection:
//                         Axis.horizontal,
//
//                         child: DataTable(
//
//                           headingRowColor:
//                           MaterialStateProperty.all(
//                             ItemsScreen.bgColor,
//                           ),
//
//                           columns: const [
//
//                             DataColumn(
//                               label: Text(
//                                 "Item",
//                                 style: TextStyle(
//                                   fontWeight:
//                                   FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//
//                             DataColumn(
//                               label: Text(
//                                 "Type",
//                                 style: TextStyle(
//                                   fontWeight:
//                                   FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//
//                             DataColumn(
//                               label: Text(
//                                 "Category",
//                                 style: TextStyle(
//                                   fontWeight:
//                                   FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//
//                             DataColumn(
//                               label: Text(
//                                 "Status",
//                                 style: TextStyle(
//                                   fontWeight:
//                                   FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//
//                             DataColumn(
//                               label: Text(
//                                 "Created",
//                                 style: TextStyle(
//                                   fontWeight:
//                                   FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//
//                             DataColumn(
//                               label: Text(
//                                 "Actions",
//                                 style: TextStyle(
//                                   fontWeight:
//                                   FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//
//                           rows:
//                           items.map<DataRow?>((doc) {
//
//                             final data =
//                             doc.data()
//                             as Map<String, dynamic>;
//
//                             final itemName =
//                             (data['itemName'] ?? '')
//                                 .toString();
//
//                             final lowerName =
//                             itemName.toLowerCase();
//
//                             final itemType =
//                             (data['type'] ?? '')
//                                 .toString();
//
//                             final category =
//                             (data['category'] ?? '')
//                                 .toString();
//
//                             final status =
//                             (data['status'] ?? '')
//                                 .toString();
//
//                             // 🔍 SEARCH FILTER
//                             if (!lowerName.contains(
//                                 searchQuery)) {
//                               return null;
//                             }
//
//                             // 🔷 TYPE FILTER
//                             if (selectedType !=
//                                 "All Items" &&
//                                 itemType !=
//                                     selectedType) {
//                               return null;
//                             }
//
//                             // 🔷 CATEGORY FILTER
//                             if (selectedCategory !=
//                                 "All Categories" &&
//                                 category !=
//                                     selectedCategory) {
//                               return null;
//                             }
//
//                             // 🔷 STATUS FILTER
//                             if (selectedStatus !=
//                                 "All Status" &&
//                                 status.toLowerCase() !=
//                                     selectedStatus
//                                         .toLowerCase()) {
//                               return null;
//                             }
//
//                             return DataRow(
//                               cells: [
//
//                                 // 🔷 ITEM
//                                 DataCell(
//                                   Row(
//                                     children: [
//
//                                       Container(
//                                         width: 45,
//                                         height: 45,
//
//                                         decoration:
//                                         BoxDecoration(
//                                           borderRadius:
//                                           BorderRadius
//                                               .circular(
//                                               10),
//
//                                           image: data[
//                                           'imageUrl'] !=
//                                               null
//                                               ? DecorationImage(
//                                             image:
//                                             NetworkImage(
//                                               data[
//                                               'imageUrl'],
//                                             ),
//
//                                             fit: BoxFit
//                                                 .cover,
//                                           )
//                                               : null,
//
//                                           color:
//                                           ItemsScreen
//                                               .bgColor,
//                                         ),
//
//                                         child: data[
//                                         'imageUrl'] ==
//                                             null
//                                             ? const Icon(
//                                           Icons
//                                               .inventory_2,
//                                         )
//                                             : null,
//                                       ),
//
//                                       const SizedBox(
//                                           width: 10),
//
//                                       Text(itemName),
//                                     ],
//                                   ),
//                                 ),
//
//                                 // 🔷 TYPE
//                                 DataCell(
//
//                                   Container(
//                                     padding:
//                                     const EdgeInsets
//                                         .symmetric(
//                                       horizontal: 12,
//                                       vertical: 6,
//                                     ),
//
//                                     decoration:
//                                     BoxDecoration(
//
//                                       color: itemType ==
//                                           "lost"
//                                           ? Colors.orange
//                                           .withOpacity(
//                                           0.15)
//                                           : Colors.green
//                                           .withOpacity(
//                                           0.15),
//
//                                       borderRadius:
//                                       BorderRadius
//                                           .circular(
//                                           20),
//                                     ),
//
//                                     child: Text(
//                                       itemType
//                                           .toUpperCase(),
//
//                                       style: TextStyle(
//                                         color: itemType ==
//                                             "lost"
//                                             ? Colors
//                                             .orange
//                                             : Colors
//                                             .green,
//
//                                         fontWeight:
//                                         FontWeight
//                                             .bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//
//                                 // 🔷 CATEGORY
//                                 DataCell(
//                                   Text(category),
//                                 ),
//
//                                 // 🔷 STATUS
//                                 DataCell(
//
//                                   Container(
//                                     padding:
//                                     const EdgeInsets
//                                         .symmetric(
//                                       horizontal: 12,
//                                       vertical: 6,
//                                     ),
//
//                                     decoration:
//                                     BoxDecoration(
//                                       color:
//                                       _getStatusColor(
//                                           status)
//                                           .withOpacity(
//                                           0.15),
//
//                                       borderRadius:
//                                       BorderRadius
//                                           .circular(
//                                           20),
//                                     ),
//
//                                     child: Text(
//                                       status.toUpperCase(),
//
//                                       style: TextStyle(
//                                         color:
//                                         _getStatusColor(
//                                             status),
//
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//
//                                 // 🔷 CREATED
//                                 DataCell(
//                                   Text(
//                                     data['dateLost']
//                                         ?? '',
//                                   ),
//                                 ),
//
//                                 // 🔷 ACTIONS
//                                 DataCell(
//
//                                   Row(
//                                     children: [
//
//                                       IconButton(
//                                         tooltip:"View Item",
//                                         onPressed: () {
//
//                                           showDialog(
//                                             context: context,
//
//                                             builder: (context) {
//
//                                               return ItemDetailDialog(
//                                                 data: data,
//                                               );
//                                             },
//                                           );
//                                         },
//
//                                         icon: const Icon(
//                                           Icons.visibility,
//                                           color: Colors.blue,
//                                         ),
//                                       ),
//
//                                       IconButton(
//                                         tooltip:"Flag Item",
//                                         onPressed: () async {
//
//                                           try {
//
//                                             if (data['flagged'] == true) {
//
//                                               ScaffoldMessenger.of(context).showSnackBar(
//                                                 const SnackBar(
//                                                   content: Text("Item is already flagged"),
//                                                 ),
//                                               );
//
//                                               return;
//                                             }
//
//                                             await FirebaseFirestore.instance
//                                                 .collection('items')
//                                                 .doc(doc.id)
//                                                 .update({
//                                               "flagged": true,
//                                             });
//
//                                             final token = data['fcmToken'];
//
//                                             if (token != null &&
//                                                 token.toString().isNotEmpty) {
//
//                                               await SendNotificationService
//                                                   .sendNotificationUsingApi(
//
//                                                 token: token,
//
//                                                 title: "⚠ Item Hidden by Admin",
//
//                                                 body:
//                                                 "Your item '${data['itemName']}' was temporarily hidden due to suspicious or incorrect information.",
//
//                                                 data: {
//                                                   "screen": "itemDetail",
//                                                   "itemId": doc.id,
//                                                 },
//                                               );
//                                             }
//
//                                             ScaffoldMessenger.of(context)
//                                                 .showSnackBar(
//                                               const SnackBar(
//                                                 content: Text(
//                                                   "Item flagged successfully",
//                                                 ),
//                                               ),
//                                             );
//
//                                           } catch (e) {
//
//                                             ScaffoldMessenger.of(context)
//                                                 .showSnackBar(
//                                               SnackBar(
//                                                 content: Text(
//                                                   "Error: $e",
//                                                 ),
//                                               ),
//                                             );
//                                           }
//                                         },
//
//                                         icon: const Icon(
//                                           Icons.flag,
//                                           color: Colors.orange,
//                                         ),
//                                       ),
//
//                                       IconButton(
//                                         tooltip:"Delete Item",
//                                         onPressed:
//                                             () async {
//
//                                           final confirm =
//                                           await showDialog(
//                                             context:
//                                             context,
//
//                                             builder:
//                                                 (context) {
//
//                                               return AlertDialog(
//                                                 title:
//                                                 const Text(
//                                                   "Delete Item",
//                                                 ),
//
//                                                 content:
//                                                 const Text(
//                                                   "Are you sure you want to delete this item?",
//                                                 ),
//
//                                                 actions: [
//
//                                                   TextButton(
//                                                     onPressed:
//                                                         () {
//                                                       Navigator.pop(
//                                                           context,
//                                                           false);
//                                                     },
//
//                                                     child:
//                                                     const Text(
//                                                       "Cancel",
//                                                     ),
//                                                   ),
//
//                                                   ElevatedButton(
//                                                     onPressed:
//                                                         () {
//                                                       Navigator.pop(
//                                                           context,
//                                                           true);
//                                                     },
//
//                                                     style:
//                                                     ElevatedButton.styleFrom(
//                                                       backgroundColor:
//                                                       Colors.red,
//                                                     ),
//
//                                                     child:
//                                                     const Text(
//                                                       "Delete",
//                                                     ),
//                                                   ),
//                                                 ],
//                                               );
//                                             },
//                                           );
//
//                                           if (confirm ==
//                                               true) {
//
//                                             await FirebaseFirestore
//                                                 .instance
//                                                 .collection(
//                                                 'items')
//                                                 .doc(doc.id)
//                                                 .delete();
//
//                                             ScaffoldMessenger.of(
//                                                 context)
//                                                 .showSnackBar(
//                                               const SnackBar(
//                                                 content: Text(
//                                                   "Item deleted successfully",
//                                                 ),
//                                               ),
//                                             );
//                                           }
//                                         },
//
//                                         icon:
//                                         const Icon(
//                                           Icons.delete,
//
//                                           color:
//                                           Colors.red,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             );
//
//                           }).whereType<DataRow>().toList(),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   // 🔷 STATUS COLORS
//   Color _getStatusColor(String status) {
//
//     switch (status.toLowerCase()) {
//
//       case "lost":
//         return Colors.orange;
//
//       case "found":
//         return Colors.green;
//
//       case "claim pending":
//         return Colors.amber;
//
//       case "claim approved":
//         return Colors.green;
//
//       case "claim rejected":
//         return Colors.red;
//
//       case "returned":
//         return Colors.blue;
//
//       default:
//         return Colors.grey;
//     }
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../../services/notifications/send_notification_service.dart';
// import 'duplicatealertscreen.dart';
// import 'itemdetaildialog.dart';
//
// class ItemsScreen extends StatefulWidget {
//   const ItemsScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   State<ItemsScreen> createState() => _ItemsScreenState();
// }
//
// class _ItemsScreenState extends State<ItemsScreen> {
//
//   // 🔍 SEARCH
//   final TextEditingController searchController =
//   TextEditingController();
//
//   String searchQuery = "";
//
//   // 🔷 FILTERS
//   String selectedType = "All Items";
//   String selectedCategory = "All Categories";
//   String selectedStatus = "All Status";
//
//   // ✅ NEW
//   String selectedView = "items";
//   Widget _dropdown(
//       String selectedValue,
//       List<String> items,
//       ValueChanged<String?> onChanged,
//       ) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 6,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: DropdownButton<String>(
//         value: selectedValue,
//         underline: const SizedBox(),
//         borderRadius: BorderRadius.circular(12),
//
//         items: items
//             .map(
//               (e) => DropdownMenuItem(
//             value: e,
//             child: Text(e),
//           ),
//         )
//             .toList(),
//
//         onChanged: onChanged,
//       ),
//     );
//   }
//
//   Widget _topTab(String title, String value) {
//     final isActive = selectedView == value;
//
//     return GestureDetector(
//       onTap: () => setState(() => selectedView = value),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         decoration: BoxDecoration(
//           color: isActive ? ItemsScreen.darkBlue : Colors.transparent,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Text(
//           title,
//           style: TextStyle(
//             color: isActive ? Colors.white : Colors.black,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _searchBox() {
//     return SizedBox(
//       width: 300,
//       child: TextField(
//         controller: searchController,
//         decoration: InputDecoration(
//           hintText: "Search items...",
//           prefixIcon: const Icon(Icons.search),
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide.none,
//           ),
//         ),
//         onChanged: (value) {
//           setState(() {
//             searchQuery = value.toLowerCase();
//           });
//         },
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return SingleChildScrollView(
//           padding: const EdgeInsets.all(25),
//           child: ConstrainedBox(
//             constraints: BoxConstraints(minWidth: constraints.maxWidth),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 // ================= TOP NAV BAR =================
//                 Container(
//                   padding: const EdgeInsets.all(14),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(14),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         blurRadius: 10,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     children: [
//
//                       // 🔘 SEGMENTED TABS
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade100,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         padding: const EdgeInsets.all(4),
//                         child: Row(
//                           children: [
//
//                             _topTab("All Items", "items"),
//                             const SizedBox(width: 6),
//                             _topTab("Duplicate Alerts", "duplicates"),
//                           ],
//                         ),
//                       ),
//
//                       const Spacer(),
//
//                       // ➕ ADD ITEM (RIGHT SIDE FIXED)
//                       ElevatedButton.icon(
//                         onPressed: () {},
//                         icon: const Icon(Icons.add, color: Colors.white),
//                         label: const Text("Add Item",
//                             style: TextStyle(color: Colors.white)),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: ItemsScreen.orange,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 18, vertical: 14),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 // ================= FILTERS (ONLY ITEMS VIEW) =================
//                 if (selectedView == "items") ...[
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//
//                         _searchBox(),
//                         const SizedBox(width: 15),
//
//                         _dropdown(selectedType, [
//                           "All Items",
//                           "lost",
//                           "found"
//                         ], (v) => setState(() => selectedType = v!)),
//
//                         const SizedBox(width: 15),
//
//                         _dropdown(selectedCategory, [
//                           "All Categories",
//                           "Student ID Card",
//                           "Keys",
//                           "Electronics",
//                           "Clothing",
//                           "Documents",
//                           "Others"
//                         ], (v) => setState(() => selectedCategory = v!)),
//
//                         const SizedBox(width: 15),
//
//                         _dropdown(selectedStatus, [
//                           "All Status",
//                           "lost",
//                           "found",
//                           "claim pending",
//                           "claim approved",
//                           "claim rejected",
//                           "returned"
//                         ], (v) => setState(() => selectedStatus = v!)),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 25),
//                 ],
//
//                 // ================= VIEW SWITCH =================
//                 selectedView == "items"
//                     ? _buildItemsTable()
//                     : const DuplicateAlertsScreen(),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   // ✅ ITEMS TABLE
//   Widget _buildItemsTable() {
//
//     return Container(
//
//       width: double.infinity,
//
//       padding: const EdgeInsets.all(20),
//
//       decoration: BoxDecoration(
//         color: Colors.white,
//
//         borderRadius:
//         BorderRadius.circular(16),
//
//         boxShadow: [
//           BoxShadow(
//             color:
//             Colors.black.withOpacity(0.05),
//
//             blurRadius: 8,
//
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//
//       child: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('items')
//             .orderBy(
//           'createdAt',
//           descending: true,
//         )
//             .snapshots(),
//
//         builder: (context, snapshot) {
//
//           if (snapshot.connectionState ==
//               ConnectionState.waiting) {
//
//             return const Center(
//               child:
//               CircularProgressIndicator(),
//             );
//           }
//
//           if (!snapshot.hasData ||
//               snapshot.data!.docs.isEmpty) {
//
//             return const Center(
//               child: Text("No items found"),
//             );
//           }
//
//           final items =
//               snapshot.data!.docs;
//
//           return SingleChildScrollView(
//             scrollDirection:
//             Axis.horizontal,
//
//             child: DataTable(
//
//               headingRowColor:
//               MaterialStateProperty.all(
//                 ItemsScreen.bgColor,
//               ),
//
//               columns: const [
//
//                 DataColumn(
//                   label: Text(
//                     "Item",
//                     style: TextStyle(
//                       fontWeight:
//                       FontWeight.bold,
//                     ),
//                   ),
//                 ),
//
//                 DataColumn(
//                   label: Text(
//                     "Type",
//                     style: TextStyle(
//                       fontWeight:
//                       FontWeight.bold,
//                     ),
//                   ),
//                 ),
//
//                 DataColumn(
//                   label: Text(
//                     "Category",
//                     style: TextStyle(
//                       fontWeight:
//                       FontWeight.bold,
//                     ),
//                   ),
//                 ),
//
//                 DataColumn(
//                   label: Text(
//                     "Status",
//                     style: TextStyle(
//                       fontWeight:
//                       FontWeight.bold,
//                     ),
//                   ),
//                 ),
//
//                 DataColumn(
//                   label: Text(
//                     "Created",
//                     style: TextStyle(
//                       fontWeight:
//                       FontWeight.bold,
//                     ),
//                   ),
//                 ),
//
//                 DataColumn(
//                   label: Text(
//                     "Actions",
//                     style: TextStyle(
//                       fontWeight:
//                       FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//
//               rows:
//               items.map<DataRow?>((doc) {
//
//                 final data =
//                 doc.data()
//                 as Map<String, dynamic>;
//
//                 final itemName =
//                 (data['itemName'] ?? '')
//                     .toString();
//
//                 final lowerName =
//                 itemName.toLowerCase();
//
//                 final itemType =
//                 (data['type'] ?? '')
//                     .toString();
//
//                 final category =
//                 (data['category'] ?? '')
//                     .toString();
//
//                 final status =
//                 (data['status'] ?? '')
//                     .toString();
//
//                 // 🔍 SEARCH FILTER
//                 if (!lowerName.contains(
//                     searchQuery)) {
//                   return null;
//                 }
//
//                 // 🔷 TYPE FILTER
//                 if (selectedType !=
//                     "All Items" &&
//                     itemType !=
//                         selectedType) {
//                   return null;
//                 }
//
//                 // 🔷 CATEGORY FILTER
//                 if (selectedCategory !=
//                     "All Categories" &&
//                     category !=
//                         selectedCategory) {
//                   return null;
//                 }
//
//                 // 🔷 STATUS FILTER
//                 if (selectedStatus !=
//                     "All Status" &&
//                     status.toLowerCase() !=
//                         selectedStatus
//                             .toLowerCase()) {
//                   return null;
//                 }
//
//                 return DataRow(
//                   cells: [
//
//                     // 🔷 ITEM
//                     DataCell(
//                       Row(
//                         children: [
//
//                           Container(
//                             width: 45,
//                             height: 45,
//
//                             decoration:
//                             BoxDecoration(
//                               borderRadius:
//                               BorderRadius
//                                   .circular(
//                                   10),
//
//                               image: data[
//                               'imageUrl'] !=
//                                   null
//                                   ? DecorationImage(
//                                 image:
//                                 NetworkImage(
//                                   data[
//                                   'imageUrl'],
//                                 ),
//
//                                 fit: BoxFit
//                                     .cover,
//                               )
//                                   : null,
//
//                               color:
//                               ItemsScreen
//                                   .bgColor,
//                             ),
//
//                             child: data[
//                             'imageUrl'] ==
//                                 null
//                                 ? const Icon(
//                               Icons
//                                   .inventory_2,
//                             )
//                                 : null,
//                           ),
//
//                           const SizedBox(
//                               width: 10),
//
//                           Text(itemName),
//                         ],
//                       ),
//                     ),
//
//                     // 🔷 TYPE
//                     DataCell(
//
//                       Container(
//                         padding:
//                         const EdgeInsets
//                             .symmetric(
//                           horizontal: 12,
//                           vertical: 6,
//                         ),
//
//                         decoration:
//                         BoxDecoration(
//
//                           color: itemType ==
//                               "lost"
//                               ? Colors.orange
//                               .withOpacity(
//                               0.15)
//                               : Colors.green
//                               .withOpacity(
//                               0.15),
//
//                           borderRadius:
//                           BorderRadius
//                               .circular(
//                               20),
//                         ),
//
//                         child: Text(
//                           itemType
//                               .toUpperCase(),
//
//                           style: TextStyle(
//                             color: itemType ==
//                                 "lost"
//                                 ? Colors
//                                 .orange
//                                 : Colors
//                                 .green,
//
//                             fontWeight:
//                             FontWeight
//                                 .bold,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     // 🔷 CATEGORY
//                     DataCell(
//                       Text(category),
//                     ),
//
//                     // 🔷 STATUS
//                     DataCell(
//
//                       Container(
//                         padding:
//                         const EdgeInsets
//                             .symmetric(
//                           horizontal: 12,
//                           vertical: 6,
//                         ),
//
//                         decoration:
//                         BoxDecoration(
//                           color:
//                           _getStatusColor(
//                               status)
//                               .withOpacity(
//                               0.15),
//
//                           borderRadius:
//                           BorderRadius
//                               .circular(
//                               20),
//                         ),
//
//                         child: Text(
//                           status.toUpperCase(),
//
//                           style: TextStyle(
//                             color:
//                             _getStatusColor(
//                                 status),
//
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     // 🔷 CREATED
//                     DataCell(
//                       Text(
//                         data['dateLost']
//                             ?? '',
//                       ),
//                     ),
//
//                     // 🔷 ACTIONS
//                     DataCell(
//
//                       Row(
//                         children: [
//
//                           IconButton(
//                             tooltip:"View Item",
//                             onPressed: () {
//
//                               showDialog(
//                                 context: context,
//
//                                 builder: (context) {
//
//                                   return ItemDetailDialog(
//                                     data: data,
//                                   );
//                                 },
//                               );
//                             },
//
//                             icon: const Icon(
//                               Icons.visibility,
//                               color: Colors.blue,
//                             ),
//                           ),
//
//                           IconButton(
//                             tooltip:"Flag Item",
//                             onPressed: () async {
//
//                               try {
//
//                                 if (data['flagged'] == true) {
//
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                       content: Text("Item is already flagged"),
//                                     ),
//                                   );
//
//                                   return;
//                                 }
//
//                                 await FirebaseFirestore.instance
//                                     .collection('items')
//                                     .doc(doc.id)
//                                     .update({
//                                   "flagged": true,
//                                 });
//
//                                 final token = data['fcmToken'];
//
//                                 if (token != null &&
//                                     token.toString().isNotEmpty) {
//
//                                   await SendNotificationService
//                                       .sendNotificationUsingApi(
//
//                                     token: token,
//
//                                     title: "⚠ Item Hidden by Admin",
//
//                                     body:
//                                     "Your item '${data['itemName']}' was temporarily hidden due to suspicious or incorrect information.",
//
//                                     data: {
//                                       "screen": "itemDetail",
//                                       "itemId": doc.id,
//                                     },
//                                   );
//                                 }
//
//                                 ScaffoldMessenger.of(context)
//                                     .showSnackBar(
//                                   const SnackBar(
//                                     content: Text(
//                                       "Item flagged successfully",
//                                     ),
//                                   ),
//                                 );
//
//                               } catch (e) {
//
//                                 ScaffoldMessenger.of(context)
//                                     .showSnackBar(
//                                   SnackBar(
//                                     content: Text(
//                                       "Error: $e",
//                                     ),
//                                   ),
//                                 );
//                               }
//                             },
//
//                             icon: const Icon(
//                               Icons.flag,
//                               color: Colors.orange,
//                             ),
//                           ),
//
//                           IconButton(
//                             tooltip:"Delete Item",
//                             onPressed:
//                                 () async {
//
//                               final confirm =
//                               await showDialog(
//                                 context:
//                                 context,
//
//                                 builder:
//                                     (context) {
//
//                                   return AlertDialog(
//                                     title:
//                                     const Text(
//                                       "Delete Item",
//                                     ),
//
//                                     content:
//                                     const Text(
//                                       "Are you sure you want to delete this item?",
//                                     ),
//
//                                     actions: [
//
//                                       TextButton(
//                                         onPressed:
//                                             () {
//                                           Navigator.pop(
//                                               context,
//                                               false);
//                                         },
//
//                                         child:
//                                         const Text(
//                                           "Cancel",
//                                         ),
//                                       ),
//
//                                       ElevatedButton(
//                                         onPressed:
//                                             () {
//                                           Navigator.pop(
//                                               context,
//                                               true);
//                                         },
//
//                                         style:
//                                         ElevatedButton.styleFrom(
//                                           backgroundColor:
//                                           Colors.red,
//                                         ),
//
//                                         child:
//                                         const Text(
//                                           "Delete",
//                                         ),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               );
//
//                               if (confirm ==
//                                   true) {
//
//                                 await FirebaseFirestore
//                                     .instance
//                                     .collection(
//                                     'items')
//                                     .doc(doc.id)
//                                     .delete();
//
//                                 ScaffoldMessenger.of(
//                                     context)
//                                     .showSnackBar(
//                                   const SnackBar(
//                                     content: Text(
//                                       "Item deleted successfully",
//                                     ),
//                                   ),
//                                 );
//                               }
//                             },
//
//                             icon:
//                             const Icon(
//                               Icons.delete,
//
//                               color:
//                               Colors.red,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//
//               }).whereType<DataRow>().toList(),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   // 🔷 STATUS COLORS
//   Color _getStatusColor(String status) {
//
//     switch (status.toLowerCase()) {
//
//       case "lost":
//         return Colors.orange;
//
//       case "found":
//         return Colors.green;
//
//       case "claim pending":
//         return Colors.amber;
//
//       case "claim approved":
//         return Colors.green;
//
//       case "claim rejected":
//         return Colors.red;
//
//       case "returned":
//         return Colors.blue;
//
//       default:
//         return Colors.grey;
//     }
//   }
// }



//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../../services/notifications/send_notification_service.dart';
// import 'itemdetaildialog.dart';
//
// class ItemsScreen extends StatefulWidget {
//   const ItemsScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   State<ItemsScreen> createState() => _ItemsScreenState();
// }
//
// class _ItemsScreenState extends State<ItemsScreen> {
//
//   // 🔍 SEARCH
//   final TextEditingController searchController = TextEditingController();
//   String searchQuery = "";
//
//   // 🔷 TAB CONTROL
//   String selectedTab = "all"; // all | flagged | duplicates
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           // 🔷 HEADER
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // const Text(
//               //   "Manage Items",
//               //   style: TextStyle(
//               //     fontSize: 28,
//               //     fontWeight: FontWeight.bold,
//               //   ),
//               // ),
//             ],
//           ),
//
//           const SizedBox(height: 20),
//
//           // 🔷 TABS (CORE CHANGE)
//           _buildTabs(),
//
//           const SizedBox(height: 20),
//
//           // 🔍 SEARCH
//           TextField(
//             controller: searchController,
//             decoration: InputDecoration(
//               hintText: "Search items...",
//               prefixIcon: const Icon(Icons.search),
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             onChanged: (value) {
//               setState(() {
//                 searchQuery = value.toLowerCase();
//               });
//             },
//           ),
//
//           const SizedBox(height: 20),
//
//           // 🔷 CONTENT SWITCHER
//           _buildCurrentView(),
//         ],
//       ),
//     );
//   }
//
//
//   Widget _buildTabs() {
//     return Row(
//       children: [
//
//         _tabButton("All Items", "all"),
//         const SizedBox(width: 10),
//
//         _tabButton("Flagged", "flagged"),
//         const SizedBox(width: 10),
//
//         StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection("duplicate_alerts")
//               .where("status", isEqualTo: "pending")
//               .snapshots(),
//
//           builder: (context, snapshot) {
//             final count = snapshot.data?.docs.length ?? 0;
//
//             return _tabButton(
//               "Duplicates ($count)",
//               "duplicates",
//               badgeCount: count,
//             );
//           },
//         ),
//       ],
//     );
//   }
//
//   Widget _tabButton(String title, String value, {int badgeCount = 0}) {
//     final isSelected = selectedTab == value;
//
//     return ElevatedButton(
//       onPressed: () {
//         setState(() {
//           selectedTab = value;
//         });
//       },
//
//       style: ElevatedButton.styleFrom(
//         backgroundColor: isSelected ? Colors.black : Colors.white,
//         foregroundColor: isSelected ? Colors.white : Colors.black,
//       ),
//
//       child: Row(
//         children: [
//           Text(title),
//
//           if (badgeCount > 0)
//             Container(
//               margin: const EdgeInsets.only(left: 6),
//               padding: const EdgeInsets.all(6),
//               decoration: const BoxDecoration(
//                 color: Colors.red,
//                 shape: BoxShape.circle,
//               ),
//               child: Text(
//                 badgeCount.toString(),
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCurrentView() {
//     if (selectedTab == "all") {
//       return _buildAllItems();
//     }
//
//     if (selectedTab == "flagged") {
//       return _buildFlaggedItems();
//     }
//
//     return _buildDuplicateAlerts();
//   }
//
//
//
//   Widget _buildAllItems() {
//     return _buildItemsStream(
//       filter: (data) => true,
//       showFlagButton: true,
//     );
//   }
//
//
//
//   Widget _buildFlaggedItems() {
//     return _buildItemsStream(
//       filter: (data) => data['flagged'] == true,
//       showFlagButton: false,
//     );
//   }
//
//
//   Widget _buildDuplicateAlerts() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection("duplicate_alerts")
//           .where("status", isEqualTo: "pending")
//           .orderBy("createdAt", descending: true)
//           .snapshots(),
//
//       builder: (context, snapshot) {
//
//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         final docs = snapshot.data!.docs;
//
//         if (docs.isEmpty) {
//           return const Center(child: Text("No duplicate alerts"));
//         }
//
//         return ListView.builder(
//           shrinkWrap: true,
//           itemCount: docs.length,
//
//           itemBuilder: (context, index) {
//             final data = docs[index].data() as Map<String, dynamic>;
//
//             return Card(
//               child: ListTile(
//                 title: Text(data['itemName'] ?? ""),
//                 subtitle: Text("Similarity: ${data['similarity']}"),
//
//                 trailing: IconButton(
//                   icon: const Icon(Icons.visibility),
//                   onPressed: () {
//                     // reuse your existing modal
//                   },
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//
//   Widget _buildItemsStream({
//     required bool Function(Map<String, dynamic>) filter,
//     required bool showFlagButton,
//   }) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('items')
//           .orderBy('createdAt', descending: true)
//           .snapshots(),
//
//       builder: (context, snapshot) {
//
//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         final items = snapshot.data!.docs;
//
//         return DataTable(
//           columns: const [
//             DataColumn(label: Text("Item")),
//             DataColumn(label: Text("Type")),
//             DataColumn(label: Text("Status")),
//             DataColumn(label: Text("Actions")),
//           ],
//
//           rows: items.map((doc) {
//             final data = doc.data() as Map<String, dynamic>;
//
//             if (!filter(data)) return null;
//
//             return DataRow(
//               cells: [
//
//                 DataCell(Text(data['itemName'] ?? "")),
//
//                 DataCell(Text(data['type'] ?? "")),
//
//                 DataCell(Text(data['status'] ?? "")),
//
//                 DataCell(Row(
//                   children: [
//
//                     IconButton(
//                       icon: const Icon(Icons.visibility),
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (_) => ItemDetailDialog(data: data),
//                         );
//                       },
//                     ),
//
//                     if (showFlagButton)
//                       IconButton(
//                         icon: const Icon(Icons.flag),
//                         onPressed: () async {
//                           await FirebaseFirestore.instance
//                               .collection('items')
//                               .doc(doc.id)
//                               .update({"flagged": true});
//                         },
//                       ),
//                   ],
//                 )),
//               ],
//             );
//           }).whereType<DataRow>().toList(),
//         );
//       },
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../services/notifications/send_notification_service.dart';
import 'itemdetaildialog.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  static const Color darkBlue = Color(0xFF2A417F);
  static const Color orange = Color(0xFFF09E27);
  static const Color bgColor = Color(0xFFEFF5FB);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {

  // 🔍 SEARCH
  final TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  // 🔷 TAB CONTROL
  String selectedTab = "all"; // all | flagged | duplicates

  // 🔷 FILTERS (ADDED FROM YOUR SECOND CODE)
  String selectedType = "All Items";
  String selectedCategory = "All Categories";
  String selectedStatus = "All Status";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🔷 TABS
          _buildTabs(),

          const SizedBox(height: 20),

          // 🔍 SEARCH
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search items...",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              setState(() {
                searchQuery = value.toLowerCase();
              });
            },
          ),

          const SizedBox(height: 15),

          // 🔷 FILTERS (INTEGRATED)
          if (selectedTab == "all") _buildFilters(),

          const SizedBox(height: 20),

          // 🔷 CONTENT
          _buildCurrentView(),
        ],
      ),
    );
  }

  // ================= TABS =================
  Widget _buildTabs() {
    return Row(
      children: [

        _tabButton("All Items", "all"),
        const SizedBox(width: 10),

        _tabButton("Flagged", "flagged"),
        const SizedBox(width: 10),

        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("duplicate_alerts")
              .where("status", isEqualTo: "pending")
              .snapshots(),

          builder: (context, snapshot) {
            final count = snapshot.data?.docs.length ?? 0;

            return _tabButton(
              "Duplicates ($count)",
              "duplicates",
              badgeCount: count,
            );
          },
        ),
      ],
    );
  }

  Widget _tabButton(String title, String value, {int badgeCount = 0}) {
    final isSelected = selectedTab == value;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedTab = value;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.black : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
      ),
      child: Row(
        children: [
          Text(title),
          if (badgeCount > 0)
            Container(
              margin: const EdgeInsets.only(left: 6),
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                badgeCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  // ================= FILTERS (FROM SECOND CODE) =================
  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [

          _dropdown(
            selectedType,
            ["All Items", "lost", "found"],
                (v) => setState(() => selectedType = v!),
          ),

          const SizedBox(width: 10),

          _dropdown(
            selectedCategory,
            [
              "All Categories",
              "Student ID Card",
              "Keys",
              "Electronics",
              "Clothing",
              "Documents",
              "Others"
            ],
                (v) => setState(() => selectedCategory = v!),
          ),

          const SizedBox(width: 10),

          _dropdown(
            selectedStatus,
            [
              "All Status",
              "lost",
              "found",
              "claim pending",
              "claim approved",
              "claim rejected",
              "returned"
            ],
                (v) => setState(() => selectedStatus = v!),
          ),
        ],
      ),
    );
  }

  Widget _dropdown(
      String selectedValue,
      List<String> items,
      ValueChanged<String?> onChanged,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        underline: const SizedBox(),
        items: items
            .map((e) => DropdownMenuItem(
          value: e,
          child: Text(e),
        ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  // ================= VIEW SWITCH =================
  Widget _buildCurrentView() {
    if (selectedTab == "all") return _buildAllItems();
    if (selectedTab == "flagged") return _buildFlaggedItems();
    return _buildDuplicateAlerts();
  }

  Widget _buildAllItems() {
    return _buildItemsStream((data) => true, true);
  }

  Widget _buildFlaggedItems() {
    return _buildItemsStream((data) => data['flagged'] == true, false);
  }

  // ================= DUPLICATES =================
  Widget _buildDuplicateAlerts() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("duplicate_alerts")
          .where("status", isEqualTo: "pending")
          .orderBy("createdAt", descending: true)
          .snapshots(),

      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data!.docs;

        if (docs.isEmpty) {
          return const Center(child: Text("No duplicate alerts"));
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final data = docs[index].data() as Map<String, dynamic>;

            return Card(
              child: ListTile(
                title: Text(data['itemName'] ?? ""),
                subtitle: Text("Similarity: ${data['similarity']}"),
              ),
            );
          },
        );
      },
    );
  }

  // ================= ITEMS STREAM (SEARCH + FILTERS ADDED) =================
  Widget _buildItemsStream(
      bool Function(Map<String, dynamic>) extraFilter,
      bool showFlagButton,
      ) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('items')
          .orderBy('createdAt', descending: true)
          .snapshots(),

      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final items = snapshot.data!.docs;

        return DataTable(
          columns: const [
            DataColumn(label: Text("Item")),
            DataColumn(label: Text("Type")),
            DataColumn(label: Text("Status")),
            DataColumn(label: Text("Actions")),
          ],

          rows: items.map((doc) {
            final data = doc.data() as Map<String, dynamic>;

            final itemName = (data['itemName'] ?? '').toString();
            final lowerName = itemName.toLowerCase();

            final itemType = (data['type'] ?? '').toString();
            final category = (data['category'] ?? '').toString();
            final status = (data['status'] ?? '').toString();

            // 🔍 SEARCH FILTER
            if (!lowerName.contains(searchQuery)) return null;

            // 🔷 TYPE FILTER
            if (selectedType != "All Items" && itemType != selectedType) {
              return null;
            }

            // 🔷 CATEGORY FILTER
            if (selectedCategory != "All Categories" &&
                category != selectedCategory) {
              return null;
            }

            // 🔷 STATUS FILTER
            if (selectedStatus != "All Status" &&
                status.toLowerCase() != selectedStatus.toLowerCase()) {
              return null;
            }

            // 🔷 EXTRA TAB FILTER
            if (!extraFilter(data)) return null;

            return DataRow(
              cells: [

                DataCell(Text(itemName)),
                DataCell(Text(itemType)),
                DataCell(Text(status)),

                DataCell(Row(
                  children: [

                    IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {},
                    ),

                    if (showFlagButton)
                      IconButton(
                        icon: const Icon(Icons.flag),
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('items')
                              .doc(doc.id)
                              .update({"flagged": true});
                        },
                      ),
                  ],
                )),
              ],
            );
          }).whereType<DataRow>().toList(),
        );
      },
    );
  }
}