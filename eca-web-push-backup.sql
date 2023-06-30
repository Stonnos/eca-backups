--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Debian 13.9-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-06-30 22:15:13

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
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 16399)
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
-- TOC entry 200 (class 1259 OID 16394)
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
-- TOC entry 202 (class 1259 OID 16405)
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
-- TOC entry 203 (class 1259 OID 16407)
-- Name: notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification (
    id bigint NOT NULL,
    message_type character varying(255) NOT NULL,
    message_text character varying(255),
    initiator character varying(255),
    receiver character varying(255) NOT NULL,
    message_status character varying(255) NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.notification OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16415)
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
-- TOC entry 205 (class 1259 OID 16430)
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
-- TOC entry 3018 (class 0 OID 16399)
-- Dependencies: 201
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
create_hibernate_sequence	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:29.768038	1	EXECUTED	8:a3d354491071bf1899da0ff55cd58976	createSequence sequenceName=hibernate_sequence		\N	3.7.0	\N	\N	8136629643
create_notification_table	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:29.831596	2	EXECUTED	8:01cda3ad699654d8aed3a8c8b7d23d1a	createTable tableName=notification		\N	3.7.0	schema	\N	8136629643
create_notification_parameter_table	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:29.886849	3	EXECUTED	8:90d5094deb8476cfb3233de2c3c48690	createTable tableName=notification_parameter		\N	3.7.0	schema	\N	8136629643
create_notification_receiver_idx	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:29.941463	4	EXECUTED	8:1fe358eeae8749278c1d99a437c895e9	createIndex indexName=notification_receiver_idx, tableName=notification		\N	3.7.0	schema	\N	8136629643
create_notification_parameter_id_parameter_name_unique_idx	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2023-06-30 21:50:30.028584	5	EXECUTED	8:162aa9c105983c6cfede6b1001662f17	createIndex indexName=notification_parameter_id_parameter_name_unique_idx, tableName=notification_parameter		\N	3.7.0	schema	\N	8136629643
create-push-token-table	roman.batygin@mail.ru	db/changelog/v1-create-push-token-table.xml	2023-06-30 21:50:30.109669	6	EXECUTED	8:0e9cb975455f08a7cf954d72a45313e6	createTable tableName=push_token		\N	3.7.0	schema	\N	8136629643
add_push_token_id_unique_idx	roman.batygin@mail.ru	db/changelog/v1-create-push-token-table.xml	2023-06-30 21:50:30.233343	7	EXECUTED	8:0056e40755a62a617e20db50b8ef64c5	createIndex indexName=push_token_id_unique_idx, tableName=push_token		\N	3.7.0	schema	\N	8136629643
drop_notification_initiator_not_null_constraint	roman.batygin@mail.ru	db/changelog/v2-drop-notification-initiator-not-null-constraint.xml	2023-06-30 21:50:30.254401	8	EXECUTED	8:2916ddcc2b383d81b3b7f975acc8c285	dropNotNullConstraint columnName=initiator, tableName=notification		\N	3.7.0	schema	\N	8136629643
\.


--
-- TOC entry 3017 (class 0 OID 16394)
-- Dependencies: 200
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- TOC entry 3020 (class 0 OID 16407)
-- Dependencies: 203
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification (id, message_type, message_text, initiator, receiver, message_status, created) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 16415)
-- Dependencies: 204
-- Data for Name: notification_parameter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification_parameter (id, parameter_name, parameter_value, notification_id) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 16430)
-- Dependencies: 205
-- Data for Name: push_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.push_token (id, user_name, token_id, expire_at) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 202
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- TOC entry 2874 (class 2606 OID 16398)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 2880 (class 2606 OID 16422)
-- Name: notification_parameter notification_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_parameter
    ADD CONSTRAINT notification_parameter_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 16414)
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- TOC entry 2883 (class 2606 OID 16437)
-- Name: push_token push_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_token
    ADD CONSTRAINT push_token_pkey PRIMARY KEY (id);


--
-- TOC entry 2885 (class 2606 OID 16439)
-- Name: push_token push_token_user_name_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_token
    ADD CONSTRAINT push_token_user_name_unique_idx UNIQUE (user_name);


--
-- TOC entry 2878 (class 1259 OID 16429)
-- Name: notification_parameter_id_parameter_name_unique_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX notification_parameter_id_parameter_name_unique_idx ON public.notification_parameter USING btree (id, parameter_name);


--
-- TOC entry 2877 (class 1259 OID 16428)
-- Name: notification_receiver_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notification_receiver_idx ON public.notification USING btree (receiver);


--
-- TOC entry 2881 (class 1259 OID 16440)
-- Name: push_token_id_unique_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX push_token_id_unique_idx ON public.push_token USING btree (token_id);


--
-- TOC entry 2886 (class 2606 OID 16423)
-- Name: notification_parameter fk_notification_parameter_notification_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_parameter
    ADD CONSTRAINT fk_notification_parameter_notification_id FOREIGN KEY (notification_id) REFERENCES public.notification(id);


-- Completed on 2023-06-30 22:15:17

--
-- PostgreSQL database dump complete
--

