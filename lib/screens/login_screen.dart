import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/dio_service.dart';
import '../screens/paket_overview_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  final DioService _dioService = DioService();

  bool isLoading = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16),
            isLoading
                ? CircularProgressIndicator.adaptive()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      // if (_emailController.text != '' &&
                      //     _passwordController != '') {
                      //   User user = User(
                      //     email: _emailController.text,
                      //     password: _passwordController.text,
                      //   );
                      //   print(user.toJson());
                      //   User? retrievedUser = await _dioService.login();
                      //   print(retrievedUser);
                      //   if (retrievedUser != null) {
                      Navigator.of(context)
                          .pushNamed(PaketOverviewScreen.routeName);
                      //   }
                      // }
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
