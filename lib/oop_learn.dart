/// 定义一个Dart类, 所有的类都继承自Object
class Person {
  String name;
  int age;

  /// 标准的构造方法
  Person(this.name, this.age);

  /// 重写父类方法
  @override
  String toString() {
    return 'name:$name, age: $age';
  }
}

class Student extends Person {
  // 定义类的变量
  String _school; // 通过下划线来标识似有字段（变量）
  String city;
  String country;
  String name;

  /// 通过this._school初始化自有参数， name、age交给父类进行初始化, {}包裹的为可选参数
  Student(this._school, String name, int age,
      {this.city, this.country = 'China'})
      : name = '$country.$city',
        super(name, age) {
     print('构造方法提不是必须的');
  }

  String get school => _school;

  set school(String value) {
    _school = value;
  }


  @override
  String toString() {
    return 'Student{_school: $_school, city: $city, country: $country, name: $name}';
  }

  Student.cover(Student stu): super(stu.name, stu.age){
    print('命名构造方法');
  }

  static doPrint (String str) {
    print('doPring: $str');
  }

  // 命名工厂构造方法： factory [类名 + . + 方法名]
  // 它可以有返回值，而且不需要将类的final变量作为参数，是一种灵活获取类对象的方式
  factory Student.stu(Student stu) {
    return Student(stu._school, stu.name, stu.age);
  }
}

class Logger {
  static Logger _cache;

  // 工厂构造方法 -- 单例模式

  factory Logger(){
    if(_cache ==null) {
      _cache = Logger._internal();
    }
    return _cache;
  }
  Logger._internal();

  void log(String msg) {
    print(msg);
  }
}

/// 受用 abstract 修饰符来定义一个抽象类，该类不能被实例化。 抽象类在定义接口的时候非常有用， 实际上抽象中也包含一些实现
abstract class Study {
  void study();
}

// 继承抽象类要实现它的抽象方法。 否则也需要将自己定义成抽象类
class StudyFlutter extends Study {
  @override
  void study() {
    print('learn flutter');
  }
}


/// 为类添加特征： mixins
/// mixins 是在多个类层次结构中重用代码的一种方式
/// 要是用mixins， 在with关键字后面跟上一个或多个mixin 的名字（用逗号分隔）， 并且with要用在extends关键字之后
/// mixins的特征：实现mixin， 就创建一个继承 Object 类的子类（不能继承其他类），不声明任何构造方法，不调用 super

class Test extends Person with Study{
  Test(String name, int age) : super(name, age);

  @override
  void study() {
    // TODO: implement study
  }

}