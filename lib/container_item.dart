import 'package:hive/hive.dart';

part 'container_item.g.dart'; // this line must be at the top level (not inside a class)

@HiveType(typeId: 0)
class ContainerItem extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  DateTime expirationDate;

  @HiveField(3)
  DateTime scannedDate;

  ContainerItem({
    required this.id,
    required this.name,
    required this.expirationDate,
    required this.scannedDate,
  });
}
