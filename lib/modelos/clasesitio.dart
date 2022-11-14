class Sitio {
  var _id;
  var _name;
  var _departamento;
  var _clima;
  var _calificacion;
  var _region;

  Sitio(this._id, this._name, this._departamento, this._clima,
      this._calificacion, this._region);

  Sitio.fromJson(Map<String, dynamic> json)
      : _id = json['uid'],
        _name = json['nombre'],
        _departamento = json['departamento'],
        _clima = json['clima'],
        _calificacion = json['calificacion'],
        _region = json['region'];

  Map<String, dynamic> toJson() => {
    'uid': _id,
    'nombre': _name,
    'departamento' : _departamento,
    'clima': _clima,
    'calificacion': _calificacion,
    'region': _region,
  };

  get id => _id;

  set id(value) {
    _id = value;
  }

  get region => _region;

  set region(value) {
    _region = value;
  }

  get calificacion => _calificacion;

  set calificacion(value) {
    _calificacion = value;
  }

  get clima => _clima;

  set clima(value) {
    _clima = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  get departamento => _departamento;

  set departamento(value) {
    _departamento = value;
  }
}