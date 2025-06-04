import 'package:flutter/material.dart';
import 'package:fresh_container/container_item.dart';
import 'package:fresh_container/qr_scanner_screen.dart';
import 'package:hive_flutter/adapters.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box<ContainerItem> containerBox;

  @override
  void initState() {
    super.initState();
    containerBox = Hive.box<ContainerItem>('containers');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fresh Containers')),
      body: ValueListenableBuilder(
        valueListenable: containerBox.listenable(),
        builder: (context, Box<ContainerItem> box, _) {
          if (box.isEmpty) return Center(child: Text('No containers scanned.'));
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (_, i) {
              final item = box.getAt(i)!;
              return ListTile(
                title: Text(item.name),
                subtitle: Text('ID: ${item.id}\nExpires: ${item.expirationDate.toLocal()}'),
                isThreeLine: true,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.qr_code_scanner),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => QRScannerScreen()),
          );
        },
      ),
    );
  }
}
