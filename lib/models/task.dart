import 'package:uuid/uuid.dart';

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

class Task {
  final String id = Uuid().v4();
  String name;
  DateTime date;
  String? subjectId;

  Task({required this.name, required this.date, this.subjectId});

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
