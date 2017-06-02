Drop table campos cascade;

Create table campos( 
	nomeEspaco varchar primary key, 
 	custo integer 
);

insert into campos values('futsal', 10);
insert into campos values('padel', 8);
insert into campos values('tenis', 6);	

Drop table reservas cascade;

Create table reservas( 
 id SERIAL primary key,		
 nome varchar,
 nomeEspaco varchar,
 dataInicio timestamp,
 dataFim timestamp,
 telefone integer,
 custoEstimado decimal,
 numUtilizadores integer,
 foreign key (nomeEspaco) references campos on delete restrict
);
