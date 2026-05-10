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


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
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

          // const Text(
          //   "Analytics",
          //   style: TextStyle(
          //     fontSize: 28,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),

          const SizedBox(height: 30),

          // 🔥 FIREBASE DATA WRAPPER
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('items').snapshots(),

            builder: (context, itemsSnap) {
              return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('claims').snapshots(),

                builder: (context, claimsSnap) {

                  if (!itemsSnap.hasData || !claimsSnap.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final items = itemsSnap.data!.docs;
                  final claims = claimsSnap.data!.docs;

                  // 🔷 ITEMS STATS
                  final lost = items.where((d) {
                    final data = d.data() as Map<String, dynamic>;
                    return data['type'] == 'lost';
                  }).length;

                  final found = items.where((d) {
                    final data = d.data() as Map<String, dynamic>;
                    return data['type'] == 'found';
                  }).length;

                  // 🔷 CLAIM STATS
                  final approved = claims.where((d) {
                    final data = d.data() as Map<String, dynamic>;
                    return data['status'] == 'claim approved';
                  }).length;

                  final pending = claims.where((d) {
                    final data = d.data() as Map<String, dynamic>;
                    return data['status'] == 'claim pending';
                  }).length;

                  final rejected = claims.where((d) {
                    final data = d.data() as Map<String, dynamic>;
                    return data['status'] == 'claim rejected';
                  }).length;

                  // 🔷 AI SCORE (from similarity field if exists)
                  double totalScore = 0;
                  int count = 0;

                  for (var doc in items) {
                    final data = doc.data() as Map<String, dynamic>;

                    if (data['similarity'] != null) {
                      totalScore += (data['similarity'] * 100);
                      count++;
                    }
                  }

                  final avgScore = count == 0 ? 0 : totalScore / count;

                  return Column(
                    children: [

                      // 🔷 CHARTS ROW
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // 🔵 BAR CHART
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 350,
                              padding: const EdgeInsets.all(20),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  const Text(
                                    "Items Overview",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 30),

                                  Expanded(
                                    child: BarChart(
                                      BarChartData(
                                        borderData: FlBorderData(show: false),
                                        gridData: FlGridData(show: true),

                                        titlesData: FlTitlesData(
                                          leftTitles: AxisTitles(
                                            sideTitles: SideTitles(showTitles: true),
                                          ),
                                          rightTitles: AxisTitles(
                                            sideTitles: SideTitles(showTitles: false),
                                          ),
                                          topTitles: AxisTitles(
                                            sideTitles: SideTitles(showTitles: false),
                                          ),

                                          bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              getTitlesWidget: (value, meta) {
                                                const labels = ["Lost", "Found"];

                                                return Padding(
                                                  padding: const EdgeInsets.only(top: 8),
                                                  child: Text(labels[value.toInt()]),
                                                );
                                              },
                                            ),
                                          ),
                                        ),

                                        barGroups: [
                                          _barData(0, lost.toDouble()),
                                          _barData(1, found.toDouble()),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(width: 25),

                          // 🟠 PIE CHART
                          Expanded(
                            child: Container(
                              height: 350,
                              padding: const EdgeInsets.all(20),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  const Text(
                                    "Claims Status",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  Expanded(
                                    child: PieChart(
                                      PieChartData(
                                        sectionsSpace: 3,
                                        centerSpaceRadius: 40,

                                        sections: [
                                          PieChartSectionData(
                                            value: approved.toDouble(),
                                            color: Colors.green,
                                            title: "A",
                                            radius: 60,
                                          ),
                                          PieChartSectionData(
                                            value: pending.toDouble(),
                                            color: Colors.orange,
                                            title: "P",
                                            radius: 60,
                                          ),
                                          PieChartSectionData(
                                            value: rejected.toDouble(),
                                            color: Colors.red,
                                            title: "R",
                                            radius: 60,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // 🔷 AI SECTION
                      const Text(
                        "AI Matching Performance",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [

                          _analyticsCard(
                            title: "Avg Match Score",
                            value: "${avgScore.toStringAsFixed(1)}%",
                            icon: Icons.analytics,
                            color: Colors.blue,
                          ),

                          const SizedBox(width: 20),

                          _analyticsCard(
                            title: "Lost Items",
                            value: "$lost",
                            icon: Icons.search_off,
                            color: Colors.red,
                          ),

                          const SizedBox(width: 20),

                          _analyticsCard(
                            title: "Found Items",
                            value: "$found",
                            icon: Icons.check_circle,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
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
  static BarChartGroupData _barData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 18,
          borderRadius: BorderRadius.circular(6),
          color: darkBlue,
        ),
      ],
    );
  }

  // 🔷 CARD WIDGET
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
          borderRadius: BorderRadius.circular(16),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
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
                borderRadius: BorderRadius.circular(14),
              ),

              child: Icon(icon, color: color, size: 30),
            ),

            const SizedBox(width: 18),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 8),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
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