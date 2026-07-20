#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
TARGET="${HOME}/.cursor/skills"
SRC="${ROOT}/skills"

mkdir -p "${TARGET}"

installed=0
skipped=0

for dir in "${SRC}"/*/; do
  name="$(basename "${dir}")"
  [[ "${name}" == _* ]] && continue
  [[ -f "${dir}/SKILL.md" ]] || continue

  dest="${TARGET}/${name}"
  if [[ -e "${dest}" || -L "${dest}" ]]; then
    echo "skip (exists): ${name}"
    skipped=$((skipped + 1))
    continue
  fi

  ln -s "${dir%/}" "${dest}"
  echo "linked: ${name} → ${dest}"
  installed=$((installed + 1))
done

echo ""
echo "done: linked=${installed}, skipped=${skipped}"
echo "skills dir: ${TARGET}"
