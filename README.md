# PARSING HTML

### Descrição

Este projeto consiste em um script Bash que permite extrair domínios de uma página HTML e obter informações sobre esses domínios, como os endereços IP associados. A ferramenta é útil para análise e reconhecimento de ativos durante pentests ou avaliações de segurança em sites da web.

### Funcionamento

  * Baixa uma Página HTML: O script começa por baixar uma página HTML a partir de uma URL especificada.

  * Extrai e Filtra Domínios: O script analisa a página HTML baixada e extrai os domínios contidos nela. Os domínios são filtrados para garantir que apenas os válidos sejam selecionados.

  * Resultados: O script cria um arquivo de texto ($1.ip.txt) para salvar a lista de domínios encontrados e exibe os resultados na saída padrão.

  * Busca Endereços IP: Para cada domínio extraído, o script utiliza o comando ```host``` para buscar os endereços IP associados. Os resultados são exibidos em uma tabela, incluindo o número da linha, o IP e o domínio.

### Exemplo de Uso

~~~bash
./parsingHTML.sh exemplo.com.br
~~~

### Requisitos

  * Utilitário wget para baixar páginas HTML
  * Acesso à Internet para buscar os endereços IP
    
### Notas Importantes

  * Este script é destinado a fins de análise de segurança e pentests em sites da web legais e autorizados.
  * Certifique-se de que o comando ```host``` esteja disponível em seu sistema, pois ele é usado para buscar os IPs dos domínios.
  * Os resultados podem variar dependendo do conteúdo da página HTML e das configurações do servidor DNS.


