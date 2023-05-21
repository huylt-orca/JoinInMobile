import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtPassword = TextEditingController();
  bool _isPasswordVisible = true;

  final formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value){
    if (value == null || value.isEmpty){
      return "Please enter Email";
    }
    return null;
  }

  String? _validatePassword(String? value){
    if (value == null || value.isEmpty){
      return "Please enter Password";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double _heightDevice = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: _heightDevice,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(background_login),
                  fit: BoxFit.cover
                )
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: _heightDevice * 0.05,),
                  Center(
                    child: Image(
                     image: AssetImage(logoapp),
                    ),
                  ),
                  SizedBox(height: _heightDevice * 0.07,),
                  Text("Login",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Form(
                      key: formKey,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _txtEmail,
                              validator: _validateEmail,
                              style: TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline_outlined, color: Colors.white),
                                  labelText: "Email",
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white), // Border color
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white), // Border color when focused
                                 ),

                              ),
                            ),
                            const SizedBox(height: 30,),
                            TextFormField(
                              obscureText: _isPasswordVisible,
                              controller: _txtPassword,
                              validator: _validatePassword,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.fingerprint, color: Colors.white,),
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                  child:  Icon(
                                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white), // Border color
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white), // Border color when focused
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: (){},
                                  child: const Text('Forgot Password?',
                                      style: TextStyle(
                                          color: Colors.white
                                      )
                                  ),
                                ),
                                OutlinedButton(
                                    onPressed: (){},
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: Colors.white)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('LOGIN',
                                        style: TextStyle(
                                            color: Colors.white
                                        ),),
                                    )
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("- - - - - - - - - - - - OR - - - - - - - - - - - -",style: TextStyle(color: Colors.white),),
                      const SizedBox(height: 10,),
                      OutlinedButton(
                          onPressed: (){},
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.white
                            )
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.g_mobiledata_outlined,color: Colors.white,),
                              Text('Sign-in with Google',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpScreen()),
                            );
                          },
                          child: Text.rich(
                              TextSpan(
                                  text: "Don't have an Account?",
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: " Sign up",
                                        style: TextStyle(
                                            color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600
                                        )
                                    )
                                  ]
                              )
                          )
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
