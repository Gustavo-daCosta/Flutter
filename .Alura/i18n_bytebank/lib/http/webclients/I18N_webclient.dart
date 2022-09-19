import 'dart:convert';
import 'package:http/http.dart';
import 'package:i18n_bytebank/http/webclient.dart';

const String messagesUri = "https://gist.githubusercontent.com/Gustavo-daCosta/56197290cb8b07b6a478a0a221fd409a/raw/af01fdb22691d6cc661bdacaf1a126e923999b8d/";

class I18NWebClient {
  final String viewKey;

  const I18NWebClient(this.viewKey);

  Future<Map<String, dynamic>> findAll() async {
    Response response;
    response = await client.get(Uri.parse("$messagesUri$viewKey.json"));
    final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson;
  }
}

// https://gist.githubusercontent.com/guilhermesilveira/e3494abea95343c5e9f9ee0b9c41acc9/raw/340a39e2f9ca296033e29f1d24b5411c3503c89e/