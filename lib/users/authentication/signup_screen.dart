import 'dart:convert';

import 'package:clothes_app/api_connection/api_connection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  //validate the user email
  validateUserEmail() async{
    try {
      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'user_email' : emailController.text.trim()
        },
      );

      if(res.statusCode == 200) { //from flutter app the connection with api to sever -- success
        var resBody = jsonDecode(res.body);

        if(resBody['emailFound'] == true) {
          Fluttertoast.showToast(msg: 'Email is arlready in someone else use. Try another email !');
        } else {
          // register & save new user record to database
        }
      }

    } catch(e) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //signup screen header
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    width: MediaQuery.of(context).size.width,
                    height: 285,
                    child: Image.asset('assets/images/imageLogin.png'),
                  ),

                  SizedBox(height: 20,),

                  //signup screen signup form
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, -3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                        child: Column(
                          children: [

                            Text(
                                'Sign Up',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),

                            SizedBox(height: 10,),

                            //email_password_loginButton
                            Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    //name
                                    TextFormField(
                                        controller: emailController,
                                        validator: (value) => value == ''
                                            ? 'Please write name'
                                            : null,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: Colors.black,
                                            ),
                                            hintText: 'Name',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                              borderSide:
                                              BorderSide(color: Colors.white60),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(30),
                                                borderSide: BorderSide(
                                                    color: Colors.white60)),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                              borderSide:
                                              BorderSide(color: Colors.white60),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                              borderSide:
                                              BorderSide(color: Colors.white60),
                                            ),
                                            fillColor: Colors.white,
                                            filled: true
                                        )
                                    ),

                                    SizedBox(height: 15,),

                                    //email
                                    TextFormField(
                                        controller: emailController,
                                        validator: (value) => value == ''
                                            ? 'Please write email'
                                            : null,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.email,
                                              color: Colors.black,
                                            ),
                                            hintText: 'Email',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                              borderSide:
                                              BorderSide(color: Colors.white60),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(30),
                                                borderSide: BorderSide(
                                                    color: Colors.white60)),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                              borderSide:
                                              BorderSide(color: Colors.white60),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                              borderSide:
                                              BorderSide(color: Colors.white60),
                                            ),
                                            fillColor: Colors.white,
                                            filled: true
                                        )
                                    ),

                                    SizedBox(height: 15,),

                                    //password
                                    Obx(() {
                                      return TextFormField(
                                          controller: passwordController,
                                          obscureText: isObsecure.value,
                                          validator: (value) => value == ''
                                              ? 'Please write password'
                                              : null,
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.password_sharp,
                                                color: Colors.black,
                                              ),
                                              suffixIcon: Obx( () {
                                                return GestureDetector(
                                                  onTap: () {
                                                    isObsecure.value = !isObsecure.value;
                                                  },
                                                  child: Icon(
                                                    isObsecure.value ? Icons.visibility_off  : Icons.visibility,
                                                    color: Colors.black,
                                                  ),
                                                );
                                              }),
                                              hintText: 'Password',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(30),
                                                borderSide:
                                                BorderSide(color: Colors.white60),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(30),
                                                  borderSide: BorderSide(
                                                      color: Colors.white60)),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(30),
                                                borderSide:
                                                BorderSide(color: Colors.white60),
                                              ),
                                              disabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(30),
                                                borderSide:
                                                BorderSide(color: Colors.white60),
                                              ),
                                              fillColor: Colors.white,
                                              filled: true
                                          )
                                      );
                                    },),

                                    SizedBox(height: 15,),

                                    //button signup
                                    Material(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(30),
                                      child: InkWell(
                                        onTap: () {
                                          if(formKey.currentState!.validate()) {
                                            //validate the email
                                            validateUserEmail
                                          }
                                        },
                                        borderRadius: BorderRadius.circular(30),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                                          child: Text(
                                            'Sign Up',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                            ),

                            SizedBox(height: 10,),

                            //already have account button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an Account?',
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                ),

                                TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      'Login here',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                      ),
                                    )
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
