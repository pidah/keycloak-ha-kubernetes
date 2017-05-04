FROM jboss/keycloak-mysql:2.5.5.Final@sha256:d26f2134edbb16313a0fe39f8ed18d6815d37ce04117bd381cb737f94bce56f9

CMD ["-b", "0.0.0.0", "--server-config", "standalone-ha.xml"]

RUN rm keycloak/standalone/configuration/standalone.xml

ADD xsl-transform.sh /usr/local/bin/xsl-transform

ADD *.xsl /tmp/

RUN xsl-transform /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml /tmp/jgroups-jdbc.xsl \
  && xsl-transform /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml /tmp/node-identifier.xsl

RUN sed -i 's/8443/443/g' /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml \
  && sed -i 's/http-listener name="default"/http-listener name="default" proxy-address-forwarding="true"/g' /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml
