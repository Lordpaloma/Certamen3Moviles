import 'package:certamen3/widgets/tile_clienteres.dart';
import 'package:flutter/material.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  State<Clientes> createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  final AssetImage fondo = AssetImage('assets/images/fondo.png');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: fondo, fit: BoxFit.cover),
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
