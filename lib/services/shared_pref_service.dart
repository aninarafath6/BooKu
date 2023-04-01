import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:machine_test/handlers/exception_handler.dart';
import 'package:machine_test/models/book_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService with HandleException {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

// * set user
  Future<void> setBookMarked(BookItem book) async {
    try {
      // * call sharedPreference

      SharedPreferences pref = await _prefs;
      // pref.clear();
      var check = pref.getString("book_marked");
      if (check == null) {
        pref.setString("book_marked", jsonEncode([book.toJson()]));
      } else {
        List current = jsonDecode(check.toString());

        List<BookItem> books = List.from(
          current.map((e) => BookItem.fromJson(e)),
        );
        // print(current[0]);
        books.add(book);
        List<String> booksEncoded =
            List.from(books.map((BookItem e) => jsonEncode(e.toJson())));

        // // print(books);
        pref.setString("book_marked", jsonEncode(booksEncoded));
      }
    } catch (e) {
      log("error from set bookmark on localStorage $e");
      handleException(e, message: e);
    }
  }

  Future<List<BookItem>?> getBookMarkedList() async {
    print("here");
    try {
      SharedPreferences pref = await _prefs;

      var data = pref.getString("book_marked");
      if (data != null) {
        List current = jsonDecode(data.toString());
        print(current);
        if (current.isNotEmpty) {
          if (current.length == 1) {
            List<BookItem> books = List.from(
              current
                  .map((e) => BookItem.fromJson(jsonDecode((jsonEncode(e))))),
            );
            return books;
          } else {
            List<BookItem> books = List.from(
              current.map((e) => BookItem.fromJson(jsonDecode(((e))))),
            );
            return books;
          }
        }
      }
    } catch (e) {
      handleException("Retrieving book failed");
    }
    return null;
  }

// * clear all log state
  Future<void> clear() async {
    try {
      SharedPreferences pref = await _prefs;

      pref.remove("name");
    } catch (e) {
      handleException(e);
    }
  }
}
