# Биоразнообразие — каталог видов (Flutter)

ЛР2 «Каркас». Список таксонов с поиском, деталь с переходом на дочерние таксоны,
светлая и тёмная тема, русский и английский интерфейс.
Данные — 20 таксонов из моков, взятых из http://api.gbif.org/v1/species/search.

## Запуск

```bash
flutter pub get
flutter run -d edge        # или -d chrome
flutter run -d windows
```

`flutter pub get` может потребоваться для генерации файлов локализации.

## Проверка ARB

```bash
dart run tool/check_arb.dart
```

## Устройство

- `lib/features/taxon/data` — репозиторий на моках
- `lib/features/taxon/domain` — модель, перечисление рангов таксонов и интерфейс репозитория
- `lib/features/character/presentation` — Cubit, экраны, виджеты, форматирование
- `lib/common` — навигация (go_router), тема, язык, общие виджеты

State manager — 'flutter_bloc' (Cubit с методами и emit состояний)
