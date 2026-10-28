# ai-setup

Skills, plugins, workflows e referências que uso no dia a dia de
desenvolvimento com IA (Claude Code e Codex).

Para recriar o setup numa máquina nova: `./install.sh`.

## Skills próprias (neste repo)

| Skill | Para quê | Como chamar |
|---|---|---|
| [aprofundar-prompt](skills/aprofundar-prompt/SKILL.md) | Antes de executar, pensa como um profissional de topo e reescreve o prompt mais profundo (não maior). | `/aprofundar-prompt` · `$aprofundar-prompt` |
| [qa-lancamento](skills/qa-lancamento/SKILL.md) | Review de lançamento com 5 usuários simulados num navegador real, correção em uma passada e nova rodada para provar. | `/qa-lancamento` · `$qa-lancamento` |

Ficam em `skills/` e são linkadas em `~/.claude/skills` (Claude Code) e
`~/.agents/skills` (Codex) pelo `install.sh`.

## Plugins e skills de terceiros

| Nome | O que é | Claude Code | Codex | Status |
|---|---|---|---|---|
| [Matt Pocock skills](https://github.com/mattpocock/skills) | TDD, diagnóstico de bugs, code review, domain modeling, protótipo, grilling etc. | `claude plugin install mattpocock-skills@claude-plugins-official` | `npx skills@latest add mattpocock/skills` | ✅ instalado |
| [Impeccable](https://github.com/pbakaus/impeccable) | Design de frontend: criar, criticar, auditar e polir UI. | `claude plugin marketplace add pbakaus/impeccable` + `claude plugin install impeccable@impeccable` | `npx impeccable install` (ou copiar `.agents/skills/impeccable` para `~/.agents/skills`) | ✅ instalado |
| [HyperFrames](https://github.com/heygen-com/hyperframes) | HTML/CSS/animações → vídeo MP4, feito para agentes. Precisa de Node 22+, FFmpeg e Chrome para renderizar. | `claude plugin marketplace add heygen-com/hyperframes` + `claude plugin install hyperframes@hyperframes` | `codex plugin marketplace add heygen-com/hyperframes` + `codex plugin add hyperframes@hyperframes` | ✅ instalado |
| [Remotion skills](https://www.remotion.dev/docs/ai/skills) | Vídeo com React: `remotion-best-practices` (porta de entrada), create, render, studio, captions, multimedia, maps, saas, interactivity, docs, upgrade. | `npx skills@latest add remotion-dev/skills --global --agent claude-code codex --yes` | mesmo comando | ✅ instalado |
| [UI UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | Inteligência de UI/UX: estilos, paletas, fontes, padrões por tipo de produto. | `claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill` + `claude plugin install ui-ux-pro-max@ui-ux-pro-max-skill` | `npm i -g uipro-cli` + `uipro init --ai codex` (por projeto) | 📌 anotado |
| [Emil Kowalski skills](https://github.com/emilkowalski/skills) | Animação e design engineering: animate, review-animations, apple-design, break-ui, pick-ui-library, ask-sonner etc. | `npx skills@latest add emilkowalski/skills` | mesmo comando | 📌 anotado |
| [antiwebslop](https://antiwebslop.cesaroeduardo.com/pt#commands) | Evita UI genérica de IA: review de anti-padrões, hero novo, visual QA com Playwright, UI audit, imagem → código. | `claude plugin marketplace add cesaroeduardo/antiwebslop` + `claude plugin install antiwebslop@antiwebslop` | `codex plugin marketplace add cesaroeduardo/antiwebslop` + `codex plugin add antiwebslop@antiwebslop` | 📌 anotado |
| [daisyUI](https://daisyui.com/docs/skill/) | Componentes Tailwind; skill oficial com a doc para o agente. Também tem [llms.txt](https://daisyui.com/llms.txt). | `npx skills add saadeghi/daisyui --agent claude-code --yes` | `npx skills add saadeghi/daisyui --agent codex --yes` | 📌 anotado |

## Referências de design

- [Refcat](https://refcat.app/pt-br): biblioteca de fluxos reais de apps publicados, exportáveis para Figma ou para agentes (Claude Code, Cursor).
- [mkdir.directory](https://mkdir.directory/): lista curada e votada de sites gratuitos de inspiração (galerias, prêmios, landing pages).
- [MotionVideo](https://motionvideo.xyz/pt): vitrine de vídeos com motion gerados por IA, com o prompt e as skills usadas em cada um. Bom para vídeos com HyperFrames ou Remotion.
- [Emil Kowalski skills](https://github.com/emilkowalski/skills): também serve de referência de animação e acabamento.

## Workflows

- **Prompt mais profundo antes de executar** → `aprofundar-prompt`.
- **QA antes de lançar** → `qa-lancamento`.
- **Vídeo** → `hyperframes` para HTML/CSS → MP4 ou Remotion (`remotion-best-practices`) para vídeo em React; `remotion-to-hyperframes` converte entre os dois.
- **UI nova ou redesign** → `impeccable` (ou `antiwebslop`) para direção e crítica, referências em Refcat/mkdir.directory, `emil-design-eng` para animação, e no fim `qa-lancamento`.
