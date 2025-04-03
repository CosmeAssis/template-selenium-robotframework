# Template Selenium RobotFramework

Este projeto tem como objetivo automatizar o login no site [Magento Software Testing Board](https://magento.softwaretestingboard.com/) utilizando Robot Framework com Selenium.

## 📂 Estrutura do Projeto

```
template-selenium-robotframework/
│── tests/
│   ├── login_test.robot
│── pages/
│   ├── login_page.robot
│── keywords/
│   ├── login_keywords.robot
│── locators/
│   ├── login_locators.robot
│── resources/
│   ├── global_variables.robot
│── config/
│   ├── browser_setup.robot
│── reports/  (adicionado ao .gitignore)
│── .github/workflows/
│   ├── ci.yml
│── Dockerfile
│── requirements.txt
│── .gitignore
│── README.md
```

## 🚀 Tecnologias Utilizadas

- **Robot Framework**
- **SeleniumLibrary**
- **Webdriver Manager**
- **Docker**
- **GitHub Actions**

## 📌 Pré-requisitos

- Python 3.9+
- Pip
- Docker (opcional para execução via container)

## 🛠️ Configuração do Ambiente

### 1️⃣ Instalar Dependências

```sh
pip install -r requirements.txt
```

### 2️⃣ Executar os Testes Localmente

```sh
rebot --loglevel DEBUG --outputdir reports --reporttitle "Relatório Personalizado" output.xml
```

### 3️⃣ Executar os Testes com Docker

```sh
docker build -t robotframework-tests .
docker run --rm -v $(pwd)/reports:/app/reports robotframework-tests
```

## 🔧 Configuração do Navegador

O projeto permite a execução dos testes em diferentes navegadores e no modo headless ou não. Para isso, edite o arquivo `resources/global_variables.robot` e altere a variável `${BROWSER}`:

- **Modo Headless Chrome:** `headlesschrome`
- **Modo Normal Chrome:** `chrome`
- **Firefox:** `firefox`
- **Modo Headless Firefox:** `headlessfirefox`

Exemplo:
```robot
*** Variables ***
${URL}               https://magento.softwaretestingboard.com/
${BROWSER}           headlesschrome
${LOGIN}             user@example.com
${PASSWORD}          mypassword
```

Para rodar os testes com um navegador diferente sem modificar o arquivo, execute o comando:
```sh
robot --variable BROWSER:firefox --outputdir reports tests/login_test.robot
```

## 📊 Relatórios de Teste

Os relatórios serão gerados na pasta **reports/**. Para visualizá-los, abra o arquivo **log.html** no navegador.

## 📦 Integração Contínua (GitHub Actions)

O projeto está configurado para rodar os testes automaticamente ao fazer push na branch `main`. O relatório será anexado como artefato no GitHub Actions.

## 📜 Estrutura dos Testes

O projeto segue o padrão **Page Object Model (POM)** com separação em:

- **pages/** → Páginas da aplicação
- **keywords/** → Palavras-chave reutilizáveis
- **locators/** → Mapeamento de elementos
- **tests/** → Casos de teste

## 📄 Licença

Este projeto é open-source e pode ser utilizado livremente.

---