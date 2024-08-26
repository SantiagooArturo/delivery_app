import 'package:delivery_app/entities/bd/Alimento.dart';

class Restaurante {
  String id;
  String nombre;
  String direccion;
  List<Alimento> listaAlimentos;

  Restaurante(this.id, this.nombre, this.direccion, this.listaAlimentos);
}