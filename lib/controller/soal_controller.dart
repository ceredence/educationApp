import 'package:dinacomapp/db_helper.dart';
import 'package:dinacomapp/model/admin_model.dart';



class SoalController {
  final DBHelper _dbHelper = DBHelper();

  /// CREATE
  Future<void> tambahSoal(AdminModel soal) async {
    await _dbHelper.insertSoal(soal.toMap());
  }

  /// READ
  Future<List<AdminModel>> ambilSemuaSoal() async {
    final data = await _dbHelper.getSoal();
    return data.map((e) => AdminModel.fromMap(e)).toList();
  }

  /// UPDATE
  Future<void> updateSoal(AdminModel soal) async {
    await _dbHelper.updateSoal(soal.id!, soal.toMap());
  }

  /// DELETE
  Future<void> hapusSoal(int id) async {
    await _dbHelper.deleteSoal(id);
  }
}
