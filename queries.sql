select count(*) as total_servicos
from servico;

select dataAbertura, equipamento, prioridade
from ordemServico
where estado = 'Aberta'
order by dataAbertura asc;

select
oss.idOrdem,
s.descricao,
oss.quantidade,
oss.valorUnitario,
(oss.quantidade * oss.valorUnitario) as subtotal
from OrdemServico_Servico oss
inner join servico s
	on oss.idServico = s.idServico
order by oss.idOrdem asc;

select
	idOrdem,
    sum(quantidade * valorUnitario) as valor_total
    from OrdemServico_servico
    group by idOrdem
    order by valor_total desc;
