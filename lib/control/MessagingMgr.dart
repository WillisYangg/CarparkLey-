import 'package:share/share.dart';

class MessagingMgr {
  //to enable sharing carpark feature
  dynamic shareCarpark(String cpName) {
    Share.share(
        'Hey! Check out this $cpName and all its real time info below: \ncarparkInformation');
  }
}
