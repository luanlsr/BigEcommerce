terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Rede customizada para isolar containers
resource "docker_network" "big_ecommerce_network" {
  name = "big_ecommerce_network"
}

# SQL Server container
resource "docker_container" "sqlserver" {
  name  = "sqlserver"
  image = "mcr.microsoft.com/mssql/server:2022-latest"
  networks_advanced {
    name = docker_network.big_ecommerce_network.name
  }
  env = [
    "ACCEPT_EULA=Y",
    "SA_PASSWORD=YourStrong!Passw0rd"
  ]
  ports {
    internal = 1433
    external = 1433
  }
  restart = "unless-stopped"
}

# MongoDB container
resource "docker_container" "mongodb" {
  name  = "mongodb"
  image = "mongo:6.0"
  networks_advanced {
    name = docker_network.big_ecommerce_network.name
  }
  ports {
    internal = 27017
    external = 27017
  }
  restart = "unless-stopped"
}

# Redis container
resource "docker_container" "redis" {
  name  = "redis"
  image = "redis:7"
  networks_advanced {
    name = docker_network.big_ecommerce_network.name
  }
  ports {
    internal = 6379
    external = 6379
  }
  restart = "unless-stopped"
}

# Kafka + Zookeeper (via wurstmeister image)
resource "docker_container" "zookeeper" {
  name  = "zookeeper"
  image = "bitnami/zookeeper:latest"
  networks_advanced {
    name = docker_network.big_ecommerce_network.name
  }
  env = [
    "ALLOW_ANONYMOUS_LOGIN=yes"
  ]
  ports {
    internal = 2181
    external = 2181
  }
  restart = "unless-stopped"
}

resource "docker_container" "kafka" {
  name  = "kafka"
  image = "bitnami/kafka:latest"
  networks_advanced {
    name = docker_network.big_ecommerce_network.name
  }
  env = [
    "KAFKA_BROKER_ID=1",
    "KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181",
    "ALLOW_PLAINTEXT_LISTENER=yes",
    "KAFKA_LISTENERS=PLAINTEXT://:9092",
    "KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092"
  ]
  ports {
    internal = 9092
    external = 9092
  }
  restart = "unless-stopped"
  depends_on = [docker_container.zookeeper]
}

# RabbitMQ container
resource "docker_container" "rabbitmq" {
  name  = "rabbitmq"
  image = "rabbitmq:3-management"
  networks_advanced {
    name = docker_network.big_ecommerce_network.name
  }
  ports {
    internal = 5672
    external = 5672
  }
  ports {
    internal = 15672
    external = 15672
  }
  restart = "unless-stopped"
}

# LocalStack container
resource "docker_container" "localstack" {
  name  = "localstack"
  image = "localstack/localstack"
  networks_advanced {
    name = docker_network.big_ecommerce_network.name
  }
  env = [
    "SERVICES=s3,sqs,sns,dynamodb",
    "DEBUG=1"
  ]
  ports {
    internal = 4566
    external = 4566
  }
  restart = "unless-stopped"
}

# Prometheus container
resource "docker_container" "prometheus" {
  name  = "prometheus"
  image = "prom/prometheus"
  networks_advanced {
    name = docker_network.big_ecommerce_network.name
  }
  ports {
    internal = 9090
    external = 9090
  }
  restart = "unless-stopped"
  volumes {
    host_path      = "${path.module}/prometheus.yml"
    container_path = "/etc/prometheus/prometheus.yml"
  }
}

# Grafana container
resource "docker_container" "grafana" {
  name  = "grafana"
  image = "grafana/grafana"
  networks_advanced {
    name = docker_network.big_ecommerce_network.name
  }
  ports {
    internal = 3000
    external = 3000
  }
  restart = "unless-stopped"
}

# Elasticsearch container
resource "docker_container" "elasticsearch" {
  name  = "elasticsearch"
  image = "docker.elastic.co/elasticsearch/elasticsearch:8.9.2"
  networks_advanced {
    name = docker_network.big_ecommerce_network.name
  }
  env = [
    "discovery.type=single-node",
    "ES_JAVA_OPTS=-Xms512m -Xmx512m"
  ]
  ports {
    internal = 9200
    external = 9200
  }
  ports {
    internal = 9300
    external = 9300
  }
  restart = "unless-stopped"
}

# Kibana container
resource "docker_container" "kibana" {
  name  = "kibana"
  image = "docker.elastic.co/kibana/kibana:8.9.2"
  networks_advanced {
    name = docker_network.big_ecommerce_network.name
  }
  ports {
    internal = 5601
    external = 5601
  }
  restart = "unless-stopped"
  depends_on = [docker_container.elasticsearch]
}
