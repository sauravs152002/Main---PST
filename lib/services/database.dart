import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

String? docid;

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<String> adddevice(String Deviceno, String idno,
    {String? uid}) async {
  //String start='', end='', name = '', time = '';
  SharedPreferences.getInstance().then((prefs) => {
        firestore.collection('Device').add({
          'Deviceno': '${Deviceno}',
          'idno': '${idno}',
          'riderList': " "
        }).then((value) => {print('Added Device')})
      });
  return 'Success';
}

Future<List?> getDeviceData() async {
  Future<Map> data;
  List rideList = [];
  Map rideList1 = {};
  List templist = [];
  try {
    var snapshot = await firestore.collection('ride-table').get();
    for (var doc in snapshot.docs) {
      rideList1 = doc.data();
      rideList1.putIfAbsent('id', () => doc.id);
      rideList.add(rideList1);
    }
    return rideList;
  } catch (e) {}
}



Future<Map?> getRideById(docID) async {
  Future<Map> data;
  List rideList = [];
  Map rideList1 = {};
  List templist = [];
  try {
    var document =
        FirebaseFirestore.instance.collection('ride-table').doc(docID);
    var snapshot = await document.get();
    if (snapshot.exists) {
      Map<String, dynamic>? data = snapshot.data();
      if (data != null) {
        rideList1 = data;
      }
    }

    return (rideList1);
  } catch (e) {}
}


Future<void> storeValues() async {
  String uid = '', email = '';
  SharedPreferences.getInstance().then((prefs) => {
        firestore.collection('users').add({
          'uid': '${prefs.getString('uid')}',
          'email': '${prefs.getString('useremail')}'
        }).then((value) => {print('')})
      });
}