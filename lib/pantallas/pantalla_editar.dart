import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PantallaEditar extends StatefulWidget {
  final String nombre;

  PantallaEditar({required this.nombre});

  @override
  _PantallaEditarState createState() => _PantallaEditarState();
}

class _PantallaEditarState extends State<PantallaEditar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.nombre);
  }

  Future<void> _guardarNombre() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nombre', _controller.text);
    Navigator.pushReplacementNamed(context, '/mostrar');
  }

  Future<void> _eliminarNombre() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('nombre');
    Navigator.pushNamedAndRemoveUntil(context, '/registro', (route) => false);
  }

  void _cancelar() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Nombre')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _cancelar, child: Text('Cancelar')),
                ElevatedButton(onPressed: _guardarNombre, child: Text('Guardar')),
                ElevatedButton(onPressed: _eliminarNombre, child: Text('Eliminar')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
