.PHONY: all dev clean export-all export-pdf export-png export-pptx export-html build-single help install update backup serve-html

# Variáveis
EXPORT_DIR = export
SLIDES_NAME = apresentacao-pop-pe
TIMESTAMP := $(shell date +%Y%m%d_%H%M%S)

# Cores para output
GREEN = \033[0;32m
BLUE = \033[0;34m
CYAN = \033[0;36m
YELLOW = \033[1;33m
MAGENTA = \033[0;35m
BOLD = \033[1m
NC = \033[0m # No Color

# Target padrão
all: help

## help: Mostra esta ajuda
help:
	@echo ""
	@echo "$(BOLD)$(BLUE)╔═══════════════════════════════════════════════════════════════╗$(NC)"
	@echo "$(BOLD)$(BLUE)║$(NC)  $(BOLD)Apresentação PoP-PE - Ponto de Presença da RNP/PE$(NC)      $(BOLD)$(BLUE)║$(NC)"
	@echo "$(BOLD)$(BLUE)╚═══════════════════════════════════════════════════════════════╝$(NC)"
	@echo ""
	@echo "$(BOLD)$(CYAN)🚀 DESENVOLVIMENTO$(NC)"
	@echo "  $(YELLOW)make install$(NC)          Instala todas as dependências do projeto"
	@echo "  $(YELLOW)make dev$(NC)              Inicia servidor de desenvolvimento (http://localhost:3030)"
	@echo "  $(YELLOW)make update$(NC)           Atualiza dependências para versões mais recentes"
	@echo ""
	@echo "$(BOLD)$(CYAN)📦 EXPORTAÇÃO - COMANDOS PRINCIPAIS$(NC)"
	@echo "  $(YELLOW)make export-all$(NC)       $(GREEN)★$(NC) Exporta em TODOS os formatos (PDF + PNG + PPTX + HTML)"
	@echo "  $(YELLOW)make backup$(NC)           Cria backup timestamped de todas as exportações"
	@echo ""
	@echo "$(BOLD)$(CYAN)📄 EXPORTAÇÃO - FORMATOS INDIVIDUAIS$(NC)"
	@echo "  $(YELLOW)make export-pdf$(NC)       Exporta apresentação para PDF profissional"
	@echo "                        $(GREEN)→$(NC) Saída: $(MAGENTA)export/$(SLIDES_NAME).pdf$(NC)"
	@echo ""
	@echo "  $(YELLOW)make export-png$(NC)       Exporta cada slide como imagem PNG"
	@echo "                        $(GREEN)→$(NC) Saída: $(MAGENTA)export/png/01.png, 02.png, ...$(NC)"
	@echo ""
	@echo "  $(YELLOW)make export-pptx$(NC)      Exporta para Microsoft PowerPoint (editável)"
	@echo "                        $(GREEN)→$(NC) Saída: $(MAGENTA)export/$(SLIDES_NAME).pptx$(NC)"
	@echo ""
	@echo "  $(YELLOW)make export-html$(NC)      Exporta SPA HTML interativa (multi-arquivo)"
	@echo "                        $(GREEN)→$(NC) Saída: $(MAGENTA)export/html/index.html$(NC)"
	@echo ""
	@echo "  $(YELLOW)make build-single$(NC)     Build SPA compacto + arquivo .tar.gz para distribuição"
	@echo "                        $(GREEN)→$(NC) Saída: $(MAGENTA)export/spa-compacto/ + .tar.gz$(NC)"
	@echo ""
	@echo "$(BOLD)$(CYAN)🌐 SERVIDOR LOCAL$(NC)"
	@echo "  $(YELLOW)make serve-html$(NC)       Inicia servidor HTTP para visualizar export/html/"
	@echo "                        $(GREEN)→$(NC) Acesse: $(MAGENTA)http://localhost:8080$(NC)"
	@echo ""
	@echo "$(BOLD)$(CYAN)🧹 LIMPEZA$(NC)"
	@echo "  $(YELLOW)make clean$(NC)            Remove diretórios de build e export"
	@echo "  $(YELLOW)make clean-all$(NC)        Limpeza completa (inclui node_modules)"
	@echo ""
	@echo "$(BOLD)$(CYAN)❓ AJUDA$(NC)"
	@echo "  $(YELLOW)make help$(NC)             Mostra esta mensagem de ajuda"
	@echo ""
	@echo "$(BOLD)Exemplo de uso:$(NC)"
	@echo "  $$ make install                # Instalar dependências (primeira vez)"
	@echo "  $$ make dev                    # Desenvolver apresentação"
	@echo "  $$ make export-all             # Exportar todos os formatos"
	@echo "  $$ make export-pdf             # Exportar apenas PDF"
	@echo ""

## dev: Inicia servidor de desenvolvimento (instala dependências se necessário)
dev:
	@if [ ! -d "node_modules" ]; then \
		echo "$(YELLOW)node_modules não encontrado. Instalando dependências...$(NC)"; \
		npm install; \
	fi
	@echo "$(GREEN)Iniciando servidor de desenvolvimento...$(NC)"
	npm run dev

## clean: Limpa diretórios de build e export
clean:
	@echo "$(YELLOW)Limpando diretórios de build e export...$(NC)"
	rm -rf $(EXPORT_DIR)
	rm -rf dist
	rm -rf slides-export.pdf
	rm -rf slides-export
	@echo "$(GREEN)Diretórios limpos!$(NC)"

## clean-all: Limpeza completa (build, export e node_modules)
clean-all: clean
	@echo "$(YELLOW)Removendo node_modules e package-lock.json...$(NC)"
	rm -rf node_modules
	rm -rf package-lock.json
	@echo "$(GREEN)Limpeza completa concluída!$(NC)"
	@echo "$(CYAN)Execute 'make dev' ou 'npm install' para reinstalar dependências$(NC)"

## export-all: Exporta em todos os formatos
export-all: clean export-pdf export-png export-pptx export-html
	@echo "$(GREEN)========================================$(NC)"
	@echo "$(GREEN)Todas as exportações concluídas!$(NC)"
	@echo "$(GREEN)Verifique o diretório: $(EXPORT_DIR)/$(NC)"
	@echo "$(GREEN)========================================$(NC)"
	@ls -lh $(EXPORT_DIR)/

## export-pdf: Exporta para PDF
export-pdf:
	@echo "$(GREEN)Exportando para PDF...$(NC)"
	@mkdir -p $(EXPORT_DIR)
	npm run export:pdf
	@if [ -f "slides-export.pdf" ]; then \
		mv slides-export.pdf $(EXPORT_DIR)/$(SLIDES_NAME).pdf; \
		echo "$(GREEN)✓ PDF exportado: $(EXPORT_DIR)/$(SLIDES_NAME).pdf$(NC)"; \
	else \
		echo "$(YELLOW)⚠ Arquivo PDF não encontrado$(NC)"; \
	fi

## export-png: Exporta para PNG (imagens individuais)
export-png:
	@echo "$(GREEN)Exportando para PNG...$(NC)"
	@mkdir -p $(EXPORT_DIR)/png
	npm run export:png
	@if [ -d "slides-export" ]; then \
		mv slides-export/* $(EXPORT_DIR)/png/ 2>/dev/null || true; \
		rm -rf slides-export; \
		echo "$(GREEN)✓ PNGs exportados: $(EXPORT_DIR)/png/$(NC)"; \
	else \
		echo "$(YELLOW)⚠ Diretório de PNGs não encontrado$(NC)"; \
	fi

## export-pptx: Exporta para PowerPoint
export-pptx:
	@echo "$(GREEN)Exportando para PowerPoint...$(NC)"
	@mkdir -p $(EXPORT_DIR)
	npm run export:pptx
	@if [ -f "slides-export.pptx" ]; then \
		mv slides-export.pptx $(EXPORT_DIR)/$(SLIDES_NAME).pptx; \
		echo "$(GREEN)✓ PPTX exportado: $(EXPORT_DIR)/$(SLIDES_NAME).pptx$(NC)"; \
	else \
		echo "$(YELLOW)⚠ Arquivo PPTX não encontrado$(NC)"; \
	fi

## export-html: Exporta SPA HTML (multi-arquivo)
export-html:
	@echo "$(GREEN)Exportando SPA HTML...$(NC)"
	@mkdir -p $(EXPORT_DIR)/html
	npm run build
	@if [ -d "dist" ]; then \
		cp -r dist/* $(EXPORT_DIR)/html/; \
		echo "$(GREEN)✓ HTML exportado: $(EXPORT_DIR)/html/$(NC)"; \
		echo "$(YELLOW)  IMPORTANTE: Não abra diretamente! Use um servidor HTTP.$(NC)"; \
		echo "$(YELLOW)  Execute: $(BOLD)make serve-html$(NC)$(YELLOW) e acesse http://localhost:8080$(NC)"; \
	else \
		echo "$(YELLOW)⚠ Diretório dist não encontrado$(NC)"; \
	fi

## serve-html: Inicia servidor HTTP para visualizar export/html
serve-html:
	@if [ ! -d "$(EXPORT_DIR)/html" ]; then \
		echo "$(YELLOW)Diretório $(EXPORT_DIR)/html não encontrado!$(NC)"; \
		echo "$(YELLOW)Execute primeiro: make export-html$(NC)"; \
		exit 1; \
	fi
	@echo "$(GREEN)Iniciando servidor HTTP na porta 8080...$(NC)"
	@echo "$(CYAN)Acesse: $(BOLD)http://localhost:8080$(NC)"
	@echo "$(YELLOW)Pressione Ctrl+C para parar$(NC)"
	@echo ""
	@cd $(EXPORT_DIR)/html && python3 -m http.server 8080

## build-single: Build SPA compacto (alternativa ao HTML único)
build-single:
	@echo "$(GREEN)Gerando build SPA compacto...$(NC)"
	@echo "$(YELLOW)Nota: HTML único verdadeiro não é suportado pelo Slidev.$(NC)"
	@echo "$(YELLOW)      Use 'make export-pdf' para um arquivo único portátil.$(NC)"
	@echo ""
	@mkdir -p $(EXPORT_DIR)/spa-compacto
	npm run build
	@if [ -d "dist" ]; then \
		cp -r dist/* $(EXPORT_DIR)/spa-compacto/; \
		cd $(EXPORT_DIR)/spa-compacto && tar -czf ../apresentacao-spa.tar.gz * && cd ../..; \
		echo "$(GREEN)✓ SPA exportado: $(EXPORT_DIR)/spa-compacto/index.html$(NC)"; \
		echo "$(GREEN)✓ Arquivo compactado: $(EXPORT_DIR)/apresentacao-spa.tar.gz$(NC)"; \
		echo "$(YELLOW)  Para distribuir: envie o .tar.gz ou hospede a pasta spa-compacto$(NC)"; \
	else \
		echo "$(YELLOW)⚠ Build falhou$(NC)"; \
	fi

## backup: Cria backup timestamped de todos os exports
backup: export-all
	@echo "$(GREEN)Criando backup...$(NC)"
	@mkdir -p backups
	tar -czf backups/apresentacao-$(TIMESTAMP).tar.gz $(EXPORT_DIR)
	@echo "$(GREEN)✓ Backup criado: backups/apresentacao-$(TIMESTAMP).tar.gz$(NC)"

## install: Instala todas as dependências do projeto
install:
	@echo "$(GREEN)Instalando dependências...$(NC)"
	@npm install
	@echo "$(GREEN)✓ Dependências instaladas com sucesso!$(NC)"
	@echo "$(CYAN)Execute 'make dev' para iniciar o servidor$(NC)"

## update: Atualiza dependências
update:
	@echo "$(GREEN)Atualizando dependências...$(NC)"
	npm update
	@echo "$(GREEN)✓ Dependências atualizadas!$(NC)"
