FROM ruby:3.2-slim

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    curl \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

# Clonar BeEF
WORKDIR /opt
RUN git clone https://github.com/beefproject/beef.git

# Configurar BeEF
WORKDIR /opt/beef
RUN bundle install

# Exponer puertos
EXPOSE 8888 6789 61985 61986

# Comando de inicio
CMD ["./beef"]
