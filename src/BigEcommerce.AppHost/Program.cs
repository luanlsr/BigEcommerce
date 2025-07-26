var builder = DistributedApplication.CreateBuilder(args);

// Serviços
builder.AddProject<Projects.IdentityService_API>("identity-service");
builder.AddProject<Projects.ProdutoService_API>("produto-service");
builder.AddProject<Projects.PedidoService_API>("pedido-service");
builder.AddProject<Projects.EstoqueService_API>("estoque-service");
builder.AddProject<Projects.PagamentoService_API>("pagamento-service");
builder.AddProject<Projects.NotificacaoService_API>("notificacao-service");

// Observabilidade
builder.AddProject<Projects.ObservabilidadeService_Logs>("observabilidade-logs");
builder.AddProject<Projects.ObservabilidadeService_Metrics>("observabilidade-metrics");
builder.AddProject<Projects.ObservabilidadeService_Tracing>("observabilidade-tracing");

// Frontend
builder.AddProject<Projects.BigEcommerce_App>("bigecommerce-app");

// Gateway
builder.AddProject<Projects.YARP>("gateway-yarp");

builder.Build().Run();
