# 🤖 Template Selenium RobotFramework

Este projeto automatiza o **login** e a **pesquisa de produtos** no site [Magento Software Testing Board](https://magento.softwaretestingboard.com/) utilizando **Robot Framework** com **Selenium**.

## 📁 Estrutura do Projeto

```
template-selenium-robotframework/
├── tests/
│   ├── login_test.robot
│   ├── search_product_test.robot
├── pages/
│   ├── login_page.robot
│   ├── search_page.robot
├── keywords/
│   ├── login_keywords.robot
│   ├── search_keywords.robot
├── locators/
│   ├── login_locators.robot
│   ├── search_locators.robot
├── resources/
│   ├── global_variables.robot
├── config/
│   ├── browser_setup.robot
├── reports/
├── allure-results/
├── .github/workflows/
│   ├── ci.yml
├── Dockerfile
├── requirements.txt
├── README.md
```

## 🚀 Tecnologias Utilizadas

- Robot Framework
- SeleniumLibrary
- WebDriver Manager
- Allure Report
- Docker
- GitHub Actions

## 📌 Pré-requisitos

- Python 3.9+
- pip
- Docker (para execução containerizada)
- Allure CLI (para visualizar relatórios localmente)

## ⚙️ Configuração do Ambiente

### 1️⃣ Instalar Dependências
```
pip install -r requirements.txt
```

### 2️⃣ Executar Testes Localmente com Allure
```
ENVIRONMENT=qa robot --listener "allure_robotframework;allure-results" --outputdir allure-results tests
allure generate allure-results -o reports/allure-report --clean
allure open reports/allure-report
```

### 3️⃣ Executar com Docker
```
docker build -t robotframework-tests .
docker run --rm -e ENVIRONMENT=qa -v $(pwd)/reports:/app/reports -v $(pwd)/allure-results:/app/allure-results robotframework-tests
```

## 🌐 Configuração por Ambiente

A variável de ambiente `ENVIRONMENT` define a URL conforme o ambiente:

```
*** Variables ***
${ENVIRONMENT}     %{ENVIRONMENT}
${URL}             Set Variable If    '${ENVIRONMENT}' == 'dev'    https://dev.magento.softwaretestingboard.com/
...                ELSE IF            '${ENVIRONMENT}' == 'qa'     https://qa.magento.softwaretestingboard.com/
...                ELSE IF            '${ENVIRONMENT}' == 'prod'   https://magento.softwaretestingboard.com/
...                ELSE               https://magento.softwaretestingboard.com/
```

## 📊 Relatórios

- `reports/log.html` — Log do Robot
- `reports/report.html` — Relatório padrão do Robot
- `reports/allure-report/index.html` — Relatório Allure com nome personalizado

### 📊 Acesso ao Relatório Allure (sem instalação)
1. Acesse a aba **Actions** no repositório do GitHub
2. Baixe o artefato `allure-report.zip` gerado
3. Extraia o .zip em sua máquina
4. Abra o arquivo `index.html` no navegador

## 🚀 Publicação Automática no GitHub Pages

O relatório Allure é publicado automaticamente na branch `gh-pages` após o CI. Acesse via:

[🔗 https://cosmeassis.github.io/template-selenium-robotframework/](https://cosmeassis.github.io/template-selenium-robotframework/)

## 📦 Integração Contínua (CI)

A pipeline GitHub Actions:
- Executa os testes nas branches `master` e pull requests
- Define variáveis como `ENVIRONMENT=qa` e `Browser=Chrome`
- Gera relatórios Allure com histórico (`trend`)
- Publica o relatório Allure no GitHub Pages (`gh-pages`)

## 🧱 Padrão de Projeto

O projeto segue o padrão **Page Object Model (POM)**:
- `pages/`: páginas
- `keywords/`: ações
- `locators/`: elementos
- `tests/`: arquivos de teste

## 📷 Prints em Falhas

Capturas de tela são tiradas automaticamente em falhas e anexadas ao relatório Robot e Allure.