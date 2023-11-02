import 'dart:async';
import 'package:car_rental_project/Screeens/utils/helper/shared_preference.dart';
import 'package:car_rental_project/Screeens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import '../dashboard/home.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {


  String? _email;
  @override
  void initState(){
    super.initState();
    getEmail().then((value) {
      setState(() {
        _email = value;
        print("shared pref mail id $_email");
      });
    });
    Timer(const Duration(seconds: 3),(){
      if(_email == '') {
        Navigator.of(context).
        pushReplacement(
            MaterialPageRoute(builder: (context) => const Welcome()));
      }else{
        Navigator.of(context).
        pushReplacement(
            MaterialPageRoute(builder: (context) => const Homepage()));
      }
    });

    if(_email == ''){
      print("navigate to signUp");
    }else{
      print("navigate to Home");
    }
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
          //  Image.network("https://www.bing.com/images/search?view=detailV2&ccid=cgn%2BxpT3&id=45DC873B46C9BBD7E2EF22B5C9DD558CF8D851AB&thid=OIP.cgn-xpT3-5vXCKnk1arLUgAAAA&mediaurl=https%3A%2F%2Fstatic.vecteezy.com%2Fsystem%2Fresources%2Fthumbnails%2F005%2F548%2F771%2Fsmall_2x%2Fmodern-shape-automotive-car-sport-logo-icon-illustration-design-vector.jpg&exph=400&expw=400&q=car+logo+png&form=IRPRST&ck=7680F8199CA164A0AD1F90D43F90C183&selectedindex=2&ajaxhist=0&ajaxserp=0&vt=0&sim=11&pivotparams=insightsToken%3Dccid_T%252Bw%252FU4lJ*cp_E3E5207E96832A7542044F49EAD5B4CE*mid_B250215124C5178B802AC4F8147F7EE2568197DB*simid_608001747169116706*thid_OIP.T-w!_U4lJjBcFZUTrxRh5MgHaHa&simid=607994776432635777"),
            // Image.asset(
            //   'assets/new.png',
            //   height: 350,
            //   width: 250,

            // ),
            Text("Cars 24",style: TextStyle(fontSize: 50,fontFamily: AutofillHints.addressCity,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }

}