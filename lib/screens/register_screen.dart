import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/login_screen.dart';
import '../providers/user.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _form = GlobalKey<FormState>();
  final _passwordFocus = FocusNode();

  bool isLoading = false;
  var _isObscure = true;
  var _editedUser = User(
    email: '',
    password: '',
  );

  @override
  void dispose() {
    _passwordFocus.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState?.save();
    final message =
        await Provider.of<Users>(context, listen: false).register(_editedUser);
    // print(message);
    if (message == null) {
      return;
    } else if (message == "User Created Successfully") {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screenHeight < 600
                    ? MediaQuery.of(context).size.height * 0.6
                    : MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/banner.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _form,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Email', suffixIcon: Icon(Icons.mail)),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_passwordFocus);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a email.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedUser = User(
                            email: value!,
                            password: _editedUser.password,
                          );
                        },
                      ),
                      TextFormField(
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                        ),
                        focusNode: _passwordFocus,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (_) {
                          _saveForm();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedUser = User(
                            email: _editedUser.email,
                            password: value!,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      isLoading
                          ? const CircularProgressIndicator.adaptive()
                          : Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      elevation: MaterialStateProperty.all(3),
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      await _saveForm();
                                      setState(() {
                                        isLoading = false;
                                      });
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                              ),
                            ],
                          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed(
                                LoginScreen.routeName,
                              );
                            },
                            child: Text(
                              "  Sign in",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
