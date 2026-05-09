// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class ClaimsScreen extends StatelessWidget {
//   const ClaimsScreen({super.key});
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
//           const Text(
//             "Claims Management",
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           const SizedBox(height: 25),
//
//           // 🔷 SEARCH + FILTER
//           Row(
//             children: [
//
//               // 🔍 SEARCH
//               Expanded(
//                 child: Container(
//                   height: 50,
//
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         blurRadius: 6,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//
//                   child: const TextField(
//                     decoration: InputDecoration(
//                       hintText: "Search claims...",
//                       prefixIcon: Icon(Icons.search),
//                       border: InputBorder.none,
//                       contentPadding:
//                       EdgeInsets.symmetric(vertical: 14),
//                     ),
//                   ),
//                 ),
//               ),
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
//                       value: "Approved",
//                       child: Text("Approved"),
//                     ),
//
//                     DropdownMenuItem(
//                       value: "Rejected",
//                       child: Text("Rejected"),
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
//
//           // 🔷 CLAIMS TABLE
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
//             child:
//             // DataTable(
//             //
//             //   headingRowColor: MaterialStateProperty.all(bgColor),
//             //
//             //   columns: const [
//             //
//             //     DataColumn(
//             //       label: Text(
//             //         "Claim ID",
//             //         style: TextStyle(fontWeight: FontWeight.bold),
//             //       ),
//             //     ),
//             //
//             //     DataColumn(
//             //       label: Text(
//             //         "Item",
//             //         style: TextStyle(fontWeight: FontWeight.bold),
//             //       ),
//             //     ),
//             //
//             //     DataColumn(
//             //       label: Text(
//             //         "Claimed By",
//             //         style: TextStyle(fontWeight: FontWeight.bold),
//             //       ),
//             //     ),
//             //
//             //     DataColumn(
//             //       label: Text(
//             //         "Owner",
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
//             //     _buildClaimRow(
//             //       claimId: "#CLM001",
//             //       item: "Wallet",
//             //       claimant: "Ali",
//             //       owner: "Sara",
//             //       status: "Pending",
//             //     ),
//             //
//             //     _buildClaimRow(
//             //       claimId: "#CLM002",
//             //       item: "Phone",
//             //       claimant: "Ahmed",
//             //       owner: "Bilal",
//             //       status: "Approved",
//             //     ),
//             //
//             //     _buildClaimRow(
//             //       claimId: "#CLM003",
//             //       item: "Keys",
//             //       claimant: "Usman",
//             //       owner: "Hamza",
//             //       status: "Rejected",
//             //     ),
//             //   ],
//             // ),
//             StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('claims')
//                   .orderBy('submittedAt', descending: true)
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
//                     child: Text("No claims found"),
//                   );
//                 }
//
//                 final claims = snapshot.data!.docs;
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
//                           "Item",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//
//                       DataColumn(
//                         label: Text(
//                           "Claimed By",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//
//                       DataColumn(
//                         label: Text(
//                           "Owner ID",
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
//                           "Submitted",
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
//                     rows: claims.map((doc) {
//
//                       final data =
//                       doc.data() as Map<String, dynamic>;
//
//                       final itemName =
//                           data['itemName'] ?? '';
//
//                       final claimant =
//                           data['userId'] ?? '';
//
//                       final owner =
//                           data['itemOwnerId'] ?? '';
//
//                       final status =
//                           data['status'] ?? '';
//
//                       return DataRow(
//                         cells: [
//
//                           // 🔷 ITEM NAME
//                           DataCell(
//                             Text(itemName),
//                           ),
//
//                           // 🔷 CLAIMANT
//                           DataCell(
//                             Text(claimant),
//                           ),
//
//                           // 🔷 OWNER
//                           DataCell(
//                             Text(owner),
//                           ),
//
//                           // 🔷 STATUS
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
//                                 color: status ==
//                                     "claim approved"
//                                     ? Colors.green
//                                     .withOpacity(0.15)
//                                     : status ==
//                                     "claim rejected"
//                                     ? Colors.red
//                                     .withOpacity(0.15)
//                                     : Colors.orange
//                                     .withOpacity(0.15),
//
//                                 borderRadius:
//                                 BorderRadius.circular(20),
//                               ),
//
//                               child: Text(
//                                 status,
//
//                                 style: TextStyle(
//                                   color: status ==
//                                       "claim approved"
//                                       ? Colors.green
//                                       : status ==
//                                       "claim rejected"
//                                       ? Colors.red
//                                       : Colors.orange,
//
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                           // 🔷 DATE
//                           DataCell(
//                             Text(
//                               data['submittedAt'] != null
//                                   ? (data['submittedAt']
//                               as Timestamp)
//                                   .toDate()
//                                   .toString()
//                                   .split(' ')[0]
//                                   : '',
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
//                                 // APPROVE
//                                 IconButton(
//                                   onPressed: () async {
//
//                                     await FirebaseFirestore
//                                         .instance
//                                         .collection('claim')
//                                         .doc(doc.id)
//                                         .update({
//                                       'status':
//                                       'claim approved'
//                                     });
//                                   },
//
//                                   icon: const Icon(
//                                     Icons.check_circle,
//                                     color: Colors.green,
//                                   ),
//                                 ),
//
//                                 // REJECT
//                                 IconButton(
//                                   onPressed: () async {
//
//                                     await FirebaseFirestore
//                                         .instance
//                                         .collection('claim')
//                                         .doc(doc.id)
//                                         .update({
//                                       'status':
//                                       'claim rejected'
//                                     });
//                                   },
//
//                                   icon: const Icon(
//                                     Icons.cancel,
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
//   // 🔷 CLAIM ROW
//   DataRow _buildClaimRow({
//     required String claimId,
//     required String item,
//     required String claimant,
//     required String owner,
//     required String status,
//   }) {
//
//     return DataRow(
//       cells: [
//
//         DataCell(Text(claimId)),
//
//         DataCell(Text(item)),
//
//         DataCell(Text(claimant)),
//
//         DataCell(Text(owner)),
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
//
//               color: status == "Approved"
//                   ? Colors.green.withOpacity(0.15)
//                   : status == "Rejected"
//                   ? Colors.red.withOpacity(0.15)
//                   : Colors.orange.withOpacity(0.15),
//
//               borderRadius: BorderRadius.circular(20),
//             ),
//
//             child: Text(
//               status,
//
//               style: TextStyle(
//                 color: status == "Approved"
//                     ? Colors.green
//                     : status == "Rejected"
//                     ? Colors.red
//                     : Colors.orange,
//
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//
//         // 🔷 ACTION BUTTONS
//         DataCell(
//
//           Row(
//             children: [
//
//               // VIEW
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.visibility,
//                   color: Colors.blue,
//                 ),
//               ),
//
//               // APPROVE
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.check_circle,
//                   color: Colors.green,
//                 ),
//               ),
//
//               // REJECT
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.cancel,
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

//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class ClaimsScreen extends StatelessWidget {
//   const ClaimsScreen({super.key});
//
//   static const Color bgColor = Color(0xFFEFF5FB);
//   static const Color darkBlue = Color(0xFF2A417F);
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
//           const Text(
//             "Claims Monitoring",
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: darkBlue,
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           const Text(
//             "Admin can view all claims (Read-only / moderation only)",
//             style: TextStyle(color: Colors.grey),
//           ),
//
//           const SizedBox(height: 25),
//
//           // 🔷 CLAIMS TABLE
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(20),
//
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
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
//               stream: FirebaseFirestore.instance
//                   .collection('claims')
//                   .orderBy('submittedAt', descending: true)
//                   .snapshots(),
//
//               builder: (context, snapshot) {
//
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return const Center(child: Text("No claims found"));
//                 }
//
//                 final claims = snapshot.data!.docs;
//
//                 return DataTable(
//                   headingRowColor:
//                   MaterialStateProperty.all(bgColor),
//
//                   columns: const [
//                     DataColumn(label: Text("Item")),
//                     DataColumn(label: Text("User")),
//                     DataColumn(label: Text("Status")),
//                     DataColumn(label: Text("Submitted")),
//                     DataColumn(label: Text("Actions")),
//                   ],
//
//                   rows: claims.map((doc) {
//
//                     final data = doc.data() as Map<String, dynamic>;
//
//                     final item = data['itemName'] ?? 'Unknown';
//                     final user = data['userId'] ?? 'Unknown';
//                     final status = data['status'] ?? 'pending';
//                     final time = data['submittedAt'] != null
//                         ? data['submittedAt'].toDate().toString()
//                         : '';
//
//                     return DataRow(
//                       cells: [
//
//                         DataCell(Text(item)),
//
//                         DataCell(Text(user)),
//
//                         // STATUS BADGE
//                         DataCell(
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 6,
//                             ),
//                             decoration: BoxDecoration(
//                               color: status == "approved"
//                                   ? Colors.green.withOpacity(0.15)
//                                   : status == "rejected"
//                                   ? Colors.red.withOpacity(0.15)
//                                   : Colors.orange.withOpacity(0.15),
//
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Text(
//                               status.toUpperCase(),
//                               style: TextStyle(
//                                 color: status == "approved"
//                                     ? Colors.green
//                                     : status == "rejected"
//                                     ? Colors.red
//                                     : Colors.orange,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         DataCell(Text(time)),
//
//                         // ACTIONS (ADMIN ONLY CONTROL)
//                         DataCell(
//                           Row(
//                             children: [
//
//                               IconButton(
//                                 icon: const Icon(Icons.visibility,
//                                     color: Colors.blue),
//                                 onPressed: () {},
//                               ),
//
//                               IconButton(
//                                 icon: const Icon(Icons.delete,
//                                     color: Colors.red),
//                                 onPressed: () async {
//                                   await FirebaseFirestore.instance
//                                       .collection('claims')
//                                       .doc(doc.id)
//                                       .delete();
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     );
//                   }).toList(),
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

class ClaimsScreen extends StatefulWidget {
  const ClaimsScreen({super.key});

  static const Color darkBlue = Color(0xFF2A417F);
  static const Color orange = Color(0xFFF09E27);
  static const Color bgColor = Color(0xFFEFF5FB);

  @override
  State<ClaimsScreen> createState() => _ClaimsScreenState();
}

class _ClaimsScreenState extends State<ClaimsScreen> {

  final TextEditingController searchController =
  TextEditingController();

  String searchQuery = "";

  String selectedStatus = "All Claims";

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding: const EdgeInsets.all(25),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          // 🔷 HEADER
          const Text(
            "Claims Monitoring",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          // 🔷 SEARCH + FILTER
          Row(
            children: [

              // 🔍 SEARCH
              Expanded(
                child: Container(
                  height: 50,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(12),

                    boxShadow: [
                      BoxShadow(
                        color:
                        Colors.black.withOpacity(0.05),

                        blurRadius: 6,

                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),

                  child: TextField(
                    controller: searchController,

                    decoration: const InputDecoration(
                      hintText:
                      "Search by item name...",

                      prefixIcon:
                      Icon(Icons.search),

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

              const SizedBox(width: 20),

              // 🔷 STATUS FILTER
              Container(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 14,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                  BorderRadius.circular(12),

                  boxShadow: [
                    BoxShadow(
                      color:
                      Colors.black.withOpacity(0.05),

                      blurRadius: 6,

                      offset: const Offset(0, 2),
                    ),
                  ],
                ),

                child: DropdownButton<String>(

                  value: selectedStatus,

                  underline: const SizedBox(),

                  items: const [

                    DropdownMenuItem(
                      value: "All Claims",
                      child: Text("All Claims"),
                    ),

                    DropdownMenuItem(
                      value: "pending",
                      child: Text("Pending"),
                    ),

                    DropdownMenuItem(
                      value: "claim approved",
                      child: Text("Approved"),
                    ),

                    DropdownMenuItem(
                      value: "claim rejected",
                      child: Text("Rejected"),
                    ),
                  ],

                  onChanged: (value) {

                    setState(() {
                      selectedStatus = value!;
                    });
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // 🔷 CLAIMS TABLE
          Container(
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

            child:
            StreamBuilder<QuerySnapshot>(

              stream: FirebaseFirestore.instance
                  .collection('claims')
                  .orderBy(
                  'submittedAt',
                  descending: true)
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
                    child:
                    Text("No claims found"),
                  );
                }

                final claims =
                    snapshot.data!.docs;

                return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,

                      child: DataTable(

                        headingRowColor:
                        MaterialStateProperty.all(
                          ClaimsScreen.bgColor,
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
                              "Claimant",
                              style: TextStyle(
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ),

                          DataColumn(
                            label: Text(
                              "Owner",
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
                              "Date",
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
                        claims.map<DataRow?>((doc) {

                          final data =
                          doc.data()
                          as Map<String, dynamic>;

                          final itemName =
                          (data['itemName'] ?? '')
                              .toString();

                          final status =
                          (data['status'] ?? '')
                              .toString();

                          final lowerItem =
                          itemName.toLowerCase();

                          // 🔍 SEARCH FILTER
                          if (!lowerItem.contains(
                              searchQuery)) {

                            return null;
                          }

                          // 🔷 STATUS FILTER
                          if (selectedStatus !=
                              "All Claims" &&
                              status != selectedStatus) {

                            return null;
                          }

                          return DataRow(
                            cells: [

                              // ITEM
                              DataCell(
                                Text(itemName),
                              ),

                              // CLAIMANT
                              DataCell(
                                Text(
                                  data['userId'] ?? '',
                                ),
                              ),

                              // OWNER
                              DataCell(
                                Text(
                                  data['itemOwnerId']
                                      ?? '',
                                ),
                              ),

                              // STATUS
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
                                    status ==
                                        "claim approved"
                                        ? Colors.green
                                        .withOpacity(
                                        0.15)

                                        : status ==
                                        "claim rejected"
                                        ? Colors.red
                                        .withOpacity(
                                        0.15)

                                        : Colors.orange
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
                                      status ==
                                          "claim approved"
                                          ? Colors.green

                                          : status ==
                                          "claim rejected"
                                          ? Colors.red

                                          : Colors.orange,

                                      fontWeight:
                                      FontWeight
                                          .bold,
                                    ),
                                  ),
                                ),
                              ),

                              // DATE
                              DataCell(
                                Text(
                                  data['submittedAt']
                                      != null
                                      ? (data['submittedAt']
                                  as Timestamp)
                                      .toDate()
                                      .toString()
                                      .substring(0, 10)
                                      : '',
                                ),
                              ),

                              // ACTIONS
                              DataCell(

                                Row(
                                  children: [

                                    // 👁 VIEW
                                    IconButton(
                                      onPressed: () {

                                        _showClaimDetails(
                                          context,
                                          data,
                                        );
                                      },

                                      icon:
                                      const Icon(
                                        Icons.visibility,

                                        color:
                                        Colors.blue,
                                      ),
                                    ),

                                    // 🚩 REMOVE FAKE CLAIM
                                    IconButton(
                                      onPressed:
                                          () async {

                                        await FirebaseFirestore
                                            .instance
                                            .collection(
                                            'claims')
                                            .doc(doc.id)
                                            .delete();
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
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }

  // 🔷 CLAIM DETAILS DIALOG
  void _showClaimDetails(
      BuildContext context,
      Map<String, dynamic> data,
      ) {

    final qa =
        data['qa'] as List<dynamic>? ?? [];

    showDialog(
      context: context,

      builder: (context) {

        return AlertDialog(

          title: const Text("Claim Details"),

          content: SizedBox(
            width: 500,

            child: SingleChildScrollView(

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(
                    "Item: ${data['itemName']}",
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Status: ${data['status']}",
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Questions & Answers",
                    style: TextStyle(
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  ...qa.map((e) {

                    return Padding(
                      padding:
                      const EdgeInsets.only(
                          bottom: 12),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                        children: [

                          Text(
                            "Q: ${e['question']}",
                            style:
                            const TextStyle(
                              fontWeight:
                              FontWeight
                                  .bold,
                            ),
                          ),

                          Text(
                            "A: ${e['answer']}",
                          ),
                        ],
                      ),
                    );
                  }),
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
}