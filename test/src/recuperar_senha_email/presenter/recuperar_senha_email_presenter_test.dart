import 'package:auth_google_package/src/features/recuperar_senha_email/presenter/recuperar_senha_email_presenter.dart';
import 'package:auth_google_package/src/utilitarios/Parametros.dart';
import 'package:auth_google_package/src/utilitarios/erros_auth_google.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

class FairebaseRecuperarSenhaEmailDatasourceMock extends Mock
    implements Datasource<bool> {}

void main() {
  late Datasource<bool> datasource;

  setUp(() {
    datasource = FairebaseRecuperarSenhaEmailDatasourceMock();
  });

  test('Deve retornar um sucesso com true', () async {
    when(datasource).calls(#call).thenAnswer((_) => Future.value(true));
    final result = await RecuperarSenhaEmailPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).recuperarSenhaEmail(
      parametros: ParametrosRecuperarSenhaEmail(
        email: "any",
        error: ErroRecuperarSenhaEmail(message: 'teste error'),
      ),
    );
    print("teste result - ${await result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<SuccessReturn<bool>>());
    expect(
        result.fold(
          success: (value) => value.result,
          error: (value) => value.error,
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
      parametros: ParametrosRecuperarSenhaEmail(
        email: "any",
        error: ErroRecuperarSenhaEmail(message: 'teste error'),
      ),
    );
    print("teste result - ${await result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<ErrorReturn<bool>>());
  });
}
