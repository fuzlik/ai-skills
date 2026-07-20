---
name: git-commit
description: Draft concise git commit messages from staged or unstaged diffs. Use when the user asks to commit, write a commit message, or сформулировать коммит.
---

# Git Commit

## Когда применять

Пользователь просит закоммитить или написать сообщение коммита.

## Шаги

1. `git status` — staged / unstaged / untracked.
2. `git diff` и `git diff --staged` — суть изменений.
3. `git log -5 --oneline` — стиль репозитория.
4. Не коммить секреты (`.env`, ключи, токены).
5. Сформулируй сообщение: **почему**, не «что построчно».

## Формат сообщения

Предпочтительно Conventional Commits, если в репо так принято:

```
type(scope): short summary in imperative

Optional body: why / impact / risk.
```

Типы: `feat`, `fix`, `refactor`, `docs`, `test`, `chore`, `perf`, `ci`.

## Правила

- 1–2 предложения максимум в body.
- Не коммить без явной просьбы пользователя.
- Не использовать `--no-verify`, amend, force — без явного запроса.
- Сообщение передавать через HEREDOC.
