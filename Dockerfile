# Usa uma imagem base com Python e dependências do Selenium
FROM python:3.9

# Instala dependências do Chrome e WebDriver Manager
RUN apt-get update && apt-get install -y \
    wget unzip curl \
    chromium chromium-driver \
    google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

# Define variáveis para indicar execução dentro do Docker
ENV RUNNING_IN_DOCKER=true

# Define o diretório de trabalho
WORKDIR /app

# Copia apenas o arquivo de dependências primeiro (para otimizar cache)
COPY requirements.txt .

# Instala as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o código do projeto
COPY . .

# Garante que o ChromeDriver correto será instalado
RUN python -c "from webdriver_manager.chrome import ChromeDriverManager; ChromeDriverManager().install()"

# Define o ponto de entrada para execução dos testes
ENTRYPOINT ["robot", "--outputdir", "reports"]

# Permite que o usuário passe parâmetros personalizados ao rodar o container
CMD ["robot", "--outputdir", "reports", "--exitonfailure", "tests/login_test.robot"]