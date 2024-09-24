import "dart:developer";

import "package:flutter/material.dart";
import "package:coder_shifu/src/core/storage/app_storage.dart";


class EntryViewModel extends ChangeNotifier {
  PageController pageController = PageController();
  int currentPage = 0;
  List<String> images = ["assets/images/coding-2.png","assets/images/coding-1.png","assets/images/ai-1.png" ];

  void onPageChanged(int index) {
    currentPage = index;
    log(currentPage.toString());

    notifyListeners();
  }
  void saveUser() {
    AppStorage.$write(key: StorageKey.enter, value: "Enter user");
    notifyListeners();
  }
  void deleteUser() {
    AppStorage.$delete(key: StorageKey.enter);
    notifyListeners();
  }


}




