import 'package:expense_tracking_app/screens/auth/signup_screen.dart';
import 'package:expense_tracking_app/widgets/navigation_menu.dart';
import 'package:expense_tracking_app/widgets/round_button.dart';
import 'package:expense_tracking_app/widgets/round_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {
    // SHOW LOADING CIRCLE
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    // TRY SIGN IN
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // POP THE LOADING CIRCLE
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const NavigationMenu()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Sign In',
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(height: mq.height * .25),
            RoundTextfield(
              labelName: 'Email',
              obscureText: false,
              controller: emailController,
            ),
            const SizedBox(height: 20),
            RoundTextfield(
              labelName: 'Password',
              controller: passwordController,
              obscureText: true,
              iconType: IconButton(
                icon: const Icon(
                  Icons.remove_red_eye_outlined,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 25),
            RoundButton(
              btnName: 'Sign In',
              btnBackgroundColor: const Color(0xFF7F3DFF),
              onPressed: signUserIn,
              btnTextColor: Colors.white,
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Does not have an account? ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      color: Color(0xFF91919F)),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SignupScreen()));
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      color: Color(0xFF7F3DFF),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF7F3DFF),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
