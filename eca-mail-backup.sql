--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)

-- Started on 2022-12-09 13:10:26 +07

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
-- TOC entry 2188 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 185 (class 1259 OID 17109)
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
-- TOC entry 186 (class 1259 OID 17115)
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
-- TOC entry 187 (class 1259 OID 17118)
-- Name: email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email (
    id bigint NOT NULL,
    error_message text,
    failed_attempts_to_sent integer,
    message text NOT NULL,
    receiver character varying(255) NOT NULL,
    save_date timestamp without time zone NOT NULL,
    sender character varying(255) NOT NULL,
    sent_date timestamp without time zone,
    status character varying(255) NOT NULL,
    subject character varying(255) NOT NULL,
    uuid character varying(255) NOT NULL,
    tx_id character varying(255),
    priority integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.email OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 17125)
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
-- TOC entry 189 (class 1259 OID 17127)
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
-- TOC entry 190 (class 1259 OID 17133)
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
-- TOC entry 191 (class 1259 OID 17139)
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
-- TOC entry 192 (class 1259 OID 17145)
-- Name: templates_parameters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.templates_parameters (
    template_id bigint NOT NULL,
    param_id bigint NOT NULL
);


ALTER TABLE public.templates_parameters OWNER TO postgres;

--
-- TOC entry 2175 (class 0 OID 17109)
-- Dependencies: 185
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2020-01-11 01:33:54.918251	1	MARK_RAN	8:a3d354491071bf1899da0ff55cd58976	createSequence sequenceName=hibernate_sequence		\N	3.7.0	\N	\N	8681234816
2	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2020-01-11 01:33:54.951649	2	MARK_RAN	8:048df7d73029c30e7ee3436737830470	createTable tableName=email		\N	3.7.0	schema	\N	8681234816
3	roman.batygin@mail.ru	db/changelog/v1-create-template-tables.xml	2021-02-16 19:37:02.263002	3	EXECUTED	8:2cb96e1181a3ca606207f022291a5730	createTable tableName=template		\N	3.7.0	schema	\N	3479021947
4	roman.batygin@mail.ru	db/changelog/v1-create-template-tables.xml	2021-02-16 19:37:02.319086	4	EXECUTED	8:b5dd61ed2ececda6f184f23d99497d06	createTable tableName=regex		\N	3.7.0	schema	\N	3479021947
5	roman.batygin@mail.ru	db/changelog/v1-create-template-tables.xml	2021-02-16 19:37:02.358003	5	EXECUTED	8:94b978aaa651c8c3c889e2f5d994c705	createTable tableName=template_parameter		\N	3.7.0	schema	\N	3479021947
6	roman.batygin@mail.ru	db/changelog/v1-create-template-tables.xml	2021-02-16 19:37:02.37457	6	EXECUTED	8:7da90ff1b3fb04129a0bc3c66ba022b6	addForeignKeyConstraint baseTableName=template_parameter, constraintName=fk_template_parameter_regex_id, referencedTableName=regex		\N	3.7.0	\N	\N	3479021947
7	roman.batygin@mail.ru	db/changelog/v1-create-template-tables.xml	2021-02-16 19:37:02.429726	7	EXECUTED	8:ec61ced7e9701a5859afdeded576c3cc	createTable tableName=templates_parameters		\N	3.7.0	schema	\N	3479021947
8	roman.batygin@mail.ru	db/changelog/v1-create-template-tables.xml	2021-02-16 19:37:02.473801	8	EXECUTED	8:5d683652544a0d8618e4081a825897c5	addPrimaryKey constraintName=pk_templates_parameters, tableName=templates_parameters		\N	3.7.0	\N	\N	3479021947
9	roman.batygin@mail.ru	db/changelog/v1-create-template-tables.xml	2021-02-16 19:37:02.501567	9	EXECUTED	8:b4899fab022a77614ac1def9f8b94ab7	addForeignKeyConstraint baseTableName=templates_parameters, constraintName=fk_templates_parameters_template_id, referencedTableName=template		\N	3.7.0	\N	\N	3479021947
10	roman.batygin@mail.ru	db/changelog/v1-create-template-tables.xml	2021-02-16 19:37:02.523841	10	EXECUTED	8:f3f177f09825b91f8575ab0389e2ea7e	addForeignKeyConstraint baseTableName=templates_parameters, constraintName=fk_templates_parameters_param_id, referencedTableName=template_parameter		\N	3.7.0	\N	\N	3479021947
1	roman.batygin@mail.ru	db/changelog/v2-drop-html-column.xml	2021-02-16 19:37:02.572448	11	EXECUTED	8:f2388cc342dd7cfc2a5789a875a5a8c9	dropColumn columnName=html, tableName=email		\N	3.7.0	schema	\N	3479021947
1	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2021-02-16 19:37:02.590887	12	EXECUTED	8:5c3fd5a5410b549f9966572c2fd829cc	insert tableName=regex		\N	3.7.0	data	\N	3479021947
2	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2021-02-16 19:37:02.604194	13	EXECUTED	8:e46c3269eaaa4869e68bb81bed8836fe	insert tableName=template_parameter		\N	3.7.0	data	\N	3479021947
3	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2021-02-16 19:37:02.626319	14	EXECUTED	8:75da3305670a12f86b2902ae3bed4b67	insert tableName=template_parameter		\N	3.7.0	data	\N	3479021947
4	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2021-02-16 19:37:02.646735	15	EXECUTED	8:d0aaf9886e3f51406451a4b7d886010e	insert tableName=template_parameter		\N	3.7.0	data	\N	3479021947
5	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2021-02-16 19:37:02.659263	16	EXECUTED	8:42d2123c27155518ee53284b0e84ba9c	insert tableName=template_parameter		\N	3.7.0	data	\N	3479021947
6	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2021-02-16 19:37:02.672821	17	EXECUTED	8:31e8669dc8c14b81cdc905ffca7e3581	insert tableName=template_parameter		\N	3.7.0	data	\N	3479021947
7	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2021-02-16 19:37:02.686544	18	EXECUTED	8:2bc6900648a5e5c06c6635c0d9a00bd4	insert tableName=template_parameter		\N	3.7.0	data	\N	3479021947
8	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2021-02-16 19:37:02.694836	19	EXECUTED	8:cec6f591f247c1951eafa6a729ee2496	insert tableName=template_parameter		\N	3.7.0	data	\N	3479021947
9	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2021-02-16 19:37:02.713359	20	EXECUTED	8:e498515e92d1b1a90157cbe0aaf80f37	insert tableName=template_parameter		\N	3.7.0	data	\N	3479021947
10	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2021-02-16 19:37:02.726423	21	EXECUTED	8:b918704df8d12cbc7d9652f98e0bf8a5	insert tableName=template_parameter		\N	3.7.0	data	\N	3479021947
11	roman.batygin@mail.ru	db/changelog/v3-insert-template-template_parameter.xml	2021-02-16 19:37:02.755783	22	EXECUTED	8:47e692567797fd68c1e16a406f2b4643	insert tableName=template_parameter		\N	3.7.0	data	\N	3479021947
1	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:02.770288	23	EXECUTED	8:1e4ec3e4689114b0ca723c843eccadd4	insert tableName=template		\N	3.7.0	data	\N	3479021947
2	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:02.794101	24	EXECUTED	8:21dd723dd236d23507e83e0cb7efaf26	update tableName=template		\N	3.7.0	data	\N	3479021947
3	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:02.808425	25	EXECUTED	8:70b8f7efb18dee207c8048b379f8b535	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
4	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:02.824555	26	EXECUTED	8:08b8131bc14c9e0170af428fa21c8574	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
5	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:02.841344	27	EXECUTED	8:07f5aa575def933768c3457e17f81951	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
6	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:02.865798	28	EXECUTED	8:043a527ee40480cfa076fe58315c8f90	insert tableName=template		\N	3.7.0	data	\N	3479021947
7	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:02.875246	29	EXECUTED	8:1b6d8891ab063267ccdf20bb39042b66	update tableName=template		\N	3.7.0	data	\N	3479021947
8	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:02.892538	30	EXECUTED	8:fc544f3d34008096fb2f8db08d00dd0d	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
9	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:02.89835	31	EXECUTED	8:e1bdf7988875aa13f38d35a95f7a4192	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
10	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:02.927375	32	EXECUTED	8:647d797b2a9c685a2a5ba8aeb10f5328	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
11	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:02.944897	33	EXECUTED	8:ed4d67972c84aada831f2ae8a6799161	insert tableName=template		\N	3.7.0	data	\N	3479021947
12	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:02.95117	34	EXECUTED	8:103f28ecbbcec1c1736bc2fb3dbcf66b	update tableName=template		\N	3.7.0	data	\N	3479021947
13	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:02.969618	35	EXECUTED	8:282be5b7fceeab0ba404e6e3697e61c0	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
14	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:02.97706	36	EXECUTED	8:9be7740a3bcd2e9fc9c49c1c9c3876df	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
15	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:02.985983	37	EXECUTED	8:9cc224089b38b93286b839ced435f75c	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
16	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:02.997123	38	EXECUTED	8:a8db8ca1da1ac6d85ebcd9fdba5a4dcf	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
17	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.008512	39	EXECUTED	8:1e1efb34a7ed2930a78e21b90ae3bdbb	insert tableName=template		\N	3.7.0	data	\N	3479021947
18	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.020687	40	EXECUTED	8:7d7592e49673001aa948c333e7ef0643	update tableName=template		\N	3.7.0	data	\N	3479021947
19	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.032789	41	EXECUTED	8:561d5fe5da218b6734586b258e6e4adc	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
20	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.045621	42	EXECUTED	8:b9351df78379672b2ca344720bd7f789	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
21	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.054782	43	EXECUTED	8:49d68540108d38b42c529a59ad3cd740	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
22	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.069628	44	EXECUTED	8:37af45b15c62a51e9e0f21b0734caf17	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
23	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.076373	45	EXECUTED	8:9f3c9f99a2a5ee5878f251e788e0c1ea	insert tableName=template		\N	3.7.0	data	\N	3479021947
24	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.091754	46	EXECUTED	8:fc89b8a9219f0850f3be9ad6e784c912	update tableName=template		\N	3.7.0	data	\N	3479021947
25	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.103797	47	EXECUTED	8:4b7fd6897a15dab9a3d0684855bd90c6	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
26	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.114243	48	EXECUTED	8:e19d169b91494e669caa3746c2fe709f	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
27	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.124027	49	EXECUTED	8:c3dd1abf9b4e13f23fec5bdecde29c82	insert tableName=template		\N	3.7.0	data	\N	3479021947
28	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.137616	50	EXECUTED	8:1e2e0a13cfcba90a8946ebf1cfb0565f	update tableName=template		\N	3.7.0	data	\N	3479021947
29	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.148424	51	EXECUTED	8:53018f8fc0e6a7534fc628e54421ca19	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
30	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.16162	52	EXECUTED	8:7a4e1c88ed4127ff55078efb5cad63d7	insert tableName=template		\N	3.7.0	data	\N	3479021947
31	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.173126	53	EXECUTED	8:6bc86c820e26e621064f1b1b19ec4221	update tableName=template		\N	3.7.0	data	\N	3479021947
32	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.180311	54	EXECUTED	8:47ac7c1d891093853ca486dbfdc99ed4	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
33	roman.batygin@mail.ru	db/changelog/v4-insert-templates.xml	2021-02-16 19:37:03.188865	55	EXECUTED	8:fa83696af12ee20985e8d9b4c72b7fe5	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
1	roman.batygin@mail.ru	db/changelog/v5-insert-in-progress-experiment-template.xml	2021-02-16 19:37:03.202632	56	EXECUTED	8:5013bbd21a01aa4edbdd9dfae0fccfa3	insert tableName=template		\N	3.7.0	data	\N	3479021947
2	roman.batygin@mail.ru	db/changelog/v5-insert-in-progress-experiment-template.xml	2021-02-16 19:37:03.216389	57	EXECUTED	8:cf8e731187a9bac08327f743c693c0d8	update tableName=template		\N	3.7.0	data	\N	3479021947
3	roman.batygin@mail.ru	db/changelog/v5-insert-in-progress-experiment-template.xml	2021-02-16 19:37:03.225546	58	EXECUTED	8:198e60a8ecaed181d79c1b33637dd0d7	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
4	roman.batygin@mail.ru	db/changelog/v5-insert-in-progress-experiment-template.xml	2021-02-16 19:37:03.236875	59	EXECUTED	8:0ccf2c5cda665b0770ec380415e0046c	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
5	roman.batygin@mail.ru	db/changelog/v5-insert-in-progress-experiment-template.xml	2021-02-16 19:37:03.247984	60	EXECUTED	8:8c5afd590f9e7a2796a57cf7fe79dc37	insert tableName=templates_parameters		\N	3.7.0	data	\N	3479021947
1	roman.batygin@mail.ru	db/changelog/v6-insert-change-password-template.xml	2021-04-08 14:41:04.079033	61	EXECUTED	8:cfeda4c9809db91d408b8d80503db3bb	insert tableName=template		\N	3.7.0	data	\N	7867663917
2	roman.batygin@mail.ru	db/changelog/v6-insert-change-password-template.xml	2021-04-08 14:41:04.098995	62	EXECUTED	8:06bc92fb9d5e527a41db1b4ab08b5f00	update tableName=template		\N	3.7.0	data	\N	7867663917
3	roman.batygin@mail.ru	db/changelog/v6-insert-change-password-template.xml	2021-04-08 14:41:04.10871	63	EXECUTED	8:6f8bdf696586d867872080790ce3102a	insert tableName=template_parameter		\N	3.7.0	data	\N	7867663917
4	roman.batygin@mail.ru	db/changelog/v6-insert-change-password-template.xml	2021-04-08 14:41:04.124911	64	EXECUTED	8:93103af96bb37ad2cab71de8b451af64	insert tableName=templates_parameters		\N	3.7.0	data	\N	7867663917
5	roman.batygin@mail.ru	db/changelog/v6-insert-change-password-template.xml	2021-04-08 14:41:04.140688	65	EXECUTED	8:108b1c7f024764c54c5dad3d8790b903	insert tableName=templates_parameters		\N	3.7.0	data	\N	7867663917
1	roman.batygin@email.ru	db/changelog/v7-add-email-tx-id-column.xml	2021-04-08 14:41:04.168597	66	EXECUTED	8:099da37268a3c792efbae90b66ee0258	addColumn tableName=email		\N	3.7.0	schema	\N	7867663917
1	roman.batygin@email.ru	db/changelog/v8-add-not-null-constraints.xml	2021-04-08 14:41:04.181368	67	EXECUTED	8:8aec280d2ca65326e33f43283fe162d0	addNotNullConstraint columnName=uuid, tableName=email		\N	3.7.0	schema	\N	7867663917
2	roman.batygin@email.ru	db/changelog/v8-add-not-null-constraints.xml	2021-04-08 14:41:04.204522	68	EXECUTED	8:f47e8c79664dedf35713d2f367121d04	addNotNullConstraint columnName=sender, tableName=email		\N	3.7.0	schema	\N	7867663917
3	roman.batygin@email.ru	db/changelog/v8-add-not-null-constraints.xml	2021-04-08 14:41:04.220963	69	EXECUTED	8:d139fa7af6bf3f7cf758403180a94ea1	addNotNullConstraint columnName=receiver, tableName=email		\N	3.7.0	schema	\N	7867663917
4	roman.batygin@email.ru	db/changelog/v8-add-not-null-constraints.xml	2021-04-08 14:41:04.279707	70	EXECUTED	8:6e245be3bb865a309cd5f609482b626f	addNotNullConstraint columnName=subject, tableName=email		\N	3.7.0	schema	\N	7867663917
5	roman.batygin@email.ru	db/changelog/v8-add-not-null-constraints.xml	2021-04-08 14:41:04.300032	71	EXECUTED	8:49c09a3435274a74322fecbbd2747bd4	addNotNullConstraint columnName=message, tableName=email		\N	3.7.0	schema	\N	7867663917
6	roman.batygin@email.ru	db/changelog/v8-add-not-null-constraints.xml	2021-04-08 14:41:04.35777	72	EXECUTED	8:e2861aae7c66c58d3a8bf8a558bd670f	addNotNullConstraint columnName=save_date, tableName=email		\N	3.7.0	schema	\N	7867663917
7	roman.batygin@email.ru	db/changelog/v8-add-not-null-constraints.xml	2021-04-08 14:41:04.409756	73	EXECUTED	8:9488d10efaa8caa8f49091ebcd9aa4e5	addNotNullConstraint columnName=status, tableName=email		\N	3.7.0	schema	\N	7867663917
1	roman.batygin@email.ru	db/changelog/v9-add-priority-column.xml	2021-12-02 13:19:09.115424	74	EXECUTED	8:98bd0e3bfe587c1b17554455c44822c4	addColumn tableName=email		\N	3.7.0	schema	\N	8425948871
2	roman.batygin@email.ru	db/changelog/v9-add-priority-column.xml	2021-12-02 13:19:09.142651	75	EXECUTED	8:159a94bb5ff4c5a7e6c68d5da6e6ae65	addNotNullConstraint columnName=priority, tableName=email		\N	3.7.0	schema	\N	8425948871
1	roman.batygin@mail.ru	db/changelog/v10-insert-change-email-template.xml	2021-12-02 13:19:09.158125	76	EXECUTED	8:36869912b56d6d249dd3deb1197a099b	insert tableName=template		\N	3.7.0	data	\N	8425948871
2	roman.batygin@mail.ru	db/changelog/v10-insert-change-email-template.xml	2021-12-02 13:19:09.179438	77	EXECUTED	8:815b3c8dcd34683dbdb2b5b9c2044691	update tableName=template		\N	3.7.0	data	\N	8425948871
3	roman.batygin@mail.ru	db/changelog/v10-insert-change-email-template.xml	2021-12-02 13:19:09.185795	78	EXECUTED	8:c010281fd36dfc26c963e654a11118f5	insert tableName=template_parameter		\N	3.7.0	data	\N	8425948871
4	roman.batygin@mail.ru	db/changelog/v10-insert-change-email-template.xml	2021-12-02 13:19:09.203675	79	EXECUTED	8:7dcf8d719e4078b184fe925a3edf8b4c	insert tableName=template_parameter		\N	3.7.0	data	\N	8425948871
5	roman.batygin@mail.ru	db/changelog/v10-insert-change-email-template.xml	2021-12-02 13:19:09.210562	80	EXECUTED	8:232d0c423ff298d6aad896177537b63e	insert tableName=templates_parameters		\N	3.7.0	data	\N	8425948871
6	roman.batygin@mail.ru	db/changelog/v10-insert-change-email-template.xml	2021-12-02 13:19:09.221703	81	EXECUTED	8:b69f97019697b9d48b4f011c9813cee3	insert tableName=templates_parameters		\N	3.7.0	data	\N	8425948871
7	roman.batygin@mail.ru	db/changelog/v10-insert-change-email-template.xml	2021-12-02 13:19:09.229737	82	EXECUTED	8:59ca9e3618616a21cd7127e6b0de3008	update tableName=template_parameter		\N	3.7.0	data	\N	8425948871
1	roman.batygin@mail.ru	db/changelog/v11-insert-confirm-templates.xml	2021-12-02 13:19:09.242523	83	EXECUTED	8:73d8a6e7528e0ef3081522fe0c8e203c	insert tableName=template		\N	3.7.0	data	\N	8425948871
2	roman.batygin@mail.ru	db/changelog/v11-insert-confirm-templates.xml	2021-12-02 13:19:09.265566	84	EXECUTED	8:7347cce3dc116a502f921b3d17d852f8	insert tableName=template		\N	3.7.0	data	\N	8425948871
3	roman.batygin@mail.ru	db/changelog/v11-insert-confirm-templates.xml	2021-12-02 13:19:09.279038	85	EXECUTED	8:dae7061ada51447a9ab7a0e5e5a272d4	insert tableName=template		\N	3.7.0	data	\N	8425948871
4	roman.batygin@mail.ru	db/changelog/v11-insert-confirm-templates.xml	2021-12-02 13:19:09.287793	86	EXECUTED	8:ac750cdecedd028d1f3629593cceb1c7	update tableName=template		\N	3.7.0	data	\N	8425948871
5	roman.batygin@mail.ru	db/changelog/v11-insert-confirm-templates.xml	2021-12-02 13:19:09.29825	87	EXECUTED	8:70d0eda05e5fb375f77a1622946c58c8	update tableName=template		\N	3.7.0	data	\N	8425948871
6	roman.batygin@mail.ru	db/changelog/v11-insert-confirm-templates.xml	2021-12-02 13:19:09.316045	88	EXECUTED	8:7f4241acadb74297509e266467bec84b	update tableName=template		\N	3.7.0	data	\N	8425948871
1	roman.batygin@mail.ru	db/changelog/v12-changed-create-user-template-subject.xml	2021-12-02 13:19:09.33531	89	EXECUTED	8:25cba52bed49d283c86500c647bc8dff	update tableName=template		\N	3.7.0	data	\N	8425948871
1	roman.batygin@mail.ru	db/changelog/v13-update-new-user-template.xml	2021-12-02 13:19:09.353399	90	EXECUTED	8:6bc86c820e26e621064f1b1b19ec4221	update tableName=template		\N	3.7.0	data	\N	8425948871
1	roman.batygin@mail.ru	db/changelog/v14-update-reset-password-templates.xml	2021-12-02 13:19:09.37902	91	EXECUTED	8:822ef1921df6b444cc3afb6b2d2f43aa	update tableName=template		\N	3.7.0	data	\N	8425948871
2	roman.batygin@mail.ru	db/changelog/v14-update-reset-password-templates.xml	2021-12-02 13:19:09.393779	92	EXECUTED	8:f77f3c010200e11e8c8329b67f112fa5	update tableName=template		\N	3.7.0	data	\N	8425948871
3	roman.batygin@mail.ru	db/changelog/v14-update-reset-password-templates.xml	2021-12-02 13:19:09.416652	93	EXECUTED	8:69a62e52445c8ba0ebc7cc9c75e0e881	update tableName=template_parameter		\N	3.7.0	data	\N	8425948871
1	roman.batygin@email.ru	db/changelog/v15-add-uuid-unique-idx.xml	2022-12-09 13:05:09.103427	94	EXECUTED	8:44f0191e34c3aa54a9a1c1eec43d010a	addUniqueConstraint constraintName=email_uuid_unique_idx, tableName=email		\N	3.7.0	schema	\N	0565908745
insert_user_locked_template	roman.batygin@mail.ru	db/changelog/v16-insert-user-locked-templates.xml	2022-12-09 13:05:09.11998	95	EXECUTED	8:1af3dce8c6778bb3374a28a85a7f9a60	insert tableName=template		\N	3.7.0	data	\N	0565908745
insert_user_unlocked_template	roman.batygin@mail.ru	db/changelog/v16-insert-user-locked-templates.xml	2022-12-09 13:05:09.137951	96	EXECUTED	8:d02b91797e78c352a77422f1d9dfc575	insert tableName=template		\N	3.7.0	data	\N	0565908745
insert_user_locked_template_body	roman.batygin@mail.ru	db/changelog/v16-insert-user-locked-templates.xml	2022-12-09 13:05:09.170091	97	EXECUTED	8:34f269fe2f3e0e01c463cdd6af8f7940	update tableName=template		\N	3.7.0	data	\N	0565908745
insert_user_unlocked_template_body	roman.batygin@mail.ru	db/changelog/v16-insert-user-locked-templates.xml	2022-12-09 13:05:09.187827	98	EXECUTED	8:2e7fd9000ed9e6a0a122feada0dbafce	update tableName=template		\N	3.7.0	data	\N	0565908745
insert_new_email_template_parameter	roman.batygin@mail.ru	db/changelog/v17-insert-new-email-template-parameter.xml	2022-12-09 13:05:09.219466	99	EXECUTED	8:925f77e4b6f034d653cd08c95feabb97	insert tableName=template_parameter		\N	3.7.0	data	\N	0565908745
insert_new_email_template_parameter_into_change_email_template	roman.batygin@mail.ru	db/changelog/v17-insert-new-email-template-parameter.xml	2022-12-09 13:05:09.243929	100	EXECUTED	8:a044b74318a4df2bf462936a80f439e3	insert tableName=templates_parameters		\N	3.7.0	data	\N	0565908745
update_change_email_template_body_with_new_email	roman.batygin@mail.ru	db/changelog/v17-insert-new-email-template-parameter.xml	2022-12-09 13:05:09.290446	101	EXECUTED	8:815b3c8dcd34683dbdb2b5b9c2044691	update tableName=template		\N	3.7.0	data	\N	0565908745
delete_first_name_from_templates_parameters	roman.batygin@mail.ru	db/changelog/v18-remove-first-name-template-parameter.xml	2022-12-09 13:05:09.309658	102	EXECUTED	8:a7df2abba31a4e9a6ac11dc269492b81	delete tableName=templates_parameters		\N	3.7.0	data	\N	0565908745
delete_first_name_template_parameter	roman.batygin@mail.ru	db/changelog/v18-remove-first-name-template-parameter.xml	2022-12-09 13:05:09.343256	103	EXECUTED	8:c83577091cdc2e1cc1fdbd1301490837	delete tableName=template_parameter		\N	3.7.0	data	\N	0565908745
update_new_experiment_template_body	roman.batygin@mail.ru	db/changelog/v19-update-experiment-templates.xml	2022-12-09 13:05:09.381844	104	EXECUTED	8:21dd723dd236d23507e83e0cb7efaf26	update tableName=template		\N	3.7.0	data	\N	0565908745
update_error_experiment_template_body	roman.batygin@mail.ru	db/changelog/v19-update-experiment-templates.xml	2022-12-09 13:05:09.400082	105	EXECUTED	8:1b6d8891ab063267ccdf20bb39042b66	update tableName=template		\N	3.7.0	data	\N	0565908745
update_timeout_experiment_template_body	roman.batygin@mail.ru	db/changelog/v19-update-experiment-templates.xml	2022-12-09 13:05:09.424636	106	EXECUTED	8:103f28ecbbcec1c1736bc2fb3dbcf66b	update tableName=template		\N	3.7.0	data	\N	0565908745
update_finished_experiment_template_body	roman.batygin@mail.ru	db/changelog/v19-update-experiment-templates.xml	2022-12-09 13:05:09.440641	107	EXECUTED	8:7d7592e49673001aa948c333e7ef0643	update tableName=template		\N	3.7.0	data	\N	0565908745
update_in_progress_experiment_template_body	roman.batygin@mail.ru	db/changelog/v19-update-experiment-templates.xml	2022-12-09 13:05:09.457782	108	EXECUTED	8:cf8e731187a9bac08327f743c693c0d8	update tableName=template		\N	3.7.0	data	\N	0565908745
\.


--
-- TOC entry 2176 (class 0 OID 17115)
-- Dependencies: 186
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- TOC entry 2177 (class 0 OID 17118)
-- Dependencies: 187
-- Data for Name: email; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email (id, error_message, failed_attempts_to_sent, message, receiver, save_date, sender, sent_date, status, subject, uuid, tx_id, priority) FROM stdin;
5	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм Stacking</span>" была успешно создана. Ожидайте ответное письмо на <span>bat1238@yandex.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>83ebef65-8ae6-4950-ae2d-8073efb1c527</span></b>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-07-07 12:55:04.471	rbatsw@gmail.com	2018-07-07 12:55:12.014	SENT	Eca - service	0c3bdcf7-5e6d-40fd-870b-6d4515621bfa	\N	0
3	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм k - взвешенных ближайших соседей</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>2c1743bd-1400-4e45-a3a6-feaa5f266c23</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-07-07 02:12:09.919	rbatsw@gmail.com	2018-07-07 02:12:15.421	SENT	Eca - service	1734629a-683e-4193-8a27-68c546b3a226	\N	0
4	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм k - взвешенных ближайших соседей</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/2c1743bd-1400-4e45-a3a6-feaa5f266c23">http://localhost:8085/eca-service/experiment/download/2c1743bd-1400-4e45-a3a6-feaa5f266c23</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-07-07 02:13:34.965	rbatsw@gmail.com	2018-07-07 02:13:38.792	SENT	Eca - service	404815a8-a121-4637-99f8-e8d0f9011c03	\N	0
6	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм AdaBoost</span>" была успешно создана. Ожидайте ответное письмо на <span>bat1238@yandex.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>a9f2e05e-4b6f-40cb-aa3d-a181e8653423</span></b>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-07-07 12:57:16.737	rbatsw@gmail.com	2018-07-07 12:57:24.694	SENT	Eca - service	f27947c1-5a42-4d7d-b285-dd117f80da94	\N	0
7	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм Stacking</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/83ebef65-8ae6-4950-ae2d-8073efb1c527">http://localhost:8085/eca-service/experiment/download/83ebef65-8ae6-4950-ae2d-8073efb1c527</a>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-07-07 13:03:31.142	rbatsw@gmail.com	2018-07-07 13:03:36.986	SENT	Eca - service	0529bccd-7b2c-44ff-a96b-c5d96497ec64	\N	0
8	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм AdaBoost</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/a9f2e05e-4b6f-40cb-aa3d-a181e8653423">http://localhost:8085/eca-service/experiment/download/a9f2e05e-4b6f-40cb-aa3d-a181e8653423</a>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-07-07 13:28:45.586	rbatsw@gmail.com	2018-07-07 13:28:49.782	SENT	Eca - service	ecc58391-89a7-4d46-80dd-4be0fb836b37	\N	0
9	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Неоднородный ансамблевый алгоритм</span>" была успешно создана. Ожидайте ответное письмо на <span>bat1238@yandex.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>f5f81506-5e87-4e94-935f-3837f96609e8</span></b>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-07-07 13:38:28.35	rbatsw@gmail.com	2018-07-07 13:38:33.272	SENT	Eca - service	d8de81d8-c5e5-4848-9b3b-3f4e740ca170	\N	0
10	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    К сожалению, подобрать оптимальные параметры для эксперимента "<span>Неоднородный ансамблевый алгоритм</span>"\r\n    не удалось. В ходе построения эксперимента возникла ошибка.\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-07-07 16:02:10.819	rbatsw@gmail.com	2018-07-07 16:10:32.075	SENT	Eca - service	a24a76e9-9938-471d-a531-a8fb079bc4f9	\N	0
11	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Неоднородный ансамблевый алгоритм</span>" была успешно создана. Ожидайте ответное письмо на <span>bat1238@yandex.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>b41ad944-0712-4d3c-b9ab-395323492734</span></b>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-07-07 16:48:09.176	rbatsw@gmail.com	2018-07-07 16:48:20.275	SENT	Eca - service	3bbb9966-5bf8-422d-a984-f32712a13259	\N	0
12	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Неоднородный ансамблевый алгоритм</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/b41ad944-0712-4d3c-b9ab-395323492734">http://localhost:8085/eca-service/experiment/download/b41ad944-0712-4d3c-b9ab-395323492734</a>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-07-07 17:23:18.047	rbatsw@gmail.com	2018-07-07 17:23:23.739	SENT	Eca - service	774377fa-8907-4522-a72d-c26826615202	\N	0
13	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Модифицированный неоднородный ансамблевый алгоритм</span>" была успешно создана. Ожидайте ответное письмо на <span>bat1238@yandex.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>8ea92dcc-1c12-4c42-9f5c-8ace288f8a4c</span></b>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-07-07 17:27:59.265	rbatsw@gmail.com	2018-07-07 17:28:09.961	SENT	Eca - service	a3872eb6-e296-4d06-8fb4-b9ac0d6b4df9	\N	0
14	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Модифицированный неоднородный ансамблевый алгоритм</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/8ea92dcc-1c12-4c42-9f5c-8ace288f8a4c">http://localhost:8085/eca-service/experiment/download/8ea92dcc-1c12-4c42-9f5c-8ace288f8a4c</a>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-07-07 18:52:51.672	rbatsw@gmail.com	2018-07-07 18:52:54.958	SENT	Eca - service	5c73e5c9-4b1b-4867-949d-f5585fe821f3	\N	0
15	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Деревья решений</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>f44bec05-d21f-4a91-b4de-d4a9385afe76</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-07-19 23:20:23.695	rbatsw@gmail.com	2018-07-19 23:20:30.529	SENT	Eca - service	abfdbc7c-efaf-4e5c-aaaf-09ccd1440cd5	\N	0
16	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Деревья решений</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/f44bec05-d21f-4a91-b4de-d4a9385afe76">http://localhost:8085/eca-service/experiment/download/f44bec05-d21f-4a91-b4de-d4a9385afe76</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-07-19 23:21:11.767	rbatsw@gmail.com	2018-07-19 23:21:23.174	SENT	Eca - service	69ac7b7b-3ab2-424f-a291-296531fa09fa	\N	0
17	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>69f9a848-12ca-4ef1-ae01-9f9d76be7dfa</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-07-19 23:21:15.836	rbatsw@gmail.com	2018-07-19 23:21:25.219	SENT	Eca - service	392d548d-dc58-4ca6-8134-c7b136f49b48	\N	0
18	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>f192f0d7-1907-41e7-a7bb-3627888dcf83</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-07-19 23:21:24.542	rbatsw@gmail.com	2018-07-19 23:21:37.385	SENT	Eca - service	df9d75d2-fadd-4c94-acc1-276372ce695c	\N	0
19	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/69f9a848-12ca-4ef1-ae01-9f9d76be7dfa">http://localhost:8085/eca-service/experiment/download/69f9a848-12ca-4ef1-ae01-9f9d76be7dfa</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-07-19 23:22:02.751	rbatsw@gmail.com	2018-07-19 23:22:09.651	SENT	Eca - service	66d7156f-91e4-4cae-8df2-fc4a189a9308	\N	0
20	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/f192f0d7-1907-41e7-a7bb-3627888dcf83">http://localhost:8085/eca-service/experiment/download/f192f0d7-1907-41e7-a7bb-3627888dcf83</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-07-19 23:23:11.473	rbatsw@gmail.com	2018-07-19 23:23:21.852	SENT	Eca - service	5a612de1-9c89-49bd-ac6a-bdf88048cb53	\N	0
21	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>16c66bb5-7ddb-4758-9b47-176dca8a3c45</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-07-19 23:26:27.421	rbatsw@gmail.com	2018-07-19 23:26:34.409	SENT	Eca - service	6d3e7053-3435-4d22-92c2-0a673d945a88	\N	0
22	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Деревья решений</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>ac164a9d-3231-4d11-9a41-4ded68f7aa29</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-07-19 23:26:35.204	rbatsw@gmail.com	2018-07-19 23:26:46.539	SENT	Eca - service	5e82cee4-525f-4b26-9951-7c9ee958447d	\N	0
23	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/16c66bb5-7ddb-4758-9b47-176dca8a3c45">http://localhost:8085/eca-service/experiment/download/16c66bb5-7ddb-4758-9b47-176dca8a3c45</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-07-19 23:32:51.94	rbatsw@gmail.com	2018-07-19 23:32:59.117	SENT	Eca - service	d020d461-edc4-4a27-8ab7-8e4d9756b860	\N	0
24	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Деревья решений</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/ac164a9d-3231-4d11-9a41-4ded68f7aa29">http://localhost:8085/eca-service/experiment/download/ac164a9d-3231-4d11-9a41-4ded68f7aa29</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-07-19 23:32:51.963	rbatsw@gmail.com	2018-07-19 23:33:01.259	SENT	Eca - service	538e5eab-2aa0-44cf-8070-52fd3258c1e5	\N	0
25	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>3ee46188-229d-40ba-8b08-583f0233df24</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-08-23 21:18:52.019	rbatsw@gmail.com	2018-08-23 21:18:59.001	SENT	Eca - service	bc7ff1ad-25fc-4c17-8aa8-5ca3c4ad81c4	\N	0
27	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм Stacking</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>15f0c864-4f88-409e-afba-b23b30a1f2b6</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-08-23 21:19:09.392	rbatsw@gmail.com	2018-08-23 21:19:23.118	SENT	Eca - service	ec0d3c9a-671a-486e-884d-f390e49193f6	\N	0
26	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Неоднородный ансамблевый алгоритм</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>af286191-a46e-4ab7-bc60-dbb78b4e7252</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-08-23 21:19:00.309	rbatsw@gmail.com	2018-08-23 21:19:11.069	SENT	Eca - service	4fdc06d6-9e8d-4825-bc8f-179cd055e0d7	\N	0
28	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм k - взвешенных ближайших соседей</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>c323955d-eca8-4e59-9df3-c634cb9a9401</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-08-23 21:19:16.928	rbatsw@gmail.com	2018-08-23 21:19:25.296	SENT	Eca - service	2950e645-bacf-4773-b849-517b2a9f014b	\N	0
29	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>aa63de57-3ec2-48f9-b3d2-bd0951f82110</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-08-23 21:19:26.288	rbatsw@gmail.com	2018-08-23 21:19:37.362	SENT	Eca - service	c753f391-8f1e-4025-9be0-594a4ad52a98	\N	0
30	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/3ee46188-229d-40ba-8b08-583f0233df24">http://localhost:8085/eca-service/experiment/download/3ee46188-229d-40ba-8b08-583f0233df24</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-08-23 21:23:29.109	rbatsw@gmail.com	2018-08-23 21:23:39.639	SENT	Eca - service	96ca244e-a3b6-461c-b44c-43ec0afe5bd8	\N	0
31	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Неоднородный ансамблевый алгоритм</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/af286191-a46e-4ab7-bc60-dbb78b4e7252">http://localhost:8085/eca-service/experiment/download/af286191-a46e-4ab7-bc60-dbb78b4e7252</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-08-23 21:42:43.611	rbatsw@gmail.com	2018-08-23 21:42:52.469	SENT	Eca - service	4219ce6f-7078-4460-8b7a-4bfdf1ba0b8b	\N	0
32	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм Stacking</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/15f0c864-4f88-409e-afba-b23b30a1f2b6">http://localhost:8085/eca-service/experiment/download/15f0c864-4f88-409e-afba-b23b30a1f2b6</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-08-23 21:42:43.642	rbatsw@gmail.com	2018-08-23 21:42:54.572	SENT	Eca - service	c6aef4b1-116f-49ab-9e4c-04bc3bbd208d	\N	0
33	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм k - взвешенных ближайших соседей</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/c323955d-eca8-4e59-9df3-c634cb9a9401">http://localhost:8085/eca-service/experiment/download/c323955d-eca8-4e59-9df3-c634cb9a9401</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-08-23 21:42:43.66	rbatsw@gmail.com	2018-08-23 21:42:56.671	SENT	Eca - service	e18fcefb-5c4e-4140-85ae-75db2226dc00	\N	0
34	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/aa63de57-3ec2-48f9-b3d2-bd0951f82110">http://localhost:8085/eca-service/experiment/download/aa63de57-3ec2-48f9-b3d2-bd0951f82110</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-08-23 21:42:43.677	rbatsw@gmail.com	2018-08-23 21:42:58.718	SENT	Eca - service	ac914ddb-8f14-4092-8c8d-8c17359b2a65	\N	0
35	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм AdaBoost</span>" была успешно создана. Ожидайте ответное письмо на <span>bat1238@yandex.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>bf790ae5-16c9-42b7-9c7e-4bf70d43b170</span></b>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-08-23 22:53:43.355	rbatsw@gmail.com	2018-08-23 22:53:54.208	SENT	Eca - service	66688037-55d5-4a68-9026-9c6975a3fcbd	\N	0
36	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Модифицированный неоднородный ансамблевый алгоритм</span>" была успешно создана. Ожидайте ответное письмо на <span>bat1238@yandex.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>39e68b5d-f660-426e-a1b8-c0c98027460e</span></b>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-08-23 22:53:50.577	rbatsw@gmail.com	2018-08-23 22:53:56.246	SENT	Eca - service	d660c0bf-48f6-4997-97b3-aadeca4945c6	\N	0
37	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Нейронные сети</span>" была успешно создана. Ожидайте ответное письмо на <span>bat1238@yandex.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>fe65777a-8f0f-4ba0-a78d-933c8936449d</span></b>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-08-23 22:54:38.369	rbatsw@gmail.com	2018-08-23 22:54:49.348	SENT	Eca - service	c5fe3893-3c1b-43bd-a53e-0c93cfb3a69b	\N	0
38	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм AdaBoost</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/bf790ae5-16c9-42b7-9c7e-4bf70d43b170">http://localhost:8085/eca-service/experiment/download/bf790ae5-16c9-42b7-9c7e-4bf70d43b170</a>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-08-23 22:58:08.716	rbatsw@gmail.com	2018-08-23 22:58:12.121	SENT	Eca - service	a6ad99b6-e931-4829-8279-2833f46c56c1	\N	0
39	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Модифицированный неоднородный ансамблевый алгоритм</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/39e68b5d-f660-426e-a1b8-c0c98027460e">http://localhost:8085/eca-service/experiment/download/39e68b5d-f660-426e-a1b8-c0c98027460e</a>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-08-24 00:54:08.233	rbatsw@gmail.com	2018-08-24 00:54:23.804	SENT	Eca - service	50df6711-491f-46b7-a698-55bd77270270	\N	0
40	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Нейронные сети</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/fe65777a-8f0f-4ba0-a78d-933c8936449d">http://localhost:8085/eca-service/experiment/download/fe65777a-8f0f-4ba0-a78d-933c8936449d</a>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-08-24 00:54:08.546	rbatsw@gmail.com	2018-08-24 00:54:26.027	SENT	Eca - service	8170f8b0-505a-49e5-a9c0-fcf98a43f9d6	\N	0
41	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Roman</span>!\r\n</p>\r\n<p>\r\n    К сожалению, подобрать оптимальные параметры для эксперимента "<span>Алгоритм k - взвешенных ближайших соседей</span>"\r\n    не удалось. В ходе построения эксперимента возникла ошибка.\r\n</p>\r\n</body>\r\n</html>	test@mail.ru	2018-08-31 21:09:40.453	rbatsw@gmail.com	2018-08-31 21:09:51.404	SENT	Eca - service	60bf3fe5-6eac-42dd-9d47-6fe706972fd8	\N	0
42	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>545db521-2679-45be-8eda-82c9bffc10b1</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-09-17 14:19:34.352	rbatsw@gmail.com	2018-09-17 14:19:46.258	SENT	Eca - service	e1fcd3a3-d2a8-46d7-8c05-78e9edf5bade	\N	0
43	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://localhost:8085/eca-service/experiment/download/545db521-2679-45be-8eda-82c9bffc10b1">http://localhost:8085/eca-service/experiment/download/545db521-2679-45be-8eda-82c9bffc10b1</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-09-17 14:20:56.578	rbatsw@gmail.com	2018-09-17 14:21:08.398	SENT	Eca - service	5021afa1-17b4-49b3-bf03-48ac7e40cc5e	\N	0
44	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>55c2fee2-bd71-4119-8d81-5570cfee9fe2</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-29 02:11:29.62	rbatsw@gmail.com	2018-12-29 02:11:39.475	SENT	Eca - service	12249d7b-2226-4143-91cf-039c0b905516	\N	0
45	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм k - взвешенных ближайших соседей</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>57baf95c-7f64-4c77-8d11-6a00a1550f23</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-29 02:11:36.57	rbatsw@gmail.com	2018-12-29 02:11:51.658	SENT	Eca - service	d54890af-b13e-4515-9822-5f1d948f0a88	\N	0
47	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/55c2fee2-bd71-4119-8d81-5570cfee9fe2">http://192.168.99.100:8085/eca-server/experiment/download/55c2fee2-bd71-4119-8d81-5570cfee9fe2</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-29 02:13:41.248	rbatsw@gmail.com	2018-12-29 02:13:46.395	SENT	Eca - service	b4d8fa58-76e8-42e9-a51f-1dde35d33f0f	\N	0
46	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Неоднородный ансамблевый алгоритм</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>5c54f193-f395-424b-a6cc-2b3b4a1494ab</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-29 02:11:51.716	rbatsw@gmail.com	2018-12-29 02:12:03.837	SENT	Eca - service	cdf7f2fc-ab60-4e11-b531-c4bd7431cb31	\N	0
48	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм k - взвешенных ближайших соседей</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/57baf95c-7f64-4c77-8d11-6a00a1550f23">http://192.168.99.100:8085/eca-server/experiment/download/57baf95c-7f64-4c77-8d11-6a00a1550f23</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-29 02:22:11.023	rbatsw@gmail.com	2018-12-29 02:22:19.312	SENT	Eca - service	5e368f04-5cb4-402c-8b79-a724ce8832ae	\N	0
49	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Неоднородный ансамблевый алгоритм</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/5c54f193-f395-424b-a6cc-2b3b4a1494ab">http://192.168.99.100:8085/eca-server/experiment/download/5c54f193-f395-424b-a6cc-2b3b4a1494ab</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-29 02:22:11.202	rbatsw@gmail.com	2018-12-29 02:22:21.551	SENT	Eca - service	b91b3bd4-b082-42b2-b652-b8e89cf1c81a	\N	0
50	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Модифицированный неоднородный ансамблевый алгоритм</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>dd8d1320-b6eb-4616-8d8a-a29b8df526d0</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-29 11:13:37.003	rbatsw@gmail.com	2018-12-29 11:13:48.422	SENT	Eca - service	0e966283-2ce7-4c27-b76a-0944591e26f8	\N	0
51	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>eba4e0a6-c04a-4011-a06f-a5fdb5fee7a6</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-29 11:13:44.016	rbatsw@gmail.com	2018-12-29 11:13:50.601	SENT	Eca - service	a97d9686-9fa8-4be5-bc28-655dd42523a0	\N	0
52	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    К сожалению, подобрать оптимальные параметры для эксперимента "<span>Модифицированный неоднородный ансамблевый алгоритм</span>"\r\n    не удалось. В ходе построения эксперимента возникла ошибка.\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-29 11:31:59.328	rbatsw@gmail.com	2018-12-29 11:32:03.634	SENT	Eca - service	ad7b51a5-e756-4fe8-be16-b8f93443566b	\N	0
53	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/eba4e0a6-c04a-4011-a06f-a5fdb5fee7a6">http://192.168.99.100:8085/eca-server/experiment/download/eba4e0a6-c04a-4011-a06f-a5fdb5fee7a6</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-29 11:37:03.568	rbatsw@gmail.com	2018-12-29 11:37:06.212	SENT	Eca - service	b5cd5286-a6b1-427e-a8de-5cb7067bd545	\N	0
86	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм AdaBoost</span>" была успешно создана. Ожидайте ответное письмо на <span>bat1238@yandex.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>aee50ca3-e207-4329-8001-2bca87765470</span></b>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-12-29 20:10:10.056	rbatsw@gmail.com	2018-12-29 20:10:18.268	SENT	Eca - service	1cca9ff9-7351-41f3-85d5-76b2ea8d3a17	\N	0
87	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм AdaBoost</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/aee50ca3-e207-4329-8001-2bca87765470">http://192.168.99.100:8085/eca-server/experiment/download/aee50ca3-e207-4329-8001-2bca87765470</a>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-12-29 20:12:49.731	rbatsw@gmail.com	2018-12-29 20:13:00.68	SENT	Eca - service	3712b154-c868-4c45-a084-a7e1501ff35a	\N	0
88	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Модифицированный неоднородный ансамблевый алгоритм</span>" была успешно создана. Ожидайте ответное письмо на <span>bat1238@yandex.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>44930b5e-8aff-4b15-918a-0e4d2d684e4c</span></b>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-12-29 20:14:18.619	rbatsw@gmail.com	2018-12-29 20:14:23.149	SENT	Eca - service	37a1c128-2774-41e4-abce-98dc04b341be	\N	0
89	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Модифицированный неоднородный ансамблевый алгоритм</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/44930b5e-8aff-4b15-918a-0e4d2d684e4c">http://192.168.99.100:8085/eca-server/experiment/download/44930b5e-8aff-4b15-918a-0e4d2d684e4c</a>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-12-29 20:19:50.646	rbatsw@gmail.com	2018-12-29 20:19:56.574	SENT	Eca - service	851dbcf6-4bbd-4611-8d96-70f7dd2d0d8a	\N	0
90	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" была успешно создана. Ожидайте ответное письмо на <span>bat1238@yandex.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>1261d17d-818f-483f-b495-2de7b1c657de</span></b>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-12-29 20:22:05.917	rbatsw@gmail.com	2018-12-29 20:22:09.238	SENT	Eca - service	506a9bf3-58b9-4973-92b7-328c1efd981b	\N	0
91	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/1261d17d-818f-483f-b495-2de7b1c657de">http://192.168.99.100:8085/eca-server/experiment/download/1261d17d-818f-483f-b495-2de7b1c657de</a>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2018-12-29 20:23:47.213	rbatsw@gmail.com	2018-12-29 20:23:51.638	SENT	Eca - service	6a281608-93c4-45d4-b07a-dca64e42583a	\N	0
92	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>780993ff-4309-4c8f-9058-ceda3b447040</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-29 20:27:36.864	rbatsw@gmail.com	2018-12-29 20:27:44.508	SENT	Eca - service	8c72c485-2118-4438-8ef0-8cefcbf83f68	\N	0
93	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/780993ff-4309-4c8f-9058-ceda3b447040">http://192.168.99.100:8085/eca-server/experiment/download/780993ff-4309-4c8f-9058-ceda3b447040</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-29 20:36:35.057	rbatsw@gmail.com	2018-12-29 20:36:47.385	SENT	Eca - service	2456c064-7042-4862-bc6d-b95809a2e9f7	\N	0
94	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Неоднородный ансамблевый алгоритм</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>ce20c83d-5e96-4c1c-a43b-fc83543b1bc1</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-29 20:39:29.474	rbatsw@gmail.com	2018-12-29 20:39:39.955	SENT	Eca - service	b7bfaaea-fcb8-4973-9dca-334a32431b7c	\N	0
95	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Неоднородный ансамблевый алгоритм</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/ce20c83d-5e96-4c1c-a43b-fc83543b1bc1">http://192.168.99.100:8085/eca-server/experiment/download/ce20c83d-5e96-4c1c-a43b-fc83543b1bc1</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-29 20:52:42.801	rbatsw@gmail.com	2018-12-29 20:52:52.979	SENT	Eca - service	3fc7e9ab-5ccb-404a-8e10-cabcc0440c31	\N	0
96	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>a66cac7c-5dc7-415a-a2eb-8fdc099365d2</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 14:50:40.85	rbatsw@gmail.com	2018-12-30 14:50:45.757	SENT	Eca - service	945fcf6f-4d4d-4095-9eb2-b9e83993cc2e	\N	0
97	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Неоднородный ансамблевый алгоритм</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>5d7e60d4-e366-4ede-986c-a89b8e425c99</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 14:50:49.151	rbatsw@gmail.com	2018-12-30 14:50:57.872	SENT	Eca - service	5ed9fe8c-b3ce-4a0c-8457-7337d05ac0f1	\N	0
98	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм AdaBoost</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>45800054-b061-43ec-9b55-4c8b71b63790</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 14:50:56.761	rbatsw@gmail.com	2018-12-30 14:51:10.001	SENT	Eca - service	ba54d80b-37c4-443f-bad6-f56117f94084	\N	0
99	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/a66cac7c-5dc7-415a-a2eb-8fdc099365d2">http://192.168.99.100:8085/eca-server/experiment/download/a66cac7c-5dc7-415a-a2eb-8fdc099365d2</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 14:51:19.938	rbatsw@gmail.com	2018-12-30 14:51:22.177	SENT	Eca - service	8f60e523-3461-4d5c-80a7-a9d4018cb1e6	\N	0
100	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм AdaBoost</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>e5abc91a-45bd-4db3-ac0d-93119c2d6eca</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 14:53:05.242	rbatsw@gmail.com	2018-12-30 14:53:14.3	SENT	Eca - service	bf349010-65a9-4a9e-b503-3a171b587a0b	\N	0
101	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм Stacking</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>2aca7d85-4649-45a5-8424-cb240c5bc8b9</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 14:53:16.314	rbatsw@gmail.com	2018-12-30 14:53:26.394	SENT	Eca - service	cf8e3745-2741-4010-9854-f57d6e30a6e8	\N	0
104	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм AdaBoost</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/e5abc91a-45bd-4db3-ac0d-93119c2d6eca">http://192.168.99.100:8085/eca-server/experiment/download/e5abc91a-45bd-4db3-ac0d-93119c2d6eca</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 14:56:54.517	rbatsw@gmail.com	2018-12-30 14:56:58.208	SENT	Eca - service	14a2be71-a259-4e13-b331-19dfaeba5e7d	\N	0
103	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм AdaBoost</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/45800054-b061-43ec-9b55-4c8b71b63790">http://192.168.99.100:8085/eca-server/experiment/download/45800054-b061-43ec-9b55-4c8b71b63790</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 14:55:11.198	rbatsw@gmail.com	2018-12-30 14:55:23.463	SENT	Eca - service	0d000528-683f-485f-81fc-f0aef629f8d3	\N	0
102	Mail server connection failed; nested exception is javax.mail.MessagingException: Could not connect to SMTP host: smtp.gmail.com, port: 25, response: 421. Failed messages: javax.mail.MessagingException: Could not connect to SMTP host: smtp.gmail.com, port: 25, response: 421	1	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Неоднородный ансамблевый алгоритм</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/5d7e60d4-e366-4ede-986c-a89b8e425c99">http://192.168.99.100:8085/eca-server/experiment/download/5d7e60d4-e366-4ede-986c-a89b8e425c99</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 14:55:11.052	rbatsw@gmail.com	2018-12-30 14:55:35.641	SENT	Eca - service	fe33de32-41b5-4235-b7e5-e4f26f0957ab	\N	0
149	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    К сожалению, подобрать оптимальные параметры для эксперимента "<span>Случайные леса</span>"\r\n    не удалось. В ходе построения эксперимента возникла ошибка.\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2019-01-05 19:31:32.695	rbatsw@gmail.com	2019-01-05 19:31:45.2	SENT	Eca - service	fe6b6a4e-ba01-4124-9147-be1ea4d6b4c1	\N	0
150	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>3595a7e8-5d9b-4232-821b-466d1e64bd15</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-05 19:36:15.956	rbatsw@gmail.com	2019-01-05 19:36:27.565	SENT	Eca - service	533764ae-0857-471c-847b-4871f273d1ef	\N	0
105	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм Stacking</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/2aca7d85-4649-45a5-8424-cb240c5bc8b9">http://192.168.99.100:8085/eca-server/experiment/download/2aca7d85-4649-45a5-8424-cb240c5bc8b9</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 14:56:54.69	rbatsw@gmail.com	2018-12-30 14:57:00.344	SENT	Eca - service	01859210-d4e6-4c1e-bf06-6d24bedb3c9a	\N	0
106	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Модифицированный неоднородный ансамблевый алгоритм</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>dcb9e472-43b5-496e-9cb0-c7547b9f3aec</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 15:14:06.755	rbatsw@gmail.com	2018-12-30 15:14:13.569	SENT	Eca - service	cd7a5b9d-1e4b-480b-b4a7-f80308ffa915	\N	0
107	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>32c1270b-7212-4f0e-9c65-c21da26f6830</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 15:16:42.076	rbatsw@gmail.com	2018-12-30 15:16:45.856	SENT	Eca - service	177d9033-28af-41c0-89fc-60e4c1d76d57	\N	0
108	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Модифицированный неоднородный ансамблевый алгоритм</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/dcb9e472-43b5-496e-9cb0-c7547b9f3aec">http://192.168.99.100:8085/eca-server/experiment/download/dcb9e472-43b5-496e-9cb0-c7547b9f3aec</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 15:17:28.708	rbatsw@gmail.com	2018-12-30 15:17:38.078	SENT	Eca - service	f4c2218e-f5be-41f6-8932-65d348c06ac0	\N	0
109	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/32c1270b-7212-4f0e-9c65-c21da26f6830">http://192.168.99.100:8085/eca-server/experiment/download/32c1270b-7212-4f0e-9c65-c21da26f6830</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 15:19:28.056	rbatsw@gmail.com	2018-12-30 15:19:30.428	SENT	Eca - service	10aa1149-8ff8-472b-a339-36140abdf263	\N	0
110	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Модифицированный неоднородный ансамблевый алгоритм</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>42b55ed5-91d3-4f35-8800-a2644274ead6</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 15:22:48.623	rbatsw@gmail.com	2018-12-30 15:22:52.8	SENT	Eca - service	c6b5a84d-e14d-43e5-a442-f0fcbcc434cb	\N	0
111	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Модифицированный неоднородный ансамблевый алгоритм</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/42b55ed5-91d3-4f35-8800-a2644274ead6">http://192.168.99.100:8085/eca-server/experiment/download/42b55ed5-91d3-4f35-8800-a2644274ead6</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 17:50:47.436	rbatsw@gmail.com	2018-12-30 17:50:58.74	SENT	Eca - service	f05c17d2-a969-4b72-9d83-be001cc488c7	\N	0
112	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм Stacking</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>ec2d4fef-5f58-4e79-b3b8-f9a1efca4464</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 21:31:00.55	rbatsw@gmail.com	2018-12-30 21:31:07.387	SENT	Eca - service	70d3e8c7-4472-4ac5-95ac-ad54f5e40f8f	\N	0
113	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>18969954-34a5-4bef-a80b-65e7d491a088</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 21:35:52.006	rbatsw@gmail.com	2018-12-30 21:35:59.819	SENT	Eca - service	61569e65-8230-4c82-9aa6-b7f38701811f	\N	0
114	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм Stacking</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/ec2d4fef-5f58-4e79-b3b8-f9a1efca4464">http://192.168.99.100:8085/eca-server/experiment/download/ec2d4fef-5f58-4e79-b3b8-f9a1efca4464</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 21:36:03.987	rbatsw@gmail.com	2018-12-30 21:36:12.15	SENT	Eca - service	94753f48-9b73-49c7-aba2-ffc6d3357afa	\N	0
115	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/18969954-34a5-4bef-a80b-65e7d491a088">http://192.168.99.100:8085/eca-server/experiment/download/18969954-34a5-4bef-a80b-65e7d491a088</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2018-12-30 21:51:26.711	rbatsw@gmail.com	2018-12-30 21:51:37.152	SENT	Eca - service	edd95b61-2505-4386-85ae-64a5d8b56335	\N	0
116	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Неоднородный ансамблевый алгоритм</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mai.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>48ec4195-3363-486f-8ad5-cba3382a933f</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mai.ru	2018-12-31 13:21:29.161	rbatsw@gmail.com	2018-12-31 13:21:34.384	SENT	Eca - service	ee7c1c06-4d03-4fb7-91b0-f47070724ce7	\N	0
117	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм AdaBoost</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mai.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>558c7d2f-8e24-48da-bb49-002f35e4ba4c</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mai.ru	2018-12-31 13:23:00.035	rbatsw@gmail.com	2018-12-31 13:23:08.464	SENT	Eca - service	a2f6515d-b63c-406d-909f-3e879f07d943	\N	0
118	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Неоднородный ансамблевый алгоритм</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/48ec4195-3363-486f-8ad5-cba3382a933f">http://192.168.99.100:8085/eca-server/experiment/download/48ec4195-3363-486f-8ad5-cba3382a933f</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mai.ru	2018-12-31 13:24:35.866	rbatsw@gmail.com	2018-12-31 13:24:40.87	SENT	Eca - service	cfde9aa7-22c7-4a74-92ae-c9ce45b62830	\N	0
119	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм AdaBoost</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/558c7d2f-8e24-48da-bb49-002f35e4ba4c">http://192.168.99.100:8085/eca-server/experiment/download/558c7d2f-8e24-48da-bb49-002f35e4ba4c</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mai.ru	2018-12-31 13:25:53.461	rbatsw@gmail.com	2018-12-31 13:26:03.142	SENT	Eca - service	cf3009d6-5698-49c4-8710-8a2d5a034333	\N	0
120	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Модифицированный неоднородный ансамблевый алгоритм</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mai.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>bb7ca36c-dbd3-4c11-84f5-84381ab144f7</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mai.ru	2018-12-31 13:26:43.233	rbatsw@gmail.com	2018-12-31 13:26:55.595	SENT	Eca - service	e349ef02-203a-4b20-a3fb-717c4ebb643a	\N	0
121	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм Stacking</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mai.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>c9f77b20-5207-4b16-a288-0ba9c2597af7</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mai.ru	2018-12-31 13:27:17.832	rbatsw@gmail.com	2018-12-31 13:27:27.646	SENT	Eca - service	7112fa7b-d0a0-406c-a297-88b7936e49ec	\N	0
122	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Модифицированный неоднородный ансамблевый алгоритм</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/bb7ca36c-dbd3-4c11-84f5-84381ab144f7">http://192.168.99.100:8085/eca-server/experiment/download/bb7ca36c-dbd3-4c11-84f5-84381ab144f7</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mai.ru	2018-12-31 13:30:03.867	rbatsw@gmail.com	2018-12-31 13:30:10.333	SENT	Eca - service	ea0c91b3-a8fc-4a88-81f8-c7dd72f2bd2c	\N	0
123	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм Stacking</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/c9f77b20-5207-4b16-a288-0ba9c2597af7">http://192.168.99.100:8085/eca-server/experiment/download/c9f77b20-5207-4b16-a288-0ba9c2597af7</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mai.ru	2018-12-31 13:30:55.128	rbatsw@gmail.com	2018-12-31 13:31:02.745	SENT	Eca - service	e60bb803-223f-4dbf-8c99-f1c97b3e1d0e	\N	0
124	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Деревья решений</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>089c6cc6-71cd-41d5-9d11-b5db0b0c7856</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-04 03:06:53.68	rbatsw@gmail.com	2019-01-04 03:07:07.439	SENT	Eca - service	06567523-7382-4c18-9178-81b66e71bfe4	\N	0
125	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Нейронные сети</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>0210a1f2-39ed-425f-ba7e-dd25ea2a7008</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-04 03:07:06.001	rbatsw@gmail.com	2019-01-04 03:07:19.617	SENT	Eca - service	fda22437-e548-4149-a263-7e313416e36e	\N	0
126	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Деревья решений</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/089c6cc6-71cd-41d5-9d11-b5db0b0c7856">http://192.168.99.100:8085/eca-server/experiment/download/089c6cc6-71cd-41d5-9d11-b5db0b0c7856</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-04 03:07:11.987	rbatsw@gmail.com	2019-01-04 03:07:21.83	SENT	Eca - service	e4d5afad-5e93-4723-a0b8-c2afaa399f04	\N	0
127	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Деревья решений</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>dad423b1-d809-4d30-9ecb-c460b2de79d3</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-04 03:07:31.449	rbatsw@gmail.com	2019-01-04 03:07:34.13	SENT	Eca - service	ed80b4de-abc3-468d-8a23-87493f1a8832	\N	0
128	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Нейронные сети</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>fef7fcc6-1952-47bb-80a8-1e801c6ae094</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-04 03:07:46.365	rbatsw@gmail.com	2019-01-04 03:07:56.232	SENT	Eca - service	65477d32-0475-47b8-923b-b91f7d2cefa8	\N	0
129	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм k - взвешенных ближайших соседей</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>d0d09f53-da20-4afa-aa34-ccb0ad4fe082</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-04 03:07:55.922	rbatsw@gmail.com	2019-01-04 03:08:08.352	SENT	Eca - service	ae2c7ff5-449b-447a-b0b2-d8e9b49637ba	\N	0
130	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм k - взвешенных ближайших соседей</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>435a8826-e5fc-42d6-ac4b-5898f5900c4d</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-04 03:08:05.132	rbatsw@gmail.com	2019-01-04 03:08:10.441	SENT	Eca - service	7843f7be-6b77-47df-90e4-fa60430313ed	\N	0
131	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Деревья решений</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>a984aaca-5719-47de-9485-a1ef2173f754</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-04 03:08:29.23	rbatsw@gmail.com	2019-01-04 03:08:32.653	SENT	Eca - service	2cb4d7f0-c3a3-4010-85db-0cba3bf1063a	\N	0
132	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм k - взвешенных ближайших соседей</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>c6f04c75-3294-4bca-a7ea-5190179809fc</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-04 03:08:38.059	rbatsw@gmail.com	2019-01-04 03:08:44.745	SENT	Eca - service	8d4b8d17-3383-4fea-89af-124a1e9b98f2	\N	0
133	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Нейронные сети</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/0210a1f2-39ed-425f-ba7e-dd25ea2a7008">http://192.168.99.100:8085/eca-server/experiment/download/0210a1f2-39ed-425f-ba7e-dd25ea2a7008</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-04 03:27:12.054	rbatsw@gmail.com	2019-01-04 03:27:17.828	SENT	Eca - service	3955bfc7-37e5-4b0f-929e-5c2f978ce3ad	\N	0
134	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Деревья решений</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/dad423b1-d809-4d30-9ecb-c460b2de79d3">http://192.168.99.100:8085/eca-server/experiment/download/dad423b1-d809-4d30-9ecb-c460b2de79d3</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-04 03:27:12.19	rbatsw@gmail.com	2019-01-04 03:27:20.081	SENT	Eca - service	7e02c2b4-43ff-428a-ae16-69df30de6c8d	\N	0
135	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Нейронные сети</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/fef7fcc6-1952-47bb-80a8-1e801c6ae094">http://192.168.99.100:8085/eca-server/experiment/download/fef7fcc6-1952-47bb-80a8-1e801c6ae094</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-04 17:50:34.099	rbatsw@gmail.com	2019-01-04 17:50:40.944	SENT	Eca - service	7cacc3d0-c7bd-4705-9aaf-859435bc508d	\N	0
136	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм k - взвешенных ближайших соседей</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/d0d09f53-da20-4afa-aa34-ccb0ad4fe082">http://192.168.99.100:8085/eca-server/experiment/download/d0d09f53-da20-4afa-aa34-ccb0ad4fe082</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-04 17:50:34.523	rbatsw@gmail.com	2019-01-04 17:50:43.268	SENT	Eca - service	be0eb967-7a8b-4cba-80e7-c1e07bfe5a23	\N	0
137	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм k - взвешенных ближайших соседей</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/435a8826-e5fc-42d6-ac4b-5898f5900c4d">http://192.168.99.100:8085/eca-server/experiment/download/435a8826-e5fc-42d6-ac4b-5898f5900c4d</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-04 17:50:34.663	rbatsw@gmail.com	2019-01-04 17:50:45.466	SENT	Eca - service	c22d829c-fcfa-4266-89df-ef3f6ebd3b7c	\N	0
138	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Деревья решений</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/a984aaca-5719-47de-9485-a1ef2173f754">http://192.168.99.100:8085/eca-server/experiment/download/a984aaca-5719-47de-9485-a1ef2173f754</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-04 17:50:34.818	rbatsw@gmail.com	2019-01-04 17:50:47.681	SENT	Eca - service	c69dbc45-93a9-41c0-8934-b36699db3cad	\N	0
139	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм k - взвешенных ближайших соседей</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/c6f04c75-3294-4bca-a7ea-5190179809fc">http://192.168.99.100:8085/eca-server/experiment/download/c6f04c75-3294-4bca-a7ea-5190179809fc</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-04 17:50:34.975	rbatsw@gmail.com	2019-01-04 17:50:49.913	SENT	Eca - service	f8dfc813-ec10-4788-912f-62f668f3076e	\N	0
140	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Неоднородный ансамблевый алгоритм</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>4ce5b6d8-84d1-4457-b6c7-f56b844c4c4f</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-05 17:24:36.767	rbatsw@gmail.com	2019-01-05 17:24:40.898	SENT	Eca - service	5fb15d6a-0c41-43d7-b0ea-c95533888531	\N	0
141	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм k - взвешенных ближайших соседей</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>99774cf5-f57d-4ad5-b94f-3f99fed45ce9</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-05 17:26:29.907	rbatsw@gmail.com	2019-01-05 17:26:33.125	SENT	Eca - service	84d3ae21-f75c-424d-a263-f5ef4e7177ae	\N	0
142	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм AdaBoost</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>cc7e1f54-cb4c-4a9c-839b-df48a6f6c7b2</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-05 17:26:44.043	rbatsw@gmail.com	2019-01-05 17:26:55.315	SENT	Eca - service	99db2822-a9f1-4a33-8b1f-dc99f1b35ba3	\N	0
143	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм Stacking</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>30294879-e9cf-4c2a-9f14-321b7c961fc7</span></b>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-05 17:50:33.258	rbatsw@gmail.com	2019-01-05 17:50:38.51	SENT	Eca - service	1bc25bde-adf6-4371-ac52-c02a20650b71	\N	0
144	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Случайные леса</span>" была успешно создана. Ожидайте ответное письмо на <span>bat1238@yandex.ru</span>.\r\n</p>\r\n<p>\r\n    Идентификатор вашей заявки: <b><span>a8ba38f2-37b2-48d9-a438-4336dc69d629</span></b>\r\n</p>\r\n</body>\r\n</html>	bat1238@yandex.ru	2019-01-05 17:55:57.006	rbatsw@gmail.com	2019-01-05 17:56:01.057	SENT	Eca - service	b1e8ea2b-cd1f-4674-a312-b8a4f1181f6e	\N	0
145	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    К сожалению, подобрать оптимальные параметры для эксперимента "<span>Неоднородный ансамблевый алгоритм</span>"\r\n    не удалось. В ходе построения эксперимента возникла ошибка.\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-05 18:54:00.928	rbatsw@gmail.com	2019-01-05 18:54:04.933	SENT	Eca - service	daf5ee9c-7747-4bf0-8b7f-5c2d13fd5a10	\N	0
146	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм k - взвешенных ближайших соседей</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/99774cf5-f57d-4ad5-b94f-3f99fed45ce9">http://192.168.99.100:8085/eca-server/experiment/download/99774cf5-f57d-4ad5-b94f-3f99fed45ce9</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-05 19:31:32.052	rbatsw@gmail.com	2019-01-05 19:31:38.455	SENT	Eca - service	342c6071-c179-4fb5-989e-51e38e2c8e1a	\N	0
147	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм AdaBoost</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/cc7e1f54-cb4c-4a9c-839b-df48a6f6c7b2">http://192.168.99.100:8085/eca-server/experiment/download/cc7e1f54-cb4c-4a9c-839b-df48a6f6c7b2</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-05 19:31:32.392	rbatsw@gmail.com	2019-01-05 19:31:40.797	SENT	Eca - service	b0b4301a-7a81-423c-b92e-b3057a8221f8	\N	0
148	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\r\n    "<span>Алгоритм Stacking</span>" был успешно построен.\r\n    Результаты доступны по ссылке <a href="http://192.168.99.100:8085/eca-server/experiment/download/30294879-e9cf-4c2a-9f14-321b7c961fc7">http://192.168.99.100:8085/eca-server/experiment/download/30294879-e9cf-4c2a-9f14-321b7c961fc7</a>\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-05 19:31:32.545	rbatsw@gmail.com	2019-01-05 19:31:42.961	SENT	Eca - service	5c511a1d-61b8-498c-838f-05b1b7c626db	\N	0
151	\N	0	<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset="UTF-8">\r\n</head>\r\n<body>\r\n<p>\r\n    Здравствуйте, <span>Роман</span>!\r\n</p>\r\n<p>\r\n    Было превышено максимальное допустимое время для построения эксперимента "<span>Случайные леса</span>".\r\n    Максимальное допустимое время составляет <span>5</span> часов.\r\n</p>\r\n</body>\r\n</html>	roman.batygin@mail.ru	2019-01-06 14:18:36.679	rbatsw@gmail.com	2019-01-06 14:18:41.937	SENT	Eca - service	54b2a280-c9fe-477e-820a-f5e6778d42ad	\N	0
152	\N	0	<!DOCTYPE html>\n<html>\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Здравствуйте, <span>Roman</span>!\n</p>\n<p>\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\n    "<span>Случайные леса</span>" была успешно создана. Ожидайте ответное письмо на <span>roman.batygin@mail.ru</span>.\n</p>\n<p>\n    Идентификатор вашей заявки: <b><span>f3ccb2f5-8765-4895-9b61-5ca300119ea4</span></b>\n</p>\n</body>\n</html>	roman.batygin@mail.ru	2019-02-23 00:20:23.718	rbatsw@gmail.com	2019-02-23 00:20:38.294	SENT	Eca - service	7a5bc1a4-8f92-4ea9-a126-822f31250767	\N	0
153	\N	0	<!DOCTYPE html>\n<html>\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Здравствуйте, <span>Roman</span>!\n</p>\n<p>\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\n    "<span>Случайные леса</span>" был успешно построен.\n    Результаты доступны по ссылке <a href="http://localhost:8080/eca-server/experiment/download/f3ccb2f5-8765-4895-9b61-5ca300119ea4">http://localhost:8080/eca-server/experiment/download/f3ccb2f5-8765-4895-9b61-5ca300119ea4</a>\n</p>\n</body>\n</html>	roman.batygin@mail.ru	2019-02-23 00:22:38.037	rbatsw@gmail.com	2019-02-23 00:22:40.547	SENT	Eca - service	4183acc9-6658-47c3-a00a-b0c0b12f118b	\N	0
\.


--
-- TOC entry 2179 (class 0 OID 17127)
-- Dependencies: 189
-- Data for Name: regex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regex (id, created, regex_code, regex, description) FROM stdin;
154	2021-02-16 19:37:02.579973	INTEGER	[0-9]+	Регулярное выражение для целого числа
\.


--
-- TOC entry 2180 (class 0 OID 17133)
-- Dependencies: 190
-- Data for Name: template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.template (id, created, template_code, description, template_subject, template_body) FROM stdin;
170	2021-02-16 19:37:03.116475	TFA_CODE	Сообщение с кодом подтверждения для 2FA	Код подтверждения	<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Ваш код двухфакторной атунтификации: <b>${tfaCode}</b>\n</p>\n</body>\n</html>\n
173	2021-04-08 14:41:04.062087	CHANGE_PASSWORD	Сообщение с подтверждением изменения пароля в личном кабинете Eca - service	Подтверждение изменения пароля в личном кабинете Eca - service	<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Здравствуйте!\n</p>\n<p>\n    Вы запросили смену текущего пароля в личном кабинете Eca - service. Если Вы не делали такого запроса, пожалуйста, не отвечайте на данное сообщение.\n</p>\n<p>\n    Если вы подтверждаете свое желание изменить пароль, пожалуйста, перейдите по ссылке: <a href="${changePasswordUrl}">${changePasswordUrl}</a>\n</p>\n<p>\n    Ссылка действительна в течении ${validityMinutes}-ти минут.\n</p>\n</body>\n</html>\n
178	2021-12-02 13:19:09.238385	EMAIL_CHANGED	Сообщение с успешным изменением Email в личном кабинете Eca - service	Изменен Email от вашего аккаунта	<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Здравствуйте!\n</p>\n<p>\n    Этот электронный адрес был успешно привязан к вашему аккаунту в Eca - service.\n</p>\n</body>\n</html>\n
169	2021-02-16 19:37:03.071858	RESET_PASSWORD	Сообщение со ссылкой для сброса пароля	Сброс пароля	<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Здравствуйте, для сброса пароля перейдите по ссылке:\n</p>\n<p>\n    <a href="${resetPasswordUrl}">${resetPasswordUrl}</a>\n</p>\n<p>\n    Ссылка действительна в течении ${validityMinutes}-ти минут.\n</p>\n</body>\n</html>\n
171	2021-02-16 19:37:03.150587	NEW_USER	Сообщение с учетными данными нового пользователя	Доступ к Eca - service	<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Здравствуйте, вам предоставлен доступ к системе Eca - service.\n</p>\n<p>\n    Логин: <b>${userName}</b>\n</p>\n<p>\n    Временный пароль: <b>${password}</b>\n</p>\n</body>\n</html>\n
179	2021-12-02 13:19:09.259948	PASSWORD_CHANGED	Сообщение с успешным изменением пароля в личном кабинете Eca - service	Изменен пароль от вашего аккаунта	<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Здравствуйте!\n</p>\n<p>\n    Пароль от вашего аккаунта в Eca - service был успешно изменен.\n</p>\n</body>\n</html>\n
165	2021-02-16 19:37:02.760674	NEW_EXPERIMENT	Сообщение о новом эксперименте	Создан новый эксперимент	<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Здравствуйте!\n</p>\n<p>\n    Заявка на эксперимент для автоматического подбора оптимальных параметров для классификатора\n    "${experimentType}" была успешно создана.\n</p>\n<p>\n    Идентификатор вашей заявки: <b>${requestId}</b>\n</p>\n</body>\n</html>\n
166	2021-02-16 19:37:02.847518	ERROR_EXPERIMENT	Сообщение о завершении эксперимента с ошибкой	Ошибка при построении эксперимента	<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Здравствуйте!\n</p>\n<p>\n    К сожалению, не удалось подобрать оптимальные параметры для эксперимента "${experimentType}".\n    В ходе построения эксперимента возникла ошибка.\n</p>\n<p>\n    Идентификатор вашей заявки: <b>${requestId}</b>\n</p>\n</body>\n</html>\n
167	2021-02-16 19:37:02.935585	TIMEOUT_EXPERIMENT	Сообщение о таймауте эксперимента	Таймаут при построении эксперимента	<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Здравствуйте!\n</p>\n<p>\n    Было превышено максимальное допустимое время для построения эксперимента "${experimentType}".\n    Максимальное допустимое время составляет ${timeout} часов.\n</p>\n<p>\n    Идентификатор вашей заявки: <b>${requestId}</b>\n</p>\n</body>\n</html>\n
168	2021-02-16 19:37:03.003623	FINISHED_EXPERIMENT	Сообщение о завершенном эксперименте	Эксперимент завершен	<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Здравствуйте!\n</p>\n<p>\n    Эксперимент для автоматического подбора оптимальных параметров для классификатора\n    "${experimentType}" был успешно построен.\n    Результаты доступны по ссылке <a href="${downloadUrl}">${downloadUrl}</a>\n</p>\n<p>\n    Идентификатор вашей заявки: <b>${requestId}</b>\n</p>\n</body>\n</html>\n
172	2021-02-16 19:37:03.199573	IN_PROGRESS_EXPERIMENT	Сообщение о поступлении эксперимента в работу	Заявка поступила в работу	<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Здравствуйте!\n</p>\n<p>\n    Ваша заявка на эксперимент "${experimentType}" поступила в работу.\n</p>\n<p>\n    Идентификатор вашей заявки: <b>${requestId}</b>\n</p>\n</body>\n</html>\n
180	2021-12-02 13:19:09.27252	PASSWORD_RESET	Сообщение с успешным сбросом пароля в личном кабинете Eca - service	Сброшен пароль от вашего аккаунта	<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Здравствуйте!\n</p>\n<p>\n    Пароль от вашего аккаунта в Eca - service был успешно сброшен.\n</p>\n</body>\n</html>\n
181	2022-12-09 13:05:09.112181	USER_LOCKED	Сообщение о блокировке учетной записи	Блокировка учетной записи	<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Здравствуйте, ваша учетная запись в Eca - service была заблокирована.\n</p>\n</body>\n</html>\n
182	2022-12-09 13:05:09.133054	USER_UNLOCKED	Сообщение о снятии блокировки учетной записи	Блокировка учетной записи снята	<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Здравствуйте, блокировка учетной записи в Eca - service была снята.\n</p>\n</body>\n</html>\n
175	2021-12-02 13:19:09.145374	CHANGE_EMAIL	Сообщение с подтверждением изменения Email в личном кабинете Eca - service	Подтверждение изменения Email в личном кабинете Eca - service	<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n</head>\n<body>\n<p>\n    Здравствуйте!\n</p>\n<p>\n    Вы запросили смену текущего email адреса в личном кабинете Eca - service на адрес <b>${newEmail}</b>. Если Вы не делали такого запроса, пожалуйста, не отвечайте на данное сообщение.\n</p>\n<p>\n    Для подтверждения запроса, пожалуйста, перейдите по ссылке: <a href="${changeEmailUrl}">${changeEmailUrl}</a>\n</p>\n<p>\n    Ссылка действительна в течении ${validityHours}-ми часов.\n</p>\n</body>\n</html>\n
\.


--
-- TOC entry 2181 (class 0 OID 17139)
-- Dependencies: 191
-- Data for Name: template_parameter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.template_parameter (id, created, parameter_name, description, regex_id) FROM stdin;
156	2021-02-16 19:37:02.610355	experimentType	Тип эксперимента	\N
157	2021-02-16 19:37:02.634455	requestId	Идентификатор заявки	\N
158	2021-02-16 19:37:02.652278	downloadUrl	Ссылка на скачивание результатов эксперимента	\N
159	2021-02-16 19:37:02.66779	timeout	Таймаут для эксперимента	154
160	2021-02-16 19:37:02.676823	tfaCode	Код двухфакторной аутентификации	\N
161	2021-02-16 19:37:02.688786	userName	Логин пользователя	\N
162	2021-02-16 19:37:02.701126	password	Пароль пользователя	\N
174	2021-04-08 14:41:04.102046	changePasswordUrl	Ссылка на подтверждение изменения пароля	\N
176	2021-12-02 13:19:09.18194	changeEmailUrl	Ссылка на подтверждение изменения Email	\N
177	2021-12-02 13:19:09.188569	validityHours	Время действия ссылки в часах	154
164	2021-02-16 19:37:02.751752	validityMinutes	Время действия ссылки в минутах	154
163	2021-02-16 19:37:02.72137	resetPasswordUrl	Ссылка на сброс пароля	\N
183	2022-12-09 13:05:09.212985	newEmail	Новый почтовый адрес	\N
\.


--
-- TOC entry 2182 (class 0 OID 17145)
-- Dependencies: 192
-- Data for Name: templates_parameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.templates_parameters (template_id, param_id) FROM stdin;
165	156
165	157
166	156
166	157
167	156
167	157
167	159
168	156
168	157
168	158
169	163
169	164
170	160
171	161
171	162
172	156
172	157
173	174
173	164
175	176
175	177
175	183
\.


--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 188
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 183, true);


--
-- TOC entry 2036 (class 2606 OID 17149)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 2038 (class 2606 OID 17151)
-- Name: email email_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email
    ADD CONSTRAINT email_pkey PRIMARY KEY (id);


--
-- TOC entry 2040 (class 2606 OID 17392)
-- Name: email email_uuid_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email
    ADD CONSTRAINT email_uuid_unique_idx UNIQUE (uuid);


--
-- TOC entry 2050 (class 2606 OID 17153)
-- Name: template_parameter parameter_name_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template_parameter
    ADD CONSTRAINT parameter_name_unique_idx UNIQUE (parameter_name);


--
-- TOC entry 2054 (class 2606 OID 17155)
-- Name: templates_parameters pk_templates_parameters; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.templates_parameters
    ADD CONSTRAINT pk_templates_parameters PRIMARY KEY (template_id, param_id);


--
-- TOC entry 2042 (class 2606 OID 17157)
-- Name: regex regex_code_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regex
    ADD CONSTRAINT regex_code_unique_idx UNIQUE (regex_code);


--
-- TOC entry 2044 (class 2606 OID 17159)
-- Name: regex regex_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regex
    ADD CONSTRAINT regex_pkey PRIMARY KEY (id);


--
-- TOC entry 2046 (class 2606 OID 17161)
-- Name: template template_code_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template
    ADD CONSTRAINT template_code_unique_idx UNIQUE (template_code);


--
-- TOC entry 2052 (class 2606 OID 17163)
-- Name: template_parameter template_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template_parameter
    ADD CONSTRAINT template_parameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2048 (class 2606 OID 17165)
-- Name: template template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template
    ADD CONSTRAINT template_pkey PRIMARY KEY (id);


--
-- TOC entry 2055 (class 2606 OID 17166)
-- Name: template_parameter fk_template_parameter_regex_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template_parameter
    ADD CONSTRAINT fk_template_parameter_regex_id FOREIGN KEY (regex_id) REFERENCES public.regex(id);


--
-- TOC entry 2056 (class 2606 OID 17171)
-- Name: templates_parameters fk_templates_parameters_param_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.templates_parameters
    ADD CONSTRAINT fk_templates_parameters_param_id FOREIGN KEY (param_id) REFERENCES public.template_parameter(id);


--
-- TOC entry 2057 (class 2606 OID 17176)
-- Name: templates_parameters fk_templates_parameters_template_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.templates_parameters
    ADD CONSTRAINT fk_templates_parameters_template_id FOREIGN KEY (template_id) REFERENCES public.template(id);


-- Completed on 2022-12-09 13:10:26 +07

--
-- PostgreSQL database dump complete
--

