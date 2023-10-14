FROM pihole/pihole:development-v6
RUN apk add unbound 
RUN wget https://www.internic.net/domain/named.root -qO- | tee /var/lib/unbound/root.hints 
COPY pi-hole.conf /etc/unbound/unbound.conf.d/pi-hole.conf 
RUN mkdir -p /etc/services.d/unbound
COPY unbound-run /etc/services.d/unbound/run

ENTRYPOINT ./s6-init
