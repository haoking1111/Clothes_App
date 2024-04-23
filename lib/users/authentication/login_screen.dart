import 'package:clothes_app/users/authentication/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

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
                  //login screen header
                  Container(
                    margin: const EdgeInsets.only(top: 70),
                    width: MediaQuery.of(context).size.width,
                    height: 285,
                    child: Image.asset('assets/images/imageLogin.png'),
                  ),

                  const SizedBox(height: 20,),

                  //login screen sign-in form
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: const [
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
                              'Login Here',
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
                                    //email
                                    TextFormField(
                                        controller: emailController,
                                        validator: (value) => value == ''
                                            ? 'Please write email'
                                            : null,
                                        decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                              Icons.email,
                                              color: Colors.black,
                                            ),
                                            hintText: 'Email',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide:
                                                  const BorderSide(color: Colors.white60),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.white60)),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide:
                                                  const BorderSide(color: Colors.white60),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide:
                                                  const BorderSide(color: Colors.white60),
                                            ),
                                          fillColor: Colors.white,
                                          filled: true
                                        )
                                    ),

                                    const SizedBox(height: 20,),

                                    //password
                                    Obx(() {
                                      return TextFormField(
                                          controller: passwordController,
                                          obscureText: isObsecure.value,
                                          validator: (value) => value == ''
                                              ? 'Please write password'
                                              : null,
                                          decoration: InputDecoration(
                                              prefixIcon: const Icon(
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
                                                const BorderSide(color: Colors.white60),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(30),
                                                  borderSide: const BorderSide(
                                                      color: Colors.white60)),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(30),
                                                borderSide:
                                                const BorderSide(color: Colors.white60),
                                              ),
                                              disabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(30),
                                                borderSide:
                                                const BorderSide(color: Colors.white60),
                                              ),
                                              fillColor: Colors.white,
                                              filled: true
                                          )
                                      );
                                    },),

                                    const SizedBox(height: 20,),

                                    //button login
                                    Material(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(30),
                                      child: InkWell(
                                        onTap: () {

                                        },
                                        borderRadius: BorderRadius.circular(30),
                                        child: const Padding(
                                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                                            child: Text(
                                              'Login',
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

                            const SizedBox(height: 10,),

                            //dont have account button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Dont have an Account?',
                                  style: TextStyle(
                                    color: Colors.black
                                  ),
                                ),

                                TextButton(
                                    onPressed: () {
                                      Get.to(()=> const SignUpScreen());
                                    },
                                    child: const Text(
                                      'SignUp here',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                )
                              ],
                            ),

                            const Text(
                              'Or',
                              style: TextStyle(
                                color: Colors.white,
                                  fontWeight: FontWeight.w600
                              ),
                            ),

                            //admin
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                    'Are you an Admin',
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                ),

                                TextButton(
                                    onPressed: () {

                                    },
                                    child: const Text(
                                      'Click here',
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
