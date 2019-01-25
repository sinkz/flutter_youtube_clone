import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube_favoritos/models/video.dart';

const API_KEY = "AIzaSyD0i0AmYExlQQKYCNx-iHx5lzJGoOX4CKM";

class Api {
  search(String search) async {
    http.Response response = await http.get(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10");

    decode(response);
  }

  List<Video> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      List<Video> videos = decoded["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();
      return videos;
    } else {
      throw Exception("Failed to load videos");
    }
  }
}
