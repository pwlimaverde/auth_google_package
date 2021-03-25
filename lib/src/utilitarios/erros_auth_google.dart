import 'package:return_success_or_error/return_success_or_error.dart';

class ErroCarregarUsuario implements AppError {
  String message;
  ErroCarregarUsuario({required this.message});

  @override
  String toString() {
    return "ErroCarregarUsuario - $message";
  }
}

class ErroRecuperarSenhaEmail implements AppError {
  String message;
  ErroRecuperarSenhaEmail({required this.message});

  @override
  String toString() {
    return "ErroRecuperarSenhaEmail - $message";
  }
}

class ErroSignOut implements AppError {
  String message;
  ErroSignOut({required this.message});

  @override
  String toString() {
    return "ErroSignOut - $message";
  }
}

class ErroSignIn implements AppError {
  String message;
  ErroSignIn({required this.message});

  @override
  String toString() {
    return "ErroSignIn - $message";
  }
}
