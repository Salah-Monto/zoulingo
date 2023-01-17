import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoulingo/core/config/theme/light_theme.dart';
import 'package:zoulingo/core/config/utils/colors.dart';
import 'app/parts/main_part/modules/home/view/page/home.view.dart';
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
    return MaterialApp(
      title: 'Zoulingo',
      theme: getThemDataLight(),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
