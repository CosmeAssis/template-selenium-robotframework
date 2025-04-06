# 🤖 Template Selenium RobotFramework

Este projeto automatiza o **login** e a **pesquisa de produtos** no site [Magento Software Testing Board](https://magento.softwaretestingboard.com/) utilizando **Robot Framework** com **Selenium**.

## 📁 Estrutura do Projeto

```
template-selenium-robotframework/
│── tests/
│   ├── login_test.robot
│   ├── search_product_test.robot
│── pages/
│   ├── login_page.robot
│   ├── search_page.robot
│── keywords/
│   ├── login_keywords.robot
│   ├── search_keywords.robot
│── locators/
│   ├── login_locators.robot
│   ├── search_locators.robot
│── resources/
│   ├── global_variables.robot
│── config/
│   ├── browser_setup.robot
│── reports/
│── .github/workflows/
│   ├── ci.yml
│── Dockerfile
│── requirements.txt
│── README.md
```

## 🚀 Tecnologias Utilizadas
* Robot Framework
* SeleniumLibrary
* WebDriver Manager
* Docker
* GitHub Actions

## 📌 Pré-requisitos
* Python 3.9+
* pip
* Docker (opcional para execução containerizada)

## ⚙️ Configuração do Ambiente

### 1️⃣ Instalar Dependências
```
pip install -r requirements.txt
```

### 2️⃣ Executar Testes Localmente
```
robot --outputdir reports tests
```

### 3️⃣ Executar Testes com Variável de Ambiente
```
ENVIRONMENT=qa robot --outputdir reports tests
```

### 4️⃣ Executar Testes com Docker
```
docker build -t robotframework-tests .
docker run --rm -e ENVIRONMENT=qa -v $(pwd)/reports:/app/reports robotframework-tests
```

## 🌐 Configuração do Ambiente por Variável
O sistema utiliza a variável de ambiente `ENVIRONMENT` para definir a URL do ambiente desejado. Os valores possíveis estão definidos no arquivo `resources/global_variables.robot`:

```
*** Variables ***
${ENVIRONMENT}     %{ENVIRONMENT}
${URL}             Set Variable If    '${ENVIRONMENT}' == 'dev'    https://dev.magento.softwaretestingboard.com/
...                ELSE IF            '${ENVIRONMENT}' == 'qa'     https://qa.magento.softwaretestingboard.com/
...                ELSE IF            '${ENVIRONMENT}' == 'prod'   https://magento.softwaretestingboard.com/
...                ELSE               https://magento.softwaretestingboard.com/
```

## 🧪 Relatórios de Testes
Os relatórios HTML padrão do Robot Framework são gerados na pasta `reports/`. Para visualizar:
```
open reports/log.html
```

## 📦 Integração Contínua (CI)
O projeto está configurado com GitHub Actions. Ao realizar um push na branch `master`, os testes são executados automaticamente, e os relatórios são salvos como artefatos.

## 🧱 Padrão de Projeto
O projeto segue o padrão **Page Object Model (POM)**, com a seguinte separação:
* `pages/` – Representações das páginas
* `keywords/` – Ações reutilizáveis
* `locators/` – Mapeamento de elementos
* `tests/` – Casos de teste

## 📷 Captura de Tela em Falhas
O projeto captura screenshots automaticamente em caso de falhas, visíveis no `log.html`.