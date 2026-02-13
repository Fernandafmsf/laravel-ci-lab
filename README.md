# 🚀 Laravel CI Lab

Projeto desenvolvido para estudo e implementação de **CI/CD moderno**, utilizando GitHub Actions, Docker e versionamento semântico com automação de releases.


## Objetivo do Projeto

Este projeto foi criado com o objetivo de:

- Implementar pipeline de CI/CD
- Automatizar build de imagem Docker
- Automatizar versionamento semântico
- Criar workflow de release manual
- Resolver autenticação segura via PAT
- Organizar fluxo entre `master` e `develop`


## Stack Utilizada

- PHP / Laravel  
- Docker  
- Docker Compose  
- GitHub Actions  
- Git  
- Versionamento Semântico



## 🐳 Ambiente com Docker
O projeto roda completamente via container.

### Subir o ambiente:

```bash
docker compose up -d
```

## CI com GitHub Actions

A automação foi configurada utilizando GitHub Actions.

O pipeline realiza:
- Checkout completo do repositório (fetch-depth: 0)
- Busca de todas as tags existentes
- Definição automática de versão
- Criação e push de tag
- Build da imagem Docker

## Versionamento Semântico

O projeto segue o padrão:
- vMAJOR.MINOR.PATCH

Exemplos 
- v1.0.0
- v1.2.0
- v1.3.1

### Regras implementadas:
- Se nenhuma versão for informada no workflow → PATCH é incrementado automaticamente
- Tags devem começar com v
- A maior tag existente é sempre considerada
- Proteção contra criação de versão duplicada

## Workflow: Manual Release
Foi criado um workflow de release manual acionado via workflow_dispatch.
Ele permite:
- Informar uma versão manualmente (ex: v1.4.0)
- Ou deixar vazio para incremento automático do PATCH
- Criar e enviar a tag automaticamente

## Autenticação com PAT
Para evitar erro 403 ao realizar push via GitHub Actions, foi implementado:
- persist-credentials: false
- Configuração manual do remote
- Uso de PAT_TOKEN armazenado em Secrets

Exemplo utilizado:
```bash
git remote set-url origin https://x-access-token:${{ secrets.PAT_TOKEN }}@github.com/${{ github.repository }}

```

## Problemas Resolvidos
Durante a implementação foram solucionados:
- Erro 403 ao usar github-actions[bot]
- Falta de tags por causa de fetch-depth padrão
- Inconsistência entre tags com e sem v
- Erros de sintaxe YAML
- Incremento incorreto de versão


## Próximos Passos
- Gerar release notes automáticas
- Estudar sobre visualização de logs 
- Estudar possibilidade de merge automático na develop
