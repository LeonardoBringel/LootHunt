import 'package:flutter/cupertino.dart';

import 'screens/description_page.dart';
import 'screens/home_page.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  'HomePage': (context) => const HomePage(),
  'DescriptionPage': (context) => const DescriptionPage(),
};
