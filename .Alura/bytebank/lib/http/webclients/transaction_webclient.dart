import 'dart:convert';
import 'package:http/http.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/http/webclient.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    Response response;
    try {
      response = await client.get(Uri.parse(baseUrl))
          .timeout(const Duration(seconds: 5));
    } catch (error) {return [];}
    if (response.statusCode == 200) {
      final List<dynamic> decodedJson = jsonDecode(response.body);
      return decodedJson.map((dynamic json) => Transaction.fromJson(json)).toList();
    }
    return [];
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());
    final Response response = await client.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        "Content-type": "application/json",
        "password": password,
      },
      body: transactionJson,
    );
    if (response.statusCode == 400) {
      throw Exception("There was an error submitting transaction");
    }
    return Transaction.fromJson(jsonDecode(response.body));
  }
}
