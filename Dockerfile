FROM python:3.8-slim

# Çalışma dizinini ayarla
WORKDIR /app

# Bağımlılıkları yükle
COPY requirements.txt /app/
RUN pip install -r requirements.txt

# Uygulama dosyalarını kopyala
COPY . /app

# Uygulamayı çalıştır
CMD ["python", "app.py"]
