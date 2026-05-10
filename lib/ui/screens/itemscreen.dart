// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
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
//   //adding search controller
//   final TextEditingController searchController =
//   TextEditingController();
//   String searchQuery = "";
//   String selectedType = "All";
//   String selectedCategory = "All";
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
//                   backgroundColor: ItemsScreen.orange,
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
//                   Icons.add,
//                   color: Colors.white,
//                 ),
//
//                 label: const Text(
//                   "Add Item",
//                   style: TextStyle(color: Colors.white),
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
//
//               const SizedBox(width: 20),
//               const SizedBox(height: 20),
//
//               Row(
//                 children: [
//
//                   // 🔷 TYPE FILTER
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//
//                     child: DropdownButton<String>(
//                       value: selectedType,
//                       underline: const SizedBox(),
//
//                       items: [
//                         "All",
//                         "lost",
//                         "found",
//                       ].map((type) {
//
//                         return DropdownMenuItem(
//                           value: type,
//                           child: Text(type),
//                         );
//                       }).toList(),
//
//                       onChanged: (value) {
//
//                         setState(() {
//                           selectedType = value!;
//                         });
//                       },
//                     ),
//                   ),
//
//                   const SizedBox(width: 20),
//
//                   // 🔷 CATEGORY FILTER
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//
//                     child: DropdownButton<String>(
//                       value: selectedCategory,
//                       underline: const SizedBox(),
//
//                       items: [
//                         "All",
//                         "Student ID Card",
//                         "Keys",
//                         "Electronics",
//                         "Clothing",
//                         "Documents",
//                         "Others"
//                       ].map((category) {
//
//                         return DropdownMenuItem(
//                           value: category,
//                           child: Text(category),
//                         );
//                       }).toList(),
//
//                       onChanged: (value) {
//
//                         setState(() {
//                           selectedCategory = value!;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               // 🔷 TYPE FILTER
//               // Container(
//
//               const SizedBox(width: 20),
//
//               // 🔷 STATUS FILTER
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 14),
//
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.05),
//                       blurRadius: 6,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//
//                 child: DropdownButton(
//                   underline: const SizedBox(),
//
//                   value: "All",
//
//                   items: const [
//
//                     DropdownMenuItem(
//                       value: "All",
//                       child: Text("All Status"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "Pending",
//                       child: Text("Pending"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "Returned",
//                       child: Text("Returned"),
//                     ),
//                   ],
//
//                   onChanged: (value) {},
//                 ),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 30),
//           Row(
//             children: [
//
//               // Expanded(
//               //   child: TextField(
//               //     controller: searchController,
//               //
//               //     decoration: InputDecoration(
//               //       hintText: "Search items...",
//               //
//               //       prefixIcon:
//               //       const Icon(Icons.search),
//               //
//               //       filled: true,
//               //       fillColor: Colors.white,
//               //
//               //       border: OutlineInputBorder(
//               //         borderRadius:
//               //         BorderRadius.circular(12),
//               //
//               //         borderSide: BorderSide.none,
//               //       ),
//               //     ),
//               //
//               //     onChanged: (value) {
//               //
//               //       setState(() {
//               //         searchQuery =
//               //             value.toLowerCase();
//               //       });
//               //     },
//               //   ),
//               // ),
//             ],
//           ),
//
//           const SizedBox(height: 20),
//           // 🔷 ITEMS TABLE
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
//             // StreamBuilder in Flutter is a widget that listens to a stream of data and automatically rebuilds the UI whenever new data arrives.
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('items')
//                   .orderBy('createdAt', descending: true)
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
//                     child: Text("No items found"),
//                   );
//                 }
//
//                 final items = snapshot.data!.docs;
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
//                     MaterialStateProperty.all(ItemsScreen.bgColor),
//
//                     columns: const [
//
//                       DataColumn(
//                         label: Text(
//                           "Item",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//
//                       DataColumn(
//                         label: Text(
//                           "Type",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//
//                       DataColumn(
//                         label: Text(
//                           "Category",
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
//                           "Created",
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
//
//                     rows: items.map<DataRow?>((doc) {
//
//                       final data =
//                       doc.data() as Map<String, dynamic>;
//
//                       // final itemName =
//                       //     data['itemName'] ?? '';
//
//                       final type =
//                           data['type'] ?? '';
//
//                       // final category =
//                       //     data['category'] ?? '';
//
//                       final status =
//                           data['status'] ?? '';
//                       final itemName =
//                       (data['itemName'] ?? '')
//                           .toString()
//                           .toLowerCase();
//
//                       if (!itemName.contains(searchQuery)) {
//                         return null;
//                       }
//                       final itemType =
//                       (data['type'] ?? '')
//                           .toString();
//
//                       final category =
//                       (data['category'] ?? '')
//                           .toString();
//
//
// // 🔷 TYPE FILTER
//                       if (selectedType != "All" &&
//                           itemType != selectedType) {
//                         return null;
//                       }
//
//
// // 🔷 CATEGORY FILTER
//                       if (selectedCategory != "All" &&
//                           category != selectedCategory) {
//                         return null;
//                       }
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
//                                   decoration: BoxDecoration(
//                                     borderRadius:
//                                     BorderRadius.circular(10),
//
//                                     image: data['imageUrl'] != null
//                                         ? DecorationImage(
//                                       image: NetworkImage(
//                                         data['imageUrl'],
//                                       ),
//                                       fit: BoxFit.cover,
//                                     )
//                                         : null,
//
//                                     color: ItemsScreen.bgColor,
//                                   ),
//
//                                   child: data['imageUrl'] == null
//                                       ? const Icon(
//                                     Icons.inventory_2,
//                                   )
//                                       : null,
//                                 ),
//
//                                 const SizedBox(width: 10),
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
//                               const EdgeInsets.symmetric(
//                                 horizontal: 12,
//                                 vertical: 6,
//                               ),
//
//                               decoration: BoxDecoration(
//
//                                 color: type == "lost"
//                                     ? Colors.orange
//                                     .withOpacity(0.15)
//                                     : Colors.green
//                                     .withOpacity(0.15),
//
//                                 borderRadius:
//                                 BorderRadius.circular(20),
//                               ),
//
//                               child: Text(
//                                 type.toUpperCase(),
//
//                                 style: TextStyle(
//                                   color: type == "lost"
//                                       ? Colors.orange
//                                       : Colors.green,
//
//                                   fontWeight: FontWeight.bold,
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
//                             Text(status),
//                           ),
//
//                           // 🔷 CREATED DATE
//                           DataCell(
//                             Text(
//                               data['dateLost'] ?? '',
//                             ),
//                           ),
//
//                           // 🔷 ACTIONS
//                           DataCell(
//
//                             Row(
//                               children: [
//
//                                 // VIEW
//                                 IconButton(
//                                   onPressed: () {},
//                                   icon: const Icon(
//                                     Icons.visibility,
//                                     color: Colors.blue,
//                                   ),
//                                 ),
//
//                                 // FLAG
//                                 IconButton(
//                                   onPressed: () {},
//                                   icon: const Icon(
//                                     Icons.flag,
//                                     color: Colors.orange,
//                                   ),
//                                 ),
//
//                                 // DELETE
//                                 IconButton(
//                                   onPressed: () async {
//
//                                     await FirebaseFirestore
//                                         .instance
//                                         .collection('items')
//                                         .doc(doc.id)
//                                         .delete();
//                                   },
//
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
//                     }).whereType<DataRow>().toList(),
//                   ),
//                 );
//               },
//             ),
//
//           ),
//         ],
//       ),
//     );
//   }
//
//   // 🔷 ITEM ROW
//   DataRow _buildItemRow({
//     required String item,
//     required String type,
//     required String user,
//     required String status,
//     required String match,
//   }) {
//
//     return DataRow(
//       cells: [
//
//         // 🔷 ITEM NAME
//         DataCell(
//           Row(
//             children: [
//
//               Container(
//                 width: 40,
//                 height: 40,
//
//                 decoration: BoxDecoration(
//                   color: ItemsScreen.bgColor,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//
//                 child: const Icon(Icons.inventory_2),
//               ),
//
//               const SizedBox(width: 10),
//
//               Text(item),
//             ],
//           ),
//         ),
//
//         // 🔷 TYPE
//         DataCell(
//           Text(type),
//         ),
//
//         // 🔷 USER
//         DataCell(
//           Text(user),
//         ),
//
//         // 🔷 STATUS
//         DataCell(
//
//           Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 12,
//               vertical: 6,
//             ),
//
//             decoration: BoxDecoration(
//               color: status == "Returned"
//                   ? Colors.green.withOpacity(0.15)
//                   : Colors.orange.withOpacity(0.15),
//
//               borderRadius: BorderRadius.circular(20),
//             ),
//
//             child: Text(
//               status,
//               style: TextStyle(
//                 color: status == "Returned"
//                     ? Colors.green
//                     : Colors.orange,
//
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//
//         // 🔷 AI MATCH SCORE
//         DataCell(
//
//           Text(
//             match,
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.blue,
//             ),
//           ),
//         ),
//
//         // 🔷 ACTIONS
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
//                   Icons.flag,
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
//                       value: "claim pending",
//                       child: Text("Pending"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "returned",
//                       child: Text("Returned"),
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
//                             Text(status),
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
//                                 // 🚩 FLAG
//                                 IconButton(
//                                   onPressed: () {},
//
//                                   icon:
//                                   const Icon(
//                                     Icons.flag,
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
//                                         'items')
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


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
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
//                       Text("Claim Approval"),
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
//                             Text(status),
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
//                                 // IconButton(
//                                 //   onPressed: () {},
//                                 //
//                                 //   icon:
//                                 //   const Icon(
//                                 //     Icons
//                                 //         .visibility,
//                                 //
//                                 //     color:
//                                 //     Colors.blue,
//                                 //   ),
//                                 // ),
//                                 IconButton(
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
//                                 // 🚩 FLAG
//                                 IconButton(
//                                   onPressed: () {},
//
//                                   icon:
//                                   const Icon(
//                                     Icons.flag,
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
//                                         'items')
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


//
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


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../services/notifications/send_notification_service.dart';
import 'duplicatealertscreen.dart';
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
  final TextEditingController searchController =
  TextEditingController();

  String searchQuery = "";

  // 🔷 FILTERS
  String selectedType = "All Items";
  String selectedCategory = "All Categories";
  String selectedStatus = "All Status";

  @override
  Widget build(BuildContext context) {

    // ✅ CHANGE 1
    // Added LayoutBuilder + ConstrainedBox
    // This prevents layout overflow on smaller screens

    return LayoutBuilder(
      // Gives current available screen width,
      // so widgets can adjust themselves according to the remaining space.
      builder: (context, constraints) {

        return SingleChildScrollView(
          padding: const EdgeInsets.all(25),

          child: ConstrainedBox(
            // Forces the UI to stay inside the available screen width instead of overflowing outside.
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
            //   take remainig availbale space
            ),
            //TextOverflow.ellipsis
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                // 🔷 HEADER
                Wrap(
                  //with wrap doesnot reamin innone line if soace is less they mocve to next line
                  spacing: 15,
                  runSpacing: 15,

                  children: [

                    const Text(
                      "Manage Items",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DuplicateAlertsScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.warning),
                      label: const Text("Duplicate Alerts"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                    ),

                    ElevatedButton.icon(
                      onPressed: () {},

                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        ItemsScreen.orange,

                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 14,
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(12),
                        ),
                      ),

                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),

                      label: const Text(
                        "Add Item",
                        style:
                        TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // ✅ CHANGE 2
                // Added horizontal scrolling to filter row
                // Prevents RenderFlex overflow

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  child: Row(
                    children: [

                      // 🔍 SEARCH
                      SizedBox(
                        width: 300,

                        child: TextField(
                          controller: searchController,

                          decoration: InputDecoration(
                            hintText: "Search items...",

                            prefixIcon:
                            const Icon(Icons.search),

                            filled: true,
                            fillColor: Colors.white,

                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(12),

                              borderSide: BorderSide.none,
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

                      const SizedBox(width: 20),

                      // 🔷 TYPE FILTER
                      Container(
                        padding:
                        const EdgeInsets.symmetric(
                            horizontal: 14),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(12),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.05),

                              blurRadius: 6,

                              offset:
                              const Offset(0, 2),
                            ),
                          ],
                        ),

                        child: DropdownButton<String>(
                          underline: const SizedBox(),

                          value: selectedType,

                          items: const [

                            DropdownMenuItem(
                              value: "All Items",
                              child: Text("All Items"),
                            ),

                            DropdownMenuItem(
                              value: "lost",
                              child: Text("Lost"),
                            ),

                            DropdownMenuItem(
                              value: "found",
                              child: Text("Found"),
                            ),
                          ],

                          onChanged: (value) {

                            setState(() {
                              selectedType = value!;
                            });
                          },
                        ),
                      ),

                      const SizedBox(width: 20),

                      // 🔷 CATEGORY FILTER
                      Container(
                        padding:
                        const EdgeInsets.symmetric(
                            horizontal: 14),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(12),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.05),

                              blurRadius: 6,

                              offset:
                              const Offset(0, 2),
                            ),
                          ],
                        ),

                        child: DropdownButton<String>(
                          underline: const SizedBox(),

                          value: selectedCategory,

                          items: const [

                            DropdownMenuItem(
                              value: "All Categories",
                              child:
                              Text("All Categories"),
                            ),

                            DropdownMenuItem(
                              value: "Student ID Card",
                              child:
                              Text("Student ID Card"),
                            ),

                            DropdownMenuItem(
                              value: "Keys",
                              child: Text("Keys"),
                            ),

                            DropdownMenuItem(
                              value: "Electronics",
                              child:
                              Text("Electronics"),
                            ),

                            DropdownMenuItem(
                              value: "Clothing",
                              child: Text("Clothing"),
                            ),

                            DropdownMenuItem(
                              value: "Documents",
                              child:
                              Text("Documents"),
                            ),

                            DropdownMenuItem(
                              value: "Others",
                              child: Text("Others"),
                            ),
                          ],

                          onChanged: (value) {

                            setState(() {
                              selectedCategory =
                              value!;
                            });
                          },
                        ),
                      ),

                      const SizedBox(width: 20),

                      // 🔷 STATUS FILTER
                      Container(
                        padding:
                        const EdgeInsets.symmetric(
                            horizontal: 14),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(12),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.05),

                              blurRadius: 6,

                              offset:
                              const Offset(0, 2),
                            ),
                          ],
                        ),

                        child: DropdownButton<String>(
                          underline: const SizedBox(),

                          value: selectedStatus,

                          items: const [

                            DropdownMenuItem(
                              value: "All Status",
                              child:
                              Text("All Status"),
                            ),

                            DropdownMenuItem(
                              value: "lost",
                              child: Text("Lost"),
                            ),

                            DropdownMenuItem(
                              value: "found",
                              child: Text("Found"),
                            ),

                            DropdownMenuItem(
                              value: "claim pending",
                              child:
                              Text("Claim Pending"),
                            ),

                            DropdownMenuItem(
                              value: "claim approved",
                              child:
                              Text("Claim Approved"),
                            ),

                            DropdownMenuItem(
                              value: "claim rejected",
                              child:
                              Text("Claim Rejected"),
                            ),

                            DropdownMenuItem(
                              value: "returned",
                              child: Text("Returned"),
                            ),
                          ],

                          onChanged: (value) {

                            setState(() {
                              selectedStatus =
                              value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // 🔷 ITEMS TABLE
                Container(

                  // ✅ CHANGE 3
                  // Removed fixed width: 880
                  // Added double.infinity

                  width: double.infinity,

                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(16),

                    boxShadow: [
                      BoxShadow(
                        color:
                        Colors.black.withOpacity(0.05),

                        blurRadius: 8,

                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('items')
                        .orderBy(
                      'createdAt',
                      descending: true,
                    )
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
                          child: Text("No items found"),
                        );
                      }

                      final items =
                          snapshot.data!.docs;

                      return SingleChildScrollView(
                        scrollDirection:
                        Axis.horizontal,

                        child: DataTable(

                          headingRowColor:
                          MaterialStateProperty.all(
                            ItemsScreen.bgColor,
                          ),

                          columns: const [

                            DataColumn(
                              label: Text(
                                "Item",
                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),

                            DataColumn(
                              label: Text(
                                "Type",
                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),

                            DataColumn(
                              label: Text(
                                "Category",
                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),

                            DataColumn(
                              label: Text(
                                "Status",
                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),

                            DataColumn(
                              label: Text(
                                "Created",
                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),

                            DataColumn(
                              label: Text(
                                "Actions",
                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),
                          ],

                          rows:
                          items.map<DataRow?>((doc) {

                            final data =
                            doc.data()
                            as Map<String, dynamic>;

                            final itemName =
                            (data['itemName'] ?? '')
                                .toString();

                            final lowerName =
                            itemName.toLowerCase();

                            final itemType =
                            (data['type'] ?? '')
                                .toString();

                            final category =
                            (data['category'] ?? '')
                                .toString();

                            final status =
                            (data['status'] ?? '')
                                .toString();

                            // 🔍 SEARCH FILTER
                            if (!lowerName.contains(
                                searchQuery)) {
                              return null;
                            }

                            // 🔷 TYPE FILTER
                            if (selectedType !=
                                "All Items" &&
                                itemType !=
                                    selectedType) {
                              return null;
                            }

                            // 🔷 CATEGORY FILTER
                            if (selectedCategory !=
                                "All Categories" &&
                                category !=
                                    selectedCategory) {
                              return null;
                            }

                            // 🔷 STATUS FILTER
                            if (selectedStatus !=
                                "All Status" &&
                                status.toLowerCase() !=
                                    selectedStatus
                                        .toLowerCase()) {
                              return null;
                            }

                            return DataRow(
                              cells: [

                                // 🔷 ITEM
                                DataCell(
                                  Row(
                                    children: [

                                      Container(
                                        width: 45,
                                        height: 45,

                                        decoration:
                                        BoxDecoration(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              10),

                                          image: data[
                                          'imageUrl'] !=
                                              null
                                              ? DecorationImage(
                                            image:
                                            NetworkImage(
                                              data[
                                              'imageUrl'],
                                            ),

                                            fit: BoxFit
                                                .cover,
                                          )
                                              : null,

                                          color:
                                          ItemsScreen
                                              .bgColor,
                                        ),

                                        child: data[
                                        'imageUrl'] ==
                                            null
                                            ? const Icon(
                                          Icons
                                              .inventory_2,
                                        )
                                            : null,
                                      ),

                                      const SizedBox(
                                          width: 10),

                                      Text(itemName),
                                    ],
                                  ),
                                ),

                                // 🔷 TYPE
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

                                      color: itemType ==
                                          "lost"
                                          ? Colors.orange
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
                                      itemType
                                          .toUpperCase(),

                                      style: TextStyle(
                                        color: itemType ==
                                            "lost"
                                            ? Colors
                                            .orange
                                            : Colors
                                            .green,

                                        fontWeight:
                                        FontWeight
                                            .bold,
                                      ),
                                    ),
                                  ),
                                ),

                                // 🔷 CATEGORY
                                DataCell(
                                  Text(category),
                                ),

                                // 🔷 STATUS
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
                                      _getStatusColor(
                                          status)
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
                                        _getStatusColor(
                                            status),

                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),

                                // 🔷 CREATED
                                DataCell(
                                  Text(
                                    data['dateLost']
                                        ?? '',
                                  ),
                                ),

                                // 🔷 ACTIONS
                                DataCell(

                                  Row(
                                    children: [

                                      IconButton(
                                        tooltip:"View Item",
                                        onPressed: () {

                                          showDialog(
                                            context: context,

                                            builder: (context) {

                                              return ItemDetailDialog(
                                                data: data,
                                              );
                                            },
                                          );
                                        },

                                        icon: const Icon(
                                          Icons.visibility,
                                          color: Colors.blue,
                                        ),
                                      ),

                                      IconButton(
                                        tooltip:"Flag Item",
                                        onPressed: () async {

                                          try {

                                            if (data['flagged'] == true) {

                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(
                                                  content: Text("Item is already flagged"),
                                                ),
                                              );

                                              return;
                                            }

                                            await FirebaseFirestore.instance
                                                .collection('items')
                                                .doc(doc.id)
                                                .update({
                                              "flagged": true,
                                            });

                                            final token = data['fcmToken'];

                                            if (token != null &&
                                                token.toString().isNotEmpty) {

                                              await SendNotificationService
                                                  .sendNotificationUsingApi(

                                                token: token,

                                                title: "⚠ Item Hidden by Admin",

                                                body:
                                                "Your item '${data['itemName']}' was temporarily hidden due to suspicious or incorrect information.",

                                                data: {
                                                  "screen": "itemDetail",
                                                  "itemId": doc.id,
                                                },
                                              );
                                            }

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  "Item flagged successfully",
                                                ),
                                              ),
                                            );

                                          } catch (e) {

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "Error: $e",
                                                ),
                                              ),
                                            );
                                          }
                                        },

                                        icon: const Icon(
                                          Icons.flag,
                                          color: Colors.orange,
                                        ),
                                      ),

                                      IconButton(
                                        tooltip:"Delete Item",
                                        onPressed:
                                            () async {

                                          final confirm =
                                          await showDialog(
                                            context:
                                            context,

                                            builder:
                                                (context) {

                                              return AlertDialog(
                                                title:
                                                const Text(
                                                  "Delete Item",
                                                ),

                                                content:
                                                const Text(
                                                  "Are you sure you want to delete this item?",
                                                ),

                                                actions: [

                                                  TextButton(
                                                    onPressed:
                                                        () {
                                                      Navigator.pop(
                                                          context,
                                                          false);
                                                    },

                                                    child:
                                                    const Text(
                                                      "Cancel",
                                                    ),
                                                  ),

                                                  ElevatedButton(
                                                    onPressed:
                                                        () {
                                                      Navigator.pop(
                                                          context,
                                                          true);
                                                    },

                                                    style:
                                                    ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                      Colors.red,
                                                    ),

                                                    child:
                                                    const Text(
                                                      "Delete",
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );

                                          if (confirm ==
                                              true) {

                                            await FirebaseFirestore
                                                .instance
                                                .collection(
                                                'items')
                                                .doc(doc.id)
                                                .delete();

                                            ScaffoldMessenger.of(
                                                context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  "Item deleted successfully",
                                                ),
                                              ),
                                            );
                                          }
                                        },

                                        icon:
                                        const Icon(
                                          Icons.delete,

                                          color:
                                          Colors.red,
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

  // 🔷 STATUS COLORS
  Color _getStatusColor(String status) {

    switch (status.toLowerCase()) {

      case "lost":
        return Colors.orange;

      case "found":
        return Colors.green;

      case "claim pending":
        return Colors.amber;

      case "claim approved":
        return Colors.green;

      case "claim rejected":
        return Colors.red;

      case "returned":
        return Colors.blue;

      default:
        return Colors.grey;
    }
  }
}