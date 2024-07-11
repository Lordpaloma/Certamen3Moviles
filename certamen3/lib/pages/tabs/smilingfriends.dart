import 'package:certamen3/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

class SmilingFriends extends StatefulWidget {
  const SmilingFriends({super.key});

  @override
  State<SmilingFriends> createState() => _SmilingFriendsState();
}

class _SmilingFriendsState extends State<SmilingFriends> {
  @override
  final AssetImage fondo = AssetImage('assets/images/hola.png');

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: fondo, fit: BoxFit.cover),
        ),
        padding: EdgeInsets.all(10),
        child: StreamBuilder(
          stream: FirestoreService().trabajadores(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData ||
                snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                separatorBuilder: (context, Index) => Divider(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var trabajador = snapshot.data!.docs[index];
                  return ListBody(
                    children: [Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.black45,
                      width: 100,
                    )],
                  );
                  //                   leading: Icon(MdiIcons.emoticonHappy),
                  //                 title: Text('${trabajador['nombre']} ${trabajador['apellido']}'),
                  //               subtitle: Text('Edad:${trabajador['edad']}'),
                  //           );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
