import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

class TilesSmiling extends StatefulWidget {
  final String nombre;
  final String apellido;
  final int edad;
  final String genero;

  TilesSmiling(
      {this.nombre = 'sin nombre',
      this.apellido = '-',
      this.edad = 0,
      this.genero = ''});

  @override
  State<TilesSmiling> createState() => _TilesSmilingState();
}

class _TilesSmilingState extends State<TilesSmiling> {
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
          Icon(MdiIcons.emoticonHappy),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ' ${widget.nombre} ${widget.apellido}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Edad: ${widget.edad}',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'Genero: ${widget.genero}',
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
