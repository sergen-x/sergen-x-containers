FROM registry.access.redhat.com/ubi9-minimal:9.4-949

RUN microdnf install -y gzip tar
 
COPY scripts/install-agent.sh /usr/local/bin/

RUN /usr/local/bin/install-agent.sh

ENTRYPOINT ["./sergen_x_agent"]


