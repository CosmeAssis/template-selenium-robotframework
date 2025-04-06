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

A variável `ENVIRONMENT` define a URL do ambiente:

```
*** Variables ***
${ENVIRONMENT}     %{ENVIRONMENT}
${URL}             Set Variable If    '${ENVIRONMENT}' == 'dev'    https://dev.magento.softwaretestingboard.com/
...                ELSE IF            '${ENVIRONMENT}' == 'qa'     https://qa.magento.softwaretestingboard.com/
...                ELSE IF            '${ENVIRONMENT}' == 'prod'   https://magento.softwaretestingboard.com/
...                ELSE               https://magento.softwaretestingboard.com/
```

## 📊 Relatórios

Relatórios HTML do Robot e Allure são gerados em:

```
reports/log.html
reports/report.html
reports/allure-report/index.html
```

## 📊 Acesso ao Relatório Allure (sem instalação)

Após baixar o artefato `allure-report.zip` no GitHub Actions:

1. Extraia o `.zip` em sua máquina
2. Abra o arquivo `index.html` com duplo clique
3. O relatório será exibido no navegador, sem necessidade de instalação

## 📦 Integração Contínua (CI)

A pipeline GitHub Actions executa os testes na branch `master` e gera os relatórios automaticamente como artefatos.

## 🧱 Padrão de Projeto

Segue o padrão **Page Object Model (POM)**:

- `pages/`: páginas
- `keywords/`: ações
- `locators/`: elementos
- `tests/`: testes

## 📷 Prints em Falhas

Prints automáticos são capturados em falhas e embutidos no log do Robot.