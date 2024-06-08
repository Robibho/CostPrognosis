import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double? addAmount(List<TransactionStruct>? transactions) {
  // add all the amounts
  double totalAmount = 0.0;
  if (transactions != null) {
    for (TransactionStruct transaction in transactions) {
      totalAmount += transaction.amount;
    }
  }
  return totalAmount;
}

List<String>? getCategoriesname(
  List<TransactionStruct>? transaction,
  List<CategoriesStruct>? category,
) {
  // get the names of the categories on the bases of transaction category
  if (transaction == null || category == null) {
    return null;
  }
  final categoryMap = Map<int, String>.fromIterable(
    category,
    key: (c) => c.id,
    value: (c) => c.name,
  );
  final categoryNames = <String>{};
  for (final t in transaction) {
    final categoryName = categoryMap[t.category];
    if (categoryName != null) {
      categoryNames.add(categoryName);
    }
  }

  return categoryNames.toList();
}

dynamic saveChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  // If chatHistory isn't a list, make it a list and then add newChat
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic convertToJSON(String prompt) {
  // take the prompt and return a JSON with form [{"role": "user", "content": prompt}]
  return json.decode('{"role": "user", "content": "$prompt"}');
}
