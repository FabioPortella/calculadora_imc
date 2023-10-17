import 'package:flutter/material.dart';

class IndiceIMC {
  final String _id = UniqueKey().toString();
  final DateTime _data;
  double _peso;
  double _altura;
  double _imc;
  String _classificacaoIMC;

  IndiceIMC(
      this._data, this._peso, this._altura, this._imc, this._classificacaoIMC);

  String get id => _id;

  DateTime get data => _data;

  double get peso => _peso;

  set peso(double peso) {
    _peso = peso;
  }

  double get altura => _altura;

  set altura(double altura) {
    _altura = altura;
  }

  double get imc => _imc;

  set imc(double imc) {
    _imc = imc;
  }

  String get classificacaoIMC => _classificacaoIMC;

  set classificacaoIMC(String classificacaoIMC) {
    _classificacaoIMC = classificacaoIMC;
  }
}
