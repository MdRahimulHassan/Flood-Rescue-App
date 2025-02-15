import 'package:flutter/material.dart';
import 'home_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _birthDate = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool _isObscured1 = true;
  bool _isObscured2 = true;

  void _signup() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900), // Set the earliest selectable date
      lastDate: DateTime(2100),  // Set the latest selectable date
    );

    if (pickedDate != null) {
      _birthDate.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}"; // Format date as DD/MM/YYYY
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Image.asset('assets/images/signup.png', height: 250),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _firstName,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                      //prefixIcon: Icon(Icons.man),
                      errorStyle: TextStyle(color: Colors.red),
                    ),
                    validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter First Name' : null,
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _lastName,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                      //prefixIcon: Icon(Icons.email),
                      errorStyle: TextStyle(color: Colors.red),
                    ),
                    validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter Last Name' : null,
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _birthDate,
                    decoration: InputDecoration(
                      labelText: 'Birth Date',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                      errorStyle: TextStyle(color: Colors.red),
                    ),
                    readOnly: true, // Prevents manual typing
                    onTap: () => _selectDate(context),
                    /*validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter Birth Date' : null,*/
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      errorStyle: TextStyle(color: Colors.red),
                    ),
                    validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter email' : null,
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _phoneNumber,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.mobile_friendly),
                      errorStyle: TextStyle(color: Colors.red),
                    ),
                    validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter Phone Number' : null,
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _password,
                    obscureText: _isObscured1,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      errorStyle: TextStyle(color: Colors.red),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscured1 ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscured1 = !_isObscured1;
                          });
                        },
                      ),
                    ),
                    validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter Password' : null,
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _confirmPassword,
                    obscureText: _isObscured2,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      errorStyle: TextStyle(color: Colors.red),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscured2 ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscured2 = !_isObscured2;
                          });
                        },
                      ),
                    ),
                    validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter Confirm Password' : null,
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: _signup,
                    child: const Text("SIGN UP"),
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
