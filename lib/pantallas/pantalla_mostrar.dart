import 'package:flutter/material.dart';


class PantallaMostrar extends StatelessWidget {
  final String nombre;

  PantallaMostrar({required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mostrar Nombre')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre: $nombre', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/editar');
              },
              child: Text('Editar Nombre'),
            ),
          ],
        ),
      ),
    );
  }
}
