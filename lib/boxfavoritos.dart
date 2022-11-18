import 'package:ejemplo_2/modelos/sitioslocal.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<SitioLocal> obtenerFavoritos() => Hive.box<SitioLocal>('favoritos');
}