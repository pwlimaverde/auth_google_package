import 'package:auth_google_package/src/signout/presenter/signout_presenter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class FairebaseSignOutDatasourceMock extends Mock
    implements Datasource<bool, NoParams> {}

void main() {
  late Datasource<bool, NoParams> datasource;

  setUp(() {
    datasource = FairebaseSignOutDatasourceMock();
  });

  test('Deve retornar um sucesso com true', () async {
    when(datasource).calls(#call).thenAnswer((_) => Future.value(true));
    final result = await SignOutPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).signOut();
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
      'Deve retornar ErrorCarregarEmpresa com Erro ao fazer o signout Cod.02-1',
      () async {
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await SignOutPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).signOut();
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    expect(result, isA<ErroRetorno<bool>>());
  });
}
