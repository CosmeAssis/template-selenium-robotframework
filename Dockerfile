    FROM python:3.9-slim
    
    WORKDIR /app
    
    RUN apt-get update && apt-get install -y \
        wget curl unzip xvfb libxi6 libgconf-2-4 \
        default-jre \
        chromium chromium-driver && \
        rm -rf /var/lib/apt/lists/*
    
    COPY requirements.txt .
    RUN pip install --no-cache-dir -r requirements.txt
    
    COPY . .
    
    RUN wget https://github.com/allure-framework/allure2/releases/download/2.24.1/allure-2.24.1.tgz && \
        tar -zxvf allure-2.24.1.tgz && \
        mv allure-2.24.1 /opt/allure && \
        ln -s /opt/allure/bin/allure /usr/bin/allure
    
    CMD robot --listener allure_robotframework;allure-results --outputdir allure-results tests && \
        allure generate allure-results -o reports/allure-report --clean
    