---
name: aprofundar-prompt
description: >-
  Aprofunda um prompt ou tarefa antes de executar: pensa como um profissional
  de topo da area, aponta a materia-prima bruta, metodos, ferramentas e uma
  verificacao externa, e reescreve o prompt. Use quando o usuario pedir
  $aprofundar-prompt, /aprofundar-prompt, "versao mais profunda", "aprofunda
  isso" ou quiser melhorar um prompt antes de rodar.
---

# Aprofundar prompt: mais fundo, nao maior

Invoque com `$aprofundar-prompt` no Codex ou `/aprofundar-prompt` no Claude
Code, junto com o prompt ou a tarefa. Sem prompt explicito, use a ultima tarefa
pedida na conversa.

## Instrucao

Aplique exatamente este texto ao prompt do usuario:

> I want a deeper version of this task, not a bigger one. Before rewriting it:
> (1) say what a top professional in this field would do here that I'm not
> asking for; (2) name the rawest material they would start from instead of
> what has already been digested for me; (3) name the specific methods and
> tools they would use; (4) say what, other than you or me, would show the
> result is right. Then rewrite my prompt to ask for exactly that.

## Formato da resposta

Responda no idioma do usuario, nesta ordem:

1. **O que um profissional de topo faria** e o usuario nao pediu.
2. **Materia-prima bruta**: a fonte primaria por onde ele comecaria (dados,
   logs, codigo, entrevistas, specs originais), no lugar de resumos ja
   digeridos.
3. **Metodos e ferramentas**: nomes concretos, nao categorias genericas.
4. **Prova externa**: o que, alem do agente ou do usuario, mostra que o
   resultado esta certo (teste, metrica, usuario real, benchmark, revisor).
5. **Prompt reescrito**: pronto para copiar, pedindo exatamente o que foi
   levantado acima. Mais profundo, nao mais longo: corte o que nao serve.

Nao execute a tarefa. Pare depois do prompt reescrito e pergunte se o usuario
quer rodar a versao nova.
