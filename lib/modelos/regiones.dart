/// region : "Región Eje Cafetero - Antioquia"
/// c_digo_dane_del_departamento : "5"
/// departamento : "Antioquia"
/// c_digo_dane_del_municipio : "5.001"
/// municipio : "Medellín"

class Regiones {
  Regiones({
      String? region, 
      String? cDigoDaneDelDepartamento, 
      String? departamento, 
      String? cDigoDaneDelMunicipio, 
      String? municipio,}){
    _region = region;
    _cDigoDaneDelDepartamento = cDigoDaneDelDepartamento;
    _departamento = departamento;
    _cDigoDaneDelMunicipio = cDigoDaneDelMunicipio;
    _municipio = municipio;
}

  Regiones.fromJson(dynamic json) {
    _region = json['region'];
    _cDigoDaneDelDepartamento = json['c_digo_dane_del_departamento'];
    _departamento = json['departamento'];
    _cDigoDaneDelMunicipio = json['c_digo_dane_del_municipio'];
    _municipio = json['municipio'];
  }
  String? _region;
  String? _cDigoDaneDelDepartamento;
  String? _departamento;
  String? _cDigoDaneDelMunicipio;
  String? _municipio;
Regiones copyWith({  String? region,
  String? cDigoDaneDelDepartamento,
  String? departamento,
  String? cDigoDaneDelMunicipio,
  String? municipio,
}) => Regiones(  region: region ?? _region,
  cDigoDaneDelDepartamento: cDigoDaneDelDepartamento ?? _cDigoDaneDelDepartamento,
  departamento: departamento ?? _departamento,
  cDigoDaneDelMunicipio: cDigoDaneDelMunicipio ?? _cDigoDaneDelMunicipio,
  municipio: municipio ?? _municipio,
);
  String? get region => _region;
  String? get cDigoDaneDelDepartamento => _cDigoDaneDelDepartamento;
  String? get departamento => _departamento;
  String? get cDigoDaneDelMunicipio => _cDigoDaneDelMunicipio;
  String? get municipio => _municipio;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['region'] = _region;
    map['c_digo_dane_del_departamento'] = _cDigoDaneDelDepartamento;
    map['departamento'] = _departamento;
    map['c_digo_dane_del_municipio'] = _cDigoDaneDelMunicipio;
    map['municipio'] = _municipio;
    return map;
  }

}