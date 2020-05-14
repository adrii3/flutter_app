import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget{
  final String title="Registro";

  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
              validator: (String value) {
                if (value.isEmpty) {
                  return "Introduce texto";
                }
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Contraseña"),
              validator: (String value) {
                if (value.isEmpty) {
                  return "Introduce texto";
                }
              },
            ),
            Container(
              alignment: Alignment.center,
              child: Text(_success == null
                  ? ''
                  : (_success
                  ? 'Registro con exito' + _userEmail
                  : 'Registro fallido'
              )
              ),
            ),
          ],
        ),
      ),
    );
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {
    final FirebaseUser user = await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      _success = true;
      _userEmail = user.email;
    }
  }
}