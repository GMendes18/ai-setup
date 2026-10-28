---
name: qa-lancamento
description: >-
  Review de lancamento com 5 usuarios simulados (impaciente, cetico, mobile,
  nao nativo e quebrador) navegando o app num navegador real da landing ate o
  primeiro sucesso, com prints de cada atrito, lista ranqueada, correcao em uma
  passada e nova rodada para provar. Use quando o usuario pedir $qa-lancamento,
  /qa-lancamento, QA de lancamento, review de primeiro uso ou teste com
  usuarios simulados.
---

# QA de lancamento: 5 usuarios de primeira viagem

Invoque com `$qa-lancamento` no Codex ou `/qa-lancamento` no Claude Code,
informando a URL do app (local ou publicada). Sem URL, pergunte antes de
comecar.

## Prompt base

> Act as my launch QA lead. Spin up 5 subagents, each a different first-time
> user:
> 1. The impatient one: skims, clicks the first button, quits at the first error
> 2. The skeptic: reads pricing, terms and privacy before signing up
> 3. The mobile user: does everything on a 375px screen on slow 3G
> 4. The non-native English speaker: only follows what the UI literally says
> 5. The breaker: pastes junk into forms, hits back mid-flow, double-clicks
>    everything
>
> Each one opens the app in a real browser, goes from landing page to first
> success, and screenshots every moment they get confused, stuck or annoyed.
> Merge everything into one list ranked by how many users hit it. Fix it all in
> one pass, then rerun the 5 users to prove it's fixed.

## Como executar

1. **Combine o alvo**: URL, o que conta como "primeiro sucesso" (ex.: conta
   criada, primeiro pedido) e credenciais de teste, se houver. Nunca use dados
   reais de clientes nem envie pagamentos de verdade.
2. **Rode os 5 usuarios em paralelo**: um subagente por persona, cada um com
   navegador proprio (Playwright). No Codex, sem subagentes, rode as personas
   em sequencia.
   - Mobile: viewport 375x812 e rede throttled em Slow 3G.
   - Nao nativo: segue so o texto literal da UI, sem deduzir intencao.
   - Quebrador: entradas invalidas, texto gigante, emoji, back no meio do
     fluxo, duplo clique em todo botao de envio.
3. **Evidencia**: cada atrito gera um print salvo em
   `qa-lancamento/<rodada>/<persona>/` com uma linha: onde, o que esperava, o
   que aconteceu.
4. **Consolide**: uma lista unica, sem duplicatas, ranqueada por quantas
   personas bateram no problema (empate: gravidade). Mostre a lista ao usuario
   antes de corrigir.
5. **Corrija tudo em uma passada**, rodando os testes do projeto.
6. **Rode as 5 personas de novo** e entregue uma tabela antes/depois por
   problema. O que ainda falhar fica marcado como aberto, nunca como resolvido.
