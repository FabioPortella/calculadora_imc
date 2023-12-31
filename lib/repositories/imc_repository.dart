import 'package:calculadora_imc/model/imc_model.dart';
import 'package:hive/hive.dart';

class ImcRepository {
  static late Box _box;

  ImcRepository._criar();

  static Future<ImcRepository> carregar() async {
    if (Hive.isBoxOpen("imcModel")) {
      _box = Hive.box("imcModel");
    } else {
      _box = await Hive.openBox("imcModel");
    }
    return ImcRepository._criar();
  }

  salvar(ImcModel imcModel) {
    _box.add(imcModel);
  }

  alterar(ImcModel imcModel) {
    imcModel.save();
  }

  excluir(ImcModel imcModel) {
    imcModel.delete();
  }

  List<ImcModel> obterDados() {
    return _box.values.cast<ImcModel>().toList();
  }
}
