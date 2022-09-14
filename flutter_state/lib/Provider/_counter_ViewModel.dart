import 'package:flutter/material.dart';

// 1.创建自己需要共享的数据
class JXCounterViewModel extends ChangeNotifier {
  int _counter = 10;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}


class UserInfo {
  String nickname;
  int level;

  UserInfo(this.nickname, this.level);
}

class UserProvider extends ChangeNotifier {
  UserInfo _userInfo = UserInfo("why", 18);

  set userInfo(UserInfo value) {
    _userInfo = value;
    notifyListeners();
  }

  UserInfo get userInfo => _userInfo;
}
