import 'package:connectivity/connectivity.dart';
import 'toast.dart';

Future<bool> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else if (connectivityResult == ConnectivityResult.none) {
    showToastError(msg: 'Network Connection Error');

    return false;
  }
  return false;
}
