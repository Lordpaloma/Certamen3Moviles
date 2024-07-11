import 'package:certamen3/widgets/tile_clientes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

class ClientesDetalle extends StatefulWidget {
  final String nombre;
  final String problema;
  final String fecha;
  final int episodio;
  final int temporada;

  ClientesDetalle({
    this.nombre = '',
    this.episodio = 0,
    this.fecha = '',
    this.problema = '',
    this.temporada = 0,
  });
  @override
  State<ClientesDetalle> createState() => _ClientesDetalleState();
}

class _ClientesDetalleState extends State<ClientesDetalle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.nombre} :D'),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(96, 29, 1, 73),
          border: Border.all(color: Color.fromARGB(255, 29, 1, 73), width: 2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(children: [
          TilesClientes(data: '${widget.nombre}'),
          TilesClientes(data: 'Temporada: ${widget.temporada}  Episodio: ${widget.episodio}', icono: MdiIcons.televisionBox,),
          TilesClientes(data: 'Fecha de emision: ${widget.fecha}', icono: MdiIcons.calendar),
          TilesClientes(data: 'Problema: ${widget.problema}',icono: MdiIcons.emoticonSadOutline),

          Spacer(),
          Container(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromARGB(236, 66, 1, 207)),
                child: Text('Cerrar'),
                onPressed: () => Navigator.pop(context),
              ))
        ]),
      ),
    );
  }
}
