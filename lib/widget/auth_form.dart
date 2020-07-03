import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  //global key to validate
  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;

  String _userEmail = '';
  String _userUserName = '';
  String _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();

    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      print(_userEmail);
      print(_userUserName);
      print(_userPassword);
      //use those values to send our auth request...
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              //key required to validate the form
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                    ),
                    onSaved: (newValue) {
                      _userEmail = newValue;
                    },
                  ),
                  //if condition to hide userName field in login section
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('userName'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Please enter atleast 4 cahracter';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'UserName',
                      ),
                      onSaved: (newValue) => _userUserName = newValue,
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return 'Password must be at least 7 character long';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'password'),
                    obscureText: true,
                    onSaved: (newValue) => _userPassword = newValue,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  RaisedButton(
                    onPressed: _trySubmit,
                    child: Text(_isLogin ? 'Login' : 'Signup'),
                  ),
                  FlatButton(
                    onPressed: () {
                      //setState to change from login to signup
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(
                      _isLogin
                          ? 'Create new account'
                          : 'I already have an account',
                    ),
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
