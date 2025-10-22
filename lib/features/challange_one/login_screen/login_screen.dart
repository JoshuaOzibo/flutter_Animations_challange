import 'package:flutter/material.dart';
import 'package:flutter_animations/features/challange_one/home_screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const Text('Lets Get You Signed in', style: TextStyle(
                fontSize: 25
              ),),
              const SizedBox(height: 5,),
              const Text('Please Enter your login info to continue', style: TextStyle(
                fontSize: 16
              ),),
          
              const SizedBox(height: 35,),
          
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email Address'),
                  TextField(
                    decoration: InputDecoration(
                      hint: Text('Enter email'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey.shade200,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
          
                  const SizedBox(height: 20),
                  const Text('Email Address'),
                  TextField(
                    decoration: InputDecoration(
                      hint: Text('Enter email'),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey.shade200,
                        ),
                        borderRadius: BorderRadius.circular(20),
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
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child:const Text(
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
                      OutlinedButton(
                        onPressed: () {},
                        child: SizedBox(
                          width: double.infinity,
                          child:const Text('Continue with Google', textAlign: TextAlign.center,)),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: SizedBox(
                          width: double.infinity,
                          child:const Text('Continue with Facebook', textAlign: TextAlign.center,)),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: SizedBox(
                          width: double.infinity,
                          child: const Text('Continue with Apple', textAlign: TextAlign.center,)),
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text('Don\'t have an Accout yet ? Register'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
