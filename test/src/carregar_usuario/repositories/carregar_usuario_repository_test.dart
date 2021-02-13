import 'package:auth_google_package/src/carregar_usuario/repositories/carregar_usuario_repository.dart';
import 'package:auth_google_package/src/carregar_usuario/usecases/carregar_usuario_usecase.dart';
import 'package:auth_google_package/src/carregar_usuario/usecases/entities/resultado_usuario.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';
import 'package:rxdart/rxdart.dart';

class FairebaseUsuarioDatasource extends Mock
    implements Datasource<Stream<ResultadoUsuario>, NoParams> {}

void main() {
  late Datasource<Stream<ResultadoUsuario>, NoParams> datasource;
  late Repositorio<Stream<ResultadoUsuario>, NoParams> repositorio;
  late UseCase<Stream<ResultadoUsuario>, NoParams> carregarUsuarioUsecase;
  late TempoExecucao tempo;

  setUp(() {
    tempo = TempoExecucao();
    datasource = FairebaseUsuarioDatasource();
    repositorio = CarregarUsuarioRepositorio(datasource: datasource);
    carregarUsuarioUsecase = CarregarUsuarioUsecase(repositorio: repositorio);
  });

  test('Deve retornar um sucesso com true', () async {
    tempo.iniciar();
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
    final result = await carregarUsuarioUsecase(parametros: NoParams());
    print("teste result - ${await result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ).first}");
    tempo.terminar();
    print(
        "Tempo de Execução do CarregarEmpresa: ${tempo.calcularExecucao()}ms");
    expect(result, isA<SucessoRetorno<Stream<ResultadoUsuario>>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        isA<Stream<ResultadoUsuario>>());
    testeFire.close();
  });

  test(
      'Deve ErrorCarregarEmpresa com Erro ao carregar os dados da empresa Cod.02-1',
      () async {
    tempo.iniciar();
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
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await carregarUsuarioUsecase(parametros: NoParams());
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do CarregarEmpresa: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<Stream<ResultadoUsuario>>>());
    testeFire.close();
  });
}
