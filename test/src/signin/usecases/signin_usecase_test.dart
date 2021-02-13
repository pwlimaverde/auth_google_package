import 'package:auth_google_package/src/signin/usecases/signin_usecase.dart';
import 'package:auth_google_package/src/utilitarios/Parametros.dart';
import 'package:auth_google_package/src/utilitarios/erros_auth_google.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class SignInRepositorioMock extends Mock
    implements Repositorio<bool, ParametrosSignIn> {}

void main() {
  late Repositorio<bool, ParametrosSignIn> repositorio;
  late UseCase<bool, ParametrosSignIn> signInUsecase;
  late TempoExecucao tempo;

  setUp(() {
    tempo = TempoExecucao();
    repositorio = SignInRepositorioMock();
    signInUsecase = SignInUsecase(repositorio: repositorio);
  });

  test('Deve retornar um sucesso com bool', () async {
    tempo.iniciar();
    when(repositorio)
        .calls(#call)
        .thenAnswer((_) => Future.value(SucessoRetorno<bool>(resultado: true)));
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

  test('Deve retornar um ErroSignIn com Erro ao fazer o SignIn Cod.01-1',
      () async {
    tempo.iniciar();
    when(repositorio).calls(#call).thenAnswer(
        (_) => Future.value(SucessoRetorno<bool>(resultado: false)));
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

  test('Deve retornar um ErroSignIn com Erro ao fazer o SignIn Cod.01-2',
      () async {
    tempo.iniciar();
    when(repositorio).calls(#call).thenAnswer(
          (_) => Future.value(
            ErroRetorno<bool>(
              erro: ErroSignIn(
                mensagem: "Erro ao fazer o SignIn Cod.01-2",
              ),
            ),
          ),
        );
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

  test('Deve retornar um ErroSignIn com Erro ao fazer o SignIn Cod.01-2',
      () async {
    tempo.iniciar();
    when(repositorio).calls(#call).thenThrow(Exception());
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
