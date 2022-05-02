import 'package:flutter/material.dart';

import 'screens/description_page.dart';
import 'screens/favorite_page.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  'Home': (context) => const HomePage(),
  'Description': (context) => const DescriptionPage(),
  'Favorite': (context) => const FavoritePage(),
  'Login': (context) => const LoginPage(),
  'Signup': (context) => const SignupPage(),
};
