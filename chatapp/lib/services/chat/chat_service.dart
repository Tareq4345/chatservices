import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Stream<List<Map<String, dynamic>>> getUserStrem(){
    return _firestore.collection("users").snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        final user = doc.data();
        return user;
      }).toList();

    });
  }
}