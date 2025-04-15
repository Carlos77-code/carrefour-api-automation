
# Test Automation Project Documentation - ServeRest

**Author:** R. Carlos Antonio de Lima Fernandes  
**Date:** 15/04/2025  
**Purpose:** Challenge project for the QA Analyst position  

## 1. Project Structure

The project structure is organized in a modular and clear way to facilitate maintainability, readability, and scalability of the automation.

- **docs**: Contains all project documentation, including `.md`, `.pdf` files, and support materials.
- **reports**: Folder dedicated to test execution reports (HTML, XML logs, etc.).
- **Resources/Collection-Serverest**: Contains `.resource` files with reusable keywords. Each file has a specific responsibility (login, register, delete, search, etc.).
- **Tests/Collection-Serverest**: Contains `.robot` files with test scenarios organized by API functionalities (e.g., login, user registration, etc.).
- **venv**: Isolated Python virtual environment for the project.
- Configuration files like `requirements.txt`, `.gitignore`, and `README.md` are located at the root of the project.

## 2. Automation Strategy

The automation was built using Robot Framework together with RequestsLibrary, focusing on RESTful API testing.

- Reusable keywords were grouped into separate `.resource` files according to API functionality.
- Each test scenario (`.robot`) was created with clarity, including name, tags, description, and validation of status code and response message.
- The project uses environment variables and request sessions via `POST On Session` and `GET On Session` to keep connections organized.

## 3. Tools Used

- **Robot Framework**: Main framework for test automation.
- **RequestsLibrary**: To handle HTTP requests on the API.
- **Visual Studio Code + RobotCode**: IDE used with specific extensions for Robot Framework development.
- **Python + venv**: Environment and dependency management.

## 4. Command to run the automation

- **To run the entire suite**: robot --outputdir reports/logs .\Tests\Collection-Serverest\
- **To execute by tag**: robot --outputdir -i digite_a_tag reports/logs .\Tests\Collection-Serverest\

------------------------------------------------------------------



# Documentação do Projeto de Automação de Testes de API - ServeRest

**Autor:** R. Carlos Antonio de Lima Fernandes  
**Data:** 15/04/2025  
**Finalidade:** Projeto de desafio para a vaga de QA Analyst  

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

- **Para rodar toda a suíte**: robot --outputdir reports/logs .\Tests\Collection-Serverest\
- **Para executar por tag**: robot --outputdir -i digite_a_tag reports/logs .\Tests\Collection-Serverest\
