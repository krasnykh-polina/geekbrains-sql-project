Курсовой проект по курсу `Основы реляционных баз данных. MySQL`

Проект представляет собой базу данных bhotels по бронированию отелей, состоящую из таблиц, содержащих информацию об отелях (название, категория, контактные данные), их территориальной принадлежности, медиаконтент (фото, видео), информацию о пользователях (имя, фамилия, контактные данные), отзывы пользователей об отелях с фото и (или) видео, избранных отелях пользователей, информацию о бронировании пользователями отелей с указанием статуса бронирования.

Описание файлов проекта:

- `bhotels_dump.sql` - скрипты создания структуры БД, скрипты наполнения БД данными. Наполнение БД тестовыми
  данными сгенерировано на сайте http://filldb.info/
- `bhotels.png` - ERDiagram для БД
- `requests.sql` - скрипты запросов из БД
- `views.sql` - представления
- `procedure_trigger.sql` - хранимая процедура и триггер

Схема БД

![](https://github.com/krasnykh-polina/blob/master/bhotels.png)
