import 'package:flutter/material.dart';
import 'package:fresh_container/container_item.dart';
import 'package:fresh_container/home_screen.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Hive.registerAdapter(ContainerItemAdapter());
  await Hive.openBox<ContainerItem>('containers');
  runApp(MaterialApp(home: HomeScreen()));
}
