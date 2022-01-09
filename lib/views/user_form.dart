import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users_provider.dart';
import 'package:flutter_crud/views/user_list.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key}) : super(key: key);

  final _form = GlobalKey<FormState>();
  final Map<String, String?> _formData = {};

  void _loadFormData(User user) {
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments;
    if (user is User) {
      _loadFormData(user);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forumlário de Usuário'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final isValid = _form.currentState!.validate();
              if (isValid) {
                _form.currentState!.save();
                Provider.of<UserProvider>(context, listen: false).put(
                  User(
                    id: _formData['id'],
                    name: _formData['name'].toString(),
                    email: _formData['email'].toString(),
                    avatarUrl: _formData['avatarUrl'].toString(),
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              Container(height: 15),
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }
                  if (value.length <= 2) {
                    return 'O nome deve conter no mínimo 3 caracteres!';
                  }
                },
                onSaved: (value) => _formData['name'] = value.toString(),
              ),
              Container(height: 15),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                ),
                onSaved: (value) => _formData['email'] = value.toString(),
              ),
              Container(height: 15),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'URL do Avatar',
                ),
                onSaved: (value) => _formData['avatarUrl'] = value.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
