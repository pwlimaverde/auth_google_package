import 'package:auth_google_package/src/recuperar_senha_email/repositories/recuperar_senha_email_repository.dart';
import 'package:auth_google_package/src/recuperar_senha_email/usecases/recuperar_senha_email_usecase.dart';
import 'package:auth_google_package/src/utilitarios/Parametros_recuperar_senha_email.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class FairebaseRecuperarSenhaEmailDatasource extends Mock
    implements Datasource<bool, ParametrosRecuperarSenhaEmail> {}

void main() {
  late Datasource<bool, ParametrosRecuperarSenhaEmail> datasource;
  late Repositorio<bool, ParametrosRecuperarSenhaEmail> repositorio;
  late UseCase<bool, ParametrosRecuperarSenhaEmail> recuperarSenhaEmailUsecase;
  late TempoExecucao tempo;

  setUp(() {
    tempo = TempoExecucao();
    datasource = FairebaseRecuperarSenhaEmailDatasource();
    repositorio = RecuperarSenhaEmailRepositorio(datasource: datasource);
    recuperarSenhaEmailUsecase =
        RecuperarSenhaEmailUsecase(repositorio: repositorio);
  });

  test('Deve retornar um sucesso com true', () async {
    tempo.iniciar();
    when(datasource).calls(#call).thenAnswer((_) => Future.value(true));
    final result = await recuperarSenhaEmailUsecase(
        parametros: ParametrosRecuperarSenhaEmail(email: "any"));
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do CarregarEmpresa: ${tempo.calcularExecucao()}ms");
    expect(result, isA<SucessoRetorno<bool>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        true);
  });

  test(
      'Deve ErrorRecuperarSenhaEmail com Erro ao recuperar a senha pelo e-mail Cod.02-1',
      () async {
    tempo.iniciar();
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await recuperarSenhaEmailUsecase(
        parametros: ParametrosRecuperarSenhaEmail(email: "any"));
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do CarregarEmpresa: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<bool>>());
  });
}
