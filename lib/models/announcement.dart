import 'package:flutter/material.dart';

class Announcement extends StatelessWidget {
  final Map<String, dynamic> announcmentData = {
    'Вид недвижимости': null,
    'Статус дома': null,
    'Тип дома': null,
    'Количество комнат': null,
    'Назначение': null,
    'Жилое состояние': null,
    'Планировка': null,
    'Общая площадь': null,
    'Площадь кухни': null,
    'Балкон/Лоджия': null,
    'Отопление': null,
    'Варианты расчета': null,
    'Коммисия агенту': null,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/1-xm.jpg',
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
