import 'package:another_flushbar/flushbar.dart';
import 'package:http_amdb/MVVM/resources/components/round_button.dart';
import 'package:http_amdb/MVVM/utils/Controls.dart';
import 'package:http_amdb/MVVM/utils/routes/routes_names.dart';
import 'package:http_amdb/MVVM/utils/utils.dart';
import 'package:http_amdb/MVVM/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  ValueNotifier<bool> _obsecurepassword = ValueNotifier(true);
  //focus nodes
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _obsecurepassword.dispose();
    Utility.signupemail.dispose();
    Utility.signuppassword.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authenticate = Provider.of<AuthViewModel>(context, listen: true);
    return Scaffold(

        appBar: AppBar(
          title: Center(child: Text('SignupScreen')),
                  automaticallyImplyLeading: false,

        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  controller: Utility.signupemail,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _emailFocusNode,
                  onFieldSubmitted: (value) => Utility.Changefocus(
                      _emailFocusNode, _passwordFocusNode, context),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.alternate_email),
                  ),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: ValueListenableBuilder(
                    valueListenable: _obsecurepassword,
                    builder: (context, value, child) => TextFormField(
                        controller: Utility.signuppassword,
                        obscureText: _obsecurepassword.value,
                        focusNode: _passwordFocusNode,
                        // onFieldSubmitted:Utility.Changefocus(Utility._passwordFocusNode, context),
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock_open_rounded),
                            suffixIcon: InkWell(
                                onTap: () {
                                  _obsecurepassword.value =
                                      !_obsecurepassword.value;
                                },
                                child: Icon(_obsecurepassword.value == true
                                    ? Icons.visibility_off
                                    : Icons.visibility_outlined)))),
                  )),
                
              SizedBox(
                height: 10,
              ),
              RoundButton(
                  title: 'signup',
                  loading: authenticate.Loading,
                  onPress: () {
                    if (Utility.signupemail.text.isEmpty) {
                      Utils.FlushBarErrorMessage('Email is empty', context);
                    } else if (Utility.signuppassword.text.isEmpty) {
                      Utils.FlushBarErrorMessage('Password is Empty', context);
                    } else {
                      dynamic body = {
                        'email': Utility.signupemail.text,
                        'password': Utility.signuppassword.text
                      };
                      Utility.signupemail.clear();
                      Utility.signuppassword.clear();
                      authenticate.signupApi(body, context);
                    }
                  }),

                      TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.Login);
                  },
                  child: Text('Already Have an Account press for login')),
            ],
          ),
        ));
  }
}
