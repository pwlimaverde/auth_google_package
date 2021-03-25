import 'package:auth_google_package/src/features/signout/presenter/signout_presenter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

class FairebaseSignOutDatasourceMock extends Mock implements Datasource<bool> {}

void main() {
  late Datasource<bool> datasource;

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
      'Deve retornar ErrorCarregarEmpresa com Erro ao fazer o signout Cod.02-1',
      () async {
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await SignOutPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).signOut();
    print("teste result - ${await result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<ErrorReturn<bool>>());
  });
}
