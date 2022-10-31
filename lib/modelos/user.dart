class Usuario {
  var _email;
  var _password;

  Usuario.Empty();

  Usuario.fromJson(Map<String, dynamic> json)
      :
        _email = json['email'],
        _password = json['password'];

  Map<String, dynamic> toJson() => {
    'email': _email,
    'password': _password,
  };

  Usuario(this._email, this._password);

  get email => _email;

  set email(value) {
    _email = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }


}
