# 🛒 BigEcommerce

E-commerce modular, escalável e observável, desenvolvido com **.NET Aspire**, arquitetura moderna (**DDD + Clean + Hexagonal**), microsserviços, mensageria, gRPC e uma infraestrutura completa baseada em Docker, Terraform e ferramentas de observabilidade.

---

## 🔥 Visão Geral

O **BigEcommerce** é um sistema completo para e-commerce com foco em:

- ✅ Alta performance e escalabilidade  
- 🔍 Observabilidade (logs, métricas e tracing)  
- 🧱 Modularidade via microsserviços  
- 📦 Comunicação assíncrona com mensageria  
- 🧑‍💻 Experiência moderna para desenvolvedores e usuários  

---

## 🧱 Arquitetura

- ⚙️ **.NET Aspire** para orquestração e hosting local  
- 🧩 **Microsserviços** organizados por domínio  
- 🧼 **DDD + Clean Architecture + Hexagonal**  
- 🔄 **API Gateway com YARP**  
- 📬 **Mensageria com Kafka ou RabbitMQ**  
- 📡 **SignalR** para atualizações em tempo real  
- 🔎 **OpenTelemetry + Elastic Stack + Seq**  
- ⚡ **Dapper** para acesso performático a dados  
- 🛰️ **gRPC** entre serviços para baixo acoplamento  
- 🧪 Testes com `xUnit`, `Bogus`, `FluentAssertions`

---

## 📁 Estrutura de Pastas

```text
/
├── src/
│   ├── Services/
│   │   ├── IdentityService/
│   │   │   ├── API/
│   │   │   ├── Application/
│   │   │   ├── Domain/
│   │   │   ├── Infrastructure/
│   │   │   └── gRPC/
│   │   └── ... (outros serviços no mesmo formato)
│   ├── Gateway/
│   │   └── YARP/
│   ├── Shared/
│   │   ├── Contracts/
│   │   ├── Protos/
│   │   └── Utils/
│   └── Frontend/
│       ├── BlazorApp/
│       └── MauiHybrid/
│
├── tests/
│   ├── Unit/
│   │   ├── ProdutoService.Tests/
│   └── Integration/
│       ├── ProdutoService.IntegrationTests/
│
├── infrastructure/
│   ├── docker/
│   │   ├── Dockerfile
│   │   └── docker-compose.yml
│   └── terraform/
│       ├── main.tf
│       └── variables.tf
│
├── .github/
│   └── workflows/
│       └── ci.yml
│
└── docs/
```

---

## 🔁 Comunicação entre Serviços

| Protocolo | Uso principal                      |
|-----------|------------------------------------|
| gRPC      | Comunicação entre microsserviços   |
| Kafka     | Eventos de domínio                 |
| SignalR   | Atualizações em tempo real         |

---

## 📊 Observabilidade

| Camada     | Ferramenta                         |
|------------|------------------------------------|
| Logs       | Elastic Stack (ELK), Seq           |
| Métricas   | Prometheus + Grafana               |
| Tracing    | OpenTelemetry + Jaeger             |

---

## ✅ Testes

- `xUnit` para testes unitários
- `FluentAssertions` para asserções fluentes
- `Bogus` para geração de dados fake
- Testes de integração com infraestrutura em Docker

---

## 🔐 Segurança

- JWT com validação no Gateway
- Autorização baseada em Roles
- Proteção contra CSRF/XSS (Blazor)
- FluentValidation para validação de entrada

---

## 🚀 Executando o Projeto

### Pré-requisitos

- [.NET 8 SDK](https://dotnet.microsoft.com/en-us/download)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- Visual Studio 2022+ com workloads de ASP.NET, gRPC e Blazor

### Executar com Aspire

```bash
dotnet run --project src/BigEcommerce.AppHost
```

### Executar com Docker Compose

```bash
cd infrastructure/docker
docker-compose up --build
```

---

## 🧪 Serviços Principais

| Serviço                 | Função                               |
|-------------------------|--------------------------------------|
| IdentityService         | Autenticação e autorização           |
| ProdutoService          | Catálogo e estoque                   |
| PedidoService           | Gestão de pedidos                    |
| PagamentoService        | Processamento de pagamentos          |
| OfertaRelampagoService | Promoções temporárias                |
| NotificacaoService      | E-mail, SMS, push                    |
| ObservabilidadeService  | Logs, métricas e tracing             |

---

## 📌 Roadmap

- [x] Estrutura base e DDD
- [x] Gateway com YARP
- [x] Serviço de autenticação
- [ ] Integração entre serviços via gRPC
- [ ] Implementação de SignalR para pedidos
- [ ] Observabilidade com OpenTelemetry
- [ ] CI/CD com GitHub Actions
- [ ] Deploy em nuvem (Azure/AWS)

---

## 📄 Licença

Este projeto é distribuído sob a licença **MIT**.

---

## 🤝 Contribuições

Contribuições são bem-vindas! Siga o padrão de branches e PRs:

```bash
feature/nome-da-feature
fix/ajuste-nome
```

---

> Criado com ❤️ por Luan e comunidade.
