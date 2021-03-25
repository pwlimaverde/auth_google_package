import 'package:auth_google_package/auth_google_package.dart';
import 'package:auth_google_package/src/features/carregar_usuario/presenter/carregar_usuario_presenter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:return_success_or_error/return_success_or_error.dart';
import 'package:rxdart/rxdart.dart';

class FairebaseUsuarioDatasource extends Mock
    implements Datasource<Stream<ResultadoUsuario>> {}

void main() {
  late Datasource<Stream<ResultadoUsuario>> datasource;

  setUp(() {
    datasource = FairebaseUsuarioDatasource();
  });

  test('Deve retornar um sucesso com Stream<ResultadoUsuario>', () async {
    final testeFire = BehaviorSubject<ResultadoUsuario>();
    testeFire.add(
      ResultadoUsuario(
        id: "1",
        nome: "Paulo Weslley",
        email: "Paulo Weslley",
        endereco: "Paulo Weslley",
        administrador: true,
      ),
    );
    when(datasource).calls(#call).thenAnswer((_) => Future.value(testeFire));
    final result = await CarregarUsuarioPresenter(
            datasource: datasource, mostrarTempoExecucao: true)
        .carregarUsuario();
    print("teste result - ${await result.fold(
          success: (value) => value.result,
          error: (value) => value.error,
        ).first}");
    expect(result, isA<SuccessReturn<Stream<ResultadoUsuario>>>());
    expect(
        result.fold(
          success: (value) => value.result,
          error: (value) => value.error,
        ),
        isA<Stream<ResultadoUsuario>>());
    testeFire.close();
  });

  test(
      'Deve ErroCarregarUsuario com Erro ao carregar os dados do Usuario Cod.02-1',
      () async {
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await CarregarUsuarioPresenter(
            datasource: datasource, mostrarTempoExecucao: true)
        .carregarUsuario();
    print("teste result - ${await result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<ErrorReturn<Stream<ResultadoUsuario>>>());
  });
}
