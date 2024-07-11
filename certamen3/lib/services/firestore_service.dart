
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

  Stream<QuerySnapshot> trabajadores(){
    return FirebaseFirestore.instance.collection('smilingfriends').snapshots();
  }
    Stream<QuerySnapshot> clientes(){
    return FirebaseFirestore.instance.collection('clientesfelices').snapshots();
  }
}