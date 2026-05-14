// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
//
// class AnalyticsScreen extends StatelessWidget {
//   const AnalyticsScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
// //fl_chart dependecy added for barchart and pie
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
//           const Text(
//             "Analytics",
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           const SizedBox(height: 30),
//
//           // 🔷 CHARTS ROW
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//
//             children: [
//
//               // 🔷 BAR CHART
//               Expanded(
//                 flex: 2,
//           //   Bar chart = bigger
//           // Pie chart = smaller
//
//                 child: Container(
//                   height: 350,
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
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//
//                     children: [
//
//                       const Text(
//                         "Weekly Item Reports",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//
//                       const SizedBox(height: 30),
//
//                       Expanded(
//                         child: BarChart(
//                           //creates barchart
//
//                           BarChartData(
//                             // Contains all chart settings.
//
//                             borderData: FlBorderData(show: false),
//                             // removes outer border
//
//                             gridData: FlGridData(show: true),
//                             // Shows horizontal grid lines.
//                             // Makes chart easier to read.
//
//
//                             // Controls chart labels.
//                             titlesData: FlTitlesData(
//
//                               leftTitles: AxisTitles(
//                                 sideTitles: SideTitles(showTitles: true),
//                               ),
//
//                               rightTitles: AxisTitles(
//                                 sideTitles: SideTitles(showTitles: false),
//                               ),
//
//                               topTitles: AxisTitles(
//                                 sideTitles: SideTitles(showTitles: false),
//                               ),
//
//                               bottomTitles: AxisTitles(
//                                 sideTitles: SideTitles(
//                                   showTitles: true,
//
//                                   // This function decides what text appears below each bar.
//                                   getTitlesWidget: (value, meta) {
//
//                                     final days = [
//                                       "M",
//                                       "T",
//                                       "W",
//                                       "T",
//                                       "F",
//                                       "S",
//                                       "S"
//                                     ];
//
//                                     return Padding(
//                                       padding: const EdgeInsets.only(top: 8),
//                                       child: Text(days[value.toInt()]),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ),
//
//                             // Contains all bars.
//                             barGroups: [
//
//                               _barData(0, 5), //Bar at position 0 has height 5
//                               _barData(1, 8),
//                               _barData(2, 6),
//                               _barData(3, 10),
//                               _barData(4, 7),
//                               _barData(5, 4),
//                               _barData(6, 9),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//
//               const SizedBox(width: 25),
//
//               // 🔷 PIE CHART
//               Expanded(
//                 child: Container(
//                   height: 350,
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
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//
//                     children: [
//
//                       const Text(
//                         "Claims Status",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//
//                       const SizedBox(height: 20),
//
//                       Expanded(
//                         child: PieChart(
//                           // Controls pie chart settings.
//                           PieChartData(
//
//                             sectionsSpace: 3, //Space between pie slices.
//                             centerSpaceRadius: 40,
//                             //Creates empty hole in center.
//                             // Makes donut-style chart.
//
//                             sections: [
//
//                               PieChartSectionData(
//                                 value: 45,
//                                 color: Colors.green,
//                                 title: "Approved",
//                                 radius: 60,
//                               ),
//
//                               PieChartSectionData(
//                                 value: 30,
//                                 color: Colors.orange,
//                                 title: "Pending",
//                                 radius: 60,
//                               ),
//
//                               PieChartSectionData(
//                                 value: 25,
//                                 color: Colors.red,
//                                 title: "Rejected",
//                                 radius: 60,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 35),
//
//           // 🔷 AI ANALYTICS
//           const Text(
//             "AI Matching Performance",
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           Row(
//             children: [
//
//               _analyticsCard(
//                 title: "Average Match Score",
//                 value: "89%",
//                 icon: Icons.analytics,
//                 color: Colors.blue,
//               ),
//
//               const SizedBox(width: 20),
//
//               _analyticsCard(
//                 title: "Successful Matches",
//                 value: "342",
//                 icon: Icons.check_circle,
//                 color: Colors.green,
//               ),
//
//               const SizedBox(width: 20),
//
//               _analyticsCard(
//                 title: "False Matches",
//                 value: "18",
//                 icon: Icons.warning,
//                 color: Colors.red,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   // 🔷 BAR DATA
//   static BarChartGroupData _barData(int x, double y) {
//
//     return BarChartGroupData(
//       x: x,
//
//       barRods: [
//
//         BarChartRodData(
//           toY: y,
//           width: 18,
//           borderRadius: BorderRadius.circular(6),
//           color: darkBlue,
//         ),
//       ],
//     );
//   }
//
//   // 🔷 ANALYTICS CARD
//   Widget _analyticsCard({
//     required String title,
//     required String value,
//     required IconData icon,
//     required Color color,
//   }) {
//
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
//               padding: const EdgeInsets.all(14),
//
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.15),
//                 borderRadius: BorderRadius.circular(14),
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
//               crossAxisAlignment: CrossAxisAlignment.start,
//
//               children: [
//
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     color: Colors.grey,
//                   ),
//                 ),
//
//                 const SizedBox(height: 8),
//
//                 Text(
//                   value,
//                   style: const TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
//
// class AnalyticsScreen extends StatelessWidget {
//   const AnalyticsScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
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
//           // const Text(
//           //   "Analytics",
//           //   style: TextStyle(
//           //     fontSize: 28,
//           //     fontWeight: FontWeight.bold,
//           //   ),
//           // ),
//
//           const SizedBox(height: 30),
//
//           // 🔥 FIREBASE DATA WRAPPER
//           StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance.collection('items').snapshots(),
//
//             builder: (context, itemsSnap) {
//               return StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance.collection('claims').snapshots(),
//
//                 builder: (context, claimsSnap) {
//
//                   if (!itemsSnap.hasData || !claimsSnap.hasData) {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//
//                   final items = itemsSnap.data!.docs;
//                   final claims = claimsSnap.data!.docs;
//
//                   // 🔷 ITEMS STATS
//                   final lost = items.where((d) {
//                     final data = d.data() as Map<String, dynamic>;
//                     return data['type'] == 'lost';
//                   }).length;
//
//                   final found = items.where((d) {
//                     final data = d.data() as Map<String, dynamic>;
//                     return data['type'] == 'found';
//                   }).length;
//
//                   // 🔷 CLAIM STATS
//                   final approved = claims.where((d) {
//                     final data = d.data() as Map<String, dynamic>;
//                     return data['status'] == 'claim approved';
//                   }).length;
//
//                   final pending = claims.where((d) {
//                     final data = d.data() as Map<String, dynamic>;
//                     return data['status'] == 'claim pending';
//                   }).length;
//
//                   final rejected = claims.where((d) {
//                     final data = d.data() as Map<String, dynamic>;
//                     return data['status'] == 'claim rejected';
//                   }).length;
//
//                   // 🔷 AI SCORE (from similarity field if exists)
//                   double totalScore = 0;
//                   int count = 0;
//
//                   for (var doc in items) {
//                     final data = doc.data() as Map<String, dynamic>;
//
//                     if (data['similarity'] != null) {
//                       totalScore += (data['similarity'] * 100);
//                       count++;
//                     }
//                   }
//
//                   final avgScore = count == 0 ? 0 : totalScore / count;
//
//                   return Column(
//                     children: [
//
//                       // 🔷 CHARTS ROW
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//                           // 🔵 BAR CHART
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               height: 350,
//                               padding: const EdgeInsets.all(20),
//
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(16),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.05),
//                                     blurRadius: 8,
//                                     offset: const Offset(0, 3),
//                                   ),
//                                 ],
//                               ),
//
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//
//                                   const Text(
//                                     "Items Overview",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//
//                                   const SizedBox(height: 30),
//
//                                   Expanded(
//                                     child: BarChart(
//                                       BarChartData(
//                                         borderData: FlBorderData(show: false),
//                                         gridData: FlGridData(show: true),
//
//                                         titlesData: FlTitlesData(
//                                           leftTitles: AxisTitles(
//                                             sideTitles: SideTitles(showTitles: true),
//                                           ),
//                                           rightTitles: AxisTitles(
//                                             sideTitles: SideTitles(showTitles: false),
//                                           ),
//                                           topTitles: AxisTitles(
//                                             sideTitles: SideTitles(showTitles: false),
//                                           ),
//
//                                           bottomTitles: AxisTitles(
//                                             sideTitles: SideTitles(
//                                               showTitles: true,
//                                               getTitlesWidget: (value, meta) {
//                                                 const labels = ["Lost", "Found"];
//
//                                                 return Padding(
//                                                   padding: const EdgeInsets.only(top: 8),
//                                                   child: Text(labels[value.toInt()]),
//                                                 );
//                                               },
//                                             ),
//                                           ),
//                                         ),
//
//                                         barGroups: [
//                                           _barData(0, lost.toDouble()),
//                                           _barData(1, found.toDouble()),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//
//                           const SizedBox(width: 25),
//
//                           // 🟠 PIE CHART
//                           Expanded(
//                             child: Container(
//                               height: 350,
//                               padding: const EdgeInsets.all(20),
//
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(16),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.05),
//                                     blurRadius: 8,
//                                     offset: const Offset(0, 3),
//                                   ),
//                                 ],
//                               ),
//
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//
//                                   const Text(
//                                     "Claims Status",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//
//                                   const SizedBox(height: 20),
//
//                                   Expanded(
//                                     child: PieChart(
//                                       PieChartData(
//                                         sectionsSpace: 3,
//                                         centerSpaceRadius: 40,
//
//                                         sections: [
//                                           PieChartSectionData(
//                                             value: approved.toDouble(),
//                                             color: Colors.green,
//                                             title: "A",
//                                             radius: 60,
//                                           ),
//                                           PieChartSectionData(
//                                             value: pending.toDouble(),
//                                             color: Colors.orange,
//                                             title: "P",
//                                             radius: 60,
//                                           ),
//                                           PieChartSectionData(
//                                             value: rejected.toDouble(),
//                                             color: Colors.red,
//                                             title: "R",
//                                             radius: 60,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       const SizedBox(height: 35),
//
//                       // 🔷 AI SECTION
//                       const Text(
//                         "AI Matching Performance",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//
//                       const SizedBox(height: 20),
//
//                       Row(
//                         children: [
//
//                           _analyticsCard(
//                             title: "Avg Match Score",
//                             value: "${avgScore.toStringAsFixed(1)}%",
//                             icon: Icons.analytics,
//                             color: Colors.blue,
//                           ),
//
//                           const SizedBox(width: 20),
//
//                           _analyticsCard(
//                             title: "Lost Items",
//                             value: "$lost",
//                             icon: Icons.search_off,
//                             color: Colors.red,
//                           ),
//
//                           const SizedBox(width: 20),
//
//                           _analyticsCard(
//                             title: "Found Items",
//                             value: "$found",
//                             icon: Icons.check_circle,
//                             color: Colors.green,
//                           ),
//                         ],
//                       ),
//                     ],
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
//   // 🔷 BAR DATA
//   static BarChartGroupData _barData(int x, double y) {
//     return BarChartGroupData(
//       x: x,
//       barRods: [
//         BarChartRodData(
//           toY: y,
//           width: 18,
//           borderRadius: BorderRadius.circular(6),
//           color: darkBlue,
//         ),
//       ],
//     );
//   }
//
//   // 🔷 CARD WIDGET
//   Widget _analyticsCard({
//     required String title,
//     required String value,
//     required IconData icon,
//     required Color color,
//   }) {
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
//               padding: const EdgeInsets.all(14),
//
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.15),
//                 borderRadius: BorderRadius.circular(14),
//               ),
//
//               child: Icon(icon, color: color, size: 30),
//             ),
//
//             const SizedBox(width: 18),
//
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 Text(
//                   title,
//                   style: const TextStyle(color: Colors.grey),
//                 ),
//
//                 const SizedBox(height: 8),
//
//                 Text(
//                   value,
//                   style: const TextStyle(
//                     fontSize: 22,
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
//how numbers are shows on bar.. toltipTooltip
// The chart library automatically shows tooltip values when touched.

// piechart---> piechart()-> piechartdata(control piechart setting)->  setted section spaec adn centre space...class
// piechrt offer sections->[
//   piechartchartsectionadta(title, color, radius , value)
// ]

// barchart->barchartdata->controll barchart
//     boderadata= false,
// griddata= true

// give tiles data->basiclly set labels, left and botton are enable other right anf top are diasbles
// gettileswidget waht to shwo below bard.. we ahev mad eand array accordign to vaue the dat letter shoudl e shon under abrs
// now actua; bars: bargroups: barchartgroupdata(position, heigth) builds bar accrofdign this.. bcz of tool tip chart autmatically shos numbers.

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
//
// class AnalyticsScreen extends StatelessWidget {
//   const AnalyticsScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
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
//           const SizedBox(height: 20),
//
//           // 🔥 FIREBASE DATA
//           StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance.collection('items').snapshots(),
//
//             builder: (context, itemsSnap) {
//               return StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection('claims')
//                     .snapshots(),
//
//                 builder: (context, claimsSnap) {
//                   return StreamBuilder<QuerySnapshot>(
//                     stream: FirebaseFirestore.instance
//                         .collection('duplicate_alerts')
//                         .snapshots(),
//
//                     builder: (context, duplicateSnap) {
//                       if (!itemsSnap.hasData ||
//                           !claimsSnap.hasData ||
//                           !duplicateSnap.hasData) {
//                         return const Center(child: CircularProgressIndicator());
//                       }
//
//                       final items = itemsSnap.data!.docs;
//                       final claims = claimsSnap.data!.docs;
//                       final duplicates = duplicateSnap.data!.docs;
//
//                       // 🔷 LOST / FOUND
//                       final lost = items.where((d) {
//                         final data = d.data() as Map<String, dynamic>;
//
//                         return data['type'] == 'lost';
//                       }).length;
//
//                       final found = items.where((d) {
//                         final data = d.data() as Map<String, dynamic>;
//
//                         return data['type'] == 'found';
//                       }).length;
//
//                       // 🔷 CLAIMS
//                       final approved = claims.where((d) {
//                         final data = d.data() as Map<String, dynamic>;
//
//                         return data['status'] == 'claim approved';
//                       }).length;
//
//                       final pending = claims.where((d) {
//                         final data = d.data() as Map<String, dynamic>;
//
//                         return data['status'] == 'claim pending';
//                       }).length;
//
//                       final rejected = claims.where((d) {
//                         final data = d.data() as Map<String, dynamic>;
//
//                         return data['status'] == 'claim rejected';
//                       }).length;
//
//                       // 🔷 RETURNED ITEMS
//                       final returned = items.where((d) {
//                         final data = d.data() as Map<String, dynamic>;
//
//                         return data['status'] == 'returned';
//                       }).length;
//
//                       // 🔷 FLAGGED ITEMS
//                       final flagged = items.where((d) {
//                         final data = d.data() as Map<String, dynamic>;
//
//                         return data['flagged'] == true;
//                       }).length;
//
//                       // 🔷 RECOVERY RATE
//                       final recoveryRate = items.isEmpty
//                           ? 0
//                           : (returned / items.length) * 100;
//
//                       // 🔷 INVENTORY HEALTH
//                       final healthyItems = items.length - flagged;
//
//                       final healthRate = items.isEmpty
//                           ? 0
//                           : (healthyItems / items.length) * 100;
//
//                       // 🔷 DUPLICATE AI
//                       final confirmedDuplicates = duplicates.where((d) {
//                         final data = d.data() as Map<String, dynamic>;
//
//                         return data['status'] == 'confirmed';
//                       }).length;
//
//                       final duplicateAccuracy = duplicates.isEmpty
//                           ? 0
//                           : (confirmedDuplicates / duplicates.length) * 100;
//
//                       // 🔷 CATEGORY RECOVERY
//                       int electronicsTotal = 0;
//                       int electronicsReturned = 0;
//
//                       int documentsTotal = 0;
//                       int documentsReturned = 0;
//
//                       int othersTotal = 0;
//                       int othersReturned = 0;
//
//                       for (var doc in items) {
//                         final data = doc.data() as Map<String, dynamic>;
//
//                         final category = data['category'] ?? '';
//
//                         final status = data['status'] ?? '';
//
//                         // ELECTRONICS
//                         if (category == "Electronics") {
//                           electronicsTotal++;
//
//                           if (status == "returned") {
//                             electronicsReturned++;
//                           }
//                         }
//
//                         // DOCUMENTS
//                         if (category == "Documents") {
//                           documentsTotal++;
//
//                           if (status == "returned") {
//                             documentsReturned++;
//                           }
//                         }
//
//                         // OTHERS
//                         if (category == "Others" || category == "Other") {
//                           othersTotal++;
//
//                           if (status == "returned") {
//                             othersReturned++;
//                           }
//                         }
//                       }
//
//                       final electronicsRate = electronicsTotal == 0
//                           ? 0
//                           : (electronicsReturned / electronicsTotal) * 100;
//
//                       final documentsRate = documentsTotal == 0
//                           ? 0
//                           : (documentsReturned / documentsTotal) * 100;
//
//                       final othersRate = othersTotal == 0
//                           ? 0
//                           : (othersReturned / othersTotal) * 100;
//
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//
//                         children: [
//                           // 🔷 TOP CHARTS
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//
//                             children: [
//                               // 🔵 BAR CHART
//                               Expanded(
//                                 flex: 2,
//
//                                 child: Container(
//                                   height: 350,
//
//                                   padding: const EdgeInsets.all(20),
//
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//
//                                     borderRadius: BorderRadius.circular(16),
//
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black.withOpacity(0.05),
//
//                                         blurRadius: 8,
//
//                                         offset: const Offset(0, 3),
//                                       ),
//                                     ],
//                                   ),
//
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//
//                                     children: [
//                                       const Text(
//                                         "Items Overview",
//
//                                         style: TextStyle(
//                                           fontSize: 18,
//
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//
//                                       const SizedBox(height: 30),
//
//                                       Expanded(
//                                         child: BarChart(
//                                           BarChartData(
//                                             borderData: FlBorderData(
//                                               show: false,
//                                             ),
//
//                                             gridData: FlGridData(show: true),
//
//                                             titlesData: FlTitlesData(
//                                               leftTitles: AxisTitles(
//                                                 sideTitles: SideTitles(
//                                                   showTitles: true,
//                                                 ),
//                                               ),
//
//                                               rightTitles: AxisTitles(
//                                                 sideTitles: SideTitles(
//                                                   showTitles: false,
//                                                 ),
//                                               ),
//
//                                               topTitles: AxisTitles(
//                                                 sideTitles: SideTitles(
//                                                   showTitles: false,
//                                                 ),
//                                               ),
//
//                                               bottomTitles: AxisTitles(
//                                                 sideTitles: SideTitles(
//                                                   showTitles: true,
//
//                                                   getTitlesWidget: (value, meta) {
//                                                     const labels = [
//                                                       "Lost",
//                                                       "Found",
//                                                     ];
//
//                                                     return Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                             top: 8,
//                                                           ),
//
//                                                       child: Text(
//                                                         labels[value.toInt()],
//                                                       ),
//                                                     );
//                                                   },
//                                                 ),
//                                               ),
//                                             ),
//
//                                             barGroups: [
//                                               _barData(0, lost.toDouble()),
//
//                                               _barData(1, found.toDouble()),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                               const SizedBox(width: 25),
//
//                               // 🟠 CLAIM CHART
//                               Expanded(
//                                 child: Container(
//                                   height: 350,
//
//                                   padding: const EdgeInsets.all(20),
//
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//
//                                     borderRadius: BorderRadius.circular(16),
//
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black.withOpacity(0.05),
//
//                                         blurRadius: 8,
//
//                                         offset: const Offset(0, 3),
//                                       ),
//                                     ],
//                                   ),
//
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//
//                                     children: [
//                                       const Text(
//                                         "Claims Status",
//
//                                         style: TextStyle(
//                                           fontSize: 18,
//
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//
//                                       const SizedBox(height: 20),
//
//                                       Expanded(
//                                         child: PieChart(
//                                           PieChartData(
//                                             sectionsSpace: 3,
//
//                                             centerSpaceRadius: 40,
//
//                                             sections: [
//                                               PieChartSectionData(
//                                                 value: approved.toDouble(),
//
//                                                 color: Colors.green,
//
//                                                 title: "A",
//
//                                                 radius: 60,
//                                               ),
//
//                                               PieChartSectionData(
//                                                 value: pending.toDouble(),
//
//                                                 color: Colors.orange,
//
//                                                 title: "P",
//
//                                                 radius: 60,
//                                               ),
//
//                                               PieChartSectionData(
//                                                 value: rejected.toDouble(),
//
//                                                 color: Colors.red,
//
//                                                 title: "R",
//
//                                                 radius: 60,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           const SizedBox(height: 35),
//
//                           // 🔷 RECOVERY + HEALTH
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: _progressCard(
//                                   title: "Recovery Performance",
//
//                                   value: "${recoveryRate.toStringAsFixed(0)}%",
//
//                                   subtitle:
//                                       "$returned items successfully returned",
//
//                                   progress: recoveryRate / 100,
//
//                                   color: darkBlue,
//                                 ),
//                               ),
//
//                               const SizedBox(width: 20),
//
//                               Expanded(
//                                 child: _progressCard(
//                                   title: "Inventory Health",
//
//                                   value: "${healthRate.toStringAsFixed(0)}%",
//
//                                   subtitle: "$flagged flagged items",
//
//                                   progress: healthRate / 100,
//
//                                   color: Colors.green,
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           const SizedBox(height: 35),
//
//                           // 🔷 CATEGORY TRENDS
//                           Container(
//                             width: double.infinity,
//
//                             padding: const EdgeInsets.all(20),
//
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//
//                               borderRadius: BorderRadius.circular(16),
//
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.05),
//
//                                   blurRadius: 8,
//
//                                   offset: const Offset(0, 3),
//                                 ),
//                               ],
//                             ),
//
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//
//                               children: [
//                                 const Text(
//                                   "Category Recovery Trends",
//
//                                   style: TextStyle(
//                                     fontSize: 20,
//
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//
//                                 const SizedBox(height: 30),
//
//                                 _categoryProgress(
//                                   "Electronics",
//                                   electronicsRate,
//                                 ),
//
//                                 const SizedBox(height: 25),
//
//                                 _categoryProgress("Documents", documentsRate),
//
//                                 const SizedBox(height: 25),
//
//                                 _categoryProgress("Others", othersRate),
//                               ],
//                             ),
//                           ),
//
//                           const SizedBox(height: 35),
//
//                           // 🔷 AI SECTION
//                           Row(
//                             children: [
//                               _analyticsCard(
//                                 title: "AI Duplicate Accuracy",
//
//                                 value:
//                                     "${duplicateAccuracy.toStringAsFixed(0)}%",
//
//                                 icon: Icons.auto_awesome,
//
//                                 color: Colors.purple,
//                               ),
//
//                               const SizedBox(width: 20),
//
//                               _analyticsCard(
//                                 title: "Confirmed Duplicates",
//
//                                 value: "$confirmedDuplicates",
//
//                                 icon: Icons.verified,
//
//                                 color: Colors.orange,
//                               ),
//
//                               const SizedBox(width: 20),
//
//                               _analyticsCard(
//                                 title: "Flagged Items",
//
//                                 value: "$flagged",
//
//                                 icon: Icons.flag,
//
//                                 color: Colors.red,
//                               ),
//                             ],
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
//   // 🔷 BAR DATA
//   static BarChartGroupData _barData(int x, double y) {
//     return BarChartGroupData(
//       x: x,
//
//       barRods: [
//         BarChartRodData(
//           toY: y,
//
//           width: 18,
//
//           borderRadius: BorderRadius.circular(6),
//
//           color: darkBlue,
//         ),
//       ],
//     );
//   }
//
//   // 🔷 ANALYTICS CARD
//   Widget _analyticsCard({
//     required String title,
//     required String value,
//     required IconData icon,
//     required Color color,
//   }) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(20),
//
//         decoration: BoxDecoration(
//           color: Colors.white,
//
//           borderRadius: BorderRadius.circular(16),
//
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
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
//             Container(
//               padding: const EdgeInsets.all(14),
//
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.15),
//
//                 borderRadius: BorderRadius.circular(14),
//               ),
//
//               child: Icon(icon, color: color, size: 30),
//             ),
//
//             const SizedBox(width: 18),
//
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//
//               children: [
//                 Text(title, style: const TextStyle(color: Colors.grey)),
//
//                 const SizedBox(height: 8),
//
//                 Text(
//                   value,
//
//                   style: const TextStyle(
//                     fontSize: 22,
//
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
//
//   // 🔷 PROGRESS CARD
//   Widget _progressCard({
//     required String title,
//     required String value,
//     required String subtitle,
//     required double progress,
//     required Color color,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//
//       decoration: BoxDecoration(
//         color: Colors.white,
//
//         borderRadius: BorderRadius.circular(16),
//
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//
//             blurRadius: 8,
//
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//
//       child: Column(
//         children: [
//           Text(
//             title,
//
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//
//           const SizedBox(height: 25),
//
//           SizedBox(
//             height: 130,
//             width: 130,
//
//             child: Stack(
//               alignment: Alignment.center,
//
//               children: [
//                 CircularProgressIndicator(
//                   value: progress,
//
//                   strokeWidth: 12,
//
//                   backgroundColor: Colors.grey.shade200,
//
//                   valueColor: AlwaysStoppedAnimation(color),
//                 ),
//
//                 Text(
//                   value,
//
//                   style: TextStyle(
//                     color: color,
//
//                     fontSize: 24,
//
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
//         ],
//       ),
//     );
//   }
//
//   // 🔷 CATEGORY PROGRESS
//   Widget _categoryProgress(String title, double value) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//           children: [
//             Text(
//               title,
//
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//
//             Text("${value.toStringAsFixed(0)}%"),
//           ],
//         ),
//
//         const SizedBox(height: 10),
//
//         ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//
//           child: LinearProgressIndicator(
//             value: value / 100,
//
//             minHeight: 14,
//
//             backgroundColor: Colors.grey.shade200,
//
//             valueColor: const AlwaysStoppedAnimation(darkBlue),
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
//
// class AnalyticsScreen extends StatelessWidget {
//   const AnalyticsScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
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
//           const SizedBox(height: 20),
//
//           // 🔥 FIREBASE DATA
//           StreamBuilder<QuerySnapshot>(
//             stream:
//             FirebaseFirestore.instance
//                 .collection('items')
//                 .snapshots(),
//
//             builder: (context, itemsSnap) {
//               return StreamBuilder<QuerySnapshot>(
//                 stream:
//                 FirebaseFirestore.instance
//                     .collection('claims')
//                     .snapshots(),
//
//                 builder: (context, claimsSnap) {
//                   return StreamBuilder<QuerySnapshot>(
//                     stream:
//                     FirebaseFirestore.instance
//                         .collection('duplicate_alerts')
//                         .snapshots(),
//
//                     builder: (context, duplicateSnap) {
//                       if (!itemsSnap.hasData ||
//                           !claimsSnap.hasData ||
//                           !duplicateSnap.hasData) {
//                         return const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }
//
//                       final items = itemsSnap.data!.docs;
//                       final claims = claimsSnap.data!.docs;
//                       final duplicates =
//                           duplicateSnap.data!.docs;
//
//                       // 🔷 LOST / FOUND
//                       final lost = items.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['type'] == 'lost';
//                       }).length;
//
//                       final found = items.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['type'] == 'found';
//                       }).length;
//
//                       // 🔷 CLAIMS
//                       final approved = claims.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['status'] ==
//                             'claim approved';
//                       }).length;
//
//                       final pending = claims.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['status'] ==
//                             'claim pending';
//                       }).length;
//
//                       final rejected = claims.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['status'] ==
//                             'claim rejected';
//                       }).length;
//
//                       // 🔷 RETURNED ITEMS
//                       final returned = items.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['status'] ==
//                             'returned';
//                       }).length;
//
//                       // 🔷 FLAGGED ITEMS
//                       final flagged = items.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['flagged'] == true;
//                       }).length;
//
//                       // 🔷 RECOVERY RATE
//                       final double recoveryRate =
//                       items.isEmpty
//                           ? 0.0
//                           : (returned / items.length) *
//                           100;
//
//                       // 🔷 INVENTORY HEALTH
//                       final healthyItems =
//                           items.length - flagged;
//
//                       final double healthRate =
//                       items.isEmpty
//                           ? 0.0
//                           : (healthyItems /
//                           items.length) *
//                           100;
//
//                       // 🔷 DUPLICATE AI
//                       final confirmedDuplicates =
//                           duplicates.where((d) {
//                             final data =
//                             d.data()
//                             as Map<String, dynamic>;
//
//                             return data['status'] ==
//                                 'confirmed';
//                           }).length;
//
//                       final double duplicateAccuracy =
//                       duplicates.isEmpty
//                           ? 0.0
//                           : (confirmedDuplicates /
//                           duplicates.length) *
//                           100;
//
//                       // 🔷 CATEGORY RECOVERY
//                       int electronicsTotal = 0;
//                       int electronicsReturned = 0;
//
//                       int documentsTotal = 0;
//                       int documentsReturned = 0;
//
//                       int othersTotal = 0;
//                       int othersReturned = 0;
//
//                       for (var doc in items) {
//                         final data =
//                         doc.data()
//                         as Map<String, dynamic>;
//
//                         final category =
//                             data['category'] ?? '';
//
//                         final status =
//                             data['status'] ?? '';
//
//                         // ELECTRONICS
//                         if (category ==
//                             "Electronics") {
//                           electronicsTotal++;
//
//                           if (status ==
//                               "returned") {
//                             electronicsReturned++;
//                           }
//                         }
//
//                         // DOCUMENTS
//                         if (category == "Documents") {
//                           documentsTotal++;
//
//                           if (status ==
//                               "returned") {
//                             documentsReturned++;
//                           }
//                         }
//
//                         // OTHER
//                         if (category == "Other" ||
//                             category == "Others") {
//                           othersTotal++;
//
//                           if (status ==
//                               "returned") {
//                             othersReturned++;
//                           }
//                         }
//                       }
//
//                       final double electronicsRate =
//                       electronicsTotal == 0
//                           ? 0.0
//                           : (electronicsReturned /
//                           electronicsTotal) *
//                           100;
//
//                       final double documentsRate =
//                       documentsTotal == 0
//                           ? 0.0
//                           : (documentsReturned /
//                           documentsTotal) *
//                           100;
//
//                       final double othersRate =
//                       othersTotal == 0
//                           ? 0.0
//                           : (othersReturned /
//                           othersTotal) *
//                           100;
//
//                       return Column(
//                         crossAxisAlignment:
//                         CrossAxisAlignment.start,
//
//                         children: [
//                           // 🔷 TOP CHARTS
//                           Row(
//                             crossAxisAlignment:
//                             CrossAxisAlignment
//                                 .start,
//
//                             children: [
//                               // 🔵 BAR CHART
//                               Expanded(
//                                 flex: 2,
//
//                                 child: Container(
//                                   height: 350,
//
//                                   padding:
//                                   const EdgeInsets.all(
//                                     20,
//                                   ),
//
//                                   decoration:
//                                   BoxDecoration(
//                                     color: Colors.white,
//
//                                     borderRadius:
//                                     BorderRadius.circular(
//                                       16,
//                                     ),
//
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors
//                                             .black
//                                             .withOpacity(
//                                           0.05,
//                                         ),
//
//                                         blurRadius: 8,
//
//                                         offset:
//                                         const Offset(
//                                           0,
//                                           3,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment
//                                         .start,
//
//                                     children: [
//                                       const Text(
//                                         "Items Overview",
//
//                                         style: TextStyle(
//                                           fontSize: 18,
//
//                                           fontWeight:
//                                           FontWeight
//                                               .bold,
//                                         ),
//                                       ),
//
//                                       const SizedBox(
//                                         height: 30,
//                                       ),
//
//                                       Expanded(
//                                         child: BarChart(
//                                           BarChartData(
//                                             borderData:
//                                             FlBorderData(
//                                               show: false,
//                                             ),
//
//                                             gridData:
//                                             FlGridData(
//                                               show: true,
//                                             ),
//
//                                             titlesData:
//                                             FlTitlesData(
//                                               leftTitles:
//                                               AxisTitles(
//                                                 sideTitles:
//                                                 SideTitles(
//                                                   showTitles:
//                                                   true,
//                                                 ),
//                                               ),
//
//                                               rightTitles:
//                                               AxisTitles(
//                                                 sideTitles:
//                                                 SideTitles(
//                                                   showTitles:
//                                                   false,
//                                                 ),
//                                               ),
//
//                                               topTitles:
//                                               AxisTitles(
//                                                 sideTitles:
//                                                 SideTitles(
//                                                   showTitles:
//                                                   false,
//                                                 ),
//                                               ),
//
//                                               bottomTitles:
//                                               AxisTitles(
//                                                 sideTitles:
//                                                 SideTitles(
//                                                   showTitles:
//                                                   true,
//
//                                                   getTitlesWidget:
//                                                       (
//                                                       value,
//                                                       meta,
//                                                       ) {
//                                                     const labels =
//                                                     [
//                                                       "Lost",
//                                                       "Found",
//                                                     ];
//
//                                                     return Padding(
//                                                       padding:
//                                                       const EdgeInsets.only(
//                                                         top:
//                                                         8,
//                                                       ),
//
//                                                       child:
//                                                       Text(
//                                                         labels[value
//                                                             .toInt()],
//                                                       ),
//                                                     );
//                                                   },
//                                                 ),
//                                               ),
//                                             ),
//
//                                             barGroups: [
//                                               _barData(
//                                                 0,
//                                                 lost
//                                                     .toDouble(),
//                                               ),
//
//                                               _barData(
//                                                 1,
//                                                 found
//                                                     .toDouble(),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                               const SizedBox(width: 25),
//
//                               // 🟠 CLAIM CHART
//                               Expanded(
//                                 child: Container(
//                                   height: 350,
//
//                                   padding:
//                                   const EdgeInsets.all(
//                                     20,
//                                   ),
//
//                                   decoration:
//                                   BoxDecoration(
//                                     color: Colors.white,
//
//                                     borderRadius:
//                                     BorderRadius.circular(
//                                       16,
//                                     ),
//
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors
//                                             .black
//                                             .withOpacity(
//                                           0.05,
//                                         ),
//
//                                         blurRadius: 8,
//
//                                         offset:
//                                         const Offset(
//                                           0,
//                                           3,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment
//                                         .start,
//
//                                     children: [
//                                       const Text(
//                                         "Claims Status",
//
//                                         style: TextStyle(
//                                           fontSize: 18,
//
//                                           fontWeight:
//                                           FontWeight
//                                               .bold,
//                                         ),
//                                       ),
//
//                                       const SizedBox(
//                                         height: 20,
//                                       ),
//
//                                       Expanded(
//                                         child: PieChart(
//                                           PieChartData(
//                                             sectionsSpace:
//                                             3,
//
//                                             centerSpaceRadius:
//                                             40,
//
//                                             sections: [
//                                               PieChartSectionData(
//                                                 value:
//                                                 approved
//                                                     .toDouble(),
//
//                                                 color:
//                                                 Colors
//                                                     .green,
//
//                                                 title: "A",
//
//                                                 radius:
//                                                 60,
//                                               ),
//
//                                               PieChartSectionData(
//                                                 value:
//                                                 pending
//                                                     .toDouble(),
//
//                                                 color:
//                                                 Colors
//                                                     .orange,
//
//                                                 title: "P",
//
//                                                 radius:
//                                                 60,
//                                               ),
//
//                                               PieChartSectionData(
//                                                 value:
//                                                 rejected
//                                                     .toDouble(),
//
//                                                 color:
//                                                 Colors
//                                                     .red,
//
//                                                 title: "R",
//
//                                                 radius:
//                                                 60,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           const SizedBox(height: 35),
//
//                           // 🔷 RECOVERY + HEALTH
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: _progressCard(
//                                   title:
//                                   "Recovery Performance",
//
//                                   value:
//                                   "${recoveryRate.toStringAsFixed(0)}%",
//
//                                   subtitle:
//                                   "$returned items successfully returned",
//
//                                   progress:
//                                   recoveryRate /
//                                       100,
//
//                                   color: darkBlue,
//                                 ),
//                               ),
//
//                               const SizedBox(width: 20),
//
//                               Expanded(
//                                 child: _progressCard(
//                                   title:
//                                   "Inventory Health",
//
//                                   value:
//                                   "${healthRate.toStringAsFixed(0)}%",
//
//                                   subtitle:
//                                   "$flagged flagged items",
//
//                                   progress:
//                                   healthRate /
//                                       100,
//
//                                   color:
//                                   Colors.green,
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           const SizedBox(height: 35),
//
//                           // 🔷 CATEGORY TRENDS
//                           Container(
//                             width: double.infinity,
//
//                             padding:
//                             const EdgeInsets.all(
//                               20,
//                             ),
//
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//
//                               borderRadius:
//                               BorderRadius.circular(
//                                 16,
//                               ),
//
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black
//                                       .withOpacity(
//                                     0.05,
//                                   ),
//
//                                   blurRadius: 8,
//
//                                   offset:
//                                   const Offset(
//                                     0,
//                                     3,
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//                             child: Column(
//                               crossAxisAlignment:
//                               CrossAxisAlignment
//                                   .start,
//
//                               children: [
//                                 const Text(
//                                   "Category Recovery Trends",
//
//                                   style: TextStyle(
//                                     fontSize: 20,
//
//                                     fontWeight:
//                                     FontWeight.bold,
//                                   ),
//                                 ),
//
//                                 const SizedBox(
//                                   height: 30,
//                                 ),
//
//                                 _categoryProgress(
//                                   "Electronics",
//                                   electronicsRate,
//                                 ),
//
//                                 const SizedBox(
//                                   height: 25,
//                                 ),
//
//                                 _categoryProgress(
//                                   "Documents",
//                                   documentsRate,
//                                 ),
//
//                                 const SizedBox(
//                                   height: 25,
//                                 ),
//
//                                 _categoryProgress(
//                                   "Other",
//                                   othersRate,
//                                 ),
//                               ],
//                             ),
//                           ),
//
//                           const SizedBox(height: 35),
//
//                           // 🔷 AI SECTION
//                           Row(
//                             children: [
//                               _analyticsCard(
//                                 title:
//                                 "AI Duplicate Accuracy",
//
//                                 value:
//                                 "${duplicateAccuracy.toStringAsFixed(0)}%",
//
//                                 icon:
//                                 Icons.auto_awesome,
//
//                                 color:
//                                 Colors.purple,
//                               ),
//
//                               const SizedBox(width: 20),
//
//                               _analyticsCard(
//                                 title:
//                                 "Confirmed Duplicates",
//
//                                 value:
//                                 "$confirmedDuplicates",
//
//                                 icon: Icons.verified,
//
//                                 color:
//                                 Colors.orange,
//                               ),
//
//                               const SizedBox(width: 20),
//
//                               _analyticsCard(
//                                 title:
//                                 "Flagged Items",
//
//                                 value: "$flagged",
//
//                                 icon: Icons.flag,
//
//                                 color: Colors.red,
//                               ),
//                             ],
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
//   // 🔷 BAR DATA
//   static BarChartGroupData _barData(
//       int x,
//       double y,
//       ) {
//     return BarChartGroupData(
//       x: x,
//
//       barRods: [
//         BarChartRodData(
//           toY: y,
//
//           width: 18,
//
//           borderRadius:
//           BorderRadius.circular(6),
//
//           color: darkBlue,
//         ),
//       ],
//     );
//   }
//
//   // 🔷 ANALYTICS CARD
//   Widget _analyticsCard({
//     required String title,
//     required String value,
//     required IconData icon,
//     required Color color,
//   }) {
//     return Expanded(
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
//               color: Colors.black.withOpacity(
//                 0.05,
//               ),
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
//             Container(
//               padding: const EdgeInsets.all(14),
//
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.15),
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
//                     fontSize: 22,
//
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
//
//   // 🔷 PROGRESS CARD
//   Widget _progressCard({
//     required String title,
//     required String value,
//     required String subtitle,
//     required double progress,
//     required Color color,
//   }) {
//     return Container(
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
//             color: Colors.black.withOpacity(
//               0.05,
//             ),
//
//             blurRadius: 8,
//
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//
//       child: Column(
//         children: [
//           Text(
//             title,
//
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           const SizedBox(height: 25),
//
//           SizedBox(
//             height: 130,
//             width: 130,
//
//             child: Stack(
//               alignment: Alignment.center,
//
//               children: [
//                 CircularProgressIndicator(
//                   value: progress,
//
//                   strokeWidth: 12,
//
//                   backgroundColor:
//                   Colors.grey.shade200,
//
//                   valueColor:
//                   AlwaysStoppedAnimation(
//                     color,
//                   ),
//                 ),
//
//                 Text(
//                   value,
//
//                   style: TextStyle(
//                     color: color,
//
//                     fontSize: 24,
//
//                     fontWeight:
//                     FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           Text(
//             subtitle,
//
//             style: TextStyle(
//               color: Colors.grey.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // 🔷 CATEGORY PROGRESS
//   Widget _categoryProgress(
//       String title,
//       double value,
//       ) {
//     return Column(
//       crossAxisAlignment:
//       CrossAxisAlignment.start,
//
//       children: [
//         Row(
//           mainAxisAlignment:
//           MainAxisAlignment.spaceBetween,
//
//           children: [
//             Text(
//               title,
//
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//
//             Text(
//               "${value.toStringAsFixed(0)}%",
//             ),
//           ],
//         ),
//
//         const SizedBox(height: 10),
//
//         ClipRRect(
//           borderRadius:
//           BorderRadius.circular(10),
//
//           child: LinearProgressIndicator(
//             value: value / 100,
//
//             minHeight: 14,
//
//             backgroundColor:
//             Colors.grey.shade200,
//
//             valueColor:
//             const AlwaysStoppedAnimation(
//               darkBlue,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
//
// class AnalyticsScreen extends StatelessWidget {
//   const AnalyticsScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
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
//           const SizedBox(height: 20),
//
//           StreamBuilder<QuerySnapshot>(
//             stream:
//             FirebaseFirestore.instance
//                 .collection('items')
//                 .snapshots(),
//
//             builder: (context, itemsSnap) {
//               return StreamBuilder<QuerySnapshot>(
//                 stream:
//                 FirebaseFirestore.instance
//                     .collection('claims')
//                     .snapshots(),
//
//                 builder: (context, claimsSnap) {
//                   return StreamBuilder<QuerySnapshot>(
//                     stream:
//                     FirebaseFirestore.instance
//                         .collection('duplicate_alerts')
//                         .snapshots(),
//
//                     builder: (context, duplicateSnap) {
//                       if (!itemsSnap.hasData ||
//                           !claimsSnap.hasData ||
//                           !duplicateSnap.hasData) {
//                         return const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }
//
//                       final items = itemsSnap.data!.docs;
//                       final claims = claimsSnap.data!.docs;
//                       final duplicates =
//                           duplicateSnap.data!.docs;
//
//                       // 🔷 LOST / FOUND
//                       final lost = items.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['type'] == 'lost';
//                       }).length;
//
//                       final found = items.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['type'] == 'found';
//                       }).length;
//
//                       // 🔷 CLAIMS
//                       final approved = claims.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['status'] ==
//                             'claim approved';
//                       }).length;
//
//                       final pending = claims.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['status'] ==
//                             'claim pending';
//                       }).length;
//
//                       final rejected = claims.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['status'] ==
//                             'claim rejected';
//                       }).length;
//
//                       // 🔷 RETURNED ITEMS
//                       final returned = items.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['status'] ==
//                             'returned';
//                       }).length;
//
//                       // 🔷 FLAGGED ITEMS
//                       final flagged = items.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['flagged'] == true;
//                       }).length;
//
//                       // 🔷 RECOVERY RATE
//                       final double recoveryRate =
//                       items.isEmpty
//                           ? 0.0
//                           : (returned / items.length) *
//                           100;
//
//                       // 🔷 SAFE INVENTORY
//                       final healthyItems =
//                           items.length - flagged;
//
//                       final double safeInventoryRate =
//                       items.isEmpty
//                           ? 0.0
//                           : (healthyItems /
//                           items.length) *
//                           100;
//
//                       // 🔷 DUPLICATE ACCURACY
//                       final confirmedDuplicates =
//                           duplicates.where((d) {
//                             final data =
//                             d.data()
//                             as Map<String, dynamic>;
//
//                             return data['status'] ==
//                                 'confirmed';
//                           }).length;
//
//                       final double duplicateAccuracy =
//                       duplicates.isEmpty
//                           ? 0.0
//                           : (confirmedDuplicates /
//                           duplicates.length) *
//                           100;
//
//                       // 🔷 CATEGORY ANALYTICS
//                       final Map<String, int>
//                       categoryTotal = {};
//
//                       final Map<String, int>
//                       categoryReturned = {};
//
//                       for (var doc in items) {
//                         final data =
//                         doc.data()
//                         as Map<String, dynamic>;
//
//                         final category =
//                         (data['category'] ??
//                             'Other')
//                             .toString();
//
//                         final status =
//                             data['status'] ?? '';
//
//                         categoryTotal[category] =
//                             (categoryTotal[category] ??
//                                 0) +
//                                 1;
//
//                         if (status == "returned") {
//                           categoryReturned[category] =
//                               (categoryReturned[
//                               category] ??
//                                   0) +
//                                   1;
//                         }
//                       }
//
//                       return Column(
//                         crossAxisAlignment:
//                         CrossAxisAlignment.start,
//
//                         children: [
//                           // 🔷 TOP CHARTS
//                           Row(
//                             crossAxisAlignment:
//                             CrossAxisAlignment
//                                 .start,
//
//                             children: [
//                               // 🔵 ITEMS CHART
//                               Expanded(
//                                 flex: 2,
//
//                                 child: Container(
//                                   height: 350,
//
//                                   padding:
//                                   const EdgeInsets.all(
//                                     20,
//                                   ),
//
//                                   decoration:
//                                   BoxDecoration(
//                                     color: Colors.white,
//
//                                     borderRadius:
//                                     BorderRadius.circular(
//                                       16,
//                                     ),
//
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors
//                                             .black
//                                             .withOpacity(
//                                           0.05,
//                                         ),
//
//                                         blurRadius: 8,
//
//                                         offset:
//                                         const Offset(
//                                           0,
//                                           3,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment
//                                         .start,
//
//                                     children: [
//                                       const Text(
//                                         "Items Overview",
//
//                                         style: TextStyle(
//                                           fontSize: 18,
//
//                                           fontWeight:
//                                           FontWeight
//                                               .bold,
//                                         ),
//                                       ),
//
//                                       const SizedBox(
//                                         height: 30,
//                                       ),
//
//                                       Expanded(
//                                         child: BarChart(
//                                           BarChartData(
//                                             borderData:
//                                             FlBorderData(
//                                               show: false,
//                                             ),
//
//                                             gridData:
//                                             FlGridData(
//                                               show: true,
//                                             ),
//
//                                             titlesData:
//                                             FlTitlesData(
//                                               leftTitles:
//                                               AxisTitles(
//                                                 sideTitles:
//                                                 SideTitles(
//                                                   showTitles:
//                                                   true,
//                                                 ),
//                                               ),
//
//                                               rightTitles:
//                                               AxisTitles(
//                                                 sideTitles:
//                                                 SideTitles(
//                                                   showTitles:
//                                                   false,
//                                                 ),
//                                               ),
//
//                                               topTitles:
//                                               AxisTitles(
//                                                 sideTitles:
//                                                 SideTitles(
//                                                   showTitles:
//                                                   false,
//                                                 ),
//                                               ),
//
//                                               bottomTitles:
//                                               AxisTitles(
//                                                 sideTitles:
//                                                 SideTitles(
//                                                   showTitles:
//                                                   true,
//
//                                                   reservedSize:
//                                                   35,
//
//                                                   getTitlesWidget:
//                                                       (
//                                                       value,
//                                                       meta,
//                                                       ) {
//                                                     const labels =
//                                                     [
//                                                       "Lost",
//                                                       "Found",
//                                                     ];
//
//                                                     return Padding(
//                                                       padding:
//                                                       const EdgeInsets.only(
//                                                         top:
//                                                         10,
//                                                       ),
//
//                                                       child:
//                                                       Text(
//                                                         labels[value
//                                                             .toInt()],
//                                                       ),
//                                                     );
//                                                   },
//                                                 ),
//                                               ),
//                                             ),
//
//                                             barGroups: [
//                                               _barData(
//                                                 0,
//                                                 lost
//                                                     .toDouble(),
//                                               ),
//
//                                               _barData(
//                                                 1,
//                                                 found
//                                                     .toDouble(),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                               const SizedBox(width: 25),
//
//                               // 🟠 CLAIM CHART
//                               Expanded(
//                                 child: Container(
//                                   height: 350,
//
//                                   padding:
//                                   const EdgeInsets.all(
//                                     20,
//                                   ),
//
//                                   decoration:
//                                   BoxDecoration(
//                                     color: Colors.white,
//
//                                     borderRadius:
//                                     BorderRadius.circular(
//                                       16,
//                                     ),
//
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors
//                                             .black
//                                             .withOpacity(
//                                           0.05,
//                                         ),
//
//                                         blurRadius: 8,
//
//                                         offset:
//                                         const Offset(
//                                           0,
//                                           3,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment
//                                         .start,
//
//                                     children: [
//                                       const Text(
//                                         "Claims Status",
//
//                                         style: TextStyle(
//                                           fontSize: 18,
//
//                                           fontWeight:
//                                           FontWeight
//                                               .bold,
//                                         ),
//                                       ),
//
//                                       const SizedBox(
//                                         height: 15,
//                                       ),
//
//                                       Expanded(
//                                         child: PieChart(
//                                           PieChartData(
//                                             sectionsSpace:
//                                             3,
//
//                                             centerSpaceRadius:
//                                             40,
//
//                                             sections: [
//                                               PieChartSectionData(
//                                                 value:
//                                                 approved
//                                                     .toDouble(),
//
//                                                 color:
//                                                 Colors
//                                                     .green,
//
//                                                 title:
//                                                 approved
//                                                     .toString(),
//
//                                                 radius:
//                                                 60,
//                                               ),
//
//                                               PieChartSectionData(
//                                                 value:
//                                                 pending
//                                                     .toDouble(),
//
//                                                 color:
//                                                 Colors
//                                                     .orange,
//
//                                                 title:
//                                                 pending
//                                                     .toString(),
//
//                                                 radius:
//                                                 60,
//                                               ),
//
//                                               PieChartSectionData(
//                                                 value:
//                                                 rejected
//                                                     .toDouble(),
//
//                                                 color:
//                                                 Colors
//                                                     .red,
//
//                                                 title:
//                                                 rejected
//                                                     .toString(),
//
//                                                 radius:
//                                                 60,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment
//                                             .spaceEvenly,
//
//                                         children: [
//                                           _legend(
//                                             Colors.green,
//                                             "Approved",
//                                           ),
//
//                                           _legend(
//                                             Colors.orange,
//                                             "Pending",
//                                           ),
//
//                                           _legend(
//                                             Colors.red,
//                                             "Rejected",
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           const SizedBox(height: 35),
//
//                           // 🔷 PERFORMANCE
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: _progressCard(
//                                   title:
//                                   "Recovery Performance",
//
//                                   value:
//                                   "${recoveryRate.toStringAsFixed(0)}%",
//
//                                   subtitle:
//                                   "$returned items successfully returned",
//
//                                   progress:
//                                   recoveryRate /
//                                       100,
//
//                                   color: darkBlue,
//                                 ),
//                               ),
//
//                               const SizedBox(width: 20),
//
//                               Expanded(
//                                 child: _progressCard(
//                                   title:
//                                   "Safe Inventory",
//
//                                   value:
//                                   "${safeInventoryRate.toStringAsFixed(0)}%",
//
//                                   subtitle:
//                                   "$flagged items flagged by admin",
//
//                                   progress:
//                                   safeInventoryRate /
//                                       100,
//
//                                   color:
//                                   Colors.green,
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           const SizedBox(height: 35),
//
//                           // 🔷 CATEGORY TRENDS
//                           Container(
//                             width: double.infinity,
//
//                             padding:
//                             const EdgeInsets.all(
//                               20,
//                             ),
//
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//
//                               borderRadius:
//                               BorderRadius.circular(
//                                 16,
//                               ),
//
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black
//                                       .withOpacity(
//                                     0.05,
//                                   ),
//
//                                   blurRadius: 8,
//
//                                   offset:
//                                   const Offset(
//                                     0,
//                                     3,
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//                             child: Column(
//                               crossAxisAlignment:
//                               CrossAxisAlignment
//                                   .start,
//
//                               children: [
//                                 const Text(
//                                   "Category Recovery Trends",
//
//                                   style: TextStyle(
//                                     fontSize: 20,
//
//                                     fontWeight:
//                                     FontWeight.bold,
//                                   ),
//                                 ),
//
//                                 const SizedBox(
//                                   height: 30,
//                                 ),
//
//                                 ...categoryTotal.keys.map((
//                                     category,
//                                     ) {
//                                   final total =
//                                       categoryTotal[
//                                       category] ??
//                                           0;
//
//                                   final returned =
//                                       categoryReturned[
//                                       category] ??
//                                           0;
//
//                                   final double rate =
//                                   total == 0
//                                       ? 0.0
//                                       : (returned /
//                                       total) *
//                                       100;
//
//                                   return Padding(
//                                     padding:
//                                     const EdgeInsets.only(
//                                       bottom: 25,
//                                     ),
//
//                                     child:
//                                     _categoryProgress(
//                                       "$category ($total items)",
//                                       rate,
//                                     ),
//                                   );
//                                 }).toList(),
//                               ],
//                             ),
//                           ),
//
//                           const SizedBox(height: 35),
//
//                           // 🔷 AI SECTION
//                           Row(
//                             children: [
//                               _analyticsCard(
//                                 title:
//                                 "AI Duplicate Accuracy",
//
//                                 value:
//                                 "${duplicateAccuracy.toStringAsFixed(0)}%",
//
//                                 icon:
//                                 Icons.auto_awesome,
//
//                                 color:
//                                 Colors.purple,
//                               ),
//
//                               const SizedBox(width: 20),
//
//                               _analyticsCard(
//                                 title:
//                                 "Confirmed Duplicates",
//
//                                 value:
//                                 "$confirmedDuplicates",
//
//                                 icon: Icons.verified,
//
//                                 color:
//                                 Colors.orange,
//                               ),
//
//                               const SizedBox(width: 20),
//
//                               _analyticsCard(
//                                 title:
//                                 "Flagged Items",
//
//                                 value: "$flagged",
//
//                                 icon: Icons.flag,
//
//                                 color: Colors.red,
//                               ),
//                             ],
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
//   // 🔷 BAR DATA
//   static BarChartGroupData _barData(
//       int x,
//       double y,
//       ) {
//     return BarChartGroupData(
//       x: x,
//
//       barRods: [
//         BarChartRodData(
//           toY: y,
//
//           width: 18,
//
//           borderRadius:
//           BorderRadius.circular(6),
//
//           color: darkBlue,
//         ),
//       ],
//     );
//   }
//
//   // 🔷 LEGEND
//   Widget _legend(Color color, String text) {
//     return Row(
//       children: [
//         Container(
//           width: 14,
//           height: 14,
//
//           decoration: BoxDecoration(
//             color: color,
//             shape: BoxShape.circle,
//           ),
//         ),
//
//         const SizedBox(width: 6),
//
//         Text(
//           text,
//
//           style: const TextStyle(
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   }
//
//   // 🔷 ANALYTICS CARD
//   Widget _analyticsCard({
//     required String title,
//     required String value,
//     required IconData icon,
//     required Color color,
//   }) {
//     return Expanded(
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
//               color: Colors.black.withOpacity(
//                 0.05,
//               ),
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
//             Container(
//               padding: const EdgeInsets.all(14),
//
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.15),
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
//                     fontSize: 22,
//
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
//
//   // 🔷 PROGRESS CARD
//   Widget _progressCard({
//     required String title,
//     required String value,
//     required String subtitle,
//     required double progress,
//     required Color color,
//   }) {
//     return Container(
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
//             color: Colors.black.withOpacity(
//               0.05,
//             ),
//
//             blurRadius: 8,
//
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//
//       child: Column(
//         children: [
//           Text(
//             title,
//
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           const SizedBox(height: 25),
//
//           SizedBox(
//             height: 150,
//             width: 150,
//
//             child: Stack(
//               alignment: Alignment.center,
//
//               children: [
//                 SizedBox(
//                   height: 150,
//                   width: 150,
//
//                   child:
//                   CircularProgressIndicator(
//                     value: progress,
//
//                     strokeWidth: 10,
//
//                     backgroundColor:
//                     Colors.grey.shade200,
//
//                     valueColor:
//                     AlwaysStoppedAnimation(
//                       color,
//                     ),
//                   ),
//                 ),
//
//                 Text(
//                   value,
//
//                   style: TextStyle(
//                     color: color,
//
//                     fontSize: 26,
//
//                     fontWeight:
//                     FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           Text(
//             subtitle,
//
//             textAlign: TextAlign.center,
//
//             style: TextStyle(
//               color: Colors.grey.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // 🔷 CATEGORY PROGRESS
//   Widget _categoryProgress(
//       String title,
//       double value,
//       ) {
//     return Column(
//       crossAxisAlignment:
//       CrossAxisAlignment.start,
//
//       children: [
//         Row(
//           mainAxisAlignment:
//           MainAxisAlignment.spaceBetween,
//
//           children: [
//             Text(
//               title,
//
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//
//             Text(
//               "${value.toStringAsFixed(0)}%",
//             ),
//           ],
//         ),
//
//         const SizedBox(height: 10),
//
//         ClipRRect(
//           borderRadius:
//           BorderRadius.circular(10),
//
//           child: LinearProgressIndicator(
//             value: value / 100,
//
//             minHeight: 14,
//
//             backgroundColor:
//             Colors.grey.shade200,
//
//             valueColor:
//             const AlwaysStoppedAnimation(
//               darkBlue,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
//
// class AnalyticsScreen extends StatelessWidget {
//   const AnalyticsScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
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
//           const SizedBox(height: 20),
//
//           StreamBuilder<QuerySnapshot>(
//             stream:
//             FirebaseFirestore.instance
//                 .collection('items')
//                 .snapshots(),
//
//             builder: (context, itemsSnap) {
//               return StreamBuilder<QuerySnapshot>(
//                 stream:
//                 FirebaseFirestore.instance
//                     .collection('claims')
//                     .snapshots(),
//
//                 builder: (context, claimsSnap) {
//                   return StreamBuilder<QuerySnapshot>(
//                     stream:
//                     FirebaseFirestore.instance
//                         .collection('duplicate_alerts')
//                         .snapshots(),
//
//                     builder: (context, duplicateSnap) {
//                       if (!itemsSnap.hasData ||
//                           !claimsSnap.hasData ||
//                           !duplicateSnap.hasData) {
//                         return const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }
//
//                       final items = itemsSnap.data!.docs;
//                       final claims = claimsSnap.data!.docs;
//                       final duplicates =
//                           duplicateSnap.data!.docs;
//
//                       // 🔷 LOST / FOUND
//                       final lost = items.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['type'] == 'lost';
//                       }).length;
//
//                       final found = items.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['type'] == 'found';
//                       }).length;
//
//                       // 🔷 CLAIMS
//                       final approved = claims.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['status'] ==
//                             'claim approved';
//                       }).length;
//
//                       final pending = claims.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['status'] ==
//                             'claim pending';
//                       }).length;
//
//                       final rejected = claims.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['status'] ==
//                             'claim rejected';
//                       }).length;
//
//                       // 🔷 RETURNED ITEMS
//                       final returned = items.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['status'] ==
//                             'returned';
//                       }).length;
//
//                       // 🔷 FLAGGED ITEMS
//                       final flagged = items.where((d) {
//                         final data =
//                         d.data()
//                         as Map<String, dynamic>;
//
//                         return data['flagged'] == true;
//                       }).length;
//
//                       // 🔷 RECOVERY RATE
//                       final double recoveryRate =
//                       items.isEmpty
//                           ? 0.0
//                           : (returned /
//                           items.length) *
//                           100;
//
//                       // 🔷 UNCLAIMED ITEMS
//                       final unclaimedItems =
//                           items.where((d) {
//                             final data =
//                             d.data()
//                             as Map<String, dynamic>;
//
//                             return data['status'] !=
//                                 'returned';
//                           }).length;
//
//                       final double unclaimedRate =
//                       items.isEmpty
//                           ? 0.0
//                           : (unclaimedItems /
//                           items.length) *
//                           100;
//
//                       // 🔷 DUPLICATE ACCURACY
//                       final confirmedDuplicates =
//                           duplicates.where((d) {
//                             final data =
//                             d.data()
//                             as Map<String, dynamic>;
//
//                             return data['status'] ==
//                                 'confirmed';
//                           }).length;
//
//                       final double duplicateAccuracy =
//                       duplicates.isEmpty
//                           ? 0.0
//                           : (confirmedDuplicates /
//                           duplicates
//                               .length) *
//                           100;
//
//                       // 🔷 CATEGORY ANALYTICS
//                       final Map<String, int>
//                       categoryTotal = {};
//
//                       final Map<String, int>
//                       categoryReturned = {};
//
//                       for (var doc in items) {
//                         final data =
//                         doc.data()
//                         as Map<String, dynamic>;
//
//                         final category =
//                         (data['category'] ??
//                             'Other')
//                             .toString();
//
//                         final status =
//                             data['status'] ?? '';
//
//                         categoryTotal[category] =
//                             (categoryTotal[
//                             category] ??
//                                 0) +
//                                 1;
//
//                         if (status == "returned") {
//                           categoryReturned[
//                           category] =
//                               (categoryReturned[
//                               category] ??
//                                   0) +
//                                   1;
//                         }
//                       }
//
//                       return Column(
//                         crossAxisAlignment:
//                         CrossAxisAlignment.start,
//
//                         children: [
//                           // 🔷 TOP CHARTS
//                           Row(
//                             crossAxisAlignment:
//                             CrossAxisAlignment
//                                 .start,
//
//                             children: [
//                               // 🔵 ITEMS CHART
//                               Expanded(
//                                 flex: 2,
//
//                                 child: Container(
//                                   height: 350,
//
//                                   padding:
//                                   const EdgeInsets.all(
//                                     20,
//                                   ),
//
//                                   decoration:
//                                   BoxDecoration(
//                                     color: Colors.white,
//
//                                     borderRadius:
//                                     BorderRadius.circular(
//                                       16,
//                                     ),
//
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors
//                                             .black
//                                             .withOpacity(
//                                           0.05,
//                                         ),
//
//                                         blurRadius: 8,
//
//                                         offset:
//                                         const Offset(
//                                           0,
//                                           3,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment
//                                         .start,
//
//                                     children: [
//                                       const Text(
//                                         "Items Overview",
//
//                                         style: TextStyle(
//                                           fontSize: 18,
//
//                                           fontWeight:
//                                           FontWeight
//                                               .bold,
//                                         ),
//                                       ),
//
//                                       const SizedBox(
//                                         height: 30,
//                                       ),
//
//                                       Expanded(
//                                         child: BarChart(
//                                           BarChartData(
//                                             borderData:
//                                             FlBorderData(
//                                               show: false,
//                                             ),
//
//                                             gridData:
//                                             FlGridData(
//                                               show: true,
//                                             ),
//
//                                             titlesData:
//                                             FlTitlesData(
//                                               leftTitles:
//                                               AxisTitles(
//                                                 sideTitles:
//                                                 SideTitles(
//                                                   showTitles:
//                                                   true,
//                                                 ),
//                                               ),
//
//                                               rightTitles:
//                                               AxisTitles(
//                                                 sideTitles:
//                                                 SideTitles(
//                                                   showTitles:
//                                                   false,
//                                                 ),
//                                               ),
//
//                                               topTitles:
//                                               AxisTitles(
//                                                 sideTitles:
//                                                 SideTitles(
//                                                   showTitles:
//                                                   false,
//                                                 ),
//                                               ),
//
//                                               bottomTitles:
//                                               AxisTitles(
//                                                 sideTitles:
//                                                 SideTitles(
//                                                   showTitles:
//                                                   true,
//
//                                                   reservedSize:
//                                                   35,
//
//                                                   getTitlesWidget:
//                                                       (
//                                                       value,
//                                                       meta,
//                                                       ) {
//                                                     const labels =
//                                                     [
//                                                       "Lost",
//                                                       "Found",
//                                                     ];
//
//                                                     return Padding(
//                                                       padding:
//                                                       const EdgeInsets.only(
//                                                         top:
//                                                         10,
//                                                       ),
//
//                                                       child:
//                                                       Text(
//                                                         labels[value
//                                                             .toInt()],
//                                                       ),
//                                                     );
//                                                   },
//                                                 ),
//                                               ),
//                                             ),
//
//                                             barGroups: [
//                                               _barData(
//                                                 0,
//                                                 lost
//                                                     .toDouble(),
//                                               ),
//
//                                               _barData(
//                                                 1,
//                                                 found
//                                                     .toDouble(),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                               const SizedBox(width: 25),
//
//                               // 🟠 CLAIM CHART
//                               Expanded(
//                                 child: Container(
//                                   height: 350,
//
//                                   padding:
//                                   const EdgeInsets.all(
//                                     20,
//                                   ),
//
//                                   decoration:
//                                   BoxDecoration(
//                                     color: Colors.white,
//
//                                     borderRadius:
//                                     BorderRadius.circular(
//                                       16,
//                                     ),
//
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors
//                                             .black
//                                             .withOpacity(
//                                           0.05,
//                                         ),
//
//                                         blurRadius: 8,
//
//                                         offset:
//                                         const Offset(
//                                           0,
//                                           3,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment
//                                         .start,
//
//                                     children: [
//                                       const Text(
//                                         "Claims Status",
//
//                                         style: TextStyle(
//                                           fontSize: 18,
//
//                                           fontWeight:
//                                           FontWeight
//                                               .bold,
//                                         ),
//                                       ),
//
//                                       const SizedBox(
//                                         height: 15,
//                                       ),
//
//                                       Expanded(
//                                         child: PieChart(
//                                           PieChartData(
//                                             sectionsSpace:
//                                             3,
//
//                                             centerSpaceRadius:
//                                             40,
//
//                                             sections: [
//                                               PieChartSectionData(
//                                                 value:
//                                                 approved
//                                                     .toDouble(),
//
//                                                 color:
//                                                 Colors
//                                                     .green,
//
//                                                 title:
//                                                 approved
//                                                     .toString(),
//
//                                                 radius:
//                                                 60,
//                                               ),
//
//                                               PieChartSectionData(
//                                                 value:
//                                                 pending
//                                                     .toDouble(),
//
//                                                 color:
//                                                 Colors
//                                                     .orange,
//
//                                                 title:
//                                                 pending
//                                                     .toString(),
//
//                                                 radius:
//                                                 60,
//                                               ),
//
//                                               PieChartSectionData(
//                                                 value:
//                                                 rejected
//                                                     .toDouble(),
//
//                                                 color:
//                                                 Colors
//                                                     .red,
//
//                                                 title:
//                                                 rejected
//                                                     .toString(),
//
//                                                 radius:
//                                                 60,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment
//                                             .spaceEvenly,
//
//                                         children: [
//                                           _legend(
//                                             Colors.green,
//                                             "Approved",
//                                           ),
//
//                                           _legend(
//                                             Colors.orange,
//                                             "Pending",
//                                           ),
//
//                                           _legend(
//                                             Colors.red,
//                                             "Rejected",
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           const SizedBox(height: 35),
//
//                           // 🔷 PERFORMANCE
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: _progressCard(
//                                   title:
//                                   "Recovery Performance",
//
//                                   value:
//                                   "${recoveryRate.toStringAsFixed(0)}%",
//
//                                   subtitle:
//                                   "$returned items successfully returned",
//
//                                   progress:
//                                   recoveryRate /
//                                       100,
//
//                                   color: darkBlue,
//                                 ),
//                               ),
//
//                               const SizedBox(width: 20),
//
//                               Expanded(
//                                 child: _progressCard(
//                                   title:
//                                   "Unclaimed Inventory",
//
//                                   value:
//                                   "${unclaimedRate.toStringAsFixed(0)}%",
//
//                                   subtitle:
//                                   "$unclaimedItems items still waiting to be claimed",
//
//                                   progress:
//                                   unclaimedRate /
//                                       100,
//
//                                   color: Colors.orange,
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           const SizedBox(height: 35),
//
//                           // 🔷 CATEGORY TRENDS
//                           Container(
//                             width: double.infinity,
//
//                             padding:
//                             const EdgeInsets.all(
//                               20,
//                             ),
//
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//
//                               borderRadius:
//                               BorderRadius.circular(
//                                 16,
//                               ),
//
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black
//                                       .withOpacity(
//                                     0.05,
//                                   ),
//
//                                   blurRadius: 8,
//
//                                   offset:
//                                   const Offset(
//                                     0,
//                                     3,
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//                             child: Column(
//                               crossAxisAlignment:
//                               CrossAxisAlignment
//                                   .start,
//
//                               children: [
//                                 const Text(
//                                   "Category Recovery Trends",
//
//                                   style: TextStyle(
//                                     fontSize: 20,
//
//                                     fontWeight:
//                                     FontWeight.bold,
//                                   ),
//                                 ),
//
//                                 const SizedBox(
//                                   height: 30,
//                                 ),
//
//                                 ...categoryTotal.keys
//                                     .map(
//                                       (
//                                       category,
//                                       ) {
//                                     final total =
//                                         categoryTotal[
//                                         category] ??
//                                             0;
//
//                                     final returned =
//                                         categoryReturned[
//                                         category] ??
//                                             0;
//
//                                     final double rate =
//                                     total == 0
//                                         ? 0.0
//                                         : (returned /
//                                         total) *
//                                         100;
//
//                                     return Padding(
//                                       padding:
//                                       const EdgeInsets.only(
//                                         bottom: 25,
//                                       ),
//
//                                       child:
//                                       _categoryProgress(
//                                         "$category ($total items)",
//                                         rate,
//                                       ),
//                                     );
//                                   },
//                                 ).toList(),
//                               ],
//                             ),
//                           ),
//
//                           const SizedBox(height: 35),
//
//                           // 🔷 AI SECTION
//                           Row(
//                             children: [
//                               _analyticsCard(
//                                 title:
//                                 "AI Duplicate Accuracy",
//
//                                 value:
//                                 "${duplicateAccuracy.toStringAsFixed(0)}%",
//
//                                 icon:
//                                 Icons.auto_awesome,
//
//                                 color:
//                                 Colors.purple,
//                               ),
//
//                               const SizedBox(width: 20),
//
//                               _analyticsCard(
//                                 title:
//                                 "Confirmed Duplicates",
//
//                                 value:
//                                 "$confirmedDuplicates",
//
//                                 icon: Icons.verified,
//
//                                 color:
//                                 Colors.orange,
//                               ),
//
//                               const SizedBox(width: 20),
//
//                               _analyticsCard(
//                                 title:
//                                 "Flagged Items",
//
//                                 value: "$flagged",
//
//                                 icon: Icons.flag,
//
//                                 color: Colors.red,
//                               ),
//                             ],
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
//   // 🔷 BAR DATA
//   static BarChartGroupData _barData(
//       int x,
//       double y,
//       ) {
//     return BarChartGroupData(
//       x: x,
//
//       barRods: [
//         BarChartRodData(
//           toY: y,
//
//           width: 18,
//
//           borderRadius:
//           BorderRadius.circular(6),
//
//           color: darkBlue,
//         ),
//       ],
//     );
//   }
//
//   // 🔷 LEGEND
//   static Widget _legend(
//       Color color,
//       String text,
//       ) {
//     return Row(
//       children: [
//         Container(
//           width: 14,
//           height: 14,
//
//           decoration: BoxDecoration(
//             color: color,
//             shape: BoxShape.circle,
//           ),
//         ),
//
//         const SizedBox(width: 6),
//
//         Text(
//           text,
//
//           style: const TextStyle(
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   }
//
//   // 🔷 ANALYTICS CARD
//   Widget _analyticsCard({
//     required String title,
//     required String value,
//     required IconData icon,
//     required Color color,
//   }) {
//     return Expanded(
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
//               color: Colors.black.withOpacity(
//                 0.05,
//               ),
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
//             Container(
//               padding: const EdgeInsets.all(14),
//
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.15),
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
//                     fontSize: 22,
//
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
//
//   // 🔷 PROGRESS CARD
//   Widget _progressCard({
//     required String title,
//     required String value,
//     required String subtitle,
//     required double progress,
//     required Color color,
//   }) {
//     return Container(
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
//             color: Colors.black.withOpacity(
//               0.05,
//             ),
//
//             blurRadius: 8,
//
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//
//       child: Column(
//         children: [
//           Text(
//             title,
//
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           const SizedBox(height: 25),
//
//           SizedBox(
//             height: 150,
//             width: 150,
//
//             child: Stack(
//               alignment: Alignment.center,
//
//               children: [
//                 SizedBox(
//                   height: 150,
//                   width: 150,
//
//                   child:
//                   CircularProgressIndicator(
//                     value: progress,
//
//                     strokeWidth: 10,
//
//                     backgroundColor:
//                     Colors.grey.shade200,
//
//                     valueColor:
//                     AlwaysStoppedAnimation(
//                       color,
//                     ),
//                   ),
//                 ),
//
//                 Text(
//                   value,
//
//                   style: TextStyle(
//                     color: color,
//
//                     fontSize: 26,
//
//                     fontWeight:
//                     FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           Text(
//             subtitle,
//
//             textAlign: TextAlign.center,
//
//             style: TextStyle(
//               color: Colors.grey.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // 🔷 CATEGORY PROGRESS
//   Widget _categoryProgress(
//       String title,
//       double value,
//       ) {
//     return Column(
//       crossAxisAlignment:
//       CrossAxisAlignment.start,
//
//       children: [
//         Row(
//           mainAxisAlignment:
//           MainAxisAlignment.spaceBetween,
//
//           children: [
//             Text(
//               title,
//
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//
//             Text(
//               "${value.toStringAsFixed(0)}%",
//             ),
//           ],
//         ),
//
//         const SizedBox(height: 10),
//
//         ClipRRect(
//           borderRadius:
//           BorderRadius.circular(10),
//
//           child: LinearProgressIndicator(
//             value: value / 100,
//
//             minHeight: 14,
//
//             backgroundColor:
//             Colors.grey.shade200,
//
//             valueColor:
//             const AlwaysStoppedAnimation(
//               darkBlue,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
// Connects your app to Firebase Firestore database
import 'package:fl_chart/fl_chart.dart';
// Used for charts
// Bar chart (Lost/Found)
// Pie chart (Claims status)

import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  static const Color darkBlue = Color(0xFF2A417F);
  static const Color orange = Color(0xFFF09E27);
  static const Color bgColor = Color(0xFFEFF5FB);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(25),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const SizedBox(height: 20),

          StreamBuilder<QuerySnapshot>(
            stream:
            FirebaseFirestore.instance
                .collection('items')
                .snapshots(),

            builder: (context, itemsSnap) {
              return StreamBuilder<QuerySnapshot>(
                stream:
                FirebaseFirestore.instance
                    .collection('claims')
                    .snapshots(),

                builder: (context, claimsSnap) {
                  return StreamBuilder<QuerySnapshot>(
                    stream:
                    FirebaseFirestore.instance
                        .collection('duplicate_alerts')
                        .snapshots(),
                    // It stores things like
                    // Current data
                    // Loading state
                    // Errors
                    // Whether stream has data or not

                    builder: (context, duplicateSnap) {
                      if (!itemsSnap.hasData ||
                          !claimsSnap.hasData ||
                          !duplicateSnap.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final items = itemsSnap.data!.docs;
                      final claims = claimsSnap.data!.docs;
                      final duplicates =
                          duplicateSnap.data!.docs;

                      // 🔷 LOST / FOUND
                      final lost = items.where((d) {
                        final data =
                        d.data()
                        as Map<String, dynamic>;

                        return data['type'] == 'lost';
                      }).length;

                      final found = items.where((d) {
                        final data =
                        d.data()
                        as Map<String, dynamic>;

                        return data['type'] == 'found';
                      }).length;

                      // 🔷 CLAIMS
                      final approved = claims.where((d) {
                        final data =
                        d.data()
                        as Map<String, dynamic>;

                        return data['status'] ==
                            'claim approved';
                      }).length;

                      final pending = claims.where((d) {
                        final data =
                        d.data()
                        as Map<String, dynamic>;

                        return data['status'] ==
                            'claim pending';
                      }).length;

                      final rejected = claims.where((d) {
                        final data =
                        d.data()
                        as Map<String, dynamic>;

                        return data['status'] ==
                            'claim rejected';
                      }).length;

                      // 🔷 RETURNED ITEMS
                      final returned = items.where((d) {
                        final data =
                        d.data()
                        as Map<String, dynamic>;

                        return data['status'] ==
                            'returned';
                      }).length;

                      // 🔷 FLAGGED ITEMS
                      final flagged = items.where((d) {
                        final data =
                        d.data()
                        as Map<String, dynamic>;

                        return data['flagged'] == true;
                      }).length;

                      // 🔷 RECOVERY RATE
                      final double recoveryRate =
                      items.isEmpty
                          ? 0.0
                          : (returned /
                          items.length) *
                          100;

                      // 🔷 UNCLAIMED ITEMS
                      final unclaimedItems =
                          items.where((d) {
                            final data =
                            d.data()
                            as Map<String, dynamic>;

                            return data['status'] !=
                                'returned';
                          }).length;

                      final double unclaimedRate =
                      items.isEmpty
                          ? 0.0
                          : (unclaimedItems /
                          items.length) *
                          100;

                      // 🔷 DUPLICATE ACCURACY
                      final confirmedDuplicates =
                          duplicates.where((d) {
                            final data =
                            d.data()
                            as Map<String, dynamic>;

                            return data['status'] ==
                                'confirmed';
                          }).length;

                      final double duplicateAccuracy =
                      duplicates.isEmpty
                          ? 0.0
                          : (confirmedDuplicates /
                          duplicates.length) *
                          100;

                      // 🔷 CATEGORY ANALYTICS
                      final List<String> allCategories = [
                        "Student ID Card",
                        "Keys",
                        "Electronics",
                        "Clothing",
                        "Documents",
                        "Other",
                      ];

                      final Map<String, int>
                      categoryTotal = {
                        for (var category
                        in allCategories)
                          category: 0,
                      };



                      // Keys → 0
                      // Electronics → 0
                      // Clothing → 0

                      for (var doc in items) {
                        final data =
                        doc.data()
                        as Map<String, dynamic>;

                        final category =
                        (data['category'] ??
                            'Other')
                            .toString();
                        // // 👉 Gets category from Firestore
                        // 👉 If missing → "Other"
                        // 👉 Creates a map like

                        if (categoryTotal
                            .containsKey(
                          category,
                        )) {
                          categoryTotal[category] =
                              categoryTotal[
                              category]! +
                                  1;
                        //   If category exists → increase count
                        } else {
                          categoryTotal["Other"] =
                              categoryTotal[
                              "Other"]! +
                                  1;
                        //Otherwise add to Other
                        }
                      }

                      return Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [
                          // 🔷 TOP CHARTS
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                            children: [
                              // 🔵 ITEMS CHART
                              Expanded(
                                flex: 2,

                                child: Container(
                                  height: 350,

                                  padding:
                                  const EdgeInsets.all(
                                    20,
                                  ),

                                  decoration:
                                  BoxDecoration(
                                    color: Colors.white,

                                    borderRadius:
                                    BorderRadius.circular(
                                      16,
                                    ),

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors
                                            .black
                                            .withOpacity(
                                          0.05,
                                        ),

                                        blurRadius: 8,

                                        offset:
                                        const Offset(
                                          0,
                                          3,
                                        ),
                                      ),
                                    ],
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,

                                    children: [
                                      const Text(
                                        "Items Overview",

                                        style: TextStyle(
                                          fontSize: 18,

                                          fontWeight:
                                          FontWeight
                                              .bold,
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 30,
                                      ),

                                      Expanded(
                                        child: BarChart(
                                          BarChartData(
                                            borderData:
                                            FlBorderData(
                                              show: false,
                                            ),
                                            // border= false

                                            gridData:
                                            FlGridData(
                                              show: true,
                                            ),
                                            // grid = true

                                            titlesData:
                                            FlTitlesData(
                                              leftTitles:
                                              AxisTitles(
                                                sideTitles:
                                                SideTitles(
                                                  showTitles:
                                                  true,
                                                ),
                                              ),

                                              rightTitles:
                                              AxisTitles(
                                                sideTitles:
                                                SideTitles(
                                                  showTitles:
                                                  false,
                                                ),
                                              ),

                                              topTitles:
                                              AxisTitles(
                                                sideTitles:
                                                SideTitles(
                                                  showTitles:
                                                  false,
                                                ),
                                              ),

                                              bottomTitles:
                                              AxisTitles(
                                                sideTitles:
                                                SideTitles(
                                                  showTitles:
                                                  true,

                                                  reservedSize:
                                                  35,// bcz lost and found are not was not visible..

                                                  getTitlesWidget:
                                                      (
                                                      value,
                                                      meta,
                                                      ) {
                                                    const labels =
                                                    [
                                                      "Lost",
                                                      "Found",
                                                    ];

                                                    return Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                        top:
                                                        10,
                                                      ),

                                                      child:
                                                      Text(
                                                        labels[value
                                                            .toInt()],
                                                      ),
                                                    // one time lost will be sent and one time found will be sent
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),

                                            barGroups: [
                                              _barData(
                                                0,
                                                lost
                                                    .toDouble(),
                                              ),

                                              _barData(
                                                1,
                                                found
                                                    .toDouble(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(width: 25),

                              // 🟠 CLAIM CHART
                              Expanded(
                                child: Container(
                                  height: 350,

                                  padding:
                                  const EdgeInsets.all(
                                    20,
                                  ),

                                  decoration:
                                  BoxDecoration(
                                    color: Colors.white,

                                    borderRadius:
                                    BorderRadius.circular(
                                      16,
                                    ),

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors
                                            .black
                                            .withOpacity(
                                          0.05,
                                        ),

                                        blurRadius: 8,

                                        offset:
                                        const Offset(
                                          0,
                                          3,
                                        ),
                                      ),
                                    ],
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,

                                    children: [
                                      const Text(
                                        "Claims Status",

                                        style: TextStyle(
                                          fontSize: 18,

                                          fontWeight:
                                          FontWeight
                                              .bold,
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 15,
                                      ),

                                      Expanded(
                                        child: PieChart(
                                          PieChartData(
                                            sectionsSpace:
                                            3, // white space btw sections

                                            centerSpaceRadius:
                                            40,
                                            // circle btw piechart..

                                            sections: [
                                              PieChartSectionData(
                                                value:
                                                approved
                                                    .toDouble(),

                                                color:
                                                Colors
                                                    .green,

                                                title:
                                                approved
                                                    .toString(),

                                                radius:
                                                60,
                                              ),

                                              PieChartSectionData(
                                                value:
                                                pending
                                                    .toDouble(),

                                                color:
                                                Colors
                                                    .orange,

                                                title:
                                                pending
                                                    .toString(),

                                                radius:
                                                60,
                                              ),

                                              PieChartSectionData(
                                                value:
                                                rejected
                                                    .toDouble(),

                                                color:
                                                Colors
                                                    .red,

                                                title:
                                                rejected
                                                    .toString(),

                                                radius:
                                                60,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 10,
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceEvenly,

                                        children: [
                                          _legend(
                                            Colors.green,
                                            "Approved",
                                          ),

                                          _legend(
                                            Colors.orange,
                                            "Pending",
                                          ),

                                          _legend(
                                            Colors.red,
                                            "Rejected",
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 35),

                          // 🔷 PERFORMANCE
                          Row(
                            children: [
                              Expanded(
                                child: _progressCard(
                                  title:
                                  "Recovery Performance",

                                  value:
                                  "${recoveryRate.toStringAsFixed(0)}%",
                                  // recoveryRate is a number (double)
                                  // toStringAsFixed(0) removes decimal places

                                  subtitle:
                                  "$returned items successfully returned",

                                  progress:
                                  recoveryRate /
                                      100,

                                  color: darkBlue,
                                ),
                              ),

                              const SizedBox(width: 20),

                              Expanded(
                                child: _progressCard(
                                  title:
                                  "Unclaimed Inventory",

                                  value:
                                  "${unclaimedRate.toStringAsFixed(0)}%",

                                  subtitle:
                                  "$unclaimedItems items still waiting to be claimed",

                                  progress:
                                  unclaimedRate /
                                      100,

                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 35),

                          // 🔷 CATEGORY TRENDS
                          Container(
                            width: double.infinity,

                            padding:
                            const EdgeInsets.all(
                              20,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius:
                              BorderRadius.circular(
                                16,
                              ),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(
                                    0.05,
                                  ),

                                  blurRadius: 8,

                                  offset:
                                  const Offset(
                                    0,
                                    3,
                                  ),
                                ),
                              ],
                            ),

                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                              children: [
                                const Text(
                                  "Category Trends",

                                  style: TextStyle(
                                    fontSize: 20,

                                    fontWeight:
                                    FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(
                                  height: 30,
                                ),


                                // {
                                //   "studnt id card": 5,
                                //   "keys": 5,
                                //
                                //
                                // }
                                ...categoryTotal.keys.map(
                                      (category) {

                                    final total =
                                    categoryTotal[
                                        category] ??
                                            0;

                                    final maxValue =
                                    categoryTotal
                                        .values
                                        .isEmpty
                                        ? 1
                                        : categoryTotal
                                        .values
                                        .reduce(
                                          (a, b) =>
                                      a > b
                                          ? a
                                          : b,
                                    //Compares all values and keeps the largest one.
                                    );

                                    final double progress =
                                    maxValue == 0
                                        ? 0
                                        : total /
                                        maxValue;

                                    return Padding(
                                      padding:
                                      const EdgeInsets.only(
                                        bottom: 25,
                                      ),

                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,

                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,

                                            children: [
                                              Text(
                                                category,

                                                style:
                                                const TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,

                                                  fontSize:
                                                  16,
                                                ),
                                              ),

                                              Text(
                                                "$total items",

                                                style:
                                                const TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .w600,
                                                ),
                                              ),
                                            ],
                                          ),

                                          const SizedBox(
                                            height: 10,
                                          ),

                                          ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(
                                              10,
                                            ),

                                            child:
                                            LinearProgressIndicator(
                                              // horizontal progress bar
                                              value:
                                              progress, //Controls how filled the bar is.
                                              // 0.0 → empty
                                              // 1.0 → full

                                              minHeight:
                                              14,

                                              backgroundColor:
                                              Colors
                                                  .grey
                                                  .shade200,

                                              valueColor: // color of filled part of is
                                              const AlwaysStoppedAnimation(
                                                darkBlue, //AlwaysStoppedAnimation is used because the color stays constant instead of animating.
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ).toList(),
                              ],
                            ),
                          ),

                          const SizedBox(height: 35),

                          // 🔷 AI SECTION
                          Row(
                            children: [
                              _analyticsCard(
                                title:
                                "AI Duplicate Accuracy",

                                value:
                                "${duplicateAccuracy.toStringAsFixed(0)}%",

                                icon:
                                Icons.auto_awesome,

                                color:
                                Colors.purple,
                              ),

                              const SizedBox(width: 20),

                              _analyticsCard(
                                title:
                                "Confirmed Duplicates",

                                value:
                                "$confirmedDuplicates",

                                icon: Icons.verified,

                                color:
                                Colors.orange,
                              ),

                              const SizedBox(width: 20),

                              _analyticsCard(
                                title:
                                "Flagged Items",

                                value: "$flagged",

                                icon: Icons.flag,

                                color: Colors.red,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  // 🔷 BAR DATA
  static BarChartGroupData _barData(
      int x,
      double y,
      ) {
    return BarChartGroupData(
      x: x,

      barRods: [
        BarChartRodData(
          toY: y,

          width: 18,

          borderRadius:
          BorderRadius.circular(6),

          color: darkBlue,
        ),
      ],
    );
  }

  // 🔷 LEGEND
  static Widget _legend(
      Color color,
      String text,
      ) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,

          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),

        const SizedBox(width: 6),

        Text(
          text,

          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // 🔷 ANALYTICS CARD
  Widget _analyticsCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
          BorderRadius.circular(16),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.05,
              ),

              blurRadius: 8,

              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),

              decoration: BoxDecoration(
                color: color.withOpacity(0.15),

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

            Column(
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
                    fontSize: 22,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔷 PROGRESS CARD
  Widget _progressCard({
    required String title,
    required String value,
    required String subtitle,
    required double progress,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
        BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              0.05,
            ),

            blurRadius: 8, //lurRadius is used mostly in shadows to control how blurry or soft the shadow looks.


            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        children: [
          Text(
            title,

            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          SizedBox(
            height: 150,
            width: 150,

            child: Stack(
              alignment: Alignment.center,

              children: [
                SizedBox(
                  height: 150,
                  width: 150,

                  child:
                  CircularProgressIndicator(
                    value: progress,

                    strokeWidth: 10,

                    backgroundColor:
                    Colors.grey.shade200,

                    valueColor:
                    AlwaysStoppedAnimation(
                      color,
                    ),
                  ),
                ),

                Text(
                  value,

                  style: TextStyle(
                    color: color,

                    fontSize: 26,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Text(
            subtitle,

            textAlign: TextAlign.center,

            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
