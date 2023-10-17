import 'package:calculadora_imc/model/imc.dart';

class IndiceIMCRepository {
  final List<IndiceIMC> _indiceIMC = [];

  Future<void> adicionar(IndiceIMC indiceIMC) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _indiceIMC.add(indiceIMC);
  }

  Future<void> remover(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _indiceIMC.remove(_indiceIMC.where((indiceIMC) => indiceIMC.id == id).first);
  }

  Future<List<IndiceIMC>> listar() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _indiceIMC;
  }
}