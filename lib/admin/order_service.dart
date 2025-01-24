import 'package:cloud_firestore/cloud_firestore.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchOrders() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('orders').get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Error fetching orders: $e');
      return [];
    }
  }
}