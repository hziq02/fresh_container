import 'package:flutter/material.dart';
import 'package:fresh_container/container_item.dart';
import 'package:hive_flutter/adapters.dart';

class AddContainerForm extends StatefulWidget {
  final String containerId;

  const AddContainerForm({required this.containerId});

  @override
  State<AddContainerForm> createState() => _AddContainerFormState();
}

class _AddContainerFormState extends State<AddContainerForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  DateTime? _expirationDate;

  void _submitForm() {
    if (_formKey.currentState!.validate() && _expirationDate != null) {
      final container = ContainerItem(
        id: widget.containerId,
        name: _nameController.text,
        expirationDate: _expirationDate!,
        scannedDate: DateTime.now(),
      );

      final box = Hive.box<ContainerItem>('containers');
      box.add(container);

      Navigator.popUntil(context, ModalRoute.withName('/'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Container Info')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Container ID: ${widget.containerId}'),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (val) => val == null || val.isEmpty ? 'Enter a name' : null,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() => _expirationDate = picked);
                  }
                },
                child: Text(_expirationDate == null
                    ? 'Select Expiration Date'
                    : 'Expiration: ${_expirationDate!.toLocal()}'.split(' ')[0]),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
