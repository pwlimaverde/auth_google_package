class ResultadoUsuario {
  final String? endereco;
  final String id;
  final String nome;
  final String email;
  final bool administrador;

  ResultadoUsuario({
    this.endereco,
    required this.id,
    required this.nome,
    required this.email,
    required this.administrador,
  });

  @override
  String toString() {
    return "User => $nome - Adm => $administrador ";
  }
}
