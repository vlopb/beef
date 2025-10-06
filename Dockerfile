FROM ruby:3.2-slim

# Instalar TODAS las dependencias necesarias
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    curl \
    libcurl4-openssl-dev \
    libsqlite3-dev \
    libyaml-dev \
    && rm -rf /var/lib/apt/lists/*

# Clonar BeEF
WORKDIR /opt
RUN git clone https://github.com/beefproject/beef.git

# Configurar BeEF
WORKDIR /opt/beef
RUN bundle install

# Exponer puerto interno (BeEF usa 3000 por defecto)
EXPOSE 3000 6789 61985 61986

# Comando de inicio
CMD ["./beef"]
