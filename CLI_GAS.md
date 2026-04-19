# Guia de Instalação do Clasp — CLI do Google Apps Script

> **Clasp** (Command Line Apps Script) é a ferramenta oficial do Google para gerenciar projetos GAS pelo terminal, permitindo editar localmente e fazer push direto para o Google Apps Script.

---

## Pré-requisitos

### 1. Instalar o Node.js

Solicite a instalação do **Node.js** pelo **MeliHelp** (canal interno de TI).

Após a instalação, verifique no terminal:

```powershell
node --version
npm --version
```

Ambos devem retornar uma versão (ex: `v20.x.x`).

---

## Instalação do Clasp

### 2. Instalar o Clasp globalmente

```powershell
npm install -g @google/clasp
```

### 3. Adicionar o npm ao PATH do sistema

```powershell
[Environment]::SetEnvironmentVariable("Path", $env:PATH + ";C:\Users\lucleal\AppData\Roaming\npm", "User")
```

> **Importante:** feche e reabra o terminal após este passo para que o PATH seja atualizado.

### 4. Verificar a instalação

```powershell
clasp --version
```

Deve retornar algo como `2.x.x`.

---

## Configuração do Projeto

### 5. Fazer login com a conta Google

```powershell
clasp login
```

Uma janela do browser será aberta para autenticação. Autorize o acesso com sua conta Google corporativa.

> Se o login via browser não funcionar, use a flag `--no-localhost`:
> ```powershell
> clasp login --no-localhost
> ```

### 6. Vincular ao projeto GAS existente

Na pasta local do seu projeto, execute:

```powershell
clasp clone SEU_SCRIPT_ID
```

O **Script ID** está disponível em:
**Google Apps Script → Configurações do Projeto → ID do script**

---

## Uso no dia a dia

| Comando | O que faz |
|---|---|
| `clasp push` | Envia alterações locais para o GAS |
| `clasp pull` | Baixa a versão atual do GAS para local |
| `clasp open` | Abre o projeto no editor do GAS |
| `clasp versions` | Lista versões publicadas |
| `clasp deploy` | Publica uma nova versão |

### Exemplo de fluxo de trabalho

```powershell
# Editar os arquivos .gs e .html localmente
# Depois, subir as alterações para o GAS:
clasp push
```

---

## Estrutura de arquivos esperada

```
meu-projeto/
├── .clasp.json         # Configuração do projeto (Script ID)
├── appsscript.json     # Manifesto do Apps Script
├── Main.gs
├── Utils.gs
├── Index.html
└── ...
```

O arquivo `.clasp.json` é criado automaticamente pelo `clasp clone` com o conteúdo:

```json
{
  "scriptId": "SEU_SCRIPT_ID_AQUI",
  "rootDir": "./"
}
```

---

## Resolução de Problemas

**`clasp` não é reconhecido como comando:**
- Verifique se o PATH foi atualizado (passo 3)
- Feche e reabra o terminal
- Como alternativa, use `npx @google/clasp <comando>`

**Erro de autenticação no login:**
- Use `clasp login --no-localhost` para obter um link de autenticação manual

**Push rejeitado:**
- Verifique se o Script ID no `.clasp.json` está correto
- Confirme que você tem permissão de edição no projeto GAS

---

*Documentação criada em abril de 2026.*