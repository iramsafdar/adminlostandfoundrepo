// import 'package:flutter/material.dart';
//
// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child:Row(
//           children: [
//             // Sidebar(),
//             Expanded(
//               child: Column(
//                 children: [
//                   // TopBar(),
//                   Expanded(
//                     child : Text("dASHBOARD"),
//                     // child: DashboardContent(),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         )
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// import '../../widgets/sidebar.dart';
// // import '../widgets/sidebar.dart';
//
// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});
//
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: bgColor,
//
//       body: Row(
//         children: [
//
//           // 🔷 SIDEBAR
//           const Sidebar(selectedIndex: 0),
//
//           // 🔷 MAIN CONTENT
//           Expanded(
//             child: Center(
//               child: Text(
//                 "Dashboard Content",
//                 style: TextStyle(
//                   fontSize: 26,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
//
// import '../../widgets/dashboardcard.dart';
// import '../../widgets/sidebar.dart';
// import '../../widgets/topbar.dart';
// // import '../widgets/sidebar.dart';
// // import '../widgets/topbar.dart';
//
// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});
//
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: bgColor,
//
//       body: Row(
//         children: [
//
//           // 🔷 SIDEBAR
//           const Sidebar(selectedIndex: 0),
//
//           // 🔷 RIGHT SIDE
//           Expanded(
//             child: Column(
//               children: [
//
//                 // 🔷 TOP BAR
//                 const TopBar(title: "Dashboard"),
//
//                 // 🔷 MAIN CONTENT
//                 //Expanded tells Flutter
//                 // "Give this widget as much extra space as possible."
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(25),
//                     // Creates a grid layout (like cards in rows & columns).
//                     //change 1✅✅✅✅✅✅
//                     child: SingleChildScrollView(
//                       padding: const EdgeInsets.all(25),
//
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//
//                         children: [
//
//                           // 🔷 DASHBOARD CARDS
//                           GridView.count(
//                             crossAxisCount: 4,
//                             crossAxisSpacing: 20,
//                             mainAxisSpacing: 20,
//                             childAspectRatio: 1.8,
//
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//
//                             children: const [
//
//                               DashboardCard(
//                                 title: "Total Users",
//                                 value: "245",
//                                 icon: Icons.people,
//                                 color: Colors.blue,
//                               ),
//
//                               DashboardCard(
//                                 title: "Lost Items",
//                                 value: "120",
//                                 icon: Icons.search_off,
//                                 color: Colors.orange,
//                               ),
//
//                               DashboardCard(
//                                 title: "Found Items",
//                                 value: "98",
//                                 icon: Icons.inventory_2,
//                                 color: Colors.green,
//                               ),
//
//                               DashboardCard(
//                                 title: "Pending Claims",
//                                 value: "15",
//                                 icon: Icons.pending_actions,
//                                 color: Colors.red,
//                               ),
//                             ],
//                           ),
//
//                           const SizedBox(height: 35),
//
//                           // 🔷 RECENT ACTIVITY TITLE
//                           const Text(
//                             "Recent Activity",
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//
//                           const SizedBox(height: 20),
//
//                           // 🔷 ACTIVITY TABLE
//                           Container(
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
//                             child: DataTable(
//
//                               columns: const [
//
//                                 DataColumn(
//                                   label: Text(
//                                     "User",
//                                     style: TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//
//                                 DataColumn(
//                                   label: Text(
//                                     "Action",
//                                     style: TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//
//                                 DataColumn(
//                                   label: Text(
//                                     "Item",
//                                     style: TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//
//                                 DataColumn(
//                                   label: Text(
//                                     "Time",
//                                     style: TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ],
//
//                               rows: const [
//
//                                 DataRow(
//                                   cells: [
//                                     DataCell(Text("Ali")),
//                                     DataCell(Text("Posted Lost Item")),
//                                     DataCell(Text("Wallet")),
//                                     DataCell(Text("2 mins ago")),
//                                   ],
//                                 ),
//
//                                 DataRow(
//                                   cells: [
//                                     DataCell(Text("Sara")),
//                                     DataCell(Text("Claim Approved")),
//                                     DataCell(Text("Phone")),
//                                     DataCell(Text("5 mins ago")),
//                                   ],
//                                 ),
//
//                                 DataRow(
//                                   cells: [
//                                     DataCell(Text("Ahmed")),
//                                     DataCell(Text("Found Item Uploaded")),
//                                     DataCell(Text("Keys")),
//                                     DataCell(Text("10 mins ago")),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // GridView.count(
//                     //   crossAxisCount: 4,
//                     //   //👉 4 cards per row
//                     //   crossAxisSpacing: 20,
//                     //   // horizontal gap between cards = 20px
//                     //   mainAxisSpacing: 20,
//                     //   // Vertical gap between rows = 20px
//                     //   childAspectRatio: 1.8,
//                     //   //Controls shape of cards:width / height = 1. So cards become wider than taller
//                     //
//                     //   children: const [
//                     //
//                     //     DashboardCard(
//                     //       title: "Total Users",
//                     //       value: "245",
//                     //       icon: Icons.people,
//                     //       color: Colors.blue,
//                     //     ),
//                     //
//                     //     DashboardCard(
//                     //       title: "Lost Items",
//                     //       value: "120",
//                     //       icon: Icons.search_off,
//                     //       color: Colors.orange,
//                     //     ),
//                     //
//                     //     DashboardCard(
//                     //       title: "Found Items",
//                     //       value: "98",
//                     //       icon: Icons.inventory_2,
//                     //       color: Colors.green,
//                     //     ),
//                     //
//                     //     DashboardCard(
//                     //       title: "Pending Claims",
//                     //       value: "15",
//                     //       icon: Icons.pending_actions,
//                     //       color: Colors.red,
//                     //     ),
//                     //   ],
//                     // ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:adminpanellostandfound/ui/screens/userscreen.dart';
import 'package:flutter/material.dart';

import '../../widgets/sidebar.dart';
import '../../widgets/topbar.dart';
// import '../widgets/sidebar.dart';
// import '../widgets/topbar.dart';

import 'package:adminpanellostandfound/ui/screens/userscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/sidebar.dart';
import '../../widgets/topbar.dart';
import 'aimatchscreen.dart';
import 'analyticsscreen.dart';
import 'broadcast_screen.dart';
import 'claimscreen.dart';
import 'dashboardhomescreen.dart';
import 'itemscreen.dart';
// import 'users/usersscreen.dart';
// import 'items/itemsscreen.dart';
// import 'claims/claimsscreen.dart';
// import 'dashboard/analyticsscreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int selectedIndex = 0;

  // 🔷 LIST OF SCREENS
  final List<Widget> screens = [

    // DASHBOARD HOME
    const Center(
      child: DashboardHomeScreen(),
    ),

    const ItemsScreen(),

    const UsersScreen(),

    // const ClaimsScreen(),

    const AnalyticsScreen(),
    const AIMatchScreen(),
    const BroadcastScreen(),
  ];

  // 🔷 PAGE TITLES
  final List<String> titles = [
    "Dashboard",
    "Manage Items",
    "Manage Users",
    // "Claims",
    "Analytics",
    "AI Match Monitoring",
    "Broadcast Notification",
  ];

  static const Color bgColor = Color(0xFFEFF5FB);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: bgColor,

      body: Row(
        children: [

          // 🔷 SIDEBAR
          Sidebar(
            selectedIndex: selectedIndex,

            onItemSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),

          // 🔷 RIGHT SIDE
          Expanded(
            child: Column(
              children: [

                // 🔷 TOPBAR
                TopBar(
                  title: titles[selectedIndex],
                ),

                // 🔷 DYNAMIC CONTENT
                Expanded(
                  child: screens[selectedIndex],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


