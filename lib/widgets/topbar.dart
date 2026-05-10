// import 'package:flutter/material.dart';
//
// class TopBar extends StatelessWidget {
//   final String title;
//
//   const TopBar({
//     super.key,
//     required this.title,
//   });
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       padding: const EdgeInsets.symmetric(horizontal: 25),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             // Very light black shadow
//             // 0.05
//             // = 5% visible.
//             blurRadius: 8,
//             // Makes shadow soft/blurry.
//             offset: const Offset(0, 2),
//           //   SHADOW POSITION
//           //     Moves shadow:0 horizontally :2 vertically downward
//           ),
//         ],
//       ),
//
//       child: Row(
//         children: [
//
//           // 🔷 PAGE TITLE
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 26,
//               fontWeight: FontWeight.bold,
//               color: darkBlue,
//             ),
//           ),
//
//           const Spacer(),
//           // Pushes everything after it to the right side.
//           //in row spacer moves right and column moves bottom
//
//           // 🔍 SEARCH BAR
//           // Container(
//           //   width: 300,
//           //   height: 45,
//           //
//           //   decoration: BoxDecoration(
//           //     color: bgColor,
//           //     borderRadius: BorderRadius.circular(12),
//           //   ),
//           //
//           //   child: const TextField(
//           //     decoration: InputDecoration(
//           //       hintText: "Search...",
//           //       prefixIcon: Icon(Icons.search),
//           //       border: InputBorder.none,
//           //       contentPadding: EdgeInsets.symmetric(vertical: 12),
//           //     ),
//           //   ),
//           // ),
//
//           const SizedBox(width: 20),
//
//           // 🔔 NOTIFICATION ICON
//           Container(
//             padding: const EdgeInsets.all(10),
//
//             decoration: BoxDecoration(
//               color: bgColor,
//               borderRadius: BorderRadius.circular(12),
//             ),
//
//             child: const Icon(
//               Icons.notifications_none,
//               color: darkBlue,
//             ),
//           ),
//
//           const SizedBox(width: 20),
//
//           // 👤 ADMIN PROFILE
//           Row(
//             children: [
//
//               const CircleAvatar(
//                 radius: 20,
//                 backgroundColor: darkBlue,
//                 child: Icon(
//                   Icons.person,
//                   color: Colors.white,
//                 ),
//               ),
//
//               const SizedBox(width: 10),
//
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 // Centers text vertically. main axis
//                 crossAxisAlignment: CrossAxisAlignment.start,
//
//                 children: const [
//
//                   Text(
//                     "Admin",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//
//                   Text(
//                     "Administrator",
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {

  final String title;

  const TopBar({
    super.key,
    required this.title,
  });

  static const Color darkBlue =
  Color(0xFF2A417F);

  static const Color bgColor =
  Color(0xFFEFF5FB);

  @override
  Widget build(BuildContext context) {

    // ✅ OVERFLOW FIXES ADDED
    // 1. LayoutBuilder
    // 2. Flexible title
    // 3. Wrap admin text safely
    // 4. Hide extra spacing problems
    // 5. Responsive small-screen layout

    return LayoutBuilder(

      builder: (context, constraints) {

        final isSmall =
            constraints.maxWidth < 700;

        return Container(

          // ✅ HEIGHT AUTO FOR SMALL SCREENS
          padding:
          const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),

          decoration: BoxDecoration(

            color: Colors.white,

            boxShadow: [

              BoxShadow(
                color:
                Colors.black.withOpacity(0.05),

                blurRadius: 8,

                offset:
                const Offset(0, 2),
              ),
            ],
          ),

          child: isSmall

          // ✅ SMALL SCREEN LAYOUT
              ? Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              // 🔷 TITLE
              Text(

                title,

                overflow:
                TextOverflow.ellipsis,

                style: const TextStyle(

                  fontSize: 24,

                  fontWeight:
                  FontWeight.bold,

                  color: darkBlue,
                ),
              ),

              const SizedBox(height: 15),

              // 🔷 RIGHT SECTION
              Row(

                children: [

                  // 🔔 NOTIFICATION
                  Container(

                    padding:
                    const EdgeInsets.all(10),

                    decoration:
                    BoxDecoration(

                      color: bgColor,

                      borderRadius:
                      BorderRadius.circular(
                          12),
                    ),

                    child: const Icon(

                      Icons.notifications_none,

                      color: darkBlue,
                    ),
                  ),

                  const SizedBox(width: 15),

                  // 👤 PROFILE
                  Expanded(

                    child: Row(

                      children: [

                        const CircleAvatar(

                          radius: 20,

                          backgroundColor:
                          darkBlue,

                          child: Icon(

                            Icons.person,

                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(

                          child: Column(

                            mainAxisAlignment:
                            MainAxisAlignment
                                .center,

                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                            children: const [

                              Text(

                                "Admin",

                                overflow:
                                TextOverflow
                                    .ellipsis,

                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),

                              Text(

                                "Administrator",

                                overflow:
                                TextOverflow
                                    .ellipsis,

                                style: TextStyle(

                                  fontSize: 12,

                                  color:
                                  Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )

          // ✅ LARGE SCREEN LAYOUT
              : Row(

            children: [

              // 🔷 PAGE TITLE
              Expanded(

                child: Text(

                  title,

                  overflow:
                  TextOverflow.ellipsis,

                  style: const TextStyle(

                    fontSize: 26,

                    fontWeight:
                    FontWeight.bold,

                    color: darkBlue,
                  ),
                ),
              ),

              const SizedBox(width: 20),

              // 🔔 NOTIFICATION ICON
              Container(

                padding:
                const EdgeInsets.all(10),

                decoration: BoxDecoration(

                  color: bgColor,

                  borderRadius:
                  BorderRadius.circular(12),
                ),

                child: const Icon(

                  Icons.notifications_none,

                  color: darkBlue,
                ),
              ),

              const SizedBox(width: 20),

              // 👤 ADMIN PROFILE
              Row(

                children: [

                  const CircleAvatar(

                    radius: 20,

                    backgroundColor:
                    darkBlue,

                    child: Icon(

                      Icons.person,

                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Column(

                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: const [

                      Text(

                        "Admin",

                        style: TextStyle(
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      Text(

                        "Administrator",

                        style: TextStyle(

                          fontSize: 12,

                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}