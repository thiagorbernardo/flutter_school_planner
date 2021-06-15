import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_planner/models/subject.dart';
import 'package:school_planner/models/weekday.dart';
import 'package:uuid/uuid.dart';

void main() {
  group('Subject Model', () {
    TimeOfDay standardTime = TimeOfDay(hour: 0, minute: 20);
    var sunday = WeekDay('Domingo', 7);
    sunday.setOccurrence(TimeOfDay(hour: 7, minute: 9));

    var saturday = WeekDay('Sábado', 6);
    saturday.setOccurrence(standardTime);

    var friday = WeekDay('Sexta', 5);
    friday.setOccurrence(standardTime);

    var thursday = WeekDay('Quinta', 4);
    thursday.setOccurrence(standardTime);

    test('Should return without description if periodicity is empty', () {
      var subject = Subject(
        name: 'Subject 1',
        professor: 'John',
        periodicity: [],
        id: Uuid().v4(),
      );
      expect(subject.getSubjectPeriodicity(), 'Sem descrição');
    });

    test('Should return a description without slash and enter', () {
      var subject = Subject(
        name: 'Subject 1',
        professor: 'John',
        periodicity: [sunday],
        id: Uuid().v4(),
      );
      expect(subject.getSubjectPeriodicity(), 'Dom 07:09');
    });

    test('Should return a description with slash without enter', () {
      var subject = Subject(
        name: 'Subject 1',
        professor: 'John',
        periodicity: [sunday, saturday],
        id: Uuid().v4(),
      );
      expect(subject.getSubjectPeriodicity(), 'Dom 07:09 / Sáb 00:20');
    });

    test('Should return a description with slash and enter', () {
      var subject = Subject(
        name: 'Subject 1',
        professor: 'John',
        periodicity: [sunday, saturday, friday, thursday],
        id: Uuid().v4(),
      );
      expect(subject.getSubjectPeriodicity(),
          'Dom 07:09 / Sáb 00:20 / Sex 00:20\nQui 00:20');
    });
  });

  group('WeekDay Model', () {
    TimeOfDay standardTime = TimeOfDay(hour: 0, minute: 20);
    var sunday = WeekDay('Domingo', 7);

    test('Should toggleSelection', () {
      sunday.toggleSelection();
      expect(sunday.isSelected, true);

      sunday.toggleSelection();
      expect(sunday.isSelected, false);
    });

    test('Should setOccurrence', () {
      sunday.setOccurrence(standardTime);

      expect(sunday.occurrence, standardTime);
    });
  });
}
