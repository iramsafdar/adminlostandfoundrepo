// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class AIMatchScreen extends StatelessWidget {
//   const AIMatchScreen({super.key});
//
//   static const Color bgColor =
//   Color(0xFFEFF5FB);
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
//           // 🔷 TITLE
//           const Text(
//             "AI Match Monitoring",
//             style: TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           const SizedBox(height: 30),
//
//           // 🔷 AI STATS
//           StreamBuilder<QuerySnapshot>(
//
//             stream: FirebaseFirestore.instance
//                 .collection('matches')
//                 .snapshots(),
//
//             builder: (context, snapshot) {
//
//               if (!snapshot.hasData) {
//
//                 return const Center(
//                   child:
//                   CircularProgressIndicator(),
//                 );
//               }
//
//               final matches =
//                   snapshot.data!.docs;
//
//               final totalMatches =
//                   matches.length;
//
//               final highConfidence =
//                   matches.where((doc) {
//
//                     final data =
//                     doc.data()
//                     as Map<String, dynamic>;
//
//                     return
//                       (data['similarity']
//                           ?? 0) >= 0.80;
//
//                   }).length;
//
//               final mediumConfidence =
//                   matches.where((doc) {
//
//                     final data =
//                     doc.data()
//                     as Map<String, dynamic>;
//
//                     final similarity =
//                     (data['similarity']
//                         ?? 0);
//
//                     return similarity >= 0.50 &&
//                         similarity < 0.80;
//
//                   }).length;
//
//               final lowConfidence =
//                   matches.where((doc) {
//
//                     final data =
//                     doc.data()
//                     as Map<String, dynamic>;
//
//                     return
//                       (data['similarity']
//                           ?? 0) < 0.50;
//
//                   }).length;
//
//               return Row(
//                 children: [
//
//                   _card(
//                     title: "Total Matches",
//                     value:
//                     totalMatches.toString(),
//
//                     color: Colors.blue,
//                     icon: Icons.analytics,
//                   ),
//
//                   const SizedBox(width: 20),
//
//                   _card(
//                     title: "High Confidence",
//                     value:
//                     highConfidence.toString(),
//
//                     color: Colors.green,
//                     icon: Icons.check_circle,
//                   ),
//
//                   const SizedBox(width: 20),
//
//                   _card(
//                     title: "Medium Confidence",
//                     value:
//                     mediumConfidence.toString(),
//
//                     color: Colors.orange,
//                     icon: Icons.warning,
//                   ),
//
//                   const SizedBox(width: 20),
//
//                   _card(
//                     title: "Low Confidence",
//                     value:
//                     lowConfidence.toString(),
//
//                     color: Colors.red,
//                     icon: Icons.error,
//                   ),
//                 ],
//               );
//             },
//           ),
//
//           const SizedBox(height: 35),
//
//           // 🔷 MATCH TABLE
//           Container(
//             width: 740,
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
//                   .collection('matches')
//                   .snapshots(),
//
//               builder: (context, snapshot) {
//
//                 if (!snapshot.hasData) {
//
//                   return const Center(
//                     child:
//                     CircularProgressIndicator(),
//                   );
//                 }
//
//                 final matches =
//                     snapshot.data!.docs;
//
//                 if (matches.isEmpty) {
//
//                   return const Center(
//                     child:
//                     Text("No AI matches found"),
//                   );
//                 }
//
//                 return SingleChildScrollView(
//                   scrollDirection:
//                   Axis.horizontal,
//
//                   child: DataTable(
//
//                     headingRowColor:
//                     MaterialStateProperty.all(
//                       bgColor,
//                     ),
//
//                     columns: const [
//
//                       DataColumn(
//                         label: Text(
//                           "Lost Item ID",
//                           style: TextStyle(
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//
//                       DataColumn(
//                         label: Text(
//                           "Found Item ID",
//                           style: TextStyle(
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//
//                       DataColumn(
//                         label: Text(
//                           "Similarity",
//                           style: TextStyle(
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//
//                       DataColumn(
//                         label: Text(
//                           "Confidence",
//                           style: TextStyle(
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//
//                     rows: matches.map((doc) {
//
//                       final data =
//                       doc.data()
//                       as Map<String, dynamic>;
//
//                       final similarity =
//                       (data['similarity']
//                           ?? 0.0);
//
//                       String confidence;
//                       Color color;
//
//                       if (similarity >= 0.80) {
//
//                         confidence = "HIGH";
//                         color = Colors.green;
//
//                       } else if
//                       (similarity >= 0.50) {
//
//                         confidence = "MEDIUM";
//                         color = Colors.orange;
//
//                       } else {
//
//                         confidence = "LOW";
//                         color = Colors.red;
//                       }
//
//                       return DataRow(
//                         cells: [
//
//                           DataCell(
//                             Text(
//                               data['lost_item_id']
//                                   ?? '',
//                             ),
//                           ),
//
//                           DataCell(
//                             Text(
//                               data['found_item_id']
//                                   ?? '',
//                             ),
//                           ),
//
//                           DataCell(
//
//                             Text(
//                               "${(similarity * 100).toStringAsFixed(1)}%",
//                             ),
//                           ),
//
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
//                                 color.withOpacity(
//                                     0.15),
//
//                                 borderRadius:
//                                 BorderRadius
//                                     .circular(
//                                     20),
//                               ),
//
//                               child: Text(
//                                 confidence,
//
//                                 style: TextStyle(
//                                   color: color,
//                                   fontWeight:
//                                   FontWeight
//                                       .bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//
//                     }).toList(),
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
//   // 🔷 CARD
//   Widget _card({
//
//     required String title,
//     required String value,
//     required Color color,
//     required IconData icon,
//
//   }) {
//
//     return Expanded(
//
//       child: Container(
//         padding: const EdgeInsets.all(20),
//
//         decoration: BoxDecoration(
//           color: Colors.white,
//
//           borderRadius:
//           BorderRadius.circular(16),
//
//           boxShadow: [
//             BoxShadow(
//               color:
//               Colors.black.withOpacity(0.05),
//
//               blurRadius: 8,
//
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//
//         child: Row(
//           children: [
//
//             Container(
//               padding: const EdgeInsets.all(14),
//
//               decoration: BoxDecoration(
//                 color:
//                 color.withOpacity(0.15),
//
//                 borderRadius:
//                 BorderRadius.circular(14),
//               ),
//
//               child: Icon(
//                 icon,
//                 color: color,
//                 size: 30,
//               ),
//             ),
//
//             const SizedBox(width: 18),
//
//             Column(
//               crossAxisAlignment:
//               CrossAxisAlignment.start,
//
//               children: [
//
//                 Text(
//                   title,
//
//                   style: const TextStyle(
//                     color: Colors.grey,
//                   ),
//                 ),
//
//                 const SizedBox(height: 8),
//
//                 Text(
//                   value,
//
//                   style: const TextStyle(
//                     fontSize: 24,
//                     fontWeight:
//                     FontWeight.bold,
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



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AIMatchScreen extends StatelessWidget {
  const AIMatchScreen({super.key});

  static const Color bgColor =
  Color(0xFFEFF5FB);

  @override
  Widget build(BuildContext context) {

    // ✅ OVERFLOW FIXES ADDED
    // 1. LayoutBuilder
    // 2. ConstrainedBox
    // 3. Wrap instead of Row
    // 4. Removed fixed width: 740
    // 5. Horizontal scrolling
    // 6. Removed Expanded from cards

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
                const Text(
                  "AI Match Monitoring",

                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                // 🔷 AI STATS
                StreamBuilder<QuerySnapshot>(

                  stream: FirebaseFirestore.instance
                      .collection('matches')
                      .snapshots(),

                  builder: (context, snapshot) {

                    if (!snapshot.hasData) {

                      return const Center(
                        child:
                        CircularProgressIndicator(),
                      );
                    }

                    final matches =
                        snapshot.data!.docs;

                    final totalMatches =
                        matches.length;

                    final highConfidence =
                        matches.where((doc) {

                          final data =
                          doc.data()
                          as Map<String, dynamic>;

                          return
                            (data['similarity']
                                ?? 0) >= 0.80;

                        }).length;

                    final mediumConfidence =
                        matches.where((doc) {

                          final data =
                          doc.data()
                          as Map<String, dynamic>;

                          final similarity =
                          (data['similarity']
                              ?? 0);

                          return similarity >= 0.50 &&
                              similarity < 0.80;

                        }).length;

                    final lowConfidence =
                        matches.where((doc) {

                          final data =
                          doc.data()
                          as Map<String, dynamic>;

                          return
                            (data['similarity']
                                ?? 0) < 0.50;

                        }).length;

                    // ✅ ROW → WRAP
                    return Wrap(

                      spacing: 20,
                      runSpacing: 20,

                      children: [

                        _card(
                          title: "Total Matches",

                          value:
                          totalMatches.toString(),

                          color: Colors.blue,

                          icon: Icons.analytics,
                        ),

                        _card(
                          title: "High Confidence",

                          value:
                          highConfidence.toString(),

                          color: Colors.green,

                          icon:
                          Icons.check_circle,
                        ),

                        _card(
                          title:
                          "Medium Confidence",

                          value:
                          mediumConfidence.toString(),

                          color: Colors.orange,

                          icon: Icons.warning,
                        ),

                        _card(
                          title: "Low Confidence",

                          value:
                          lowConfidence.toString(),

                          color: Colors.red,

                          icon: Icons.error,
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 35),

                // 🔷 MATCH TABLE
                Container(

                  // ✅ REMOVED FIXED WIDTH
                  width: double.infinity,

                  padding:
                  const EdgeInsets.all(20),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(16),

                    boxShadow: [

                      BoxShadow(
                        color:
                        Colors.black.withOpacity(
                            0.05),

                        blurRadius: 8,

                        offset:
                        const Offset(0, 3),
                      ),
                    ],
                  ),

                  child:
                  StreamBuilder<QuerySnapshot>(

                    stream:
                    FirebaseFirestore.instance
                        .collection('matches')
                        .snapshots(),

                    builder: (context, snapshot) {

                      if (!snapshot.hasData) {

                        return const Center(
                          child:
                          CircularProgressIndicator(),
                        );
                      }

                      final matches =
                          snapshot.data!.docs;

                      if (matches.isEmpty) {

                        return const Center(
                          child:
                          Text(
                            "No AI matches found",
                          ),
                        );
                      }

                      return SingleChildScrollView(

                        scrollDirection:
                        Axis.horizontal,

                        child: DataTable(

                          headingRowColor:
                          MaterialStateProperty.all(
                            bgColor,
                          ),

                          columns: const [

                            DataColumn(
                              label: Text(

                                "Lost Item ID",

                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),

                            DataColumn(
                              label: Text(

                                "Found Item ID",

                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),

                            DataColumn(
                              label: Text(

                                "Similarity",

                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),

                            DataColumn(
                              label: Text(

                                "Confidence",

                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),
                          ],

                          rows: matches.map((doc) {

                            final data =
                            doc.data()
                            as Map<String, dynamic>;

                            final similarity =
                            (data['similarity']
                                ?? 0.0);

                            String confidence;
                            Color color;

                            if (similarity >= 0.80) {

                              confidence = "HIGH";
                              color = Colors.green;

                            } else if
                            (similarity >= 0.50) {

                              confidence = "MEDIUM";
                              color = Colors.orange;

                            } else {

                              confidence = "LOW";
                              color = Colors.red;
                            }

                            return DataRow(
                              cells: [

                                DataCell(

                                  Text(
                                    data['lost_item_id']
                                        ?? '',
                                  ),
                                ),

                                DataCell(

                                  Text(
                                    data['found_item_id']
                                        ?? '',
                                  ),
                                ),

                                DataCell(

                                  Text(

                                    "${(similarity * 100).toStringAsFixed(1)}%",
                                  ),
                                ),

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
                                      color.withOpacity(
                                          0.15),

                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          20),
                                    ),

                                    child: Text(

                                      confidence,

                                      style: TextStyle(
                                        color: color,

                                        fontWeight:
                                        FontWeight
                                            .bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );

                          }).toList(),
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

  // 🔷 CARD
  Widget _card({

    required String title,
    required String value,
    required Color color,
    required IconData icon,

  }) {

    // ✅ REMOVED EXPANDED
    // Added fixed safe width

    return SizedBox(

      width: 260,

      child: Container(

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

        child: Row(
          children: [

            Container(
              padding:
              const EdgeInsets.all(14),

              decoration: BoxDecoration(

                color:
                color.withOpacity(0.15),

                borderRadius:
                BorderRadius.circular(14),
              ),

              child: Icon(

                icon,

                color: color,
                size: 30,
              ),
            ),

            const SizedBox(width: 18),

            Expanded(

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(

                    title,

                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(

                    value,

                    style: const TextStyle(
                      fontSize: 24,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}