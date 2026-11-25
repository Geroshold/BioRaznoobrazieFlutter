# Биоразнообразие — каталог видов (Flutter)

ЛР3 «Сеть». Список таксонов с поиском, деталь с переходом на дочерние таксоны,
светлая и тёмная тема, русский и английский интерфейс.
Данные — список таксонов из сети, взятых из http://api.gbif.org/v1/species/search.

## Запуск

```bash
flutter pub get
flutter run -d edge        # или -d chrome
flutter run -d windows
```

`flutter pub get` может потребоваться для подгрузки зависимостей.
`flutter gen-l10n` может потребоваться для генерации файлов локализации.
`dart run build_runner build --delete-conflicting-outputs` необходим для генерации файлов dto.

## Проверка ARB

```bash
dart run tool/check_arb.dart
```

## Устройство

- `lib/features/taxon/data` — репозиторий с сетью
- `lib/features/taxon/domain` — модель, перечисление рангов таксонов и интерфейс репозитория
- `lib/features/taxon/presentation` — Cubit, экраны, виджеты, форматирование
- `lib/common` — навигация (go_router), тема, язык, общие виджеты

State manager — 'flutter_bloc' (Cubit с методами и emit состояний)
