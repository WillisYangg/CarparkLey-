import 'package:cloud_firestore/cloud_firestore.dart';

class FavouritesDatabase {

  final String uid;
  List carparkInfoList = [];
  List carparkInformationList = [];
  List carparkNameList = [];

  FavouritesDatabase(this.uid);

  // favourites collection reference
  final CollectionReference favouritesCollection = FirebaseFirestore.instance
      .collection('Favourites');

  Future<void> updateUserData(List<dynamic> cpInfo, String cpName,
      List<dynamic> carparkInformation) async {

    await favouritesCollection.doc(uid).collection("carparks").doc(DateTime.now().millisecondsSinceEpoch.toString()).set(
        {'Carpark Info': cpInfo,
          'Carpark Name': cpName,
          'Carpark Information': carparkInformation,}
    );
  }

  Future getUserList() async {

    try {
      final carpark = (await favouritesCollection.doc(uid).collection(
          "carparks").get()).docs;
      for (var i = 0; i < carpark.length; i++) {
        DocumentSnapshot cp = carpark[i];
        carparkInfoList.add(cp['Carpark Info']);
        carparkInformationList.add(cp["Carpark Information"]);
        carparkNameList.add(cp["Carpark Name"]);
      }
    }
    catch (e) {
      print(e);
    }
  }
}