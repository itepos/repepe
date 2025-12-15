# Instruções para Apresentação Slidev

## Objetivo

Criar apresentações profissionais usando Slidev para o PoP-PE, focadas em clareza e objetividade para audiência não-técnica.

## Princípios de Design de Slides

### 1. Evitar Slides Muito Longos

**Regras:**
- Máximo de 5-7 itens por slide
- Cada item deve ter no máximo 1 linha de texto
- Se um slide tem mais de 10 linhas de conteúdo, divida em 2+ slides
- Use frases curtas e objetivas, não parágrafos

**Antes (ruim):**
```markdown
# Objetivos
- Item com muita descrição explicando tudo em detalhes sobre o assunto
- Outro item longo com várias informações que poderiam ser divididas
- Mais um item com texto extenso
- E mais outro...
```

**Depois (bom):**
```markdown
# Objetivos
- Expandir infraestrutura
- Conectividade de clientes
- Pesquisa e inovação
- Serviços digitais
```

### 2. Dividir Conteúdo Extenso

Quando tiver muito conteúdo, divida em múltiplos slides com subtemas:

```markdown
# Tema Principal - Parte 1
(conteúdo)

---

# Tema Principal - Parte 2
(conteúdo)
```

### 3. Usar Formatação Compacta

**Ao invés de:**
```markdown
- **Nome Completo do Item** - Descrição muito longa explicando tudo
```

**Use:**
```markdown
**Nome** - Descrição breve
```

Ou ainda mais compacto:
```markdown
Nome | Outro | Mais Um
```

### 4. Layouts Apropriados

- `layout: two-cols` - Para dividir conteúdo em 2 colunas
- `layout: center` - Para slides separadores (títulos de seção)
- `layout: default` - Para conteúdo normal

### 5. Slides Separadores

Use slides separadores entre seções principais para dar respiro visual:

```markdown
---
layout: center
class: text-center
background: https://images.unsplash.com/photo-...
---

# Seção Principal
## Subtítulo
```

## Estrutura de Apresentação

### Slides Obrigatórios

1. **Capa** - Título + instituição
2. **Agenda** - Tópicos principais (máximo 7 itens)
3. **Separadores** - Entre cada seção principal
4. **Conteúdo** - Dividido em slides pequenos
5. **Encerramento** - Contatos e agradecimentos

### Audiência Não-Técnica

- Evite jargões técnicos desnecessários
- Use siglas apenas se explicadas
- Foque em benefícios e resultados, não em detalhes técnicos
- Use analogias e exemplos práticos

## Boas Práticas Slidev

### Animações

Use `<v-clicks>` para revelar conteúdo progressivamente:

```markdown
<v-clicks>

- Primeiro item
- Segundo item
- Terceiro item

</v-clicks>
```

### Transições

- Padrão: `slide-left`
- Use `transition: fade-out` apenas quando necessário

## Comandos Úteis

```bash
make dev              # Desenvolvimento
make export-all       # Exportar todos os formatos
make export-pdf       # Apenas PDF
make serve-html       # Servidor para visualizar HTML
```

## Regra CRÍTICA: Dados Estatísticos SEMPRE com Referências

**NUNCA inclua dados estatísticos, números ou métricas sem referências adequadas!**

### Exemplos de dados que EXIGEM referências:

- Números de usuários, instituições, conexões
- Percentuais e estatísticas
- Valores financeiros (investimentos, orçamentos)
- Velocidades, capacidades técnicas
- Datas históricas e marcos
- Quantidades (quilômetros de fibra, número de municípios, etc.)

### Como referenciar corretamente:

```markdown
# Objetivos da RNP <sup class="text-xs opacity-50">[2,8,9]</sup>

- **eduroam** - 3.800+ pontos de acesso <sup class="text-xs opacity-50">[8]</sup>
- **CAFe** - 320+ instituições conectadas <sup class="text-xs opacity-50">[8]</sup>
```

### Workflow para adicionar dados:

1. **Pesquise a fonte oficial** do dado
2. **Adicione a fonte** no slide de Referências
3. **Cite a referência** no slide com o dado usando `<sup class="text-xs opacity-50">[n]</sup>`
4. **Verifique** se todos os dados estão citados

## Checklist Antes de Finalizar

- [ ] Nenhum slide tem mais de 10 linhas
- [ ] Todos os itens são concisos (máximo 1 linha)
- [ ] Slides separadores entre seções principais
- [ ] Conteúdo dividido logicamente
- [ ] Sem jargões técnicos desnecessários
- [ ] **Agenda atualizada** - SEMPRE revisar e atualizar a agenda após adicionar/remover/modificar slides
- [ ] **Dados estatísticos com referências** - TODOS os números devem ter fonte citada
- [ ] Testar com `make dev` para verificar visualização
- [ ] Exportar PDF final com `make export-pdf`

## Regra de Ouro: Manter Agenda Sincronizada

**IMPORTANTE**: Sempre que adicionar, remover ou modificar significativamente um slide:

1. Verifique o slide de Agenda
2. Certifique-se que todos os tópicos principais estão listados
3. Atualize descrições se necessário
4. Mantenha a ordem lógica da apresentação

A agenda é o roadmap da apresentação - deve sempre refletir o conteúdo atual!

## Observações Específicas deste Projeto

### Conteúdo Principal

- RNP e sua missão
- PoPs e objetivos
- Parceria ITEP/RNP
- PoP-PE estrutura
- RePEPE (origem, parcerias, operação)
- Contrato de Gestão
- Redes administradas
- Desafios e resultados

### Público-Alvo

Gerência do ITEP (não-técnica) - foque em:
- Impacto das ações
- Números e resultados
- Parcerias e recursos
- Beneficiários finais (escolas, hospitais, etc.)
