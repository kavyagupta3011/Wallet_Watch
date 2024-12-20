import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallet_watch/forgot_password.dart';
import 'package:wallet_watch/register.dart';



class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  //controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
                child: Column(children: [
          const SizedBox(height: 50),
          //logo
          const Icon(
            Icons.android,
            size: 100,
          ),
          const SizedBox(height: 25),

          // Hello again!
          const Text('Hello Again!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )),
          const SizedBox(height: 10),
          const Text(
            'Welcome back',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          // email Textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ), // BoxDecoration
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  controller: _emailController, //get input that user inputs
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // password textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ), // BoxDecoration
              child: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                ),
              ),
            ),
          ),

                  const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ForgotPasswordPage();
                    },
                    ),
                    );
                    },
                  child: Text('Forgot Password?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          //sign in button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: signIn,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ),
                  ],
                ),
        ]))));
  }
}
