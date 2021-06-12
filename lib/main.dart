import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:ibtikar_test/ui/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'data/providers/home_screen_provider.dart';
import 'style/app_theme.dart';
import 'ui/home/home_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  // await Hive.initFlutter();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(720, 1600),
      builder: () => MaterialApp(
        title: 'Ibtikar Task',
        theme: AppTheme.APP_THEME,
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
            create: (context) => HomeScreenProvider(),
            builder: (context, child) =>
                SplashScreen()),
        builder: EasyLoading.init(),
      ),
    );
  }
}
