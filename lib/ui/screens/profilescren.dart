import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {

  final user = FirebaseAuth.instance.currentUser!;
  final TextEditingController nameController = TextEditingController();

  File? imageFile;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),

      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .snapshots(),

        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;

          nameController.text = data['name'] ?? '';

          return Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [

                // 🔷 PROFILE IMAGE
                GestureDetector(
                  onTap: pickImage,

                  child: CircleAvatar(
                    radius: 55,

                    backgroundImage: imageFile != null
                        ? FileImage(imageFile!)
                        : (data['imageUrl'] != null
                        ? NetworkImage(data['imageUrl'])
                        : null) as ImageProvider?,

                    child: imageFile == null && data['imageUrl'] == null
                        ? const Icon(Icons.camera_alt, size: 40)
                        : null,
                  ),
                ),

                const SizedBox(height: 30),

                // 🔷 NAME FIELD
                TextField(
                  controller: nameController,

                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                // 🔷 EMAIL (READ ONLY)
                Text(
                  "Email: ${data['email']}",
                  style: const TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 40),

                // 🔷 SAVE BUTTON
                ElevatedButton(
                  onPressed: () async {

                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(user.uid)
                        .update({
                      "name": nameController.text,
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Profile Updated")),
                    );
                  },

                  child: const Text("Save Changes"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // 🔷 PICK IMAGE FUNCTION
  Future<void> pickImage() async {

    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (picked != null) {
      setState(() {
        imageFile = File(picked.path);
      });

      // NOTE: You still need Firebase Storage upload here (next step)
    }
  }
}