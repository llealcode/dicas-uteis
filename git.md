# 🚀 **Comandos essenciais do Git**
*O guia DEFINITIVO que todo desenvolvedor PRECISA dominar*

Este não é mais um tutorial básico. É o **mapa do tesouro** que vai te transformar de iniciante confuso em **mestre do versionamento**. 

## 📋 **Índice comandos**
| Comando | Função | Nível |
|---------|--------|-------|
| `git init` | Inicializar repositório | 🟢 Básico |
| `git add` | Adicionar arquivos | 🟢 Básico |
| `git commit` | Salvar alterações | 🟢 Básico |
| `git status` | Verificar status | 🟢 Básico |
| `git push` | Enviar para repositório remoto | 🟢 Básico |
| `git pull` | Baixar alterações | 🟢 Básico |
| `git log` | Histórico de commits | 🟡 Intermediário |
| `git branch` | Gerenciar branches | 🟡 Intermediário |
| `git merge` | Unir branches | 🔴 Avançado |
## 🏁 **1. Inicializar repositório**
### `git init`

```bash
git init
```

**O que acontece aqui?** O Git cria a "máquina do tempo" do seu projeto - o arquivo oculto `.git`

### ⚡ **Resultado imediato:**
- ✅ Pasta `.git` criada (NUNCA mexa nela!)
- ✅ Seu projeto agora tem "poderes" de versionamento
- ✅ Pronto para rastrear TODAS as mudanças

> ### 🔥 **Dica extra**
> Use `ls -la` no terminal para ver a pasta `.git` oculta. Se ela existir, você está no caminho certo!
```bash
ls .git # Vai listar todos os arquivos que estão na pasta .git
```


## 📁 **2. Adicionar arquivos ao controle**
### `git add`

### **Opções poderosas:**

```bash
# Adicionar 1 arquivo específico
git add arquivo.txt

# Adicionar TODOS os arquivos modificados
git add .

# Adicionar APENAS arquivos .js
git add *.js

# Adicionar arquivos interativamente (AVANÇADO)
git add -i
```

> ### ⚠️ **CUIDADO!**
> O comando `git add .` adiciona TUDO. Use com sabedoria para não incluir arquivos desnecessários.

---

## 💾 **3. Salvar alterações**
### `git commit`

```bash
# Commit com mensagem inline
git commit -m "Sua mensagem aqui"

# Commit com editor de texto (mais detalhado)
git commit

# Commit pulando o add (para arquivos já rastreados)
git commit -am "Mensagem do commit"
```

## 🔍 **4. Monitorar projeto**
### `git status`

```bash
git status
```
### 🎨 **Entenda os estados dos aquivos:**

| Status | Significado | Cor no VS Code |
|--------|-------------|----------------|
| **U** | Untracked (Não rastreado) | 🔴 Vermelho |
| **M** | Modified (Modificado) | 🟡 Amarelo |
| **A** | Added (Adicionado) | 🟢 Verde |

### 📊 **Versão resumida:**
```bash
git status -s
```


## 📚 **5. Histórico de versionamento**
### `git log`

```bash
# Log padrão
git log

# Log condensado (mais limpo)
git log --oneline

# Log com gráfico visual
git log --graph --oneline

# Log dos últimos 5 commits
git log -5
```


## 🌿 **6. Branches**
### `git branch`

```bash
# Listar todas as branches
git branch

# Criar nova branch
git branch nova-feature

# Mudar para outra branch
git checkout nova-feature

# Criar E mudar para nova branch (ATALHO)
git checkout -b nova-feature

# Deletar branch
git branch -d nome-da-branch
```

## 🔗 **7. Conectar com repositório remoto**
### `git remote`

```bash
# Adicionar repositório remoto
git remote add origin https://github.com/usuario/repo.git

# Enviar código para o GitHub
git push -u origin main

# Baixar mudanças do remoto
git pull origin main

# Clonar repositório existente
git clone https://github.com/usuario/repo.git
```
## ⚡ **Comandos salva vidas**

### 🆘 **Desfazer mudanças:**
```bash
# Voltar arquivo para versão anterior
git checkout -- arquivo.txt

# Desfazer último commit (mantém mudanças)
git reset --soft HEAD~1

# Desfazer último commit (APAGA mudanças)
git reset --hard HEAD~1
```

### 🔄 **Corrigir último commit:**
```bash
git commit --amend -m "Nova mensagem"
```

### **Configure seu perfil Git:**
   ```bash
   git config --global user.name "Seu Nome"
   git config --global user.email "seu@email.com"
   ```

---

## 🚨 **Resumo para emergências**

```bash
# Fluxo básico COMPLETO:
git init                    # Inicializar
git add .                   # Adicionar arquivos
git commit -m "Primeiro commit"  # Salvar
git remote add origin URL   # Conectar GitHub
git push -u origin main     # Enviar código
git pull origin main       # Baixar mudanças
```


**💪 Agora você tem o PODER do Git nas suas mãos. Use com sabedoria!**

>*"O código que não está versionado é código perdido"* - Lucas Leal