####
# This Dockerfile is used in order to build a container that runs an Open Telemetry Collector which is configured to just send a few metrics
# an Open Telemetry endpoint.
###
FROM registry.redhat.io/ubi9/ubi-minimal:9.4-1227
WORKDIR /work/

# Install Open Telemetry collector
RUN microdnf -y install wget
RUN wget https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.108.0/otelcol-contrib_0.108.0_linux_arm64.rpm
RUN rpm -ivh otelcol-contrib_0.108.0_linux_arm64.rpm

# Copy Open Telemetry Config
COPY otel-config.yaml /etc/otelcol/config.yaml

USER 1001

CMD ["otelcol-contrib", "--config", "/etc/otelcol/config.yaml"]
