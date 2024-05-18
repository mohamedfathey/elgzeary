import 'package:flutter/material.dart';
import 'package:login_app_project/Authtentication/login.dart';
import 'package:login_app_project/database/dbHandler.dart';

class SigUpScreen extends StatefulWidget {
  const SigUpScreen({super.key});

  @override
  State<SigUpScreen> createState() => _SigUpScreenState();
}

class _SigUpScreenState extends State<SigUpScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  bool isVisiable = false;
  final formKey = GlobalKey<FormState>();

  void handleSignUp() async {
    if (formKey.currentState!.validate()) {
      if (password.text == confirmPassword.text) {
        int id = await DataBaseHandler().signUp(username.text, password.text);
        if (id > 0) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Sign-up successful! Please log in.')));
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Sign-up failed! Please try again.')));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Passwords do not match')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("lib/assets/main.png"),
          fit: BoxFit.fill,
        )),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ListTile(
                  title: Text("Register New Account",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 211, 139, 13)
                          .withOpacity(.2)),
                  child: TextFormField(
                    controller: username,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      border: InputBorder.none,
                      hintText: "Username",
                    ),
                  ),
                ),
                // PASSWORD
                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 211, 139, 13)
                          .withOpacity(.2)),
                  child: TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    obscureText: !isVisiable,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisiable = !isVisiable;
                              });
                            },
                            icon: Icon(isVisiable
                                ? Icons.visibility_off
                                : Icons.visibility))),
                  ),
                ),
                // CONFIRM PASSWORD
                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 211, 139, 13)
                          .withOpacity(.2)),
                  child: TextFormField(
                    controller: confirmPassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Confirm password is required";
                      } else if (password.text != confirmPassword.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                    obscureText: !isVisiable,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "Confirm Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisiable = !isVisiable;
                              });
                            },
                            icon: Icon(isVisiable
                                ? Icons.visibility_off
                                : Icons.visibility))),
                  ),
                ),
                // SIGN UP BUTTON
                Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 155, 101, 7)),
                    child: TextButton(
                        onPressed: handleSignUp,
                        child: const Text("SIGN UP",
                            style: TextStyle(
                              color: Colors.white,
                            )))),
                // LOGIN BUTTON
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account ?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text("LOG IN"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
