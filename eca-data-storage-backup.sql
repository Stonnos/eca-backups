--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Debian 13.9-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-06-15 20:03:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 17290)
-- Name: audit_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_code (
    id character varying(255) NOT NULL,
    title character varying(255),
    enabled boolean DEFAULT true NOT NULL,
    audit_group_id character varying(255) NOT NULL
);


ALTER TABLE public.audit_code OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 17297)
-- Name: audit_event_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_event_template (
    id bigint NOT NULL,
    event_type character varying(255) NOT NULL,
    message_template character varying(1024) NOT NULL,
    audit_code_id character varying(255) NOT NULL
);


ALTER TABLE public.audit_event_template OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17303)
-- Name: audit_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_group (
    id character varying(255) NOT NULL,
    title character varying(255)
);


ALTER TABLE public.audit_group OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 17315)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17321)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 17330)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17332)
-- Name: instances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instances (
    id bigint NOT NULL,
    table_name character varying(255) NOT NULL,
    num_instances integer,
    num_attributes integer,
    creation_date timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL
);


ALTER TABLE public.instances OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17344)
-- Name: retry_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retry_request (
    id bigint NOT NULL,
    request_type character varying(255) NOT NULL,
    request_id character varying(255),
    request text NOT NULL,
    tx_id character varying(255),
    retries integer DEFAULT 0,
    max_retries integer DEFAULT '-1'::integer,
    created_at timestamp without time zone NOT NULL,
    retry_at timestamp without time zone
);


ALTER TABLE public.retry_request OWNER TO postgres;

--
-- TOC entry 3034 (class 0 OID 17290)
-- Dependencies: 200
-- Data for Name: audit_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_code (id, title, enabled, audit_group_id) FROM stdin;
SAVE_INSTANCES	Сохранение файла с обучающей выборкой в базу данных	t	DATA_STORAGE_ACTIONS
RENAME_INSTANCES	Изменение имени таблицы с обучающей выборкой	t	DATA_STORAGE_ACTIONS
DELETE_INSTANCES	Удаление таблицы с обучающей выборкой	t	DATA_STORAGE_ACTIONS
DOWNLOAD_INSTANCES_REPORT	Выгрузка обучающей выборки	t	DATA_STORAGE_ACTIONS
\.


--
-- TOC entry 3035 (class 0 OID 17297)
-- Dependencies: 201
-- Data for Name: audit_event_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_event_template (id, event_type, message_template, audit_code_id) FROM stdin;
1	SUCCESS	Обучающая выборка была успешно сохранена в таблицу ${tableName}	SAVE_INSTANCES
2	SUCCESS	Изменено название таблицы ${returnValue} для обучающей выборки. Новое название - ${newName}	RENAME_INSTANCES
3	SUCCESS	Таблица ${returnValue} с обучающей выборкой была удалена	DELETE_INSTANCES
4	SUCCESS	Данные обучающей выборки были выгружены из таблицы [${instancesEntity.tableName}] в формате [${reportType.extension}]	DOWNLOAD_INSTANCES_REPORT
\.


--
-- TOC entry 3036 (class 0 OID 17303)
-- Dependencies: 202
-- Data for Name: audit_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_group (id, title) FROM stdin;
DATA_STORAGE_ACTIONS	Действия с обучающими выборками
\.


--
-- TOC entry 3037 (class 0 OID 17315)
-- Dependencies: 203
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2021-02-16 19:37:01.930573	1	EXECUTED	8:a3d354491071bf1899da0ff55cd58976	createSequence sequenceName=hibernate_sequence		\N	3.7.0	\N	\N	3479021782
2	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2021-02-16 19:37:01.998444	2	EXECUTED	8:cf3e4b41d1b1655071b28529ca4342ca	createTable tableName=instances		\N	3.7.0	schema	\N	3479021782
create_audit_group_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2021-12-02 13:19:07.246924	3	EXECUTED	8:112e0769f50b6016ed2ef835793f4bf0	createTable tableName=audit_group		\N	3.7.0	schema	\N	8425947111
create_audit_code_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2021-12-02 13:19:07.307467	4	EXECUTED	8:904288ce7cefab647509b310c5715a82	createTable tableName=audit_code		\N	3.7.0	schema	\N	8425947111
create_audit_event_template_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2021-12-02 13:19:07.362092	5	EXECUTED	8:f44dbaff8192c97b691c220bf0fa9181	createTable tableName=audit_event_template		\N	3.7.0	schema	\N	8425947111
add_audit_event_template_code_id_event_type_unique_index	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2021-12-02 13:19:07.377613	6	EXECUTED	8:70743a754f4bb16fff3ecd33d25acae3	addUniqueConstraint constraintName=audit_event_template_code_id_event_type_unique_index, tableName=audit_event_template		\N	3.7.0	schema	\N	8425947111
create_audit_event_request_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2021-12-02 13:19:07.417583	7	EXECUTED	8:950918154a4b4a51c4549de8ec9f8427	createTable tableName=audit_event_request		\N	3.7.0	schema	\N	8425947111
insert_audit_groups_1	roman.batygin@mail.ru	db/changelog/v1-insert-audit-codes-and-events.xml	2021-12-02 13:19:07.761536	8	EXECUTED	8:bd3c3c47e990c3dd4355e7bd595e4be6	loadUpdateData tableName=audit_group		\N	3.7.0	data	\N	8425947111
insert_audit_codes_1	roman.batygin@mail.ru	db/changelog/v1-insert-audit-codes-and-events.xml	2021-12-02 13:19:08.108876	9	EXECUTED	8:a3c0b34c10ded8b167faf0a622975224	loadUpdateData tableName=audit_code		\N	3.7.0	data	\N	8425947111
insert_audit_event_templates_1	roman.batygin@mail.ru	db/changelog/v1-insert-audit-codes-and-events.xml	2021-12-02 13:19:08.395558	10	EXECUTED	8:f8caf025b4e216fba48a0af11330248f	loadUpdateData tableName=audit_event_template		\N	3.7.0	data	\N	8425947111
add_correlation_id_column_in_audit_event_request_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2022-12-09 13:05:12.66408	11	EXECUTED	8:9dc73daf828a4cdf30ed23fd5899321d	addColumn tableName=audit_event_request		\N	3.7.0	schema	\N	0565912505
drop_audit_event_request_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2022-12-09 13:05:12.721166	12	EXECUTED	8:9e3dfc52bdb8f4eac4a39d460d561000	dropTable tableName=audit_event_request		\N	3.7.0	schema	\N	0565912505
create_retry_request_table	roman.batygin@mail.ru	classpath:db/../redelivery-changelog.xml	2022-12-09 13:05:12.800275	13	EXECUTED	8:f83ceeb7d4537c55a66b655ec31e6bb8	createTable tableName=retry_request		\N	3.7.0	schema	\N	0565912505
add_retry_at_column_in_retry_request_table	roman.batygin@mail.ru	classpath:db/../redelivery-changelog.xml	2022-12-09 13:05:12.834346	14	EXECUTED	8:5e9a79b47863935b83b6d3a644b656b8	addColumn tableName=retry_request		\N	3.7.0	schema	\N	0565912505
insert_audit_codes_2	roman.batygin@mail.ru	db/changelog/v1-insert-audit-codes-and-events.xml	2022-12-09 13:05:13.474443	15	EXECUTED	8:17901765deacd4af3ccc9de1e2bc6740	loadUpdateData tableName=audit_code		\N	3.7.0	data	\N	0565912505
insert_audit_event_templates_2	roman.batygin@mail.ru	db/changelog/v1-insert-audit-codes-and-events.xml	2022-12-09 13:05:13.916418	16	EXECUTED	8:da0a1337805934732c94e448f7d370cb	loadUpdateData tableName=audit_event_template		\N	3.7.0	data	\N	0565912505
\.


--
-- TOC entry 3038 (class 0 OID 17321)
-- Dependencies: 204
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- TOC entry 3040 (class 0 OID 17332)
-- Dependencies: 206
-- Data for Name: instances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instances (id, table_name, num_instances, num_attributes, creation_date, created_by) FROM stdin;
\.


--
-- TOC entry 3041 (class 0 OID 17344)
-- Dependencies: 207
-- Data for Name: retry_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.retry_request (id, request_type, request_id, request, tx_id, retries, max_retries, created_at, retry_at) FROM stdin;
\.


--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 205
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 6, true);


--
-- TOC entry 2887 (class 2606 OID 17359)
-- Name: audit_code audit_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_code
    ADD CONSTRAINT audit_code_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 17361)
-- Name: audit_event_template audit_event_template_code_id_event_type_unique_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_event_template
    ADD CONSTRAINT audit_event_template_code_id_event_type_unique_index UNIQUE (audit_code_id, event_type);


--
-- TOC entry 2891 (class 2606 OID 17363)
-- Name: audit_event_template audit_event_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_event_template
    ADD CONSTRAINT audit_event_template_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 17365)
-- Name: audit_group audit_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_group
    ADD CONSTRAINT audit_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 17367)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 17369)
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 17371)
-- Name: retry_request retry_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retry_request
    ADD CONSTRAINT retry_request_pkey PRIMARY KEY (id);


--
-- TOC entry 2899 (class 2606 OID 17373)
-- Name: instances table_name_unique_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instances
    ADD CONSTRAINT table_name_unique_index UNIQUE (table_name);


--
-- TOC entry 2902 (class 2606 OID 17374)
-- Name: audit_code fk_audit_code_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_code
    ADD CONSTRAINT fk_audit_code_group_id FOREIGN KEY (audit_group_id) REFERENCES public.audit_group(id);


--
-- TOC entry 2903 (class 2606 OID 17379)
-- Name: audit_event_template fk_audit_event_template_code_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_event_template
    ADD CONSTRAINT fk_audit_event_template_code_id FOREIGN KEY (audit_code_id) REFERENCES public.audit_code(id);


-- Completed on 2023-06-15 20:03:36

--
-- PostgreSQL database dump complete
--

