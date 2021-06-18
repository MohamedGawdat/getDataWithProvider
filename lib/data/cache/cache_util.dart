
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class CacheUtil {

  static Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

  }

  static void save(String key, dynamic value)async {
    var box = await Hive.openBox('peopleFirstPageBox');

    box.put(key, value );

  }

  static  get(String key)async {
    var box = await Hive.openBox('peopleFirstPageBox');
    return box.get(key);
  }

  static void clearCache() {
    Hive.deleteFromDisk();
  }


}
