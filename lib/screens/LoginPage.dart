import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'SignupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log In'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/login.png', height: 250),

                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email', // This remains in default color
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      errorStyle: TextStyle(color: Colors.red), // Only the error text will be red
                    ),
                    validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter email' : null,
                  ),



                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isObscured,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      errorStyle: TextStyle(color: Colors.red),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscured ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      ),
                    ),
                    validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter password' : null,
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: _login,
                    child: const Text("LOGIN"),
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("              Don't have an account?"),
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignupPage()),
                        ),
                        child: const Text("Sign Up"),
                      ),// Normal text
                      /*TextFormField(
                        decoration: InputDecoration(labelText: "Enter your email"),
                      ),*/
                    ],
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
