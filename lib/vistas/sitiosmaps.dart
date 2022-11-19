class SitosMaps {
  var _id;
  var _nombre;
  var _region;
  var _departamento;
  var _codigo_dane;
  var _imagen;
  var _latitud;
  var _longitud;



  get id => _id;

  set id(value) {
    _id = value;
  }

  get longitud => _longitud;

  set longitud(value) {
    _longitud = value;
  }

  get imagen => _imagen;

  set imagen(value) {
    _imagen = value;
  }

  get departamento => _departamento;

  set departamento(value) {
    _departamento = value;
  }

  get nombre => _nombre;

  set nombre(value) {
    _nombre = value;
  }

  get region => _region;

  get latitud => _latitud;

  set latitud(value) {
    _latitud = value;
  }

  get codigo_dane => _codigo_dane;

  set codigo_dane(value) {
    _codigo_dane = value;
  }

  set region(value) {
    _region = value;
  }

  SitosMaps();
}