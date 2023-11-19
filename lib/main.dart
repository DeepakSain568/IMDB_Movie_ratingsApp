import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MVVM/utils/routes/routes.dart';
import 'MVVM/utils/routes/routes_names.dart';
import 'MVVM/view/login_screen.dart';
import 'MVVM/view_model/auth_view_model.dart';
import 'MVVM/view_model/home_viewmodel.dart';
import 'MVVM/view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthViewModel(),
          ),
          ChangeNotifierProvider(create: (context) => UserViewModel()),
          ChangeNotifierProvider(create: (context) => MoviesData())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          home: LoginScreen(),
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
