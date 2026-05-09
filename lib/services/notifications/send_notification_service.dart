import 'dart:convert';

import 'package:http/http.dart' as http;

import 'get_server_key.dart';

class SendNotificationService {

  static Future<void> sendNotification({

    required String token,
    required String title,
    required String body,

    Map<String, dynamic>? data,

  }) async {

    String accessToken =
    await GetServerKey().getServerKeyToken();

    const String url =
        "https://fcm.googleapis.com/v1/projects/lost-and-found-634f2/messages:send";

    final headers = {

      'Content-Type': 'application/json',

      'Authorization': 'Bearer $accessToken',
    };

    final message = {

      "message": {

        "token": token,

        "notification": {
          "title": title,
          "body": body,
        },

        "data": data ?? {},
      }
    };

    final response = await http.post(

      Uri.parse(url),

      headers: headers,

      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {

      print("✅ Notification Sent");

    } else {

      print("❌ Notification Failed");

      print(response.body);
    }
  }

  static Future<void> sendNotificationUsingApi({required token, required String title, required String body, required Map<String, String> data}) async {}
}