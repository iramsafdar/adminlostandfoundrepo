import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🔷 USERS COUNT
  Stream<int> getUsersCount() {
    return _firestore.collection('Users').snapshots().map(
          (snapshot) => snapshot.docs.length,
    );
  }

  // 🔷 ITEMS COUNT
  Stream<int> getItemsCount() {
    return _firestore.collection('items').snapshots().map(
          (snapshot) => snapshot.docs.length,
    );
  }

  // 🔷 CLAIMS COUNT
  Stream<int> getClaimsCount() {
    return _firestore.collection('claim').snapshots().map(
          (snapshot) => snapshot.docs.length,
    );
  }

  // 🔷 LOST ITEMS
  Stream<int> getLostItemsCount() {
    return _firestore.collection('items').snapshots().map(
          (snapshot) {
        return snapshot.docs.where((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return data['type'] == 'lost';
        }).length;
      },
    );
  }

  // 🔷 FOUND ITEMS
  Stream<int> getFoundItemsCount() {
    return _firestore.collection('items').snapshots().map(
          (snapshot) {
        return snapshot.docs.where((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return data['type'] == 'found';
        }).length;
      },
    );
  }

  // 🔷 PENDING CLAIMS
  Stream<int> getPendingClaimsCount() {
    return _firestore.collection('claim').snapshots().map(
          (snapshot) {
        return snapshot.docs.where((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return data['status'] == 'pending';
        }).length;
      },
    );
  }
}