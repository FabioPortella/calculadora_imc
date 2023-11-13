import 'package:hive/hive.dart';

part 'imc_model.g.dart';

@HiveType(typeId: 0)
class ImcModel extends HiveObject {
  @HiveField(0)
  String descricao = "";

  @HiveField(1)
  DateTime? data;

  @HiveField(2)
  double peso = 0;

  @HiveField(3)
  double altura = 0;

  @HiveField(4)
  double imc = 0;

  @HiveField(5)
  String classificacaoIMC = "";

  ImcModel();

  ImcModel.criar(
    this.descricao, 
    this.data, 
    this.peso, 
    this.altura, 
    this.imc,
    this.classificacaoIMC);
}
