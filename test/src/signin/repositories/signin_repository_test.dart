import 'package:auth_google_package/src/signin/repositories/signin_repository.dart';
import 'package:auth_google_package/src/signin/usecases/signin_usecase.dart';
import 'package:auth_google_package/src/utilitarios/Parametros.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class FairebaseSignInDatasourceMock extends Mock
    implements Datasource<bool, ParametrosSignIn> {}

void main() {
  late Datasource<bool, ParametrosSignIn> datasource;
  late Repositorio<bool, ParametrosSignIn> repositorio;
  late UseCase<bool, ParametrosSignIn> signInUsecase;
  late TempoExecucao tempo;

  setUp(() {
    tempo = TempoExecucao();
    datasource = FairebaseSignInDatasourceMock();
    repositorio = SignInRepositorio(datasource: datasource);
    signInUsecase = SignInUsecase(repositorio: repositorio);
  });

  test('Deve retornar um sucesso com true', () async {
    tempo.iniciar();
    when(datasource).calls(#call).thenAnswer((_) => Future.value(true));
    final result =
        await signInUsecase(parametros: ParametrosSignIn(email: "any"));
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print("Tempo de Execução do SignIn: ${tempo.calcularExecucao()}ms");
    expect(result, isA<SucessoRetorno<bool>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        true);
  });

  test('Deve retornar ErroSignIn com Erro ao fazer o SignIn Cod.01-1',
      () async {
    tempo.iniciar();
    when(datasource).calls(#call).thenAnswer((_) => Future.value(false));
    final result =
        await signInUsecase(parametros: ParametrosSignIn(email: "any"));
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print("Tempo de Execução do SignIn: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<bool>>());
  });

  test('Deve retornar ErroSignIn com Erro ao fazer o SignIn Cod.02-1',
      () async {
    tempo.iniciar();
    when(datasource).calls(#call).thenThrow(Exception());
    final result =
        await signInUsecase(parametros: ParametrosSignIn(email: "any"));
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print("Tempo de Execução do SignIn: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<bool>>());
  });
}
