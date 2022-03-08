import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_instagram/models/notification_response.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(const MaterialApp(
    home: NotificationsScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<dynamic> notifications = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/notifications.json');
    final data = await json.decode(response);

    setState(() {
      notifications = data['notifications']
          .map((data) => InstagramNotification.fromJson(data))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Actividad',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          centerTitle: false,
        ),
        body: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return Slidable(
                actionPane: const SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: notificationItem(notifications[index]),
                secondaryActions: <Widget>[
                  Container(
                      height: 60,
                      color: Colors.grey.shade500,
                      child: const Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      )),
                  Container(
                      height: 60,
                      color: Colors.red,
                      child: const Icon(
                        Icons.delete_outline_sharp,
                        color: Colors.white,
                      )),
                ],
              );
            }));
  }

  notificationItem(InstagramNotification notification) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                notification.hasStory
                    ? Container(
                        width: 55,
                        height: 55,
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xFF9E2692),
                                Color(0xFFFD8D32),
                              ],
                            ),
                            shape: BoxShape.circle),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(notification.profilePic)),
                        ),
                      )
                    : Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(notification.profilePic)),
                      ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: RichText(
                      text: TextSpan(children: [
                    notification.content != " empezó a seguirte. "
                        ? const TextSpan(
                            text: 'A ', style: TextStyle(color: Colors.black))
                        : const TextSpan(
                            text: '',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: notification.name,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: notification.content,
                        style: const TextStyle(color: Colors.black)),
                    TextSpan(
                      text: notification.timeAgo,
                      style: TextStyle(color: Colors.grey.shade500),
                    )
                  ])),
                )
              ],
            ),
          ),
          notification.postImage != ''
              ? SizedBox(
                  width: 50,
                  height: 50,
                  child:
                      ClipRRect(child: Image.network(notification.postImage)),
                )
              : Container(
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                      child: Text('Seguir',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)))),
        ],
      ),
    );
  }
}
