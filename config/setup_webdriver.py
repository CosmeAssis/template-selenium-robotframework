from robot.api.deco import keyword
import os
import subprocess
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

driver_instance = None  

def get_installed_chrome_version():
    try:
        if os.name == "nt":  
            output = subprocess.check_output(
                r'wmic datafile where name="C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe" get Version /value',
                shell=True
            )
            return output.decode("utf-8").strip().split("=")[-1]
        elif os.name == "posix":  
            output = subprocess.check_output(["google-chrome", "--version"])
            return output.decode("utf-8").strip().split(" ")[-1]
    except Exception as e:
        print(f"❌ Erro ao obter a versão do Chrome instalada: {e}")
        return None

@keyword(name="Iniciar Driver")
def iniciar_driver():
    global driver_instance

    if driver_instance is None:
        options = webdriver.ChromeOptions()
        options.add_argument("--start-maximized")
        options.add_argument("--disable-notifications")
        options.add_argument("--disable-gpu")
        options.add_argument("--no-sandbox")
        options.add_argument("--disable-dev-shm-usage")

        try:
            chrome_version = get_installed_chrome_version()
            if not chrome_version:
                raise ValueError("❌ Não foi possível determinar a versão do Chrome instalada.")

            print(f"✅ Versão do Chrome detectada: {chrome_version}")

            driver_path = ChromeDriverManager().install()
            service = Service(driver_path)
            driver_instance = webdriver.Chrome(service=service, options=options)

        except Exception as e:
            print(f"❌ Erro ao iniciar o WebDriver: {e}")
            raise

    return driver_instance

@keyword(name="Fechar Driver")
def fechar_driver():
    global driver_instance
    if driver_instance:
        driver_instance.quit()
        driver_instance = None
