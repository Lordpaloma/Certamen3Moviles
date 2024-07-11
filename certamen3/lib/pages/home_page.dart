import 'package:certamen3/pages/tabs/clientes.dart';
import 'package:certamen3/pages/tabs/smilingfriends.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            height: 40,
          ),
          bottom: TabBar(
            labelColor: Color.fromARGB(222, 229, 221, 221),
            indicatorColor: const Color.fromARGB(255, 101, 94, 94),
            tabs: [
              Tab(text: 'Smiling Friends'),
              Tab(text: 'Clientes'),
            ],
          ),
        ),
        body: TabBarView(
          children: [SmilingFriends(), Clientes()],
        ),
      ),
    );
  }
}
