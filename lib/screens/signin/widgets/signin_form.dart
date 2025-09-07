import 'package:flutter/material.dart';
import 'package:shopping_app_sprints/generated/l10n.dart';
import 'package:shopping_app_sprints/screens/signin/widgets/signin_field.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title:  Text(S.of(context).succcessfully),
          content: Text(S.of(context).sign_in_successfully),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/home');
              },
              child:  Text(S.of(context).close),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Text(
                S.of(context).sign_in,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailCtrl,
                decoration: fieldDecoration(S.of(context).email),
                validator: (val) =>
                    val != null && val.contains('@')
                        ? null
                        : "Enter valid email",
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passCtrl,
                obscureText: true,
                decoration: fieldDecoration(S.of(context).password),
                validator: (val) => val != null && val.length >= 6
                    ? null
                    : "Password must be at least 6 chars",
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 14, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: _submit,
                child: Text(S.of(context).sign_in),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
