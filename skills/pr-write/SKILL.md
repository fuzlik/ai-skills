---
name: pr-write
description: Write clear pull request titles and bodies from branch commits and diffs. Use when creating a PR, drafting a PR description, or when the user asks for описание PR / pull request.
---

# PR Write

## Шаги

1. Узнай base branch (`main`/`master`/`develop`).
2. Собери: `git status`, `git log base...HEAD`, `git diff base...HEAD`.
3. Сформулируй title и body по шаблону ниже.
4. Если просят создать PR — `gh pr create` (после push при необходимости).

## Шаблон body

```markdown
## Summary
- …
- …

## Test plan
- [ ] …
- [ ] …
```

## Правила

- Title: императив, без «WIP» без причины.
- Summary = зачем + эффект для пользователя/системы.
- Test plan — проверяемые шаги, не «протестировать всё».
- Не включать секреты и лишние логи.
