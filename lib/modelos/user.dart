class Users {
  var _uid;
  var _email;
  var _password;
  var _genre;
  var _favoritesGenres;
  var _bornDate;

  Users(this._uid, this._email, this._password, this._genre,
      this._favoritesGenres, this._bornDate);

  Users.Vacio();

  Users.fromJson(Map<String, dynamic> json)
      : _uid = json['uid'],
        _email = json['email'],
        _password = json['password'],
        _genre = json['genre'],
        _favoritesGenres = json['favoritesGenres'],
        _bornDate = json['bornDate'];


  Map<String, dynamic> toJson() => {
    'uid': _uid,
    'email': _email,
    'password': _password,
    'genre': _genre,
    'favoritesGenres': _favoritesGenres,
    'bornDate': _bornDate
  };

  get email => _email;

  get bornDate => _bornDate;

  set bornDate(value) {
    _bornDate = value;
  }

  get favoritesGenres => _favoritesGenres;

  set favoritesGenres(value) {
    _favoritesGenres = value;
  }

  get genre => _genre;

  set genre(value) {
    _genre = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  set email(value) {
    _email = value;
  }

  get uid => _uid;

  set uid(value) {
    _uid = value;
  }
}
