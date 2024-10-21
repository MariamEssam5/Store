import 'dart:convert';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }

    // Log the URL and headers before making the request
    print('GET Request URL: $url');
    print('GET Request Headers: $headers');

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    // Log the response status code and body for debugging
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "There is a problem with status code: ${response.statusCode}");
    }
  }

  Future<dynamic> post(
      {required String url, required dynamic body, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }

    // Log the URL, body, and headers before making the request
    print('POST Request URL: $url');
    print('POST Request Body: $body');
    print('POST Request Headers: $headers');

    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);

    // Log the response status code and body for debugging
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          "There is a problem with status code: ${response.statusCode} with body: ${jsonDecode(response.body)}");
    }
  }

  Future<Map<String, dynamic>> put({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    // Log the URL and body before making the request
    print('PUT Request URL: $url');
    print('PUT Request Body: $body');

    final response = await http.put(Uri.parse(url), body: body);

    // Log the status code and headers to help with debugging
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print('Response headers: ${response.headers}');

    if (response.statusCode == 200) {
      // If the response is successful and contains JSON
      return jsonDecode(response.body);
    } else {
      // Handle error responses by throwing an exception
      throw Exception('Failed to update product: ${response.statusCode}');
    }
  }
}
