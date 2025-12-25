FROM alpine:latest

ARG PB_VERSION=0.23.6

RUN apk add --no-cache \
    ca-certificates \
    unzip \
    wget \
    zip

# Download and install PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/ && \
    chmod +x /pb/pocketbase && \
    rm /tmp/pb.zip

# Create data directory
RUN mkdir -p /pb/pb_data /pb/pb_public

WORKDIR /pb

# Expose port
EXPOSE 8080

# Start PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]