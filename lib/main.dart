import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_app/Utilities/Theme/theme.dart';
import 'package:my_first_flutter_app/features/Onboarding/onboarding_screen.dart';
import 'package:my_first_flutter_app/Utilities/constants/lang_english.dart';
import 'firebase_options.dart';
Future<void>  main()  async {

  //Todo: Add widgets binding
  final  WidgetsBinding widgetbinding =  WidgetsFlutterBinding.ensureInitialized();
  //Todo: init Local Storage
  //Todo await Native splash
  //Todo initialize firebase

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
      //.then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  //Todo initialize Authentication

runApp( MakeSplash());
}


class MakeSplash extends StatelessWidget {
  const MakeSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home:  OnboardingScreen(),
      //title: English.appName,
    );
  }
}
