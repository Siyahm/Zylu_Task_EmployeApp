import 'package:hive/hive.dart';
part 'emplotee_model.g.dart';

@HiveType(typeId: 1)
class EmployeeModel {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final DateTime date;
  @HiveField(2)
  final Status? status;
  @HiveField(3)
  final String id;

  EmployeeModel({
    required this.name,
    required this.date,
    required this.status,
    required this.id,
  });
}

@HiveType(typeId: 2)
enum Status {
  @HiveField(0)
  active,
  @HiveField(1)
  inactive,
}
