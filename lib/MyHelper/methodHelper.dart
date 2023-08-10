import 'package:intl/intl.dart';

class MethodHelper{

  static String formatCurrency(int number){


    String pattern = '###,###,###,##0';
    NumberFormat formatter = NumberFormat(pattern,'my_MM');

    String formattedCurrency = formatter.format(number);

    return formattedCurrency;

  }

  static String getCurrentTimeStamp(){

    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;

    return currentTimeInMillis.toString();
  }

  static String ConvertTimeStampToDate(String timestamp){

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    String formattedDate = DateFormat('yyyy-MM-dd hh:mm:aa').format(dateTime);

    return formattedDate;

  }
}
