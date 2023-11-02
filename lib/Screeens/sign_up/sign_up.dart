import 'package:car_rental_project/Screeens/dashboard/home.dart';
import 'package:car_rental_project/Screeens/utils/helper/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../sign_in/sign_in.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();
  bool passToggle = true;

  Future<void> saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
  }

  Future<String?> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName');
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formfield,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.pink,
                    Colors.black,
                  ])),
              child: const Padding(
                padding: EdgeInsets.only(top: 60, left: 22),
                child: Text(
                  'Create Your\nAccount',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 135.0),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Colors.white),
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _textField(controller: nameController,text: "name",iconData: Icons.person,reg: r'^[a-zA-Z ]+$'),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.mail,
                              color: Colors.pink,
                            ),
                            label: Text(
                              'Gmail',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              ),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Email";
                          }
                          bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (value.isEmpty) {
                            return "Enter Email";
                          }
                          else if (!emailValid) {
                            return "Enter Valid Email";
                          }
                        },


                      ),TextFormField(
                          controller: passController,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.pink,
                              ),
                              label: Text(
                                'Password',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                ),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Password";
                            }
                            else if (passController.text.length < 6) {
                              return "password length should be more than 6 characters";
                            }
                          }


                      ),TextFormField(
                        controller: passController,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.pink,
                            ),
                            label: Text(
                              'Confirm password',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              ),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please re-enter your password';
                          }
                          if (value != passController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: () async{
                          if (_formfield.currentState!.validate()) {
                            setEmail(emailController.text.trim());
                            //await saveName(nameController.text);
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(
                                builder: (context) => const Homepage()));
                          }

                        },
                        child: Container(
                          height: 39,
                          width: 300,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.pink,
                                    Colors.black,
                                  ]
                              )
                          ),
                          child: const Center(
                            child: Text('SIGN UP',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white
                            ),),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("Alreay have account?",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const LoginPage()),
                                  );
                                },
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _textField({
    String? text, required TextEditingController controller,IconData? iconData,String? reg,validator
  })
  {
    return  TextFormField(
      controller: controller,
      decoration:  InputDecoration(
          suffixIcon: Icon(
            iconData,
            color: Colors.pink,
          ),
          label: Text(
            '$text',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          )),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your name';
        }
        if (!RegExp('$reg').hasMatch(value!)) {
          return 'Please enter a valid name';
        }
        return null;
      },


    );
  }
}
//r'^[a-zA-Z ]+$'