import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
class TilesClientes extends StatefulWidget {
  final String data;
  final IconData icono;

  TilesClientes(
    {
      this.data = '-',
      this.icono = MdiIcons.emoticonHappyOutline,
    }
  );

  @override
  State<TilesClientes> createState() => _TilesClientesState();
}

class _TilesClientesState extends State<TilesClientes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      color: Color.fromARGB(235, 64, 17, 164),
      child: Row(
        children: [
          Icon(widget.icono),
          Text('${widget.data}', style: TextStyle(color: Colors.white),)],
      ),
    );
  }
}