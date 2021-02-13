import 'package:auth_google_package/src/signout/repositories/signout_repository.dart';
import 'package:auth_google_package/src/signout/usecases/signout_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class SignOutDatasourceMock extends Mock implements Datasource<bool, NoParams> {
}

void main() {
  late Datasource<bool, NoParams> datasource;
  late Repositorio<bool, NoParams> repositorio;
  late UseCase<bool, NoParams> signOutUsecase;
  late TempoExecucao tempo;

  setUp(() {
    tempo = TempoExecucao();
    datasource = SignOutDatasourceMock();
    repositorio = SignOutRepositorio(datasource: datasource);
    signOutUsecase = SignOutUsecase(repositorio: repositorio);
  });

  test('Deve retornar um sucesso com true', () async {
    tempo.iniciar();
    when(datasource).calls(#call).thenAnswer((_) => Future.value(true));
    final result = await signOutUsecase(parametros: NoParams());
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print("Tempo de Execução do SignOut: ${tempo.calcularExecucao()}ms");
    expect(result, isA<SucessoRetorno<bool>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        true);
  });

  test('Deve retornar ErroSignout com Erro ao fazer o signout Cod.02-1',
      () async {
    tempo.iniciar();
    when(datasource).calls(#call).thenAnswer((_) => Future.value(false));
    final result = await signOutUsecase(parametros: NoParams());
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print("Tempo de Execução do SignOut: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<bool>>());
  });

  test('Deve retornar ErroSignout com Erro ao fazer o signout Cod.02-1',
      () async {
    tempo.iniciar();
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await signOutUsecase(parametros: NoParams());
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print("Tempo de Execução do SignOut: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<bool>>());
  });
}
