import 'package:flutter/material.dart';

class TilesClientesResumen extends StatefulWidget {
  final String nombre;
  final String problema;

  TilesClientesResumen({
    this.nombre = '',
    this.problema = '',
  });

  @override
  State<TilesClientesResumen> createState() => _TilesClientesResumenState();
}

class _TilesClientesResumenState extends State<TilesClientesResumen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white60),
        color: Color.fromARGB(173, 255, 255, 255),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ' ${widget.nombre}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Problema: ${widget.problema}',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
