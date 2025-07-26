var builder = DistributedApplication.CreateBuilder(args);
builder.AddProject<Projects.IdentityService_API>("identity-service");
builder.AddProject<Projects.ProdutoService_API>("produto-service");
// Adicione os demais serviços conforme cria

builder.AddProject<Projects.EstoqueService_API>("estoqueservice-api");
// Adicione os demais serviços conforme cria

builder.AddProject<Projects.PedidoService_API>("pedidoservice-api");
// Adicione os demais serviços conforme cria

builder.AddProject<Projects.PagamentoService_API>("pagamentoservice-api");
// Adicione os demais serviços conforme cria

builder.AddProject<Projects.NotificacaoService_API>("notificacaoservice-api");
// Adicione os demais serviços conforme cria

builder.AddProject<Projects.BigEcommerce_BlazorApp>("bigecommerce-blazorapp");
// Adicione os demais serviços conforme cria

builder.AddProject<Projects.Gateway_YARP>("gateway-yarp");
// Adicione os demais serviços conforme cria

builder.Build().Run();
