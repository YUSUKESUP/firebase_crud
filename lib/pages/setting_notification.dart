import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/firebase_provider.dart';



class SettingPage extends ConsumerWidget {
  SettingPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final  firebaseNotifications = ref.watch(firebaseNotificationsProvider);


    const divider = Divider(
      thickness: 2,
      height: 0,
      color: Colors.black12,
    );

    return Scaffold(
        backgroundColor: const Color(0xffFDF3E6),
        appBar: AppBar(
          backgroundColor: const Color(0xffFDF3E6), centerTitle: true,

          leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('通知設定ページ',
            style: TextStyle(color: Colors.black),
          ),

        ),
        body: Column(
          children: [
            ListTile(
              trailing: CupertinoSwitch(
                activeColor: Colors.pink,
                trackColor: Colors.blueGrey,
                value: firebaseNotifications.valueOrNull?.data()?['shouldNotification'] ?? false,
                onChanged: (value) {
                 FirebaseFirestore.instance.collection('users').doc(Uid).update({'shouldNotification':value});
                },
              ),
              title: const Text('リマインド'),
            ),
            divider,
            SizedBox(height: 40,),
            InkWell(
              onTap: () {

              },
              child: Container(
                height: 55,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    '退会',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}