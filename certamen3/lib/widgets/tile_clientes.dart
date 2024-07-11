import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
class TilesClientes extends StatefulWidget {
  final String data;
  final IconData Icon;

  TilesClientes(
    {
      this.data = '-',
      this.Icon = MdiIcons.emoticonHappyOutline,
    }
  );

  @override
  State<TilesClientes> createState() => _TilesClientesState();
}

class _TilesClientesState extends State<TilesClientes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.white38,
      child: Row(
        children: [
          Icon(widget.Icon),
          Text('${widget.data}')],
      ),
    );
  }
}