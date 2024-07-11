import 'package:certamen3/services/firestore_service.dart';
import 'package:certamen3/widgets/tile_clienteres.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

class Registrarcliente extends StatefulWidget {
  const Registrarcliente({super.key});

  @override
  State<Registrarcliente> createState() => _RegistrarclienteState();
}

class _RegistrarclienteState extends State<Registrarcliente> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController episodioController = TextEditingController();
  TextEditingController temporadaController = TextEditingController();
  TextEditingController problemaController = TextEditingController();

  final FormKey = GlobalKey<FormState>();
  DateTime fecha_emision = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agregar Cliente',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: FormKey,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              TextFormField(
                controller: nombreController,
                decoration: InputDecoration(label: Text('Nombre')),
                validator: (nombre) {
                  if (nombre!.isEmpty) {
                    return 'Indique nombre del cliente';
                  }
                  if (nombre.length < 2) {
                    return 'El nombre debe tener al menos 2 caracteres';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: episodioController,
                decoration: InputDecoration(label: Text('Episodio')),
                validator: (nombre) {
                  if (nombre!.isEmpty) {
                    return 'Indique episodio';
                  }
                  if (int.tryParse(nombre) == null) {
                    return 'El episodio debe ser un numero';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: temporadaController,
                decoration: InputDecoration(label: Text('Temporada')),
                validator: (nombre) {
                  if (nombre!.isEmpty) {
                    return 'Indique temporada';
                  }
                  if (int.tryParse(nombre) == null) {
                    return 'La temporada debe ser un numero';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: problemaController,
                decoration: InputDecoration(label: Text('Problema')),
                validator: (nombre) {
                  if (nombre!.isEmpty) {
                    return 'Indique problema';
                  }
                  return null;
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text('Fecha de emisión del capitulo '),
                    Text(
                      formatofecha.format(fecha_emision),
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(MdiIcons.calendar),
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                firstDate: DateTime(2021),
                                lastDate: DateTime.now(),
                                locale: Locale('es', 'ES'))
                            .then((fecha) {
                          setState(() {
                            fecha_emision = fecha ?? fecha_emision;
                          });
                        });
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Agregar Cliente'),
                  onPressed: () {
                    if (FormKey.currentState!.validate()) {
                      FirestoreService().clienteagregar(
                          nombreController.text.trim(),
                          problemaController.text.trim(),
                          int.parse(episodioController.text.trim()),
                          int.parse(temporadaController.text.trim()),
                          this.fecha_emision);
                      Navigator.pop(context);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
