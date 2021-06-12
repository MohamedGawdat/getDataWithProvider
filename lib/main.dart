import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'data/providers/home_screen_provider.dart';
import 'style/app_theme.dart';
import 'ui/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(720, 1600),
      builder: () => MaterialApp(
        title: 'Flutter Ibtikar Task',
        theme: AppTheme.APP_THEME,
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
            create: (context) => HomeScreenProvider(),
            builder: (context, child) =>
                HomeScreen(title: 'Flutter Ibtikar Task')),
        builder: EasyLoading.init(),
      ),
    );
  }
}
