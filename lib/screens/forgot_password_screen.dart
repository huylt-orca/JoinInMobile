
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../constants.dart';
import 'login_screen.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtPassword = TextEditingController();
  TextEditingController _txtPasswordConfirm = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = true;
  bool _isPasswordConfirmVisible = true;

  String? _validatePassword(String? value){
    if (value == null || value.isEmpty){
      return "Please enter Password";
    }
    if (value.length < 8 || value.length > 40){
      return "Password must be between 8-40 characters";
    }
    return null;
  }
  String? _validateEmail(String? value){
    if (value == null || value.isEmpty){
      return "Please enter Email";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double _heightDevice = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(color: Colors.black),
        ),
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
                Text("Forgot Password",
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
                      child:Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
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
                            const SizedBox(height: 30,),
                            TextFormField(
                              obscureText: _isPasswordConfirmVisible,
                              controller: _txtPasswordConfirm,
                              validator: _validatePassword,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.fingerprint, color: Colors.white,),
                                labelText: "Confirmed Password",
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: "Confirmed Password",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isPasswordConfirmVisible = !_isPasswordConfirmVisible;
                                    });
                                  },
                                  child:  Icon(
                                    _isPasswordConfirmVisible ? Icons.visibility : Icons.visibility_off,
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
                            Align(
                              alignment: Alignment.centerRight,
                              child: OutlinedButton(
                                onPressed: () {
                                },
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.white),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: const Text ("Submit",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
