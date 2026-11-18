FROM mcr.microsoft.com/devcontainers/python:1-3.11-bookworm

# Remove the problematic Yarn apt source and its expired GPG key
# to prevent apt-get update from failing during the build.
RUN rm -f /etc/apt/sources.list.d/yarn.list && \
    rm -f /etc/apt/trusted.gpg.d/yarn.gpg

# Install system dependencies (git).
# '|| true' ensures the build doesn't stop if apt-get update returns a non-critical warning.
RUN apt-get update || true && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install --no-install-recommends git

# Copy Python requirements and install them
COPY requirements.txt /tmp/pip-tmp/
RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
    && rm -rf /tmp/pip-tmp