class Sitio {
  var _id;
  var _name;
  var _departamento;
  var _clima;
  var _calificacion;
  var _region;
  var _descripcion;
  var _foto;

  Sitio(this._id, this._name, this._departamento, this._clima,
      this._calificacion, this._region, this._descripcion, this._foto);

  Sitio.fromJson(Map<String, dynamic> json)
      : _id = json['uid'],
        _name = json['nombre'],
        _departamento = json['departamento'],
        _clima = json['clima'],
        _calificacion = json['calificacion'],
        _region = json['region'],
        _descripcion = json['descripcion'],
        _foto = json ['foto'];

  Map<String, dynamic> toJson() => {
    'uid': _id,
    'nombre': _name,
    'departamento' : _departamento,
    'clima': _clima,
    'calificacion': _calificacion,
    'region': _region,
    'descripcion': _descripcion,
    'foto' : _foto
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

  get descripcion => _descripcion;

  set descripcion(value) {
    _descripcion = value;
  }

  get foto => _foto;

  set foto(value) {
    _foto = value;
  }
}