FROM mysql:8.0.32

EXPOSE 3306

COPY scripts/init.sql /docker-entrypoint-initdb.d/

CMD ["mysqld"]