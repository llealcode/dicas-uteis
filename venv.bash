# 1. Criar o ambiente
python -m venv venv

# 2. Ativar o ambiente
# Windows:
venv\Scripts\activate
# Linux/macOS:
source venv/bin/activate

# 3. Instalar os pacotes do projeto
pip install pandas

# 4. (Opcional) Gerar o requirements.txt
pip freeze > requirements.txt

# 5. Desativar quando terminar
deactivate
