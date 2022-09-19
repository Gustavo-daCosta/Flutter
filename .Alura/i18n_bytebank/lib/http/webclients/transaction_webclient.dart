import 'dart:convert';
import 'package:http/http.dart';
import 'package:i18n_bytebank/models/transaction.dart';
import 'package:i18n_bytebank/http/webclient.dart';
import 'package:flutter/material.dart' show debugPrint;

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    Response response;
    try {
      response = await client.get(Uri.parse(baseUrl));
    } catch (error) {return [];}
    if (response.statusCode == 200) {
      final List<dynamic> decodedJson = jsonDecode(response.body);
      return decodedJson.map((dynamic json) => Transaction.fromJson(json))
          .toList();
    } return [];
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    await Future.delayed(const Duration(seconds: 2));

    final Response response = await client.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        "Content-type": "application/json",
        "password": password,
      },
      body: transactionJson,
    );

    debugPrint("Status code: ${response.statusCode}");
    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }
    throw HttpException(_getMessage(transaction.value, response.statusCode), response.statusCode);
  }

  String _getMessage(double value, int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[value <= 0 ? 400 : statusCode].toString();
    } return "Unknown error";
  }

  static final Map<int, String> _statusCodeResponses = {
    400 : "There was an error submitting transaction",
    401 : "Authentication failed",
    409 : "Transaction already exists",
  };
}

class HttpException implements Exception {
  final String message;
  final int statusCode;

  HttpException(
    this.message,
    this.statusCode,
  );
}
