--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)

-- Started on 2022-12-09 13:12:16 +07

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
-- TOC entry 2222 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 185 (class 1259 OID 17273)
-- Name: audit_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_log (
    id bigint NOT NULL,
    event_id character varying(255) NOT NULL,
    message text NOT NULL,
    initiator character varying(255) NOT NULL,
    event_type character varying(255) NOT NULL,
    group_code character varying(255) NOT NULL,
    group_title character varying(255),
    audit_code character varying(255) NOT NULL,
    audit_code_title character varying(255),
    event_date timestamp without time zone NOT NULL,
    correlation_id character varying(255)
);


ALTER TABLE public.audit_log OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 17279)
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
-- TOC entry 187 (class 1259 OID 17285)
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
-- TOC entry 188 (class 1259 OID 17288)
-- Name: filter_dictionary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filter_dictionary (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.filter_dictionary OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 17291)
-- Name: filter_dictionary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.filter_dictionary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filter_dictionary_id_seq OWNER TO postgres;

--
-- TOC entry 2223 (class 0 OID 0)
-- Dependencies: 189
-- Name: filter_dictionary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filter_dictionary_id_seq OWNED BY public.filter_dictionary.id;


--
-- TOC entry 190 (class 1259 OID 17293)
-- Name: filter_dictionary_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filter_dictionary_value (
    id bigint NOT NULL,
    label character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    filter_dictionary_id bigint NOT NULL
);


ALTER TABLE public.filter_dictionary_value OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 17299)
-- Name: filter_dictionary_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.filter_dictionary_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filter_dictionary_value_id_seq OWNER TO postgres;

--
-- TOC entry 2224 (class 0 OID 0)
-- Dependencies: 191
-- Name: filter_dictionary_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filter_dictionary_value_id_seq OWNED BY public.filter_dictionary_value.id;


--
-- TOC entry 192 (class 1259 OID 17301)
-- Name: filter_field; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filter_field (
    id bigint NOT NULL,
    field_name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    field_order integer NOT NULL,
    filter_field_type character varying(255) NOT NULL,
    match_mode character varying(255) NOT NULL,
    filter_template_id bigint NOT NULL,
    filter_dictionary_id bigint,
    multiple boolean DEFAULT false
);


ALTER TABLE public.filter_field OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 17308)
-- Name: filter_field_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.filter_field_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filter_field_id_seq OWNER TO postgres;

--
-- TOC entry 2225 (class 0 OID 0)
-- Dependencies: 193
-- Name: filter_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filter_field_id_seq OWNED BY public.filter_field.id;


--
-- TOC entry 194 (class 1259 OID 17310)
-- Name: filter_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filter_template (
    id bigint NOT NULL,
    template_name character varying(255) NOT NULL,
    template_type character varying(255) NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.filter_template OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 17316)
-- Name: filter_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.filter_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filter_template_id_seq OWNER TO postgres;

--
-- TOC entry 2226 (class 0 OID 0)
-- Dependencies: 195
-- Name: filter_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filter_template_id_seq OWNED BY public.filter_template.id;


--
-- TOC entry 196 (class 1259 OID 17318)
-- Name: global_filter_field; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.global_filter_field (
    id bigint NOT NULL,
    field_name character varying(255) NOT NULL,
    global_filter_template_id bigint NOT NULL
);


ALTER TABLE public.global_filter_field OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 17321)
-- Name: global_filter_field_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.global_filter_field_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.global_filter_field_id_seq OWNER TO postgres;

--
-- TOC entry 2227 (class 0 OID 0)
-- Dependencies: 197
-- Name: global_filter_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.global_filter_field_id_seq OWNED BY public.global_filter_field.id;


--
-- TOC entry 198 (class 1259 OID 17323)
-- Name: global_filter_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.global_filter_template (
    id bigint NOT NULL,
    filter_name character varying(255) NOT NULL,
    template_type character varying(255) NOT NULL
);


ALTER TABLE public.global_filter_template OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 17329)
-- Name: global_filter_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.global_filter_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.global_filter_template_id_seq OWNER TO postgres;

--
-- TOC entry 2228 (class 0 OID 0)
-- Dependencies: 199
-- Name: global_filter_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.global_filter_template_id_seq OWNED BY public.global_filter_template.id;


--
-- TOC entry 200 (class 1259 OID 17331)
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
-- TOC entry 2055 (class 2604 OID 17333)
-- Name: filter_dictionary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_dictionary ALTER COLUMN id SET DEFAULT nextval('public.filter_dictionary_id_seq'::regclass);


--
-- TOC entry 2056 (class 2604 OID 17334)
-- Name: filter_dictionary_value id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_dictionary_value ALTER COLUMN id SET DEFAULT nextval('public.filter_dictionary_value_id_seq'::regclass);


--
-- TOC entry 2058 (class 2604 OID 17335)
-- Name: filter_field id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_field ALTER COLUMN id SET DEFAULT nextval('public.filter_field_id_seq'::regclass);


--
-- TOC entry 2059 (class 2604 OID 17336)
-- Name: filter_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_template ALTER COLUMN id SET DEFAULT nextval('public.filter_template_id_seq'::regclass);


--
-- TOC entry 2060 (class 2604 OID 17337)
-- Name: global_filter_field id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_filter_field ALTER COLUMN id SET DEFAULT nextval('public.global_filter_field_id_seq'::regclass);


--
-- TOC entry 2061 (class 2604 OID 17338)
-- Name: global_filter_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_filter_template ALTER COLUMN id SET DEFAULT nextval('public.global_filter_template_id_seq'::regclass);


--
-- TOC entry 2201 (class 0 OID 17273)
-- Dependencies: 185
-- Data for Name: audit_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_log (id, event_id, message, initiator, event_type, group_code, group_title, audit_code, audit_code_title, event_date, correlation_id) FROM stdin;
\.


--
-- TOC entry 2202 (class 0 OID 17279)
-- Dependencies: 186
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2021-12-02 13:19:06.865546	1	EXECUTED	8:a3d354491071bf1899da0ff55cd58976	createSequence sequenceName=hibernate_sequence		\N	3.7.0	\N	\N	8425946701
2	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2021-12-02 13:19:06.920828	2	EXECUTED	8:9f1fb12379dc6c885f3ee5ca7ce03441	createTable tableName=audit_log		\N	3.7.0	schema	\N	8425946701
create_global_filter_template	roman.batygin@mail.ru	classpath:db/../filter-template-changelog.xml	2021-12-02 13:19:06.966282	3	EXECUTED	8:cda8ce64a6a0ed0b153fc32329a6bbc6	createTable tableName=global_filter_template		\N	3.7.0	schema	\N	8425946701
create_global_filter_field	roman.batygin@mail.ru	classpath:db/../filter-template-changelog.xml	2021-12-02 13:19:07.000063	4	EXECUTED	8:208fa1a1dea8d771abc9ff8cbadf633a	createTable tableName=global_filter_field		\N	3.7.0	schema	\N	8425946701
create_filter_template	roman.batygin@mail.ru	classpath:db/../filter-template-changelog.xml	2021-12-02 13:19:07.045791	5	EXECUTED	8:eef92c0687a1a6dd158fd71ff3837ce3	createTable tableName=filter_template		\N	3.7.0	schema	\N	8425946701
create_filter_dictionary	roman.batygin@mail.ru	classpath:db/../filter-template-changelog.xml	2021-12-02 13:19:07.083875	6	EXECUTED	8:c70f4717adc271d0d4c4c6d6450884e8	createTable tableName=filter_dictionary		\N	3.7.0	schema	\N	8425946701
create_filter_field	roman.batygin@mail.ru	classpath:db/../filter-template-changelog.xml	2021-12-02 13:19:07.122546	7	EXECUTED	8:3b2b63d3773cd2af170a833724b21ca6	createTable tableName=filter_field		\N	3.7.0	schema	\N	8425946701
create_filter_dictionary_value	roman.batygin@mail.ru	classpath:db/../filter-template-changelog.xml	2021-12-02 13:19:07.162859	8	EXECUTED	8:d6f60bac76ab39d3dd5dbb02834e7cb3	createTable tableName=filter_dictionary_value		\N	3.7.0	schema	\N	8425946701
1	roman.batygin@mail.ru	db/changelog/v1-insert-filter-templates.xml	2021-12-02 13:19:07.205814	9	EXECUTED	8:fbff5761de7f019a13bb9c990c8680b6	insert tableName=global_filter_template; insert tableName=global_filter_field; insert tableName=global_filter_field; insert tableName=global_filter_field; insert tableName=global_filter_field; insert tableName=global_filter_field		\N	3.7.0	data	\N	8425946701
2	roman.batygin@mail.ru	db/changelog/v1-insert-filter-templates.xml	2021-12-02 13:19:07.244011	10	EXECUTED	8:6f9348f21396414d9a4986df357e2980	insert tableName=filter_dictionary; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value		\N	3.7.0	data	\N	8425946701
3	roman.batygin@mail.ru	db/changelog/v1-insert-filter-templates.xml	2021-12-02 13:19:07.298475	11	EXECUTED	8:5653db8278f3f060bf406ece81e15481	insert tableName=filter_template; insert tableName=filter_field; insert tableName=filter_field; insert tableName=filter_field; insert tableName=filter_field		\N	3.7.0	data	\N	8425946701
1	roman.batygin@mail.ru	db/changelog/v2-add-correlation-id-column.xml	2022-12-09 13:05:11.077528	12	EXECUTED	8:6f8500b4dbeba1ab7116e43680f2a97f	addColumn tableName=audit_log		\N	3.7.0	schema	\N	0565910895
1	roman.batygin@mail.ru	db/changelog/v3-insert-correlation-id-in-filter-templates.xml	2022-12-09 13:05:11.111838	13	EXECUTED	8:ee0e775664f68489150bc4afcd695fde	insert tableName=global_filter_field		\N	3.7.0	data	\N	0565910895
2	roman.batygin@mail.ru	db/changelog/v3-insert-correlation-id-in-filter-templates.xml	2022-12-09 13:05:11.125867	14	EXECUTED	8:e85b45e64da5a1b673a58bc42f21e4ba	update tableName=filter_field		\N	3.7.0	data	\N	0565910895
3	roman.batygin@mail.ru	db/changelog/v3-insert-correlation-id-in-filter-templates.xml	2022-12-09 13:05:11.136166	15	EXECUTED	8:2062d3917b99a82047cad3511340007d	insert tableName=filter_field		\N	3.7.0	data	\N	0565910895
1	roman.batygin@mail.ru	db/changelog/v4-add-event-id-unique-idx.xml	2022-12-09 13:05:11.152205	16	EXECUTED	8:c1bdeecfed0609588b6e78e57291d1ea	addUniqueConstraint constraintName=audit_log_event_id_unique_idx, tableName=audit_log		\N	3.7.0	schema	\N	0565910895
1	roman.batygin@mail.ru	db/changelog/v5-insert-filter-templates.xml	2022-12-09 13:05:11.163109	17	EXECUTED	8:85239796437b717406e79df80c38a6a1	insert tableName=filter_dictionary_value		\N	3.7.0	data	\N	0565910895
\.


--
-- TOC entry 2203 (class 0 OID 17285)
-- Dependencies: 187
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- TOC entry 2204 (class 0 OID 17288)
-- Dependencies: 188
-- Data for Name: filter_dictionary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filter_dictionary (id, name) FROM stdin;
1	auditGroup
\.


--
-- TOC entry 2206 (class 0 OID 17293)
-- Dependencies: 190
-- Data for Name: filter_dictionary_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filter_dictionary_value (id, label, value, filter_dictionary_id) FROM stdin;
1	Действия пользователя в личном кабинете	USER_PROFILE_ACTIONS	1
2	Действия с конфигурациями классификаторов	CLASSIFIERS_CONFIGURATIONS_ACTIONS	1
3	Действия с обучающими выборками	DATA_STORAGE_ACTIONS	1
4	Действия с заявками на построение моделей	EVALUATION_REQUESTS_ACTIONS	1
\.


--
-- TOC entry 2208 (class 0 OID 17301)
-- Dependencies: 192
-- Data for Name: filter_field; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filter_field (id, field_name, description, field_order, filter_field_type, match_mode, filter_template_id, filter_dictionary_id, multiple) FROM stdin;
1	eventId	ID события	0	TEXT	LIKE	1	\N	f
2	groupCode	Группа событий	2	REFERENCE	EQUALS	1	1	f
3	initiator	Инициатор события	3	TEXT	LIKE	1	\N	f
4	eventDate	Дата события	4	DATE	RANGE	1	\N	t
5	correlationId	ID корреляции	1	TEXT	LIKE	1	\N	f
\.


--
-- TOC entry 2210 (class 0 OID 17310)
-- Dependencies: 194
-- Data for Name: filter_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filter_template (id, template_name, template_type, created) FROM stdin;
1	Фильтр событий аудита	AUDIT_LOG	2021-12-02 13:19:07.266586
\.


--
-- TOC entry 2212 (class 0 OID 17318)
-- Dependencies: 196
-- Data for Name: global_filter_field; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.global_filter_field (id, field_name, global_filter_template_id) FROM stdin;
1	eventId	1
2	message	1
3	initiator	1
4	groupTitle	1
5	codeTitle	1
6	correlationId	1
\.


--
-- TOC entry 2214 (class 0 OID 17323)
-- Dependencies: 198
-- Data for Name: global_filter_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.global_filter_template (id, filter_name, template_type) FROM stdin;
1	auditLogFilter	AUDIT_LOG
\.


--
-- TOC entry 2229 (class 0 OID 0)
-- Dependencies: 189
-- Name: filter_dictionary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filter_dictionary_id_seq', 1, false);


--
-- TOC entry 2230 (class 0 OID 0)
-- Dependencies: 191
-- Name: filter_dictionary_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filter_dictionary_value_id_seq', 4, true);


--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 193
-- Name: filter_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filter_field_id_seq', 5, true);


--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 195
-- Name: filter_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filter_template_id_seq', 1, false);


--
-- TOC entry 2233 (class 0 OID 0)
-- Dependencies: 197
-- Name: global_filter_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.global_filter_field_id_seq', 6, true);


--
-- TOC entry 2234 (class 0 OID 0)
-- Dependencies: 199
-- Name: global_filter_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.global_filter_template_id_seq', 1, false);


--
-- TOC entry 2235 (class 0 OID 0)
-- Dependencies: 200
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- TOC entry 2063 (class 2606 OID 17436)
-- Name: audit_log audit_log_event_id_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_log
    ADD CONSTRAINT audit_log_event_id_unique_idx UNIQUE (event_id);


--
-- TOC entry 2065 (class 2606 OID 17340)
-- Name: audit_log audit_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_log
    ADD CONSTRAINT audit_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2067 (class 2606 OID 17342)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 2069 (class 2606 OID 17344)
-- Name: filter_dictionary filter_dictionary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_dictionary
    ADD CONSTRAINT filter_dictionary_pkey PRIMARY KEY (id);


--
-- TOC entry 2071 (class 2606 OID 17346)
-- Name: filter_dictionary_value filter_dictionary_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_dictionary_value
    ADD CONSTRAINT filter_dictionary_value_pkey PRIMARY KEY (id);


--
-- TOC entry 2073 (class 2606 OID 17348)
-- Name: filter_field filter_field_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_field
    ADD CONSTRAINT filter_field_pkey PRIMARY KEY (id);


--
-- TOC entry 2075 (class 2606 OID 17350)
-- Name: filter_template filter_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_template
    ADD CONSTRAINT filter_template_pkey PRIMARY KEY (id);


--
-- TOC entry 2077 (class 2606 OID 17352)
-- Name: global_filter_field global_filter_field_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_filter_field
    ADD CONSTRAINT global_filter_field_pkey PRIMARY KEY (id);


--
-- TOC entry 2079 (class 2606 OID 17354)
-- Name: global_filter_template global_filter_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_filter_template
    ADD CONSTRAINT global_filter_template_pkey PRIMARY KEY (id);


--
-- TOC entry 2080 (class 2606 OID 17355)
-- Name: filter_dictionary_value fk_filter_dictionary_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_dictionary_value
    ADD CONSTRAINT fk_filter_dictionary_id FOREIGN KEY (filter_dictionary_id) REFERENCES public.filter_dictionary(id);


--
-- TOC entry 2081 (class 2606 OID 17360)
-- Name: filter_field fk_filter_field_dictionary_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_field
    ADD CONSTRAINT fk_filter_field_dictionary_id FOREIGN KEY (filter_dictionary_id) REFERENCES public.filter_dictionary(id);


--
-- TOC entry 2082 (class 2606 OID 17365)
-- Name: filter_field fk_filter_template_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_field
    ADD CONSTRAINT fk_filter_template_id FOREIGN KEY (filter_template_id) REFERENCES public.filter_template(id);


--
-- TOC entry 2083 (class 2606 OID 17370)
-- Name: global_filter_field fk_global_filter_template_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_filter_field
    ADD CONSTRAINT fk_global_filter_template_id FOREIGN KEY (global_filter_template_id) REFERENCES public.global_filter_template(id);


-- Completed on 2022-12-09 13:12:16 +07

--
-- PostgreSQL database dump complete
--

