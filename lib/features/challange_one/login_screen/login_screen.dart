import 'package:flutter/material.dart';
import 'package:flutter_animations/features/challange_one/home_screen/home_screen.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 62, 169),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Lets Get You Signed in',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 5),
              const Text(
                'Please Enter your login info to continue',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),

              const SizedBox(height: 35),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email Address:',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      hint: Text(
                        'Enter Email',
                        style: TextStyle(color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey.shade200,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    'Password:',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      hint: Text(
                        'Enter Password',
                        style: TextStyle(color: Colors.white),
                      ),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey.shade200,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Forget Password',
                      style: TextStyle(color: Colors.grey.shade800),
                    ),
                  ),

                  const SizedBox(height: 20),

                  MaterialButton(
                    color: Colors.blueAccent,
                    height: 45,
                    minWidth: double.infinity,
                    elevation: 0,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Align(
                    alignment: Alignment.center,
                    child: Text('or Continue with'),
                  ),

                  const SizedBox(height: 20),

                  Column(
                    spacing: 10,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'images/icons/google-icon-logo-svgrepo-com.svg',
                              width: 25,
                              height: 25,
                            ),
                            Text(
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                              'Continue with Google',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'images/icons/facebook-svgrepo-com.svg',
                              width: 25,
                              height: 25,
                            ),
                            Text(
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                              'Continue with Facebook',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'images/icons/apple-logo-svgrepo-com.svg',
                              width: 32,
                              height: 32,
                            ),
                            Text(
                              'Continue with Apple',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text('Don\'t have an Accout yet ? Register', style: TextStyle(color: Colors.white,),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
