FROM dordoka/rpi-java8

WORKDIR /data

COPY keycloak-9.0.2.tar.gz keycloak-9.0.2.tar.gz

RUN wget https://downloads.jboss.org/keycloak/9.0.2/keycloak-9.0.2.tar.gz \
      && tar xvfp keycloak-9.0.2.tar.gz \
      && rm keycloak-9.0.2.tar.gz


COPY keycloak-add-user.json /data/keycloak-9.0.2/standalone/configuration/keycloak-add-user.json
COPY standalone.xml /data/keycloak-9.0.2/standalone/configuration/standalone.xml

ENTRYPOINT [ "/data/keycloak-9.0.2/bin/standalone.sh" ]

CMD ["-b", "0.0.0.0"]
EXPOSE 8080 9990