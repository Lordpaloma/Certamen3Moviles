import 'package:certamen3/pages/clientes_detalle.dart';
import 'package:certamen3/widgets/tile_clientes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:intl/intl.dart';

class TilesClientesResumen extends StatefulWidget {
  final String nombre;
  final String problema;
  final int episodio;
  final int temporada;
  final Timestamp fecha;

  TilesClientesResumen({
    this.nombre = '',
    this.problema = '',
    this.episodio = 0,
    this.temporada = 0,
    required this.fecha,
  });

  @override
  State<TilesClientesResumen> createState() => _TilesClientesResumenState();
}

final formatofecha = DateFormat('dd-MM-yyyy');

class _TilesClientesResumenState extends State<TilesClientesResumen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          final route = MaterialPageRoute(builder: (context) {
            return ClientesDetalle(
              nombre: '${widget.nombre}',
              problema: '${widget.problema}',
              episodio: widget.episodio,
              temporada: widget.temporada,
              fecha: formatofecha.format(widget.fecha.toDate()),
            );
          });
          Navigator.push(context, route);
        },
        child: Container(
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
        ));
  }
}
