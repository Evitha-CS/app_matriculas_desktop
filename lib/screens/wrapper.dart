import 'package:app_matriculas_desktop/models/user.dart';
import 'package:app_matriculas_desktop/screens/home/home.dart';
import 'package:app_matriculas_desktop/screens/signup/signupForm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);
    
    if (user == null) {
      return SignUp();
    }
    else {
      return Home();
    }
  }
}