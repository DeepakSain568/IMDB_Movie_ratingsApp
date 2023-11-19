import 'package:flutter/material.dart';

class Utility {
  //controllers  
        //login
  static TextEditingController loginemail = TextEditingController();
  static TextEditingController loginpassword = TextEditingController();
       // signup
 static TextEditingController signupemail = TextEditingController();
  static TextEditingController signuppassword = TextEditingController();

  // focus chnage function
  static Changefocus(
      FocusNode current, FocusNode Nextfocus, BuildContext context) {
    current.unfocus();
    FocusScope.of(context).requestFocus(Nextfocus);
  }
}
