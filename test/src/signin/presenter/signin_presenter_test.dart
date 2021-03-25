import 'package:auth_google_package/src/features/signin/presenter/signin_presenter.dart';
import 'package:auth_google_package/src/utilitarios/Parametros.dart';
import 'package:auth_google_package/src/utilitarios/erros_auth_google.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

class FairebaseSignInDatasourceMock extends Mock implements Datasource<bool> {}

void main() {
  late Datasource<bool> datasource;

  setUp(() {
    datasource = FairebaseSignInDatasourceMock();
  });

  test('Deve retornar um sucesso com true', () async {
    when(datasource).calls(#call).thenAnswer((_) => Future.value(true));
    final result = await SignInPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).signIn(
      parametros: ParametrosSignIn(
        email: "any",
        error: ErroSignIn(message: "teste error"),
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

  test('Deve retornar ErroSignIn com Erro ao fazer o SignIn Cod.02-1',
      () async {
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await SignInPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).signIn(
      parametros: ParametrosSignIn(
        email: "any",
        error: ErroSignIn(message: "teste error"),
      ),
    );
    print("teste result - ${await result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<ErrorReturn<bool>>());
  });
}
