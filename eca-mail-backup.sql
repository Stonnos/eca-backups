--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Debian 13.9-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-06-30 22:15:04

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
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 16744)
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
-- TOC entry 200 (class 1259 OID 16494)
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
-- TOC entry 203 (class 1259 OID 16777)
-- Name: email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    sender character varying(255) NOT NULL,
    receiver character varying(255) NOT NULL,
    subject character varying(255) NOT NULL,
    message text NOT NULL,
    save_date timestamp without time zone NOT NULL,
    sent_date timestamp without time zone,
    status character varying(255) NOT NULL,
    error_message text,
    failed_attempts_to_sent integer,
    tx_id character varying(255),
    priority integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.email OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16775)
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
-- TOC entry 205 (class 1259 OID 16795)
-- Name: regex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regex (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    regex_code character varying(255) NOT NULL,
    regex character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.regex OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16785)
-- Name: template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.template (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    template_code character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    template_subject character varying(255) NOT NULL,
    template_body text
);


ALTER TABLE public.template OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16805)
-- Name: template_parameter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.template_parameter (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    parameter_name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    regex_id bigint
);


ALTER TABLE public.template_parameter OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16820)
-- Name: templates_parameters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.templates_parameters (
    template_id bigint NOT NULL,
    param_id bigint NOT NULL
);


ALTER TABLE public.templates_parameters OWNER TO postgres;

--
-- TOC entry 3037 (class 0 OID 16744)
-- Dependencies: 201
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:39.761158	1	EXECUTED	8:a3d354491071bf1899da0ff55cd58976	createSequence sequenceName=hibernate_sequence		\N	3.7.0	\N	\N	8136639524
2	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:39.814348	2	EXECUTED	8:048df7d73029c30e7ee3436737830470	createTable tableName=email		\N	3.7.0	schema	\N	8136639524
3	roman.batygin@mail.ru	db/changelog/v1-create-template-tables.xml	2023-06-30 21:50:39.892971	3	EXECUTED	8:2cb96e1181a3ca606207f022291a5730	createTable tableName=template		\N	3.7.0	schema	\N	8136639524
4	roman.batygin@mail.ru	db/changelog/v1-create-template-tables.xml	2023-06-30 21:50:39.991608	4	EXECUTED	8:b5dd61ed2ececda6f184f23d99497d06	createTable tableName=regex		\N	3.7.0	schema	\N	8136639524
5	roman.batygin@mail.ru	db/changelog/v1-create-template-tables.xml	2023-06-30 21:50:40.108932	5	EXECUTED	8:94b978aaa651c8c3c889e2f5d994c705	createTable tableName=template_parameter		\N	3.7.0	schema	\N	8136639524
6	roman.batygin@mail.ru	db/changelog/v1-create-template-tables.xml	2023-06-30 21:50:40.135291	6	EXECUTED	8:7da90ff1b3fb04129a0bc3c66ba022b6	addForeignKeyConstraint baseTableName=template_parameter, constraintName=fk_template_parameter_regex_id, referencedTableName=regex		\N	3.7.0	\N	\N	8136639524
7	roman.batygin@mail.ru	db/changelog/v1-create-template-tables.xml	2023-06-30 21:50:40.157295	7	EXECUTED	8:ec61ced7e9701a5859afdeded576c3cc	createTable tableName=templates_parameters		\N	3.7.0	schema	\N	8136639524
8	roman.batygin@mail.ru	db/changelog/v1-create-template-tables.xml	2023-06-30 21:50:40.178766	8	EXECUTED	8:5d683652544a0d8618e4081a825897c5	addPrimaryKey constraintName=pk_templates_parameters, tableName=templates_parameters		\N	3.7.0	\N	\N	8136639524
9	roman.batygin@mail.ru	db/changelog/v1-create-template-tables.xml	2023-06-30 21:50:40.194224	9	EXECUTED	8:b4899fab022a77614ac1def9f8b94ab7	addForeignKeyConstraint baseTableName=templates_parameters, constraintName=fk_templates_parameters_template_id, referencedTableName=template		\N	3.7.0	\N	\N	8136639524
10	roman.batygin@mail.ru	db/changelog/v1-create-template-tables.xml	2023-06-30 21:50:40.219197	10	EXECUTED	8:f3f177f09825b91f8575ab0389e2ea7e	addForeignKeyConstraint baseTableName=templates_parameters, constraintName=fk_templates_parameters_param_id, referencedTableName=template_parameter		\N	3.7.0	\N	\N	8136639524
1	roman.batygin@mail.ru	db/changelog/v2-drop-html-column.xml	2023-06-30 21:50:40.242349	11	EXECUTED	8:f2388cc342dd7cfc2a5789a875a5a8c9	dropColumn columnName=html, tableName=email		\N	3.7.0	schema	\N	8136639524
1	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2023-06-30 21:50:40.259408	12	EXECUTED	8:5c3fd5a5410b549f9966572c2fd829cc	insert tableName=regex		\N	3.7.0	data	\N	8136639524
2	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2023-06-30 21:50:40.275083	13	EXECUTED	8:e46c3269eaaa4869e68bb81bed8836fe	insert tableName=template_parameter		\N	3.7.0	data	\N	8136639524
3	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2023-06-30 21:50:40.284374	14	EXECUTED	8:75da3305670a12f86b2902ae3bed4b67	insert tableName=template_parameter		\N	3.7.0	data	\N	8136639524
4	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2023-06-30 21:50:40.302735	15	EXECUTED	8:d0aaf9886e3f51406451a4b7d886010e	insert tableName=template_parameter		\N	3.7.0	data	\N	8136639524
5	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2023-06-30 21:50:40.32121	16	EXECUTED	8:42d2123c27155518ee53284b0e84ba9c	insert tableName=template_parameter		\N	3.7.0	data	\N	8136639524
6	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2023-06-30 21:50:40.330084	17	EXECUTED	8:31e8669dc8c14b81cdc905ffca7e3581	insert tableName=template_parameter		\N	3.7.0	data	\N	8136639524
7	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2023-06-30 21:50:40.340256	18	EXECUTED	8:2bc6900648a5e5c06c6635c0d9a00bd4	insert tableName=template_parameter		\N	3.7.0	data	\N	8136639524
8	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2023-06-30 21:50:40.377608	19	EXECUTED	8:cec6f591f247c1951eafa6a729ee2496	insert tableName=template_parameter		\N	3.7.0	data	\N	8136639524
9	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2023-06-30 21:50:40.387553	20	EXECUTED	8:e498515e92d1b1a90157cbe0aaf80f37	insert tableName=template_parameter		\N	3.7.0	data	\N	8136639524
10	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2023-06-30 21:50:40.436254	21	EXECUTED	8:b918704df8d12cbc7d9652f98e0bf8a5	insert tableName=template_parameter		\N	3.7.0	data	\N	8136639524
11	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2023-06-30 21:50:40.469425	22	EXECUTED	8:47e692567797fd68c1e16a406f2b4643	insert tableName=template_parameter		\N	3.7.0	data	\N	8136639524
1	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.502197	23	EXECUTED	8:1e4ec3e4689114b0ca723c843eccadd4	insert tableName=template		\N	3.7.0	data	\N	8136639524
2	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.559159	24	EXECUTED	8:21dd723dd236d23507e83e0cb7efaf26	update tableName=template		\N	3.7.0	data	\N	8136639524
3	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.578092	25	EXECUTED	8:70b8f7efb18dee207c8048b379f8b535	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
4	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.589831	26	EXECUTED	8:08b8131bc14c9e0170af428fa21c8574	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
5	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.598921	27	EXECUTED	8:07f5aa575def933768c3457e17f81951	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
6	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.607347	28	EXECUTED	8:043a527ee40480cfa076fe58315c8f90	insert tableName=template		\N	3.7.0	data	\N	8136639524
7	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.628463	29	EXECUTED	8:1b6d8891ab063267ccdf20bb39042b66	update tableName=template		\N	3.7.0	data	\N	8136639524
8	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.649133	30	EXECUTED	8:fc544f3d34008096fb2f8db08d00dd0d	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
9	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.673788	31	EXECUTED	8:e1bdf7988875aa13f38d35a95f7a4192	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
10	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.684134	32	EXECUTED	8:647d797b2a9c685a2a5ba8aeb10f5328	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
11	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.699324	33	EXECUTED	8:ed4d67972c84aada831f2ae8a6799161	insert tableName=template		\N	3.7.0	data	\N	8136639524
12	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.747877	34	EXECUTED	8:103f28ecbbcec1c1736bc2fb3dbcf66b	update tableName=template		\N	3.7.0	data	\N	8136639524
13	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.773925	35	EXECUTED	8:282be5b7fceeab0ba404e6e3697e61c0	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
14	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.80252	36	EXECUTED	8:9be7740a3bcd2e9fc9c49c1c9c3876df	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
15	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.81581	37	EXECUTED	8:9cc224089b38b93286b839ced435f75c	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
16	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.823895	38	EXECUTED	8:a8db8ca1da1ac6d85ebcd9fdba5a4dcf	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
17	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.844895	39	EXECUTED	8:1e1efb34a7ed2930a78e21b90ae3bdbb	insert tableName=template		\N	3.7.0	data	\N	8136639524
18	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.860623	40	EXECUTED	8:7d7592e49673001aa948c333e7ef0643	update tableName=template		\N	3.7.0	data	\N	8136639524
19	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.868198	41	EXECUTED	8:561d5fe5da218b6734586b258e6e4adc	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
20	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.895045	42	EXECUTED	8:b9351df78379672b2ca344720bd7f789	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
21	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.910548	43	EXECUTED	8:49d68540108d38b42c529a59ad3cd740	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
22	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.923408	44	EXECUTED	8:37af45b15c62a51e9e0f21b0734caf17	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
23	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.933965	45	EXECUTED	8:9f3c9f99a2a5ee5878f251e788e0c1ea	insert tableName=template		\N	3.7.0	data	\N	8136639524
24	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.951767	46	EXECUTED	8:fc89b8a9219f0850f3be9ad6e784c912	update tableName=template		\N	3.7.0	data	\N	8136639524
25	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:40.998259	47	EXECUTED	8:4b7fd6897a15dab9a3d0684855bd90c6	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
26	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:41.014653	48	EXECUTED	8:e19d169b91494e669caa3746c2fe709f	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
27	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:41.026033	49	EXECUTED	8:c3dd1abf9b4e13f23fec5bdecde29c82	insert tableName=template		\N	3.7.0	data	\N	8136639524
28	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:41.041031	50	EXECUTED	8:1e2e0a13cfcba90a8946ebf1cfb0565f	update tableName=template		\N	3.7.0	data	\N	8136639524
29	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:41.049654	51	EXECUTED	8:53018f8fc0e6a7534fc628e54421ca19	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
30	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:41.071618	52	EXECUTED	8:7a4e1c88ed4127ff55078efb5cad63d7	insert tableName=template		\N	3.7.0	data	\N	8136639524
31	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:41.081303	53	EXECUTED	8:6bc86c820e26e621064f1b1b19ec4221	update tableName=template		\N	3.7.0	data	\N	8136639524
32	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:41.100017	54	EXECUTED	8:47ac7c1d891093853ca486dbfdc99ed4	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
33	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2023-06-30 21:50:41.123128	55	EXECUTED	8:fa83696af12ee20985e8d9b4c72b7fe5	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
1	roman.batygin@mail.ru	db/changelog/v5-insert-in-progress-experiment-template.xml	2023-06-30 21:50:41.146625	56	EXECUTED	8:5013bbd21a01aa4edbdd9dfae0fccfa3	insert tableName=template		\N	3.7.0	data	\N	8136639524
2	roman.batygin@mail.ru	db/changelog/v5-insert-in-progress-experiment-template.xml	2023-06-30 21:50:41.178104	57	EXECUTED	8:cf8e731187a9bac08327f743c693c0d8	update tableName=template		\N	3.7.0	data	\N	8136639524
3	roman.batygin@mail.ru	db/changelog/v5-insert-in-progress-experiment-template.xml	2023-06-30 21:50:41.184769	58	EXECUTED	8:198e60a8ecaed181d79c1b33637dd0d7	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
4	roman.batygin@mail.ru	db/changelog/v5-insert-in-progress-experiment-template.xml	2023-06-30 21:50:41.201731	59	EXECUTED	8:0ccf2c5cda665b0770ec380415e0046c	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
5	roman.batygin@mail.ru	db/changelog/v5-insert-in-progress-experiment-template.xml	2023-06-30 21:50:41.215963	60	EXECUTED	8:8c5afd590f9e7a2796a57cf7fe79dc37	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
1	roman.batygin@mail.ru	db/changelog/v6-insert-change-password-template.xml	2023-06-30 21:50:41.230119	61	EXECUTED	8:cfeda4c9809db91d408b8d80503db3bb	insert tableName=template		\N	3.7.0	data	\N	8136639524
2	roman.batygin@mail.ru	db/changelog/v6-insert-change-password-template.xml	2023-06-30 21:50:41.247881	62	EXECUTED	8:06bc92fb9d5e527a41db1b4ab08b5f00	update tableName=template		\N	3.7.0	data	\N	8136639524
3	roman.batygin@mail.ru	db/changelog/v6-insert-change-password-template.xml	2023-06-30 21:50:41.259396	63	EXECUTED	8:6f8bdf696586d867872080790ce3102a	insert tableName=template_parameter		\N	3.7.0	data	\N	8136639524
4	roman.batygin@mail.ru	db/changelog/v6-insert-change-password-template.xml	2023-06-30 21:50:41.28197	64	EXECUTED	8:93103af96bb37ad2cab71de8b451af64	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
5	roman.batygin@mail.ru	db/changelog/v6-insert-change-password-template.xml	2023-06-30 21:50:41.296378	65	EXECUTED	8:108b1c7f024764c54c5dad3d8790b903	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
1	roman.batygin@email.ru	db/changelog/v7-add-email-tx-id-column.xml	2023-06-30 21:50:41.306967	66	EXECUTED	8:099da37268a3c792efbae90b66ee0258	addColumn tableName=email		\N	3.7.0	schema	\N	8136639524
1	roman.batygin@email.ru	db/changelog/v8-add-not-null-constraints.xml	2023-06-30 21:50:41.329361	67	EXECUTED	8:8aec280d2ca65326e33f43283fe162d0	addNotNullConstraint columnName=uuid, tableName=email		\N	3.7.0	schema	\N	8136639524
2	roman.batygin@email.ru	db/changelog/v8-add-not-null-constraints.xml	2023-06-30 21:50:41.352607	68	EXECUTED	8:f47e8c79664dedf35713d2f367121d04	addNotNullConstraint columnName=sender, tableName=email		\N	3.7.0	schema	\N	8136639524
3	roman.batygin@email.ru	db/changelog/v8-add-not-null-constraints.xml	2023-06-30 21:50:41.411439	69	EXECUTED	8:d139fa7af6bf3f7cf758403180a94ea1	addNotNullConstraint columnName=receiver, tableName=email		\N	3.7.0	schema	\N	8136639524
4	roman.batygin@email.ru	db/changelog/v8-add-not-null-constraints.xml	2023-06-30 21:50:41.463133	70	EXECUTED	8:6e245be3bb865a309cd5f609482b626f	addNotNullConstraint columnName=subject, tableName=email		\N	3.7.0	schema	\N	8136639524
5	roman.batygin@email.ru	db/changelog/v8-add-not-null-constraints.xml	2023-06-30 21:50:41.486127	71	EXECUTED	8:49c09a3435274a74322fecbbd2747bd4	addNotNullConstraint columnName=message, tableName=email		\N	3.7.0	schema	\N	8136639524
6	roman.batygin@email.ru	db/changelog/v8-add-not-null-constraints.xml	2023-06-30 21:50:41.529954	72	EXECUTED	8:e2861aae7c66c58d3a8bf8a558bd670f	addNotNullConstraint columnName=save_date, tableName=email		\N	3.7.0	schema	\N	8136639524
7	roman.batygin@email.ru	db/changelog/v8-add-not-null-constraints.xml	2023-06-30 21:50:41.590383	73	EXECUTED	8:9488d10efaa8caa8f49091ebcd9aa4e5	addNotNullConstraint columnName=status, tableName=email		\N	3.7.0	schema	\N	8136639524
1	roman.batygin@email.ru	db/changelog/v9-add-priority-column.xml	2023-06-30 21:50:41.617019	74	EXECUTED	8:98bd0e3bfe587c1b17554455c44822c4	addColumn tableName=email		\N	3.7.0	schema	\N	8136639524
2	roman.batygin@email.ru	db/changelog/v9-add-priority-column.xml	2023-06-30 21:50:41.641549	75	EXECUTED	8:159a94bb5ff4c5a7e6c68d5da6e6ae65	addNotNullConstraint columnName=priority, tableName=email		\N	3.7.0	schema	\N	8136639524
1	roman.batygin@mail.ru	db/changelog/v10-insert-change-email-template.xml	2023-06-30 21:50:41.654997	76	EXECUTED	8:36869912b56d6d249dd3deb1197a099b	insert tableName=template		\N	3.7.0	data	\N	8136639524
2	roman.batygin@mail.ru	db/changelog/v10-insert-change-email-template.xml	2023-06-30 21:50:41.672083	77	EXECUTED	8:815b3c8dcd34683dbdb2b5b9c2044691	update tableName=template		\N	3.7.0	data	\N	8136639524
3	roman.batygin@mail.ru	db/changelog/v10-insert-change-email-template.xml	2023-06-30 21:50:41.687999	78	EXECUTED	8:c010281fd36dfc26c963e654a11118f5	insert tableName=template_parameter		\N	3.7.0	data	\N	8136639524
4	roman.batygin@mail.ru	db/changelog/v10-insert-change-email-template.xml	2023-06-30 21:50:41.710914	79	EXECUTED	8:7dcf8d719e4078b184fe925a3edf8b4c	insert tableName=template_parameter		\N	3.7.0	data	\N	8136639524
5	roman.batygin@mail.ru	db/changelog/v10-insert-change-email-template.xml	2023-06-30 21:50:41.737157	80	EXECUTED	8:232d0c423ff298d6aad896177537b63e	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
6	roman.batygin@mail.ru	db/changelog/v10-insert-change-email-template.xml	2023-06-30 21:50:41.750973	81	EXECUTED	8:b69f97019697b9d48b4f011c9813cee3	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
7	roman.batygin@mail.ru	db/changelog/v10-insert-change-email-template.xml	2023-06-30 21:50:41.76013	82	EXECUTED	8:59ca9e3618616a21cd7127e6b0de3008	update tableName=template_parameter		\N	3.7.0	data	\N	8136639524
1	roman.batygin@mail.ru	db/changelog/v11-insert-confirm-templates.xml	2023-06-30 21:50:41.776513	83	EXECUTED	8:73d8a6e7528e0ef3081522fe0c8e203c	insert tableName=template		\N	3.7.0	data	\N	8136639524
2	roman.batygin@mail.ru	db/changelog/v11-insert-confirm-templates.xml	2023-06-30 21:50:41.798595	84	EXECUTED	8:7347cce3dc116a502f921b3d17d852f8	insert tableName=template		\N	3.7.0	data	\N	8136639524
3	roman.batygin@mail.ru	db/changelog/v11-insert-confirm-templates.xml	2023-06-30 21:50:41.80872	85	EXECUTED	8:dae7061ada51447a9ab7a0e5e5a272d4	insert tableName=template		\N	3.7.0	data	\N	8136639524
4	roman.batygin@mail.ru	db/changelog/v11-insert-confirm-templates.xml	2023-06-30 21:50:41.818409	86	EXECUTED	8:ac750cdecedd028d1f3629593cceb1c7	update tableName=template		\N	3.7.0	data	\N	8136639524
5	roman.batygin@mail.ru	db/changelog/v11-insert-confirm-templates.xml	2023-06-30 21:50:41.8386	87	EXECUTED	8:70d0eda05e5fb375f77a1622946c58c8	update tableName=template		\N	3.7.0	data	\N	8136639524
6	roman.batygin@mail.ru	db/changelog/v11-insert-confirm-templates.xml	2023-06-30 21:50:41.854389	88	EXECUTED	8:7f4241acadb74297509e266467bec84b	update tableName=template		\N	3.7.0	data	\N	8136639524
1	roman.batygin@mail.ru	db/changelog/v12-changed-create-user-template-subject.xml	2023-06-30 21:50:41.871974	89	EXECUTED	8:25cba52bed49d283c86500c647bc8dff	update tableName=template		\N	3.7.0	data	\N	8136639524
1	roman.batygin@mail.ru	db/changelog/v13-update-new-user-template.xml	2023-06-30 21:50:41.882598	90	EXECUTED	8:6bc86c820e26e621064f1b1b19ec4221	update tableName=template		\N	3.7.0	data	\N	8136639524
1	roman.batygin@mail.ru	db/changelog/v14-update-reset-password-templates.xml	2023-06-30 21:50:41.899836	91	EXECUTED	8:822ef1921df6b444cc3afb6b2d2f43aa	update tableName=template		\N	3.7.0	data	\N	8136639524
2	roman.batygin@mail.ru	db/changelog/v14-update-reset-password-templates.xml	2023-06-30 21:50:41.923927	92	EXECUTED	8:f77f3c010200e11e8c8329b67f112fa5	update tableName=template		\N	3.7.0	data	\N	8136639524
3	roman.batygin@mail.ru	db/changelog/v14-update-reset-password-templates.xml	2023-06-30 21:50:41.948957	93	EXECUTED	8:69a62e52445c8ba0ebc7cc9c75e0e881	update tableName=template_parameter		\N	3.7.0	data	\N	8136639524
1	roman.batygin@email.ru	db/changelog/v15-add-uuid-unique-idx.xml	2023-06-30 21:50:41.972572	94	EXECUTED	8:44f0191e34c3aa54a9a1c1eec43d010a	addUniqueConstraint constraintName=email_uuid_unique_idx, tableName=email		\N	3.7.0	schema	\N	8136639524
insert_user_locked_template	roman.batygin@mail.ru	db/changelog/v16-insert-user-locked-templates.xml	2023-06-30 21:50:41.992865	95	EXECUTED	8:1af3dce8c6778bb3374a28a85a7f9a60	insert tableName=template		\N	3.7.0	data	\N	8136639524
insert_user_unlocked_template	roman.batygin@mail.ru	db/changelog/v16-insert-user-locked-templates.xml	2023-06-30 21:50:42.015341	96	EXECUTED	8:d02b91797e78c352a77422f1d9dfc575	insert tableName=template		\N	3.7.0	data	\N	8136639524
insert_user_locked_template_body	roman.batygin@mail.ru	db/changelog/v16-insert-user-locked-templates.xml	2023-06-30 21:50:42.028774	97	EXECUTED	8:34f269fe2f3e0e01c463cdd6af8f7940	update tableName=template		\N	3.7.0	data	\N	8136639524
insert_user_unlocked_template_body	roman.batygin@mail.ru	db/changelog/v16-insert-user-locked-templates.xml	2023-06-30 21:50:42.037026	98	EXECUTED	8:2e7fd9000ed9e6a0a122feada0dbafce	update tableName=template		\N	3.7.0	data	\N	8136639524
insert_new_email_template_parameter	roman.batygin@mail.ru	db/changelog/v17-insert-new-email-template-parameter.xml	2023-06-30 21:50:42.086333	99	EXECUTED	8:925f77e4b6f034d653cd08c95feabb97	insert tableName=template_parameter		\N	3.7.0	data	\N	8136639524
insert_new_email_template_parameter_into_change_email_template	roman.batygin@mail.ru	db/changelog/v17-insert-new-email-template-parameter.xml	2023-06-30 21:50:42.107518	100	EXECUTED	8:a044b74318a4df2bf462936a80f439e3	insert tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
update_change_email_template_body_with_new_email	roman.batygin@mail.ru	db/changelog/v17-insert-new-email-template-parameter.xml	2023-06-30 21:50:42.126813	101	EXECUTED	8:815b3c8dcd34683dbdb2b5b9c2044691	update tableName=template		\N	3.7.0	data	\N	8136639524
delete_first_name_from_templates_parameters	roman.batygin@mail.ru	db/changelog/v18-remove-first-name-template-parameter.xml	2023-06-30 21:50:42.1441	102	EXECUTED	8:a7df2abba31a4e9a6ac11dc269492b81	delete tableName=templates_parameters		\N	3.7.0	data	\N	8136639524
delete_first_name_template_parameter	roman.batygin@mail.ru	db/changelog/v18-remove-first-name-template-parameter.xml	2023-06-30 21:50:42.165805	103	EXECUTED	8:c83577091cdc2e1cc1fdbd1301490837	delete tableName=template_parameter		\N	3.7.0	data	\N	8136639524
update_new_experiment_template_body	roman.batygin@mail.ru	db/changelog/v19-update-experiment-templates.xml	2023-06-30 21:50:42.192317	104	EXECUTED	8:21dd723dd236d23507e83e0cb7efaf26	update tableName=template		\N	3.7.0	data	\N	8136639524
update_error_experiment_template_body	roman.batygin@mail.ru	db/changelog/v19-update-experiment-templates.xml	2023-06-30 21:50:42.214422	105	EXECUTED	8:1b6d8891ab063267ccdf20bb39042b66	update tableName=template		\N	3.7.0	data	\N	8136639524
update_timeout_experiment_template_body	roman.batygin@mail.ru	db/changelog/v19-update-experiment-templates.xml	2023-06-30 21:50:42.241317	106	EXECUTED	8:103f28ecbbcec1c1736bc2fb3dbcf66b	update tableName=template		\N	3.7.0	data	\N	8136639524
update_finished_experiment_template_body	roman.batygin@mail.ru	db/changelog/v19-update-experiment-templates.xml	2023-06-30 21:50:42.252913	107	EXECUTED	8:7d7592e49673001aa948c333e7ef0643	update tableName=template		\N	3.7.0	data	\N	8136639524
update_in_progress_experiment_template_body	roman.batygin@mail.ru	db/changelog/v19-update-experiment-templates.xml	2023-06-30 21:50:42.263601	108	EXECUTED	8:cf8e731187a9bac08327f743c693c0d8	update tableName=template		\N	3.7.0	data	\N	8136639524
\.


--
-- TOC entry 3036 (class 0 OID 16494)
-- Dependencies: 200
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- TOC entry 3039 (class 0 OID 16777)
-- Dependencies: 203
-- Data for Name: email; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email (id, uuid, sender, receiver, subject, message, save_date, sent_date, status, error_message, failed_attempts_to_sent, tx_id, priority) FROM stdin;
\.


--
-- TOC entry 3041 (class 0 OID 16795)
-- Dependencies: 205
-- Data for Name: regex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regex (id, created, regex_code, regex, description) FROM stdin;
1	2023-06-30 21:50:40.249646	INTEGER	[0-9]+	Регулярное выражение для целого числа
\.


--
-- TOC entry 3040 (class 0 OID 16785)
-- Dependencies: 204
-- Data for Name: template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.template (id, created, template_code, description, template_subject, template_body) FROM stdin;
19	2023-06-30 21:50:41.129857	IN_PROGRESS_EXPERIMENT	Сообщение о поступлении эксперимента в работу	Заявка поступила в работу	<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте!\r\n</p>\r\n<p>\r\n    Ваша заявка на эксперимент "${experimentType}" поступила в работу.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b>${requestId}</b>\r\n</p>\r\n</body>\r\n</html>\r\n
22	2023-06-30 21:50:41.646199	CHANGE_EMAIL	Сообщение с подтверждением изменения Email в личном кабинете Eca - service	Подтверждение изменения Email в личном кабинете Eca - service	<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте!\r\n</p>\r\n<p>\r\n    Вы запросили смену текущего email адреса в личном кабинете Eca - service на адрес <b>${newEmail}</b>. Если Вы не делали такого запроса, пожалуйста, не отвечайте на данное сообщение.\r\n</p>\r\n<p>\r\n    Для подтверждения запроса, пожалуйста, перейдите по ссылке: <a href="${changeEmailUrl}">${changeEmailUrl}</a>\r\n</p>\r\n<p>\r\n    Ссылка действительна в течении ${validityHours}-ми часов.\r\n</p>\r\n</body>\r\n</html>\r\n
17	2023-06-30 21:50:41.020562	TFA_CODE	Сообщение с кодом подтверждения для 2FA	Код подтверждения	<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Ваш код двухфакторной атунтификации: <b>${tfaCode}</b>\r\n</p>\r\n</body>\r\n</html>\r\n
18	2023-06-30 21:50:41.054372	NEW_USER	Сообщение с учетными данными нового пользователя	Доступ к Eca - service	<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, вам предоставлен доступ к системе Eca - service.\r\n</p>\r\n<p>\r\n    Логин: <b>${userName}</b>\r\n</p>\r\n<p>\r\n    Временный пароль: <b>${password}</b>\r\n</p>\r\n</body>\r\n</html>\r\n
20	2023-06-30 21:50:41.223984	CHANGE_PASSWORD	Сообщение с подтверждением изменения пароля в личном кабинете Eca - service	Подтверждение изменения пароля в личном кабинете Eca - service	<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте!\r\n</p>\r\n<p>\r\n    Вы запросили смену текущего пароля в личном кабинете Eca - service. Если Вы не делали такого запроса, пожалуйста, не отвечайте на данное сообщение.\r\n</p>\r\n<p>\r\n    Если вы подтверждаете свое желание изменить пароль, пожалуйста, перейдите по ссылке: <a href="${changePasswordUrl}">${changePasswordUrl}</a>\r\n</p>\r\n<p>\r\n    Ссылка действительна в течении ${validityMinutes}-ти минут.\r\n</p>\r\n</body>\r\n</html>\r\n
12	2023-06-30 21:50:40.487327	NEW_EXPERIMENT	Сообщение о новом эксперименте	Создан новый эксперимент	<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "${experimentType}" была успешно создана.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b>${requestId}</b>\r\n</p>\r\n</body>\r\n</html>\r\n
26	2023-06-30 21:50:41.784919	PASSWORD_CHANGED	Сообщение с успешным изменением пароля в личном кабинете Eca - service	Изменен пароль от вашего аккаунта	<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте!\r\n</p>\r\n<p>\r\n    Пароль от вашего аккаунта в Eca - service был успешно изменен.\r\n</p>\r\n</body>\r\n</html>\r\n
25	2023-06-30 21:50:41.768035	EMAIL_CHANGED	Сообщение с успешным изменением Email в личном кабинете Eca - service	Изменен Email от вашего аккаунта	<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте!\r\n</p>\r\n<p>\r\n    Этот электронный адрес был успешно привязан к вашему аккаунту в Eca - service.\r\n</p>\r\n</body>\r\n</html>\r\n
16	2023-06-30 21:50:40.927019	RESET_PASSWORD	Сообщение со ссылкой для сброса пароля	Сброс пароля	<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, для сброса пароля перейдите по ссылке:\r\n</p>\r\n<p>\r\n    <a href="${resetPasswordUrl}">${resetPasswordUrl}</a>\r\n</p>\r\n<p>\r\n    Ссылка действительна в течении ${validityMinutes}-ти минут.\r\n</p>\r\n</body>\r\n</html>\r\n
27	2023-06-30 21:50:41.804601	PASSWORD_RESET	Сообщение с успешным сбросом пароля в личном кабинете Eca - service	Сброшен пароль от вашего аккаунта	<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте!\r\n</p>\r\n<p>\r\n    Пароль от вашего аккаунта в Eca - service был успешно сброшен.\r\n</p>\r\n</body>\r\n</html>\r\n
28	2023-06-30 21:50:41.988628	USER_LOCKED	Сообщение о блокировке учетной записи	Блокировка учетной записи	<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, ваша учетная запись в Eca - service была заблокирована.\r\n</p>\r\n</body>\r\n</html>\r\n
29	2023-06-30 21:50:42.012013	USER_UNLOCKED	Сообщение о снятии блокировки учетной записи	Блокировка учетной записи снята	<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, блокировка учетной записи в Eca - service была снята.\r\n</p>\r\n</body>\r\n</html>\r\n
13	2023-06-30 21:50:40.603088	ERROR_EXPERIMENT	Сообщение о завершении эксперимента с ошибкой	Ошибка при построении эксперимента	<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте!\r\n</p>\r\n<p>\r\n    К сожалению, не удалось подобрать оптимальные параметры для эксперимента "${experimentType}".\r\n    В ходе построения эксперимента возникла ошибка.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b>${requestId}</b>\r\n</p>\r\n</body>\r\n</html>\r\n
14	2023-06-30 21:50:40.689845	TIMEOUT_EXPERIMENT	Сообщение о таймауте эксперимента	Таймаут при построении эксперимента	<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте!\r\n</p>\r\n<p>\r\n    Было превышено максимальное допустимое время для построения эксперимента "${experimentType}".\r\n    Максимальное допустимое время составляет ${timeout} часов.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b>${requestId}</b>\r\n</p>\r\n</body>\r\n</html>\r\n
15	2023-06-30 21:50:40.833618	FINISHED_EXPERIMENT	Сообщение о завершенном эксперименте	Эксперимент завершен	<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "${experimentType}" был успешно построен.\r\n    Результаты доступны по ссылке <a href="${downloadUrl}">${downloadUrl}</a>\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b>${requestId}</b>\r\n</p>\r\n</body>\r\n</html>\r\n
\.


--
-- TOC entry 3042 (class 0 OID 16805)
-- Dependencies: 206
-- Data for Name: template_parameter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.template_parameter (id, created, parameter_name, description, regex_id) FROM stdin;
3	2023-06-30 21:50:40.279724	experimentType	Тип эксперимента	\N
4	2023-06-30 21:50:40.297252	requestId	Идентификатор заявки	\N
5	2023-06-30 21:50:40.310813	downloadUrl	Ссылка на скачивание результатов эксперимента	\N
6	2023-06-30 21:50:40.325703	timeout	Таймаут для эксперимента	1
7	2023-06-30 21:50:40.334501	tfaCode	Код двухфакторной аутентификации	\N
8	2023-06-30 21:50:40.367411	userName	Логин пользователя	\N
9	2023-06-30 21:50:40.382198	password	Пароль пользователя	\N
21	2023-06-30 21:50:41.254948	changePasswordUrl	Ссылка на подтверждение изменения пароля	\N
23	2023-06-30 21:50:41.680094	changeEmailUrl	Ссылка на подтверждение изменения Email	\N
24	2023-06-30 21:50:41.702984	validityHours	Время действия ссылки в часах	1
11	2023-06-30 21:50:40.450015	validityMinutes	Время действия ссылки в минутах	1
10	2023-06-30 21:50:40.396672	resetPasswordUrl	Ссылка на сброс пароля	\N
30	2023-06-30 21:50:42.072693	newEmail	Новый почтовый адрес	\N
\.


--
-- TOC entry 3043 (class 0 OID 16820)
-- Dependencies: 207
-- Data for Name: templates_parameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.templates_parameters (template_id, param_id) FROM stdin;
12	3
12	4
13	3
13	4
14	3
14	4
14	6
15	3
15	4
15	5
16	10
16	11
17	7
18	8
18	9
19	3
19	4
20	21
20	11
22	23
22	24
22	30
\.


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 202
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 30, true);


--
-- TOC entry 2884 (class 2606 OID 16498)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 16784)
-- Name: email email_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email
    ADD CONSTRAINT email_pkey PRIMARY KEY (id);


--
-- TOC entry 2888 (class 2606 OID 16843)
-- Name: email email_uuid_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email
    ADD CONSTRAINT email_uuid_unique_idx UNIQUE (uuid);


--
-- TOC entry 2898 (class 2606 OID 16814)
-- Name: template_parameter parameter_name_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template_parameter
    ADD CONSTRAINT parameter_name_unique_idx UNIQUE (parameter_name);


--
-- TOC entry 2902 (class 2606 OID 16824)
-- Name: templates_parameters pk_templates_parameters; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.templates_parameters
    ADD CONSTRAINT pk_templates_parameters PRIMARY KEY (template_id, param_id);


--
-- TOC entry 2894 (class 2606 OID 16804)
-- Name: regex regex_code_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regex
    ADD CONSTRAINT regex_code_unique_idx UNIQUE (regex_code);


--
-- TOC entry 2896 (class 2606 OID 16802)
-- Name: regex regex_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regex
    ADD CONSTRAINT regex_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 16794)
-- Name: template template_code_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template
    ADD CONSTRAINT template_code_unique_idx UNIQUE (template_code);


--
-- TOC entry 2900 (class 2606 OID 16812)
-- Name: template_parameter template_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template_parameter
    ADD CONSTRAINT template_parameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 16792)
-- Name: template template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template
    ADD CONSTRAINT template_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 16815)
-- Name: template_parameter fk_template_parameter_regex_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template_parameter
    ADD CONSTRAINT fk_template_parameter_regex_id FOREIGN KEY (regex_id) REFERENCES public.regex(id);


--
-- TOC entry 2905 (class 2606 OID 16830)
-- Name: templates_parameters fk_templates_parameters_param_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.templates_parameters
    ADD CONSTRAINT fk_templates_parameters_param_id FOREIGN KEY (param_id) REFERENCES public.template_parameter(id);


--
-- TOC entry 2904 (class 2606 OID 16825)
-- Name: templates_parameters fk_templates_parameters_template_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.templates_parameters
    ADD CONSTRAINT fk_templates_parameters_template_id FOREIGN KEY (template_id) REFERENCES public.template(id);


-- Completed on 2023-06-30 22:15:09

--
-- PostgreSQL database dump complete
--

