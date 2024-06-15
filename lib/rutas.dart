import 'package:flutter/material.dart';
import 'pantallas/pantalla_registro.dart';
import 'pantallas/pantalla_mostrar.dart';
import 'pantallas/pantalla_editar.dart';


final Map<String, WidgetBuilder> rutas = {
  '/': (context) => PantallaRegistro(),
  '/pantalla2': (context) => PantallaMostrar(nombre: ''), // Aquí pasamos un nombre vacío como argumento inicial
  '/pantalla3': (context) => PantallaEditar(nombre: ''),
  
};
