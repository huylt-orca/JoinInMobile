import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

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

  String? _validateUsername(String? value){
    if (value == null || value.isEmpty){
      return "Please enter Username";
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
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
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
                  const SizedBox(height: 90,),
                  Center(
                    child: Image(
                     image: AssetImage(logoapp),
                    ),
                  ),
                  const SizedBox(height: 70,),
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
                              validator: _validateUsername,
                              style: TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline_outlined, color: Colors.white),
                                  labelText: "Username",
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintText: "Username",
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
                                      padding: const EdgeInsets.all(20.0),
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
