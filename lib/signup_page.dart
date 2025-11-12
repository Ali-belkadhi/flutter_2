import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _birthYear = TextEditingController();
  final _billingAddress = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _birthYear.dispose();
    _billingAddress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inscription")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset('assets/images/minecraft.jpg',
                  height: 160, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _username,
                    decoration: const InputDecoration(labelText: 'Username'),
                    validator: (v) =>
                    (v == null || v.isEmpty) ? 'Obligatoire' : null,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) =>
                    (v == null || !v.contains('@')) ? 'Email invalide' : null,
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(labelText: 'Mot de passe'),
                    obscureText: true,
                    validator: (v) =>
                    (v == null || v.length < 6) ? 'Min 6 caractères' : null,
                  ),
                  TextFormField(
                    controller: _birthYear,
                    decoration:
                    const InputDecoration(labelText: 'Année de naissance'),
                    keyboardType: TextInputType.number,
                    validator: (v) =>
                    (v == null || v.length != 4) ? 'AAAA' : null,
                  ),
                  TextFormField(
                    controller: _billingAddress,
                    decoration: const InputDecoration(
                        labelText: 'Adresse de facturation'),
                    validator: (v) =>
                    (v == null || v.isEmpty) ? 'Obligatoire' : null,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // TODO: envoyer au backend
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Inscription réussie')),
                              );
                            }
                          },
                          child: const Text("S'inscrire"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Annuler'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
