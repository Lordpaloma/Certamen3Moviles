import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Stream<QuerySnapshot> trabajadores() {
    return FirebaseFirestore.instance.collection('smilingfriends').snapshots();
  }

  Stream<QuerySnapshot> clientes() {
    return FirebaseFirestore.instance.collection('clientesfelices').snapshots();
  }

  Future<void> clienteagregar(String nombre, String problema, int episodio,
      int temporada, DateTime fechaemision) {
    return FirebaseFirestore.instance.collection('clientesfelices').doc().set({
      'nombre':nombre,
      'problema': problema,
      'episodio':episodio,
      'temporada': temporada,
      'fechaemision': fechaemision
    });
  }
}
