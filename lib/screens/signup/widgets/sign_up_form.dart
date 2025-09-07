import 'package:flutter/material.dart';
import 'package:shopping_app_sprints/generated/l10n.dart';
import 'sign_up_field.dart';
import 'sign_up_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("🎉 Success"),
          content: const Text("Account created successfully"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text(S.of(context).close),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(  
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).create_account,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SignUpField(
                    controller: _nameCtrl,
                    label: S.of(context).full_name,
                    validator: (val) {
                      if (val == null || val.isEmpty) return "Enter your name";
                      if (val[0] != val[0].toUpperCase()) {
                        return "First letter must be uppercase";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  SignUpField(
                    controller: _emailCtrl,
                    label: S.of(context).email,
                    validator: (val) =>
                        val != null && val.contains('@')
                            ? null
                            : "Enter valid email",
                  ),
                  const SizedBox(height: 16),
                  SignUpField(
                    controller: _passCtrl,
                    label: S.of(context).password,
                    isPassword: true,
                    validator: (val) =>
                        val != null && val.length >= 6
                            ? null
                            : "Password must be at least 6 chars",
                  ),
                  const SizedBox(height: 16),
                  SignUpField(
                    controller: _confirmCtrl,
                    label: S.of(context).confirm_password,
                    isPassword: true,
                    validator: (val) =>
                        val == _passCtrl.text ? null : "Passwords do not match",
                  ),
                  const SizedBox(height: 24),
                  SignUpButton(onPressed: _submit),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
