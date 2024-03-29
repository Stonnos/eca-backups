--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Debian 13.9-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-06-30 22:15:00

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
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 207 (class 1259 OID 16629)
-- Name: classification_costs_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classification_costs_info (
    id bigint NOT NULL,
    class_value character varying(255) NOT NULL,
    tp_rate numeric(19,4),
    fp_rate numeric(19,4),
    tn_rate numeric(19,4),
    fn_rate numeric(19,4),
    auc_value numeric(19,4),
    specificity numeric(19,4),
    sensitivity numeric(19,4),
    threshold_value numeric(19,4),
    evaluation_results_info_id bigint NOT NULL
);


ALTER TABLE public.classification_costs_info OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16571)
-- Name: classifier_options_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classifier_options_info (
    id bigint NOT NULL,
    classifier_name character varying(255) NOT NULL,
    options text NOT NULL,
    classifier_description character varying(255)
);


ALTER TABLE public.classifier_options_info OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16616)
-- Name: confusion_matrix; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.confusion_matrix (
    id bigint NOT NULL,
    actual_class character varying(255) NOT NULL,
    predicted_class character varying(255) NOT NULL,
    num_instances integer NOT NULL,
    evaluation_results_info_id bigint NOT NULL
);


ALTER TABLE public.confusion_matrix OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16552)
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
-- TOC entry 200 (class 1259 OID 16446)
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
-- TOC entry 205 (class 1259 OID 16597)
-- Name: evaluation_results_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluation_results_info (
    id bigint NOT NULL,
    request_id character varying(255) NOT NULL,
    save_date timestamp without time zone NOT NULL,
    instances_info_id bigint NOT NULL,
    classifier_options_info_id bigint NOT NULL,
    evaluation_method character varying(255) NOT NULL,
    num_folds integer,
    num_tests integer,
    seed integer,
    num_test_instances integer,
    num_correct integer,
    num_incorrect integer,
    pct_correct numeric(19,4),
    pct_incorrect numeric(19,4),
    mean_abs_error numeric(19,4),
    root_mean_squared_error numeric(19,4),
    max_auc numeric(19,4),
    variance_error numeric(19,4),
    confidence_interval_lower_bound numeric(19,4),
    confidence_interval_upper_bound numeric(19,4)
);


ALTER TABLE public.evaluation_results_info OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16648)
-- Name: evaluation_results_sort; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluation_results_sort (
    id bigint NOT NULL,
    field_name character varying(255) NOT NULL,
    is_ascending boolean DEFAULT true,
    field_order integer NOT NULL
);


ALTER TABLE public.evaluation_results_sort OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16646)
-- Name: evaluation_results_sort_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.evaluation_results_sort ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.evaluation_results_sort_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 202 (class 1259 OID 16560)
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
-- TOC entry 203 (class 1259 OID 16562)
-- Name: instances_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instances_info (
    id bigint NOT NULL,
    data_md5_hash character varying(255) NOT NULL,
    relation_name character varying(255) NOT NULL,
    num_instances integer NOT NULL,
    num_attributes integer NOT NULL,
    num_classes integer NOT NULL,
    class_name character varying(255) NOT NULL
);


ALTER TABLE public.instances_info OWNER TO postgres;

--
-- TOC entry 3050 (class 0 OID 16629)
-- Dependencies: 207
-- Data for Name: classification_costs_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classification_costs_info (id, class_value, tp_rate, fp_rate, tn_rate, fn_rate, auc_value, specificity, sensitivity, threshold_value, evaluation_results_info_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 16571)
-- Dependencies: 204
-- Data for Name: classifier_options_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classifier_options_info (id, classifier_name, options, classifier_description) FROM stdin;
\.


--
-- TOC entry 3049 (class 0 OID 16616)
-- Dependencies: 206
-- Data for Name: confusion_matrix; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.confusion_matrix (id, actual_class, predicted_class, num_instances, evaluation_results_info_id) FROM stdin;
\.


--
-- TOC entry 3044 (class 0 OID 16552)
-- Dependencies: 201
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:37.274283	1	EXECUTED	8:a3d354491071bf1899da0ff55cd58976	createSequence sequenceName=hibernate_sequence		\N	3.7.0	\N	\N	8136637126
2	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:37.347326	2	EXECUTED	8:664efcaf94e133100378a52a75f6306c	createTable tableName=instances_info		\N	3.7.0	schema	\N	8136637126
3	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:37.427497	3	EXECUTED	8:8e3e2c0ea9bc70e3739e2932dc46fd1d	createIndex indexName=data_md5_hash_index, tableName=instances_info		\N	3.7.0	schema	\N	8136637126
4	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:37.486977	4	EXECUTED	8:d70bc1df12c817dee6fe338b829cdc2a	createTable tableName=classifier_options_info		\N	3.7.0	schema	\N	8136637126
5	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:37.576871	5	EXECUTED	8:3536021876f97b670720bdbcd6f83853	createTable tableName=input_options; addPrimaryKey constraintName=pk_input_options, tableName=input_options		\N	3.7.0	schema	\N	8136637126
6	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:37.642193	6	EXECUTED	8:b7ebf98e770f7ab43d81cd954a51b912	createTable tableName=evaluation_results_info		\N	3.7.0	schema	\N	8136637126
7	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:37.723861	7	EXECUTED	8:b66a4b5155f73b627ce599879ceffa02	createIndex indexName=request_id_idx, tableName=evaluation_results_info		\N	3.7.0	schema	\N	8136637126
8	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:37.785833	8	EXECUTED	8:e04cccaa0dcd22f19601f59cedef5e42	createTable tableName=confusion_matrix		\N	3.7.0	schema	\N	8136637126
9	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:37.818904	9	EXECUTED	8:8c90cb784fab0d5ca1b3b92c372858a7	createTable tableName=classification_costs_info		\N	3.7.0	schema	\N	8136637126
1	roman.batygin@mail.ru	db/changelog/000000000001.xml	2023-06-30 21:50:37.840495	10	EXECUTED	8:97b6c2d617c0071823a615b0b281ea17	addColumn tableName=instances_info		\N	3.7.0	schema	\N	8136637126
1	roman.batygin@mail.ru	db/changelog/000000000002.xml	2023-06-30 21:50:37.896578	11	EXECUTED	8:181733760be638fd4ad4e08c155510b5	dropColumn columnName=data_path, tableName=instances_info		\N	3.7.0	schema	\N	8136637126
1	roman.batygin@mail.ru	db/changelog/v3-add-meta-classifier-column.xml	2023-06-30 21:50:37.954144	12	EXECUTED	8:32fb093f7f56d5a7631e00d14cce6df1	addColumn tableName=classifier_options_info		\N	3.7.0	schema	\N	8136637126
2	roman.batygin@mail.ru	db/changelog/v3-add-meta-classifier-column.xml	2023-06-30 21:50:37.972088	13	EXECUTED	8:fb2b80b74944c3fb74490abc2ffe55bb	update tableName=classifier_options_info		\N	3.7.0	schema	\N	8136637126
1	roman.batygin@mail.ru	db/changelog/v4-create-evaluation-results-sort-table.xml	2023-06-30 21:50:38.093837	14	EXECUTED	8:59a95160daa5ccf8c4513fc7464f43a2	createTable tableName=evaluation_results_sort; addUniqueConstraint constraintName=field_name_field_order_unique_index, tableName=evaluation_results_sort		\N	3.7.0	schema	\N	8136637126
2	roman.batygin@mail.ru	db/changelog/v4-create-evaluation-results-sort-table.xml	2023-06-30 21:50:38.130598	15	EXECUTED	8:ca6b13c67adb0f37d02c86ab81b4b655	insert tableName=evaluation_results_sort		\N	3.7.0	data	\N	8136637126
3	roman.batygin@mail.ru	db/changelog/v4-create-evaluation-results-sort-table.xml	2023-06-30 21:50:38.161426	16	EXECUTED	8:1647ebc47c28c03d7b7b39ce7be8c322	insert tableName=evaluation_results_sort		\N	3.7.0	data	\N	8136637126
4	roman.batygin@mail.ru	db/changelog/v4-create-evaluation-results-sort-table.xml	2023-06-30 21:50:38.196606	17	EXECUTED	8:e55702e76bb2ef9ac5210042f736a356	insert tableName=evaluation_results_sort		\N	3.7.0	data	\N	8136637126
1	roman.batygin@mail.ru	db/changelog/v5-rename-xml-data-column.xml	2023-06-30 21:50:38.238012	18	EXECUTED	8:5f78fe9f78640e7c183d231401b8ee9e	renameColumn newColumnName=structure, oldColumnName=xml_data, tableName=instances_info		\N	3.7.0	schema	\N	8136637126
1	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.270189	19	EXECUTED	8:a264335b140cce44e44926ce02133e75	addNotNullConstraint columnName=structure, tableName=instances_info		\N	3.7.0	schema	\N	8136637126
2	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.298798	20	EXECUTED	8:b6464f82f74676e8f45c43b5a31bef02	addNotNullConstraint columnName=data_md5_hash, tableName=instances_info		\N	3.7.0	schema	\N	8136637126
3	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.350045	21	EXECUTED	8:779afc17e73e51296691830cc728c625	addNotNullConstraint columnName=relation_name, tableName=instances_info		\N	3.7.0	schema	\N	8136637126
4	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.382371	22	EXECUTED	8:066bd4ef0543d2f4ec43933cace683fb	addNotNullConstraint columnName=num_instances, tableName=instances_info		\N	3.7.0	schema	\N	8136637126
5	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.454317	23	EXECUTED	8:0402fe9d72144c8798a1752ceec14adf	addNotNullConstraint columnName=num_attributes, tableName=instances_info		\N	3.7.0	schema	\N	8136637126
6	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.471049	24	EXECUTED	8:3f28827378dbf3355580fe9590d7cc0b	addNotNullConstraint columnName=num_classes, tableName=instances_info		\N	3.7.0	schema	\N	8136637126
7	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.482019	25	EXECUTED	8:b821287c8537f92a10dc5d692eeb38f6	addNotNullConstraint columnName=class_name, tableName=instances_info		\N	3.7.0	schema	\N	8136637126
8	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.504586	26	EXECUTED	8:9d193812e1e263a6ce65014a4103c64a	addNotNullConstraint columnName=classifier_name, tableName=classifier_options_info		\N	3.7.0	schema	\N	8136637126
9	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.525894	27	EXECUTED	8:bea2628fc32e3cc56a83744be2c52889	addNotNullConstraint columnName=options, tableName=classifier_options_info		\N	3.7.0	schema	\N	8136637126
10	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.620266	28	EXECUTED	8:a32d42ca0c5e832de8c239b092b87db3	addNotNullConstraint columnName=actual_class, tableName=confusion_matrix		\N	3.7.0	schema	\N	8136637126
11	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.636117	29	EXECUTED	8:cc6c1a0b8f340e398f55ec8fc1cafee8	addNotNullConstraint columnName=predicted_class, tableName=confusion_matrix		\N	3.7.0	schema	\N	8136637126
12	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.651627	30	EXECUTED	8:76cb8e2c99e18af8601d2b53ee6e9a97	addNotNullConstraint columnName=num_instances, tableName=confusion_matrix		\N	3.7.0	schema	\N	8136637126
13	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.681354	31	EXECUTED	8:604cce6c67e5f4d59b6842c500ac065a	addNotNullConstraint columnName=request_id, tableName=evaluation_results_info		\N	3.7.0	schema	\N	8136637126
14	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.708401	32	EXECUTED	8:15e39c1aedd485767da177937ae306d4	addNotNullConstraint columnName=save_date, tableName=evaluation_results_info		\N	3.7.0	schema	\N	8136637126
15	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.736586	33	EXECUTED	8:ba6bdadb9446cebd85c5b0e5b90ecc1b	addNotNullConstraint columnName=instances_info_id, tableName=evaluation_results_info		\N	3.7.0	schema	\N	8136637126
16	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.810897	34	EXECUTED	8:9bbf64cac9896da0438f1298dd0419f4	addNotNullConstraint columnName=classifier_options_info_id, tableName=evaluation_results_info		\N	3.7.0	schema	\N	8136637126
17	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.833046	35	EXECUTED	8:ebd415dccafdf2497e4fa4b0ddb7dc0c	addNotNullConstraint columnName=evaluation_method, tableName=evaluation_results_info		\N	3.7.0	schema	\N	8136637126
18	roman.batygin@email.ru	db/changelog/v6-add-not-null-constraints.xml	2023-06-30 21:50:38.847969	36	EXECUTED	8:4d310d4294f334755805d11dab67f36a	addNotNullConstraint columnName=class_value, tableName=classification_costs_info		\N	3.7.0	schema	\N	8136637126
1	roman.batygin@email.ru	db/changelog/v7-add-request-id-unique-idx	2023-06-30 21:50:38.888573	37	EXECUTED	8:d932aeca647483050aca1db846a57366	addUniqueConstraint constraintName=evaluation_results_info_request_id_unique_idx, tableName=evaluation_results_info		\N	3.7.0	schema	\N	8136637126
drop_classifier_options_meta_classifier_column	roman.batygin@mail.ru	db/changelog/v8-drop-classifier-options-data.xml	2023-06-30 21:50:38.909125	38	EXECUTED	8:95eda8c09f82f03b0a7418447a3af400	dropColumn columnName=meta_classifier, tableName=classifier_options_info		\N	3.7.0	schema	\N	8136637126
drop_input_options_table	roman.batygin@mail.ru	db/changelog/v8-drop-classifier-options-data.xml	2023-06-30 21:50:38.924892	39	EXECUTED	8:54b5f9fc3dea96455d75e410ae24f578	dropTable tableName=input_options		\N	3.7.0	schema	\N	8136637126
delete_individual_classifier_options_data	roman.batygin@mail.ru	db/changelog/v8-drop-classifier-options-data.xml	2023-06-30 21:50:38.933537	40	EXECUTED	8:2cf750ab86ce61631f3342b8e461e07d	delete tableName=classifier_options_info		\N	3.7.0	data	\N	8136637126
drop_classifier_options_parent_id_column	roman.batygin@mail.ru	db/changelog/v8-drop-classifier-options-data.xml	2023-06-30 21:50:38.963119	41	EXECUTED	8:00d7d9bbd6275ed0a31b0ba51bdadcc6	dropColumn columnName=parent_id, tableName=classifier_options_info		\N	3.7.0	schema	\N	8136637126
drop_instances_structure_column	roman.batygin@mail.ru	db/changelog/v9-drop-instances-structure-column.xml	2023-06-30 21:50:38.978749	42	EXECUTED	8:14f7e4c028f870df761d5690c303e665	dropColumn columnName=structure, tableName=instances_info		\N	3.7.0	schema	\N	8136637126
\.


--
-- TOC entry 3043 (class 0 OID 16446)
-- Dependencies: 200
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- TOC entry 3048 (class 0 OID 16597)
-- Dependencies: 205
-- Data for Name: evaluation_results_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evaluation_results_info (id, request_id, save_date, instances_info_id, classifier_options_info_id, evaluation_method, num_folds, num_tests, seed, num_test_instances, num_correct, num_incorrect, pct_correct, pct_incorrect, mean_abs_error, root_mean_squared_error, max_auc, variance_error, confidence_interval_lower_bound, confidence_interval_upper_bound) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 16648)
-- Dependencies: 209
-- Data for Name: evaluation_results_sort; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evaluation_results_sort (id, field_name, is_ascending, field_order) FROM stdin;
1	statistics.pctCorrect	f	0
2	statistics.maxAucValue	f	1
3	statistics.varianceError	t	2
\.


--
-- TOC entry 3046 (class 0 OID 16562)
-- Dependencies: 203
-- Data for Name: instances_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instances_info (id, data_md5_hash, relation_name, num_instances, num_attributes, num_classes, class_name) FROM stdin;
\.


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 208
-- Name: evaluation_results_sort_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evaluation_results_sort_id_seq', 3, true);


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 202
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- TOC entry 2904 (class 2606 OID 16633)
-- Name: classification_costs_info classification_costs_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classification_costs_info
    ADD CONSTRAINT classification_costs_info_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 16578)
-- Name: classifier_options_info classifier_options_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_options_info
    ADD CONSTRAINT classifier_options_info_pkey PRIMARY KEY (id);


--
-- TOC entry 2902 (class 2606 OID 16623)
-- Name: confusion_matrix confusion_matrix_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.confusion_matrix
    ADD CONSTRAINT confusion_matrix_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 16450)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 16604)
-- Name: evaluation_results_info evaluation_results_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_results_info
    ADD CONSTRAINT evaluation_results_info_pkey PRIMARY KEY (id);


--
-- TOC entry 2899 (class 2606 OID 16729)
-- Name: evaluation_results_info evaluation_results_info_request_id_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_results_info
    ADD CONSTRAINT evaluation_results_info_request_id_unique_idx UNIQUE (request_id);


--
-- TOC entry 2906 (class 2606 OID 16653)
-- Name: evaluation_results_sort evaluation_results_sort_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_results_sort
    ADD CONSTRAINT evaluation_results_sort_pkey PRIMARY KEY (id);


--
-- TOC entry 2908 (class 2606 OID 16655)
-- Name: evaluation_results_sort field_name_field_order_unique_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_results_sort
    ADD CONSTRAINT field_name_field_order_unique_index UNIQUE (field_name, field_order);


--
-- TOC entry 2893 (class 2606 OID 16569)
-- Name: instances_info instances_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instances_info
    ADD CONSTRAINT instances_info_pkey PRIMARY KEY (id);


--
-- TOC entry 2891 (class 1259 OID 16570)
-- Name: data_md5_hash_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX data_md5_hash_index ON public.instances_info USING btree (data_md5_hash);


--
-- TOC entry 2900 (class 1259 OID 16615)
-- Name: request_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX request_id_idx ON public.evaluation_results_info USING btree (request_id);


--
-- TOC entry 2912 (class 2606 OID 16634)
-- Name: classification_costs_info fk_classification_costs_info_evaluation_results_info_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classification_costs_info
    ADD CONSTRAINT fk_classification_costs_info_evaluation_results_info_id FOREIGN KEY (evaluation_results_info_id) REFERENCES public.evaluation_results_info(id);


--
-- TOC entry 2911 (class 2606 OID 16624)
-- Name: confusion_matrix fk_confusion_matrix_evaluation_results_info_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.confusion_matrix
    ADD CONSTRAINT fk_confusion_matrix_evaluation_results_info_id FOREIGN KEY (evaluation_results_info_id) REFERENCES public.evaluation_results_info(id);


--
-- TOC entry 2910 (class 2606 OID 16610)
-- Name: evaluation_results_info fk_evaluation_results_classifier_options_info_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_results_info
    ADD CONSTRAINT fk_evaluation_results_classifier_options_info_id FOREIGN KEY (classifier_options_info_id) REFERENCES public.classifier_options_info(id);


--
-- TOC entry 2909 (class 2606 OID 16605)
-- Name: evaluation_results_info fk_evaluation_results_instances_info_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_results_info
    ADD CONSTRAINT fk_evaluation_results_instances_info_id FOREIGN KEY (instances_info_id) REFERENCES public.instances_info(id);


-- Completed on 2023-06-30 22:15:04

--
-- PostgreSQL database dump complete
--

