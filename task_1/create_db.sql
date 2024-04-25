drop table if exists users;
create table users (
	id serial primary key,
	fullname varchar(100),
	email varchar(100) unique
);

drop table if exists status;
create table status (
	id serial primary key,
	name varchar(50) unique,
    check (name in ('new', 'in progress', 'completed'))
);

drop table if exists tasks;
create table tasks (
	id serial primary key,
	title varchar(100),
	description text,
	status_id integer references status(id)
		on update cascade
		on delete set null,
	user_id integer references users(id)
		on update cascade
		on delete cascade
);
