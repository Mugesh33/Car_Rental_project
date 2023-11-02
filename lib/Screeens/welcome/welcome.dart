import 'package:car_rental_project/Screeens/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import '../sign_in/sign_in.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.pink,
              Colors.black,
            ])),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 120),
          //    child:  Image.network("https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",height: 159),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "WELCOME",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            const SizedBox(
              height:15 ,
            ),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white)
                ),
                child: const Center(
                  child: Text("SIGN IN",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                ),
              ),
            ),
            const SizedBox(
              height:15 ,
            ),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Signup()),
                );
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white)
                ),
                child: const Center(
                  child: Text("SIGN UP",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}