# Base image is Debian Bookworm.
FROM debian:bookworm

# Install dependencies.
RUN apt update && apt install -y \
    git \
    curl

# Install Foundry tools.
RUN curl -L https://foundry.paradigm.xyz | bash && /root/.foundry/bin/foundryup
