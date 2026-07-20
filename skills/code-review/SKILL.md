---
name: code-review
description: Review code for correctness, security, and maintainability. Use when reviewing pull requests, examining diffs, or when the user asks for a code review / ревью кода.
---

# Code Review

## Цель

Найти реальные проблемы до merge. Не переписывать стиль ради стиля.

## Порядок проверки

1. Контекст: что меняется и зачем (PR description / commit / запрос).
2. Корректность: логика, edge cases, гонки, null/empty.
3. Безопасность: инъекции, XSS, секреты, authz, path traversal.
4. Надёжность: ошибки, ретраи, таймауты, идемпотентность.
5. Поддерживаемость: ясность, дубли, API boundaries.
6. Тесты: покрывают ли риск изменения.

## Формат ответа

```markdown
## Verdict
Approve | Approve with nits | Request changes

## Critical
- [файл:строка] проблема → почему → как исправить

## Suggestions
- …

## Nits
- …
```

## Правила

- Критичное — только то, что ломает прод, безопасность или данные.
- Каждое замечание: evidence + impact + fix.
- Не требовать рефакторинг вне scope PR.
- Если всё ок — явно напиши Approve и что проверил.
