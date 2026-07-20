# AI Skills (Cursor)

Набор готовых [Agent Skills](https://cursor.com/docs) для Cursor: краткие инструкции, которые агент подхватывает по описанию задачи.

## Установка

### Личные skills (все проекты)

```bash
# из корня этого репозитория
./install.sh
```

Скрипт создаёт симлинки в `~/.cursor/skills/`.

### Только в одном проекте

```bash
cp -R skills/* /path/to/project/.cursor/skills/
```

Или симлинк:

```bash
ln -s "$(pwd)/skills" /path/to/project/.cursor/skills-repo
# затем скопируйте нужные skill-папки в .cursor/skills/
```

## Skills

| Skill | Когда применять |
|-------|-----------------|
| `code-review` | Ревью PR / диффа / «проверь код» |
| `git-commit` | Сообщения коммитов |
| `pr-write` | Описание pull request |
| `debug-loop` | Баги, падения, неожиданное поведение |
| `safe-refactor` | Рефакторинг без смены поведения |
| `research-brief` | Исследование темы → краткий бриф |
| `russian-copy` | Тексты/доки/письма на русском |

## Структура skill

```
skills/
  skill-name/
    SKILL.md          # обязательно
    reference.md      # опционально
```

Формат `SKILL.md`: YAML frontmatter (`name`, `description`) + короткие шаги для агента.

## Добавить свой skill

1. Скопируйте `skills/_template/` → `skills/my-skill/`.
2. Заполните `name` и `description` (WHAT + WHEN, третье лицо).
3. Держите `SKILL.md` коротким (< 500 строк).
4. Запустите `./install.sh` снова.

## Лицензия

MIT — используйте свободно.
