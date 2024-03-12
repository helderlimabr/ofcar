USE `ofcar`;
insert into parameters (description, data) values ('Permissão Listar', 'list');
insert into parameters (description, data) values ('Permissão Leitura', 'read');
insert into parameters (description, data) values ('Permissão Criar', 'create');
insert into parameters (description, data) values ('Permissão Atualizar', 'update');
insert into parameters (description, data) values ('Permissão Deletar', 'delete');
insert into permission (table_model, permission) values ('sales_order', 'list');
insert into permission (table_model, permission) values ('sales_order', 'read');
insert into permission (table_model, permission) values ('sales_order', 'create');
insert into permission (table_model, permission) values ('sales_order', 'update');
insert into permission (table_model, permission) values ('sales_order', 'delete');
insert into permission (table_model, permission) values ('product', 'list');
insert into permission (table_model, permission) values ('product', 'read');
insert into permission (table_model, permission) values ('product', 'create');
insert into permission (table_model, permission) values ('product', 'update');
insert into permission (table_model, permission) values ('product', 'delete');
insert into permission (table_model, permission) values ('profile', 'list');
insert into permission (table_model, permission) values ('profile', 'read');
insert into permission (table_model, permission) values ('profile', 'create');
insert into permission (table_model, permission) values ('profile', 'update');
insert into permission (table_model, permission) values ('profile', 'delete');
insert into permission (table_model, permission) values ('user', 'list');
insert into permission (table_model, permission) values ('user', 'read');
insert into permission (table_model, permission) values ('user', 'create');
insert into permission (table_model, permission) values ('user', 'update');
insert into permission (table_model, permission) values ('user', 'delete');
