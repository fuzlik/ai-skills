---
name: alabuga-ui-kit
description: >-
  Wires the Alabuga UI kit into every new React/frontend project (install,
  styles, UIKitProvider, Tailwind conflict cleanup). Use when starting a новый
  проект, React, frontend, Vite, Tailwind, UI kit, Alabuga, UIKitProvider, or
  @games-alabuga/ui-kit / @games-alabuga/ui-kit-dev-redesign.
---

# Alabuga UI kit

## Правило

Для **любого** нового frontend/React-проекта этого пользователя подключай UI-библиотеку Alabuga. Не спрашивать «какую UI-библиотеку?» — брать эту.

Связанный skill: `figma-ui-lib-verstka` (верстка по Figma только через эту библиотеку).

## Имена пакетов

В документации пользователя встречаются **оба** имени — сохраняй как есть:

| Действие | Пакет |
|----------|--------|
| Установка (быстрый старт) | `@games-alabuga/ui-kit-dev-redesign` |
| Импорты / обновление | `@games-alabuga/ui-kit` |

Источник по умолчанию (как в `figma-ui-lib-verstka`): `https://gitlab.alabuga.space/ssr/tribes/tribe-2/design-system/ui-lib`.

## Реестр и NPM_TOKEN

Пакет с приватного npm-реестра GitLab. Перед установкой настрой `.npmrc` + `NPM_TOKEN`:

- В файлах только шаблон `${NPM_TOKEN}` — никогда не коммить реальный токен.
- Если токен передан в чате — только для текущей сессии/команды.
- Без успешной установки / экспортов пакета верстку/scaffold UI не продолжать.

## Быстрый старт по подключению UI-библиотеки в проект с Tailwind CSS

### 1. Как скачать библиотеку

```
yarn add @games-alabuga/ui-kit-dev-redesign
# или
npm install @games-alabuga/ui-kit-dev-redesign
# или
pnpm add @games-alabuga/ui-kit-dev-redesign
```

### 2. Импорт всех стилей

```
import "@games-alabuga/ui-kit/styles.css";
```

### 3. Подключение UIKitProvider

```
import { UIKitProvider } from "@games-alabuga/ui-kit";
import "@games-alabuga/ui-kit/styles.css";

createRoot(document.getElementById("root")!).render(
  <UIKitProvider>
    <App />
  </UIKitProvider>
);
```

Props:

- `withScreenProvider?: boolean` (default true)
- `withThemeProvider?: boolean` (default true)

### 4. Обновление

```
yarn up @games-alabuga/ui-kit
# или npm update / pnpm up @games-alabuga/ui-kit
```

### 5. Что выключить чтобы не перебивать Tailwind

- Reset/normalize that override spacing, fonts, line-height, sizes
- Global button/input/a/h1-h6/p hard colors/sizes/borders
- Global `!important` in `app.css`, `index.css`
- Old themes/vars that override library CSS variables

## Чеклист агента (новый frontend)

```
- [ ] .npmrc + NPM_TOKEN (шаблон, без секрета в git)
- [ ] Пакет установлен (@games-alabuga/ui-kit-dev-redesign или согласованный)
- [ ] import "@games-alabuga/ui-kit/styles.css"
- [ ] UIKitProvider вокруг App
- [ ] Убраны конфликтующие global CSS / normalize / !important / старые CSS vars
```
