import 'package:sa_formativa_petshop_sql/model/consulta_model.dart';
import 'package:sa_formativa_petshop_sql/service/database_helper.dart';

class ConsultaController {
  final _dbhelper = DatabaseHelper();

  Future<int> salvarConsulta(Consulta c) async => _dbhelper.insertConsulta(c);

  //listar todas consulta por pet
  Future<List<Consulta>> listarConsultas(int petId) async => _dbhelper.getConsultaPorPet(petId);
}