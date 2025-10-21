import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lets Get You Signed in'),
            Text('Please Enter your login info to continue'),
        
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email Address'),
                TextField(
                  decoration: InputDecoration(
                    hint: Text('Enter email'),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),
        
                SizedBox(height: 20,),
                Text('Email Address'),
                TextField(
                  decoration: InputDecoration(
                    hint: Text('Enter email'),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),

                SizedBox(height: 20,),
                
                Align(
                  alignment: Alignment.topRight,
                  child: Text('Forget Password', style: TextStyle(
                    color: Colors.grey.shade800
                  ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}