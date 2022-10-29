class  User {
  var _nombre;
  var _correo;
  var _password;
  var _genero;
  var _generofav;
  var _fechaNacimiento;

  User(this._nombre, this._correo, this._password, this._genero,
      this._generofav, this._fechaNacimiento);

  User.fromJson(Map<String, dynamic> json)
      : _nombre = json ['namelogin'],
        _correo = json ['emaillogin'],
        _password = json ['password'],
        _genero = json ['genero'],
        _generofav = json ['favoritos'],
        _fechaNacimiento = json ['fecha'];

  Map<String, dynamic> Tojson() => {
        'namelogin': _nombre,
        'emaillogin': _correo,
        'password': _password,
        'genero': _genero,
        'favoritos': _generofav,
        'fecha': _fechaNacimiento
      };


  get nombre => _nombre;

  get generofav => _generofav;

  set generofav(value) {
    _generofav = value;
  }

  get genero => _genero;

  set genero(value) {
    _genero = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  get correo => _correo;

  set correo(value) {
    _correo = value;
  }

  set nombre(value) {
    _nombre = value;
  }
}