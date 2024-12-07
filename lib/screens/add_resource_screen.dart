import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AddResourceScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _studentIdController = TextEditingController();
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TAMAH DATA ➕')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration:
                    InputDecoration(labelText: 'Nan', icon: Icon(Icons.person)),
                validator: (value) =>
                    value!.isEmpty ? 'NAN NEU PASOE MEUTUAH😁' : null,
              ),
              TextFormField(
                controller: _studentIdController,
                decoration: InputDecoration(
                    labelText: 'Nim', icon: (Icon(Icons.school))),
                validator: (value) =>
                    value!.isEmpty ? 'NIM NEUPASOE CHIET MUTUAH😁' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    apiService.createResource({
                      'name': _nameController.text,
                      'student_id': _studentIdController.text,
                    }).then((_) {
                      Navigator.pop(context, true); // Go back to list screen
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Error: $error'),
                      ));
                    });
                  }
                },
                child: Text('TAMAH DATA📝'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
