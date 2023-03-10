import 'package:hive/hive.dart';

part 'task.g.dart';

List<String> months = [
  'Janeiro',
  'Fevereiro',
  'Março',
  'Abril',
  'Maio',
  'Junho',
  'Julho',
  'Agosto',
  'Setembro',
  'Outubro',
  'Novembro',
  'Dezembro'
];

List<String> monthsAbr = [
  'Jan',
  'Fev',
  'Mar',
  'Abr',
  'Mai',
  'Jun',
  'Jul',
  'Ago',
  'Set',
  'Out',
  'Nov',
  'Dez'
];

@HiveType(typeId: 2)
class Task {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  DateTime date;
  @HiveField(3)
  String? subjectId;

  Task(
      {required this.name,
      required this.date,
      this.subjectId,
      required this.id});

  String getDate() {
    return '${this._wrapInZero(this.date.day)}, ${monthsAbr[this.date.month - 1]}';
  }

  String getTime() {
    return '${this._wrapInZero(this.date.hour)}:${this._wrapInZero(this.date.minute)}';
  }

  String _wrapInZero(int toWrap) {
    return toWrap < 10 ? '0$toWrap' : '$toWrap';
  }
}
