FROM teddysun/xray:latest

# Pinapagana ang aggressive memory management para sa 50GB+ I/O
ENV GODEBUG=madvdontneed=1
# Ginagamit ang lahat ng cores (4 vCPU) ng Cloud Run
ENV GOMAXPROCS=4

# Taasan ang file limit para sa libo-libong packets
RUN ulimit -n 65535

COPY config.json /etc/xray/config.json
ENV PORT=8080

# Direct execution para sa zero latency
CMD ["/usr/bin/xray", "-config", "/etc/xray/config.json"]

