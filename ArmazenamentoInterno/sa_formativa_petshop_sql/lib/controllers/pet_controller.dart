import 'package:sa_formativa_petshop_sql/service/database_helper.dart';
import 'package:sa_formativa_petshop_sql/model/pet_model.dart';

class PetController {
  final _dbhelper = DatabaseHelper();

  //métodos dos controller

  Future<int> salvarPet(Pet pet) async => await _dbhelper.inserirPet(pet);

  //listar todos os pets
  Future<List<Pet>> listarTodos() async => await _dbhelper.getPets();
  
}