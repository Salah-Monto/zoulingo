import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoulingo/core/config/theme/light_theme.dart';
import 'package:zoulingo/core/config/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/HomeTabs/home_view.dart';
// import 'package:device_preview/device_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
      statusBarBrightness: Brightness.light,
    ));
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Zoulingo',
            theme: getThemDataLight(),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        });
  }
}
