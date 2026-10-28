#!/usr/bin/env bash
# Recria o setup: linka as skills deste repo e instala os plugins marcados como
# instalados no README. Pode rodar de novo sem problema.
set -euo pipefail

REPO="$(cd "$(dirname "$0")" && pwd)"

echo "==> Skills próprias"
for dir in "$HOME/.claude/skills" "$HOME/.agents/skills"; do
  mkdir -p "$dir"
  for skill in "$REPO"/skills/*/; do
    name="$(basename "$skill")"
    ln -sfn "${skill%/}" "$dir/$name"
    echo "    $dir/$name"
  done
done

echo "==> Remotion skills (Claude Code + Codex)"
npx -y skills@latest add remotion-dev/skills --global --agent claude-code codex --yes || true

if command -v claude >/dev/null; then
  echo "==> Claude Code"
  claude plugin install mattpocock-skills@claude-plugins-official || true
  claude plugin marketplace add pbakaus/impeccable || true
  claude plugin install impeccable@impeccable || true
  claude plugin marketplace add heygen-com/hyperframes || true
  claude plugin install hyperframes@hyperframes || true
fi

if command -v codex >/dev/null; then
  echo "==> Codex"
  npx -y skills@latest add mattpocock/skills --agent codex --global --yes || true
  npx -y impeccable install || true
  codex plugin marketplace add heygen-com/hyperframes || true
  codex plugin add hyperframes@hyperframes || true
fi

echo "Pronto. Reinicie o Claude Code e o Codex."
