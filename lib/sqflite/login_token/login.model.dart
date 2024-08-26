class LoginModel {
  final int? id; // Ahora es int? para permitir null
  final int token;
  final String email;
  final String password;

  // Constructor, id ahora es opcional
  LoginModel({
    this.id, // id es opcional ahora
    required this.token,
    required this.email,
    required this.password,
  });

  // Método para crear una instancia de LoginModel desde un Map
  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      id: map['id'], // Leer el campo id del Map
      token: map['token'],
      email: map['email'],
      password: map['password'],
    );
  }

  // Método para crear una instancia de LoginModel desde un JSON
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'], // Leer el campo id del JSON
      token: json['token'],
      email: json['email'],
      password: json['password'],
    );
  }

  // Método para convertir la instancia de LoginModel a un Map
  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'email': email,
      'password': password,
      // No incluimos el campo id aquí porque la base de datos lo genera automáticamente
    };
  }
}
