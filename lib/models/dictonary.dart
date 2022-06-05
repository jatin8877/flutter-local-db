const String diaryName = "diary";

class DetailFields {
  static const String id = '_id';

  static const String userName = 'userName';
  static const String password = 'password';

  static final List<String> values = [
    id,
    userName,
    password,
  ];
}

class Details {
  final int? id;
  final String userName;
  final String password;

//? Create a Const Consturctor
  const Details({
    this.id,
    required this.userName,
    required this.password,
  });

  Details copy({
    int? id,
    String? userName,
    String? password,
  }) =>
      Details(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        password: password ?? this.password,
      );

  static Details fromJson(Map<String, Object?> json) => Details(
        id: json[DetailFields.id] as int?,
        userName: json[DetailFields.userName] as String,
        password: json[DetailFields.password] as String,
      );
  Map<String, Object?> toJson() => {
        DetailFields.id: id,
        DetailFields.userName: userName,
        DetailFields.password: password,
      };
}
