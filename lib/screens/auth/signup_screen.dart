import 'package:expense_tracking_app/screens/auth/signin_screen.dart';
import 'package:expense_tracking_app/services/auth_service.dart';
import 'package:expense_tracking_app/widgets/checked_box.dart';
import 'package:expense_tracking_app/widgets/navigation_menu.dart';
import 'package:expense_tracking_app/widgets/round_button.dart';
import 'package:expense_tracking_app/widgets/round_icon_button.dart';
import 'package:expense_tracking_app/widgets/round_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserUp() {
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
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Sign Up',
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
        child: ListView(
          children: [
            const SizedBox(height: 70),
            RoundTextfield(labelName: 'Name', obscureText: false),
            const SizedBox(height: 20),
            RoundTextfield(
              labelName: 'Email',
              obscureText: false,
              controller: emailController,
            ),
            const SizedBox(height: 20),
            RoundTextfield(
              labelName: 'Password',
              obscureText: true,
              controller: passwordController,
              iconType: IconButton(
                icon: const Icon(
                  Icons.remove_red_eye_outlined,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const CheckedBox(),
                Flexible(
                  child: RichText(
                    text: const TextSpan(
                      text: 'By signing up, you agree to the ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Inter'),
                      children: [
                        TextSpan(
                          text: 'Terms of service and Privacy Policy',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF7F3DFF),
                              fontSize: 14,
                              fontFamily: 'Inter'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            RoundButton(
              btnName: 'Sign Up',
              onPressed: signUserUp,
              btnBackgroundColor: const Color(0xFF7F3DFF),
              btnTextColor: Colors.white,
            ),
            const SizedBox(height: 10),
            const Text(
              'Or with',
              style: TextStyle(
                color: Color(0xFF91919F),
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 10),

            //SIGN IN WITH GOOGLE BUTTON
            RoundIconButton(onPressed: () {
              AuthService().signInWithGoogle();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationMenu()));
            }),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
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
                            builder: (_) => const SignInScreen()));
                  },
                  child: const Text(
                    'Login',
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
