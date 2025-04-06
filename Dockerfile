FROM python:3.9

ENV DEBIAN_FRONTEND=noninteractive

# Instala dependências e Google Chrome
RUN apt-get update && apt-get install -y \
    wget curl unzip gnupg ca-certificates fonts-liberation \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# Instala Chrome manualmente
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python -c "from webdriver_manager.chrome import ChromeDriverManager; ChromeDriverManager().install()"

# Define variável de ambiente default
ENV ENVIRONMENT=prod

ENTRYPOINT ["robot", "--outputdir", "reports"]

CMD ["tests"]
