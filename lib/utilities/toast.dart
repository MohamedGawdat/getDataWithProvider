
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ibtikar_test/style/app_colours.dart';

showToast({required String msg}){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.alertColor,
      // backgroundColor: AppColors.PRIMARY,
      textColor: AppColors.MainTextColor,
      fontSize: 16.0
  );
}