# Documentação do Projeto de Automação de Testes de API - ServeRest

**Autor:** R. Carlos Antonio de Lima Fernandes  
**Data:** 15/09/2025  
**Finalidade:** Projeto de desafio para a vaga de QA Specialist position – Carrefour 

## 1. Estrutura do Projeto

A estrutura do projeto foi organizada de forma modular e clara para facilitar a manutenção, leitura e escalabilidade da automação.

- **docs**: Contém toda a documentação do projeto, incluindo arquivos `.md`, `.pdf`, e materiais de apoio.
- **reports**: Pasta dedicada aos relatórios de execução dos testes (logs em HTML, XML, etc.).
- **Resources/Collection-Serverest**: Contém os arquivos `.resource` com bibliotecas reutilizáveis. Cada arquivo tem responsabilidades específicas, como login, cadastro, delete, busca, etc.
- **Tests/Collection-Serverest**: Contém os arquivos `.robot` com os cenários de testes organizados por funcionalidades da API (ex: login, cadastro de usuário, etc.).
- **venv**: Ambiente virtual Python isolado para o projeto.
- Arquivos de configuração como `requirements.txt`, `.gitignore` e `README.md` estão na raiz do projeto.

## 2. Estratégia de Automação

A automação foi construída utilizando o Robot Framework em conjunto com a RequestsLibrary, focando em testes de API RESTful.

- As palavras-chave reutilizáveis foram agrupadas em arquivos `.resource` separados conforme a funcionalidade da API.
- Cada cenário de teste (`.robot`) foi criado com clareza, contendo nome, tags, descrição e verificação do status code e da mensagem de resposta.
- O projeto utiliza variáveis de ambiente e sessões de requisições com `POST On Session` e `GET On Session` para manter as conexões organizadas.

## 3. Ferramentas Utilizadas

- **Robot Framework**: Framework principal para automação de testes.
- **RequestsLibrary**: Para realizar requisições HTTP na API.
- **Visual Studio Code + RobotCode**: IDE utilizada com extensões específicas para desenvolvimento com Robot Framework.
- **Python + venv**: Gerenciamento do ambiente e dependências.

## 4. Comando para executar a automação

- **Para rodar toda a suíte**: robot --outputdir Reports/logs .\Tests\Collection-Serverest\
- **Para executar por tag**: robot --outputdir -i digite_a_tag Reports/logs .\Tests\Collection-Serverest\
