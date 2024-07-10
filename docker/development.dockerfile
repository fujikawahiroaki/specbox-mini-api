FROM crystallang/crystal:1.12.1

RUN apt-get update && \
    apt-get install -y wget

RUN apt-get update && \
    apt-get install -y postgresql-client tmux && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
ENV DATABASE_URL=postgres://postgres:postgres@host.docker.internal:5432/postgres
EXPOSE 3000
EXPOSE 3001

