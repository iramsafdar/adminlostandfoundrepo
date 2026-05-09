// import 'package:flutter/material.dart';
//
// class ItemDetailDialog extends StatelessWidget {
//
//   final Map<String, dynamic> data;
//
//   const ItemDetailDialog({
//     super.key,
//     required this.data,
//   });
//
//   static const Color darkBlue = Color(0xFF2A417F);
//   static const Color orange = Color(0xFFF09E27);
//   static const Color bgColor = Color(0xFFEFF5FB);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Dialog(
//
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//
//       child: Container(
//         width: 650,
//         padding: const EdgeInsets.all(25),
//
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//         ),
//
//         child: SingleChildScrollView(
//
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//
//             children: [
//
//               // 🔷 HEADER
//               Row(
//                 mainAxisAlignment:
//                 MainAxisAlignment.spaceBetween,
//
//                 children: [
//
//                   const Text(
//                     "Item Details",
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: darkBlue,
//                     ),
//                   ),
//
//                   IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//
//                     icon: const Icon(Icons.close),
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 25),
//
//               // 🔷 IMAGE
//               Center(
//                 child: Container(
//                   width: 220,
//                   height: 220,
//
//                   decoration: BoxDecoration(
//                     color: bgColor,
//                     borderRadius:
//                     BorderRadius.circular(18),
//
//                     image: data['imageUrl'] != null
//                         ? DecorationImage(
//                       image: NetworkImage(
//                         data['imageUrl'],
//                       ),
//                       fit: BoxFit.cover,
//                     )
//                         : null,
//                   ),
//
//                   child: data['imageUrl'] == null
//                       ? const Icon(
//                     Icons.inventory_2,
//                     size: 80,
//                     color: Colors.grey,
//                   )
//                       : null,
//                 ),
//               ),
//
//               const SizedBox(height: 30),
//
//               // 🔷 DETAILS
//               _buildDetailRow(
//                 title: "Item Name",
//                 value: data['itemName'],
//               ),
//
//               _buildDetailRow(
//                 title: "Type",
//                 value: data['type'],
//               ),
//
//               _buildDetailRow(
//                 title: "Category",
//                 value: data['category'],
//               ),
//
//               _buildDetailRow(
//                 title: "Status",
//                 value: data['status'],
//               ),
//
//               _buildDetailRow(
//                 title: "Location",
//                 value: data['location'],
//               ),
//
//               _buildDetailRow(
//                 title: "Date Lost",
//                 value: data['dateLost'],
//               ),
//
//               _buildDetailRow(
//                 title: "Owner Email",
//                 value: data['email'],
//               ),
//
//               _buildDetailRow(
//                 title: "Phone",
//                 value: data['phone'] ?? "Not Provided",
//               ),
//
//               _buildDetailRow(
//                 title: "Reward Offered",
//                 value: data['rewardOffered'] == true
//                     ? "Yes"
//                     : "No",
//               ),
//
//               _buildDetailRow(
//                 title: "Reward Amount",
//                 value: data['rewardAmount']
//                     ?.toString() ??
//                     "N/A",
//               ),
//
//               const SizedBox(height: 20),
//
//               // 🔷 DESCRIPTION
//               const Text(
//                 "Description",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: darkBlue,
//                 ),
//               ),
//
//               const SizedBox(height: 10),
//
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(18),
//
//                 decoration: BoxDecoration(
//                   color: bgColor,
//                   borderRadius:
//                   BorderRadius.circular(14),
//                 ),
//
//                 child: Text(
//                   data['description'] ??
//                       "No description",
//                   style: const TextStyle(
//                     fontSize: 15,
//                     height: 1.5,
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 30),
//
//               // 🔷 CLOSE BUTTON
//               Align(
//                 alignment: Alignment.centerRight,
//
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: orange,
//
//                     padding:
//                     const EdgeInsets.symmetric(
//                       horizontal: 24,
//                       vertical: 14,
//                     ),
//
//                     shape: RoundedRectangleBorder(
//                       borderRadius:
//                       BorderRadius.circular(12),
//                     ),
//                   ),
//
//                   child: const Text(
//                     "Close",
//                     style:
//                     TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // 🔷 DETAIL ROW WIDGET
//   Widget _buildDetailRow({
//     required String title,
//     required dynamic value,
//   }) {
//
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//
//       child: Row(
//         crossAxisAlignment:
//         CrossAxisAlignment.start,
//
//         children: [
//
//           SizedBox(
//             width: 160,
//
//             child: Text(
//               "$title:",
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 15,
//                 color: darkBlue,
//               ),
//             ),
//           ),
//
//           Expanded(
//             child: Text(
//               value?.toString() ?? "N/A",
//
//               style: const TextStyle(
//                 fontSize: 15,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

class ItemDetailDialog extends StatelessWidget {

  final Map<String, dynamic> data;

  const ItemDetailDialog({
    super.key,
    required this.data,
  });

  static const Color darkBlue = Color(0xFF2A417F);
  static const Color orange = Color(0xFFF09E27);
  static const Color bgColor = Color(0xFFEFF5FB);

  @override
  Widget build(BuildContext context) {

    return Dialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Container(
        width: 650,
        padding: const EdgeInsets.all(25),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),

        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // 🔷 HEADER
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [

                  const Text(
                    "Item Details",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: darkBlue,
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    icon: const Icon(Icons.close),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // 🔷 IMAGE
              Center(
                child: Container(
                  width: 220,
                  height: 220,

                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius:
                    BorderRadius.circular(18),

                    image: data['imageUrl'] != null
                        ? DecorationImage(
                      image: NetworkImage(
                        data['imageUrl'],
                      ),
                      fit: BoxFit.cover,
                    )
                        : null,
                  ),

                  child: data['imageUrl'] == null
                      ? const Icon(
                    Icons.inventory_2,
                    size: 80,
                    color: Colors.grey,
                  )
                      : null,
                ),
              ),

              const SizedBox(height: 30),

              // 🔷 DETAILS
              _buildDetailRow(
                title: "Item Name",
                value: data['itemName'],
              ),
              _buildDetailRow(
                title: "Description",
                value: data['description'] ??
                    "No description",
              ),


              _buildDetailRow(
                title: "Type",
                value: data['type'],
              ),

              _buildDetailRow(
                title: "Category",
                value: data['category'],
              ),

              _buildDetailRow(
                title: "Status",
                value: data['status'],
              ),

              _buildDetailRow(
                title: "Location",
                value: data['location'],
              ),

              _buildDetailRow(
                title: "Date Lost",
                value: data['dateLost'],
              ),

              _buildDetailRow(
                title: "Owner Email",
                value: data['email'],
              ),

              _buildDetailRow(
                title: "Phone",
                value: data['phone'].toString().trim().isEmpty
                    ? "Not Provided"
                    : data['phone'],
              ),

              _buildDetailRow(
                title: "Reward Offered",
                value: data['rewardOffered'] == true
                    ? "Yes"
                    : "No",
              ),

              _buildDetailRow(
                title: "Reward Amount",
                value: data['rewardAmount']
                    ?.toString() ??
                    "N/A",
              ),


              const SizedBox(height: 30),

              // 🔷 CLOSE BUTTON
              Align(
                alignment: Alignment.centerRight,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: orange,

                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                  ),

                  child: const Text(
                    "Close",
                    style:
                    TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔷 DETAIL ROW WIDGET
  Widget _buildDetailRow({
    required String title,
    required dynamic value,
  }) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),

      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          SizedBox(
            width: 160,

            child: Text(
              "$title:",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: darkBlue,
              ),
            ),
          ),

          Expanded(
            child: Text(
              value?.toString() ?? "N/A",

              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}