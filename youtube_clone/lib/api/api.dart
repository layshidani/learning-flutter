import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:youtube_clone/models/video.dart';

// ignore: constant_identifier_names
const String CHANNEL_ID = 'UCVHFbqXqoYvEWM1Ddxl0QDg';
// ignore: constant_identifier_names
const String BASE_URL = 'https://www.googleapis.com/youtube';
// ignore: constant_identifier_names
String? API_KEY = dotenv.maybeGet('YOUTUBE_API_KEY', fallback: null);

class Api {
  Future<List<Video>> onSearch(String search) async {
    http.Response response = await http.get(Uri.parse(BASE_URL +
        '/v3/search'
            '?part=snippet'
            '&type=video'
            '&maxResults=20'
            '&order=date'
            '&key=$API_KEY'
            '&channelId=$CHANNEL_ID'
            '&q=$search'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      return jsonData['items'].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();
    } else {
      return [];
    }
  }
}
