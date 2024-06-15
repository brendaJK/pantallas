import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PantallaRegistro extends StatefulWidget {
  @override
  _PantallaRegistroState createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {
  final TextEditingController _controller = TextEditingController();
  bool _guardando = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  Future<void> _guardarNombre() async {
    setState(() {
      _guardando = true;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nombre', _controller.text);
    setState(() {
      _guardando = false;
    });
    Navigator.pushReplacementNamed(context, '/mostrar');
  }

  void _cancelar() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _cancelar, child: Text('Cancelar')),
                ElevatedButton(
                  onPressed: _guardando ? null : _guardarNombre,
                  child: _guardando ? CircularProgressIndicator() : Text('Guardar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
