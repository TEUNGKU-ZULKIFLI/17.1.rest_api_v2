import 'package:flutter/material.dart';
import '../services/api_service.dart';

class EditResourceScreen extends StatelessWidget {
  final Map<String, dynamic> resource;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _studentIdController = TextEditingController();
  final ApiService apiService = ApiService();

  EditResourceScreen({required this.resource}) {
    _nameController.text = resource['name'];
    _studentIdController.text = resource['student_id'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Resource')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a name' : null,
              ),
              TextFormField(
                controller: _studentIdController,
                decoration: InputDecoration(labelText: 'Student ID'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a student ID' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    apiService.updateResource(resource['id'], {
                      'name': _nameController.text,
                      'student_id': _studentIdController.text,
                    }).then((_) {
                      Navigator.pop(context, true);
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Error: $error'),
                      ));
                    });
                  }
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
