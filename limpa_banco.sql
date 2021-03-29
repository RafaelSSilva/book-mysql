##removendo as constraints
alter table comivenda drop foreign key fk_comivenda_comprodu;
alter table comivenda drop foreign key fk_comivenda_comvenda;

alter table comvenda drop foreign key fk_comvenda_comforne;
alter table comvenda drop foreign key fk_comvenda_comclien;
alter table comvenda drop foreign key fk_comvenda_comvende;

##truncate nas tabelas
truncate table comivenda;
truncate table comvenda;
truncate table comprodu;
truncate table comvende;
truncate table comforne;
truncate table comclien;

##adiciona constraints
alter table comivenda add constraint fk_comivenda_comprodu
	foreign key(n_numeprodu)
		references comprodu(n_numeprodu) 
			on delete no action
            on update no action;

alter table comivenda add constraint fk_comivenda_comvenda
	foreign key(n_numevenda)
		references comvenda(n_numevenda)
			on delete no action
            on update no action;

alter table comvenda add constraint fk_comvenda_comforne
	foreign key(n_numeforne)
		references comforne(n_numeforne)
			on delete no action
            on update no action;

alter table comvenda add constraint fk_comvenda_comclien
	foreign key(n_numeclien)
		references comclien(n_numeclien)
			on delete no action
            on update no action;

alter table comvenda add constraint fk_comvenda_comvende
	foreign key(n_numevende)
		references comvende(n_numevende)
			on delete no action
            on update no action;
            

            
