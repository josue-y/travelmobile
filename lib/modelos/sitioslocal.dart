import 'package:hive/hive.dart';

part 'sitioslocal.g.dart';

@HiveType(typeId: 0)
class SitioLocal extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? nombre;

  @HiveField(2)
  String? departamento;

  @HiveField(3)
  String? descripcion;

  @HiveField(4)
  String? clima;

  @HiveField(5)
  String? linkimage;

  @HiveField(6)
  String? region;
}
