import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'SignupPage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/WelcomeScreenBg.png'),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 0),
            const Text(
              "WELCOME TO",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
              ),
            ),
            const Text(
              "FLOOD RESCUE APP",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold,color:Colors.yellow,),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              ),
              child: const Text("LOGIN"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignupPage()),
              ),
              child: const Text("SIGNUP"),
            ),
          ],
        ),
      ),
    );
  }
}
