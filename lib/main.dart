import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/auth/view/intro_screen.dart';
import 'package:okiku/modules/auth/view/login_screen.dart';
import 'package:okiku/modules/detail/view/create_detail_view.dart';
import 'package:okiku/routes/app_pages.dart';
import 'package:okiku/themes/app_themes.dart';
import 'package:okiku/firebase_options.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Firebase initialization failed: \$e');
    return;
  }

  const storage = FlutterSecureStorage();
  String? token;

  try {
    token = await storage.read(key: 'token');
  } catch (e) {
    print('SecureStorage read failed: \$e');
  }

  String? firstInstal;
  const install = FlutterSecureStorage();
  firstInstal = await install.read(key: 'firstInstall');
  print(firstInstal);

  String? initialRoute;
  if (firstInstal == null) {
    await install.write(key: 'firstInstall', value: 'true');
    initialRoute = Routes.INTRO;
  } else if (token == null) {
    initialRoute = Routes.LOGIN;
  } else {
    initialRoute = Routes.NAVBAR;
  }

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemes.lightTheme,
      getPages: AppPages.route,
      initialRoute: initialRoute,
      // home: IntroScreen(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id', 'ID'), Locale('en', 'US')],
    );
  }
}
