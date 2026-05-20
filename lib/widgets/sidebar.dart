// import 'package:flutter/material.dart';
// // Imports Flutter’s Material Design package.Gives access to widgets like: Container Column ListTile Icon Text
//
//
// class Sidebar extends StatelessWidget {
//   final int selectedIndex;
//   //"Store a function that takes an integer."
//   final Function(int) onItemSelected;
//   // Stores which menu item is currently selected.
//   // Example:
//   // 0 → Dashboard selected
//   // 1 → Manage Items selected
//
//   const Sidebar({
//     super.key,
//     required this.selectedIndex,
//     required this.onItemSelected,
//   });
//
//   // 🎨 YOUR APP COLORS
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//     // build() creates the UI.
//     return Container(
//       width: 260,
//       color: darkBlue,
//
//       child: Column(
//         children: [
//
//           // 🔷 LOGO AREA
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 30),
//             child: const Column(
//               children: [
//
//                 Icon(
//                   Icons.admin_panel_settings,
//                   color: orange,
//                   size: 50,
//                 ),
//
//                 SizedBox(height: 10),
//
//                 Text(
//                   "LOST & FOUND",
//                   style: TextStyle(
//                     color: bgColor,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 1, //Adds spacing between letters.
//                   ),
//                 ),
//
//                 SizedBox(height: 5),
//
//                 Text(
//                   "Admin Panel",
//                   style: TextStyle(
//                     color: Colors.white70,
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           const Divider(
//             color: Colors.white24,
//             thickness: 1,
//           ),
//           // Creates horizontal line.
//
//           const SizedBox(height: 10),
//
//           // 📌 MENU ITEMS
//           SidebarItem(
//             icon: Icons.dashboard,
//             title: "Dashboard",
//             isSelected: selectedIndex == 0,
//             onTap: () => onItemSelected(0),
//           //   When clicked:
//             // calls function
//             // sends value 0
//           ),
//
//           SidebarItem(
//             icon: Icons.inventory_2,
//             title: "Manage Items",
//             isSelected: selectedIndex == 1,
//             onTap: () => onItemSelected(1),
//           ),
//
//           SidebarItem(
//             icon: Icons.people,
//             title: "Manage Users",
//             isSelected: selectedIndex == 2,
//             onTap: () => onItemSelected(2),
//           ),
//
//           SidebarItem(
//             icon: Icons.assignment_turned_in,
//             title: "Claims",
//             isSelected: selectedIndex == 3,
//             onTap: () => onItemSelected(3),
//           ),
//
//           SidebarItem(
//             icon: Icons.analytics,
//             title: "Analytics",
//             isSelected: selectedIndex == 4,
//             onTap: () => onItemSelected(4),
//           ),
//
//           const Spacer(),
//     // Pushes remaining widgets to bottom.
//     // Without this:
//     // logout button would stay near analytics.
//
//           const Divider(
//             color: Colors.white24,
//             thickness: 1,
//           ),
//
//           SidebarItem(
//             icon: Icons.logout,
//             title: "Logout",
//             isSelected: false,
//             onTap: () => (){},
//
//           ),
//
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }
//
// //custom widget
// class SidebarItem extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final bool isSelected;
//   final VoidCallback onTap;
//
//   // these things are needed
//   const SidebarItem({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.isSelected,
//     required this.onTap,
//   });
//
//   static const Color orange = Color(0xFFF09E27);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(
//         horizontal: 12,
//         vertical: 4,
//       ),
//
//       decoration: BoxDecoration(
//         color: isSelected
//             ? Colors.white.withOpacity(0.15)
//             : Colors.transparent,
//
//         borderRadius: BorderRadius.circular(12),
//       ),
//
//       child: ListTile(
//         leading: Icon(
//           icon,
//           color: isSelected ? orange : Colors.white70,
//         ),
//
//         title: Text(
//           title,
//           style: TextStyle(
//             color: isSelected
//                 ? Colors.white
//                 : Colors.white70,
//
//             fontWeight: isSelected
//                 ? FontWeight.bold
//                 : FontWeight.normal,
//           ),
//         ),
//
//         onTap: onTap,
//       ),
//     );
//   }
// }



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../ui/screens/loginscreen.dart';

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const Sidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  // 🎨 COLORS (unchanged)
  static const Color darkBlue = Color(0xFF2A417F);
  static const Color orange = Color(0xFFF09E27);
  static const Color bgColor = Color(0xFFEFF5FB);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 260,

      // ✅ FIX 1: Prevent overflow on small screens
      height: double.infinity,

      color: darkBlue,

      child: Column(
        children: [

          // ================= HEADER =================
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: const Column(
              children: [


                Icon(
                  Icons.search,
                  color: orange,
                  size: 38,

                ),

                SizedBox(height: 10),

                Text(
                  "LOST & FOUND",
                  style: TextStyle(
                    color: bgColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  "Admin Panel",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const Divider(color: Colors.white24),

          // ================= MENU ITEMS =================
          // ✅ FIX 2: Make menu scrollable so it never overflows
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  SidebarItem(
                    icon: Icons.dashboard,
                    title: "Dashboard",
                    isSelected: selectedIndex == 0,
                    onTap: () => onItemSelected(0),
                  ),

                  SidebarItem(
                    icon: Icons.inventory_2,
                    title: "Manage Items",
                    isSelected: selectedIndex == 1,
                    onTap: () => onItemSelected(1),
                  ),

                  SidebarItem(
                    icon: Icons.people,
                    title: "Manage Users",
                    isSelected: selectedIndex == 2,
                    onTap: () => onItemSelected(2),
                  ),

                  // SidebarItem(
                  //   icon: Icons.assignment_turned_in,
                  //   title: "Claims",
                  //   isSelected: selectedIndex == 3,
                  //   onTap: () => onItemSelected(3),
                  // ),

                  SidebarItem(
                    icon: Icons.analytics,
                    title: "Analytics",
                    isSelected: selectedIndex == 3,
                    onTap: () => onItemSelected(3),
                  ),
                  // SidebarItem(
                  //   icon: Icons.auto_awesome,
                  //   title: "AI Matches",
                  //   isSelected: selectedIndex == 4,
                  //   onTap: () => onItemSelected(4),
                  // ),
                  SidebarItem(
                    icon: Icons.campaign,
                    title: "Broadcast",
                    isSelected: selectedIndex == 4,
                    onTap: () => onItemSelected(4),
                  ),
                ],
              ),
            ),
          ),

          // ================= LOGOUT SECTION =================
          const Divider(color: Colors.white24),

          // ❌ FIX 3: Your old code had wrong function:
          // onTap: () => (){},  ❌ WRONG

          SidebarItem(
            icon: Icons.logout,
            title: "Logout",
            isSelected: false,

            // ✅ FIXED
            onTap: () async {
              await FirebaseAuth.instance.signOut();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) =>  LoginScreen(),
                ),
                    (route) => false,
              );
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ================= SIDEBAR ITEM WIDGET =================
class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  static const Color orange = Color(0xFFF09E27);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),

      decoration: BoxDecoration(
        color: isSelected
            ? Colors.white.withOpacity(0.15)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),

      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? orange : Colors.white70,
        ),

        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),

        onTap: onTap,
      ),
    );
  }
}