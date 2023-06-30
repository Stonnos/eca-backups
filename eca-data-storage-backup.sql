--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Debian 13.9-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-06-30 22:14:53

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
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 208 (class 1259 OID 16730)
-- Name: attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attribute (
    id bigint NOT NULL,
    column_name character varying(255) NOT NULL,
    _type character varying(255) NOT NULL,
    selected boolean DEFAULT true,
    _index integer NOT NULL,
    instances_id bigint NOT NULL
);


ALTER TABLE public.attribute OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16754)
-- Name: attribute_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attribute_value (
    id bigint NOT NULL,
    _value character varying(255) NOT NULL,
    _index integer NOT NULL,
    attribute_id bigint NOT NULL
);


ALTER TABLE public.attribute_value OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16676)
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
-- TOC entry 206 (class 1259 OID 16690)
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
-- TOC entry 204 (class 1259 OID 16668)
-- Name: audit_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_group (
    id character varying(255) NOT NULL,
    title character varying(255)
);


ALTER TABLE public.audit_group OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16639)
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
-- TOC entry 200 (class 1259 OID 16451)
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
-- TOC entry 202 (class 1259 OID 16656)
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
-- TOC entry 203 (class 1259 OID 16658)
-- Name: instances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instances (
    id bigint NOT NULL,
    table_name character varying(255) NOT NULL,
    num_instances integer,
    num_attributes integer,
    creation_date timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    class_attribute_id bigint,
    id_column_name character varying(255) NOT NULL,
    uuid character varying(255) NOT NULL
);


ALTER TABLE public.instances OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16718)
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
-- TOC entry 3069 (class 0 OID 16730)
-- Dependencies: 208
-- Data for Name: attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attribute (id, column_name, _type, selected, _index, instances_id) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 16754)
-- Dependencies: 209
-- Data for Name: attribute_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attribute_value (id, _value, _index, attribute_id) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 16676)
-- Dependencies: 205
-- Data for Name: audit_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_code (id, title, enabled, audit_group_id) FROM stdin;
SAVE_INSTANCES	Сохранение файла с обучающей выборкой в базу данных	t	DATA_STORAGE_ACTIONS
RENAME_INSTANCES	Изменение имени таблицы с обучающей выборкой	t	DATA_STORAGE_ACTIONS
DELETE_INSTANCES	Удаление таблицы с обучающей выборкой	t	DATA_STORAGE_ACTIONS
DOWNLOAD_INSTANCES_REPORT	Выгрузка обучающей выборки	t	DATA_STORAGE_ACTIONS
SET_CLASS_ATTRIBUTE	Установка атрибута класса	t	DATA_STORAGE_ACTIONS
SELECT_ATTRIBUTE	Выбор атрибута классификации	t	DATA_STORAGE_ACTIONS
UNSELECT_ATTRIBUTE	Отмена выбора атрибута классификации	t	DATA_STORAGE_ACTIONS
SELECT_ALL_ATTRIBUTES	Выбор всех атрибутов классификации	t	DATA_STORAGE_ACTIONS
\.


--
-- TOC entry 3067 (class 0 OID 16690)
-- Dependencies: 206
-- Data for Name: audit_event_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_event_template (id, event_type, message_template, audit_code_id) FROM stdin;
1	SUCCESS	Обучающая выборка была успешно сохранена в таблицу ${tableName}	SAVE_INSTANCES
2	SUCCESS	Изменено название таблицы ${returnValue} для обучающей выборки. Новое название - ${newName}	RENAME_INSTANCES
3	SUCCESS	Таблица ${returnValue} с обучающей выборкой была удалена	DELETE_INSTANCES
4	SUCCESS	Данные обучающей выборки были выгружены из таблицы [${instancesEntity.tableName}] в формате [${reportType.extension}]	DOWNLOAD_INSTANCES_REPORT
5	SUCCESS	Установлен атрибут класса [${returnValue.columnName}] для обучающей выборки [${returnValue.instancesEntity.tableName}]	SET_CLASS_ATTRIBUTE
6	SUCCESS	Выбран атрибут классификации [${returnValue.columnName}] для обучающей выборки [${returnValue.instancesEntity.tableName}]	SELECT_ATTRIBUTE
7	SUCCESS	Отменен выбор атрибута классификации [${returnValue.columnName}] для обучающей выборки [${returnValue.instancesEntity.tableName}]	UNSELECT_ATTRIBUTE
8	SUCCESS	Выбраны все атрибуты классификации для обучающей выборки [${returnValue.tableName}]	SELECT_ALL_ATTRIBUTES
\.


--
-- TOC entry 3065 (class 0 OID 16668)
-- Dependencies: 204
-- Data for Name: audit_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_group (id, title) FROM stdin;
DATA_STORAGE_ACTIONS	Действия с обучающими выборками
\.


--
-- TOC entry 3062 (class 0 OID 16639)
-- Dependencies: 201
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:38.19176	1	EXECUTED	8:a3d354491071bf1899da0ff55cd58976	createSequence sequenceName=hibernate_sequence		\N	3.7.0	\N	\N	8136637936
2	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:38.329976	2	EXECUTED	8:cf3e4b41d1b1655071b28529ca4342ca	createTable tableName=instances		\N	3.7.0	schema	\N	8136637936
create_audit_group_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2023-06-30 21:50:38.390492	3	EXECUTED	8:112e0769f50b6016ed2ef835793f4bf0	createTable tableName=audit_group		\N	3.7.0	schema	\N	8136637936
create_audit_code_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2023-06-30 21:50:38.475004	4	EXECUTED	8:904288ce7cefab647509b310c5715a82	createTable tableName=audit_code		\N	3.7.0	schema	\N	8136637936
create_audit_event_template_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2023-06-30 21:50:38.525251	5	EXECUTED	8:f44dbaff8192c97b691c220bf0fa9181	createTable tableName=audit_event_template		\N	3.7.0	schema	\N	8136637936
add_audit_event_template_code_id_event_type_unique_index	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2023-06-30 21:50:38.611011	6	EXECUTED	8:70743a754f4bb16fff3ecd33d25acae3	addUniqueConstraint constraintName=audit_event_template_code_id_event_type_unique_index, tableName=audit_event_template		\N	3.7.0	schema	\N	8136637936
create_audit_event_request_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2023-06-30 21:50:38.665427	7	EXECUTED	8:950918154a4b4a51c4549de8ec9f8427	createTable tableName=audit_event_request		\N	3.7.0	schema	\N	8136637936
add_correlation_id_column_in_audit_event_request_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2023-06-30 21:50:38.685426	8	EXECUTED	8:9dc73daf828a4cdf30ed23fd5899321d	addColumn tableName=audit_event_request		\N	3.7.0	schema	\N	8136637936
drop_audit_event_request_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2023-06-30 21:50:38.711648	9	EXECUTED	8:9e3dfc52bdb8f4eac4a39d460d561000	dropTable tableName=audit_event_request		\N	3.7.0	schema	\N	8136637936
create_retry_request_table	roman.batygin@mail.ru	classpath:db/../redelivery-changelog.xml	2023-06-30 21:50:38.798255	10	EXECUTED	8:f83ceeb7d4537c55a66b655ec31e6bb8	createTable tableName=retry_request		\N	3.7.0	schema	\N	8136637936
add_retry_at_column_in_retry_request_table	roman.batygin@mail.ru	classpath:db/../redelivery-changelog.xml	2023-06-30 21:50:38.816238	11	EXECUTED	8:5e9a79b47863935b83b6d3a644b656b8	addColumn tableName=retry_request		\N	3.7.0	schema	\N	8136637936
insert_audit_groups_1	roman.batygin@mail.ru	db/changelog/v1-insert-audit-codes-and-events.xml	2023-06-30 21:50:39.044325	12	EXECUTED	8:bd3c3c47e990c3dd4355e7bd595e4be6	loadUpdateData tableName=audit_group		\N	3.7.0	data	\N	8136637936
insert_audit_codes_3	roman.batygin@mail.ru	db/changelog/v1-insert-audit-codes-and-events.xml	2023-06-30 21:50:39.225471	13	EXECUTED	8:75f5e6e8bfb5c55d990a5cf2438e98cf	loadUpdateData tableName=audit_code		\N	3.7.0	data	\N	8136637936
insert_audit_event_templates_3	roman.batygin@mail.ru	db/changelog/v1-insert-audit-codes-and-events.xml	2023-06-30 21:50:39.444656	14	EXECUTED	8:2f35eba42c6ede167543a9916ae33979	loadUpdateData tableName=audit_event_template		\N	3.7.0	data	\N	8136637936
create_attribute_table	roman.batygin@mail.ru	db/changelog/v2-create-attribute-table.xml	2023-06-30 21:50:39.504043	15	EXECUTED	8:8c41a85bfb29a054af53a500f8f6e3f0	createTable tableName=attribute		\N	3.7.0	schema	\N	8136637936
add_instances_id_index_unique_index	roman.batygin@mail.ru	db/changelog/v2-create-attribute-table.xml	2023-06-30 21:50:39.564662	16	EXECUTED	8:b90ba060b8fe0465e044aea09424b21f	addUniqueConstraint constraintName=instances_id_index_unique_index, tableName=attribute		\N	3.7.0	schema	\N	8136637936
add_instances_id_column_name_unique_index	roman.batygin@mail.ru	db/changelog/v2-create-attribute-table.xml	2023-06-30 21:50:39.595895	17	EXECUTED	8:6e7f03ef601c5d575b4a6e42d2238731	addUniqueConstraint constraintName=instances_id_column_name_unique_index, tableName=attribute		\N	3.7.0	schema	\N	8136637936
create_attribute_value_table	roman.batygin@mail.ru	db/changelog/v2-create-attribute-table.xml	2023-06-30 21:50:39.649431	18	EXECUTED	8:5832b25420c3c8d6ec725c6c9c493cfb	createTable tableName=attribute_value		\N	3.7.0	schema	\N	8136637936
add_attribute_id_value_unique_index	roman.batygin@mail.ru	db/changelog/v2-create-attribute-table.xml	2023-06-30 21:50:39.684043	19	EXECUTED	8:74a57c78195508ebfdbdf08bf515e837	addUniqueConstraint constraintName=attribute_id_value_unique_index, tableName=attribute_value		\N	3.7.0	schema	\N	8136637936
add_attribute_id_index_unique_index	roman.batygin@mail.ru	db/changelog/v2-create-attribute-table.xml	2023-06-30 21:50:39.720454	20	EXECUTED	8:ecd236b3e52cfe8c1645234e0614692d	addUniqueConstraint constraintName=attribute_id_index_unique_index, tableName=attribute_value		\N	3.7.0	schema	\N	8136637936
add_class_attribute_column	roman.batygin@mail.ru	db/changelog/v3-add-class-attribute-column.xml	2023-06-30 21:50:39.740282	21	EXECUTED	8:c9192043d014ef639bf5f83f48c2e106	addColumn tableName=instances		\N	3.7.0	schema	\N	8136637936
add_id_column_name_column	roman.batygin@mail.ru	db/changelog/v4-add-id-column-name-column.xml	2023-06-30 21:50:39.747262	22	EXECUTED	8:44dc96e51729b8e96df621b910b65536	addColumn tableName=instances		\N	3.7.0	schema	\N	8136637936
add_uuid_column	roman.batygin@mail.ru	db/changelog/v4-add-id-column-name-column.xml	2023-06-30 21:50:39.780472	23	EXECUTED	8:d3d5d4c2218bc00651200a0254df374b	addColumn tableName=instances		\N	3.7.0	schema	\N	8136637936
\.


--
-- TOC entry 3061 (class 0 OID 16451)
-- Dependencies: 200
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- TOC entry 3064 (class 0 OID 16658)
-- Dependencies: 203
-- Data for Name: instances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instances (id, table_name, num_instances, num_attributes, creation_date, created_by, class_attribute_id, id_column_name, uuid) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 16718)
-- Dependencies: 207
-- Data for Name: retry_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.retry_request (id, request_type, request_id, request, tx_id, retries, max_retries, created_at, retry_at) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 202
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- TOC entry 2921 (class 2606 OID 16767)
-- Name: attribute_value attribute_id_index_unique_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_value
    ADD CONSTRAINT attribute_id_index_unique_index UNIQUE (attribute_id, _index);


--
-- TOC entry 2923 (class 2606 OID 16765)
-- Name: attribute_value attribute_id_value_unique_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_value
    ADD CONSTRAINT attribute_id_value_unique_index UNIQUE (attribute_id, _value);


--
-- TOC entry 2915 (class 2606 OID 16738)
-- Name: attribute attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT attribute_pkey PRIMARY KEY (id);


--
-- TOC entry 2925 (class 2606 OID 16758)
-- Name: attribute_value attribute_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_value
    ADD CONSTRAINT attribute_value_pkey PRIMARY KEY (id);


--
-- TOC entry 2907 (class 2606 OID 16684)
-- Name: audit_code audit_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_code
    ADD CONSTRAINT audit_code_pkey PRIMARY KEY (id);


--
-- TOC entry 2909 (class 2606 OID 16704)
-- Name: audit_event_template audit_event_template_code_id_event_type_unique_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_event_template
    ADD CONSTRAINT audit_event_template_code_id_event_type_unique_index UNIQUE (audit_code_id, event_type);


--
-- TOC entry 2911 (class 2606 OID 16697)
-- Name: audit_event_template audit_event_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_event_template
    ADD CONSTRAINT audit_event_template_pkey PRIMARY KEY (id);


--
-- TOC entry 2905 (class 2606 OID 16675)
-- Name: audit_group audit_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_group
    ADD CONSTRAINT audit_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 16455)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 2917 (class 2606 OID 16753)
-- Name: attribute instances_id_column_name_unique_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT instances_id_column_name_unique_index UNIQUE (instances_id, column_name);


--
-- TOC entry 2919 (class 2606 OID 16751)
-- Name: attribute instances_id_index_unique_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT instances_id_index_unique_index UNIQUE (instances_id, _index);


--
-- TOC entry 2899 (class 2606 OID 16665)
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 16774)
-- Name: instances instances_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instances
    ADD CONSTRAINT instances_uuid_key UNIQUE (uuid);


--
-- TOC entry 2913 (class 2606 OID 16727)
-- Name: retry_request retry_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retry_request
    ADD CONSTRAINT retry_request_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 16667)
-- Name: instances table_name_unique_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instances
    ADD CONSTRAINT table_name_unique_index UNIQUE (table_name);


--
-- TOC entry 2929 (class 2606 OID 16739)
-- Name: attribute fk_attribute_instances_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT fk_attribute_instances_id FOREIGN KEY (instances_id) REFERENCES public.instances(id);


--
-- TOC entry 2930 (class 2606 OID 16759)
-- Name: attribute_value fk_attribute_value_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_value
    ADD CONSTRAINT fk_attribute_value_attribute_id FOREIGN KEY (attribute_id) REFERENCES public.attribute(id);


--
-- TOC entry 2927 (class 2606 OID 16685)
-- Name: audit_code fk_audit_code_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_code
    ADD CONSTRAINT fk_audit_code_group_id FOREIGN KEY (audit_group_id) REFERENCES public.audit_group(id);


--
-- TOC entry 2928 (class 2606 OID 16698)
-- Name: audit_event_template fk_audit_event_template_code_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_event_template
    ADD CONSTRAINT fk_audit_event_template_code_id FOREIGN KEY (audit_code_id) REFERENCES public.audit_code(id);


--
-- TOC entry 2926 (class 2606 OID 16768)
-- Name: instances fk_instances_class_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instances
    ADD CONSTRAINT fk_instances_class_attribute_id FOREIGN KEY (class_attribute_id) REFERENCES public.attribute(id);


-- Completed on 2023-06-30 22:14:56

--
-- PostgreSQL database dump complete
--

