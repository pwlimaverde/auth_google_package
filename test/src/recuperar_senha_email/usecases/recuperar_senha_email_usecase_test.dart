import 'package:auth_google_package/src/recuperar_senha_email/usecases/recuperar_senha_email_usecase.dart';
import 'package:auth_google_package/src/utilitarios/Parametros.dart';
import 'package:auth_google_package/src/utilitarios/erros_auth_google.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class RecuperarSenhaEmailRepositorioMock extends Mock
    implements Repositorio<bool, ParametrosRecuperarSenhaEmail> {}

void main() {
  late Repositorio<bool, ParametrosRecuperarSenhaEmail> repositorio;
  late UseCase<bool, ParametrosRecuperarSenhaEmail> recuperarSenhaEmailUsecase;
  late TempoExecucao tempo;

  setUp(() {
    tempo = TempoExecucao();
    repositorio = RecuperarSenhaEmailRepositorioMock();
    recuperarSenhaEmailUsecase =
        RecuperarSenhaEmailUsecase(repositorio: repositorio);
  });

  test('Deve retornar um sucesso com Stream<bool>', () async {
    tempo.iniciar();
    when(repositorio)
        .calls(#call)
        .thenAnswer((_) => Future.value(SucessoRetorno<bool>(resultado: true)));
    final result = await recuperarSenhaEmailUsecase(
        parametros: ParametrosRecuperarSenhaEmail(email: "any"));
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do CarregarEmpresa: ${tempo.calcularExecucao()}ms");
    expect(result, isA<SucessoRetorno<bool>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        true);
  });

  test(
      'Deve retornar um ErrorCarregarEmpresa com Erro ao carregar os dados da empresa Cod.01-1',
      () async {
    tempo.iniciar();
    when(repositorio).calls(#call).thenAnswer(
        (_) => Future.value(SucessoRetorno<bool>(resultado: false)));
    final result = await recuperarSenhaEmailUsecase(
        parametros: ParametrosRecuperarSenhaEmail(email: "any"));
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do CarregarEmpresa: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<bool>>());
  });

  test(
      'Deve retornar um ErrorCarregarEmpresa com Erro ao carregar os dados da empresa Cod.01-2',
      () async {
    tempo.iniciar();
    when(repositorio).calls(#call).thenAnswer(
          (_) => Future.value(
            ErroRetorno<bool>(
              erro: ErroRecuperarSenhaEmail(
                mensagem: "Erro ao recuperar a senha pelo e-mail Cod.01-2",
              ),
            ),
          ),
        );
    final result = await recuperarSenhaEmailUsecase(
        parametros: ParametrosRecuperarSenhaEmail(email: "any"));
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do CarregarEmpresa: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<bool>>());
  });

  test(
      'Deve retornar um ErrorCarregarEmpresa com Erro ao carregar os dados da empresa Cod.01-2',
      () async {
    tempo.iniciar();
    when(repositorio).calls(#call).thenThrow(Exception());
    final result = await recuperarSenhaEmailUsecase(
        parametros: ParametrosRecuperarSenhaEmail(email: "any"));
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