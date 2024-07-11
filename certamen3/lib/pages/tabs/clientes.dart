import 'package:certamen3/pages/registrar_cliente.dart';
import 'package:certamen3/services/firestore_service.dart';
import 'package:certamen3/widgets/tile_clienteres.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  State<Clientes> createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  final AssetImage fondo = AssetImage('assets/images/hola.png');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: fondo, fit: BoxFit.cover),
        ),
        padding: EdgeInsets.all(10),
        child: StreamBuilder(
          stream: FirestoreService().clientes(),
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
                  var cliente = snapshot.data!.docs[index];
                  return ListBody(
                    children: [
                      TilesClientesResumen(
                        nombre: cliente['nombre'],
                        problema: cliente['problema'],
                        episodio: cliente['episodio'],
                        temporada: cliente['temporada'],
                        fecha: cliente['fechaemision'],
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.blueAccent,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          MaterialPageRoute ruta = MaterialPageRoute(
            builder: (context) => Registrarcliente(),
          );
          Navigator.push(context, ruta).then(
            (value) {
              setState(() {});
            },
          );
        },
      ),
    );
  }
}
