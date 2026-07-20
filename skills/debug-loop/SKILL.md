---
name: debug-loop
description: Systematically debug bugs, crashes, and unexpected behavior with evidence. Use when something fails, errors appear, tests break, or the user asks to fix / debug / разобраться с багом.
---

# Debug Loop

## Принцип

Сначала evidence, потом гипотеза, потом фикс. Не менять код вслепую.

## Цикл

1. **Reproduce** — точные шаги / команда / входные данные.
2. **Observe** — stack trace, логи, HTTP status, diff ожидаемого vs фактического.
3. **Locate** — сузить до файла/функции (поиск по символу ошибки, bisect логикой).
4. **Hypothesize** — 1–3 вероятные причины, ранжировать по простоте проверки.
5. **Test** — одна проверка на гипотезу (лог, assert, минимальный repro).
6. **Fix** — минимальный патч под подтверждённую причину.
7. **Verify** — тот же repro проходит; рядом лежащие кейсы не сломаны.

## Формат статуса (пока ищешь)

```markdown
## Symptom
## Evidence
## Hypotheses
## Next check
```

## Запреты

- Не рефакторить вокруг бага «заодно».
- Не глушить ошибки пустым catch.
- Не считать «у меня работает» доказательством без repro.
