import 'package:auth_google_package/src/signin/presenter/signin_presenter.dart';
import 'package:auth_google_package/src/utilitarios/Parametros.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class FairebaseSignInDatasourceMock extends Mock
    implements Datasource<bool, ParametrosSignIn> {}

void main() {
  late Datasource<bool, ParametrosSignIn> datasource;

  setUp(() {
    datasource = FairebaseSignInDatasourceMock();
  });

  test('Deve retornar um sucesso com true', () async {
    when(datasource).calls(#call).thenAnswer((_) => Future.value(true));
    final result = await SignInPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).signIn(parametros: ParametrosSignIn(email: "any"));
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

  test('Deve retornar um ErroSignIn com Erro ao fazer o SignIn Cod.01-1',
      () async {
    when(datasource).calls(#call).thenAnswer((_) => Future.value(false));
    final result = await SignInPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).signIn(parametros: ParametrosSignIn(email: "any"));
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    expect(result, isA<ErroRetorno<bool>>());
  });

  test('Deve retornar ErroSignIn com Erro ao fazer o SignIn Cod.02-1',
      () async {
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await SignInPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).signIn(parametros: ParametrosSignIn(email: "any"));
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    expect(result, isA<ErroRetorno<bool>>());
  });
}
