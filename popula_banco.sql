##Popula registros na tabela de clientes
insert into comclien (n_numeclien, c_codiclien, c_nomeclien, c_razaclien, d_dataclien, c_cnpjclien, c_foneclien, c_cidaclien, c_estaclien)
	values(1, '0001', 'Inuyasha', 'Inuyasha LTDA', curdate(), '111.111.092-10', '(11) 96574-0989', 'São Paulo', 'SP');

insert into comclien
	values(2, '0002', 'Kikyo', 'Kikyo LTDA', curdate(), '100.111.092-10', '(11) 96074-0989', 'São Paulo', 'SP');

insert into comclien
	values(3, '0003', 'Kagome Higurashi', 'Kagome LTDA', curdate(), '111.000.092-10', '(11) 98574-0989', 'São Paulo', 'SP');

insert into comclien
	values(4, '0004', 'Shippo', 'Shippo LTDA', curdate(), '111.070.089-10', '(11) 98574-0989', 'São Paulo', 'SP');
    
insert into comclien
    values(5, '0005', 'Miroku', 'Miroku LTDA', curdate(), '111.020.089-10', '(11) 98474-0989', 'São Paulo', 'SP');

##Popula registros na tabela de fornecedores
insert into comforne (n_numeforne, c_codiforne, c_nomeforne, c_razaforne, c_foneforne)
	values(1, '0001', 'Sesshomaru', 'Sesshomaru LTDA', '(11) 98786-0989');

insert into comforne
	values(2, '0002', 'Naraku', 'Naraku LTDA', '(11) 96575-1022');

##Popula registros na tabela vendedores
insert into comvende (n_numevende, c_codivende, c_nomevende, c_razavende, c_fonevende, n_porcvende)    
	values(1, '0001', 'Kirara', 'Kirara LTDA', '(11) 99232-4398', 12);

insert into comvende
	values(2, '0002', 'Sango', 'Sango LTDA', '(11) 99156-8987', 25);
    
##Popula registros na tabela produtos
insert into comprodu(n_numeprodu, c_codiprodu, c_descprodu, n_valoprodu, c_situprodu, n_numeforne)
	values(1, '0001', 'Jóia de 4 almas', 100000, 'A', 2);

insert into comprodu
	values(2, '0002', 'Tenseiga', 90000, 'A', 1);    
    
insert into comprodu 
	values(3, '0003', 'Tessaiga', 90000, 'A', 1);
    
##Popula tabela vendas
insert into comvenda(n_numevenda, c_codivenda, n_valovenda, n_descvenda, n_totavenda, d_datavenda, n_numeclien, n_numeforne, n_numevende)
	values(1, '1', 100000, 0, 100000, curdate(), 1,  1, 1);

insert into comvenda
	values(2, '2', 90000, 0, 90000, curdate(), 2, 1, 2);

insert into comvenda
	values(3, '3', 180000, 0 , 180000, curdate(), 2, 1, 2);

##popula tabela de item por venda
insert into comivenda(n_numeivenda, n_valoivenda, n_qtdeivenda, n_descivenda, n_numevenda, n_numeprodu)
	values(1, 100000, 1, 0, 1, 1);

insert into comivenda
	values(2, 90000, 1, 0, 2, 2);

insert into comivenda
	values(3, 9000, 1, 0, 3, 3);

insert into comivenda
	values(4, 9000, 1, 0, 3, 2);








































    
    
    
    
    
    
    
    
    
    
    

describe comforne;
 