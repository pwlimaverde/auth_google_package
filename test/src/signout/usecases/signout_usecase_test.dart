import 'package:auth_google_package/src/signout/usecases/signout_usecase.dart';
import 'package:auth_google_package/src/utilitarios/erros_auth_google.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class SignOutRepositorioMock extends Mock
    implements Repositorio<bool, NoParams> {}

void main() {
  late Repositorio<bool, NoParams> repositorio;
  late UseCase<bool, NoParams> signOutUsecase;
  late TempoExecucao tempo;

  setUp(() {
    tempo = TempoExecucao();
    repositorio = SignOutRepositorioMock();
    signOutUsecase = SignOutUsecase(repositorio: repositorio);
  });

  test('Deve retornar um sucesso com Stream<bool>', () async {
    tempo.iniciar();
    when(repositorio)
        .calls(#call)
        .thenAnswer((_) => Future.value(SucessoRetorno<bool>(resultado: true)));
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

  test('Deve retornar um ErroSignout com Erro ao fazer o signout Cod.01-1',
      () async {
    tempo.iniciar();
    when(repositorio).calls(#call).thenAnswer(
        (_) => Future.value(SucessoRetorno<bool>(resultado: false)));
    final result = await signOutUsecase(parametros: NoParams());
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do CarregarEmpresa: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<bool>>());
  });

  test('Deve retornar um ErroSignout com Erro ao fazer o signout Cod.01-2',
      () async {
    tempo.iniciar();
    when(repositorio).calls(#call).thenAnswer(
          (_) => Future.value(
            ErroRetorno<bool>(
              erro: ErroSignout(
                mensagem: "Erro ao fazer o signout Cod.01-2",
              ),
            ),
          ),
        );
    final result = await signOutUsecase(parametros: NoParams());
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do CarregarEmpresa: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<bool>>());
  });

  test('Deve retornar um ErroSignout com Erro ao fazer o signout Cod.01-2',
      () async {
    tempo.iniciar();
    when(repositorio).calls(#call).thenThrow(Exception());
    final result = await signOutUsecase(parametros: NoParams());
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do CarregarEmpresa: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<bool>>());
  });
}
