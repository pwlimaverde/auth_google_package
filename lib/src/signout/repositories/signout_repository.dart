import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../utilitarios/erros_auth_google.dart';

class SignOutRepositorio extends Repositorio<bool, NoParams> {
  final Datasource<bool, NoParams> datasource;

  SignOutRepositorio({required this.datasource});

  @override
  Future<RetornoSucessoOuErro<bool>> call(
      {required NoParams parametros}) async {
    final resultado = await retornoDatasource(
      datasource: datasource,
      erro: ErroSignOut(
        mensagem: "Erro ao fazer o signout Cod.02-1",
      ),
      parametros: parametros,
    );
    return resultado;
  }
}
