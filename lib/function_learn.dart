class TestFunction {
  FunctionLearn functionLearn = FunctionLearn();
  void start () {
    // print(functionLearn.sum(1, 2));
    // functionLearn.anonymousFunction();
    Cache<String> cache1 = Cache();
    cache1.setItem('cache1', 'cache1'); //泛型作用：类型检查约束类比：List<String>
    String string1 = cache1.getItem('cache1');
    print(string1);

    Cache<int> cache2 = Cache();
    cache2.setItem('cache2', 1008);
    int int1 = cache2.getItem('cache2');
    print(int1);
  }
}

class FunctionLearn {
  /// 方法的构成
  /// 返回值类型 + 方法名 + 参数
  /// 方法名：匿名方法不需要方法名
  /// 参数：参数类型和参数名

  int sum (int num1, int num2) {
    return num1 + num2;
  }

  void _learn () {
    print('私有方法');
  }

  anonymousFunction () {
    List<String> list = ['私有方法', '匿名方法'];
    list.forEach((element) {
      print(list.indexOf(element).toString() + ':' + element);
    });
  }
}

class Cache<T> {
  static final Map<String, Object> _cached = Map();

  void setItem(String key, T value) {
    _cached[key] = value;
  }

  ///泛型方法
  T getItem(String key) {
    return _cached[key];
  }
}