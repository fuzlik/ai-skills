---
name: new-project-bootstrap
description: >-
  Bootstraps a new project end-to-end: exactly one Plane project plus a GitHub
  repository (and local code scaffold). Use when the user says создать новый
  проект, create a new project, новый проект, заведи проект, or asks to start a
  named project from scratch.
---

# New project bootstrap

Когда пользователь говорит **создай новый проект** (или эквивалент) — уже должен:

1. создать **один** проект в **Plane**;
2. создать **репу на GitHub**;
3. поднять локальный код (если нужен стек / папка).

Не спрашивать «Plane или Git?» — делать оба. Не создавать несколько Plane-проектов при ретраях.

## Checklist

```
- [ ] Scope: имя проекта, папка (по умолчанию Desktop), стек (по умолчанию Vite + React)
- [ ] Plane: ровно 1 проект
- [ ] Local: scaffold + npm install (если код)
- [ ] Git: init + initial commit
- [ ] GitHub: gh repo create + push -u
- [ ] Отчёт: Plane name/id, GitHub URL, локальный путь
```

## 1. Plane — ровно один проект

- MCP: `user-plane` → `create_project`
- `name` = имя проекта от пользователя (например `360`)
- `identifier` = короткий UPPERCASE код (буквы обязательны; цифры ок: `A360`, не голый `360` если API ругается)
- `project_lead` = текущий user из `get_me`
- После create всегда `list_projects`: API может вернуть 400, но проект уже создан — **не** ретраить с другим name/identifier
- Если имя занято — один раз уточнить или взять ближайшее уникальное имя, **не** плодить дубликаты (`Project 360`, `Оценка 360` и т.п.)
- Лишние дубликаты от ошибки — удалить, **оставить один**

## 2. Локальный код

- Папка: `/Users/fuzlikfazlyev/Desktop/<имя>` (или путь, который указал пользователь)
- Стек по умолчанию: `npm create vite@latest <имя> -- --template react` + `npm install`
- Если пользователь назвал другой стек — использовать его
- Не коммитить `node_modules`

## 3. GitHub-репа

```bash
cd <project-dir>
git init
git add .
git commit -m "$(cat <<'EOF'
Initial commit.

EOF
)"
gh repo create <имя> --private --source=. --remote=origin --push
```

- Репа **private** по умолчанию; public — только если попросили
- Имя репы = имя проекта (если занято — суффикс / org по контексту, один раз)
- Не обновлять git config
- Первый коммит и push здесь **разрешены** как часть bootstrap (это исключение из «не коммить без просьбы»)

## 4. Отчёт пользователю

Кратко:

- Plane: имя + identifier
- GitHub: URL
- Local: путь + как запустить (`npm run dev`)

## Запрещено

- Только папка / только Vite без Plane и GitHub
- Несколько проектов в Plane на один запрос
- Останавливаться с «нажми Run / Approve»
- Спрашивать подтверждение шагов, если имя и scope ясны
