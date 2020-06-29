FROM alpine as getter

RUN wget https://downloads.jboss.org/keycloak/10.0.2/keycloak-10.0.2.tar.gz \
      && tar xvfp keycloak-10.0.2.tar.gz \
      && rm keycloak-10.0.2.tar.gz



FROM arm64v8/openjdk:15
WORKDIR /data

COPY --from=getter keycloak-10.0.2 keycloak

COPY keycloak-add-user.json /data/keycloak/standalone/configuration/keycloak-add-user.json
COPY standalone.xml /data/keycloak/standalone/configuration/standalone.xml

ENTRYPOINT [ "/data/keycloak/bin/standalone.sh" ]

CMD ["-b", "0.0.0.0"]
EXPOSE 8080 9990