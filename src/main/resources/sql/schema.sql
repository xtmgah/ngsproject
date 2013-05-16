create SCHEMA NGSPROJECTS;
set SCHEMA NGSPROJECTS;


create table USERGROUP
	(
	id INT not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	name varchar(50) not null unique,
	is_public int not null default 0
	);

insert into USERGROUP(name) values('public');
	
create table USERS
	(
	id INT not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	name varchar(50) not null unique,
	sha1sum varchar(50) not null DEFAULT '',
	is_admin int not null default 0
	);

insert into USERS(name,sha1sum,is_admin) values('root','dd94709528bb1c83d08f3088d4043f4742891f4f',1);
insert into USERS(name,sha1sum,is_admin) values('anonymous','da39a3ee5e6b4b0d3255bfef95601890afd80709',0);
	
	
create table REFERENCE
	(
	id INT not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	path varchar(255) not null unique,
	name varchar(50) not null unique,
	description CLOB
	);

	
create table SAMPLE
	(
	id INT not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	name varchar(50) not null unique
	);	
	
	
create table BAM
	(
	id INT not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	path varchar(255) not null unique,
	sample_id INTEGER,
	reference_id INTEGER,
	
	FOREIGN KEY(sample_id ) REFERENCES SAMPLE(id),
	FOREIGN KEY(reference_id ) REFERENCES REFERENCE(id)
	);	

	
create table VCF
	(
	id INT not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	path varchar(255) not null unique,
	description CLOB,
	reference_id INTEGER NULL,
	FOREIGN KEY(reference_id ) REFERENCES REFERENCE(id)
	);	
	
	
	
create table PROJECT
	(
	id INT not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	name varchar(50) not null unique,
	description CLOB,
	group_id INTEGER,
	FOREIGN KEY(group_id ) REFERENCES USERGROUP(id)
	);	

	
	
create table USER2GROUP
	(
	id INT not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	user_id INTEGER,
	group_id INTEGER,
	FOREIGN KEY(user_id ) REFERENCES USERS(id),
	FOREIGN KEY(group_id ) REFERENCES USERGROUP(id)
	);	
	
create table PROJECT2BAM
	(
	id INT not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	project_id INTEGER,
	bam_id INTEGER,
	FOREIGN KEY(project_id ) REFERENCES PROJECT(id),
	FOREIGN KEY(bam_id ) REFERENCES BAM(id)
	);	

create table VCF2PROJECT
	(
	id INT not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	project_id INTEGER,
	vcf_id INTEGER,
	FOREIGN KEY(project_id ) REFERENCES PROJECT(id),
	FOREIGN KEY(vcf_id ) REFERENCES VCF(id)
	);	

create table VCF2SAMPLE
	(
	id INT not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	sample_id INTEGER,
	vcf_id INTEGER,
	FOREIGN KEY(sample_id ) REFERENCES SAMPLE(id),
	FOREIGN KEY(vcf_id ) REFERENCES VCF(id)
	);	
	
	