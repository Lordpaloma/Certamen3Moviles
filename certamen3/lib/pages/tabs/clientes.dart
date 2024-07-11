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
                      TilesClientesResumen(nombre: cliente['nombre'], problema: cliente['problema'],)
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  void mostrarInfoClientes(BuildContext context, cliente) {
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 350,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(96, 29, 1, 73),
              border:
                  Border.all(color: Color.fromARGB(255, 29, 1, 73), width: 2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(children: [
              Spacer(),
              Container(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromARGB(115, 66, 1, 207)),
                    child: Text('Cerrar'),
                    onPressed: () => Navigator.pop(context),
                  ))
            ]),
          ),
        );
      },
    );
  }
}
