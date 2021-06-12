import 'package:connectivity/connectivity.dart';

import 'toast.dart';


Future<bool> checkInternetConnection()async{
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    print('mobile network');
    return true;
// I am connected to a mobile network.
  } else if (connectivityResult == ConnectivityResult.wifi) {
    print('wifi network');
    return true;

// I am connected to a wifi network.
  }else if (connectivityResult == ConnectivityResult.none) {
    showToast(msg: 'Network Connection Error');

    print('no network');
    return false;

// I am connected to a wifi network.
  }
  else return false;
}
