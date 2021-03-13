import 'package:auth_google_package/src/features/recuperar_senha_email/presenter/recuperar_senha_email_presenter.dart';
import 'package:auth_google_package/src/utilitarios/Parametros.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class FairebaseRecuperarSenhaEmailDatasourceMock extends Mock
    implements Datasource<bool, ParametrosRecuperarSenhaEmail> {}

void main() {
  late Datasource<bool, ParametrosRecuperarSenhaEmail> datasource;

  setUp(() {
    datasource = FairebaseRecuperarSenhaEmailDatasourceMock();
  });

  test('Deve retornar um sucesso com true', () async {
    when(datasource).calls(#call).thenAnswer((_) => Future.value(true));
    final result = await RecuperarSenhaEmailPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).recuperarSenhaEmail(
        parametros: ParametrosRecuperarSenhaEmail(email: "any"));
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    expect(result, isA<SucessoRetorno<bool>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        true);
  });

  test(
      'Deve retornar ErroRecuperarSenhaEmail com Erro ao recuperar a senha pelo e-mail Cod.02-1',
      () async {
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await RecuperarSenhaEmailPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).recuperarSenhaEmail(
        parametros: ParametrosRecuperarSenhaEmail(email: "any"));
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    expect(result, isA<ErroRetorno<bool>>());
  });
}
