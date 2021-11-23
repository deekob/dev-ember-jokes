import 'package:http/http.dart' as http;
import 'dart:convert';

class JokeRepository {
  late int id;
  late String category;
  late String type;
  late String joke;

  Future<void> getJoke(String url) async {
    http.Response response = await http.get(Uri.parse(
        'https://8qvay1dyfl.execute-api.us-east-1.amazonaws.com/dev'));
    Map data = jsonDecode(utf8.decode(response.bodyBytes));
    print(data);

    id = data['id'];
    category = data['category'];
    type = data['type'];
    joke = type == 'single'
        ? data['joke']
        : data['setup'] + '\n\n' + data['delivery'];
  }
}
