--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)

-- Started on 2022-12-09 13:09:10 +07

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
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 186 (class 1259 OID 17393)
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
-- TOC entry 185 (class 1259 OID 17386)
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
-- TOC entry 187 (class 1259 OID 17399)
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
-- TOC entry 188 (class 1259 OID 17401)
-- Name: notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification (
    id bigint NOT NULL,
    message_type character varying(255) NOT NULL,
    message_text character varying(255),
    initiator character varying(255) NOT NULL,
    receiver character varying(255) NOT NULL,
    message_status character varying(255) NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.notification OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 17409)
-- Name: notification_parameter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification_parameter (
    id bigint NOT NULL,
    parameter_name character varying(255) NOT NULL,
    parameter_value character varying(255) NOT NULL,
    notification_id bigint NOT NULL
);


ALTER TABLE public.notification_parameter OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 17424)
-- Name: push_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.push_token (
    id bigint NOT NULL,
    user_name character varying(255) NOT NULL,
    token_id character varying(255) NOT NULL,
    expire_at timestamp without time zone NOT NULL
);


ALTER TABLE public.push_token OWNER TO postgres;

--
-- TOC entry 2157 (class 0 OID 17393)
-- Dependencies: 186
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
create_hibernate_sequence	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2022-12-09 13:05:09.439313	1	EXECUTED	8:a3d354491071bf1899da0ff55cd58976	createSequence sequenceName=hibernate_sequence		\N	3.7.0	\N	\N	0565909258
create_notification_table	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2022-12-09 13:05:09.494557	2	EXECUTED	8:01cda3ad699654d8aed3a8c8b7d23d1a	createTable tableName=notification		\N	3.7.0	schema	\N	0565909258
create_notification_parameter_table	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2022-12-09 13:05:09.520249	3	EXECUTED	8:90d5094deb8476cfb3233de2c3c48690	createTable tableName=notification_parameter		\N	3.7.0	schema	\N	0565909258
create_notification_receiver_idx	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2022-12-09 13:05:09.56137	4	EXECUTED	8:1fe358eeae8749278c1d99a437c895e9	createIndex indexName=notification_receiver_idx, tableName=notification		\N	3.7.0	schema	\N	0565909258
create_notification_parameter_id_parameter_name_unique_idx	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2022-12-09 13:05:09.593179	5	EXECUTED	8:162aa9c105983c6cfede6b1001662f17	createIndex indexName=notification_parameter_id_parameter_name_unique_idx, tableName=notification_parameter		\N	3.7.0	schema	\N	0565909258
create-push-token-table	roman.batygin@mail.ru	db/changelog/v1-create-push-token-table.xml	2022-12-09 13:05:09.611354	6	EXECUTED	8:0e9cb975455f08a7cf954d72a45313e6	createTable tableName=push_token		\N	3.7.0	schema	\N	0565909258
add_push_token_id_unique_idx	roman.batygin@mail.ru	db/changelog/v1-create-push-token-table.xml	2022-12-09 13:05:09.652973	7	EXECUTED	8:0056e40755a62a617e20db50b8ef64c5	createIndex indexName=push_token_id_unique_idx, tableName=push_token		\N	3.7.0	schema	\N	0565909258
\.


--
-- TOC entry 2156 (class 0 OID 17386)
-- Dependencies: 185
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- TOC entry 2159 (class 0 OID 17401)
-- Dependencies: 188
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification (id, message_type, message_text, initiator, receiver, message_status, created) FROM stdin;
\.


--
-- TOC entry 2160 (class 0 OID 17409)
-- Dependencies: 189
-- Data for Name: notification_parameter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification_parameter (id, parameter_name, parameter_value, notification_id) FROM stdin;
\.


--
-- TOC entry 2161 (class 0 OID 17424)
-- Dependencies: 190
-- Data for Name: push_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.push_token (id, user_name, token_id, expire_at) FROM stdin;
\.


--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 187
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- TOC entry 2026 (class 2606 OID 17390)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 2032 (class 2606 OID 17416)
-- Name: notification_parameter notification_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_parameter
    ADD CONSTRAINT notification_parameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2028 (class 2606 OID 17408)
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- TOC entry 2035 (class 2606 OID 17431)
-- Name: push_token push_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_token
    ADD CONSTRAINT push_token_pkey PRIMARY KEY (id);


--
-- TOC entry 2037 (class 2606 OID 17433)
-- Name: push_token push_token_user_name_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_token
    ADD CONSTRAINT push_token_user_name_unique_idx UNIQUE (user_name);


--
-- TOC entry 2030 (class 1259 OID 17423)
-- Name: notification_parameter_id_parameter_name_unique_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX notification_parameter_id_parameter_name_unique_idx ON public.notification_parameter USING btree (id, parameter_name);


--
-- TOC entry 2029 (class 1259 OID 17422)
-- Name: notification_receiver_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notification_receiver_idx ON public.notification USING btree (receiver);


--
-- TOC entry 2033 (class 1259 OID 17434)
-- Name: push_token_id_unique_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX push_token_id_unique_idx ON public.push_token USING btree (token_id);


--
-- TOC entry 2038 (class 2606 OID 17417)
-- Name: notification_parameter fk_notification_parameter_notification_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_parameter
    ADD CONSTRAINT fk_notification_parameter_notification_id FOREIGN KEY (notification_id) REFERENCES public.notification(id);


-- Completed on 2022-12-09 13:09:10 +07

--
-- PostgreSQL database dump complete
--

