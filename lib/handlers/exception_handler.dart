import 'dart:developer';

import 'package:machine_test/helpers/dialog_helper.dart';
import 'package:machine_test/services/exception.dart';

class HandleException {
  void handleException(error, {bool top = false}) {
    // print(error.message);
    if (error is BadRequestException) {
      var message = error.message;

      // print(error);
      DialogHelper.showErrorDialog(description: message, top: top);
    } else if (error is FetchDataException) {
      log(error.message.toString(), name: error.prefix.toString());
      var message = error.message;
      DialogHelper.showErrorDialog(description: message, top: top);
    } else if (error is ApiNotRespondingException) {
      log(error.message.toString(), name: error.prefix.toString());

      // var message = error.message;
      DialogHelper.showErrorDialog(
          description: "It took longer to respond.", top: top);
    } else if (error is InvalidException) {
      log(error.message.toString(), name: error.prefix.toString());

      DialogHelper.showErrorDialog(
          description: error.message, title: "Oops 🥸", top: top);
    } else if (error
        .toString()
        .contains("firebase_database/permission-denied")) {
      log("database access denied", name: "");

      DialogHelper.showErrorDialog(
        description: "Sorry, your notice board access dined please  re-login",
        title: "Oops 🥸",
        top: top,
      );
    } else {
      DialogHelper.showErrorDialog(
          description: "Something went wrong!", title: "Oops 🥸", top: top);
    }
  }
}
