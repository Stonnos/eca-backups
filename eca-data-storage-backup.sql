--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)

-- Started on 2022-12-09 13:08:35 +07

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
-- TOC entry 2218 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 185 (class 1259 OID 17181)
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
-- TOC entry 186 (class 1259 OID 17194)
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
-- TOC entry 187 (class 1259 OID 17200)
-- Name: audit_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_group (
    id character varying(255) NOT NULL,
    title character varying(255)
);


ALTER TABLE public.audit_group OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 17206)
-- Name: credit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credit (
    checking_status character varying(255),
    duration numeric(22,9),
    credit_history character varying(255),
    purpose character varying(255),
    credit_amount numeric(22,9),
    savings_status character varying(255),
    employment character varying(255),
    installment_commitment numeric(22,9),
    personal_status character varying(255),
    other_parties character varying(255),
    residence_since numeric(22,9),
    property_magnitude character varying(255),
    age numeric(22,9),
    other_payment_plans character varying(255),
    housing character varying(255),
    existing_credits numeric(22,9),
    job character varying(255),
    num_dependents numeric(22,9),
    own_telephone character varying(255),
    foreign_worker character varying(255),
    class character varying(255)
);


ALTER TABLE public.credit OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 17212)
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
-- TOC entry 190 (class 1259 OID 17218)
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
-- TOC entry 191 (class 1259 OID 17221)
-- Name: diabetes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diabetes (
    preg numeric(22,9),
    plas numeric(22,9),
    pres numeric(22,9),
    skin numeric(22,9),
    insu numeric(22,9),
    mass numeric(22,9),
    pedi numeric(22,9),
    age numeric(22,9),
    class character varying(255)
);


ALTER TABLE public.diabetes OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 17224)
-- Name: glass; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.glass (
    ri numeric(22,9),
    na numeric(22,9),
    mg numeric(22,9),
    al numeric(22,9),
    si numeric(22,9),
    k numeric(22,9),
    ca numeric(22,9),
    ba numeric(22,9),
    fe numeric(22,9),
    type character varying(255)
);


ALTER TABLE public.glass OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 17227)
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
-- TOC entry 194 (class 1259 OID 17229)
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
-- TOC entry 195 (class 1259 OID 17235)
-- Name: ionosphere; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ionosphere (
    a01 numeric(22,9),
    a02 numeric(22,9),
    a03 numeric(22,9),
    a04 numeric(22,9),
    a05 numeric(22,9),
    a06 numeric(22,9),
    a07 numeric(22,9),
    a08 numeric(22,9),
    a09 numeric(22,9),
    a10 numeric(22,9),
    a11 numeric(22,9),
    a12 numeric(22,9),
    a13 numeric(22,9),
    a14 numeric(22,9),
    a15 numeric(22,9),
    a16 numeric(22,9),
    a17 numeric(22,9),
    a18 numeric(22,9),
    a19 numeric(22,9),
    a20 numeric(22,9),
    a21 numeric(22,9),
    a22 numeric(22,9),
    a23 numeric(22,9),
    a24 numeric(22,9),
    a25 numeric(22,9),
    a26 numeric(22,9),
    a27 numeric(22,9),
    a28 numeric(22,9),
    a29 numeric(22,9),
    a30 numeric(22,9),
    a31 numeric(22,9),
    a32 numeric(22,9),
    a33 numeric(22,9),
    a34 numeric(22,9),
    class character varying(255)
);


ALTER TABLE public.ionosphere OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 17238)
-- Name: iris; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iris (
    x1 numeric(22,9),
    x2 numeric(22,9),
    x3 numeric(22,9),
    x4 numeric(22,9),
    class character varying(255)
);


ALTER TABLE public.iris OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 17447)
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
-- TOC entry 197 (class 1259 OID 17241)
-- Name: soybean; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.soybean (
    date character varying(255),
    plant_stand character varying(255),
    precip character varying(255),
    temp character varying(255),
    hail character varying(255),
    crop_hist character varying(255),
    area_damaged character varying(255),
    severity character varying(255),
    seed_tmt character varying(255),
    germination character varying(255),
    plant_growth character varying(255),
    leaves character varying(255),
    leafspots_halo character varying(255),
    leafspots_marg character varying(255),
    leafspot_size character varying(255),
    leaf_shread character varying(255),
    leaf_malf character varying(255),
    leaf_mild character varying(255),
    stem character varying(255),
    lodging character varying(255),
    stem_cankers character varying(255),
    canker_lesion character varying(255),
    fruiting_bodies character varying(255),
    external_decay character varying(255),
    mycelium character varying(255),
    int_discolor character varying(255),
    sclerotia character varying(255),
    fruit_pods character varying(255),
    fruit_spots character varying(255),
    seed character varying(255),
    mold_growth character varying(255),
    seed_discolor character varying(255),
    seed_size character varying(255),
    shriveling character varying(255),
    roots character varying(255),
    class character varying(255)
);


ALTER TABLE public.soybean OWNER TO postgres;

--
-- TOC entry 2199 (class 0 OID 17181)
-- Dependencies: 185
-- Data for Name: audit_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_code (id, title, enabled, audit_group_id) FROM stdin;
SAVE_INSTANCES	Сохранение файла с обучающей выборкой в базу данных	t	DATA_STORAGE_ACTIONS
RENAME_INSTANCES	Изменение имени таблицы с обучающей выборкой	t	DATA_STORAGE_ACTIONS
DELETE_INSTANCES	Удаление таблицы с обучающей выборкой	t	DATA_STORAGE_ACTIONS
DOWNLOAD_INSTANCES_REPORT	Выгрузка обучающей выборки	t	DATA_STORAGE_ACTIONS
\.


--
-- TOC entry 2200 (class 0 OID 17194)
-- Dependencies: 186
-- Data for Name: audit_event_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_event_template (id, event_type, message_template, audit_code_id) FROM stdin;
1	SUCCESS	Обучающая выборка была успешно сохранена в таблицу ${tableName}	SAVE_INSTANCES
2	SUCCESS	Изменено название таблицы ${returnValue} для обучающей выборки. Новое название - ${newName}	RENAME_INSTANCES
3	SUCCESS	Таблица ${returnValue} с обучающей выборкой была удалена	DELETE_INSTANCES
4	SUCCESS	Данные обучающей выборки были выгружены из таблицы [${instancesEntity.tableName}] в формате [${reportType.extension}]	DOWNLOAD_INSTANCES_REPORT
\.


--
-- TOC entry 2201 (class 0 OID 17200)
-- Dependencies: 187
-- Data for Name: audit_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_group (id, title) FROM stdin;
DATA_STORAGE_ACTIONS	Действия с обучающими выборками
\.


--
-- TOC entry 2202 (class 0 OID 17206)
-- Dependencies: 188
-- Data for Name: credit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credit (checking_status, duration, credit_history, purpose, credit_amount, savings_status, employment, installment_commitment, personal_status, other_parties, residence_since, property_magnitude, age, other_payment_plans, housing, existing_credits, job, num_dependents, own_telephone, foreign_worker, class) FROM stdin;
<0	6.000000000	critical/other existing credit	radio/tv	1169.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	real estate	67.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	48.000000000	existing paid	radio/tv	5951.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	none	2.000000000	real estate	22.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	12.000000000	critical/other existing credit	education	2096.000000000	<100	4<=X<7	2.000000000	male single	none	3.000000000	real estate	49.000000000	none	own	1.000000000	unskilled resident	2.000000000	none	yes	good
<0	42.000000000	existing paid	furniture/equipment	7882.000000000	<100	4<=X<7	2.000000000	male single	guarantor	4.000000000	life insurance	45.000000000	none	for free	1.000000000	skilled	2.000000000	none	yes	good
<0	24.000000000	delayed previously	new car	4870.000000000	<100	1<=X<4	3.000000000	male single	none	4.000000000	no known property	53.000000000	none	for free	2.000000000	skilled	2.000000000	none	yes	bad
no checking	36.000000000	existing paid	education	9055.000000000	no known savings	1<=X<4	2.000000000	male single	none	4.000000000	no known property	35.000000000	none	for free	1.000000000	unskilled resident	2.000000000	yes	yes	good
no checking	24.000000000	existing paid	furniture/equipment	2835.000000000	500<=X<1000	>=7	3.000000000	male single	none	4.000000000	life insurance	53.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	36.000000000	existing paid	used car	6948.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	car	35.000000000	none	rent	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	12.000000000	existing paid	radio/tv	3059.000000000	>=1000	4<=X<7	2.000000000	male div/sep	none	4.000000000	real estate	61.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	30.000000000	critical/other existing credit	new car	5234.000000000	<100	unemployed	4.000000000	male mar/wid	none	2.000000000	car	28.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	bad
0<=X<200	12.000000000	existing paid	new car	1295.000000000	<100	<1	3.000000000	female div/dep/mar	none	1.000000000	car	25.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
<0	48.000000000	existing paid	business	4308.000000000	<100	<1	3.000000000	female div/dep/mar	none	4.000000000	life insurance	24.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	12.000000000	existing paid	radio/tv	1567.000000000	<100	1<=X<4	1.000000000	female div/dep/mar	none	1.000000000	car	22.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	24.000000000	critical/other existing credit	new car	1199.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	60.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	bad
<0	15.000000000	existing paid	new car	1403.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	none	4.000000000	car	28.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
<0	24.000000000	existing paid	radio/tv	1282.000000000	100<=X<500	1<=X<4	4.000000000	female div/dep/mar	none	2.000000000	car	32.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
no checking	24.000000000	critical/other existing credit	radio/tv	2424.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	life insurance	53.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
<0	30.000000000	no credits/all paid	business	8072.000000000	no known savings	<1	2.000000000	male single	none	3.000000000	car	25.000000000	bank	own	3.000000000	skilled	1.000000000	none	yes	good
0<=X<200	24.000000000	existing paid	used car	12579.000000000	<100	>=7	4.000000000	female div/dep/mar	none	2.000000000	no known property	44.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	24.000000000	existing paid	radio/tv	3430.000000000	500<=X<1000	>=7	3.000000000	male single	none	2.000000000	car	31.000000000	none	own	1.000000000	skilled	2.000000000	yes	yes	good
no checking	9.000000000	critical/other existing credit	new car	2134.000000000	<100	1<=X<4	4.000000000	male single	none	4.000000000	car	48.000000000	none	own	3.000000000	skilled	1.000000000	yes	yes	good
<0	6.000000000	existing paid	radio/tv	2647.000000000	500<=X<1000	1<=X<4	2.000000000	male single	none	3.000000000	real estate	44.000000000	none	rent	1.000000000	skilled	2.000000000	none	yes	good
<0	10.000000000	critical/other existing credit	new car	2241.000000000	<100	<1	1.000000000	male single	none	3.000000000	real estate	48.000000000	none	rent	2.000000000	unskilled resident	2.000000000	none	no	good
0<=X<200	12.000000000	critical/other existing credit	used car	1804.000000000	100<=X<500	<1	3.000000000	male single	none	4.000000000	life insurance	44.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	10.000000000	critical/other existing credit	furniture/equipment	2069.000000000	no known savings	1<=X<4	2.000000000	male mar/wid	none	1.000000000	car	26.000000000	none	own	2.000000000	skilled	1.000000000	none	no	good
<0	6.000000000	existing paid	furniture/equipment	1374.000000000	<100	1<=X<4	1.000000000	male single	none	2.000000000	real estate	36.000000000	bank	own	1.000000000	unskilled resident	1.000000000	yes	yes	good
no checking	6.000000000	no credits/all paid	radio/tv	426.000000000	<100	>=7	4.000000000	male mar/wid	none	4.000000000	car	39.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
>=200	12.000000000	all paid	radio/tv	409.000000000	>=1000	1<=X<4	3.000000000	female div/dep/mar	none	3.000000000	real estate	42.000000000	none	rent	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	7.000000000	existing paid	radio/tv	2415.000000000	<100	1<=X<4	3.000000000	male single	guarantor	2.000000000	real estate	34.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	60.000000000	delayed previously	business	6836.000000000	<100	>=7	3.000000000	male single	none	4.000000000	no known property	63.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	bad
0<=X<200	18.000000000	existing paid	business	1913.000000000	>=1000	<1	3.000000000	male mar/wid	none	3.000000000	real estate	36.000000000	bank	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	24.000000000	existing paid	furniture/equipment	4020.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	car	27.000000000	stores	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	18.000000000	existing paid	new car	5866.000000000	100<=X<500	1<=X<4	2.000000000	male single	none	2.000000000	car	30.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	12.000000000	critical/other existing credit	business	1264.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	no known property	57.000000000	none	rent	1.000000000	unskilled resident	1.000000000	none	yes	good
>=200	12.000000000	existing paid	furniture/equipment	1474.000000000	<100	<1	4.000000000	female div/dep/mar	none	1.000000000	life insurance	33.000000000	bank	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	45.000000000	critical/other existing credit	radio/tv	4746.000000000	<100	<1	4.000000000	male single	none	2.000000000	life insurance	25.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	bad
no checking	48.000000000	critical/other existing credit	education	6110.000000000	<100	1<=X<4	1.000000000	male single	none	3.000000000	no known property	31.000000000	bank	for free	1.000000000	skilled	1.000000000	yes	yes	good
>=200	18.000000000	existing paid	radio/tv	2100.000000000	<100	1<=X<4	4.000000000	male single	co applicant	2.000000000	real estate	37.000000000	stores	own	1.000000000	skilled	1.000000000	none	yes	bad
>=200	10.000000000	existing paid	domestic appliance	1225.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	car	37.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	9.000000000	existing paid	radio/tv	458.000000000	<100	1<=X<4	4.000000000	male single	none	3.000000000	real estate	24.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	30.000000000	existing paid	radio/tv	2333.000000000	500<=X<1000	>=7	4.000000000	male single	none	2.000000000	car	30.000000000	bank	own	1.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	radio/tv	1158.000000000	500<=X<1000	1<=X<4	3.000000000	male div/sep	none	1.000000000	car	26.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	18.000000000	delayed previously	repairs	6204.000000000	<100	1<=X<4	2.000000000	male single	none	4.000000000	real estate	44.000000000	none	own	1.000000000	unskilled resident	2.000000000	yes	yes	good
<0	30.000000000	critical/other existing credit	used car	6187.000000000	100<=X<500	4<=X<7	1.000000000	male mar/wid	none	4.000000000	car	24.000000000	none	rent	2.000000000	skilled	1.000000000	none	yes	good
<0	48.000000000	critical/other existing credit	used car	6143.000000000	<100	>=7	4.000000000	female div/dep/mar	none	4.000000000	no known property	58.000000000	stores	for free	2.000000000	unskilled resident	1.000000000	none	yes	bad
no checking	11.000000000	critical/other existing credit	new car	1393.000000000	<100	<1	4.000000000	female div/dep/mar	none	4.000000000	car	35.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	good
no checking	36.000000000	existing paid	radio/tv	2299.000000000	500<=X<1000	>=7	4.000000000	male single	none	4.000000000	car	39.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	6.000000000	existing paid	used car	1352.000000000	500<=X<1000	unemployed	1.000000000	female div/dep/mar	none	2.000000000	life insurance	23.000000000	none	rent	1.000000000	unemp/unskilled non res	1.000000000	yes	yes	good
no checking	11.000000000	critical/other existing credit	new car	7228.000000000	<100	1<=X<4	1.000000000	male single	none	4.000000000	life insurance	39.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
no checking	12.000000000	existing paid	radio/tv	2073.000000000	100<=X<500	1<=X<4	4.000000000	female div/dep/mar	co applicant	2.000000000	real estate	28.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	24.000000000	delayed previously	furniture/equipment	2333.000000000	no known savings	<1	4.000000000	male single	none	2.000000000	life insurance	29.000000000	bank	own	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	27.000000000	delayed previously	used car	5965.000000000	<100	>=7	1.000000000	male single	none	2.000000000	car	30.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	12.000000000	existing paid	radio/tv	1262.000000000	<100	1<=X<4	3.000000000	male single	none	2.000000000	car	25.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	18.000000000	existing paid	used car	3378.000000000	no known savings	1<=X<4	2.000000000	male single	none	1.000000000	life insurance	31.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	36.000000000	delayed previously	new car	2225.000000000	<100	>=7	4.000000000	male single	none	4.000000000	no known property	57.000000000	bank	for free	2.000000000	skilled	1.000000000	yes	yes	bad
no checking	6.000000000	all paid	new car	783.000000000	no known savings	1<=X<4	1.000000000	male single	guarantor	2.000000000	real estate	26.000000000	stores	own	1.000000000	unskilled resident	2.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	radio/tv	6468.000000000	no known savings	unemployed	2.000000000	male single	none	1.000000000	no known property	52.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	36.000000000	critical/other existing credit	radio/tv	9566.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	none	2.000000000	car	31.000000000	stores	own	2.000000000	skilled	1.000000000	none	yes	good
>=200	18.000000000	existing paid	new car	1961.000000000	<100	>=7	3.000000000	female div/dep/mar	none	2.000000000	car	23.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	good
<0	36.000000000	critical/other existing credit	furniture/equipment	6229.000000000	<100	<1	4.000000000	female div/dep/mar	co applicant	4.000000000	no known property	23.000000000	none	rent	2.000000000	unskilled resident	1.000000000	yes	yes	bad
0<=X<200	9.000000000	existing paid	business	1391.000000000	<100	1<=X<4	2.000000000	male mar/wid	none	1.000000000	real estate	27.000000000	bank	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	15.000000000	critical/other existing credit	radio/tv	1537.000000000	no known savings	>=7	4.000000000	male single	guarantor	4.000000000	real estate	50.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	36.000000000	no credits/all paid	business	1953.000000000	<100	>=7	4.000000000	male single	none	4.000000000	no known property	61.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
0<=X<200	48.000000000	no credits/all paid	business	14421.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	car	25.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	bad
no checking	24.000000000	existing paid	radio/tv	3181.000000000	<100	<1	4.000000000	female div/dep/mar	none	4.000000000	life insurance	26.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	27.000000000	existing paid	repairs	5190.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	life insurance	48.000000000	none	own	4.000000000	skilled	2.000000000	yes	yes	good
no checking	12.000000000	existing paid	radio/tv	2171.000000000	<100	<1	2.000000000	female div/dep/mar	none	2.000000000	car	29.000000000	bank	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	new car	1007.000000000	>=1000	1<=X<4	4.000000000	male mar/wid	none	1.000000000	real estate	22.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	36.000000000	existing paid	education	1819.000000000	<100	1<=X<4	4.000000000	male single	none	4.000000000	no known property	37.000000000	stores	for free	1.000000000	skilled	1.000000000	yes	yes	bad
no checking	36.000000000	existing paid	radio/tv	2394.000000000	no known savings	1<=X<4	4.000000000	female div/dep/mar	none	4.000000000	car	25.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	36.000000000	existing paid	used car	8133.000000000	<100	1<=X<4	1.000000000	female div/dep/mar	none	2.000000000	life insurance	30.000000000	bank	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	7.000000000	critical/other existing credit	radio/tv	730.000000000	no known savings	>=7	4.000000000	male single	none	2.000000000	life insurance	46.000000000	none	rent	2.000000000	unskilled resident	1.000000000	yes	yes	good
<0	8.000000000	critical/other existing credit	other	1164.000000000	<100	>=7	3.000000000	male single	none	4.000000000	no known property	51.000000000	bank	for free	2.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	good
0<=X<200	42.000000000	critical/other existing credit	business	5954.000000000	<100	4<=X<7	2.000000000	female div/dep/mar	none	1.000000000	real estate	41.000000000	bank	own	2.000000000	unskilled resident	1.000000000	none	yes	good
<0	36.000000000	existing paid	education	1977.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	no known property	40.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
<0	12.000000000	critical/other existing credit	used car	1526.000000000	<100	>=7	4.000000000	male single	none	4.000000000	no known property	66.000000000	none	for free	2.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	good
<0	42.000000000	existing paid	radio/tv	3965.000000000	<100	<1	4.000000000	male single	none	3.000000000	car	34.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	11.000000000	delayed previously	radio/tv	4771.000000000	<100	4<=X<7	2.000000000	male single	none	4.000000000	life insurance	51.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	54.000000000	no credits/all paid	used car	9436.000000000	no known savings	1<=X<4	2.000000000	male single	none	2.000000000	life insurance	39.000000000	none	own	1.000000000	unskilled resident	2.000000000	none	yes	good
0<=X<200	30.000000000	existing paid	furniture/equipment	3832.000000000	<100	<1	2.000000000	male mar/wid	none	1.000000000	life insurance	22.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	existing paid	radio/tv	5943.000000000	no known savings	<1	1.000000000	female div/dep/mar	none	1.000000000	car	44.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	bad
no checking	15.000000000	existing paid	radio/tv	1213.000000000	500<=X<1000	>=7	4.000000000	male single	none	3.000000000	life insurance	47.000000000	stores	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	18.000000000	existing paid	business	1568.000000000	100<=X<500	1<=X<4	3.000000000	female div/dep/mar	none	4.000000000	life insurance	24.000000000	none	rent	1.000000000	unskilled resident	1.000000000	none	yes	good
<0	24.000000000	existing paid	other	1755.000000000	<100	>=7	4.000000000	female div/dep/mar	guarantor	4.000000000	real estate	58.000000000	none	own	1.000000000	unskilled resident	1.000000000	yes	yes	good
<0	10.000000000	existing paid	radio/tv	2315.000000000	<100	>=7	3.000000000	male single	none	4.000000000	real estate	52.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	12.000000000	critical/other existing credit	business	1412.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	guarantor	2.000000000	real estate	29.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	18.000000000	critical/other existing credit	furniture/equipment	1295.000000000	<100	<1	4.000000000	female div/dep/mar	none	1.000000000	life insurance	27.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	36.000000000	existing paid	education	12612.000000000	100<=X<500	1<=X<4	1.000000000	male single	none	4.000000000	no known property	47.000000000	none	for free	1.000000000	skilled	2.000000000	yes	yes	bad
<0	18.000000000	existing paid	new car	2249.000000000	100<=X<500	4<=X<7	4.000000000	male single	none	3.000000000	car	30.000000000	none	own	1.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	good
<0	12.000000000	no credits/all paid	repairs	1108.000000000	<100	4<=X<7	4.000000000	male single	none	3.000000000	real estate	28.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	bad
no checking	12.000000000	critical/other existing credit	radio/tv	618.000000000	<100	>=7	4.000000000	male single	none	4.000000000	real estate	56.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	12.000000000	critical/other existing credit	used car	1409.000000000	<100	>=7	4.000000000	male single	none	3.000000000	real estate	54.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	12.000000000	critical/other existing credit	radio/tv	797.000000000	no known savings	>=7	4.000000000	female div/dep/mar	none	3.000000000	life insurance	33.000000000	bank	own	1.000000000	unskilled resident	2.000000000	none	yes	bad
>=200	24.000000000	critical/other existing credit	furniture/equipment	3617.000000000	no known savings	>=7	4.000000000	male single	co applicant	4.000000000	no known property	20.000000000	none	rent	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	new car	1318.000000000	>=1000	>=7	4.000000000	male single	none	4.000000000	real estate	54.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	54.000000000	no credits/all paid	business	15945.000000000	<100	<1	3.000000000	male single	none	4.000000000	no known property	58.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	bad
no checking	12.000000000	critical/other existing credit	education	2012.000000000	no known savings	4<=X<7	4.000000000	female div/dep/mar	none	2.000000000	car	61.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	18.000000000	existing paid	business	2622.000000000	100<=X<500	1<=X<4	4.000000000	male single	none	4.000000000	car	34.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	36.000000000	critical/other existing credit	radio/tv	2337.000000000	<100	>=7	4.000000000	male single	none	4.000000000	real estate	36.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	20.000000000	delayed previously	used car	7057.000000000	no known savings	4<=X<7	3.000000000	male single	none	4.000000000	life insurance	36.000000000	bank	rent	2.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	good
no checking	24.000000000	existing paid	new car	1469.000000000	100<=X<500	>=7	4.000000000	male mar/wid	none	4.000000000	real estate	41.000000000	none	rent	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	36.000000000	existing paid	radio/tv	2323.000000000	<100	4<=X<7	4.000000000	male single	none	4.000000000	car	24.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
no checking	6.000000000	delayed previously	radio/tv	932.000000000	<100	1<=X<4	3.000000000	female div/dep/mar	none	2.000000000	real estate	24.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	9.000000000	critical/other existing credit	furniture/equipment	1919.000000000	<100	4<=X<7	4.000000000	male single	none	3.000000000	car	35.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	good
no checking	12.000000000	existing paid	used car	2445.000000000	no known savings	<1	2.000000000	male mar/wid	none	4.000000000	car	26.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	24.000000000	critical/other existing credit	other	11938.000000000	<100	1<=X<4	2.000000000	male single	co applicant	3.000000000	car	39.000000000	none	own	2.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	bad
no checking	18.000000000	all paid	new car	6458.000000000	<100	>=7	2.000000000	male single	none	4.000000000	no known property	39.000000000	bank	own	2.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	bad
0<=X<200	12.000000000	existing paid	new car	6078.000000000	<100	4<=X<7	2.000000000	male single	none	2.000000000	car	32.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	24.000000000	existing paid	furniture/equipment	7721.000000000	no known savings	<1	1.000000000	female div/dep/mar	none	2.000000000	life insurance	30.000000000	none	own	1.000000000	skilled	1.000000000	yes	no	good
0<=X<200	14.000000000	existing paid	business	1410.000000000	500<=X<1000	>=7	1.000000000	male mar/wid	none	2.000000000	real estate	35.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	6.000000000	delayed previously	business	1449.000000000	100<=X<500	>=7	1.000000000	male div/sep	none	2.000000000	car	31.000000000	bank	own	2.000000000	skilled	2.000000000	none	yes	good
>=200	15.000000000	existing paid	education	392.000000000	<100	<1	4.000000000	female div/dep/mar	none	4.000000000	life insurance	23.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	18.000000000	existing paid	new car	6260.000000000	<100	4<=X<7	3.000000000	male single	none	3.000000000	real estate	28.000000000	none	rent	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	36.000000000	critical/other existing credit	new car	7855.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	2.000000000	real estate	25.000000000	stores	own	2.000000000	skilled	1.000000000	yes	yes	bad
<0	12.000000000	existing paid	radio/tv	1680.000000000	500<=X<1000	>=7	3.000000000	male mar/wid	none	1.000000000	real estate	35.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	48.000000000	critical/other existing credit	radio/tv	3578.000000000	no known savings	>=7	4.000000000	male single	none	1.000000000	real estate	47.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	42.000000000	existing paid	radio/tv	7174.000000000	no known savings	4<=X<7	4.000000000	female div/dep/mar	none	3.000000000	car	30.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
<0	10.000000000	critical/other existing credit	furniture/equipment	2132.000000000	no known savings	<1	2.000000000	female div/dep/mar	co applicant	3.000000000	real estate	27.000000000	none	rent	2.000000000	skilled	1.000000000	none	no	good
<0	33.000000000	critical/other existing credit	furniture/equipment	4281.000000000	500<=X<1000	1<=X<4	1.000000000	female div/dep/mar	none	4.000000000	car	23.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	12.000000000	critical/other existing credit	new car	2366.000000000	500<=X<1000	4<=X<7	3.000000000	male div/sep	none	3.000000000	car	36.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	21.000000000	existing paid	radio/tv	1835.000000000	<100	1<=X<4	3.000000000	female div/dep/mar	none	2.000000000	real estate	25.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	bad
no checking	24.000000000	critical/other existing credit	used car	3868.000000000	<100	>=7	4.000000000	female div/dep/mar	none	2.000000000	car	41.000000000	none	rent	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	12.000000000	existing paid	furniture/equipment	1768.000000000	<100	1<=X<4	3.000000000	male single	none	2.000000000	real estate	24.000000000	none	rent	1.000000000	unskilled resident	1.000000000	none	yes	good
>=200	10.000000000	critical/other existing credit	new car	781.000000000	<100	>=7	4.000000000	male single	none	4.000000000	no known property	63.000000000	none	for free	2.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	18.000000000	existing paid	furniture/equipment	1924.000000000	no known savings	<1	4.000000000	female div/dep/mar	none	3.000000000	real estate	27.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
<0	12.000000000	critical/other existing credit	new car	2121.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	life insurance	30.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
<0	12.000000000	existing paid	radio/tv	701.000000000	<100	1<=X<4	4.000000000	male mar/wid	none	2.000000000	real estate	40.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	repairs	639.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	car	30.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	12.000000000	critical/other existing credit	used car	1860.000000000	<100	unemployed	4.000000000	male single	none	2.000000000	car	34.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	12.000000000	critical/other existing credit	new car	3499.000000000	<100	1<=X<4	3.000000000	female div/dep/mar	co applicant	2.000000000	real estate	29.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	48.000000000	existing paid	new car	8487.000000000	no known savings	4<=X<7	1.000000000	female div/dep/mar	none	2.000000000	car	24.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	36.000000000	delayed previously	education	6887.000000000	<100	1<=X<4	4.000000000	male single	none	3.000000000	life insurance	29.000000000	stores	own	1.000000000	skilled	1.000000000	yes	yes	bad
no checking	15.000000000	existing paid	furniture/equipment	2708.000000000	<100	<1	2.000000000	male single	none	3.000000000	life insurance	27.000000000	bank	own	2.000000000	unskilled resident	1.000000000	none	yes	good
no checking	18.000000000	existing paid	furniture/equipment	1984.000000000	<100	1<=X<4	4.000000000	male single	none	4.000000000	no known property	47.000000000	bank	for free	2.000000000	skilled	1.000000000	none	yes	good
no checking	60.000000000	existing paid	radio/tv	10144.000000000	100<=X<500	4<=X<7	2.000000000	female div/dep/mar	none	4.000000000	real estate	21.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	12.000000000	critical/other existing credit	radio/tv	1240.000000000	no known savings	>=7	4.000000000	female div/dep/mar	none	2.000000000	real estate	38.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	27.000000000	delayed previously	used car	8613.000000000	>=1000	1<=X<4	2.000000000	male single	none	2.000000000	car	27.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	radio/tv	766.000000000	500<=X<1000	1<=X<4	4.000000000	male single	none	3.000000000	real estate	66.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
0<=X<200	15.000000000	critical/other existing credit	radio/tv	2728.000000000	no known savings	4<=X<7	4.000000000	male single	guarantor	2.000000000	real estate	35.000000000	bank	own	3.000000000	skilled	1.000000000	yes	yes	good
>=200	12.000000000	existing paid	radio/tv	1881.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	none	2.000000000	car	44.000000000	none	rent	1.000000000	unskilled resident	1.000000000	yes	yes	good
>=200	6.000000000	existing paid	new car	709.000000000	>=1000	<1	2.000000000	male mar/wid	none	2.000000000	real estate	27.000000000	none	own	1.000000000	unemp/unskilled non res	1.000000000	none	no	good
0<=X<200	36.000000000	existing paid	radio/tv	4795.000000000	<100	<1	4.000000000	female div/dep/mar	none	1.000000000	no known property	30.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	27.000000000	existing paid	radio/tv	3416.000000000	<100	1<=X<4	3.000000000	male single	none	2.000000000	car	27.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	good
<0	18.000000000	existing paid	furniture/equipment	2462.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	car	22.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	21.000000000	critical/other existing credit	furniture/equipment	2288.000000000	<100	<1	4.000000000	female div/dep/mar	none	4.000000000	life insurance	23.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	48.000000000	all paid	business	3566.000000000	100<=X<500	4<=X<7	4.000000000	male single	none	2.000000000	car	30.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	6.000000000	critical/other existing credit	new car	860.000000000	<100	>=7	1.000000000	female div/dep/mar	none	4.000000000	no known property	39.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	12.000000000	critical/other existing credit	new car	682.000000000	100<=X<500	4<=X<7	4.000000000	female div/dep/mar	none	3.000000000	car	51.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
<0	36.000000000	critical/other existing credit	furniture/equipment	5371.000000000	<100	1<=X<4	3.000000000	male single	guarantor	2.000000000	life insurance	28.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	18.000000000	critical/other existing credit	radio/tv	1582.000000000	>=1000	>=7	4.000000000	male single	none	4.000000000	car	46.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	6.000000000	existing paid	radio/tv	1346.000000000	100<=X<500	>=7	2.000000000	male single	none	4.000000000	no known property	42.000000000	bank	for free	1.000000000	skilled	2.000000000	yes	yes	good
no checking	10.000000000	existing paid	radio/tv	1924.000000000	<100	1<=X<4	1.000000000	male single	none	4.000000000	life insurance	38.000000000	none	own	1.000000000	skilled	1.000000000	yes	no	good
>=200	36.000000000	existing paid	radio/tv	5848.000000000	<100	1<=X<4	4.000000000	male single	none	1.000000000	car	24.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	24.000000000	critical/other existing credit	used car	7758.000000000	>=1000	>=7	2.000000000	female div/dep/mar	none	4.000000000	no known property	29.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	24.000000000	delayed previously	business	6967.000000000	100<=X<500	4<=X<7	4.000000000	male single	none	4.000000000	car	36.000000000	none	rent	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	12.000000000	existing paid	furniture/equipment	1282.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	none	4.000000000	car	20.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
<0	9.000000000	critical/other existing credit	repairs	1288.000000000	100<=X<500	>=7	3.000000000	male single	guarantor	4.000000000	real estate	48.000000000	none	own	2.000000000	skilled	2.000000000	none	no	good
<0	12.000000000	all paid	retraining	339.000000000	<100	>=7	4.000000000	male mar/wid	none	1.000000000	car	45.000000000	bank	own	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	24.000000000	existing paid	new car	3512.000000000	100<=X<500	4<=X<7	2.000000000	male single	none	3.000000000	car	38.000000000	bank	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	6.000000000	critical/other existing credit	radio/tv	1898.000000000	no known savings	1<=X<4	1.000000000	male single	none	2.000000000	real estate	34.000000000	none	own	2.000000000	unskilled resident	2.000000000	none	yes	good
no checking	24.000000000	critical/other existing credit	radio/tv	2872.000000000	100<=X<500	>=7	3.000000000	male single	none	4.000000000	real estate	36.000000000	none	own	1.000000000	skilled	2.000000000	yes	yes	good
no checking	18.000000000	critical/other existing credit	new car	1055.000000000	<100	<1	4.000000000	female div/dep/mar	none	1.000000000	life insurance	30.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	15.000000000	existing paid	domestic appliance	1262.000000000	500<=X<1000	4<=X<7	4.000000000	male single	none	3.000000000	life insurance	36.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	10.000000000	existing paid	new car	7308.000000000	<100	unemployed	2.000000000	male single	none	4.000000000	no known property	70.000000000	bank	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	36.000000000	existing paid	new car	909.000000000	500<=X<1000	>=7	4.000000000	male single	none	4.000000000	life insurance	36.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	6.000000000	existing paid	furniture/equipment	2978.000000000	500<=X<1000	1<=X<4	1.000000000	male single	none	2.000000000	car	32.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	18.000000000	existing paid	furniture/equipment	1131.000000000	<100	unemployed	4.000000000	female div/dep/mar	none	2.000000000	car	33.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	11.000000000	existing paid	furniture/equipment	1577.000000000	>=1000	<1	4.000000000	female div/dep/mar	none	1.000000000	real estate	20.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	existing paid	furniture/equipment	3972.000000000	<100	4<=X<7	2.000000000	female div/dep/mar	none	4.000000000	life insurance	25.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	24.000000000	critical/other existing credit	business	1935.000000000	<100	>=7	4.000000000	male div/sep	none	4.000000000	real estate	31.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	bad
<0	15.000000000	no credits/all paid	new car	950.000000000	<100	>=7	4.000000000	male single	none	3.000000000	car	33.000000000	none	rent	2.000000000	skilled	2.000000000	none	yes	bad
no checking	12.000000000	existing paid	furniture/equipment	763.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	1.000000000	real estate	26.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	5.000000000	existing paid	business	3448.000000000	<100	4<=X<7	1.000000000	male single	none	4.000000000	real estate	74.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	24.000000000	delayed previously	furniture/equipment	2064.000000000	<100	unemployed	3.000000000	female div/dep/mar	none	2.000000000	life insurance	34.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
0<=X<200	8.000000000	existing paid	radio/tv	1414.000000000	<100	1<=X<4	4.000000000	male single	guarantor	2.000000000	real estate	33.000000000	none	own	1.000000000	skilled	1.000000000	none	no	good
<0	21.000000000	delayed previously	education	3414.000000000	<100	<1	2.000000000	male single	none	1.000000000	life insurance	26.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	bad
no checking	30.000000000	all paid	used car	7485.000000000	no known savings	unemployed	4.000000000	female div/dep/mar	none	1.000000000	real estate	53.000000000	bank	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
<0	12.000000000	existing paid	furniture/equipment	2577.000000000	<100	1<=X<4	2.000000000	male div/sep	none	1.000000000	car	42.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	6.000000000	critical/other existing credit	radio/tv	338.000000000	500<=X<1000	>=7	4.000000000	male single	none	4.000000000	car	52.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	12.000000000	existing paid	radio/tv	1963.000000000	<100	4<=X<7	4.000000000	male single	none	2.000000000	car	31.000000000	none	rent	2.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	good
<0	21.000000000	critical/other existing credit	new car	571.000000000	<100	>=7	4.000000000	male single	none	4.000000000	real estate	65.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	36.000000000	delayed previously	business	9572.000000000	<100	<1	1.000000000	male div/sep	none	1.000000000	car	28.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	36.000000000	delayed previously	business	4455.000000000	<100	1<=X<4	2.000000000	male div/sep	none	2.000000000	real estate	30.000000000	stores	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
<0	21.000000000	all paid	new car	1647.000000000	no known savings	1<=X<4	4.000000000	male single	none	2.000000000	life insurance	40.000000000	none	own	2.000000000	unskilled resident	2.000000000	none	yes	bad
no checking	24.000000000	critical/other existing credit	furniture/equipment	3777.000000000	>=1000	1<=X<4	4.000000000	male single	none	4.000000000	real estate	50.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	18.000000000	critical/other existing credit	new car	884.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	36.000000000	bank	own	1.000000000	skilled	2.000000000	yes	yes	bad
no checking	15.000000000	critical/other existing credit	radio/tv	1360.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	life insurance	31.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	9.000000000	all paid	used car	5129.000000000	<100	>=7	2.000000000	female div/dep/mar	none	4.000000000	no known property	74.000000000	bank	for free	1.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	bad
0<=X<200	16.000000000	critical/other existing credit	new car	1175.000000000	<100	unemployed	2.000000000	male single	none	3.000000000	car	68.000000000	none	for free	3.000000000	unemp/unskilled non res	1.000000000	yes	yes	good
<0	12.000000000	existing paid	radio/tv	674.000000000	100<=X<500	4<=X<7	4.000000000	male mar/wid	none	1.000000000	life insurance	20.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	18.000000000	no credits/all paid	furniture/equipment	3244.000000000	<100	1<=X<4	1.000000000	female div/dep/mar	none	4.000000000	car	33.000000000	bank	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	24.000000000	existing paid	business	4591.000000000	>=1000	1<=X<4	2.000000000	male single	none	3.000000000	life insurance	54.000000000	none	own	3.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
0<=X<200	48.000000000	no credits/all paid	business	3844.000000000	100<=X<500	4<=X<7	4.000000000	male single	none	4.000000000	no known property	34.000000000	none	for free	1.000000000	unskilled resident	2.000000000	none	yes	bad
0<=X<200	27.000000000	existing paid	business	3915.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	car	36.000000000	none	own	1.000000000	skilled	2.000000000	yes	yes	bad
no checking	6.000000000	existing paid	radio/tv	2108.000000000	<100	4<=X<7	2.000000000	male mar/wid	none	2.000000000	real estate	29.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	45.000000000	existing paid	radio/tv	3031.000000000	100<=X<500	1<=X<4	4.000000000	male single	guarantor	4.000000000	life insurance	21.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	9.000000000	critical/other existing credit	education	1501.000000000	<100	>=7	2.000000000	female div/dep/mar	none	3.000000000	car	34.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	6.000000000	critical/other existing credit	radio/tv	1382.000000000	<100	1<=X<4	1.000000000	female div/dep/mar	none	1.000000000	car	28.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	12.000000000	existing paid	furniture/equipment	951.000000000	100<=X<500	<1	4.000000000	female div/dep/mar	none	4.000000000	car	27.000000000	bank	rent	4.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	24.000000000	existing paid	used car	2760.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	no known property	36.000000000	bank	for free	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	18.000000000	delayed previously	furniture/equipment	4297.000000000	<100	>=7	4.000000000	male div/sep	none	3.000000000	no known property	40.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	9.000000000	critical/other existing credit	education	936.000000000	500<=X<1000	>=7	4.000000000	male single	none	2.000000000	car	52.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
<0	12.000000000	existing paid	new car	1168.000000000	<100	1<=X<4	4.000000000	male mar/wid	none	3.000000000	real estate	27.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	27.000000000	delayed previously	business	5117.000000000	<100	4<=X<7	3.000000000	male single	none	4.000000000	car	26.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
<0	12.000000000	existing paid	retraining	902.000000000	<100	4<=X<7	4.000000000	male mar/wid	none	4.000000000	life insurance	21.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
no checking	12.000000000	critical/other existing credit	new car	1495.000000000	<100	>=7	4.000000000	male single	none	1.000000000	real estate	38.000000000	none	own	2.000000000	unskilled resident	2.000000000	none	yes	good
<0	30.000000000	critical/other existing credit	used car	10623.000000000	<100	>=7	3.000000000	male single	none	4.000000000	no known property	38.000000000	none	for free	3.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	good
no checking	12.000000000	critical/other existing credit	furniture/equipment	1935.000000000	<100	>=7	4.000000000	male single	none	4.000000000	real estate	43.000000000	none	own	3.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	12.000000000	critical/other existing credit	domestic appliance	1424.000000000	<100	4<=X<7	4.000000000	male single	none	3.000000000	life insurance	26.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	24.000000000	existing paid	business	6568.000000000	<100	1<=X<4	2.000000000	male mar/wid	none	2.000000000	car	21.000000000	stores	own	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	12.000000000	existing paid	used car	1413.000000000	>=1000	4<=X<7	3.000000000	male single	none	2.000000000	life insurance	55.000000000	none	own	1.000000000	skilled	1.000000000	none	no	good
no checking	9.000000000	critical/other existing credit	radio/tv	3074.000000000	no known savings	1<=X<4	1.000000000	male single	none	2.000000000	real estate	33.000000000	none	own	2.000000000	skilled	2.000000000	none	yes	good
no checking	36.000000000	existing paid	radio/tv	3835.000000000	no known savings	>=7	2.000000000	female div/dep/mar	none	4.000000000	real estate	45.000000000	none	own	1.000000000	unskilled resident	1.000000000	yes	yes	good
<0	27.000000000	no credits/all paid	business	5293.000000000	<100	unemployed	2.000000000	male single	none	4.000000000	life insurance	50.000000000	stores	own	2.000000000	skilled	1.000000000	yes	yes	bad
>=200	30.000000000	delayed previously	business	1908.000000000	<100	>=7	4.000000000	male single	none	4.000000000	real estate	66.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	36.000000000	critical/other existing credit	radio/tv	3342.000000000	no known savings	>=7	4.000000000	male single	none	2.000000000	car	51.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	6.000000000	critical/other existing credit	retraining	932.000000000	no known savings	4<=X<7	1.000000000	female div/dep/mar	none	3.000000000	life insurance	39.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
<0	18.000000000	no credits/all paid	business	3104.000000000	<100	4<=X<7	3.000000000	male single	none	1.000000000	life insurance	31.000000000	bank	own	1.000000000	skilled	1.000000000	yes	yes	good
>=200	36.000000000	existing paid	radio/tv	3913.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	real estate	23.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	24.000000000	existing paid	furniture/equipment	3021.000000000	<100	1<=X<4	2.000000000	male div/sep	none	2.000000000	real estate	24.000000000	none	rent	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	10.000000000	existing paid	new car	1364.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	none	4.000000000	car	64.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	12.000000000	existing paid	radio/tv	625.000000000	<100	<1	4.000000000	male mar/wid	guarantor	1.000000000	real estate	26.000000000	bank	own	1.000000000	unskilled resident	1.000000000	none	yes	good
<0	12.000000000	existing paid	education	1200.000000000	no known savings	1<=X<4	4.000000000	female div/dep/mar	none	4.000000000	life insurance	23.000000000	bank	rent	1.000000000	skilled	1.000000000	yes	yes	good
no checking	12.000000000	existing paid	radio/tv	707.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	real estate	30.000000000	bank	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	delayed previously	business	2978.000000000	no known savings	1<=X<4	4.000000000	male single	none	4.000000000	real estate	32.000000000	none	own	2.000000000	skilled	2.000000000	yes	yes	good
no checking	15.000000000	existing paid	used car	4657.000000000	<100	1<=X<4	3.000000000	male single	none	2.000000000	car	30.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	36.000000000	no credits/all paid	repairs	2613.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	car	27.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	48.000000000	existing paid	radio/tv	10961.000000000	>=1000	4<=X<7	1.000000000	male single	co applicant	2.000000000	no known property	27.000000000	bank	own	2.000000000	skilled	1.000000000	yes	yes	bad
<0	12.000000000	existing paid	furniture/equipment	7865.000000000	<100	>=7	4.000000000	male single	none	4.000000000	no known property	53.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	9.000000000	existing paid	radio/tv	1478.000000000	<100	4<=X<7	4.000000000	male single	none	2.000000000	car	22.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
<0	24.000000000	existing paid	furniture/equipment	3149.000000000	<100	<1	4.000000000	male single	none	1.000000000	no known property	22.000000000	bank	for free	1.000000000	skilled	1.000000000	none	yes	good
>=200	36.000000000	existing paid	radio/tv	4210.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	car	26.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	9.000000000	existing paid	new car	2507.000000000	500<=X<1000	>=7	2.000000000	male single	none	4.000000000	no known property	51.000000000	none	for free	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	12.000000000	existing paid	radio/tv	2141.000000000	100<=X<500	4<=X<7	3.000000000	male single	none	1.000000000	no known property	35.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	18.000000000	existing paid	radio/tv	866.000000000	<100	1<=X<4	4.000000000	male mar/wid	guarantor	2.000000000	real estate	25.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	4.000000000	critical/other existing credit	radio/tv	1544.000000000	<100	4<=X<7	2.000000000	male single	none	1.000000000	real estate	42.000000000	none	own	3.000000000	unskilled resident	2.000000000	none	yes	good
<0	24.000000000	existing paid	radio/tv	1823.000000000	<100	unemployed	4.000000000	male single	none	2.000000000	car	30.000000000	stores	own	1.000000000	high qualif/self emp/mgmt	2.000000000	none	yes	bad
0<=X<200	6.000000000	existing paid	new car	14555.000000000	no known savings	unemployed	1.000000000	male single	none	2.000000000	life insurance	23.000000000	none	own	1.000000000	unemp/unskilled non res	1.000000000	yes	yes	bad
0<=X<200	21.000000000	existing paid	business	2767.000000000	100<=X<500	>=7	4.000000000	male div/sep	none	2.000000000	car	61.000000000	bank	rent	2.000000000	unskilled resident	1.000000000	none	yes	bad
no checking	12.000000000	critical/other existing credit	radio/tv	1291.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	2.000000000	life insurance	35.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
<0	30.000000000	existing paid	radio/tv	2522.000000000	<100	>=7	1.000000000	male single	guarantor	3.000000000	life insurance	39.000000000	none	own	1.000000000	skilled	2.000000000	none	yes	good
<0	24.000000000	existing paid	new car	915.000000000	no known savings	>=7	4.000000000	female div/dep/mar	none	2.000000000	car	29.000000000	bank	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	6.000000000	existing paid	radio/tv	1595.000000000	<100	4<=X<7	3.000000000	male single	none	2.000000000	life insurance	51.000000000	none	own	1.000000000	skilled	2.000000000	none	yes	good
<0	48.000000000	no credits/all paid	used car	4605.000000000	<100	>=7	3.000000000	male single	none	4.000000000	no known property	24.000000000	none	for free	2.000000000	skilled	2.000000000	none	yes	bad
no checking	12.000000000	critical/other existing credit	business	1185.000000000	<100	1<=X<4	3.000000000	female div/dep/mar	none	2.000000000	real estate	27.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	12.000000000	all paid	retraining	3447.000000000	500<=X<1000	1<=X<4	4.000000000	female div/dep/mar	none	3.000000000	real estate	35.000000000	none	own	1.000000000	unskilled resident	2.000000000	none	yes	good
no checking	24.000000000	existing paid	business	1258.000000000	<100	4<=X<7	4.000000000	male single	none	1.000000000	real estate	25.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	12.000000000	critical/other existing credit	radio/tv	717.000000000	<100	>=7	4.000000000	male single	none	4.000000000	real estate	52.000000000	none	own	3.000000000	skilled	1.000000000	none	yes	good
no checking	6.000000000	no credits/all paid	new car	1204.000000000	100<=X<500	1<=X<4	4.000000000	male single	none	1.000000000	no known property	35.000000000	bank	rent	1.000000000	skilled	1.000000000	none	no	good
>=200	24.000000000	existing paid	furniture/equipment	1925.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	real estate	26.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	18.000000000	existing paid	radio/tv	433.000000000	<100	unemployed	3.000000000	female div/dep/mar	co applicant	4.000000000	real estate	22.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
<0	6.000000000	critical/other existing credit	new car	666.000000000	>=1000	4<=X<7	3.000000000	female div/dep/mar	none	4.000000000	real estate	39.000000000	none	own	2.000000000	unskilled resident	1.000000000	yes	yes	good
>=200	12.000000000	existing paid	furniture/equipment	2251.000000000	<100	1<=X<4	1.000000000	female div/dep/mar	none	2.000000000	car	46.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	30.000000000	existing paid	new car	2150.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	guarantor	2.000000000	no known property	24.000000000	bank	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	24.000000000	delayed previously	furniture/equipment	4151.000000000	100<=X<500	1<=X<4	2.000000000	male single	none	3.000000000	life insurance	35.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	9.000000000	existing paid	furniture/equipment	2030.000000000	no known savings	4<=X<7	2.000000000	male single	none	1.000000000	car	24.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	60.000000000	delayed previously	radio/tv	7418.000000000	no known savings	1<=X<4	1.000000000	male single	none	1.000000000	real estate	27.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	24.000000000	critical/other existing credit	radio/tv	2684.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	real estate	35.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
<0	12.000000000	all paid	radio/tv	2149.000000000	<100	1<=X<4	4.000000000	male div/sep	none	1.000000000	no known property	29.000000000	none	for free	1.000000000	skilled	1.000000000	none	yes	bad
no checking	15.000000000	existing paid	used car	3812.000000000	100<=X<500	<1	1.000000000	female div/dep/mar	none	4.000000000	car	23.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	11.000000000	critical/other existing credit	radio/tv	1154.000000000	100<=X<500	unemployed	4.000000000	female div/dep/mar	none	4.000000000	real estate	57.000000000	none	own	3.000000000	unskilled resident	1.000000000	none	yes	good
<0	12.000000000	existing paid	furniture/equipment	1657.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	real estate	27.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	24.000000000	existing paid	radio/tv	1603.000000000	<100	>=7	4.000000000	female div/dep/mar	none	4.000000000	car	55.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	18.000000000	critical/other existing credit	new car	5302.000000000	<100	>=7	2.000000000	male single	none	4.000000000	no known property	36.000000000	none	for free	3.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	12.000000000	critical/other existing credit	education	2748.000000000	<100	>=7	2.000000000	female div/dep/mar	none	4.000000000	no known property	57.000000000	bank	for free	3.000000000	unskilled resident	1.000000000	none	yes	good
no checking	10.000000000	critical/other existing credit	new car	1231.000000000	<100	>=7	3.000000000	male single	none	4.000000000	real estate	32.000000000	none	own	2.000000000	unskilled resident	2.000000000	none	no	good
0<=X<200	15.000000000	existing paid	radio/tv	802.000000000	<100	>=7	4.000000000	male single	none	3.000000000	car	37.000000000	none	own	1.000000000	skilled	2.000000000	none	yes	bad
no checking	36.000000000	critical/other existing credit	business	6304.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	real estate	36.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	existing paid	radio/tv	1533.000000000	<100	<1	4.000000000	female div/dep/mar	none	3.000000000	car	38.000000000	stores	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	14.000000000	existing paid	new car	8978.000000000	<100	>=7	1.000000000	male div/sep	none	4.000000000	life insurance	45.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	no	bad
no checking	24.000000000	existing paid	radio/tv	999.000000000	no known savings	>=7	4.000000000	male single	none	2.000000000	car	25.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	18.000000000	existing paid	new car	2662.000000000	no known savings	4<=X<7	4.000000000	male single	none	3.000000000	life insurance	32.000000000	none	own	1.000000000	skilled	1.000000000	none	no	good
no checking	12.000000000	critical/other existing credit	furniture/equipment	1402.000000000	500<=X<1000	4<=X<7	3.000000000	female div/dep/mar	none	4.000000000	car	37.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	48.000000000	all paid	new car	12169.000000000	no known savings	unemployed	4.000000000	male single	co applicant	4.000000000	no known property	36.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	48.000000000	existing paid	radio/tv	3060.000000000	<100	4<=X<7	4.000000000	male single	none	4.000000000	real estate	28.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	bad
<0	30.000000000	existing paid	repairs	11998.000000000	<100	<1	1.000000000	male div/sep	none	1.000000000	no known property	34.000000000	none	own	1.000000000	unskilled resident	1.000000000	yes	yes	bad
no checking	9.000000000	existing paid	radio/tv	2697.000000000	<100	1<=X<4	1.000000000	male single	none	2.000000000	real estate	32.000000000	none	own	1.000000000	skilled	2.000000000	none	yes	good
no checking	18.000000000	critical/other existing credit	radio/tv	2404.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	none	2.000000000	car	26.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
<0	12.000000000	existing paid	furniture/equipment	1262.000000000	no known savings	>=7	2.000000000	male div/sep	none	4.000000000	life insurance	49.000000000	none	own	1.000000000	unskilled resident	1.000000000	yes	yes	good
no checking	6.000000000	existing paid	furniture/equipment	4611.000000000	<100	<1	1.000000000	female div/dep/mar	none	4.000000000	life insurance	32.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	24.000000000	existing paid	radio/tv	1901.000000000	100<=X<500	1<=X<4	4.000000000	male single	none	4.000000000	car	29.000000000	none	rent	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	15.000000000	critical/other existing credit	used car	3368.000000000	>=1000	>=7	3.000000000	male single	none	4.000000000	no known property	23.000000000	none	rent	2.000000000	skilled	1.000000000	yes	yes	good
no checking	12.000000000	existing paid	furniture/equipment	1574.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	real estate	50.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
>=200	18.000000000	all paid	radio/tv	1445.000000000	no known savings	4<=X<7	4.000000000	male single	none	4.000000000	car	49.000000000	bank	own	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	15.000000000	critical/other existing credit	furniture/equipment	1520.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	life insurance	63.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	24.000000000	critical/other existing credit	new car	3878.000000000	100<=X<500	<1	4.000000000	male div/sep	none	2.000000000	car	37.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	47.000000000	existing paid	new car	10722.000000000	<100	<1	1.000000000	female div/dep/mar	none	1.000000000	real estate	35.000000000	none	own	1.000000000	unskilled resident	1.000000000	yes	yes	good
<0	48.000000000	existing paid	used car	4788.000000000	<100	4<=X<7	4.000000000	male single	none	3.000000000	life insurance	26.000000000	none	own	1.000000000	skilled	2.000000000	none	yes	good
0<=X<200	48.000000000	delayed previously	other	7582.000000000	100<=X<500	unemployed	2.000000000	male single	none	4.000000000	no known property	31.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	12.000000000	existing paid	radio/tv	1092.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	guarantor	4.000000000	real estate	49.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
<0	24.000000000	delayed previously	radio/tv	1024.000000000	<100	<1	4.000000000	male mar/wid	none	4.000000000	real estate	48.000000000	stores	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	12.000000000	existing paid	business	1076.000000000	<100	1<=X<4	2.000000000	male mar/wid	none	2.000000000	real estate	26.000000000	none	own	1.000000000	skilled	1.000000000	yes	no	good
0<=X<200	36.000000000	existing paid	used car	9398.000000000	<100	<1	1.000000000	male mar/wid	none	4.000000000	car	28.000000000	none	rent	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
<0	24.000000000	critical/other existing credit	used car	6419.000000000	<100	>=7	2.000000000	female div/dep/mar	none	4.000000000	no known property	44.000000000	none	for free	2.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	good
>=200	42.000000000	critical/other existing credit	used car	4796.000000000	<100	>=7	4.000000000	male single	none	4.000000000	no known property	56.000000000	none	for free	1.000000000	skilled	1.000000000	none	yes	good
no checking	48.000000000	critical/other existing credit	business	7629.000000000	no known savings	>=7	4.000000000	male div/sep	none	2.000000000	car	46.000000000	bank	own	2.000000000	high qualif/self emp/mgmt	2.000000000	none	yes	good
0<=X<200	48.000000000	existing paid	furniture/equipment	9960.000000000	<100	<1	1.000000000	female div/dep/mar	none	2.000000000	car	26.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	bad
no checking	12.000000000	existing paid	used car	4675.000000000	no known savings	<1	1.000000000	female div/dep/mar	none	4.000000000	car	20.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
no checking	10.000000000	existing paid	new car	1287.000000000	no known savings	>=7	4.000000000	male single	co applicant	2.000000000	life insurance	45.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	no	good
no checking	18.000000000	existing paid	furniture/equipment	2515.000000000	<100	1<=X<4	3.000000000	male single	none	4.000000000	real estate	43.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	21.000000000	critical/other existing credit	furniture/equipment	2745.000000000	>=1000	4<=X<7	3.000000000	male single	none	2.000000000	car	32.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	6.000000000	existing paid	new car	672.000000000	<100	unemployed	1.000000000	female div/dep/mar	none	4.000000000	real estate	54.000000000	none	own	1.000000000	unemp/unskilled non res	1.000000000	yes	yes	good
0<=X<200	36.000000000	no credits/all paid	radio/tv	3804.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	1.000000000	car	42.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	bad
>=200	24.000000000	critical/other existing credit	new car	1344.000000000	no known savings	4<=X<7	4.000000000	male single	none	2.000000000	real estate	37.000000000	bank	own	2.000000000	unskilled resident	2.000000000	none	yes	bad
<0	10.000000000	critical/other existing credit	new car	1038.000000000	<100	4<=X<7	4.000000000	male single	co applicant	3.000000000	life insurance	49.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	48.000000000	critical/other existing credit	new car	10127.000000000	500<=X<1000	1<=X<4	2.000000000	male single	none	2.000000000	no known property	44.000000000	bank	for free	1.000000000	skilled	1.000000000	none	yes	bad
no checking	6.000000000	existing paid	furniture/equipment	1543.000000000	>=1000	1<=X<4	4.000000000	male div/sep	none	2.000000000	real estate	33.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	30.000000000	existing paid	used car	4811.000000000	no known savings	4<=X<7	2.000000000	female div/dep/mar	none	4.000000000	life insurance	24.000000000	stores	rent	1.000000000	unskilled resident	1.000000000	none	yes	good
<0	12.000000000	existing paid	radio/tv	727.000000000	100<=X<500	<1	4.000000000	male mar/wid	none	3.000000000	no known property	33.000000000	none	own	1.000000000	unskilled resident	1.000000000	yes	yes	bad
0<=X<200	8.000000000	existing paid	furniture/equipment	1237.000000000	<100	1<=X<4	3.000000000	female div/dep/mar	none	4.000000000	real estate	24.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	9.000000000	existing paid	new car	276.000000000	<100	1<=X<4	4.000000000	male mar/wid	none	4.000000000	real estate	22.000000000	none	rent	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	48.000000000	existing paid	other	5381.000000000	no known savings	unemployed	3.000000000	male single	none	4.000000000	no known property	40.000000000	bank	for free	1.000000000	unemp/unskilled non res	1.000000000	yes	yes	good
no checking	24.000000000	existing paid	furniture/equipment	5511.000000000	100<=X<500	1<=X<4	4.000000000	male single	none	1.000000000	car	25.000000000	stores	own	1.000000000	skilled	1.000000000	none	yes	good
>=200	24.000000000	existing paid	furniture/equipment	3749.000000000	<100	<1	2.000000000	female div/dep/mar	none	4.000000000	car	26.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	new car	685.000000000	<100	4<=X<7	2.000000000	male mar/wid	none	3.000000000	car	25.000000000	bank	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
>=200	4.000000000	existing paid	new car	1494.000000000	no known savings	<1	1.000000000	male single	none	2.000000000	real estate	29.000000000	none	own	1.000000000	unskilled resident	2.000000000	none	no	good
<0	36.000000000	all paid	furniture/equipment	2746.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	31.000000000	bank	own	1.000000000	skilled	1.000000000	none	yes	bad
<0	12.000000000	existing paid	furniture/equipment	708.000000000	<100	1<=X<4	2.000000000	male single	guarantor	3.000000000	life insurance	38.000000000	none	own	1.000000000	unskilled resident	2.000000000	none	yes	good
0<=X<200	24.000000000	existing paid	furniture/equipment	4351.000000000	no known savings	1<=X<4	1.000000000	female div/dep/mar	none	4.000000000	life insurance	48.000000000	none	own	1.000000000	unskilled resident	1.000000000	yes	yes	good
no checking	12.000000000	critical/other existing credit	education	701.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	car	32.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
<0	15.000000000	delayed previously	furniture/equipment	3643.000000000	<100	>=7	1.000000000	female div/dep/mar	none	4.000000000	life insurance	27.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	30.000000000	critical/other existing credit	new car	4249.000000000	<100	unemployed	4.000000000	male mar/wid	none	2.000000000	car	28.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	bad
<0	24.000000000	existing paid	radio/tv	1938.000000000	<100	<1	4.000000000	male div/sep	none	3.000000000	life insurance	32.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
<0	24.000000000	existing paid	used car	2910.000000000	<100	4<=X<7	2.000000000	male single	none	1.000000000	no known property	34.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	18.000000000	existing paid	furniture/equipment	2659.000000000	>=1000	1<=X<4	4.000000000	male single	none	2.000000000	car	28.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	18.000000000	critical/other existing credit	new car	1028.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	3.000000000	real estate	36.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
<0	8.000000000	critical/other existing credit	new car	3398.000000000	<100	4<=X<7	1.000000000	male single	none	4.000000000	real estate	39.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	no	good
no checking	12.000000000	critical/other existing credit	furniture/equipment	5801.000000000	no known savings	>=7	2.000000000	male single	none	4.000000000	life insurance	49.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	good
no checking	24.000000000	existing paid	new car	1525.000000000	>=1000	4<=X<7	4.000000000	female div/dep/mar	none	3.000000000	car	34.000000000	none	own	1.000000000	skilled	2.000000000	yes	yes	good
>=200	36.000000000	existing paid	radio/tv	4473.000000000	<100	>=7	4.000000000	male single	none	2.000000000	car	31.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	6.000000000	existing paid	radio/tv	1068.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	28.000000000	none	own	1.000000000	skilled	2.000000000	none	yes	good
<0	24.000000000	critical/other existing credit	used car	6615.000000000	<100	unemployed	2.000000000	male single	none	4.000000000	no known property	75.000000000	none	for free	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	18.000000000	critical/other existing credit	education	1864.000000000	100<=X<500	1<=X<4	4.000000000	female div/dep/mar	none	2.000000000	real estate	30.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	60.000000000	existing paid	new car	7408.000000000	100<=X<500	<1	4.000000000	female div/dep/mar	none	2.000000000	life insurance	24.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	bad
no checking	48.000000000	critical/other existing credit	used car	11590.000000000	100<=X<500	1<=X<4	2.000000000	female div/dep/mar	none	4.000000000	car	24.000000000	bank	rent	2.000000000	unskilled resident	1.000000000	none	yes	bad
<0	24.000000000	no credits/all paid	furniture/equipment	4110.000000000	<100	>=7	3.000000000	male single	none	4.000000000	no known property	23.000000000	bank	rent	2.000000000	skilled	2.000000000	none	yes	bad
<0	6.000000000	critical/other existing credit	furniture/equipment	3384.000000000	<100	1<=X<4	1.000000000	male div/sep	none	4.000000000	real estate	44.000000000	none	rent	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
0<=X<200	13.000000000	existing paid	radio/tv	2101.000000000	<100	<1	2.000000000	female div/dep/mar	guarantor	4.000000000	life insurance	23.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
<0	15.000000000	existing paid	domestic appliance	1275.000000000	no known savings	1<=X<4	4.000000000	female div/dep/mar	none	2.000000000	car	24.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
<0	24.000000000	existing paid	furniture/equipment	4169.000000000	<100	1<=X<4	4.000000000	male single	none	4.000000000	life insurance	28.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	10.000000000	existing paid	furniture/equipment	1521.000000000	<100	1<=X<4	4.000000000	male div/sep	none	2.000000000	car	31.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	24.000000000	critical/other existing credit	education	5743.000000000	<100	<1	2.000000000	female div/dep/mar	none	4.000000000	no known property	24.000000000	none	for free	2.000000000	skilled	1.000000000	yes	yes	good
<0	21.000000000	existing paid	furniture/equipment	3599.000000000	<100	4<=X<7	1.000000000	female div/dep/mar	none	4.000000000	car	26.000000000	none	rent	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	18.000000000	existing paid	radio/tv	3213.000000000	500<=X<1000	<1	1.000000000	male mar/wid	none	3.000000000	real estate	25.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	18.000000000	existing paid	business	4439.000000000	<100	>=7	1.000000000	male single	co applicant	1.000000000	real estate	33.000000000	bank	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
>=200	10.000000000	existing paid	new car	3949.000000000	<100	<1	1.000000000	male single	guarantor	1.000000000	life insurance	37.000000000	none	own	1.000000000	unskilled resident	2.000000000	none	yes	good
no checking	15.000000000	critical/other existing credit	radio/tv	1459.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	2.000000000	car	43.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	13.000000000	critical/other existing credit	radio/tv	882.000000000	<100	<1	4.000000000	male single	guarantor	4.000000000	real estate	23.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	24.000000000	existing paid	radio/tv	3758.000000000	500<=X<1000	unemployed	1.000000000	female div/dep/mar	none	4.000000000	no known property	23.000000000	none	rent	1.000000000	unemp/unskilled non res	1.000000000	none	yes	good
no checking	6.000000000	delayed previously	business	1743.000000000	100<=X<500	1<=X<4	1.000000000	male single	none	2.000000000	real estate	34.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	9.000000000	critical/other existing credit	education	1136.000000000	>=1000	>=7	4.000000000	male single	none	3.000000000	no known property	32.000000000	none	for free	2.000000000	skilled	2.000000000	none	yes	bad
no checking	9.000000000	existing paid	domestic appliance	1236.000000000	<100	<1	1.000000000	female div/dep/mar	none	4.000000000	real estate	23.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	9.000000000	existing paid	furniture/equipment	959.000000000	<100	1<=X<4	1.000000000	female div/dep/mar	none	2.000000000	car	29.000000000	none	own	1.000000000	skilled	1.000000000	none	no	bad
no checking	18.000000000	critical/other existing credit	used car	3229.000000000	no known savings	unemployed	2.000000000	male single	none	4.000000000	no known property	38.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	12.000000000	no credits/all paid	radio/tv	6199.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	life insurance	28.000000000	none	rent	2.000000000	skilled	1.000000000	yes	yes	bad
no checking	10.000000000	existing paid	education	727.000000000	500<=X<1000	>=7	4.000000000	male single	none	4.000000000	no known property	46.000000000	none	for free	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	24.000000000	existing paid	new car	1246.000000000	<100	<1	4.000000000	male single	none	2.000000000	real estate	23.000000000	stores	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
no checking	12.000000000	critical/other existing credit	radio/tv	2331.000000000	no known savings	>=7	1.000000000	male single	co applicant	4.000000000	real estate	49.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	36.000000000	delayed previously	radio/tv	4463.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	car	26.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	12.000000000	existing paid	radio/tv	776.000000000	<100	1<=X<4	4.000000000	male mar/wid	none	2.000000000	real estate	28.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	30.000000000	existing paid	furniture/equipment	2406.000000000	<100	4<=X<7	4.000000000	female div/dep/mar	none	4.000000000	real estate	23.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	18.000000000	existing paid	education	1239.000000000	no known savings	1<=X<4	4.000000000	male single	none	4.000000000	no known property	61.000000000	none	for free	1.000000000	skilled	1.000000000	none	yes	good
>=200	12.000000000	existing paid	radio/tv	3399.000000000	no known savings	>=7	2.000000000	male single	none	3.000000000	car	37.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	good
>=200	12.000000000	delayed previously	new car	2247.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	none	2.000000000	car	36.000000000	stores	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	6.000000000	existing paid	furniture/equipment	1766.000000000	<100	1<=X<4	1.000000000	male mar/wid	none	2.000000000	life insurance	21.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
<0	18.000000000	existing paid	furniture/equipment	2473.000000000	<100	unemployed	4.000000000	male single	none	1.000000000	car	25.000000000	none	own	1.000000000	unemp/unskilled non res	1.000000000	none	yes	bad
no checking	12.000000000	existing paid	business	1542.000000000	<100	4<=X<7	2.000000000	male single	none	4.000000000	car	36.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	18.000000000	critical/other existing credit	used car	3850.000000000	<100	4<=X<7	3.000000000	male single	none	1.000000000	car	27.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
<0	18.000000000	existing paid	furniture/equipment	3650.000000000	<100	<1	1.000000000	female div/dep/mar	none	4.000000000	car	22.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
<0	36.000000000	existing paid	furniture/equipment	3446.000000000	<100	>=7	4.000000000	male single	none	2.000000000	car	42.000000000	none	own	1.000000000	skilled	2.000000000	none	yes	bad
0<=X<200	18.000000000	existing paid	furniture/equipment	3001.000000000	<100	4<=X<7	2.000000000	female div/dep/mar	none	4.000000000	real estate	40.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
no checking	36.000000000	existing paid	new car	3079.000000000	no known savings	1<=X<4	4.000000000	male single	none	4.000000000	real estate	36.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	18.000000000	critical/other existing credit	radio/tv	6070.000000000	<100	>=7	3.000000000	male single	none	4.000000000	car	33.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	10.000000000	critical/other existing credit	furniture/equipment	2146.000000000	<100	<1	1.000000000	female div/dep/mar	none	3.000000000	real estate	23.000000000	none	rent	2.000000000	skilled	1.000000000	none	yes	good
no checking	60.000000000	critical/other existing credit	new car	13756.000000000	no known savings	>=7	2.000000000	male single	none	4.000000000	no known property	63.000000000	bank	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	60.000000000	all paid	other	14782.000000000	100<=X<500	>=7	3.000000000	female div/dep/mar	none	4.000000000	no known property	60.000000000	bank	for free	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
<0	48.000000000	all paid	business	7685.000000000	<100	4<=X<7	2.000000000	female div/dep/mar	guarantor	4.000000000	car	37.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
no checking	18.000000000	delayed previously	radio/tv	2320.000000000	<100	unemployed	2.000000000	male mar/wid	none	3.000000000	real estate	34.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	7.000000000	delayed previously	radio/tv	846.000000000	no known savings	>=7	3.000000000	male single	none	4.000000000	no known property	36.000000000	none	for free	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	36.000000000	existing paid	new car	14318.000000000	<100	>=7	4.000000000	male single	none	2.000000000	no known property	57.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	6.000000000	critical/other existing credit	new car	362.000000000	100<=X<500	1<=X<4	4.000000000	female div/dep/mar	none	4.000000000	car	52.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
<0	20.000000000	existing paid	furniture/equipment	2212.000000000	no known savings	4<=X<7	4.000000000	male single	none	4.000000000	car	39.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	18.000000000	existing paid	used car	12976.000000000	<100	unemployed	3.000000000	female div/dep/mar	none	4.000000000	no known property	38.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	22.000000000	existing paid	new car	1283.000000000	no known savings	4<=X<7	4.000000000	female div/dep/mar	none	4.000000000	life insurance	25.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
>=200	12.000000000	existing paid	new car	1330.000000000	<100	<1	4.000000000	male single	none	1.000000000	real estate	26.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	30.000000000	delayed previously	business	4272.000000000	100<=X<500	1<=X<4	2.000000000	male single	none	2.000000000	life insurance	26.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
no checking	18.000000000	critical/other existing credit	radio/tv	2238.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	none	1.000000000	car	25.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	18.000000000	existing paid	radio/tv	1126.000000000	no known savings	<1	4.000000000	female div/dep/mar	none	2.000000000	real estate	21.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	24.000000000	existing paid	other	11328.000000000	<100	1<=X<4	2.000000000	male single	co applicant	3.000000000	car	29.000000000	bank	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
0<=X<200	18.000000000	critical/other existing credit	furniture/equipment	7374.000000000	<100	unemployed	4.000000000	male single	none	4.000000000	life insurance	40.000000000	stores	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	15.000000000	critical/other existing credit	business	2326.000000000	500<=X<1000	1<=X<4	2.000000000	male single	none	4.000000000	car	27.000000000	bank	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	9.000000000	existing paid	business	1449.000000000	<100	4<=X<7	3.000000000	female div/dep/mar	none	2.000000000	car	27.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	18.000000000	existing paid	new car	1820.000000000	<100	1<=X<4	2.000000000	male mar/wid	none	2.000000000	life insurance	30.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	12.000000000	existing paid	furniture/equipment	983.000000000	>=1000	<1	1.000000000	female div/dep/mar	none	4.000000000	real estate	19.000000000	none	rent	1.000000000	unskilled resident	1.000000000	none	yes	good
<0	36.000000000	existing paid	new car	3249.000000000	<100	4<=X<7	2.000000000	male single	none	4.000000000	no known property	39.000000000	bank	for free	1.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	good
<0	6.000000000	critical/other existing credit	radio/tv	1957.000000000	<100	4<=X<7	1.000000000	female div/dep/mar	none	4.000000000	car	31.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	9.000000000	critical/other existing credit	furniture/equipment	2406.000000000	<100	unemployed	2.000000000	male single	none	3.000000000	car	31.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	good
0<=X<200	39.000000000	delayed previously	education	11760.000000000	100<=X<500	4<=X<7	2.000000000	male single	none	3.000000000	no known property	32.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	good
<0	12.000000000	existing paid	furniture/equipment	2578.000000000	<100	unemployed	3.000000000	female div/dep/mar	none	4.000000000	no known property	55.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	good
<0	36.000000000	critical/other existing credit	furniture/equipment	2348.000000000	<100	1<=X<4	3.000000000	male mar/wid	none	2.000000000	life insurance	46.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	12.000000000	existing paid	new car	1223.000000000	<100	>=7	1.000000000	male div/sep	none	1.000000000	real estate	46.000000000	none	rent	2.000000000	skilled	1.000000000	none	yes	bad
no checking	24.000000000	critical/other existing credit	radio/tv	1516.000000000	>=1000	1<=X<4	4.000000000	female div/dep/mar	none	1.000000000	real estate	43.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
no checking	18.000000000	existing paid	radio/tv	1473.000000000	<100	<1	3.000000000	male mar/wid	none	4.000000000	real estate	39.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	18.000000000	critical/other existing credit	business	1887.000000000	no known savings	1<=X<4	4.000000000	male mar/wid	none	4.000000000	real estate	28.000000000	bank	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	delayed previously	business	8648.000000000	<100	<1	2.000000000	male single	none	2.000000000	car	27.000000000	bank	own	2.000000000	skilled	1.000000000	yes	yes	bad
no checking	14.000000000	delayed previously	new car	802.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	car	27.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	18.000000000	delayed previously	new car	2899.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	car	43.000000000	none	own	1.000000000	skilled	2.000000000	none	yes	good
0<=X<200	24.000000000	existing paid	radio/tv	2039.000000000	<100	<1	1.000000000	male mar/wid	none	1.000000000	life insurance	22.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	bad
no checking	24.000000000	critical/other existing credit	used car	2197.000000000	no known savings	4<=X<7	4.000000000	male single	none	4.000000000	car	43.000000000	none	own	2.000000000	skilled	2.000000000	yes	yes	good
<0	15.000000000	existing paid	radio/tv	1053.000000000	<100	<1	4.000000000	male mar/wid	none	2.000000000	real estate	27.000000000	none	own	1.000000000	skilled	1.000000000	none	no	good
no checking	24.000000000	existing paid	radio/tv	3235.000000000	500<=X<1000	>=7	3.000000000	male div/sep	none	2.000000000	car	26.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
>=200	12.000000000	critical/other existing credit	new car	939.000000000	500<=X<1000	4<=X<7	4.000000000	male mar/wid	none	2.000000000	real estate	28.000000000	none	own	3.000000000	skilled	1.000000000	yes	yes	bad
0<=X<200	24.000000000	existing paid	radio/tv	1967.000000000	<100	>=7	4.000000000	female div/dep/mar	none	4.000000000	car	20.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	33.000000000	critical/other existing credit	used car	7253.000000000	<100	4<=X<7	3.000000000	male single	none	2.000000000	car	35.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	12.000000000	critical/other existing credit	business	2292.000000000	<100	unemployed	4.000000000	male single	none	2.000000000	car	42.000000000	stores	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	10.000000000	existing paid	new car	1597.000000000	500<=X<1000	1<=X<4	3.000000000	male single	none	2.000000000	no known property	40.000000000	none	rent	1.000000000	unskilled resident	2.000000000	none	no	good
<0	24.000000000	existing paid	new car	1381.000000000	no known savings	1<=X<4	4.000000000	female div/dep/mar	none	2.000000000	life insurance	35.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	36.000000000	critical/other existing credit	used car	5842.000000000	<100	>=7	2.000000000	male single	none	2.000000000	life insurance	35.000000000	none	own	2.000000000	skilled	2.000000000	yes	yes	good
<0	12.000000000	existing paid	new car	2579.000000000	<100	<1	4.000000000	male single	none	1.000000000	real estate	33.000000000	none	own	1.000000000	unskilled resident	2.000000000	none	yes	bad
<0	18.000000000	delayed previously	education	8471.000000000	no known savings	1<=X<4	1.000000000	female div/dep/mar	none	2.000000000	car	23.000000000	none	rent	2.000000000	skilled	1.000000000	yes	yes	good
no checking	21.000000000	existing paid	new car	2782.000000000	500<=X<1000	4<=X<7	1.000000000	female div/dep/mar	none	2.000000000	car	31.000000000	bank	own	1.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	good
0<=X<200	18.000000000	existing paid	new car	1042.000000000	no known savings	1<=X<4	4.000000000	female div/dep/mar	none	2.000000000	life insurance	33.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	15.000000000	existing paid	new car	3186.000000000	>=1000	4<=X<7	2.000000000	female div/dep/mar	none	3.000000000	car	20.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	used car	2028.000000000	no known savings	1<=X<4	4.000000000	male single	none	2.000000000	car	30.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	12.000000000	critical/other existing credit	new car	958.000000000	<100	4<=X<7	2.000000000	male single	none	3.000000000	real estate	47.000000000	none	own	2.000000000	unskilled resident	2.000000000	none	yes	good
no checking	21.000000000	delayed previously	furniture/equipment	1591.000000000	100<=X<500	4<=X<7	4.000000000	male single	none	3.000000000	real estate	34.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	furniture/equipment	2762.000000000	no known savings	>=7	1.000000000	female div/dep/mar	none	2.000000000	life insurance	25.000000000	bank	own	1.000000000	skilled	1.000000000	yes	yes	bad
0<=X<200	18.000000000	existing paid	used car	2779.000000000	<100	1<=X<4	1.000000000	male mar/wid	none	3.000000000	car	21.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	good
no checking	28.000000000	critical/other existing credit	radio/tv	2743.000000000	<100	>=7	4.000000000	male single	none	2.000000000	car	29.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	18.000000000	critical/other existing credit	radio/tv	1149.000000000	>=1000	1<=X<4	4.000000000	male single	none	3.000000000	real estate	46.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	9.000000000	existing paid	furniture/equipment	1313.000000000	<100	>=7	1.000000000	male single	none	4.000000000	car	20.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	18.000000000	critical/other existing credit	repairs	1190.000000000	<100	unemployed	2.000000000	female div/dep/mar	none	4.000000000	no known property	55.000000000	none	for free	3.000000000	unemp/unskilled non res	2.000000000	none	yes	bad
<0	6.000000000	critical/other existing credit	furniture/equipment	1872.000000000	<100	unemployed	4.000000000	male single	none	4.000000000	no known property	36.000000000	none	for free	3.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	24.000000000	critical/other existing credit	repairs	2058.000000000	<100	1<=X<4	4.000000000	male div/sep	none	2.000000000	real estate	33.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
<0	9.000000000	existing paid	furniture/equipment	2136.000000000	<100	1<=X<4	3.000000000	male single	none	2.000000000	real estate	25.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	radio/tv	1484.000000000	no known savings	1<=X<4	2.000000000	male mar/wid	none	1.000000000	real estate	25.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	bad
no checking	6.000000000	existing paid	repairs	660.000000000	500<=X<1000	4<=X<7	2.000000000	male mar/wid	none	4.000000000	real estate	23.000000000	none	rent	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	24.000000000	critical/other existing credit	new car	1287.000000000	>=1000	>=7	4.000000000	female div/dep/mar	none	4.000000000	real estate	37.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
<0	42.000000000	critical/other existing credit	repairs	3394.000000000	<100	unemployed	4.000000000	male single	co applicant	4.000000000	car	65.000000000	none	own	2.000000000	unemp/unskilled non res	1.000000000	none	yes	good
>=200	12.000000000	all paid	business	609.000000000	<100	<1	4.000000000	female div/dep/mar	none	1.000000000	real estate	26.000000000	none	own	1.000000000	unemp/unskilled non res	1.000000000	none	yes	bad
no checking	12.000000000	existing paid	new car	1884.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	39.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	12.000000000	existing paid	furniture/equipment	1620.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	co applicant	3.000000000	life insurance	30.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	20.000000000	delayed previously	other	2629.000000000	<100	1<=X<4	2.000000000	male single	none	3.000000000	car	29.000000000	bank	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	12.000000000	existing paid	education	719.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	41.000000000	bank	own	1.000000000	unskilled resident	2.000000000	none	yes	bad
0<=X<200	48.000000000	critical/other existing credit	furniture/equipment	5096.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	none	3.000000000	car	30.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	9.000000000	critical/other existing credit	education	1244.000000000	no known savings	>=7	4.000000000	female div/dep/mar	none	4.000000000	life insurance	41.000000000	none	rent	2.000000000	unskilled resident	1.000000000	none	yes	good
<0	36.000000000	existing paid	new car	1842.000000000	<100	<1	4.000000000	female div/dep/mar	none	4.000000000	car	34.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	bad
0<=X<200	7.000000000	existing paid	radio/tv	2576.000000000	<100	1<=X<4	2.000000000	male single	guarantor	2.000000000	real estate	35.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
>=200	12.000000000	existing paid	furniture/equipment	1424.000000000	no known savings	>=7	3.000000000	female div/dep/mar	none	4.000000000	real estate	55.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	15.000000000	delayed previously	repairs	1512.000000000	>=1000	1<=X<4	3.000000000	male mar/wid	none	3.000000000	life insurance	61.000000000	stores	own	2.000000000	skilled	1.000000000	none	yes	bad
no checking	36.000000000	critical/other existing credit	used car	11054.000000000	no known savings	1<=X<4	4.000000000	male single	none	2.000000000	car	30.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	6.000000000	existing paid	radio/tv	518.000000000	<100	1<=X<4	3.000000000	female div/dep/mar	none	1.000000000	real estate	29.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	12.000000000	no credits/all paid	furniture/equipment	2759.000000000	<100	>=7	2.000000000	male single	none	4.000000000	life insurance	34.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	existing paid	used car	2670.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	35.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	24.000000000	existing paid	new car	4817.000000000	<100	4<=X<7	2.000000000	male single	co applicant	3.000000000	life insurance	31.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	bad
no checking	24.000000000	existing paid	used car	2679.000000000	<100	<1	4.000000000	female div/dep/mar	none	1.000000000	no known property	29.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	11.000000000	critical/other existing credit	new car	3905.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	real estate	36.000000000	none	rent	2.000000000	skilled	2.000000000	none	yes	good
<0	12.000000000	existing paid	used car	3386.000000000	<100	>=7	3.000000000	male single	none	4.000000000	no known property	35.000000000	none	for free	1.000000000	skilled	1.000000000	yes	yes	bad
<0	6.000000000	existing paid	domestic appliance	343.000000000	<100	<1	4.000000000	female div/dep/mar	none	1.000000000	real estate	27.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	18.000000000	existing paid	radio/tv	4594.000000000	<100	<1	3.000000000	male single	none	2.000000000	car	32.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	36.000000000	existing paid	furniture/equipment	3620.000000000	<100	1<=X<4	1.000000000	male single	guarantor	2.000000000	life insurance	37.000000000	none	own	1.000000000	skilled	2.000000000	none	yes	good
<0	15.000000000	existing paid	new car	1721.000000000	<100	<1	2.000000000	male single	none	3.000000000	real estate	36.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	furniture/equipment	3017.000000000	<100	<1	3.000000000	female div/dep/mar	none	1.000000000	real estate	34.000000000	none	rent	1.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	retraining	754.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	life insurance	38.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	18.000000000	existing paid	business	1950.000000000	<100	4<=X<7	4.000000000	male single	none	1.000000000	car	34.000000000	stores	own	2.000000000	skilled	1.000000000	yes	yes	good
<0	24.000000000	existing paid	used car	2924.000000000	<100	1<=X<4	3.000000000	male single	guarantor	4.000000000	no known property	63.000000000	bank	own	1.000000000	skilled	2.000000000	yes	yes	good
<0	24.000000000	delayed previously	radio/tv	1659.000000000	<100	<1	4.000000000	female div/dep/mar	none	2.000000000	car	29.000000000	none	rent	1.000000000	unskilled resident	1.000000000	yes	yes	bad
no checking	48.000000000	delayed previously	radio/tv	7238.000000000	no known savings	>=7	3.000000000	male single	none	3.000000000	car	32.000000000	bank	own	2.000000000	skilled	2.000000000	none	yes	good
no checking	33.000000000	delayed previously	business	2764.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	none	2.000000000	car	26.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	24.000000000	delayed previously	used car	4679.000000000	<100	4<=X<7	3.000000000	male single	none	3.000000000	car	35.000000000	none	own	2.000000000	unskilled resident	1.000000000	yes	yes	good
0<=X<200	24.000000000	existing paid	radio/tv	3092.000000000	100<=X<500	<1	3.000000000	male mar/wid	none	2.000000000	car	22.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	bad
<0	6.000000000	existing paid	education	448.000000000	<100	<1	4.000000000	female div/dep/mar	none	4.000000000	life insurance	23.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
<0	9.000000000	existing paid	new car	654.000000000	<100	1<=X<4	4.000000000	male single	none	3.000000000	car	28.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
no checking	6.000000000	existing paid	retraining	1238.000000000	no known savings	unemployed	4.000000000	male single	none	4.000000000	life insurance	36.000000000	none	own	1.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	good
0<=X<200	18.000000000	critical/other existing credit	radio/tv	1245.000000000	<100	1<=X<4	4.000000000	male mar/wid	none	2.000000000	car	33.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
<0	18.000000000	no credits/all paid	furniture/equipment	3114.000000000	<100	<1	1.000000000	female div/dep/mar	none	4.000000000	life insurance	26.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
no checking	39.000000000	existing paid	used car	2569.000000000	500<=X<1000	1<=X<4	4.000000000	male single	none	4.000000000	car	24.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
>=200	24.000000000	existing paid	radio/tv	5152.000000000	<100	4<=X<7	4.000000000	male single	none	2.000000000	car	25.000000000	bank	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	business	1037.000000000	100<=X<500	4<=X<7	3.000000000	male single	none	4.000000000	real estate	39.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
<0	15.000000000	critical/other existing credit	furniture/equipment	1478.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	44.000000000	none	own	2.000000000	skilled	2.000000000	yes	yes	good
0<=X<200	12.000000000	critical/other existing credit	radio/tv	3573.000000000	<100	1<=X<4	1.000000000	female div/dep/mar	none	1.000000000	real estate	23.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	24.000000000	existing paid	new car	1201.000000000	<100	<1	4.000000000	male single	none	1.000000000	life insurance	26.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	30.000000000	existing paid	furniture/equipment	3622.000000000	>=1000	>=7	4.000000000	female div/dep/mar	none	4.000000000	life insurance	57.000000000	none	rent	2.000000000	skilled	1.000000000	yes	yes	good
no checking	15.000000000	delayed previously	furniture/equipment	960.000000000	>=1000	4<=X<7	3.000000000	female div/dep/mar	none	2.000000000	life insurance	30.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	12.000000000	critical/other existing credit	new car	1163.000000000	500<=X<1000	1<=X<4	4.000000000	male single	none	4.000000000	real estate	44.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	6.000000000	delayed previously	new car	1209.000000000	<100	unemployed	4.000000000	male single	none	4.000000000	life insurance	47.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	12.000000000	existing paid	radio/tv	3077.000000000	<100	1<=X<4	2.000000000	male single	none	4.000000000	car	52.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	24.000000000	existing paid	new car	3757.000000000	<100	>=7	4.000000000	female div/dep/mar	co applicant	4.000000000	no known property	62.000000000	none	for free	1.000000000	skilled	1.000000000	yes	yes	good
no checking	10.000000000	existing paid	new car	1418.000000000	100<=X<500	1<=X<4	3.000000000	male single	none	2.000000000	real estate	35.000000000	none	rent	1.000000000	unskilled resident	1.000000000	none	no	good
no checking	6.000000000	existing paid	new car	3518.000000000	<100	1<=X<4	2.000000000	male single	guarantor	3.000000000	life insurance	26.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
no checking	12.000000000	critical/other existing credit	radio/tv	1934.000000000	<100	>=7	2.000000000	male single	none	2.000000000	no known property	26.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	27.000000000	no credits/all paid	business	8318.000000000	<100	>=7	2.000000000	female div/dep/mar	none	4.000000000	no known property	42.000000000	none	for free	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	6.000000000	critical/other existing credit	radio/tv	1237.000000000	100<=X<500	1<=X<4	1.000000000	female div/dep/mar	none	1.000000000	life insurance	27.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	6.000000000	existing paid	radio/tv	368.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	life insurance	38.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	12.000000000	critical/other existing credit	new car	2122.000000000	<100	1<=X<4	3.000000000	male single	none	2.000000000	real estate	39.000000000	none	rent	2.000000000	unskilled resident	2.000000000	none	no	good
<0	24.000000000	existing paid	furniture/equipment	2996.000000000	no known savings	1<=X<4	2.000000000	male mar/wid	none	4.000000000	car	20.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	36.000000000	existing paid	furniture/equipment	9034.000000000	100<=X<500	<1	4.000000000	male single	co applicant	1.000000000	no known property	29.000000000	none	rent	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	24.000000000	critical/other existing credit	furniture/equipment	1585.000000000	<100	4<=X<7	4.000000000	male single	none	3.000000000	life insurance	40.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	18.000000000	existing paid	radio/tv	1301.000000000	<100	>=7	4.000000000	male mar/wid	guarantor	2.000000000	real estate	32.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
>=200	6.000000000	critical/other existing credit	new car	1323.000000000	100<=X<500	>=7	2.000000000	male div/sep	none	4.000000000	car	28.000000000	none	own	2.000000000	skilled	2.000000000	yes	yes	good
<0	24.000000000	existing paid	new car	3123.000000000	<100	<1	4.000000000	female div/dep/mar	none	1.000000000	life insurance	27.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
<0	36.000000000	existing paid	used car	5493.000000000	<100	>=7	2.000000000	male single	none	4.000000000	no known property	42.000000000	none	for free	1.000000000	skilled	2.000000000	none	yes	good
>=200	9.000000000	existing paid	radio/tv	1126.000000000	100<=X<500	>=7	2.000000000	male div/sep	none	4.000000000	real estate	49.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	24.000000000	critical/other existing credit	radio/tv	1216.000000000	100<=X<500	<1	4.000000000	male single	none	4.000000000	no known property	38.000000000	bank	own	2.000000000	skilled	2.000000000	none	yes	bad
<0	24.000000000	existing paid	new car	1207.000000000	<100	<1	4.000000000	female div/dep/mar	none	4.000000000	life insurance	24.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
no checking	10.000000000	existing paid	new car	1309.000000000	no known savings	1<=X<4	4.000000000	male single	guarantor	4.000000000	life insurance	27.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
>=200	15.000000000	critical/other existing credit	used car	2360.000000000	500<=X<1000	1<=X<4	2.000000000	male single	none	2.000000000	car	36.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	15.000000000	all paid	new car	6850.000000000	100<=X<500	unemployed	1.000000000	male single	none	2.000000000	life insurance	34.000000000	none	own	1.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	bad
no checking	24.000000000	existing paid	radio/tv	1413.000000000	<100	1<=X<4	4.000000000	male mar/wid	none	2.000000000	life insurance	28.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	39.000000000	existing paid	used car	8588.000000000	100<=X<500	>=7	4.000000000	male single	none	2.000000000	car	45.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	12.000000000	existing paid	new car	759.000000000	<100	4<=X<7	4.000000000	male single	none	2.000000000	real estate	26.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	36.000000000	existing paid	used car	4686.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	no known property	32.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
>=200	15.000000000	existing paid	business	2687.000000000	<100	4<=X<7	2.000000000	male single	none	4.000000000	life insurance	26.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	12.000000000	delayed previously	radio/tv	585.000000000	<100	1<=X<4	4.000000000	male mar/wid	co applicant	4.000000000	real estate	20.000000000	none	rent	2.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	existing paid	new car	2255.000000000	no known savings	<1	4.000000000	male single	none	1.000000000	life insurance	54.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	6.000000000	critical/other existing credit	new car	609.000000000	<100	4<=X<7	4.000000000	female div/dep/mar	none	3.000000000	life insurance	37.000000000	none	own	2.000000000	skilled	1.000000000	none	no	good
<0	6.000000000	critical/other existing credit	new car	1361.000000000	<100	<1	2.000000000	male single	none	4.000000000	real estate	40.000000000	none	own	1.000000000	unskilled resident	2.000000000	none	no	good
no checking	36.000000000	critical/other existing credit	furniture/equipment	7127.000000000	<100	<1	2.000000000	female div/dep/mar	none	4.000000000	life insurance	23.000000000	none	rent	2.000000000	skilled	1.000000000	yes	yes	bad
<0	6.000000000	existing paid	new car	1203.000000000	100<=X<500	>=7	3.000000000	male single	none	2.000000000	life insurance	43.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	6.000000000	critical/other existing credit	radio/tv	700.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	no known property	36.000000000	none	for free	2.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	critical/other existing credit	repairs	5507.000000000	<100	>=7	3.000000000	male single	none	4.000000000	no known property	44.000000000	none	for free	2.000000000	skilled	1.000000000	none	yes	good
<0	18.000000000	existing paid	radio/tv	3190.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	none	2.000000000	real estate	24.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
<0	48.000000000	no credits/all paid	furniture/equipment	7119.000000000	<100	1<=X<4	3.000000000	male single	none	4.000000000	no known property	53.000000000	none	for free	2.000000000	skilled	2.000000000	none	yes	bad
no checking	24.000000000	existing paid	used car	3488.000000000	100<=X<500	4<=X<7	3.000000000	female div/dep/mar	none	4.000000000	car	23.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	18.000000000	existing paid	radio/tv	1113.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	guarantor	4.000000000	real estate	26.000000000	none	own	1.000000000	unskilled resident	2.000000000	none	yes	good
0<=X<200	26.000000000	existing paid	used car	7966.000000000	<100	<1	2.000000000	male single	none	3.000000000	car	30.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	15.000000000	critical/other existing credit	education	1532.000000000	100<=X<500	1<=X<4	4.000000000	female div/dep/mar	none	3.000000000	car	31.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	4.000000000	critical/other existing credit	radio/tv	1503.000000000	<100	4<=X<7	2.000000000	male single	none	1.000000000	real estate	42.000000000	none	own	2.000000000	unskilled resident	2.000000000	none	yes	good
<0	36.000000000	existing paid	radio/tv	2302.000000000	<100	1<=X<4	4.000000000	male div/sep	none	4.000000000	car	31.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
<0	6.000000000	existing paid	new car	662.000000000	<100	<1	3.000000000	male single	none	4.000000000	real estate	41.000000000	none	own	1.000000000	unskilled resident	2.000000000	yes	yes	good
0<=X<200	36.000000000	existing paid	education	2273.000000000	<100	4<=X<7	3.000000000	male single	none	1.000000000	car	32.000000000	none	own	2.000000000	skilled	2.000000000	none	yes	good
0<=X<200	15.000000000	existing paid	new car	2631.000000000	100<=X<500	1<=X<4	2.000000000	female div/dep/mar	none	4.000000000	car	28.000000000	none	rent	2.000000000	skilled	1.000000000	yes	yes	bad
no checking	12.000000000	delayed previously	used car	1503.000000000	<100	1<=X<4	4.000000000	male mar/wid	none	4.000000000	real estate	41.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	existing paid	radio/tv	1311.000000000	100<=X<500	4<=X<7	4.000000000	male mar/wid	none	3.000000000	life insurance	26.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	24.000000000	existing paid	radio/tv	3105.000000000	no known savings	<1	4.000000000	male single	none	2.000000000	car	25.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
>=200	21.000000000	critical/other existing credit	education	2319.000000000	<100	<1	2.000000000	male div/sep	none	1.000000000	car	33.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
<0	6.000000000	existing paid	new car	1374.000000000	no known savings	unemployed	4.000000000	female div/dep/mar	none	3.000000000	life insurance	75.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	18.000000000	critical/other existing credit	furniture/equipment	3612.000000000	<100	>=7	3.000000000	female div/dep/mar	none	4.000000000	life insurance	37.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	48.000000000	existing paid	new car	7763.000000000	<100	>=7	4.000000000	male single	none	4.000000000	no known property	42.000000000	bank	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	bad
>=200	18.000000000	existing paid	furniture/equipment	3049.000000000	<100	<1	1.000000000	female div/dep/mar	none	1.000000000	life insurance	45.000000000	stores	own	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	radio/tv	1534.000000000	<100	<1	1.000000000	male mar/wid	none	1.000000000	real estate	23.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
no checking	24.000000000	delayed previously	new car	2032.000000000	<100	>=7	4.000000000	male single	none	4.000000000	no known property	60.000000000	none	for free	2.000000000	skilled	1.000000000	yes	yes	good
<0	30.000000000	existing paid	furniture/equipment	6350.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	life insurance	31.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
>=200	18.000000000	existing paid	furniture/equipment	2864.000000000	<100	1<=X<4	2.000000000	male single	none	1.000000000	real estate	34.000000000	none	own	1.000000000	unskilled resident	2.000000000	none	yes	bad
no checking	12.000000000	critical/other existing credit	new car	1255.000000000	<100	>=7	4.000000000	male single	none	4.000000000	real estate	61.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
<0	24.000000000	delayed previously	new car	1333.000000000	<100	unemployed	4.000000000	male single	none	2.000000000	real estate	43.000000000	none	for free	2.000000000	skilled	2.000000000	none	yes	bad
no checking	24.000000000	critical/other existing credit	new car	2022.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	4.000000000	car	37.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	24.000000000	existing paid	radio/tv	1552.000000000	<100	4<=X<7	3.000000000	male single	none	1.000000000	car	32.000000000	bank	own	1.000000000	skilled	2.000000000	none	yes	good
<0	12.000000000	all paid	radio/tv	626.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	4.000000000	real estate	24.000000000	bank	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
no checking	48.000000000	critical/other existing credit	used car	8858.000000000	no known savings	4<=X<7	2.000000000	male single	none	1.000000000	no known property	35.000000000	none	for free	2.000000000	skilled	1.000000000	yes	yes	good
no checking	12.000000000	critical/other existing credit	repairs	996.000000000	no known savings	4<=X<7	4.000000000	female div/dep/mar	none	4.000000000	real estate	23.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	6.000000000	all paid	radio/tv	1750.000000000	500<=X<1000	>=7	2.000000000	male single	none	4.000000000	life insurance	45.000000000	bank	own	1.000000000	unskilled resident	2.000000000	none	yes	good
<0	48.000000000	existing paid	radio/tv	6999.000000000	<100	4<=X<7	1.000000000	male mar/wid	guarantor	1.000000000	real estate	34.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	bad
0<=X<200	12.000000000	critical/other existing credit	new car	1995.000000000	100<=X<500	<1	4.000000000	male single	none	1.000000000	car	27.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	9.000000000	existing paid	education	1199.000000000	<100	4<=X<7	4.000000000	female div/dep/mar	none	4.000000000	life insurance	67.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	12.000000000	existing paid	radio/tv	1331.000000000	<100	<1	2.000000000	male single	none	1.000000000	car	22.000000000	stores	own	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	18.000000000	no credits/all paid	new car	2278.000000000	100<=X<500	<1	3.000000000	female div/dep/mar	none	3.000000000	car	28.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	bad
no checking	21.000000000	no credits/all paid	new car	5003.000000000	no known savings	1<=X<4	1.000000000	female div/dep/mar	none	4.000000000	life insurance	29.000000000	bank	own	2.000000000	skilled	1.000000000	yes	yes	bad
<0	24.000000000	all paid	furniture/equipment	3552.000000000	<100	4<=X<7	3.000000000	male single	none	4.000000000	car	27.000000000	bank	own	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	18.000000000	critical/other existing credit	furniture/equipment	1928.000000000	<100	<1	2.000000000	male single	none	2.000000000	real estate	31.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	bad
<0	24.000000000	existing paid	used car	2964.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	no known property	49.000000000	bank	for free	1.000000000	skilled	2.000000000	yes	yes	good
<0	24.000000000	all paid	radio/tv	1546.000000000	<100	4<=X<7	4.000000000	male single	guarantor	4.000000000	car	24.000000000	bank	rent	1.000000000	unskilled resident	1.000000000	none	yes	bad
>=200	6.000000000	delayed previously	radio/tv	683.000000000	<100	<1	2.000000000	female div/dep/mar	none	1.000000000	life insurance	29.000000000	bank	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	36.000000000	existing paid	new car	12389.000000000	no known savings	1<=X<4	1.000000000	male single	none	4.000000000	no known property	37.000000000	none	for free	1.000000000	skilled	1.000000000	yes	yes	bad
0<=X<200	24.000000000	delayed previously	business	4712.000000000	no known savings	1<=X<4	4.000000000	male single	none	2.000000000	life insurance	37.000000000	bank	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	24.000000000	delayed previously	radio/tv	1553.000000000	100<=X<500	4<=X<7	3.000000000	female div/dep/mar	none	2.000000000	life insurance	23.000000000	none	rent	2.000000000	skilled	1.000000000	yes	yes	good
<0	12.000000000	existing paid	new car	1372.000000000	<100	4<=X<7	2.000000000	male div/sep	none	3.000000000	car	36.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	24.000000000	critical/other existing credit	radio/tv	2578.000000000	>=1000	>=7	2.000000000	male single	none	2.000000000	car	34.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	48.000000000	existing paid	radio/tv	3979.000000000	no known savings	4<=X<7	4.000000000	male single	none	1.000000000	car	41.000000000	none	own	2.000000000	skilled	2.000000000	yes	yes	good
<0	48.000000000	existing paid	radio/tv	6758.000000000	<100	1<=X<4	3.000000000	female div/dep/mar	none	2.000000000	car	31.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	bad
<0	24.000000000	existing paid	furniture/equipment	3234.000000000	<100	<1	4.000000000	female div/dep/mar	none	4.000000000	real estate	23.000000000	none	rent	1.000000000	unskilled resident	1.000000000	yes	yes	bad
no checking	30.000000000	critical/other existing credit	radio/tv	5954.000000000	<100	4<=X<7	3.000000000	male single	co applicant	2.000000000	car	38.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	existing paid	used car	5433.000000000	no known savings	unemployed	2.000000000	female div/dep/mar	none	4.000000000	life insurance	26.000000000	none	rent	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	15.000000000	existing paid	business	806.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	4.000000000	life insurance	22.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	9.000000000	existing paid	radio/tv	1082.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	27.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
no checking	15.000000000	critical/other existing credit	furniture/equipment	2788.000000000	<100	4<=X<7	2.000000000	female div/dep/mar	co applicant	3.000000000	car	24.000000000	bank	own	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	radio/tv	2930.000000000	<100	4<=X<7	2.000000000	female div/dep/mar	none	1.000000000	real estate	27.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	critical/other existing credit	education	1927.000000000	no known savings	1<=X<4	3.000000000	female div/dep/mar	none	2.000000000	car	33.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	36.000000000	critical/other existing credit	new car	2820.000000000	<100	<1	4.000000000	male div/sep	none	4.000000000	car	27.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	bad
no checking	24.000000000	existing paid	retraining	937.000000000	<100	<1	4.000000000	male mar/wid	none	3.000000000	car	27.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	18.000000000	critical/other existing credit	new car	1056.000000000	<100	>=7	3.000000000	male single	guarantor	3.000000000	real estate	30.000000000	bank	own	2.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	12.000000000	critical/other existing credit	new car	3124.000000000	<100	<1	1.000000000	male single	none	3.000000000	real estate	49.000000000	bank	own	2.000000000	unskilled resident	2.000000000	none	yes	good
no checking	9.000000000	existing paid	furniture/equipment	1388.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	2.000000000	real estate	26.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	36.000000000	existing paid	repairs	2384.000000000	<100	<1	4.000000000	male single	none	1.000000000	no known property	33.000000000	none	rent	1.000000000	unskilled resident	1.000000000	none	yes	bad
no checking	12.000000000	existing paid	new car	2133.000000000	no known savings	>=7	4.000000000	female div/dep/mar	none	4.000000000	no known property	52.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	18.000000000	existing paid	furniture/equipment	2039.000000000	<100	1<=X<4	1.000000000	female div/dep/mar	none	4.000000000	real estate	20.000000000	bank	rent	1.000000000	skilled	1.000000000	none	yes	bad
<0	9.000000000	critical/other existing credit	new car	2799.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	real estate	36.000000000	none	rent	2.000000000	skilled	2.000000000	none	yes	good
<0	12.000000000	existing paid	furniture/equipment	1289.000000000	<100	1<=X<4	4.000000000	male single	guarantor	1.000000000	life insurance	21.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
<0	18.000000000	existing paid	domestic appliance	1217.000000000	<100	1<=X<4	4.000000000	male mar/wid	none	3.000000000	real estate	47.000000000	none	own	1.000000000	unskilled resident	1.000000000	yes	yes	bad
<0	12.000000000	critical/other existing credit	furniture/equipment	2246.000000000	<100	>=7	3.000000000	male single	none	3.000000000	life insurance	60.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	bad
<0	12.000000000	critical/other existing credit	radio/tv	385.000000000	<100	4<=X<7	4.000000000	female div/dep/mar	none	3.000000000	real estate	58.000000000	none	own	4.000000000	unskilled resident	1.000000000	yes	yes	good
0<=X<200	24.000000000	delayed previously	new car	1965.000000000	no known savings	1<=X<4	4.000000000	female div/dep/mar	none	4.000000000	car	42.000000000	none	rent	2.000000000	skilled	1.000000000	yes	yes	good
no checking	21.000000000	existing paid	business	1572.000000000	>=1000	>=7	4.000000000	female div/dep/mar	none	4.000000000	real estate	36.000000000	bank	own	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	24.000000000	existing paid	new car	2718.000000000	<100	1<=X<4	3.000000000	female div/dep/mar	none	4.000000000	life insurance	20.000000000	none	rent	1.000000000	unskilled resident	1.000000000	yes	yes	bad
<0	24.000000000	all paid	other	1358.000000000	no known savings	>=7	4.000000000	male single	none	3.000000000	car	40.000000000	stores	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
0<=X<200	6.000000000	all paid	new car	931.000000000	100<=X<500	<1	1.000000000	female div/dep/mar	none	1.000000000	life insurance	32.000000000	stores	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
<0	24.000000000	existing paid	new car	1442.000000000	<100	4<=X<7	4.000000000	female div/dep/mar	none	4.000000000	car	23.000000000	none	rent	2.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	24.000000000	no credits/all paid	business	4241.000000000	<100	1<=X<4	1.000000000	male single	none	4.000000000	real estate	36.000000000	none	own	3.000000000	unskilled resident	1.000000000	yes	yes	bad
no checking	18.000000000	critical/other existing credit	new car	2775.000000000	<100	4<=X<7	2.000000000	male single	none	2.000000000	life insurance	31.000000000	bank	own	2.000000000	skilled	1.000000000	none	yes	bad
no checking	24.000000000	delayed previously	business	3863.000000000	<100	1<=X<4	1.000000000	male single	none	2.000000000	no known property	32.000000000	none	for free	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	7.000000000	existing paid	radio/tv	2329.000000000	<100	<1	1.000000000	female div/dep/mar	guarantor	1.000000000	real estate	45.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	9.000000000	existing paid	furniture/equipment	918.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	1.000000000	life insurance	30.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	24.000000000	all paid	education	1837.000000000	<100	4<=X<7	4.000000000	female div/dep/mar	none	4.000000000	no known property	34.000000000	bank	for free	1.000000000	unskilled resident	1.000000000	none	yes	bad
no checking	36.000000000	existing paid	furniture/equipment	3349.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	2.000000000	car	28.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
>=200	10.000000000	existing paid	furniture/equipment	1275.000000000	<100	<1	4.000000000	female div/dep/mar	none	2.000000000	life insurance	23.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	24.000000000	all paid	furniture/equipment	2828.000000000	500<=X<1000	1<=X<4	4.000000000	male single	none	4.000000000	real estate	22.000000000	stores	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	24.000000000	critical/other existing credit	business	4526.000000000	<100	1<=X<4	3.000000000	male single	none	2.000000000	real estate	74.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	36.000000000	existing paid	radio/tv	2671.000000000	100<=X<500	1<=X<4	4.000000000	female div/dep/mar	co applicant	4.000000000	no known property	50.000000000	none	for free	1.000000000	skilled	1.000000000	none	yes	bad
no checking	18.000000000	existing paid	radio/tv	2051.000000000	<100	<1	4.000000000	male single	none	1.000000000	real estate	33.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	15.000000000	existing paid	used car	1300.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	no known property	45.000000000	bank	for free	1.000000000	skilled	2.000000000	none	yes	good
<0	12.000000000	existing paid	domestic appliance	741.000000000	100<=X<500	unemployed	4.000000000	female div/dep/mar	none	3.000000000	life insurance	22.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
>=200	10.000000000	existing paid	new car	1240.000000000	100<=X<500	>=7	1.000000000	female div/dep/mar	none	4.000000000	no known property	48.000000000	none	for free	1.000000000	unskilled resident	2.000000000	none	yes	bad
<0	21.000000000	existing paid	radio/tv	3357.000000000	>=1000	<1	4.000000000	female div/dep/mar	none	2.000000000	car	29.000000000	bank	own	1.000000000	skilled	1.000000000	none	yes	good
<0	24.000000000	all paid	used car	3632.000000000	<100	1<=X<4	1.000000000	female div/dep/mar	guarantor	4.000000000	car	22.000000000	bank	rent	1.000000000	skilled	1.000000000	none	no	good
no checking	18.000000000	delayed previously	furniture/equipment	1808.000000000	<100	4<=X<7	4.000000000	female div/dep/mar	none	1.000000000	real estate	22.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	48.000000000	no credits/all paid	business	12204.000000000	no known savings	1<=X<4	2.000000000	male single	none	2.000000000	car	48.000000000	bank	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	60.000000000	delayed previously	radio/tv	9157.000000000	no known savings	1<=X<4	2.000000000	male single	none	2.000000000	no known property	27.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	good
<0	6.000000000	critical/other existing credit	new car	3676.000000000	<100	1<=X<4	1.000000000	male single	none	3.000000000	real estate	37.000000000	none	rent	3.000000000	skilled	2.000000000	none	yes	good
0<=X<200	30.000000000	existing paid	furniture/equipment	3441.000000000	100<=X<500	1<=X<4	2.000000000	female div/dep/mar	co applicant	4.000000000	car	21.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
no checking	12.000000000	existing paid	new car	640.000000000	<100	1<=X<4	4.000000000	male div/sep	none	2.000000000	real estate	49.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	21.000000000	critical/other existing credit	business	3652.000000000	<100	4<=X<7	2.000000000	male single	none	3.000000000	life insurance	27.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	18.000000000	critical/other existing credit	new car	1530.000000000	<100	1<=X<4	3.000000000	male single	none	2.000000000	life insurance	32.000000000	bank	own	2.000000000	skilled	1.000000000	none	yes	bad
no checking	48.000000000	existing paid	business	3914.000000000	no known savings	1<=X<4	4.000000000	male div/sep	none	2.000000000	real estate	38.000000000	bank	own	1.000000000	skilled	1.000000000	none	yes	bad
<0	12.000000000	existing paid	furniture/equipment	1858.000000000	<100	<1	4.000000000	female div/dep/mar	none	1.000000000	car	22.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
<0	18.000000000	existing paid	radio/tv	2600.000000000	<100	1<=X<4	4.000000000	male single	none	4.000000000	no known property	65.000000000	none	for free	2.000000000	skilled	1.000000000	none	yes	bad
no checking	15.000000000	existing paid	radio/tv	1979.000000000	no known savings	>=7	4.000000000	male single	none	2.000000000	car	35.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
>=200	6.000000000	existing paid	furniture/equipment	2116.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	real estate	41.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	9.000000000	all paid	new car	1437.000000000	100<=X<500	4<=X<7	2.000000000	male single	none	3.000000000	no known property	29.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	42.000000000	critical/other existing credit	furniture/equipment	4042.000000000	500<=X<1000	1<=X<4	4.000000000	male single	none	4.000000000	real estate	36.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	9.000000000	existing paid	education	3832.000000000	no known savings	>=7	1.000000000	male single	none	4.000000000	real estate	64.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
<0	24.000000000	existing paid	radio/tv	3660.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	none	4.000000000	car	28.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	18.000000000	all paid	furniture/equipment	1553.000000000	<100	1<=X<4	4.000000000	male single	none	3.000000000	car	44.000000000	bank	own	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	15.000000000	existing paid	radio/tv	1444.000000000	no known savings	<1	4.000000000	male single	none	1.000000000	life insurance	23.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	9.000000000	existing paid	furniture/equipment	1980.000000000	<100	<1	2.000000000	female div/dep/mar	co applicant	2.000000000	car	19.000000000	none	rent	2.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	24.000000000	existing paid	new car	1355.000000000	<100	<1	3.000000000	female div/dep/mar	none	4.000000000	car	25.000000000	none	own	1.000000000	unskilled resident	1.000000000	yes	yes	bad
no checking	12.000000000	existing paid	education	1393.000000000	<100	>=7	4.000000000	male single	none	4.000000000	life insurance	47.000000000	bank	own	3.000000000	skilled	2.000000000	yes	yes	good
no checking	24.000000000	existing paid	radio/tv	1376.000000000	500<=X<1000	4<=X<7	4.000000000	female div/dep/mar	none	1.000000000	car	28.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	60.000000000	delayed previously	radio/tv	15653.000000000	<100	4<=X<7	2.000000000	male single	none	4.000000000	car	21.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	12.000000000	existing paid	radio/tv	1493.000000000	<100	<1	4.000000000	female div/dep/mar	none	3.000000000	car	34.000000000	none	own	1.000000000	skilled	2.000000000	none	yes	good
<0	42.000000000	delayed previously	radio/tv	4370.000000000	<100	4<=X<7	3.000000000	male single	none	2.000000000	life insurance	26.000000000	bank	own	2.000000000	skilled	2.000000000	yes	yes	bad
<0	18.000000000	existing paid	education	750.000000000	<100	unemployed	4.000000000	female div/dep/mar	none	1.000000000	real estate	27.000000000	none	own	1.000000000	unemp/unskilled non res	1.000000000	none	yes	bad
0<=X<200	15.000000000	existing paid	repairs	1308.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	38.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
no checking	15.000000000	existing paid	education	4623.000000000	100<=X<500	1<=X<4	3.000000000	male single	none	2.000000000	life insurance	40.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	24.000000000	critical/other existing credit	radio/tv	1851.000000000	<100	4<=X<7	4.000000000	male mar/wid	guarantor	2.000000000	car	33.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
<0	18.000000000	critical/other existing credit	radio/tv	1880.000000000	<100	4<=X<7	4.000000000	male mar/wid	none	1.000000000	life insurance	32.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	36.000000000	delayed previously	business	7980.000000000	no known savings	<1	4.000000000	male single	none	4.000000000	car	27.000000000	none	rent	2.000000000	skilled	1.000000000	yes	yes	bad
<0	30.000000000	no credits/all paid	furniture/equipment	4583.000000000	<100	1<=X<4	2.000000000	male div/sep	guarantor	2.000000000	real estate	32.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	12.000000000	existing paid	new car	1386.000000000	500<=X<1000	1<=X<4	2.000000000	female div/dep/mar	none	2.000000000	life insurance	26.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
>=200	24.000000000	existing paid	new car	947.000000000	<100	4<=X<7	4.000000000	male single	none	3.000000000	no known property	38.000000000	bank	for free	1.000000000	skilled	2.000000000	none	yes	bad
<0	12.000000000	existing paid	education	684.000000000	<100	1<=X<4	4.000000000	male single	none	4.000000000	car	40.000000000	none	rent	1.000000000	unskilled resident	2.000000000	none	yes	bad
<0	48.000000000	existing paid	education	7476.000000000	<100	4<=X<7	4.000000000	male single	none	1.000000000	no known property	50.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	12.000000000	existing paid	furniture/equipment	1922.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	life insurance	37.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
<0	24.000000000	existing paid	new car	2303.000000000	<100	>=7	4.000000000	male single	co applicant	1.000000000	real estate	45.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	36.000000000	delayed previously	new car	8086.000000000	100<=X<500	>=7	2.000000000	male single	none	4.000000000	car	42.000000000	none	own	4.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	24.000000000	critical/other existing credit	used car	2346.000000000	<100	4<=X<7	4.000000000	male single	none	3.000000000	car	35.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
<0	14.000000000	existing paid	new car	3973.000000000	<100	unemployed	1.000000000	male single	none	4.000000000	no known property	22.000000000	none	for free	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	new car	888.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	41.000000000	bank	own	1.000000000	unskilled resident	2.000000000	none	yes	bad
no checking	48.000000000	existing paid	radio/tv	10222.000000000	no known savings	4<=X<7	4.000000000	male single	none	3.000000000	car	37.000000000	stores	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	30.000000000	no credits/all paid	business	4221.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	none	1.000000000	car	28.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	18.000000000	critical/other existing credit	furniture/equipment	6361.000000000	<100	>=7	2.000000000	male single	none	1.000000000	no known property	41.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
>=200	12.000000000	existing paid	radio/tv	1297.000000000	<100	1<=X<4	3.000000000	male mar/wid	none	4.000000000	real estate	23.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
<0	12.000000000	existing paid	new car	900.000000000	no known savings	1<=X<4	4.000000000	male mar/wid	none	2.000000000	car	23.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	21.000000000	existing paid	furniture/equipment	2241.000000000	<100	>=7	4.000000000	male single	none	2.000000000	real estate	50.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	6.000000000	delayed previously	furniture/equipment	1050.000000000	<100	unemployed	4.000000000	male single	none	1.000000000	life insurance	35.000000000	stores	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
>=200	6.000000000	critical/other existing credit	education	1047.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	none	4.000000000	life insurance	50.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	24.000000000	critical/other existing credit	other	6314.000000000	<100	unemployed	4.000000000	male single	co applicant	2.000000000	no known property	27.000000000	bank	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	30.000000000	all paid	furniture/equipment	3496.000000000	>=1000	1<=X<4	4.000000000	male single	none	2.000000000	car	34.000000000	stores	own	1.000000000	skilled	2.000000000	yes	yes	good
no checking	48.000000000	all paid	business	3609.000000000	<100	1<=X<4	1.000000000	female div/dep/mar	none	1.000000000	real estate	27.000000000	stores	own	1.000000000	skilled	1.000000000	none	yes	good
<0	12.000000000	critical/other existing credit	new car	4843.000000000	<100	>=7	3.000000000	male single	co applicant	4.000000000	life insurance	43.000000000	none	rent	2.000000000	skilled	1.000000000	yes	yes	bad
>=200	30.000000000	critical/other existing credit	radio/tv	3017.000000000	<100	>=7	4.000000000	male single	none	4.000000000	life insurance	47.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	critical/other existing credit	business	4139.000000000	100<=X<500	1<=X<4	3.000000000	male single	none	3.000000000	life insurance	27.000000000	none	own	2.000000000	unskilled resident	1.000000000	yes	yes	good
no checking	36.000000000	existing paid	business	5742.000000000	100<=X<500	4<=X<7	2.000000000	male single	none	2.000000000	car	31.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	60.000000000	existing paid	new car	10366.000000000	<100	>=7	2.000000000	male single	none	4.000000000	life insurance	42.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	6.000000000	critical/other existing credit	new car	2080.000000000	500<=X<1000	1<=X<4	1.000000000	male mar/wid	none	2.000000000	car	24.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	21.000000000	delayed previously	business	2580.000000000	500<=X<1000	<1	4.000000000	male single	none	2.000000000	real estate	41.000000000	bank	own	1.000000000	unskilled resident	2.000000000	none	yes	bad
no checking	30.000000000	critical/other existing credit	radio/tv	4530.000000000	<100	4<=X<7	4.000000000	female div/dep/mar	none	4.000000000	car	26.000000000	none	rent	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	24.000000000	critical/other existing credit	furniture/equipment	5150.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	33.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	72.000000000	existing paid	radio/tv	5595.000000000	100<=X<500	1<=X<4	2.000000000	male mar/wid	none	2.000000000	car	24.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
<0	24.000000000	existing paid	radio/tv	2384.000000000	<100	>=7	4.000000000	male single	none	4.000000000	real estate	64.000000000	bank	rent	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	18.000000000	existing paid	radio/tv	1453.000000000	<100	<1	3.000000000	female div/dep/mar	none	1.000000000	real estate	26.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	6.000000000	existing paid	education	1538.000000000	<100	<1	1.000000000	female div/dep/mar	none	2.000000000	no known property	56.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	12.000000000	existing paid	radio/tv	2279.000000000	no known savings	1<=X<4	4.000000000	male single	none	4.000000000	no known property	37.000000000	none	for free	1.000000000	skilled	1.000000000	yes	yes	good
no checking	15.000000000	delayed previously	radio/tv	1478.000000000	<100	1<=X<4	4.000000000	male mar/wid	none	3.000000000	real estate	33.000000000	bank	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	critical/other existing credit	radio/tv	5103.000000000	<100	<1	3.000000000	male mar/wid	none	3.000000000	no known property	47.000000000	none	for free	3.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	36.000000000	delayed previously	business	9857.000000000	100<=X<500	4<=X<7	1.000000000	male single	none	3.000000000	life insurance	31.000000000	none	own	2.000000000	unskilled resident	2.000000000	yes	yes	good
no checking	60.000000000	existing paid	new car	6527.000000000	no known savings	1<=X<4	4.000000000	male single	none	4.000000000	no known property	34.000000000	none	for free	1.000000000	skilled	2.000000000	yes	yes	good
>=200	10.000000000	critical/other existing credit	radio/tv	1347.000000000	no known savings	4<=X<7	4.000000000	male single	none	2.000000000	life insurance	27.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	36.000000000	delayed previously	new car	2862.000000000	100<=X<500	>=7	4.000000000	male single	none	3.000000000	no known property	30.000000000	none	for free	1.000000000	skilled	1.000000000	none	yes	good
no checking	9.000000000	existing paid	radio/tv	2753.000000000	100<=X<500	>=7	3.000000000	male single	co applicant	4.000000000	car	35.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	12.000000000	existing paid	new car	3651.000000000	>=1000	1<=X<4	1.000000000	male single	none	3.000000000	life insurance	31.000000000	none	own	1.000000000	skilled	2.000000000	none	yes	good
<0	15.000000000	critical/other existing credit	furniture/equipment	975.000000000	<100	1<=X<4	2.000000000	male div/sep	none	3.000000000	life insurance	25.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	15.000000000	existing paid	repairs	2631.000000000	100<=X<500	1<=X<4	3.000000000	female div/dep/mar	none	2.000000000	real estate	25.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	24.000000000	existing paid	radio/tv	2896.000000000	100<=X<500	<1	2.000000000	male single	none	1.000000000	car	29.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	6.000000000	critical/other existing credit	new car	4716.000000000	no known savings	<1	1.000000000	male single	none	3.000000000	real estate	44.000000000	none	own	2.000000000	unskilled resident	2.000000000	none	yes	good
no checking	24.000000000	existing paid	radio/tv	2284.000000000	<100	4<=X<7	4.000000000	male single	none	2.000000000	car	28.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	6.000000000	existing paid	used car	1236.000000000	500<=X<1000	1<=X<4	2.000000000	male single	none	4.000000000	life insurance	50.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	radio/tv	1103.000000000	<100	4<=X<7	4.000000000	male single	guarantor	3.000000000	real estate	29.000000000	none	own	2.000000000	skilled	1.000000000	none	no	good
no checking	12.000000000	critical/other existing credit	new car	926.000000000	<100	unemployed	1.000000000	female div/dep/mar	none	2.000000000	life insurance	38.000000000	none	own	1.000000000	unemp/unskilled non res	1.000000000	none	yes	good
no checking	18.000000000	critical/other existing credit	radio/tv	1800.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	car	24.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
>=200	15.000000000	existing paid	education	1905.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	40.000000000	none	rent	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	12.000000000	existing paid	furniture/equipment	1123.000000000	500<=X<1000	1<=X<4	4.000000000	female div/dep/mar	none	4.000000000	car	29.000000000	none	rent	1.000000000	unskilled resident	1.000000000	none	yes	bad
<0	48.000000000	critical/other existing credit	used car	6331.000000000	<100	>=7	4.000000000	male single	none	4.000000000	no known property	46.000000000	none	for free	2.000000000	skilled	1.000000000	yes	yes	bad
>=200	24.000000000	existing paid	radio/tv	1377.000000000	100<=X<500	>=7	4.000000000	female div/dep/mar	none	2.000000000	no known property	47.000000000	none	for free	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	30.000000000	delayed previously	business	2503.000000000	100<=X<500	>=7	4.000000000	male single	none	2.000000000	life insurance	41.000000000	stores	own	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	27.000000000	existing paid	business	2528.000000000	<100	<1	4.000000000	female div/dep/mar	none	1.000000000	life insurance	32.000000000	none	own	1.000000000	skilled	2.000000000	yes	yes	good
no checking	15.000000000	existing paid	new car	5324.000000000	500<=X<1000	>=7	1.000000000	female div/dep/mar	none	4.000000000	no known property	35.000000000	none	for free	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	48.000000000	existing paid	new car	6560.000000000	100<=X<500	4<=X<7	3.000000000	male single	none	2.000000000	life insurance	24.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	12.000000000	no credits/all paid	furniture/equipment	2969.000000000	<100	<1	4.000000000	female div/dep/mar	none	3.000000000	life insurance	25.000000000	none	rent	2.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	9.000000000	existing paid	radio/tv	1206.000000000	<100	>=7	4.000000000	female div/dep/mar	none	4.000000000	real estate	25.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	9.000000000	existing paid	radio/tv	2118.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	real estate	37.000000000	none	own	1.000000000	unskilled resident	2.000000000	none	yes	good
no checking	18.000000000	critical/other existing credit	radio/tv	629.000000000	500<=X<1000	>=7	4.000000000	male single	none	3.000000000	life insurance	32.000000000	bank	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	6.000000000	all paid	education	1198.000000000	<100	>=7	4.000000000	female div/dep/mar	none	4.000000000	no known property	35.000000000	none	for free	1.000000000	skilled	1.000000000	none	yes	bad
no checking	21.000000000	existing paid	used car	2476.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	real estate	46.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	9.000000000	critical/other existing credit	radio/tv	1138.000000000	<100	1<=X<4	4.000000000	male single	none	4.000000000	real estate	25.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	60.000000000	existing paid	new car	14027.000000000	<100	4<=X<7	4.000000000	male single	none	2.000000000	no known property	27.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	30.000000000	critical/other existing credit	used car	7596.000000000	no known savings	>=7	1.000000000	male single	none	4.000000000	car	63.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	30.000000000	critical/other existing credit	radio/tv	3077.000000000	no known savings	>=7	3.000000000	male single	none	2.000000000	car	40.000000000	none	own	2.000000000	skilled	2.000000000	yes	yes	good
no checking	18.000000000	existing paid	radio/tv	1505.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	no known property	32.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
>=200	24.000000000	critical/other existing credit	radio/tv	3148.000000000	no known savings	1<=X<4	3.000000000	male single	none	2.000000000	car	31.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	20.000000000	no credits/all paid	used car	6148.000000000	100<=X<500	>=7	3.000000000	male mar/wid	none	4.000000000	car	31.000000000	bank	own	2.000000000	skilled	1.000000000	yes	yes	good
>=200	9.000000000	no credits/all paid	radio/tv	1337.000000000	<100	<1	4.000000000	male single	none	2.000000000	car	34.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
0<=X<200	6.000000000	all paid	education	433.000000000	>=1000	<1	4.000000000	female div/dep/mar	none	2.000000000	life insurance	24.000000000	bank	rent	1.000000000	skilled	2.000000000	none	yes	bad
<0	12.000000000	existing paid	new car	1228.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	2.000000000	real estate	24.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
0<=X<200	9.000000000	existing paid	radio/tv	790.000000000	500<=X<1000	1<=X<4	4.000000000	female div/dep/mar	none	3.000000000	real estate	66.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	27.000000000	existing paid	new car	2570.000000000	<100	1<=X<4	3.000000000	female div/dep/mar	none	3.000000000	real estate	21.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
no checking	6.000000000	critical/other existing credit	new car	250.000000000	>=1000	1<=X<4	2.000000000	female div/dep/mar	none	2.000000000	real estate	41.000000000	bank	own	2.000000000	unskilled resident	1.000000000	none	yes	good
no checking	15.000000000	critical/other existing credit	radio/tv	1316.000000000	500<=X<1000	1<=X<4	2.000000000	male mar/wid	none	2.000000000	life insurance	47.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
<0	18.000000000	existing paid	radio/tv	1882.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	4.000000000	car	25.000000000	bank	rent	2.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	48.000000000	all paid	business	6416.000000000	<100	>=7	4.000000000	female div/dep/mar	none	3.000000000	no known property	59.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
>=200	24.000000000	critical/other existing credit	business	1275.000000000	>=1000	1<=X<4	2.000000000	male div/sep	none	4.000000000	real estate	36.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	24.000000000	delayed previously	radio/tv	6403.000000000	<100	<1	1.000000000	male single	none	2.000000000	car	33.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	24.000000000	existing paid	radio/tv	1987.000000000	<100	1<=X<4	2.000000000	male single	none	4.000000000	real estate	21.000000000	none	rent	1.000000000	unskilled resident	2.000000000	none	yes	bad
0<=X<200	8.000000000	existing paid	radio/tv	760.000000000	<100	4<=X<7	4.000000000	female div/dep/mar	guarantor	2.000000000	real estate	44.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	24.000000000	existing paid	used car	2603.000000000	>=1000	1<=X<4	2.000000000	female div/dep/mar	none	4.000000000	car	28.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	good
no checking	4.000000000	critical/other existing credit	new car	3380.000000000	<100	4<=X<7	1.000000000	female div/dep/mar	none	1.000000000	real estate	37.000000000	none	own	1.000000000	skilled	2.000000000	none	yes	good
0<=X<200	36.000000000	all paid	domestic appliance	3990.000000000	no known savings	<1	3.000000000	female div/dep/mar	none	2.000000000	no known property	29.000000000	bank	own	1.000000000	unemp/unskilled non res	1.000000000	none	yes	good
0<=X<200	24.000000000	existing paid	used car	11560.000000000	<100	1<=X<4	1.000000000	female div/dep/mar	none	4.000000000	car	23.000000000	none	rent	2.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	bad
<0	18.000000000	existing paid	new car	4380.000000000	100<=X<500	1<=X<4	3.000000000	male single	none	4.000000000	car	35.000000000	none	own	1.000000000	unskilled resident	2.000000000	yes	yes	good
no checking	6.000000000	critical/other existing credit	new car	6761.000000000	<100	4<=X<7	1.000000000	male single	none	3.000000000	no known property	45.000000000	none	own	2.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	good
0<=X<200	30.000000000	no credits/all paid	business	4280.000000000	100<=X<500	1<=X<4	4.000000000	female div/dep/mar	none	4.000000000	car	26.000000000	none	rent	2.000000000	unskilled resident	1.000000000	none	yes	bad
<0	24.000000000	all paid	new car	2325.000000000	100<=X<500	4<=X<7	2.000000000	male single	none	3.000000000	car	32.000000000	bank	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	10.000000000	all paid	radio/tv	1048.000000000	<100	1<=X<4	4.000000000	male single	none	4.000000000	real estate	23.000000000	stores	own	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	21.000000000	existing paid	radio/tv	3160.000000000	no known savings	>=7	4.000000000	male single	none	3.000000000	life insurance	41.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	24.000000000	all paid	furniture/equipment	2483.000000000	500<=X<1000	1<=X<4	4.000000000	male single	none	4.000000000	real estate	22.000000000	stores	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	39.000000000	critical/other existing credit	furniture/equipment	14179.000000000	no known savings	4<=X<7	4.000000000	male single	none	4.000000000	life insurance	30.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	13.000000000	critical/other existing credit	business	1797.000000000	<100	<1	3.000000000	male single	none	1.000000000	life insurance	28.000000000	bank	own	2.000000000	unskilled resident	1.000000000	none	yes	good
<0	15.000000000	existing paid	new car	2511.000000000	<100	unemployed	1.000000000	female div/dep/mar	none	4.000000000	car	23.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
<0	12.000000000	existing paid	new car	1274.000000000	<100	<1	3.000000000	female div/dep/mar	none	1.000000000	real estate	37.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
no checking	21.000000000	existing paid	used car	5248.000000000	no known savings	1<=X<4	1.000000000	male single	none	3.000000000	car	26.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	15.000000000	existing paid	used car	3029.000000000	<100	4<=X<7	2.000000000	male single	none	2.000000000	car	33.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	6.000000000	existing paid	furniture/equipment	428.000000000	<100	>=7	2.000000000	female div/dep/mar	none	1.000000000	life insurance	49.000000000	bank	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	18.000000000	existing paid	new car	976.000000000	<100	<1	1.000000000	female div/dep/mar	none	2.000000000	car	23.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
0<=X<200	12.000000000	existing paid	business	841.000000000	100<=X<500	4<=X<7	2.000000000	female div/dep/mar	none	4.000000000	real estate	23.000000000	none	rent	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	30.000000000	critical/other existing credit	radio/tv	5771.000000000	<100	4<=X<7	4.000000000	female div/dep/mar	none	2.000000000	car	25.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	12.000000000	delayed previously	repairs	1555.000000000	>=1000	>=7	4.000000000	male single	none	4.000000000	no known property	55.000000000	none	for free	2.000000000	skilled	2.000000000	none	yes	bad
<0	24.000000000	existing paid	new car	1285.000000000	no known savings	4<=X<7	4.000000000	female div/dep/mar	none	4.000000000	no known property	32.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
>=200	6.000000000	critical/other existing credit	new car	1299.000000000	<100	1<=X<4	1.000000000	male single	none	1.000000000	real estate	74.000000000	none	own	3.000000000	unemp/unskilled non res	2.000000000	none	no	good
>=200	15.000000000	critical/other existing credit	radio/tv	1271.000000000	no known savings	1<=X<4	3.000000000	male single	none	4.000000000	no known property	39.000000000	none	for free	2.000000000	skilled	1.000000000	yes	yes	bad
no checking	24.000000000	existing paid	new car	1393.000000000	<100	1<=X<4	2.000000000	male single	guarantor	2.000000000	real estate	31.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	12.000000000	critical/other existing credit	new car	691.000000000	<100	>=7	4.000000000	male single	none	3.000000000	life insurance	35.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	bad
no checking	15.000000000	critical/other existing credit	new car	5045.000000000	no known savings	>=7	1.000000000	female div/dep/mar	none	4.000000000	car	59.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	18.000000000	critical/other existing credit	furniture/equipment	2124.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	4.000000000	real estate	24.000000000	none	rent	2.000000000	skilled	1.000000000	none	yes	bad
<0	12.000000000	existing paid	radio/tv	2214.000000000	<100	1<=X<4	4.000000000	male single	none	3.000000000	life insurance	24.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	21.000000000	critical/other existing credit	new car	12680.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	no known property	30.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	24.000000000	critical/other existing credit	new car	2463.000000000	100<=X<500	4<=X<7	4.000000000	male mar/wid	none	3.000000000	life insurance	27.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	12.000000000	existing paid	radio/tv	1155.000000000	<100	>=7	3.000000000	male mar/wid	guarantor	3.000000000	real estate	40.000000000	bank	own	2.000000000	unskilled resident	1.000000000	none	yes	good
<0	30.000000000	existing paid	furniture/equipment	3108.000000000	<100	<1	2.000000000	male div/sep	none	4.000000000	life insurance	31.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
no checking	10.000000000	existing paid	used car	2901.000000000	no known savings	<1	1.000000000	female div/dep/mar	none	4.000000000	real estate	31.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	12.000000000	critical/other existing credit	furniture/equipment	3617.000000000	<100	>=7	1.000000000	male single	none	4.000000000	car	28.000000000	none	rent	3.000000000	skilled	1.000000000	yes	yes	good
no checking	12.000000000	critical/other existing credit	radio/tv	1655.000000000	<100	>=7	2.000000000	male single	none	4.000000000	real estate	63.000000000	none	own	2.000000000	unskilled resident	1.000000000	yes	yes	good
<0	24.000000000	existing paid	used car	2812.000000000	no known savings	>=7	2.000000000	female div/dep/mar	none	4.000000000	real estate	26.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
<0	36.000000000	critical/other existing credit	education	8065.000000000	<100	1<=X<4	3.000000000	female div/dep/mar	none	2.000000000	no known property	25.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	21.000000000	critical/other existing credit	used car	3275.000000000	<100	>=7	1.000000000	male single	none	4.000000000	car	36.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	24.000000000	critical/other existing credit	radio/tv	2223.000000000	100<=X<500	>=7	4.000000000	male single	none	4.000000000	life insurance	52.000000000	bank	own	2.000000000	skilled	1.000000000	none	yes	good
>=200	12.000000000	critical/other existing credit	new car	1480.000000000	500<=X<1000	unemployed	2.000000000	male single	none	4.000000000	no known property	66.000000000	bank	for free	3.000000000	unemp/unskilled non res	1.000000000	none	yes	good
<0	24.000000000	existing paid	new car	1371.000000000	no known savings	1<=X<4	4.000000000	female div/dep/mar	none	4.000000000	real estate	25.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
no checking	36.000000000	critical/other existing credit	new car	3535.000000000	<100	4<=X<7	4.000000000	male single	none	4.000000000	car	37.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
<0	18.000000000	existing paid	radio/tv	3509.000000000	<100	4<=X<7	4.000000000	female div/dep/mar	guarantor	1.000000000	real estate	25.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	36.000000000	critical/other existing credit	used car	5711.000000000	>=1000	>=7	4.000000000	male single	none	2.000000000	car	38.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	18.000000000	existing paid	repairs	3872.000000000	<100	unemployed	2.000000000	female div/dep/mar	none	4.000000000	car	67.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	39.000000000	critical/other existing credit	radio/tv	4933.000000000	<100	4<=X<7	2.000000000	male single	guarantor	2.000000000	real estate	25.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	bad
no checking	24.000000000	critical/other existing credit	new car	1940.000000000	>=1000	>=7	4.000000000	male single	none	4.000000000	real estate	60.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	12.000000000	no credits/all paid	retraining	1410.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	real estate	31.000000000	none	own	1.000000000	unskilled resident	1.000000000	yes	yes	good
0<=X<200	12.000000000	existing paid	new car	836.000000000	100<=X<500	<1	4.000000000	female div/dep/mar	none	2.000000000	life insurance	23.000000000	bank	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
0<=X<200	20.000000000	existing paid	used car	6468.000000000	no known savings	unemployed	1.000000000	male div/sep	none	4.000000000	real estate	60.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	18.000000000	existing paid	business	1941.000000000	>=1000	1<=X<4	4.000000000	male single	none	2.000000000	life insurance	35.000000000	none	own	1.000000000	unskilled resident	1.000000000	yes	yes	good
no checking	22.000000000	existing paid	radio/tv	2675.000000000	500<=X<1000	>=7	3.000000000	male single	none	4.000000000	car	40.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	48.000000000	critical/other existing credit	used car	2751.000000000	no known savings	>=7	4.000000000	male single	none	3.000000000	car	38.000000000	none	own	2.000000000	skilled	2.000000000	yes	yes	good
0<=X<200	48.000000000	delayed previously	education	6224.000000000	<100	>=7	4.000000000	male single	none	4.000000000	no known property	50.000000000	none	for free	1.000000000	skilled	1.000000000	none	yes	bad
<0	40.000000000	critical/other existing credit	education	5998.000000000	<100	1<=X<4	4.000000000	male single	none	3.000000000	no known property	27.000000000	bank	own	1.000000000	skilled	1.000000000	yes	yes	bad
0<=X<200	21.000000000	existing paid	business	1188.000000000	<100	>=7	2.000000000	female div/dep/mar	none	4.000000000	life insurance	39.000000000	none	own	1.000000000	skilled	2.000000000	none	yes	bad
no checking	24.000000000	existing paid	used car	6313.000000000	no known savings	>=7	3.000000000	male single	none	4.000000000	car	41.000000000	none	own	1.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	good
no checking	6.000000000	critical/other existing credit	furniture/equipment	1221.000000000	no known savings	1<=X<4	1.000000000	male mar/wid	none	2.000000000	life insurance	27.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
>=200	24.000000000	existing paid	furniture/equipment	2892.000000000	<100	>=7	3.000000000	male div/sep	none	4.000000000	no known property	51.000000000	none	for free	1.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	existing paid	furniture/equipment	3062.000000000	500<=X<1000	>=7	4.000000000	male single	none	3.000000000	no known property	32.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	good
no checking	9.000000000	existing paid	furniture/equipment	2301.000000000	100<=X<500	<1	2.000000000	female div/dep/mar	none	4.000000000	life insurance	22.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
<0	18.000000000	existing paid	used car	7511.000000000	no known savings	>=7	1.000000000	male single	none	4.000000000	life insurance	51.000000000	none	for free	1.000000000	skilled	2.000000000	yes	yes	bad
no checking	12.000000000	critical/other existing credit	furniture/equipment	1258.000000000	<100	<1	2.000000000	female div/dep/mar	none	4.000000000	life insurance	22.000000000	none	rent	2.000000000	unskilled resident	1.000000000	none	yes	good
no checking	24.000000000	delayed previously	new car	717.000000000	no known savings	>=7	4.000000000	male mar/wid	none	4.000000000	car	54.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	9.000000000	existing paid	new car	1549.000000000	no known savings	<1	4.000000000	male single	none	2.000000000	real estate	35.000000000	none	own	1.000000000	unemp/unskilled non res	1.000000000	none	yes	good
no checking	24.000000000	critical/other existing credit	education	1597.000000000	<100	>=7	4.000000000	male single	none	4.000000000	no known property	54.000000000	none	for free	2.000000000	skilled	2.000000000	none	yes	good
0<=X<200	18.000000000	critical/other existing credit	radio/tv	1795.000000000	<100	>=7	3.000000000	female div/dep/mar	guarantor	4.000000000	real estate	48.000000000	bank	rent	2.000000000	unskilled resident	1.000000000	yes	yes	good
<0	20.000000000	critical/other existing credit	furniture/equipment	4272.000000000	<100	>=7	1.000000000	female div/dep/mar	none	4.000000000	life insurance	24.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	12.000000000	critical/other existing credit	radio/tv	976.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	car	35.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	12.000000000	existing paid	new car	7472.000000000	no known savings	unemployed	1.000000000	female div/dep/mar	none	2.000000000	real estate	24.000000000	none	rent	1.000000000	unemp/unskilled non res	1.000000000	none	yes	good
<0	36.000000000	existing paid	new car	9271.000000000	<100	4<=X<7	2.000000000	male single	none	1.000000000	car	24.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	bad
0<=X<200	6.000000000	existing paid	radio/tv	590.000000000	<100	<1	3.000000000	male mar/wid	none	3.000000000	real estate	26.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	no	good
no checking	12.000000000	critical/other existing credit	radio/tv	930.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	real estate	65.000000000	none	own	4.000000000	skilled	1.000000000	none	yes	good
0<=X<200	42.000000000	all paid	used car	9283.000000000	<100	unemployed	1.000000000	male single	none	2.000000000	no known property	55.000000000	bank	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	15.000000000	no credits/all paid	new car	1778.000000000	<100	<1	2.000000000	female div/dep/mar	none	1.000000000	real estate	26.000000000	none	rent	2.000000000	unemp/unskilled non res	1.000000000	none	yes	bad
0<=X<200	8.000000000	existing paid	business	907.000000000	<100	<1	3.000000000	male mar/wid	none	2.000000000	real estate	26.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	6.000000000	existing paid	radio/tv	484.000000000	<100	4<=X<7	3.000000000	male mar/wid	guarantor	3.000000000	real estate	28.000000000	bank	own	1.000000000	unskilled resident	1.000000000	none	yes	good
<0	36.000000000	critical/other existing credit	used car	9629.000000000	<100	4<=X<7	4.000000000	male single	none	4.000000000	car	24.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	bad
<0	48.000000000	existing paid	domestic appliance	3051.000000000	<100	1<=X<4	3.000000000	male single	none	4.000000000	car	54.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
<0	48.000000000	existing paid	new car	3931.000000000	<100	4<=X<7	4.000000000	male single	none	4.000000000	no known property	46.000000000	none	for free	1.000000000	skilled	2.000000000	none	yes	bad
0<=X<200	36.000000000	delayed previously	new car	7432.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	none	2.000000000	life insurance	54.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
no checking	6.000000000	existing paid	domestic appliance	1338.000000000	500<=X<1000	1<=X<4	1.000000000	male div/sep	none	4.000000000	real estate	62.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	6.000000000	critical/other existing credit	radio/tv	1554.000000000	<100	4<=X<7	1.000000000	female div/dep/mar	none	2.000000000	car	24.000000000	none	rent	2.000000000	skilled	1.000000000	yes	yes	good
<0	36.000000000	existing paid	other	15857.000000000	<100	unemployed	2.000000000	male div/sep	co applicant	3.000000000	car	43.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	good
<0	18.000000000	existing paid	radio/tv	1345.000000000	<100	1<=X<4	4.000000000	male mar/wid	none	3.000000000	real estate	26.000000000	bank	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	12.000000000	existing paid	new car	1101.000000000	<100	1<=X<4	3.000000000	male mar/wid	none	2.000000000	real estate	27.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
>=200	12.000000000	existing paid	radio/tv	3016.000000000	<100	1<=X<4	3.000000000	male mar/wid	none	1.000000000	car	24.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	36.000000000	existing paid	furniture/equipment	2712.000000000	<100	>=7	2.000000000	male single	none	2.000000000	life insurance	41.000000000	bank	own	1.000000000	skilled	2.000000000	none	yes	bad
<0	8.000000000	critical/other existing credit	new car	731.000000000	<100	>=7	4.000000000	male single	none	4.000000000	real estate	47.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
no checking	18.000000000	critical/other existing credit	furniture/equipment	3780.000000000	<100	<1	3.000000000	male div/sep	none	2.000000000	car	35.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	21.000000000	critical/other existing credit	new car	1602.000000000	<100	>=7	4.000000000	male mar/wid	none	3.000000000	car	30.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
<0	18.000000000	critical/other existing credit	new car	3966.000000000	<100	>=7	1.000000000	female div/dep/mar	none	4.000000000	real estate	33.000000000	bank	rent	3.000000000	skilled	1.000000000	yes	yes	bad
no checking	18.000000000	no credits/all paid	business	4165.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	car	36.000000000	stores	own	2.000000000	skilled	2.000000000	none	yes	bad
<0	36.000000000	existing paid	used car	8335.000000000	no known savings	>=7	3.000000000	male single	none	4.000000000	no known property	47.000000000	none	for free	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	48.000000000	delayed previously	business	6681.000000000	no known savings	1<=X<4	4.000000000	male single	none	4.000000000	no known property	38.000000000	none	for free	1.000000000	skilled	2.000000000	yes	yes	good
no checking	24.000000000	delayed previously	business	2375.000000000	500<=X<1000	1<=X<4	4.000000000	male single	none	2.000000000	car	44.000000000	none	own	2.000000000	skilled	2.000000000	yes	yes	good
<0	18.000000000	existing paid	new car	1216.000000000	<100	<1	4.000000000	female div/dep/mar	none	3.000000000	car	23.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	bad
<0	45.000000000	no credits/all paid	business	11816.000000000	<100	>=7	2.000000000	male single	none	4.000000000	car	29.000000000	none	rent	2.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	24.000000000	existing paid	radio/tv	5084.000000000	no known savings	>=7	2.000000000	female div/dep/mar	none	4.000000000	car	42.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
>=200	15.000000000	existing paid	radio/tv	2327.000000000	<100	<1	2.000000000	female div/dep/mar	none	3.000000000	real estate	25.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
<0	12.000000000	no credits/all paid	new car	1082.000000000	<100	1<=X<4	4.000000000	male single	none	4.000000000	car	48.000000000	bank	own	2.000000000	skilled	1.000000000	none	yes	bad
no checking	12.000000000	existing paid	radio/tv	886.000000000	no known savings	1<=X<4	4.000000000	female div/dep/mar	none	2.000000000	car	21.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	4.000000000	existing paid	furniture/equipment	601.000000000	<100	<1	1.000000000	female div/dep/mar	none	3.000000000	real estate	23.000000000	none	rent	1.000000000	unskilled resident	2.000000000	none	yes	good
<0	24.000000000	critical/other existing credit	used car	2957.000000000	<100	>=7	4.000000000	male single	none	4.000000000	life insurance	63.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	24.000000000	critical/other existing credit	radio/tv	2611.000000000	<100	>=7	4.000000000	male mar/wid	co applicant	3.000000000	real estate	46.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
<0	36.000000000	existing paid	furniture/equipment	5179.000000000	<100	4<=X<7	4.000000000	male single	none	2.000000000	life insurance	29.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	21.000000000	delayed previously	used car	2993.000000000	<100	1<=X<4	3.000000000	male single	none	2.000000000	real estate	28.000000000	stores	own	2.000000000	unskilled resident	1.000000000	none	yes	good
no checking	18.000000000	existing paid	repairs	1943.000000000	<100	<1	4.000000000	female div/dep/mar	none	4.000000000	real estate	23.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	24.000000000	all paid	business	1559.000000000	<100	4<=X<7	4.000000000	male single	none	4.000000000	car	50.000000000	bank	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	18.000000000	existing paid	furniture/equipment	3422.000000000	<100	>=7	4.000000000	male single	none	4.000000000	life insurance	47.000000000	bank	own	3.000000000	skilled	2.000000000	yes	yes	good
0<=X<200	21.000000000	existing paid	furniture/equipment	3976.000000000	no known savings	4<=X<7	2.000000000	male single	none	3.000000000	car	35.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	18.000000000	existing paid	new car	6761.000000000	no known savings	1<=X<4	2.000000000	male single	none	4.000000000	car	68.000000000	none	rent	2.000000000	skilled	1.000000000	none	yes	bad
no checking	24.000000000	existing paid	new car	1249.000000000	<100	<1	4.000000000	male mar/wid	none	2.000000000	real estate	28.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	9.000000000	existing paid	radio/tv	1364.000000000	<100	4<=X<7	3.000000000	male single	none	4.000000000	real estate	59.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	12.000000000	existing paid	radio/tv	709.000000000	<100	>=7	4.000000000	male single	none	4.000000000	real estate	57.000000000	stores	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
<0	20.000000000	critical/other existing credit	new car	2235.000000000	<100	1<=X<4	4.000000000	male mar/wid	guarantor	2.000000000	life insurance	33.000000000	bank	rent	2.000000000	skilled	1.000000000	none	no	bad
no checking	24.000000000	critical/other existing credit	used car	4042.000000000	no known savings	4<=X<7	3.000000000	male single	none	4.000000000	life insurance	43.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	15.000000000	critical/other existing credit	radio/tv	1471.000000000	<100	1<=X<4	4.000000000	male single	none	4.000000000	no known property	35.000000000	none	for free	2.000000000	skilled	1.000000000	yes	yes	good
<0	18.000000000	all paid	new car	1442.000000000	<100	4<=X<7	4.000000000	male single	none	4.000000000	no known property	32.000000000	none	for free	2.000000000	unskilled resident	2.000000000	none	yes	bad
no checking	36.000000000	delayed previously	new car	10875.000000000	<100	>=7	2.000000000	male single	none	2.000000000	car	45.000000000	none	own	2.000000000	skilled	2.000000000	yes	yes	good
no checking	24.000000000	existing paid	new car	1474.000000000	100<=X<500	<1	4.000000000	male mar/wid	none	3.000000000	real estate	33.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	10.000000000	existing paid	retraining	894.000000000	no known savings	4<=X<7	4.000000000	female div/dep/mar	none	3.000000000	life insurance	40.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	15.000000000	critical/other existing credit	furniture/equipment	3343.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	no known property	28.000000000	none	for free	1.000000000	skilled	1.000000000	yes	yes	good
<0	15.000000000	existing paid	new car	3959.000000000	<100	1<=X<4	3.000000000	female div/dep/mar	none	2.000000000	life insurance	29.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	bad
no checking	9.000000000	existing paid	new car	3577.000000000	100<=X<500	1<=X<4	1.000000000	male single	guarantor	2.000000000	real estate	26.000000000	none	rent	1.000000000	skilled	2.000000000	none	no	good
no checking	24.000000000	critical/other existing credit	used car	5804.000000000	>=1000	1<=X<4	4.000000000	male single	none	2.000000000	real estate	27.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	18.000000000	delayed previously	business	2169.000000000	<100	1<=X<4	4.000000000	male mar/wid	none	2.000000000	car	28.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	bad
<0	24.000000000	existing paid	radio/tv	2439.000000000	<100	<1	4.000000000	female div/dep/mar	none	4.000000000	real estate	35.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	bad
no checking	27.000000000	critical/other existing credit	furniture/equipment	4526.000000000	>=1000	<1	4.000000000	male single	none	2.000000000	real estate	32.000000000	stores	own	2.000000000	unskilled resident	2.000000000	yes	yes	good
no checking	10.000000000	existing paid	furniture/equipment	2210.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	real estate	25.000000000	bank	rent	1.000000000	unskilled resident	1.000000000	none	yes	bad
no checking	15.000000000	existing paid	furniture/equipment	2221.000000000	500<=X<1000	1<=X<4	2.000000000	female div/dep/mar	none	4.000000000	car	20.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
<0	18.000000000	existing paid	radio/tv	2389.000000000	<100	<1	4.000000000	female div/dep/mar	none	1.000000000	car	27.000000000	stores	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	12.000000000	critical/other existing credit	furniture/equipment	3331.000000000	<100	>=7	2.000000000	male single	none	4.000000000	life insurance	42.000000000	stores	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	36.000000000	existing paid	business	7409.000000000	no known savings	>=7	3.000000000	male single	none	2.000000000	life insurance	37.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
<0	12.000000000	existing paid	furniture/equipment	652.000000000	<100	>=7	4.000000000	female div/dep/mar	none	4.000000000	life insurance	24.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
no checking	36.000000000	delayed previously	furniture/equipment	7678.000000000	500<=X<1000	4<=X<7	2.000000000	female div/dep/mar	none	4.000000000	car	40.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
>=200	6.000000000	critical/other existing credit	new car	1343.000000000	<100	>=7	1.000000000	male single	none	4.000000000	real estate	46.000000000	none	own	2.000000000	skilled	2.000000000	none	no	good
<0	24.000000000	critical/other existing credit	business	1382.000000000	100<=X<500	4<=X<7	4.000000000	male single	none	1.000000000	real estate	26.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	15.000000000	existing paid	domestic appliance	874.000000000	no known savings	<1	4.000000000	female div/dep/mar	none	1.000000000	real estate	24.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	12.000000000	existing paid	furniture/equipment	3590.000000000	<100	1<=X<4	2.000000000	male single	co applicant	2.000000000	life insurance	29.000000000	none	own	1.000000000	unskilled resident	2.000000000	none	yes	good
0<=X<200	11.000000000	critical/other existing credit	new car	1322.000000000	>=1000	1<=X<4	4.000000000	female div/dep/mar	none	4.000000000	car	40.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
<0	18.000000000	all paid	radio/tv	1940.000000000	<100	<1	3.000000000	male single	co applicant	4.000000000	no known property	36.000000000	bank	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	36.000000000	existing paid	radio/tv	3595.000000000	<100	>=7	4.000000000	male single	none	2.000000000	car	28.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	9.000000000	existing paid	new car	1422.000000000	<100	<1	3.000000000	male single	none	2.000000000	no known property	27.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	30.000000000	critical/other existing credit	radio/tv	6742.000000000	no known savings	4<=X<7	2.000000000	male single	none	3.000000000	life insurance	36.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	existing paid	used car	7814.000000000	<100	4<=X<7	3.000000000	male single	none	3.000000000	car	38.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	24.000000000	existing paid	used car	9277.000000000	no known savings	1<=X<4	2.000000000	male div/sep	none	4.000000000	no known property	48.000000000	none	for free	1.000000000	skilled	1.000000000	yes	yes	good
0<=X<200	30.000000000	critical/other existing credit	new car	2181.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	real estate	36.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	18.000000000	critical/other existing credit	radio/tv	1098.000000000	<100	unemployed	4.000000000	female div/dep/mar	none	4.000000000	car	65.000000000	none	own	2.000000000	unemp/unskilled non res	1.000000000	none	yes	good
0<=X<200	24.000000000	existing paid	furniture/equipment	4057.000000000	<100	4<=X<7	3.000000000	male div/sep	none	3.000000000	car	43.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	bad
<0	12.000000000	existing paid	education	795.000000000	<100	<1	4.000000000	female div/dep/mar	none	4.000000000	life insurance	53.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	24.000000000	critical/other existing credit	business	2825.000000000	no known savings	4<=X<7	4.000000000	male single	none	3.000000000	no known property	34.000000000	none	own	2.000000000	skilled	2.000000000	yes	yes	good
0<=X<200	48.000000000	existing paid	business	15672.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	car	23.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	bad
no checking	36.000000000	critical/other existing credit	new car	6614.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	34.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	28.000000000	all paid	used car	7824.000000000	no known savings	<1	3.000000000	male single	guarantor	4.000000000	real estate	40.000000000	bank	rent	2.000000000	skilled	2.000000000	yes	yes	good
<0	27.000000000	critical/other existing credit	business	2442.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	43.000000000	stores	own	4.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	good
no checking	15.000000000	critical/other existing credit	radio/tv	1829.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	46.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
<0	12.000000000	critical/other existing credit	new car	2171.000000000	<100	1<=X<4	4.000000000	male single	none	4.000000000	life insurance	38.000000000	bank	own	2.000000000	unskilled resident	1.000000000	none	no	good
0<=X<200	36.000000000	critical/other existing credit	used car	5800.000000000	<100	1<=X<4	3.000000000	male single	none	4.000000000	car	34.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	18.000000000	critical/other existing credit	radio/tv	1169.000000000	no known savings	1<=X<4	4.000000000	male single	none	3.000000000	life insurance	29.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	36.000000000	delayed previously	used car	8947.000000000	no known savings	4<=X<7	3.000000000	male single	none	2.000000000	car	31.000000000	stores	own	1.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	good
<0	21.000000000	existing paid	radio/tv	2606.000000000	<100	<1	4.000000000	female div/dep/mar	none	4.000000000	life insurance	28.000000000	none	rent	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	12.000000000	critical/other existing credit	furniture/equipment	1592.000000000	>=1000	4<=X<7	3.000000000	female div/dep/mar	none	2.000000000	life insurance	35.000000000	none	own	1.000000000	skilled	1.000000000	none	no	good
no checking	15.000000000	existing paid	furniture/equipment	2186.000000000	no known savings	4<=X<7	1.000000000	female div/dep/mar	none	4.000000000	real estate	33.000000000	bank	rent	1.000000000	unskilled resident	1.000000000	none	yes	good
<0	18.000000000	existing paid	furniture/equipment	4153.000000000	<100	1<=X<4	2.000000000	male single	co applicant	3.000000000	car	42.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
<0	16.000000000	critical/other existing credit	new car	2625.000000000	<100	>=7	2.000000000	male single	guarantor	4.000000000	life insurance	43.000000000	bank	rent	1.000000000	skilled	1.000000000	yes	yes	bad
no checking	20.000000000	critical/other existing credit	new car	3485.000000000	no known savings	<1	2.000000000	male div/sep	none	4.000000000	real estate	44.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	good
no checking	36.000000000	critical/other existing credit	used car	10477.000000000	no known savings	>=7	2.000000000	male single	none	4.000000000	no known property	42.000000000	none	for free	2.000000000	skilled	1.000000000	none	yes	good
no checking	15.000000000	existing paid	radio/tv	1386.000000000	no known savings	1<=X<4	4.000000000	male mar/wid	none	2.000000000	real estate	40.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	good
no checking	24.000000000	existing paid	radio/tv	1278.000000000	<100	>=7	4.000000000	male single	none	1.000000000	real estate	36.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	12.000000000	existing paid	radio/tv	1107.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	real estate	20.000000000	none	rent	1.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	good
<0	21.000000000	existing paid	new car	3763.000000000	no known savings	4<=X<7	2.000000000	male single	co applicant	2.000000000	real estate	24.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	no	good
0<=X<200	36.000000000	existing paid	education	3711.000000000	no known savings	1<=X<4	2.000000000	male mar/wid	none	2.000000000	car	27.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	15.000000000	delayed previously	used car	3594.000000000	<100	<1	1.000000000	female div/dep/mar	none	2.000000000	life insurance	46.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	9.000000000	existing paid	new car	3195.000000000	no known savings	1<=X<4	1.000000000	female div/dep/mar	none	2.000000000	real estate	33.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
no checking	36.000000000	delayed previously	radio/tv	4454.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	4.000000000	real estate	34.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	24.000000000	critical/other existing credit	furniture/equipment	4736.000000000	<100	<1	2.000000000	female div/dep/mar	none	4.000000000	car	25.000000000	bank	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
0<=X<200	30.000000000	existing paid	radio/tv	2991.000000000	no known savings	>=7	2.000000000	female div/dep/mar	none	4.000000000	car	25.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	11.000000000	existing paid	business	2142.000000000	>=1000	>=7	1.000000000	male div/sep	none	2.000000000	real estate	28.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	24.000000000	all paid	business	3161.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	life insurance	31.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	bad
0<=X<200	48.000000000	no credits/all paid	other	18424.000000000	<100	1<=X<4	1.000000000	female div/dep/mar	none	2.000000000	life insurance	32.000000000	bank	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	no	bad
no checking	10.000000000	existing paid	used car	2848.000000000	100<=X<500	1<=X<4	1.000000000	male single	co applicant	2.000000000	real estate	32.000000000	none	own	1.000000000	skilled	2.000000000	none	yes	good
<0	6.000000000	existing paid	new car	14896.000000000	<100	>=7	1.000000000	male single	none	4.000000000	no known property	68.000000000	bank	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
<0	24.000000000	existing paid	furniture/equipment	2359.000000000	100<=X<500	unemployed	1.000000000	male div/sep	none	1.000000000	life insurance	33.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
<0	24.000000000	existing paid	furniture/equipment	3345.000000000	<100	>=7	4.000000000	male single	none	2.000000000	life insurance	39.000000000	none	rent	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
no checking	18.000000000	critical/other existing credit	furniture/equipment	1817.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	2.000000000	no known property	28.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	48.000000000	delayed previously	radio/tv	12749.000000000	500<=X<1000	4<=X<7	4.000000000	male single	none	1.000000000	car	37.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	9.000000000	existing paid	radio/tv	1366.000000000	<100	<1	3.000000000	female div/dep/mar	none	4.000000000	life insurance	22.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	12.000000000	existing paid	new car	2002.000000000	<100	4<=X<7	3.000000000	male single	none	4.000000000	life insurance	30.000000000	none	rent	1.000000000	skilled	2.000000000	yes	yes	good
<0	24.000000000	all paid	furniture/equipment	6872.000000000	<100	<1	2.000000000	male div/sep	none	1.000000000	life insurance	55.000000000	bank	own	1.000000000	skilled	1.000000000	yes	yes	bad
<0	12.000000000	all paid	new car	697.000000000	<100	<1	4.000000000	male single	none	2.000000000	car	46.000000000	bank	own	2.000000000	skilled	1.000000000	yes	yes	bad
<0	18.000000000	critical/other existing credit	furniture/equipment	1049.000000000	<100	<1	4.000000000	female div/dep/mar	none	4.000000000	life insurance	21.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
<0	48.000000000	existing paid	used car	10297.000000000	<100	4<=X<7	4.000000000	male single	none	4.000000000	no known property	39.000000000	stores	for free	3.000000000	skilled	2.000000000	yes	yes	bad
no checking	30.000000000	existing paid	radio/tv	1867.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	car	58.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	12.000000000	delayed previously	new car	1344.000000000	<100	1<=X<4	4.000000000	male single	none	2.000000000	real estate	43.000000000	none	own	2.000000000	unskilled resident	2.000000000	none	yes	good
<0	24.000000000	existing paid	furniture/equipment	1747.000000000	<100	<1	4.000000000	male single	co applicant	1.000000000	life insurance	24.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	no	good
0<=X<200	9.000000000	existing paid	radio/tv	1670.000000000	<100	<1	4.000000000	female div/dep/mar	none	2.000000000	car	22.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	bad
no checking	9.000000000	critical/other existing credit	new car	1224.000000000	<100	1<=X<4	3.000000000	male single	none	1.000000000	real estate	30.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	12.000000000	critical/other existing credit	radio/tv	522.000000000	500<=X<1000	>=7	4.000000000	male single	none	4.000000000	life insurance	42.000000000	none	own	2.000000000	skilled	2.000000000	yes	yes	good
<0	12.000000000	existing paid	radio/tv	1498.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	1.000000000	car	23.000000000	bank	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	30.000000000	delayed previously	radio/tv	1919.000000000	100<=X<500	<1	4.000000000	male single	none	3.000000000	no known property	30.000000000	stores	own	2.000000000	high qualif/self emp/mgmt	1.000000000	none	yes	bad
>=200	9.000000000	existing paid	radio/tv	745.000000000	<100	1<=X<4	3.000000000	female div/dep/mar	none	2.000000000	real estate	28.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
0<=X<200	6.000000000	existing paid	radio/tv	2063.000000000	<100	<1	4.000000000	male mar/wid	none	3.000000000	car	30.000000000	none	rent	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	60.000000000	existing paid	education	6288.000000000	<100	1<=X<4	4.000000000	male single	none	4.000000000	no known property	42.000000000	none	for free	1.000000000	skilled	1.000000000	none	yes	bad
no checking	24.000000000	critical/other existing credit	used car	6842.000000000	no known savings	1<=X<4	2.000000000	male single	none	4.000000000	life insurance	46.000000000	none	own	2.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	good
no checking	12.000000000	existing paid	new car	3527.000000000	no known savings	<1	2.000000000	male single	none	3.000000000	life insurance	45.000000000	none	own	1.000000000	high qualif/self emp/mgmt	2.000000000	yes	yes	good
no checking	10.000000000	existing paid	new car	1546.000000000	<100	1<=X<4	3.000000000	male single	none	2.000000000	real estate	31.000000000	none	own	1.000000000	unskilled resident	2.000000000	none	no	good
no checking	24.000000000	existing paid	furniture/equipment	929.000000000	no known savings	4<=X<7	4.000000000	male single	none	2.000000000	car	31.000000000	stores	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	4.000000000	critical/other existing credit	new car	1455.000000000	<100	4<=X<7	2.000000000	male single	none	1.000000000	real estate	42.000000000	none	own	3.000000000	unskilled resident	2.000000000	none	yes	good
<0	15.000000000	existing paid	furniture/equipment	1845.000000000	<100	<1	4.000000000	female div/dep/mar	guarantor	1.000000000	life insurance	46.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	48.000000000	no credits/all paid	new car	8358.000000000	500<=X<1000	<1	1.000000000	female div/dep/mar	none	1.000000000	car	30.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
<0	24.000000000	all paid	furniture/equipment	3349.000000000	500<=X<1000	<1	4.000000000	male single	none	4.000000000	no known property	30.000000000	none	for free	1.000000000	skilled	2.000000000	yes	yes	bad
no checking	12.000000000	existing paid	new car	2859.000000000	no known savings	unemployed	4.000000000	male single	none	4.000000000	no known property	38.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	18.000000000	existing paid	furniture/equipment	1533.000000000	<100	<1	4.000000000	male mar/wid	co applicant	1.000000000	life insurance	43.000000000	none	own	1.000000000	unskilled resident	2.000000000	none	yes	bad
no checking	24.000000000	existing paid	radio/tv	3621.000000000	100<=X<500	>=7	2.000000000	male single	none	4.000000000	car	31.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	18.000000000	critical/other existing credit	business	3590.000000000	<100	unemployed	3.000000000	male mar/wid	none	3.000000000	car	40.000000000	none	own	3.000000000	unemp/unskilled non res	2.000000000	yes	yes	good
<0	36.000000000	delayed previously	business	2145.000000000	<100	4<=X<7	2.000000000	male single	none	1.000000000	car	24.000000000	none	own	2.000000000	skilled	1.000000000	yes	yes	bad
0<=X<200	24.000000000	existing paid	used car	4113.000000000	500<=X<1000	<1	3.000000000	female div/dep/mar	none	4.000000000	car	28.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
no checking	36.000000000	existing paid	furniture/equipment	10974.000000000	<100	unemployed	4.000000000	female div/dep/mar	none	2.000000000	car	26.000000000	none	own	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
<0	12.000000000	existing paid	new car	1893.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	guarantor	4.000000000	life insurance	29.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
<0	24.000000000	critical/other existing credit	radio/tv	1231.000000000	>=1000	>=7	4.000000000	female div/dep/mar	none	4.000000000	life insurance	57.000000000	none	rent	2.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
>=200	30.000000000	critical/other existing credit	radio/tv	3656.000000000	no known savings	>=7	4.000000000	male single	none	4.000000000	life insurance	49.000000000	stores	own	2.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	9.000000000	critical/other existing credit	radio/tv	1154.000000000	<100	>=7	2.000000000	male single	none	4.000000000	real estate	37.000000000	none	own	3.000000000	unskilled resident	1.000000000	none	yes	good
<0	28.000000000	existing paid	new car	4006.000000000	<100	1<=X<4	3.000000000	male single	none	2.000000000	car	45.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	bad
0<=X<200	24.000000000	existing paid	furniture/equipment	3069.000000000	100<=X<500	>=7	4.000000000	male single	none	4.000000000	no known property	30.000000000	none	for free	1.000000000	skilled	1.000000000	none	yes	good
no checking	6.000000000	critical/other existing credit	radio/tv	1740.000000000	<100	>=7	2.000000000	male mar/wid	none	2.000000000	real estate	30.000000000	none	rent	2.000000000	skilled	1.000000000	none	yes	good
0<=X<200	21.000000000	delayed previously	new car	2353.000000000	<100	1<=X<4	1.000000000	male div/sep	none	4.000000000	life insurance	47.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	15.000000000	existing paid	new car	3556.000000000	no known savings	1<=X<4	3.000000000	male single	none	2.000000000	no known property	29.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	existing paid	radio/tv	2397.000000000	500<=X<1000	>=7	3.000000000	male single	none	2.000000000	car	35.000000000	bank	own	2.000000000	skilled	1.000000000	yes	yes	bad
0<=X<200	6.000000000	existing paid	repairs	454.000000000	<100	<1	3.000000000	male mar/wid	none	1.000000000	life insurance	22.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	30.000000000	existing paid	radio/tv	1715.000000000	no known savings	1<=X<4	4.000000000	female div/dep/mar	none	1.000000000	car	26.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	27.000000000	critical/other existing credit	radio/tv	2520.000000000	500<=X<1000	1<=X<4	4.000000000	male single	none	2.000000000	life insurance	23.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	bad
no checking	15.000000000	existing paid	radio/tv	3568.000000000	<100	>=7	4.000000000	female div/dep/mar	none	2.000000000	car	54.000000000	bank	rent	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	42.000000000	existing paid	radio/tv	7166.000000000	no known savings	4<=X<7	2.000000000	male mar/wid	none	4.000000000	life insurance	29.000000000	none	rent	1.000000000	skilled	1.000000000	yes	yes	good
<0	11.000000000	critical/other existing credit	new car	3939.000000000	<100	1<=X<4	1.000000000	male single	none	2.000000000	real estate	40.000000000	none	own	2.000000000	unskilled resident	2.000000000	none	yes	good
0<=X<200	15.000000000	existing paid	repairs	1514.000000000	100<=X<500	1<=X<4	4.000000000	male single	guarantor	2.000000000	real estate	22.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	existing paid	new car	7393.000000000	<100	1<=X<4	1.000000000	male single	none	4.000000000	life insurance	43.000000000	none	own	1.000000000	unskilled resident	2.000000000	none	yes	good
<0	24.000000000	all paid	new car	1193.000000000	<100	unemployed	1.000000000	female div/dep/mar	co applicant	4.000000000	no known property	29.000000000	none	rent	2.000000000	unemp/unskilled non res	1.000000000	none	yes	bad
<0	60.000000000	existing paid	business	7297.000000000	<100	>=7	4.000000000	male single	co applicant	4.000000000	no known property	36.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
no checking	30.000000000	critical/other existing credit	radio/tv	2831.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	2.000000000	car	33.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
>=200	24.000000000	existing paid	radio/tv	1258.000000000	500<=X<1000	1<=X<4	3.000000000	female div/dep/mar	none	3.000000000	car	57.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
0<=X<200	6.000000000	existing paid	radio/tv	753.000000000	<100	1<=X<4	2.000000000	female div/dep/mar	guarantor	3.000000000	real estate	64.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
0<=X<200	18.000000000	delayed previously	business	2427.000000000	no known savings	>=7	4.000000000	male single	none	2.000000000	life insurance	42.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	24.000000000	delayed previously	new car	2538.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	47.000000000	none	own	2.000000000	unskilled resident	2.000000000	none	yes	bad
0<=X<200	15.000000000	all paid	new car	1264.000000000	100<=X<500	1<=X<4	2.000000000	male mar/wid	none	2.000000000	life insurance	25.000000000	none	rent	1.000000000	skilled	1.000000000	none	yes	bad
0<=X<200	30.000000000	critical/other existing credit	furniture/equipment	8386.000000000	<100	4<=X<7	2.000000000	male single	none	2.000000000	life insurance	49.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	bad
no checking	48.000000000	existing paid	business	4844.000000000	<100	unemployed	3.000000000	male single	none	2.000000000	car	33.000000000	bank	rent	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	bad
>=200	21.000000000	existing paid	new car	2923.000000000	100<=X<500	1<=X<4	1.000000000	female div/dep/mar	none	1.000000000	car	28.000000000	bank	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
<0	36.000000000	existing paid	used car	8229.000000000	<100	1<=X<4	2.000000000	male single	none	2.000000000	life insurance	26.000000000	none	own	1.000000000	skilled	2.000000000	none	yes	bad
no checking	24.000000000	critical/other existing credit	furniture/equipment	2028.000000000	<100	4<=X<7	2.000000000	male single	none	2.000000000	life insurance	30.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
<0	15.000000000	critical/other existing credit	furniture/equipment	1433.000000000	<100	1<=X<4	4.000000000	female div/dep/mar	none	3.000000000	life insurance	25.000000000	none	rent	2.000000000	skilled	1.000000000	none	yes	good
>=200	42.000000000	no credits/all paid	business	6289.000000000	<100	<1	2.000000000	male div/sep	none	1.000000000	life insurance	33.000000000	none	own	2.000000000	skilled	1.000000000	none	yes	good
no checking	13.000000000	existing paid	radio/tv	1409.000000000	100<=X<500	unemployed	2.000000000	female div/dep/mar	none	4.000000000	real estate	64.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	24.000000000	existing paid	used car	6579.000000000	<100	unemployed	4.000000000	male single	none	2.000000000	no known property	29.000000000	none	for free	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
0<=X<200	24.000000000	critical/other existing credit	radio/tv	1743.000000000	<100	>=7	4.000000000	male single	none	2.000000000	life insurance	48.000000000	none	own	2.000000000	unskilled resident	1.000000000	none	yes	good
no checking	12.000000000	critical/other existing credit	education	3565.000000000	no known savings	<1	2.000000000	male single	none	1.000000000	life insurance	37.000000000	none	own	2.000000000	unskilled resident	2.000000000	none	yes	good
no checking	15.000000000	all paid	radio/tv	1569.000000000	100<=X<500	>=7	4.000000000	male single	none	4.000000000	car	34.000000000	bank	own	1.000000000	unskilled resident	2.000000000	none	yes	good
<0	18.000000000	existing paid	radio/tv	1936.000000000	no known savings	4<=X<7	2.000000000	male mar/wid	none	4.000000000	car	23.000000000	none	rent	2.000000000	unskilled resident	1.000000000	none	yes	good
<0	36.000000000	existing paid	furniture/equipment	3959.000000000	<100	unemployed	4.000000000	male single	none	3.000000000	life insurance	30.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	12.000000000	existing paid	new car	2390.000000000	no known savings	>=7	4.000000000	male single	none	3.000000000	car	50.000000000	none	own	1.000000000	skilled	1.000000000	yes	yes	good
no checking	12.000000000	existing paid	furniture/equipment	1736.000000000	<100	4<=X<7	3.000000000	female div/dep/mar	none	4.000000000	real estate	31.000000000	none	own	1.000000000	unskilled resident	1.000000000	none	yes	good
<0	30.000000000	existing paid	used car	3857.000000000	<100	1<=X<4	4.000000000	male div/sep	none	4.000000000	life insurance	40.000000000	none	own	1.000000000	high qualif/self emp/mgmt	1.000000000	yes	yes	good
no checking	12.000000000	existing paid	radio/tv	804.000000000	<100	>=7	4.000000000	male single	none	4.000000000	car	38.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
<0	45.000000000	existing paid	radio/tv	1845.000000000	<100	1<=X<4	4.000000000	male single	none	4.000000000	no known property	23.000000000	none	for free	1.000000000	skilled	1.000000000	yes	yes	bad
0<=X<200	45.000000000	critical/other existing credit	used car	4576.000000000	100<=X<500	unemployed	3.000000000	male single	none	4.000000000	car	27.000000000	none	own	1.000000000	skilled	1.000000000	none	yes	good
\.


--
-- TOC entry 2203 (class 0 OID 17212)
-- Dependencies: 189
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
-- TOC entry 2204 (class 0 OID 17218)
-- Dependencies: 190
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- TOC entry 2205 (class 0 OID 17221)
-- Dependencies: 191
-- Data for Name: diabetes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diabetes (preg, plas, pres, skin, insu, mass, pedi, age, class) FROM stdin;
6.000000000	148.000000000	72.000000000	35.000000000	0.000000000	33.600000000	0.627000000	50.000000000	tested_positive
1.000000000	85.000000000	66.000000000	29.000000000	0.000000000	26.600000000	0.351000000	31.000000000	tested_negative
8.000000000	183.000000000	64.000000000	0.000000000	0.000000000	23.300000000	0.672000000	32.000000000	tested_positive
1.000000000	89.000000000	66.000000000	23.000000000	94.000000000	28.100000000	0.167000000	21.000000000	tested_negative
0.000000000	137.000000000	40.000000000	35.000000000	168.000000000	43.100000000	2.288000000	33.000000000	tested_positive
5.000000000	116.000000000	74.000000000	0.000000000	0.000000000	25.600000000	0.201000000	30.000000000	tested_negative
3.000000000	78.000000000	50.000000000	32.000000000	88.000000000	31.000000000	0.248000000	26.000000000	tested_positive
10.000000000	115.000000000	0.000000000	0.000000000	0.000000000	35.300000000	0.134000000	29.000000000	tested_negative
2.000000000	197.000000000	70.000000000	45.000000000	543.000000000	30.500000000	0.158000000	53.000000000	tested_positive
8.000000000	125.000000000	96.000000000	0.000000000	0.000000000	0.000000000	0.232000000	54.000000000	tested_positive
4.000000000	110.000000000	92.000000000	0.000000000	0.000000000	37.600000000	0.191000000	30.000000000	tested_negative
10.000000000	168.000000000	74.000000000	0.000000000	0.000000000	38.000000000	0.537000000	34.000000000	tested_positive
10.000000000	139.000000000	80.000000000	0.000000000	0.000000000	27.100000000	1.441000000	57.000000000	tested_negative
1.000000000	189.000000000	60.000000000	23.000000000	846.000000000	30.100000000	0.398000000	59.000000000	tested_positive
5.000000000	166.000000000	72.000000000	19.000000000	175.000000000	25.800000000	0.587000000	51.000000000	tested_positive
7.000000000	100.000000000	0.000000000	0.000000000	0.000000000	30.000000000	0.484000000	32.000000000	tested_positive
0.000000000	118.000000000	84.000000000	47.000000000	230.000000000	45.800000000	0.551000000	31.000000000	tested_positive
7.000000000	107.000000000	74.000000000	0.000000000	0.000000000	29.600000000	0.254000000	31.000000000	tested_positive
1.000000000	103.000000000	30.000000000	38.000000000	83.000000000	43.300000000	0.183000000	33.000000000	tested_negative
1.000000000	115.000000000	70.000000000	30.000000000	96.000000000	34.600000000	0.529000000	32.000000000	tested_positive
3.000000000	126.000000000	88.000000000	41.000000000	235.000000000	39.300000000	0.704000000	27.000000000	tested_negative
8.000000000	99.000000000	84.000000000	0.000000000	0.000000000	35.400000000	0.388000000	50.000000000	tested_negative
7.000000000	196.000000000	90.000000000	0.000000000	0.000000000	39.800000000	0.451000000	41.000000000	tested_positive
9.000000000	119.000000000	80.000000000	35.000000000	0.000000000	29.000000000	0.263000000	29.000000000	tested_positive
11.000000000	143.000000000	94.000000000	33.000000000	146.000000000	36.600000000	0.254000000	51.000000000	tested_positive
10.000000000	125.000000000	70.000000000	26.000000000	115.000000000	31.100000000	0.205000000	41.000000000	tested_positive
7.000000000	147.000000000	76.000000000	0.000000000	0.000000000	39.400000000	0.257000000	43.000000000	tested_positive
1.000000000	97.000000000	66.000000000	15.000000000	140.000000000	23.200000000	0.487000000	22.000000000	tested_negative
13.000000000	145.000000000	82.000000000	19.000000000	110.000000000	22.200000000	0.245000000	57.000000000	tested_negative
5.000000000	117.000000000	92.000000000	0.000000000	0.000000000	34.100000000	0.337000000	38.000000000	tested_negative
5.000000000	109.000000000	75.000000000	26.000000000	0.000000000	36.000000000	0.546000000	60.000000000	tested_negative
3.000000000	158.000000000	76.000000000	36.000000000	245.000000000	31.600000000	0.851000000	28.000000000	tested_positive
3.000000000	88.000000000	58.000000000	11.000000000	54.000000000	24.800000000	0.267000000	22.000000000	tested_negative
6.000000000	92.000000000	92.000000000	0.000000000	0.000000000	19.900000000	0.188000000	28.000000000	tested_negative
10.000000000	122.000000000	78.000000000	31.000000000	0.000000000	27.600000000	0.512000000	45.000000000	tested_negative
4.000000000	103.000000000	60.000000000	33.000000000	192.000000000	24.000000000	0.966000000	33.000000000	tested_negative
11.000000000	138.000000000	76.000000000	0.000000000	0.000000000	33.200000000	0.420000000	35.000000000	tested_negative
9.000000000	102.000000000	76.000000000	37.000000000	0.000000000	32.900000000	0.665000000	46.000000000	tested_positive
2.000000000	90.000000000	68.000000000	42.000000000	0.000000000	38.200000000	0.503000000	27.000000000	tested_positive
4.000000000	111.000000000	72.000000000	47.000000000	207.000000000	37.100000000	1.390000000	56.000000000	tested_positive
3.000000000	180.000000000	64.000000000	25.000000000	70.000000000	34.000000000	0.271000000	26.000000000	tested_negative
7.000000000	133.000000000	84.000000000	0.000000000	0.000000000	40.200000000	0.696000000	37.000000000	tested_negative
7.000000000	106.000000000	92.000000000	18.000000000	0.000000000	22.700000000	0.235000000	48.000000000	tested_negative
9.000000000	171.000000000	110.000000000	24.000000000	240.000000000	45.400000000	0.721000000	54.000000000	tested_positive
7.000000000	159.000000000	64.000000000	0.000000000	0.000000000	27.400000000	0.294000000	40.000000000	tested_negative
0.000000000	180.000000000	66.000000000	39.000000000	0.000000000	42.000000000	1.893000000	25.000000000	tested_positive
1.000000000	146.000000000	56.000000000	0.000000000	0.000000000	29.700000000	0.564000000	29.000000000	tested_negative
2.000000000	71.000000000	70.000000000	27.000000000	0.000000000	28.000000000	0.586000000	22.000000000	tested_negative
7.000000000	103.000000000	66.000000000	32.000000000	0.000000000	39.100000000	0.344000000	31.000000000	tested_positive
7.000000000	105.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.305000000	24.000000000	tested_negative
1.000000000	103.000000000	80.000000000	11.000000000	82.000000000	19.400000000	0.491000000	22.000000000	tested_negative
1.000000000	101.000000000	50.000000000	15.000000000	36.000000000	24.200000000	0.526000000	26.000000000	tested_negative
5.000000000	88.000000000	66.000000000	21.000000000	23.000000000	24.400000000	0.342000000	30.000000000	tested_negative
8.000000000	176.000000000	90.000000000	34.000000000	300.000000000	33.700000000	0.467000000	58.000000000	tested_positive
7.000000000	150.000000000	66.000000000	42.000000000	342.000000000	34.700000000	0.718000000	42.000000000	tested_negative
1.000000000	73.000000000	50.000000000	10.000000000	0.000000000	23.000000000	0.248000000	21.000000000	tested_negative
7.000000000	187.000000000	68.000000000	39.000000000	304.000000000	37.700000000	0.254000000	41.000000000	tested_positive
0.000000000	100.000000000	88.000000000	60.000000000	110.000000000	46.800000000	0.962000000	31.000000000	tested_negative
0.000000000	146.000000000	82.000000000	0.000000000	0.000000000	40.500000000	1.781000000	44.000000000	tested_negative
0.000000000	105.000000000	64.000000000	41.000000000	142.000000000	41.500000000	0.173000000	22.000000000	tested_negative
2.000000000	84.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.304000000	21.000000000	tested_negative
8.000000000	133.000000000	72.000000000	0.000000000	0.000000000	32.900000000	0.270000000	39.000000000	tested_positive
5.000000000	44.000000000	62.000000000	0.000000000	0.000000000	25.000000000	0.587000000	36.000000000	tested_negative
2.000000000	141.000000000	58.000000000	34.000000000	128.000000000	25.400000000	0.699000000	24.000000000	tested_negative
7.000000000	114.000000000	66.000000000	0.000000000	0.000000000	32.800000000	0.258000000	42.000000000	tested_positive
5.000000000	99.000000000	74.000000000	27.000000000	0.000000000	29.000000000	0.203000000	32.000000000	tested_negative
0.000000000	109.000000000	88.000000000	30.000000000	0.000000000	32.500000000	0.855000000	38.000000000	tested_positive
2.000000000	109.000000000	92.000000000	0.000000000	0.000000000	42.700000000	0.845000000	54.000000000	tested_negative
1.000000000	95.000000000	66.000000000	13.000000000	38.000000000	19.600000000	0.334000000	25.000000000	tested_negative
4.000000000	146.000000000	85.000000000	27.000000000	100.000000000	28.900000000	0.189000000	27.000000000	tested_negative
2.000000000	100.000000000	66.000000000	20.000000000	90.000000000	32.900000000	0.867000000	28.000000000	tested_positive
5.000000000	139.000000000	64.000000000	35.000000000	140.000000000	28.600000000	0.411000000	26.000000000	tested_negative
13.000000000	126.000000000	90.000000000	0.000000000	0.000000000	43.400000000	0.583000000	42.000000000	tested_positive
4.000000000	129.000000000	86.000000000	20.000000000	270.000000000	35.100000000	0.231000000	23.000000000	tested_negative
1.000000000	79.000000000	75.000000000	30.000000000	0.000000000	32.000000000	0.396000000	22.000000000	tested_negative
1.000000000	0.000000000	48.000000000	20.000000000	0.000000000	24.700000000	0.140000000	22.000000000	tested_negative
7.000000000	62.000000000	78.000000000	0.000000000	0.000000000	32.600000000	0.391000000	41.000000000	tested_negative
5.000000000	95.000000000	72.000000000	33.000000000	0.000000000	37.700000000	0.370000000	27.000000000	tested_negative
0.000000000	131.000000000	0.000000000	0.000000000	0.000000000	43.200000000	0.270000000	26.000000000	tested_positive
2.000000000	112.000000000	66.000000000	22.000000000	0.000000000	25.000000000	0.307000000	24.000000000	tested_negative
3.000000000	113.000000000	44.000000000	13.000000000	0.000000000	22.400000000	0.140000000	22.000000000	tested_negative
2.000000000	74.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.102000000	22.000000000	tested_negative
7.000000000	83.000000000	78.000000000	26.000000000	71.000000000	29.300000000	0.767000000	36.000000000	tested_negative
0.000000000	101.000000000	65.000000000	28.000000000	0.000000000	24.600000000	0.237000000	22.000000000	tested_negative
5.000000000	137.000000000	108.000000000	0.000000000	0.000000000	48.800000000	0.227000000	37.000000000	tested_positive
2.000000000	110.000000000	74.000000000	29.000000000	125.000000000	32.400000000	0.698000000	27.000000000	tested_negative
13.000000000	106.000000000	72.000000000	54.000000000	0.000000000	36.600000000	0.178000000	45.000000000	tested_negative
2.000000000	100.000000000	68.000000000	25.000000000	71.000000000	38.500000000	0.324000000	26.000000000	tested_negative
15.000000000	136.000000000	70.000000000	32.000000000	110.000000000	37.100000000	0.153000000	43.000000000	tested_positive
1.000000000	107.000000000	68.000000000	19.000000000	0.000000000	26.500000000	0.165000000	24.000000000	tested_negative
1.000000000	80.000000000	55.000000000	0.000000000	0.000000000	19.100000000	0.258000000	21.000000000	tested_negative
4.000000000	123.000000000	80.000000000	15.000000000	176.000000000	32.000000000	0.443000000	34.000000000	tested_negative
7.000000000	81.000000000	78.000000000	40.000000000	48.000000000	46.700000000	0.261000000	42.000000000	tested_negative
4.000000000	134.000000000	72.000000000	0.000000000	0.000000000	23.800000000	0.277000000	60.000000000	tested_positive
2.000000000	142.000000000	82.000000000	18.000000000	64.000000000	24.700000000	0.761000000	21.000000000	tested_negative
6.000000000	144.000000000	72.000000000	27.000000000	228.000000000	33.900000000	0.255000000	40.000000000	tested_negative
2.000000000	92.000000000	62.000000000	28.000000000	0.000000000	31.600000000	0.130000000	24.000000000	tested_negative
1.000000000	71.000000000	48.000000000	18.000000000	76.000000000	20.400000000	0.323000000	22.000000000	tested_negative
6.000000000	93.000000000	50.000000000	30.000000000	64.000000000	28.700000000	0.356000000	23.000000000	tested_negative
1.000000000	122.000000000	90.000000000	51.000000000	220.000000000	49.700000000	0.325000000	31.000000000	tested_positive
1.000000000	163.000000000	72.000000000	0.000000000	0.000000000	39.000000000	1.222000000	33.000000000	tested_positive
1.000000000	151.000000000	60.000000000	0.000000000	0.000000000	26.100000000	0.179000000	22.000000000	tested_negative
0.000000000	125.000000000	96.000000000	0.000000000	0.000000000	22.500000000	0.262000000	21.000000000	tested_negative
1.000000000	81.000000000	72.000000000	18.000000000	40.000000000	26.600000000	0.283000000	24.000000000	tested_negative
2.000000000	85.000000000	65.000000000	0.000000000	0.000000000	39.600000000	0.930000000	27.000000000	tested_negative
1.000000000	126.000000000	56.000000000	29.000000000	152.000000000	28.700000000	0.801000000	21.000000000	tested_negative
1.000000000	96.000000000	122.000000000	0.000000000	0.000000000	22.400000000	0.207000000	27.000000000	tested_negative
4.000000000	144.000000000	58.000000000	28.000000000	140.000000000	29.500000000	0.287000000	37.000000000	tested_negative
3.000000000	83.000000000	58.000000000	31.000000000	18.000000000	34.300000000	0.336000000	25.000000000	tested_negative
0.000000000	95.000000000	85.000000000	25.000000000	36.000000000	37.400000000	0.247000000	24.000000000	tested_positive
3.000000000	171.000000000	72.000000000	33.000000000	135.000000000	33.300000000	0.199000000	24.000000000	tested_positive
8.000000000	155.000000000	62.000000000	26.000000000	495.000000000	34.000000000	0.543000000	46.000000000	tested_positive
1.000000000	89.000000000	76.000000000	34.000000000	37.000000000	31.200000000	0.192000000	23.000000000	tested_negative
4.000000000	76.000000000	62.000000000	0.000000000	0.000000000	34.000000000	0.391000000	25.000000000	tested_negative
7.000000000	160.000000000	54.000000000	32.000000000	175.000000000	30.500000000	0.588000000	39.000000000	tested_positive
4.000000000	146.000000000	92.000000000	0.000000000	0.000000000	31.200000000	0.539000000	61.000000000	tested_positive
5.000000000	124.000000000	74.000000000	0.000000000	0.000000000	34.000000000	0.220000000	38.000000000	tested_positive
5.000000000	78.000000000	48.000000000	0.000000000	0.000000000	33.700000000	0.654000000	25.000000000	tested_negative
4.000000000	97.000000000	60.000000000	23.000000000	0.000000000	28.200000000	0.443000000	22.000000000	tested_negative
4.000000000	99.000000000	76.000000000	15.000000000	51.000000000	23.200000000	0.223000000	21.000000000	tested_negative
0.000000000	162.000000000	76.000000000	56.000000000	100.000000000	53.200000000	0.759000000	25.000000000	tested_positive
6.000000000	111.000000000	64.000000000	39.000000000	0.000000000	34.200000000	0.260000000	24.000000000	tested_negative
2.000000000	107.000000000	74.000000000	30.000000000	100.000000000	33.600000000	0.404000000	23.000000000	tested_negative
5.000000000	132.000000000	80.000000000	0.000000000	0.000000000	26.800000000	0.186000000	69.000000000	tested_negative
0.000000000	113.000000000	76.000000000	0.000000000	0.000000000	33.300000000	0.278000000	23.000000000	tested_positive
1.000000000	88.000000000	30.000000000	42.000000000	99.000000000	55.000000000	0.496000000	26.000000000	tested_positive
3.000000000	120.000000000	70.000000000	30.000000000	135.000000000	42.900000000	0.452000000	30.000000000	tested_negative
1.000000000	118.000000000	58.000000000	36.000000000	94.000000000	33.300000000	0.261000000	23.000000000	tested_negative
1.000000000	117.000000000	88.000000000	24.000000000	145.000000000	34.500000000	0.403000000	40.000000000	tested_positive
0.000000000	105.000000000	84.000000000	0.000000000	0.000000000	27.900000000	0.741000000	62.000000000	tested_positive
4.000000000	173.000000000	70.000000000	14.000000000	168.000000000	29.700000000	0.361000000	33.000000000	tested_positive
9.000000000	122.000000000	56.000000000	0.000000000	0.000000000	33.300000000	1.114000000	33.000000000	tested_positive
3.000000000	170.000000000	64.000000000	37.000000000	225.000000000	34.500000000	0.356000000	30.000000000	tested_positive
8.000000000	84.000000000	74.000000000	31.000000000	0.000000000	38.300000000	0.457000000	39.000000000	tested_negative
2.000000000	96.000000000	68.000000000	13.000000000	49.000000000	21.100000000	0.647000000	26.000000000	tested_negative
2.000000000	125.000000000	60.000000000	20.000000000	140.000000000	33.800000000	0.088000000	31.000000000	tested_negative
0.000000000	100.000000000	70.000000000	26.000000000	50.000000000	30.800000000	0.597000000	21.000000000	tested_negative
0.000000000	93.000000000	60.000000000	25.000000000	92.000000000	28.700000000	0.532000000	22.000000000	tested_negative
0.000000000	129.000000000	80.000000000	0.000000000	0.000000000	31.200000000	0.703000000	29.000000000	tested_negative
5.000000000	105.000000000	72.000000000	29.000000000	325.000000000	36.900000000	0.159000000	28.000000000	tested_negative
3.000000000	128.000000000	78.000000000	0.000000000	0.000000000	21.100000000	0.268000000	55.000000000	tested_negative
5.000000000	106.000000000	82.000000000	30.000000000	0.000000000	39.500000000	0.286000000	38.000000000	tested_negative
2.000000000	108.000000000	52.000000000	26.000000000	63.000000000	32.500000000	0.318000000	22.000000000	tested_negative
10.000000000	108.000000000	66.000000000	0.000000000	0.000000000	32.400000000	0.272000000	42.000000000	tested_positive
4.000000000	154.000000000	62.000000000	31.000000000	284.000000000	32.800000000	0.237000000	23.000000000	tested_negative
0.000000000	102.000000000	75.000000000	23.000000000	0.000000000	0.000000000	0.572000000	21.000000000	tested_negative
9.000000000	57.000000000	80.000000000	37.000000000	0.000000000	32.800000000	0.096000000	41.000000000	tested_negative
2.000000000	106.000000000	64.000000000	35.000000000	119.000000000	30.500000000	1.400000000	34.000000000	tested_negative
5.000000000	147.000000000	78.000000000	0.000000000	0.000000000	33.700000000	0.218000000	65.000000000	tested_negative
2.000000000	90.000000000	70.000000000	17.000000000	0.000000000	27.300000000	0.085000000	22.000000000	tested_negative
1.000000000	136.000000000	74.000000000	50.000000000	204.000000000	37.400000000	0.399000000	24.000000000	tested_negative
4.000000000	114.000000000	65.000000000	0.000000000	0.000000000	21.900000000	0.432000000	37.000000000	tested_negative
9.000000000	156.000000000	86.000000000	28.000000000	155.000000000	34.300000000	1.189000000	42.000000000	tested_positive
1.000000000	153.000000000	82.000000000	42.000000000	485.000000000	40.600000000	0.687000000	23.000000000	tested_negative
8.000000000	188.000000000	78.000000000	0.000000000	0.000000000	47.900000000	0.137000000	43.000000000	tested_positive
7.000000000	152.000000000	88.000000000	44.000000000	0.000000000	50.000000000	0.337000000	36.000000000	tested_positive
2.000000000	99.000000000	52.000000000	15.000000000	94.000000000	24.600000000	0.637000000	21.000000000	tested_negative
1.000000000	109.000000000	56.000000000	21.000000000	135.000000000	25.200000000	0.833000000	23.000000000	tested_negative
2.000000000	88.000000000	74.000000000	19.000000000	53.000000000	29.000000000	0.229000000	22.000000000	tested_negative
17.000000000	163.000000000	72.000000000	41.000000000	114.000000000	40.900000000	0.817000000	47.000000000	tested_positive
4.000000000	151.000000000	90.000000000	38.000000000	0.000000000	29.700000000	0.294000000	36.000000000	tested_negative
7.000000000	102.000000000	74.000000000	40.000000000	105.000000000	37.200000000	0.204000000	45.000000000	tested_negative
0.000000000	114.000000000	80.000000000	34.000000000	285.000000000	44.200000000	0.167000000	27.000000000	tested_negative
2.000000000	100.000000000	64.000000000	23.000000000	0.000000000	29.700000000	0.368000000	21.000000000	tested_negative
0.000000000	131.000000000	88.000000000	0.000000000	0.000000000	31.600000000	0.743000000	32.000000000	tested_positive
6.000000000	104.000000000	74.000000000	18.000000000	156.000000000	29.900000000	0.722000000	41.000000000	tested_positive
3.000000000	148.000000000	66.000000000	25.000000000	0.000000000	32.500000000	0.256000000	22.000000000	tested_negative
4.000000000	120.000000000	68.000000000	0.000000000	0.000000000	29.600000000	0.709000000	34.000000000	tested_negative
4.000000000	110.000000000	66.000000000	0.000000000	0.000000000	31.900000000	0.471000000	29.000000000	tested_negative
3.000000000	111.000000000	90.000000000	12.000000000	78.000000000	28.400000000	0.495000000	29.000000000	tested_negative
6.000000000	102.000000000	82.000000000	0.000000000	0.000000000	30.800000000	0.180000000	36.000000000	tested_positive
6.000000000	134.000000000	70.000000000	23.000000000	130.000000000	35.400000000	0.542000000	29.000000000	tested_positive
2.000000000	87.000000000	0.000000000	23.000000000	0.000000000	28.900000000	0.773000000	25.000000000	tested_negative
1.000000000	79.000000000	60.000000000	42.000000000	48.000000000	43.500000000	0.678000000	23.000000000	tested_negative
2.000000000	75.000000000	64.000000000	24.000000000	55.000000000	29.700000000	0.370000000	33.000000000	tested_negative
8.000000000	179.000000000	72.000000000	42.000000000	130.000000000	32.700000000	0.719000000	36.000000000	tested_positive
6.000000000	85.000000000	78.000000000	0.000000000	0.000000000	31.200000000	0.382000000	42.000000000	tested_negative
0.000000000	129.000000000	110.000000000	46.000000000	130.000000000	67.100000000	0.319000000	26.000000000	tested_positive
5.000000000	143.000000000	78.000000000	0.000000000	0.000000000	45.000000000	0.190000000	47.000000000	tested_negative
5.000000000	130.000000000	82.000000000	0.000000000	0.000000000	39.100000000	0.956000000	37.000000000	tested_positive
6.000000000	87.000000000	80.000000000	0.000000000	0.000000000	23.200000000	0.084000000	32.000000000	tested_negative
0.000000000	119.000000000	64.000000000	18.000000000	92.000000000	34.900000000	0.725000000	23.000000000	tested_negative
1.000000000	0.000000000	74.000000000	20.000000000	23.000000000	27.700000000	0.299000000	21.000000000	tested_negative
5.000000000	73.000000000	60.000000000	0.000000000	0.000000000	26.800000000	0.268000000	27.000000000	tested_negative
4.000000000	141.000000000	74.000000000	0.000000000	0.000000000	27.600000000	0.244000000	40.000000000	tested_negative
7.000000000	194.000000000	68.000000000	28.000000000	0.000000000	35.900000000	0.745000000	41.000000000	tested_positive
8.000000000	181.000000000	68.000000000	36.000000000	495.000000000	30.100000000	0.615000000	60.000000000	tested_positive
1.000000000	128.000000000	98.000000000	41.000000000	58.000000000	32.000000000	1.321000000	33.000000000	tested_positive
8.000000000	109.000000000	76.000000000	39.000000000	114.000000000	27.900000000	0.640000000	31.000000000	tested_positive
5.000000000	139.000000000	80.000000000	35.000000000	160.000000000	31.600000000	0.361000000	25.000000000	tested_positive
3.000000000	111.000000000	62.000000000	0.000000000	0.000000000	22.600000000	0.142000000	21.000000000	tested_negative
9.000000000	123.000000000	70.000000000	44.000000000	94.000000000	33.100000000	0.374000000	40.000000000	tested_negative
7.000000000	159.000000000	66.000000000	0.000000000	0.000000000	30.400000000	0.383000000	36.000000000	tested_positive
11.000000000	135.000000000	0.000000000	0.000000000	0.000000000	52.300000000	0.578000000	40.000000000	tested_positive
8.000000000	85.000000000	55.000000000	20.000000000	0.000000000	24.400000000	0.136000000	42.000000000	tested_negative
5.000000000	158.000000000	84.000000000	41.000000000	210.000000000	39.400000000	0.395000000	29.000000000	tested_positive
1.000000000	105.000000000	58.000000000	0.000000000	0.000000000	24.300000000	0.187000000	21.000000000	tested_negative
3.000000000	107.000000000	62.000000000	13.000000000	48.000000000	22.900000000	0.678000000	23.000000000	tested_positive
4.000000000	109.000000000	64.000000000	44.000000000	99.000000000	34.800000000	0.905000000	26.000000000	tested_positive
4.000000000	148.000000000	60.000000000	27.000000000	318.000000000	30.900000000	0.150000000	29.000000000	tested_positive
0.000000000	113.000000000	80.000000000	16.000000000	0.000000000	31.000000000	0.874000000	21.000000000	tested_negative
1.000000000	138.000000000	82.000000000	0.000000000	0.000000000	40.100000000	0.236000000	28.000000000	tested_negative
0.000000000	108.000000000	68.000000000	20.000000000	0.000000000	27.300000000	0.787000000	32.000000000	tested_negative
2.000000000	99.000000000	70.000000000	16.000000000	44.000000000	20.400000000	0.235000000	27.000000000	tested_negative
6.000000000	103.000000000	72.000000000	32.000000000	190.000000000	37.700000000	0.324000000	55.000000000	tested_negative
5.000000000	111.000000000	72.000000000	28.000000000	0.000000000	23.900000000	0.407000000	27.000000000	tested_negative
8.000000000	196.000000000	76.000000000	29.000000000	280.000000000	37.500000000	0.605000000	57.000000000	tested_positive
5.000000000	162.000000000	104.000000000	0.000000000	0.000000000	37.700000000	0.151000000	52.000000000	tested_positive
1.000000000	96.000000000	64.000000000	27.000000000	87.000000000	33.200000000	0.289000000	21.000000000	tested_negative
7.000000000	184.000000000	84.000000000	33.000000000	0.000000000	35.500000000	0.355000000	41.000000000	tested_positive
2.000000000	81.000000000	60.000000000	22.000000000	0.000000000	27.700000000	0.290000000	25.000000000	tested_negative
0.000000000	147.000000000	85.000000000	54.000000000	0.000000000	42.800000000	0.375000000	24.000000000	tested_negative
7.000000000	179.000000000	95.000000000	31.000000000	0.000000000	34.200000000	0.164000000	60.000000000	tested_negative
0.000000000	140.000000000	65.000000000	26.000000000	130.000000000	42.600000000	0.431000000	24.000000000	tested_positive
9.000000000	112.000000000	82.000000000	32.000000000	175.000000000	34.200000000	0.260000000	36.000000000	tested_positive
12.000000000	151.000000000	70.000000000	40.000000000	271.000000000	41.800000000	0.742000000	38.000000000	tested_positive
5.000000000	109.000000000	62.000000000	41.000000000	129.000000000	35.800000000	0.514000000	25.000000000	tested_positive
6.000000000	125.000000000	68.000000000	30.000000000	120.000000000	30.000000000	0.464000000	32.000000000	tested_negative
5.000000000	85.000000000	74.000000000	22.000000000	0.000000000	29.000000000	1.224000000	32.000000000	tested_positive
5.000000000	112.000000000	66.000000000	0.000000000	0.000000000	37.800000000	0.261000000	41.000000000	tested_positive
0.000000000	177.000000000	60.000000000	29.000000000	478.000000000	34.600000000	1.072000000	21.000000000	tested_positive
2.000000000	158.000000000	90.000000000	0.000000000	0.000000000	31.600000000	0.805000000	66.000000000	tested_positive
7.000000000	119.000000000	0.000000000	0.000000000	0.000000000	25.200000000	0.209000000	37.000000000	tested_negative
7.000000000	142.000000000	60.000000000	33.000000000	190.000000000	28.800000000	0.687000000	61.000000000	tested_negative
1.000000000	100.000000000	66.000000000	15.000000000	56.000000000	23.600000000	0.666000000	26.000000000	tested_negative
1.000000000	87.000000000	78.000000000	27.000000000	32.000000000	34.600000000	0.101000000	22.000000000	tested_negative
0.000000000	101.000000000	76.000000000	0.000000000	0.000000000	35.700000000	0.198000000	26.000000000	tested_negative
3.000000000	162.000000000	52.000000000	38.000000000	0.000000000	37.200000000	0.652000000	24.000000000	tested_positive
4.000000000	197.000000000	70.000000000	39.000000000	744.000000000	36.700000000	2.329000000	31.000000000	tested_negative
0.000000000	117.000000000	80.000000000	31.000000000	53.000000000	45.200000000	0.089000000	24.000000000	tested_negative
4.000000000	142.000000000	86.000000000	0.000000000	0.000000000	44.000000000	0.645000000	22.000000000	tested_positive
6.000000000	134.000000000	80.000000000	37.000000000	370.000000000	46.200000000	0.238000000	46.000000000	tested_positive
1.000000000	79.000000000	80.000000000	25.000000000	37.000000000	25.400000000	0.583000000	22.000000000	tested_negative
4.000000000	122.000000000	68.000000000	0.000000000	0.000000000	35.000000000	0.394000000	29.000000000	tested_negative
3.000000000	74.000000000	68.000000000	28.000000000	45.000000000	29.700000000	0.293000000	23.000000000	tested_negative
4.000000000	171.000000000	72.000000000	0.000000000	0.000000000	43.600000000	0.479000000	26.000000000	tested_positive
7.000000000	181.000000000	84.000000000	21.000000000	192.000000000	35.900000000	0.586000000	51.000000000	tested_positive
0.000000000	179.000000000	90.000000000	27.000000000	0.000000000	44.100000000	0.686000000	23.000000000	tested_positive
9.000000000	164.000000000	84.000000000	21.000000000	0.000000000	30.800000000	0.831000000	32.000000000	tested_positive
0.000000000	104.000000000	76.000000000	0.000000000	0.000000000	18.400000000	0.582000000	27.000000000	tested_negative
1.000000000	91.000000000	64.000000000	24.000000000	0.000000000	29.200000000	0.192000000	21.000000000	tested_negative
4.000000000	91.000000000	70.000000000	32.000000000	88.000000000	33.100000000	0.446000000	22.000000000	tested_negative
3.000000000	139.000000000	54.000000000	0.000000000	0.000000000	25.600000000	0.402000000	22.000000000	tested_positive
6.000000000	119.000000000	50.000000000	22.000000000	176.000000000	27.100000000	1.318000000	33.000000000	tested_positive
2.000000000	146.000000000	76.000000000	35.000000000	194.000000000	38.200000000	0.329000000	29.000000000	tested_negative
9.000000000	184.000000000	85.000000000	15.000000000	0.000000000	30.000000000	1.213000000	49.000000000	tested_positive
10.000000000	122.000000000	68.000000000	0.000000000	0.000000000	31.200000000	0.258000000	41.000000000	tested_negative
0.000000000	165.000000000	90.000000000	33.000000000	680.000000000	52.300000000	0.427000000	23.000000000	tested_negative
9.000000000	124.000000000	70.000000000	33.000000000	402.000000000	35.400000000	0.282000000	34.000000000	tested_negative
1.000000000	111.000000000	86.000000000	19.000000000	0.000000000	30.100000000	0.143000000	23.000000000	tested_negative
9.000000000	106.000000000	52.000000000	0.000000000	0.000000000	31.200000000	0.380000000	42.000000000	tested_negative
2.000000000	129.000000000	84.000000000	0.000000000	0.000000000	28.000000000	0.284000000	27.000000000	tested_negative
2.000000000	90.000000000	80.000000000	14.000000000	55.000000000	24.400000000	0.249000000	24.000000000	tested_negative
0.000000000	86.000000000	68.000000000	32.000000000	0.000000000	35.800000000	0.238000000	25.000000000	tested_negative
12.000000000	92.000000000	62.000000000	7.000000000	258.000000000	27.600000000	0.926000000	44.000000000	tested_positive
1.000000000	113.000000000	64.000000000	35.000000000	0.000000000	33.600000000	0.543000000	21.000000000	tested_positive
3.000000000	111.000000000	56.000000000	39.000000000	0.000000000	30.100000000	0.557000000	30.000000000	tested_negative
2.000000000	114.000000000	68.000000000	22.000000000	0.000000000	28.700000000	0.092000000	25.000000000	tested_negative
1.000000000	193.000000000	50.000000000	16.000000000	375.000000000	25.900000000	0.655000000	24.000000000	tested_negative
11.000000000	155.000000000	76.000000000	28.000000000	150.000000000	33.300000000	1.353000000	51.000000000	tested_positive
3.000000000	191.000000000	68.000000000	15.000000000	130.000000000	30.900000000	0.299000000	34.000000000	tested_negative
3.000000000	141.000000000	0.000000000	0.000000000	0.000000000	30.000000000	0.761000000	27.000000000	tested_positive
4.000000000	95.000000000	70.000000000	32.000000000	0.000000000	32.100000000	0.612000000	24.000000000	tested_negative
3.000000000	142.000000000	80.000000000	15.000000000	0.000000000	32.400000000	0.200000000	63.000000000	tested_negative
4.000000000	123.000000000	62.000000000	0.000000000	0.000000000	32.000000000	0.226000000	35.000000000	tested_positive
5.000000000	96.000000000	74.000000000	18.000000000	67.000000000	33.600000000	0.997000000	43.000000000	tested_negative
0.000000000	138.000000000	0.000000000	0.000000000	0.000000000	36.300000000	0.933000000	25.000000000	tested_positive
2.000000000	128.000000000	64.000000000	42.000000000	0.000000000	40.000000000	1.101000000	24.000000000	tested_negative
0.000000000	102.000000000	52.000000000	0.000000000	0.000000000	25.100000000	0.078000000	21.000000000	tested_negative
2.000000000	146.000000000	0.000000000	0.000000000	0.000000000	27.500000000	0.240000000	28.000000000	tested_positive
10.000000000	101.000000000	86.000000000	37.000000000	0.000000000	45.600000000	1.136000000	38.000000000	tested_positive
2.000000000	108.000000000	62.000000000	32.000000000	56.000000000	25.200000000	0.128000000	21.000000000	tested_negative
3.000000000	122.000000000	78.000000000	0.000000000	0.000000000	23.000000000	0.254000000	40.000000000	tested_negative
1.000000000	71.000000000	78.000000000	50.000000000	45.000000000	33.200000000	0.422000000	21.000000000	tested_negative
13.000000000	106.000000000	70.000000000	0.000000000	0.000000000	34.200000000	0.251000000	52.000000000	tested_negative
2.000000000	100.000000000	70.000000000	52.000000000	57.000000000	40.500000000	0.677000000	25.000000000	tested_negative
7.000000000	106.000000000	60.000000000	24.000000000	0.000000000	26.500000000	0.296000000	29.000000000	tested_positive
0.000000000	104.000000000	64.000000000	23.000000000	116.000000000	27.800000000	0.454000000	23.000000000	tested_negative
5.000000000	114.000000000	74.000000000	0.000000000	0.000000000	24.900000000	0.744000000	57.000000000	tested_negative
2.000000000	108.000000000	62.000000000	10.000000000	278.000000000	25.300000000	0.881000000	22.000000000	tested_negative
0.000000000	146.000000000	70.000000000	0.000000000	0.000000000	37.900000000	0.334000000	28.000000000	tested_positive
10.000000000	129.000000000	76.000000000	28.000000000	122.000000000	35.900000000	0.280000000	39.000000000	tested_negative
7.000000000	133.000000000	88.000000000	15.000000000	155.000000000	32.400000000	0.262000000	37.000000000	tested_negative
7.000000000	161.000000000	86.000000000	0.000000000	0.000000000	30.400000000	0.165000000	47.000000000	tested_positive
2.000000000	108.000000000	80.000000000	0.000000000	0.000000000	27.000000000	0.259000000	52.000000000	tested_positive
7.000000000	136.000000000	74.000000000	26.000000000	135.000000000	26.000000000	0.647000000	51.000000000	tested_negative
5.000000000	155.000000000	84.000000000	44.000000000	545.000000000	38.700000000	0.619000000	34.000000000	tested_negative
1.000000000	119.000000000	86.000000000	39.000000000	220.000000000	45.600000000	0.808000000	29.000000000	tested_positive
4.000000000	96.000000000	56.000000000	17.000000000	49.000000000	20.800000000	0.340000000	26.000000000	tested_negative
5.000000000	108.000000000	72.000000000	43.000000000	75.000000000	36.100000000	0.263000000	33.000000000	tested_negative
0.000000000	78.000000000	88.000000000	29.000000000	40.000000000	36.900000000	0.434000000	21.000000000	tested_negative
0.000000000	107.000000000	62.000000000	30.000000000	74.000000000	36.600000000	0.757000000	25.000000000	tested_positive
2.000000000	128.000000000	78.000000000	37.000000000	182.000000000	43.300000000	1.224000000	31.000000000	tested_positive
1.000000000	128.000000000	48.000000000	45.000000000	194.000000000	40.500000000	0.613000000	24.000000000	tested_positive
0.000000000	161.000000000	50.000000000	0.000000000	0.000000000	21.900000000	0.254000000	65.000000000	tested_negative
6.000000000	151.000000000	62.000000000	31.000000000	120.000000000	35.500000000	0.692000000	28.000000000	tested_negative
2.000000000	146.000000000	70.000000000	38.000000000	360.000000000	28.000000000	0.337000000	29.000000000	tested_positive
0.000000000	126.000000000	84.000000000	29.000000000	215.000000000	30.700000000	0.520000000	24.000000000	tested_negative
14.000000000	100.000000000	78.000000000	25.000000000	184.000000000	36.600000000	0.412000000	46.000000000	tested_positive
8.000000000	112.000000000	72.000000000	0.000000000	0.000000000	23.600000000	0.840000000	58.000000000	tested_negative
0.000000000	167.000000000	0.000000000	0.000000000	0.000000000	32.300000000	0.839000000	30.000000000	tested_positive
2.000000000	144.000000000	58.000000000	33.000000000	135.000000000	31.600000000	0.422000000	25.000000000	tested_positive
5.000000000	77.000000000	82.000000000	41.000000000	42.000000000	35.800000000	0.156000000	35.000000000	tested_negative
5.000000000	115.000000000	98.000000000	0.000000000	0.000000000	52.900000000	0.209000000	28.000000000	tested_positive
3.000000000	150.000000000	76.000000000	0.000000000	0.000000000	21.000000000	0.207000000	37.000000000	tested_negative
2.000000000	120.000000000	76.000000000	37.000000000	105.000000000	39.700000000	0.215000000	29.000000000	tested_negative
10.000000000	161.000000000	68.000000000	23.000000000	132.000000000	25.500000000	0.326000000	47.000000000	tested_positive
0.000000000	137.000000000	68.000000000	14.000000000	148.000000000	24.800000000	0.143000000	21.000000000	tested_negative
0.000000000	128.000000000	68.000000000	19.000000000	180.000000000	30.500000000	1.391000000	25.000000000	tested_positive
2.000000000	124.000000000	68.000000000	28.000000000	205.000000000	32.900000000	0.875000000	30.000000000	tested_positive
6.000000000	80.000000000	66.000000000	30.000000000	0.000000000	26.200000000	0.313000000	41.000000000	tested_negative
0.000000000	106.000000000	70.000000000	37.000000000	148.000000000	39.400000000	0.605000000	22.000000000	tested_negative
2.000000000	155.000000000	74.000000000	17.000000000	96.000000000	26.600000000	0.433000000	27.000000000	tested_positive
3.000000000	113.000000000	50.000000000	10.000000000	85.000000000	29.500000000	0.626000000	25.000000000	tested_negative
7.000000000	109.000000000	80.000000000	31.000000000	0.000000000	35.900000000	1.127000000	43.000000000	tested_positive
2.000000000	112.000000000	68.000000000	22.000000000	94.000000000	34.100000000	0.315000000	26.000000000	tested_negative
3.000000000	99.000000000	80.000000000	11.000000000	64.000000000	19.300000000	0.284000000	30.000000000	tested_negative
3.000000000	182.000000000	74.000000000	0.000000000	0.000000000	30.500000000	0.345000000	29.000000000	tested_positive
3.000000000	115.000000000	66.000000000	39.000000000	140.000000000	38.100000000	0.150000000	28.000000000	tested_negative
6.000000000	194.000000000	78.000000000	0.000000000	0.000000000	23.500000000	0.129000000	59.000000000	tested_positive
4.000000000	129.000000000	60.000000000	12.000000000	231.000000000	27.500000000	0.527000000	31.000000000	tested_negative
3.000000000	112.000000000	74.000000000	30.000000000	0.000000000	31.600000000	0.197000000	25.000000000	tested_positive
0.000000000	124.000000000	70.000000000	20.000000000	0.000000000	27.400000000	0.254000000	36.000000000	tested_positive
13.000000000	152.000000000	90.000000000	33.000000000	29.000000000	26.800000000	0.731000000	43.000000000	tested_positive
2.000000000	112.000000000	75.000000000	32.000000000	0.000000000	35.700000000	0.148000000	21.000000000	tested_negative
1.000000000	157.000000000	72.000000000	21.000000000	168.000000000	25.600000000	0.123000000	24.000000000	tested_negative
1.000000000	122.000000000	64.000000000	32.000000000	156.000000000	35.100000000	0.692000000	30.000000000	tested_positive
10.000000000	179.000000000	70.000000000	0.000000000	0.000000000	35.100000000	0.200000000	37.000000000	tested_negative
2.000000000	102.000000000	86.000000000	36.000000000	120.000000000	45.500000000	0.127000000	23.000000000	tested_positive
6.000000000	105.000000000	70.000000000	32.000000000	68.000000000	30.800000000	0.122000000	37.000000000	tested_negative
8.000000000	118.000000000	72.000000000	19.000000000	0.000000000	23.100000000	1.476000000	46.000000000	tested_negative
2.000000000	87.000000000	58.000000000	16.000000000	52.000000000	32.700000000	0.166000000	25.000000000	tested_negative
1.000000000	180.000000000	0.000000000	0.000000000	0.000000000	43.300000000	0.282000000	41.000000000	tested_positive
12.000000000	106.000000000	80.000000000	0.000000000	0.000000000	23.600000000	0.137000000	44.000000000	tested_negative
1.000000000	95.000000000	60.000000000	18.000000000	58.000000000	23.900000000	0.260000000	22.000000000	tested_negative
0.000000000	165.000000000	76.000000000	43.000000000	255.000000000	47.900000000	0.259000000	26.000000000	tested_negative
0.000000000	117.000000000	0.000000000	0.000000000	0.000000000	33.800000000	0.932000000	44.000000000	tested_negative
5.000000000	115.000000000	76.000000000	0.000000000	0.000000000	31.200000000	0.343000000	44.000000000	tested_positive
9.000000000	152.000000000	78.000000000	34.000000000	171.000000000	34.200000000	0.893000000	33.000000000	tested_positive
7.000000000	178.000000000	84.000000000	0.000000000	0.000000000	39.900000000	0.331000000	41.000000000	tested_positive
1.000000000	130.000000000	70.000000000	13.000000000	105.000000000	25.900000000	0.472000000	22.000000000	tested_negative
1.000000000	95.000000000	74.000000000	21.000000000	73.000000000	25.900000000	0.673000000	36.000000000	tested_negative
1.000000000	0.000000000	68.000000000	35.000000000	0.000000000	32.000000000	0.389000000	22.000000000	tested_negative
5.000000000	122.000000000	86.000000000	0.000000000	0.000000000	34.700000000	0.290000000	33.000000000	tested_negative
8.000000000	95.000000000	72.000000000	0.000000000	0.000000000	36.800000000	0.485000000	57.000000000	tested_negative
8.000000000	126.000000000	88.000000000	36.000000000	108.000000000	38.500000000	0.349000000	49.000000000	tested_negative
1.000000000	139.000000000	46.000000000	19.000000000	83.000000000	28.700000000	0.654000000	22.000000000	tested_negative
3.000000000	116.000000000	0.000000000	0.000000000	0.000000000	23.500000000	0.187000000	23.000000000	tested_negative
3.000000000	99.000000000	62.000000000	19.000000000	74.000000000	21.800000000	0.279000000	26.000000000	tested_negative
5.000000000	0.000000000	80.000000000	32.000000000	0.000000000	41.000000000	0.346000000	37.000000000	tested_positive
4.000000000	92.000000000	80.000000000	0.000000000	0.000000000	42.200000000	0.237000000	29.000000000	tested_negative
4.000000000	137.000000000	84.000000000	0.000000000	0.000000000	31.200000000	0.252000000	30.000000000	tested_negative
3.000000000	61.000000000	82.000000000	28.000000000	0.000000000	34.400000000	0.243000000	46.000000000	tested_negative
1.000000000	90.000000000	62.000000000	12.000000000	43.000000000	27.200000000	0.580000000	24.000000000	tested_negative
3.000000000	90.000000000	78.000000000	0.000000000	0.000000000	42.700000000	0.559000000	21.000000000	tested_negative
9.000000000	165.000000000	88.000000000	0.000000000	0.000000000	30.400000000	0.302000000	49.000000000	tested_positive
1.000000000	125.000000000	50.000000000	40.000000000	167.000000000	33.300000000	0.962000000	28.000000000	tested_positive
13.000000000	129.000000000	0.000000000	30.000000000	0.000000000	39.900000000	0.569000000	44.000000000	tested_positive
12.000000000	88.000000000	74.000000000	40.000000000	54.000000000	35.300000000	0.378000000	48.000000000	tested_negative
1.000000000	196.000000000	76.000000000	36.000000000	249.000000000	36.500000000	0.875000000	29.000000000	tested_positive
5.000000000	189.000000000	64.000000000	33.000000000	325.000000000	31.200000000	0.583000000	29.000000000	tested_positive
5.000000000	158.000000000	70.000000000	0.000000000	0.000000000	29.800000000	0.207000000	63.000000000	tested_negative
5.000000000	103.000000000	108.000000000	37.000000000	0.000000000	39.200000000	0.305000000	65.000000000	tested_negative
4.000000000	146.000000000	78.000000000	0.000000000	0.000000000	38.500000000	0.520000000	67.000000000	tested_positive
4.000000000	147.000000000	74.000000000	25.000000000	293.000000000	34.900000000	0.385000000	30.000000000	tested_negative
5.000000000	99.000000000	54.000000000	28.000000000	83.000000000	34.000000000	0.499000000	30.000000000	tested_negative
6.000000000	124.000000000	72.000000000	0.000000000	0.000000000	27.600000000	0.368000000	29.000000000	tested_positive
0.000000000	101.000000000	64.000000000	17.000000000	0.000000000	21.000000000	0.252000000	21.000000000	tested_negative
3.000000000	81.000000000	86.000000000	16.000000000	66.000000000	27.500000000	0.306000000	22.000000000	tested_negative
1.000000000	133.000000000	102.000000000	28.000000000	140.000000000	32.800000000	0.234000000	45.000000000	tested_positive
3.000000000	173.000000000	82.000000000	48.000000000	465.000000000	38.400000000	2.137000000	25.000000000	tested_positive
0.000000000	118.000000000	64.000000000	23.000000000	89.000000000	0.000000000	1.731000000	21.000000000	tested_negative
0.000000000	84.000000000	64.000000000	22.000000000	66.000000000	35.800000000	0.545000000	21.000000000	tested_negative
2.000000000	105.000000000	58.000000000	40.000000000	94.000000000	34.900000000	0.225000000	25.000000000	tested_negative
2.000000000	122.000000000	52.000000000	43.000000000	158.000000000	36.200000000	0.816000000	28.000000000	tested_negative
12.000000000	140.000000000	82.000000000	43.000000000	325.000000000	39.200000000	0.528000000	58.000000000	tested_positive
0.000000000	98.000000000	82.000000000	15.000000000	84.000000000	25.200000000	0.299000000	22.000000000	tested_negative
1.000000000	87.000000000	60.000000000	37.000000000	75.000000000	37.200000000	0.509000000	22.000000000	tested_negative
4.000000000	156.000000000	75.000000000	0.000000000	0.000000000	48.300000000	0.238000000	32.000000000	tested_positive
0.000000000	93.000000000	100.000000000	39.000000000	72.000000000	43.400000000	1.021000000	35.000000000	tested_negative
1.000000000	107.000000000	72.000000000	30.000000000	82.000000000	30.800000000	0.821000000	24.000000000	tested_negative
0.000000000	105.000000000	68.000000000	22.000000000	0.000000000	20.000000000	0.236000000	22.000000000	tested_negative
1.000000000	109.000000000	60.000000000	8.000000000	182.000000000	25.400000000	0.947000000	21.000000000	tested_negative
1.000000000	90.000000000	62.000000000	18.000000000	59.000000000	25.100000000	1.268000000	25.000000000	tested_negative
1.000000000	125.000000000	70.000000000	24.000000000	110.000000000	24.300000000	0.221000000	25.000000000	tested_negative
1.000000000	119.000000000	54.000000000	13.000000000	50.000000000	22.300000000	0.205000000	24.000000000	tested_negative
5.000000000	116.000000000	74.000000000	29.000000000	0.000000000	32.300000000	0.660000000	35.000000000	tested_positive
8.000000000	105.000000000	100.000000000	36.000000000	0.000000000	43.300000000	0.239000000	45.000000000	tested_positive
5.000000000	144.000000000	82.000000000	26.000000000	285.000000000	32.000000000	0.452000000	58.000000000	tested_positive
3.000000000	100.000000000	68.000000000	23.000000000	81.000000000	31.600000000	0.949000000	28.000000000	tested_negative
1.000000000	100.000000000	66.000000000	29.000000000	196.000000000	32.000000000	0.444000000	42.000000000	tested_negative
5.000000000	166.000000000	76.000000000	0.000000000	0.000000000	45.700000000	0.340000000	27.000000000	tested_positive
1.000000000	131.000000000	64.000000000	14.000000000	415.000000000	23.700000000	0.389000000	21.000000000	tested_negative
4.000000000	116.000000000	72.000000000	12.000000000	87.000000000	22.100000000	0.463000000	37.000000000	tested_negative
4.000000000	158.000000000	78.000000000	0.000000000	0.000000000	32.900000000	0.803000000	31.000000000	tested_positive
2.000000000	127.000000000	58.000000000	24.000000000	275.000000000	27.700000000	1.600000000	25.000000000	tested_negative
3.000000000	96.000000000	56.000000000	34.000000000	115.000000000	24.700000000	0.944000000	39.000000000	tested_negative
0.000000000	131.000000000	66.000000000	40.000000000	0.000000000	34.300000000	0.196000000	22.000000000	tested_positive
3.000000000	82.000000000	70.000000000	0.000000000	0.000000000	21.100000000	0.389000000	25.000000000	tested_negative
3.000000000	193.000000000	70.000000000	31.000000000	0.000000000	34.900000000	0.241000000	25.000000000	tested_positive
4.000000000	95.000000000	64.000000000	0.000000000	0.000000000	32.000000000	0.161000000	31.000000000	tested_positive
6.000000000	137.000000000	61.000000000	0.000000000	0.000000000	24.200000000	0.151000000	55.000000000	tested_negative
5.000000000	136.000000000	84.000000000	41.000000000	88.000000000	35.000000000	0.286000000	35.000000000	tested_positive
9.000000000	72.000000000	78.000000000	25.000000000	0.000000000	31.600000000	0.280000000	38.000000000	tested_negative
5.000000000	168.000000000	64.000000000	0.000000000	0.000000000	32.900000000	0.135000000	41.000000000	tested_positive
2.000000000	123.000000000	48.000000000	32.000000000	165.000000000	42.100000000	0.520000000	26.000000000	tested_negative
4.000000000	115.000000000	72.000000000	0.000000000	0.000000000	28.900000000	0.376000000	46.000000000	tested_positive
0.000000000	101.000000000	62.000000000	0.000000000	0.000000000	21.900000000	0.336000000	25.000000000	tested_negative
8.000000000	197.000000000	74.000000000	0.000000000	0.000000000	25.900000000	1.191000000	39.000000000	tested_positive
1.000000000	172.000000000	68.000000000	49.000000000	579.000000000	42.400000000	0.702000000	28.000000000	tested_positive
6.000000000	102.000000000	90.000000000	39.000000000	0.000000000	35.700000000	0.674000000	28.000000000	tested_negative
1.000000000	112.000000000	72.000000000	30.000000000	176.000000000	34.400000000	0.528000000	25.000000000	tested_negative
1.000000000	143.000000000	84.000000000	23.000000000	310.000000000	42.400000000	1.076000000	22.000000000	tested_negative
1.000000000	143.000000000	74.000000000	22.000000000	61.000000000	26.200000000	0.256000000	21.000000000	tested_negative
0.000000000	138.000000000	60.000000000	35.000000000	167.000000000	34.600000000	0.534000000	21.000000000	tested_positive
3.000000000	173.000000000	84.000000000	33.000000000	474.000000000	35.700000000	0.258000000	22.000000000	tested_positive
1.000000000	97.000000000	68.000000000	21.000000000	0.000000000	27.200000000	1.095000000	22.000000000	tested_negative
4.000000000	144.000000000	82.000000000	32.000000000	0.000000000	38.500000000	0.554000000	37.000000000	tested_positive
1.000000000	83.000000000	68.000000000	0.000000000	0.000000000	18.200000000	0.624000000	27.000000000	tested_negative
3.000000000	129.000000000	64.000000000	29.000000000	115.000000000	26.400000000	0.219000000	28.000000000	tested_positive
1.000000000	119.000000000	88.000000000	41.000000000	170.000000000	45.300000000	0.507000000	26.000000000	tested_negative
2.000000000	94.000000000	68.000000000	18.000000000	76.000000000	26.000000000	0.561000000	21.000000000	tested_negative
0.000000000	102.000000000	64.000000000	46.000000000	78.000000000	40.600000000	0.496000000	21.000000000	tested_negative
2.000000000	115.000000000	64.000000000	22.000000000	0.000000000	30.800000000	0.421000000	21.000000000	tested_negative
8.000000000	151.000000000	78.000000000	32.000000000	210.000000000	42.900000000	0.516000000	36.000000000	tested_positive
4.000000000	184.000000000	78.000000000	39.000000000	277.000000000	37.000000000	0.264000000	31.000000000	tested_positive
0.000000000	94.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.256000000	25.000000000	tested_negative
1.000000000	181.000000000	64.000000000	30.000000000	180.000000000	34.100000000	0.328000000	38.000000000	tested_positive
0.000000000	135.000000000	94.000000000	46.000000000	145.000000000	40.600000000	0.284000000	26.000000000	tested_negative
1.000000000	95.000000000	82.000000000	25.000000000	180.000000000	35.000000000	0.233000000	43.000000000	tested_positive
2.000000000	99.000000000	0.000000000	0.000000000	0.000000000	22.200000000	0.108000000	23.000000000	tested_negative
3.000000000	89.000000000	74.000000000	16.000000000	85.000000000	30.400000000	0.551000000	38.000000000	tested_negative
1.000000000	80.000000000	74.000000000	11.000000000	60.000000000	30.000000000	0.527000000	22.000000000	tested_negative
2.000000000	139.000000000	75.000000000	0.000000000	0.000000000	25.600000000	0.167000000	29.000000000	tested_negative
1.000000000	90.000000000	68.000000000	8.000000000	0.000000000	24.500000000	1.138000000	36.000000000	tested_negative
0.000000000	141.000000000	0.000000000	0.000000000	0.000000000	42.400000000	0.205000000	29.000000000	tested_positive
12.000000000	140.000000000	85.000000000	33.000000000	0.000000000	37.400000000	0.244000000	41.000000000	tested_negative
5.000000000	147.000000000	75.000000000	0.000000000	0.000000000	29.900000000	0.434000000	28.000000000	tested_negative
1.000000000	97.000000000	70.000000000	15.000000000	0.000000000	18.200000000	0.147000000	21.000000000	tested_negative
6.000000000	107.000000000	88.000000000	0.000000000	0.000000000	36.800000000	0.727000000	31.000000000	tested_negative
0.000000000	189.000000000	104.000000000	25.000000000	0.000000000	34.300000000	0.435000000	41.000000000	tested_positive
2.000000000	83.000000000	66.000000000	23.000000000	50.000000000	32.200000000	0.497000000	22.000000000	tested_negative
4.000000000	117.000000000	64.000000000	27.000000000	120.000000000	33.200000000	0.230000000	24.000000000	tested_negative
8.000000000	108.000000000	70.000000000	0.000000000	0.000000000	30.500000000	0.955000000	33.000000000	tested_positive
4.000000000	117.000000000	62.000000000	12.000000000	0.000000000	29.700000000	0.380000000	30.000000000	tested_positive
0.000000000	180.000000000	78.000000000	63.000000000	14.000000000	59.400000000	2.420000000	25.000000000	tested_positive
1.000000000	100.000000000	72.000000000	12.000000000	70.000000000	25.300000000	0.658000000	28.000000000	tested_negative
0.000000000	95.000000000	80.000000000	45.000000000	92.000000000	36.500000000	0.330000000	26.000000000	tested_negative
0.000000000	104.000000000	64.000000000	37.000000000	64.000000000	33.600000000	0.510000000	22.000000000	tested_positive
0.000000000	120.000000000	74.000000000	18.000000000	63.000000000	30.500000000	0.285000000	26.000000000	tested_negative
1.000000000	82.000000000	64.000000000	13.000000000	95.000000000	21.200000000	0.415000000	23.000000000	tested_negative
2.000000000	134.000000000	70.000000000	0.000000000	0.000000000	28.900000000	0.542000000	23.000000000	tested_positive
0.000000000	91.000000000	68.000000000	32.000000000	210.000000000	39.900000000	0.381000000	25.000000000	tested_negative
2.000000000	119.000000000	0.000000000	0.000000000	0.000000000	19.600000000	0.832000000	72.000000000	tested_negative
2.000000000	100.000000000	54.000000000	28.000000000	105.000000000	37.800000000	0.498000000	24.000000000	tested_negative
14.000000000	175.000000000	62.000000000	30.000000000	0.000000000	33.600000000	0.212000000	38.000000000	tested_positive
1.000000000	135.000000000	54.000000000	0.000000000	0.000000000	26.700000000	0.687000000	62.000000000	tested_negative
5.000000000	86.000000000	68.000000000	28.000000000	71.000000000	30.200000000	0.364000000	24.000000000	tested_negative
10.000000000	148.000000000	84.000000000	48.000000000	237.000000000	37.600000000	1.001000000	51.000000000	tested_positive
9.000000000	134.000000000	74.000000000	33.000000000	60.000000000	25.900000000	0.460000000	81.000000000	tested_negative
9.000000000	120.000000000	72.000000000	22.000000000	56.000000000	20.800000000	0.733000000	48.000000000	tested_negative
1.000000000	71.000000000	62.000000000	0.000000000	0.000000000	21.800000000	0.416000000	26.000000000	tested_negative
8.000000000	74.000000000	70.000000000	40.000000000	49.000000000	35.300000000	0.705000000	39.000000000	tested_negative
5.000000000	88.000000000	78.000000000	30.000000000	0.000000000	27.600000000	0.258000000	37.000000000	tested_negative
10.000000000	115.000000000	98.000000000	0.000000000	0.000000000	24.000000000	1.022000000	34.000000000	tested_negative
0.000000000	124.000000000	56.000000000	13.000000000	105.000000000	21.800000000	0.452000000	21.000000000	tested_negative
0.000000000	74.000000000	52.000000000	10.000000000	36.000000000	27.800000000	0.269000000	22.000000000	tested_negative
0.000000000	97.000000000	64.000000000	36.000000000	100.000000000	36.800000000	0.600000000	25.000000000	tested_negative
8.000000000	120.000000000	0.000000000	0.000000000	0.000000000	30.000000000	0.183000000	38.000000000	tested_positive
6.000000000	154.000000000	78.000000000	41.000000000	140.000000000	46.100000000	0.571000000	27.000000000	tested_negative
1.000000000	144.000000000	82.000000000	40.000000000	0.000000000	41.300000000	0.607000000	28.000000000	tested_negative
0.000000000	137.000000000	70.000000000	38.000000000	0.000000000	33.200000000	0.170000000	22.000000000	tested_negative
0.000000000	119.000000000	66.000000000	27.000000000	0.000000000	38.800000000	0.259000000	22.000000000	tested_negative
7.000000000	136.000000000	90.000000000	0.000000000	0.000000000	29.900000000	0.210000000	50.000000000	tested_negative
4.000000000	114.000000000	64.000000000	0.000000000	0.000000000	28.900000000	0.126000000	24.000000000	tested_negative
0.000000000	137.000000000	84.000000000	27.000000000	0.000000000	27.300000000	0.231000000	59.000000000	tested_negative
2.000000000	105.000000000	80.000000000	45.000000000	191.000000000	33.700000000	0.711000000	29.000000000	tested_positive
7.000000000	114.000000000	76.000000000	17.000000000	110.000000000	23.800000000	0.466000000	31.000000000	tested_negative
8.000000000	126.000000000	74.000000000	38.000000000	75.000000000	25.900000000	0.162000000	39.000000000	tested_negative
4.000000000	132.000000000	86.000000000	31.000000000	0.000000000	28.000000000	0.419000000	63.000000000	tested_negative
3.000000000	158.000000000	70.000000000	30.000000000	328.000000000	35.500000000	0.344000000	35.000000000	tested_positive
0.000000000	123.000000000	88.000000000	37.000000000	0.000000000	35.200000000	0.197000000	29.000000000	tested_negative
4.000000000	85.000000000	58.000000000	22.000000000	49.000000000	27.800000000	0.306000000	28.000000000	tested_negative
0.000000000	84.000000000	82.000000000	31.000000000	125.000000000	38.200000000	0.233000000	23.000000000	tested_negative
0.000000000	145.000000000	0.000000000	0.000000000	0.000000000	44.200000000	0.630000000	31.000000000	tested_positive
0.000000000	135.000000000	68.000000000	42.000000000	250.000000000	42.300000000	0.365000000	24.000000000	tested_positive
1.000000000	139.000000000	62.000000000	41.000000000	480.000000000	40.700000000	0.536000000	21.000000000	tested_negative
0.000000000	173.000000000	78.000000000	32.000000000	265.000000000	46.500000000	1.159000000	58.000000000	tested_negative
4.000000000	99.000000000	72.000000000	17.000000000	0.000000000	25.600000000	0.294000000	28.000000000	tested_negative
8.000000000	194.000000000	80.000000000	0.000000000	0.000000000	26.100000000	0.551000000	67.000000000	tested_negative
2.000000000	83.000000000	65.000000000	28.000000000	66.000000000	36.800000000	0.629000000	24.000000000	tested_negative
2.000000000	89.000000000	90.000000000	30.000000000	0.000000000	33.500000000	0.292000000	42.000000000	tested_negative
4.000000000	99.000000000	68.000000000	38.000000000	0.000000000	32.800000000	0.145000000	33.000000000	tested_negative
4.000000000	125.000000000	70.000000000	18.000000000	122.000000000	28.900000000	1.144000000	45.000000000	tested_positive
3.000000000	80.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.174000000	22.000000000	tested_negative
6.000000000	166.000000000	74.000000000	0.000000000	0.000000000	26.600000000	0.304000000	66.000000000	tested_negative
5.000000000	110.000000000	68.000000000	0.000000000	0.000000000	26.000000000	0.292000000	30.000000000	tested_negative
2.000000000	81.000000000	72.000000000	15.000000000	76.000000000	30.100000000	0.547000000	25.000000000	tested_negative
7.000000000	195.000000000	70.000000000	33.000000000	145.000000000	25.100000000	0.163000000	55.000000000	tested_positive
6.000000000	154.000000000	74.000000000	32.000000000	193.000000000	29.300000000	0.839000000	39.000000000	tested_negative
2.000000000	117.000000000	90.000000000	19.000000000	71.000000000	25.200000000	0.313000000	21.000000000	tested_negative
3.000000000	84.000000000	72.000000000	32.000000000	0.000000000	37.200000000	0.267000000	28.000000000	tested_negative
6.000000000	0.000000000	68.000000000	41.000000000	0.000000000	39.000000000	0.727000000	41.000000000	tested_positive
7.000000000	94.000000000	64.000000000	25.000000000	79.000000000	33.300000000	0.738000000	41.000000000	tested_negative
3.000000000	96.000000000	78.000000000	39.000000000	0.000000000	37.300000000	0.238000000	40.000000000	tested_negative
10.000000000	75.000000000	82.000000000	0.000000000	0.000000000	33.300000000	0.263000000	38.000000000	tested_negative
0.000000000	180.000000000	90.000000000	26.000000000	90.000000000	36.500000000	0.314000000	35.000000000	tested_positive
1.000000000	130.000000000	60.000000000	23.000000000	170.000000000	28.600000000	0.692000000	21.000000000	tested_negative
2.000000000	84.000000000	50.000000000	23.000000000	76.000000000	30.400000000	0.968000000	21.000000000	tested_negative
8.000000000	120.000000000	78.000000000	0.000000000	0.000000000	25.000000000	0.409000000	64.000000000	tested_negative
12.000000000	84.000000000	72.000000000	31.000000000	0.000000000	29.700000000	0.297000000	46.000000000	tested_positive
0.000000000	139.000000000	62.000000000	17.000000000	210.000000000	22.100000000	0.207000000	21.000000000	tested_negative
9.000000000	91.000000000	68.000000000	0.000000000	0.000000000	24.200000000	0.200000000	58.000000000	tested_negative
2.000000000	91.000000000	62.000000000	0.000000000	0.000000000	27.300000000	0.525000000	22.000000000	tested_negative
3.000000000	99.000000000	54.000000000	19.000000000	86.000000000	25.600000000	0.154000000	24.000000000	tested_negative
3.000000000	163.000000000	70.000000000	18.000000000	105.000000000	31.600000000	0.268000000	28.000000000	tested_positive
9.000000000	145.000000000	88.000000000	34.000000000	165.000000000	30.300000000	0.771000000	53.000000000	tested_positive
7.000000000	125.000000000	86.000000000	0.000000000	0.000000000	37.600000000	0.304000000	51.000000000	tested_negative
13.000000000	76.000000000	60.000000000	0.000000000	0.000000000	32.800000000	0.180000000	41.000000000	tested_negative
6.000000000	129.000000000	90.000000000	7.000000000	326.000000000	19.600000000	0.582000000	60.000000000	tested_negative
2.000000000	68.000000000	70.000000000	32.000000000	66.000000000	25.000000000	0.187000000	25.000000000	tested_negative
3.000000000	124.000000000	80.000000000	33.000000000	130.000000000	33.200000000	0.305000000	26.000000000	tested_negative
6.000000000	114.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.189000000	26.000000000	tested_negative
9.000000000	130.000000000	70.000000000	0.000000000	0.000000000	34.200000000	0.652000000	45.000000000	tested_positive
3.000000000	125.000000000	58.000000000	0.000000000	0.000000000	31.600000000	0.151000000	24.000000000	tested_negative
3.000000000	87.000000000	60.000000000	18.000000000	0.000000000	21.800000000	0.444000000	21.000000000	tested_negative
1.000000000	97.000000000	64.000000000	19.000000000	82.000000000	18.200000000	0.299000000	21.000000000	tested_negative
3.000000000	116.000000000	74.000000000	15.000000000	105.000000000	26.300000000	0.107000000	24.000000000	tested_negative
0.000000000	117.000000000	66.000000000	31.000000000	188.000000000	30.800000000	0.493000000	22.000000000	tested_negative
0.000000000	111.000000000	65.000000000	0.000000000	0.000000000	24.600000000	0.660000000	31.000000000	tested_negative
2.000000000	122.000000000	60.000000000	18.000000000	106.000000000	29.800000000	0.717000000	22.000000000	tested_negative
0.000000000	107.000000000	76.000000000	0.000000000	0.000000000	45.300000000	0.686000000	24.000000000	tested_negative
1.000000000	86.000000000	66.000000000	52.000000000	65.000000000	41.300000000	0.917000000	29.000000000	tested_negative
6.000000000	91.000000000	0.000000000	0.000000000	0.000000000	29.800000000	0.501000000	31.000000000	tested_negative
1.000000000	77.000000000	56.000000000	30.000000000	56.000000000	33.300000000	1.251000000	24.000000000	tested_negative
4.000000000	132.000000000	0.000000000	0.000000000	0.000000000	32.900000000	0.302000000	23.000000000	tested_positive
0.000000000	105.000000000	90.000000000	0.000000000	0.000000000	29.600000000	0.197000000	46.000000000	tested_negative
0.000000000	57.000000000	60.000000000	0.000000000	0.000000000	21.700000000	0.735000000	67.000000000	tested_negative
0.000000000	127.000000000	80.000000000	37.000000000	210.000000000	36.300000000	0.804000000	23.000000000	tested_negative
3.000000000	129.000000000	92.000000000	49.000000000	155.000000000	36.400000000	0.968000000	32.000000000	tested_positive
8.000000000	100.000000000	74.000000000	40.000000000	215.000000000	39.400000000	0.661000000	43.000000000	tested_positive
3.000000000	128.000000000	72.000000000	25.000000000	190.000000000	32.400000000	0.549000000	27.000000000	tested_positive
10.000000000	90.000000000	85.000000000	32.000000000	0.000000000	34.900000000	0.825000000	56.000000000	tested_positive
4.000000000	84.000000000	90.000000000	23.000000000	56.000000000	39.500000000	0.159000000	25.000000000	tested_negative
1.000000000	88.000000000	78.000000000	29.000000000	76.000000000	32.000000000	0.365000000	29.000000000	tested_negative
8.000000000	186.000000000	90.000000000	35.000000000	225.000000000	34.500000000	0.423000000	37.000000000	tested_positive
5.000000000	187.000000000	76.000000000	27.000000000	207.000000000	43.600000000	1.034000000	53.000000000	tested_positive
4.000000000	131.000000000	68.000000000	21.000000000	166.000000000	33.100000000	0.160000000	28.000000000	tested_negative
1.000000000	164.000000000	82.000000000	43.000000000	67.000000000	32.800000000	0.341000000	50.000000000	tested_negative
4.000000000	189.000000000	110.000000000	31.000000000	0.000000000	28.500000000	0.680000000	37.000000000	tested_negative
1.000000000	116.000000000	70.000000000	28.000000000	0.000000000	27.400000000	0.204000000	21.000000000	tested_negative
3.000000000	84.000000000	68.000000000	30.000000000	106.000000000	31.900000000	0.591000000	25.000000000	tested_negative
6.000000000	114.000000000	88.000000000	0.000000000	0.000000000	27.800000000	0.247000000	66.000000000	tested_negative
1.000000000	88.000000000	62.000000000	24.000000000	44.000000000	29.900000000	0.422000000	23.000000000	tested_negative
1.000000000	84.000000000	64.000000000	23.000000000	115.000000000	36.900000000	0.471000000	28.000000000	tested_negative
7.000000000	124.000000000	70.000000000	33.000000000	215.000000000	25.500000000	0.161000000	37.000000000	tested_negative
1.000000000	97.000000000	70.000000000	40.000000000	0.000000000	38.100000000	0.218000000	30.000000000	tested_negative
8.000000000	110.000000000	76.000000000	0.000000000	0.000000000	27.800000000	0.237000000	58.000000000	tested_negative
11.000000000	103.000000000	68.000000000	40.000000000	0.000000000	46.200000000	0.126000000	42.000000000	tested_negative
11.000000000	85.000000000	74.000000000	0.000000000	0.000000000	30.100000000	0.300000000	35.000000000	tested_negative
6.000000000	125.000000000	76.000000000	0.000000000	0.000000000	33.800000000	0.121000000	54.000000000	tested_positive
0.000000000	198.000000000	66.000000000	32.000000000	274.000000000	41.300000000	0.502000000	28.000000000	tested_positive
1.000000000	87.000000000	68.000000000	34.000000000	77.000000000	37.600000000	0.401000000	24.000000000	tested_negative
6.000000000	99.000000000	60.000000000	19.000000000	54.000000000	26.900000000	0.497000000	32.000000000	tested_negative
0.000000000	91.000000000	80.000000000	0.000000000	0.000000000	32.400000000	0.601000000	27.000000000	tested_negative
2.000000000	95.000000000	54.000000000	14.000000000	88.000000000	26.100000000	0.748000000	22.000000000	tested_negative
1.000000000	99.000000000	72.000000000	30.000000000	18.000000000	38.600000000	0.412000000	21.000000000	tested_negative
6.000000000	92.000000000	62.000000000	32.000000000	126.000000000	32.000000000	0.085000000	46.000000000	tested_negative
4.000000000	154.000000000	72.000000000	29.000000000	126.000000000	31.300000000	0.338000000	37.000000000	tested_negative
0.000000000	121.000000000	66.000000000	30.000000000	165.000000000	34.300000000	0.203000000	33.000000000	tested_positive
3.000000000	78.000000000	70.000000000	0.000000000	0.000000000	32.500000000	0.270000000	39.000000000	tested_negative
2.000000000	130.000000000	96.000000000	0.000000000	0.000000000	22.600000000	0.268000000	21.000000000	tested_negative
3.000000000	111.000000000	58.000000000	31.000000000	44.000000000	29.500000000	0.430000000	22.000000000	tested_negative
2.000000000	98.000000000	60.000000000	17.000000000	120.000000000	34.700000000	0.198000000	22.000000000	tested_negative
1.000000000	143.000000000	86.000000000	30.000000000	330.000000000	30.100000000	0.892000000	23.000000000	tested_negative
1.000000000	119.000000000	44.000000000	47.000000000	63.000000000	35.500000000	0.280000000	25.000000000	tested_negative
6.000000000	108.000000000	44.000000000	20.000000000	130.000000000	24.000000000	0.813000000	35.000000000	tested_negative
2.000000000	118.000000000	80.000000000	0.000000000	0.000000000	42.900000000	0.693000000	21.000000000	tested_positive
10.000000000	133.000000000	68.000000000	0.000000000	0.000000000	27.000000000	0.245000000	36.000000000	tested_negative
2.000000000	197.000000000	70.000000000	99.000000000	0.000000000	34.700000000	0.575000000	62.000000000	tested_positive
0.000000000	151.000000000	90.000000000	46.000000000	0.000000000	42.100000000	0.371000000	21.000000000	tested_positive
6.000000000	109.000000000	60.000000000	27.000000000	0.000000000	25.000000000	0.206000000	27.000000000	tested_negative
12.000000000	121.000000000	78.000000000	17.000000000	0.000000000	26.500000000	0.259000000	62.000000000	tested_negative
8.000000000	100.000000000	76.000000000	0.000000000	0.000000000	38.700000000	0.190000000	42.000000000	tested_negative
8.000000000	124.000000000	76.000000000	24.000000000	600.000000000	28.700000000	0.687000000	52.000000000	tested_positive
1.000000000	93.000000000	56.000000000	11.000000000	0.000000000	22.500000000	0.417000000	22.000000000	tested_negative
8.000000000	143.000000000	66.000000000	0.000000000	0.000000000	34.900000000	0.129000000	41.000000000	tested_positive
6.000000000	103.000000000	66.000000000	0.000000000	0.000000000	24.300000000	0.249000000	29.000000000	tested_negative
3.000000000	176.000000000	86.000000000	27.000000000	156.000000000	33.300000000	1.154000000	52.000000000	tested_positive
0.000000000	73.000000000	0.000000000	0.000000000	0.000000000	21.100000000	0.342000000	25.000000000	tested_negative
11.000000000	111.000000000	84.000000000	40.000000000	0.000000000	46.800000000	0.925000000	45.000000000	tested_positive
2.000000000	112.000000000	78.000000000	50.000000000	140.000000000	39.400000000	0.175000000	24.000000000	tested_negative
3.000000000	132.000000000	80.000000000	0.000000000	0.000000000	34.400000000	0.402000000	44.000000000	tested_positive
2.000000000	82.000000000	52.000000000	22.000000000	115.000000000	28.500000000	1.699000000	25.000000000	tested_negative
6.000000000	123.000000000	72.000000000	45.000000000	230.000000000	33.600000000	0.733000000	34.000000000	tested_negative
0.000000000	188.000000000	82.000000000	14.000000000	185.000000000	32.000000000	0.682000000	22.000000000	tested_positive
0.000000000	67.000000000	76.000000000	0.000000000	0.000000000	45.300000000	0.194000000	46.000000000	tested_negative
1.000000000	89.000000000	24.000000000	19.000000000	25.000000000	27.800000000	0.559000000	21.000000000	tested_negative
1.000000000	173.000000000	74.000000000	0.000000000	0.000000000	36.800000000	0.088000000	38.000000000	tested_positive
1.000000000	109.000000000	38.000000000	18.000000000	120.000000000	23.100000000	0.407000000	26.000000000	tested_negative
1.000000000	108.000000000	88.000000000	19.000000000	0.000000000	27.100000000	0.400000000	24.000000000	tested_negative
6.000000000	96.000000000	0.000000000	0.000000000	0.000000000	23.700000000	0.190000000	28.000000000	tested_negative
1.000000000	124.000000000	74.000000000	36.000000000	0.000000000	27.800000000	0.100000000	30.000000000	tested_negative
7.000000000	150.000000000	78.000000000	29.000000000	126.000000000	35.200000000	0.692000000	54.000000000	tested_positive
4.000000000	183.000000000	0.000000000	0.000000000	0.000000000	28.400000000	0.212000000	36.000000000	tested_positive
1.000000000	124.000000000	60.000000000	32.000000000	0.000000000	35.800000000	0.514000000	21.000000000	tested_negative
1.000000000	181.000000000	78.000000000	42.000000000	293.000000000	40.000000000	1.258000000	22.000000000	tested_positive
1.000000000	92.000000000	62.000000000	25.000000000	41.000000000	19.500000000	0.482000000	25.000000000	tested_negative
0.000000000	152.000000000	82.000000000	39.000000000	272.000000000	41.500000000	0.270000000	27.000000000	tested_negative
1.000000000	111.000000000	62.000000000	13.000000000	182.000000000	24.000000000	0.138000000	23.000000000	tested_negative
3.000000000	106.000000000	54.000000000	21.000000000	158.000000000	30.900000000	0.292000000	24.000000000	tested_negative
3.000000000	174.000000000	58.000000000	22.000000000	194.000000000	32.900000000	0.593000000	36.000000000	tested_positive
7.000000000	168.000000000	88.000000000	42.000000000	321.000000000	38.200000000	0.787000000	40.000000000	tested_positive
6.000000000	105.000000000	80.000000000	28.000000000	0.000000000	32.500000000	0.878000000	26.000000000	tested_negative
11.000000000	138.000000000	74.000000000	26.000000000	144.000000000	36.100000000	0.557000000	50.000000000	tested_positive
3.000000000	106.000000000	72.000000000	0.000000000	0.000000000	25.800000000	0.207000000	27.000000000	tested_negative
6.000000000	117.000000000	96.000000000	0.000000000	0.000000000	28.700000000	0.157000000	30.000000000	tested_negative
2.000000000	68.000000000	62.000000000	13.000000000	15.000000000	20.100000000	0.257000000	23.000000000	tested_negative
9.000000000	112.000000000	82.000000000	24.000000000	0.000000000	28.200000000	1.282000000	50.000000000	tested_positive
0.000000000	119.000000000	0.000000000	0.000000000	0.000000000	32.400000000	0.141000000	24.000000000	tested_positive
2.000000000	112.000000000	86.000000000	42.000000000	160.000000000	38.400000000	0.246000000	28.000000000	tested_negative
2.000000000	92.000000000	76.000000000	20.000000000	0.000000000	24.200000000	1.698000000	28.000000000	tested_negative
6.000000000	183.000000000	94.000000000	0.000000000	0.000000000	40.800000000	1.461000000	45.000000000	tested_negative
0.000000000	94.000000000	70.000000000	27.000000000	115.000000000	43.500000000	0.347000000	21.000000000	tested_negative
2.000000000	108.000000000	64.000000000	0.000000000	0.000000000	30.800000000	0.158000000	21.000000000	tested_negative
4.000000000	90.000000000	88.000000000	47.000000000	54.000000000	37.700000000	0.362000000	29.000000000	tested_negative
0.000000000	125.000000000	68.000000000	0.000000000	0.000000000	24.700000000	0.206000000	21.000000000	tested_negative
0.000000000	132.000000000	78.000000000	0.000000000	0.000000000	32.400000000	0.393000000	21.000000000	tested_negative
5.000000000	128.000000000	80.000000000	0.000000000	0.000000000	34.600000000	0.144000000	45.000000000	tested_negative
4.000000000	94.000000000	65.000000000	22.000000000	0.000000000	24.700000000	0.148000000	21.000000000	tested_negative
7.000000000	114.000000000	64.000000000	0.000000000	0.000000000	27.400000000	0.732000000	34.000000000	tested_positive
0.000000000	102.000000000	78.000000000	40.000000000	90.000000000	34.500000000	0.238000000	24.000000000	tested_negative
2.000000000	111.000000000	60.000000000	0.000000000	0.000000000	26.200000000	0.343000000	23.000000000	tested_negative
1.000000000	128.000000000	82.000000000	17.000000000	183.000000000	27.500000000	0.115000000	22.000000000	tested_negative
10.000000000	92.000000000	62.000000000	0.000000000	0.000000000	25.900000000	0.167000000	31.000000000	tested_negative
13.000000000	104.000000000	72.000000000	0.000000000	0.000000000	31.200000000	0.465000000	38.000000000	tested_positive
5.000000000	104.000000000	74.000000000	0.000000000	0.000000000	28.800000000	0.153000000	48.000000000	tested_negative
2.000000000	94.000000000	76.000000000	18.000000000	66.000000000	31.600000000	0.649000000	23.000000000	tested_negative
7.000000000	97.000000000	76.000000000	32.000000000	91.000000000	40.900000000	0.871000000	32.000000000	tested_positive
1.000000000	100.000000000	74.000000000	12.000000000	46.000000000	19.500000000	0.149000000	28.000000000	tested_negative
0.000000000	102.000000000	86.000000000	17.000000000	105.000000000	29.300000000	0.695000000	27.000000000	tested_negative
4.000000000	128.000000000	70.000000000	0.000000000	0.000000000	34.300000000	0.303000000	24.000000000	tested_negative
6.000000000	147.000000000	80.000000000	0.000000000	0.000000000	29.500000000	0.178000000	50.000000000	tested_positive
4.000000000	90.000000000	0.000000000	0.000000000	0.000000000	28.000000000	0.610000000	31.000000000	tested_negative
3.000000000	103.000000000	72.000000000	30.000000000	152.000000000	27.600000000	0.730000000	27.000000000	tested_negative
2.000000000	157.000000000	74.000000000	35.000000000	440.000000000	39.400000000	0.134000000	30.000000000	tested_negative
1.000000000	167.000000000	74.000000000	17.000000000	144.000000000	23.400000000	0.447000000	33.000000000	tested_positive
0.000000000	179.000000000	50.000000000	36.000000000	159.000000000	37.800000000	0.455000000	22.000000000	tested_positive
11.000000000	136.000000000	84.000000000	35.000000000	130.000000000	28.300000000	0.260000000	42.000000000	tested_positive
0.000000000	107.000000000	60.000000000	25.000000000	0.000000000	26.400000000	0.133000000	23.000000000	tested_negative
1.000000000	91.000000000	54.000000000	25.000000000	100.000000000	25.200000000	0.234000000	23.000000000	tested_negative
1.000000000	117.000000000	60.000000000	23.000000000	106.000000000	33.800000000	0.466000000	27.000000000	tested_negative
5.000000000	123.000000000	74.000000000	40.000000000	77.000000000	34.100000000	0.269000000	28.000000000	tested_negative
2.000000000	120.000000000	54.000000000	0.000000000	0.000000000	26.800000000	0.455000000	27.000000000	tested_negative
1.000000000	106.000000000	70.000000000	28.000000000	135.000000000	34.200000000	0.142000000	22.000000000	tested_negative
2.000000000	155.000000000	52.000000000	27.000000000	540.000000000	38.700000000	0.240000000	25.000000000	tested_positive
2.000000000	101.000000000	58.000000000	35.000000000	90.000000000	21.800000000	0.155000000	22.000000000	tested_negative
1.000000000	120.000000000	80.000000000	48.000000000	200.000000000	38.900000000	1.162000000	41.000000000	tested_negative
11.000000000	127.000000000	106.000000000	0.000000000	0.000000000	39.000000000	0.190000000	51.000000000	tested_negative
3.000000000	80.000000000	82.000000000	31.000000000	70.000000000	34.200000000	1.292000000	27.000000000	tested_positive
10.000000000	162.000000000	84.000000000	0.000000000	0.000000000	27.700000000	0.182000000	54.000000000	tested_negative
1.000000000	199.000000000	76.000000000	43.000000000	0.000000000	42.900000000	1.394000000	22.000000000	tested_positive
8.000000000	167.000000000	106.000000000	46.000000000	231.000000000	37.600000000	0.165000000	43.000000000	tested_positive
9.000000000	145.000000000	80.000000000	46.000000000	130.000000000	37.900000000	0.637000000	40.000000000	tested_positive
6.000000000	115.000000000	60.000000000	39.000000000	0.000000000	33.700000000	0.245000000	40.000000000	tested_positive
1.000000000	112.000000000	80.000000000	45.000000000	132.000000000	34.800000000	0.217000000	24.000000000	tested_negative
4.000000000	145.000000000	82.000000000	18.000000000	0.000000000	32.500000000	0.235000000	70.000000000	tested_positive
10.000000000	111.000000000	70.000000000	27.000000000	0.000000000	27.500000000	0.141000000	40.000000000	tested_positive
6.000000000	98.000000000	58.000000000	33.000000000	190.000000000	34.000000000	0.430000000	43.000000000	tested_negative
9.000000000	154.000000000	78.000000000	30.000000000	100.000000000	30.900000000	0.164000000	45.000000000	tested_negative
6.000000000	165.000000000	68.000000000	26.000000000	168.000000000	33.600000000	0.631000000	49.000000000	tested_negative
1.000000000	99.000000000	58.000000000	10.000000000	0.000000000	25.400000000	0.551000000	21.000000000	tested_negative
10.000000000	68.000000000	106.000000000	23.000000000	49.000000000	35.500000000	0.285000000	47.000000000	tested_negative
3.000000000	123.000000000	100.000000000	35.000000000	240.000000000	57.300000000	0.880000000	22.000000000	tested_negative
8.000000000	91.000000000	82.000000000	0.000000000	0.000000000	35.600000000	0.587000000	68.000000000	tested_negative
6.000000000	195.000000000	70.000000000	0.000000000	0.000000000	30.900000000	0.328000000	31.000000000	tested_positive
9.000000000	156.000000000	86.000000000	0.000000000	0.000000000	24.800000000	0.230000000	53.000000000	tested_positive
0.000000000	93.000000000	60.000000000	0.000000000	0.000000000	35.300000000	0.263000000	25.000000000	tested_negative
3.000000000	121.000000000	52.000000000	0.000000000	0.000000000	36.000000000	0.127000000	25.000000000	tested_positive
2.000000000	101.000000000	58.000000000	17.000000000	265.000000000	24.200000000	0.614000000	23.000000000	tested_negative
2.000000000	56.000000000	56.000000000	28.000000000	45.000000000	24.200000000	0.332000000	22.000000000	tested_negative
0.000000000	162.000000000	76.000000000	36.000000000	0.000000000	49.600000000	0.364000000	26.000000000	tested_positive
0.000000000	95.000000000	64.000000000	39.000000000	105.000000000	44.600000000	0.366000000	22.000000000	tested_negative
4.000000000	125.000000000	80.000000000	0.000000000	0.000000000	32.300000000	0.536000000	27.000000000	tested_positive
5.000000000	136.000000000	82.000000000	0.000000000	0.000000000	0.000000000	0.640000000	69.000000000	tested_negative
2.000000000	129.000000000	74.000000000	26.000000000	205.000000000	33.200000000	0.591000000	25.000000000	tested_negative
3.000000000	130.000000000	64.000000000	0.000000000	0.000000000	23.100000000	0.314000000	22.000000000	tested_negative
1.000000000	107.000000000	50.000000000	19.000000000	0.000000000	28.300000000	0.181000000	29.000000000	tested_negative
1.000000000	140.000000000	74.000000000	26.000000000	180.000000000	24.100000000	0.828000000	23.000000000	tested_negative
1.000000000	144.000000000	82.000000000	46.000000000	180.000000000	46.100000000	0.335000000	46.000000000	tested_positive
8.000000000	107.000000000	80.000000000	0.000000000	0.000000000	24.600000000	0.856000000	34.000000000	tested_negative
13.000000000	158.000000000	114.000000000	0.000000000	0.000000000	42.300000000	0.257000000	44.000000000	tested_positive
2.000000000	121.000000000	70.000000000	32.000000000	95.000000000	39.100000000	0.886000000	23.000000000	tested_negative
7.000000000	129.000000000	68.000000000	49.000000000	125.000000000	38.500000000	0.439000000	43.000000000	tested_positive
2.000000000	90.000000000	60.000000000	0.000000000	0.000000000	23.500000000	0.191000000	25.000000000	tested_negative
7.000000000	142.000000000	90.000000000	24.000000000	480.000000000	30.400000000	0.128000000	43.000000000	tested_positive
3.000000000	169.000000000	74.000000000	19.000000000	125.000000000	29.900000000	0.268000000	31.000000000	tested_positive
0.000000000	99.000000000	0.000000000	0.000000000	0.000000000	25.000000000	0.253000000	22.000000000	tested_negative
4.000000000	127.000000000	88.000000000	11.000000000	155.000000000	34.500000000	0.598000000	28.000000000	tested_negative
4.000000000	118.000000000	70.000000000	0.000000000	0.000000000	44.500000000	0.904000000	26.000000000	tested_negative
2.000000000	122.000000000	76.000000000	27.000000000	200.000000000	35.900000000	0.483000000	26.000000000	tested_negative
6.000000000	125.000000000	78.000000000	31.000000000	0.000000000	27.600000000	0.565000000	49.000000000	tested_positive
1.000000000	168.000000000	88.000000000	29.000000000	0.000000000	35.000000000	0.905000000	52.000000000	tested_positive
2.000000000	129.000000000	0.000000000	0.000000000	0.000000000	38.500000000	0.304000000	41.000000000	tested_negative
4.000000000	110.000000000	76.000000000	20.000000000	100.000000000	28.400000000	0.118000000	27.000000000	tested_negative
6.000000000	80.000000000	80.000000000	36.000000000	0.000000000	39.800000000	0.177000000	28.000000000	tested_negative
10.000000000	115.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.261000000	30.000000000	tested_positive
2.000000000	127.000000000	46.000000000	21.000000000	335.000000000	34.400000000	0.176000000	22.000000000	tested_negative
9.000000000	164.000000000	78.000000000	0.000000000	0.000000000	32.800000000	0.148000000	45.000000000	tested_positive
2.000000000	93.000000000	64.000000000	32.000000000	160.000000000	38.000000000	0.674000000	23.000000000	tested_positive
3.000000000	158.000000000	64.000000000	13.000000000	387.000000000	31.200000000	0.295000000	24.000000000	tested_negative
5.000000000	126.000000000	78.000000000	27.000000000	22.000000000	29.600000000	0.439000000	40.000000000	tested_negative
10.000000000	129.000000000	62.000000000	36.000000000	0.000000000	41.200000000	0.441000000	38.000000000	tested_positive
0.000000000	134.000000000	58.000000000	20.000000000	291.000000000	26.400000000	0.352000000	21.000000000	tested_negative
3.000000000	102.000000000	74.000000000	0.000000000	0.000000000	29.500000000	0.121000000	32.000000000	tested_negative
7.000000000	187.000000000	50.000000000	33.000000000	392.000000000	33.900000000	0.826000000	34.000000000	tested_positive
3.000000000	173.000000000	78.000000000	39.000000000	185.000000000	33.800000000	0.970000000	31.000000000	tested_positive
10.000000000	94.000000000	72.000000000	18.000000000	0.000000000	23.100000000	0.595000000	56.000000000	tested_negative
1.000000000	108.000000000	60.000000000	46.000000000	178.000000000	35.500000000	0.415000000	24.000000000	tested_negative
5.000000000	97.000000000	76.000000000	27.000000000	0.000000000	35.600000000	0.378000000	52.000000000	tested_positive
4.000000000	83.000000000	86.000000000	19.000000000	0.000000000	29.300000000	0.317000000	34.000000000	tested_negative
1.000000000	114.000000000	66.000000000	36.000000000	200.000000000	38.100000000	0.289000000	21.000000000	tested_negative
1.000000000	149.000000000	68.000000000	29.000000000	127.000000000	29.300000000	0.349000000	42.000000000	tested_positive
5.000000000	117.000000000	86.000000000	30.000000000	105.000000000	39.100000000	0.251000000	42.000000000	tested_negative
1.000000000	111.000000000	94.000000000	0.000000000	0.000000000	32.800000000	0.265000000	45.000000000	tested_negative
4.000000000	112.000000000	78.000000000	40.000000000	0.000000000	39.400000000	0.236000000	38.000000000	tested_negative
1.000000000	116.000000000	78.000000000	29.000000000	180.000000000	36.100000000	0.496000000	25.000000000	tested_negative
0.000000000	141.000000000	84.000000000	26.000000000	0.000000000	32.400000000	0.433000000	22.000000000	tested_negative
2.000000000	175.000000000	88.000000000	0.000000000	0.000000000	22.900000000	0.326000000	22.000000000	tested_negative
2.000000000	92.000000000	52.000000000	0.000000000	0.000000000	30.100000000	0.141000000	22.000000000	tested_negative
3.000000000	130.000000000	78.000000000	23.000000000	79.000000000	28.400000000	0.323000000	34.000000000	tested_positive
8.000000000	120.000000000	86.000000000	0.000000000	0.000000000	28.400000000	0.259000000	22.000000000	tested_positive
2.000000000	174.000000000	88.000000000	37.000000000	120.000000000	44.500000000	0.646000000	24.000000000	tested_positive
2.000000000	106.000000000	56.000000000	27.000000000	165.000000000	29.000000000	0.426000000	22.000000000	tested_negative
2.000000000	105.000000000	75.000000000	0.000000000	0.000000000	23.300000000	0.560000000	53.000000000	tested_negative
4.000000000	95.000000000	60.000000000	32.000000000	0.000000000	35.400000000	0.284000000	28.000000000	tested_negative
0.000000000	126.000000000	86.000000000	27.000000000	120.000000000	27.400000000	0.515000000	21.000000000	tested_negative
8.000000000	65.000000000	72.000000000	23.000000000	0.000000000	32.000000000	0.600000000	42.000000000	tested_negative
2.000000000	99.000000000	60.000000000	17.000000000	160.000000000	36.600000000	0.453000000	21.000000000	tested_negative
1.000000000	102.000000000	74.000000000	0.000000000	0.000000000	39.500000000	0.293000000	42.000000000	tested_positive
11.000000000	120.000000000	80.000000000	37.000000000	150.000000000	42.300000000	0.785000000	48.000000000	tested_positive
3.000000000	102.000000000	44.000000000	20.000000000	94.000000000	30.800000000	0.400000000	26.000000000	tested_negative
1.000000000	109.000000000	58.000000000	18.000000000	116.000000000	28.500000000	0.219000000	22.000000000	tested_negative
9.000000000	140.000000000	94.000000000	0.000000000	0.000000000	32.700000000	0.734000000	45.000000000	tested_positive
13.000000000	153.000000000	88.000000000	37.000000000	140.000000000	40.600000000	1.174000000	39.000000000	tested_negative
12.000000000	100.000000000	84.000000000	33.000000000	105.000000000	30.000000000	0.488000000	46.000000000	tested_negative
1.000000000	147.000000000	94.000000000	41.000000000	0.000000000	49.300000000	0.358000000	27.000000000	tested_positive
1.000000000	81.000000000	74.000000000	41.000000000	57.000000000	46.300000000	1.096000000	32.000000000	tested_negative
3.000000000	187.000000000	70.000000000	22.000000000	200.000000000	36.400000000	0.408000000	36.000000000	tested_positive
6.000000000	162.000000000	62.000000000	0.000000000	0.000000000	24.300000000	0.178000000	50.000000000	tested_positive
4.000000000	136.000000000	70.000000000	0.000000000	0.000000000	31.200000000	1.182000000	22.000000000	tested_positive
1.000000000	121.000000000	78.000000000	39.000000000	74.000000000	39.000000000	0.261000000	28.000000000	tested_negative
3.000000000	108.000000000	62.000000000	24.000000000	0.000000000	26.000000000	0.223000000	25.000000000	tested_negative
0.000000000	181.000000000	88.000000000	44.000000000	510.000000000	43.300000000	0.222000000	26.000000000	tested_positive
8.000000000	154.000000000	78.000000000	32.000000000	0.000000000	32.400000000	0.443000000	45.000000000	tested_positive
1.000000000	128.000000000	88.000000000	39.000000000	110.000000000	36.500000000	1.057000000	37.000000000	tested_positive
7.000000000	137.000000000	90.000000000	41.000000000	0.000000000	32.000000000	0.391000000	39.000000000	tested_negative
0.000000000	123.000000000	72.000000000	0.000000000	0.000000000	36.300000000	0.258000000	52.000000000	tested_positive
1.000000000	106.000000000	76.000000000	0.000000000	0.000000000	37.500000000	0.197000000	26.000000000	tested_negative
6.000000000	190.000000000	92.000000000	0.000000000	0.000000000	35.500000000	0.278000000	66.000000000	tested_positive
2.000000000	88.000000000	58.000000000	26.000000000	16.000000000	28.400000000	0.766000000	22.000000000	tested_negative
9.000000000	170.000000000	74.000000000	31.000000000	0.000000000	44.000000000	0.403000000	43.000000000	tested_positive
9.000000000	89.000000000	62.000000000	0.000000000	0.000000000	22.500000000	0.142000000	33.000000000	tested_negative
10.000000000	101.000000000	76.000000000	48.000000000	180.000000000	32.900000000	0.171000000	63.000000000	tested_negative
2.000000000	122.000000000	70.000000000	27.000000000	0.000000000	36.800000000	0.340000000	27.000000000	tested_negative
5.000000000	121.000000000	72.000000000	23.000000000	112.000000000	26.200000000	0.245000000	30.000000000	tested_negative
1.000000000	126.000000000	60.000000000	0.000000000	0.000000000	30.100000000	0.349000000	47.000000000	tested_positive
1.000000000	93.000000000	70.000000000	31.000000000	0.000000000	30.400000000	0.315000000	23.000000000	tested_negative
\.


--
-- TOC entry 2206 (class 0 OID 17224)
-- Dependencies: 192
-- Data for Name: glass; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.glass (ri, na, mg, al, si, k, ca, ba, fe, type) FROM stdin;
1.517930000	12.790000000	3.500000000	1.120000000	73.030000000	0.640000000	8.770000000	0.000000000	0.000000000	build wind float
1.516430000	12.160000000	3.520000000	1.350000000	72.890000000	0.570000000	8.530000000	0.000000000	0.000000000	vehic wind float
1.517930000	13.210000000	3.480000000	1.410000000	72.640000000	0.590000000	8.430000000	0.000000000	0.000000000	build wind float
1.512990000	14.400000000	1.740000000	1.540000000	74.550000000	0.000000000	7.590000000	0.000000000	0.000000000	tableware
1.533930000	12.300000000	0.000000000	1.000000000	70.160000000	0.120000000	16.190000000	0.000000000	0.240000000	build wind non-float
1.516550000	12.750000000	2.850000000	1.440000000	73.270000000	0.570000000	8.790000000	0.110000000	0.220000000	build wind non-float
1.517790000	13.640000000	3.650000000	0.650000000	73.000000000	0.060000000	8.930000000	0.000000000	0.000000000	vehic wind float
1.518370000	13.140000000	2.840000000	1.280000000	72.850000000	0.550000000	9.070000000	0.000000000	0.000000000	build wind float
1.515450000	14.140000000	0.000000000	2.680000000	73.390000000	0.080000000	9.070000000	0.610000000	0.050000000	headlamps
1.517890000	13.190000000	3.900000000	1.300000000	72.330000000	0.550000000	8.440000000	0.000000000	0.280000000	build wind non-float
1.516250000	13.360000000	3.580000000	1.490000000	72.720000000	0.450000000	8.210000000	0.000000000	0.000000000	build wind non-float
1.517430000	12.200000000	3.250000000	1.160000000	73.550000000	0.620000000	8.900000000	0.000000000	0.240000000	build wind non-float
1.522230000	13.210000000	3.770000000	0.790000000	71.990000000	0.130000000	10.020000000	0.000000000	0.000000000	build wind float
1.521210000	14.030000000	3.760000000	0.580000000	71.790000000	0.110000000	9.650000000	0.000000000	0.000000000	vehic wind float
1.516650000	13.140000000	3.450000000	1.760000000	72.480000000	0.600000000	8.380000000	0.000000000	0.170000000	vehic wind float
1.517070000	13.480000000	3.480000000	1.710000000	72.520000000	0.620000000	7.990000000	0.000000000	0.000000000	build wind non-float
1.517190000	14.750000000	0.000000000	2.000000000	73.020000000	0.000000000	8.530000000	1.590000000	0.080000000	headlamps
1.516290000	12.710000000	3.330000000	1.490000000	73.280000000	0.670000000	8.240000000	0.000000000	0.000000000	build wind non-float
1.519940000	13.270000000	0.000000000	1.760000000	73.030000000	0.470000000	11.320000000	0.000000000	0.000000000	containers
1.518110000	12.960000000	2.960000000	1.430000000	72.920000000	0.600000000	8.790000000	0.140000000	0.000000000	build wind non-float
1.521520000	13.050000000	3.650000000	0.870000000	72.220000000	0.190000000	9.850000000	0.000000000	0.170000000	build wind float
1.524750000	11.450000000	0.000000000	1.880000000	72.190000000	0.810000000	13.240000000	0.000000000	0.340000000	build wind non-float
1.518410000	12.930000000	3.740000000	1.110000000	72.280000000	0.640000000	8.960000000	0.000000000	0.220000000	build wind non-float
1.517540000	13.390000000	3.660000000	1.190000000	72.790000000	0.570000000	8.270000000	0.000000000	0.110000000	build wind float
1.520580000	12.850000000	1.610000000	2.170000000	72.180000000	0.760000000	9.700000000	0.240000000	0.510000000	containers
1.515690000	13.240000000	3.490000000	1.470000000	73.250000000	0.380000000	8.030000000	0.000000000	0.000000000	build wind non-float
1.515900000	12.820000000	3.520000000	1.900000000	72.860000000	0.690000000	7.970000000	0.000000000	0.000000000	build wind non-float
1.516830000	14.560000000	0.000000000	1.980000000	73.290000000	0.000000000	8.520000000	1.570000000	0.070000000	headlamps
1.516870000	13.230000000	3.540000000	1.480000000	72.840000000	0.560000000	8.100000000	0.000000000	0.000000000	build wind non-float
1.516100000	13.330000000	3.530000000	1.340000000	72.670000000	0.560000000	8.330000000	0.000000000	0.000000000	vehic wind float
1.516740000	12.870000000	3.560000000	1.640000000	73.140000000	0.650000000	7.990000000	0.000000000	0.000000000	build wind non-float
1.518320000	13.330000000	3.340000000	1.540000000	72.140000000	0.560000000	8.990000000	0.000000000	0.000000000	vehic wind float
1.511150000	17.380000000	0.000000000	0.340000000	75.410000000	0.000000000	6.650000000	0.000000000	0.000000000	tableware
1.516450000	13.440000000	3.610000000	1.540000000	72.390000000	0.660000000	8.030000000	0.000000000	0.000000000	build wind non-float
1.517550000	13.000000000	3.600000000	1.360000000	72.990000000	0.570000000	8.400000000	0.000000000	0.110000000	build wind float
1.515710000	12.720000000	3.460000000	1.560000000	73.200000000	0.670000000	8.090000000	0.000000000	0.240000000	build wind float
1.515960000	12.790000000	3.610000000	1.620000000	72.970000000	0.640000000	8.070000000	0.000000000	0.260000000	build wind float
1.517300000	12.350000000	2.720000000	1.630000000	72.870000000	0.700000000	9.230000000	0.000000000	0.000000000	build wind non-float
1.516620000	12.850000000	3.510000000	1.440000000	73.010000000	0.680000000	8.230000000	0.060000000	0.250000000	build wind non-float
1.514090000	14.250000000	3.090000000	2.080000000	72.280000000	1.100000000	7.080000000	0.000000000	0.000000000	build wind non-float
1.517970000	12.740000000	3.480000000	1.350000000	72.960000000	0.640000000	8.680000000	0.000000000	0.000000000	build wind float
1.518060000	13.000000000	3.800000000	1.080000000	73.070000000	0.560000000	8.380000000	0.000000000	0.120000000	build wind non-float
1.516270000	13.000000000	3.580000000	1.540000000	72.830000000	0.610000000	8.040000000	0.000000000	0.000000000	build wind non-float
1.515900000	13.240000000	3.340000000	1.470000000	73.100000000	0.390000000	8.220000000	0.000000000	0.000000000	build wind non-float
1.519340000	13.640000000	3.540000000	0.750000000	72.650000000	0.160000000	8.890000000	0.150000000	0.240000000	vehic wind float
1.517550000	12.710000000	3.420000000	1.200000000	73.200000000	0.590000000	8.640000000	0.000000000	0.000000000	build wind float
1.515140000	14.010000000	2.680000000	3.500000000	69.890000000	1.680000000	5.870000000	2.200000000	0.000000000	containers
1.517660000	13.210000000	3.690000000	1.290000000	72.610000000	0.570000000	8.220000000	0.000000000	0.000000000	build wind float
1.517840000	13.080000000	3.490000000	1.280000000	72.860000000	0.600000000	8.490000000	0.000000000	0.000000000	build wind float
1.521770000	13.200000000	3.680000000	1.150000000	72.750000000	0.540000000	8.520000000	0.000000000	0.000000000	build wind non-float
1.517530000	12.570000000	3.470000000	1.380000000	73.390000000	0.600000000	8.550000000	0.000000000	0.060000000	build wind float
1.518510000	13.200000000	3.630000000	1.070000000	72.830000000	0.570000000	8.410000000	0.090000000	0.170000000	build wind non-float
1.517430000	13.300000000	3.600000000	1.140000000	73.090000000	0.580000000	8.170000000	0.000000000	0.000000000	build wind float
1.515930000	13.090000000	3.590000000	1.520000000	73.100000000	0.670000000	7.830000000	0.000000000	0.000000000	build wind non-float
1.516400000	14.370000000	0.000000000	2.740000000	72.850000000	0.000000000	9.450000000	0.540000000	0.000000000	headlamps
1.517350000	13.020000000	3.540000000	1.690000000	72.730000000	0.540000000	8.440000000	0.000000000	0.070000000	build wind float
1.522470000	14.860000000	2.200000000	2.060000000	70.260000000	0.760000000	9.760000000	0.000000000	0.000000000	headlamps
1.520990000	13.690000000	3.590000000	1.120000000	71.960000000	0.090000000	9.400000000	0.000000000	0.000000000	build wind float
1.517690000	13.650000000	3.660000000	1.110000000	72.770000000	0.110000000	8.600000000	0.000000000	0.000000000	vehic wind float
1.518460000	13.410000000	3.890000000	1.330000000	72.380000000	0.510000000	8.280000000	0.000000000	0.000000000	build wind non-float
1.518480000	13.640000000	3.870000000	1.270000000	71.960000000	0.540000000	8.320000000	0.000000000	0.320000000	build wind non-float
1.519050000	13.600000000	3.620000000	1.110000000	72.640000000	0.140000000	8.760000000	0.000000000	0.000000000	build wind float
1.515670000	13.290000000	3.450000000	1.210000000	72.740000000	0.560000000	8.570000000	0.000000000	0.000000000	build wind float
1.522130000	14.210000000	3.820000000	0.470000000	71.770000000	0.110000000	9.570000000	0.000000000	0.000000000	build wind float
1.523200000	13.720000000	3.720000000	0.510000000	71.750000000	0.090000000	10.060000000	0.000000000	0.160000000	build wind float
1.515560000	13.870000000	0.000000000	2.540000000	73.230000000	0.140000000	9.410000000	0.810000000	0.010000000	headlamps
1.519260000	13.200000000	3.330000000	1.280000000	72.360000000	0.600000000	9.140000000	0.000000000	0.110000000	build wind float
1.522110000	14.190000000	3.780000000	0.910000000	71.360000000	0.230000000	9.140000000	0.000000000	0.370000000	vehic wind float
1.531250000	10.730000000	0.000000000	2.100000000	69.810000000	0.580000000	13.300000000	3.150000000	0.280000000	build wind non-float
1.521520000	13.050000000	3.650000000	0.870000000	72.320000000	0.190000000	9.850000000	0.000000000	0.170000000	build wind float
1.518290000	14.460000000	2.240000000	1.620000000	72.380000000	0.000000000	9.260000000	0.000000000	0.000000000	tableware
1.518920000	13.460000000	3.830000000	1.260000000	72.550000000	0.570000000	8.210000000	0.000000000	0.140000000	build wind non-float
1.518880000	14.990000000	0.780000000	1.740000000	72.500000000	0.000000000	9.950000000	0.000000000	0.000000000	tableware
1.518290000	13.240000000	3.900000000	1.410000000	72.330000000	0.550000000	8.310000000	0.000000000	0.100000000	build wind non-float
1.523000000	13.310000000	3.580000000	0.820000000	71.990000000	0.120000000	10.170000000	0.000000000	0.030000000	build wind float
1.516520000	13.560000000	3.570000000	1.470000000	72.450000000	0.640000000	7.960000000	0.000000000	0.000000000	build wind non-float
1.517680000	12.560000000	3.520000000	1.430000000	73.150000000	0.570000000	8.540000000	0.000000000	0.000000000	build wind float
1.512150000	12.990000000	3.470000000	1.120000000	72.980000000	0.620000000	8.350000000	0.000000000	0.310000000	build wind float
1.516460000	13.040000000	3.400000000	1.260000000	73.010000000	0.520000000	8.580000000	0.000000000	0.000000000	vehic wind float
1.517210000	12.870000000	3.480000000	1.330000000	73.040000000	0.560000000	8.430000000	0.000000000	0.000000000	build wind float
1.517630000	12.800000000	3.660000000	1.270000000	73.010000000	0.600000000	8.560000000	0.000000000	0.000000000	build wind float
1.517420000	13.270000000	3.620000000	1.240000000	73.080000000	0.550000000	8.070000000	0.000000000	0.000000000	build wind float
1.521270000	14.320000000	3.900000000	0.830000000	71.500000000	0.000000000	9.490000000	0.000000000	0.000000000	vehic wind float
1.517790000	13.210000000	3.390000000	1.330000000	72.760000000	0.590000000	8.590000000	0.000000000	0.000000000	build wind float
1.521710000	11.560000000	1.880000000	1.560000000	72.860000000	0.470000000	11.410000000	0.000000000	0.000000000	containers
1.518000000	13.710000000	3.930000000	1.540000000	71.810000000	0.540000000	8.210000000	0.000000000	0.150000000	build wind non-float
1.527770000	12.640000000	0.000000000	0.670000000	72.020000000	0.060000000	14.400000000	0.000000000	0.000000000	build wind non-float
1.517500000	12.820000000	3.550000000	1.490000000	72.750000000	0.540000000	8.520000000	0.000000000	0.190000000	build wind float
1.517640000	12.980000000	3.540000000	1.210000000	73.000000000	0.650000000	8.530000000	0.000000000	0.000000000	build wind float
1.521770000	13.750000000	1.010000000	1.360000000	72.190000000	0.330000000	11.140000000	0.000000000	0.000000000	build wind non-float
1.516450000	14.940000000	0.000000000	1.870000000	73.110000000	0.000000000	8.670000000	1.380000000	0.000000000	headlamps
1.517860000	12.730000000	3.430000000	1.190000000	72.950000000	0.620000000	8.760000000	0.000000000	0.300000000	build wind float
1.521520000	13.120000000	3.580000000	0.900000000	72.200000000	0.230000000	9.820000000	0.000000000	0.160000000	build wind float
1.519370000	13.790000000	2.410000000	1.190000000	72.760000000	0.000000000	9.770000000	0.000000000	0.000000000	tableware
1.515140000	14.850000000	0.000000000	2.420000000	73.720000000	0.000000000	8.390000000	0.560000000	0.000000000	headlamps
1.521720000	13.480000000	3.740000000	0.900000000	72.010000000	0.180000000	9.610000000	0.000000000	0.070000000	build wind float
1.517320000	14.950000000	0.000000000	1.800000000	72.990000000	0.000000000	8.610000000	1.550000000	0.000000000	headlamps
1.520200000	13.980000000	1.350000000	1.630000000	71.760000000	0.390000000	10.560000000	0.000000000	0.180000000	build wind non-float
1.516050000	12.900000000	3.440000000	1.450000000	73.060000000	0.440000000	8.270000000	0.000000000	0.000000000	build wind non-float
1.518470000	13.100000000	3.970000000	1.190000000	72.440000000	0.600000000	8.430000000	0.000000000	0.000000000	build wind non-float
1.517610000	13.890000000	3.600000000	1.360000000	72.730000000	0.480000000	7.830000000	0.000000000	0.000000000	build wind float
1.516730000	13.300000000	3.640000000	1.530000000	72.530000000	0.650000000	8.030000000	0.000000000	0.290000000	build wind non-float
1.523650000	15.790000000	1.830000000	1.310000000	70.430000000	0.310000000	8.610000000	1.680000000	0.000000000	headlamps
1.516850000	14.920000000	0.000000000	1.990000000	73.060000000	0.000000000	8.400000000	1.590000000	0.000000000	headlamps
1.516580000	14.800000000	0.000000000	1.990000000	73.110000000	0.000000000	8.280000000	1.710000000	0.000000000	headlamps
1.513160000	13.020000000	0.000000000	3.040000000	70.480000000	6.210000000	6.960000000	0.000000000	0.000000000	containers
1.517090000	13.000000000	3.470000000	1.790000000	72.720000000	0.660000000	8.180000000	0.000000000	0.000000000	build wind non-float
1.517270000	14.700000000	0.000000000	2.340000000	73.280000000	0.000000000	8.950000000	0.660000000	0.000000000	headlamps
1.518980000	13.580000000	3.350000000	1.230000000	72.080000000	0.590000000	8.910000000	0.000000000	0.000000000	build wind float
1.519690000	12.640000000	0.000000000	1.650000000	73.750000000	0.380000000	11.530000000	0.000000000	0.000000000	containers
1.518200000	12.620000000	2.760000000	0.830000000	73.810000000	0.350000000	9.420000000	0.000000000	0.200000000	build wind non-float
1.516170000	14.950000000	0.000000000	2.270000000	73.300000000	0.000000000	8.710000000	0.670000000	0.000000000	headlamps
1.519110000	13.900000000	3.730000000	1.180000000	72.120000000	0.060000000	8.890000000	0.000000000	0.000000000	build wind float
1.516510000	14.380000000	0.000000000	1.940000000	73.610000000	0.000000000	8.480000000	1.570000000	0.000000000	headlamps
1.516940000	12.860000000	3.580000000	1.310000000	72.610000000	0.610000000	8.790000000	0.000000000	0.000000000	vehic wind float
1.523150000	13.440000000	3.340000000	1.230000000	72.380000000	0.600000000	8.830000000	0.000000000	0.000000000	headlamps
1.520680000	13.550000000	2.090000000	1.670000000	72.180000000	0.530000000	9.570000000	0.270000000	0.170000000	build wind non-float
1.518380000	14.320000000	3.260000000	2.220000000	71.250000000	1.460000000	5.790000000	1.630000000	0.000000000	headlamps
1.518180000	13.720000000	0.000000000	0.560000000	74.450000000	0.000000000	10.990000000	0.000000000	0.000000000	build wind non-float
1.517690000	12.450000000	2.710000000	1.290000000	73.700000000	0.560000000	9.060000000	0.000000000	0.240000000	build wind float
1.516600000	12.990000000	3.180000000	1.230000000	72.970000000	0.580000000	8.810000000	0.000000000	0.240000000	build wind non-float
1.515890000	12.880000000	3.430000000	1.400000000	73.280000000	0.690000000	8.050000000	0.000000000	0.240000000	build wind float
1.524100000	13.830000000	2.900000000	1.170000000	71.150000000	0.080000000	10.790000000	0.000000000	0.000000000	build wind non-float
1.527250000	13.800000000	3.150000000	0.660000000	70.570000000	0.080000000	11.640000000	0.000000000	0.000000000	build wind non-float
1.521190000	12.970000000	0.330000000	1.510000000	73.390000000	0.130000000	11.270000000	0.000000000	0.280000000	containers
1.517480000	12.860000000	3.560000000	1.270000000	73.210000000	0.540000000	8.380000000	0.000000000	0.170000000	build wind float
1.516530000	11.950000000	0.000000000	1.190000000	75.180000000	2.700000000	8.930000000	0.000000000	0.000000000	headlamps
1.516230000	14.140000000	0.000000000	2.880000000	72.610000000	0.080000000	9.180000000	1.060000000	0.000000000	headlamps
1.521010000	13.640000000	4.490000000	1.100000000	71.780000000	0.060000000	8.750000000	0.000000000	0.000000000	build wind float
1.517630000	12.610000000	3.590000000	1.310000000	73.290000000	0.580000000	8.500000000	0.000000000	0.000000000	build wind float
1.515960000	13.020000000	3.560000000	1.540000000	73.110000000	0.720000000	7.900000000	0.000000000	0.000000000	build wind non-float
1.516740000	12.790000000	3.520000000	1.540000000	73.360000000	0.660000000	7.900000000	0.000000000	0.000000000	build wind non-float
1.520650000	14.360000000	0.000000000	2.020000000	73.420000000	0.000000000	8.440000000	1.640000000	0.000000000	headlamps
1.517680000	12.650000000	3.560000000	1.300000000	73.080000000	0.610000000	8.690000000	0.000000000	0.140000000	build wind float
1.523690000	13.440000000	0.000000000	1.580000000	72.220000000	0.320000000	12.240000000	0.000000000	0.000000000	containers
1.517560000	13.150000000	3.610000000	1.050000000	73.240000000	0.570000000	8.240000000	0.000000000	0.000000000	build wind float
1.517540000	13.480000000	3.740000000	1.170000000	72.990000000	0.590000000	8.030000000	0.000000000	0.000000000	build wind float
1.517110000	12.890000000	3.620000000	1.570000000	72.960000000	0.610000000	8.110000000	0.000000000	0.000000000	build wind non-float
1.522100000	13.730000000	3.840000000	0.720000000	71.760000000	0.170000000	9.740000000	0.000000000	0.000000000	build wind float
1.515940000	13.090000000	3.520000000	1.550000000	72.870000000	0.680000000	8.050000000	0.000000000	0.090000000	build wind non-float
1.517840000	12.680000000	3.670000000	1.160000000	73.110000000	0.610000000	8.700000000	0.000000000	0.000000000	build wind float
1.519090000	13.890000000	3.530000000	1.320000000	71.810000000	0.510000000	8.780000000	0.110000000	0.000000000	build wind float
1.519770000	13.810000000	3.580000000	1.320000000	71.720000000	0.120000000	8.670000000	0.690000000	0.000000000	build wind float
1.516660000	12.860000000	0.000000000	1.830000000	73.880000000	0.970000000	10.170000000	0.000000000	0.000000000	containers
1.516310000	13.340000000	3.570000000	1.570000000	72.870000000	0.610000000	7.890000000	0.000000000	0.000000000	build wind non-float
1.518720000	12.930000000	3.660000000	1.560000000	72.510000000	0.580000000	8.550000000	0.000000000	0.120000000	build wind non-float
1.517080000	13.720000000	3.680000000	1.810000000	72.060000000	0.640000000	7.880000000	0.000000000	0.000000000	build wind non-float
1.520810000	13.780000000	2.280000000	1.430000000	71.990000000	0.490000000	9.850000000	0.000000000	0.170000000	build wind non-float
1.515740000	14.860000000	3.670000000	1.740000000	71.870000000	0.160000000	7.360000000	0.000000000	0.120000000	build wind non-float
1.518130000	13.430000000	3.980000000	1.180000000	72.490000000	0.580000000	8.150000000	0.000000000	0.000000000	build wind non-float
1.511310000	13.690000000	3.200000000	1.810000000	72.810000000	1.760000000	5.430000000	1.190000000	0.000000000	headlamps
1.522270000	14.170000000	3.810000000	0.780000000	71.350000000	0.000000000	9.690000000	0.000000000	0.000000000	build wind float
1.526140000	13.700000000	0.000000000	1.360000000	71.240000000	0.190000000	13.440000000	0.000000000	0.100000000	build wind non-float
1.518110000	13.330000000	3.850000000	1.250000000	72.780000000	0.520000000	8.120000000	0.000000000	0.000000000	build wind non-float
1.516550000	13.410000000	3.390000000	1.280000000	72.640000000	0.520000000	8.650000000	0.000000000	0.000000000	vehic wind float
1.517510000	12.810000000	3.570000000	1.350000000	73.020000000	0.620000000	8.590000000	0.000000000	0.000000000	build wind float
1.515080000	15.150000000	0.000000000	2.250000000	73.500000000	0.000000000	8.340000000	0.630000000	0.000000000	headlamps
1.519150000	12.730000000	1.850000000	1.860000000	72.690000000	0.600000000	10.090000000	0.000000000	0.000000000	containers
1.519660000	14.770000000	3.750000000	0.290000000	72.020000000	0.030000000	9.000000000	0.000000000	0.000000000	build wind float
1.518440000	13.250000000	3.760000000	1.320000000	72.400000000	0.580000000	8.420000000	0.000000000	0.000000000	build wind non-float
1.526640000	11.230000000	0.000000000	0.770000000	73.210000000	0.000000000	14.680000000	0.000000000	0.000000000	build wind non-float
1.521720000	13.510000000	3.860000000	0.880000000	71.790000000	0.230000000	9.540000000	0.000000000	0.110000000	build wind float
1.516020000	14.850000000	0.000000000	2.380000000	73.280000000	0.000000000	8.760000000	0.640000000	0.090000000	headlamps
1.513210000	13.000000000	0.000000000	3.020000000	70.700000000	6.210000000	6.930000000	0.000000000	0.000000000	containers
1.527390000	11.020000000	0.000000000	0.750000000	73.080000000	0.000000000	14.960000000	0.000000000	0.000000000	build wind non-float
1.522130000	14.210000000	3.820000000	0.470000000	71.770000000	0.110000000	9.570000000	0.000000000	0.000000000	build wind float
1.517470000	12.840000000	3.500000000	1.140000000	73.270000000	0.560000000	8.550000000	0.000000000	0.000000000	build wind float
1.518390000	12.850000000	3.670000000	1.240000000	72.570000000	0.620000000	8.680000000	0.000000000	0.350000000	build wind non-float
1.516460000	13.410000000	3.550000000	1.250000000	72.810000000	0.680000000	8.100000000	0.000000000	0.000000000	build wind non-float
1.516090000	15.010000000	0.000000000	2.510000000	73.050000000	0.050000000	8.830000000	0.530000000	0.000000000	headlamps
1.516670000	12.940000000	3.610000000	1.260000000	72.750000000	0.560000000	8.600000000	0.000000000	0.000000000	build wind non-float
1.515880000	13.120000000	3.410000000	1.580000000	73.260000000	0.070000000	8.390000000	0.000000000	0.190000000	build wind non-float
1.526670000	13.990000000	3.700000000	0.710000000	71.570000000	0.020000000	9.820000000	0.000000000	0.100000000	build wind float
1.518310000	14.390000000	0.000000000	1.820000000	72.860000000	1.410000000	6.470000000	2.880000000	0.000000000	headlamps
1.519180000	14.040000000	3.580000000	1.370000000	72.080000000	0.560000000	8.300000000	0.000000000	0.000000000	build wind float
1.516130000	13.880000000	1.780000000	1.790000000	73.100000000	0.000000000	8.670000000	0.760000000	0.000000000	headlamps
1.521960000	14.360000000	3.850000000	0.890000000	71.360000000	0.150000000	9.150000000	0.000000000	0.000000000	build wind float
1.518240000	12.870000000	3.480000000	1.290000000	72.950000000	0.600000000	8.430000000	0.000000000	0.000000000	build wind float
1.521510000	11.030000000	1.710000000	1.560000000	73.440000000	0.580000000	11.620000000	0.000000000	0.000000000	containers
1.519690000	14.560000000	0.000000000	0.560000000	73.480000000	0.000000000	11.220000000	0.000000000	0.000000000	tableware
1.516180000	13.010000000	3.500000000	1.480000000	72.890000000	0.600000000	8.120000000	0.000000000	0.000000000	build wind non-float
1.516450000	13.400000000	3.490000000	1.520000000	72.650000000	0.670000000	8.080000000	0.000000000	0.100000000	build wind non-float
1.517960000	13.500000000	3.360000000	1.630000000	71.940000000	0.570000000	8.810000000	0.000000000	0.090000000	vehic wind float
1.522220000	14.430000000	0.000000000	1.000000000	72.670000000	0.100000000	11.520000000	0.000000000	0.080000000	build wind non-float
1.517830000	12.690000000	3.540000000	1.340000000	72.950000000	0.570000000	8.750000000	0.000000000	0.000000000	build wind float
1.517110000	14.230000000	0.000000000	2.080000000	73.360000000	0.000000000	8.620000000	1.670000000	0.000000000	headlamps
1.517360000	12.780000000	3.620000000	1.290000000	72.790000000	0.590000000	8.700000000	0.000000000	0.000000000	build wind float
1.518080000	13.430000000	2.870000000	1.190000000	72.840000000	0.550000000	9.030000000	0.000000000	0.000000000	build wind float
1.516700000	13.240000000	3.570000000	1.380000000	72.700000000	0.560000000	8.440000000	0.000000000	0.100000000	vehic wind float
1.520430000	13.380000000	0.000000000	1.400000000	72.250000000	0.330000000	12.500000000	0.000000000	0.000000000	containers
1.519000000	13.490000000	3.480000000	1.350000000	71.950000000	0.550000000	9.000000000	0.000000000	0.000000000	build wind float
1.517780000	13.210000000	2.810000000	1.290000000	72.980000000	0.510000000	9.020000000	0.000000000	0.090000000	build wind float
1.519050000	14.000000000	2.390000000	1.560000000	72.370000000	0.000000000	9.570000000	0.000000000	0.000000000	tableware
1.515310000	14.380000000	0.000000000	2.660000000	73.100000000	0.040000000	9.080000000	0.640000000	0.000000000	headlamps
1.519160000	14.150000000	0.000000000	2.090000000	72.740000000	0.000000000	10.880000000	0.000000000	0.000000000	tableware
1.518410000	13.020000000	3.620000000	1.060000000	72.340000000	0.640000000	9.130000000	0.000000000	0.150000000	build wind non-float
1.515900000	13.020000000	3.580000000	1.510000000	73.120000000	0.690000000	7.960000000	0.000000000	0.000000000	build wind non-float
1.515930000	13.250000000	3.450000000	1.430000000	73.170000000	0.610000000	7.860000000	0.000000000	0.000000000	build wind non-float
1.516400000	12.550000000	3.480000000	1.870000000	73.230000000	0.630000000	8.080000000	0.000000000	0.090000000	build wind non-float
1.516630000	12.930000000	3.540000000	1.620000000	72.960000000	0.640000000	8.030000000	0.000000000	0.210000000	build wind non-float
1.516900000	13.330000000	3.540000000	1.610000000	72.540000000	0.680000000	8.110000000	0.000000000	0.000000000	build wind non-float
1.518690000	13.190000000	3.370000000	1.180000000	72.720000000	0.570000000	8.830000000	0.000000000	0.160000000	build wind float
1.517760000	13.530000000	3.410000000	1.520000000	72.040000000	0.580000000	8.790000000	0.000000000	0.000000000	vehic wind float
1.517750000	12.850000000	3.480000000	1.230000000	72.970000000	0.610000000	8.560000000	0.090000000	0.220000000	build wind float
1.518600000	13.360000000	3.430000000	1.430000000	72.260000000	0.510000000	8.600000000	0.000000000	0.000000000	build wind non-float
1.517200000	13.380000000	3.500000000	1.150000000	72.850000000	0.500000000	8.430000000	0.000000000	0.000000000	build wind float
1.516230000	14.200000000	0.000000000	2.790000000	73.460000000	0.040000000	9.040000000	0.400000000	0.090000000	headlamps
1.516180000	13.530000000	3.550000000	1.540000000	72.990000000	0.390000000	7.780000000	0.000000000	0.000000000	build wind float
1.517610000	12.810000000	3.540000000	1.230000000	73.240000000	0.580000000	8.390000000	0.000000000	0.000000000	build wind float
1.516100000	13.420000000	3.400000000	1.220000000	72.690000000	0.590000000	8.320000000	0.000000000	0.000000000	vehic wind float
1.515920000	12.860000000	3.520000000	2.120000000	72.660000000	0.690000000	7.970000000	0.000000000	0.000000000	build wind non-float
1.516130000	13.920000000	3.520000000	1.250000000	72.880000000	0.370000000	7.940000000	0.000000000	0.140000000	build wind non-float
1.516890000	12.670000000	2.880000000	1.710000000	73.210000000	0.730000000	8.540000000	0.000000000	0.000000000	build wind non-float
1.518520000	14.090000000	2.190000000	1.660000000	72.670000000	0.000000000	9.320000000	0.000000000	0.000000000	tableware
\.


--
-- TOC entry 2208 (class 0 OID 17229)
-- Dependencies: 194
-- Data for Name: instances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instances (id, table_name, num_instances, num_attributes, creation_date, created_by) FROM stdin;
1	glass	214	10	2021-02-16 19:44:21.554729	admin
2	credit	1000	21	2021-02-16 19:44:31.586232	admin
3	soybean	683	36	2021-02-16 19:44:37.392031	admin
4	iris	150	5	2021-02-16 19:44:47.979272	admin
5	ionosphere	351	35	2021-02-16 19:45:00.510652	admin
6	diabetes	768	9	2021-02-16 19:45:09.502851	admin
\.


--
-- TOC entry 2209 (class 0 OID 17235)
-- Dependencies: 195
-- Data for Name: ionosphere; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ionosphere (a01, a02, a03, a04, a05, a06, a07, a08, a09, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, a30, a31, a32, a33, a34, class) FROM stdin;
1.000000000	0.000000000	0.995390000	-0.058890000	0.852430000	0.023060000	0.833980000	-0.377080000	1.000000000	0.037600000	0.852430000	-0.177550000	0.597550000	-0.449450000	0.605360000	-0.382230000	0.843560000	-0.385420000	0.582120000	-0.321920000	0.569710000	-0.296740000	0.369460000	-0.473570000	0.568110000	-0.511710000	0.410780000	-0.461680000	0.212660000	-0.340900000	0.422670000	-0.544870000	0.186410000	-0.453000000	g
1.000000000	0.000000000	1.000000000	-0.188290000	0.930350000	-0.361560000	-0.108680000	-0.935970000	1.000000000	-0.045490000	0.508740000	-0.677430000	0.344320000	-0.697070000	-0.516850000	-0.975150000	0.054990000	-0.622370000	0.331090000	-1.000000000	-0.131510000	-0.453000000	-0.180560000	-0.357340000	-0.203320000	-0.265690000	-0.204680000	-0.184010000	-0.190400000	-0.115930000	-0.166260000	-0.062880000	-0.137380000	-0.024470000	b
1.000000000	0.000000000	1.000000000	-0.033650000	1.000000000	0.004850000	1.000000000	-0.120620000	0.889650000	0.011980000	0.730820000	0.053460000	0.854430000	0.008270000	0.545910000	0.002990000	0.837750000	-0.136440000	0.755350000	-0.085400000	0.708870000	-0.275020000	0.433850000	-0.120620000	0.575280000	-0.402200000	0.589840000	-0.221450000	0.431000000	-0.173650000	0.604360000	-0.241800000	0.560450000	-0.382380000	g
1.000000000	0.000000000	1.000000000	-0.451610000	1.000000000	1.000000000	0.712160000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	0.145160000	0.540940000	-0.393300000	-1.000000000	-0.544670000	-0.699750000	1.000000000	0.000000000	0.000000000	1.000000000	0.906950000	0.516130000	1.000000000	1.000000000	-0.200990000	0.256820000	1.000000000	-0.323820000	1.000000000	b
1.000000000	0.000000000	1.000000000	-0.024010000	0.941400000	0.065310000	0.921060000	-0.232550000	0.771520000	-0.163990000	0.527980000	-0.202750000	0.564090000	-0.007120000	0.343950000	-0.274570000	0.529400000	-0.217800000	0.451070000	-0.178130000	0.059820000	-0.355750000	0.023090000	-0.528790000	0.032860000	-0.651580000	0.132900000	-0.532060000	0.024310000	-0.621970000	-0.057070000	-0.595730000	-0.046080000	-0.656970000	g
1.000000000	0.000000000	0.023370000	-0.005920000	-0.099240000	-0.119490000	-0.007630000	-0.118240000	0.147060000	0.066370000	0.037860000	-0.063020000	0.000000000	0.000000000	-0.045720000	-0.155400000	-0.003430000	-0.101960000	-0.115750000	-0.054140000	0.018380000	0.036690000	0.015190000	0.008880000	0.035130000	-0.015350000	-0.032400000	0.092230000	-0.078590000	0.007320000	0.000000000	0.000000000	-0.000390000	0.120110000	b
1.000000000	0.000000000	0.975880000	-0.106020000	0.946010000	-0.208000000	0.928060000	-0.283500000	0.859960000	-0.273420000	0.797660000	-0.479290000	0.782250000	-0.507640000	0.746280000	-0.614360000	0.579450000	-0.680860000	0.378520000	-0.736410000	0.363240000	-0.765620000	0.318980000	-0.797530000	0.227920000	-0.816340000	0.136590000	-0.825100000	0.046060000	-0.823950000	-0.042620000	-0.813180000	-0.138320000	-0.809750000	g
0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.963550000	-0.071980000	1.000000000	-0.143330000	1.000000000	-0.213130000	1.000000000	-0.361740000	0.925700000	-0.435690000	0.945100000	-0.406680000	0.903920000	-0.463810000	0.983050000	-0.352570000	0.845370000	-0.660200000	0.753460000	-0.605890000	0.696370000	-0.642250000	0.851060000	-0.654400000	0.575770000	-0.697120000	0.254350000	-0.639190000	0.451140000	-0.727790000	0.388950000	-0.734200000	g
1.000000000	0.000000000	-0.018640000	-0.084590000	0.000000000	0.000000000	0.000000000	0.000000000	0.114700000	-0.268100000	-0.456630000	-0.381720000	0.000000000	0.000000000	-0.336560000	0.386020000	-0.371330000	0.150180000	0.637280000	0.221150000	0.000000000	0.000000000	0.000000000	0.000000000	-0.148030000	-0.013260000	0.206450000	-0.022940000	0.000000000	0.000000000	0.165950000	0.240860000	-0.082080000	0.380650000	b
1.000000000	0.000000000	1.000000000	0.066550000	1.000000000	-0.183880000	1.000000000	-0.273200000	1.000000000	-0.431070000	1.000000000	-0.413490000	0.962320000	-0.518740000	0.907110000	-0.590170000	0.892300000	-0.664740000	0.698760000	-0.709970000	0.706450000	-0.763200000	0.630810000	-0.805440000	0.558670000	-0.891280000	0.472110000	-0.865000000	0.403030000	-0.836750000	0.309960000	-0.890930000	0.229950000	-0.891580000	g
1.000000000	0.000000000	1.000000000	-0.542100000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	0.362170000	1.000000000	-0.411190000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-0.293540000	1.000000000	-0.935990000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-0.408880000	1.000000000	-0.627450000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	b
1.000000000	0.000000000	1.000000000	-0.163160000	1.000000000	-0.101690000	0.999990000	-0.151970000	1.000000000	-0.192770000	0.940550000	-0.351510000	0.957350000	-0.297850000	0.937190000	-0.344120000	0.944860000	-0.281060000	0.901370000	-0.433830000	0.860430000	-0.473080000	0.829870000	-0.512200000	0.840800000	-0.471370000	0.762240000	-0.583700000	0.657230000	-0.687940000	0.687140000	-0.645370000	0.647270000	-0.672260000	g
1.000000000	0.000000000	1.000000000	-0.867010000	1.000000000	0.222800000	0.854920000	-0.398960000	1.000000000	-0.120900000	1.000000000	0.351470000	1.000000000	0.077720000	1.000000000	-0.147670000	1.000000000	-1.000000000	1.000000000	-1.000000000	0.618310000	0.158030000	1.000000000	0.623490000	1.000000000	-0.170120000	1.000000000	0.359240000	1.000000000	-0.664940000	1.000000000	0.884280000	1.000000000	-0.188260000	b
1.000000000	0.000000000	1.000000000	0.073800000	1.000000000	0.034200000	1.000000000	-0.055630000	1.000000000	0.087640000	1.000000000	0.196510000	1.000000000	0.203280000	1.000000000	0.127850000	1.000000000	0.105610000	1.000000000	0.270870000	1.000000000	0.447580000	1.000000000	0.417500000	1.000000000	0.200330000	1.000000000	0.367430000	0.956030000	0.486410000	1.000000000	0.324920000	1.000000000	0.467120000	g
1.000000000	0.000000000	0.509320000	-0.939960000	1.000000000	0.267080000	-0.035200000	-1.000000000	1.000000000	-1.000000000	0.436850000	-1.000000000	0.000000000	0.000000000	-1.000000000	-0.342650000	-0.376810000	0.036230000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-0.162530000	0.922360000	0.397520000	0.265010000	0.000000000	0.000000000	1.000000000	0.231880000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.996450000	0.064680000	1.000000000	-0.012360000	0.978110000	0.024980000	0.961120000	0.023120000	0.992740000	0.078080000	0.893230000	0.103460000	0.942120000	0.052690000	0.888090000	0.111200000	0.861040000	0.086310000	0.816330000	0.118300000	0.836680000	0.144420000	0.813290000	0.134120000	0.794760000	0.136380000	0.791100000	0.153790000	0.771220000	0.159300000	0.709410000	0.120150000	g
0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	b
1.000000000	0.000000000	0.670650000	0.025280000	0.666260000	0.050310000	0.571970000	0.187610000	0.087760000	0.340810000	0.636210000	0.121310000	0.620990000	0.142850000	0.786370000	0.109760000	0.583730000	0.181510000	0.143950000	0.412240000	0.538880000	0.213260000	0.514200000	0.226250000	0.488380000	0.237240000	0.461670000	0.246180000	0.434330000	0.253060000	0.406630000	0.257920000	1.000000000	0.330360000	g
0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	-0.718750000	1.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	0.562500000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	b
1.000000000	0.000000000	1.000000000	-0.006120000	1.000000000	-0.098340000	1.000000000	-0.076490000	1.000000000	-0.106050000	1.000000000	-0.110730000	1.000000000	-0.394890000	1.000000000	-0.156160000	0.921240000	-0.318840000	0.864730000	-0.345340000	0.916930000	-0.440720000	0.960600000	-0.468660000	0.818740000	-0.403720000	0.826810000	-0.422310000	0.757840000	-0.382310000	0.804480000	-0.405750000	0.743540000	-0.450390000	g
0.000000000	0.000000000	1.000000000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	b
1.000000000	0.000000000	0.960710000	0.070880000	1.000000000	0.042960000	1.000000000	0.093130000	0.901690000	-0.051440000	0.892630000	0.025800000	0.832500000	-0.061420000	0.875340000	0.098310000	0.765440000	0.002800000	0.752060000	-0.052950000	0.659610000	-0.079050000	0.641580000	-0.059290000	0.556770000	-0.077050000	0.580510000	-0.022050000	0.496640000	-0.012510000	0.513100000	-0.000150000	0.520990000	-0.001820000	g
0.000000000	0.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	-0.061820000	1.000000000	0.029420000	1.000000000	-0.051310000	1.000000000	-0.017070000	1.000000000	-0.117260000	0.844930000	-0.052020000	0.933920000	-0.065980000	0.691700000	-0.073790000	0.657310000	-0.203670000	0.949100000	-0.315580000	0.808520000	-0.316540000	0.849320000	-0.348380000	0.725290000	-0.291740000	0.730940000	-0.385760000	0.543560000	-0.262840000	0.642070000	-0.394870000	g
1.000000000	0.000000000	1.000000000	0.578200000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-0.627960000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	b
1.000000000	0.000000000	1.000000000	-0.087140000	1.000000000	-0.172630000	0.866350000	-0.817790000	0.948170000	0.610530000	0.954730000	-0.413820000	0.884860000	-0.317360000	0.879370000	-0.234330000	0.810510000	-0.621800000	0.122450000	-1.000000000	0.902840000	0.110530000	0.623570000	-0.785470000	0.553890000	-0.828680000	0.481360000	-0.865830000	0.406500000	-0.896740000	0.329840000	-0.921280000	-0.133410000	-1.000000000	g
0.000000000	0.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	-0.375000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	b
1.000000000	0.000000000	1.000000000	0.083800000	1.000000000	0.173870000	1.000000000	-0.133080000	0.981720000	0.645200000	1.000000000	0.479040000	1.000000000	0.591130000	1.000000000	0.707580000	1.000000000	0.827770000	1.000000000	0.950990000	1.000000000	1.000000000	0.980420000	1.000000000	0.916240000	1.000000000	0.838990000	1.000000000	0.748220000	1.000000000	0.643580000	1.000000000	0.524790000	1.000000000	g
0.000000000	0.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	b
1.000000000	0.000000000	1.000000000	-0.142360000	1.000000000	-0.162560000	1.000000000	-0.236560000	1.000000000	-0.075140000	1.000000000	-0.250100000	1.000000000	-0.261610000	1.000000000	-0.219750000	1.000000000	-0.386060000	1.000000000	-0.461620000	1.000000000	-0.355190000	1.000000000	-0.596610000	1.000000000	-0.476430000	0.988200000	-0.496870000	1.000000000	-0.758200000	1.000000000	-0.757610000	1.000000000	-0.844370000	g
1.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-0.018400000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-0.855830000	1.000000000	1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	-0.791410000	1.000000000	1.000000000	1.000000000	1.000000000	b
1.000000000	0.000000000	0.882080000	-0.146390000	0.934080000	-0.110570000	0.921000000	-0.164500000	0.883070000	-0.170360000	0.884620000	-0.318090000	0.852690000	-0.314630000	0.821160000	-0.359240000	0.806810000	-0.336320000	0.752430000	-0.470220000	0.705550000	-0.471530000	0.661500000	-0.500850000	0.612970000	-0.480860000	0.568040000	-0.546290000	0.501790000	-0.598540000	0.470750000	-0.573770000	0.421890000	-0.580860000	g
1.000000000	0.000000000	0.712530000	-0.025950000	0.412870000	-0.230670000	0.980190000	-0.094730000	0.997090000	-0.102360000	1.000000000	-0.109510000	0.589650000	1.000000000	0.837260000	-1.000000000	0.822700000	-0.178630000	0.807600000	-0.282570000	-0.259140000	0.927300000	0.519330000	0.054560000	0.654930000	-0.203920000	0.931240000	-0.413070000	0.638110000	-0.219010000	0.861360000	-0.873540000	-0.231860000	-1.000000000	b
1.000000000	0.000000000	1.000000000	-0.158990000	0.723140000	0.276860000	0.834430000	-0.583880000	1.000000000	-0.282070000	1.000000000	-0.498630000	0.799620000	-0.125270000	0.768370000	0.146380000	1.000000000	0.393370000	1.000000000	0.265900000	0.963540000	-0.018910000	0.925990000	-0.913380000	1.000000000	0.148030000	1.000000000	-0.115820000	1.000000000	-0.111290000	1.000000000	0.533720000	1.000000000	-0.577580000	g
0.000000000	0.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	0.500000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.661610000	-1.000000000	1.000000000	1.000000000	1.000000000	-0.673210000	0.808930000	-0.404460000	1.000000000	-1.000000000	1.000000000	-0.893750000	1.000000000	0.733930000	0.175890000	0.709820000	1.000000000	0.780360000	1.000000000	0.852680000	1.000000000	-1.000000000	1.000000000	0.853570000	1.000000000	-0.085710000	0.959820000	-0.362500000	1.000000000	0.652680000	1.000000000	0.347320000	b
1.000000000	0.000000000	1.000000000	0.004330000	1.000000000	-0.012090000	1.000000000	-0.029600000	1.000000000	-0.070140000	0.978390000	-0.062560000	1.000000000	-0.065440000	0.972610000	-0.079170000	0.925610000	-0.136650000	0.941840000	-0.143270000	0.995890000	-0.142480000	0.948150000	-0.135650000	0.894690000	-0.208510000	0.890670000	-0.179090000	0.856440000	-0.185520000	0.837770000	-0.201010000	0.838670000	-0.207660000	g
0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.912410000	0.043470000	0.941910000	0.022800000	0.947050000	0.053450000	0.935820000	0.013210000	0.919110000	0.063480000	0.927660000	0.120670000	0.920480000	0.062110000	0.888990000	0.127220000	0.837440000	0.144390000	0.809830000	0.118490000	0.770410000	0.142220000	0.757550000	0.112990000	0.735500000	0.132820000	0.663870000	0.153000000	0.709250000	0.107540000	0.652580000	0.114470000	g
1.000000000	0.000000000	1.000000000	0.024610000	0.996720000	0.048610000	0.975450000	0.071430000	0.617450000	-1.000000000	0.910360000	0.111470000	0.884620000	0.536400000	0.820770000	0.141370000	0.769290000	0.151890000	1.000000000	0.410030000	0.658500000	0.163710000	0.601380000	0.165160000	0.544460000	0.163900000	0.488670000	0.160190000	0.434810000	0.154360000	0.383520000	0.146770000	1.000000000	1.000000000	b
1.000000000	0.000000000	1.000000000	0.065380000	1.000000000	0.207460000	1.000000000	0.262810000	0.930510000	0.322130000	0.867730000	0.390390000	0.754740000	0.500820000	0.795550000	0.523210000	0.659540000	0.607560000	0.576190000	0.629990000	0.478070000	0.671350000	0.405530000	0.688400000	0.343840000	0.720820000	0.277120000	0.723860000	0.192960000	0.706820000	0.113720000	0.726880000	0.069900000	0.714440000	g
1.000000000	0.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-0.143750000	0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	0.179170000	-1.000000000	-1.000000000	-1.000000000	0.087500000	-1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.909320000	0.087910000	0.865280000	0.168880000	1.000000000	0.165980000	0.551870000	0.681540000	0.702070000	0.367190000	0.162860000	0.427390000	0.576200000	0.460860000	0.510670000	0.496180000	0.316390000	0.129670000	0.378240000	0.544620000	0.312740000	0.558260000	0.248560000	0.565270000	0.186260000	0.566050000	0.126350000	0.561010000	0.069270000	0.550610000	0.121370000	0.677390000	g
1.000000000	0.000000000	-0.642860000	-1.000000000	1.000000000	0.828570000	1.000000000	-1.000000000	1.000000000	-0.233930000	1.000000000	0.961610000	1.000000000	-0.376790000	1.000000000	-1.000000000	1.000000000	0.138390000	1.000000000	-1.000000000	1.000000000	-0.033930000	-0.842860000	1.000000000	0.537500000	0.857140000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	b
1.000000000	0.000000000	0.990250000	-0.057850000	0.997930000	-0.130090000	0.986630000	-0.194300000	0.993740000	-0.258430000	0.927380000	-0.301300000	0.926510000	-0.379650000	0.898120000	-0.437960000	0.849220000	-0.520640000	0.874330000	-0.570750000	0.790160000	-0.598390000	0.747250000	-0.646150000	0.682820000	-0.684790000	0.652470000	-0.731740000	0.610100000	-0.753530000	0.547520000	-0.802780000	0.491950000	-0.832450000	g
0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-0.375000000	-1.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	-0.037300000	1.000000000	-0.073830000	0.996010000	-0.110390000	0.998380000	-0.099310000	0.989410000	-0.138140000	0.966740000	-0.216950000	0.952880000	-0.250990000	0.912360000	-0.344000000	0.905810000	-0.321520000	0.899910000	-0.346910000	0.878740000	-0.376430000	0.862130000	-0.429900000	0.831720000	-0.431220000	0.814330000	-0.425930000	0.779190000	-0.479770000	0.751150000	-0.501520000	g
1.000000000	0.000000000	0.945980000	-0.026850000	-1.000000000	0.261310000	-0.363930000	0.356390000	0.692580000	-0.634270000	1.000000000	-0.033530000	-0.290200000	-0.005500000	-0.548520000	0.154520000	0.919210000	-0.462700000	1.000000000	-0.504240000	-0.297350000	-0.314540000	-0.738640000	0.373610000	0.838720000	-0.467340000	0.522080000	-0.581300000	1.000000000	-0.613930000	-0.096340000	0.204770000	-0.061170000	0.419130000	b
1.000000000	0.000000000	0.981660000	0.008740000	0.981030000	-0.038180000	0.975650000	-0.056990000	0.959470000	-0.069710000	0.990040000	-0.045070000	0.947130000	-0.111020000	0.933690000	-0.127900000	0.942170000	-0.115830000	0.796820000	-0.192000000	0.882740000	-0.173870000	0.862570000	-0.187390000	0.884870000	-0.196890000	0.818130000	-0.211360000	0.785460000	-0.238640000	0.769110000	-0.230950000	0.743230000	-0.239020000	g
1.000000000	0.000000000	0.000000000	0.000000000	1.000000000	0.517240000	0.000000000	0.000000000	0.109910000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	-0.224140000	-0.557110000	-0.832970000	0.769400000	0.631470000	0.000000000	0.000000000	0.534480000	0.356680000	-0.903020000	0.448280000	1.000000000	-1.000000000	-1.000000000	0.815730000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.841340000	-0.183620000	0.436440000	0.029190000	0.934210000	-0.002670000	0.879470000	0.137950000	0.811210000	-0.017890000	0.885590000	0.549910000	0.917140000	-0.574860000	0.750000000	-0.295200000	0.866760000	-0.201040000	1.000000000	1.000000000	0.466100000	-0.162900000	0.900660000	-0.027780000	0.933580000	-0.011580000	0.615820000	-0.322980000	0.844630000	-0.257060000	0.933230000	-0.014250000	g
0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	1.000000000	1.000000000	1.000000000	0.910100000	1.000000000	-0.269700000	1.000000000	-0.831520000	1.000000000	-1.000000000	1.000000000	-1.000000000	0.725260000	-1.000000000	-0.577790000	-1.000000000	-0.420520000	-1.000000000	-1.000000000	-0.528380000	-1.000000000	0.900140000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-0.346860000	1.000000000	0.348450000	g
1.000000000	0.000000000	-0.679350000	-1.000000000	-1.000000000	1.000000000	1.000000000	0.633170000	0.035150000	-1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	0.886830000	-1.000000000	-1.000000000	1.000000000	0.838400000	1.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	-0.188560000	1.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	0.336110000	b
1.000000000	0.000000000	0.956590000	0.081430000	0.974870000	-0.056670000	0.971650000	-0.084840000	0.960970000	-0.065610000	0.947170000	0.012790000	0.954360000	-0.167950000	0.946120000	-0.194970000	0.996300000	-0.322680000	0.903430000	-0.359020000	0.914280000	-0.273160000	0.901400000	-0.298070000	0.998990000	-0.407470000	0.872440000	-0.345860000	0.920590000	-0.306190000	0.839510000	-0.390610000	0.821660000	-0.411730000	g
1.000000000	0.000000000	0.083330000	-0.206850000	-1.000000000	1.000000000	-1.000000000	1.000000000	0.718750000	0.471730000	-0.821430000	-0.627230000	-1.000000000	-1.000000000	-1.000000000	1.000000000	-0.027530000	0.591520000	-0.421130000	-0.421130000	-0.746280000	-1.000000000	-1.000000000	-0.468010000	-1.000000000	0.238100000	1.000000000	-1.000000000	-1.000000000	-0.389140000	-1.000000000	-1.000000000	-1.000000000	0.614580000	b
1.000000000	0.000000000	1.000000000	-0.022590000	1.000000000	-0.044940000	1.000000000	-0.066820000	1.000000000	-0.087990000	1.000000000	0.561730000	1.000000000	-0.127380000	1.000000000	-0.145220000	1.000000000	0.324070000	1.000000000	-0.176390000	0.994840000	-0.189490000	0.956010000	-0.200810000	1.000000000	-0.922840000	0.872800000	-0.217930000	0.829200000	-0.223700000	0.784790000	-0.227650000	0.739920000	-0.229810000	g
0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	1.000000000	-1.000000000	-0.187500000	1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	b
1.000000000	0.000000000	1.000000000	0.058120000	0.945250000	0.074180000	0.999520000	0.132310000	1.000000000	-0.019110000	0.948460000	0.070330000	0.957130000	0.146440000	0.948620000	0.112240000	0.908960000	0.201190000	0.967410000	0.162650000	0.996950000	0.142580000	0.907840000	0.164100000	0.916670000	0.224310000	0.884230000	0.235710000	0.885680000	0.225110000	0.783240000	0.295760000	0.835740000	0.311660000	g
1.000000000	0.000000000	0.171880000	-1.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	-0.613540000	-0.677080000	0.805210000	0.361460000	0.519790000	0.143750000	0.000000000	0.000000000	-1.000000000	-0.270830000	-0.847920000	0.962500000	1.000000000	1.000000000	-1.000000000	0.677080000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	0.097710000	1.000000000	0.121970000	1.000000000	0.225740000	0.986020000	0.092370000	0.949300000	0.192110000	0.929920000	0.242880000	0.892410000	0.283430000	0.855290000	0.267210000	0.836560000	0.331290000	0.833930000	0.316980000	0.748290000	0.395970000	0.761930000	0.346580000	0.684520000	0.427460000	0.627640000	0.460310000	0.567910000	0.470330000	0.542520000	0.509030000	g
1.000000000	0.000000000	0.016670000	-0.356250000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.122920000	-0.550000000	0.228130000	0.828130000	1.000000000	-0.422920000	0.000000000	0.000000000	0.083330000	-1.000000000	-0.106250000	-0.166670000	1.000000000	-0.766670000	-1.000000000	0.188540000	0.000000000	0.000000000	1.000000000	-0.272920000	b
1.000000000	0.000000000	1.000000000	0.168010000	0.993520000	0.163340000	0.946160000	0.333470000	0.917590000	0.226100000	0.914080000	0.371070000	0.842500000	0.468990000	0.810110000	0.492250000	0.784730000	0.483110000	0.650910000	0.569770000	0.565530000	0.580710000	0.555860000	0.647200000	0.483110000	0.552360000	0.433170000	0.691290000	0.356840000	0.761470000	0.339210000	0.668440000	0.221010000	0.786850000	g
1.000000000	0.000000000	0.638160000	1.000000000	0.208330000	-1.000000000	1.000000000	1.000000000	0.877190000	0.309210000	-0.668860000	1.000000000	-0.059210000	0.587720000	0.017540000	0.050440000	-0.515350000	-1.000000000	0.142540000	-0.032890000	0.326750000	-0.438600000	-1.000000000	1.000000000	0.809210000	-1.000000000	1.000000000	-0.061400000	1.000000000	1.000000000	0.206140000	-1.000000000	1.000000000	1.000000000	b
1.000000000	0.000000000	1.000000000	-0.414570000	1.000000000	0.761310000	0.870600000	0.185930000	1.000000000	-0.099250000	0.938440000	0.479900000	0.654520000	-0.160800000	1.000000000	0.008790000	0.976130000	-0.501260000	0.800250000	-0.244970000	0.880650000	-0.190950000	1.000000000	-0.123120000	0.935930000	0.106780000	0.928900000	-0.072490000	1.000000000	-0.273870000	0.439700000	0.198490000	0.513820000	-0.054020000	g
1.000000000	0.000000000	0.847830000	0.105980000	1.000000000	0.391300000	1.000000000	-1.000000000	0.669380000	0.084240000	1.000000000	0.270380000	1.000000000	0.605980000	1.000000000	0.355070000	1.000000000	0.026720000	0.584240000	-0.430250000	1.000000000	0.634960000	0.891300000	0.265850000	0.910330000	-0.333330000	1.000000000	0.159420000	0.376810000	-0.019470000	1.000000000	0.224640000	1.000000000	0.374090000	b
1.000000000	0.000000000	1.000000000	0.280460000	1.000000000	0.024770000	1.000000000	0.077640000	1.000000000	0.043170000	0.987620000	0.332660000	1.000000000	0.054890000	1.000000000	0.043840000	0.957500000	-0.245980000	0.843710000	-0.086680000	1.000000000	0.041500000	0.999330000	0.273760000	1.000000000	-0.390560000	0.964140000	-0.021740000	0.867470000	0.233600000	0.945780000	-0.220210000	0.803550000	-0.073290000	g
0.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	0.656250000	0.000000000	0.000000000	1.000000000	-1.000000000	b
1.000000000	0.000000000	1.000000000	0.677840000	0.813090000	0.820210000	0.430190000	1.000000000	0.206190000	0.805410000	-0.438720000	1.000000000	-0.791350000	0.770920000	-1.000000000	0.402680000	-0.390460000	-0.586340000	-0.979070000	-0.428220000	-0.730830000	-0.763390000	-0.376710000	-0.974910000	0.413660000	-1.000000000	0.417780000	-0.932960000	0.257730000	-1.000000000	0.935700000	-0.352220000	0.988160000	0.034460000	g
1.000000000	0.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	0.500000000	0.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	b
1.000000000	0.000000000	1.000000000	0.035290000	1.000000000	0.182810000	1.000000000	0.269680000	1.000000000	0.250680000	1.000000000	0.287780000	1.000000000	0.386430000	1.000000000	0.316740000	1.000000000	0.657010000	1.000000000	0.538460000	1.000000000	0.612670000	1.000000000	0.594570000	0.895930000	0.683260000	0.895020000	0.713740000	0.856110000	0.671490000	0.743890000	0.856110000	0.714930000	0.758370000	g
0.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	-0.750000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	b
1.000000000	0.000000000	0.960870000	0.086200000	0.967600000	0.192790000	0.960260000	0.274510000	0.980440000	0.350520000	0.928670000	0.462810000	0.862650000	0.525170000	0.828200000	0.587940000	0.732420000	0.690650000	0.690030000	0.731400000	0.544730000	0.688200000	0.483390000	0.761970000	0.406150000	0.746890000	0.334010000	0.837960000	0.249440000	0.860610000	0.137560000	0.868350000	0.090480000	0.862850000	g
1.000000000	0.000000000	0.694440000	0.388890000	0.000000000	0.000000000	-0.329370000	0.698410000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.206350000	-0.242060000	0.210320000	0.194440000	0.464290000	0.781750000	0.000000000	0.000000000	0.000000000	0.000000000	0.734130000	0.273810000	0.761900000	0.634920000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	0.050700000	1.000000000	0.108270000	1.000000000	0.194980000	1.000000000	0.284530000	1.000000000	0.348260000	1.000000000	0.382610000	0.945750000	0.428810000	0.891260000	0.503910000	0.759060000	0.588010000	0.806440000	0.599620000	0.795780000	0.627580000	0.666430000	0.639420000	0.594170000	0.694350000	0.495380000	0.726840000	0.470270000	0.716890000	0.333810000	0.752430000	g
0.000000000	0.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	b
1.000000000	0.000000000	1.000000000	0.040780000	1.000000000	0.119820000	1.000000000	0.161590000	1.000000000	0.279210000	0.987030000	0.308890000	0.927450000	0.376390000	0.911180000	0.397490000	0.819390000	0.460590000	0.786190000	0.469940000	0.794000000	0.562820000	0.703310000	0.581290000	0.670770000	0.597230000	0.589030000	0.609900000	0.539520000	0.609320000	0.453120000	0.636360000	0.404420000	0.626580000	g
0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	b
1.000000000	0.000000000	1.000000000	0.241680000	1.000000000	0.485900000	1.000000000	0.729730000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	0.771280000	1.000000000	1.000000000	1.000000000	1.000000000	0.744680000	1.000000000	0.896470000	1.000000000	0.646280000	1.000000000	0.382550000	1.000000000	0.108190000	1.000000000	-0.173700000	1.000000000	-0.813830000	1.000000000	g
0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	b
1.000000000	0.000000000	1.000000000	-0.066040000	1.000000000	0.629370000	1.000000000	0.095570000	1.000000000	0.202800000	1.000000000	-1.000000000	1.000000000	-0.405590000	1.000000000	-0.158510000	1.000000000	0.048950000	1.000000000	-0.615380000	1.000000000	-0.265730000	1.000000000	-1.000000000	1.000000000	-0.580420000	1.000000000	-0.813720000	1.000000000	-1.000000000	1.000000000	-0.785550000	1.000000000	-0.482520000	g
0.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	b
1.000000000	0.000000000	0.922770000	0.078040000	0.926790000	0.162510000	0.897020000	0.246180000	0.841110000	0.351970000	0.788010000	0.421960000	0.707160000	0.469830000	0.707960000	0.564760000	0.604590000	0.642000000	0.512470000	0.649240000	0.399030000	0.669750000	0.342320000	0.683430000	0.236930000	0.761460000	0.187650000	0.738850000	0.096940000	0.710380000	0.027350000	0.770720000	-0.040230000	0.695090000	g
1.000000000	0.000000000	0.681980000	-0.173140000	0.823320000	0.219080000	0.466430000	0.328620000	0.257950000	0.583040000	1.000000000	-0.151940000	0.010600000	0.445230000	0.010600000	0.388690000	0.186810000	0.411680000	0.105670000	0.363530000	0.043250000	0.307450000	-0.000830000	0.249360000	-0.028620000	0.194050000	-0.043140000	0.144810000	-0.047790000	0.103490000	-0.045850000	0.070640000	-0.040130000	0.045860000	b
1.000000000	0.000000000	0.748520000	-0.028110000	0.656800000	-0.051780000	0.806210000	0.028110000	0.859470000	0.025150000	0.634620000	0.087280000	0.715980000	0.078400000	0.730770000	0.051780000	0.785500000	-0.278110000	0.659760000	-0.014790000	0.786980000	0.069530000	0.346150000	-0.186390000	0.653850000	0.028110000	0.610090000	-0.066370000	0.535500000	-0.211540000	0.590240000	-0.140530000	0.563610000	0.029590000	g
1.000000000	0.000000000	0.391790000	-0.063430000	0.974640000	0.043280000	1.000000000	1.000000000	0.358210000	0.152990000	0.544780000	0.130600000	0.615670000	-0.820900000	0.578360000	0.679100000	0.667910000	-0.104480000	0.466420000	-0.115670000	0.655740000	0.147920000	0.832090000	0.455220000	0.470150000	0.164180000	0.493090000	0.146300000	0.324630000	-0.026120000	0.391180000	0.135210000	0.344110000	0.127550000	b
1.000000000	0.000000000	0.675470000	0.045280000	0.769810000	-0.105660000	0.773580000	0.037740000	0.660380000	-0.045280000	0.645280000	0.011320000	0.667920000	-0.139620000	0.720750000	-0.022640000	0.769810000	0.086790000	0.618870000	-0.079250000	0.758490000	-0.237740000	0.739620000	-0.147170000	0.849060000	-0.150940000	0.738860000	-0.058010000	0.667920000	0.022640000	0.864150000	0.037740000	0.732080000	0.007550000	g
1.000000000	0.000000000	0.727270000	-0.050000000	0.892410000	0.034620000	1.000000000	0.727270000	0.663640000	-0.059090000	0.481820000	-0.168180000	0.818090000	0.095590000	0.568180000	1.000000000	0.504550000	0.218180000	0.668180000	0.100000000	1.000000000	-0.300000000	0.986360000	-1.000000000	0.572730000	0.327270000	0.569820000	0.146730000	0.422730000	0.081820000	0.489270000	0.146430000	1.000000000	1.000000000	b
1.000000000	0.000000000	0.576470000	-0.015690000	0.403920000	0.000000000	0.384310000	0.129410000	0.400000000	-0.058820000	0.564710000	0.141180000	0.466670000	0.082350000	0.525490000	-0.054900000	0.580390000	0.015690000	0.501960000	0.000000000	0.458820000	0.066670000	0.580390000	0.082350000	0.498040000	0.003920000	0.486010000	0.100390000	0.462750000	0.082350000	0.450980000	0.235290000	0.431370000	0.172550000	g
1.000000000	0.000000000	0.419320000	0.124820000	0.350000000	0.125000000	0.231820000	0.279550000	-0.036360000	0.443180000	0.045170000	0.361940000	-0.190910000	0.336360000	-0.133500000	0.273220000	0.027270000	0.404550000	-0.347730000	0.127270000	-0.200280000	0.050780000	-0.186360000	0.363640000	-0.140030000	-0.048020000	-0.099710000	-0.071140000	-1.000000000	-1.000000000	-0.029160000	-0.074640000	-0.005260000	-0.063140000	b
1.000000000	0.000000000	0.883050000	-0.219960000	1.000000000	0.363730000	0.824030000	0.192060000	0.850860000	0.059010000	0.905580000	-0.042920000	0.851930000	0.250000000	0.778970000	0.253220000	0.692060000	0.579400000	0.710300000	0.390560000	0.731760000	0.275750000	1.000000000	0.348710000	0.567600000	0.520390000	0.698110000	0.532350000	0.809010000	0.585840000	0.430260000	0.709230000	0.523610000	0.541850000	g
1.000000000	0.000000000	0.845570000	-0.085800000	-0.317450000	-0.805530000	-0.089610000	-0.564350000	0.806480000	0.045760000	0.895140000	-0.007630000	-0.184940000	0.639660000	-0.200190000	-0.680650000	0.857010000	-0.113440000	0.779790000	-0.157290000	-0.069590000	0.508100000	-0.341280000	0.809340000	0.789320000	-0.037180000	0.708820000	-0.252880000	0.778840000	-0.141090000	-0.213540000	-0.781700000	-0.184940000	-0.598670000	b
1.000000000	0.000000000	0.708700000	-0.247830000	0.643480000	0.043480000	0.452170000	0.382610000	0.652170000	0.182610000	0.500000000	0.269570000	0.578260000	-0.230430000	0.504350000	0.378260000	0.386960000	-0.426090000	0.360870000	-0.260870000	0.269570000	0.117390000	0.532460000	-0.038450000	0.313040000	-0.121740000	0.499300000	-0.042640000	0.483480000	-0.044480000	0.643480000	-0.252170000	0.504350000	0.147830000	g
1.000000000	0.000000000	-0.541800000	0.148610000	-0.337460000	0.733750000	0.520120000	-0.139320000	0.318890000	-0.068110000	0.207430000	-0.151700000	0.473680000	0.089780000	0.563470000	-0.154800000	0.164090000	0.452010000	0.337460000	0.034060000	0.504640000	0.071210000	-0.637770000	-0.616100000	1.000000000	0.656350000	0.413480000	-0.401160000	-0.151700000	0.111460000	0.023990000	0.558200000	0.526320000	-0.089780000	b
1.000000000	0.000000000	0.292020000	0.135820000	0.453310000	0.168080000	0.517830000	-0.005090000	0.526320000	0.208830000	0.524620000	-0.166380000	0.473680000	-0.047540000	0.555180000	0.039050000	0.816640000	-0.224110000	0.424450000	-0.042440000	0.349750000	0.066210000	0.281830000	-0.208830000	0.517310000	-0.031760000	0.503690000	-0.033510000	0.346350000	0.098470000	0.707980000	-0.018680000	0.395590000	-0.032260000	g
1.000000000	0.000000000	0.791570000	0.168510000	0.000000000	0.000000000	0.565410000	0.068740000	0.394680000	1.000000000	0.383590000	0.995570000	-0.024390000	0.532150000	0.237250000	0.128600000	-0.026610000	0.951220000	-0.509980000	0.849220000	-0.102000000	0.388030000	-0.425720000	0.237250000	-0.915740000	0.807100000	-0.341460000	0.882480000	-1.000000000	0.694010000	-1.000000000	0.128600000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.901160000	0.166070000	0.792990000	0.373790000	0.729900000	0.505150000	0.597840000	0.729970000	0.443030000	0.811520000	0.244120000	0.874930000	0.064380000	0.850380000	-0.126110000	0.873960000	-0.287390000	0.796170000	-0.466350000	0.659240000	-0.571350000	0.538050000	-0.681590000	0.399510000	-0.718440000	0.258350000	-0.723690000	0.112180000	-0.714750000	-0.055250000	-0.676990000	-0.199040000	g
1.000000000	0.000000000	0.977140000	0.190490000	0.826830000	0.462590000	0.717710000	0.587320000	0.479680000	0.842780000	0.314090000	0.926430000	0.102890000	0.939450000	-0.132540000	0.842900000	-0.320200000	0.916240000	-0.521450000	0.795250000	-0.682740000	0.495080000	-0.774080000	0.335370000	-0.853760000	0.178490000	-0.833140000	-0.013580000	-0.823660000	-0.193210000	-0.672890000	-0.336620000	-0.599430000	-0.497000000	g
1.000000000	0.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	0.508140000	-0.785020000	0.605860000	0.328990000	-1.000000000	-0.413680000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	-0.267100000	0.364820000	-0.635180000	0.970680000	-1.000000000	-1.000000000	-1.000000000	1.000000000	-0.596090000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.740840000	0.049740000	0.790740000	0.025430000	0.785750000	0.037930000	0.662300000	0.099480000	0.678010000	0.311520000	0.759340000	0.073480000	0.746950000	0.084420000	0.706810000	-0.078530000	0.636130000	0.000000000	0.700210000	0.113550000	0.681830000	0.121850000	0.670160000	0.154450000	0.641580000	0.136080000	0.657070000	0.175390000	0.597590000	0.146970000	0.574550000	0.151140000	g
1.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.779410000	-0.992650000	0.808820000	0.551470000	-0.419120000	-0.948530000	0.000000000	0.000000000	0.000000000	0.000000000	0.720590000	-0.772060000	0.735290000	-0.602940000	0.000000000	0.000000000	0.183820000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	0.017090000	0.962150000	-0.031420000	1.000000000	-0.034360000	1.000000000	-0.050710000	0.990260000	-0.070920000	0.991730000	-0.090020000	1.000000000	-0.157270000	1.000000000	-0.142570000	0.983100000	-0.118130000	1.000000000	-0.185190000	1.000000000	-0.192720000	0.989710000	-0.220830000	0.964900000	-0.202430000	0.945990000	-0.171230000	0.964360000	-0.225610000	0.870110000	-0.232960000	g
0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.957040000	-0.120950000	0.633180000	-0.126900000	0.963650000	-0.182420000	0.970260000	0.084600000	0.920030000	-0.011240000	0.835430000	-0.247190000	1.000000000	-0.313950000	0.992730000	-0.212160000	0.986780000	-0.210180000	1.000000000	-0.271650000	0.931260000	-0.394580000	1.000000000	-0.192330000	0.887930000	-0.315650000	0.814280000	-0.237280000	0.890950000	-0.318570000	0.695310000	-0.415730000	g
1.000000000	0.000000000	0.284090000	-0.318180000	0.000000000	0.000000000	0.681820000	-1.000000000	0.306820000	0.958330000	0.643940000	0.064390000	0.348480000	-0.848480000	0.000000000	0.000000000	0.590910000	-0.359850000	0.450760000	-0.806820000	0.000000000	0.000000000	0.000000000	0.000000000	0.242420000	0.178030000	1.000000000	-0.238640000	0.060610000	-0.484850000	0.162880000	-0.700760000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.944900000	-0.493110000	1.000000000	-0.036920000	0.988980000	-0.870520000	0.900830000	0.669420000	1.000000000	-0.101040000	1.000000000	-0.124930000	1.000000000	-0.150170000	1.000000000	-0.176810000	1.000000000	-0.204910000	1.000000000	-0.234520000	1.000000000	-0.265710000	1.000000000	-0.298520000	1.000000000	-0.333040000	1.000000000	-0.369310000	1.000000000	-0.407400000	1.000000000	-0.447390000	g
1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.621950000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.365850000	-0.719510000	0.560980000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	0.109760000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.994490000	0.005260000	0.840820000	-0.113130000	0.882370000	-0.164310000	0.990610000	-0.062570000	0.964840000	-0.074960000	0.852210000	0.029660000	0.871610000	-0.208480000	0.938810000	-0.129770000	0.982980000	-0.089350000	0.898760000	0.000750000	0.878360000	-0.058820000	0.933680000	-0.198720000	0.875790000	-0.178060000	0.942940000	-0.165810000	0.802530000	-0.257410000	0.765860000	-0.277940000	g
1.000000000	0.000000000	0.101350000	0.108110000	0.000000000	0.000000000	0.000000000	0.000000000	0.547300000	0.824320000	0.310810000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.371620000	-1.000000000	0.331080000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-0.425680000	-1.000000000	1.000000000	-1.000000000	0.554050000	-0.236490000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	-0.572240000	0.991500000	-0.733710000	0.895180000	-0.974500000	1.000000000	-0.358180000	1.000000000	-0.232290000	0.628900000	-0.864020000	1.000000000	-0.575350000	1.000000000	-0.796030000	0.767710000	-0.889520000	0.966010000	-1.000000000	0.701200000	-0.748960000	0.619460000	-0.769040000	0.537770000	-0.779860000	0.810200000	-1.000000000	1.000000000	-1.000000000	0.304450000	-0.761120000	g
1.000000000	0.000000000	0.659090000	-0.628790000	0.000000000	0.000000000	0.000000000	0.000000000	0.772730000	1.000000000	1.000000000	-0.280300000	0.000000000	0.000000000	0.000000000	0.000000000	0.621210000	-0.227270000	0.840910000	-1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	-0.939390000	-0.128790000	-0.931820000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.862840000	0.193100000	0.809200000	0.411490000	0.672030000	0.557850000	0.545590000	0.699620000	0.367050000	0.815330000	0.196170000	0.856710000	-0.040610000	0.862840000	-0.172410000	0.757850000	-0.341000000	0.657470000	-0.481990000	0.560920000	-0.602300000	0.409960000	-0.592340000	0.257470000	-0.630380000	0.088180000	-0.572410000	-0.078160000	-0.548660000	-0.199230000	-0.429120000	-0.319540000	g
1.000000000	0.000000000	0.420000000	-0.610000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.900000000	1.000000000	0.430000000	0.640000000	0.000000000	0.000000000	0.000000000	0.000000000	0.670000000	-0.290000000	0.840000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.210000000	0.680000000	1.000000000	0.220000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	0.233950000	0.914040000	0.520130000	0.780200000	0.721440000	0.476600000	0.842220000	0.276390000	0.917300000	0.094670000	0.882480000	-0.219800000	0.914040000	-0.341680000	0.755170000	-0.513600000	0.645270000	-0.645270000	0.446140000	-0.741020000	0.291620000	-0.708380000	0.035910000	-0.717310000	-0.119430000	-0.649620000	-0.281830000	-0.512510000	-0.445050000	-0.374320000	-0.533190000	g
1.000000000	0.000000000	0.913530000	0.815860000	-0.729730000	1.000000000	-0.394660000	0.557350000	0.054050000	0.297300000	-0.185990000	-0.102410000	-0.031580000	-0.089700000	0.014010000	-0.034030000	0.011080000	-0.005370000	0.003420000	0.000970000	0.000480000	0.000750000	-0.000030000	0.000190000	-0.000030000	0.000020000	-0.000010000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.214290000	-0.095240000	0.333330000	0.071430000	0.190480000	0.190480000	0.238100000	0.095240000	0.404760000	0.023810000	0.309520000	-0.047620000	0.309520000	-0.047620000	0.285710000	-0.119050000	0.333330000	0.047620000	0.309520000	0.000000000	0.214290000	-0.119050000	0.357140000	-0.047620000	0.221090000	-0.022900000	0.190480000	0.000000000	0.169970000	-0.020340000	0.146940000	-0.018770000	g
1.000000000	0.000000000	1.000000000	-0.147540000	1.000000000	0.049180000	0.573770000	-0.016390000	0.655740000	0.016390000	0.852460000	-0.032790000	0.721310000	0.000000000	0.688520000	-0.163930000	0.196720000	-0.147540000	0.655580000	-0.171760000	0.672130000	0.032790000	1.000000000	-0.295080000	0.311480000	-0.344260000	0.523850000	-0.203250000	0.327870000	-0.032790000	0.278690000	-0.442620000	0.491800000	-0.065570000	b
1.000000000	0.000000000	0.981820000	0.000000000	0.886270000	0.031310000	0.862490000	0.045720000	0.800000000	0.000000000	0.690910000	0.045450000	0.793430000	0.084360000	0.771180000	0.095790000	0.627270000	0.254550000	0.681820000	0.127270000	0.706740000	0.126080000	0.686040000	0.134930000	0.745450000	0.227270000	0.645810000	0.150880000	0.672730000	0.027270000	0.607150000	0.164650000	0.588400000	0.170770000	g
1.000000000	0.000000000	0.392860000	0.523810000	-0.788240000	0.113420000	-0.166280000	-0.763780000	0.666670000	0.011900000	0.821430000	0.404760000	-0.672300000	0.307290000	-0.347970000	-0.636680000	0.464290000	0.154760000	0.547620000	0.059520000	-0.518300000	0.449610000	-0.476510000	-0.475940000	0.321430000	0.702380000	0.519710000	0.388480000	0.571430000	0.392860000	-0.548910000	-0.299150000	0.254410000	-0.558370000	b
1.000000000	0.000000000	0.868890000	-0.071110000	1.000000000	-0.024940000	1.000000000	-0.068890000	0.877780000	0.002220000	0.835560000	-0.064440000	1.000000000	-0.072870000	1.000000000	-0.200000000	0.868890000	0.053330000	0.880000000	-0.037780000	1.000000000	-0.115260000	1.000000000	-0.186670000	0.844440000	0.035560000	1.000000000	-0.141620000	0.822220000	-0.146670000	1.000000000	-0.156090000	1.000000000	-0.442220000	g
1.000000000	0.000000000	0.436360000	-0.127270000	0.581820000	-0.145450000	0.181820000	-0.672730000	0.345450000	-0.036360000	0.290910000	-0.054550000	0.290910000	0.290910000	0.363640000	-0.418180000	0.200000000	-0.018180000	0.363640000	0.054550000	0.127270000	0.490910000	0.618180000	0.163640000	0.327270000	0.163640000	0.410980000	-0.070270000	0.345450000	-0.054550000	0.127270000	-0.363640000	0.290910000	-0.290910000	b
1.000000000	0.000000000	1.000000000	-0.924530000	1.000000000	0.754720000	0.490570000	-0.056600000	0.622640000	0.000000000	1.000000000	-0.000540000	0.452830000	0.075470000	0.622640000	-0.056600000	0.988780000	-0.000850000	0.528300000	0.000000000	0.528300000	0.075470000	0.951900000	-0.001120000	1.000000000	0.792450000	0.921920000	-0.001280000	0.943400000	-1.000000000	1.000000000	0.433960000	0.433960000	-0.113210000	g
1.000000000	0.000000000	0.738100000	0.833330000	-0.761900000	-0.238100000	0.333330000	-0.142860000	0.452380000	-0.142860000	-0.672850000	0.128080000	0.333330000	0.000000000	0.285710000	-0.071430000	-0.382140000	0.511630000	0.238100000	0.023810000	0.452380000	0.047620000	0.166670000	-0.261900000	-0.572550000	-0.102340000	0.248890000	-0.510790000	1.000000000	0.000000000	-0.666670000	-0.047620000	0.261900000	0.023810000	b
1.000000000	0.000000000	0.437500000	0.041670000	0.583330000	-0.104170000	0.395830000	0.000000000	0.333330000	-0.062500000	0.479170000	0.000000000	0.291670000	0.104170000	0.541670000	0.020830000	0.437500000	-0.229170000	0.354170000	-0.229170000	0.333330000	0.083330000	0.250000000	0.187500000	0.395830000	-0.187500000	0.440120000	-0.100640000	0.416670000	-0.083330000	0.583330000	-0.312500000	0.333330000	-0.062500000	g
1.000000000	0.000000000	1.000000000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.477440000	-0.890980000	-0.515040000	0.454890000	-0.954890000	0.285710000	0.646620000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.620300000	0.203010000	-1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.952170000	0.065950000	0.936140000	0.130300000	0.909960000	0.191520000	0.848810000	-0.499620000	0.900230000	0.613200000	0.779370000	0.343280000	0.722540000	0.379880000	0.661450000	0.408440000	0.954720000	0.598620000	0.532580000	0.440880000	0.467730000	0.445110000	0.404400000	0.441990000	0.343740000	0.432210000	0.903300000	1.000000000	0.234050000	0.396200000	0.186320000	0.371910000	g
1.000000000	0.000000000	0.598400000	0.403320000	0.828090000	0.805210000	0.760010000	0.707090000	0.840100000	-0.109840000	0.973110000	0.079810000	0.958240000	-0.857270000	0.919620000	0.884440000	0.954520000	-0.052060000	0.886730000	0.181350000	0.984840000	-0.695940000	0.866700000	-0.857550000	0.286040000	-0.300630000	1.000000000	0.170760000	0.629580000	0.426770000	0.877570000	0.810070000	0.819790000	0.688220000	b
1.000000000	0.000000000	0.958820000	0.101290000	1.000000000	-0.019180000	0.983130000	0.025550000	0.969740000	-0.093160000	0.989550000	-0.027160000	0.979800000	-0.030960000	1.000000000	-0.053430000	1.000000000	-0.051790000	0.938400000	0.015570000	0.976200000	-0.092840000	0.978890000	-0.053180000	0.915670000	-0.156750000	0.956770000	-0.069950000	0.909780000	0.013070000	1.000000000	-0.107970000	0.931440000	-0.068880000	g
1.000000000	0.000000000	0.000000000	0.000000000	-0.336720000	0.853880000	0.000000000	0.000000000	0.688690000	-1.000000000	0.970780000	0.313850000	-0.260480000	-0.592120000	-0.302410000	0.655650000	0.941550000	0.163910000	0.000000000	0.000000000	0.000000000	0.000000000	-0.180430000	-1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.044470000	0.618810000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.969330000	0.008760000	1.000000000	0.008430000	0.986580000	-0.007630000	0.978680000	-0.028440000	0.998200000	-0.035100000	1.000000000	-0.012710000	1.000000000	-0.025810000	1.000000000	-0.011750000	0.984850000	0.000250000	1.000000000	-0.026120000	1.000000000	-0.047440000	0.960190000	-0.045270000	0.991880000	-0.034730000	0.970200000	-0.024780000	1.000000000	-0.038550000	0.984200000	-0.041120000	g
1.000000000	0.000000000	0.000000000	0.000000000	0.989190000	-0.227030000	0.189190000	-0.054050000	0.000000000	0.000000000	0.932430000	0.072970000	1.000000000	-0.200000000	1.000000000	0.070270000	1.000000000	-0.113510000	0.000000000	0.000000000	1.000000000	-0.210810000	1.000000000	-0.416220000	0.000000000	0.000000000	1.000000000	-0.175680000	0.000000000	0.000000000	1.000000000	-0.259460000	0.289190000	-0.156760000	b
1.000000000	0.000000000	0.641220000	0.014030000	0.341460000	-0.024390000	0.527510000	0.034660000	0.195120000	0.121950000	0.433130000	0.047550000	0.219510000	0.048780000	0.292680000	0.000000000	0.365850000	0.000000000	0.317070000	0.073170000	0.268290000	0.121950000	0.236980000	0.058130000	0.219510000	0.097560000	0.193040000	0.056410000	0.174100000	0.055040000	0.195120000	0.000000000	0.170730000	0.073170000	g
1.000000000	0.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	-0.277780000	0.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.346940000	0.204080000	0.469390000	0.244900000	0.408160000	0.204080000	0.469390000	0.448980000	0.306120000	0.591840000	0.122450000	0.551020000	0.000000000	0.510200000	-0.061220000	0.551020000	-0.204080000	0.551020000	-0.285710000	0.448980000	-0.285710000	0.326530000	-0.612240000	0.224490000	-0.465790000	0.148950000	-0.591840000	0.183670000	-0.346940000	0.000000000	-0.265310000	-0.244900000	g
1.000000000	0.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	-0.253420000	1.000000000	0.232880000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.897060000	0.382350000	0.911760000	0.375000000	0.742650000	0.676470000	0.455880000	0.779410000	0.191180000	0.889710000	-0.022060000	0.860290000	-0.205880000	0.823530000	-0.375000000	0.676470000	-0.500000000	0.477940000	-0.735290000	0.382350000	-0.860290000	0.088240000	-0.742650000	-0.125000000	-0.679250000	-0.241310000	-0.551470000	-0.426470000	-0.441180000	-0.507350000	-0.286760000	-0.566180000	g
1.000000000	0.000000000	-1.000000000	0.281050000	0.222220000	0.150330000	-0.756930000	-0.709840000	-0.307190000	0.712420000	-1.000000000	1.000000000	-0.816990000	0.339870000	-0.790850000	-0.026140000	-0.980390000	-0.830070000	-0.601310000	-0.542480000	-0.045750000	-0.830070000	0.941180000	-0.941180000	-1.000000000	-0.431370000	0.743850000	0.091760000	-1.000000000	0.052290000	0.183010000	0.026140000	-0.402010000	-0.482410000	b
1.000000000	0.000000000	0.266670000	-0.100000000	0.533330000	0.000000000	0.333330000	-0.133330000	0.366670000	0.116670000	0.566670000	0.016670000	0.716670000	0.083330000	0.700000000	-0.066670000	0.533330000	0.200000000	0.416670000	-0.016670000	0.316670000	0.200000000	0.700000000	0.000000000	0.250000000	0.133330000	0.462140000	0.054390000	0.400000000	0.033330000	0.466670000	0.033330000	0.416670000	-0.050000000	g
1.000000000	0.000000000	-0.266670000	0.400000000	-0.273030000	0.121590000	-0.177780000	-0.044440000	0.061920000	-0.068790000	0.044610000	0.025750000	-0.008850000	0.027260000	-0.015860000	-0.001660000	-0.000930000	-0.008830000	0.004700000	-0.001530000	0.001380000	0.002380000	-0.001140000	0.001020000	-0.000690000	-0.000500000	0.000190000	-0.000430000	0.000260000	0.000050000	0.000000000	0.000150000	-0.000080000	0.000020000	b
1.000000000	0.000000000	1.000000000	-0.378380000	0.648650000	0.297300000	0.648650000	-0.243240000	0.864860000	0.189190000	1.000000000	-0.270270000	0.513510000	0.000000000	0.621620000	-0.054050000	0.324320000	-0.216220000	0.718330000	-0.176660000	0.621620000	0.054050000	0.756760000	0.135140000	0.351350000	-0.297300000	0.610310000	-0.221630000	0.584780000	-0.230270000	0.729730000	-0.594590000	0.513510000	-0.243240000	g
1.000000000	0.000000000	0.945310000	-0.035160000	-1.000000000	-0.332030000	-1.000000000	-0.015630000	0.972660000	0.011720000	0.933590000	-0.019530000	-1.000000000	0.164060000	-1.000000000	-0.003910000	0.953130000	-0.035160000	0.921880000	-0.027340000	-0.992190000	0.117190000	-0.933590000	0.347660000	0.957030000	-0.003910000	0.820410000	0.137580000	0.902340000	-0.066410000	-1.000000000	-0.187500000	-1.000000000	-0.343750000	b
1.000000000	0.000000000	0.952020000	0.022540000	0.937570000	-0.012720000	0.935260000	0.012140000	0.967050000	-0.017340000	0.969360000	0.005200000	0.956650000	-0.030640000	0.952600000	-0.004050000	0.994800000	-0.026590000	0.997690000	0.017920000	0.935840000	-0.049710000	0.938150000	-0.023700000	0.970520000	-0.044510000	0.962150000	-0.016470000	0.973990000	0.019080000	0.954340000	-0.034100000	0.958380000	0.008090000	g
1.000000000	0.000000000	1.000000000	-0.055290000	1.000000000	-1.000000000	0.500000000	-0.111110000	0.361110000	-0.222220000	1.000000000	-0.257120000	0.166670000	-0.111110000	1.000000000	-0.346600000	1.000000000	-0.388530000	1.000000000	-0.428620000	0.000000000	-0.250000000	1.000000000	-0.503330000	1.000000000	-0.277780000	1.000000000	-0.570920000	1.000000000	-0.277780000	1.000000000	-0.631560000	1.000000000	-0.659350000	b
1.000000000	0.000000000	0.310340000	-0.103450000	0.241380000	-0.103450000	0.206900000	-0.068970000	0.074050000	-0.054310000	0.036490000	-0.036890000	0.017070000	-0.023830000	0.007410000	-0.014820000	0.002810000	-0.008930000	0.000780000	-0.005230000	-0.000030000	-0.002990000	-0.000280000	-0.001660000	-0.000310000	-0.000900000	-0.000250000	-0.000480000	-0.000180000	-0.000240000	-0.000120000	-0.000120000	-0.000080000	-0.000060000	g
1.000000000	0.000000000	0.627450000	-0.078430000	0.725490000	0.000000000	0.607840000	-0.078430000	0.627450000	-0.117650000	0.686270000	-0.117650000	0.666670000	-0.137250000	0.647060000	-0.098040000	0.549020000	-0.117650000	0.549020000	-0.215690000	0.588240000	-0.196080000	0.666670000	-0.235290000	0.450980000	-0.254900000	0.524090000	-0.246680000	0.568630000	-0.313730000	0.431370000	-0.215690000	0.470590000	-0.274510000	b
1.000000000	0.000000000	0.250000000	0.166670000	0.466670000	0.266670000	0.190360000	0.239660000	0.077660000	0.199390000	0.010700000	0.149220000	-0.023670000	0.101880000	-0.036850000	0.063170000	-0.037660000	0.034580000	-0.032300000	0.015320000	-0.024740000	0.003570000	-0.017260000	-0.002730000	-0.010970000	-0.005390000	-0.006210000	-0.005860000	-0.002940000	-0.005200000	-0.000890000	-0.004080000	0.000250000	-0.002910000	g
1.000000000	0.000000000	-0.656250000	0.156250000	0.062500000	0.000000000	0.000000000	0.062500000	0.625000000	0.062500000	0.187500000	0.000000000	-0.031250000	0.093750000	0.062500000	0.000000000	0.156250000	-0.156250000	0.437500000	-0.375000000	0.000000000	-0.093750000	0.000000000	0.000000000	0.031250000	-0.468750000	0.031250000	0.000000000	-0.718750000	0.031250000	-0.031250000	0.000000000	0.000000000	0.093750000	b
1.000000000	0.000000000	1.000000000	-0.010810000	1.000000000	-0.027030000	1.000000000	-0.064860000	0.951350000	-0.016220000	0.989190000	-0.032430000	0.989190000	0.086490000	1.000000000	-0.064860000	0.951350000	0.091890000	0.978380000	-0.005410000	1.000000000	0.064860000	1.000000000	0.043240000	0.978380000	0.091890000	0.985560000	0.012510000	1.000000000	-0.032430000	1.000000000	0.027030000	1.000000000	-0.070270000	g
1.000000000	0.000000000	0.852710000	0.054260000	1.000000000	0.080690000	1.000000000	1.000000000	0.914730000	-0.007750000	0.837210000	0.038760000	1.000000000	0.271530000	1.000000000	1.000000000	0.813950000	0.046510000	0.906980000	0.116280000	1.000000000	0.506700000	1.000000000	-1.000000000	0.806200000	0.038760000	1.000000000	0.716130000	0.844960000	0.069770000	1.000000000	0.873170000	1.000000000	1.000000000	b
1.000000000	0.000000000	0.903740000	-0.016040000	1.000000000	0.080210000	1.000000000	0.016040000	0.930480000	0.005350000	0.935830000	-0.016040000	1.000000000	0.000000000	1.000000000	0.064170000	1.000000000	0.048130000	0.914440000	0.042780000	0.967910000	0.021390000	0.989300000	-0.016040000	0.962570000	0.053480000	0.969740000	0.044520000	0.877010000	0.010700000	1.000000000	0.090910000	0.978610000	0.064170000	g
1.000000000	0.000000000	-0.205000000	0.287500000	0.230000000	0.100000000	0.282500000	0.317500000	0.322500000	0.350000000	0.362850000	-0.346170000	0.092500000	0.275000000	-0.095000000	0.210000000	-0.087500000	0.235000000	-0.341870000	0.314080000	-0.480000000	-0.080000000	0.299080000	0.331760000	-0.580000000	-0.240000000	0.321900000	-0.284750000	-0.470000000	0.185000000	-0.271040000	-0.312280000	0.404450000	0.030500000	b
1.000000000	0.000000000	0.600000000	0.033330000	0.633330000	0.066670000	0.700000000	0.066670000	0.700000000	0.000000000	0.633330000	0.000000000	0.800000000	0.000000000	0.733330000	0.000000000	0.700000000	0.100000000	0.666670000	0.100000000	0.733330000	-0.033330000	0.766670000	0.000000000	0.633330000	0.133330000	0.659320000	0.101680000	0.600000000	0.133330000	0.600000000	0.166670000	0.633330000	0.166670000	g
1.000000000	0.000000000	0.058660000	-0.008380000	0.067040000	0.008380000	0.000000000	-0.011170000	0.005590000	-0.039110000	0.016760000	-0.075420000	-0.005590000	0.053070000	0.064250000	-0.033520000	0.000000000	0.094970000	-0.064250000	0.075420000	-0.047490000	0.025140000	0.027930000	-0.005590000	0.008380000	0.005590000	0.103350000	-0.008380000	0.030730000	-0.002790000	0.044690000	0.000000000	0.047490000	-0.033520000	b
1.000000000	0.000000000	0.946530000	0.287130000	0.725540000	0.672480000	0.475640000	0.824550000	0.012670000	0.891090000	-0.248710000	0.844750000	-0.476440000	0.560790000	-0.758810000	0.417430000	-0.664550000	0.072080000	-0.654260000	-0.195250000	-0.524750000	-0.440000000	-0.308510000	-0.550890000	-0.041190000	-0.647920000	0.160850000	-0.564200000	0.367520000	-0.419010000	0.460590000	-0.225350000	0.503760000	-0.059800000	g
1.000000000	0.000000000	0.054600000	0.014370000	-0.025860000	0.045980000	0.014370000	0.045980000	-0.077590000	0.008620000	0.017240000	-0.066090000	-0.037360000	0.043100000	-0.083330000	-0.045980000	-0.094830000	0.080460000	-0.040230000	0.051720000	0.020110000	0.022990000	-0.037360000	-0.011490000	0.031610000	-0.008620000	0.008620000	0.017240000	0.025860000	0.011490000	0.025860000	0.011490000	-0.045980000	-0.005750000	b
1.000000000	0.000000000	0.724140000	-0.010840000	0.797040000	0.010840000	0.800000000	0.001970000	0.790150000	0.010840000	0.784240000	-0.009850000	0.833500000	0.032510000	0.851230000	0.016750000	0.800990000	-0.007880000	0.791130000	-0.029560000	0.759610000	0.033500000	0.747780000	0.055170000	0.726110000	-0.014780000	0.780410000	0.006120000	0.740890000	-0.050250000	0.829560000	0.029560000	0.790150000	0.007880000	g
1.000000000	0.000000000	0.038520000	0.025680000	0.004280000	0.000000000	0.019970000	-0.019970000	0.021400000	-0.049930000	-0.048500000	-0.012840000	0.014270000	-0.022820000	0.000000000	-0.032810000	-0.047080000	-0.028530000	-0.017120000	0.035660000	0.021400000	0.004280000	0.051360000	-0.022820000	0.051360000	0.018540000	0.039940000	0.015690000	0.019970000	0.007130000	-0.025680000	-0.018540000	-0.014270000	0.019970000	b
1.000000000	0.000000000	0.470900000	0.227510000	0.423280000	0.335980000	0.256610000	0.476190000	0.018520000	0.494710000	-0.021160000	0.539680000	-0.341270000	0.312170000	-0.412700000	0.325400000	-0.515870000	0.068780000	-0.500000000	-0.116400000	-0.148150000	-0.145500000	-0.148150000	-0.380950000	-0.232800000	0.002650000	0.035740000	-0.317390000	0.158730000	-0.216930000	0.248680000	-0.243390000	0.267200000	0.042330000	g
1.000000000	0.000000000	0.086960000	0.006860000	0.139590000	-0.041190000	0.105260000	-0.082380000	0.125860000	-0.061780000	0.233410000	-0.011440000	0.123570000	0.077800000	0.146450000	-0.135010000	0.290620000	-0.048050000	0.189930000	0.073230000	0.116700000	0.000000000	0.112130000	-0.002290000	0.151030000	-0.102970000	0.084670000	0.013730000	0.112130000	-0.066360000	0.096110000	-0.073230000	0.116700000	-0.068650000	b
1.000000000	0.000000000	0.943330000	0.385740000	0.482630000	0.645340000	0.215720000	0.775140000	-0.559410000	0.648990000	-0.736750000	0.420480000	-0.760510000	0.000000000	-0.627060000	-0.310790000	-0.383910000	-0.621570000	-0.127970000	-0.692870000	0.499090000	-0.636200000	0.714810000	-0.376600000	0.738570000	-0.054840000	0.600980000	0.303840000	0.455210000	0.605120000	0.027420000	0.544790000	-0.215720000	0.504570000	g
1.000000000	0.000000000	0.019750000	0.007050000	0.040900000	-0.008460000	0.021160000	0.011280000	0.011280000	0.043720000	0.002820000	0.001410000	0.019750000	-0.031030000	-0.019750000	0.060650000	-0.040900000	0.026800000	-0.023980000	-0.004230000	0.043720000	-0.025390000	0.018340000	0.000000000	0.000000000	-0.012690000	0.018340000	-0.011280000	0.005640000	-0.015510000	-0.016930000	-0.023980000	0.007050000	0.000000000	b
1.000000000	0.000000000	0.857360000	0.000750000	0.819270000	-0.056760000	0.775210000	-0.041820000	0.843170000	0.090370000	0.862580000	0.119490000	0.880510000	-0.061240000	0.783420000	0.035100000	0.837190000	-0.067960000	0.835700000	-0.141900000	0.881250000	0.011950000	0.905150000	0.022400000	0.796860000	-0.019420000	0.823830000	-0.036780000	0.881250000	-0.064230000	0.739360000	-0.019420000	0.790890000	-0.091860000	g
1.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	b
1.000000000	0.000000000	0.852090000	0.392520000	0.388870000	0.764320000	0.088580000	0.989030000	-0.426250000	0.887440000	-0.762290000	0.499800000	-0.930920000	0.107680000	-0.859000000	-0.310440000	-0.660300000	-0.552620000	-0.192600000	-0.860630000	0.284440000	-0.804960000	0.646490000	-0.352300000	0.778140000	-0.233240000	0.716980000	0.213430000	0.378300000	0.583100000	0.196670000	0.663150000	-0.112150000	0.649330000	g
1.000000000	0.000000000	1.000000000	1.000000000	1.000000000	0.512500000	0.625000000	-1.000000000	1.000000000	1.000000000	0.025000000	0.031250000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	0.312500000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-0.943750000	1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	0.549020000	0.627450000	1.000000000	0.019610000	1.000000000	-0.490200000	0.921570000	-0.823530000	0.588240000	-1.000000000	0.117650000	-0.960780000	-0.333330000	-0.647060000	-0.686270000	-0.235290000	-0.862750000	0.352940000	-1.000000000	0.745100000	-0.725490000	0.921570000	-0.215690000	0.928740000	0.218760000	0.725490000	0.568630000	0.235290000	0.901960000	-0.117650000	0.901960000	g
1.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	0.437500000	1.000000000	-1.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	b
1.000000000	0.000000000	0.444440000	0.444440000	0.536950000	0.907630000	-0.222220000	1.000000000	-0.333330000	0.888890000	-1.000000000	0.333330000	-1.000000000	-0.111110000	-1.000000000	-0.222220000	-0.666670000	-0.777780000	0.555560000	-1.000000000	-0.222220000	-0.777780000	0.777780000	-0.222220000	0.333330000	0.000000000	0.921200000	0.450190000	0.574540000	0.843530000	0.222220000	1.000000000	-0.555560000	1.000000000	g
0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	0.000000000	1.000000000	0.000000000	0.500000000	0.500000000	0.750000000	0.000000000	0.912010000	0.120940000	0.890670000	0.142100000	0.869220000	0.162280000	0.750000000	0.250000000	0.750000000	0.500000000	0.750000000	0.000000000	1.000000000	-0.250000000	0.500000000	0.500000000	0.739440000	0.263880000	0.750000000	0.250000000	0.696350000	0.290740000	0.674930000	0.302930000	g
0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	0.000000000	1.000000000	0.000000000	0.666670000	0.111110000	1.000000000	-0.111110000	0.888890000	-0.111110000	1.000000000	-0.222220000	0.777780000	0.000000000	0.777780000	0.000000000	1.000000000	-0.111110000	0.777780000	-0.111110000	0.666670000	-0.111110000	0.666670000	0.000000000	0.903470000	-0.053520000	1.000000000	0.111110000	0.888890000	-0.111110000	1.000000000	0.000000000	g
0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	1.000000000	0.750000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	0.454550000	1.000000000	-0.454550000	1.000000000	0.090910000	1.000000000	-0.090910000	1.000000000	0.000000000	1.000000000	-0.272730000	1.000000000	-0.181820000	1.000000000	0.090910000	1.000000000	0.000000000	1.000000000	-0.363640000	1.000000000	0.090910000	1.000000000	-0.090910000	1.000000000	-0.049140000	1.000000000	0.454550000	1.000000000	-0.272730000	1.000000000	-0.181820000	g
1.000000000	0.000000000	0.621210000	-0.636360000	0.000000000	0.000000000	0.000000000	0.000000000	0.344700000	0.287880000	0.428030000	0.393940000	-0.075760000	0.518940000	0.363640000	0.314390000	-0.537880000	0.329550000	0.121210000	-0.147730000	0.018940000	-0.534090000	-0.575760000	0.178030000	0.291670000	-0.272730000	0.257580000	-0.575760000	0.431820000	0.242420000	0.181820000	-0.022730000	0.170450000	-0.416670000	b
1.000000000	0.000000000	1.000000000	0.117650000	1.000000000	0.235290000	1.000000000	0.411760000	1.000000000	0.058820000	1.000000000	0.235290000	1.000000000	0.117650000	1.000000000	0.470590000	1.000000000	-0.058820000	1.000000000	-0.117650000	1.000000000	0.352940000	1.000000000	0.411760000	1.000000000	-0.117650000	1.000000000	0.202250000	1.000000000	0.058820000	1.000000000	0.352940000	1.000000000	0.235290000	g
1.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	-0.627660000	1.000000000	0.510640000	0.079790000	-0.234040000	-1.000000000	-0.361700000	0.127660000	-0.590430000	1.000000000	-1.000000000	0.000000000	0.000000000	0.829790000	-0.079790000	-0.250000000	1.000000000	0.170210000	-0.707450000	0.000000000	0.000000000	-0.191490000	-0.468090000	-0.223400000	-0.489360000	0.744680000	0.904260000	-0.675530000	0.457450000	b
1.000000000	0.000000000	0.916670000	0.291670000	0.833330000	-0.166670000	0.708330000	0.250000000	0.875000000	-0.083330000	0.916670000	0.041670000	0.833330000	0.125000000	0.708330000	0.000000000	0.875000000	0.041670000	1.000000000	0.083330000	0.666670000	-0.083330000	0.750000000	0.166670000	0.833330000	-0.125000000	0.837960000	0.055030000	1.000000000	0.208330000	0.708330000	0.000000000	0.708330000	0.041670000	g
1.000000000	0.000000000	0.185900000	-0.166670000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.115380000	-0.190710000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-0.051280000	-0.065710000	0.078530000	0.089740000	0.173080000	-0.108970000	0.125000000	0.096150000	0.025640000	-0.048080000	0.168270000	0.195510000	b
1.000000000	0.000000000	1.000000000	-0.081830000	1.000000000	-0.113260000	0.992460000	-0.298020000	1.000000000	-0.330750000	0.966620000	-0.342810000	0.857880000	-0.472650000	0.919040000	-0.481700000	0.730840000	-0.652240000	0.681310000	-0.635440000	0.824500000	-0.783160000	0.588290000	-0.747850000	0.670330000	-0.962960000	0.487570000	-0.856690000	0.379410000	-0.838930000	0.241170000	-0.888460000	0.292210000	-0.896210000	g
1.000000000	0.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	-0.824560000	0.346490000	0.210530000	0.460530000	0.070180000	0.228070000	0.057020000	0.350880000	0.346490000	0.728070000	-0.039470000	0.228070000	0.530700000	0.000000000	0.000000000	-0.298250000	-0.162280000	1.000000000	-0.666670000	1.000000000	-1.000000000	1.000000000	-0.245610000	0.350880000	0.201750000	0.828950000	0.078950000	b
1.000000000	0.000000000	1.000000000	0.240770000	0.998150000	0.003690000	0.802440000	-0.301330000	0.899190000	-0.234860000	0.706430000	-0.240770000	0.738550000	-0.305390000	0.714920000	-0.360780000	0.471940000	-0.611890000	0.404730000	-0.550590000	0.610410000	-0.393280000	0.531760000	-0.326810000	0.239660000	-0.521420000	0.292080000	-0.483900000	0.127770000	-0.391430000	0.156570000	-0.513290000	0.183530000	-0.466030000	g
0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.922470000	-0.194480000	0.964190000	-0.176740000	0.870240000	-0.226020000	0.817020000	-0.270700000	0.792710000	-0.289090000	0.703020000	-0.496390000	0.633380000	-0.499670000	0.372540000	-0.707290000	0.270700000	-0.721090000	0.405060000	-0.541720000	0.335090000	-0.596910000	0.147500000	-0.636010000	0.093120000	-0.595890000	-0.071620000	-0.549280000	-0.018400000	-0.540740000	-0.074570000	-0.478980000	g
1.000000000	0.000000000	-1.000000000	-1.000000000	-0.506940000	1.000000000	1.000000000	-1.000000000	1.000000000	0.538190000	0.000000000	0.000000000	0.239580000	-1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	-0.715280000	1.000000000	0.333330000	-1.000000000	1.000000000	-1.000000000	0.697920000	-1.000000000	0.475690000	1.000000000	b
1.000000000	0.000000000	0.841770000	0.434600000	0.500000000	0.761600000	0.099160000	0.934600000	-0.377640000	0.881860000	-0.723630000	0.611810000	-0.938820000	0.194090000	-0.867090000	-0.255270000	-0.628690000	-0.656120000	-0.251050000	-0.856540000	0.162450000	-0.864980000	0.514770000	-0.668780000	0.748950000	-0.289030000	0.779370000	0.079330000	0.641350000	0.428270000	0.314350000	0.624470000	-0.004220000	0.694090000	g
1.000000000	0.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	0.635480000	1.000000000	1.000000000	0.771230000	1.000000000	-0.333330000	1.000000000	-1.000000000	1.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	0.000000000	-1.000000000	-0.666670000	-1.000000000	-0.925360000	-1.000000000	-0.333330000	-0.333330000	-1.000000000	0.192350000	-1.000000000	1.000000000	-1.000000000	0.000000000	-1.000000000	1.000000000	-0.666670000	g
0.000000000	0.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	0.068430000	1.000000000	0.142110000	1.000000000	0.221080000	1.000000000	-0.125000000	1.000000000	0.394950000	1.000000000	0.489810000	1.000000000	0.589860000	-0.375000000	1.000000000	1.000000000	0.000000000	1.000000000	0.920010000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	0.250000000	1.000000000	1.000000000	1.000000000	1.000000000	g
0.000000000	0.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.649470000	-0.078960000	0.582640000	-0.143800000	-0.131290000	-0.213840000	0.297960000	0.044030000	0.380960000	-0.263390000	0.289310000	-0.319970000	0.034590000	-0.189470000	0.202690000	-0.294410000	0.151960000	-0.290520000	0.095130000	-0.315250000	0.065560000	-0.267950000	0.030040000	-0.251240000	-0.000460000	-0.232100000	-0.026120000	-0.211290000	-0.047170000	-0.189500000	0.013360000	-0.272010000	g
1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	-0.333330000	0.166670000	0.260420000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-0.197920000	-0.218750000	-0.166670000	0.906250000	-1.000000000	0.500000000	0.041670000	0.750000000	-0.229170000	-1.000000000	-0.125000000	-0.270830000	-0.197920000	-0.937500000	b
1.000000000	0.000000000	1.000000000	0.051490000	0.993630000	0.101230000	0.961420000	0.147560000	0.955130000	-0.264960000	0.660260000	0.547010000	0.804260000	0.252830000	0.737810000	0.273800000	0.667750000	0.287140000	0.596150000	0.293040000	0.524940000	0.292000000	0.455820000	0.284760000	0.390230000	0.272260000	0.329300000	0.255530000	0.273810000	0.235680000	0.224270000	0.213780000	0.180860000	0.190830000	g
1.000000000	0.000000000	1.000000000	-0.095240000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	0.317460000	0.813490000	0.761900000	-1.000000000	-1.000000000	-1.000000000	1.000000000	0.473640000	1.000000000	1.000000000	1.000000000	0.688390000	-1.000000000	-1.000000000	-1.000000000	0.829370000	0.365080000	1.000000000	1.000000000	1.000000000	0.507940000	-1.000000000	-0.325400000	-1.000000000	0.728310000	b
1.000000000	0.000000000	0.936690000	-0.001900000	0.607610000	0.432040000	0.923140000	-0.401290000	0.931230000	0.168280000	0.961970000	0.090610000	0.996760000	0.081720000	0.915860000	0.050970000	0.846280000	-0.253240000	0.873790000	-0.144820000	0.848710000	0.261330000	0.750810000	-0.036410000	0.845470000	-0.025890000	0.872930000	-0.023020000	0.985440000	0.093850000	0.783170000	-0.101940000	0.858410000	-0.147250000	g
1.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-0.500000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	0.625000000	1.000000000	-0.750000000	-0.750000000	1.000000000	1.000000000	1.000000000	b
1.000000000	0.000000000	1.000000000	0.230580000	1.000000000	-0.785090000	1.000000000	-0.104010000	1.000000000	0.154140000	1.000000000	0.278200000	0.981200000	-0.068610000	1.000000000	0.066100000	0.958020000	-0.189540000	0.835840000	-0.156330000	0.974000000	0.037280000	0.996240000	0.092420000	1.000000000	-0.012530000	0.962380000	-0.045970000	0.911650000	0.038850000	1.000000000	-0.137220000	0.965230000	-0.117170000	g
1.000000000	0.000000000	0.368760000	-1.000000000	-1.000000000	-1.000000000	-0.076610000	1.000000000	1.000000000	0.950410000	0.745970000	-0.387100000	-1.000000000	-0.793130000	-0.096770000	1.000000000	0.486840000	0.465020000	0.317550000	-0.274610000	-0.143430000	-0.201880000	-0.119760000	0.068950000	0.030210000	0.066390000	0.034430000	-0.011860000	-0.004030000	-0.016720000	-0.007610000	0.001080000	0.000150000	0.003250000	b
1.000000000	0.000000000	0.798470000	0.382650000	0.808040000	-0.169640000	1.000000000	-0.076530000	0.981510000	-0.073980000	0.702170000	0.206630000	0.997450000	0.021050000	0.982140000	0.024870000	1.000000000	-0.130740000	0.956630000	0.077170000	1.000000000	0.001910000	0.903060000	0.308040000	1.000000000	-0.145410000	1.000000000	-0.003940000	0.756380000	0.079080000	1.000000000	-0.187500000	1.000000000	-0.057400000	g
0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	0.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	-0.284280000	1.000000000	-0.253460000	0.946230000	-0.350940000	1.000000000	-0.305660000	0.927360000	-0.490570000	0.908180000	-0.441190000	0.757230000	-0.588990000	0.697480000	-0.580190000	0.596230000	-0.575790000	0.684590000	-0.709750000	0.544650000	-0.873270000	0.492140000	-0.733330000	0.355040000	-0.760540000	0.263520000	-0.782390000	0.166040000	-0.731450000	0.139940000	-0.700000000	g
1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-0.850000000	-1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	-0.600000000	-1.000000000	1.000000000	1.000000000	-1.000000000	-0.200000000	1.000000000	-1.000000000	0.000000000	1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	0.090910000	0.954550000	-0.090910000	0.772730000	0.000000000	1.000000000	0.000000000	0.954550000	0.000000000	1.000000000	0.045450000	0.909090000	-0.045450000	1.000000000	0.000000000	1.000000000	0.000000000	0.863640000	0.090910000	0.772730000	0.090910000	0.909090000	0.045450000	0.915410000	0.028970000	0.954550000	0.090910000	0.863640000	-0.090910000	0.863640000	0.045450000	g
0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	-1.000000000	-0.312500000	-1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.911760000	-0.088240000	0.970590000	0.176470000	0.823530000	0.088240000	0.911760000	-0.029410000	0.970590000	-0.176470000	0.970590000	0.147060000	0.941180000	0.029410000	1.000000000	0.000000000	1.000000000	0.000000000	0.764710000	0.117650000	0.882350000	0.029410000	0.852940000	0.029410000	0.926630000	0.026000000	0.941180000	-0.117650000	0.970590000	0.058820000	0.911760000	0.058820000	g
1.000000000	0.000000000	-1.000000000	1.000000000	-1.000000000	0.152440000	0.283540000	1.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	-1.000000000	-0.234760000	0.283010000	-1.000000000	1.000000000	1.000000000	-0.314020000	-1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	-0.035780000	1.000000000	-1.000000000	-1.000000000	-0.323170000	0.149390000	1.000000000	b
1.000000000	0.000000000	0.473680000	-0.105260000	0.837810000	0.017560000	0.831550000	0.026150000	0.684210000	-0.052630000	0.684210000	0.000000000	0.798560000	0.050280000	0.783150000	0.057560000	0.842110000	0.473680000	1.000000000	0.052630000	0.725500000	0.076310000	0.703010000	0.081410000	0.421050000	0.210530000	0.654190000	0.089680000	0.526320000	-0.210530000	0.601500000	0.095340000	0.574180000	0.097190000	g
1.000000000	0.000000000	-0.006410000	-0.500000000	0.000000000	0.000000000	-0.019230000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.314100000	0.929490000	-0.352560000	0.743590000	-0.346150000	-0.807690000	0.000000000	0.000000000	-0.615380000	-0.512820000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	0.454550000	1.000000000	0.545450000	0.818180000	0.636360000	1.000000000	-0.090910000	1.000000000	0.000000000	0.818180000	-0.454550000	0.636360000	0.272730000	1.000000000	-0.636360000	1.000000000	-0.272730000	0.909090000	-0.454550000	1.000000000	0.077500000	1.000000000	-0.090910000	1.000000000	0.088670000	1.000000000	0.363640000	1.000000000	0.636360000	0.727270000	0.272730000	g
1.000000000	0.000000000	0.454550000	0.090910000	0.636360000	0.090910000	0.272730000	0.181820000	0.636360000	0.000000000	0.363640000	-0.090910000	0.454550000	-0.090910000	0.486120000	-0.013430000	0.636360000	-0.181820000	0.454550000	0.000000000	0.363640000	-0.090910000	0.272730000	0.181820000	0.363640000	-0.090910000	0.344420000	-0.017680000	0.272730000	0.000000000	0.363640000	0.000000000	0.289850000	-0.018320000	g
1.000000000	0.000000000	-1.000000000	-0.596770000	0.000000000	0.000000000	-1.000000000	0.645160000	-0.870970000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	0.298390000	0.233870000	1.000000000	0.516130000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	0.142860000	1.000000000	0.714290000	1.000000000	0.714290000	1.000000000	-0.142860000	0.857140000	-0.142860000	1.000000000	0.025340000	1.000000000	0.000000000	0.428570000	-0.142860000	1.000000000	0.036170000	1.000000000	-0.285710000	1.000000000	0.000000000	0.285710000	-0.285710000	1.000000000	0.048910000	1.000000000	0.051820000	1.000000000	0.571430000	1.000000000	0.000000000	g
0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	b
1.000000000	0.000000000	0.870320000	0.469720000	0.539450000	0.821610000	0.103800000	0.952750000	-0.380330000	0.879160000	-0.739390000	0.582260000	-0.920990000	0.167310000	-0.824170000	-0.249420000	-0.593830000	-0.633420000	-0.240120000	-0.828810000	0.188230000	-0.786990000	0.515570000	-0.574300000	0.692740000	-0.248430000	0.690970000	0.104840000	0.527980000	0.397620000	0.259740000	0.565730000	-0.067390000	0.575520000	g
0.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	b
1.000000000	0.000000000	0.926570000	0.041740000	0.892660000	0.157660000	0.860980000	0.197910000	0.836750000	0.365260000	0.806190000	0.401980000	0.762210000	0.405520000	0.665860000	0.483600000	0.601010000	0.517520000	0.533920000	0.521800000	0.484350000	0.542120000	0.425460000	0.556840000	0.333400000	0.552740000	0.269780000	0.542140000	0.223070000	0.534480000	0.143120000	0.491240000	0.115730000	0.465710000	g
0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	1.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.935370000	0.136450000	0.937160000	0.253590000	0.857050000	0.387790000	0.790390000	0.471270000	0.723520000	0.599420000	0.652600000	0.750000000	0.508300000	0.735860000	0.416290000	0.827420000	0.255390000	0.859520000	0.137120000	0.856150000	0.004940000	0.888690000	-0.073610000	0.797800000	-0.209950000	0.780040000	-0.331690000	0.714540000	-0.385320000	0.643630000	-0.474190000	0.558350000	g
0.000000000	0.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	1.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	b
1.000000000	0.000000000	0.806270000	0.130690000	0.730610000	0.243230000	0.646150000	0.190380000	0.369230000	0.455770000	0.447930000	0.464390000	0.250000000	0.573080000	0.251920000	0.371150000	0.152150000	0.518770000	-0.098080000	0.575000000	-0.034620000	0.428850000	-0.088560000	0.444240000	-0.149430000	0.400060000	-0.199400000	0.349760000	-0.238320000	0.295410000	-0.266340000	0.238960000	-0.238460000	0.311540000	g
0.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	b
1.000000000	0.000000000	0.974670000	0.130820000	0.941200000	0.200360000	0.887830000	0.322480000	0.890090000	0.327110000	0.855500000	0.452170000	0.722980000	0.522840000	0.699460000	0.588200000	0.585480000	0.668930000	0.488690000	0.703980000	0.442450000	0.681590000	0.352890000	0.756220000	0.268320000	0.762100000	0.168130000	0.785410000	0.074970000	0.804390000	-0.029620000	0.777020000	-0.102890000	0.742420000	g
0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.923080000	0.154510000	0.863990000	0.297570000	0.725820000	0.367900000	0.705880000	0.568300000	0.574490000	0.627190000	0.432700000	0.746760000	0.317050000	0.676970000	0.191280000	0.768180000	0.046860000	0.761710000	-0.120640000	0.769690000	-0.184790000	0.713270000	-0.292910000	0.657080000	-0.387980000	0.585530000	-0.467990000	0.501310000	-0.531460000	0.407320000	-0.562310000	0.350950000	g
0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	1.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.888040000	0.381380000	0.659260000	0.694310000	0.291480000	0.878920000	-0.067260000	0.901350000	-0.395970000	0.804410000	-0.645740000	0.565020000	-0.829600000	0.269060000	-0.789400000	-0.082050000	-0.627800000	-0.309420000	-0.466370000	-0.556050000	-0.164490000	-0.643380000	0.095620000	-0.610550000	0.304060000	-0.483920000	0.432270000	-0.298380000	0.470290000	-0.094610000	0.421520000	0.125560000	g
0.000000000	0.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	b
1.000000000	0.000000000	0.735230000	-0.382930000	0.801510000	0.102780000	0.788260000	0.152660000	0.555800000	0.052520000	1.000000000	0.212250000	0.719470000	0.289540000	0.687980000	0.329250000	0.496720000	0.172870000	0.643330000	-0.028450000	0.573990000	0.425280000	0.531200000	0.448720000	0.945300000	0.575490000	0.441740000	0.482000000	0.124730000	1.000000000	0.350700000	0.497210000	0.305880000	0.498310000	g
0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.946490000	0.008920000	0.972870000	-0.002600000	0.989220000	0.003720000	0.958010000	0.015980000	0.940540000	0.035300000	0.972130000	0.047190000	0.986250000	0.018580000	0.942770000	0.071350000	0.985510000	-0.007060000	0.977700000	0.049800000	0.963580000	0.070980000	0.932740000	0.081010000	0.952430000	0.043560000	0.974730000	0.008180000	0.978450000	0.070610000	1.000000000	-0.002600000	g
0.000000000	0.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	-1.000000000	-1.000000000	-1.000000000	-1.000000000	b
1.000000000	0.000000000	0.504660000	-0.169000000	0.714420000	0.015130000	0.710630000	0.022580000	0.680650000	0.012820000	0.346150000	0.055940000	0.690500000	0.043930000	0.681010000	0.050580000	0.670230000	0.056920000	0.634030000	-0.046620000	0.645030000	0.068560000	0.630770000	0.073810000	0.840330000	0.180650000	0.599350000	0.083040000	0.382280000	0.067600000	0.564660000	0.090460000	0.546320000	0.093460000	g
1.000000000	0.000000000	0.687290000	1.000000000	0.919730000	-0.760870000	0.817730000	0.043480000	0.760870000	0.107020000	0.867890000	0.737460000	0.700670000	0.182270000	0.759200000	0.137120000	0.934780000	-0.250840000	0.707360000	0.187290000	0.648830000	0.245820000	0.602010000	0.774250000	1.000000000	-0.538460000	0.892620000	0.222160000	0.710700000	0.538460000	1.000000000	-0.065220000	0.565220000	0.239130000	b
1.000000000	0.000000000	0.762960000	-0.077780000	1.000000000	-0.296300000	1.000000000	-0.857410000	0.800000000	0.061110000	0.455560000	-0.427780000	1.000000000	-0.125810000	1.000000000	-0.835190000	0.492590000	0.018520000	0.822220000	-0.059260000	0.982150000	-0.199380000	1.000000000	0.220370000	0.696300000	-0.264810000	0.921480000	-0.245490000	0.788890000	0.020370000	0.874920000	-0.271050000	1.000000000	-0.570370000	g
1.000000000	0.000000000	0.385210000	0.155640000	0.412450000	0.073930000	0.264590000	0.241250000	0.233460000	0.132300000	0.194550000	0.252920000	0.245140000	0.369650000	0.089490000	0.229570000	-0.038910000	0.369650000	0.050580000	0.249030000	0.249030000	0.097280000	0.077820000	0.299610000	-0.024940000	0.284820000	-0.060240000	0.262560000	-0.147860000	0.147860000	-0.093390000	0.311280000	-0.190660000	0.287940000	b
1.000000000	0.000000000	0.575400000	-0.031750000	0.751980000	-0.053570000	0.615080000	-0.011900000	0.539680000	0.033730000	0.617060000	0.099210000	0.591270000	-0.023810000	0.626980000	0.011900000	0.708330000	0.025790000	0.603170000	0.015870000	0.478170000	-0.027780000	0.591270000	0.037700000	0.500000000	0.039680000	0.612910000	-0.012370000	0.617060000	-0.134920000	0.688490000	-0.013890000	0.625000000	-0.031750000	g
1.000000000	0.000000000	0.064040000	-0.152710000	-0.044330000	0.059110000	0.083740000	-0.024630000	-0.014780000	0.187190000	0.064040000	0.000000000	0.123150000	-0.098520000	0.059110000	0.000000000	0.019700000	-0.029560000	-0.128080000	-0.206900000	0.068970000	0.014780000	0.068970000	0.029560000	0.078820000	0.162560000	0.280790000	-0.049260000	-0.059110000	-0.093600000	0.044330000	0.054190000	0.073890000	-0.108370000	b
1.000000000	0.000000000	0.618570000	0.108500000	0.706940000	-0.069350000	0.703580000	0.016780000	0.742730000	0.002240000	0.710290000	0.157720000	0.715880000	-0.002240000	0.797540000	0.066000000	0.836690000	-0.165550000	0.686800000	-0.090600000	0.625280000	-0.013420000	0.609620000	0.117450000	0.712530000	-0.095080000	0.698450000	-0.016730000	0.633110000	0.048100000	0.788590000	-0.051450000	0.652130000	-0.046980000	g
1.000000000	0.000000000	0.253160000	0.359490000	0.000000000	0.000000000	-0.296200000	-1.000000000	0.000000000	0.000000000	0.075950000	-0.073420000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.007590000	0.681010000	-0.200000000	0.336710000	-0.103800000	0.356960000	0.055700000	-1.000000000	0.000000000	0.000000000	0.063290000	-1.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.881030000	-0.008570000	0.898180000	-0.024650000	0.941050000	-0.018220000	0.891750000	-0.127550000	0.822080000	-0.109320000	0.888530000	0.011790000	0.907820000	-0.137190000	0.871380000	-0.061090000	0.907820000	-0.023580000	0.879960000	-0.145770000	0.828510000	-0.124330000	0.901390000	-0.195070000	0.882450000	-0.149030000	0.843520000	-0.128620000	0.884240000	-0.185420000	0.917470000	-0.168270000	g
1.000000000	0.000000000	0.427080000	-0.500000000	0.000000000	0.000000000	0.000000000	0.000000000	0.464580000	0.510420000	0.589580000	0.020830000	0.000000000	0.000000000	0.000000000	0.000000000	0.164580000	-0.454170000	0.591670000	-0.183330000	0.000000000	0.000000000	0.000000000	0.000000000	0.987500000	-0.408330000	-1.000000000	-1.000000000	-0.279170000	-0.756250000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.888530000	0.016310000	0.920070000	0.013050000	0.924420000	0.013590000	0.891790000	-0.102230000	0.901030000	-0.084280000	0.930400000	-0.010330000	0.930940000	-0.089180000	0.860250000	-0.050570000	0.894510000	-0.040240000	0.884180000	-0.121260000	0.889070000	-0.119090000	0.829800000	-0.141380000	0.864530000	-0.118080000	0.855360000	-0.130510000	0.835240000	-0.124520000	0.867860000	-0.122350000	g
1.000000000	0.000000000	0.000000000	0.000000000	1.000000000	0.128890000	0.884440000	-0.020000000	0.000000000	0.000000000	1.000000000	-0.424440000	1.000000000	0.195560000	1.000000000	-0.053330000	1.000000000	-0.815560000	0.000000000	0.000000000	1.000000000	-0.040000000	1.000000000	-0.186670000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	1.000000000	0.117780000	0.906670000	-0.095560000	b
1.000000000	0.000000000	0.811430000	0.037140000	0.851430000	-0.001430000	0.790000000	0.007140000	0.795710000	-0.042860000	0.875710000	0.000000000	0.855710000	-0.067140000	0.864290000	0.002860000	0.828570000	-0.054290000	0.810000000	-0.118570000	0.768570000	-0.084290000	0.842860000	-0.050000000	0.770000000	-0.068570000	0.815980000	-0.086690000	0.825710000	-0.104290000	0.814290000	-0.050000000	0.821430000	-0.151430000	g
1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	0.551720000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.498700000	0.018180000	0.431170000	-0.096100000	0.506490000	-0.041560000	0.501300000	0.096100000	0.446750000	0.059740000	0.558440000	-0.119480000	0.516880000	-0.036360000	0.527270000	-0.059740000	0.553250000	-0.010390000	0.485710000	-0.033770000	0.490910000	-0.010390000	0.592210000	0.000000000	0.532150000	-0.032800000	0.431170000	0.033770000	0.545450000	-0.054550000	0.589610000	-0.085710000	g
0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	1.000000000	0.500000000	1.000000000	0.250000000	0.250000000	1.000000000	0.168510000	0.911800000	-0.133360000	0.804540000	-0.341070000	0.607930000	-0.438200000	0.378560000	-0.436630000	0.167090000	-0.366760000	0.006780000	-0.264770000	-0.090250000	-0.161780000	-0.129640000	-0.077820000	-0.127440000	-0.020890000	-0.102420000	0.010330000	-0.070360000	0.022240000	-0.041420000	0.022490000	-0.020170000	g
1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	1.000000000	-0.111110000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	1.000000000	1.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	1.000000000	1.000000000	b
1.000000000	0.000000000	0.870480000	0.380270000	0.640990000	0.692120000	0.313470000	0.866250000	-0.039330000	0.907400000	-0.421730000	0.793460000	-0.705610000	0.515600000	-0.810490000	0.227350000	-0.811360000	-0.125390000	-0.674740000	-0.381020000	-0.383340000	-0.628610000	-0.130130000	-0.707620000	0.155520000	-0.664210000	0.385440000	-0.515680000	0.525730000	-0.298970000	0.562390000	-0.059380000	0.514600000	0.166450000	g
1.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	-1.000000000	1.000000000	0.000000000	0.000000000	1.000000000	0.373330000	-0.120000000	-0.120000000	0.000000000	0.000000000	-1.000000000	-1.000000000	0.000000000	0.000000000	1.000000000	-1.000000000	0.000000000	0.000000000	1.000000000	0.226670000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	0.000000000	b
1.000000000	0.000000000	0.881790000	0.434910000	0.595730000	0.776550000	0.196720000	0.945370000	-0.241030000	0.925440000	-0.625260000	0.712570000	-0.864430000	0.336520000	-0.923840000	-0.053380000	-0.773560000	-0.447070000	-0.469500000	-0.732850000	-0.102370000	-0.822170000	0.263840000	-0.775700000	0.559840000	-0.559100000	0.721470000	-0.244330000	0.724780000	0.095990000	0.581370000	0.389150000	0.347490000	0.576560000	g
1.000000000	0.000000000	0.328340000	0.025200000	0.152360000	0.212780000	0.149190000	0.740030000	-0.257060000	0.923240000	-0.103120000	0.193800000	-0.613520000	0.257860000	-0.940530000	-0.054090000	-0.131170000	-0.143290000	-0.303150000	-0.446150000	-0.114090000	-0.855970000	0.026680000	-0.227860000	0.279420000	-0.062950000	0.337370000	-0.118760000	0.276570000	-0.114090000	0.150780000	0.132960000	0.121970000	0.204680000	g
1.000000000	0.000000000	0.834270000	0.391210000	0.540400000	0.785790000	0.123260000	0.894020000	-0.332210000	0.835780000	-0.700860000	0.595640000	-0.866220000	0.219090000	-0.844420000	-0.241640000	-0.597140000	-0.618940000	-0.193540000	-0.877870000	0.124390000	-0.890640000	0.511090000	-0.724540000	0.791430000	-0.277340000	0.830080000	0.087180000	0.665920000	0.490790000	0.375420000	0.700110000	-0.039830000	0.794440000	g
1.000000000	0.000000000	0.623350000	-0.034900000	0.590850000	0.004810000	0.604090000	-0.074610000	0.631770000	0.009630000	0.624550000	-0.074610000	0.670280000	0.072200000	0.629360000	-0.084240000	0.675090000	0.091460000	0.671480000	0.000000000	0.589650000	0.101080000	0.500600000	0.031290000	0.659450000	0.140790000	0.604630000	0.020190000	0.513840000	0.044520000	0.617330000	-0.009630000	0.613720000	-0.091460000	g
1.000000000	0.000000000	0.744490000	-0.023900000	0.707720000	0.033090000	0.722430000	0.169120000	0.792280000	0.077210000	0.814340000	0.439340000	0.637870000	0.005510000	0.707720000	0.216910000	1.000000000	0.060660000	0.610290000	0.051470000	0.674630000	0.042280000	0.520220000	-0.250000000	0.729780000	-0.158090000	0.617270000	0.071240000	0.308820000	0.086400000	0.559160000	0.074580000	0.602940000	0.216910000	g
1.000000000	0.000000000	0.615380000	0.189230000	0.781570000	0.017800000	0.774860000	0.026470000	0.650770000	-0.103080000	0.775380000	0.080000000	0.739610000	0.050600000	0.723220000	0.057760000	0.686150000	-0.089230000	0.616920000	0.163080000	0.662330000	0.075730000	0.638780000	0.080410000	0.601540000	-0.072310000	0.588030000	0.087670000	0.550770000	0.256920000	0.533890000	0.092070000	0.506090000	0.093220000	g
1.000000000	0.000000000	0.683170000	0.053750000	0.848030000	0.002020000	0.843410000	0.003010000	0.843000000	0.099010000	0.758130000	0.041020000	0.818920000	0.005850000	0.807380000	0.006730000	0.806220000	-0.124470000	0.779350000	-0.035360000	0.763650000	0.009090000	0.746350000	0.009780000	0.796320000	-0.042430000	0.708240000	0.010960000	0.622350000	0.115980000	0.666240000	0.011900000	0.644070000	0.012270000	g
1.000000000	0.000000000	0.500000000	0.000000000	0.386960000	0.104350000	0.491300000	0.065220000	0.469570000	-0.039130000	0.356520000	-0.126090000	0.456520000	0.047830000	0.504350000	0.026090000	0.356520000	0.195650000	0.421740000	0.147830000	0.421740000	-0.026090000	0.321740000	-0.113040000	0.473910000	-0.008700000	0.417890000	0.069080000	0.386960000	0.039130000	0.352170000	0.147830000	0.447830000	0.173910000	g
1.000000000	0.000000000	0.798300000	0.094170000	0.781290000	0.206560000	0.716280000	0.280680000	0.693200000	0.412520000	0.659170000	0.501220000	0.578980000	0.608140000	0.492100000	0.584450000	0.333540000	0.678610000	0.295870000	0.635480000	0.095990000	0.681040000	0.020660000	0.722360000	-0.087480000	0.631830000	-0.119250000	0.606960000	-0.182260000	0.560150000	-0.255160000	0.517010000	-0.273390000	0.424670000	g
1.000000000	0.000000000	1.000000000	0.098020000	1.000000000	0.251010000	0.983900000	0.330440000	0.803650000	0.530200000	0.749770000	0.602970000	0.569370000	0.719420000	0.553110000	0.740790000	0.294520000	0.821930000	0.211370000	0.797770000	0.097090000	0.821620000	-0.017340000	0.798700000	-0.151440000	0.755960000	-0.228390000	0.691870000	-0.317130000	0.609480000	-0.402910000	0.545220000	-0.428150000	0.445340000	g
1.000000000	0.000000000	0.894100000	0.134250000	0.870010000	0.315430000	0.788960000	0.433880000	0.633880000	0.599750000	0.540030000	0.710160000	0.396990000	0.761610000	0.242660000	0.795230000	0.091340000	0.795980000	-0.091590000	0.762610000	-0.202010000	0.669260000	-0.302630000	0.626100000	-0.405520000	0.504890000	-0.462150000	0.407530000	-0.503140000	0.272520000	-0.528230000	0.191720000	-0.488080000	0.059720000	g
1.000000000	0.000000000	0.946310000	0.174980000	0.909460000	0.331430000	0.850960000	0.499600000	0.736780000	0.638420000	0.592150000	0.738380000	0.486980000	0.836140000	0.304590000	0.906650000	0.179590000	0.934290000	-0.007010000	0.931090000	-0.188800000	0.893830000	-0.330230000	0.824920000	-0.465340000	0.764820000	-0.585630000	0.663350000	-0.679290000	0.525640000	-0.753210000	0.424880000	-0.812100000	0.260920000	g
1.000000000	0.000000000	0.917670000	0.181980000	0.860900000	0.355430000	0.728730000	0.457470000	0.604250000	0.698650000	0.503760000	0.749220000	0.361000000	0.817950000	0.156640000	0.835580000	0.003960000	0.852100000	-0.163900000	0.778530000	-0.359960000	0.761930000	-0.430870000	0.653850000	-0.531400000	0.538860000	-0.603280000	0.409720000	-0.645110000	0.273380000	-0.657100000	0.136670000	-0.640560000	0.053940000	g
1.000000000	0.000000000	0.766270000	0.211060000	0.639350000	0.381120000	0.484090000	0.525000000	0.150000000	0.222730000	0.137530000	0.595650000	-0.077270000	0.445450000	0.000000000	0.486360000	-0.274910000	0.420140000	-0.561360000	0.368180000	-0.365910000	0.188640000	-0.405330000	0.075880000	-0.384830000	-0.032290000	-0.339420000	-0.124860000	-0.275400000	-0.197140000	-0.199620000	-0.246480000	-0.118940000	-0.272180000	g
1.000000000	0.000000000	0.589400000	-0.609270000	0.854300000	0.552980000	0.811260000	0.072850000	0.566230000	0.162250000	0.327810000	0.241720000	0.503310000	0.122520000	0.639070000	0.198680000	0.718540000	0.427150000	0.543050000	0.139070000	0.652320000	0.278150000	0.688740000	0.072850000	0.518720000	0.266530000	0.490130000	0.276870000	0.462160000	0.285740000	0.434840000	0.293240000	0.408210000	0.299420000	g
1.000000000	0.000000000	1.000000000	0.113850000	0.700190000	-0.121440000	0.815940000	0.096770000	0.711570000	0.011390000	0.561670000	-0.077800000	0.690700000	0.125240000	0.586340000	0.039850000	0.531310000	-0.034160000	0.694500000	0.168880000	0.726760000	0.072110000	0.320680000	0.058820000	0.533210000	0.373810000	0.490900000	0.179510000	0.151800000	0.324480000	0.441410000	0.188970000	0.561670000	0.151800000	g
1.000000000	0.000000000	0.848430000	0.067940000	0.805620000	-0.022990000	0.770310000	-0.032990000	0.667250000	-0.066200000	0.595820000	-0.076660000	0.672600000	-0.057710000	0.642600000	-0.064380000	0.391990000	0.045300000	0.712540000	0.013940000	0.559700000	-0.080390000	0.534300000	-0.084530000	0.470380000	-0.228220000	0.486590000	-0.091280000	0.526130000	-0.085370000	0.442770000	-0.096210000	0.422230000	-0.098080000	g
1.000000000	0.000000000	1.000000000	0.080130000	0.967750000	-0.004820000	0.966830000	-0.007220000	0.879800000	-0.039230000	1.000000000	0.014190000	0.961860000	-0.014360000	0.959470000	-0.016710000	0.984970000	0.010020000	0.911520000	-0.088480000	0.950160000	-0.023640000	0.946360000	-0.025910000	0.981640000	0.020030000	0.937720000	-0.030340000	1.000000000	-0.058430000	0.927740000	-0.034640000	0.922260000	-0.036730000	g
1.000000000	0.000000000	0.479380000	-0.123710000	0.427840000	-0.123710000	0.701030000	-0.391750000	0.731960000	0.072160000	0.262890000	-0.216490000	0.494850000	0.159790000	0.453610000	-0.118560000	0.422680000	0.061860000	0.500000000	-0.273200000	0.546390000	0.185570000	0.422680000	0.082470000	0.706190000	0.195880000	0.533960000	-0.124470000	0.154640000	-0.262890000	0.474230000	0.041240000	0.453610000	-0.515460000	g
1.000000000	0.000000000	0.635100000	-0.043880000	0.765300000	0.029680000	0.614320000	0.360280000	0.653580000	-0.004620000	0.642030000	0.083140000	0.794460000	-0.434180000	0.725170000	0.549650000	0.595840000	0.138570000	0.635100000	0.219400000	0.632790000	-0.254040000	0.709510000	0.153590000	0.646650000	0.230950000	0.687750000	0.177040000	0.616630000	0.076210000	0.663160000	0.198410000	0.690530000	0.367210000	g
1.000000000	0.000000000	0.501120000	-0.035960000	0.611240000	0.013480000	0.588760000	0.015730000	0.588760000	0.024720000	0.667420000	-0.004490000	0.716850000	-0.047190000	0.665170000	0.008990000	0.573030000	0.024720000	0.647190000	-0.074160000	0.568540000	0.141570000	0.575280000	-0.035960000	0.465170000	0.049440000	0.565880000	0.008240000	0.476400000	-0.035960000	0.546070000	0.105620000	0.606740000	-0.080900000	g
1.000000000	0.000000000	0.715210000	-0.006470000	0.666670000	-0.042070000	0.631070000	-0.051780000	0.779940000	0.080910000	0.673140000	0.097090000	0.647250000	0.158580000	0.601940000	-0.019420000	0.543690000	-0.045310000	0.469260000	-0.100320000	0.647250000	0.148870000	0.391590000	0.216830000	0.524270000	-0.055020000	0.451050000	0.000400000	0.313920000	-0.067960000	0.491910000	-0.106800000	0.304210000	-0.051780000	g
1.000000000	0.000000000	0.681480000	0.103700000	0.770370000	0.034570000	0.651850000	0.081480000	0.609880000	-0.004940000	0.790120000	0.118520000	0.597530000	0.049380000	0.624690000	0.096300000	0.782720000	-0.175310000	0.738270000	-0.108640000	0.486420000	0.009880000	0.609880000	0.081480000	0.666670000	-0.128400000	0.637730000	-0.024510000	0.765430000	0.022220000	0.612350000	-0.071600000	0.513580000	-0.046910000	g
1.000000000	0.000000000	0.606780000	-0.027120000	0.671190000	0.040680000	0.528810000	-0.044070000	0.505080000	0.037290000	0.705080000	-0.077970000	0.579660000	-0.020340000	0.532200000	0.077970000	0.640680000	0.118640000	0.569490000	-0.023730000	0.532200000	0.006780000	0.715250000	-0.033900000	0.528810000	-0.033900000	0.572620000	0.007500000	0.586440000	-0.003390000	0.589830000	-0.027120000	0.501690000	0.067800000	g
1.000000000	0.000000000	0.495150000	0.097090000	0.296120000	0.058250000	0.349510000	0.000000000	0.572820000	-0.024270000	0.582520000	0.024270000	0.334950000	0.048540000	0.524270000	0.004850000	0.470870000	-0.106800000	0.432040000	0.004850000	0.349510000	0.058250000	0.189320000	0.257280000	0.310680000	-0.150490000	0.365470000	0.038150000	0.393200000	0.174760000	0.262140000	0.000000000	0.373790000	-0.019420000	g
1.000000000	0.000000000	0.988220000	0.021870000	0.931020000	0.341000000	0.839040000	0.352220000	0.747060000	0.489060000	0.735840000	0.518790000	0.550760000	0.601790000	0.431300000	0.662370000	0.318000000	0.704430000	0.283790000	0.688730000	0.075150000	0.736960000	0.063380000	0.712840000	-0.164890000	0.697140000	-0.165560000	0.605100000	-0.162090000	0.558050000	-0.347170000	0.441950000	-0.334830000	0.374650000	g
1.000000000	0.000000000	0.979050000	0.158100000	0.901120000	0.352370000	0.820390000	0.485610000	0.717600000	0.648880000	0.588270000	0.737430000	0.403490000	0.831560000	0.251400000	0.848040000	0.047000000	0.854750000	-0.121930000	0.797490000	-0.261800000	0.807540000	-0.378350000	0.716760000	-0.510340000	0.583240000	-0.575870000	0.460400000	-0.618990000	0.307960000	-0.657540000	0.183450000	-0.641340000	0.029680000	g
1.000000000	0.000000000	0.997010000	0.216770000	0.919660000	0.470300000	0.769020000	0.624150000	0.533120000	0.781200000	0.367740000	0.882910000	0.101070000	0.833120000	-0.068270000	0.892740000	-0.282690000	0.720730000	-0.437070000	0.616880000	-0.557690000	0.481200000	-0.650000000	0.355340000	-0.646580000	0.159080000	-0.666510000	0.022770000	-0.648720000	-0.134620000	-0.546150000	-0.229490000	-0.472010000	-0.350320000	g
1.000000000	0.000000000	0.943310000	0.199590000	0.961320000	0.408030000	0.805140000	0.565690000	0.566870000	0.708300000	0.418360000	0.832300000	0.149390000	0.894890000	0.051670000	0.936820000	-0.247420000	0.839390000	-0.428110000	0.755540000	-0.502510000	0.625630000	-0.655150000	0.504280000	-0.688510000	0.309120000	-0.770970000	0.156190000	-0.754060000	-0.043990000	-0.751990000	-0.179210000	-0.669320000	-0.343670000	g
1.000000000	0.000000000	0.939720000	0.280820000	0.804860000	0.528210000	0.581670000	0.731510000	0.349610000	0.805110000	0.107970000	0.904030000	-0.200150000	0.893350000	-0.397300000	0.821630000	-0.588350000	0.628670000	-0.763050000	0.403680000	-0.812620000	0.188880000	-0.813170000	-0.042840000	-0.752730000	-0.268830000	-0.632370000	-0.464380000	-0.464220000	-0.614460000	-0.263890000	-0.708350000	-0.089370000	-0.712730000	g
1.000000000	0.000000000	0.898350000	0.351570000	0.673330000	0.622330000	0.438980000	0.943530000	-0.036430000	0.805100000	-0.228380000	0.753340000	-0.251370000	0.488160000	-0.573770000	0.284150000	-0.667500000	0.105910000	-0.473590000	-0.061930000	-0.810560000	-0.060110000	-0.331970000	-0.475920000	-0.128970000	-0.536200000	0.071580000	-0.519250000	0.243210000	-0.434780000	0.365860000	-0.300570000	0.428050000	0.132970000	g
1.000000000	0.000000000	0.290730000	0.100250000	0.233080000	0.172930000	0.037590000	0.343360000	0.120300000	0.263160000	0.062660000	0.213030000	-0.047250000	0.127670000	-0.063330000	0.079070000	-0.063280000	0.040970000	-0.054310000	0.014080000	-0.041660000	-0.002800000	-0.028760000	-0.011760000	-0.017550000	-0.015050000	-0.008860000	-0.014750000	-0.002800000	-0.012500000	0.000960000	-0.009480000	0.002900000	-0.006470000	g
1.000000000	0.000000000	0.584590000	-0.355260000	1.000000000	0.353380000	0.753760000	-0.005640000	0.825190000	0.193610000	0.501880000	-0.276320000	0.659770000	0.063910000	0.697370000	0.146620000	0.723680000	-0.426690000	0.761280000	0.045110000	0.669170000	0.204890000	0.847740000	-0.409770000	0.648500000	-0.046990000	0.568360000	-0.105710000	0.528200000	-0.133460000	0.156020000	-0.122180000	0.447670000	-0.103090000	g
1.000000000	0.000000000	0.836090000	0.132150000	0.721710000	0.060590000	0.658290000	0.083150000	0.238880000	0.129610000	0.438370000	0.203300000	0.494180000	0.126860000	0.447470000	0.135070000	0.293520000	0.029220000	0.481580000	0.157560000	0.328350000	0.146160000	0.294950000	0.146380000	0.264360000	0.145300000	0.236410000	0.143140000	0.264290000	0.161370000	0.187670000	0.136320000	0.166550000	0.131980000	g
1.000000000	0.000000000	0.940800000	0.119330000	0.857380000	0.010380000	0.851240000	0.015460000	0.769660000	-0.002780000	0.844590000	0.109160000	0.832890000	0.030270000	0.826800000	0.035060000	0.748380000	0.019430000	0.800190000	0.024050000	0.808620000	0.049010000	0.802590000	0.053520000	0.773360000	0.022200000	0.790580000	0.062350000	0.859390000	0.092510000	0.778630000	0.070900000	0.772690000	0.075080000	g
1.000000000	0.000000000	0.871110000	0.043260000	0.799460000	0.182970000	0.990090000	0.292920000	0.894550000	-0.083370000	0.885980000	-0.020280000	0.904460000	-0.267240000	0.894100000	0.199640000	0.886440000	-0.046420000	0.844520000	-0.009910000	0.978820000	-0.340240000	0.789540000	-0.251010000	0.866610000	-0.091930000	0.859670000	-0.029080000	0.787740000	-0.041010000	0.759350000	0.218120000	0.882380000	0.091930000	g
1.000000000	0.000000000	0.749160000	0.025490000	0.989940000	0.097920000	0.758550000	0.128770000	0.743130000	-0.091880000	0.958420000	0.024820000	0.979210000	-0.004690000	0.961100000	0.101950000	0.914820000	0.037560000	0.710260000	0.026830000	0.812210000	-0.080480000	1.000000000	0.000000000	0.717640000	-0.012070000	0.822710000	0.025520000	0.724350000	-0.010730000	0.904090000	0.110660000	0.728370000	0.027500000	g
1.000000000	0.000000000	0.473370000	0.195270000	0.062130000	-0.183430000	0.623160000	0.010060000	0.455620000	-0.044380000	0.565090000	0.017750000	0.446750000	0.275150000	0.715980000	-0.038460000	0.556210000	0.124260000	0.414200000	0.115380000	0.527670000	0.028420000	0.511830000	-0.106510000	0.479290000	-0.023670000	0.465140000	0.032590000	0.535500000	0.251480000	0.319530000	-0.144970000	0.346150000	-0.002960000	g
1.000000000	0.000000000	0.598870000	0.146890000	0.698680000	-0.139360000	0.851220000	-0.139360000	0.809790000	0.024480000	0.504710000	0.028250000	0.674200000	-0.045200000	0.807910000	-0.137480000	0.514120000	-0.244820000	0.815440000	-0.143130000	0.702450000	-0.003770000	0.333330000	0.062150000	0.561210000	-0.331450000	0.614440000	-0.168370000	0.527310000	-0.020720000	0.538610000	-0.312620000	0.674200000	-0.220340000	g
1.000000000	0.000000000	0.847130000	-0.033970000	0.864120000	-0.084930000	0.819530000	0.000000000	0.736730000	-0.076430000	0.719750000	-0.135880000	0.749470000	-0.116770000	0.774950000	-0.186840000	0.781320000	-0.212310000	0.619960000	-0.101910000	0.791930000	-0.157110000	0.893840000	-0.033970000	0.849260000	-0.261150000	0.741150000	-0.233120000	0.662420000	-0.222930000	0.726110000	-0.377920000	0.658170000	-0.248410000	g
1.000000000	0.000000000	0.877720000	-0.081520000	0.834240000	0.073370000	0.847830000	0.040760000	0.771740000	-0.021740000	0.771740000	-0.057070000	0.823370000	-0.105980000	0.679350000	-0.005430000	0.880430000	-0.209240000	0.834240000	0.032610000	0.864130000	-0.059780000	0.972830000	-0.279890000	0.850540000	-0.187500000	0.837050000	-0.102110000	0.858700000	-0.032610000	0.785330000	-0.108700000	0.790760000	-0.005430000	g
1.000000000	0.000000000	0.747040000	-0.132410000	0.537550000	0.169960000	0.727270000	0.094860000	0.695650000	-0.110670000	0.667980000	-0.235180000	0.879450000	-0.191700000	0.737150000	0.041500000	0.630430000	-0.003950000	0.636360000	-0.118580000	0.792490000	-0.252960000	0.664030000	-0.286560000	0.671940000	-0.104740000	0.618470000	-0.120410000	0.600790000	-0.209490000	0.375490000	0.069170000	0.610670000	-0.013830000	g
1.000000000	0.000000000	0.467850000	0.113080000	0.589800000	0.006650000	0.554320000	0.068740000	0.478940000	-0.139690000	0.529930000	0.013300000	0.638580000	-0.161860000	0.678490000	-0.033260000	0.545450000	-0.135250000	0.529930000	-0.046560000	0.478940000	-0.195120000	0.507760000	-0.135250000	0.414630000	-0.201770000	0.539300000	-0.114550000	0.598670000	-0.028820000	0.536590000	-0.117520000	0.563190000	-0.044350000	g
1.000000000	0.000000000	0.881160000	0.274750000	0.721250000	0.428810000	0.615590000	0.636620000	0.388250000	0.905020000	0.098310000	0.961280000	-0.200970000	0.892000000	-0.357370000	0.775000000	-0.651140000	0.622100000	-0.787680000	0.455350000	-0.818560000	0.190950000	-0.839430000	-0.080790000	-0.783340000	-0.263560000	-0.675570000	-0.455110000	-0.547320000	-0.608580000	-0.305120000	-0.667000000	-0.193120000	-0.755970000	g
1.000000000	0.000000000	0.931470000	0.292820000	0.799170000	0.557560000	0.599520000	0.715960000	0.262030000	0.926510000	0.046360000	0.967480000	-0.232370000	0.951300000	-0.559260000	0.810180000	-0.733290000	0.623850000	-0.909950000	0.362000000	-0.922540000	0.060400000	-0.936180000	-0.198380000	-0.831920000	-0.469060000	-0.651650000	-0.695560000	-0.412230000	-0.857250000	-0.135900000	-0.939530000	0.100070000	-0.948230000	g
1.000000000	0.000000000	0.882410000	0.306340000	0.732320000	0.578160000	0.341090000	0.585270000	0.057170000	1.000000000	-0.092380000	0.921180000	-0.624030000	0.719960000	-0.697670000	0.325580000	-0.814220000	0.411950000	-1.000000000	-0.007750000	-0.789730000	-0.410850000	-0.769010000	-0.454780000	-0.572420000	-0.676050000	-0.316100000	-0.818760000	-0.029790000	-0.868410000	0.253920000	-0.821270000	0.001940000	-0.816860000	g
1.000000000	0.000000000	0.834790000	0.289930000	0.692560000	0.477020000	0.492340000	0.683810000	0.219910000	0.867610000	-0.080960000	0.850110000	-0.355580000	0.776810000	-0.527350000	0.584250000	-0.703500000	0.312910000	-0.758210000	0.039390000	-0.712250000	-0.153170000	-0.583150000	-0.391680000	-0.371990000	-0.529540000	-0.169500000	-0.608630000	0.084250000	-0.614880000	0.251640000	-0.484680000	0.405910000	-0.353390000	g
1.000000000	0.000000000	0.928700000	0.331640000	0.761680000	0.623490000	0.493050000	0.842660000	0.215920000	0.951930000	-0.139560000	0.961670000	-0.472020000	0.835900000	-0.707470000	0.654900000	-0.874740000	0.367500000	-0.918140000	0.055950000	-0.898240000	-0.261730000	-0.739690000	-0.540690000	-0.507570000	-0.747350000	-0.223230000	-0.861220000	0.078100000	-0.871590000	0.360210000	-0.780570000	0.594070000	-0.602700000	g
1.000000000	0.000000000	0.833670000	0.314560000	0.655410000	0.576710000	0.349620000	0.706770000	0.172930000	0.789470000	-0.189760000	0.798860000	-0.417290000	0.665410000	-0.684210000	0.477440000	-0.747250000	0.194920000	-0.721800000	-0.048870000	-0.620300000	-0.281950000	-0.491650000	-0.534630000	-0.265770000	-0.660140000	-0.015300000	-0.697060000	0.227080000	-0.644280000	0.431000000	-0.512060000	0.646620000	-0.300750000	g
1.000000000	0.000000000	0.984550000	-0.027360000	0.980580000	-0.041040000	1.000000000	-0.076350000	0.987200000	0.014560000	0.952780000	-0.026040000	0.985000000	-0.074580000	0.993820000	-0.071490000	0.973960000	-0.095320000	0.972640000	-0.122240000	0.992940000	-0.052520000	0.952780000	-0.089140000	0.973520000	-0.083410000	0.966530000	-0.129120000	0.934690000	-0.149160000	0.971320000	-0.157550000	0.967780000	-0.188000000	g
1.000000000	0.000000000	0.940520000	-0.015310000	0.941700000	0.010010000	0.949940000	-0.014720000	0.958780000	-0.010600000	0.946410000	-0.037100000	0.971730000	-0.017670000	0.970550000	-0.038870000	0.954650000	-0.040640000	0.952300000	-0.047110000	0.942290000	-0.021790000	0.928150000	-0.044170000	0.920490000	-0.044760000	0.926950000	-0.058270000	0.903420000	-0.074790000	0.919910000	-0.072440000	0.920490000	-0.074200000	g
1.000000000	0.000000000	0.970320000	-0.143840000	0.913240000	-0.002280000	0.965750000	-0.171230000	0.986300000	0.182650000	0.917810000	0.002280000	0.936070000	-0.084470000	0.913240000	-0.002280000	0.867580000	-0.086760000	0.970320000	-0.212330000	1.000000000	0.102740000	0.920090000	-0.052510000	0.924660000	0.068490000	0.940430000	-0.092520000	0.970320000	-0.200910000	0.853880000	-0.086760000	0.965750000	-0.219180000	g
1.000000000	0.000000000	0.525420000	-0.033900000	0.949150000	0.084750000	0.525420000	-0.169490000	0.305080000	-0.016950000	0.508470000	-0.135590000	0.644070000	0.288140000	0.830510000	-0.355930000	0.542370000	0.016950000	0.559320000	0.033900000	0.593220000	0.305080000	0.864410000	0.050850000	0.406780000	0.152540000	0.672870000	-0.002660000	0.661020000	-0.033900000	0.830510000	-0.152540000	0.762710000	-0.101690000	g
1.000000000	0.000000000	0.333330000	-0.250000000	0.444440000	0.222220000	0.388890000	0.166670000	0.416670000	0.138890000	0.500000000	-0.111110000	0.549110000	-0.084430000	0.583330000	0.333330000	0.555560000	0.027780000	0.250000000	-0.194440000	0.472220000	-0.055560000	0.527780000	-0.027780000	0.388890000	0.083330000	0.415430000	-0.142560000	0.194440000	-0.138890000	0.369240000	-0.148090000	0.083330000	-0.500000000	g
1.000000000	0.000000000	0.512070000	1.000000000	1.000000000	0.538100000	0.711780000	0.808330000	0.456220000	0.464270000	0.330810000	1.000000000	0.212490000	1.000000000	-0.174160000	1.000000000	-0.330810000	0.987220000	-0.613820000	1.000000000	-0.526740000	0.716990000	-0.885000000	0.478940000	-1.000000000	0.351750000	-1.000000000	0.095690000	-1.000000000	-0.167130000	-1.000000000	-0.422260000	-0.919030000	-0.655570000	g
1.000000000	0.000000000	0.755640000	0.496380000	0.835500000	0.543010000	0.549160000	0.720630000	0.352250000	0.707920000	0.134690000	0.947490000	-0.098180000	0.937780000	-0.376040000	0.822230000	-0.527420000	0.711610000	-0.683580000	0.679890000	-0.701630000	0.249560000	-0.791470000	0.029950000	-0.989880000	-0.290990000	-0.703520000	-0.327920000	-0.633120000	-0.191850000	-0.341310000	-0.604540000	-0.196090000	-0.629560000	g
1.000000000	0.000000000	0.837890000	0.429040000	0.721130000	0.583850000	0.456250000	0.781150000	0.164700000	0.827320000	-0.130120000	0.869470000	-0.461770000	0.784970000	-0.594350000	0.520700000	-0.784700000	0.265290000	-0.840140000	0.039280000	-0.620410000	-0.313510000	-0.474120000	-0.489050000	-0.372980000	-0.677960000	-0.050540000	-0.626910000	0.146900000	-0.459110000	0.370930000	-0.391670000	0.483190000	-0.243130000	g
1.000000000	0.000000000	0.936580000	0.351070000	0.752540000	0.656400000	0.455710000	0.885760000	0.153230000	0.957760000	-0.217750000	0.963010000	-0.565350000	0.833970000	-0.787510000	0.580450000	-0.931040000	0.260200000	-0.936410000	-0.064180000	-0.870280000	-0.409490000	-0.650790000	-0.674640000	-0.367990000	-0.849510000	-0.045780000	-0.912210000	0.273300000	-0.857620000	0.548270000	-0.696130000	0.748280000	-0.441730000	g
1.000000000	0.000000000	0.924360000	0.369240000	0.719760000	0.684200000	0.293030000	0.940780000	-0.111080000	0.765270000	-0.316050000	0.924530000	-0.666160000	0.787660000	-0.921450000	0.423140000	-0.943150000	0.095850000	-1.000000000	0.031910000	-0.664310000	-0.662780000	-0.460100000	-0.781740000	-0.134860000	-0.880820000	0.197650000	-0.851370000	0.489040000	-0.702470000	0.698860000	-0.460480000	0.760660000	-0.131940000	g
1.000000000	0.000000000	1.000000000	0.161950000	1.000000000	-0.055580000	1.000000000	0.013730000	1.000000000	-0.123520000	1.000000000	-0.015110000	1.000000000	-0.017310000	1.000000000	-0.063740000	1.000000000	-0.071570000	1.000000000	0.059000000	1.000000000	-0.101080000	1.000000000	-0.026850000	1.000000000	-0.229780000	1.000000000	-0.068230000	1.000000000	0.082990000	1.000000000	-0.141940000	1.000000000	-0.074390000	g
1.000000000	0.000000000	0.955590000	-0.001550000	0.864210000	-0.132440000	0.949820000	-0.004610000	0.828090000	-0.511710000	0.924410000	0.103680000	1.000000000	-0.142470000	0.992640000	-0.025420000	0.958530000	-0.155180000	0.840130000	0.617390000	1.000000000	-0.163210000	0.874920000	-0.084950000	0.857410000	-0.016640000	0.841320000	-0.017690000	0.824270000	-0.018670000	0.806340000	-0.019570000	0.787610000	-0.020390000	g
1.000000000	0.000000000	0.793780000	0.294920000	0.640640000	0.523120000	0.413190000	0.681580000	0.141770000	0.835480000	-0.168310000	0.787720000	-0.429110000	0.723280000	-0.571650000	0.414710000	-0.754360000	0.167550000	-0.699770000	-0.098560000	-0.576950000	-0.235030000	-0.406370000	-0.382870000	-0.174370000	-0.525400000	0.015230000	-0.487070000	0.190300000	-0.380590000	0.310080000	-0.231990000	0.345720000	-0.080360000	g
1.000000000	0.000000000	0.880850000	0.352320000	0.683890000	0.651280000	0.348160000	0.797840000	0.058320000	0.908420000	-0.297840000	0.864900000	-0.626350000	0.695900000	-0.771060000	0.393090000	-0.858030000	0.084080000	-0.816410000	-0.240170000	-0.645790000	-0.500220000	-0.397660000	-0.683370000	-0.111470000	-0.755330000	0.170410000	-0.715040000	0.406750000	-0.576490000	0.566260000	-0.367650000	0.627650000	-0.133050000	g
1.000000000	0.000000000	0.895890000	0.392860000	0.661290000	0.718040000	0.295210000	0.908240000	-0.047870000	0.944150000	-0.457250000	0.846050000	-0.776600000	0.585110000	-0.928190000	0.251330000	-0.922820000	-0.153150000	-0.760640000	-0.484040000	-0.509310000	-0.761970000	-0.148950000	-0.885910000	0.215810000	-0.857030000	0.532290000	-0.685930000	0.748460000	-0.406560000	0.831420000	-0.070290000	0.768620000	0.279260000	g
1.000000000	0.000000000	1.000000000	-0.240510000	1.000000000	-0.202530000	0.873420000	-0.101270000	0.886080000	0.012660000	1.000000000	0.113920000	0.924050000	0.063290000	0.848100000	-0.037970000	0.632910000	-0.367090000	0.873420000	-0.012660000	0.936710000	0.063290000	1.000000000	0.253160000	0.620250000	-0.379750000	0.846370000	-0.055400000	1.000000000	-0.063290000	0.531650000	0.025320000	0.835440000	-0.025320000	g
1.000000000	0.000000000	0.747900000	0.008400000	0.833120000	0.016590000	0.826380000	0.024690000	0.865550000	0.016810000	0.605040000	0.058820000	0.790930000	0.047310000	0.774410000	0.054070000	0.647060000	0.193280000	0.840340000	0.042020000	0.712850000	0.071220000	0.688950000	0.075770000	0.663870000	0.084030000	0.637280000	0.082960000	0.613450000	0.016810000	0.581870000	0.087570000	0.553300000	0.088910000	g
1.000000000	0.000000000	0.850130000	0.018090000	0.922110000	0.014560000	0.920460000	0.021800000	0.927650000	0.080100000	0.875970000	0.113700000	0.911610000	0.043200000	0.907380000	0.050180000	0.873390000	0.028420000	0.958660000	0.000000000	0.890970000	0.070470000	0.884300000	0.076970000	0.837210000	0.108530000	0.869230000	0.089500000	0.875970000	0.087860000	0.851980000	0.101340000	0.842580000	0.106980000	g
1.000000000	0.000000000	1.000000000	-0.011790000	1.000000000	-0.003430000	1.000000000	-0.015650000	1.000000000	-0.015650000	1.000000000	-0.028090000	1.000000000	-0.021870000	0.998280000	-0.030870000	0.995280000	-0.032380000	0.993140000	-0.034520000	1.000000000	-0.038810000	1.000000000	-0.050390000	1.000000000	-0.049310000	0.998420000	-0.055270000	0.994000000	-0.063040000	0.990570000	-0.064970000	0.989710000	-0.066680000	g
1.000000000	0.000000000	0.895050000	-0.031680000	0.875250000	0.055450000	0.895050000	0.013860000	0.928710000	0.027720000	0.912870000	-0.009900000	0.940590000	-0.015840000	0.918810000	0.033660000	0.936630000	0.000000000	0.942570000	0.013860000	0.904950000	0.007920000	0.887130000	-0.017820000	0.893070000	0.023760000	0.890020000	0.016110000	0.881190000	0.001980000	0.873270000	0.041580000	0.867330000	0.023760000	g
1.000000000	0.000000000	0.900710000	0.017730000	1.000000000	-0.017730000	0.900710000	0.007090000	0.847520000	0.056740000	1.000000000	0.035460000	0.978720000	0.010640000	0.975180000	0.035460000	1.000000000	-0.031910000	0.897160000	-0.031910000	0.861700000	0.078010000	1.000000000	0.092200000	0.900710000	0.046100000	0.943050000	0.032470000	0.946810000	0.024820000	1.000000000	0.010640000	0.936170000	0.021280000	g
1.000000000	0.000000000	0.393940000	-0.242420000	0.626550000	0.012700000	0.454550000	0.090910000	0.636360000	0.090910000	0.212120000	-0.212120000	0.575760000	0.151520000	0.393940000	0.000000000	0.561560000	0.045610000	0.515150000	0.030300000	0.787880000	0.181820000	0.303030000	-0.151520000	0.485260000	0.059290000	0.463620000	0.061420000	0.333330000	-0.030300000	0.418560000	0.064100000	0.393940000	0.242420000	g
1.000000000	0.000000000	0.866890000	0.359500000	0.720140000	0.666670000	0.372010000	0.830490000	0.086460000	0.858930000	-0.241180000	0.861210000	-0.517630000	0.675770000	-0.687140000	0.415240000	-0.770190000	0.098980000	-0.693970000	-0.136520000	-0.494880000	-0.422070000	-0.325370000	-0.576790000	-0.028440000	-0.599540000	0.153600000	-0.531270000	0.323090000	-0.370880000	0.461890000	-0.196810000	0.409560000	0.018200000	g
1.000000000	0.000000000	0.895630000	0.379170000	0.673110000	0.694380000	0.359160000	0.886960000	-0.041930000	0.933450000	-0.388750000	0.844140000	-0.672740000	0.620780000	-0.826800000	0.303560000	-0.861500000	-0.053650000	-0.735640000	-0.342750000	-0.517780000	-0.624430000	-0.234280000	-0.738550000	0.069110000	-0.738560000	0.335310000	-0.622960000	0.524140000	-0.420860000	0.612170000	-0.173430000	0.600730000	0.086600000	g
1.000000000	0.000000000	0.905470000	0.411130000	0.653540000	0.747610000	0.299210000	0.959050000	-0.133420000	0.978200000	-0.522360000	0.832630000	-0.796570000	0.550860000	-0.966310000	0.151920000	-0.930010000	-0.255540000	-0.718630000	-0.593790000	-0.415460000	-0.852050000	-0.022500000	-0.937880000	0.363180000	-0.853680000	0.675380000	-0.619590000	0.859770000	-0.281230000	0.886540000	0.098000000	0.754950000	0.463010000	g
1.000000000	0.000000000	1.000000000	1.000000000	0.367000000	0.061580000	0.129930000	0.927130000	-0.275860000	0.935960000	-0.315270000	0.376850000	-0.871920000	0.369460000	-0.928570000	-0.088670000	-0.389160000	-0.342360000	-0.465520000	-0.825120000	-0.054190000	-0.935960000	0.256160000	-0.204430000	0.737920000	-0.459500000	0.854710000	-0.068310000	1.000000000	1.000000000	0.386700000	0.002460000	0.177580000	0.797900000	g
1.000000000	0.000000000	1.000000000	0.515150000	0.454550000	0.333330000	0.060610000	0.363640000	-0.321040000	0.730620000	-0.454550000	0.484850000	-0.575760000	0.000000000	-0.575760000	-0.121210000	-0.333330000	-0.484850000	-0.090910000	-0.848480000	0.484850000	-0.575760000	0.575760000	-0.424240000	1.000000000	-0.393940000	0.729610000	0.123310000	0.969700000	0.575760000	0.242420000	0.363640000	0.090910000	0.333330000	g
1.000000000	0.000000000	0.881100000	0.000000000	0.948170000	-0.027440000	0.935980000	-0.012200000	0.902440000	0.018290000	0.902440000	0.018290000	0.939020000	0.009150000	0.957320000	0.003050000	1.000000000	0.027440000	0.942070000	-0.012200000	0.908540000	0.024390000	0.914630000	0.054880000	0.996950000	0.048780000	0.896660000	0.022260000	0.908540000	0.009150000	1.000000000	0.054880000	0.975610000	-0.012200000	g
1.000000000	0.000000000	0.826240000	0.081560000	0.790780000	-0.081560000	0.904260000	-0.017730000	0.929080000	0.010640000	0.801420000	0.088650000	0.946810000	-0.007090000	0.943260000	0.000000000	0.932620000	0.202130000	0.950350000	-0.007090000	0.914890000	0.007090000	0.804960000	0.070920000	0.911350000	0.159570000	0.895270000	0.081650000	0.776600000	0.067380000	0.925530000	0.180850000	0.925530000	0.000000000	g
1.000000000	0.000000000	0.744680000	0.106380000	0.887060000	0.009820000	0.885420000	0.014710000	0.872340000	-0.014180000	0.730500000	0.106380000	0.876570000	0.029120000	0.872350000	0.033820000	0.957450000	0.078010000	0.950350000	0.042550000	0.855970000	0.047430000	0.849310000	0.051780000	0.872340000	0.113480000	0.834290000	0.060140000	0.744680000	-0.035460000	0.817100000	0.068000000	0.807740000	0.071730000	g
1.000000000	0.000000000	0.875780000	0.037270000	0.899510000	0.003430000	0.892100000	0.005100000	0.863350000	0.000000000	0.950310000	0.074530000	0.870210000	0.009940000	0.863030000	0.011510000	0.838510000	-0.062110000	0.857140000	0.024840000	0.841820000	0.016030000	0.834860000	0.017490000	0.795030000	-0.043480000	0.821110000	0.020330000	0.819880000	0.086960000	0.807570000	0.023080000	0.800880000	0.024410000	g
1.000000000	0.000000000	0.975130000	0.007100000	0.985790000	0.019540000	1.000000000	0.019540000	0.992900000	0.015990000	0.957370000	0.023090000	0.971580000	0.035520000	1.000000000	0.037300000	0.978690000	0.021310000	0.985790000	0.056840000	0.971580000	0.047960000	0.944940000	0.055060000	0.984010000	0.035520000	0.975400000	0.064770000	0.948490000	0.081710000	0.991120000	0.062170000	0.989340000	0.099470000	g
1.000000000	0.000000000	1.000000000	0.011050000	1.000000000	0.011050000	1.000000000	0.023200000	0.994480000	-0.014360000	0.994480000	-0.002210000	0.983430000	0.023200000	1.000000000	0.008840000	0.975690000	0.007730000	0.979010000	0.016570000	0.980110000	0.006630000	0.981220000	0.020990000	0.971270000	-0.006630000	0.980330000	0.016000000	0.979010000	0.015470000	0.985640000	0.020990000	0.986740000	0.027620000	g
1.000000000	0.000000000	1.000000000	-0.013420000	1.000000000	0.015660000	1.000000000	-0.002240000	1.000000000	0.062640000	0.977630000	0.044740000	0.959730000	0.029080000	1.000000000	0.064880000	0.988810000	0.033560000	1.000000000	0.035790000	0.997760000	0.093960000	0.957490000	0.073830000	1.000000000	0.100670000	0.999890000	0.087630000	0.991050000	0.085010000	1.000000000	0.100670000	1.000000000	0.100670000	g
1.000000000	0.000000000	0.884200000	0.367240000	0.671230000	0.673820000	0.396130000	0.863990000	0.024240000	0.931820000	-0.351480000	0.837130000	-0.603160000	0.588420000	-0.786580000	0.387780000	-0.832850000	-0.006420000	-0.693180000	-0.329630000	-0.525040000	-0.539240000	-0.273770000	-0.681260000	0.008060000	-0.697740000	0.260280000	-0.606780000	0.445690000	-0.433830000	0.542090000	-0.215420000	0.562860000	0.028230000	g
1.000000000	0.000000000	0.901470000	0.417860000	0.641310000	0.757250000	0.304400000	0.951480000	-0.204490000	0.965340000	-0.554830000	0.811910000	-0.818570000	0.509490000	-0.969860000	0.103450000	-0.914560000	-0.314120000	-0.701630000	-0.654610000	-0.323540000	-0.889990000	0.058650000	-0.941720000	0.444830000	-0.821540000	0.741050000	-0.552310000	0.894150000	-0.187250000	0.878930000	0.203590000	0.705550000	0.548520000	g
1.000000000	0.000000000	0.327890000	0.110420000	0.159700000	0.293080000	0.140200000	0.744850000	-0.251310000	0.919930000	-0.165030000	0.266640000	-0.637140000	0.248650000	-0.976500000	-0.003370000	-0.232270000	-0.199090000	-0.305220000	-0.488860000	-0.144260000	-0.899910000	0.093450000	-0.289160000	0.283070000	-0.185600000	0.395990000	-0.114980000	0.310050000	0.056140000	0.214430000	0.205400000	0.133760000	0.264220000	g
1.000000000	0.000000000	0.658450000	0.436170000	0.446810000	0.748040000	0.053190000	0.851060000	-0.320270000	0.821390000	-0.682530000	0.524080000	-0.842110000	0.071110000	-0.828110000	-0.287230000	-0.470320000	-0.717250000	-0.047590000	-0.860020000	0.232920000	-0.763160000	0.566630000	-0.521280000	0.743000000	-0.186450000	0.747580000	0.237130000	0.451850000	0.590710000	0.205490000	0.767640000	-0.185330000	0.743560000	g
1.000000000	0.000000000	0.194660000	0.057250000	0.041980000	0.251910000	-0.105570000	0.488660000	-0.183210000	-0.183210000	-0.419850000	0.061070000	-0.454200000	0.091600000	-0.164120000	-0.305340000	-0.103050000	-0.396950000	0.187020000	-0.175570000	0.340120000	-0.119530000	0.286260000	-0.160310000	0.216450000	0.246920000	0.039130000	0.310920000	-0.038170000	0.263360000	-0.167940000	0.167940000	-0.301530000	-0.335880000	g
1.000000000	0.000000000	0.980020000	0.000750000	1.000000000	0.000000000	0.989820000	-0.000750000	0.947210000	0.023940000	0.977000000	0.021300000	0.978880000	0.030730000	0.991700000	0.023380000	0.939290000	0.057130000	0.935520000	0.052790000	0.977380000	0.055240000	1.000000000	0.062410000	0.941550000	0.081070000	0.967090000	0.072550000	0.957010000	0.080880000	0.981900000	0.081260000	0.972470000	0.086160000	g
1.000000000	0.000000000	0.822540000	-0.075720000	0.804620000	0.002310000	0.875140000	-0.012140000	0.868210000	-0.075140000	0.728320000	-0.117340000	0.846240000	0.050290000	0.831210000	-0.073990000	0.747980000	0.067050000	0.783240000	0.063580000	0.867630000	-0.023700000	0.788440000	-0.060120000	0.744510000	-0.023700000	0.767170000	-0.027310000	0.740460000	-0.076300000	0.700580000	-0.042200000	0.784390000	0.012140000	g
1.000000000	0.000000000	0.353460000	-0.137680000	0.693870000	-0.024230000	0.681950000	-0.035740000	0.557170000	-0.061190000	0.618360000	-0.104670000	0.620990000	-0.065270000	0.593610000	-0.072890000	0.422710000	-0.264090000	0.582130000	0.049920000	0.497360000	-0.087710000	0.462410000	-0.089890000	0.450080000	-0.005640000	0.391460000	-0.090380000	0.355880000	-0.103060000	0.322320000	-0.086370000	0.289430000	-0.083000000	g
1.000000000	0.000000000	0.760460000	0.010920000	0.863350000	0.002580000	0.858210000	0.003840000	0.799880000	0.023040000	0.815040000	0.120680000	0.830960000	0.007440000	0.818150000	0.008540000	0.827770000	-0.069740000	0.765310000	0.038810000	0.769790000	0.011480000	0.750710000	0.012320000	0.771380000	-0.003030000	0.708860000	0.013750000	0.661610000	0.008490000	0.662980000	0.014840000	0.638870000	0.015250000	g
1.000000000	0.000000000	0.666670000	-0.013660000	0.974040000	0.068310000	0.495900000	0.501370000	0.756830000	-0.002730000	0.651640000	-0.140710000	0.401640000	-0.489070000	0.392080000	0.587430000	0.767760000	0.318310000	0.785520000	0.113390000	0.475410000	-0.449450000	1.000000000	0.006830000	0.606560000	0.069670000	0.686560000	0.170880000	0.875680000	0.077870000	0.553280000	0.245900000	0.139340000	0.480870000	g
1.000000000	0.000000000	0.835080000	0.082980000	0.737390000	-0.147060000	0.843490000	-0.055670000	0.904410000	-0.046220000	0.893910000	0.131300000	0.811970000	0.067230000	0.793070000	-0.089290000	1.000000000	-0.021010000	0.966390000	0.066180000	0.876050000	0.011550000	0.775210000	0.066180000	0.953780000	-0.042020000	0.834790000	0.001230000	1.000000000	0.128150000	0.866600000	-0.107140000	0.905460000	-0.043070000	g
1.000000000	0.000000000	0.951130000	0.004190000	0.951830000	-0.027230000	0.934380000	-0.019200000	0.945900000	0.016060000	0.965100000	0.032810000	0.941710000	0.073300000	0.946250000	-0.013260000	0.971730000	0.001400000	0.948340000	0.060380000	0.926700000	0.084120000	0.931240000	0.100870000	0.945200000	0.013610000	0.935220000	0.049250000	0.931590000	0.081680000	0.940660000	-0.000350000	0.914830000	0.047120000	g
1.000000000	0.000000000	0.947010000	-0.000340000	0.932070000	-0.032270000	0.951770000	-0.034310000	0.955840000	0.024460000	0.941240000	0.017660000	0.925950000	0.046880000	0.939540000	-0.014610000	0.948370000	0.020040000	0.937840000	0.013930000	0.914060000	0.076770000	0.894700000	0.061480000	0.939880000	0.031930000	0.924890000	0.025420000	0.921200000	0.022420000	0.924590000	0.004420000	0.926970000	-0.005770000	g
1.000000000	0.000000000	0.906080000	-0.016570000	0.981220000	-0.019890000	0.956910000	-0.036460000	0.857460000	0.001100000	0.897240000	-0.033150000	0.890610000	-0.014360000	0.906080000	-0.045300000	0.913810000	-0.008840000	0.807730000	-0.129280000	0.887290000	0.012150000	0.921550000	-0.023200000	0.910500000	-0.020990000	0.891470000	-0.077600000	0.829830000	-0.172380000	0.960220000	-0.037570000	0.874030000	-0.162430000	g
1.000000000	0.000000000	0.847100000	0.135330000	0.736380000	-0.061510000	0.878730000	0.082600000	0.889280000	-0.091390000	0.787350000	0.066780000	0.806680000	-0.003510000	0.792620000	-0.010540000	0.857640000	-0.045690000	0.871700000	-0.035150000	0.817220000	-0.094900000	0.710020000	0.043940000	0.864670000	-0.151140000	0.811470000	-0.048220000	0.782070000	-0.007030000	0.757470000	-0.066780000	0.857640000	-0.061510000	g
\.


--
-- TOC entry 2210 (class 0 OID 17238)
-- Dependencies: 196
-- Data for Name: iris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iris (x1, x2, x3, x4, class) FROM stdin;
5.100000000	3.500000000	1.400000000	0.200000000	Iris-setosa
4.900000000	3.000000000	1.400000000	0.200000000	Iris-setosa
4.700000000	3.200000000	1.300000000	0.200000000	Iris-setosa
4.600000000	3.100000000	1.500000000	0.200000000	Iris-setosa
5.000000000	3.600000000	1.400000000	0.200000000	Iris-setosa
5.400000000	3.900000000	1.700000000	0.400000000	Iris-setosa
4.600000000	3.400000000	1.400000000	0.300000000	Iris-setosa
5.000000000	3.400000000	1.500000000	0.200000000	Iris-setosa
4.400000000	2.900000000	1.400000000	0.200000000	Iris-setosa
4.900000000	3.100000000	1.500000000	0.100000000	Iris-setosa
5.400000000	3.700000000	1.500000000	0.200000000	Iris-setosa
4.800000000	3.400000000	1.600000000	0.200000000	Iris-setosa
4.800000000	3.000000000	1.400000000	0.100000000	Iris-setosa
4.300000000	3.000000000	1.100000000	0.100000000	Iris-setosa
5.800000000	4.000000000	1.200000000	0.200000000	Iris-setosa
5.700000000	4.400000000	1.500000000	0.400000000	Iris-setosa
5.400000000	3.900000000	1.300000000	0.400000000	Iris-setosa
5.100000000	3.500000000	1.400000000	0.300000000	Iris-setosa
5.700000000	3.800000000	1.700000000	0.300000000	Iris-setosa
5.100000000	3.800000000	1.500000000	0.300000000	Iris-setosa
5.400000000	3.400000000	1.700000000	0.200000000	Iris-setosa
5.100000000	3.700000000	1.500000000	0.400000000	Iris-setosa
4.600000000	3.600000000	1.000000000	0.200000000	Iris-setosa
5.100000000	3.300000000	1.700000000	0.500000000	Iris-setosa
4.800000000	3.400000000	1.900000000	0.200000000	Iris-setosa
5.000000000	3.000000000	1.600000000	0.200000000	Iris-setosa
5.000000000	3.400000000	1.600000000	0.400000000	Iris-setosa
5.200000000	3.500000000	1.500000000	0.200000000	Iris-setosa
5.200000000	3.400000000	1.400000000	0.200000000	Iris-setosa
4.700000000	3.200000000	1.600000000	0.200000000	Iris-setosa
4.800000000	3.100000000	1.600000000	0.200000000	Iris-setosa
5.400000000	3.400000000	1.500000000	0.400000000	Iris-setosa
5.200000000	4.100000000	1.500000000	0.100000000	Iris-setosa
5.500000000	4.200000000	1.400000000	0.200000000	Iris-setosa
4.900000000	3.100000000	1.500000000	0.100000000	Iris-setosa
5.000000000	3.200000000	1.200000000	0.200000000	Iris-setosa
5.500000000	3.500000000	1.300000000	0.200000000	Iris-setosa
4.900000000	3.100000000	1.500000000	0.100000000	Iris-setosa
4.400000000	3.000000000	1.300000000	0.200000000	Iris-setosa
5.100000000	3.400000000	1.500000000	0.200000000	Iris-setosa
5.000000000	3.500000000	1.300000000	0.300000000	Iris-setosa
4.500000000	2.300000000	1.300000000	0.300000000	Iris-setosa
4.400000000	3.200000000	1.300000000	0.200000000	Iris-setosa
5.000000000	3.500000000	1.600000000	0.600000000	Iris-setosa
5.100000000	3.800000000	1.900000000	0.400000000	Iris-setosa
4.800000000	3.000000000	1.400000000	0.300000000	Iris-setosa
5.100000000	3.800000000	1.600000000	0.200000000	Iris-setosa
4.600000000	3.200000000	1.400000000	0.200000000	Iris-setosa
5.300000000	3.700000000	1.500000000	0.200000000	Iris-setosa
5.000000000	3.300000000	1.400000000	0.200000000	Iris-setosa
7.000000000	3.200000000	4.700000000	1.400000000	Iris-versicolor
6.400000000	3.200000000	4.500000000	1.500000000	Iris-versicolor
6.900000000	3.100000000	4.900000000	1.500000000	Iris-versicolor
5.500000000	2.300000000	4.000000000	1.300000000	Iris-versicolor
6.500000000	2.800000000	4.600000000	1.500000000	Iris-versicolor
5.700000000	2.800000000	4.500000000	1.300000000	Iris-versicolor
6.300000000	3.300000000	4.700000000	1.600000000	Iris-versicolor
4.900000000	2.400000000	3.300000000	1.000000000	Iris-versicolor
6.600000000	2.900000000	4.600000000	1.300000000	Iris-versicolor
5.200000000	2.700000000	3.900000000	1.400000000	Iris-versicolor
5.000000000	2.000000000	3.500000000	1.000000000	Iris-versicolor
5.900000000	3.000000000	4.200000000	1.500000000	Iris-versicolor
6.000000000	2.200000000	4.000000000	1.000000000	Iris-versicolor
6.100000000	2.900000000	4.700000000	1.400000000	Iris-versicolor
5.600000000	2.900000000	3.600000000	1.300000000	Iris-versicolor
6.700000000	3.100000000	4.400000000	1.400000000	Iris-versicolor
5.600000000	3.000000000	4.500000000	1.500000000	Iris-versicolor
5.800000000	2.700000000	4.100000000	1.000000000	Iris-versicolor
6.200000000	2.200000000	4.500000000	1.500000000	Iris-versicolor
5.600000000	2.500000000	3.900000000	1.100000000	Iris-versicolor
5.900000000	3.200000000	4.800000000	1.800000000	Iris-versicolor
6.100000000	2.800000000	4.000000000	1.300000000	Iris-versicolor
6.300000000	2.500000000	4.900000000	1.500000000	Iris-versicolor
6.100000000	2.800000000	4.700000000	1.200000000	Iris-versicolor
6.400000000	2.900000000	4.300000000	1.300000000	Iris-versicolor
6.600000000	3.000000000	4.400000000	1.400000000	Iris-versicolor
6.800000000	2.800000000	4.800000000	1.400000000	Iris-versicolor
6.700000000	3.000000000	5.000000000	1.700000000	Iris-versicolor
6.000000000	2.900000000	4.500000000	1.500000000	Iris-versicolor
5.700000000	2.600000000	3.500000000	1.000000000	Iris-versicolor
5.500000000	2.400000000	3.800000000	1.100000000	Iris-versicolor
5.500000000	2.400000000	3.700000000	1.000000000	Iris-versicolor
5.800000000	2.700000000	3.900000000	1.200000000	Iris-versicolor
6.000000000	2.700000000	5.100000000	1.600000000	Iris-versicolor
5.400000000	3.000000000	4.500000000	1.500000000	Iris-versicolor
6.000000000	3.400000000	4.500000000	1.600000000	Iris-versicolor
6.700000000	3.100000000	4.700000000	1.500000000	Iris-versicolor
6.300000000	2.300000000	4.400000000	1.300000000	Iris-versicolor
5.600000000	3.000000000	4.100000000	1.300000000	Iris-versicolor
5.500000000	2.500000000	4.000000000	1.300000000	Iris-versicolor
5.500000000	2.600000000	4.400000000	1.200000000	Iris-versicolor
6.100000000	3.000000000	4.600000000	1.400000000	Iris-versicolor
5.800000000	2.600000000	4.000000000	1.200000000	Iris-versicolor
5.000000000	2.300000000	3.300000000	1.000000000	Iris-versicolor
5.600000000	2.700000000	4.200000000	1.300000000	Iris-versicolor
5.700000000	3.000000000	4.200000000	1.200000000	Iris-versicolor
5.700000000	2.900000000	4.200000000	1.300000000	Iris-versicolor
6.200000000	2.900000000	4.300000000	1.300000000	Iris-versicolor
5.100000000	2.500000000	3.000000000	1.100000000	Iris-versicolor
5.700000000	2.800000000	4.100000000	1.300000000	Iris-versicolor
6.300000000	3.300000000	6.000000000	2.500000000	Iris-virginica
5.800000000	2.700000000	5.100000000	1.900000000	Iris-virginica
7.100000000	3.000000000	5.900000000	2.100000000	Iris-virginica
6.300000000	2.900000000	5.600000000	1.800000000	Iris-virginica
6.500000000	3.000000000	5.800000000	2.200000000	Iris-virginica
7.600000000	3.000000000	6.600000000	2.100000000	Iris-virginica
4.900000000	2.500000000	4.500000000	1.700000000	Iris-virginica
7.300000000	2.900000000	6.300000000	1.800000000	Iris-virginica
6.700000000	2.500000000	5.800000000	1.800000000	Iris-virginica
7.200000000	3.600000000	6.100000000	2.500000000	Iris-virginica
6.500000000	3.200000000	5.100000000	2.000000000	Iris-virginica
6.400000000	2.700000000	5.300000000	1.900000000	Iris-virginica
6.800000000	3.000000000	5.500000000	2.100000000	Iris-virginica
5.700000000	2.500000000	5.000000000	2.000000000	Iris-virginica
5.800000000	2.800000000	5.100000000	2.400000000	Iris-virginica
6.400000000	3.200000000	5.300000000	2.300000000	Iris-virginica
6.500000000	3.000000000	5.500000000	1.800000000	Iris-virginica
7.700000000	3.800000000	6.700000000	2.200000000	Iris-virginica
7.700000000	2.600000000	6.900000000	2.300000000	Iris-virginica
6.000000000	2.200000000	5.000000000	1.500000000	Iris-virginica
6.900000000	3.200000000	5.700000000	2.300000000	Iris-virginica
5.600000000	2.800000000	4.900000000	2.000000000	Iris-virginica
7.700000000	2.800000000	6.700000000	2.000000000	Iris-virginica
6.300000000	2.700000000	4.900000000	1.800000000	Iris-virginica
6.700000000	3.300000000	5.700000000	2.100000000	Iris-virginica
7.200000000	3.200000000	6.000000000	1.800000000	Iris-virginica
6.200000000	2.800000000	4.800000000	1.800000000	Iris-virginica
6.100000000	3.000000000	4.900000000	1.800000000	Iris-virginica
6.400000000	2.800000000	5.600000000	2.100000000	Iris-virginica
7.200000000	3.000000000	5.800000000	1.600000000	Iris-virginica
7.400000000	2.800000000	6.100000000	1.900000000	Iris-virginica
7.900000000	3.800000000	6.400000000	2.000000000	Iris-virginica
6.400000000	2.800000000	5.600000000	2.200000000	Iris-virginica
6.300000000	2.800000000	5.100000000	1.500000000	Iris-virginica
6.100000000	2.600000000	5.600000000	1.400000000	Iris-virginica
7.700000000	3.000000000	6.100000000	2.300000000	Iris-virginica
6.300000000	3.400000000	5.600000000	2.400000000	Iris-virginica
6.400000000	3.100000000	5.500000000	1.800000000	Iris-virginica
6.000000000	3.000000000	4.800000000	1.800000000	Iris-virginica
6.900000000	3.100000000	5.400000000	2.100000000	Iris-virginica
6.700000000	3.100000000	5.600000000	2.400000000	Iris-virginica
6.900000000	3.100000000	5.100000000	2.300000000	Iris-virginica
5.800000000	2.700000000	5.100000000	1.900000000	Iris-virginica
6.800000000	3.200000000	5.900000000	2.300000000	Iris-virginica
6.700000000	3.300000000	5.700000000	2.500000000	Iris-virginica
6.700000000	3.000000000	5.200000000	2.300000000	Iris-virginica
6.300000000	2.500000000	5.000000000	1.900000000	Iris-virginica
6.500000000	3.000000000	5.200000000	2.000000000	Iris-virginica
6.200000000	3.400000000	5.400000000	2.300000000	Iris-virginica
5.900000000	3.000000000	5.100000000	1.800000000	Iris-virginica
\.


--
-- TOC entry 2212 (class 0 OID 17447)
-- Dependencies: 198
-- Data for Name: retry_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.retry_request (id, request_type, request_id, request, tx_id, retries, max_retries, created_at, retry_at) FROM stdin;
\.


--
-- TOC entry 2211 (class 0 OID 17241)
-- Dependencies: 197
-- Data for Name: soybean; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.soybean (date, plant_stand, precip, temp, hail, crop_hist, area_damaged, severity, seed_tmt, germination, plant_growth, leaves, leafspots_halo, leafspots_marg, leafspot_size, leaf_shread, leaf_malf, leaf_mild, stem, lodging, stem_cankers, canker_lesion, fruiting_bodies, external_decay, mycelium, int_discolor, sclerotia, fruit_pods, fruit_spots, seed, mold_growth, seed_discolor, seed_size, shriveling, roots, class) FROM stdin;
october	normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	none	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	above-sec-nde	brown	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
august	normal	gt-norm	norm	yes	same-lst-two-yrs	scattered	severe	fungicide	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
july	normal	gt-norm	norm	yes	same-lst-yr	scattered	severe	fungicide	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dna	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
july	normal	gt-norm	norm	yes	same-lst-yr	scattered	severe	none	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dna	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
october	normal	gt-norm	norm	yes	same-lst-two-yrs	scattered	pot-severe	none	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
september	normal	gt-norm	norm	yes	same-lst-sev-yrs	scattered	pot-severe	none	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dna	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
september	normal	gt-norm	norm	yes	same-lst-two-yrs	scattered	pot-severe	fungicide	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	above-sec-nde	brown	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
august	normal	gt-norm	norm	no	same-lst-yr	scattered	pot-severe	none	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
october	normal	gt-norm	norm	yes	same-lst-sev-yrs	scattered	pot-severe	fungicide	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
august	normal	gt-norm	norm	yes	same-lst-two-yrs	scattered	severe	none	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
october	normal	lt-norm	gt-norm	yes	same-lst-yr	whole-field	pot-severe	fungicide	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
august	normal	lt-norm	norm	no	same-lst-yr	whole-field	pot-severe	fungicide	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
july	normal	lt-norm	norm	yes	same-lst-yr	upper-areas	pot-severe	none	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
october	normal	lt-norm	norm	no	same-lst-sev-yrs	whole-field	pot-severe	fungicide	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
october	normal	lt-norm	gt-norm	yes	same-lst-yr	whole-field	pot-severe	fungicide	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
september	normal	lt-norm	gt-norm	no	same-lst-sev-yrs	whole-field	pot-severe	fungicide	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
october	normal	lt-norm	gt-norm	no	diff-lst-year	upper-areas	pot-severe	none	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
august	normal	lt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
july	normal	lt-norm	gt-norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
september	normal	lt-norm	gt-norm	no	same-lst-two-yrs	upper-areas	pot-severe	none	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
may	lt-normal	gt-norm	lt-norm	yes	same-lst-two-yrs	low-areas	severe	none	lt-80	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	present	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
may	lt-normal	gt-norm	lt-norm	yes	same-lst-yr	low-areas	severe	none	80-89	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
july	normal	gt-norm	lt-norm	no	same-lst-sev-yrs	low-areas	severe	none	80-89	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	no	below-soil	brown	absent	firm-and-dry	present	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
april	lt-normal	gt-norm	lt-norm	yes	diff-lst-year	low-areas	pot-severe	fungicide	lt-80	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
april	lt-normal	gt-norm	lt-norm	yes	same-lst-yr	low-areas	severe	fungicide	lt-80	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
may	lt-normal	gt-norm	lt-norm	yes	same-lst-sev-yrs	low-areas	severe	none	lt-80	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
may	lt-normal	gt-norm	lt-norm	yes	diff-lst-year	low-areas	pot-severe	none	80-89	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
june	lt-normal	gt-norm	lt-norm	yes	same-lst-two-yrs	low-areas	pot-severe	none	80-89	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
may	lt-normal	gt-norm	lt-norm	yes	same-lst-yr	low-areas	severe	none	lt-80	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
june	lt-normal	gt-norm	lt-norm	yes	same-lst-yr	low-areas	severe	none	lt-80	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
april	lt-normal	gt-norm	norm	no	same-lst-yr	low-areas	pot-severe	none	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	dk-brown-blk	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
may	lt-normal	gt-norm	norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
june	lt-normal	gt-norm	gt-norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	lt-norm	yes	same-lst-two-yrs	low-areas	severe	fungicide	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-soil	dk-brown-blk	absent	absent	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
june	lt-normal	gt-norm	gt-norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	gt-norm	norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
april	lt-normal	norm	norm	yes	same-lst-yr	low-areas	pot-severe	none	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	dk-brown-blk	absent	absent	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
july	lt-normal	gt-norm	lt-norm	yes	same-lst-two-yrs	low-areas	severe	fungicide	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-soil	dk-brown-blk	absent	absent	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
june	lt-normal	norm	norm	\N	diff-lst-year	low-areas	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
june	lt-normal	gt-norm	lt-norm	yes	same-lst-yr	low-areas	severe	none	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	dk-brown-blk	absent	absent	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
june	lt-normal	gt-norm	norm	\N	same-lst-yr	low-areas	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	norm	\N	same-lst-yr	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	below-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
april	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	low-areas	pot-severe	none	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	dk-brown-blk	absent	absent	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
april	lt-normal	norm	norm	no	same-lst-two-yrs	low-areas	severe	fungicide	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	above-soil	dk-brown-blk	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
july	lt-normal	gt-norm	lt-norm	yes	same-lst-yr	low-areas	severe	fungicide	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-soil	dk-brown-blk	absent	absent	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
june	lt-normal	gt-norm	gt-norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
april	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	low-areas	pot-severe	none	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	dk-brown-blk	absent	absent	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
june	lt-normal	norm	gt-norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
june	lt-normal	gt-norm	norm	no	same-lst-yr	low-areas	severe	none	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	dk-brown-blk	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
april	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	low-areas	pot-severe	none	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	dk-brown-blk	absent	absent	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
may	lt-normal	gt-norm	norm	yes	diff-lst-year	low-areas	severe	fungicide	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-soil	dk-brown-blk	absent	absent	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
may	lt-normal	gt-norm	norm	\N	diff-lst-year	low-areas	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	\N	below-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	gt-norm	norm	\N	same-lst-yr	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
june	lt-normal	gt-norm	norm	\N	same-lst-yr	low-areas	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	gt-norm	gt-norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	norm	no	same-lst-sev-yrs	low-areas	severe	none	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	below-soil	dk-brown-blk	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
july	lt-normal	norm	norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
june	lt-normal	gt-norm	gt-norm	\N	same-lst-yr	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	norm	gt-norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	gt-norm	\N	same-lst-yr	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	below-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
june	lt-normal	gt-norm	gt-norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	norm	norm	\N	diff-lst-year	low-areas	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
june	lt-normal	gt-norm	lt-norm	yes	same-lst-yr	low-areas	severe	none	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	dk-brown-blk	absent	absent	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
july	lt-normal	norm	norm	\N	same-lst-yr	low-areas	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
june	lt-normal	gt-norm	gt-norm	\N	same-lst-yr	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	below-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	lt-norm	yes	diff-lst-year	low-areas	severe	fungicide	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-soil	dk-brown-blk	absent	absent	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
july	lt-normal	gt-norm	norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	gt-norm	norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	norm	lt-norm	yes	same-lst-two-yrs	low-areas	severe	fungicide	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-soil	dk-brown-blk	absent	absent	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
july	lt-normal	gt-norm	gt-norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
august	normal	lt-norm	norm	yes	same-lst-yr	whole-field	pot-severe	fungicide	lt-80	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
august	normal	lt-norm	norm	yes	same-lst-yr	whole-field	pot-severe	fungicide	lt-80	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
july	lt-normal	lt-norm	lt-norm	yes	same-lst-sev-yrs	scattered	pot-severe	fungicide	lt-80	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	normal	lt-norm	gt-norm	yes	same-lst-yr	whole-field	pot-severe	fungicide	lt-80	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	normal	lt-norm	gt-norm	yes	same-lst-two-yrs	whole-field	pot-severe	fungicide	80-89	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
august	normal	lt-norm	norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	normal	lt-norm	norm	no	same-lst-sev-yrs	whole-field	pot-severe	none	lt-80	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
october	normal	norm	norm	no	same-lst-two-yrs	scattered	pot-severe	fungicide	90-100	abnorm	norm	absent	dna	gt-1/8	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	lt-normal	lt-norm	lt-norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	none	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	lt-normal	lt-norm	norm	yes	same-lst-yr	whole-field	pot-severe	fungicide	90-100	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
august	normal	norm	lt-norm	no	same-lst-two-yrs	whole-field	pot-severe	fungicide	lt-80	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
august	lt-normal	lt-norm	lt-norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	fungicide	80-89	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
august	normal	lt-norm	norm	yes	same-lst-two-yrs	scattered	pot-severe	fungicide	90-100	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
july	lt-normal	lt-norm	lt-norm	yes	same-lst-two-yrs	scattered	severe	none	80-89	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	normal	lt-norm	norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
august	normal	lt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	fungicide	90-100	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
august	normal	lt-norm	norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	none	lt-80	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
august	normal	lt-norm	norm	yes	same-lst-yr	upper-areas	pot-severe	fungicide	lt-80	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
august	normal	lt-norm	norm	yes	same-lst-yr	upper-areas	pot-severe	none	90-100	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
july	normal	lt-norm	norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	none	90-100	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	normal	lt-norm	norm	no	same-lst-sev-yrs	whole-field	pot-severe	none	80-89	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
october	normal	norm	lt-norm	no	diff-lst-year	scattered	minor	fungicide	lt-80	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
may	lt-normal	lt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	other	90-100	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
october	lt-normal	norm	lt-norm	yes	same-lst-two-yrs	upper-areas	minor	fungicide	lt-80	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
august	lt-normal	norm	lt-norm	yes	same-lst-two-yrs	upper-areas	minor	other	90-100	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
october	normal	lt-norm	norm	no	same-lst-yr	low-areas	pot-severe	none	lt-80	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
june	lt-normal	norm	lt-norm	yes	same-lst-two-yrs	upper-areas	minor	none	80-89	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
october	lt-normal	lt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	fungicide	lt-80	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
september	lt-normal	lt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	none	80-89	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
may	lt-normal	lt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	other	90-100	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
october	normal	gt-norm	lt-norm	no	same-lst-two-yrs	low-areas	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	present	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
june	normal	gt-norm	norm	no	same-lst-yr	low-areas	pot-severe	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	present	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
may	normal	gt-norm	norm	no	same-lst-sev-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	yellow-halos	w-s-marg	gt-1/8	absent	absent	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
august	lt-normal	gt-norm	gt-norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	yellow-halos	w-s-marg	gt-1/8	absent	present	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
may	normal	gt-norm	lt-norm	no	diff-lst-year	scattered	pot-severe	none	80-89	norm	abnorm	yellow-halos	w-s-marg	gt-1/8	absent	absent	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
june	lt-normal	gt-norm	lt-norm	yes	same-lst-sev-yrs	scattered	pot-severe	none	80-89	norm	abnorm	yellow-halos	w-s-marg	gt-1/8	absent	absent	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
june	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	scattered	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
august	lt-normal	gt-norm	gt-norm	yes	same-lst-two-yrs	low-areas	minor	fungicide	lt-80	norm	abnorm	yellow-halos	w-s-marg	gt-1/8	absent	absent	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
august	lt-normal	gt-norm	lt-norm	yes	same-lst-yr	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
september	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	yellow-halos	w-s-marg	gt-1/8	absent	absent	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
may	lt-normal	gt-norm	gt-norm	no	same-lst-sev-yrs	whole-field	pot-severe	none	lt-80	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-yr	scattered	pot-severe	other	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	lt-normal	gt-norm	gt-norm	no	same-lst-sev-yrs	whole-field	pot-severe	fungicide	80-89	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
april	lt-normal	gt-norm	gt-norm	no	same-lst-sev-yrs	whole-field	pot-severe	other	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
september	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	other	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
august	normal	gt-norm	norm	yes	same-lst-yr	whole-field	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
august	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
april	lt-normal	norm	norm	no	same-lst-two-yrs	upper-areas	minor	other	80-89	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	lt-normal	norm	norm	no	same-lst-two-yrs	scattered	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	lt-normal	gt-norm	norm	yes	same-lst-yr	scattered	pot-severe	other	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	normal	gt-norm	norm	yes	same-lst-yr	whole-field	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
july	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	severe	other	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	absent	tan	present	firm-and-dry	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	lt-normal	gt-norm	gt-norm	no	same-lst-sev-yrs	low-areas	pot-severe	fungicide	90-100	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	other	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
september	normal	gt-norm	norm	yes	same-lst-yr	whole-field	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
august	lt-normal	norm	norm	no	same-lst-two-yrs	upper-areas	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	colored	norm	absent	absent	norm	absent	norm	brown-spot
july	lt-normal	gt-norm	norm	yes	same-lst-yr	whole-field	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
august	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	absent	tan	present	firm-and-dry	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	lt-normal	norm	norm	no	diff-lst-year	scattered	pot-severe	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
july	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	low-areas	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
july	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	severe	other	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	absent	tan	present	firm-and-dry	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	lt-normal	gt-norm	gt-norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-soil	dk-brown-blk	\N	watery	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	normal	gt-norm	norm	yes	same-lst-sev-yrs	low-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
july	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	low-areas	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	severe	other	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
september	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	absent	tan	present	firm-and-dry	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
september	normal	gt-norm	norm	no	same-lst-sev-yrs	whole-field	pot-severe	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
august	normal	gt-norm	gt-norm	no	same-lst-two-yrs	whole-field	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
june	normal	norm	norm	yes	diff-lst-year	scattered	minor	none	90-100	norm	abnorm	yellow-halos	w-s-marg	lt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
july	normal	norm	norm	yes	same-lst-yr	upper-areas	minor	none	90-100	norm	abnorm	yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
july	normal	norm	norm	yes	same-lst-sev-yrs	upper-areas	minor	none	90-100	norm	abnorm	yellow-halos	w-s-marg	lt-1/8	present	present	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
july	normal	gt-norm	norm	no	same-lst-two-yrs	low-areas	pot-severe	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
july	normal	norm	norm	yes	same-lst-yr	scattered	minor	none	80-89	norm	abnorm	yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
august	normal	gt-norm	norm	no	diff-lst-year	whole-field	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
june	normal	norm	norm	yes	same-lst-sev-yrs	low-areas	minor	none	90-100	norm	abnorm	yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
august	lt-normal	gt-norm	gt-norm	no	same-lst-two-yrs	low-areas	pot-severe	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
june	lt-normal	norm	gt-norm	yes	same-lst-two-yrs	upper-areas	minor	none	lt-80	norm	abnorm	yellow-halos	no-w-s-marg	lt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	galls-cysts	bacterial-pustule
july	normal	gt-norm	lt-norm	no	same-lst-two-yrs	whole-field	pot-severe	fungicide	80-89	abnorm	abnorm	no-yellow-halos	no-w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	present	norm	absent	norm	bacterial-pustule
june	normal	norm	lt-norm	yes	diff-lst-year	scattered	minor	none	90-100	norm	abnorm	yellow-halos	no-w-s-marg	lt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-pustule
august	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	scattered	pot-severe	none	lt-80	norm	abnorm	yellow-halos	w-s-marg	lt-1/8	present	present	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	lt-norm	absent	rotted	bacterial-pustule
july	normal	gt-norm	norm	no	same-lst-yr	low-areas	pot-severe	none	80-89	norm	abnorm	yellow-halos	no-w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	present	lt-norm	absent	rotted	bacterial-pustule
july	lt-normal	norm	lt-norm	yes	same-lst-two-yrs	scattered	minor	none	lt-80	norm	abnorm	no-yellow-halos	no-w-s-marg	lt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	rotted	bacterial-pustule
july	normal	norm	norm	no	same-lst-two-yrs	whole-field	minor	none	80-89	abnorm	abnorm	yellow-halos	no-w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	present	lt-norm	absent	norm	bacterial-pustule
july	lt-normal	gt-norm	norm	yes	diff-lst-year	upper-areas	pot-severe	none	lt-80	norm	abnorm	yellow-halos	no-w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	lt-norm	absent	rotted	bacterial-pustule
august	normal	norm	norm	no	same-lst-yr	whole-field	minor	none	80-89	norm	abnorm	yellow-halos	no-w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	present	lt-norm	absent	norm	bacterial-pustule
september	lt-normal	norm	norm	yes	same-lst-two-yrs	scattered	minor	fungicide	lt-80	norm	abnorm	yellow-halos	no-w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	rotted	bacterial-pustule
october	normal	gt-norm	lt-norm	no	same-lst-two-yrs	upper-areas	minor	none	90-100	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	none	absent	diseased	colored	abnorm	absent	present	norm	absent	norm	purple-seed-stain
october	normal	gt-norm	lt-norm	yes	same-lst-two-yrs	upper-areas	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	none	absent	diseased	colored	abnorm	absent	present	norm	absent	norm	purple-seed-stain
august	normal	gt-norm	norm	no	same-lst-yr	low-areas	minor	fungicide	lt-80	norm	norm	absent	dna	dna	absent	absent	absent	norm	yes	absent	tan	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	purple-seed-stain
june	lt-normal	gt-norm	gt-norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
august	normal	gt-norm	norm	no	diff-lst-year	scattered	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	absent	absent	absent	norm	no	absent	tan	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	purple-seed-stain
august	normal	gt-norm	lt-norm	yes	diff-lst-year	scattered	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	absent	absent	absent	norm	yes	absent	tan	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	purple-seed-stain
october	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	upper-areas	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	none	absent	diseased	colored	abnorm	absent	present	norm	absent	norm	purple-seed-stain
july	normal	gt-norm	lt-norm	no	diff-lst-year	scattered	minor	none	80-89	norm	norm	absent	dna	dna	absent	absent	absent	norm	no	absent	tan	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	purple-seed-stain
july	normal	gt-norm	norm	no	same-lst-sev-yrs	whole-field	minor	fungicide	80-89	norm	norm	absent	dna	dna	absent	absent	absent	norm	yes	absent	tan	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	purple-seed-stain
september	normal	gt-norm	norm	yes	same-lst-yr	low-areas	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	none	absent	diseased	colored	abnorm	absent	present	norm	absent	norm	purple-seed-stain
august	normal	gt-norm	norm	yes	diff-lst-year	scattered	minor	fungicide	80-89	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	purple-seed-stain
september	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	fungicide	90-100	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	absent	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	anthracnose
september	lt-normal	gt-norm	gt-norm	no	same-lst-two-yrs	upper-areas	minor	fungicide	lt-80	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	firm-and-dry	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	present	norm	present	norm	anthracnose
october	normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	fungicide	80-89	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
june	lt-normal	gt-norm	gt-norm	no	diff-lst-year	scattered	pot-severe	none	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-soil	brown	absent	firm-and-dry	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	anthracnose
july	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	firm-and-dry	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	present	norm	absent	norm	anthracnose
august	lt-normal	gt-norm	gt-norm	no	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	firm-and-dry	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	anthracnose
october	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
may	normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	fungicide	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-soil	dk-brown-blk	absent	firm-and-dry	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	anthracnose
october	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	fungicide	80-89	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
september	normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	other	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	firm-and-dry	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	present	norm	absent	norm	anthracnose
september	lt-normal	gt-norm	gt-norm	no	same-lst-sev-yrs	whole-field	minor	fungicide	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	above-sec-nde	dk-brown-blk	present	firm-and-dry	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	anthracnose
april	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	fungicide	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-soil	dk-brown-blk	absent	firm-and-dry	absent	none	absent	norm	absent	abnorm	present	absent	lt-norm	absent	norm	anthracnose
october	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	minor	none	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	firm-and-dry	absent	none	absent	diseased	brown-w/blk-specks	abnorm	absent	present	lt-norm	present	norm	anthracnose
september	lt-normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	none	80-89	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
september	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	lt-80	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	anthracnose
october	lt-normal	gt-norm	gt-norm	no	diff-lst-year	scattered	pot-severe	none	80-89	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	firm-and-dry	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	anthracnose
september	normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	none	90-100	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
october	lt-normal	gt-norm	gt-norm	no	same-lst-sev-yrs	whole-field	minor	other	80-89	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	above-sec-nde	dk-brown-blk	present	firm-and-dry	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	anthracnose
september	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	80-89	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
july	lt-normal	norm	norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
september	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	fungicide	80-89	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
july	lt-normal	norm	norm	yes	diff-lst-year	upper-areas	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
july	normal	lt-norm	norm	no	diff-lst-year	upper-areas	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	present	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
july	lt-normal	norm	norm	yes	diff-lst-year	scattered	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
july	normal	lt-norm	norm	no	same-lst-two-yrs	scattered	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
july	lt-normal	norm	gt-norm	yes	same-lst-sev-yrs	upper-areas	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	present	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
june	normal	lt-norm	norm	no	diff-lst-year	whole-field	minor	other	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
may	normal	lt-norm	gt-norm	no	same-lst-sev-yrs	upper-areas	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	present	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
june	lt-normal	norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	present	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
june	normal	lt-norm	gt-norm	no	same-lst-sev-yrs	scattered	pot-severe	fungicide	90-100	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
june	lt-normal	norm	gt-norm	yes	same-lst-sev-yrs	whole-field	minor	other	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
august	lt-normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
august	normal	norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
july	normal	gt-norm	norm	yes	diff-lst-year	scattered	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	whole-field	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	norm	norm	no	same-lst-two-yrs	upper-areas	minor	other	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	norm	norm	yes	same-lst-sev-yrs	whole-field	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	low-areas	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	whole-field	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	whole-field	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
august	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	scattered	pot-severe	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	norm	yes	same-lst-yr	low-areas	minor	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	lt-normal	gt-norm	norm	yes	diff-lst-year	scattered	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
august	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
august	normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	norm	yes	same-lst-two-yrs	low-areas	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	upper-areas	minor	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	lt-normal	gt-norm	gt-norm	yes	same-lst-yr	low-areas	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	low-areas	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	whole-field	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
august	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	low-areas	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	lt-normal	norm	gt-norm	yes	same-lst-two-yrs	upper-areas	minor	other	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	alternarialeaf-spot
august	lt-normal	gt-norm	norm	yes	same-lst-yr	upper-areas	pot-severe	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	lt-normal	gt-norm	gt-norm	yes	same-lst-two-yrs	low-areas	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
august	lt-normal	gt-norm	norm	yes	diff-lst-year	whole-field	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
august	normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	whole-field	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
july	normal	gt-norm	norm	yes	diff-lst-year	scattered	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	norm	yes	same-lst-yr	upper-areas	minor	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-yr	low-areas	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
august	normal	gt-norm	gt-norm	yes	same-lst-yr	low-areas	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	norm	yes	same-lst-two-yrs	low-areas	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	norm	yes	diff-lst-year	whole-field	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	norm	yes	diff-lst-year	whole-field	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	lt-normal	gt-norm	gt-norm	yes	same-lst-two-yrs	low-areas	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	norm	yes	same-lst-sev-yrs	scattered	minor	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	norm	yes	same-lst-yr	upper-areas	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	norm	gt-norm	yes	same-lst-sev-yrs	whole-field	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	firm-and-dry	absent	none	absent	diseased	brown-w/blk-specks	abnorm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	norm	gt-norm	yes	same-lst-yr	low-areas	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	norm	norm	yes	same-lst-two-yrs	low-areas	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	absent	firm-and-dry	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	upper-areas	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
october	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	whole-field	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
july	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	upper-areas	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	whole-field	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	norm	yes	diff-lst-year	low-areas	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	minor	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	gt-norm	yes	same-lst-yr	low-areas	pot-severe	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	norm	yes	same-lst-two-yrs	low-areas	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
july	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	norm	yes	same-lst-sev-yrs	scattered	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-yr	low-areas	minor	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	gt-norm	yes	same-lst-yr	upper-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	low-areas	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	norm	yes	same-lst-sev-yrs	scattered	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
july	normal	gt-norm	norm	yes	same-lst-yr	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
october	normal	norm	gt-norm	yes	same-lst-sev-yrs	whole-field	minor	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	absent	present	lt-norm	present	norm	frog-eye-leaf-spot
september	normal	norm	norm	yes	same-lst-yr	whole-field	pot-severe	other	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dna	present	absent	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
july	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	scattered	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
october	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	low-areas	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	norm	yes	same-lst-yr	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
june	lt-normal	norm	norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
august	normal	gt-norm	gt-norm	yes	same-lst-yr	scattered	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
october	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	scattered	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	whole-field	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	norm	yes	diff-lst-year	low-areas	pot-severe	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	lt-normal	norm	gt-norm	yes	same-lst-yr	low-areas	minor	other	lt-80	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	norm	yes	same-lst-two-yrs	scattered	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	lt-normal	gt-norm	norm	yes	same-lst-yr	upper-areas	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	gt-norm	yes	same-lst-yr	whole-field	pot-severe	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	norm	yes	same-lst-yr	upper-areas	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	scattered	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	gt-norm	\N	same-lst-sev-yrs	whole-field	\N	\N	90-100	norm	norm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dna	present	absent	absent	none	absent	diseased	brown-w/blk-specks	norm	present	present	lt-norm	present	\N	diaporthe-pod-&-stem-blight
october	normal	gt-norm	gt-norm	\N	same-lst-two-yrs	whole-field	\N	\N	80-89	norm	norm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dna	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	present	lt-norm	present	\N	diaporthe-pod-&-stem-blight
september	normal	gt-norm	gt-norm	\N	same-lst-sev-yrs	whole-field	\N	\N	90-100	norm	norm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dna	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	present	lt-norm	present	\N	diaporthe-pod-&-stem-blight
may	lt-normal	norm	gt-norm	\N	same-lst-sev-yrs	scattered	\N	\N	lt-80	norm	norm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dna	present	absent	absent	none	absent	diseased	brown-w/blk-specks	norm	present	present	lt-norm	present	\N	diaporthe-pod-&-stem-blight
september	\N	gt-norm	gt-norm	\N	same-lst-two-yrs	whole-field	\N	\N	\N	norm	norm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dna	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	present	lt-norm	present	\N	diaporthe-pod-&-stem-blight
september	normal	gt-norm	gt-norm	\N	same-lst-two-yrs	whole-field	\N	\N	90-100	norm	norm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dna	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	present	lt-norm	present	\N	diaporthe-pod-&-stem-blight
june	\N	\N	\N	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	norm	\N	\N	\N	\N	\N	\N	\N	\N	few-present	\N	abnorm	absent	\N	lt-norm	\N	galls-cysts	cyst-nematode
july	\N	\N	\N	\N	same-lst-sev-yrs	upper-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	norm	\N	\N	\N	\N	\N	\N	\N	\N	few-present	\N	abnorm	absent	\N	lt-norm	\N	galls-cysts	cyst-nematode
august	\N	\N	\N	\N	same-lst-sev-yrs	upper-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	norm	\N	\N	\N	\N	\N	\N	\N	\N	few-present	\N	abnorm	absent	\N	lt-norm	\N	galls-cysts	cyst-nematode
july	\N	\N	\N	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	norm	\N	\N	\N	\N	\N	\N	\N	\N	few-present	\N	abnorm	absent	\N	lt-norm	\N	galls-cysts	cyst-nematode
july	\N	\N	\N	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	norm	\N	\N	\N	\N	\N	\N	\N	\N	few-present	\N	abnorm	absent	\N	lt-norm	\N	galls-cysts	cyst-nematode
august	\N	\N	\N	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	norm	\N	\N	\N	\N	\N	\N	\N	\N	few-present	\N	abnorm	absent	\N	lt-norm	\N	galls-cysts	cyst-nematode
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	abnorm	absent	dna	dna	\N	present	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2-4-output-injury
may	lt-normal	\N	lt-norm	\N	same-lst-yr	scattered	\N	\N	\N	abnorm	abnorm	no-yellow-halos	no-w-s-marg	gt-1/8	absent	present	\N	abnorm	\N	\N	\N	\N	\N	\N	\N	\N	dna	\N	\N	\N	\N	\N	\N	rotted	herbicide-injury
april	lt-normal	\N	lt-norm	\N	diff-lst-year	whole-field	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	present	\N	abnorm	\N	\N	\N	\N	\N	\N	\N	\N	dna	\N	\N	\N	\N	\N	\N	rotted	herbicide-injury
may	lt-normal	\N	lt-norm	\N	diff-lst-year	scattered	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	present	\N	abnorm	\N	\N	\N	\N	\N	\N	\N	\N	dna	\N	\N	\N	\N	\N	\N	rotted	herbicide-injury
may	lt-normal	\N	lt-norm	\N	same-lst-yr	whole-field	\N	\N	\N	abnorm	abnorm	no-yellow-halos	no-w-s-marg	gt-1/8	absent	present	\N	abnorm	\N	\N	\N	\N	\N	\N	\N	\N	dna	\N	\N	\N	\N	\N	\N	rotted	herbicide-injury
october	normal	gt-norm	norm	yes	same-lst-yr	scattered	pot-severe	none	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
july	normal	gt-norm	norm	yes	same-lst-two-yrs	scattered	severe	fungicide	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dna	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
august	normal	gt-norm	norm	yes	same-lst-sev-yrs	scattered	severe	none	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
july	lt-normal	norm	norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
september	normal	gt-norm	norm	yes	same-lst-yr	scattered	pot-severe	none	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dna	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
july	normal	gt-norm	norm	yes	same-lst-sev-yrs	scattered	pot-severe	none	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dna	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
september	normal	gt-norm	norm	yes	same-lst-two-yrs	scattered	pot-severe	fungicide	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dna	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
september	normal	gt-norm	norm	yes	same-lst-sev-yrs	low-areas	pot-severe	fungicide	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	above-sec-nde	dna	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
july	normal	gt-norm	norm	yes	same-lst-two-yrs	low-areas	pot-severe	none	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	above-sec-nde	dna	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
august	normal	gt-norm	norm	yes	same-lst-sev-yrs	scattered	pot-severe	fungicide	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	above-sec-nde	dna	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
october	normal	gt-norm	norm	yes	same-lst-sev-yrs	scattered	pot-severe	fungicide	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	above-sec-nde	brown	present	firm-and-dry	absent	none	absent	norm	dna	norm	absent	absent	norm	absent	norm	diaporthe-stem-canker
august	normal	lt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	fungicide	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
september	normal	lt-norm	gt-norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	none	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
august	normal	lt-norm	gt-norm	yes	same-lst-sev-yrs	whole-field	pot-severe	fungicide	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
september	normal	lt-norm	gt-norm	yes	diff-lst-year	upper-areas	pot-severe	none	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
september	normal	lt-norm	gt-norm	no	same-lst-two-yrs	upper-areas	pot-severe	none	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
july	normal	lt-norm	gt-norm	no	diff-lst-year	upper-areas	pot-severe	none	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
august	normal	lt-norm	gt-norm	no	same-lst-yr	whole-field	pot-severe	fungicide	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
september	normal	lt-norm	gt-norm	no	same-lst-two-yrs	upper-areas	pot-severe	none	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
october	normal	lt-norm	gt-norm	no	same-lst-sev-yrs	whole-field	pot-severe	fungicide	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
october	normal	lt-norm	gt-norm	no	same-lst-sev-yrs	whole-field	pot-severe	fungicide	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	black	present	norm	dna	norm	absent	absent	norm	absent	norm	charcoal-rot
april	lt-normal	gt-norm	lt-norm	yes	diff-lst-year	low-areas	pot-severe	none	80-89	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	rotted	rhizoctonia-root-rot
april	lt-normal	gt-norm	lt-norm	yes	same-lst-sev-yrs	low-areas	severe	none	lt-80	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
april	lt-normal	gt-norm	lt-norm	yes	same-lst-two-yrs	low-areas	pot-severe	fungicide	80-89	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
june	lt-normal	gt-norm	lt-norm	yes	diff-lst-year	low-areas	pot-severe	none	80-89	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
may	lt-normal	gt-norm	lt-norm	yes	same-lst-two-yrs	low-areas	pot-severe	none	80-89	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
june	lt-normal	gt-norm	lt-norm	yes	same-lst-sev-yrs	low-areas	severe	none	80-89	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
june	lt-normal	gt-norm	lt-norm	yes	same-lst-two-yrs	low-areas	pot-severe	none	lt-80	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	present	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
august	normal	gt-norm	lt-norm	no	diff-lst-year	low-areas	severe	none	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	below-soil	brown	absent	firm-and-dry	present	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
april	lt-normal	gt-norm	lt-norm	yes	same-lst-yr	low-areas	pot-severe	fungicide	80-89	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	present	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
june	lt-normal	gt-norm	lt-norm	yes	same-lst-sev-yrs	low-areas	severe	none	lt-80	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	brown	absent	firm-and-dry	present	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	rhizoctonia-root-rot
june	lt-normal	norm	lt-norm	yes	same-lst-sev-yrs	low-areas	severe	none	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	below-soil	dk-brown-blk	absent	absent	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
may	lt-normal	gt-norm	lt-norm	yes	same-lst-sev-yrs	low-areas	pot-severe	fungicide	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-soil	dk-brown-blk	absent	absent	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
june	lt-normal	gt-norm	norm	no	same-lst-sev-yrs	low-areas	severe	fungicide	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-soil	dk-brown-blk	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
may	lt-normal	gt-norm	norm	no	same-lst-two-yrs	whole-field	pot-severe	fungicide	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-soil	dk-brown-blk	absent	firm-and-dry	absent	none	absent	dna	dna	norm	absent	absent	norm	absent	norm	phytophthora-rot
july	lt-normal	norm	norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	norm	norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
april	lt-normal	gt-norm	gt-norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	below-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	norm	\N	diff-lst-year	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dk-brown-blk	\N	watery	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
august	lt-normal	norm	gt-norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	gt-norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	below-soil	dk-brown-blk	\N	watery	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
june	lt-normal	gt-norm	norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	below-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	gt-norm	gt-norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
august	lt-normal	norm	norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	below-soil	dk-brown-blk	\N	watery	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	watery	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	gt-norm	\N	same-lst-yr	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	watery	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
june	lt-normal	norm	gt-norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	below-soil	dk-brown-blk	\N	watery	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	norm	norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	norm	norm	\N	same-lst-yr	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	gt-norm	\N	same-lst-yr	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dk-brown-blk	\N	watery	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
june	lt-normal	gt-norm	gt-norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	norm	norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
august	lt-normal	norm	norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	gt-norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dk-brown-blk	\N	watery	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
june	lt-normal	gt-norm	gt-norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	norm	norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
august	lt-normal	norm	norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	gt-norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dk-brown-blk	\N	watery	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
june	lt-normal	gt-norm	gt-norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	norm	norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	gt-norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dk-brown-blk	\N	watery	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
june	lt-normal	gt-norm	norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	gt-norm	norm	\N	same-lst-yr	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	gt-norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dk-brown-blk	\N	watery	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
june	lt-normal	gt-norm	gt-norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-soil	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	norm	norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
august	lt-normal	norm	norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
may	lt-normal	gt-norm	norm	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-soil	dk-brown-blk	\N	watery	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
june	lt-normal	gt-norm	norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	norm	norm	\N	same-lst-yr	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
august	lt-normal	norm	norm	\N	same-lst-yr	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	lt-normal	norm	norm	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	abnorm	\N	above-sec-nde	dk-brown-blk	\N	absent	absent	none	absent	\N	\N	\N	\N	\N	\N	\N	rotted	phytophthora-rot
july	normal	lt-norm	lt-norm	no	same-lst-yr	scattered	severe	none	90-100	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
august	normal	norm	lt-norm	no	same-lst-two-yrs	upper-areas	pot-severe	fungicide	80-89	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
july	normal	lt-norm	lt-norm	no	same-lst-sev-yrs	upper-areas	severe	none	80-89	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	normal	lt-norm	norm	no	same-lst-sev-yrs	scattered	pot-severe	none	90-100	abnorm	abnorm	no-yellow-halos	w-s-marg	dna	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
october	normal	lt-norm	norm	no	same-lst-two-yrs	low-areas	pot-severe	fungicide	80-89	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
august	normal	norm	lt-norm	no	same-lst-sev-yrs	upper-areas	severe	none	lt-80	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	normal	lt-norm	gt-norm	yes	same-lst-two-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	normal	lt-norm	norm	yes	same-lst-yr	scattered	pot-severe	fungicide	90-100	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
august	normal	lt-norm	norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	normal	lt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	normal	lt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	fungicide	80-89	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
july	lt-normal	norm	lt-norm	yes	same-lst-two-yrs	scattered	severe	none	lt-80	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	lt-normal	norm	norm	yes	same-lst-two-yrs	whole-field	severe	none	90-100	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
august	lt-normal	lt-norm	lt-norm	yes	same-lst-two-yrs	upper-areas	severe	none	80-89	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	lt-normal	norm	lt-norm	yes	same-lst-sev-yrs	whole-field	pot-severe	fungicide	lt-80	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
august	lt-normal	norm	lt-norm	yes	same-lst-sev-yrs	low-areas	pot-severe	fungicide	90-100	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
october	lt-normal	norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	fungicide	80-89	abnorm	norm	absent	dna	dna	absent	absent	absent	abnorm	no	absent	tan	absent	absent	absent	brown	absent	norm	dna	norm	absent	absent	norm	absent	norm	brown-stem-rot
july	normal	lt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	normal	lt-norm	gt-norm	yes	same-lst-sev-yrs	scattered	pot-severe	none	lt-80	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
july	normal	lt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	fungicide	80-89	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
august	normal	lt-norm	norm	yes	same-lst-yr	whole-field	pot-severe	none	90-100	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	normal	lt-norm	gt-norm	yes	same-lst-two-yrs	scattered	pot-severe	fungicide	90-100	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
august	normal	lt-norm	norm	yes	same-lst-yr	scattered	pot-severe	none	90-100	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
september	normal	lt-norm	gt-norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	fungicide	80-89	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	dna	absent	absent	absent	brown	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-stem-rot
may	normal	lt-norm	lt-norm	no	diff-lst-year	scattered	minor	none	90-100	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
june	normal	norm	norm	no	same-lst-yr	low-areas	pot-severe	fungicide	80-89	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
july	normal	gt-norm	lt-norm	no	same-lst-two-yrs	upper-areas	minor	none	lt-80	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
august	normal	lt-norm	norm	no	same-lst-sev-yrs	whole-field	pot-severe	none	90-100	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
september	normal	norm	lt-norm	no	diff-lst-year	scattered	minor	none	80-89	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
august	normal	norm	lt-norm	no	same-lst-two-yrs	upper-areas	minor	fungicide	90-100	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
july	lt-normal	lt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	fungicide	lt-80	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
august	lt-normal	norm	lt-norm	yes	diff-lst-year	scattered	minor	other	90-100	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
june	lt-normal	norm	lt-norm	yes	diff-lst-year	scattered	minor	none	80-89	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
september	lt-normal	lt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	80-89	norm	abnorm	absent	dna	dna	absent	absent	upper-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	powdery-mildew
july	normal	gt-norm	lt-norm	no	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	yellow-halos	w-s-marg	gt-1/8	absent	absent	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
august	normal	gt-norm	norm	no	same-lst-sev-yrs	whole-field	pot-severe	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	present	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
september	normal	gt-norm	norm	no	same-lst-yr	scattered	pot-severe	none	80-89	norm	abnorm	yellow-halos	w-s-marg	gt-1/8	absent	absent	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
june	normal	gt-norm	lt-norm	no	diff-lst-year	whole-field	pot-severe	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
july	normal	gt-norm	norm	no	same-lst-yr	scattered	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	present	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
october	lt-normal	gt-norm	lt-norm	yes	same-lst-yr	whole-field	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	present	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
july	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	low-areas	pot-severe	fungicide	lt-80	norm	abnorm	yellow-halos	w-s-marg	gt-1/8	absent	absent	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
september	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	minor	fungicide	lt-80	norm	abnorm	yellow-halos	w-s-marg	gt-1/8	absent	absent	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
july	lt-normal	gt-norm	norm	yes	same-lst-yr	low-areas	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
september	lt-normal	gt-norm	lt-norm	yes	same-lst-sev-yrs	whole-field	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	lower-surf	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	absent	norm	absent	norm	downy-mildew
may	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
july	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
september	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	absent	tan	present	firm-and-dry	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	other	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	lt-normal	norm	norm	no	same-lst-two-yrs	upper-areas	pot-severe	fungicide	lt-80	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
july	lt-normal	gt-norm	gt-norm	no	same-lst-yr	low-areas	minor	other	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	absent	absent	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	brown-spot
april	normal	norm	norm	yes	diff-lst-year	scattered	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	lt-normal	norm	gt-norm	\N	diff-lst-year	scattered	\N	\N	lt-80	norm	norm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dna	present	absent	absent	none	absent	diseased	brown-w/blk-specks	norm	present	present	lt-norm	present	\N	diaporthe-pod-&-stem-blight
may	normal	gt-norm	gt-norm	yes	same-lst-yr	low-areas	minor	fungicide	80-89	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	other	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
july	normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	whole-field	minor	none	80-89	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	absent	absent	absent	none	absent	norm	colored	norm	absent	absent	norm	absent	norm	brown-spot
august	normal	norm	norm	yes	same-lst-yr	scattered	pot-severe	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	brown-spot
april	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	low-areas	pot-severe	other	80-89	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	normal	norm	norm	yes	same-lst-sev-yrs	upper-areas	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	gt-norm	yes	same-lst-yr	whole-field	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
april	normal	norm	norm	yes	same-lst-two-yrs	scattered	minor	other	lt-80	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	lt-normal	gt-norm	gt-norm	no	same-lst-sev-yrs	low-areas	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
july	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
august	normal	gt-norm	norm	yes	same-lst-two-yrs	low-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
september	normal	gt-norm	norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
july	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
july	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
july	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	low-areas	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
july	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
august	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	low-areas	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
september	normal	gt-norm	norm	yes	same-lst-yr	upper-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
july	normal	gt-norm	norm	yes	same-lst-two-yrs	low-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
august	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
september	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
july	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
july	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
may	normal	gt-norm	norm	yes	same-lst-yr	whole-field	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
june	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	abnorm	yes	above-sec-nde	brown	present	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	brown-spot
july	normal	gt-norm	norm	no	same-lst-yr	low-areas	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
august	lt-normal	norm	norm	yes	same-lst-two-yrs	upper-areas	minor	none	lt-80	norm	abnorm	yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
june	lt-normal	norm	norm	yes	same-lst-yr	scattered	minor	none	lt-80	norm	abnorm	yellow-halos	w-s-marg	lt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
august	normal	norm	gt-norm	yes	same-lst-sev-yrs	upper-areas	minor	none	80-89	norm	abnorm	yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
september	lt-normal	gt-norm	norm	no	same-lst-yr	whole-field	pot-severe	fungicide	lt-80	abnorm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
july	normal	norm	norm	yes	same-lst-two-yrs	scattered	minor	none	90-100	abnorm	abnorm	yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
august	normal	gt-norm	norm	no	same-lst-sev-yrs	low-areas	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	absent	present	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
july	normal	gt-norm	norm	no	same-lst-yr	upper-areas	pot-severe	fungicide	80-89	abnorm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
august	lt-normal	norm	norm	yes	same-lst-two-yrs	whole-field	minor	none	lt-80	norm	abnorm	yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
september	normal	gt-norm	norm	no	same-lst-sev-yrs	scattered	pot-severe	fungicide	80-89	abnorm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	bacterial-blight
july	normal	norm	lt-norm	no	same-lst-sev-yrs	whole-field	minor	none	80-89	norm	abnorm	yellow-halos	no-w-s-marg	lt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	present	norm	absent	norm	bacterial-pustule
may	lt-normal	norm	norm	yes	same-lst-yr	scattered	minor	fungicide	lt-80	norm	abnorm	yellow-halos	no-w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	lt-norm	absent	rotted	bacterial-pustule
june	normal	norm	gt-norm	no	same-lst-two-yrs	low-areas	minor	none	80-89	norm	abnorm	no-yellow-halos	no-w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	present	norm	absent	norm	bacterial-pustule
july	lt-normal	norm	norm	yes	same-lst-sev-yrs	upper-areas	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	rotted	bacterial-pustule
june	normal	gt-norm	norm	no	same-lst-sev-yrs	low-areas	pot-severe	fungicide	80-89	norm	abnorm	yellow-halos	no-w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	present	norm	absent	norm	bacterial-pustule
june	normal	gt-norm	norm	no	same-lst-yr	whole-field	pot-severe	none	80-89	norm	abnorm	yellow-halos	no-w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	present	norm	absent	norm	bacterial-pustule
may	normal	norm	norm	no	same-lst-sev-yrs	low-areas	minor	fungicide	80-89	norm	abnorm	yellow-halos	w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	present	lt-norm	absent	norm	bacterial-pustule
june	lt-normal	gt-norm	gt-norm	yes	same-lst-yr	upper-areas	pot-severe	fungicide	lt-80	norm	abnorm	yellow-halos	no-w-s-marg	lt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	rotted	bacterial-pustule
september	normal	norm	gt-norm	no	diff-lst-year	low-areas	minor	none	80-89	abnorm	abnorm	yellow-halos	no-w-s-marg	lt-1/8	absent	present	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	present	present	norm	absent	norm	bacterial-pustule
june	lt-normal	gt-norm	lt-norm	yes	same-lst-yr	upper-areas	pot-severe	none	lt-80	norm	abnorm	yellow-halos	no-w-s-marg	lt-1/8	present	present	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	rotted	bacterial-pustule
september	normal	gt-norm	gt-norm	no	same-lst-two-yrs	upper-areas	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	absent	absent	absent	norm	no	absent	tan	absent	absent	absent	none	absent	diseased	colored	abnorm	absent	present	norm	absent	norm	purple-seed-stain
october	normal	gt-norm	lt-norm	no	same-lst-sev-yrs	whole-field	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	none	absent	diseased	colored	abnorm	absent	present	norm	absent	norm	purple-seed-stain
september	normal	gt-norm	gt-norm	no	same-lst-yr	low-areas	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	absent	absent	absent	norm	yes	absent	tan	absent	absent	absent	none	absent	diseased	colored	abnorm	absent	present	norm	absent	norm	purple-seed-stain
august	normal	gt-norm	gt-norm	no	diff-lst-year	scattered	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	absent	absent	absent	norm	no	absent	tan	absent	absent	absent	none	absent	diseased	colored	abnorm	absent	present	norm	absent	norm	purple-seed-stain
september	normal	gt-norm	lt-norm	yes	same-lst-yr	low-areas	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	none	absent	diseased	colored	abnorm	absent	present	norm	absent	norm	purple-seed-stain
october	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	minor	none	lt-80	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	none	absent	diseased	colored	abnorm	absent	present	norm	absent	norm	purple-seed-stain
july	normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	whole-field	minor	none	80-89	norm	norm	absent	dna	dna	absent	absent	absent	norm	yes	absent	tan	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	purple-seed-stain
july	normal	gt-norm	lt-norm	yes	same-lst-sev-yrs	whole-field	minor	none	lt-80	norm	norm	absent	dna	dna	absent	absent	absent	norm	yes	absent	tan	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	purple-seed-stain
september	normal	gt-norm	gt-norm	yes	same-lst-yr	low-areas	minor	fungicide	lt-80	norm	norm	absent	dna	dna	absent	absent	absent	norm	yes	absent	tan	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	purple-seed-stain
october	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	lt-1/8	absent	absent	absent	abnorm	yes	absent	tan	absent	absent	absent	none	absent	diseased	colored	abnorm	absent	present	norm	absent	norm	purple-seed-stain
april	normal	gt-norm	norm	yes	diff-lst-year	scattered	minor	none	90-100	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-soil	brown	absent	firm-and-dry	absent	none	absent	norm	absent	abnorm	absent	present	lt-norm	present	norm	anthracnose
june	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	minor	other	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	brown	absent	firm-and-dry	absent	none	absent	norm	absent	abnorm	absent	present	lt-norm	present	norm	anthracnose
august	normal	gt-norm	norm	yes	diff-lst-year	scattered	minor	fungicide	80-89	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	firm-and-dry	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
may	normal	gt-norm	norm	yes	diff-lst-year	scattered	minor	other	80-89	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-soil	brown	absent	firm-and-dry	absent	none	absent	norm	absent	abnorm	absent	present	norm	present	norm	anthracnose
august	lt-normal	gt-norm	gt-norm	no	same-lst-yr	low-areas	pot-severe	none	90-100	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	above-sec-nde	dk-brown-blk	present	firm-and-dry	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	absent	norm	anthracnose
october	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	80-89	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
october	lt-normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	fungicide	90-100	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
october	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	90-100	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
september	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	lt-80	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
september	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	fungicide	90-100	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
august	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	fungicide	lt-80	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	absent	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	anthracnose
july	lt-normal	gt-norm	gt-norm	no	same-lst-yr	low-areas	minor	fungicide	lt-80	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	above-sec-nde	dk-brown-blk	present	firm-and-dry	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	anthracnose
august	lt-normal	gt-norm	gt-norm	no	same-lst-yr	low-areas	minor	fungicide	90-100	abnorm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	no	above-sec-nde	dk-brown-blk	present	firm-and-dry	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	anthracnose
september	lt-normal	gt-norm	gt-norm	no	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	brown	present	firm-and-dry	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	anthracnose
october	lt-normal	gt-norm	gt-norm	no	same-lst-sev-yrs	whole-field	minor	fungicide	lt-80	norm	abnorm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	firm-and-dry	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	anthracnose
august	normal	gt-norm	norm	yes	same-lst-yr	low-areas	severe	none	90-100	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	absent	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	anthracnose
september	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	fungicide	80-89	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
october	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	90-100	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
august	lt-normal	gt-norm	norm	yes	same-lst-yr	low-areas	severe	fungicide	80-89	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	absent	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	anthracnose
september	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	90-100	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
october	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	fungicide	80-89	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	absent	lt-norm	present	norm	anthracnose
september	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	pot-severe	none	90-100	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	anthracnose
september	lt-normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	fungicide	80-89	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	absent	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	anthracnose
september	normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	none	80-89	norm	norm	absent	dna	dna	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	present	absent	absent	none	absent	diseased	brown-w/blk-specks	norm	absent	absent	norm	absent	norm	anthracnose
may	normal	lt-norm	norm	no	diff-lst-year	scattered	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	present	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
july	normal	lt-norm	norm	no	same-lst-two-yrs	whole-field	minor	none	lt-80	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	present	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
may	lt-normal	norm	norm	yes	same-lst-two-yrs	whole-field	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
june	lt-normal	norm	norm	yes	same-lst-two-yrs	scattered	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
june	normal	lt-norm	gt-norm	no	same-lst-yr	upper-areas	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
june	normal	lt-norm	gt-norm	no	same-lst-yr	whole-field	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
july	lt-normal	norm	gt-norm	yes	same-lst-yr	scattered	minor	none	90-100	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	present	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
august	lt-normal	norm	gt-norm	yes	same-lst-yr	upper-areas	minor	fungicide	80-89	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	present	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
june	lt-normal	norm	gt-norm	yes	same-lst-sev-yrs	scattered	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	present	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
august	lt-normal	norm	gt-norm	yes	same-lst-yr	whole-field	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	present	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	phyllosticta-leaf-spot
october	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	upper-areas	minor	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	lt-normal	gt-norm	gt-norm	yes	same-lst-two-yrs	whole-field	pot-severe	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	minor	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	norm	yes	same-lst-sev-yrs	whole-field	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	norm	yes	same-lst-sev-yrs	scattered	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	present	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	lt-normal	gt-norm	norm	no	diff-lst-year	scattered	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	alternarialeaf-spot
september	lt-normal	gt-norm	norm	no	same-lst-yr	low-areas	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
august	normal	gt-norm	norm	no	diff-lst-year	scattered	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	alternarialeaf-spot
october	lt-normal	norm	gt-norm	no	same-lst-yr	low-areas	minor	other	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
august	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	norm	norm	no	diff-lst-year	scattered	minor	other	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	norm	no	same-lst-two-yrs	upper-areas	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	alternarialeaf-spot
october	normal	norm	gt-norm	no	same-lst-sev-yrs	whole-field	minor	other	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	present	norm	absent	norm	alternarialeaf-spot
august	lt-normal	gt-norm	gt-norm	yes	diff-lst-year	scattered	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	alternarialeaf-spot
september	lt-normal	norm	gt-norm	no	diff-lst-year	scattered	pot-severe	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	norm	yes	same-lst-yr	low-areas	minor	other	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	lt-normal	norm	gt-norm	no	same-lst-two-yrs	upper-areas	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	abnorm	absent	present	norm	absent	norm	alternarialeaf-spot
august	normal	gt-norm	norm	yes	same-lst-yr	scattered	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	low-areas	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	upper-areas	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-yr	whole-field	minor	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	scattered	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	low-areas	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	whole-field	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	scattered	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-yr	low-areas	minor	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
august	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	whole-field	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	gt-norm	yes	same-lst-yr	scattered	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
july	normal	gt-norm	norm	yes	same-lst-two-yrs	low-areas	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
august	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-yr	whole-field	pot-severe	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	scattered	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
august	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	low-areas	pot-severe	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
august	normal	gt-norm	norm	yes	same-lst-yr	upper-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	whole-field	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	scattered	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-yr	low-areas	pot-severe	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	upper-areas	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	whole-field	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-yr	scattered	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	low-areas	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	upper-areas	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	whole-field	pot-severe	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	low-areas	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	low-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
october	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	upper-areas	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	alternarialeaf-spot
august	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	scattered	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
july	normal	gt-norm	norm	yes	same-lst-yr	scattered	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	norm	yes	same-lst-yr	whole-field	pot-severe	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	gt-norm	\N	same-lst-yr	whole-field	\N	\N	90-100	norm	norm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dna	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	present	lt-norm	present	\N	diaporthe-pod-&-stem-blight
august	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	low-areas	pot-severe	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	lt-normal	gt-norm	norm	yes	same-lst-two-yrs	low-areas	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	scattered	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	norm	norm	no	same-lst-sev-yrs	low-areas	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
october	normal	norm	norm	yes	same-lst-two-yrs	whole-field	minor	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	norm	norm	no	diff-lst-year	low-areas	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dna	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
july	normal	gt-norm	norm	no	diff-lst-year	scattered	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	norm	no	same-lst-two-yrs	upper-areas	minor	other	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	no	above-sec-nde	brown	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
july	lt-normal	gt-norm	norm	no	diff-lst-year	scattered	pot-severe	fungicide	lt-80	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	no	above-soil	brown	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	norm	no	same-lst-two-yrs	upper-areas	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	brown	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	gt-norm	no	same-lst-yr	scattered	pot-severe	other	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	gt-norm	no	same-lst-sev-yrs	upper-areas	minor	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
july	lt-normal	gt-norm	gt-norm	no	same-lst-two-yrs	scattered	pot-severe	none	lt-80	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	lt-normal	gt-norm	gt-norm	no	same-lst-sev-yrs	scattered	pot-severe	other	lt-80	abnorm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	no	above-sec-nde	brown	absent	firm-and-dry	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
july	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	norm	yes	absent	dna	absent	absent	absent	none	absent	norm	absent	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
july	normal	gt-norm	norm	yes	same-lst-yr	scattered	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	low-areas	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	upper-areas	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
october	normal	gt-norm	gt-norm	yes	same-lst-yr	whole-field	minor	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	norm	yes	same-lst-two-yrs	scattered	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	low-areas	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
october	normal	gt-norm	norm	yes	same-lst-yr	upper-areas	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	whole-field	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	scattered	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
october	normal	gt-norm	gt-norm	yes	same-lst-yr	low-areas	minor	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	whole-field	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
october	normal	gt-norm	norm	yes	same-lst-yr	scattered	minor	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
july	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	low-areas	pot-severe	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	upper-areas	pot-severe	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-yr	whole-field	minor	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
october	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	scattered	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
july	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	low-areas	pot-severe	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	norm	yes	same-lst-yr	upper-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	norm	yes	same-lst-two-yrs	whole-field	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
october	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	scattered	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
july	normal	gt-norm	norm	yes	same-lst-yr	low-areas	pot-severe	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	norm	yes	same-lst-two-yrs	upper-areas	pot-severe	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	whole-field	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	norm	yes	same-lst-yr	scattered	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	low-areas	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
october	lt-normal	gt-norm	norm	yes	same-lst-sev-yrs	upper-areas	minor	none	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	gt-norm	yes	same-lst-yr	whole-field	pot-severe	fungicide	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	norm	yes	same-lst-two-yrs	scattered	minor	none	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
october	lt-normal	gt-norm	gt-norm	yes	same-lst-sev-yrs	low-areas	minor	fungicide	lt-80	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
august	normal	gt-norm	norm	yes	same-lst-yr	upper-areas	pot-severe	none	90-100	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
september	normal	gt-norm	gt-norm	yes	same-lst-two-yrs	whole-field	minor	fungicide	80-89	norm	abnorm	no-yellow-halos	w-s-marg	gt-1/8	absent	absent	absent	abnorm	yes	above-sec-nde	dk-brown-blk	absent	firm-and-dry	absent	none	absent	diseased	colored	norm	absent	absent	norm	absent	norm	frog-eye-leaf-spot
october	\N	gt-norm	gt-norm	\N	same-lst-two-yrs	whole-field	\N	\N	\N	norm	norm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dna	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	present	lt-norm	present	\N	diaporthe-pod-&-stem-blight
october	\N	gt-norm	gt-norm	\N	same-lst-yr	whole-field	\N	\N	\N	norm	norm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dna	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	present	lt-norm	present	\N	diaporthe-pod-&-stem-blight
september	\N	gt-norm	gt-norm	\N	same-lst-yr	whole-field	\N	\N	\N	norm	norm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dna	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	present	lt-norm	present	\N	diaporthe-pod-&-stem-blight
october	\N	gt-norm	gt-norm	\N	same-lst-sev-yrs	whole-field	\N	\N	\N	norm	norm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dna	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	present	lt-norm	present	\N	diaporthe-pod-&-stem-blight
october	\N	gt-norm	gt-norm	\N	diff-lst-year	whole-field	\N	\N	\N	norm	norm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dna	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	present	lt-norm	present	\N	diaporthe-pod-&-stem-blight
september	normal	gt-norm	gt-norm	\N	same-lst-sev-yrs	whole-field	\N	\N	90-100	norm	norm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dna	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	present	lt-norm	present	\N	diaporthe-pod-&-stem-blight
october	normal	gt-norm	gt-norm	\N	same-lst-sev-yrs	whole-field	\N	\N	80-89	norm	norm	\N	\N	\N	\N	\N	\N	abnorm	\N	absent	dna	present	absent	absent	none	absent	diseased	brown-w/blk-specks	abnorm	present	present	lt-norm	present	\N	diaporthe-pod-&-stem-blight
june	\N	\N	\N	\N	same-lst-yr	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	norm	\N	\N	\N	\N	\N	\N	\N	\N	few-present	\N	abnorm	absent	\N	lt-norm	\N	galls-cysts	cyst-nematode
july	\N	\N	\N	\N	same-lst-two-yrs	upper-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	norm	\N	\N	\N	\N	\N	\N	\N	\N	few-present	\N	abnorm	absent	\N	lt-norm	\N	galls-cysts	cyst-nematode
august	\N	\N	\N	\N	same-lst-yr	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	norm	\N	\N	\N	\N	\N	\N	\N	\N	few-present	\N	abnorm	absent	\N	lt-norm	\N	galls-cysts	cyst-nematode
june	\N	\N	\N	\N	same-lst-two-yrs	upper-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	norm	\N	\N	\N	\N	\N	\N	\N	\N	few-present	\N	abnorm	absent	\N	lt-norm	\N	galls-cysts	cyst-nematode
july	\N	\N	\N	\N	same-lst-two-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	norm	\N	\N	\N	\N	\N	\N	\N	\N	few-present	\N	abnorm	absent	\N	lt-norm	\N	galls-cysts	cyst-nematode
august	\N	\N	\N	\N	same-lst-sev-yrs	upper-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	norm	\N	\N	\N	\N	\N	\N	\N	\N	few-present	\N	abnorm	absent	\N	lt-norm	\N	galls-cysts	cyst-nematode
august	\N	\N	\N	\N	same-lst-sev-yrs	low-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	norm	\N	\N	\N	\N	\N	\N	\N	\N	few-present	\N	abnorm	absent	\N	lt-norm	\N	galls-cysts	cyst-nematode
july	\N	\N	\N	\N	same-lst-sev-yrs	upper-areas	\N	\N	\N	abnorm	abnorm	\N	\N	\N	\N	\N	\N	norm	\N	\N	\N	\N	\N	\N	\N	\N	few-present	\N	abnorm	absent	\N	lt-norm	\N	galls-cysts	cyst-nematode
september	\N	\N	\N	\N	\N	low-areas	\N	\N	\N	\N	abnorm	absent	dna	dna	\N	present	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2-4-output-injury
april	\N	\N	\N	\N	\N	scattered	\N	\N	\N	\N	abnorm	absent	dna	dna	\N	present	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2-4-output-injury
may	\N	\N	\N	\N	\N	low-areas	\N	\N	\N	\N	abnorm	absent	dna	dna	\N	present	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2-4-output-injury
june	\N	\N	\N	\N	\N	upper-areas	\N	\N	\N	\N	abnorm	absent	dna	dna	\N	present	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2-4-output-injury
july	\N	\N	\N	\N	\N	whole-field	\N	\N	\N	\N	abnorm	absent	dna	dna	\N	present	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2-4-output-injury
august	\N	\N	\N	\N	\N	scattered	\N	\N	\N	\N	abnorm	absent	dna	dna	\N	present	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2-4-output-injury
october	\N	\N	\N	\N	\N	upper-areas	\N	\N	\N	\N	abnorm	absent	dna	dna	\N	present	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2-4-output-injury
april	\N	\N	\N	\N	\N	whole-field	\N	\N	\N	\N	abnorm	absent	dna	dna	\N	present	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2-4-output-injury
may	\N	\N	\N	\N	\N	scattered	\N	\N	\N	\N	abnorm	absent	dna	dna	\N	present	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2-4-output-injury
june	\N	\N	\N	\N	\N	low-areas	\N	\N	\N	\N	abnorm	absent	dna	dna	\N	present	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2-4-output-injury
july	\N	\N	\N	\N	\N	upper-areas	\N	\N	\N	\N	abnorm	absent	dna	dna	\N	present	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2-4-output-injury
august	\N	\N	\N	\N	\N	whole-field	\N	\N	\N	\N	abnorm	absent	dna	dna	\N	present	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2-4-output-injury
september	\N	\N	\N	\N	\N	scattered	\N	\N	\N	\N	abnorm	absent	dna	dna	\N	present	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2-4-output-injury
october	\N	\N	\N	\N	\N	low-areas	\N	\N	\N	\N	abnorm	absent	dna	dna	\N	present	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2-4-output-injury
april	\N	\N	\N	\N	\N	upper-areas	\N	\N	\N	\N	abnorm	absent	dna	dna	\N	present	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2-4-output-injury
april	lt-normal	\N	lt-norm	\N	diff-lst-year	scattered	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	present	\N	abnorm	\N	\N	\N	\N	\N	\N	\N	\N	dna	\N	\N	\N	\N	\N	\N	rotted	herbicide-injury
june	lt-normal	\N	lt-norm	\N	diff-lst-year	scattered	\N	\N	\N	abnorm	abnorm	absent	dna	dna	absent	present	\N	abnorm	\N	\N	\N	\N	\N	\N	\N	\N	dna	\N	\N	\N	\N	\N	\N	rotted	herbicide-injury
april	lt-normal	\N	lt-norm	\N	same-lst-yr	whole-field	\N	\N	\N	abnorm	abnorm	no-yellow-halos	no-w-s-marg	gt-1/8	absent	present	\N	abnorm	\N	\N	\N	\N	\N	\N	\N	\N	dna	\N	\N	\N	\N	\N	\N	rotted	herbicide-injury
june	lt-normal	\N	lt-norm	\N	same-lst-yr	whole-field	\N	\N	\N	abnorm	abnorm	no-yellow-halos	no-w-s-marg	gt-1/8	absent	present	\N	abnorm	\N	\N	\N	\N	\N	\N	\N	\N	dna	\N	\N	\N	\N	\N	\N	rotted	herbicide-injury
\.


--
-- TOC entry 2219 (class 0 OID 0)
-- Dependencies: 193
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 6, true);


--
-- TOC entry 2065 (class 2606 OID 17248)
-- Name: audit_code audit_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_code
    ADD CONSTRAINT audit_code_pkey PRIMARY KEY (id);


--
-- TOC entry 2067 (class 2606 OID 17252)
-- Name: audit_event_template audit_event_template_code_id_event_type_unique_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_event_template
    ADD CONSTRAINT audit_event_template_code_id_event_type_unique_index UNIQUE (audit_code_id, event_type);


--
-- TOC entry 2069 (class 2606 OID 17254)
-- Name: audit_event_template audit_event_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_event_template
    ADD CONSTRAINT audit_event_template_pkey PRIMARY KEY (id);


--
-- TOC entry 2071 (class 2606 OID 17256)
-- Name: audit_group audit_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_group
    ADD CONSTRAINT audit_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2073 (class 2606 OID 17258)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 2075 (class 2606 OID 17260)
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- TOC entry 2079 (class 2606 OID 17456)
-- Name: retry_request retry_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retry_request
    ADD CONSTRAINT retry_request_pkey PRIMARY KEY (id);


--
-- TOC entry 2077 (class 2606 OID 17262)
-- Name: instances table_name_unique_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instances
    ADD CONSTRAINT table_name_unique_index UNIQUE (table_name);


--
-- TOC entry 2080 (class 2606 OID 17263)
-- Name: audit_code fk_audit_code_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_code
    ADD CONSTRAINT fk_audit_code_group_id FOREIGN KEY (audit_group_id) REFERENCES public.audit_group(id);


--
-- TOC entry 2081 (class 2606 OID 17268)
-- Name: audit_event_template fk_audit_event_template_code_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_event_template
    ADD CONSTRAINT fk_audit_event_template_code_id FOREIGN KEY (audit_code_id) REFERENCES public.audit_code(id);


-- Completed on 2022-12-09 13:08:35 +07

--
-- PostgreSQL database dump complete
--

