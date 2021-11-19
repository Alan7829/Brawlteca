import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  ///
  /// Clase Singleton para mantener el estado de manera global en todo el proyecto
  ///

  static PreferenciasUsuario? _internal;

  SharedPreferences? _prefs;

  PreferenciasUsuario._();

  static PreferenciasUsuario get instance {
    if (_internal == null) {
      _internal = new PreferenciasUsuario._();
    }

    return _internal!;
  }

  Future<void> initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get nombre {
    return this._prefs!.getString("nombre") ?? '';
  }

  get email {
    return this._prefs!.getString("email") ?? '';
  }

  get foto {
    return this._prefs!.getString("foto") ?? '';
  }

  set setNombre(String? name) {
    _prefs!.setString("nombre", name ?? "");
  }

  set setEmail(String? email) {
    _prefs!.setString("email", email ?? "");
  }

  set setFoto(String? foto) {
    _prefs!.setString("foto", foto ?? "");
  }
}
