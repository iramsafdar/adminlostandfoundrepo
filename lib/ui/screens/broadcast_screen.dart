// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../../services/notifications/send_notification_service.dart';
//
// class BroadcastScreen extends StatefulWidget {
//   const BroadcastScreen({super.key});
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//
//   @override
//   State<BroadcastScreen> createState() =>
//       _BroadcastScreenState();
// }
//
// class _BroadcastScreenState
//     extends State<BroadcastScreen> {
//
//   final TextEditingController titleController =
//   TextEditingController();
//
//   final TextEditingController bodyController =
//   TextEditingController();
//
//   bool isSending = false;
//
//   Future<void> sendBroadcast() async {
//
//     final title = titleController.text.trim();
//     final body = bodyController.text.trim();
//
//     if (title.isEmpty || body.isEmpty) {
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text(
//             "Please fill all fields",
//           ),
//         ),
//       );
//
//       return;
//     }
//
//     setState(() {
//       isSending = true;
//     });
//
//     try {
//
//       // 🔷 GET USERS
//       final users = await FirebaseFirestore.instance
//           .collection('Users')
//           .get();
//
//       int sentCount = 0;
//
//       // 🔷 LOOP ALL USERS
//       for (var user in users.docs) {
//
//         final data = user.data();
//
//         final token =
//             data['fcmToken']?.toString() ?? "";
//
//         final status =
//             data['status']?.toString() ?? "active";
//
//         // 🔷 SKIP INVALID USERS
//         if (token.isEmpty || status == "blocked") {
//           continue;
//         }
//
//         // 🔷 SEND NOTIFICATION
//         await SendNotificationService
//             .sendNotification(
//
//           token: token,
//
//           title: title,
//
//           body: body,
//
//           data: {
//             "screen": "home",
//           },
//         );
//
//         sentCount++;
//       }
//
//       // 🔷 CLEAR FIELDS
//       titleController.clear();
//       bodyController.clear();
//
//       ScaffoldMessenger.of(context).showSnackBar(
//
//         SnackBar(
//
//           backgroundColor: Colors.green,
//
//           content: Text(
//             "Notification sent to $sentCount users",
//           ),
//         ),
//       );
//
//     } catch (e) {
//
//       ScaffoldMessenger.of(context).showSnackBar(
//
//         SnackBar(
//           backgroundColor: Colors.red,
//           content: Text(e.toString()),
//         ),
//       );
//     }
//
//     setState(() {
//       isSending = false;
//     });
//   }
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
//           const Text(
//             "Broadcast Notification",
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           const SizedBox(height: 30),
//
//           Container(
//             width: 600,
//             padding: const EdgeInsets.all(25),
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
//             child: Column(
//
//               crossAxisAlignment:
//               CrossAxisAlignment.start,
//
//               children: [
//
//                 const Text(
//                   "Notification Title",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//
//                 const SizedBox(height: 10),
//
//                 TextField(
//                   controller: titleController,
//
//                   decoration: InputDecoration(
//
//                     hintText:
//                     "Enter notification title",
//
//                     filled: true,
//
//                     fillColor:
//                     Colors.grey.shade100,
//
//                     border: OutlineInputBorder(
//
//                       borderRadius:
//                       BorderRadius.circular(12),
//
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 25),
//
//                 const Text(
//                   "Notification Message",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//
//                 const SizedBox(height: 10),
//
//                 TextField(
//                   controller: bodyController,
//
//                   maxLines: 5,
//
//                   decoration: InputDecoration(
//
//                     hintText:
//                     "Write notification message",
//
//                     filled: true,
//
//                     fillColor:
//                     Colors.grey.shade100,
//
//                     border: OutlineInputBorder(
//
//                       borderRadius:
//                       BorderRadius.circular(12),
//
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 30),
//
//                 SizedBox(
//                   width: double.infinity,
//                   height: 55,
//
//                   child: ElevatedButton.icon(
//
//                     onPressed:
//                     isSending
//                         ? null
//                         : sendBroadcast,
//
//                     style:
//                     ElevatedButton.styleFrom(
//
//                       backgroundColor:
//                       BroadcastScreen.orange,
//
//                       shape:
//                       RoundedRectangleBorder(
//
//                         borderRadius:
//                         BorderRadius.circular(14),
//                       ),
//                     ),
//
//                     icon: isSending
//                         ? const SizedBox(
//                       height: 20,
//                       width: 20,
//
//                       child:
//                       CircularProgressIndicator(
//                         color: Colors.white,
//                         strokeWidth: 2,
//                       ),
//                     )
//                         : const Icon(
//                       Icons.send,
//                       color: Colors.white,
//                     ),
//
//                     label: Text(
//
//                       isSending
//                           ? "Sending..."
//                           : "Send Broadcast",
//
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
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


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../services/notifications/send_notification_service.dart';

class BroadcastScreen extends StatefulWidget {
  const BroadcastScreen({super.key});

  static const Color darkBlue = Color(0xFF2A417F);
  static const Color orange = Color(0xFFF09E27);

  @override
  State<BroadcastScreen> createState() =>
      _BroadcastScreenState();
}

class _BroadcastScreenState
    extends State<BroadcastScreen> {

  final TextEditingController titleController =
  TextEditingController();

  final TextEditingController bodyController =
  TextEditingController();

  bool isSending = false;

  Future<void> sendBroadcast() async {

    final title = titleController.text.trim();
    final body = bodyController.text.trim();

    if (title.isEmpty || body.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please fill all fields",
          ),
        ),
      );

      return;
    }

    setState(() {
      isSending = true;
    });

    try {

      // 🔷 GET USERS
      final users = await FirebaseFirestore.instance
          .collection('Users')
          .get();

      int sentCount = 0;

      // 🔷 LOOP ALL USERS
      for (var user in users.docs) {

        final data = user.data();

        final token =
            data['fcmToken']?.toString() ?? "";

        final status =
            data['status']?.toString() ?? "active";

        // 🔷 SKIP INVALID USERS
        if (token.isEmpty || status == "blocked") {
          continue;
        }

        // 🔷 SEND NOTIFICATION
        await SendNotificationService
            .sendNotification(

          token: token,

          title: title,

          body: body,

          data: {
            "screen": "home",
          },
        );

        sentCount++;
      }

      // 🔷 CLEAR FIELDS
      titleController.clear();
      bodyController.clear();

      ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(

          backgroundColor: Colors.green,

          content: Text(
            "Notification sent to $sentCount users",
          ),
        ),
      );

    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.toString()),
        ),
      );
    }

    setState(() {
      isSending = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    // ✅ OVERFLOW FIXES ADDED
    // 1. LayoutBuilder
    // 2. ConstrainedBox
    // 3. Removed fixed width issue
    // 4. Safe responsive form width
    // 5. Prevented pixel overflow

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

                // const Text(
                //   "Broadcast Notification",
                //
                //   style: TextStyle(
                //     fontSize: 28,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                const SizedBox(height: 30),

                Center(

                  child: Container(

                    // ✅ RESPONSIVE WIDTH
                    width: constraints.maxWidth > 700
                        ? 600
                        : double.infinity,

                    padding:
                    const EdgeInsets.all(25),

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

                    child: Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        const Text(

                          "Notification Title",

                          style: TextStyle(
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextField(

                          controller:
                          titleController,

                          decoration:
                          InputDecoration(

                            hintText:
                            "Enter notification title",

                            filled: true,

                            fillColor:
                            Colors.grey.shade100,

                            border:
                            OutlineInputBorder(

                              borderRadius:
                              BorderRadius.circular(
                                  12),

                              borderSide:
                              BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        const Text(

                          "Notification Message",

                          style: TextStyle(
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextField(

                          controller:
                          bodyController,

                          maxLines: 5,

                          decoration:
                          InputDecoration(

                            hintText:
                            "Write notification message",

                            filled: true,

                            fillColor:
                            Colors.grey.shade100,

                            border:
                            OutlineInputBorder(

                              borderRadius:
                              BorderRadius.circular(
                                  12),

                              borderSide:
                              BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        SizedBox(

                          width: double.infinity,
                          height: 55,

                          child:
                          ElevatedButton.icon(

                            onPressed:
                            isSending
                                ? null
                                : sendBroadcast,

                            style:
                            ElevatedButton
                                .styleFrom(

                              backgroundColor:
                              BroadcastScreen
                                  .orange,

                              shape:
                              RoundedRectangleBorder(

                                borderRadius:
                                BorderRadius
                                    .circular(
                                    14),
                              ),
                            ),

                            icon: isSending
                                ? const SizedBox(
                              height: 20,
                              width: 20,

                              child:
                              CircularProgressIndicator(

                                color:
                                Colors.white,

                                strokeWidth:
                                2,
                              ),
                            )
                                : const Icon(

                              Icons.send,

                              color:
                              Colors.white,
                            ),

                            label: Text(

                              isSending
                                  ? "Sending..."
                                  : "Send Broadcast",

                              style:
                              const TextStyle(

                                color:
                                Colors.white,

                                fontSize: 16,

                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}