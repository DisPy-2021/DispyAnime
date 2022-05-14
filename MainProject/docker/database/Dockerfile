FROM mysql:latest

EXPOSE 3306

ENV MYSQL_ROOT_PASSWORD password

ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR.UTF-8
ENV LC_ALL pt_BR.UTF-8

COPY animeHubMock.sql /docker-entrypoint-initdb.d/script.sql
RUN chmod -R 775 /docker-entrypoint-initdb.d