# Apresentação PoP-PE - Ponto de Presença da RNP em Pernambuco

Apresentação profissional sobre o PoP-PE (Ponto de Presença da RNP em Pernambuco) para o ITEP (Instituto de Tecnologia de Pernambuco).

## Conteúdo da Apresentação

- O que é a RNP (Rede Nacional de Ensino e Pesquisa)
- Pontos de Presença (PoPs) - objetivos e papel estratégico
- Parceria ITEP e RNP via Acordo de Cooperação Técnica
- Estrutura e equipe técnica do PoP-PE
- RePEPE (Rede Pernambucana de Pesquisa e Educação)
- Contrato de Gestão com o Governo de Pernambuco
- Redes administradas e abrangência
- Desafios e sustentabilidade

## Como Executar

### Usando Makefile (Recomendado)

```bash
# Ver todos os comandos disponíveis
make help

# Iniciar servidor de desenvolvimento
make dev

# Exportar em TODOS os formatos (PDF, PNG, PPTX, HTML)
make export-all

# Exportar formato específico
make export-pdf      # Exporta para PDF
make export-png      # Exporta para imagens PNG
make export-pptx     # Exporta para PowerPoint
make export-html     # Exporta SPA HTML

# Limpar arquivos gerados
make clean

# Criar backup timestamped
make backup
```

### Usando NPM diretamente

```bash
# Modo desenvolvimento (apresentação interativa)
npm run dev

# Exportações
npm run export:pdf      # PDF com tema escuro
npm run export:png      # Imagens PNG individuais
npm run export:pptx     # PowerPoint
npm run build           # SPA HTML multi-arquivo

# Exportação padrão
npm run export
```

**Acesse:** http://localhost:3030 no navegador (modo dev)

## Tecnologias Utilizadas

- [Slidev](https://sli.dev/) - Framework de apresentações baseado em Markdown
- Tema: Default (com esquema de cores escuro)
- Transições suaves entre slides
- Suporte a animações e cliques progressivos

## Estrutura

- `slides.md` - Arquivo principal da apresentação
- `package.json` - Configuração do projeto e dependências
- `anexos/` - Documentos de referência utilizados

## Fontes de Informação

A apresentação foi elaborada com base em:

- Documentos oficiais do acordo de cooperação entre ITEP e RNP
- Informações sobre Redecomep e RePEPE
- Plano de Trabalho do ITEP (Macroprocesso 4)
- Websites oficiais da RNP e PoP-PE
- Notícias e publicações sobre a RePEPE

## Contato

PoP-PE - Ponto de Presença da RNP em Pernambuco
- Website: https://www.pop-pe.rnp.br
- Email: info@pop-pe.rnp.br
- Endereço: Av. Professor Luiz Freire, 700 - Cidade Universitária, Recife - PE
