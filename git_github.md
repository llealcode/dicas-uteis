# 🌱 Git & GitHub — Guia Sem Mistério

> Documentação direta para quem está começando.
> Explicações curtas, exemplos práticos e um FAQ no final para situações específicas.

---

## 📑 Sumário

- [O que é Git e GitHub?](#-o-que-é-git-e-github)
- [Configuração Inicial](#️-configuração-inicial)
- [Parte 1 — Comandos do Git](#-parte-1--comandos-do-git)
  - [Iniciando um projeto](#-iniciando-um-projeto)
  - [Verificando o que está acontecendo](#-verificando-o-que-está-acontecendo)
  - [Salvando alterações](#-salvando-alterações)
  - [Trabalhando com branches](#-trabalhando-com-branches)
  - [Desfazendo coisas](#️-desfazendo-coisas)
  - [Truques úteis](#-truques-úteis)
- [Parte 2 — Comandos do GitHub](#️-parte-2--comandos-do-github)
- [Parte 3 — Fluxo de Trabalho em Equipe](#-parte-3--fluxo-de-trabalho-em-equipe)
- [🆘 FAQ — Situações Específicas](#-faq--situações-específicas)
- [Glossário Rápido](#-glossário-rápido)

---

## 🧭 O que é Git e GitHub?

**Git** é um programa que vive no seu computador e guarda o **histórico** do seu projeto. Você pode voltar no tempo, ver o que mudou e trabalhar em equipe sem sobrescrever ninguém.

**GitHub** é o site onde você **publica** seus projetos Git. É a nuvem do Git.

> 💡 **Resumindo:** Git é o programa. GitHub é o lugar online onde o Git fica hospedado.

---

## ⚙️ Configuração Inicial

Faça isso **uma única vez**, antes de começar qualquer projeto. Serve para o Git saber quem você é.

```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
git config --list
```

| Comando | O que faz |
|---|---|
| `user.name` | Define seu nome (aparece em cada commit) |
| `user.email` | Define seu e-mail |
| `--list` | Mostra todas as configurações já feitas |

---

# 📦 Parte 1 — Comandos do Git

## 🚀 Iniciando um projeto

### `git init`

Transforma uma pasta comum em um projeto Git. Cria um histórico zerado, pronto para receber salvamentos.

```bash
git init
```

**Quando usar:** quando você está começando um projeto **do zero** no seu computador.

---

### `git clone`

Baixa um projeto que **já existe** no GitHub para o seu computador, com todo o histórico junto.

```bash
git clone https://github.com/usuario/projeto.git
```

**Quando usar:** quando você vai trabalhar em um projeto que outra pessoa (ou sua equipe) já começou.

---

## 📋 Verificando o que está acontecendo

### `git status`

Mostra o estado atual do projeto: o que foi modificado, o que está pronto para salvar e o que ainda não está sendo rastreado.

```bash
git status
```

> 💡 **Dica de ouro:** rode `git status` o tempo todo. Antes e depois de qualquer ação. É a sua bússola.

---

### `git log` e `git log --oneline`

Mostram o histórico de commits (todos os salvamentos feitos no projeto).

```bash
git log              # versão detalhada
git log --oneline    # versão resumida (uma linha por commit)
```

Cada commit tem um código único chamado **hash** (ex: `a3f9c2b`). Esse código serve para se referir a um commit específico depois.

> 💡 Aperte `q` para sair da tela do log.

---

### `git diff`

Compara o que você tem agora com o último commit. Mostra linha por linha o que mudou.

```bash
git diff
```

Linhas em **verde** foram adicionadas. Linhas em **vermelho** foram removidas.

---

## 💾 Salvando alterações

Salvar no Git tem **duas etapas**: você **prepara** (`add`) e depois **confirma** (`commit`).

### `git add`

Prepara arquivos para o próximo salvamento.

```bash
git add arquivo.txt    # prepara um arquivo específico
git add .              # prepara TUDO que foi modificado
```

---

### `git commit`

Salva (confirma) os arquivos que foram preparados. Cada commit precisa de uma mensagem descritiva.

```bash
git commit -m "Adiciona tela de login"
git commit -am "mensagem"   # atalho: prepara e salva em um comando só
```

> ⚠️ O atalho `-am` só funciona para arquivos que o Git **já conhece**. Arquivos novos ainda precisam de `git add` antes.

**Boas mensagens de commit:**
- ✅ `"Corrige erro no botão de enviar"`
- ✅ `"Adiciona validação de e-mail"`
- ❌ `"mudanças"`
- ❌ `"asdasd"`

---

## 🌿 Trabalhando com branches

Uma **branch** é uma linha de trabalho paralela. Você pode mexer no projeto sem afetar o que já está funcionando.

> 💡 **Em equipe, branches são essenciais.** Cada pessoa trabalha na sua, e só depois junta tudo.

### `git branch`

Lista todas as branches existentes. A branch atual aparece marcada com `*`.

```bash
git branch                # lista as branches
git branch nome-branch    # cria uma nova branch
git branch -d nome-branch # apaga uma branch já mesclada
```

---

### `git checkout` e `git switch`

Servem para **mudar de branch**.

```bash
git checkout nome-branch       # muda para a branch
git checkout -b nova-branch    # cria a branch e já entra nela (atalho)
git switch nome-branch         # versão moderna do checkout
```

> 💡 `git checkout -b` é o atalho **mais usado** no dia a dia. Cria e entra na branch em um único comando.

---

### `git merge`

Une as alterações de outra branch à branch onde você está agora.

```bash
git checkout main          # primeiro, vá para a branch que vai receber
git merge nome-branch      # agora, traga as mudanças da outra branch
```

---

## ↩️ Desfazendo coisas

### `git restore`

Desfaz mudanças que você ainda **não commitou**.

```bash
git restore arquivo.txt             # descarta mudanças no arquivo
git restore --staged arquivo.txt    # tira o arquivo da preparação (desfaz o add)
```

---

### `git reset`

Desfaz commits já feitos. Tem duas formas principais:

```bash
git reset --soft HEAD~1    # desfaz o commit, MAS mantém suas mudanças
git reset --hard HEAD~1    # desfaz o commit E apaga suas mudanças
```

> ⚠️ **Cuidado com `--hard`:** ele apaga seu trabalho de forma definitiva. Só use se tiver certeza.

---

### `git revert`

Desfaz um commit antigo **criando um novo commit** que faz o oposto. É o jeito **mais seguro**, porque não apaga o histórico.

```bash
git revert <hash-do-commit>
```

> 💡 Use `revert` em projetos compartilhados. Use `reset` só em mudanças locais que ninguém viu ainda.

---

## 🧰 Truques úteis

### `git stash`

Guarda suas mudanças temporariamente, sem fazer commit. Útil quando você precisa pausar e trocar de tarefa rapidamente.

```bash
git stash         # guarda as mudanças
git stash pop     # recupera as mudanças guardadas
git stash list    # lista todas as mudanças guardadas
```

---

### `git blame`

Mostra quem alterou cada linha de um arquivo e quando. (O nome é dramático, mas o uso é prático.)

```bash
git blame arquivo.txt
```

---

# ☁️ Parte 2 — Comandos do GitHub

Aqui estão os comandos que conectam seu projeto local ao GitHub.

### `git remote`

Conecta seu projeto local a um repositório online no GitHub.

```bash
git remote add origin https://github.com/usuario/projeto.git
git remote -v   # confere com qual repositório você está conectado
```

> 💡 `origin` é apenas um **apelido** para o endereço do seu repositório no GitHub. É o nome padrão usado por todo mundo.

---

### `git push`

Envia (empurra) seus commits para o GitHub.

```bash
git push -u origin main         # primeira vez (define o padrão)
git push                        # depois disso, basta isso
git push origin nome-branch     # envia uma branch específica
```

---

### `git pull`

Baixa (puxa) as atualizações que estão no GitHub para o seu computador.

```bash
git pull
```

> 💡 **Hábito essencial:** rode `git pull` **toda vez** que for começar a trabalhar. Isso evita conflitos com o que sua equipe enviou.

---

### `git fetch`

Baixa as atualizações do GitHub, mas **não aplica** no seu trabalho. Serve para "espiar" antes de incorporar.

```bash
git fetch
```

---

# 👥 Parte 3 — Fluxo de Trabalho em Equipe

Esse é o ciclo que você vai repetir todo dia em um projeto colaborativo:

```bash
# 1. Atualiza o projeto com o que sua equipe enviou
git pull

# 2. Cria uma branch para sua tarefa
git checkout -b minha-tarefa

# 3. [Faz suas alterações nos arquivos]

# 4. Confere o que mudou
git status

# 5. Prepara tudo para salvar
git add .

# 6. Salva com uma mensagem clara
git commit -m "Adiciona funcionalidade X"

# 7. Envia sua branch para o GitHub
git push origin minha-tarefa

# 8. [No site do GitHub, abre um Pull Request para revisão]

# 9. Após aprovação, volta para a main e atualiza
git checkout main
git pull
```

---

# 🆘 FAQ — Situações Específicas

Aqui ficam as dúvidas que aparecem quando você já entende o básico, mas se enrolou em uma situação real.

---

### ❓ Como deleto os últimos commits?

Depende se você quer **manter** ou **apagar** as alterações desses commits.

**Manter as alterações (recomendado):**
```bash
git reset --soft HEAD~1    # desfaz 1 commit
git reset --soft HEAD~3    # desfaz 3 commits
```

**Apagar as alterações também (CUIDADO!):**
```bash
git reset --hard HEAD~1
```

> ⚠️ Se você **já enviou esses commits para o GitHub**, NÃO use `reset`. Use `git revert <hash>` para não bagunçar o trabalho dos outros.

---

### ❓ Esqueci de criar branch e commitei tudo na `main`. E agora?

Calma, dá pra resolver:

```bash
git reset --soft HEAD~1          # desfaz o commit, mas mantém suas mudanças
git checkout -b minha-branch     # cria a branch correta e entra nela
git add .                        # prepara
git commit -m "sua mensagem"     # commita no lugar certo
```

---

### ❓ Apareceu um conflito ao fazer merge. O que faço?

Conflito acontece quando duas pessoas mexeram na **mesma linha** do mesmo arquivo. O Git não sabe qual versão manter, então pede sua ajuda.

1. Abra o arquivo. Você verá marcações assim:
   ```
   <<<<<<< HEAD
   versão A (sua)
   =======
   versão B (da outra branch)
   >>>>>>> nome-branch
   ```
2. Escolha qual versão manter (ou combine as duas) e **apague as marcações** `<<<<<<<`, `=======` e `>>>>>>>`.
3. Salve o arquivo e rode:
   ```bash
   git add .
   git commit -m "Resolve conflito"
   ```

---

### ❓ Apaguei um arquivo sem querer. Como recupero?

Se você **ainda não commitou** a remoção:
```bash
git restore arquivo.txt
```

Se você **já commitou** a remoção, precisa voltar a versão anterior do arquivo:
```bash
git checkout <hash-do-commit-antigo> -- arquivo.txt
```

---

### ❓ Como volto uma versão que já está no GitHub?

Use `revert` e depois `push`. Esse é o jeito seguro em projetos compartilhados:

```bash
git revert <hash-do-commit>
git push
```

> ⚠️ **Nunca** use `git reset --hard` seguido de `git push --force` em projetos compartilhados sem combinar com a equipe. Você pode apagar o trabalho dos outros.

---

### ❓ Como descubro o `hash` de um commit?

```bash
git log --oneline
```

O código de 7 caracteres no início de cada linha é o hash (ex: `a3f9c2b`).

---

### ❓ Não lembro em qual branch estou. Como descubro?

```bash
git branch
```

A branch atual aparece marcada com um `*` na frente.

---

### ❓ Como renomeio a branch onde estou?

```bash
git branch -m novo-nome
```

---

### ❓ Minha branch local está atrasada em relação ao GitHub. Como atualizo?

```bash
git pull
```

Se você estiver em outra branch e quiser atualizar a `main` sem sair dela:
```bash
git fetch origin main
```

---

### ❓ Quero ver quantos commits cada pessoa fez no projeto.

```bash
git shortlog -sn
```

---

### ❓ Como marco uma versão importante do projeto (ex: v1.0)?

Use **tags**. Elas funcionam como marcadores de versão.

```bash
git tag v1.0                # cria a tag no commit atual
git tag                     # lista todas as tags
git push origin v1.0        # envia a tag para o GitHub
```

---

## 📋 Glossário Rápido

| Termo | Significado |
|---|---|
| **Repositório** | A pasta do projeto rastreada pelo Git |
| **Commit** | Um salvamento com registro do que foi alterado |
| **Branch** | Uma linha de trabalho paralela |
| **Merge** | Unir duas branches em uma |
| **Hash** | Código único que identifica cada commit |
| **Remote** | O repositório que fica no GitHub (online) |
| **Push** | Enviar alterações para o GitHub |
| **Pull** | Baixar alterações do GitHub |
| **Clone** | Baixar um projeto pela primeira vez |
| **Stash** | Guardar alterações temporariamente |
| **HEAD** | O ponto atual no histórico — onde você está agora |
| **Pull Request** | Pedido de revisão no GitHub antes de juntar branches |

---

## 🎓 Para se aprofundar

- 📚 **Documentação oficial do Git:** [git-scm.com/doc](https://git-scm.com/doc)
- 📚 **Documentação do GitHub:** [docs.github.com](https://docs.github.com)

---

> **Lembre-se:** Git parece complicado no começo, mas é só repetição. Em uma semana de uso, vira automático. ⚡

*Feito com carinho para quem está começando.*
