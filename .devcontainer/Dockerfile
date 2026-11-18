FROM mcr.microsoft.com/devcontainers/python:1-3.11-bookworm

# Eliminar el repositorio de Yarn y su clave GPG caducada para evitar el error de apt-get
RUN rm -f /etc/apt/sources.list.d/yarn.list && \
    rm -f /etc/apt/trusted.gpg.d/yarn.gpg

# Instalar git. Usamos '|| true' para que, si apt-get update falla por una advertencia
# no crítica (como la de Yarn), el proceso de construcción no se detenga.
RUN apt-get update || true && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install --no-install-recommends git

# Copiar e instalar los requisitos de Python
COPY requirements.txt /tmp/pip-tmp/
RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
    && rm -rf /tmp/pip-tmp