import 'package:hive/hive.dart';
part 'emplotee_model.g.dart';

@HiveType(typeId: 1)
class EmployeeModel {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final DateTime date;

  EmployeeModel({
    required this.name,
    required this.date,
  });
}
