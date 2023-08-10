import 'package:shared_preferences/shared_preferences.dart';

class DataPref {


  static Future<String> getusrname() async {
    var usrpref = await SharedPreferences.getInstance();
    var usrdata = usrpref.getString('key') ?? 'admin';

    return usrdata.toString();
  }

  static Future<String> getPsw() async {
    var pswpref = await SharedPreferences.getInstance();
    var psw = pswpref.getString('key') ?? 'admin';

    return psw.toString();
  }
}
