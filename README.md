# XrayCore.Proto — NuGet (only .proto)

Этот стартовый шаблон собирает NuGet‑пакет, содержащий **только `.proto`** из апстрима [`XTLS/Xray-core`].
Пакет удобно подключать в проекты на любом языке: схемы всегда под рукой, генерацию кода (`Grpc.Tools`) каждый делает под себя.

## Быстрый старт

1) Создай новый репозиторий и распакуй сюда файлы из этого ZIP.  
2) Инициализируй сабмодуль (локально) и закоммить его настроечную запись:
```bash
git init
git add .
git commit -m "init: xray proto starter"

git submodule add https://github.com/XTLS/Xray-core.git externals/Xray-core
git submodule update --init --recursive
git commit -m "chore: add xray-core as submodule"
git push -u origin main
```
> Сабмодуль хранит только ссылку на апстрим. На CI мы обновляем его до **последнего коммита** без коммита в репо — просто чтобы собрать свежий пакет.

3) Включи GitHub Actions и добавь секрет **`NUGET_API_KEY`** (Settings → Secrets → Actions → New repository secret).  
   API‑ключ берётся из твоего аккаунта на nuget.org.

4) Запусти Workflow вручную (Actions → “Build & Publish Proto NuGet” → Run), либо дождись расписания.

## Что собирается

- NuGet‑пакет, содержащий файлы из каталога `protos/` под путём `protos/` внутри `.nupkg`.
- Метаданные пакета указывают на MPL‑2.0 и апстрим `XTLS/Xray-core`.

## Использование пакета

В .NET‑проекте:
```xml
<ItemGroup>
  <PackageReference Include="XrayCore.Proto" Version="*" PrivateAssets="All" />
  <PackageReference Include="Grpc.Tools" Version="2.60.0" PrivateAssets="All" />
</ItemGroup>

<ItemGroup>
  <!-- Генерировать клиентские классы из протоков пакета -->
  <Protobuf Include="$(NuGetPackageRoot)xraycore.proto/*/*/*/*.proto" GrpcServices="Client" />
  <!-- При необходимости скорректируй путь; см. содержимое пакета — все файлы лежат под `protos/` -->
</ItemGroup>
```

Либо просто распакуй `.proto` из пакета и генерируй код в своём пайплайне.

## Обновление апстрима

Workflow сам обновляет сабмодуль до последнего коммита и собирает пакеты — без коммита обратно в репозиторий.

## Лицензия

Исходные `.proto` берутся из проекта `XTLS/Xray-core` (лицензия **MPL‑2.0**).  
Этот шаблон лишь автоматизирует упаковку схем и публикует их с корректными атрибутиками лицензии.
