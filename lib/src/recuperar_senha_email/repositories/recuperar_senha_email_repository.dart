import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../utilitarios/Parametros_recuperar_senha_email.dart';
import '../../utilitarios/erros_auth_google.dart';

class RecuperarSenhaEmailRepositorio
    extends Repositorio<bool, ParametrosRecuperarSenhaEmail> {
  final Datasource<bool, ParametrosRecuperarSenhaEmail> datasource;

  RecuperarSenhaEmailRepositorio({required this.datasource});

  @override
  Future<RetornoSucessoOuErro<bool>> call(
      {required ParametrosRecuperarSenhaEmail parametros}) async {
    final resultado = await retornoDatasource(
      datasource: datasource,
      erro: ErroRecuperarSenhaEmail(
        mensagem: "Erro ao recuperar a senha pelo e-mail Cod.02-1",
      ),
      parametros: parametros,
    );
    return resultado;
  }
}
