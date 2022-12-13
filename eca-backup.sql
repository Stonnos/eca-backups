--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)

-- Started on 2022-12-09 13:06:41 +07

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
-- TOC entry 2557 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 185 (class 1259 OID 16391)
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
-- TOC entry 186 (class 1259 OID 16404)
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
-- TOC entry 187 (class 1259 OID 16410)
-- Name: audit_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_group (
    id character varying(255) NOT NULL,
    title character varying(255)
);


ALTER TABLE public.audit_group OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16416)
-- Name: classifier_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classifier_info (
    id bigint NOT NULL,
    classifier_name character varying(255) NOT NULL,
    classifier_options text
);


ALTER TABLE public.classifier_info OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16419)
-- Name: classifier_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classifier_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classifier_info_id_seq OWNER TO postgres;

--
-- TOC entry 2558 (class 0 OID 0)
-- Dependencies: 189
-- Name: classifier_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classifier_info_id_seq OWNED BY public.classifier_info.id;


--
-- TOC entry 190 (class 1259 OID 16421)
-- Name: classifier_input_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classifier_input_options (
    id bigint NOT NULL,
    option_name character varying(255) NOT NULL,
    option_value character varying(255),
    option_order integer NOT NULL,
    classifier_info_id bigint NOT NULL
);


ALTER TABLE public.classifier_input_options OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16427)
-- Name: classifier_input_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classifier_input_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classifier_input_options_id_seq OWNER TO postgres;

--
-- TOC entry 2559 (class 0 OID 0)
-- Dependencies: 191
-- Name: classifier_input_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classifier_input_options_id_seq OWNED BY public.classifier_input_options.id;


--
-- TOC entry 192 (class 1259 OID 16429)
-- Name: classifier_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classifier_options (
    id bigint NOT NULL,
    options_name character varying(255) NOT NULL,
    creation_date timestamp without time zone NOT NULL,
    config text NOT NULL,
    config_md5_hash character varying(255) NOT NULL,
    configuration_id bigint NOT NULL,
    created_by character varying(255)
);


ALTER TABLE public.classifier_options OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16435)
-- Name: classifier_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classifier_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classifier_options_id_seq OWNER TO postgres;

--
-- TOC entry 2560 (class 0 OID 0)
-- Dependencies: 193
-- Name: classifier_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classifier_options_id_seq OWNED BY public.classifier_options.id;


--
-- TOC entry 194 (class 1259 OID 16437)
-- Name: classifier_options_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classifier_options_request (
    id bigint NOT NULL,
    creation_date timestamp without time zone,
    source character varying(255),
    classifier_options_request_model_id bigint NOT NULL
);


ALTER TABLE public.classifier_options_request OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16440)
-- Name: classifier_options_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classifier_options_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classifier_options_request_id_seq OWNER TO postgres;

--
-- TOC entry 2561 (class 0 OID 0)
-- Dependencies: 195
-- Name: classifier_options_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classifier_options_request_id_seq OWNED BY public.classifier_options_request.id;


--
-- TOC entry 196 (class 1259 OID 16442)
-- Name: classifier_options_request_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classifier_options_request_model (
    id bigint NOT NULL,
    relation_name character varying(255),
    data_md5_hash character varying(255),
    evaluation_method character varying(255),
    num_folds integer,
    num_tests integer,
    seed integer
);


ALTER TABLE public.classifier_options_request_model OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16448)
-- Name: classifier_options_request_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classifier_options_request_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classifier_options_request_model_id_seq OWNER TO postgres;

--
-- TOC entry 2562 (class 0 OID 0)
-- Dependencies: 197
-- Name: classifier_options_request_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classifier_options_request_model_id_seq OWNED BY public.classifier_options_request_model.id;


--
-- TOC entry 198 (class 1259 OID 16450)
-- Name: classifier_options_response_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classifier_options_response_model (
    id bigint NOT NULL,
    classifier_name character varying(255),
    classifier_description character varying(255),
    classifier_options text,
    classifier_options_request_model_id bigint NOT NULL
);


ALTER TABLE public.classifier_options_response_model OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16456)
-- Name: classifier_options_response_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classifier_options_response_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classifier_options_response_model_id_seq OWNER TO postgres;

--
-- TOC entry 2563 (class 0 OID 0)
-- Dependencies: 199
-- Name: classifier_options_response_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classifier_options_response_model_id_seq OWNED BY public.classifier_options_response_model.id;


--
-- TOC entry 200 (class 1259 OID 16458)
-- Name: classifiers_configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classifiers_configuration (
    id bigint NOT NULL,
    configuration_name character varying(255) NOT NULL,
    creation_date timestamp without time zone NOT NULL,
    updated timestamp without time zone,
    build_in boolean DEFAULT false,
    is_active boolean DEFAULT false,
    created_by character varying(255)
);


ALTER TABLE public.classifiers_configuration OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17602)
-- Name: classifiers_configuration_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classifiers_configuration_history (
    id bigint NOT NULL,
    action_type character varying(255) NOT NULL,
    message_text text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    configuration_id bigint NOT NULL
);


ALTER TABLE public.classifiers_configuration_history OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 17600)
-- Name: classifiers_configuration_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classifiers_configuration_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classifiers_configuration_history_id_seq OWNER TO postgres;

--
-- TOC entry 2564 (class 0 OID 0)
-- Dependencies: 241
-- Name: classifiers_configuration_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classifiers_configuration_history_id_seq OWNED BY public.classifiers_configuration_history.id;


--
-- TOC entry 201 (class 1259 OID 16466)
-- Name: classifiers_configuration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classifiers_configuration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classifiers_configuration_id_seq OWNER TO postgres;

--
-- TOC entry 2565 (class 0 OID 0)
-- Dependencies: 201
-- Name: classifiers_configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classifiers_configuration_id_seq OWNED BY public.classifiers_configuration.id;


--
-- TOC entry 202 (class 1259 OID 16468)
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
-- TOC entry 203 (class 1259 OID 16474)
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
-- TOC entry 204 (class 1259 OID 16485)
-- Name: ers_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ers_request (
    id bigint NOT NULL,
    request_date timestamp without time zone,
    request_id character varying(255) NOT NULL,
    response_status character varying(255) NOT NULL,
    details text
);


ALTER TABLE public.ers_request OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16491)
-- Name: ers_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ers_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ers_request_id_seq OWNER TO postgres;

--
-- TOC entry 2566 (class 0 OID 0)
-- Dependencies: 205
-- Name: ers_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ers_request_id_seq OWNED BY public.ers_request.id;


--
-- TOC entry 206 (class 1259 OID 16501)
-- Name: evaluation_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluation_log (
    id bigint NOT NULL,
    creation_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    error_message text,
    evaluation_method character varying(255) NOT NULL,
    request_status character varying(255) NOT NULL,
    start_date timestamp without time zone,
    instances_info_id bigint NOT NULL,
    request_id character varying(255) NOT NULL,
    classifier_info_id bigint NOT NULL,
    num_folds integer,
    num_tests integer,
    seed integer
);


ALTER TABLE public.evaluation_log OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16507)
-- Name: evaluation_results_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluation_results_request (
    id bigint NOT NULL,
    evaluation_log_id bigint NOT NULL
);


ALTER TABLE public.evaluation_results_request OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16510)
-- Name: evaluation_results_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evaluation_results_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evaluation_results_request_id_seq OWNER TO postgres;

--
-- TOC entry 2567 (class 0 OID 0)
-- Dependencies: 208
-- Name: evaluation_results_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evaluation_results_request_id_seq OWNED BY public.evaluation_results_request.id;


--
-- TOC entry 209 (class 1259 OID 16512)
-- Name: experiment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiment (
    id bigint NOT NULL,
    creation_date timestamp without time zone NOT NULL,
    email character varying(255),
    end_date timestamp without time zone,
    error_message text,
    evaluation_method character varying(255) NOT NULL,
    experiment_path character varying(255),
    request_status character varying(255) NOT NULL,
    experiment_type character varying(255) NOT NULL,
    start_date timestamp without time zone,
    training_data_path character varying(255),
    request_id character varying(255) NOT NULL,
    deleted_date timestamp without time zone,
    num_folds integer,
    num_tests integer,
    seed integer,
    class_index integer,
    channel_type character varying(255) NOT NULL,
    reply_to character varying(255),
    correlation_id character varying(255),
    experiment_download_url character varying(1024),
    instances_info_id bigint
);


ALTER TABLE public.experiment OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16518)
-- Name: experiment_progress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiment_progress (
    id bigint NOT NULL,
    progress integer NOT NULL,
    finished boolean DEFAULT false,
    experiment_id bigint NOT NULL
);


ALTER TABLE public.experiment_progress OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16522)
-- Name: experiment_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.experiment_progress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.experiment_progress_id_seq OWNER TO postgres;

--
-- TOC entry 2568 (class 0 OID 0)
-- Dependencies: 211
-- Name: experiment_progress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.experiment_progress_id_seq OWNED BY public.experiment_progress.id;


--
-- TOC entry 212 (class 1259 OID 16524)
-- Name: experiment_results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiment_results (
    id bigint NOT NULL,
    results_index integer NOT NULL,
    classifier_info_id bigint NOT NULL,
    pct_correct numeric(19,4),
    experiment_id bigint NOT NULL
);


ALTER TABLE public.experiment_results OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16527)
-- Name: experiment_results_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.experiment_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.experiment_results_id_seq OWNER TO postgres;

--
-- TOC entry 2569 (class 0 OID 0)
-- Dependencies: 213
-- Name: experiment_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.experiment_results_id_seq OWNED BY public.experiment_results.id;


--
-- TOC entry 214 (class 1259 OID 16529)
-- Name: experiment_results_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiment_results_request (
    id bigint NOT NULL,
    request_source character varying(255),
    experiment_results_id bigint NOT NULL
);


ALTER TABLE public.experiment_results_request OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16532)
-- Name: experiment_results_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.experiment_results_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.experiment_results_request_id_seq OWNER TO postgres;

--
-- TOC entry 2570 (class 0 OID 0)
-- Dependencies: 215
-- Name: experiment_results_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.experiment_results_request_id_seq OWNED BY public.experiment_results_request.id;


--
-- TOC entry 245 (class 1259 OID 17631)
-- Name: experiment_step; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiment_step (
    id bigint NOT NULL,
    step character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    step_order integer NOT NULL,
    created timestamp without time zone NOT NULL,
    started timestamp without time zone,
    completed timestamp without time zone,
    error_message text,
    num_failed_attempts integer DEFAULT 0,
    experiment_id bigint NOT NULL
);


ALTER TABLE public.experiment_step OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 17629)
-- Name: experiment_step_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.experiment_step_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.experiment_step_id_seq OWNER TO postgres;

--
-- TOC entry 2571 (class 0 OID 0)
-- Dependencies: 244
-- Name: experiment_step_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.experiment_step_id_seq OWNED BY public.experiment_step.id;


--
-- TOC entry 216 (class 1259 OID 16534)
-- Name: filter_dictionary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filter_dictionary (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.filter_dictionary OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16537)
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
-- TOC entry 2572 (class 0 OID 0)
-- Dependencies: 217
-- Name: filter_dictionary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filter_dictionary_id_seq OWNED BY public.filter_dictionary.id;


--
-- TOC entry 218 (class 1259 OID 16539)
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
-- TOC entry 219 (class 1259 OID 16545)
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
-- TOC entry 2573 (class 0 OID 0)
-- Dependencies: 219
-- Name: filter_dictionary_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filter_dictionary_value_id_seq OWNED BY public.filter_dictionary_value.id;


--
-- TOC entry 220 (class 1259 OID 16547)
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
-- TOC entry 221 (class 1259 OID 16554)
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
-- TOC entry 2574 (class 0 OID 0)
-- Dependencies: 221
-- Name: filter_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filter_field_id_seq OWNED BY public.filter_field.id;


--
-- TOC entry 222 (class 1259 OID 16556)
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
-- TOC entry 223 (class 1259 OID 16562)
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
-- TOC entry 2575 (class 0 OID 0)
-- Dependencies: 223
-- Name: filter_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filter_template_id_seq OWNED BY public.filter_template.id;


--
-- TOC entry 238 (class 1259 OID 17547)
-- Name: form_field; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_field (
    id bigint NOT NULL,
    field_name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    field_order integer NOT NULL,
    field_type character varying(255) NOT NULL,
    min_value numeric(19,2),
    min_inclusive boolean DEFAULT true,
    max_value numeric(19,2),
    max_inclusive boolean DEFAULT true,
    max_length integer,
    pattern character varying(255),
    invalid_pattern_message character varying(255),
    place_holder character varying(255),
    template_id bigint NOT NULL,
    dictionary_id bigint,
    default_value character varying(255),
    read_only boolean DEFAULT false
);


ALTER TABLE public.form_field OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17539)
-- Name: form_field_dictionary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_field_dictionary (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.form_field_dictionary OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17537)
-- Name: form_field_dictionary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.form_field_dictionary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_field_dictionary_id_seq OWNER TO postgres;

--
-- TOC entry 2576 (class 0 OID 0)
-- Dependencies: 235
-- Name: form_field_dictionary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.form_field_dictionary_id_seq OWNED BY public.form_field_dictionary.id;


--
-- TOC entry 240 (class 1259 OID 17572)
-- Name: form_field_dictionary_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_field_dictionary_value (
    id bigint NOT NULL,
    label character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    dictionary_id bigint NOT NULL
);


ALTER TABLE public.form_field_dictionary_value OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17570)
-- Name: form_field_dictionary_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.form_field_dictionary_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_field_dictionary_value_id_seq OWNER TO postgres;

--
-- TOC entry 2577 (class 0 OID 0)
-- Dependencies: 239
-- Name: form_field_dictionary_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.form_field_dictionary_value_id_seq OWNED BY public.form_field_dictionary_value.id;


--
-- TOC entry 237 (class 1259 OID 17545)
-- Name: form_field_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.form_field_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_field_id_seq OWNER TO postgres;

--
-- TOC entry 2578 (class 0 OID 0)
-- Dependencies: 237
-- Name: form_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.form_field_id_seq OWNED BY public.form_field.id;


--
-- TOC entry 234 (class 1259 OID 17521)
-- Name: form_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_template (
    id bigint NOT NULL,
    template_name character varying(255) NOT NULL,
    object_class character varying(255),
    object_type character varying(255),
    template_title character varying(255) NOT NULL,
    group_id bigint NOT NULL
);


ALTER TABLE public.form_template OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17511)
-- Name: form_template_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_template_group (
    id bigint NOT NULL,
    group_name character varying(255) NOT NULL
);


ALTER TABLE public.form_template_group OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17509)
-- Name: form_template_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.form_template_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_template_group_id_seq OWNER TO postgres;

--
-- TOC entry 2579 (class 0 OID 0)
-- Dependencies: 231
-- Name: form_template_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.form_template_group_id_seq OWNED BY public.form_template_group.id;


--
-- TOC entry 233 (class 1259 OID 17519)
-- Name: form_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.form_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_template_id_seq OWNER TO postgres;

--
-- TOC entry 2580 (class 0 OID 0)
-- Dependencies: 233
-- Name: form_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.form_template_id_seq OWNED BY public.form_template.id;


--
-- TOC entry 224 (class 1259 OID 16564)
-- Name: global_filter_field; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.global_filter_field (
    id bigint NOT NULL,
    field_name character varying(255) NOT NULL,
    global_filter_template_id bigint NOT NULL
);


ALTER TABLE public.global_filter_field OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16567)
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
-- TOC entry 2581 (class 0 OID 0)
-- Dependencies: 225
-- Name: global_filter_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.global_filter_field_id_seq OWNED BY public.global_filter_field.id;


--
-- TOC entry 226 (class 1259 OID 16569)
-- Name: global_filter_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.global_filter_template (
    id bigint NOT NULL,
    filter_name character varying(255) NOT NULL,
    template_type character varying(255) NOT NULL
);


ALTER TABLE public.global_filter_template OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16575)
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
-- TOC entry 2582 (class 0 OID 0)
-- Dependencies: 227
-- Name: global_filter_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.global_filter_template_id_seq OWNED BY public.global_filter_template.id;


--
-- TOC entry 228 (class 1259 OID 16577)
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
-- TOC entry 229 (class 1259 OID 16579)
-- Name: instances_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instances_info (
    id bigint NOT NULL,
    class_name character varying(255) NOT NULL,
    num_attributes integer NOT NULL,
    num_classes integer NOT NULL,
    num_instances integer NOT NULL,
    relation_name character varying(255) NOT NULL
);


ALTER TABLE public.instances_info OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 17616)
-- Name: message_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message_template (
    id character varying(255) NOT NULL,
    template_text text NOT NULL
);


ALTER TABLE public.message_template OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17491)
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
-- TOC entry 2217 (class 2604 OID 16585)
-- Name: classifier_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_info ALTER COLUMN id SET DEFAULT nextval('public.classifier_info_id_seq'::regclass);


--
-- TOC entry 2218 (class 2604 OID 16586)
-- Name: classifier_input_options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_input_options ALTER COLUMN id SET DEFAULT nextval('public.classifier_input_options_id_seq'::regclass);


--
-- TOC entry 2219 (class 2604 OID 16587)
-- Name: classifier_options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_options ALTER COLUMN id SET DEFAULT nextval('public.classifier_options_id_seq'::regclass);


--
-- TOC entry 2220 (class 2604 OID 16588)
-- Name: classifier_options_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_options_request ALTER COLUMN id SET DEFAULT nextval('public.classifier_options_request_id_seq'::regclass);


--
-- TOC entry 2221 (class 2604 OID 16589)
-- Name: classifier_options_request_model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_options_request_model ALTER COLUMN id SET DEFAULT nextval('public.classifier_options_request_model_id_seq'::regclass);


--
-- TOC entry 2222 (class 2604 OID 16590)
-- Name: classifier_options_response_model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_options_response_model ALTER COLUMN id SET DEFAULT nextval('public.classifier_options_response_model_id_seq'::regclass);


--
-- TOC entry 2225 (class 2604 OID 16591)
-- Name: classifiers_configuration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifiers_configuration ALTER COLUMN id SET DEFAULT nextval('public.classifiers_configuration_id_seq'::regclass);


--
-- TOC entry 2249 (class 2604 OID 17605)
-- Name: classifiers_configuration_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifiers_configuration_history ALTER COLUMN id SET DEFAULT nextval('public.classifiers_configuration_history_id_seq'::regclass);


--
-- TOC entry 2226 (class 2604 OID 16592)
-- Name: ers_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ers_request ALTER COLUMN id SET DEFAULT nextval('public.ers_request_id_seq'::regclass);


--
-- TOC entry 2227 (class 2604 OID 16594)
-- Name: evaluation_results_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_results_request ALTER COLUMN id SET DEFAULT nextval('public.evaluation_results_request_id_seq'::regclass);


--
-- TOC entry 2229 (class 2604 OID 16595)
-- Name: experiment_progress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment_progress ALTER COLUMN id SET DEFAULT nextval('public.experiment_progress_id_seq'::regclass);


--
-- TOC entry 2230 (class 2604 OID 16596)
-- Name: experiment_results id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment_results ALTER COLUMN id SET DEFAULT nextval('public.experiment_results_id_seq'::regclass);


--
-- TOC entry 2231 (class 2604 OID 16597)
-- Name: experiment_results_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment_results_request ALTER COLUMN id SET DEFAULT nextval('public.experiment_results_request_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 17634)
-- Name: experiment_step id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment_step ALTER COLUMN id SET DEFAULT nextval('public.experiment_step_id_seq'::regclass);


--
-- TOC entry 2232 (class 2604 OID 16598)
-- Name: filter_dictionary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_dictionary ALTER COLUMN id SET DEFAULT nextval('public.filter_dictionary_id_seq'::regclass);


--
-- TOC entry 2233 (class 2604 OID 16599)
-- Name: filter_dictionary_value id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_dictionary_value ALTER COLUMN id SET DEFAULT nextval('public.filter_dictionary_value_id_seq'::regclass);


--
-- TOC entry 2235 (class 2604 OID 16600)
-- Name: filter_field id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_field ALTER COLUMN id SET DEFAULT nextval('public.filter_field_id_seq'::regclass);


--
-- TOC entry 2236 (class 2604 OID 16601)
-- Name: filter_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_template ALTER COLUMN id SET DEFAULT nextval('public.filter_template_id_seq'::regclass);


--
-- TOC entry 2244 (class 2604 OID 17550)
-- Name: form_field id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_field ALTER COLUMN id SET DEFAULT nextval('public.form_field_id_seq'::regclass);


--
-- TOC entry 2243 (class 2604 OID 17542)
-- Name: form_field_dictionary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_field_dictionary ALTER COLUMN id SET DEFAULT nextval('public.form_field_dictionary_id_seq'::regclass);


--
-- TOC entry 2248 (class 2604 OID 17575)
-- Name: form_field_dictionary_value id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_field_dictionary_value ALTER COLUMN id SET DEFAULT nextval('public.form_field_dictionary_value_id_seq'::regclass);


--
-- TOC entry 2242 (class 2604 OID 17524)
-- Name: form_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_template ALTER COLUMN id SET DEFAULT nextval('public.form_template_id_seq'::regclass);


--
-- TOC entry 2241 (class 2604 OID 17514)
-- Name: form_template_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_template_group ALTER COLUMN id SET DEFAULT nextval('public.form_template_group_id_seq'::regclass);


--
-- TOC entry 2237 (class 2604 OID 16602)
-- Name: global_filter_field id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_filter_field ALTER COLUMN id SET DEFAULT nextval('public.global_filter_field_id_seq'::regclass);


--
-- TOC entry 2238 (class 2604 OID 16603)
-- Name: global_filter_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_filter_template ALTER COLUMN id SET DEFAULT nextval('public.global_filter_template_id_seq'::regclass);


--
-- TOC entry 2491 (class 0 OID 16391)
-- Dependencies: 185
-- Data for Name: audit_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_code (id, title, enabled, audit_group_id) FROM stdin;
ADD_CONFIGURATION	Добавление новой конфигурации с настройками классификаторов	t	CLASSIFIERS_CONFIGURATIONS_ACTIONS
RENAME_CONFIGURATION	Изменение названия конфигурации с настройками классификаторов	t	CLASSIFIERS_CONFIGURATIONS_ACTIONS
DELETE_CONFIGURATION	Удаление конфигурации с настройками классификаторов	t	CLASSIFIERS_CONFIGURATIONS_ACTIONS
SET_ACTIVE_CONFIGURATION	Установка активной конфигурации с настройками классификаторов	t	CLASSIFIERS_CONFIGURATIONS_ACTIONS
COPY_CONFIGURATION	Создание копии конфигурации с настройками классификаторов	t	CLASSIFIERS_CONFIGURATIONS_ACTIONS
ADD_CLASSIFIER_OPTIONS	Добавление настроек классификатора в конфигурацию	t	CLASSIFIERS_CONFIGURATIONS_ACTIONS
DELETE_CLASSIFIER_OPTIONS	Удаление настроек классификатора из конфигурации	t	CLASSIFIERS_CONFIGURATIONS_ACTIONS
GENERATE_CONFIGURATION_REPORT	Выгрузка отчета для конфигурации с настройками классификаторов	t	CLASSIFIERS_CONFIGURATIONS_ACTIONS
CREATE_EXPERIMENT_REQUEST	Создание заявки на эксперимент	t	EVALUATION_REQUESTS_ACTIONS
GENERATE_EVALUATION_REQUESTS_REPORT	Выгрузка отчета по заявкам	t	EVALUATION_REQUESTS_ACTIONS
\.


--
-- TOC entry 2492 (class 0 OID 16404)
-- Dependencies: 186
-- Data for Name: audit_event_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_event_template (id, event_type, message_template, audit_code_id) FROM stdin;
1	SUCCESS	Добавлена новая конфигурация [${returnValue.id}] с именем ${configurationDto.configurationName}	ADD_CONFIGURATION
2	SUCCESS	Изменено название конфигурации [${configurationDto.id}]. Новое название - ${configurationDto.configurationName}	RENAME_CONFIGURATION
3	SUCCESS	Удалена конфигурация [${id}]	DELETE_CONFIGURATION
4	SUCCESS	Установлена активная конфигурация [${id}]	SET_ACTIVE_CONFIGURATION
5	SUCCESS	Создана копия конфигурации [${configurationDto.id}]. Идентификатор копии [${returnValue.id}], название конфигурации ${returnValue.configurationName}	COPY_CONFIGURATION
6	SUCCESS	Добавлены новые настройки классификатора в конфигурацию [${configurationId}]. Идентификатор настроек [${returnValue.id}], название настроек [${returnValue.optionsDescription}]	ADD_CLASSIFIER_OPTIONS
7	SUCCESS	Удалены настройки классификатора [${returnValue.id}] из конфигурации [${returnValue.configuration.id}]	DELETE_CLASSIFIER_OPTIONS
8	SUCCESS	Выгружен отчет для конфигурации с настройками классификаторов [${id}]	GENERATE_CONFIGURATION_REPORT
9	SUCCESS	Создана заявка на эксперимент [${experimentType.description}], идентификатор заявки [${returnValue.requestId}]	CREATE_EXPERIMENT_REQUEST
10	SUCCESS	Выгружен отчет [${reportType.description}]	GENERATE_EVALUATION_REQUESTS_REPORT
\.


--
-- TOC entry 2493 (class 0 OID 16410)
-- Dependencies: 187
-- Data for Name: audit_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_group (id, title) FROM stdin;
CLASSIFIERS_CONFIGURATIONS_ACTIONS	Действия с конфигурациями классификаторов
EVALUATION_REQUESTS_ACTIONS	Действия с заявками на построение моделей
\.


--
-- TOC entry 2494 (class 0 OID 16416)
-- Dependencies: 188
-- Data for Name: classifier_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classifier_info (id, classifier_name, classifier_options) FROM stdin;
637	ID3	\N
638	CART	\N
639	C45	\N
640	Logistic	\N
641	KNearestNeighbours	\N
642	RandomForests	\N
643	ID3	\N
644	CART	\N
645	Logistic	\N
646	NeuralNetwork	\N
647	KNearestNeighbours	\N
648	RandomForests	\N
649	HeterogeneousClassifier	\N
650	RandomNetworks	\N
651	Logistic	\N
652	CART	\N
653	Logistic	\N
654	CART	\N
655	KNearestNeighbours	\N
656	RandomForests	\N
657	ExtraTreesClassifier	\N
658	HeterogeneousClassifier	\N
659	HeterogeneousClassifier	\N
660	HeterogeneousClassifier	\N
661	HeterogeneousClassifier	\N
662	HeterogeneousClassifier	\N
663	CART	\N
664	CART	\N
665	CART	\N
666	C45	\N
667	C45	\N
668	CART	\N
669	CART	\N
670	CART	\N
671	CART	\N
672	StackingClassifier	\N
673	Logistic	\N
674	CART	\N
675	HeterogeneousClassifier	\N
676	C45	\N
677	RandomForests	\N
678	HeterogeneousClassifier	\N
679	HeterogeneousClassifier	\N
680	ExtraTreesClassifier	\N
681	ExtraTreesClassifier	\N
682	ExtraTreesClassifier	\N
683	ExtraTreesClassifier	\N
684	ExtraTreesClassifier	\N
685	ExtraTreesClassifier	\N
686	ExtraTreesClassifier	\N
687	RandomForests	\N
688	ExtraTreesClassifier	\N
689	C45	\N
690	ExtraTreesClassifier	\N
691	ExtraTreesClassifier	\N
692	ExtraTreesClassifier	\N
693	ExtraTreesClassifier	\N
694	ExtraTreesClassifier	\N
695	ExtraTreesClassifier	\N
696	Logistic	\N
697	C45	\N
698	KNearestNeighbours	\N
699	HeterogeneousClassifier	\N
700	StackingClassifier	\N
701	ExtraTreesClassifier	\N
702	ID3	\N
703	ID3	\N
704	Logistic	\N
705	Logistic	\N
706	Logistic	\N
707	NeuralNetwork	\N
708	CART	\N
709	HeterogeneousClassifier	\N
710	Logistic	\N
711	C45	\N
712	KNearestNeighbours	\N
713	ExtraTreesClassifier	\N
714	NeuralNetwork	\N
715	NeuralNetwork	\N
716	NeuralNetwork	\N
717	NeuralNetwork	\N
718	ID3	\N
719	ExtraTreesClassifier	\N
720	RandomForests	\N
721	ExtraTreesClassifier	\N
722	ExtraTreesClassifier	\N
723	ExtraTreesClassifier	\N
724	Logistic	\N
725	AdaBoostClassifier	\N
726	Logistic	\N
727	CART	\N
728	ID3	\N
729	RandomForests	\N
730	Logistic	\N
731	RandomForests	\N
732	RandomForests	\N
733	ExtraTreesClassifier	\N
734	ExtraTreesClassifier	\N
735	ExtraTreesClassifier	\N
736	ExtraTreesClassifier	\N
737	ExtraTreesClassifier	\N
738	ExtraTreesClassifier	\N
739	ExtraTreesClassifier	\N
740	ExtraTreesClassifier	\N
741	RandomForests	\N
742	RandomForests	\N
743	RandomForests	\N
744	CHAID	\N
745	RandomForests	\N
746	RandomForests	\N
747	ID3	\N
748	ID3	\N
749	J48	\N
750	Logistic	\N
751	NeuralNetwork	\N
752	ID3	\N
753	CART	\N
754	C45	\N
755	J48	\N
756	Logistic	\N
757	KNearestNeighbours	\N
758	NeuralNetwork	\N
759	CART	\N
760	CART	\N
761	CART	\N
762	J48	\N
763	J48	\N
764	J48	\N
765	CART	\N
766	CHAID	\N
767	NeuralNetwork	\N
768	Logistic	\N
769	CART	\N
770	CHAID	\N
771	NeuralNetwork	\N
772	J48	\N
773	CART	\N
774	C45	\N
775	NeuralNetwork	\N
776	J48	\N
777	ID3	\N
778	ID3	\N
779	CART	\N
780	CART	\N
781	C45	\N
782	J48	\N
783	CART	\N
784	J48	\N
785	ID3	\N
786	Logistic	\N
787	CART	\N
788	NeuralNetwork	\N
789	RandomForests	\N
790	NeuralNetwork	\N
791	RandomForests	\N
792	RandomForests	\N
793	RandomForests	\N
794	RandomForests	\N
795	RandomForests	\N
796	RandomForests	\N
797	RandomForests	\N
798	RandomForests	\N
799	RandomForests	\N
800	RandomForests	\N
801	RandomForests	\N
802	Logistic	\N
803	Logistic	\N
804	Logistic	\N
805	HeterogeneousClassifier	\N
806	HeterogeneousClassifier	\N
807	RandomForests	\N
808	RandomForests	\N
809	RandomForests	\N
810	ID3	\N
811	CART	\N
812	J48	\N
813	NeuralNetwork	\N
814	ExtraTreesClassifier	\N
815	ExtraTreesClassifier	\N
816	ExtraTreesClassifier	\N
817	ExtraTreesClassifier	\N
818	ExtraTreesClassifier	\N
819	ExtraTreesClassifier	\N
820	RandomForests	\N
821	RandomForests	\N
822	RandomForests	\N
823	RandomForests	\N
824	RandomForests	\N
825	RandomForests	\N
826	RandomForests	\N
827	RandomForests	\N
828	RandomNetworks	\N
829	RandomForests	\N
830	RandomNetworks	\N
831	HeterogeneousClassifier	\N
832	HeterogeneousClassifier	\N
833	HeterogeneousClassifier	\N
834	HeterogeneousClassifier	\N
835	StackingClassifier	\N
836	C45	\N
837	C45	\N
838	ExtraTreesClassifier	\N
839	ExtraTreesClassifier	\N
840	ExtraTreesClassifier	\N
841	ExtraTreesClassifier	\N
842	ModifiedHeterogeneousClassifier	\N
843	AdaBoostClassifier	\N
844	Logistic	\N
845	Logistic	\N
846	HeterogeneousClassifier	\N
847	HeterogeneousClassifier	\N
848	Logistic	\N
849	HeterogeneousClassifier	\N
850	CHAID	\N
851	NeuralNetwork	\N
852	NeuralNetwork	\N
853	KNearestNeighbours	\N
854	NeuralNetwork	\N
855	Logistic	\N
856	CART	\N
857	NeuralNetwork	\N
858	CART	\N
859	NeuralNetwork	\N
860	Logistic	\N
861	HeterogeneousClassifier	\N
862	Logistic	\N
863	Logistic	\N
864	StackingClassifier	\N
865	Logistic	\N
866	HeterogeneousClassifier	\N
867	StackingClassifier	\N
868	AdaBoostClassifier	\N
869	ExtraTreesClassifier	\N
870	HeterogeneousClassifier	\N
871	Logistic	\N
872	ID3	\N
873	ID3	\N
874	C45	\N
875	AdaBoostClassifier	\N
876	CART	\N
877	CHAID	\N
878	C45	\N
879	J48	\N
880	J48	\N
881	J48	\N
882	KNearestNeighbours	\N
883	NeuralNetwork	\N
884	RandomForests	\N
885	RandomForests	\N
886	RandomForests	\N
887	RandomForests	\N
888	Logistic	\N
889	HeterogeneousClassifier	\N
890	HeterogeneousClassifier	\N
891	HeterogeneousClassifier	\N
892	HeterogeneousClassifier	\N
893	HeterogeneousClassifier	\N
894	HeterogeneousClassifier	\N
895	Logistic	\N
896	Logistic	\N
897	C45	\N
898	C45	\N
899	NeuralNetwork	\N
900	Logistic	\N
901	NeuralNetwork	\N
902	NeuralNetwork	\N
903	Logistic	\N
904	KNearestNeighbours	\N
905	KNearestNeighbours	\N
906	KNearestNeighbours	\N
907	ID3	\N
908	CART	\N
909	CHAID	\N
910	J48	\N
911	Logistic	\N
912	ID3	\N
913	CART	\N
914	CHAID	\N
915	J48	\N
916	J48	\N
917	J48	\N
918	C45	\N
919	CHAID	\N
920	HeterogeneousClassifier	\N
921	HeterogeneousClassifier	\N
922	RandomForests	\N
923	ExtraTreesClassifier	\N
924	ExtraTreesClassifier	\N
925	ExtraTreesClassifier	\N
926	RandomForests	\N
927	RandomForests	\N
928	ExtraTreesClassifier	\N
929	Logistic	\N
930	ID3	\N
931	C45	\N
932	C45	\N
933	CART	\N
934	CHAID	\N
935	J48	\N
936	J48	\N
937	J48	\N
938	ID3	\N
939	Logistic	\N
940	C45	\N
941	CHAID	\N
942	CHAID	\N
943	J48	\N
944	CART	\N
945	CART	\N
946	Logistic	\N
947	Logistic	\N
948	ID3	\N
949	CART	\N
950	CHAID	\N
951	J48	\N
952	C45	\N
953	CHAID	\N
954	J48	\N
955	J48	\N
956	Logistic	\N
957	ID3	\N
958	C45	\N
959	CART	\N
960	J48	\N
961	ID3	\N
962	CHAID	\N
963	J48	\N
964	J48	\N
965	Logistic	\N
966	CART	\N
967	Logistic	\N
968	Logistic	\N
969	ID3	\N
970	C45	\N
971	CART	\N
972	ExtraTreesClassifier	\N
973	ExtraTreesClassifier	\N
974	ID3	\N
975	C45	\N
976	CART	\N
977	CHAID	\N
978	J48	\N
979	ID3	\N
980	C45	\N
981	CHAID	\N
982	Logistic	\N
983	J48	\N
984	J48	\N
985	J48	\N
986	AdaBoostClassifier	\N
987	AdaBoostClassifier	\N
988	J48	\N
989	J48	\N
990	Logistic	\N
991	CART	\N
992	C45	\N
993	ID3	\N
994	CHAID	\N
995	ExtraTreesClassifier	\N
996	ExtraTreesClassifier	\N
997	ExtraTreesClassifier	\N
998	Logistic	\N
999	ID3	\N
1000	C45	\N
1001	CART	\N
1002	CHAID	\N
1003	J48	\N
1004	J48	\N
1005	NeuralNetwork	\N
1006	NeuralNetwork	\N
1007	NeuralNetwork	\N
1008	ModifiedHeterogeneousClassifier	\N
1009	ModifiedHeterogeneousClassifier	\N
1010	Logistic	\N
1011	ID3	\N
1012	ID3	\N
1013	CART	\N
1014	C45	\N
1015	C45	\N
1016	J48	\N
1017	J48	\N
1018	CHAID	\N
1019	CHAID	\N
1020	J48	\N
1021	J48	\N
1022	RandomForests	\N
1023	RandomForests	\N
1024	RandomForests	\N
1025	ExtraTreesClassifier	\N
1026	ExtraTreesClassifier	\N
1027	ExtraTreesClassifier	\N
1028	ExtraTreesClassifier	\N
1029	ExtraTreesClassifier	\N
1030	ExtraTreesClassifier	\N
1031	RandomNetworks	\N
1032	RandomForests	\N
1033	RandomForests	\N
1034	RandomForests	\N
1035	C45	\N
1036	ExtraTreesClassifier	\N
1037	ModifiedHeterogeneousClassifier	\N
1038	ID3	\N
1039	Logistic	\N
1040	CART	\N
1041	Logistic	\N
1042	ID3	\N
1043	CART	\N
1044	Logistic	\N
1045	Logistic	\N
1046	ID3	\N
1047	C45	\N
1048	CART	\N
1049	J48	\N
1050	CHAID	\N
1051	NeuralNetwork	\N
1052	RandomForests	\N
1053	RandomForests	\N
1054	ID3	\N
1055	ModifiedHeterogeneousClassifier	\N
1056	Logistic	\N
1057	CART	\N
1058	NeuralNetwork	\N
1059	Logistic	\N
1060	C45	\N
1061	CART	\N
1062	CART	\N
1063	CHAID	\N
1064	CART	\N
1065	Logistic	\N
1066	NeuralNetwork	\N
1067	C45	\N
1068	NeuralNetwork	\N
1069	CART	\N
1070	ID3	\N
1071	C45	\N
1072	Logistic	\N
1073	NeuralNetwork	\N
1074	NeuralNetwork	\N
1075	NeuralNetwork	\N
1076	CART	\N
1077	Logistic	\N
1078	NeuralNetwork	\N
1079	KNearestNeighbours	\N
1080	C45	\N
1081	ID3	\N
1082	CHAID	\N
1083	J48	\N
1084	ID3	\N
1085	Logistic	\N
1086	C45	\N
1087	J48	\N
1088	CHAID	\N
1089	C45	\N
1090	HeterogeneousClassifier	\N
1091	ModifiedHeterogeneousClassifier	\N
1092	AdaBoostClassifier	\N
1093	AdaBoostClassifier	\N
1094	AdaBoostClassifier	\N
1095	AdaBoostClassifier	\N
1096	CHAID	\N
1097	Logistic	\N
1098	CHAID	\N
1099	NeuralNetwork	\N
1100	RandomNetworks	\N
1101	HeterogeneousClassifier	\N
1102	NeuralNetwork	\N
1103	NeuralNetwork	\N
1104	C45	\N
1105	HeterogeneousClassifier	\N
1106	CART	\N
1107	CART	\N
1108	HeterogeneousClassifier	\N
1109	CART	\N
1110	CART	\N
1111	ModifiedHeterogeneousClassifier	\N
1112	HeterogeneousClassifier	\N
1113	ExtraTreesClassifier	\N
1114	ExtraTreesClassifier	\N
1115	ExtraTreesClassifier	\N
1116	ExtraTreesClassifier	\N
1117	RandomForests	\N
1118	ExtraTreesClassifier	\N
1119	CART	\N
1120	HeterogeneousClassifier	\N
1121	Logistic	\N
1122	NeuralNetwork	\N
1123	ID3	\N
1124	NeuralNetwork	\N
1125	ExtraTreesClassifier	\N
1126	NeuralNetwork	\N
1127	Logistic	\N
1128	ExtraTreesClassifier	\N
1129	HeterogeneousClassifier	\N
1130	J48	\N
1131	RandomForests	\N
1132	RandomForests	\N
1133	ExtraTreesClassifier	\N
1134	Logistic	\N
1135	RandomForests	\N
1136	RandomForests	\N
1137	ExtraTreesClassifier	\N
1138	C45	\N
1139	J48	\N
1140	NeuralNetwork	\N
1141	ID3	\N
1142	J48	\N
1143	NeuralNetwork	\N
1144	J48	\N
1145	Logistic	\N
1146	J48	\N
1147	Logistic	\N
1148	CHAID	\N
1149	Logistic	\N
1150	J48	\N
1151	J48	\N
1152	C45	\N
1153	C45	\N
1154	J48	\N
1155	NeuralNetwork	\N
1156	RandomForests	\N
1157	RandomForests	\N
1158	RandomForests	\N
1159	RandomForests	\N
1160	Logistic	\N
1161	Logistic	\N
1162	RandomForests	\N
1163	Logistic	\N
1164	ExtraTreesClassifier	\N
1165	ExtraTreesClassifier	\N
1166	RandomNetworks	\N
1167	RandomForests	\N
1168	RandomForests	\N
1169	RandomForests	\N
1170	RandomForests	\N
1171	RandomForests	\N
1172	HeterogeneousClassifier	\N
1173	HeterogeneousClassifier	\N
1174	ExtraTreesClassifier	\N
1175	ExtraTreesClassifier	\N
1176	Logistic	\N
1177	NeuralNetwork	\N
1178	NeuralNetwork	\N
1179	KNearestNeighbours	\N
1180	Logistic	\N
1181	NeuralNetwork	\N
1182	CART	\N
1183	KNearestNeighbours	\N
1184	Logistic	\N
1185	StackingClassifier	\N
1186	ExtraTreesClassifier	\N
1187	C45	\N
1188	CART	\N
1189	CHAID	\N
1190	J48	\N
1191	J48	\N
1192	ExtraTreesClassifier	\N
1193	Logistic	\N
1194	HeterogeneousClassifier	\N
1195	HeterogeneousClassifier	\N
1196	Logistic	\N
1197	NeuralNetwork	\N
1198	NeuralNetwork	\N
1199	KNearestNeighbours	\N
1200	C45	\N
1201	J48	\N
1202	C45	\N
1203	J48	\N
1204	ID3	\N
1205	ExtraTreesClassifier	\N
1206	RandomForests	\N
1207	RandomForests	\N
1208	RandomForests	\N
1209	ExtraTreesClassifier	\N
1210	RandomForests	\N
1211	ID3	\N
1212	CHAID	\N
1213	J48	\N
1214	ID3	\N
1215	CART	\N
1216	J48	\N
1217	NeuralNetwork	\N
1218	C45	\N
1219	ID3	\N
1220	J48	\N
1221	Logistic	\N
1222	CHAID	\N
1223	C45	\N
1224	J48	\N
1225	CART	\N
1226	ID3	\N
1227	CHAID	\N
1228	AdaBoostClassifier	\N
1229	AdaBoostClassifier	\N
1230	Logistic	\N
1231	AdaBoostClassifier	\N
1232	AdaBoostClassifier	\N
1233	RandomForests	\N
1234	ExtraTreesClassifier	\N
1235	ExtraTreesClassifier	\N
1236	ExtraTreesClassifier	\N
1237	AdaBoostClassifier	\N
1238	AdaBoostClassifier	\N
1239	ExtraTreesClassifier	\N
1240	ExtraTreesClassifier	\N
1241	ExtraTreesClassifier	\N
1242	ExtraTreesClassifier	\N
1243	ExtraTreesClassifier	\N
1244	ExtraTreesClassifier	\N
1245	ExtraTreesClassifier	\N
1246	ExtraTreesClassifier	\N
1247	ExtraTreesClassifier	\N
1248	ExtraTreesClassifier	\N
1249	ExtraTreesClassifier	\N
1250	ExtraTreesClassifier	\N
1251	ExtraTreesClassifier	\N
1252	AdaBoostClassifier	\N
1253	AdaBoostClassifier	\N
1254	AdaBoostClassifier	\N
1255	AdaBoostClassifier	\N
1256	AdaBoostClassifier	\N
1257	AdaBoostClassifier	\N
1258	AdaBoostClassifier	\N
1259	AdaBoostClassifier	\N
1260	AdaBoostClassifier	\N
1261	AdaBoostClassifier	\N
1262	AdaBoostClassifier	\N
1263	AdaBoostClassifier	\N
1264	AdaBoostClassifier	\N
1265	AdaBoostClassifier	\N
1266	AdaBoostClassifier	\N
1267	AdaBoostClassifier	\N
1268	AdaBoostClassifier	\N
1269	AdaBoostClassifier	\N
1270	AdaBoostClassifier	\N
1271	AdaBoostClassifier	\N
1272	AdaBoostClassifier	\N
7309	KNearestNeighbours	\N
7314	KNearestNeighbours	\N
7319	KNearestNeighbours	\N
7324	KNearestNeighbours	\N
7329	KNearestNeighbours	\N
7334	ExtraTreesClassifier	\N
7345	ExtraTreesClassifier	\N
7356	ExtraTreesClassifier	\N
7367	RandomForests	\N
7376	RandomForests	\N
7385	StackingClassifier	\N
7391	StackingClassifier	\N
7397	StackingClassifier	\N
7403	StackingClassifier	\N
7409	StackingClassifier	\N
7415	AdaBoostClassifier	\N
7423	AdaBoostClassifier	\N
7432	AdaBoostClassifier	\N
7440	AdaBoostClassifier	\N
7449	AdaBoostClassifier	\N
7457	ExtraTreesClassifier	\N
7468	ExtraTreesClassifier	\N
7479	ExtraTreesClassifier	\N
7490	ExtraTreesClassifier	\N
7501	ExtraTreesClassifier	\N
7512	HeterogeneousClassifier	\N
7525	HeterogeneousClassifier	\N
7537	HeterogeneousClassifier	\N
7549	HeterogeneousClassifier	\N
7561	HeterogeneousClassifier	\N
7574	StackingClassifier	\N
7581	StackingClassifier	\N
7588	StackingClassifier	\N
7596	StackingClassifier	\N
7603	StackingClassifier	\N
7611	ModifiedHeterogeneousClassifier	\N
7623	ModifiedHeterogeneousClassifier	\N
7636	ModifiedHeterogeneousClassifier	\N
7648	ModifiedHeterogeneousClassifier	\N
7660	ModifiedHeterogeneousClassifier	\N
7673	NeuralNetwork	\N
7689	NeuralNetwork	\N
7705	NeuralNetwork	\N
7721	NeuralNetwork	\N
7737	NeuralNetwork	\N
7753	NeuralNetwork	\N
7769	NeuralNetwork	\N
7785	NeuralNetwork	\N
7801	NeuralNetwork	\N
7817	NeuralNetwork	\N
7833	HeterogeneousClassifier	\N
7846	HeterogeneousClassifier	\N
7859	HeterogeneousClassifier	\N
7872	HeterogeneousClassifier	\N
7883	HeterogeneousClassifier	\N
7894	ModifiedHeterogeneousClassifier	\N
7908	ModifiedHeterogeneousClassifier	\N
7919	ModifiedHeterogeneousClassifier	\N
7930	ModifiedHeterogeneousClassifier	\N
7943	ModifiedHeterogeneousClassifier	\N
7956	AdaBoostClassifier	\N
7964	AdaBoostClassifier	\N
7973	AdaBoostClassifier	\N
7982	AdaBoostClassifier	\N
7992	AdaBoostClassifier	\N
8000	StackingClassifier	\N
8006	StackingClassifier	\N
8012	StackingClassifier	\N
8018	StackingClassifier	\N
8024	StackingClassifier	\N
8031	RandomForests	\N
8040	RandomForests	\N
8049	RandomForests	\N
8058	RandomForests	\N
8067	RandomForests	\N
8076	ExtraTreesClassifier	\N
8087	ExtraTreesClassifier	\N
8098	ExtraTreesClassifier	\N
8109	ExtraTreesClassifier	\N
8120	RandomForests	\N
8129	ExtraTreesClassifier	\N
8140	RandomForests	\N
8149	ExtraTreesClassifier	\N
8160	ExtraTreesClassifier	\N
8171	ExtraTreesClassifier	\N
8182	KNearestNeighbours	\N
8187	KNearestNeighbours	\N
8192	KNearestNeighbours	\N
8197	KNearestNeighbours	\N
8202	KNearestNeighbours	\N
8207	ExtraTreesClassifier	\N
8218	ExtraTreesClassifier	\N
8229	ExtraTreesClassifier	\N
8240	ExtraTreesClassifier	\N
8251	ExtraTreesClassifier	\N
8262	HeterogeneousClassifier	\N
8273	HeterogeneousClassifier	\N
8284	HeterogeneousClassifier	\N
8295	HeterogeneousClassifier	\N
8306	HeterogeneousClassifier	\N
8318	AdaBoostClassifier	\N
8325	AdaBoostClassifier	\N
8333	AdaBoostClassifier	\N
8340	AdaBoostClassifier	\N
8348	AdaBoostClassifier	\N
8356	StackingClassifier	\N
8362	StackingClassifier	\N
8368	StackingClassifier	\N
8375	StackingClassifier	\N
8382	StackingClassifier	\N
8389	ExtraTreesClassifier	\N
8400	ExtraTreesClassifier	\N
8411	ExtraTreesClassifier	\N
8422	ExtraTreesClassifier	\N
8433	ExtraTreesClassifier	\N
8444	ModifiedHeterogeneousClassifier	\N
8457	ModifiedHeterogeneousClassifier	\N
8470	ModifiedHeterogeneousClassifier	\N
8481	ModifiedHeterogeneousClassifier	\N
8492	ModifiedHeterogeneousClassifier	\N
8503	NeuralNetwork	\N
8519	NeuralNetwork	\N
8535	NeuralNetwork	\N
8551	NeuralNetwork	\N
8567	NeuralNetwork	\N
8583	ExtraTreesClassifier	\N
8594	ExtraTreesClassifier	\N
8605	ExtraTreesClassifier	\N
8616	ExtraTreesClassifier	\N
8627	ExtraTreesClassifier	\N
8638	ExtraTreesClassifier	\N
8649	ExtraTreesClassifier	\N
8660	ExtraTreesClassifier	\N
8671	ExtraTreesClassifier	\N
8682	ExtraTreesClassifier	\N
8693	KNearestNeighbours	\N
8698	KNearestNeighbours	\N
8703	KNearestNeighbours	\N
8708	KNearestNeighbours	\N
8713	KNearestNeighbours	\N
8718	HeterogeneousClassifier	\N
8730	HeterogeneousClassifier	\N
8743	HeterogeneousClassifier	\N
8755	HeterogeneousClassifier	\N
8768	HeterogeneousClassifier	\N
8781	AdaBoostClassifier	\N
8788	AdaBoostClassifier	\N
8795	AdaBoostClassifier	\N
8803	AdaBoostClassifier	\N
8811	AdaBoostClassifier	\N
8818	ModifiedHeterogeneousClassifier	\N
8830	ModifiedHeterogeneousClassifier	\N
8842	ModifiedHeterogeneousClassifier	\N
8853	ModifiedHeterogeneousClassifier	\N
8864	ModifiedHeterogeneousClassifier	\N
8877	AdaBoostClassifier	\N
8884	AdaBoostClassifier	\N
8892	AdaBoostClassifier	\N
8901	AdaBoostClassifier	\N
8908	AdaBoostClassifier	\N
8917	CART	\N
8925	CART	\N
8933	CART	\N
8941	CART	\N
8949	CART	\N
8957	ExtraTreesClassifier	\N
8968	RandomForests	\N
8977	ExtraTreesClassifier	\N
8988	RandomForests	\N
8997	ExtraTreesClassifier	\N
9008	ExtraTreesClassifier	\N
9019	ExtraTreesClassifier	\N
9030	ExtraTreesClassifier	\N
9041	RandomForests	\N
9050	ExtraTreesClassifier	\N
9061	RandomForests	\N
9070	ExtraTreesClassifier	\N
9081	RandomForests	\N
9090	ExtraTreesClassifier	\N
9101	ExtraTreesClassifier	\N
9112	HeterogeneousClassifier	\N
9126	HeterogeneousClassifier	\N
9138	HeterogeneousClassifier	\N
9150	HeterogeneousClassifier	\N
9162	HeterogeneousClassifier	\N
9174	StackingClassifier	\N
9180	StackingClassifier	\N
9186	StackingClassifier	\N
9192	StackingClassifier	\N
9198	StackingClassifier	\N
9205	ModifiedHeterogeneousClassifier	\N
9217	ModifiedHeterogeneousClassifier	\N
9230	ModifiedHeterogeneousClassifier	\N
9242	ModifiedHeterogeneousClassifier	\N
9254	ModifiedHeterogeneousClassifier	\N
9266	ModifiedHeterogeneousClassifier	\N
9279	ModifiedHeterogeneousClassifier	\N
9292	ModifiedHeterogeneousClassifier	\N
9303	ModifiedHeterogeneousClassifier	\N
9314	ModifiedHeterogeneousClassifier	\N
9325	NeuralNetwork	\N
9341	NeuralNetwork	\N
9357	NeuralNetwork	\N
9373	NeuralNetwork	\N
9389	NeuralNetwork	\N
9405	ExtraTreesClassifier	\N
9416	ExtraTreesClassifier	\N
9427	RandomForests	\N
9436	ExtraTreesClassifier	\N
9447	ExtraTreesClassifier	\N
9458	ModifiedHeterogeneousClassifier	\N
9470	ModifiedHeterogeneousClassifier	\N
9482	ModifiedHeterogeneousClassifier	\N
9493	ModifiedHeterogeneousClassifier	\N
9504	ModifiedHeterogeneousClassifier	\N
9516	NeuralNetwork	\N
9532	NeuralNetwork	\N
9548	NeuralNetwork	\N
9564	NeuralNetwork	\N
9580	NeuralNetwork	\N
9596	StackingClassifier	\N
9603	StackingClassifier	\N
9609	StackingClassifier	\N
9615	StackingClassifier	\N
9621	StackingClassifier	\N
9627	KNearestNeighbours	\N
9632	KNearestNeighbours	\N
9637	KNearestNeighbours	\N
9642	KNearestNeighbours	\N
9647	KNearestNeighbours	\N
9652	StackingClassifier	\N
9658	StackingClassifier	\N
9664	StackingClassifier	\N
9670	StackingClassifier	\N
9676	StackingClassifier	\N
9685	AdaBoostClassifier	\N
9692	AdaBoostClassifier	\N
9700	AdaBoostClassifier	\N
9708	AdaBoostClassifier	\N
9717	AdaBoostClassifier	\N
9726	HeterogeneousClassifier	\N
9739	HeterogeneousClassifier	\N
9752	HeterogeneousClassifier	\N
9765	HeterogeneousClassifier	\N
9778	HeterogeneousClassifier	\N
9790	RandomForests	\N
9799	ExtraTreesClassifier	\N
9810	ExtraTreesClassifier	\N
9821	RandomForests	\N
9830	ExtraTreesClassifier	\N
9841	ID3	\N
9849	C45	\N
9857	C45	\N
9865	ID3	\N
9873	ID3	\N
9881	KNearestNeighbours	\N
9886	KNearestNeighbours	\N
9891	KNearestNeighbours	\N
9896	KNearestNeighbours	\N
9901	KNearestNeighbours	\N
9906	RandomForests	\N
9915	ExtraTreesClassifier	\N
9926	RandomForests	\N
9935	RandomForests	\N
9944	ExtraTreesClassifier	\N
9955	KNearestNeighbours	\N
9960	KNearestNeighbours	\N
9965	KNearestNeighbours	\N
9970	KNearestNeighbours	\N
9975	KNearestNeighbours	\N
9980	AdaBoostClassifier	\N
9988	AdaBoostClassifier	\N
9997	AdaBoostClassifier	\N
10006	AdaBoostClassifier	\N
10016	AdaBoostClassifier	\N
10024	HeterogeneousClassifier	\N
10036	HeterogeneousClassifier	\N
10048	HeterogeneousClassifier	\N
10060	HeterogeneousClassifier	\N
10073	HeterogeneousClassifier	\N
10086	ExtraTreesClassifier	\N
10097	ExtraTreesClassifier	\N
10108	RandomForests	\N
10117	RandomForests	\N
10126	RandomForests	\N
10135	ExtraTreesClassifier	\N
10146	ExtraTreesClassifier	\N
10157	ExtraTreesClassifier	\N
10168	RandomForests	\N
10177	RandomForests	\N
10186	ExtraTreesClassifier	\N
10197	ExtraTreesClassifier	\N
10208	RandomForests	\N
10217	ExtraTreesClassifier	\N
10228	ExtraTreesClassifier	\N
10239	AdaBoostClassifier	\N
10247	AdaBoostClassifier	\N
10255	AdaBoostClassifier	\N
10263	AdaBoostClassifier	\N
10272	AdaBoostClassifier	\N
10281	ModifiedHeterogeneousClassifier	\N
10293	ModifiedHeterogeneousClassifier	\N
10305	ModifiedHeterogeneousClassifier	\N
10317	ModifiedHeterogeneousClassifier	\N
10330	ModifiedHeterogeneousClassifier	\N
10343	HeterogeneousClassifier	\N
10357	HeterogeneousClassifier	\N
10369	HeterogeneousClassifier	\N
10381	HeterogeneousClassifier	\N
10393	HeterogeneousClassifier	\N
10405	HeterogeneousClassifier	\N
10416	HeterogeneousClassifier	\N
10427	HeterogeneousClassifier	\N
10438	HeterogeneousClassifier	\N
10449	HeterogeneousClassifier	\N
10461	StackingClassifier	\N
10467	StackingClassifier	\N
10473	StackingClassifier	\N
10479	StackingClassifier	\N
10485	StackingClassifier	\N
10492	ModifiedHeterogeneousClassifier	\N
10506	ModifiedHeterogeneousClassifier	\N
10517	ModifiedHeterogeneousClassifier	\N
10528	ModifiedHeterogeneousClassifier	\N
10541	ModifiedHeterogeneousClassifier	\N
10554	AdaBoostClassifier	\N
10561	AdaBoostClassifier	\N
10568	AdaBoostClassifier	\N
10576	AdaBoostClassifier	\N
10584	AdaBoostClassifier	\N
10592	StackingClassifier	\N
10598	StackingClassifier	\N
10604	StackingClassifier	\N
10611	StackingClassifier	\N
10618	StackingClassifier	\N
10625	RandomForests	\N
10634	RandomForests	\N
10643	RandomForests	\N
10652	RandomForests	\N
10661	RandomForests	\N
10670	HeterogeneousClassifier	\N
10683	HeterogeneousClassifier	\N
10696	HeterogeneousClassifier	\N
10709	HeterogeneousClassifier	\N
10720	HeterogeneousClassifier	\N
10731	ExtraTreesClassifier	\N
10742	RandomForests	\N
10751	RandomForests	\N
10760	ExtraTreesClassifier	\N
10771	RandomForests	\N
10780	ExtraTreesClassifier	\N
10791	ExtraTreesClassifier	\N
10802	RandomForests	\N
10811	RandomForests	\N
10820	ExtraTreesClassifier	\N
10831	RandomForests	\N
10840	ExtraTreesClassifier	\N
10851	RandomForests	\N
10860	RandomForests	\N
10869	RandomForests	\N
10878	ModifiedHeterogeneousClassifier	\N
10891	ModifiedHeterogeneousClassifier	\N
10904	ModifiedHeterogeneousClassifier	\N
10915	ModifiedHeterogeneousClassifier	\N
10926	ModifiedHeterogeneousClassifier	\N
10937	AdaBoostClassifier	\N
10945	AdaBoostClassifier	\N
10954	AdaBoostClassifier	\N
10963	AdaBoostClassifier	\N
10973	AdaBoostClassifier	\N
10981	ModifiedHeterogeneousClassifier	\N
10993	ModifiedHeterogeneousClassifier	\N
11006	ModifiedHeterogeneousClassifier	\N
11018	ModifiedHeterogeneousClassifier	\N
11030	ModifiedHeterogeneousClassifier	\N
11042	StackingClassifier	\N
11048	StackingClassifier	\N
11054	StackingClassifier	\N
11060	StackingClassifier	\N
11066	StackingClassifier	\N
11073	AdaBoostClassifier	\N
11080	AdaBoostClassifier	\N
11088	AdaBoostClassifier	\N
11096	AdaBoostClassifier	\N
11105	AdaBoostClassifier	\N
11114	StackingClassifier	\N
11120	StackingClassifier	\N
11126	StackingClassifier	\N
11132	StackingClassifier	\N
11138	StackingClassifier	\N
11147	ID3	\N
11155	ID3	\N
11163	C45	\N
11171	CART	\N
11179	CART	\N
11187	NeuralNetwork	\N
11203	NeuralNetwork	\N
11219	NeuralNetwork	\N
11235	NeuralNetwork	\N
11251	NeuralNetwork	\N
11267	CART	\N
11275	C45	\N
11283	CART	\N
11291	CART	\N
11299	CART	\N
11307	NeuralNetwork	\N
11323	NeuralNetwork	\N
11339	NeuralNetwork	\N
11355	NeuralNetwork	\N
11371	NeuralNetwork	\N
11387	KNearestNeighbours	\N
11392	KNearestNeighbours	\N
11397	KNearestNeighbours	\N
11402	KNearestNeighbours	\N
11407	KNearestNeighbours	\N
11412	KNearestNeighbours	\N
11417	KNearestNeighbours	\N
11422	KNearestNeighbours	\N
11427	KNearestNeighbours	\N
11432	KNearestNeighbours	\N
11437	C45	\N
11445	C45	\N
11453	C45	\N
11461	ID3	\N
11469	C45	\N
11477	KNearestNeighbours	\N
11482	KNearestNeighbours	\N
11487	KNearestNeighbours	\N
11492	KNearestNeighbours	\N
11497	KNearestNeighbours	\N
11502	KNearestNeighbours	\N
11507	KNearestNeighbours	\N
11512	KNearestNeighbours	\N
11517	KNearestNeighbours	\N
11522	KNearestNeighbours	\N
11527	RandomForests	\N
11536	ExtraTreesClassifier	\N
11547	ExtraTreesClassifier	\N
11558	RandomForests	\N
11567	RandomForests	\N
\.


--
-- TOC entry 2496 (class 0 OID 16421)
-- Dependencies: 190
-- Data for Name: classifier_input_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classifier_input_options (id, option_name, option_value, option_order, classifier_info_id) FROM stdin;
7310	Число ближайших соседей:	176	0	7309
7311	Вес ближайшего соседа:	0,6427	1	7309
7312	Функция расстояния:	Манхеттенское расстояние	2	7309
7315	Число ближайших соседей:	81	0	7314
7316	Вес ближайшего соседа:	0,6351	1	7314
7317	Функция расстояния:	Манхеттенское расстояние	2	7314
7320	Число ближайших соседей:	174	0	7319
7321	Вес ближайшего соседа:	0,6266	1	7319
7322	Функция расстояния:	Манхеттенское расстояние	2	7319
7325	Число ближайших соседей:	66	0	7324
7326	Вес ближайшего соседа:	0,6913	1	7324
7327	Функция расстояния:	Манхеттенское расстояние	2	7324
7330	Число ближайших соседей:	192	0	7329
7331	Вес ближайшего соседа:	0,7356	1	7329
7332	Функция расстояния:	Манхеттенское расстояние	2	7329
7335	Число деревьев:	75	0	7334
7336	Минимальное число объектов в листе:	2	1	7334
7337	Максиальная глубина дерева:	0	2	7334
7338	Число случайных атрибутов:	3	3	7334
7339	Алгоритм построения дерева решений:	C45	4	7334
7340	Число потоков	4	5	7334
7341	Начальное значение (Seed)	1	6	7334
7342	Число случайных расщеплений атрибута:	17	7	7334
7343	Формирование обучающих выборок:	Исходное обучающее множество	8	7334
7346	Число деревьев:	25	0	7345
7347	Минимальное число объектов в листе:	2	1	7345
7348	Максиальная глубина дерева:	0	2	7345
7349	Число случайных атрибутов:	2	3	7345
7350	Алгоритм построения дерева решений:	ID3	4	7345
7351	Число потоков	4	5	7345
7352	Начальное значение (Seed)	1	6	7345
7353	Число случайных расщеплений атрибута:	15	7	7345
7354	Формирование обучающих выборок:	Исходное обучающее множество	8	7345
7357	Число деревьев:	75	0	7356
7358	Минимальное число объектов в листе:	2	1	7356
7359	Максиальная глубина дерева:	0	2	7356
7360	Число случайных атрибутов:	5	3	7356
7361	Алгоритм построения дерева решений:	ID3	4	7356
7362	Число потоков	4	5	7356
7363	Начальное значение (Seed)	1	6	7356
7364	Число случайных расщеплений атрибута:	5	7	7356
7365	Формирование обучающих выборок:	Исходное обучающее множество	8	7356
7368	Число деревьев:	50	0	7367
7369	Минимальное число объектов в листе:	2	1	7367
7370	Максиальная глубина дерева:	0	2	7367
7371	Число случайных атрибутов:	3	3	7367
7372	Алгоритм построения дерева решений:	CART	4	7367
7373	Число потоков	4	5	7367
7374	Начальное значение (Seed)	1	6	7367
7377	Число деревьев:	50	0	7376
7378	Минимальное число объектов в листе:	2	1	7376
7379	Максиальная глубина дерева:	0	2	7376
7380	Число случайных атрибутов:	4	3	7376
7381	Алгоритм построения дерева решений:	CART	4	7376
7382	Число потоков	4	5	7376
7383	Начальное значение (Seed)	1	6	7376
7386	Мета-классификатор:	CART	0	7385
7387	Метод формирования мета-признаков:	Использование обучающего множества	1	7385
7388	Начальное значение (Seed)	1	2	7385
7389	Базовый классификатор 0:	CART	3	7385
3329	Максиальная глубина дерева:	0	1	637
7392	Мета-классификатор:	C45	0	7391
7393	Метод формирования мета-признаков:	Использование обучающего множества	1	7391
3330	Случайное дерево:	false	2	637
3331	Бинарное дерево:	false	3	637
3332	Использование случайных расщеплений атрибута:	false	4	637
4874	Минимальное число объектов в листе:	2	0	639
7394	Начальное значение (Seed)	1	2	7391
7395	Базовый классификатор 0:	CART	3	7391
7398	Мета-классификатор:	ID3	0	7397
7399	Метод формирования мета-признаков:	Использование обучающего множества	1	7397
7400	Начальное значение (Seed)	1	2	7397
7401	Базовый классификатор 0:	CART	3	7397
7404	Мета-классификатор:	C45	0	7403
7405	Метод формирования мета-признаков:	Использование обучающего множества	1	7403
7406	Начальное значение (Seed)	1	2	7403
7407	Базовый классификатор 0:	CART	3	7403
7410	Мета-классификатор:	CART	0	7409
7411	Метод формирования мета-признаков:	Использование обучающего множества	1	7409
7412	Начальное значение (Seed)	1	2	7409
7413	Базовый классификатор 0:	C45	3	7409
7416	Число итераций:	25	0	7415
7417	Минимальная допустимая ошибка классификатора:	0	1	7415
7418	Максимальная допустимая ошибка классификатора:	0,5	2	7415
7419	Начальное значение (Seed)	1	3	7415
7420	Базовый классификатор 0:	CART	4	7415
7421	Базовый классификатор 1:	C45	5	7415
7424	Число итераций:	25	0	7423
7425	Минимальная допустимая ошибка классификатора:	0	1	7423
7426	Максимальная допустимая ошибка классификатора:	0,5	2	7423
7427	Начальное значение (Seed)	1	3	7423
7428	Базовый классификатор 0:	CART	4	7423
7429	Базовый классификатор 1:	C45	5	7423
7430	Базовый классификатор 2:	ID3	6	7423
7433	Число итераций:	25	0	7432
7434	Минимальная допустимая ошибка классификатора:	0	1	7432
7435	Максимальная допустимая ошибка классификатора:	0,5	2	7432
7436	Начальное значение (Seed)	1	3	7432
7437	Базовый классификатор 0:	CART	4	7432
7438	Базовый классификатор 1:	C45	5	7432
7441	Число итераций:	25	0	7440
7442	Минимальная допустимая ошибка классификатора:	0	1	7440
7443	Максимальная допустимая ошибка классификатора:	0,5	2	7440
7444	Начальное значение (Seed)	1	3	7440
7445	Базовый классификатор 0:	CART	4	7440
7446	Базовый классификатор 1:	C45	5	7440
7447	Базовый классификатор 2:	C45	6	7440
7450	Число итераций:	25	0	7449
7451	Минимальная допустимая ошибка классификатора:	0	1	7449
7452	Максимальная допустимая ошибка классификатора:	0,5	2	7449
7453	Начальное значение (Seed)	1	3	7449
7454	Базовый классификатор 0:	CART	4	7449
7455	Базовый классификатор 1:	ID3	5	7449
7458	Число деревьев:	100	0	7457
7459	Минимальное число объектов в листе:	2	1	7457
7460	Максиальная глубина дерева:	0	2	7457
7461	Число случайных атрибутов:	4	3	7457
7462	Алгоритм построения дерева решений:	C45	4	7457
7463	Число потоков	4	5	7457
7464	Начальное значение (Seed)	1	6	7457
7465	Число случайных расщеплений атрибута:	9	7	7457
7466	Формирование обучающих выборок:	Бутстрэп-выборки	8	7457
7469	Число деревьев:	25	0	7468
7470	Минимальное число объектов в листе:	2	1	7468
7471	Максиальная глубина дерева:	0	2	7468
7472	Число случайных атрибутов:	6	3	7468
7473	Алгоритм построения дерева решений:	C45	4	7468
7474	Число потоков	4	5	7468
7475	Начальное значение (Seed)	1	6	7468
11478	Число ближайших соседей:	1	0	11477
11479	Вес ближайшего соседа:	0,9016	1	11477
3328	Минимальное число объектов в листе:	2	0	637
7476	Число случайных расщеплений атрибута:	9	7	7468
7477	Формирование обучающих выборок:	Исходное обучающее множество	8	7468
7480	Число деревьев:	10	0	7479
7481	Минимальное число объектов в листе:	2	1	7479
7482	Максиальная глубина дерева:	0	2	7479
7483	Число случайных атрибутов:	3	3	7479
7484	Алгоритм построения дерева решений:	C45	4	7479
7485	Число потоков	4	5	7479
7486	Начальное значение (Seed)	1	6	7479
7487	Число случайных расщеплений атрибута:	3	7	7479
7488	Формирование обучающих выборок:	Исходное обучающее множество	8	7479
7491	Число деревьев:	100	0	7490
7492	Минимальное число объектов в листе:	2	1	7490
7493	Максиальная глубина дерева:	0	2	7490
7494	Число случайных атрибутов:	9	3	7490
7495	Алгоритм построения дерева решений:	C45	4	7490
7496	Число потоков	4	5	7490
7497	Начальное значение (Seed)	1	6	7490
7498	Число случайных расщеплений атрибута:	3	7	7490
7499	Формирование обучающих выборок:	Исходное обучающее множество	8	7490
7502	Число деревьев:	50	0	7501
7503	Минимальное число объектов в листе:	2	1	7501
7504	Максиальная глубина дерева:	0	2	7501
7505	Число случайных атрибутов:	4	3	7501
7506	Алгоритм построения дерева решений:	CART	4	7501
7507	Число потоков	4	5	7501
7508	Начальное значение (Seed)	1	6	7501
7509	Число случайных расщеплений атрибута:	23	7	7501
7510	Формирование обучающих выборок:	Исходное обучающее множество	8	7501
7513	Число итераций:	25	0	7512
7514	Минимальная допустимая ошибка классификатора:	0	1	7512
7515	Максимальная допустимая ошибка классификатора:	0,5	2	7512
7516	Метод голосования:	Метод взвешенного голосования	3	7512
7517	Формирование обучающих выборок:	Бутстрэп выборки	4	7512
7518	Выбор классификатора:	Оптимальный классификатор	5	7512
4875	Максиальная глубина дерева:	0	1	639
4876	Случайное дерево:	false	2	639
4877	Бинарное дерево:	false	3	639
4878	Использование случайных расщеплений атрибута:	false	4	639
3342	Максимальное число итераций:	500	0	640
3343	Метод поиска минимума:	Квазиньютоновский метод	1	640
3370	Допустимая ошибка:	0,00001	5	715
7519	Число потоков	4	6	7512
7520	Начальное значение (Seed)	1	7	7512
7521	Базовый классификатор 0:	CART	8	7512
7522	Базовый классификатор 1:	C45	9	7512
7523	Базовый классификатор 2:	C45	10	7512
7526	Число итераций:	25	0	7525
7527	Минимальная допустимая ошибка классификатора:	0	1	7525
7528	Максимальная допустимая ошибка классификатора:	0,5	2	7525
7529	Метод голосования:	Метод взвешенного голосования	3	7525
7530	Формирование обучающих выборок:	Бутстрэп выборки	4	7525
7531	Выбор классификатора:	Оптимальный классификатор	5	7525
7532	Число потоков	4	6	7525
7533	Начальное значение (Seed)	1	7	7525
7534	Базовый классификатор 0:	CART	8	7525
7535	Базовый классификатор 1:	C45	9	7525
7538	Число итераций:	25	0	7537
7539	Минимальная допустимая ошибка классификатора:	0	1	7537
7540	Максимальная допустимая ошибка классификатора:	0,5	2	7537
7541	Метод голосования:	Метод взвешенного голосования	3	7537
7542	Формирование обучающих выборок:	Бутстрэп выборки	4	7537
7543	Выбор классификатора:	Оптимальный классификатор	5	7537
7544	Число потоков	4	6	7537
7545	Начальное значение (Seed)	1	7	7537
7546	Базовый классификатор 0:	CART	8	7537
7547	Базовый классификатор 1:	C45	9	7537
7550	Число итераций:	25	0	7549
7551	Минимальная допустимая ошибка классификатора:	0	1	7549
7552	Максимальная допустимая ошибка классификатора:	0,5	2	7549
7553	Метод голосования:	Метод взвешенного голосования	3	7549
7554	Формирование обучающих выборок:	Бутстрэп выборки	4	7549
7555	Выбор классификатора:	Оптимальный классификатор	5	7549
7556	Число потоков	4	6	7549
7557	Начальное значение (Seed)	1	7	7549
7558	Базовый классификатор 0:	CART	8	7549
7559	Базовый классификатор 1:	ID3	9	7549
7562	Число итераций:	25	0	7561
7563	Минимальная допустимая ошибка классификатора:	0	1	7561
7564	Максимальная допустимая ошибка классификатора:	0,5	2	7561
7565	Метод голосования:	Метод взвешенного голосования	3	7561
7566	Формирование обучающих выборок:	Бутстрэп выборки	4	7561
7567	Выбор классификатора:	Оптимальный классификатор	5	7561
7568	Число потоков	4	6	7561
7569	Начальное значение (Seed)	1	7	7561
7570	Базовый классификатор 0:	CART	8	7561
7571	Базовый классификатор 1:	C45	9	7561
7572	Базовый классификатор 2:	ID3	10	7561
7575	Мета-классификатор:	CART	0	7574
7576	Метод формирования мета-признаков:	10 - блочная кросс-проверка	1	7574
7577	Начальное значение (Seed)	1	2	7574
7578	Базовый классификатор 0:	CART	3	7574
7579	Базовый классификатор 1:	C45	4	7574
7582	Мета-классификатор:	CART	0	7581
7583	Метод формирования мета-признаков:	10 - блочная кросс-проверка	1	7581
7584	Начальное значение (Seed)	1	2	7581
7585	Базовый классификатор 0:	CART	3	7581
7586	Базовый классификатор 1:	ID3	4	7581
4516	Максиальная глубина дерева:	0	2	642
4517	Число случайных атрибутов:	4	3	642
3532	Случайное дерево:	false	2	644
3533	Бинарное дерево:	true	3	644
7589	Мета-классификатор:	CART	0	7588
7590	Метод формирования мета-признаков:	10 - блочная кросс-проверка	1	7588
7591	Начальное значение (Seed)	1	2	7588
3534	Использование случайных расщеплений атрибута:	false	4	644
7592	Базовый классификатор 0:	CART	3	7588
7593	Базовый классификатор 1:	C45	4	7588
7594	Базовый классификатор 2:	C45	5	7588
7597	Мета-классификатор:	CART	0	7596
7598	Метод формирования мета-признаков:	10 - блочная кросс-проверка	1	7596
7599	Начальное значение (Seed)	1	2	7596
7600	Базовый классификатор 0:	CART	3	7596
7601	Базовый классификатор 1:	C45	4	7596
7604	Мета-классификатор:	CART	0	7603
7605	Метод формирования мета-признаков:	10 - блочная кросс-проверка	1	7603
7606	Начальное значение (Seed)	1	2	7603
7607	Базовый классификатор 0:	CART	3	7603
7608	Базовый классификатор 1:	C45	4	7603
7609	Базовый классификатор 2:	ID3	5	7603
7612	Число итераций:	25	0	7611
7613	Минимальная допустимая ошибка классификатора:	0	1	7611
7614	Максимальная допустимая ошибка классификатора:	0,5	2	7611
7615	Метод голосования:	Метод большинства голосов	3	7611
7616	Формирование обучающих выборок:	Случайные подвыборки	4	7611
7617	Выбор классификатора:	Оптимальный классификатор	5	7611
7618	Число потоков	4	6	7611
7619	Начальное значение (Seed)	1	7	7611
7620	Базовый классификатор 0:	CART	8	7611
7621	Базовый классификатор 1:	C45	9	7611
7624	Число итераций:	25	0	7623
7625	Минимальная допустимая ошибка классификатора:	0	1	7623
7626	Максимальная допустимая ошибка классификатора:	0,5	2	7623
7627	Метод голосования:	Метод большинства голосов	3	7623
7628	Формирование обучающих выборок:	Случайные подвыборки	4	7623
7629	Выбор классификатора:	Оптимальный классификатор	5	7623
7630	Число потоков	4	6	7623
7631	Начальное значение (Seed)	1	7	7623
7632	Базовый классификатор 0:	CART	8	7623
7633	Базовый классификатор 1:	C45	9	7623
7634	Базовый классификатор 2:	C45	10	7623
7637	Число итераций:	25	0	7636
7638	Минимальная допустимая ошибка классификатора:	0	1	7636
7639	Максимальная допустимая ошибка классификатора:	0,5	2	7636
7640	Метод голосования:	Метод большинства голосов	3	7636
7641	Формирование обучающих выборок:	Случайные подвыборки	4	7636
7642	Выбор классификатора:	Оптимальный классификатор	5	7636
7643	Число потоков	4	6	7636
7644	Начальное значение (Seed)	1	7	7636
7645	Базовый классификатор 0:	CART	8	7636
7646	Базовый классификатор 1:	ID3	9	7636
7649	Число итераций:	25	0	7648
7650	Минимальная допустимая ошибка классификатора:	0	1	7648
7651	Максимальная допустимая ошибка классификатора:	0,5	2	7648
7652	Метод голосования:	Метод большинства голосов	3	7648
7653	Формирование обучающих выборок:	Случайные подвыборки	4	7648
8099	Число деревьев:	100	0	8098
7654	Выбор классификатора:	Оптимальный классификатор	5	7648
7655	Число потоков	4	6	7648
7656	Начальное значение (Seed)	1	7	7648
7657	Базовый классификатор 0:	CART	8	7648
3856	Количество нейронов в выходном слое:	2	1	646
3857	Количество скрытых слоев:	1	2	646
3858	Структура скрытого слоя:	5	3	646
3859	Максимальное число итераций:	1000000	4	646
3860	Допустимая ошибка:	0,00001	5	646
3861	Активационная функция нейронов скрытого слоя:	Логистическая	6	646
3482	Число итераций:	10	0	662
7658	Базовый классификатор 1:	C45	9	7648
7661	Число итераций:	25	0	7660
7662	Минимальная допустимая ошибка классификатора:	0	1	7660
7663	Максимальная допустимая ошибка классификатора:	0,5	2	7660
7664	Метод голосования:	Метод большинства голосов	3	7660
7665	Формирование обучающих выборок:	Случайные подвыборки	4	7660
7666	Выбор классификатора:	Оптимальный классификатор	5	7660
7667	Число потоков	4	6	7660
7668	Начальное значение (Seed)	1	7	7660
7669	Базовый классификатор 0:	CART	8	7660
7670	Базовый классификатор 1:	C45	9	7660
7671	Базовый классификатор 2:	ID3	10	7660
7674	Количество нейронов во входном слое:	9	0	7673
7675	Количество нейронов в выходном слое:	6	1	7673
7676	Количество скрытых слоев:	2	2	7673
7677	Структура скрытого слоя:	29,57	3	7673
7678	Максимальное число итераций:	1000000	4	7673
7679	Допустимая ошибка:	0,00001	5	7673
7680	Активационная функция нейронов скрытого слоя:	Функция ISRU	6	7673
7681	Формула активационной функции нейронов скрытого слоя:	f(S)=S/sqrt(1+2,349*S^2)	7	7673
7682	Активационная функция нейронов выходного слоя:	Логистическая	8	7673
7683	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	7673
7684	Алгоритм обучения:	BackPropagation	10	7673
7685	Коэффициент скорости обучения:	0,1	11	7673
7686	Коэффициент момента:	0,2	12	7673
7687	Начальное значение (Seed)	1	13	7673
7690	Количество нейронов во входном слое:	9	0	7689
7691	Количество нейронов в выходном слое:	6	1	7689
7692	Количество скрытых слоев:	1	2	7689
7693	Структура скрытого слоя:	138	3	7689
7694	Максимальное число итераций:	1000000	4	7689
7695	Допустимая ошибка:	0,00001	5	7689
7696	Активационная функция нейронов скрытого слоя:	Функция ISRU	6	7689
7697	Формула активационной функции нейронов скрытого слоя:	f(S)=S/sqrt(1+4,2659*S^2)	7	7689
7698	Активационная функция нейронов выходного слоя:	Логистическая	8	7689
7699	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	7689
7700	Алгоритм обучения:	BackPropagation	10	7689
7701	Коэффициент скорости обучения:	0,1	11	7689
7702	Коэффициент момента:	0,2	12	7689
7703	Начальное значение (Seed)	1	13	7689
7706	Количество нейронов во входном слое:	9	0	7705
7707	Количество нейронов в выходном слое:	6	1	7705
7708	Количество скрытых слоев:	2	2	7705
7709	Структура скрытого слоя:	29,28	3	7705
7710	Максимальное число итераций:	1000000	4	7705
7711	Допустимая ошибка:	0,00001	5	7705
7712	Активационная функция нейронов скрытого слоя:	Функция ISRU	6	7705
7713	Формула активационной функции нейронов скрытого слоя:	f(S)=S/sqrt(1+2,3851*S^2)	7	7705
7714	Активационная функция нейронов выходного слоя:	Логистическая	8	7705
3530	Минимальное число объектов в листе:	2	0	644
3531	Максиальная глубина дерева:	0	1	644
7715	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	7705
7716	Алгоритм обучения:	BackPropagation	10	7705
7717	Коэффициент скорости обучения:	0,1	11	7705
7718	Коэффициент момента:	0,2	12	7705
7719	Начальное значение (Seed)	1	13	7705
7722	Количество нейронов во входном слое:	9	0	7721
7723	Количество нейронов в выходном слое:	6	1	7721
7724	Количество скрытых слоев:	2	2	7721
7725	Структура скрытого слоя:	16,32	3	7721
7726	Максимальное число итераций:	1000000	4	7721
7727	Допустимая ошибка:	0,00001	5	7721
7728	Активационная функция нейронов скрытого слоя:	Логистическая	6	7721
7729	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-1,499*S))	7	7721
7730	Активационная функция нейронов выходного слоя:	Логистическая	8	7721
7731	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	7721
7732	Алгоритм обучения:	BackPropagation	10	7721
7733	Коэффициент скорости обучения:	0,1	11	7721
7734	Коэффициент момента:	0,2	12	7721
7735	Начальное значение (Seed)	1	13	7721
7738	Количество нейронов во входном слое:	9	0	7737
7739	Количество нейронов в выходном слое:	6	1	7737
7740	Количество скрытых слоев:	1	2	7737
7741	Структура скрытого слоя:	31	3	7737
7742	Максимальное число итераций:	1000000	4	7737
7743	Допустимая ошибка:	0,00001	5	7737
7744	Активационная функция нейронов скрытого слоя:	Логистическая	6	7737
7745	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-4,8046*S))	7	7737
7746	Активационная функция нейронов выходного слоя:	Логистическая	8	7737
7747	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	7737
7748	Алгоритм обучения:	BackPropagation	10	7737
7749	Коэффициент скорости обучения:	0,1	11	7737
7750	Коэффициент момента:	0,2	12	7737
7751	Начальное значение (Seed)	1	13	7737
7754	Количество нейронов во входном слое:	19	0	7753
7755	Количество нейронов в выходном слое:	4	1	7753
7756	Количество скрытых слоев:	1	2	7753
7757	Структура скрытого слоя:	2	3	7753
7758	Максимальное число итераций:	1000000	4	7753
7759	Допустимая ошибка:	0,00001	5	7753
7760	Активационная функция нейронов скрытого слоя:	Функция ISRU	6	7753
7761	Формула активационной функции нейронов скрытого слоя:	f(S)=S/sqrt(1+3,5507*S^2)	7	7753
7762	Активационная функция нейронов выходного слоя:	Логистическая	8	7753
7763	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	7753
7764	Алгоритм обучения:	BackPropagation	10	7753
7765	Коэффициент скорости обучения:	0,1	11	7753
7766	Коэффициент момента:	0,2	12	7753
3862	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	646
3863	Активационная функция нейронов выходного слоя:	Логистическая	8	646
3864	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	646
3865	Алгоритм обучения:	BackPropagation	10	646
7767	Начальное значение (Seed)	1	13	7753
7770	Количество нейронов во входном слое:	19	0	7769
7771	Количество нейронов в выходном слое:	4	1	7769
7772	Количество скрытых слоев:	1	2	7769
7773	Структура скрытого слоя:	2	3	7769
7774	Максимальное число итераций:	1000000	4	7769
7775	Допустимая ошибка:	0,00001	5	7769
7776	Активационная функция нейронов скрытого слоя:	Функция ISRU	6	7769
7777	Формула активационной функции нейронов скрытого слоя:	f(S)=S/sqrt(1+2,4575*S^2)	7	7769
7778	Активационная функция нейронов выходного слоя:	Логистическая	8	7769
7779	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	7769
7780	Алгоритм обучения:	BackPropagation	10	7769
7781	Коэффициент скорости обучения:	0,1	11	7769
7782	Коэффициент момента:	0,2	12	7769
7783	Начальное значение (Seed)	1	13	7769
7786	Количество нейронов во входном слое:	19	0	7785
7787	Количество нейронов в выходном слое:	4	1	7785
7788	Количество скрытых слоев:	2	2	7785
7789	Структура скрытого слоя:	6,6	3	7785
7790	Максимальное число итераций:	1000000	4	7785
7791	Допустимая ошибка:	0,00001	5	7785
7792	Активационная функция нейронов скрытого слоя:	Гиперболический тангенс	6	7785
7793	Формула активационной функции нейронов скрытого слоя:	f(S)=(exp(4,7883*S)-exp(-4,7883*S))/(exp(4,7883*S)+exp(-4,7883*S))	7	7785
7794	Активационная функция нейронов выходного слоя:	Логистическая	8	7785
7795	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	7785
7796	Алгоритм обучения:	BackPropagation	10	7785
7797	Коэффициент скорости обучения:	0,1	11	7785
7798	Коэффициент момента:	0,2	12	7785
7799	Начальное значение (Seed)	1	13	7785
7802	Количество нейронов во входном слое:	19	0	7801
7803	Количество нейронов в выходном слое:	4	1	7801
7804	Количество скрытых слоев:	2	2	7801
7805	Структура скрытого слоя:	9,5	3	7801
7806	Максимальное число итераций:	1000000	4	7801
7807	Допустимая ошибка:	0,00001	5	7801
7808	Активационная функция нейронов скрытого слоя:	Гиперболический тангенс	6	7801
7809	Формула активационной функции нейронов скрытого слоя:	f(S)=(exp(3,3924*S)-exp(-3,3924*S))/(exp(3,3924*S)+exp(-3,3924*S))	7	7801
7810	Активационная функция нейронов выходного слоя:	Логистическая	8	7801
7811	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	7801
7812	Алгоритм обучения:	BackPropagation	10	7801
7813	Коэффициент скорости обучения:	0,1	11	7801
7814	Коэффициент момента:	0,2	12	7801
7815	Начальное значение (Seed)	1	13	7801
3866	Коэффициент скорости обучения:	0,1	11	646
3867	Коэффициент момента:	0,2	12	646
6221	Алгоритм построения дерева решений:	ID3	4	648
5436	Метод голосования:	Метод большинства голосов	3	649
5437	Формирование обучающих выборок:	Бутстрэп выборки	4	649
7818	Количество нейронов во входном слое:	19	0	7817
7819	Количество нейронов в выходном слое:	4	1	7817
7820	Количество скрытых слоев:	2	2	7817
7821	Структура скрытого слоя:	3,7	3	7817
7822	Максимальное число итераций:	1000000	4	7817
7823	Допустимая ошибка:	0,00001	5	7817
7824	Активационная функция нейронов скрытого слоя:	Гиперболический тангенс	6	7817
7825	Формула активационной функции нейронов скрытого слоя:	f(S)=(exp(1,397*S)-exp(-1,397*S))/(exp(1,397*S)+exp(-1,397*S))	7	7817
7826	Активационная функция нейронов выходного слоя:	Логистическая	8	7817
7827	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	7817
7828	Алгоритм обучения:	BackPropagation	10	7817
7829	Коэффициент скорости обучения:	0,1	11	7817
7830	Коэффициент момента:	0,2	12	7817
7831	Начальное значение (Seed)	1	13	7817
7834	Число итераций:	25	0	7833
7835	Минимальная допустимая ошибка классификатора:	0	1	7833
7836	Максимальная допустимая ошибка классификатора:	0,5	2	7833
7837	Метод голосования:	Метод большинства голосов	3	7833
7838	Формирование обучающих выборок:	Случайные подвыборки	4	7833
7839	Выбор классификатора:	Случайный классификатор	5	7833
7840	Число потоков	4	6	7833
7841	Начальное значение (Seed)	1	7	7833
7842	Базовый классификатор 0:	KNearestNeighbours	8	7833
7843	Базовый классификатор 1:	KNearestNeighbours	9	7833
7844	Базовый классификатор 2:	KNearestNeighbours	10	7833
7847	Число итераций:	25	0	7846
7848	Минимальная допустимая ошибка классификатора:	0	1	7846
7849	Максимальная допустимая ошибка классификатора:	0,5	2	7846
7850	Метод голосования:	Метод большинства голосов	3	7846
7851	Формирование обучающих выборок:	Случайные подвыборки	4	7846
7852	Выбор классификатора:	Случайный классификатор	5	7846
7853	Число потоков	4	6	7846
7854	Начальное значение (Seed)	1	7	7846
7855	Базовый классификатор 0:	KNearestNeighbours	8	7846
7856	Базовый классификатор 1:	KNearestNeighbours	9	7846
7857	Базовый классификатор 2:	KNearestNeighbours	10	7846
7860	Число итераций:	25	0	7859
8366	Базовый классификатор 0:	J48	3	8362
7861	Минимальная допустимая ошибка классификатора:	0	1	7859
7862	Максимальная допустимая ошибка классификатора:	0,5	2	7859
7863	Метод голосования:	Метод большинства голосов	3	7859
7864	Формирование обучающих выборок:	Случайные подвыборки	4	7859
7865	Выбор классификатора:	Случайный классификатор	5	7859
7866	Число потоков	4	6	7859
7867	Начальное значение (Seed)	1	7	7859
7868	Базовый классификатор 0:	KNearestNeighbours	8	7859
7869	Базовый классификатор 1:	KNearestNeighbours	9	7859
7870	Базовый классификатор 2:	KNearestNeighbours	10	7859
7873	Число итераций:	1	0	7872
7874	Минимальная допустимая ошибка классификатора:	0	1	7872
7875	Максимальная допустимая ошибка классификатора:	0,5	2	7872
5438	Выбор классификатора:	Случайный классификатор	5	649
5439	Базовый классификатор 0:	NeuralNetwork	6	649
5440	Базовый классификатор 1:	KNearestNeighbours	7	649
3517	Минимальное число объектов в листе:	2	0	652
7876	Метод голосования:	Метод большинства голосов	3	7872
7877	Формирование обучающих выборок:	Использование исходной выборки	4	7872
7878	Выбор классификатора:	Случайный классификатор	5	7872
7879	Число потоков	4	6	7872
7880	Начальное значение (Seed)	1	7	7872
7881	Базовый классификатор 0:	KNearestNeighbours	8	7872
7884	Число итераций:	1	0	7883
7885	Минимальная допустимая ошибка классификатора:	0	1	7883
7886	Максимальная допустимая ошибка классификатора:	0,5	2	7883
7887	Метод голосования:	Метод взвешенного голосования	3	7883
7888	Формирование обучающих выборок:	Использование исходной выборки	4	7883
7889	Выбор классификатора:	Случайный классификатор	5	7883
7890	Число потоков	4	6	7883
7891	Начальное значение (Seed)	1	7	7883
7892	Базовый классификатор 0:	KNearestNeighbours	8	7883
7895	Число итераций:	25	0	7894
7896	Минимальная допустимая ошибка классификатора:	0	1	7894
7897	Максимальная допустимая ошибка классификатора:	0,5	2	7894
7898	Метод голосования:	Метод большинства голосов	3	7894
7899	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	7894
7900	Выбор классификатора:	Случайный классификатор	5	7894
7901	Число потоков	4	6	7894
7902	Начальное значение (Seed)	1	7	7894
7903	Базовый классификатор 0:	KNearestNeighbours	8	7894
7904	Базовый классификатор 1:	KNearestNeighbours	9	7894
7905	Базовый классификатор 2:	KNearestNeighbours	10	7894
7906	Базовый классификатор 3:	KNearestNeighbours	11	7894
7909	Число итераций:	25	0	7908
7910	Минимальная допустимая ошибка классификатора:	0	1	7908
7911	Максимальная допустимая ошибка классификатора:	0,5	2	7908
7912	Метод голосования:	Метод большинства голосов	3	7908
7913	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	7908
7914	Выбор классификатора:	Оптимальный классификатор	5	7908
7915	Число потоков	4	6	7908
7916	Начальное значение (Seed)	1	7	7908
7917	Базовый классификатор 0:	KNearestNeighbours	8	7908
7920	Число итераций:	25	0	7919
7921	Минимальная допустимая ошибка классификатора:	0	1	7919
7922	Максимальная допустимая ошибка классификатора:	0,5	2	7919
7923	Метод голосования:	Метод большинства голосов	3	7919
7924	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	7919
7925	Выбор классификатора:	Случайный классификатор	5	7919
7926	Число потоков	4	6	7919
7927	Начальное значение (Seed)	1	7	7919
7928	Базовый классификатор 0:	KNearestNeighbours	8	7919
7931	Число итераций:	25	0	7930
7932	Минимальная допустимая ошибка классификатора:	0	1	7930
3518	Максиальная глубина дерева:	0	1	652
3519	Случайное дерево:	false	2	652
3520	Бинарное дерево:	true	3	652
3521	Использование случайных расщеплений атрибута:	false	4	652
5945	Алгоритм построения дерева решений:	CART	4	656
6358	Число случайных расщеплений атрибута:	10	5	657
6359	Формирование обучающих выборок:	Исходное обучающее множество	6	657
3522	Число итераций:	10	0	658
3523	Минимальная допустимая ошибка классификатора:	0	1	658
7933	Максимальная допустимая ошибка классификатора:	0,5	2	7930
7934	Метод голосования:	Метод большинства голосов	3	7930
7935	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	7930
7936	Выбор классификатора:	Случайный классификатор	5	7930
7937	Число потоков	4	6	7930
7938	Начальное значение (Seed)	1	7	7930
7939	Базовый классификатор 0:	KNearestNeighbours	8	7930
7940	Базовый классификатор 1:	KNearestNeighbours	9	7930
7941	Базовый классификатор 2:	KNearestNeighbours	10	7930
7944	Число итераций:	25	0	7943
7945	Минимальная допустимая ошибка классификатора:	0	1	7943
7946	Максимальная допустимая ошибка классификатора:	0,5	2	7943
7947	Метод голосования:	Метод большинства голосов	3	7943
7948	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	7943
7949	Выбор классификатора:	Случайный классификатор	5	7943
7950	Число потоков	4	6	7943
7951	Начальное значение (Seed)	1	7	7943
7952	Базовый классификатор 0:	KNearestNeighbours	8	7943
7953	Базовый классификатор 1:	KNearestNeighbours	9	7943
7954	Базовый классификатор 2:	KNearestNeighbours	10	7943
7957	Число итераций:	25	0	7956
7958	Минимальная допустимая ошибка классификатора:	0	1	7956
7959	Максимальная допустимая ошибка классификатора:	0,5	2	7956
7960	Начальное значение (Seed)	1	3	7956
7961	Базовый классификатор 0:	KNearestNeighbours	4	7956
7962	Базовый классификатор 1:	KNearestNeighbours	5	7956
7965	Число итераций:	25	0	7964
7966	Минимальная допустимая ошибка классификатора:	0	1	7964
7967	Максимальная допустимая ошибка классификатора:	0,5	2	7964
7968	Начальное значение (Seed)	1	3	7964
7969	Базовый классификатор 0:	KNearestNeighbours	4	7964
7970	Базовый классификатор 1:	KNearestNeighbours	5	7964
7971	Базовый классификатор 2:	KNearestNeighbours	6	7964
7974	Число итераций:	25	0	7973
7975	Минимальная допустимая ошибка классификатора:	0	1	7973
7976	Максимальная допустимая ошибка классификатора:	0,5	2	7973
7977	Начальное значение (Seed)	1	3	7973
7978	Базовый классификатор 0:	KNearestNeighbours	4	7973
7979	Базовый классификатор 1:	KNearestNeighbours	5	7973
7980	Базовый классификатор 2:	KNearestNeighbours	6	7973
7983	Число итераций:	25	0	7982
7984	Минимальная допустимая ошибка классификатора:	0	1	7982
7985	Максимальная допустимая ошибка классификатора:	0,5	2	7982
7986	Начальное значение (Seed)	1	3	7982
7987	Базовый классификатор 0:	KNearestNeighbours	4	7982
7988	Базовый классификатор 1:	KNearestNeighbours	5	7982
7989	Базовый классификатор 2:	KNearestNeighbours	6	7982
3524	Максимальная допустимая ошибка классификатора:	0,5	2	658
3525	Метод голосования:	Метод большинства голосов	3	658
3526	Формирование обучающих выборок:	Бутстрэп выборки	4	658
3527	Выбор классификатора:	Оптимальный классификатор	5	658
3528	Базовый классификатор 0:	C45	6	658
7990	Базовый классификатор 3:	KNearestNeighbours	7	7982
7993	Число итераций:	25	0	7992
7994	Минимальная допустимая ошибка классификатора:	0	1	7992
7995	Максимальная допустимая ошибка классификатора:	0,5	2	7992
7996	Начальное значение (Seed)	1	3	7992
7997	Базовый классификатор 0:	KNearestNeighbours	4	7992
7998	Базовый классификатор 1:	KNearestNeighbours	5	7992
8001	Мета-классификатор:	KNearestNeighbours	0	8000
8100	Минимальное число объектов в листе:	2	1	8098
8002	Метод формирования мета-признаков:	Использование обучающего множества	1	8000
8003	Начальное значение (Seed)	1	2	8000
8004	Базовый классификатор 0:	KNearestNeighbours	3	8000
8007	Мета-классификатор:	KNearestNeighbours	0	8006
8008	Метод формирования мета-признаков:	Использование обучающего множества	1	8006
8009	Начальное значение (Seed)	1	2	8006
8010	Базовый классификатор 0:	KNearestNeighbours	3	8006
8013	Мета-классификатор:	KNearestNeighbours	0	8012
8014	Метод формирования мета-признаков:	Использование обучающего множества	1	8012
8015	Начальное значение (Seed)	1	2	8012
8016	Базовый классификатор 0:	KNearestNeighbours	3	8012
8019	Мета-классификатор:	KNearestNeighbours	0	8018
8020	Метод формирования мета-признаков:	Использование обучающего множества	1	8018
8021	Начальное значение (Seed)	1	2	8018
8022	Базовый классификатор 0:	KNearestNeighbours	3	8018
8025	Мета-классификатор:	KNearestNeighbours	0	8024
8026	Метод формирования мета-признаков:	Использование обучающего множества	1	8024
8027	Начальное значение (Seed)	1	2	8024
8028	Базовый классификатор 0:	KNearestNeighbours	3	8024
8029	Базовый классификатор 1:	KNearestNeighbours	4	8024
8032	Число деревьев:	10	0	8031
8033	Минимальное число объектов в листе:	2	1	8031
8034	Максиальная глубина дерева:	0	2	8031
8035	Число случайных атрибутов:	3	3	8031
8036	Алгоритм построения дерева решений:	CART	4	8031
8037	Число потоков	4	5	8031
8038	Начальное значение (Seed)	1	6	8031
8041	Число деревьев:	25	0	8040
8042	Минимальное число объектов в листе:	2	1	8040
8043	Максиальная глубина дерева:	0	2	8040
8044	Число случайных атрибутов:	4	3	8040
8045	Алгоритм построения дерева решений:	CART	4	8040
8046	Число потоков	4	5	8040
8047	Начальное значение (Seed)	1	6	8040
8050	Число деревьев:	25	0	8049
8051	Минимальное число объектов в листе:	2	1	8049
8052	Максиальная глубина дерева:	0	2	8049
8053	Число случайных атрибутов:	2	3	8049
8054	Алгоритм построения дерева решений:	CHAID	4	8049
8055	Число потоков	4	5	8049
8056	Начальное значение (Seed)	1	6	8049
8059	Число деревьев:	25	0	8058
8060	Минимальное число объектов в листе:	2	1	8058
8061	Максиальная глубина дерева:	0	2	8058
8062	Число случайных атрибутов:	1	3	8058
8063	Алгоритм построения дерева решений:	ID3	4	8058
8064	Число потоков	4	5	8058
8065	Начальное значение (Seed)	1	6	8058
3855	Количество нейронов во входном слое:	9	0	646
8068	Число деревьев:	25	0	8067
8069	Минимальное число объектов в листе:	2	1	8067
8070	Максиальная глубина дерева:	0	2	8067
8071	Число случайных атрибутов:	2	3	8067
8072	Алгоритм построения дерева решений:	ID3	4	8067
8073	Число потоков	4	5	8067
8074	Начальное значение (Seed)	1	6	8067
8077	Число деревьев:	25	0	8076
8078	Минимальное число объектов в листе:	2	1	8076
8079	Максиальная глубина дерева:	0	2	8076
8080	Число случайных атрибутов:	11	3	8076
8081	Алгоритм построения дерева решений:	CHAID	4	8076
8082	Число потоков	4	5	8076
8083	Начальное значение (Seed)	1	6	8076
8084	Число случайных расщеплений атрибута:	22	7	8076
8085	Формирование обучающих выборок:	Бутстрэп-выборки	8	8076
8088	Число деревьев:	75	0	8087
8089	Минимальное число объектов в листе:	2	1	8087
8090	Максиальная глубина дерева:	0	2	8087
8091	Число случайных атрибутов:	9	3	8087
8092	Алгоритм построения дерева решений:	CART	4	8087
8093	Число потоков	4	5	8087
8094	Начальное значение (Seed)	1	6	8087
8095	Число случайных расщеплений атрибута:	2	7	8087
8096	Формирование обучающих выборок:	Бутстрэп-выборки	8	8087
8101	Максиальная глубина дерева:	0	2	8098
8102	Число случайных атрибутов:	4	3	8098
8103	Алгоритм построения дерева решений:	CHAID	4	8098
8104	Число потоков	4	5	8098
8105	Начальное значение (Seed)	1	6	8098
8106	Число случайных расщеплений атрибута:	19	7	8098
8107	Формирование обучающих выборок:	Бутстрэп-выборки	8	8098
8110	Число деревьев:	50	0	8109
8111	Минимальное число объектов в листе:	2	1	8109
8112	Максиальная глубина дерева:	0	2	8109
8113	Число случайных атрибутов:	5	3	8109
8114	Алгоритм построения дерева решений:	CHAID	4	8109
8115	Число потоков	4	5	8109
8116	Начальное значение (Seed)	1	6	8109
8117	Число случайных расщеплений атрибута:	5	7	8109
8118	Формирование обучающих выборок:	Бутстрэп-выборки	8	8109
8121	Число деревьев:	50	0	8120
8122	Минимальное число объектов в листе:	2	1	8120
8123	Максиальная глубина дерева:	0	2	8120
8124	Число случайных атрибутов:	4	3	8120
8125	Алгоритм построения дерева решений:	CHAID	4	8120
8126	Число потоков	4	5	8120
8127	Начальное значение (Seed)	1	6	8120
8130	Число деревьев:	10	0	8129
8131	Минимальное число объектов в листе:	2	1	8129
8132	Максиальная глубина дерева:	0	2	8129
8133	Число случайных атрибутов:	6	3	8129
8134	Алгоритм построения дерева решений:	CHAID	4	8129
8135	Число потоков	4	5	8129
8136	Начальное значение (Seed)	1	6	8129
8137	Число случайных расщеплений атрибута:	13	7	8129
8138	Формирование обучающих выборок:	Бутстрэп-выборки	8	8129
3529	Базовый классификатор 1:	CART	7	658
8141	Число деревьев:	25	0	8140
8142	Минимальное число объектов в листе:	2	1	8140
8143	Максиальная глубина дерева:	0	2	8140
4492	Число итераций:	10	0	659
4493	Минимальная допустимая ошибка классификатора:	0	1	659
8144	Число случайных атрибутов:	2	3	8140
4494	Максимальная допустимая ошибка классификатора:	0,5	2	659
8145	Алгоритм построения дерева решений:	CART	4	8140
8146	Число потоков	4	5	8140
4495	Метод голосования:	Метод большинства голосов	3	659
4496	Формирование обучающих выборок:	Бутстрэп выборки	4	659
4497	Выбор классификатора:	Случайный классификатор	5	659
8147	Начальное значение (Seed)	1	6	8140
8150	Число деревьев:	25	0	8149
8151	Минимальное число объектов в листе:	2	1	8149
8152	Максиальная глубина дерева:	0	2	8149
8153	Число случайных атрибутов:	3	3	8149
8154	Алгоритм построения дерева решений:	CART	4	8149
8155	Число потоков	4	5	8149
8156	Начальное значение (Seed)	1	6	8149
8157	Число случайных расщеплений атрибута:	24	7	8149
8158	Формирование обучающих выборок:	Исходное обучающее множество	8	8149
8161	Число деревьев:	100	0	8160
8162	Минимальное число объектов в листе:	2	1	8160
8163	Максиальная глубина дерева:	0	2	8160
8164	Число случайных атрибутов:	2	3	8160
8165	Алгоритм построения дерева решений:	CART	4	8160
8166	Число потоков	4	5	8160
8167	Начальное значение (Seed)	1	6	8160
8168	Число случайных расщеплений атрибута:	2	7	8160
8169	Формирование обучающих выборок:	Бутстрэп-выборки	8	8160
8172	Число деревьев:	75	0	8171
8173	Минимальное число объектов в листе:	2	1	8171
8174	Максиальная глубина дерева:	0	2	8171
8175	Число случайных атрибутов:	12	3	8171
8176	Алгоритм построения дерева решений:	CHAID	4	8171
8177	Число потоков	4	5	8171
8178	Начальное значение (Seed)	1	6	8171
8179	Число случайных расщеплений атрибута:	1	7	8171
8180	Формирование обучающих выборок:	Бутстрэп-выборки	8	8171
8183	Число ближайших соседей:	281	0	8182
8184	Вес ближайшего соседа:	0,5522	1	8182
8185	Функция расстояния:	Манхеттенское расстояние	2	8182
8188	Число ближайших соседей:	109	0	8187
8189	Вес ближайшего соседа:	0,6024	1	8187
8190	Функция расстояния:	Манхеттенское расстояние	2	8187
8193	Число ближайших соседей:	142	0	8192
8194	Вес ближайшего соседа:	0,5897	1	8192
8195	Функция расстояния:	Манхеттенское расстояние	2	8192
8198	Число ближайших соседей:	109	0	8197
8199	Вес ближайшего соседа:	0,6063	1	8197
8200	Функция расстояния:	Манхеттенское расстояние	2	8197
8203	Число ближайших соседей:	119	0	8202
8204	Вес ближайшего соседа:	0,5767	1	8202
8205	Функция расстояния:	Манхеттенское расстояние	2	8202
8208	Число деревьев:	100	0	8207
8209	Минимальное число объектов в листе:	2	1	8207
8210	Максиальная глубина дерева:	0	2	8207
8211	Число случайных атрибутов:	25	3	8207
8212	Алгоритм построения дерева решений:	CHAID	4	8207
8213	Число потоков	4	5	8207
8214	Начальное значение (Seed)	1	6	8207
8215	Число случайных расщеплений атрибута:	4	7	8207
8216	Формирование обучающих выборок:	Бутстрэп-выборки	8	8207
8219	Число деревьев:	50	0	8218
8220	Минимальное число объектов в листе:	2	1	8218
8221	Максиальная глубина дерева:	0	2	8218
8222	Число случайных атрибутов:	17	3	8218
8223	Алгоритм построения дерева решений:	CHAID	4	8218
8224	Число потоков	4	5	8218
8225	Начальное значение (Seed)	1	6	8218
8226	Число случайных расщеплений атрибута:	19	7	8218
8227	Формирование обучающих выборок:	Бутстрэп-выборки	8	8218
8230	Число деревьев:	10	0	8229
8231	Минимальное число объектов в листе:	2	1	8229
4498	Базовый классификатор 0:	CART	6	659
8232	Максиальная глубина дерева:	0	2	8229
8233	Число случайных атрибутов:	8	3	8229
8234	Алгоритм построения дерева решений:	C45	4	8229
8235	Число потоков	4	5	8229
8236	Начальное значение (Seed)	1	6	8229
8237	Число случайных расщеплений атрибута:	20	7	8229
8238	Формирование обучающих выборок:	Исходное обучающее множество	8	8229
8241	Число деревьев:	75	0	8240
8242	Минимальное число объектов в листе:	2	1	8240
8243	Максиальная глубина дерева:	0	2	8240
8244	Число случайных атрибутов:	29	3	8240
8245	Алгоритм построения дерева решений:	C45	4	8240
8246	Число потоков	4	5	8240
8247	Начальное значение (Seed)	1	6	8240
8248	Число случайных расщеплений атрибута:	3	7	8240
8249	Формирование обучающих выборок:	Бутстрэп-выборки	8	8240
8252	Число деревьев:	100	0	8251
8253	Минимальное число объектов в листе:	2	1	8251
8254	Максиальная глубина дерева:	0	2	8251
8255	Число случайных атрибутов:	5	3	8251
8256	Алгоритм построения дерева решений:	ID3	4	8251
8257	Число потоков	4	5	8251
8258	Начальное значение (Seed)	1	6	8251
8259	Число случайных расщеплений атрибута:	23	7	8251
8260	Формирование обучающих выборок:	Исходное обучающее множество	8	8251
8263	Число итераций:	25	0	8262
8264	Минимальная допустимая ошибка классификатора:	0	1	8262
8265	Максимальная допустимая ошибка классификатора:	0,5	2	8262
8266	Метод голосования:	Метод большинства голосов	3	8262
8267	Формирование обучающих выборок:	Бутстрэп выборки	4	8262
8268	Выбор классификатора:	Случайный классификатор	5	8262
8269	Число потоков	4	6	8262
8270	Начальное значение (Seed)	1	7	8262
8271	Базовый классификатор 0:	J48	8	8262
8274	Число итераций:	25	0	8273
8275	Минимальная допустимая ошибка классификатора:	0	1	8273
8276	Максимальная допустимая ошибка классификатора:	0,5	2	8273
8277	Метод голосования:	Метод большинства голосов	3	8273
8278	Формирование обучающих выборок:	Бутстрэп выборки	4	8273
8279	Выбор классификатора:	Случайный классификатор	5	8273
8280	Число потоков	4	6	8273
8281	Начальное значение (Seed)	1	7	8273
8282	Базовый классификатор 0:	J48	8	8273
8285	Число итераций:	25	0	8284
8286	Минимальная допустимая ошибка классификатора:	0	1	8284
8287	Максимальная допустимая ошибка классификатора:	0,5	2	8284
8288	Метод голосования:	Метод большинства голосов	3	8284
8289	Формирование обучающих выборок:	Бутстрэп выборки	4	8284
8290	Выбор классификатора:	Оптимальный классификатор	5	8284
8291	Число потоков	4	6	8284
8292	Начальное значение (Seed)	1	7	8284
8293	Базовый классификатор 0:	J48	8	8284
8296	Число итераций:	25	0	8295
8297	Минимальная допустимая ошибка классификатора:	0	1	8295
8298	Максимальная допустимая ошибка классификатора:	0,5	2	8295
8299	Метод голосования:	Метод большинства голосов	3	8295
4499	Базовый классификатор 1:	C45	7	659
4500	Базовый классификатор 2:	NeuralNetwork	8	659
6300	Максимальное число итераций:	500	0	696
8300	Формирование обучающих выборок:	Бутстрэп выборки	4	8295
8301	Выбор классификатора:	Оптимальный классификатор	5	8295
8302	Число потоков	4	6	8295
8303	Начальное значение (Seed)	1	7	8295
8304	Базовый классификатор 0:	J48	8	8295
8307	Число итераций:	25	0	8306
8308	Минимальная допустимая ошибка классификатора:	0	1	8306
8309	Максимальная допустимая ошибка классификатора:	0,5	2	8306
8310	Метод голосования:	Метод большинства голосов	3	8306
8311	Формирование обучающих выборок:	Бутстрэп выборки	4	8306
8312	Выбор классификатора:	Случайный классификатор	5	8306
8313	Число потоков	4	6	8306
8314	Начальное значение (Seed)	1	7	8306
8315	Базовый классификатор 0:	J48	8	8306
8316	Базовый классификатор 1:	J48	9	8306
8319	Число итераций:	25	0	8318
8320	Минимальная допустимая ошибка классификатора:	0	1	8318
8321	Максимальная допустимая ошибка классификатора:	0,5	2	8318
8322	Начальное значение (Seed)	1	3	8318
8323	Базовый классификатор 0:	J48	4	8318
8326	Число итераций:	25	0	8325
8327	Минимальная допустимая ошибка классификатора:	0	1	8325
8328	Максимальная допустимая ошибка классификатора:	0,5	2	8325
8329	Начальное значение (Seed)	1	3	8325
8330	Базовый классификатор 0:	J48	4	8325
8331	Базовый классификатор 1:	J48	5	8325
8334	Число итераций:	25	0	8333
8335	Минимальная допустимая ошибка классификатора:	0	1	8333
8336	Максимальная допустимая ошибка классификатора:	0,5	2	8333
8337	Начальное значение (Seed)	1	3	8333
8338	Базовый классификатор 0:	J48	4	8333
8341	Число итераций:	25	0	8340
8342	Минимальная допустимая ошибка классификатора:	0	1	8340
8343	Максимальная допустимая ошибка классификатора:	0,5	2	8340
8344	Начальное значение (Seed)	1	3	8340
8345	Базовый классификатор 0:	J48	4	8340
8346	Базовый классификатор 1:	J48	5	8340
8349	Число итераций:	25	0	8348
8350	Минимальная допустимая ошибка классификатора:	0	1	8348
8351	Максимальная допустимая ошибка классификатора:	0,5	2	8348
8352	Начальное значение (Seed)	1	3	8348
8353	Базовый классификатор 0:	J48	4	8348
8354	Базовый классификатор 1:	J48	5	8348
8357	Мета-классификатор:	J48	0	8356
8358	Метод формирования мета-признаков:	Использование обучающего множества	1	8356
8359	Начальное значение (Seed)	1	2	8356
8360	Базовый классификатор 0:	J48	3	8356
8363	Мета-классификатор:	J48	0	8362
8364	Метод формирования мета-признаков:	Использование обучающего множества	1	8362
8365	Начальное значение (Seed)	1	2	8362
8369	Мета-классификатор:	J48	0	8368
8370	Метод формирования мета-признаков:	Использование обучающего множества	1	8368
8371	Начальное значение (Seed)	1	2	8368
8372	Базовый классификатор 0:	J48	3	8368
8373	Базовый классификатор 1:	J48	4	8368
8376	Мета-классификатор:	J48	0	8375
8377	Метод формирования мета-признаков:	Использование обучающего множества	1	8375
8378	Начальное значение (Seed)	1	2	8375
8379	Базовый классификатор 0:	J48	3	8375
6449	Формирование обучающих выборок:	Использование исходной выборки	4	660
8380	Базовый классификатор 1:	J48	4	8375
8383	Мета-классификатор:	J48	0	8382
6450	Выбор классификатора:	Случайный классификатор	5	660
8384	Метод формирования мета-признаков:	Использование обучающего множества	1	8382
8385	Начальное значение (Seed)	1	2	8382
8386	Базовый классификатор 0:	J48	3	8382
8387	Базовый классификатор 1:	J48	4	8382
8390	Число деревьев:	10	0	8389
8391	Минимальное число объектов в листе:	2	1	8389
8392	Максиальная глубина дерева:	0	2	8389
8393	Число случайных атрибутов:	18	3	8389
8394	Алгоритм построения дерева решений:	CART	4	8389
8395	Число потоков	4	5	8389
8396	Начальное значение (Seed)	1	6	8389
8397	Число случайных расщеплений атрибута:	7	7	8389
8398	Формирование обучающих выборок:	Исходное обучающее множество	8	8389
8401	Число деревьев:	75	0	8400
8402	Минимальное число объектов в листе:	2	1	8400
8403	Максиальная глубина дерева:	0	2	8400
8404	Число случайных атрибутов:	20	3	8400
8405	Алгоритм построения дерева решений:	ID3	4	8400
8406	Число потоков	4	5	8400
8407	Начальное значение (Seed)	1	6	8400
8408	Число случайных расщеплений атрибута:	11	7	8400
8409	Формирование обучающих выборок:	Бутстрэп-выборки	8	8400
8412	Число деревьев:	100	0	8411
8413	Минимальное число объектов в листе:	2	1	8411
8414	Максиальная глубина дерева:	0	2	8411
8415	Число случайных атрибутов:	24	3	8411
8416	Алгоритм построения дерева решений:	CHAID	4	8411
8417	Число потоков	4	5	8411
8418	Начальное значение (Seed)	1	6	8411
8419	Число случайных расщеплений атрибута:	7	7	8411
8420	Формирование обучающих выборок:	Исходное обучающее множество	8	8411
8423	Число деревьев:	100	0	8422
8424	Минимальное число объектов в листе:	2	1	8422
8425	Максиальная глубина дерева:	0	2	8422
8426	Число случайных атрибутов:	13	3	8422
8427	Алгоритм построения дерева решений:	ID3	4	8422
8428	Число потоков	4	5	8422
8429	Начальное значение (Seed)	1	6	8422
8430	Число случайных расщеплений атрибута:	5	7	8422
8431	Формирование обучающих выборок:	Исходное обучающее множество	8	8422
8434	Число деревьев:	75	0	8433
8435	Минимальное число объектов в листе:	2	1	8433
8436	Максиальная глубина дерева:	0	2	8433
8437	Число случайных атрибутов:	14	3	8433
8438	Алгоритм построения дерева решений:	C45	4	8433
8439	Число потоков	4	5	8433
8440	Начальное значение (Seed)	1	6	8433
8441	Число случайных расщеплений атрибута:	9	7	8433
8442	Формирование обучающих выборок:	Бутстрэп-выборки	8	8433
8445	Число итераций:	25	0	8444
8446	Минимальная допустимая ошибка классификатора:	0	1	8444
8447	Максимальная допустимая ошибка классификатора:	0,5	2	8444
8448	Метод голосования:	Метод большинства голосов	3	8444
8449	Формирование обучающих выборок:	Бутстрэп выборки	4	8444
6451	Базовый классификатор 0:	KNearestNeighbours	6	660
3755	Число итераций:	10	0	661
3756	Минимальная допустимая ошибка классификатора:	0	1	661
3757	Максимальная допустимая ошибка классификатора:	0,5	2	661
3758	Метод голосования:	Метод большинства голосов	3	661
3759	Формирование обучающих выборок:	Бутстрэп выборки	4	661
5509	Максиальная глубина дерева:	0	1	697
8450	Выбор классификатора:	Случайный классификатор	5	8444
8451	Число потоков	4	6	8444
8452	Начальное значение (Seed)	1	7	8444
8453	Базовый классификатор 0:	J48	8	8444
8454	Базовый классификатор 1:	J48	9	8444
8455	Базовый классификатор 2:	J48	10	8444
8458	Число итераций:	25	0	8457
8459	Минимальная допустимая ошибка классификатора:	0	1	8457
8460	Максимальная допустимая ошибка классификатора:	0,5	2	8457
8461	Метод голосования:	Метод большинства голосов	3	8457
8462	Формирование обучающих выборок:	Бутстрэп выборки	4	8457
8463	Выбор классификатора:	Случайный классификатор	5	8457
8464	Число потоков	4	6	8457
8465	Начальное значение (Seed)	1	7	8457
8466	Базовый классификатор 0:	J48	8	8457
8467	Базовый классификатор 1:	J48	9	8457
8468	Базовый классификатор 2:	J48	10	8457
8471	Число итераций:	25	0	8470
8472	Минимальная допустимая ошибка классификатора:	0	1	8470
8473	Максимальная допустимая ошибка классификатора:	0,5	2	8470
8474	Метод голосования:	Метод большинства голосов	3	8470
8475	Формирование обучающих выборок:	Случайные подвыборки	4	8470
8476	Выбор классификатора:	Случайный классификатор	5	8470
8477	Число потоков	4	6	8470
8478	Начальное значение (Seed)	1	7	8470
8479	Базовый классификатор 0:	J48	8	8470
8482	Число итераций:	25	0	8481
8483	Минимальная допустимая ошибка классификатора:	0	1	8481
8484	Максимальная допустимая ошибка классификатора:	0,5	2	8481
8485	Метод голосования:	Метод большинства голосов	3	8481
8486	Формирование обучающих выборок:	Случайные подвыборки	4	8481
8487	Выбор классификатора:	Случайный классификатор	5	8481
8488	Число потоков	4	6	8481
8489	Начальное значение (Seed)	1	7	8481
8490	Базовый классификатор 0:	J48	8	8481
8493	Число итераций:	25	0	8492
8494	Минимальная допустимая ошибка классификатора:	0	1	8492
8495	Максимальная допустимая ошибка классификатора:	0,5	2	8492
8496	Метод голосования:	Метод большинства голосов	3	8492
8497	Формирование обучающих выборок:	Случайные подвыборки	4	8492
8498	Выбор классификатора:	Оптимальный классификатор	5	8492
8499	Число потоков	4	6	8492
8500	Начальное значение (Seed)	1	7	8492
8501	Базовый классификатор 0:	J48	8	8492
8504	Количество нейронов во входном слое:	33	0	8503
8505	Количество нейронов в выходном слое:	2	1	8503
8506	Количество скрытых слоев:	2	2	8503
8507	Структура скрытого слоя:	9,8	3	8503
8508	Максимальное число итераций:	1000000	4	8503
8509	Допустимая ошибка:	0,00001	5	8503
8510	Активационная функция нейронов скрытого слоя:	Экспоненциальная	6	8503
8511	Формула активационной функции нейронов скрытого слоя:	f(S)=exp(-S^2/2,2393^2)	7	8503
3760	Выбор классификатора:	Случайный классификатор	5	661
3761	Базовый классификатор 0:	KNearestNeighbours	6	661
3483	Минимальная допустимая ошибка классификатора:	0	1	662
3484	Максимальная допустимая ошибка классификатора:	0,5	2	662
3485	Метод голосования:	Метод большинства голосов	3	662
8512	Активационная функция нейронов выходного слоя:	Логистическая	8	8503
8513	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	8503
8514	Алгоритм обучения:	BackPropagation	10	8503
8515	Коэффициент скорости обучения:	0,1	11	8503
8516	Коэффициент момента:	0,2	12	8503
8517	Начальное значение (Seed)	1	13	8503
8520	Количество нейронов во входном слое:	33	0	8519
8521	Количество нейронов в выходном слое:	2	1	8519
8522	Количество скрытых слоев:	2	2	8519
8523	Структура скрытого слоя:	6,3	3	8519
8524	Максимальное число итераций:	1000000	4	8519
8525	Допустимая ошибка:	0,00001	5	8519
8526	Активационная функция нейронов скрытого слоя:	Логистическая	6	8519
8527	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-1,5453*S))	7	8519
8528	Активационная функция нейронов выходного слоя:	Логистическая	8	8519
8529	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	8519
8530	Алгоритм обучения:	BackPropagation	10	8519
8531	Коэффициент скорости обучения:	0,1	11	8519
8532	Коэффициент момента:	0,2	12	8519
8533	Начальное значение (Seed)	1	13	8519
8536	Количество нейронов во входном слое:	33	0	8535
8537	Количество нейронов в выходном слое:	2	1	8535
8538	Количество скрытых слоев:	2	2	8535
8539	Структура скрытого слоя:	9,5	3	8535
8540	Максимальное число итераций:	1000000	4	8535
8541	Допустимая ошибка:	0,00001	5	8535
8542	Активационная функция нейронов скрытого слоя:	Логистическая	6	8535
8543	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-1,833*S))	7	8535
8544	Активационная функция нейронов выходного слоя:	Логистическая	8	8535
8545	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	8535
8546	Алгоритм обучения:	BackPropagation	10	8535
8547	Коэффициент скорости обучения:	0,1	11	8535
8548	Коэффициент момента:	0,2	12	8535
8549	Начальное значение (Seed)	1	13	8535
8552	Количество нейронов во входном слое:	33	0	8551
8553	Количество нейронов в выходном слое:	2	1	8551
8554	Количество скрытых слоев:	2	2	8551
8555	Структура скрытого слоя:	7,7	3	8551
8556	Максимальное число итераций:	1000000	4	8551
8557	Допустимая ошибка:	0,00001	5	8551
8558	Активационная функция нейронов скрытого слоя:	Логистическая	6	8551
8559	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-1,9553*S))	7	8551
8560	Активационная функция нейронов выходного слоя:	Логистическая	8	8551
8561	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	8551
8562	Алгоритм обучения:	BackPropagation	10	8551
8563	Коэффициент скорости обучения:	0,1	11	8551
8564	Коэффициент момента:	0,2	12	8551
3486	Формирование обучающих выборок:	Бутстрэп выборки	4	662
3487	Выбор классификатора:	Случайный классификатор	5	662
4409	Число деревьев:	100	0	692
8565	Начальное значение (Seed)	1	13	8551
8568	Количество нейронов во входном слое:	33	0	8567
8569	Количество нейронов в выходном слое:	2	1	8567
8570	Количество скрытых слоев:	2	2	8567
8571	Структура скрытого слоя:	3,2	3	8567
8572	Максимальное число итераций:	1000000	4	8567
8573	Допустимая ошибка:	0,00001	5	8567
8574	Активационная функция нейронов скрытого слоя:	Функция SoftSign	6	8567
8575	Формула активационной функции нейронов скрытого слоя:	f(S)=1,8418*S/(1+|S|)	7	8567
8576	Активационная функция нейронов выходного слоя:	Логистическая	8	8567
8577	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	8567
8578	Алгоритм обучения:	BackPropagation	10	8567
8579	Коэффициент скорости обучения:	0,1	11	8567
8580	Коэффициент момента:	0,2	12	8567
8581	Начальное значение (Seed)	1	13	8567
8584	Число деревьев:	10	0	8583
8585	Минимальное число объектов в листе:	2	1	8583
8586	Максиальная глубина дерева:	0	2	8583
8587	Число случайных атрибутов:	17	3	8583
8588	Алгоритм построения дерева решений:	ID3	4	8583
8589	Число потоков	4	5	8583
8590	Начальное значение (Seed)	1	6	8583
8591	Число случайных расщеплений атрибута:	9	7	8583
8592	Формирование обучающих выборок:	Исходное обучающее множество	8	8583
8595	Число деревьев:	50	0	8594
8596	Минимальное число объектов в листе:	2	1	8594
8597	Максиальная глубина дерева:	0	2	8594
8598	Число случайных атрибутов:	32	3	8594
8599	Алгоритм построения дерева решений:	C45	4	8594
8600	Число потоков	4	5	8594
8601	Начальное значение (Seed)	1	6	8594
8602	Число случайных расщеплений атрибута:	3	7	8594
8603	Формирование обучающих выборок:	Исходное обучающее множество	8	8594
8606	Число деревьев:	100	0	8605
8607	Минимальное число объектов в листе:	2	1	8605
8608	Максиальная глубина дерева:	0	2	8605
8609	Число случайных атрибутов:	29	3	8605
8610	Алгоритм построения дерева решений:	CHAID	4	8605
8611	Число потоков	4	5	8605
8612	Начальное значение (Seed)	1	6	8605
8613	Число случайных расщеплений атрибута:	12	7	8605
8614	Формирование обучающих выборок:	Бутстрэп-выборки	8	8605
8617	Число деревьев:	75	0	8616
8618	Минимальное число объектов в листе:	2	1	8616
8619	Максиальная глубина дерева:	0	2	8616
8620	Число случайных атрибутов:	29	3	8616
8621	Алгоритм построения дерева решений:	CHAID	4	8616
8622	Число потоков	4	5	8616
8623	Начальное значение (Seed)	1	6	8616
4518	Алгоритм построения дерева решений:	CART	4	642
3488	Базовый классификатор 0:	Logistic	6	662
3275	Минимальное число объектов в листе:	2	0	663
3276	Максиальная глубина дерева:	0	1	663
8624	Число случайных расщеплений атрибута:	8	7	8616
8625	Формирование обучающих выборок:	Бутстрэп-выборки	8	8616
8628	Число деревьев:	75	0	8627
8629	Минимальное число объектов в листе:	2	1	8627
8630	Максиальная глубина дерева:	0	2	8627
8631	Число случайных атрибутов:	22	3	8627
8632	Алгоритм построения дерева решений:	CART	4	8627
8633	Число потоков	4	5	8627
8634	Начальное значение (Seed)	1	6	8627
8635	Число случайных расщеплений атрибута:	6	7	8627
8636	Формирование обучающих выборок:	Бутстрэп-выборки	8	8627
8639	Число деревьев:	25	0	8638
8640	Минимальное число объектов в листе:	2	1	8638
8641	Максиальная глубина дерева:	0	2	8638
8642	Число случайных атрибутов:	6	3	8638
8643	Алгоритм построения дерева решений:	C45	4	8638
8644	Число потоков	4	5	8638
8645	Начальное значение (Seed)	1	6	8638
8646	Число случайных расщеплений атрибута:	12	7	8638
8647	Формирование обучающих выборок:	Исходное обучающее множество	8	8638
8650	Число деревьев:	50	0	8649
8651	Минимальное число объектов в листе:	2	1	8649
8652	Максиальная глубина дерева:	0	2	8649
8653	Число случайных атрибутов:	12	3	8649
8654	Алгоритм построения дерева решений:	ID3	4	8649
8655	Число потоков	4	5	8649
8656	Начальное значение (Seed)	1	6	8649
8657	Число случайных расщеплений атрибута:	16	7	8649
8658	Формирование обучающих выборок:	Бутстрэп-выборки	8	8649
8661	Число деревьев:	100	0	8660
8662	Минимальное число объектов в листе:	2	1	8660
8663	Максиальная глубина дерева:	0	2	8660
8664	Число случайных атрибутов:	18	3	8660
8665	Алгоритм построения дерева решений:	ID3	4	8660
8666	Число потоков	4	5	8660
8667	Начальное значение (Seed)	1	6	8660
8668	Число случайных расщеплений атрибута:	7	7	8660
8669	Формирование обучающих выборок:	Бутстрэп-выборки	8	8660
8672	Число деревьев:	100	0	8671
8673	Минимальное число объектов в листе:	2	1	8671
8674	Максиальная глубина дерева:	0	2	8671
8675	Число случайных атрибутов:	6	3	8671
8676	Алгоритм построения дерева решений:	CHAID	4	8671
8677	Число потоков	4	5	8671
8678	Начальное значение (Seed)	1	6	8671
8762	Число потоков	4	6	8755
8679	Число случайных расщеплений атрибута:	15	7	8671
8680	Формирование обучающих выборок:	Бутстрэп-выборки	8	8671
8683	Число деревьев:	75	0	8682
8684	Минимальное число объектов в листе:	2	1	8682
8685	Максиальная глубина дерева:	0	2	8682
8686	Число случайных атрибутов:	16	3	8682
8687	Алгоритм построения дерева решений:	CHAID	4	8682
8688	Число потоков	4	5	8682
8689	Начальное значение (Seed)	1	6	8682
8690	Число случайных расщеплений атрибута:	6	7	8682
8691	Формирование обучающих выборок:	Исходное обучающее множество	8	8682
3277	Случайное дерево:	false	2	663
3278	Бинарное дерево:	true	3	663
8694	Число ближайших соседей:	505	0	8693
3279	Использование случайных расщеплений атрибута:	false	4	663
5209	Минимальное число объектов в листе:	2	0	664
5210	Максиальная глубина дерева:	0	1	664
5211	Случайное дерево:	false	2	664
8695	Вес ближайшего соседа:	0,9584	1	8693
8696	Функция расстояния:	Манхеттенское расстояние	2	8693
8699	Число ближайших соседей:	436	0	8698
8700	Вес ближайшего соседа:	0,9715	1	8698
8701	Функция расстояния:	Квадрат Евклидова расстояния	2	8698
8704	Число ближайших соседей:	758	0	8703
8705	Вес ближайшего соседа:	0,978	1	8703
8706	Функция расстояния:	Квадрат Евклидова расстояния	2	8703
8709	Число ближайших соседей:	209	0	8708
8710	Вес ближайшего соседа:	0,8608	1	8708
8711	Функция расстояния:	Евкилидово расстояние	2	8708
8714	Число ближайших соседей:	696	0	8713
8715	Вес ближайшего соседа:	0,8543	1	8713
8716	Функция расстояния:	Квадрат Евклидова расстояния	2	8713
8719	Число итераций:	25	0	8718
8720	Минимальная допустимая ошибка классификатора:	0	1	8718
8721	Максимальная допустимая ошибка классификатора:	0,5	2	8718
8722	Метод голосования:	Метод взвешенного голосования	3	8718
8723	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	8718
8724	Выбор классификатора:	Случайный классификатор	5	8718
8725	Число потоков	4	6	8718
8726	Начальное значение (Seed)	1	7	8718
8727	Базовый классификатор 0:	NeuralNetwork	8	8718
8728	Базовый классификатор 1:	Logistic	9	8718
8731	Число итераций:	25	0	8730
8732	Минимальная допустимая ошибка классификатора:	0	1	8730
8733	Максимальная допустимая ошибка классификатора:	0,5	2	8730
8734	Метод голосования:	Метод большинства голосов	3	8730
8735	Формирование обучающих выборок:	Бутстрэп выборки	4	8730
8736	Выбор классификатора:	Случайный классификатор	5	8730
8737	Число потоков	4	6	8730
8738	Начальное значение (Seed)	1	7	8730
8739	Базовый классификатор 0:	NeuralNetwork	8	8730
8740	Базовый классификатор 1:	NeuralNetwork	9	8730
8741	Базовый классификатор 2:	NeuralNetwork	10	8730
8744	Число итераций:	25	0	8743
8745	Минимальная допустимая ошибка классификатора:	0	1	8743
8746	Максимальная допустимая ошибка классификатора:	0,5	2	8743
8747	Метод голосования:	Метод взвешенного голосования	3	8743
8748	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	8743
8749	Выбор классификатора:	Оптимальный классификатор	5	8743
8750	Число потоков	4	6	8743
8751	Начальное значение (Seed)	1	7	8743
8752	Базовый классификатор 0:	Logistic	8	8743
8753	Базовый классификатор 1:	NeuralNetwork	9	8743
8756	Число итераций:	25	0	8755
8757	Минимальная допустимая ошибка классификатора:	0	1	8755
8758	Максимальная допустимая ошибка классификатора:	0,5	2	8755
8759	Метод голосования:	Метод большинства голосов	3	8755
8760	Формирование обучающих выборок:	Случайные подвыборки	4	8755
8761	Выбор классификатора:	Случайный классификатор	5	8755
5212	Бинарное дерево:	true	3	664
5213	Использование случайных расщеплений атрибута:	false	4	664
6553	Бинарное дерево:	false	3	667
6554	Использование случайных расщеплений атрибута:	false	4	667
6062	Бинарное дерево:	true	3	668
8763	Начальное значение (Seed)	1	7	8755
8764	Базовый классификатор 0:	NeuralNetwork	8	8755
8765	Базовый классификатор 1:	Logistic	9	8755
8766	Базовый классификатор 2:	NeuralNetwork	10	8755
8769	Число итераций:	25	0	8768
8770	Минимальная допустимая ошибка классификатора:	0	1	8768
8771	Максимальная допустимая ошибка классификатора:	0,5	2	8768
8772	Метод голосования:	Метод большинства голосов	3	8768
8773	Формирование обучающих выборок:	Случайные подвыборки	4	8768
8774	Выбор классификатора:	Случайный классификатор	5	8768
8775	Число потоков	4	6	8768
8776	Начальное значение (Seed)	1	7	8768
8777	Базовый классификатор 0:	NeuralNetwork	8	8768
8778	Базовый классификатор 1:	NeuralNetwork	9	8768
8779	Базовый классификатор 2:	NeuralNetwork	10	8768
8782	Число итераций:	25	0	8781
8783	Минимальная допустимая ошибка классификатора:	0	1	8781
8784	Максимальная допустимая ошибка классификатора:	0,5	2	8781
8785	Начальное значение (Seed)	1	3	8781
8786	Базовый классификатор 0:	Logistic	4	8781
8789	Число итераций:	25	0	8788
8790	Минимальная допустимая ошибка классификатора:	0	1	8788
8791	Максимальная допустимая ошибка классификатора:	0,5	2	8788
8792	Начальное значение (Seed)	1	3	8788
8793	Базовый классификатор 0:	NeuralNetwork	4	8788
8796	Число итераций:	25	0	8795
8797	Минимальная допустимая ошибка классификатора:	0	1	8795
8798	Максимальная допустимая ошибка классификатора:	0,5	2	8795
8799	Начальное значение (Seed)	1	3	8795
8800	Базовый классификатор 0:	Logistic	4	8795
8801	Базовый классификатор 1:	NeuralNetwork	5	8795
8804	Число итераций:	25	0	8803
8805	Минимальная допустимая ошибка классификатора:	0	1	8803
8806	Максимальная допустимая ошибка классификатора:	0,5	2	8803
8807	Начальное значение (Seed)	1	3	8803
8808	Базовый классификатор 0:	NeuralNetwork	4	8803
8809	Базовый классификатор 1:	NeuralNetwork	5	8803
8812	Число итераций:	25	0	8811
8813	Минимальная допустимая ошибка классификатора:	0	1	8811
8814	Максимальная допустимая ошибка классификатора:	0,5	2	8811
8815	Начальное значение (Seed)	1	3	8811
8816	Базовый классификатор 0:	NeuralNetwork	4	8811
8819	Число итераций:	10	0	8818
8820	Минимальная допустимая ошибка классификатора:	0	1	8818
8821	Максимальная допустимая ошибка классификатора:	0,5	2	8818
8822	Метод голосования:	Метод взвешенного голосования	3	8818
8823	Формирование обучающих выборок:	Бутстрэп выборки	4	8818
8824	Выбор классификатора:	Случайный классификатор	5	8818
8825	Число потоков	4	6	8818
8826	Начальное значение (Seed)	1	7	8818
8827	Базовый классификатор 0:	Logistic	8	8818
8828	Базовый классификатор 1:	KNearestNeighbours	9	8818
8831	Число итераций:	10	0	8830
8832	Минимальная допустимая ошибка классификатора:	0	1	8830
8833	Максимальная допустимая ошибка классификатора:	0,5	2	8830
8834	Метод голосования:	Метод взвешенного голосования	3	8830
4514	Число деревьев:	10	0	642
4515	Минимальное число объектов в листе:	2	1	642
8835	Формирование обучающих выборок:	Бутстрэп выборки	4	8830
8836	Выбор классификатора:	Случайный классификатор	5	8830
8837	Число потоков	4	6	8830
8838	Начальное значение (Seed)	1	7	8830
8839	Базовый классификатор 0:	Logistic	8	8830
8840	Базовый классификатор 1:	KNearestNeighbours	9	8830
8843	Число итераций:	10	0	8842
9015	Начальное значение (Seed)	1	6	9008
8844	Минимальная допустимая ошибка классификатора:	0	1	8842
8845	Максимальная допустимая ошибка классификатора:	0,5	2	8842
8846	Метод голосования:	Метод взвешенного голосования	3	8842
8847	Формирование обучающих выборок:	Использование исходной выборки	4	8842
8848	Выбор классификатора:	Оптимальный классификатор	5	8842
8849	Число потоков	4	6	8842
8850	Начальное значение (Seed)	1	7	8842
8851	Базовый классификатор 0:	Logistic	8	8842
8854	Число итераций:	10	0	8853
8855	Минимальная допустимая ошибка классификатора:	0	1	8853
8856	Максимальная допустимая ошибка классификатора:	0,5	2	8853
8857	Метод голосования:	Метод взвешенного голосования	3	8853
8858	Формирование обучающих выборок:	Использование исходной выборки	4	8853
8859	Выбор классификатора:	Случайный классификатор	5	8853
8860	Число потоков	4	6	8853
8861	Начальное значение (Seed)	1	7	8853
8862	Базовый классификатор 0:	Logistic	8	8853
8865	Число итераций:	10	0	8864
8866	Минимальная допустимая ошибка классификатора:	0	1	8864
8867	Максимальная допустимая ошибка классификатора:	0,5	2	8864
8868	Метод голосования:	Метод большинства голосов	3	8864
8869	Формирование обучающих выборок:	Случайные подвыборки	4	8864
8870	Выбор классификатора:	Оптимальный классификатор	5	8864
8871	Число потоков	4	6	8864
8872	Начальное значение (Seed)	1	7	8864
8873	Базовый классификатор 0:	Logistic	8	8864
8874	Базовый классификатор 1:	KNearestNeighbours	9	8864
8875	Базовый классификатор 2:	NeuralNetwork	10	8864
8878	Число итераций:	25	0	8877
8879	Минимальная допустимая ошибка классификатора:	0	1	8877
8880	Максимальная допустимая ошибка классификатора:	0,5	2	8877
8881	Начальное значение (Seed)	1	3	8877
8882	Базовый классификатор 0:	NeuralNetwork	4	8877
8885	Число итераций:	25	0	8884
8886	Минимальная допустимая ошибка классификатора:	0	1	8884
8887	Максимальная допустимая ошибка классификатора:	0,5	2	8884
8888	Начальное значение (Seed)	1	3	8884
8889	Базовый классификатор 0:	J48	4	8884
8890	Базовый классификатор 1:	NeuralNetwork	5	8884
8893	Число итераций:	25	0	8892
8894	Минимальная допустимая ошибка классификатора:	0	1	8892
8895	Максимальная допустимая ошибка классификатора:	0,5	2	8892
8896	Начальное значение (Seed)	1	3	8892
8897	Базовый классификатор 0:	J48	4	8892
8898	Базовый классификатор 1:	NeuralNetwork	5	8892
8899	Базовый классификатор 2:	KNearestNeighbours	6	8892
8902	Число итераций:	25	0	8901
8903	Минимальная допустимая ошибка классификатора:	0	1	8901
6063	Использование случайных расщеплений атрибута:	false	4	668
3962	Минимальное число объектов в листе:	2	0	669
3963	Максиальная глубина дерева:	0	1	669
3964	Случайное дерево:	false	2	669
4569	Число потоков	1	5	799
8904	Максимальная допустимая ошибка классификатора:	0,5	2	8901
8905	Начальное значение (Seed)	1	3	8901
8906	Базовый классификатор 0:	NeuralNetwork	4	8901
8909	Число итераций:	25	0	8908
8910	Минимальная допустимая ошибка классификатора:	0	1	8908
8911	Максимальная допустимая ошибка классификатора:	0,5	2	8908
8912	Начальное значение (Seed)	1	3	8908
8913	Базовый классификатор 0:	NeuralNetwork	4	8908
8914	Базовый классификатор 1:	NeuralNetwork	5	8908
8915	Базовый классификатор 2:	KNearestNeighbours	6	8908
8918	Минимальное число объектов в листе:	4	0	8917
8919	Максиальная глубина дерева:	0	1	8917
8920	Случайное дерево:	false	2	8917
8921	Бинарное дерево:	true	3	8917
8922	Использование случайных расщеплений атрибута:	false	4	8917
8923	Начальное значение (Seed)	1	5	8917
9177	Начальное значение (Seed)	1	2	9174
8926	Минимальное число объектов в листе:	5	0	8925
8927	Максиальная глубина дерева:	0	1	8925
8928	Случайное дерево:	false	2	8925
8929	Бинарное дерево:	true	3	8925
8930	Использование случайных расщеплений атрибута:	false	4	8925
8931	Начальное значение (Seed)	1	5	8925
8934	Минимальное число объектов в листе:	5	0	8933
8935	Максиальная глубина дерева:	0	1	8933
8936	Случайное дерево:	false	2	8933
8937	Бинарное дерево:	true	3	8933
8938	Использование случайных расщеплений атрибута:	false	4	8933
8939	Начальное значение (Seed)	1	5	8933
8942	Минимальное число объектов в листе:	3	0	8941
8943	Максиальная глубина дерева:	6	1	8941
8944	Случайное дерево:	false	2	8941
8945	Бинарное дерево:	true	3	8941
8946	Использование случайных расщеплений атрибута:	false	4	8941
8947	Начальное значение (Seed)	1	5	8941
8950	Минимальное число объектов в листе:	6	0	8949
8951	Максиальная глубина дерева:	6	1	8949
8952	Случайное дерево:	false	2	8949
8953	Бинарное дерево:	true	3	8949
8954	Использование случайных расщеплений атрибута:	false	4	8949
8955	Начальное значение (Seed)	1	5	8949
8958	Число деревьев:	33	0	8957
8959	Минимальное число объектов в листе:	3	1	8957
8960	Максиальная глубина дерева:	0	2	8957
8961	Число случайных атрибутов:	8	3	8957
8962	Алгоритм построения дерева решений:	CART	4	8957
8963	Число потоков	4	5	8957
8964	Начальное значение (Seed)	1	6	8957
8965	Число случайных расщеплений атрибута:	22	7	8957
8966	Формирование обучающих выборок:	Исходное обучающее множество	8	8957
8969	Число деревьев:	44	0	8968
8970	Минимальное число объектов в листе:	4	1	8968
8971	Максиальная глубина дерева:	7	2	8968
8972	Число случайных атрибутов:	3	3	8968
8973	Алгоритм построения дерева решений:	C45	4	8968
8974	Число потоков	4	5	8968
8975	Начальное значение (Seed)	1	6	8968
4597	Максимальное число итераций:	500	0	651
4598	Метод поиска минимума:	Квазиньютоновский метод	1	651
3965	Бинарное дерево:	true	3	669
3966	Использование случайных расщеплений атрибута:	false	4	669
8978	Число деревьев:	15	0	8977
8979	Минимальное число объектов в листе:	7	1	8977
8980	Максиальная глубина дерева:	6	2	8977
8981	Число случайных атрибутов:	9	3	8977
8982	Алгоритм построения дерева решений:	ID3	4	8977
8983	Число потоков	4	5	8977
8984	Начальное значение (Seed)	1	6	8977
8985	Число случайных расщеплений атрибута:	6	7	8977
8986	Формирование обучающих выборок:	Исходное обучающее множество	8	8977
8989	Число деревьев:	11	0	8988
8990	Минимальное число объектов в листе:	4	1	8988
8991	Максиальная глубина дерева:	0	2	8988
8992	Число случайных атрибутов:	7	3	8988
8993	Алгоритм построения дерева решений:	CART	4	8988
8994	Число потоков	4	5	8988
8995	Начальное значение (Seed)	1	6	8988
8998	Число деревьев:	19	0	8997
8999	Минимальное число объектов в листе:	4	1	8997
9000	Максиальная глубина дерева:	6	2	8997
9001	Число случайных атрибутов:	5	3	8997
9002	Алгоритм построения дерева решений:	C45	4	8997
9003	Число потоков	4	5	8997
9004	Начальное значение (Seed)	1	6	8997
9005	Число случайных расщеплений атрибута:	16	7	8997
9006	Формирование обучающих выборок:	Исходное обучающее множество	8	8997
9009	Число деревьев:	22	0	9008
9010	Минимальное число объектов в листе:	2	1	9008
9011	Максиальная глубина дерева:	7	2	9008
9012	Число случайных атрибутов:	6	3	9008
9013	Алгоритм построения дерева решений:	ID3	4	9008
9014	Число потоков	4	5	9008
9016	Число случайных расщеплений атрибута:	7	7	9008
9017	Формирование обучающих выборок:	Исходное обучающее множество	8	9008
9020	Число деревьев:	40	0	9019
9021	Минимальное число объектов в листе:	2	1	9019
9022	Максиальная глубина дерева:	7	2	9019
9023	Число случайных атрибутов:	6	3	9019
9024	Алгоритм построения дерева решений:	CART	4	9019
9025	Число потоков	4	5	9019
9026	Начальное значение (Seed)	1	6	9019
9027	Число случайных расщеплений атрибута:	36	7	9019
9028	Формирование обучающих выборок:	Бутстрэп-выборки	8	9019
9031	Число деревьев:	46	0	9030
9032	Минимальное число объектов в листе:	2	1	9030
9033	Максиальная глубина дерева:	0	2	9030
9034	Число случайных атрибутов:	4	3	9030
9035	Алгоритм построения дерева решений:	CART	4	9030
9036	Число потоков	4	5	9030
9037	Начальное значение (Seed)	1	6	9030
9038	Число случайных расщеплений атрибута:	21	7	9030
9039	Формирование обучающих выборок:	Исходное обучающее множество	8	9030
9042	Число деревьев:	11	0	9041
9043	Минимальное число объектов в листе:	3	1	9041
9044	Максиальная глубина дерева:	6	2	9041
9045	Число случайных атрибутов:	9	3	9041
9046	Алгоритм построения дерева решений:	CART	4	9041
9047	Число потоков	4	5	9041
9048	Начальное значение (Seed)	1	6	9041
9051	Число деревьев:	25	0	9050
9052	Минимальное число объектов в листе:	3	1	9050
9053	Максиальная глубина дерева:	7	2	9050
9054	Число случайных атрибутов:	5	3	9050
9055	Алгоритм построения дерева решений:	ID3	4	9050
9056	Число потоков	4	5	9050
9057	Начальное значение (Seed)	1	6	9050
9058	Число случайных расщеплений атрибута:	16	7	9050
5441	Минимальное число объектов в листе:	2	0	670
5442	Максиальная глубина дерева:	0	1	670
5443	Случайное дерево:	false	2	670
9059	Формирование обучающих выборок:	Исходное обучающее множество	8	9050
9062	Число деревьев:	18	0	9061
9063	Минимальное число объектов в листе:	3	1	9061
9064	Максиальная глубина дерева:	0	2	9061
9065	Число случайных атрибутов:	1	3	9061
9066	Алгоритм построения дерева решений:	ID3	4	9061
9067	Число потоков	4	5	9061
9068	Начальное значение (Seed)	1	6	9061
9071	Число деревьев:	47	0	9070
9072	Минимальное число объектов в листе:	2	1	9070
9073	Максиальная глубина дерева:	0	2	9070
9074	Число случайных атрибутов:	1	3	9070
9075	Алгоритм построения дерева решений:	ID3	4	9070
9076	Число потоков	4	5	9070
9077	Начальное значение (Seed)	1	6	9070
9078	Число случайных расщеплений атрибута:	4	7	9070
9079	Формирование обучающих выборок:	Исходное обучающее множество	8	9070
9082	Число деревьев:	18	0	9081
9083	Минимальное число объектов в листе:	8	1	9081
9084	Максиальная глубина дерева:	0	2	9081
9085	Число случайных атрибутов:	2	3	9081
9086	Алгоритм построения дерева решений:	C45	4	9081
9087	Число потоков	4	5	9081
9088	Начальное значение (Seed)	1	6	9081
9091	Число деревьев:	29	0	9090
9092	Минимальное число объектов в листе:	10	1	9090
9093	Максиальная глубина дерева:	0	2	9090
9094	Число случайных атрибутов:	4	3	9090
9095	Алгоритм построения дерева решений:	CART	4	9090
9096	Число потоков	4	5	9090
9097	Начальное значение (Seed)	1	6	9090
9098	Число случайных расщеплений атрибута:	1	7	9090
9099	Формирование обучающих выборок:	Исходное обучающее множество	8	9090
9102	Число деревьев:	49	0	9101
9103	Минимальное число объектов в листе:	10	1	9101
9104	Максиальная глубина дерева:	0	2	9101
9105	Число случайных атрибутов:	4	3	9101
9106	Алгоритм построения дерева решений:	CHAID	4	9101
9107	Число потоков	4	5	9101
9108	Начальное значение (Seed)	1	6	9101
9109	Число случайных расщеплений атрибута:	16	7	9101
9110	Формирование обучающих выборок:	Исходное обучающее множество	8	9101
9113	Число итераций:	25	0	9112
9114	Минимальная допустимая ошибка классификатора:	0	1	9112
9115	Максимальная допустимая ошибка классификатора:	0,5	2	9112
9116	Метод голосования:	Метод взвешенного голосования	3	9112
9117	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	9112
9118	Выбор классификатора:	Случайный классификатор	5	9112
9119	Число потоков	4	6	9112
4733	Минимальное число объектов в листе:	2	0	643
4734	Максиальная глубина дерева:	0	1	643
4735	Случайное дерево:	false	2	643
4736	Бинарное дерево:	false	3	643
4737	Использование случайных расщеплений атрибута:	false	4	643
5444	Бинарное дерево:	true	3	670
5445	Использование случайных расщеплений атрибута:	false	4	670
6766	Бинарное дерево:	true	3	671
5287	Число потоков	4	5	928
9120	Начальное значение (Seed)	1	7	9112
9121	Базовый классификатор 0:	J48	8	9112
9122	Базовый классификатор 1:	NeuralNetwork	9	9112
9123	Базовый классификатор 2:	NeuralNetwork	10	9112
9124	Базовый классификатор 3:	KNearestNeighbours	11	9112
9127	Число итераций:	25	0	9126
9128	Минимальная допустимая ошибка классификатора:	0	1	9126
9129	Максимальная допустимая ошибка классификатора:	0,5	2	9126
9130	Метод голосования:	Метод взвешенного голосования	3	9126
9131	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	9126
9132	Выбор классификатора:	Случайный классификатор	5	9126
9133	Число потоков	4	6	9126
9134	Начальное значение (Seed)	1	7	9126
9135	Базовый классификатор 0:	J48	8	9126
9136	Базовый классификатор 1:	NeuralNetwork	9	9126
9139	Число итераций:	25	0	9138
9140	Минимальная допустимая ошибка классификатора:	0	1	9138
9141	Максимальная допустимая ошибка классификатора:	0,5	2	9138
9142	Метод голосования:	Метод большинства голосов	3	9138
9143	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	9138
9144	Выбор классификатора:	Случайный классификатор	5	9138
9145	Число потоков	4	6	9138
9146	Начальное значение (Seed)	1	7	9138
9147	Базовый классификатор 0:	J48	8	9138
9148	Базовый классификатор 1:	NeuralNetwork	9	9138
9151	Число итераций:	25	0	9150
9152	Минимальная допустимая ошибка классификатора:	0	1	9150
9153	Максимальная допустимая ошибка классификатора:	0,5	2	9150
9154	Метод голосования:	Метод большинства голосов	3	9150
9155	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	9150
9156	Выбор классификатора:	Случайный классификатор	5	9150
9157	Число потоков	4	6	9150
9158	Начальное значение (Seed)	1	7	9150
9159	Базовый классификатор 0:	J48	8	9150
9160	Базовый классификатор 1:	NeuralNetwork	9	9150
9163	Число итераций:	25	0	9162
9164	Минимальная допустимая ошибка классификатора:	0	1	9162
9165	Максимальная допустимая ошибка классификатора:	0,5	2	9162
9166	Метод голосования:	Метод взвешенного голосования	3	9162
9167	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	9162
9168	Выбор классификатора:	Случайный классификатор	5	9162
9169	Число потоков	4	6	9162
9170	Начальное значение (Seed)	1	7	9162
9171	Базовый классификатор 0:	NeuralNetwork	8	9162
9172	Базовый классификатор 1:	KNearestNeighbours	9	9162
9175	Мета-классификатор:	NeuralNetwork	0	9174
9176	Метод формирования мета-признаков:	Использование обучающего множества	1	9174
9178	Базовый классификатор 0:	J48	3	9174
9181	Мета-классификатор:	NeuralNetwork	0	9180
9182	Метод формирования мета-признаков:	Использование обучающего множества	1	9180
9183	Начальное значение (Seed)	1	2	9180
9184	Базовый классификатор 0:	J48	3	9180
9187	Мета-классификатор:	KNearestNeighbours	0	9186
9188	Метод формирования мета-признаков:	Использование обучающего множества	1	9186
9189	Начальное значение (Seed)	1	2	9186
9190	Базовый классификатор 0:	J48	3	9186
9193	Мета-классификатор:	J48	0	9192
11480	Функция расстояния:	Манхеттенское расстояние	2	11477
11483	Число ближайших соседей:	225	0	11482
11484	Вес ближайшего соседа:	0,5455	1	11482
6767	Использование случайных расщеплений атрибута:	false	4	671
6725	Базовый классификатор 3:	NeuralNetwork	5	672
6780	Максимальное число итераций:	500	0	673
9194	Метод формирования мета-признаков:	Использование обучающего множества	1	9192
9195	Начальное значение (Seed)	1	2	9192
9196	Базовый классификатор 0:	J48	3	9192
9199	Мета-классификатор:	KNearestNeighbours	0	9198
9200	Метод формирования мета-признаков:	Использование обучающего множества	1	9198
9201	Начальное значение (Seed)	1	2	9198
9202	Базовый классификатор 0:	NeuralNetwork	3	9198
9203	Базовый классификатор 1:	NeuralNetwork	4	9198
9206	Число итераций:	25	0	9205
9207	Минимальная допустимая ошибка классификатора:	0	1	9205
9208	Максимальная допустимая ошибка классификатора:	0,5	2	9205
9209	Метод голосования:	Метод взвешенного голосования	3	9205
9210	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	9205
9211	Выбор классификатора:	Оптимальный классификатор	5	9205
9212	Число потоков	4	6	9205
9213	Начальное значение (Seed)	1	7	9205
9214	Базовый классификатор 0:	NeuralNetwork	8	9205
9215	Базовый классификатор 1:	KNearestNeighbours	9	9205
9218	Число итераций:	25	0	9217
9219	Минимальная допустимая ошибка классификатора:	0	1	9217
9220	Максимальная допустимая ошибка классификатора:	0,5	2	9217
9221	Метод голосования:	Метод взвешенного голосования	3	9217
9222	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	9217
9223	Выбор классификатора:	Оптимальный классификатор	5	9217
9224	Число потоков	4	6	9217
9225	Начальное значение (Seed)	1	7	9217
9226	Базовый классификатор 0:	NeuralNetwork	8	9217
9227	Базовый классификатор 1:	NeuralNetwork	9	9217
9228	Базовый классификатор 2:	KNearestNeighbours	10	9217
9231	Число итераций:	25	0	9230
9232	Минимальная допустимая ошибка классификатора:	0	1	9230
9233	Максимальная допустимая ошибка классификатора:	0,5	2	9230
9234	Метод голосования:	Метод взвешенного голосования	3	9230
9235	Формирование обучающих выборок:	Использование исходной выборки	4	9230
9236	Выбор классификатора:	Случайный классификатор	5	9230
9237	Число потоков	4	6	9230
9238	Начальное значение (Seed)	1	7	9230
9239	Базовый классификатор 0:	J48	8	9230
9240	Базовый классификатор 1:	NeuralNetwork	9	9230
9243	Число итераций:	25	0	9242
9244	Минимальная допустимая ошибка классификатора:	0	1	9242
9245	Максимальная допустимая ошибка классификатора:	0,5	2	9242
9246	Метод голосования:	Метод большинства голосов	3	9242
9247	Формирование обучающих выборок:	Использование исходной выборки	4	9242
9248	Выбор классификатора:	Случайный классификатор	5	9242
9249	Число потоков	4	6	9242
9250	Начальное значение (Seed)	1	7	9242
9251	Базовый классификатор 0:	J48	8	9242
9252	Базовый классификатор 1:	NeuralNetwork	9	9242
9255	Число итераций:	25	0	9254
9256	Минимальная допустимая ошибка классификатора:	0	1	9254
9400	Алгоритм обучения:	BackPropagation	10	9389
6781	Метод поиска минимума:	Квазиньютоновский метод	1	673
5138	Минимальное число объектов в листе:	2	0	674
5139	Максиальная глубина дерева:	0	1	674
4862	Число потоков	4	5	739
9257	Максимальная допустимая ошибка классификатора:	0,5	2	9254
9258	Метод голосования:	Метод взвешенного голосования	3	9254
9259	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	9254
9260	Выбор классификатора:	Оптимальный классификатор	5	9254
9261	Число потоков	4	6	9254
9262	Начальное значение (Seed)	1	7	9254
9263	Базовый классификатор 0:	NeuralNetwork	8	9254
9264	Базовый классификатор 1:	NeuralNetwork	9	9254
9267	Число итераций:	25	0	9266
9268	Минимальная допустимая ошибка классификатора:	0	1	9266
9269	Максимальная допустимая ошибка классификатора:	0,5	2	9266
9270	Метод голосования:	Метод большинства голосов	3	9266
9271	Формирование обучающих выборок:	Бутстрэп выборки	4	9266
9272	Выбор классификатора:	Случайный классификатор	5	9266
9273	Число потоков	4	6	9266
9274	Начальное значение (Seed)	1	7	9266
9275	Базовый классификатор 0:	J48	8	9266
9276	Базовый классификатор 1:	J48	9	9266
9277	Базовый классификатор 2:	J48	10	9266
9280	Число итераций:	25	0	9279
9281	Минимальная допустимая ошибка классификатора:	0	1	9279
9282	Максимальная допустимая ошибка классификатора:	0,5	2	9279
9283	Метод голосования:	Метод большинства голосов	3	9279
9284	Формирование обучающих выборок:	Бутстрэп выборки	4	9279
9285	Выбор классификатора:	Случайный классификатор	5	9279
9286	Число потоков	4	6	9279
9287	Начальное значение (Seed)	1	7	9279
9288	Базовый классификатор 0:	J48	8	9279
9289	Базовый классификатор 1:	J48	9	9279
9290	Базовый классификатор 2:	J48	10	9279
9293	Число итераций:	25	0	9292
9294	Минимальная допустимая ошибка классификатора:	0	1	9292
9295	Максимальная допустимая ошибка классификатора:	0,5	2	9292
9296	Метод голосования:	Метод большинства голосов	3	9292
9297	Формирование обучающих выборок:	Случайные подвыборки	4	9292
9298	Выбор классификатора:	Оптимальный классификатор	5	9292
9299	Число потоков	4	6	9292
9300	Начальное значение (Seed)	1	7	9292
9301	Базовый классификатор 0:	J48	8	9292
9304	Число итераций:	25	0	9303
9305	Минимальная допустимая ошибка классификатора:	0	1	9303
9306	Максимальная допустимая ошибка классификатора:	0,5	2	9303
9307	Метод голосования:	Метод большинства голосов	3	9303
9308	Формирование обучающих выборок:	Случайные подвыборки	4	9303
9309	Выбор классификатора:	Случайный классификатор	5	9303
9310	Число потоков	4	6	9303
9311	Начальное значение (Seed)	1	7	9303
9312	Базовый классификатор 0:	J48	8	9303
9315	Число итераций:	25	0	9314
9316	Минимальная допустимая ошибка классификатора:	0	1	9314
9317	Максимальная допустимая ошибка классификатора:	0,5	2	9314
9318	Метод голосования:	Метод большинства голосов	3	9314
9319	Формирование обучающих выборок:	Случайные подвыборки	4	9314
9320	Выбор классификатора:	Случайный классификатор	5	9314
9321	Число потоков	4	6	9314
9322	Начальное значение (Seed)	1	7	9314
9323	Базовый классификатор 0:	J48	8	9314
9326	Количество нейронов во входном слое:	9	0	9325
9327	Количество нейронов в выходном слое:	2	1	9325
9328	Количество скрытых слоев:	1	2	9325
9329	Структура скрытого слоя:	47	3	9325
9330	Максимальное число итераций:	1000000	4	9325
9331	Допустимая ошибка:	0,00001	5	9325
9332	Активационная функция нейронов скрытого слоя:	Функция SoftSign	6	9325
9333	Формула активационной функции нейронов скрытого слоя:	f(S)=3,9044*S/(1+|S|)	7	9325
9334	Активационная функция нейронов выходного слоя:	Логистическая	8	9325
9335	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	9325
9336	Алгоритм обучения:	BackPropagation	10	9325
9337	Коэффициент скорости обучения:	0,1	11	9325
9338	Коэффициент момента:	0,2	12	9325
9339	Начальное значение (Seed)	1	13	9325
9342	Количество нейронов во входном слое:	9	0	9341
9343	Количество нейронов в выходном слое:	2	1	9341
9344	Количество скрытых слоев:	2	2	9341
9345	Структура скрытого слоя:	40,20	3	9341
9346	Максимальное число итераций:	1000000	4	9341
9347	Допустимая ошибка:	0,00001	5	9341
9348	Активационная функция нейронов скрытого слоя:	Гиперболический тангенс	6	9341
9349	Формула активационной функции нейронов скрытого слоя:	f(S)=(exp(4,2524*S)-exp(-4,2524*S))/(exp(4,2524*S)+exp(-4,2524*S))	7	9341
9350	Активационная функция нейронов выходного слоя:	Логистическая	8	9341
9351	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	9341
9352	Алгоритм обучения:	BackPropagation	10	9341
9353	Коэффициент скорости обучения:	0,1	11	9341
9354	Коэффициент момента:	0,2	12	9341
9355	Начальное значение (Seed)	1	13	9341
9358	Количество нейронов во входном слое:	9	0	9357
9359	Количество нейронов в выходном слое:	2	1	9357
9360	Количество скрытых слоев:	1	2	9357
9361	Структура скрытого слоя:	14	3	9357
9362	Максимальное число итераций:	1000000	4	9357
9363	Допустимая ошибка:	0,00001	5	9357
9364	Активационная функция нейронов скрытого слоя:	Экспоненциальная	6	9357
9365	Формула активационной функции нейронов скрытого слоя:	f(S)=exp(-S^2/4,7685^2)	7	9357
9366	Активационная функция нейронов выходного слоя:	Логистическая	8	9357
9367	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	9357
9368	Алгоритм обучения:	BackPropagation	10	9357
9369	Коэффициент скорости обучения:	0,1	11	9357
9370	Коэффициент момента:	0,2	12	9357
9371	Начальное значение (Seed)	1	13	9357
9374	Количество нейронов во входном слое:	9	0	9373
9375	Количество нейронов в выходном слое:	2	1	9373
9376	Количество скрытых слоев:	2	2	9373
5140	Случайное дерево:	false	2	674
5141	Бинарное дерево:	true	3	674
5142	Использование случайных расщеплений атрибута:	false	4	674
4879	Число итераций:	10	0	675
4880	Минимальная допустимая ошибка классификатора:	0	1	675
4881	Максимальная допустимая ошибка классификатора:	0,5	2	675
9377	Структура скрытого слоя:	44,22	3	9373
9378	Максимальное число итераций:	1000000	4	9373
9379	Допустимая ошибка:	0,00001	5	9373
9380	Активационная функция нейронов скрытого слоя:	Гиперболический тангенс	6	9373
9381	Формула активационной функции нейронов скрытого слоя:	f(S)=(exp(3,8758*S)-exp(-3,8758*S))/(exp(3,8758*S)+exp(-3,8758*S))	7	9373
9382	Активационная функция нейронов выходного слоя:	Логистическая	8	9373
9383	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	9373
9384	Алгоритм обучения:	BackPropagation	10	9373
9385	Коэффициент скорости обучения:	0,1	11	9373
9386	Коэффициент момента:	0,2	12	9373
9387	Начальное значение (Seed)	1	13	9373
9390	Количество нейронов во входном слое:	9	0	9389
9391	Количество нейронов в выходном слое:	2	1	9389
9392	Количество скрытых слоев:	2	2	9389
9393	Структура скрытого слоя:	12,23	3	9389
9394	Максимальное число итераций:	1000000	4	9389
9395	Допустимая ошибка:	0,00001	5	9389
9396	Активационная функция нейронов скрытого слоя:	Экспоненциальная	6	9389
9397	Формула активационной функции нейронов скрытого слоя:	f(S)=exp(-S^2/4,32^2)	7	9389
9398	Активационная функция нейронов выходного слоя:	Логистическая	8	9389
9399	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	9389
9401	Коэффициент скорости обучения:	0,1	11	9389
9402	Коэффициент момента:	0,2	12	9389
9403	Начальное значение (Seed)	1	13	9389
9406	Число деревьев:	35	0	9405
9407	Минимальное число объектов в листе:	2	1	9405
9408	Максиальная глубина дерева:	0	2	9405
9409	Число случайных атрибутов:	2	3	9405
9410	Алгоритм построения дерева решений:	ID3	4	9405
9411	Число потоков	4	5	9405
9412	Начальное значение (Seed)	1	6	9405
9413	Число случайных расщеплений атрибута:	32	7	9405
9414	Формирование обучающих выборок:	Бутстрэп-выборки	8	9405
9417	Число деревьев:	39	0	9416
9418	Минимальное число объектов в листе:	2	1	9416
9419	Максиальная глубина дерева:	0	2	9416
9420	Число случайных атрибутов:	6	3	9416
9421	Алгоритм построения дерева решений:	C45	4	9416
9422	Число потоков	4	5	9416
9423	Начальное значение (Seed)	1	6	9416
9424	Число случайных расщеплений атрибута:	21	7	9416
9425	Формирование обучающих выборок:	Исходное обучающее множество	8	9416
9428	Число деревьев:	39	0	9427
9429	Минимальное число объектов в листе:	2	1	9427
9430	Максиальная глубина дерева:	0	2	9427
9431	Число случайных атрибутов:	7	3	9427
9432	Алгоритм построения дерева решений:	CART	4	9427
9433	Число потоков	4	5	9427
9434	Начальное значение (Seed)	1	6	9427
9437	Число деревьев:	48	0	9436
9438	Минимальное число объектов в листе:	2	1	9436
9439	Максиальная глубина дерева:	0	2	9436
9440	Число случайных атрибутов:	5	3	9436
9441	Алгоритм построения дерева решений:	C45	4	9436
9442	Число потоков	4	5	9436
9443	Начальное значение (Seed)	1	6	9436
4882	Метод голосования:	Метод большинства голосов	3	675
4883	Формирование обучающих выборок:	Бутстрэп выборки	4	675
4884	Выбор классификатора:	Случайный классификатор	5	675
4885	Базовый классификатор 0:	Logistic	6	675
9444	Число случайных расщеплений атрибута:	29	7	9436
9445	Формирование обучающих выборок:	Исходное обучающее множество	8	9436
9448	Число деревьев:	25	0	9447
9449	Минимальное число объектов в листе:	2	1	9447
9450	Максиальная глубина дерева:	0	2	9447
9451	Число случайных атрибутов:	2	3	9447
9452	Алгоритм построения дерева решений:	C45	4	9447
9453	Число потоков	4	5	9447
9454	Начальное значение (Seed)	1	6	9447
9455	Число случайных расщеплений атрибута:	29	7	9447
9456	Формирование обучающих выборок:	Бутстрэп-выборки	8	9447
9459	Число итераций:	25	0	9458
9460	Минимальная допустимая ошибка классификатора:	0	1	9458
9461	Максимальная допустимая ошибка классификатора:	0,5	2	9458
9462	Метод голосования:	Метод большинства голосов	3	9458
9463	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	9458
9464	Выбор классификатора:	Случайный классификатор	5	9458
9465	Число потоков	4	6	9458
9466	Начальное значение (Seed)	1	7	9458
9467	Базовый классификатор 0:	NeuralNetwork	8	9458
9468	Базовый классификатор 1:	NeuralNetwork	9	9458
9471	Число итераций:	25	0	9470
9472	Минимальная допустимая ошибка классификатора:	0	1	9470
9473	Максимальная допустимая ошибка классификатора:	0,5	2	9470
9474	Метод голосования:	Метод взвешенного голосования	3	9470
9475	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	9470
9476	Выбор классификатора:	Случайный классификатор	5	9470
9477	Число потоков	4	6	9470
9478	Начальное значение (Seed)	1	7	9470
9479	Базовый классификатор 0:	NeuralNetwork	8	9470
9480	Базовый классификатор 1:	NeuralNetwork	9	9470
9483	Число итераций:	25	0	9482
9484	Минимальная допустимая ошибка классификатора:	0	1	9482
9485	Максимальная допустимая ошибка классификатора:	0,5	2	9482
9486	Метод голосования:	Метод взвешенного голосования	3	9482
9487	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	9482
9488	Выбор классификатора:	Случайный классификатор	5	9482
9489	Число потоков	4	6	9482
9490	Начальное значение (Seed)	1	7	9482
9491	Базовый классификатор 0:	NeuralNetwork	8	9482
9494	Число итераций:	25	0	9493
9495	Минимальная допустимая ошибка классификатора:	0	1	9493
9496	Максимальная допустимая ошибка классификатора:	0,5	2	9493
9497	Метод голосования:	Метод взвешенного голосования	3	9493
9498	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	9493
9499	Выбор классификатора:	Оптимальный классификатор	5	9493
9500	Число потоков	4	6	9493
9501	Начальное значение (Seed)	1	7	9493
9502	Базовый классификатор 0:	NeuralNetwork	8	9493
9505	Число итераций:	25	0	9504
9506	Минимальная допустимая ошибка классификатора:	0	1	9504
9507	Максимальная допустимая ошибка классификатора:	0,5	2	9504
9508	Метод голосования:	Метод большинства голосов	3	9504
5034	Максимальное число итераций:	500	0	653
5035	Метод поиска минимума:	Квазиньютоновский метод	1	653
4886	Базовый классификатор 1:	CART	7	675
5038	Число деревьев:	10	0	687
9509	Формирование обучающих выборок:	Случайные подвыборки	4	9504
9510	Выбор классификатора:	Случайный классификатор	5	9504
9511	Число потоков	4	6	9504
9512	Начальное значение (Seed)	1	7	9504
9513	Базовый классификатор 0:	NeuralNetwork	8	9504
9514	Базовый классификатор 1:	NeuralNetwork	9	9504
9517	Количество нейронов во входном слое:	8	0	9516
9518	Количество нейронов в выходном слое:	2	1	9516
9519	Количество скрытых слоев:	2	2	9516
9520	Структура скрытого слоя:	31,15	3	9516
9521	Максимальное число итераций:	1000000	4	9516
9522	Допустимая ошибка:	0,00001	5	9516
9523	Активационная функция нейронов скрытого слоя:	Логистическая	6	9516
9524	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-1,153*S))	7	9516
9525	Активационная функция нейронов выходного слоя:	Логистическая	8	9516
9526	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	9516
9527	Алгоритм обучения:	BackPropagation	10	9516
9528	Коэффициент скорости обучения:	0,1	11	9516
9529	Коэффициент момента:	0,2	12	9516
9530	Начальное значение (Seed)	1	13	9516
9533	Количество нейронов во входном слое:	8	0	9532
9534	Количество нейронов в выходном слое:	2	1	9532
9535	Количество скрытых слоев:	2	2	9532
9536	Структура скрытого слоя:	16,15	3	9532
9537	Максимальное число итераций:	1000000	4	9532
9538	Допустимая ошибка:	0,00001	5	9532
9539	Активационная функция нейронов скрытого слоя:	Экспоненциальная	6	9532
9540	Формула активационной функции нейронов скрытого слоя:	f(S)=exp(-S^2/3,7267^2)	7	9532
9541	Активационная функция нейронов выходного слоя:	Логистическая	8	9532
9542	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	9532
9543	Алгоритм обучения:	BackPropagation	10	9532
9544	Коэффициент скорости обучения:	0,1	11	9532
9545	Коэффициент момента:	0,2	12	9532
9546	Начальное значение (Seed)	1	13	9532
9549	Количество нейронов во входном слое:	8	0	9548
9550	Количество нейронов в выходном слое:	2	1	9548
9551	Количество скрытых слоев:	2	2	9548
9552	Структура скрытого слоя:	44,22	3	9548
9553	Максимальное число итераций:	1000000	4	9548
9554	Допустимая ошибка:	0,00001	5	9548
9555	Активационная функция нейронов скрытого слоя:	Экспоненциальная	6	9548
6858	Использование случайных расщеплений атрибута:	false	4	676
3762	Число деревьев:	10	0	677
3763	Минимальное число объектов в листе:	2	1	677
3764	Максиальная глубина дерева:	0	2	677
3765	Число случайных атрибутов:	3	3	677
3766	Алгоритм построения дерева решений:	CART	4	677
3222	Число итераций:	10	0	678
3223	Минимальная допустимая ошибка классификатора:	0	1	678
3224	Максимальная допустимая ошибка классификатора:	0,5	2	678
3225	Метод голосования:	Метод взвешенного голосования	3	678
9556	Формула активационной функции нейронов скрытого слоя:	f(S)=exp(-S^2/3,8635^2)	7	9548
9557	Активационная функция нейронов выходного слоя:	Логистическая	8	9548
9558	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	9548
9559	Алгоритм обучения:	BackPropagation	10	9548
9560	Коэффициент скорости обучения:	0,1	11	9548
9561	Коэффициент момента:	0,2	12	9548
9562	Начальное значение (Seed)	1	13	9548
9565	Количество нейронов во входном слое:	8	0	9564
9566	Количество нейронов в выходном слое:	2	1	9564
9567	Количество скрытых слоев:	2	2	9564
9568	Структура скрытого слоя:	15,8	3	9564
9569	Максимальное число итераций:	1000000	4	9564
9570	Допустимая ошибка:	0,00001	5	9564
9571	Активационная функция нейронов скрытого слоя:	Экспоненциальная	6	9564
9572	Формула активационной функции нейронов скрытого слоя:	f(S)=exp(-S^2/4,3621^2)	7	9564
9573	Активационная функция нейронов выходного слоя:	Логистическая	8	9564
9574	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	9564
9575	Алгоритм обучения:	BackPropagation	10	9564
9576	Коэффициент скорости обучения:	0,1	11	9564
9577	Коэффициент момента:	0,2	12	9564
9578	Начальное значение (Seed)	1	13	9564
9581	Количество нейронов во входном слое:	8	0	9580
9582	Количество нейронов в выходном слое:	2	1	9580
9583	Количество скрытых слоев:	2	2	9580
9584	Структура скрытого слоя:	7,8	3	9580
9585	Максимальное число итераций:	1000000	4	9580
9586	Допустимая ошибка:	0,00001	5	9580
9587	Активационная функция нейронов скрытого слоя:	Логистическая	6	9580
9588	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-1,4422*S))	7	9580
9589	Активационная функция нейронов выходного слоя:	Логистическая	8	9580
9590	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	9580
9591	Алгоритм обучения:	BackPropagation	10	9580
9592	Коэффициент скорости обучения:	0,1	11	9580
9593	Коэффициент момента:	0,2	12	9580
9594	Начальное значение (Seed)	1	13	9580
9597	Мета-классификатор:	NeuralNetwork	0	9596
9598	Метод формирования мета-признаков:	Использование обучающего множества	1	9596
9599	Начальное значение (Seed)	1	2	9596
9600	Базовый классификатор 0:	NeuralNetwork	3	9596
9601	Базовый классификатор 1:	NeuralNetwork	4	9596
9604	Мета-классификатор:	Logistic	0	9603
9605	Метод формирования мета-признаков:	Использование обучающего множества	1	9603
9606	Начальное значение (Seed)	1	2	9603
9607	Базовый классификатор 0:	NeuralNetwork	3	9603
9610	Мета-классификатор:	NeuralNetwork	0	9609
9611	Метод формирования мета-признаков:	Использование обучающего множества	1	9609
9612	Начальное значение (Seed)	1	2	9609
9613	Базовый классификатор 0:	NeuralNetwork	3	9609
9616	Мета-классификатор:	NeuralNetwork	0	9615
9617	Метод формирования мета-признаков:	Использование обучающего множества	1	9615
9618	Начальное значение (Seed)	1	2	9615
9619	Базовый классификатор 0:	NeuralNetwork	3	9615
9622	Мета-классификатор:	NeuralNetwork	0	9621
9623	Метод формирования мета-признаков:	Использование обучающего множества	1	9621
9624	Начальное значение (Seed)	1	2	9621
9625	Базовый классификатор 0:	NeuralNetwork	3	9621
5433	Число итераций:	10	0	649
5434	Минимальная допустимая ошибка классификатора:	0	1	649
5435	Максимальная допустимая ошибка классификатора:	0,5	2	649
9628	Число ближайших соседей:	299	0	9627
9629	Вес ближайшего соседа:	0,9203	1	9627
9630	Функция расстояния:	Евкилидово расстояние	2	9627
9633	Число ближайших соседей:	311	0	9632
9634	Вес ближайшего соседа:	0,917	1	9632
9635	Функция расстояния:	Евкилидово расстояние	2	9632
9638	Число ближайших соседей:	919	0	9637
9639	Вес ближайшего соседа:	0,9173	1	9637
9640	Функция расстояния:	Манхеттенское расстояние	2	9637
9643	Число ближайших соседей:	985	0	9642
9644	Вес ближайшего соседа:	0,9243	1	9642
9645	Функция расстояния:	Манхеттенское расстояние	2	9642
9648	Число ближайших соседей:	273	0	9647
9649	Вес ближайшего соседа:	0,9056	1	9647
9650	Функция расстояния:	Манхеттенское расстояние	2	9647
9653	Мета-классификатор:	KNearestNeighbours	0	9652
9654	Метод формирования мета-признаков:	Использование обучающего множества	1	9652
9655	Начальное значение (Seed)	1	2	9652
9656	Базовый классификатор 0:	Logistic	3	9652
9659	Мета-классификатор:	KNearestNeighbours	0	9658
9660	Метод формирования мета-признаков:	Использование обучающего множества	1	9658
9661	Начальное значение (Seed)	1	2	9658
9662	Базовый классификатор 0:	Logistic	3	9658
9665	Мета-классификатор:	NeuralNetwork	0	9664
9666	Метод формирования мета-признаков:	Использование обучающего множества	1	9664
9667	Начальное значение (Seed)	1	2	9664
9668	Базовый классификатор 0:	Logistic	3	9664
9671	Мета-классификатор:	Logistic	0	9670
9672	Метод формирования мета-признаков:	Использование обучающего множества	1	9670
9673	Начальное значение (Seed)	1	2	9670
9674	Базовый классификатор 0:	Logistic	3	9670
9677	Мета-классификатор:	KNearestNeighbours	0	9676
9678	Метод формирования мета-признаков:	Использование обучающего множества	1	9676
9679	Начальное значение (Seed)	1	2	9676
9680	Базовый классификатор 0:	Logistic	3	9676
9681	Базовый классификатор 1:	KNearestNeighbours	4	9676
9682	Базовый классификатор 2:	KNearestNeighbours	5	9676
9683	Базовый классификатор 3:	NeuralNetwork	6	9676
9686	Число итераций:	25	0	9685
9687	Минимальная допустимая ошибка классификатора:	0	1	9685
9688	Максимальная допустимая ошибка классификатора:	0,5	2	9685
9689	Начальное значение (Seed)	1	3	9685
9690	Базовый классификатор 0:	Logistic	4	9685
9693	Число итераций:	25	0	9692
9694	Минимальная допустимая ошибка классификатора:	0	1	9692
9695	Максимальная допустимая ошибка классификатора:	0,5	2	9692
9696	Начальное значение (Seed)	1	3	9692
9697	Базовый классификатор 0:	KNearestNeighbours	4	9692
9698	Базовый классификатор 1:	NeuralNetwork	5	9692
9701	Число итераций:	25	0	9700
9702	Минимальная допустимая ошибка классификатора:	0	1	9700
9703	Максимальная допустимая ошибка классификатора:	0,5	2	9700
9704	Начальное значение (Seed)	1	3	9700
9705	Базовый классификатор 0:	KNearestNeighbours	4	9700
9706	Базовый классификатор 1:	NeuralNetwork	5	9700
5517	Число ближайших соседей:	10	0	647
5518	Вес ближайшего соседа:	1	1	647
5519	Функция расстояния:	Евкилидово расстояние	2	647
3226	Формирование обучающих выборок:	Случайные подвыборки	4	678
3227	Выбор классификатора:	Случайный классификатор	5	678
3228	Базовый классификатор 0:	CART	6	678
9709	Число итераций:	25	0	9708
9710	Минимальная допустимая ошибка классификатора:	0	1	9708
9711	Максимальная допустимая ошибка классификатора:	0,5	2	9708
9712	Начальное значение (Seed)	1	3	9708
9713	Базовый классификатор 0:	KNearestNeighbours	4	9708
9714	Базовый классификатор 1:	KNearestNeighbours	5	9708
9715	Базовый классификатор 2:	NeuralNetwork	6	9708
9718	Число итераций:	25	0	9717
9719	Минимальная допустимая ошибка классификатора:	0	1	9717
9720	Максимальная допустимая ошибка классификатора:	0,5	2	9717
9721	Начальное значение (Seed)	1	3	9717
9722	Базовый классификатор 0:	Logistic	4	9717
9723	Базовый классификатор 1:	KNearestNeighbours	5	9717
9724	Базовый классификатор 2:	NeuralNetwork	6	9717
9727	Число итераций:	3	0	9726
9728	Минимальная допустимая ошибка классификатора:	0	1	9726
9729	Максимальная допустимая ошибка классификатора:	0,5	2	9726
9730	Метод голосования:	Метод большинства голосов	3	9726
9731	Формирование обучающих выборок:	Использование исходной выборки	4	9726
9732	Выбор классификатора:	Оптимальный классификатор	5	9726
9733	Число потоков	4	6	9726
9734	Начальное значение (Seed)	1	7	9726
9735	Базовый классификатор 0:	Logistic	8	9726
9736	Базовый классификатор 1:	KNearestNeighbours	9	9726
9737	Базовый классификатор 2:	NeuralNetwork	10	9726
9740	Число итераций:	3	0	9739
9741	Минимальная допустимая ошибка классификатора:	0	1	9739
9742	Максимальная допустимая ошибка классификатора:	0,5	2	9739
9743	Метод голосования:	Метод большинства голосов	3	9739
9744	Формирование обучающих выборок:	Использование исходной выборки	4	9739
9745	Выбор классификатора:	Оптимальный классификатор	5	9739
9746	Число потоков	4	6	9739
9747	Начальное значение (Seed)	1	7	9739
9748	Базовый классификатор 0:	Logistic	8	9739
9749	Базовый классификатор 1:	KNearestNeighbours	9	9739
9750	Базовый классификатор 2:	NeuralNetwork	10	9739
9753	Число итераций:	3	0	9752
9754	Минимальная допустимая ошибка классификатора:	0	1	9752
9755	Максимальная допустимая ошибка классификатора:	0,5	2	9752
9756	Метод голосования:	Метод большинства голосов	3	9752
9757	Формирование обучающих выборок:	Использование исходной выборки	4	9752
9758	Выбор классификатора:	Случайный классификатор	5	9752
9759	Число потоков	4	6	9752
9760	Начальное значение (Seed)	1	7	9752
9761	Базовый классификатор 0:	Logistic	8	9752
9762	Базовый классификатор 1:	KNearestNeighbours	9	9752
9763	Базовый классификатор 2:	NeuralNetwork	10	9752
9766	Число итераций:	3	0	9765
9767	Минимальная допустимая ошибка классификатора:	0	1	9765
3344	Число деревьев:	10	0	680
3345	Минимальное число объектов в листе:	2	1	680
3347	Число случайных атрибутов:	3	3	680
3346	Максиальная глубина дерева:	0	2	680
3348	Алгоритм построения дерева решений:	CART	4	680
3349	Число случайных расщеплений атрибута:	1	5	680
6301	Метод поиска минимума:	Квазиньютоновский метод	1	696
9768	Максимальная допустимая ошибка классификатора:	0,5	2	9765
9769	Метод голосования:	Метод большинства голосов	3	9765
9770	Формирование обучающих выборок:	Использование исходной выборки	4	9765
9771	Выбор классификатора:	Случайный классификатор	5	9765
9772	Число потоков	4	6	9765
9773	Начальное значение (Seed)	1	7	9765
9774	Базовый классификатор 0:	Logistic	8	9765
9775	Базовый классификатор 1:	KNearestNeighbours	9	9765
9776	Базовый классификатор 2:	NeuralNetwork	10	9765
9779	Число итераций:	10	0	9778
9780	Минимальная допустимая ошибка классификатора:	0	1	9778
9781	Максимальная допустимая ошибка классификатора:	0,5	2	9778
9782	Метод голосования:	Метод большинства голосов	3	9778
9783	Формирование обучающих выборок:	Бутстрэп выборки	4	9778
9784	Выбор классификатора:	Случайный классификатор	5	9778
9785	Число потоков	4	6	9778
9786	Начальное значение (Seed)	1	7	9778
9787	Базовый классификатор 0:	Logistic	8	9778
9788	Базовый классификатор 1:	KNearestNeighbours	9	9778
9791	Число деревьев:	28	0	9790
9792	Минимальное число объектов в листе:	5	1	9790
9793	Максиальная глубина дерева:	0	2	9790
9794	Число случайных атрибутов:	4	3	9790
9795	Алгоритм построения дерева решений:	C45	4	9790
9796	Число потоков	4	5	9790
9797	Начальное значение (Seed)	1	6	9790
9800	Число деревьев:	46	0	9799
9801	Минимальное число объектов в листе:	2	1	9799
9802	Максиальная глубина дерева:	6	2	9799
9803	Число случайных атрибутов:	5	3	9799
9804	Алгоритм построения дерева решений:	C45	4	9799
9805	Число потоков	4	5	9799
9806	Начальное значение (Seed)	1	6	9799
9807	Число случайных расщеплений атрибута:	25	7	9799
9808	Формирование обучающих выборок:	Бутстрэп-выборки	8	9799
9811	Число деревьев:	23	0	9810
9812	Минимальное число объектов в листе:	2	1	9810
9813	Максиальная глубина дерева:	0	2	9810
9814	Число случайных атрибутов:	2	3	9810
9815	Алгоритм построения дерева решений:	CHAID	4	9810
9816	Число потоков	4	5	9810
9817	Начальное значение (Seed)	1	6	9810
9818	Число случайных расщеплений атрибута:	34	7	9810
9819	Формирование обучающих выборок:	Исходное обучающее множество	8	9810
9822	Число деревьев:	15	0	9821
9823	Минимальное число объектов в листе:	2	1	9821
9824	Максиальная глубина дерева:	4	2	9821
9825	Число случайных атрибутов:	6	3	9821
9826	Алгоритм построения дерева решений:	CART	4	9821
9827	Число потоков	4	5	9821
9828	Начальное значение (Seed)	1	6	9821
9831	Число деревьев:	10	0	9830
9832	Минимальное число объектов в листе:	5	1	9830
9833	Максиальная глубина дерева:	6	2	9830
9834	Число случайных атрибутов:	4	3	9830
9835	Алгоритм построения дерева решений:	CHAID	4	9830
9836	Число потоков	4	5	9830
9837	Начальное значение (Seed)	1	6	9830
5606	Минимальное число объектов в листе:	2	0	666
5607	Максиальная глубина дерева:	0	1	666
5608	Случайное дерево:	false	2	666
5609	Бинарное дерево:	false	3	666
5610	Использование случайных расщеплений атрибута:	false	4	666
3350	Формирование обучающих выборок:	Исходное обучающее множество	6	680
5611	Число деревьев:	10	0	682
9838	Число случайных расщеплений атрибута:	47	7	9830
9839	Формирование обучающих выборок:	Исходное обучающее множество	8	9830
9842	Минимальное число объектов в листе:	10	0	9841
9843	Максиальная глубина дерева:	6	1	9841
9844	Случайное дерево:	false	2	9841
9845	Бинарное дерево:	false	3	9841
9846	Использование случайных расщеплений атрибута:	false	4	9841
9847	Начальное значение (Seed)	1	5	9841
9850	Минимальное число объектов в листе:	9	0	9849
9851	Максиальная глубина дерева:	6	1	9849
9852	Случайное дерево:	false	2	9849
9853	Бинарное дерево:	true	3	9849
9854	Использование случайных расщеплений атрибута:	false	4	9849
9855	Начальное значение (Seed)	1	5	9849
9858	Минимальное число объектов в листе:	9	0	9857
9859	Максиальная глубина дерева:	6	1	9857
9860	Случайное дерево:	false	2	9857
9861	Бинарное дерево:	true	3	9857
9862	Использование случайных расщеплений атрибута:	false	4	9857
9863	Начальное значение (Seed)	1	5	9857
9866	Минимальное число объектов в листе:	9	0	9865
9867	Максиальная глубина дерева:	6	1	9865
9868	Случайное дерево:	false	2	9865
9869	Бинарное дерево:	false	3	9865
9870	Использование случайных расщеплений атрибута:	false	4	9865
9871	Начальное значение (Seed)	1	5	9865
9874	Минимальное число объектов в листе:	3	0	9873
9875	Максиальная глубина дерева:	6	1	9873
9876	Случайное дерево:	false	2	9873
9877	Бинарное дерево:	true	3	9873
9878	Использование случайных расщеплений атрибута:	false	4	9873
9879	Начальное значение (Seed)	1	5	9873
9882	Число ближайших соседей:	135	0	9881
9883	Вес ближайшего соседа:	0,882	1	9881
9884	Функция расстояния:	Манхеттенское расстояние	2	9881
9887	Число ближайших соседей:	145	0	9886
9888	Вес ближайшего соседа:	0,9006	1	9886
9889	Функция расстояния:	Манхеттенское расстояние	2	9886
9892	Число ближайших соседей:	240	0	9891
9893	Вес ближайшего соседа:	0,8895	1	9891
9894	Функция расстояния:	Манхеттенское расстояние	2	9891
9897	Число ближайших соседей:	196	0	9896
9898	Вес ближайшего соседа:	0,8929	1	9896
9899	Функция расстояния:	Евкилидово расстояние	2	9896
9902	Число ближайших соседей:	201	0	9901
9903	Вес ближайшего соседа:	0,8874	1	9901
9904	Функция расстояния:	Евкилидово расстояние	2	9901
9907	Число деревьев:	34	0	9906
9908	Минимальное число объектов в листе:	8	1	9906
9909	Максиальная глубина дерева:	0	2	9906
9910	Число случайных атрибутов:	2	3	9906
9911	Алгоритм построения дерева решений:	CART	4	9906
9912	Число потоков	4	5	9906
9913	Начальное значение (Seed)	1	6	9906
9916	Число деревьев:	39	0	9915
9917	Минимальное число объектов в листе:	4	1	9915
9918	Максиальная глубина дерева:	0	2	9915
9919	Число случайных атрибутов:	1	3	9915
9920	Алгоритм построения дерева решений:	C45	4	9915
9921	Число потоков	4	5	9915
9922	Начальное значение (Seed)	1	6	9915
6494	Число случайных расщеплений атрибута:	10	5	681
6495	Формирование обучающих выборок:	Исходное обучающее множество	6	681
5612	Минимальное число объектов в листе:	2	1	682
5613	Максиальная глубина дерева:	0	2	682
9923	Число случайных расщеплений атрибута:	17	7	9915
9924	Формирование обучающих выборок:	Бутстрэп-выборки	8	9915
9927	Число деревьев:	32	0	9926
9928	Минимальное число объектов в листе:	2	1	9926
9929	Максиальная глубина дерева:	0	2	9926
9930	Число случайных атрибутов:	1	3	9926
9931	Алгоритм построения дерева решений:	C45	4	9926
9932	Число потоков	4	5	9926
9933	Начальное значение (Seed)	1	6	9926
9936	Число деревьев:	44	0	9935
9937	Минимальное число объектов в листе:	9	1	9935
9938	Максиальная глубина дерева:	0	2	9935
9939	Число случайных атрибутов:	2	3	9935
9940	Алгоритм построения дерева решений:	ID3	4	9935
9941	Число потоков	4	5	9935
9942	Начальное значение (Seed)	1	6	9935
9945	Число деревьев:	30	0	9944
9946	Минимальное число объектов в листе:	4	1	9944
9947	Максиальная глубина дерева:	0	2	9944
9948	Число случайных атрибутов:	2	3	9944
9949	Алгоритм построения дерева решений:	C45	4	9944
9950	Число потоков	4	5	9944
9951	Начальное значение (Seed)	1	6	9944
9952	Число случайных расщеплений атрибута:	44	7	9944
9953	Формирование обучающих выборок:	Исходное обучающее множество	8	9944
9956	Число ближайших соседей:	59	0	9955
9957	Вес ближайшего соседа:	0,6257	1	9955
9958	Функция расстояния:	Манхеттенское расстояние	2	9955
9961	Число ближайших соседей:	90	0	9960
9962	Вес ближайшего соседа:	0,6326	1	9960
9963	Функция расстояния:	Манхеттенское расстояние	2	9960
9966	Число ближайших соседей:	5	0	9965
9967	Вес ближайшего соседа:	0,7218	1	9965
9968	Функция расстояния:	Манхеттенское расстояние	2	9965
9971	Число ближайших соседей:	139	0	9970
9972	Вес ближайшего соседа:	0,5232	1	9970
9973	Функция расстояния:	Манхеттенское расстояние	2	9970
9976	Число ближайших соседей:	45	0	9975
9977	Вес ближайшего соседа:	0,6515	1	9975
9978	Функция расстояния:	Манхеттенское расстояние	2	9975
9981	Число итераций:	25	0	9980
9982	Минимальная допустимая ошибка классификатора:	0	1	9980
9983	Максимальная допустимая ошибка классификатора:	0,5	2	9980
9984	Начальное значение (Seed)	1	3	9980
9985	Базовый классификатор 0:	KNearestNeighbours	4	9980
9986	Базовый классификатор 1:	KNearestNeighbours	5	9980
9989	Число итераций:	25	0	9988
9990	Минимальная допустимая ошибка классификатора:	0	1	9988
9991	Максимальная допустимая ошибка классификатора:	0,5	2	9988
9992	Начальное значение (Seed)	1	3	9988
9993	Базовый классификатор 0:	KNearestNeighbours	4	9988
9994	Базовый классификатор 1:	KNearestNeighbours	5	9988
9995	Базовый классификатор 2:	KNearestNeighbours	6	9988
9998	Число итераций:	25	0	9997
9999	Минимальная допустимая ошибка классификатора:	0	1	9997
10000	Максимальная допустимая ошибка классификатора:	0,5	2	9997
10001	Начальное значение (Seed)	1	3	9997
10002	Базовый классификатор 0:	KNearestNeighbours	4	9997
10003	Базовый классификатор 1:	KNearestNeighbours	5	9997
5730	Число ближайших соседей:	10	0	641
5731	Вес ближайшего соседа:	1	1	641
5732	Функция расстояния:	Евкилидово расстояние	2	641
5614	Число случайных атрибутов:	3	3	682
5615	Алгоритм построения дерева решений:	C45	4	682
10004	Базовый классификатор 2:	KNearestNeighbours	6	9997
10007	Число итераций:	25	0	10006
10008	Минимальная допустимая ошибка классификатора:	0	1	10006
10009	Максимальная допустимая ошибка классификатора:	0,5	2	10006
10010	Начальное значение (Seed)	1	3	10006
10011	Базовый классификатор 0:	KNearestNeighbours	4	10006
10012	Базовый классификатор 1:	KNearestNeighbours	5	10006
10013	Базовый классификатор 2:	KNearestNeighbours	6	10006
10014	Базовый классификатор 3:	KNearestNeighbours	7	10006
10017	Число итераций:	25	0	10016
10018	Минимальная допустимая ошибка классификатора:	0	1	10016
10019	Максимальная допустимая ошибка классификатора:	0,5	2	10016
10020	Начальное значение (Seed)	1	3	10016
10021	Базовый классификатор 0:	KNearestNeighbours	4	10016
10022	Базовый классификатор 1:	KNearestNeighbours	5	10016
10025	Число итераций:	25	0	10024
10026	Минимальная допустимая ошибка классификатора:	0	1	10024
10027	Максимальная допустимая ошибка классификатора:	0,5	2	10024
10028	Метод голосования:	Метод взвешенного голосования	3	10024
10029	Формирование обучающих выборок:	Бутстрэп выборки	4	10024
10030	Выбор классификатора:	Оптимальный классификатор	5	10024
10031	Число потоков	1	6	10024
10032	Начальное значение (Seed)	1	7	10024
10033	Базовый классификатор 0:	CART	8	10024
10034	Базовый классификатор 1:	C45	9	10024
10037	Число итераций:	25	0	10036
10038	Минимальная допустимая ошибка классификатора:	0	1	10036
10039	Максимальная допустимая ошибка классификатора:	0,5	2	10036
10040	Метод голосования:	Метод взвешенного голосования	3	10036
10041	Формирование обучающих выборок:	Бутстрэп выборки	4	10036
10042	Выбор классификатора:	Оптимальный классификатор	5	10036
10043	Число потоков	1	6	10036
10044	Начальное значение (Seed)	1	7	10036
10045	Базовый классификатор 0:	CART	8	10036
10046	Базовый классификатор 1:	C45	9	10036
10049	Число итераций:	25	0	10048
10050	Минимальная допустимая ошибка классификатора:	0	1	10048
10051	Максимальная допустимая ошибка классификатора:	0,5	2	10048
10052	Метод голосования:	Метод взвешенного голосования	3	10048
10053	Формирование обучающих выборок:	Бутстрэп выборки	4	10048
10054	Выбор классификатора:	Оптимальный классификатор	5	10048
10055	Число потоков	1	6	10048
10056	Начальное значение (Seed)	1	7	10048
10057	Базовый классификатор 0:	CART	8	10048
10058	Базовый классификатор 1:	ID3	9	10048
10061	Число итераций:	25	0	10060
10062	Минимальная допустимая ошибка классификатора:	0	1	10060
10063	Максимальная допустимая ошибка классификатора:	0,5	2	10060
10064	Метод голосования:	Метод взвешенного голосования	3	10060
10065	Формирование обучающих выборок:	Бутстрэп выборки	4	10060
5616	Число случайных расщеплений атрибута:	10	5	682
5617	Формирование обучающих выборок:	Исходное обучающее множество	6	682
6664	Максиальная глубина дерева:	0	2	684
6665	Число случайных атрибутов:	3	3	684
6666	Алгоритм построения дерева решений:	C45	4	684
6667	Число случайных расщеплений атрибута:	10	5	684
6668	Формирование обучающих выборок:	Исходное обучающее множество	6	684
10066	Выбор классификатора:	Оптимальный классификатор	5	10060
10067	Число потоков	1	6	10060
10068	Начальное значение (Seed)	1	7	10060
10069	Базовый классификатор 0:	CART	8	10060
10070	Базовый классификатор 1:	C45	9	10060
10071	Базовый классификатор 2:	C45	10	10060
10074	Число итераций:	25	0	10073
10075	Минимальная допустимая ошибка классификатора:	0	1	10073
10076	Максимальная допустимая ошибка классификатора:	0,5	2	10073
10077	Метод голосования:	Метод взвешенного голосования	3	10073
10078	Формирование обучающих выборок:	Бутстрэп выборки	4	10073
10079	Выбор классификатора:	Оптимальный классификатор	5	10073
10080	Число потоков	1	6	10073
10081	Начальное значение (Seed)	1	7	10073
10082	Базовый классификатор 0:	CART	8	10073
10083	Базовый классификатор 1:	C45	9	10073
10084	Базовый классификатор 2:	ID3	10	10073
10087	Число деревьев:	38	0	10086
10088	Минимальное число объектов в листе:	2	1	10086
10089	Максиальная глубина дерева:	0	2	10086
10090	Число случайных атрибутов:	2	3	10086
10091	Алгоритм построения дерева решений:	C45	4	10086
10092	Число потоков	2	5	10086
10093	Начальное значение (Seed)	1	6	10086
10094	Число случайных расщеплений атрибута:	22	7	10086
10095	Формирование обучающих выборок:	Исходное обучающее множество	8	10086
10098	Число деревьев:	17	0	10097
10099	Минимальное число объектов в листе:	2	1	10097
10100	Максиальная глубина дерева:	0	2	10097
10101	Число случайных атрибутов:	5	3	10097
10102	Алгоритм построения дерева решений:	C45	4	10097
10103	Число потоков	2	5	10097
10104	Начальное значение (Seed)	1	6	10097
10105	Число случайных расщеплений атрибута:	35	7	10097
10106	Формирование обучающих выборок:	Исходное обучающее множество	8	10097
10109	Число деревьев:	12	0	10108
10110	Минимальное число объектов в листе:	2	1	10108
10111	Максиальная глубина дерева:	0	2	10108
10112	Число случайных атрибутов:	5	3	10108
10113	Алгоритм построения дерева решений:	ID3	4	10108
10114	Число потоков	2	5	10108
10115	Начальное значение (Seed)	1	6	10108
10118	Число деревьев:	40	0	10117
10119	Минимальное число объектов в листе:	2	1	10117
10120	Максиальная глубина дерева:	0	2	10117
10121	Число случайных атрибутов:	2	3	10117
10122	Алгоритм построения дерева решений:	CART	4	10117
10123	Число потоков	2	5	10117
10124	Начальное значение (Seed)	1	6	10117
10127	Число деревьев:	41	0	10126
10128	Минимальное число объектов в листе:	2	1	10126
10129	Максиальная глубина дерева:	0	2	10126
10130	Число случайных атрибутов:	2	3	10126
10131	Алгоритм построения дерева решений:	C45	4	10126
10132	Число потоков	2	5	10126
10133	Начальное значение (Seed)	1	6	10126
10136	Число деревьев:	48	0	10135
10137	Минимальное число объектов в листе:	2	1	10135
10138	Максиальная глубина дерева:	0	2	10135
10139	Число случайных атрибутов:	8	3	10135
10140	Алгоритм построения дерева решений:	ID3	4	10135
10141	Число потоков	1	5	10135
5315	Число деревьев:	10	0	685
5316	Минимальное число объектов в листе:	2	1	685
5317	Максиальная глубина дерева:	0	2	685
5318	Число случайных атрибутов:	3	3	685
5319	Алгоритм построения дерева решений:	C45	4	685
5510	Случайное дерево:	false	2	697
10142	Начальное значение (Seed)	1	6	10135
10143	Число случайных расщеплений атрибута:	10	7	10135
10144	Формирование обучающих выборок:	Бутстрэп-выборки	8	10135
10147	Число деревьев:	31	0	10146
10148	Минимальное число объектов в листе:	2	1	10146
10149	Максиальная глубина дерева:	0	2	10146
10150	Число случайных атрибутов:	6	3	10146
10151	Алгоритм построения дерева решений:	ID3	4	10146
10152	Число потоков	1	5	10146
10153	Начальное значение (Seed)	1	6	10146
10154	Число случайных расщеплений атрибута:	24	7	10146
10155	Формирование обучающих выборок:	Исходное обучающее множество	8	10146
10158	Число деревьев:	34	0	10157
10159	Минимальное число объектов в листе:	2	1	10157
10160	Максиальная глубина дерева:	0	2	10157
10161	Число случайных атрибутов:	4	3	10157
10162	Алгоритм построения дерева решений:	CART	4	10157
10163	Число потоков	1	5	10157
10164	Начальное значение (Seed)	1	6	10157
10165	Число случайных расщеплений атрибута:	10	7	10157
10166	Формирование обучающих выборок:	Исходное обучающее множество	8	10157
10169	Число деревьев:	44	0	10168
10170	Минимальное число объектов в листе:	4	1	10168
10171	Максиальная глубина дерева:	0	2	10168
10172	Число случайных атрибутов:	4	3	10168
10173	Алгоритм построения дерева решений:	C45	4	10168
10174	Число потоков	1	5	10168
10175	Начальное значение (Seed)	1	6	10168
10178	Число деревьев:	41	0	10177
10179	Минимальное число объектов в листе:	4	1	10177
10180	Максиальная глубина дерева:	0	2	10177
10181	Число случайных атрибутов:	5	3	10177
10182	Алгоритм построения дерева решений:	CART	4	10177
10183	Число потоков	1	5	10177
10184	Начальное значение (Seed)	1	6	10177
10187	Число деревьев:	37	0	10186
10188	Минимальное число объектов в листе:	7	1	10186
10189	Максиальная глубина дерева:	0	2	10186
10190	Число случайных атрибутов:	2	3	10186
10191	Алгоритм построения дерева решений:	CART	4	10186
10192	Число потоков	2	5	10186
10193	Начальное значение (Seed)	1	6	10186
10194	Число случайных расщеплений атрибута:	30	7	10186
10195	Формирование обучающих выборок:	Бутстрэп-выборки	8	10186
10198	Число деревьев:	37	0	10197
10199	Минимальное число объектов в листе:	9	1	10197
10200	Максиальная глубина дерева:	0	2	10197
10201	Число случайных атрибутов:	2	3	10197
10202	Алгоритм построения дерева решений:	C45	4	10197
10203	Число потоков	2	5	10197
10204	Начальное значение (Seed)	1	6	10197
10205	Число случайных расщеплений атрибута:	30	7	10197
5915	Число ближайших соседей:	10	0	655
5916	Вес ближайшего соседа:	1	1	655
5917	Функция расстояния:	Евкилидово расстояние	2	655
5941	Число деревьев:	10	0	656
5942	Минимальное число объектов в листе:	2	1	656
5943	Максиальная глубина дерева:	0	2	656
5944	Число случайных атрибутов:	4	3	656
10206	Формирование обучающих выборок:	Исходное обучающее множество	8	10197
10209	Число деревьев:	35	0	10208
10210	Минимальное число объектов в листе:	2	1	10208
10211	Максиальная глубина дерева:	0	2	10208
10212	Число случайных атрибутов:	1	3	10208
10213	Алгоритм построения дерева решений:	ID3	4	10208
10214	Число потоков	2	5	10208
10215	Начальное значение (Seed)	1	6	10208
10218	Число деревьев:	41	0	10217
10219	Минимальное число объектов в листе:	10	1	10217
10220	Максиальная глубина дерева:	0	2	10217
10221	Число случайных атрибутов:	4	3	10217
10222	Алгоритм построения дерева решений:	C45	4	10217
10223	Число потоков	2	5	10217
10224	Начальное значение (Seed)	1	6	10217
10225	Число случайных расщеплений атрибута:	2	7	10217
10226	Формирование обучающих выборок:	Исходное обучающее множество	8	10217
10229	Число деревьев:	50	0	10228
10230	Минимальное число объектов в листе:	2	1	10228
10231	Максиальная глубина дерева:	0	2	10228
10232	Число случайных атрибутов:	1	3	10228
10233	Алгоритм построения дерева решений:	CART	4	10228
10234	Число потоков	2	5	10228
10235	Начальное значение (Seed)	1	6	10228
10236	Число случайных расщеплений атрибута:	15	7	10228
10237	Формирование обучающих выборок:	Исходное обучающее множество	8	10228
10240	Число итераций:	25	0	10239
10241	Минимальная допустимая ошибка классификатора:	0	1	10239
10242	Максимальная допустимая ошибка классификатора:	0,5	2	10239
10243	Начальное значение (Seed)	1	3	10239
10244	Базовый классификатор 0:	CART	4	10239
10245	Базовый классификатор 1:	C45	5	10239
10248	Число итераций:	25	0	10247
10249	Минимальная допустимая ошибка классификатора:	0	1	10247
10250	Максимальная допустимая ошибка классификатора:	0,5	2	10247
10251	Начальное значение (Seed)	1	3	10247
10252	Базовый классификатор 0:	CART	4	10247
10253	Базовый классификатор 1:	C45	5	10247
10256	Число итераций:	25	0	10255
10257	Минимальная допустимая ошибка классификатора:	0	1	10255
10258	Максимальная допустимая ошибка классификатора:	0,5	2	10255
10259	Начальное значение (Seed)	1	3	10255
10260	Базовый классификатор 0:	CART	4	10255
10261	Базовый классификатор 1:	ID3	5	10255
10264	Число итераций:	25	0	10263
10265	Минимальная допустимая ошибка классификатора:	0	1	10263
10266	Максимальная допустимая ошибка классификатора:	0,5	2	10263
10267	Начальное значение (Seed)	1	3	10263
10268	Базовый классификатор 0:	CART	4	10263
10269	Базовый классификатор 1:	C45	5	10263
10270	Базовый классификатор 2:	C45	6	10263
6019	Число деревьев:	10	0	683
10273	Число итераций:	25	0	10272
10274	Минимальная допустимая ошибка классификатора:	0	1	10272
10275	Максимальная допустимая ошибка классификатора:	0,5	2	10272
6020	Минимальное число объектов в листе:	2	1	683
6021	Максиальная глубина дерева:	0	2	683
6022	Число случайных атрибутов:	3	3	683
6023	Алгоритм построения дерева решений:	CART	4	683
6024	Число случайных расщеплений атрибута:	10	5	683
6025	Формирование обучающих выборок:	Бутстрэп-выборки	6	683
5320	Число случайных расщеплений атрибута:	15	5	685
5321	Формирование обучающих выборок:	Исходное обучающее множество	6	685
10276	Начальное значение (Seed)	1	3	10272
10277	Базовый классификатор 0:	CART	4	10272
10278	Базовый классификатор 1:	C45	5	10272
10279	Базовый классификатор 2:	ID3	6	10272
10282	Число итераций:	25	0	10281
10283	Минимальная допустимая ошибка классификатора:	0	1	10281
10284	Максимальная допустимая ошибка классификатора:	0,5	2	10281
10285	Метод голосования:	Метод большинства голосов	3	10281
10286	Формирование обучающих выборок:	Случайные подвыборки	4	10281
10287	Выбор классификатора:	Оптимальный классификатор	5	10281
10288	Число потоков	2	6	10281
10289	Начальное значение (Seed)	1	7	10281
10290	Базовый классификатор 0:	CART	8	10281
10291	Базовый классификатор 1:	C45	9	10281
10294	Число итераций:	25	0	10293
10295	Минимальная допустимая ошибка классификатора:	0	1	10293
6151	Метод голосования:	Метод большинства голосов	3	679
10296	Максимальная допустимая ошибка классификатора:	0,5	2	10293
10297	Метод голосования:	Метод большинства голосов	3	10293
10298	Формирование обучающих выборок:	Случайные подвыборки	4	10293
10299	Выбор классификатора:	Оптимальный классификатор	5	10293
10300	Число потоков	2	6	10293
10301	Начальное значение (Seed)	1	7	10293
10302	Базовый классификатор 0:	CART	8	10293
10303	Базовый классификатор 1:	C45	9	10293
10306	Число итераций:	25	0	10305
10307	Минимальная допустимая ошибка классификатора:	0	1	10305
10308	Максимальная допустимая ошибка классификатора:	0,5	2	10305
10309	Метод голосования:	Метод большинства голосов	3	10305
10310	Формирование обучающих выборок:	Случайные подвыборки	4	10305
10311	Выбор классификатора:	Оптимальный классификатор	5	10305
10312	Число потоков	2	6	10305
10313	Начальное значение (Seed)	1	7	10305
10314	Базовый классификатор 0:	CART	8	10305
10315	Базовый классификатор 1:	ID3	9	10305
10318	Число итераций:	25	0	10317
10319	Минимальная допустимая ошибка классификатора:	0	1	10317
10320	Максимальная допустимая ошибка классификатора:	0,5	2	10317
10321	Метод голосования:	Метод большинства голосов	3	10317
10322	Формирование обучающих выборок:	Случайные подвыборки	4	10317
10323	Выбор классификатора:	Оптимальный классификатор	5	10317
10324	Число потоков	2	6	10317
10325	Начальное значение (Seed)	1	7	10317
10326	Базовый классификатор 0:	CART	8	10317
10327	Базовый классификатор 1:	C45	9	10317
10328	Базовый классификатор 2:	C45	10	10317
10331	Число итераций:	25	0	10330
10332	Минимальная допустимая ошибка классификатора:	0	1	10330
10333	Максимальная допустимая ошибка классификатора:	0,5	2	10330
10334	Метод голосования:	Метод большинства голосов	3	10330
10335	Формирование обучающих выборок:	Случайные подвыборки	4	10330
10336	Выбор классификатора:	Оптимальный классификатор	5	10330
10337	Число потоков	2	6	10330
10338	Начальное значение (Seed)	1	7	10330
6244	Бинарное дерево:	true	3	638
6245	Использование случайных расщеплений атрибута:	false	4	638
6059	Минимальное число объектов в листе:	2	0	668
6060	Максиальная глубина дерева:	0	1	668
6061	Случайное дерево:	false	2	668
10339	Базовый классификатор 0:	CART	8	10330
10340	Базовый классификатор 1:	C45	9	10330
10341	Базовый классификатор 2:	ID3	10	10330
10344	Число итераций:	25	0	10343
10345	Минимальная допустимая ошибка классификатора:	0	1	10343
10346	Максимальная допустимая ошибка классификатора:	0,5	2	10343
10347	Метод голосования:	Метод взвешенного голосования	3	10343
10348	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	10343
10349	Выбор классификатора:	Случайный классификатор	5	10343
10350	Число потоков	2	6	10343
10351	Начальное значение (Seed)	1	7	10343
10352	Базовый классификатор 0:	J48	8	10343
10353	Базовый классификатор 1:	NeuralNetwork	9	10343
10354	Базовый классификатор 2:	NeuralNetwork	10	10343
10355	Базовый классификатор 3:	KNearestNeighbours	11	10343
10358	Число итераций:	25	0	10357
10359	Минимальная допустимая ошибка классификатора:	0	1	10357
10360	Максимальная допустимая ошибка классификатора:	0,5	2	10357
10361	Метод голосования:	Метод взвешенного голосования	3	10357
10362	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	10357
10363	Выбор классификатора:	Случайный классификатор	5	10357
10364	Число потоков	2	6	10357
10365	Начальное значение (Seed)	1	7	10357
10366	Базовый классификатор 0:	J48	8	10357
10367	Базовый классификатор 1:	NeuralNetwork	9	10357
10370	Число итераций:	25	0	10369
10371	Минимальная допустимая ошибка классификатора:	0	1	10369
10372	Максимальная допустимая ошибка классификатора:	0,5	2	10369
10373	Метод голосования:	Метод большинства голосов	3	10369
10374	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	10369
10375	Выбор классификатора:	Случайный классификатор	5	10369
10376	Число потоков	2	6	10369
10377	Начальное значение (Seed)	1	7	10369
10378	Базовый классификатор 0:	J48	8	10369
10379	Базовый классификатор 1:	NeuralNetwork	9	10369
10382	Число итераций:	25	0	10381
10383	Минимальная допустимая ошибка классификатора:	0	1	10381
10384	Максимальная допустимая ошибка классификатора:	0,5	2	10381
10385	Метод голосования:	Метод большинства голосов	3	10381
10386	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	10381
10387	Выбор классификатора:	Случайный классификатор	5	10381
10388	Число потоков	2	6	10381
10389	Начальное значение (Seed)	1	7	10381
10390	Базовый классификатор 0:	J48	8	10381
10391	Базовый классификатор 1:	NeuralNetwork	9	10381
10394	Число итераций:	25	0	10393
10395	Минимальная допустимая ошибка классификатора:	0	1	10393
10396	Максимальная допустимая ошибка классификатора:	0,5	2	10393
6136	Минимальное число объектов в листе:	2	0	654
3721	Число деревьев:	10	0	686
3722	Минимальное число объектов в листе:	2	1	686
3723	Максиальная глубина дерева:	0	2	686
3724	Число случайных атрибутов:	3	3	686
3725	Алгоритм построения дерева решений:	C45	4	686
3726	Число случайных расщеплений атрибута:	20	5	686
3727	Формирование обучающих выборок:	Исходное обучающее множество	6	686
10397	Метод голосования:	Метод взвешенного голосования	3	10393
10398	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	10393
10399	Выбор классификатора:	Случайный классификатор	5	10393
10400	Число потоков	2	6	10393
10401	Начальное значение (Seed)	1	7	10393
10402	Базовый классификатор 0:	NeuralNetwork	8	10393
10403	Базовый классификатор 1:	KNearestNeighbours	9	10393
10406	Число итераций:	25	0	10405
10407	Минимальная допустимая ошибка классификатора:	0	1	10405
10408	Максимальная допустимая ошибка классификатора:	0,5	2	10405
10409	Метод голосования:	Метод большинства голосов	3	10405
10410	Формирование обучающих выборок:	Бутстрэп выборки	4	10405
10411	Выбор классификатора:	Случайный классификатор	5	10405
10412	Число потоков	2	6	10405
10413	Начальное значение (Seed)	1	7	10405
10414	Базовый классификатор 0:	J48	8	10405
10417	Число итераций:	25	0	10416
10418	Минимальная допустимая ошибка классификатора:	0	1	10416
10419	Максимальная допустимая ошибка классификатора:	0,5	2	10416
10420	Метод голосования:	Метод большинства голосов	3	10416
10421	Формирование обучающих выборок:	Бутстрэп выборки	4	10416
10422	Выбор классификатора:	Оптимальный классификатор	5	10416
10423	Число потоков	2	6	10416
10424	Начальное значение (Seed)	1	7	10416
10425	Базовый классификатор 0:	J48	8	10416
10428	Число итераций:	25	0	10427
10429	Минимальная допустимая ошибка классификатора:	0	1	10427
10430	Максимальная допустимая ошибка классификатора:	0,5	2	10427
10431	Метод голосования:	Метод большинства голосов	3	10427
10432	Формирование обучающих выборок:	Бутстрэп выборки	4	10427
10433	Выбор классификатора:	Случайный классификатор	5	10427
10434	Число потоков	2	6	10427
6137	Максиальная глубина дерева:	0	1	654
6138	Случайное дерево:	false	2	654
6139	Бинарное дерево:	true	3	654
6140	Использование случайных расщеплений атрибута:	false	4	654
6148	Число итераций:	10	0	679
6149	Минимальная допустимая ошибка классификатора:	0	1	679
6150	Максимальная допустимая ошибка классификатора:	0,5	2	679
6152	Формирование обучающих выборок:	Случайные подвыборки	4	679
6153	Выбор классификатора:	Случайный классификатор	5	679
6154	Базовый классификатор 0:	CART	6	679
5039	Минимальное число объектов в листе:	2	1	687
5040	Максиальная глубина дерева:	0	2	687
5041	Число случайных атрибутов:	3	3	687
5042	Алгоритм построения дерева решений:	C45	4	687
6012	Число деревьев:	25	0	688
6013	Минимальное число объектов в листе:	2	1	688
6014	Максиальная глубина дерева:	0	2	688
6015	Число случайных атрибутов:	3	3	688
6016	Алгоритм построения дерева решений:	C45	4	688
6017	Число случайных расщеплений атрибута:	20	5	688
6018	Формирование обучающих выборок:	Исходное обучающее множество	6	688
6826	Максиальная глубина дерева:	0	1	689
6827	Случайное дерево:	false	2	689
6828	Бинарное дерево:	false	3	689
5508	Минимальное число объектов в листе:	2	0	697
10435	Начальное значение (Seed)	1	7	10427
10436	Базовый классификатор 0:	J48	8	10427
10439	Число итераций:	25	0	10438
10440	Минимальная допустимая ошибка классификатора:	0	1	10438
10441	Максимальная допустимая ошибка классификатора:	0,5	2	10438
10442	Метод голосования:	Метод большинства голосов	3	10438
10443	Формирование обучающих выборок:	Бутстрэп выборки	4	10438
10444	Выбор классификатора:	Оптимальный классификатор	5	10438
10445	Число потоков	2	6	10438
10446	Начальное значение (Seed)	1	7	10438
10447	Базовый классификатор 0:	J48	8	10438
10450	Число итераций:	25	0	10449
10451	Минимальная допустимая ошибка классификатора:	0	1	10449
10452	Максимальная допустимая ошибка классификатора:	0,5	2	10449
10453	Метод голосования:	Метод большинства голосов	3	10449
10454	Формирование обучающих выборок:	Бутстрэп выборки	4	10449
10455	Выбор классификатора:	Случайный классификатор	5	10449
10456	Число потоков	2	6	10449
10457	Начальное значение (Seed)	1	7	10449
10458	Базовый классификатор 0:	J48	8	10449
10459	Базовый классификатор 1:	J48	9	10449
10462	Мета-классификатор:	KNearestNeighbours	0	10461
10463	Метод формирования мета-признаков:	Использование обучающего множества	1	10461
10464	Начальное значение (Seed)	1	2	10461
10465	Базовый классификатор 0:	KNearestNeighbours	3	10461
10468	Мета-классификатор:	KNearestNeighbours	0	10467
10469	Метод формирования мета-признаков:	Использование обучающего множества	1	10467
10470	Начальное значение (Seed)	1	2	10467
10471	Базовый классификатор 0:	KNearestNeighbours	3	10467
10474	Мета-классификатор:	KNearestNeighbours	0	10473
10475	Метод формирования мета-признаков:	Использование обучающего множества	1	10473
10476	Начальное значение (Seed)	1	2	10473
10477	Базовый классификатор 0:	KNearestNeighbours	3	10473
10480	Мета-классификатор:	KNearestNeighbours	0	10479
10481	Метод формирования мета-признаков:	Использование обучающего множества	1	10479
10482	Начальное значение (Seed)	1	2	10479
10483	Базовый классификатор 0:	KNearestNeighbours	3	10479
10486	Мета-классификатор:	KNearestNeighbours	0	10485
10487	Метод формирования мета-признаков:	Использование обучающего множества	1	10485
10488	Начальное значение (Seed)	1	2	10485
10489	Базовый классификатор 0:	KNearestNeighbours	3	10485
10490	Базовый классификатор 1:	KNearestNeighbours	4	10485
10493	Число итераций:	25	0	10492
10494	Минимальная допустимая ошибка классификатора:	0	1	10492
10495	Максимальная допустимая ошибка классификатора:	0,5	2	10492
10496	Метод голосования:	Метод большинства голосов	3	10492
10498	Выбор классификатора:	Случайный классификатор	5	10492
6241	Минимальное число объектов в листе:	2	0	638
6242	Максиальная глубина дерева:	0	1	638
6243	Случайное дерево:	false	2	638
6217	Число деревьев:	10	0	648
6218	Минимальное число объектов в листе:	2	1	648
6219	Максиальная глубина дерева:	0	2	648
6220	Число случайных атрибутов:	3	3	648
10497	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	10492
10499	Число потоков	2	6	10492
10500	Начальное значение (Seed)	1	7	10492
10501	Базовый классификатор 0:	KNearestNeighbours	8	10492
10502	Базовый классификатор 1:	KNearestNeighbours	9	10492
10503	Базовый классификатор 2:	KNearestNeighbours	10	10492
10504	Базовый классификатор 3:	KNearestNeighbours	11	10492
10507	Число итераций:	25	0	10506
10508	Минимальная допустимая ошибка классификатора:	0	1	10506
10509	Максимальная допустимая ошибка классификатора:	0,5	2	10506
10510	Метод голосования:	Метод большинства голосов	3	10506
10511	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	10506
10512	Выбор классификатора:	Случайный классификатор	5	10506
10513	Число потоков	2	6	10506
10514	Начальное значение (Seed)	1	7	10506
10515	Базовый классификатор 0:	KNearestNeighbours	8	10506
10518	Число итераций:	25	0	10517
10519	Минимальная допустимая ошибка классификатора:	0	1	10517
10520	Максимальная допустимая ошибка классификатора:	0,5	2	10517
10521	Метод голосования:	Метод большинства голосов	3	10517
10522	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	10517
10523	Выбор классификатора:	Оптимальный классификатор	5	10517
10524	Число потоков	2	6	10517
10525	Начальное значение (Seed)	1	7	10517
10526	Базовый классификатор 0:	KNearestNeighbours	8	10517
10529	Число итераций:	25	0	10528
10530	Минимальная допустимая ошибка классификатора:	0	1	10528
10531	Максимальная допустимая ошибка классификатора:	0,5	2	10528
10532	Метод голосования:	Метод большинства голосов	3	10528
10533	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	10528
10534	Выбор классификатора:	Случайный классификатор	5	10528
10535	Число потоков	2	6	10528
10536	Начальное значение (Seed)	1	7	10528
10537	Базовый классификатор 0:	KNearestNeighbours	8	10528
10538	Базовый классификатор 1:	KNearestNeighbours	9	10528
10539	Базовый классификатор 2:	KNearestNeighbours	10	10528
10542	Число итераций:	25	0	10541
10543	Минимальная допустимая ошибка классификатора:	0	1	10541
10544	Максимальная допустимая ошибка классификатора:	0,5	2	10541
10545	Метод голосования:	Метод большинства голосов	3	10541
10546	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	10541
10547	Выбор классификатора:	Случайный классификатор	5	10541
10548	Число потоков	2	6	10541
10549	Начальное значение (Seed)	1	7	10541
10550	Базовый классификатор 0:	KNearestNeighbours	8	10541
10551	Базовый классификатор 1:	KNearestNeighbours	9	10541
10552	Базовый классификатор 2:	KNearestNeighbours	10	10541
10555	Число итераций:	25	0	10554
10556	Минимальная допустимая ошибка классификатора:	0	1	10554
10557	Максимальная допустимая ошибка классификатора:	0,5	2	10554
10558	Начальное значение (Seed)	1	3	10554
6829	Использование случайных расщеплений атрибута:	false	4	689
3468	Число деревьев:	50	0	690
6308	Число деревьев:	10	0	701
10559	Базовый классификатор 0:	J48	4	10554
10562	Число итераций:	25	0	10561
10563	Минимальная допустимая ошибка классификатора:	0	1	10561
10564	Максимальная допустимая ошибка классификатора:	0,5	2	10561
10565	Начальное значение (Seed)	1	3	10561
10566	Базовый классификатор 0:	J48	4	10561
10569	Число итераций:	25	0	10568
10570	Минимальная допустимая ошибка классификатора:	0	1	10568
10571	Максимальная допустимая ошибка классификатора:	0,5	2	10568
10572	Начальное значение (Seed)	1	3	10568
10573	Базовый классификатор 0:	J48	4	10568
10574	Базовый классификатор 1:	J48	5	10568
10577	Число итераций:	25	0	10576
10578	Минимальная допустимая ошибка классификатора:	0	1	10576
10579	Максимальная допустимая ошибка классификатора:	0,5	2	10576
10580	Начальное значение (Seed)	1	3	10576
10581	Базовый классификатор 0:	J48	4	10576
10582	Базовый классификатор 1:	J48	5	10576
10585	Число итераций:	25	0	10584
10586	Минимальная допустимая ошибка классификатора:	0	1	10584
10587	Максимальная допустимая ошибка классификатора:	0,5	2	10584
10588	Начальное значение (Seed)	1	3	10584
10589	Базовый классификатор 0:	J48	4	10584
10590	Базовый классификатор 1:	J48	5	10584
10593	Мета-классификатор:	J48	0	10592
10594	Метод формирования мета-признаков:	Использование обучающего множества	1	10592
10595	Начальное значение (Seed)	1	2	10592
10596	Базовый классификатор 0:	J48	3	10592
10599	Мета-классификатор:	J48	0	10598
10600	Метод формирования мета-признаков:	Использование обучающего множества	1	10598
10601	Начальное значение (Seed)	1	2	10598
10602	Базовый классификатор 0:	J48	3	10598
10605	Мета-классификатор:	J48	0	10604
10606	Метод формирования мета-признаков:	Использование обучающего множества	1	10604
10607	Начальное значение (Seed)	1	2	10604
10608	Базовый классификатор 0:	J48	3	10604
10609	Базовый классификатор 1:	J48	4	10604
10612	Мета-классификатор:	J48	0	10611
10613	Метод формирования мета-признаков:	Использование обучающего множества	1	10611
10614	Начальное значение (Seed)	1	2	10611
10615	Базовый классификатор 0:	J48	3	10611
10616	Базовый классификатор 1:	J48	4	10611
10619	Мета-классификатор:	J48	0	10618
10620	Метод формирования мета-признаков:	Использование обучающего множества	1	10618
10621	Начальное значение (Seed)	1	2	10618
10622	Базовый классификатор 0:	J48	3	10618
10623	Базовый классификатор 1:	J48	4	10618
10626	Число деревьев:	21	0	10625
10627	Минимальное число объектов в листе:	6	1	10625
10628	Максиальная глубина дерева:	0	2	10625
10629	Число случайных атрибутов:	8	3	10625
10630	Алгоритм построения дерева решений:	ID3	4	10625
10631	Число потоков	2	5	10625
10632	Начальное значение (Seed)	1	6	10625
10635	Число деревьев:	47	0	10634
10636	Минимальное число объектов в листе:	7	1	10634
10637	Максиальная глубина дерева:	0	2	10634
10638	Число случайных атрибутов:	13	3	10634
10639	Алгоритм построения дерева решений:	C45	4	10634
10640	Число потоков	2	5	10634
6353	Число деревьев:	10	0	657
6354	Минимальное число объектов в листе:	2	1	657
6355	Максиальная глубина дерева:	0	2	657
6356	Число случайных атрибутов:	4	3	657
6357	Алгоритм построения дерева решений:	CART	4	657
10641	Начальное значение (Seed)	1	6	10634
10644	Число деревьев:	39	0	10643
10645	Минимальное число объектов в листе:	5	1	10643
10646	Максиальная глубина дерева:	0	2	10643
10647	Число случайных атрибутов:	15	3	10643
10648	Алгоритм построения дерева решений:	CHAID	4	10643
10649	Число потоков	2	5	10643
10650	Начальное значение (Seed)	1	6	10643
10653	Число деревьев:	32	0	10652
10654	Минимальное число объектов в листе:	8	1	10652
10655	Максиальная глубина дерева:	0	2	10652
10656	Число случайных атрибутов:	13	3	10652
10657	Алгоритм построения дерева решений:	C45	4	10652
10658	Число потоков	2	5	10652
10659	Начальное значение (Seed)	1	6	10652
10662	Число деревьев:	45	0	10661
10663	Минимальное число объектов в листе:	9	1	10661
10664	Максиальная глубина дерева:	0	2	10661
10665	Число случайных атрибутов:	13	3	10661
10666	Алгоритм построения дерева решений:	ID3	4	10661
10667	Число потоков	2	5	10661
10668	Начальное значение (Seed)	1	6	10661
10671	Число итераций:	25	0	10670
10672	Минимальная допустимая ошибка классификатора:	0	1	10670
10673	Максимальная допустимая ошибка классификатора:	0,5	2	10670
10674	Метод голосования:	Метод большинства голосов	3	10670
10675	Формирование обучающих выборок:	Случайные подвыборки	4	10670
10676	Выбор классификатора:	Случайный классификатор	5	10670
10677	Число потоков	2	6	10670
10678	Начальное значение (Seed)	1	7	10670
10679	Базовый классификатор 0:	KNearestNeighbours	8	10670
10680	Базовый классификатор 1:	KNearestNeighbours	9	10670
10681	Базовый классификатор 2:	KNearestNeighbours	10	10670
10684	Число итераций:	25	0	10683
10685	Минимальная допустимая ошибка классификатора:	0	1	10683
10686	Максимальная допустимая ошибка классификатора:	0,5	2	10683
10687	Метод голосования:	Метод большинства голосов	3	10683
10688	Формирование обучающих выборок:	Случайные подвыборки	4	10683
10689	Выбор классификатора:	Случайный классификатор	5	10683
10690	Число потоков	2	6	10683
10691	Начальное значение (Seed)	1	7	10683
10692	Базовый классификатор 0:	KNearestNeighbours	8	10683
10693	Базовый классификатор 1:	KNearestNeighbours	9	10683
10694	Базовый классификатор 2:	KNearestNeighbours	10	10683
10697	Число итераций:	25	0	10696
10698	Минимальная допустимая ошибка классификатора:	0	1	10696
10699	Максимальная допустимая ошибка классификатора:	0,5	2	10696
10700	Метод голосования:	Метод большинства голосов	3	10696
10701	Формирование обучающих выборок:	Случайные подвыборки	4	10696
10702	Выбор классификатора:	Случайный классификатор	5	10696
10703	Число потоков	2	6	10696
10704	Начальное значение (Seed)	1	7	10696
10705	Базовый классификатор 0:	KNearestNeighbours	8	10696
10706	Базовый классификатор 1:	KNearestNeighbours	9	10696
6445	Число итераций:	10	0	660
6446	Минимальная допустимая ошибка классификатора:	0	1	660
6447	Максимальная допустимая ошибка классификатора:	0,5	2	660
6448	Метод голосования:	Метод большинства голосов	3	660
5511	Бинарное дерево:	false	3	697
10707	Базовый классификатор 2:	KNearestNeighbours	10	10696
10710	Число итераций:	1	0	10709
10711	Минимальная допустимая ошибка классификатора:	0	1	10709
10712	Максимальная допустимая ошибка классификатора:	0,5	2	10709
10713	Метод голосования:	Метод взвешенного голосования	3	10709
10714	Формирование обучающих выборок:	Использование исходной выборки	4	10709
10715	Выбор классификатора:	Случайный классификатор	5	10709
10716	Число потоков	2	6	10709
10717	Начальное значение (Seed)	1	7	10709
10718	Базовый классификатор 0:	KNearestNeighbours	8	10709
10721	Число итераций:	1	0	10720
10722	Минимальная допустимая ошибка классификатора:	0	1	10720
10723	Максимальная допустимая ошибка классификатора:	0,5	2	10720
10724	Метод голосования:	Метод большинства голосов	3	10720
10725	Формирование обучающих выборок:	Использование исходной выборки	4	10720
10726	Выбор классификатора:	Случайный классификатор	5	10720
10727	Число потоков	2	6	10720
10728	Начальное значение (Seed)	1	7	10720
10729	Базовый классификатор 0:	KNearestNeighbours	8	10720
10732	Число деревьев:	37	0	10731
10733	Минимальное число объектов в листе:	4	1	10731
10734	Максиальная глубина дерева:	0	2	10731
10735	Число случайных атрибутов:	8	3	10731
10736	Алгоритм построения дерева решений:	ID3	4	10731
10737	Число потоков	2	5	10731
10738	Начальное значение (Seed)	1	6	10731
10739	Число случайных расщеплений атрибута:	6	7	10731
10740	Формирование обучающих выборок:	Бутстрэп-выборки	8	10731
10743	Число деревьев:	35	0	10742
10744	Минимальное число объектов в листе:	2	1	10742
10745	Максиальная глубина дерева:	0	2	10742
10746	Число случайных атрибутов:	9	3	10742
10747	Алгоритм построения дерева решений:	CART	4	10742
10748	Число потоков	2	5	10742
10749	Начальное значение (Seed)	1	6	10742
10752	Число деревьев:	50	0	10751
10753	Минимальное число объектов в листе:	4	1	10751
10754	Максиальная глубина дерева:	0	2	10751
10755	Число случайных атрибутов:	3	3	10751
10756	Алгоритм построения дерева решений:	ID3	4	10751
10757	Число потоков	2	5	10751
10758	Начальное значение (Seed)	1	6	10751
10761	Число деревьев:	40	0	10760
10762	Минимальное число объектов в листе:	2	1	10760
10763	Максиальная глубина дерева:	0	2	10760
10764	Число случайных атрибутов:	9	3	10760
10765	Алгоритм построения дерева решений:	ID3	4	10760
10766	Число потоков	2	5	10760
10767	Начальное значение (Seed)	1	6	10760
10768	Число случайных расщеплений атрибута:	11	7	10760
10769	Формирование обучающих выборок:	Исходное обучающее множество	8	10760
10772	Число деревьев:	49	0	10771
10773	Минимальное число объектов в листе:	4	1	10771
10774	Максиальная глубина дерева:	0	2	10771
10775	Число случайных атрибутов:	3	3	10771
10776	Алгоритм построения дерева решений:	ID3	4	10771
10777	Число потоков	2	5	10771
10778	Начальное значение (Seed)	1	6	10771
10781	Число деревьев:	27	0	10780
10782	Минимальное число объектов в листе:	2	1	10780
6489	Число деревьев:	10	0	681
6490	Минимальное число объектов в листе:	2	1	681
6491	Максиальная глубина дерева:	0	2	681
6492	Число случайных атрибутов:	3	3	681
6493	Алгоритм построения дерева решений:	CART	4	681
10783	Максиальная глубина дерева:	0	2	10780
10784	Число случайных атрибутов:	6	3	10780
10785	Алгоритм построения дерева решений:	C45	4	10780
10786	Число потоков	1	5	10780
10787	Начальное значение (Seed)	1	6	10780
10788	Число случайных расщеплений атрибута:	22	7	10780
10789	Формирование обучающих выборок:	Исходное обучающее множество	8	10780
10792	Число деревьев:	23	0	10791
10793	Минимальное число объектов в листе:	2	1	10791
10794	Максиальная глубина дерева:	0	2	10791
10795	Число случайных атрибутов:	7	3	10791
10796	Алгоритм построения дерева решений:	ID3	4	10791
10797	Число потоков	1	5	10791
10798	Начальное значение (Seed)	1	6	10791
10799	Число случайных расщеплений атрибута:	19	7	10791
10800	Формирование обучающих выборок:	Бутстрэп-выборки	8	10791
10803	Число деревьев:	29	0	10802
10804	Минимальное число объектов в листе:	2	1	10802
10805	Максиальная глубина дерева:	0	2	10802
10806	Число случайных атрибутов:	5	3	10802
10807	Алгоритм построения дерева решений:	ID3	4	10802
10808	Число потоков	1	5	10802
10809	Начальное значение (Seed)	1	6	10802
10812	Число деревьев:	41	0	10811
10813	Минимальное число объектов в листе:	3	1	10811
10814	Максиальная глубина дерева:	0	2	10811
10815	Число случайных атрибутов:	3	3	10811
10816	Алгоритм построения дерева решений:	ID3	4	10811
10817	Число потоков	1	5	10811
10818	Начальное значение (Seed)	1	6	10811
10821	Число деревьев:	45	0	10820
10822	Минимальное число объектов в листе:	3	1	10820
10823	Максиальная глубина дерева:	0	2	10820
10824	Число случайных атрибутов:	5	3	10820
10825	Алгоритм построения дерева решений:	ID3	4	10820
10826	Число потоков	1	5	10820
10827	Начальное значение (Seed)	1	6	10820
10828	Число случайных расщеплений атрибута:	41	7	10820
10829	Формирование обучающих выборок:	Бутстрэп-выборки	8	10820
10832	Число деревьев:	46	0	10831
10833	Минимальное число объектов в листе:	4	1	10831
10834	Максиальная глубина дерева:	0	2	10831
10835	Число случайных атрибутов:	14	3	10831
10836	Алгоритм построения дерева решений:	C45	4	10831
10837	Число потоков	2	5	10831
10838	Начальное значение (Seed)	1	6	10831
10841	Число деревьев:	37	0	10840
10842	Минимальное число объектов в листе:	2	1	10840
10843	Максиальная глубина дерева:	0	2	10840
10844	Число случайных атрибутов:	28	3	10840
10845	Алгоритм построения дерева решений:	CHAID	4	10840
10846	Число потоков	2	5	10840
10847	Начальное значение (Seed)	1	6	10840
10848	Число случайных расщеплений атрибута:	37	7	10840
10849	Формирование обучающих выборок:	Бутстрэп-выборки	8	10840
10852	Число деревьев:	33	0	10851
10853	Минимальное число объектов в листе:	8	1	10851
10854	Максиальная глубина дерева:	0	2	10851
10855	Число случайных атрибутов:	8	3	10851
6550	Минимальное число объектов в листе:	2	0	667
10856	Алгоритм построения дерева решений:	CHAID	4	10851
10857	Число потоков	2	5	10851
10858	Начальное значение (Seed)	1	6	10851
6551	Максиальная глубина дерева:	0	1	667
6552	Случайное дерево:	false	2	667
10861	Число деревьев:	34	0	10860
10862	Минимальное число объектов в листе:	5	1	10860
10863	Максиальная глубина дерева:	0	2	10860
10864	Число случайных атрибутов:	10	3	10860
10865	Алгоритм построения дерева решений:	ID3	4	10860
10866	Число потоков	2	5	10860
10867	Начальное значение (Seed)	1	6	10860
10870	Число деревьев:	22	0	10869
10871	Минимальное число объектов в листе:	2	1	10869
10872	Максиальная глубина дерева:	0	2	10869
10873	Число случайных атрибутов:	14	3	10869
10874	Алгоритм построения дерева решений:	CHAID	4	10869
10875	Число потоков	2	5	10869
10876	Начальное значение (Seed)	1	6	10869
10879	Число итераций:	25	0	10878
10880	Минимальная допустимая ошибка классификатора:	0	1	10878
10881	Максимальная допустимая ошибка классификатора:	0,5	2	10878
10882	Метод голосования:	Метод большинства голосов	3	10878
10883	Формирование обучающих выборок:	Бутстрэп выборки	4	10878
10884	Выбор классификатора:	Случайный классификатор	5	10878
10885	Число потоков	2	6	10878
10886	Начальное значение (Seed)	1	7	10878
10887	Базовый классификатор 0:	J48	8	10878
10888	Базовый классификатор 1:	J48	9	10878
10889	Базовый классификатор 2:	J48	10	10878
10892	Число итераций:	25	0	10891
10893	Минимальная допустимая ошибка классификатора:	0	1	10891
10894	Максимальная допустимая ошибка классификатора:	0,5	2	10891
10895	Метод голосования:	Метод большинства голосов	3	10891
10896	Формирование обучающих выборок:	Бутстрэп выборки	4	10891
10897	Выбор классификатора:	Случайный классификатор	5	10891
10898	Число потоков	2	6	10891
10899	Начальное значение (Seed)	1	7	10891
10900	Базовый классификатор 0:	J48	8	10891
10901	Базовый классификатор 1:	J48	9	10891
10902	Базовый классификатор 2:	J48	10	10891
10905	Число итераций:	25	0	10904
10906	Минимальная допустимая ошибка классификатора:	0	1	10904
10907	Максимальная допустимая ошибка классификатора:	0,5	2	10904
10908	Метод голосования:	Метод большинства голосов	3	10904
10909	Формирование обучающих выборок:	Случайные подвыборки	4	10904
10910	Выбор классификатора:	Случайный классификатор	5	10904
10911	Число потоков	2	6	10904
10912	Начальное значение (Seed)	1	7	10904
10913	Базовый классификатор 0:	J48	8	10904
10916	Число итераций:	25	0	10915
10917	Минимальная допустимая ошибка классификатора:	0	1	10915
10918	Максимальная допустимая ошибка классификатора:	0,5	2	10915
10919	Метод голосования:	Метод большинства голосов	3	10915
10920	Формирование обучающих выборок:	Случайные подвыборки	4	10915
10921	Выбор классификатора:	Оптимальный классификатор	5	10915
10922	Число потоков	2	6	10915
10923	Начальное значение (Seed)	1	7	10915
10924	Базовый классификатор 0:	J48	8	10915
10927	Число итераций:	25	0	10926
10928	Минимальная допустимая ошибка классификатора:	0	1	10926
10929	Максимальная допустимая ошибка классификатора:	0,5	2	10926
6610	Минимальное число объектов в листе:	2	0	665
6611	Максиальная глубина дерева:	0	1	665
6612	Случайное дерево:	false	2	665
6613	Бинарное дерево:	true	3	665
6614	Использование случайных расщеплений атрибута:	false	4	665
6662	Число деревьев:	10	0	684
6663	Минимальное число объектов в листе:	2	1	684
10930	Метод голосования:	Метод большинства голосов	3	10926
10931	Формирование обучающих выборок:	Случайные подвыборки	4	10926
10932	Выбор классификатора:	Случайный классификатор	5	10926
10933	Число потоков	2	6	10926
10934	Начальное значение (Seed)	1	7	10926
10935	Базовый классификатор 0:	J48	8	10926
10938	Число итераций:	25	0	10937
10939	Минимальная допустимая ошибка классификатора:	0	1	10937
10940	Максимальная допустимая ошибка классификатора:	0,5	2	10937
10941	Начальное значение (Seed)	1	3	10937
10942	Базовый классификатор 0:	KNearestNeighbours	4	10937
10943	Базовый классификатор 1:	KNearestNeighbours	5	10937
10946	Число итераций:	25	0	10945
10947	Минимальная допустимая ошибка классификатора:	0	1	10945
10948	Максимальная допустимая ошибка классификатора:	0,5	2	10945
10949	Начальное значение (Seed)	1	3	10945
10950	Базовый классификатор 0:	KNearestNeighbours	4	10945
10951	Базовый классификатор 1:	KNearestNeighbours	5	10945
10952	Базовый классификатор 2:	KNearestNeighbours	6	10945
10955	Число итераций:	25	0	10954
10956	Минимальная допустимая ошибка классификатора:	0	1	10954
10957	Максимальная допустимая ошибка классификатора:	0,5	2	10954
10958	Начальное значение (Seed)	1	3	10954
10959	Базовый классификатор 0:	KNearestNeighbours	4	10954
10960	Базовый классификатор 1:	KNearestNeighbours	5	10954
10961	Базовый классификатор 2:	KNearestNeighbours	6	10954
10964	Число итераций:	25	0	10963
10965	Минимальная допустимая ошибка классификатора:	0	1	10963
10966	Максимальная допустимая ошибка классификатора:	0,5	2	10963
10967	Начальное значение (Seed)	1	3	10963
10968	Базовый классификатор 0:	KNearestNeighbours	4	10963
10969	Базовый классификатор 1:	KNearestNeighbours	5	10963
10970	Базовый классификатор 2:	KNearestNeighbours	6	10963
10971	Базовый классификатор 3:	KNearestNeighbours	7	10963
10974	Число итераций:	25	0	10973
10975	Минимальная допустимая ошибка классификатора:	0	1	10973
10976	Максимальная допустимая ошибка классификатора:	0,5	2	10973
10977	Начальное значение (Seed)	1	3	10973
10978	Базовый классификатор 0:	KNearestNeighbours	4	10973
10979	Базовый классификатор 1:	KNearestNeighbours	5	10973
10982	Число итераций:	25	0	10981
10983	Минимальная допустимая ошибка классификатора:	0	1	10981
10984	Максимальная допустимая ошибка классификатора:	0,5	2	10981
10985	Метод голосования:	Метод взвешенного голосования	3	10981
10986	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	10981
10987	Выбор классификатора:	Оптимальный классификатор	5	10981
10988	Число потоков	2	6	10981
10989	Начальное значение (Seed)	1	7	10981
10990	Базовый классификатор 0:	NeuralNetwork	8	10981
6720	Мета-классификатор:	CART	0	672
6721	Метод формирования мета-признаков:	Использование обучающего множества	1	672
6722	Базовый классификатор 0:	CART	2	672
6723	Базовый классификатор 1:	Logistic	3	672
6724	Базовый классификатор 2:	C45	4	672
10991	Базовый классификатор 1:	KNearestNeighbours	9	10981
10994	Число итераций:	25	0	10993
10995	Минимальная допустимая ошибка классификатора:	0	1	10993
10996	Максимальная допустимая ошибка классификатора:	0,5	2	10993
10997	Метод голосования:	Метод взвешенного голосования	3	10993
10998	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	10993
10999	Выбор классификатора:	Оптимальный классификатор	5	10993
11000	Число потоков	2	6	10993
11001	Начальное значение (Seed)	1	7	10993
11002	Базовый классификатор 0:	NeuralNetwork	8	10993
11003	Базовый классификатор 1:	NeuralNetwork	9	10993
11004	Базовый классификатор 2:	KNearestNeighbours	10	10993
11007	Число итераций:	25	0	11006
11008	Минимальная допустимая ошибка классификатора:	0	1	11006
11009	Максимальная допустимая ошибка классификатора:	0,5	2	11006
11010	Метод голосования:	Метод взвешенного голосования	3	11006
11011	Формирование обучающих выборок:	Использование исходной выборки	4	11006
11012	Выбор классификатора:	Случайный классификатор	5	11006
11013	Число потоков	2	6	11006
11014	Начальное значение (Seed)	1	7	11006
11015	Базовый классификатор 0:	J48	8	11006
11016	Базовый классификатор 1:	NeuralNetwork	9	11006
11019	Число итераций:	25	0	11018
11020	Минимальная допустимая ошибка классификатора:	0	1	11018
11021	Максимальная допустимая ошибка классификатора:	0,5	2	11018
11022	Метод голосования:	Метод большинства голосов	3	11018
11023	Формирование обучающих выборок:	Использование исходной выборки	4	11018
11024	Выбор классификатора:	Случайный классификатор	5	11018
11025	Число потоков	2	6	11018
11026	Начальное значение (Seed)	1	7	11018
11027	Базовый классификатор 0:	J48	8	11018
11028	Базовый классификатор 1:	NeuralNetwork	9	11018
11031	Число итераций:	25	0	11030
11032	Минимальная допустимая ошибка классификатора:	0	1	11030
11033	Максимальная допустимая ошибка классификатора:	0,5	2	11030
11034	Метод голосования:	Метод взвешенного голосования	3	11030
11035	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	11030
11036	Выбор классификатора:	Оптимальный классификатор	5	11030
11037	Число потоков	2	6	11030
11038	Начальное значение (Seed)	1	7	11030
11039	Базовый классификатор 0:	NeuralNetwork	8	11030
11040	Базовый классификатор 1:	NeuralNetwork	9	11030
11043	Мета-классификатор:	NeuralNetwork	0	11042
11044	Метод формирования мета-признаков:	Использование обучающего множества	1	11042
11045	Начальное значение (Seed)	1	2	11042
11046	Базовый классификатор 0:	J48	3	11042
11049	Мета-классификатор:	NeuralNetwork	0	11048
11050	Метод формирования мета-признаков:	Использование обучающего множества	1	11048
11051	Начальное значение (Seed)	1	2	11048
11052	Базовый классификатор 0:	J48	3	11048
11055	Мета-классификатор:	KNearestNeighbours	0	11054
11056	Метод формирования мета-признаков:	Использование обучающего множества	1	11054
11057	Начальное значение (Seed)	1	2	11054
11058	Базовый классификатор 0:	J48	3	11054
11061	Мета-классификатор:	J48	0	11060
11062	Метод формирования мета-признаков:	Использование обучающего множества	1	11060
6786	Максимальное число итераций:	500	0	645
6787	Метод поиска минимума:	Квазиньютоновский метод	1	645
6763	Минимальное число объектов в листе:	2	0	671
6764	Максиальная глубина дерева:	0	1	671
6765	Случайное дерево:	false	2	671
11063	Начальное значение (Seed)	1	2	11060
11064	Базовый классификатор 0:	J48	3	11060
11067	Мета-классификатор:	KNearestNeighbours	0	11066
11068	Метод формирования мета-признаков:	Использование обучающего множества	1	11066
11069	Начальное значение (Seed)	1	2	11066
11070	Базовый классификатор 0:	NeuralNetwork	3	11066
11071	Базовый классификатор 1:	NeuralNetwork	4	11066
11074	Число итераций:	25	0	11073
11075	Минимальная допустимая ошибка классификатора:	0	1	11073
11313	Допустимая ошибка:	0,00001	5	11307
11076	Максимальная допустимая ошибка классификатора:	0,5	2	11073
11077	Начальное значение (Seed)	1	3	11073
11078	Базовый классификатор 0:	Logistic	4	11073
11081	Число итераций:	25	0	11080
11082	Минимальная допустимая ошибка классификатора:	0	1	11080
11083	Максимальная допустимая ошибка классификатора:	0,5	2	11080
11084	Начальное значение (Seed)	1	3	11080
11085	Базовый классификатор 0:	KNearestNeighbours	4	11080
11086	Базовый классификатор 1:	NeuralNetwork	5	11080
11089	Число итераций:	25	0	11088
11090	Минимальная допустимая ошибка классификатора:	0	1	11088
11091	Максимальная допустимая ошибка классификатора:	0,5	2	11088
11092	Начальное значение (Seed)	1	3	11088
11093	Базовый классификатор 0:	KNearestNeighbours	4	11088
11094	Базовый классификатор 1:	NeuralNetwork	5	11088
11097	Число итераций:	25	0	11096
11098	Минимальная допустимая ошибка классификатора:	0	1	11096
11099	Максимальная допустимая ошибка классификатора:	0,5	2	11096
11100	Начальное значение (Seed)	1	3	11096
11101	Базовый классификатор 0:	KNearestNeighbours	4	11096
11102	Базовый классификатор 1:	KNearestNeighbours	5	11096
11103	Базовый классификатор 2:	NeuralNetwork	6	11096
11106	Число итераций:	25	0	11105
11107	Минимальная допустимая ошибка классификатора:	0	1	11105
11108	Максимальная допустимая ошибка классификатора:	0,5	2	11105
11109	Начальное значение (Seed)	1	3	11105
11110	Базовый классификатор 0:	Logistic	4	11105
11111	Базовый классификатор 1:	KNearestNeighbours	5	11105
11112	Базовый классификатор 2:	NeuralNetwork	6	11105
11115	Мета-классификатор:	KNearestNeighbours	0	11114
11116	Метод формирования мета-признаков:	Использование обучающего множества	1	11114
11117	Начальное значение (Seed)	1	2	11114
11118	Базовый классификатор 0:	Logistic	3	11114
11121	Мета-классификатор:	KNearestNeighbours	0	11120
11122	Метод формирования мета-признаков:	Использование обучающего множества	1	11120
11123	Начальное значение (Seed)	1	2	11120
11124	Базовый классификатор 0:	Logistic	3	11120
11127	Мета-классификатор:	NeuralNetwork	0	11126
11128	Метод формирования мета-признаков:	Использование обучающего множества	1	11126
11129	Начальное значение (Seed)	1	2	11126
11130	Базовый классификатор 0:	Logistic	3	11126
11133	Мета-классификатор:	Logistic	0	11132
11134	Метод формирования мета-признаков:	Использование обучающего множества	1	11132
11135	Начальное значение (Seed)	1	2	11132
11136	Базовый классификатор 0:	Logistic	3	11132
11139	Мета-классификатор:	KNearestNeighbours	0	11138
11140	Метод формирования мета-признаков:	Использование обучающего множества	1	11138
11141	Начальное значение (Seed)	1	2	11138
11142	Базовый классификатор 0:	Logistic	3	11138
6854	Минимальное число объектов в листе:	2	0	676
6855	Максиальная глубина дерева:	0	1	676
6856	Случайное дерево:	false	2	676
6857	Бинарное дерево:	false	3	676
6825	Минимальное число объектов в листе:	2	0	689
11143	Базовый классификатор 1:	KNearestNeighbours	4	11138
11144	Базовый классификатор 2:	KNearestNeighbours	5	11138
11145	Базовый классификатор 3:	NeuralNetwork	6	11138
11148	Минимальное число объектов в листе:	9	0	11147
11149	Максиальная глубина дерева:	3	1	11147
11150	Случайное дерево:	false	2	11147
11151	Бинарное дерево:	true	3	11147
11152	Использование случайных расщеплений атрибута:	false	4	11147
11153	Начальное значение (Seed)	1	5	11147
11156	Минимальное число объектов в листе:	6	0	11155
11157	Максиальная глубина дерева:	3	1	11155
11158	Случайное дерево:	false	2	11155
11159	Бинарное дерево:	true	3	11155
11160	Использование случайных расщеплений атрибута:	false	4	11155
11161	Начальное значение (Seed)	1	5	11155
11164	Минимальное число объектов в листе:	4	0	11163
11165	Максиальная глубина дерева:	3	1	11163
11166	Случайное дерево:	false	2	11163
11167	Бинарное дерево:	true	3	11163
11168	Использование случайных расщеплений атрибута:	false	4	11163
11169	Начальное значение (Seed)	1	5	11163
11172	Минимальное число объектов в листе:	8	0	11171
11173	Максиальная глубина дерева:	3	1	11171
11174	Случайное дерево:	false	2	11171
11175	Бинарное дерево:	true	3	11171
11176	Использование случайных расщеплений атрибута:	false	4	11171
11177	Начальное значение (Seed)	1	5	11171
11180	Минимальное число объектов в листе:	9	0	11179
11181	Максиальная глубина дерева:	3	1	11179
11182	Случайное дерево:	false	2	11179
11183	Бинарное дерево:	true	3	11179
11184	Использование случайных расщеплений атрибута:	false	4	11179
11185	Начальное значение (Seed)	1	5	11179
11188	Количество нейронов во входном слое:	9	0	11187
11189	Количество нейронов в выходном слое:	2	1	11187
11190	Количество скрытых слоев:	1	2	11187
11191	Структура скрытого слоя:	55	3	11187
11192	Максимальное число итераций:	1000000	4	11187
11193	Допустимая ошибка:	0,00001	5	11187
11194	Активационная функция нейронов скрытого слоя:	Функция SoftSign	6	11187
11195	Формула активационной функции нейронов скрытого слоя:	f(S)=3,7061*S/(1+|S|)	7	11187
11196	Активационная функция нейронов выходного слоя:	Логистическая	8	11187
11197	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	11187
11198	Алгоритм обучения:	BackPropagation	10	11187
11199	Коэффициент скорости обучения:	0,1	11	11187
11200	Коэффициент момента:	0,2	12	11187
11201	Начальное значение (Seed)	1	13	11187
6864	Число итераций:	10	0	650
6865	Минимальная допустимая ошибка сети:	0	1	650
6866	Максимальная допустимая ошибка сети:	0,5	2	650
6867	Формирование обучающих выборок:	Исходное обучающее множество	3	650
3469	Минимальное число объектов в листе:	2	1	690
3470	Максиальная глубина дерева:	0	2	690
3471	Число случайных атрибутов:	3	3	690
6920	Число потоков	1	5	1233
11204	Количество нейронов во входном слое:	9	0	11203
11205	Количество нейронов в выходном слое:	2	1	11203
11206	Количество скрытых слоев:	1	2	11203
11207	Структура скрытого слоя:	20	3	11203
11208	Максимальное число итераций:	1000000	4	11203
11209	Допустимая ошибка:	0,00001	5	11203
11210	Активационная функция нейронов скрытого слоя:	Функция SoftSign	6	11203
11211	Формула активационной функции нейронов скрытого слоя:	f(S)=4,811*S/(1+|S|)	7	11203
11212	Активационная функция нейронов выходного слоя:	Логистическая	8	11203
11213	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	11203
11214	Алгоритм обучения:	BackPropagation	10	11203
11215	Коэффициент скорости обучения:	0,1	11	11203
11216	Коэффициент момента:	0,2	12	11203
11217	Начальное значение (Seed)	1	13	11203
11220	Количество нейронов во входном слое:	9	0	11219
11221	Количество нейронов в выходном слое:	2	1	11219
11222	Количество скрытых слоев:	2	2	11219
11223	Структура скрытого слоя:	23,11	3	11219
11224	Максимальное число итераций:	1000000	4	11219
11225	Допустимая ошибка:	0,00001	5	11219
11226	Активационная функция нейронов скрытого слоя:	Гиперболический тангенс	6	11219
11227	Формула активационной функции нейронов скрытого слоя:	f(S)=(exp(3,8797*S)-exp(-3,8797*S))/(exp(3,8797*S)+exp(-3,8797*S))	7	11219
11228	Активационная функция нейронов выходного слоя:	Логистическая	8	11219
11229	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	11219
11230	Алгоритм обучения:	BackPropagation	10	11219
11231	Коэффициент скорости обучения:	0,1	11	11219
11232	Коэффициент момента:	0,2	12	11219
11233	Начальное значение (Seed)	1	13	11219
11236	Количество нейронов во входном слое:	9	0	11235
11237	Количество нейронов в выходном слое:	2	1	11235
11238	Количество скрытых слоев:	2	2	11235
11239	Структура скрытого слоя:	31,31	3	11235
11240	Максимальное число итераций:	1000000	4	11235
11241	Допустимая ошибка:	0,00001	5	11235
11242	Активационная функция нейронов скрытого слоя:	Гиперболический тангенс	6	11235
11243	Формула активационной функции нейронов скрытого слоя:	f(S)=(exp(2,4597*S)-exp(-2,4597*S))/(exp(2,4597*S)+exp(-2,4597*S))	7	11235
11244	Активационная функция нейронов выходного слоя:	Логистическая	8	11235
11245	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	11235
11246	Алгоритм обучения:	BackPropagation	10	11235
11247	Коэффициент скорости обучения:	0,1	11	11235
3472	Алгоритм построения дерева решений:	C45	4	690
3473	Число случайных расщеплений атрибута:	20	5	690
3474	Формирование обучающих выборок:	Исходное обучающее множество	6	690
5235	Число деревьев:	50	0	691
5236	Минимальное число объектов в листе:	2	1	691
5237	Максиальная глубина дерева:	0	2	691
5238	Число случайных атрибутов:	3	3	691
6954	Число потоков	4	5	1236
11248	Коэффициент момента:	0,2	12	11235
11249	Начальное значение (Seed)	1	13	11235
11252	Количество нейронов во входном слое:	9	0	11251
11253	Количество нейронов в выходном слое:	2	1	11251
11254	Количество скрытых слоев:	1	2	11251
11255	Структура скрытого слоя:	51	3	11251
11256	Максимальное число итераций:	1000000	4	11251
11257	Допустимая ошибка:	0,00001	5	11251
11258	Активационная функция нейронов скрытого слоя:	Тригонометрический синус	6	11251
11259	Формула активационной функции нейронов скрытого слоя:	f(S)=sin(1,1641*S)	7	11251
11260	Активационная функция нейронов выходного слоя:	Логистическая	8	11251
11261	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	11251
11262	Алгоритм обучения:	BackPropagation	10	11251
11263	Коэффициент скорости обучения:	0,1	11	11251
11264	Коэффициент момента:	0,2	12	11251
11265	Начальное значение (Seed)	1	13	11251
11268	Минимальное число объектов в листе:	6	0	11267
11269	Максиальная глубина дерева:	0	1	11267
11270	Случайное дерево:	false	2	11267
11271	Бинарное дерево:	true	3	11267
11272	Использование случайных расщеплений атрибута:	false	4	11267
11273	Начальное значение (Seed)	1	5	11267
11276	Минимальное число объектов в листе:	2	0	11275
11277	Максиальная глубина дерева:	0	1	11275
11278	Случайное дерево:	false	2	11275
11279	Бинарное дерево:	false	3	11275
11280	Использование случайных расщеплений атрибута:	false	4	11275
11281	Начальное значение (Seed)	1	5	11275
11284	Минимальное число объектов в листе:	7	0	11283
11285	Максиальная глубина дерева:	0	1	11283
11286	Случайное дерево:	false	2	11283
11287	Бинарное дерево:	true	3	11283
11288	Использование случайных расщеплений атрибута:	false	4	11283
11289	Начальное значение (Seed)	1	5	11283
11292	Минимальное число объектов в листе:	4	0	11291
11293	Максиальная глубина дерева:	6	1	11291
11294	Случайное дерево:	false	2	11291
11295	Бинарное дерево:	true	3	11291
11296	Использование случайных расщеплений атрибута:	false	4	11291
11297	Начальное значение (Seed)	1	5	11291
11300	Минимальное число объектов в листе:	7	0	11299
11301	Максиальная глубина дерева:	7	1	11299
11302	Случайное дерево:	false	2	11299
11303	Бинарное дерево:	true	3	11299
11304	Использование случайных расщеплений атрибута:	false	4	11299
11305	Начальное значение (Seed)	1	5	11299
11308	Количество нейронов во входном слое:	9	0	11307
11309	Количество нейронов в выходном слое:	6	1	11307
11310	Количество скрытых слоев:	2	2	11307
11311	Структура скрытого слоя:	96,48	3	11307
11312	Максимальное число итераций:	1000000	4	11307
5239	Алгоритм построения дерева решений:	CART	4	691
5240	Число случайных расщеплений атрибута:	20	5	691
5241	Формирование обучающих выборок:	Исходное обучающее множество	6	691
4410	Минимальное число объектов в листе:	2	1	692
4411	Максиальная глубина дерева:	0	2	692
4412	Число случайных атрибутов:	3	3	692
4413	Алгоритм построения дерева решений:	C45	4	692
11314	Активационная функция нейронов скрытого слоя:	Функция ISRU	6	11307
11315	Формула активационной функции нейронов скрытого слоя:	f(S)=S/sqrt(1+1,9871*S^2)	7	11307
11316	Активационная функция нейронов выходного слоя:	Логистическая	8	11307
11317	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	11307
11318	Алгоритм обучения:	BackPropagation	10	11307
11319	Коэффициент скорости обучения:	0,1	11	11307
11320	Коэффициент момента:	0,2	12	11307
11321	Начальное значение (Seed)	1	13	11307
11324	Количество нейронов во входном слое:	9	0	11323
11325	Количество нейронов в выходном слое:	6	1	11323
11326	Количество скрытых слоев:	2	2	11323
11327	Структура скрытого слоя:	41,41	3	11323
11328	Максимальное число итераций:	1000000	4	11323
11329	Допустимая ошибка:	0,00001	5	11323
11330	Активационная функция нейронов скрытого слоя:	Логистическая	6	11323
11331	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-2,5611*S))	7	11323
11332	Активационная функция нейронов выходного слоя:	Логистическая	8	11323
11333	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	11323
11334	Алгоритм обучения:	BackPropagation	10	11323
11335	Коэффициент скорости обучения:	0,1	11	11323
11336	Коэффициент момента:	0,2	12	11323
11337	Начальное значение (Seed)	1	13	11323
11340	Количество нейронов во входном слое:	9	0	11339
11341	Количество нейронов в выходном слое:	6	1	11339
11342	Количество скрытых слоев:	2	2	11339
11343	Структура скрытого слоя:	69,35	3	11339
11344	Максимальное число итераций:	1000000	4	11339
11345	Допустимая ошибка:	0,00001	5	11339
11346	Активационная функция нейронов скрытого слоя:	Функция ISRU	6	11339
11347	Формула активационной функции нейронов скрытого слоя:	f(S)=S/sqrt(1+3,1472*S^2)	7	11339
11348	Активационная функция нейронов выходного слоя:	Логистическая	8	11339
11349	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	11339
11350	Алгоритм обучения:	BackPropagation	10	11339
11351	Коэффициент скорости обучения:	0,1	11	11339
11352	Коэффициент момента:	0,2	12	11339
11353	Начальное значение (Seed)	1	13	11339
11356	Количество нейронов во входном слое:	9	0	11355
11357	Количество нейронов в выходном слое:	6	1	11355
11358	Количество скрытых слоев:	1	2	11355
11359	Структура скрытого слоя:	22	3	11355
11360	Максимальное число итераций:	1000000	4	11355
11361	Допустимая ошибка:	0,00001	5	11355
11362	Активационная функция нейронов скрытого слоя:	Экспоненциальная	6	11355
11363	Формула активационной функции нейронов скрытого слоя:	f(S)=exp(-S^2/1,0034^2)	7	11355
4414	Число случайных расщеплений атрибута:	20	5	692
4415	Формирование обучающих выборок:	Исходное обучающее множество	6	692
5260	Число деревьев:	50	0	693
5261	Минимальное число объектов в листе:	2	1	693
5262	Максиальная глубина дерева:	0	2	693
11364	Активационная функция нейронов выходного слоя:	Логистическая	8	11355
11365	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	11355
11366	Алгоритм обучения:	BackPropagation	10	11355
11367	Коэффициент скорости обучения:	0,1	11	11355
11368	Коэффициент момента:	0,2	12	11355
11369	Начальное значение (Seed)	1	13	11355
11372	Количество нейронов во входном слое:	9	0	11371
11373	Количество нейронов в выходном слое:	6	1	11371
11374	Количество скрытых слоев:	2	2	11371
11375	Структура скрытого слоя:	49,49	3	11371
11376	Максимальное число итераций:	1000000	4	11371
11377	Допустимая ошибка:	0,00001	5	11371
11378	Активационная функция нейронов скрытого слоя:	Функция ISRU	6	11371
11379	Формула активационной функции нейронов скрытого слоя:	f(S)=S/sqrt(1+2,1847*S^2)	7	11371
11380	Активационная функция нейронов выходного слоя:	Логистическая	8	11371
11381	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	11371
11382	Алгоритм обучения:	BackPropagation	10	11371
11383	Коэффициент скорости обучения:	0,1	11	11371
11384	Коэффициент момента:	0,2	12	11371
11385	Начальное значение (Seed)	1	13	11371
11388	Число ближайших соседей:	117	0	11387
11389	Вес ближайшего соседа:	0,6135	1	11387
11390	Функция расстояния:	Манхеттенское расстояние	2	11387
11393	Число ближайших соседей:	93	0	11392
11394	Вес ближайшего соседа:	0,6206	1	11392
11395	Функция расстояния:	Манхеттенское расстояние	2	11392
11398	Число ближайших соседей:	44	0	11397
11399	Вес ближайшего соседа:	0,617	1	11397
11400	Функция расстояния:	Манхеттенское расстояние	2	11397
11403	Число ближайших соседей:	134	0	11402
11404	Вес ближайшего соседа:	0,5314	1	11402
11405	Функция расстояния:	Манхеттенское расстояние	2	11402
11408	Число ближайших соседей:	136	0	11407
11409	Вес ближайшего соседа:	0,5241	1	11407
11410	Функция расстояния:	Манхеттенское расстояние	2	11407
11413	Число ближайших соседей:	214	0	11412
11414	Вес ближайшего соседа:	0,8861	1	11412
11415	Функция расстояния:	Евкилидово расстояние	2	11412
11418	Число ближайших соседей:	122	0	11417
11419	Вес ближайшего соседа:	0,8791	1	11417
11420	Функция расстояния:	Квадрат Евклидова расстояния	2	11417
11423	Число ближайших соседей:	56	0	11422
11424	Вес ближайшего соседа:	0,8968	1	11422
11425	Функция расстояния:	Евкилидово расстояние	2	11422
11428	Число ближайших соседей:	208	0	11427
5263	Число случайных атрибутов:	3	3	693
5264	Алгоритм построения дерева решений:	C45	4	693
5265	Число случайных расщеплений атрибута:	20	5	693
5266	Формирование обучающих выборок:	Исходное обучающее множество	6	693
3905	Число деревьев:	50	0	694
3906	Минимальное число объектов в листе:	2	1	694
3907	Максиальная глубина дерева:	0	2	694
3908	Число случайных атрибутов:	3	3	694
3909	Алгоритм построения дерева решений:	C45	4	694
3910	Число случайных расщеплений атрибута:	18	5	694
3911	Формирование обучающих выборок:	Исходное обучающее множество	6	694
3416	Число деревьев:	50	0	695
3417	Минимальное число объектов в листе:	2	1	695
3418	Максиальная глубина дерева:	0	2	695
3419	Число случайных атрибутов:	3	3	695
3420	Алгоритм построения дерева решений:	C45	4	695
3421	Число случайных расщеплений атрибута:	20	5	695
3422	Формирование обучающих выборок:	Исходное обучающее множество	6	695
5512	Использование случайных расщеплений атрибута:	false	4	697
6847	Число ближайших соседей:	10	0	698
6848	Вес ближайшего соседа:	1	1	698
6849	Функция расстояния:	Евкилидово расстояние	2	698
4760	Число итераций:	25	0	699
4761	Минимальная допустимая ошибка классификатора:	0	1	699
4762	Максимальная допустимая ошибка классификатора:	0,5	2	699
4763	Метод голосования:	Метод большинства голосов	3	699
4764	Формирование обучающих выборок:	Бутстрэп выборки	4	699
4765	Выбор классификатора:	Случайный классификатор	5	699
4766	Базовый классификатор 0:	ID3	6	699
4767	Базовый классификатор 1:	Logistic	7	699
4768	Базовый классификатор 2:	NeuralNetwork	8	699
4769	Базовый классификатор 3:	CHAID	9	699
6859	Мета-классификатор:	C45	0	700
6860	Метод формирования мета-признаков:	Использование обучающего множества	1	700
6861	Базовый классификатор 0:	Logistic	2	700
6862	Базовый классификатор 1:	NeuralNetwork	3	700
6863	Базовый классификатор 2:	CART	4	700
6309	Минимальное число объектов в листе:	2	1	701
6310	Максиальная глубина дерева:	0	2	701
6311	Число случайных атрибутов:	4	3	701
6312	Алгоритм построения дерева решений:	CART	4	701
6313	Число случайных расщеплений атрибута:	12	5	701
6314	Формирование обучающих выборок:	Исходное обучающее множество	6	701
6079	Минимальное число объектов в листе:	2	0	702
6080	Максиальная глубина дерева:	0	1	702
6081	Случайное дерево:	false	2	702
6082	Бинарное дерево:	false	3	702
6083	Использование случайных расщеплений атрибута:	false	4	702
3741	Минимальное число объектов в листе:	2	0	703
3742	Максиальная глубина дерева:	0	1	703
3743	Случайное дерево:	false	2	703
3744	Бинарное дерево:	false	3	703
3745	Использование случайных расщеплений атрибута:	false	4	703
4421	Максимальное число итераций:	500	0	704
4422	Метод поиска минимума:	Квазиньютоновский метод	1	704
6548	Максимальное число итераций:	500	0	705
6549	Метод поиска минимума:	Квазиньютоновский метод	1	705
6594	Максимальное число итераций:	500	0	706
6595	Метод поиска минимума:	Квазиньютоновский метод	1	706
3305	Количество нейронов во входном слое:	33	0	707
3306	Количество нейронов в выходном слое:	2	1	707
3307	Количество скрытых слоев:	1	2	707
3308	Структура скрытого слоя:	12	3	707
3309	Максимальное число итераций:	1000000	4	707
3310	Допустимая ошибка:	0,00001	5	707
3311	Активационная функция нейронов скрытого слоя:	Логистическая	6	707
3312	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	707
3313	Активационная функция нейронов выходного слоя:	Логистическая	8	707
3314	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	707
3315	Алгоритм обучения:	BackPropagation	10	707
3316	Коэффициент скорости обучения:	0,1	11	707
3317	Коэффициент момента:	0,2	12	707
4416	Минимальное число объектов в листе:	2	0	708
4417	Максиальная глубина дерева:	0	1	708
4418	Случайное дерево:	false	2	708
4419	Бинарное дерево:	true	3	708
4420	Использование случайных расщеплений атрибута:	false	4	708
4346	Число итераций:	10	0	709
4347	Минимальная допустимая ошибка классификатора:	0	1	709
4348	Максимальная допустимая ошибка классификатора:	0,5	2	709
4349	Метод голосования:	Метод большинства голосов	3	709
4835	Бинарное дерево:	false	3	728
4350	Формирование обучающих выборок:	Бутстрэп выборки	4	709
4351	Выбор классификатора:	Случайный классификатор	5	709
4352	Базовый классификатор 0:	Logistic	6	709
4353	Базовый классификатор 1:	C45	7	709
5036	Максимальное число итераций:	500	0	710
5037	Метод поиска минимума:	Квазиньютоновский метод	1	710
4372	Минимальное число объектов в листе:	2	0	711
4373	Максиальная глубина дерева:	0	1	711
4374	Случайное дерево:	false	2	711
4375	Бинарное дерево:	false	3	711
4376	Использование случайных расщеплений атрибута:	false	4	711
5928	Число ближайших соседей:	10	0	712
5929	Вес ближайшего соседа:	1	1	712
5930	Функция расстояния:	Евкилидово расстояние	2	712
6404	Число деревьев:	10	0	713
6405	Минимальное число объектов в листе:	2	1	713
6406	Максиальная глубина дерева:	0	2	713
6407	Число случайных атрибутов:	5	3	713
6408	Алгоритм построения дерева решений:	CART	4	713
6409	Число случайных расщеплений атрибута:	10	5	713
6410	Формирование обучающих выборок:	Бутстрэп-выборки	6	713
5763	Количество нейронов во входном слое:	27	0	714
5764	Количество нейронов в выходном слое:	4	1	714
5765	Количество скрытых слоев:	1	2	714
5766	Структура скрытого слоя:	37	3	714
5767	Максимальное число итераций:	1000000	4	714
5768	Допустимая ошибка:	0,00001	5	714
5769	Активационная функция нейронов скрытого слоя:	Гиперболический тангенс	6	714
5770	Формула активационной функции нейронов скрытого слоя:	f(S)=(exp(S)-exp(-S))/(exp(S)+exp(-S))	7	714
5771	Активационная функция нейронов выходного слоя:	Логистическая	8	714
5772	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	714
5773	Алгоритм обучения:	BackPropagation	10	714
5774	Коэффициент скорости обучения:	0,1	11	714
5775	Коэффициент момента:	0,2	12	714
3365	Количество нейронов во входном слое:	27	0	715
3366	Количество нейронов в выходном слое:	4	1	715
3367	Количество скрытых слоев:	1	2	715
3368	Структура скрытого слоя:	37	3	715
3369	Максимальное число итераций:	1000000	4	715
3371	Активационная функция нейронов скрытого слоя:	Тригонометрический синус	6	715
3372	Формула активационной функции нейронов скрытого слоя:	f(S)=sin(S)	7	715
3373	Активационная функция нейронов выходного слоя:	Логистическая	8	715
3374	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	715
3375	Алгоритм обучения:	BackPropagation	10	715
3376	Коэффициент скорости обучения:	0,1	11	715
3377	Коэффициент момента:	0,2	12	715
5746	Количество нейронов во входном слое:	27	0	716
5747	Количество нейронов в выходном слое:	4	1	716
5748	Количество скрытых слоев:	1	2	716
5749	Структура скрытого слоя:	37	3	716
5750	Максимальное число итераций:	1000000	4	716
5751	Допустимая ошибка:	0,00001	5	716
5752	Активационная функция нейронов скрытого слоя:	Функция SoftSign	6	716
5753	Формула активационной функции нейронов скрытого слоя:	f(S)=S/(1+|S|)	7	716
5754	Активационная функция нейронов выходного слоя:	Логистическая	8	716
5755	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	716
5756	Алгоритм обучения:	BackPropagation	10	716
5757	Коэффициент скорости обучения:	0,1	11	716
5758	Коэффициент момента:	0,2	12	716
5794	Количество нейронов во входном слое:	8	0	717
5795	Количество нейронов в выходном слое:	2	1	717
5796	Количество скрытых слоев:	1	2	717
5797	Структура скрытого слоя:	14	3	717
5798	Максимальное число итераций:	1000000	4	717
5799	Допустимая ошибка:	0,00001	5	717
5800	Активационная функция нейронов скрытого слоя:	Логистическая	6	717
5801	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	717
5802	Активационная функция нейронов выходного слоя:	Логистическая	8	717
5803	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	717
5804	Алгоритм обучения:	BackPropagation	10	717
5805	Коэффициент скорости обучения:	0,1	11	717
5806	Коэффициент момента:	0,2	12	717
3512	Минимальное число объектов в листе:	2	0	718
3513	Максиальная глубина дерева:	0	1	718
3514	Случайное дерево:	false	2	718
3515	Бинарное дерево:	false	3	718
3516	Использование случайных расщеплений атрибута:	false	4	718
6734	Число деревьев:	10	0	719
6735	Минимальное число объектов в листе:	2	1	719
6736	Максиальная глубина дерева:	0	2	719
6737	Число случайных атрибутов:	3	3	719
6738	Алгоритм построения дерева решений:	CART	4	719
6739	Число случайных расщеплений атрибута:	10	5	719
6740	Формирование обучающих выборок:	Бутстрэп-выборки	6	719
3885	Число деревьев:	10	0	720
4711	Бинарное дерево:	false	3	744
3886	Минимальное число объектов в листе:	2	1	720
3887	Максиальная глубина дерева:	0	2	720
3888	Число случайных атрибутов:	3	3	720
3889	Алгоритм построения дерева решений:	ID3	4	720
6541	Число деревьев:	10	0	721
6542	Минимальное число объектов в листе:	2	1	721
6543	Максиальная глубина дерева:	0	2	721
6544	Число случайных атрибутов:	3	3	721
6545	Алгоритм построения дерева решений:	C45	4	721
6546	Число случайных расщеплений атрибута:	15	5	721
6547	Формирование обучающих выборок:	Исходное обучающее множество	6	721
3898	Число деревьев:	50	0	722
3899	Минимальное число объектов в листе:	2	1	722
3900	Максиальная глубина дерева:	0	2	722
3901	Число случайных атрибутов:	3	3	722
3902	Алгоритм построения дерева решений:	CART	4	722
3903	Число случайных расщеплений атрибута:	15	5	722
3904	Формирование обучающих выборок:	Исходное обучающее множество	6	722
4770	Число деревьев:	50	0	723
4771	Минимальное число объектов в листе:	2	1	723
4772	Максиальная глубина дерева:	0	2	723
4773	Число случайных атрибутов:	3	3	723
4774	Алгоритм построения дерева решений:	C45	4	723
4775	Число случайных расщеплений атрибута:	15	5	723
4776	Формирование обучающих выборок:	Исходное обучающее множество	6	723
6802	Максимальное число итераций:	500	0	724
6803	Метод поиска минимума:	Квазиньютоновский метод	1	724
3973	Число итераций:	10	0	725
3974	Минимальная допустимая ошибка классификатора:	0	1	725
3975	Максимальная допустимая ошибка классификатора:	0,5	2	725
3976	Базовый классификатор 0:	NeuralNetwork	3	725
3977	Базовый классификатор 1:	CART	4	725
6608	Максимальное число итераций:	200	0	726
6609	Метод поиска минимума:	Квазиньютоновский метод	1	726
6585	Минимальное число объектов в листе:	2	0	727
6586	Максиальная глубина дерева:	0	1	727
6587	Случайное дерево:	false	2	727
6588	Бинарное дерево:	true	3	727
6589	Использование случайных расщеплений атрибута:	false	4	727
4832	Минимальное число объектов в листе:	2	0	728
4833	Максиальная глубина дерева:	0	1	728
4834	Случайное дерево:	false	2	728
4836	Использование случайных расщеплений атрибута:	false	4	728
5322	Число деревьев:	100	0	729
5323	Минимальное число объектов в листе:	2	1	729
5324	Максиальная глубина дерева:	0	2	729
5325	Число случайных атрибутов:	5	3	729
5326	Алгоритм построения дерева решений:	CART	4	729
5327	Число потоков	1	5	729
6759	Максимальное число итераций:	200	0	730
6760	Метод поиска минимума:	Квазиньютоновский метод	1	730
4010	Число деревьев:	100	0	731
4011	Минимальное число объектов в листе:	2	1	731
4012	Максиальная глубина дерева:	0	2	731
4013	Число случайных атрибутов:	5	3	731
4014	Алгоритм построения дерева решений:	C45	4	731
4015	Число потоков	1	5	731
3912	Число деревьев:	100	0	732
3913	Минимальное число объектов в листе:	2	1	732
3914	Максиальная глубина дерева:	0	2	732
3915	Число случайных атрибутов:	5	3	732
3916	Алгоритм построения дерева решений:	C45	4	732
3917	Число потоков	4	5	732
5376	Число деревьев:	100	0	733
5377	Минимальное число объектов в листе:	2	1	733
5378	Максиальная глубина дерева:	0	2	733
5379	Число случайных атрибутов:	4	3	733
5380	Алгоритм построения дерева решений:	CHAID	4	733
5381	Число потоков	2	5	733
5382	Число случайных расщеплений атрибута:	10	6	733
5383	Формирование обучающих выборок:	Бутстрэп-выборки	7	733
6233	Число деревьев:	10	0	734
6234	Минимальное число объектов в листе:	2	1	734
6235	Максиальная глубина дерева:	0	2	734
6236	Число случайных атрибутов:	4	3	734
6237	Алгоритм построения дерева решений:	CART	4	734
6238	Число потоков	1	5	734
6239	Число случайных расщеплений атрибута:	1	6	734
6240	Формирование обучающих выборок:	Исходное обучающее множество	7	734
6335	Число деревьев:	10	0	735
6336	Минимальное число объектов в листе:	2	1	735
6337	Максиальная глубина дерева:	0	2	735
6338	Число случайных атрибутов:	4	3	735
6339	Алгоритм построения дерева решений:	CART	4	735
6340	Число потоков	2	5	735
6341	Число случайных расщеплений атрибута:	1	6	735
6342	Формирование обучающих выборок:	Исходное обучающее множество	7	735
6327	Число деревьев:	10	0	736
6328	Минимальное число объектов в листе:	2	1	736
6329	Максиальная глубина дерева:	0	2	736
6330	Число случайных атрибутов:	4	3	736
6331	Алгоритм построения дерева решений:	CART	4	736
6332	Число потоков	2	5	736
6333	Число случайных расщеплений атрибута:	16	6	736
6334	Формирование обучающих выборок:	Исходное обучающее множество	7	736
5598	Число деревьев:	100	0	737
5599	Минимальное число объектов в листе:	2	1	737
5600	Максиальная глубина дерева:	0	2	737
5601	Число случайных атрибутов:	4	3	737
5602	Алгоритм построения дерева решений:	CART	4	737
5603	Число потоков	2	5	737
5604	Число случайных расщеплений атрибута:	10	6	737
5605	Формирование обучающих выборок:	Исходное обучающее множество	7	737
5638	Число деревьев:	10	0	738
5639	Минимальное число объектов в листе:	2	1	738
5640	Максиальная глубина дерева:	0	2	738
5641	Число случайных атрибутов:	4	3	738
5642	Алгоритм построения дерева решений:	CHAID	4	738
5643	Число потоков	1	5	738
5644	Число случайных расщеплений атрибута:	1	6	738
5645	Формирование обучающих выборок:	Исходное обучающее множество	7	738
4857	Число деревьев:	100	0	739
4858	Минимальное число объектов в листе:	2	1	739
4859	Максиальная глубина дерева:	0	2	739
4860	Число случайных атрибутов:	4	3	739
4861	Алгоритм построения дерева решений:	CHAID	4	739
4863	Число случайных расщеплений атрибута:	12	6	739
4864	Формирование обучающих выборок:	Бутстрэп-выборки	7	739
5446	Число деревьев:	100	0	740
5447	Минимальное число объектов в листе:	2	1	740
5448	Максиальная глубина дерева:	0	2	740
5449	Число случайных атрибутов:	4	3	740
5450	Алгоритм построения дерева решений:	CART	4	740
5451	Число потоков	4	5	740
5452	Число случайных расщеплений атрибута:	10	6	740
5453	Формирование обучающих выборок:	Бутстрэп-выборки	7	740
4462	Число деревьев:	100	0	741
4463	Минимальное число объектов в листе:	2	1	741
4464	Максиальная глубина дерева:	0	2	741
4465	Число случайных атрибутов:	5	3	741
4466	Алгоритм построения дерева решений:	C45	4	741
4467	Число потоков	1	5	741
6321	Число деревьев:	100	0	742
6322	Минимальное число объектов в листе:	2	1	742
6323	Максиальная глубина дерева:	0	2	742
6324	Число случайных атрибутов:	5	3	742
6325	Алгоритм построения дерева решений:	C45	4	742
6326	Число потоков	4	5	742
3820	Число деревьев:	100	0	743
3821	Минимальное число объектов в листе:	2	1	743
3822	Максиальная глубина дерева:	0	2	743
3823	Число случайных атрибутов:	5	3	743
3824	Алгоритм построения дерева решений:	C45	4	743
3825	Число потоков	1	5	743
4708	Минимальное число объектов в листе:	2	0	744
4709	Максиальная глубина дерева:	0	1	744
4710	Случайное дерево:	false	2	744
4712	Использование случайных расщеплений атрибута:	false	4	744
4713	Уровень значимости alpha:	0.05	5	744
4268	Число деревьев:	10	0	745
4269	Минимальное число объектов в листе:	2	1	745
4270	Максиальная глубина дерева:	0	2	745
4271	Число случайных атрибутов:	3	3	745
4272	Алгоритм построения дерева решений:	CART	4	745
4273	Число потоков	1	5	745
5675	Число деревьев:	100	0	746
5676	Минимальное число объектов в листе:	2	1	746
5677	Максиальная глубина дерева:	0	2	746
5678	Число случайных атрибутов:	3	3	746
5679	Алгоритм построения дерева решений:	CART	4	746
5680	Число потоков	1	5	746
6222	Минимальное число объектов в листе:	2	0	747
6223	Максиальная глубина дерева:	0	1	747
6224	Случайное дерево:	false	2	747
6225	Бинарное дерево:	false	3	747
6226	Использование случайных расщеплений атрибута:	false	4	747
6255	Минимальное число объектов в листе:	2	0	748
6256	Максиальная глубина дерева:	0	1	748
6257	Случайное дерево:	false	2	748
6258	Бинарное дерево:	false	3	748
6259	Использование случайных расщеплений атрибута:	false	4	748
3378	Минимальное число объектов в листе:	2	0	749
3379	Бинарное дерево:	false	1	749
3380	Усеченное дерево:	true	2	749
3381	Число блоков:	3	3	749
6351	Максимальное число итераций:	200	0	750
6352	Метод поиска минимума:	Квазиньютоновский метод	1	750
4747	Количество нейронов во входном слое:	35	0	751
4748	Количество нейронов в выходном слое:	19	1	751
4749	Количество скрытых слоев:	1	2	751
4750	Структура скрытого слоя:	23	3	751
4751	Максимальное число итераций:	1000000	4	751
4752	Допустимая ошибка:	0,00001	5	751
4753	Активационная функция нейронов скрытого слоя:	Логистическая	6	751
4754	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	751
4755	Активационная функция нейронов выходного слоя:	Логистическая	8	751
4756	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	751
4757	Алгоритм обучения:	BackPropagation	10	751
4758	Коэффициент скорости обучения:	0,1	11	751
4759	Коэффициент момента:	0,2	12	751
4312	Минимальное число объектов в листе:	2	0	752
4313	Максиальная глубина дерева:	0	1	752
4314	Случайное дерево:	false	2	752
4315	Бинарное дерево:	false	3	752
4316	Использование случайных расщеплений атрибута:	false	4	752
6484	Минимальное число объектов в листе:	2	0	753
6485	Максиальная глубина дерева:	0	1	753
6486	Случайное дерево:	false	2	753
6487	Бинарное дерево:	true	3	753
6488	Использование случайных расщеплений атрибута:	false	4	753
3828	Минимальное число объектов в листе:	2	0	754
3829	Максиальная глубина дерева:	0	1	754
3830	Случайное дерево:	false	2	754
3831	Бинарное дерево:	false	3	754
3832	Использование случайных расщеплений атрибута:	false	4	754
5759	Минимальное число объектов в листе:	2	0	755
5760	Бинарное дерево:	false	1	755
5761	Усеченное дерево:	true	2	755
5762	Число блоков:	3	3	755
6852	Максимальное число итераций:	200	0	756
6853	Метод поиска минимума:	Квазиньютоновский метод	1	756
6115	Число ближайших соседей:	10	0	757
6116	Вес ближайшего соседа:	1	1	757
6117	Функция расстояния:	Евкилидово расстояние	2	757
3382	Количество нейронов во входном слое:	9	0	758
3383	Количество нейронов в выходном слое:	6	1	758
3384	Количество скрытых слоев:	1	2	758
3385	Структура скрытого слоя:	9	3	758
3386	Максимальное число итераций:	1000000	4	758
3387	Допустимая ошибка:	0,00001	5	758
3388	Активационная функция нейронов скрытого слоя:	Логистическая	6	758
3389	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	758
3390	Активационная функция нейронов выходного слоя:	Логистическая	8	758
3391	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	758
3392	Алгоритм обучения:	BackPropagation	10	758
3393	Коэффициент скорости обучения:	0,1	11	758
3394	Коэффициент момента:	0,2	12	758
4791	Минимальное число объектов в листе:	2	0	759
4792	Максиальная глубина дерева:	0	1	759
4793	Случайное дерево:	false	2	759
4794	Бинарное дерево:	true	3	759
4795	Использование случайных расщеплений атрибута:	false	4	759
5898	Минимальное число объектов в листе:	2	0	760
5899	Максиальная глубина дерева:	0	1	760
5900	Случайное дерево:	false	2	760
5901	Бинарное дерево:	true	3	760
5902	Использование случайных расщеплений атрибута:	false	4	760
5893	Минимальное число объектов в листе:	2	0	761
5894	Максиальная глубина дерева:	0	1	761
5895	Случайное дерево:	false	2	761
5896	Бинарное дерево:	true	3	761
5897	Использование случайных расщеплений атрибута:	false	4	761
5200	Минимальное число объектов в листе:	2	0	762
5201	Бинарное дерево:	false	1	762
5202	Усеченное дерево:	true	2	762
5203	Число блоков:	3	3	762
6599	Число блоков:	3	3	763
3920	Случайное дерево:	false	2	787
6596	Минимальное число объектов в листе:	2	0	763
6597	Бинарное дерево:	true	1	763
6598	Усеченное дерево:	true	2	763
6651	Минимальное число объектов в листе:	2	0	764
6652	Бинарное дерево:	false	1	764
6653	Усеченное дерево:	false	2	764
5982	Минимальное число объектов в листе:	2	0	765
5983	Максиальная глубина дерева:	0	1	765
5984	Случайное дерево:	false	2	765
5985	Бинарное дерево:	true	3	765
5986	Использование случайных расщеплений атрибута:	false	4	765
5125	Минимальное число объектов в листе:	2	0	766
5126	Максиальная глубина дерева:	0	1	766
5127	Случайное дерево:	false	2	766
5128	Бинарное дерево:	false	3	766
5129	Использование случайных расщеплений атрибута:	false	4	766
5130	Уровень значимости alpha:	0.05	5	766
4940	Количество нейронов во входном слое:	33	0	767
4941	Количество нейронов в выходном слое:	2	1	767
4942	Количество скрытых слоев:	1	2	767
4943	Структура скрытого слоя:	9	3	767
4944	Максимальное число итераций:	1000000	4	767
4945	Допустимая ошибка:	0,00001	5	767
4946	Активационная функция нейронов скрытого слоя:	Логистическая	6	767
4947	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	767
4948	Активационная функция нейронов выходного слоя:	Логистическая	8	767
4949	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	767
4950	Алгоритм обучения:	BackPropagation	10	767
4951	Коэффициент скорости обучения:	0,1	11	767
4952	Коэффициент момента:	0,2	12	767
6362	Максимальное число итераций:	200	0	768
6363	Метод поиска минимума:	Квазиньютоновский метод	1	768
5131	Минимальное число объектов в листе:	2	0	769
5132	Максиальная глубина дерева:	0	1	769
5133	Случайное дерево:	false	2	769
5134	Бинарное дерево:	true	3	769
5135	Использование случайных расщеплений атрибута:	false	4	769
5085	Минимальное число объектов в листе:	2	0	770
5086	Максиальная глубина дерева:	0	1	770
5087	Случайное дерево:	false	2	770
5088	Бинарное дерево:	false	3	770
5089	Использование случайных расщеплений атрибута:	false	4	770
5090	Уровень значимости alpha:	0.05	5	770
4431	Усеченное дерево:	true	2	782
5363	Количество нейронов во входном слое:	8	0	771
5364	Количество нейронов в выходном слое:	2	1	771
5365	Количество скрытых слоев:	1	2	771
5366	Структура скрытого слоя:	14	3	771
5367	Максимальное число итераций:	1000000	4	771
5368	Допустимая ошибка:	0,00001	5	771
5369	Активационная функция нейронов скрытого слоя:	Логистическая	6	771
5370	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	771
5371	Активационная функция нейронов выходного слоя:	Логистическая	8	771
5372	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	771
5373	Алгоритм обучения:	BackPropagation	10	771
5374	Коэффициент скорости обучения:	0,1	11	771
5375	Коэффициент момента:	0,2	12	771
5454	Минимальное число объектов в листе:	2	0	772
5455	Бинарное дерево:	false	1	772
5456	Усеченное дерево:	true	2	772
5457	Число блоков:	3	3	772
5021	Минимальное число объектов в листе:	2	0	773
5022	Максиальная глубина дерева:	0	1	773
5023	Случайное дерево:	false	2	773
5024	Бинарное дерево:	true	3	773
5025	Использование случайных расщеплений атрибута:	false	4	773
3395	Минимальное число объектов в листе:	2	0	774
3396	Максиальная глубина дерева:	0	1	774
3397	Случайное дерево:	false	2	774
3398	Бинарное дерево:	false	3	774
3399	Использование случайных расщеплений атрибута:	false	4	774
4551	Количество нейронов во входном слое:	9	0	775
4552	Количество нейронов в выходном слое:	2	1	775
4553	Количество скрытых слоев:	1	2	775
4554	Структура скрытого слоя:	5	3	775
4555	Максимальное число итераций:	1000000	4	775
4556	Допустимая ошибка:	0,00001	5	775
4557	Активационная функция нейронов скрытого слоя:	Логистическая	6	775
4558	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	775
4559	Активационная функция нейронов выходного слоя:	Логистическая	8	775
4560	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	775
4561	Алгоритм обучения:	BackPropagation	10	775
4562	Коэффициент скорости обучения:	0,1	11	775
4563	Коэффициент момента:	0,2	12	775
4936	Минимальное число объектов в листе:	2	0	776
4937	Бинарное дерево:	false	1	776
4938	Усеченное дерево:	true	2	776
4939	Число блоков:	3	3	776
5706	Минимальное число объектов в листе:	2	0	777
5707	Максиальная глубина дерева:	0	1	777
5708	Случайное дерево:	false	2	777
5709	Бинарное дерево:	false	3	777
5710	Использование случайных расщеплений атрибута:	false	4	777
5204	Минимальное число объектов в листе:	2	0	778
5205	Максиальная глубина дерева:	0	1	778
5206	Случайное дерево:	false	2	778
5207	Бинарное дерево:	false	3	778
5208	Использование случайных расщеплений атрибута:	false	4	778
5333	Минимальное число объектов в листе:	2	0	779
5334	Максиальная глубина дерева:	0	1	779
5335	Случайное дерево:	false	2	779
5336	Бинарное дерево:	true	3	779
5337	Использование случайных расщеплений атрибута:	false	4	779
6536	Минимальное число объектов в листе:	2	0	780
6537	Максиальная глубина дерева:	0	1	780
6538	Случайное дерево:	false	2	780
6539	Бинарное дерево:	true	3	780
6540	Использование случайных расщеплений атрибута:	false	4	780
4501	Минимальное число объектов в листе:	2	0	781
4502	Максиальная глубина дерева:	0	1	781
4503	Случайное дерево:	false	2	781
4504	Бинарное дерево:	false	3	781
4505	Использование случайных расщеплений атрибута:	false	4	781
4429	Минимальное число объектов в листе:	2	0	782
4430	Бинарное дерево:	false	1	782
4432	Число блоков:	3	3	782
6695	Минимальное число объектов в листе:	2	0	783
6696	Максиальная глубина дерева:	0	1	783
6697	Случайное дерево:	false	2	783
6698	Бинарное дерево:	true	3	783
6699	Использование случайных расщеплений атрибута:	false	4	783
5815	Минимальное число объектов в листе:	2	0	784
5816	Бинарное дерево:	false	1	784
5817	Усеченное дерево:	true	2	784
5818	Число блоков:	3	3	784
4837	Минимальное число объектов в листе:	2	0	785
4838	Максиальная глубина дерева:	0	1	785
4839	Случайное дерево:	false	2	785
4840	Бинарное дерево:	false	3	785
4841	Использование случайных расщеплений атрибута:	false	4	785
6794	Максимальное число итераций:	200	0	786
6795	Метод поиска минимума:	Квазиньютоновский метод	1	786
3918	Минимальное число объектов в листе:	2	0	787
3919	Максиальная глубина дерева:	0	1	787
3921	Бинарное дерево:	true	3	787
3922	Использование случайных расщеплений атрибута:	false	4	787
4210	Количество нейронов во входном слое:	20	0	788
4211	Количество нейронов в выходном слое:	2	1	788
4212	Количество скрытых слоев:	1	2	788
4213	Структура скрытого слоя:	8	3	788
4214	Максимальное число итераций:	1000000	4	788
4215	Допустимая ошибка:	0,00001	5	788
4216	Активационная функция нейронов скрытого слоя:	Логистическая	6	788
4217	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	788
4218	Активационная функция нейронов выходного слоя:	Логистическая	8	788
4219	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	788
4220	Алгоритм обучения:	BackPropagation	10	788
4221	Коэффициент скорости обучения:	0,1	11	788
4222	Коэффициент момента:	0,2	12	788
4288	Число деревьев:	25	0	789
4289	Минимальное число объектов в листе:	2	1	789
4290	Максиальная глубина дерева:	0	2	789
4291	Число случайных атрибутов:	4	3	789
4292	Алгоритм построения дерева решений:	CART	4	789
4293	Число потоков	1	5	789
5092	Количество нейронов в выходном слое:	3	1	790
5091	Количество нейронов во входном слое:	4	0	790
5103	Коэффициент момента:	0,2	12	790
5093	Количество скрытых слоев:	2	2	790
5094	Структура скрытого слоя:	7,15	3	790
5095	Максимальное число итераций:	1000000	4	790
5096	Допустимая ошибка:	0,00001	5	790
5097	Активационная функция нейронов скрытого слоя:	Логистическая	6	790
5098	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	790
5099	Активационная функция нейронов выходного слоя:	Логистическая	8	790
5100	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	790
5101	Алгоритм обучения:	BackPropagation	10	790
5102	Коэффициент скорости обучения:	0,1	11	790
3715	Число деревьев:	10	0	791
3716	Минимальное число объектов в листе:	2	1	791
3717	Максиальная глубина дерева:	0	2	791
3718	Число случайных атрибутов:	3	3	791
3719	Алгоритм построения дерева решений:	CART	4	791
3720	Число потоков	1	5	791
5861	Число деревьев:	200	0	792
5862	Минимальное число объектов в листе:	2	1	792
5863	Максиальная глубина дерева:	0	2	792
5864	Число случайных атрибутов:	4	3	792
5865	Алгоритм построения дерева решений:	CART	4	792
5866	Число потоков	1	5	792
3506	Число деревьев:	100	0	793
3507	Минимальное число объектов в листе:	2	1	793
3508	Максиальная глубина дерева:	0	2	793
3509	Число случайных атрибутов:	5	3	793
3510	Алгоритм построения дерева решений:	CART	4	793
3511	Число потоков	1	5	793
4508	Число деревьев:	100	0	794
4509	Минимальное число объектов в листе:	2	1	794
4510	Максиальная глубина дерева:	0	2	794
4511	Число случайных атрибутов:	5	3	794
4512	Алгоритм построения дерева решений:	CART	4	794
4513	Число потоков	1	5	794
5954	Число деревьев:	100	0	795
5955	Минимальное число объектов в листе:	2	1	795
5956	Максиальная глубина дерева:	0	2	795
5957	Число случайных атрибутов:	5	3	795
5958	Алгоритм построения дерева решений:	CART	4	795
5959	Число потоков	4	5	795
6289	Число деревьев:	100	0	796
6290	Минимальное число объектов в листе:	2	1	796
6291	Максиальная глубина дерева:	0	2	796
6292	Число случайных атрибутов:	5	3	796
6293	Алгоритм построения дерева решений:	CART	4	796
6294	Число потоков	4	5	796
5711	Число деревьев:	100	0	797
5712	Минимальное число объектов в листе:	2	1	797
5713	Максиальная глубина дерева:	0	2	797
5714	Число случайных атрибутов:	5	3	797
5715	Алгоритм построения дерева решений:	CART	4	797
5716	Число потоков	2	5	797
5574	Число деревьев:	100	0	798
5575	Минимальное число объектов в листе:	2	1	798
5576	Максиальная глубина дерева:	0	2	798
5577	Число случайных атрибутов:	5	3	798
5578	Алгоритм построения дерева решений:	CART	4	798
5579	Число потоков	4	5	798
4564	Число деревьев:	100	0	799
4565	Минимальное число объектов в листе:	2	1	799
4566	Максиальная глубина дерева:	0	2	799
4567	Число случайных атрибутов:	5	3	799
4568	Алгоритм построения дерева решений:	CART	4	799
3535	Число деревьев:	100	0	800
3536	Минимальное число объектов в листе:	2	1	800
3537	Максиальная глубина дерева:	0	2	800
3538	Число случайных атрибутов:	5	3	800
3539	Алгоритм построения дерева решений:	CART	4	800
3540	Число потоков	1	5	800
4443	Число деревьев:	100	0	801
4444	Минимальное число объектов в листе:	2	1	801
4445	Максиальная глубина дерева:	0	2	801
4446	Число случайных атрибутов:	5	3	801
4447	Алгоритм построения дерева решений:	CART	4	801
4448	Число потоков	4	5	801
5946	Максимальное число итераций:	200	0	802
5947	Метод поиска минимума:	Квазиньютоновский метод	1	802
5267	Максимальное число итераций:	200	0	803
5268	Метод поиска минимума:	Квазиньютоновский метод	1	803
5969	Максимальное число итераций:	200	0	804
5970	Метод поиска минимума:	Квазиньютоновский метод	1	804
5776	Число итераций:	10	0	805
5777	Минимальная допустимая ошибка классификатора:	0	1	805
5778	Максимальная допустимая ошибка классификатора:	0,5	2	805
5779	Метод голосования:	Метод большинства голосов	3	805
5780	Формирование обучающих выборок:	Бутстрэп выборки	4	805
5781	Выбор классификатора:	Случайный классификатор	5	805
5782	Число потоков	4	6	805
5783	Базовый классификатор 0:	C45	7	805
5168	Число итераций:	10	0	806
5169	Минимальная допустимая ошибка классификатора:	0	1	806
5170	Максимальная допустимая ошибка классификатора:	0,5	2	806
5174	Число потоков	1	6	806
5171	Метод голосования:	Метод большинства голосов	3	806
5172	Формирование обучающих выборок:	Бутстрэп выборки	4	806
5173	Выбор классификатора:	Случайный классификатор	5	806
5175	Базовый классификатор 0:	C45	7	806
4930	Число деревьев:	100	0	807
4931	Минимальное число объектов в листе:	2	1	807
4932	Максиальная глубина дерева:	0	2	807
4933	Число случайных атрибутов:	4	3	807
4934	Алгоритм построения дерева решений:	CART	4	807
4935	Число потоков	1	5	807
3978	Число деревьев:	100	0	808
3979	Минимальное число объектов в листе:	2	1	808
3980	Максиальная глубина дерева:	0	2	808
3981	Число случайных атрибутов:	4	3	808
3982	Алгоритм построения дерева решений:	CART	4	808
3983	Число потоков	4	5	808
4684	Число деревьев:	100	0	809
4685	Минимальное число объектов в листе:	2	1	809
4686	Максиальная глубина дерева:	0	2	809
4687	Число случайных атрибутов:	4	3	809
4688	Алгоритм построения дерева решений:	CART	4	809
4689	Число потоков	1	5	809
4599	Минимальное число объектов в листе:	2	0	810
4600	Максиальная глубина дерева:	0	1	810
4601	Случайное дерево:	false	2	810
4602	Бинарное дерево:	false	3	810
4603	Использование случайных расщеплений атрибута:	false	4	810
4852	Минимальное число объектов в листе:	2	0	811
4853	Максиальная глубина дерева:	0	1	811
4854	Случайное дерево:	false	2	811
4855	Бинарное дерево:	true	3	811
4856	Использование случайных расщеплений атрибута:	false	4	811
6366	Минимальное число объектов в листе:	2	0	812
6367	Бинарное дерево:	false	1	812
6368	Усеченное дерево:	true	2	812
6369	Число блоков:	3	3	812
6167	Количество нейронов во входном слое:	9	0	813
6168	Количество нейронов в выходном слое:	6	1	813
6169	Количество скрытых слоев:	1	2	813
6170	Структура скрытого слоя:	9	3	813
6171	Максимальное число итераций:	1000000	4	813
6172	Допустимая ошибка:	0,00001	5	813
6173	Активационная функция нейронов скрытого слоя:	Логистическая	6	813
6174	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	813
6175	Активационная функция нейронов выходного слоя:	Логистическая	8	813
6176	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	813
6177	Алгоритм обучения:	BackPropagation	10	813
6178	Коэффициент скорости обучения:	0,1	11	813
6179	Коэффициент момента:	0,2	12	813
3692	Число деревьев:	10	0	814
3693	Минимальное число объектов в листе:	2	1	814
3694	Максиальная глубина дерева:	0	2	814
3695	Число случайных атрибутов:	3	3	814
3696	Алгоритм построения дерева решений:	C45	4	814
3697	Число потоков	3	5	814
3698	Число случайных расщеплений атрибута:	15	6	814
3699	Формирование обучающих выборок:	Исходное обучающее множество	7	814
3584	Число деревьев:	10	0	815
3585	Минимальное число объектов в листе:	2	1	815
3586	Максиальная глубина дерева:	0	2	815
3587	Число случайных атрибутов:	3	3	815
3588	Алгоритм построения дерева решений:	C45	4	815
3589	Число потоков	3	5	815
3590	Число случайных расщеплений атрибута:	15	6	815
3591	Формирование обучающих выборок:	Исходное обучающее множество	7	815
6620	Число деревьев:	10	0	816
6621	Минимальное число объектов в листе:	2	1	816
6622	Максиальная глубина дерева:	0	2	816
6623	Число случайных атрибутов:	3	3	816
6624	Алгоритм построения дерева решений:	CHAID	4	816
6625	Число потоков	3	5	816
6626	Число случайных расщеплений атрибута:	15	6	816
6627	Формирование обучающих выборок:	Исходное обучающее множество	7	816
4842	Число деревьев:	50	0	817
4843	Минимальное число объектов в листе:	2	1	817
4844	Максиальная глубина дерева:	0	2	817
4845	Число случайных атрибутов:	3	3	817
4846	Алгоритм построения дерева решений:	C45	4	817
4847	Число потоков	3	5	817
4848	Число случайных расщеплений атрибута:	15	6	817
4849	Формирование обучающих выборок:	Исходное обучающее множество	7	817
6396	Число деревьев:	10	0	818
6397	Минимальное число объектов в листе:	2	1	818
6398	Максиальная глубина дерева:	0	2	818
6399	Число случайных атрибутов:	3	3	818
6400	Алгоритм построения дерева решений:	C45	4	818
6401	Число потоков	3	5	818
6402	Число случайных расщеплений атрибута:	15	6	818
5273	Число потоков	2	4	830
6403	Формирование обучающих выборок:	Исходное обучающее множество	7	818
4519	Число деревьев:	10	0	819
4520	Минимальное число объектов в листе:	2	1	819
4521	Максиальная глубина дерева:	0	2	819
4522	Число случайных атрибутов:	3	3	819
4523	Алгоритм построения дерева решений:	C45	4	819
4524	Число потоков	3	5	819
4525	Число случайных расщеплений атрибута:	10	6	819
4526	Формирование обучающих выборок:	Исходное обучающее множество	7	819
4058	Число деревьев:	100	0	820
4059	Минимальное число объектов в листе:	2	1	820
4060	Максиальная глубина дерева:	0	2	820
4061	Число случайных атрибутов:	4	3	820
4062	Алгоритм построения дерева решений:	CART	4	820
4063	Число потоков	1	5	820
6006	Число деревьев:	100	0	821
6007	Минимальное число объектов в листе:	2	1	821
6008	Максиальная глубина дерева:	0	2	821
6009	Число случайных атрибутов:	4	3	821
6010	Алгоритм построения дерева решений:	CART	4	821
6011	Число потоков	1	5	821
5918	Число деревьев:	100	0	822
5919	Минимальное число объектов в листе:	2	1	822
5920	Максиальная глубина дерева:	0	2	822
5921	Число случайных атрибутов:	4	3	822
5922	Алгоритм построения дерева решений:	CART	4	822
5923	Число потоков	4	5	822
4038	Число деревьев:	250	0	823
4039	Минимальное число объектов в листе:	2	1	823
4040	Максиальная глубина дерева:	0	2	823
4041	Число случайных атрибутов:	4	3	823
4042	Алгоритм построения дерева решений:	CART	4	823
4043	Число потоков	1	5	823
3998	Число деревьев:	250	0	824
3999	Минимальное число объектов в листе:	2	1	824
4000	Максиальная глубина дерева:	0	2	824
4001	Число случайных атрибутов:	4	3	824
4002	Алгоритм построения дерева решений:	CART	4	824
4003	Число потоков	4	5	824
5531	Число деревьев:	250	0	825
5532	Минимальное число объектов в листе:	2	1	825
5533	Максиальная глубина дерева:	0	2	825
5534	Число случайных атрибутов:	4	3	825
5535	Алгоритм построения дерева решений:	CART	4	825
5536	Число потоков	4	5	825
6161	Число деревьев:	250	0	826
6162	Минимальное число объектов в листе:	2	1	826
6163	Максиальная глубина дерева:	0	2	826
6164	Число случайных атрибутов:	4	3	826
6165	Алгоритм построения дерева решений:	CART	4	826
6166	Число потоков	1	5	826
4168	Число деревьев:	250	0	827
4169	Минимальное число объектов в листе:	2	1	827
4170	Максиальная глубина дерева:	0	2	827
4171	Число случайных атрибутов:	4	3	827
4172	Алгоритм построения дерева решений:	CART	4	827
4173	Число потоков	2	5	827
6770	Число итераций:	10	0	828
6771	Минимальная допустимая ошибка сети:	0	1	828
6772	Максимальная допустимая ошибка сети:	0,5	2	828
6773	Формирование обучающих выборок:	Бутстрэп-выборки	3	828
6774	Число потоков	4	4	828
3647	Число деревьев:	250	0	829
3648	Минимальное число объектов в листе:	2	1	829
3649	Максиальная глубина дерева:	0	2	829
3650	Число случайных атрибутов:	4	3	829
3651	Алгоритм построения дерева решений:	CART	4	829
3652	Число потоков	1	5	829
5269	Число итераций:	10	0	830
5270	Минимальная допустимая ошибка сети:	0	1	830
5271	Максимальная допустимая ошибка сети:	0,5	2	830
5272	Формирование обучающих выборок:	Бутстрэп-выборки	3	830
4809	Число итераций:	100	0	831
4810	Минимальная допустимая ошибка классификатора:	0	1	831
3804	Число деревьев:	100	0	840
4811	Максимальная допустимая ошибка классификатора:	0,5	2	831
4812	Метод голосования:	Метод большинства голосов	3	831
4813	Формирование обучающих выборок:	Бутстрэп выборки	4	831
4814	Выбор классификатора:	Оптимальный классификатор	5	831
4815	Число потоков	1	6	831
4816	Базовый классификатор 0:	CART	7	831
4817	Базовый классификатор 1:	Logistic	8	831
4818	Базовый классификатор 2:	C45	9	831
3868	Число итераций:	100	0	832
3869	Минимальная допустимая ошибка классификатора:	0	1	832
3870	Максимальная допустимая ошибка классификатора:	0,5	2	832
3871	Метод голосования:	Метод большинства голосов	3	832
3872	Формирование обучающих выборок:	Бутстрэп выборки	4	832
3873	Выбор классификатора:	Оптимальный классификатор	5	832
3874	Число потоков	1	6	832
3875	Базовый классификатор 0:	C45	7	832
3876	Базовый классификатор 1:	CART	8	832
3877	Базовый классификатор 2:	Logistic	9	832
4468	Число итераций:	100	0	833
4469	Минимальная допустимая ошибка классификатора:	0	1	833
4470	Максимальная допустимая ошибка классификатора:	0,5	2	833
4471	Метод голосования:	Метод большинства голосов	3	833
4472	Формирование обучающих выборок:	Бутстрэп выборки	4	833
4473	Выбор классификатора:	Оптимальный классификатор	5	833
4474	Число потоков	4	6	833
4475	Базовый классификатор 0:	C45	7	833
4476	Базовый классификатор 1:	CART	8	833
4477	Базовый классификатор 2:	Logistic	9	833
6378	Число итераций:	100	0	834
6379	Минимальная допустимая ошибка классификатора:	0	1	834
6380	Максимальная допустимая ошибка классификатора:	0,5	2	834
6381	Метод голосования:	Метод большинства голосов	3	834
6382	Формирование обучающих выборок:	Бутстрэп выборки	4	834
6383	Выбор классификатора:	Оптимальный классификатор	5	834
6384	Число потоков	4	6	834
6385	Базовый классификатор 0:	Logistic	7	834
6386	Базовый классификатор 1:	CART	8	834
6387	Базовый классификатор 2:	C45	9	834
4004	Мета-классификатор:	J48	0	835
4005	Метод формирования мета-признаков:	10 - блочная кросс-проверка	1	835
4006	Базовый классификатор 0:	NeuralNetwork	2	835
4007	Базовый классификатор 1:	Logistic	3	835
4008	Базовый классификатор 2:	CART	4	835
4009	Базовый классификатор 3:	ID3	5	835
3700	Минимальное число объектов в листе:	4	0	836
3701	Максиальная глубина дерева:	0	1	836
3702	Случайное дерево:	false	2	836
3703	Бинарное дерево:	false	3	836
3704	Использование случайных расщеплений атрибута:	true	4	836
3705	Число случайных расщеплений атрибута:	15	5	836
6615	Минимальное число объектов в листе:	2	0	837
6616	Максиальная глубина дерева:	0	1	837
6617	Случайное дерево:	false	2	837
6618	Бинарное дерево:	false	3	837
6619	Использование случайных расщеплений атрибута:	false	4	837
5624	Число деревьев:	100	0	838
5625	Минимальное число объектов в листе:	2	1	838
5626	Максиальная глубина дерева:	0	2	838
5627	Число случайных атрибутов:	3	3	838
5628	Алгоритм построения дерева решений:	C45	4	838
5629	Число потоков	1	5	838
5630	Число случайных расщеплений атрибута:	25	6	838
5631	Формирование обучающих выборок:	Исходное обучающее множество	7	838
5160	Число деревьев:	100	0	839
5161	Минимальное число объектов в листе:	2	1	839
5162	Максиальная глубина дерева:	0	2	839
5163	Число случайных атрибутов:	3	3	839
5164	Алгоритм построения дерева решений:	C45	4	839
5165	Число потоков	1	5	839
5166	Число случайных расщеплений атрибута:	25	6	839
5167	Формирование обучающих выборок:	Исходное обучающее множество	7	839
3805	Минимальное число объектов в листе:	2	1	840
3806	Максиальная глубина дерева:	0	2	840
3807	Число случайных атрибутов:	3	3	840
3808	Алгоритм построения дерева решений:	C45	4	840
3809	Число потоков	1	5	840
3810	Число случайных расщеплений атрибута:	24	6	840
3811	Формирование обучающих выборок:	Исходное обучающее множество	7	840
3847	Число деревьев:	100	0	841
3848	Минимальное число объектов в листе:	2	1	841
3849	Максиальная глубина дерева:	0	2	841
3850	Число случайных атрибутов:	3	3	841
3851	Алгоритм построения дерева решений:	C45	4	841
3852	Число потоков	1	5	841
3853	Число случайных расщеплений атрибута:	24	6	841
3854	Формирование обучающих выборок:	Исходное обучающее множество	7	841
4896	Число итераций:	25	0	842
4897	Минимальная допустимая ошибка классификатора:	0	1	842
4898	Максимальная допустимая ошибка классификатора:	0,5	2	842
4899	Метод голосования:	Метод большинства голосов	3	842
4900	Формирование обучающих выборок:	Бутстрэп выборки	4	842
4901	Выбор классификатора:	Случайный классификатор	5	842
4902	Число потоков	1	6	842
4903	Базовый классификатор 0:	CART	7	842
4904	Базовый классификатор 1:	J48	8	842
4679	Число итераций:	25	0	843
4680	Минимальная допустимая ошибка классификатора:	0	1	843
4681	Максимальная допустимая ошибка классификатора:	0,5	2	843
4682	Базовый классификатор 0:	CART	3	843
4683	Базовый классификатор 1:	J48	4	843
5855	Максимальное число итераций:	200	0	844
5856	Метод поиска минимума:	Квазиньютоновский метод	1	844
5527	Максимальное число итераций:	200	0	845
5528	Метод поиска минимума:	Квазиньютоновский метод	1	845
4148	Число итераций:	100	0	846
4149	Минимальная допустимая ошибка классификатора:	0	1	846
4150	Максимальная допустимая ошибка классификатора:	0,5	2	846
4151	Метод голосования:	Метод большинства голосов	3	846
4152	Формирование обучающих выборок:	Использование исходной выборки	4	846
4153	Выбор классификатора:	Случайный классификатор	5	846
4154	Число потоков	2	6	846
4155	Базовый классификатор 0:	NeuralNetwork	7	846
4156	Базовый классификатор 1:	Logistic	8	846
4157	Базовый классификатор 2:	CART	9	846
4158	Базовый классификатор 3:	C45	10	846
5045	Число итераций:	10	0	847
5046	Минимальная допустимая ошибка классификатора:	0	1	847
5047	Максимальная допустимая ошибка классификатора:	0,5	2	847
5048	Метод голосования:	Метод большинства голосов	3	847
5049	Формирование обучающих выборок:	Использование исходной выборки	4	847
5050	Выбор классификатора:	Случайный классификатор	5	847
5051	Число потоков	1	6	847
5052	Базовый классификатор 0:	CART	7	847
5053	Базовый классификатор 1:	KNearestNeighbours	8	847
5054	Базовый классификатор 2:	NeuralNetwork	9	847
6782	Максимальное число итераций:	200	0	848
6783	Метод поиска минимума:	Квазиньютоновский метод	1	848
3929	Число итераций:	100	0	849
3930	Минимальная допустимая ошибка классификатора:	0	1	849
3931	Максимальная допустимая ошибка классификатора:	0,5	2	849
3932	Метод голосования:	Метод взвешенного голосования	3	849
3933	Формирование обучающих выборок:	Бутстрэп выборки	4	849
3934	Выбор классификатора:	Случайный классификатор	5	849
3935	Число потоков	1	6	849
3936	Базовый классификатор 0:	NeuralNetwork	7	849
3937	Базовый классификатор 1:	J48	8	849
3938	Базовый классификатор 2:	KNearestNeighbours	9	849
3939	Базовый классификатор 3:	Logistic	10	849
3940	Базовый классификатор 4:	CHAID	11	849
3941	Базовый классификатор 5:	CART	12	849
6155	Минимальное число объектов в листе:	2	0	850
6156	Максиальная глубина дерева:	0	1	850
6157	Случайное дерево:	false	2	850
6158	Бинарное дерево:	false	3	850
6159	Использование случайных расщеплений атрибута:	false	4	850
6160	Уровень значимости alpha:	0.05	5	850
4604	Количество нейронов во входном слое:	4	0	851
4605	Количество нейронов в выходном слое:	3	1	851
4606	Количество скрытых слоев:	1	2	851
4607	Структура скрытого слоя:	7	3	851
4608	Максимальное число итераций:	1000000	4	851
4609	Допустимая ошибка:	0,00001	5	851
4610	Активационная функция нейронов скрытого слоя:	Функция SoftSign	6	851
4611	Формула активационной функции нейронов скрытого слоя:	f(S)=0,89*S/(1+|S|)	7	851
4612	Активационная функция нейронов выходного слоя:	Логистическая	8	851
4613	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	851
4614	Алгоритм обучения:	BackPropagation	10	851
4615	Коэффициент скорости обучения:	0,1	11	851
4616	Коэффициент момента:	0,2	12	851
4197	Количество нейронов во входном слое:	35	0	852
4198	Количество нейронов в выходном слое:	19	1	852
4199	Количество скрытых слоев:	1	2	852
4200	Структура скрытого слоя:	23	3	852
4201	Максимальное число итераций:	1000000	4	852
4202	Допустимая ошибка:	0,00001	5	852
4203	Активационная функция нейронов скрытого слоя:	Логистическая	6	852
4204	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	852
4205	Активационная функция нейронов выходного слоя:	Логистическая	8	852
4206	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	852
4207	Алгоритм обучения:	BackPropagation	10	852
4208	Коэффициент скорости обучения:	0,1	11	852
4209	Коэффициент момента:	0,2	12	852
6815	Число ближайших соседей:	10	0	853
6816	Вес ближайшего соседа:	1	1	853
6817	Функция расстояния:	Евкилидово расстояние	2	853
3728	Количество нейронов во входном слое:	4	0	854
3729	Количество нейронов в выходном слое:	3	1	854
3730	Количество скрытых слоев:	1	2	854
3731	Структура скрытого слоя:	7	3	854
3732	Максимальное число итераций:	1000000	4	854
3733	Допустимая ошибка:	0,00001	5	854
3735	Формула активационной функции нейронов скрытого слоя:	f(S)=sin(S)	7	854
3734	Активационная функция нейронов скрытого слоя:	Тригонометрический синус	6	854
3736	Активационная функция нейронов выходного слоя:	Логистическая	8	854
3737	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	854
3738	Алгоритм обучения:	BackPropagation	10	854
3739	Коэффициент скорости обучения:	0,1	11	854
3740	Коэффициент момента:	0,2	12	854
5043	Максимальное число итераций:	200	0	855
5044	Метод поиска минимума:	Квазиньютоновский метод	1	855
3712	Бинарное дерево:	true	3	877
5114	Минимальное число объектов в листе:	2	0	856
5115	Максиальная глубина дерева:	0	1	856
5116	Случайное дерево:	false	2	856
5117	Бинарное дерево:	true	3	856
5118	Использование случайных расщеплений атрибута:	false	4	856
3450	Количество нейронов во входном слое:	9	0	857
3451	Количество нейронов в выходном слое:	6	1	857
3452	Количество скрытых слоев:	1	2	857
3453	Структура скрытого слоя:	14	3	857
3454	Максимальное число итераций:	1000000	4	857
3455	Допустимая ошибка:	0,00001	5	857
3456	Активационная функция нейронов скрытого слоя:	Логистическая	6	857
3457	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-2*S))	7	857
3458	Активационная функция нейронов выходного слоя:	Логистическая	8	857
3459	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	857
3460	Алгоритм обучения:	BackPropagation	10	857
3461	Коэффициент скорости обучения:	0,1	11	857
3462	Коэффициент момента:	0,2	12	857
3463	Минимальное число объектов в листе:	2	0	858
3464	Максиальная глубина дерева:	0	1	858
3465	Случайное дерево:	false	2	858
3466	Бинарное дерево:	true	3	858
3467	Использование случайных расщеплений атрибута:	false	4	858
4402	Коэффициент момента:	0,2	12	859
4390	Количество нейронов во входном слое:	9	0	859
4391	Количество нейронов в выходном слое:	6	1	859
4392	Количество скрытых слоев:	1	2	859
4393	Структура скрытого слоя:	12	3	859
4394	Максимальное число итераций:	1000000	4	859
4395	Допустимая ошибка:	0,00001	5	859
4396	Активационная функция нейронов скрытого слоя:	Логистическая	6	859
4397	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-2*S))	7	859
4398	Активационная функция нейронов выходного слоя:	Логистическая	8	859
4399	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	859
4400	Алгоритм обучения:	BackPropagation	10	859
4401	Коэффициент скорости обучения:	0,1	11	859
6682	Максимальное число итераций:	200	0	860
6683	Метод поиска минимума:	Квазиньютоновский метод	1	860
4186	Число итераций:	100	0	861
4187	Минимальная допустимая ошибка классификатора:	0	1	861
4188	Максимальная допустимая ошибка классификатора:	0,5	2	861
4189	Метод голосования:	Метод взвешенного голосования	3	861
4190	Формирование обучающих выборок:	Бутстрэп выборки	4	861
4191	Выбор классификатора:	Случайный классификатор	5	861
4192	Число потоков	4	6	861
4193	Базовый классификатор 0:	CART	7	861
4194	Базовый классификатор 1:	ID3	8	861
4195	Базовый классификатор 2:	J48	9	861
4196	Базовый классификатор 3:	NeuralNetwork	10	861
6475	Максимальное число итераций:	200	0	862
6476	Метод поиска минимума:	Квазиньютоновский метод	1	862
4850	Максимальное число итераций:	200	0	863
4851	Метод поиска минимума:	Квазиньютоновский метод	1	863
4131	Мета-классификатор:	C45	0	864
4132	Метод формирования мета-признаков:	Использование обучающего множества	1	864
4133	Базовый классификатор 0:	Logistic	2	864
4134	Базовый классификатор 1:	CART	3	864
4135	Базовый классификатор 2:	NeuralNetwork	4	864
6761	Максимальное число итераций:	200	0	865
6762	Метод поиска минимума:	Квазиньютоновский метод	1	865
5784	Число итераций:	10	0	866
5785	Минимальная допустимая ошибка классификатора:	0	1	866
5786	Максимальная допустимая ошибка классификатора:	0,5	2	866
5787	Метод голосования:	Метод большинства голосов	3	866
5788	Формирование обучающих выборок:	Бутстрэп выборки	4	866
5789	Выбор классификатора:	Случайный классификатор	5	866
5790	Число потоков	1	6	866
5791	Базовый классификатор 0:	CART	7	866
5792	Базовый классификатор 1:	Logistic	8	866
5793	Базовый классификатор 2:	J48	9	866
6187	Мета-классификатор:	C45	0	867
6188	Метод формирования мета-признаков:	Использование обучающего множества	1	867
6189	Базовый классификатор 0:	CART	2	867
6190	Базовый классификатор 1:	NeuralNetwork	3	867
6191	Базовый классификатор 2:	Logistic	4	867
5567	Число итераций:	10	0	868
5568	Минимальная допустимая ошибка классификатора:	0	1	868
5569	Максимальная допустимая ошибка классификатора:	0,5	2	868
5570	Базовый классификатор 0:	CART	3	868
5571	Базовый классификатор 1:	J48	4	868
5572	Базовый классификатор 2:	KNearestNeighbours	5	868
5573	Базовый классификатор 3:	Logistic	6	868
4044	Число деревьев:	10	0	869
4045	Минимальное число объектов в листе:	2	1	869
4046	Максиальная глубина дерева:	0	2	869
4047	Число случайных атрибутов:	4	3	869
4048	Алгоритм построения дерева решений:	CART	4	869
4049	Число потоков	1	5	869
4050	Число случайных расщеплений атрибута:	10	6	869
4051	Формирование обучающих выборок:	Исходное обучающее множество	7	869
6069	Число итераций:	100	0	870
6070	Минимальная допустимая ошибка классификатора:	0	1	870
6071	Максимальная допустимая ошибка классификатора:	0,5	2	870
6072	Метод голосования:	Метод взвешенного голосования	3	870
6073	Формирование обучающих выборок:	Бутстрэп выборки	4	870
6074	Выбор классификатора:	Случайный классификатор	5	870
6075	Число потоков	1	6	870
6076	Базовый классификатор 0:	J48	7	870
6077	Базовый классификатор 1:	NeuralNetwork	8	870
6078	Базовый классификатор 2:	CART	9	870
6583	Максимальное число итераций:	200	0	871
6584	Метод поиска минимума:	Квазиньютоновский метод	1	871
6295	Минимальное число объектов в листе:	2	0	872
6296	Максиальная глубина дерева:	0	1	872
6297	Случайное дерево:	false	2	872
6298	Бинарное дерево:	false	3	872
6299	Использование случайных расщеплений атрибута:	false	4	872
3812	Минимальное число объектов в листе:	2	0	873
3813	Максиальная глубина дерева:	0	1	873
3814	Случайное дерево:	false	2	873
3815	Бинарное дерево:	false	3	873
3816	Использование случайных расщеплений атрибута:	false	4	873
6754	Минимальное число объектов в листе:	2	0	874
6755	Максиальная глубина дерева:	0	1	874
6756	Случайное дерево:	false	2	874
6757	Бинарное дерево:	false	3	874
6758	Использование случайных расщеплений атрибута:	false	4	874
6870	Число итераций:	25	0	875
6871	Минимальная допустимая ошибка классификатора:	0	1	875
6872	Максимальная допустимая ошибка классификатора:	0,5	2	875
6873	Начальное значение (Seed)	1	3	875
6874	Базовый классификатор 0:	KNearestNeighbours	4	875
6671	Минимальное число объектов в листе:	2	0	876
6672	Максиальная глубина дерева:	0	1	876
6673	Случайное дерево:	false	2	876
6674	Бинарное дерево:	true	3	876
6675	Использование случайных расщеплений атрибута:	false	4	876
3709	Минимальное число объектов в листе:	2	0	877
3710	Максиальная глубина дерева:	0	1	877
3711	Случайное дерево:	false	2	877
3713	Использование случайных расщеплений атрибута:	false	4	877
3714	Уровень значимости alpha:	0.05	5	877
6806	Минимальное число объектов в листе:	2	0	878
6807	Максиальная глубина дерева:	0	1	878
6808	Случайное дерево:	false	2	878
6809	Бинарное дерево:	true	3	878
6810	Использование случайных расщеплений атрибута:	false	4	878
6283	Минимальное число объектов в листе:	2	0	879
6284	Бинарное дерево:	false	1	879
6285	Усеченное дерево:	true	2	879
6286	Число блоков:	3	3	879
4180	Минимальное число объектов в листе:	2	0	880
4181	Бинарное дерево:	true	1	880
4182	Усеченное дерево:	true	2	880
4183	Число блоков:	3	3	880
4308	Минимальное число объектов в листе:	2	0	881
4309	Бинарное дерево:	true	1	881
4310	Усеченное дерево:	true	2	881
4311	Число блоков:	3	3	881
3325	Число ближайших соседей:	100	0	882
3326	Вес ближайшего соседа:	0,87	1	882
3327	Функция расстояния:	Расстояние Чебышева	2	882
5458	Количество нейронов во входном слое:	20	0	883
5459	Количество нейронов в выходном слое:	2	1	883
5460	Количество скрытых слоев:	1	2	883
5461	Структура скрытого слоя:	8	3	883
5462	Максимальное число итераций:	1000000	4	883
5463	Допустимая ошибка:	0,00001	5	883
5464	Активационная функция нейронов скрытого слоя:	Логистическая	6	883
5465	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-2*S))	7	883
5466	Активационная функция нейронов выходного слоя:	Логистическая	8	883
5467	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	883
5468	Алгоритм обучения:	BackPropagation	10	883
5469	Коэффициент скорости обучения:	0,1	11	883
5470	Коэффициент момента:	0,2	12	883
5618	Число деревьев:	25	0	884
5619	Минимальное число объектов в листе:	2	1	884
5620	Максиальная глубина дерева:	0	2	884
5621	Число случайных атрибутов:	4	3	884
5622	Алгоритм построения дерева решений:	CART	4	884
5623	Число потоков	1	5	884
4541	Число деревьев:	25	0	885
4542	Минимальное число объектов в листе:	2	1	885
4543	Максиальная глубина дерева:	0	2	885
4544	Число случайных атрибутов:	4	3	885
4545	Алгоритм построения дерева решений:	C45	4	885
4546	Число потоков	1	5	885
3942	Число деревьев:	25	0	886
3943	Минимальное число объектов в листе:	2	1	886
3944	Максиальная глубина дерева:	0	2	886
3945	Число случайных атрибутов:	7	3	886
3946	Алгоритм построения дерева решений:	CART	4	886
3947	Число потоков	2	5	886
3890	Число деревьев:	25	0	887
3891	Минимальное число объектов в листе:	2	1	887
3892	Максиальная глубина дерева:	0	2	887
3893	Число случайных атрибутов:	4	3	887
3894	Алгоритм построения дерева решений:	CART	4	887
3895	Число потоков	4	5	887
5886	Максимальное число итераций:	200	0	888
5887	Метод поиска минимума:	Квазиньютоновский метод	1	888
5338	Число итераций:	10	0	889
5339	Минимальная допустимая ошибка классификатора:	0	1	889
5340	Максимальная допустимая ошибка классификатора:	0,5	2	889
5341	Метод голосования:	Метод большинства голосов	3	889
5342	Формирование обучающих выборок:	Использование исходной выборки	4	889
5343	Выбор классификатора:	Случайный классификатор	5	889
5344	Число потоков	1	6	889
5345	Базовый классификатор 0:	Logistic	7	889
4627	Число итераций:	10	0	890
4628	Минимальная допустимая ошибка классификатора:	0	1	890
4629	Максимальная допустимая ошибка классификатора:	0,5	2	890
4630	Метод голосования:	Метод большинства голосов	3	890
4631	Формирование обучающих выборок:	Использование исходной выборки	4	890
4632	Выбор классификатора:	Случайный классификатор	5	890
4633	Число потоков	1	6	890
4634	Базовый классификатор 0:	Logistic	7	890
5807	Число итераций:	10	0	891
5808	Минимальная допустимая ошибка классификатора:	0	1	891
5809	Максимальная допустимая ошибка классификатора:	0,5	2	891
5810	Метод голосования:	Метод большинства голосов	3	891
5811	Формирование обучающих выборок:	Использование исходной выборки	4	891
5812	Выбор классификатора:	Случайный классификатор	5	891
5813	Число потоков	1	6	891
5814	Базовый классификатор 0:	Logistic	7	891
4905	Число итераций:	10	0	892
4906	Минимальная допустимая ошибка классификатора:	0	1	892
4907	Максимальная допустимая ошибка классификатора:	0,5	2	892
4908	Метод голосования:	Метод большинства голосов	3	892
4909	Формирование обучающих выборок:	Использование исходной выборки	4	892
4910	Выбор классификатора:	Случайный классификатор	5	892
4911	Число потоков	1	6	892
4912	Базовый классификатор 0:	Logistic	7	892
6562	Число итераций:	10	0	893
6563	Минимальная допустимая ошибка классификатора:	0	1	893
6564	Максимальная допустимая ошибка классификатора:	0,5	2	893
6565	Метод голосования:	Метод большинства голосов	3	893
6566	Формирование обучающих выборок:	Использование исходной выборки	4	893
6567	Выбор классификатора:	Случайный классификатор	5	893
6568	Число потоков	1	6	893
6569	Базовый классификатор 0:	Logistic	7	893
5026	Число итераций:	10	0	894
5027	Минимальная допустимая ошибка классификатора:	0	1	894
5028	Максимальная допустимая ошибка классификатора:	0,5	2	894
5029	Метод голосования:	Метод взвешенного голосования	3	894
5031	Выбор классификатора:	Оптимальный классификатор	5	894
5030	Формирование обучающих выборок:	Использование исходной выборки	4	894
5032	Число потоков	1	6	894
5033	Базовый классификатор 0:	Logistic	7	894
3793	Максимальное число итераций:	200	0	895
3794	Метод поиска минимума:	Квазиньютоновский метод	1	895
4286	Максимальное число итераций:	200	0	896
4287	Метод поиска минимума:	Квазиньютоновский метод	1	896
4341	Минимальное число объектов в листе:	2	0	897
4342	Максиальная глубина дерева:	0	1	897
4343	Случайное дерево:	false	2	897
4344	Бинарное дерево:	false	3	897
4345	Использование случайных расщеплений атрибута:	false	4	897
6064	Минимальное число объектов в листе:	2	0	898
6065	Максиальная глубина дерева:	0	1	898
6066	Случайное дерево:	false	2	898
6067	Бинарное дерево:	false	3	898
6068	Использование случайных расщеплений атрибута:	false	4	898
3767	Количество нейронов во входном слое:	9	0	899
3768	Количество нейронов в выходном слое:	6	1	899
3769	Количество скрытых слоев:	1	2	899
3770	Структура скрытого слоя:	9	3	899
3771	Максимальное число итераций:	1000000	4	899
3772	Допустимая ошибка:	0,00001	5	899
3773	Активационная функция нейронов скрытого слоя:	Логистическая	6	899
3774	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	899
3775	Активационная функция нейронов выходного слоя:	Логистическая	8	899
3776	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	899
3777	Алгоритм обучения:	BackPropagation	10	899
3778	Коэффициент скорости обучения:	0,1	11	899
3779	Коэффициент момента:	0,2	12	899
6804	Максимальное число итераций:	200	0	900
6805	Метод поиска минимума:	Квазиньютоновский метод	1	900
4478	Количество нейронов во входном слое:	9	0	901
4479	Количество нейронов в выходном слое:	6	1	901
4480	Количество скрытых слоев:	1	2	901
4481	Структура скрытого слоя:	9	3	901
4482	Максимальное число итераций:	1000000	4	901
4483	Допустимая ошибка:	0,00001	5	901
4484	Активационная функция нейронов скрытого слоя:	Логистическая	6	901
4485	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	901
4486	Активационная функция нейронов выходного слоя:	Логистическая	8	901
4487	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	901
4488	Алгоритм обучения:	BackPropagation	10	901
4489	Коэффициент скорости обучения:	0,1	11	901
4490	Коэффициент момента:	0,2	12	901
4491	Начальное значение (Seed)	1	13	901
5394	Алгоритм обучения:	BackPropagation	10	902
5395	Коэффициент скорости обучения:	0,1	11	902
5396	Коэффициент момента:	0,2	12	902
5397	Начальное значение (Seed)	1	13	902
5384	Количество нейронов во входном слое:	9	0	902
5385	Количество нейронов в выходном слое:	6	1	902
5386	Количество скрытых слоев:	1	2	902
5387	Структура скрытого слоя:	9	3	902
5388	Максимальное число итераций:	1000000	4	902
5389	Допустимая ошибка:	0,00001	5	902
5390	Активационная функция нейронов скрытого слоя:	Логистическая	6	902
5391	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	902
5392	Активационная функция нейронов выходного слоя:	Логистическая	8	902
5393	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	902
5136	Максимальное число итераций:	200	0	903
5137	Метод поиска минимума:	Квазиньютоновский метод	1	903
4338	Число ближайших соседей:	10	0	904
4339	Вес ближайшего соседа:	1	1	904
4340	Функция расстояния:	Квадрат Евклидова расстояния	2	904
3272	Число ближайших соседей:	10	0	905
3273	Вес ближайшего соседа:	1	1	905
3274	Функция расстояния:	Манхеттенское расстояние	2	905
6533	Число ближайших соседей:	10	0	906
6534	Вес ближайшего соседа:	1	1	906
6535	Функция расстояния:	Расстояние Чебышева	2	906
4136	Минимальное число объектов в листе:	2	0	907
4137	Максиальная глубина дерева:	0	1	907
4138	Случайное дерево:	false	2	907
4139	Бинарное дерево:	false	3	907
4140	Использование случайных расщеплений атрибута:	false	4	907
4141	Начальное значение (Seed)	1	5	907
5180	Минимальное число объектов в листе:	2	0	908
5181	Максиальная глубина дерева:	0	1	908
5182	Случайное дерево:	false	2	908
5183	Бинарное дерево:	true	3	908
5185	Начальное значение (Seed)	1	5	908
5184	Использование случайных расщеплений атрибута:	false	4	908
5214	Минимальное число объектов в листе:	2	0	909
5215	Максиальная глубина дерева:	0	1	909
5216	Случайное дерево:	false	2	909
5217	Бинарное дерево:	false	3	909
5218	Использование случайных расщеплений атрибута:	false	4	909
5219	Начальное значение (Seed)	1	5	909
5859	Усеченное дерево:	true	2	960
5220	Уровень значимости alpha:	0.05	6	909
6830	Минимальное число объектов в листе:	2	0	910
6831	Бинарное дерево:	false	1	910
6832	Усеченное дерево:	false	2	910
5221	Максимальное число итераций:	200	0	911
5222	Метод поиска минимума:	Квазиньютоновский метод	1	911
4919	Минимальное число объектов в листе:	2	0	912
4920	Максиальная глубина дерева:	0	1	912
4921	Случайное дерево:	false	2	912
4922	Бинарное дерево:	false	3	912
4923	Использование случайных расщеплений атрибута:	false	4	912
4924	Начальное значение (Seed)	1	5	912
6036	Минимальное число объектов в листе:	2	0	913
6037	Максиальная глубина дерева:	0	1	913
6038	Случайное дерево:	false	2	913
6039	Бинарное дерево:	true	3	913
6040	Использование случайных расщеплений атрибута:	false	4	913
6041	Начальное значение (Seed)	1	5	913
3259	Минимальное число объектов в листе:	2	0	914
3260	Максиальная глубина дерева:	0	1	914
3261	Случайное дерево:	false	2	914
3262	Бинарное дерево:	false	3	914
3263	Использование случайных расщеплений атрибута:	false	4	914
3264	Начальное значение (Seed)	1	5	914
3265	Уровень значимости alpha:	0.05	6	914
5739	Минимальное число объектов в листе:	2	0	915
5740	Бинарное дерево:	false	1	915
5741	Усеченное дерево:	false	2	915
3795	Минимальное число объектов в листе:	2	0	916
3796	Бинарное дерево:	true	1	916
3797	Усеченное дерево:	true	2	916
3798	Число блоков:	3	3	916
5398	Минимальное число объектов в листе:	2	0	917
5399	Бинарное дерево:	true	1	917
5400	Усеченное дерево:	false	2	917
3266	Минимальное число объектов в листе:	2	0	918
3267	Максиальная глубина дерева:	0	1	918
3268	Случайное дерево:	false	2	918
3269	Бинарное дерево:	true	3	918
3270	Использование случайных расщеплений атрибута:	false	4	918
3271	Начальное значение (Seed)	1	5	918
5537	Минимальное число объектов в листе:	2	0	919
5538	Максиальная глубина дерева:	0	1	919
5539	Случайное дерево:	false	2	919
5540	Бинарное дерево:	true	3	919
5541	Использование случайных расщеплений атрибута:	false	4	919
5542	Начальное значение (Seed)	1	5	919
5543	Уровень значимости alpha:	0.05	6	919
5007	Число итераций:	25	0	920
5008	Минимальная допустимая ошибка классификатора:	0	1	920
5009	Максимальная допустимая ошибка классификатора:	0,5	2	920
5010	Метод голосования:	Метод большинства голосов	3	920
5011	Формирование обучающих выборок:	Бутстрэп выборки	4	920
5012	Выбор классификатора:	Случайный классификатор	5	920
5013	Число потоков	4	6	920
5014	Начальное значение (Seed)	1	7	920
5015	Базовый классификатор 0:	NeuralNetwork	8	920
5016	Базовый классификатор 1:	KNearestNeighbours	9	920
5588	Число итераций:	25	0	921
5589	Минимальная допустимая ошибка классификатора:	0	1	921
5590	Максимальная допустимая ошибка классификатора:	0,5	2	921
5591	Метод голосования:	Метод большинства голосов	3	921
5592	Формирование обучающих выборок:	Бутстрэп выборки	4	921
5593	Выбор классификатора:	Случайный классификатор	5	921
5594	Число потоков	1	6	921
5595	Начальное значение (Seed)	1	7	921
5596	Базовый классификатор 0:	KNearestNeighbours	8	921
5597	Базовый классификатор 1:	KNearestNeighbours	9	921
6180	Число деревьев:	25	0	922
6181	Минимальное число объектов в листе:	2	1	922
6182	Максиальная глубина дерева:	0	2	922
6183	Число случайных атрибутов:	4	3	922
6184	Алгоритм построения дерева решений:	C45	4	922
6185	Число потоков	4	5	922
6186	Начальное значение (Seed)	1	6	922
4887	Число деревьев:	25	0	923
4888	Минимальное число объектов в листе:	2	1	923
4889	Максиальная глубина дерева:	0	2	923
4890	Число случайных атрибутов:	4	3	923
4891	Алгоритм построения дерева решений:	CART	4	923
4892	Число потоков	4	5	923
4893	Начальное значение (Seed)	1	6	923
4894	Число случайных расщеплений атрибута:	20	7	923
4895	Формирование обучающих выборок:	Исходное обучающее множество	8	923
4159	Число деревьев:	25	0	924
4160	Минимальное число объектов в листе:	2	1	924
4161	Максиальная глубина дерева:	0	2	924
4162	Число случайных атрибутов:	4	3	924
4163	Алгоритм построения дерева решений:	CART	4	924
4164	Число потоков	4	5	924
4165	Начальное значение (Seed)	1	6	924
4166	Число случайных расщеплений атрибута:	25	7	924
4167	Формирование обучающих выборок:	Бутстрэп-выборки	8	924
3229	Число деревьев:	25	0	925
3230	Минимальное число объектов в листе:	2	1	925
3231	Максиальная глубина дерева:	0	2	925
3232	Число случайных атрибутов:	4	3	925
3233	Алгоритм построения дерева решений:	ID3	4	925
3234	Число потоков	4	5	925
3235	Начальное значение (Seed)	1	6	925
3236	Число случайных расщеплений атрибута:	16	7	925
3237	Формирование обучающих выборок:	Бутстрэп-выборки	8	925
4243	Число деревьев:	25	0	926
4244	Минимальное число объектов в листе:	2	1	926
4245	Максиальная глубина дерева:	0	2	926
4246	Число случайных атрибутов:	10	3	926
4247	Алгоритм построения дерева решений:	CART	4	926
4248	Число потоков	4	5	926
4249	Начальное значение (Seed)	1	6	926
6266	Число деревьев:	25	0	927
6267	Минимальное число объектов в листе:	2	1	927
6268	Максиальная глубина дерева:	0	2	927
6269	Число случайных атрибутов:	4	3	927
6270	Алгоритм построения дерева решений:	CART	4	927
6271	Число потоков	4	5	927
6272	Начальное значение (Seed)	1	6	927
5282	Число деревьев:	25	0	928
3569	Начальное значение (Seed)	1	5	942
5283	Минимальное число объектов в листе:	2	1	928
5284	Максиальная глубина дерева:	0	2	928
5285	Число случайных атрибутов:	4	3	928
5286	Алгоритм построения дерева решений:	CART	4	928
5288	Начальное значение (Seed)	1	6	928
5289	Число случайных расщеплений атрибута:	30	7	928
5290	Формирование обучающих выборок:	Бутстрэп-выборки	8	928
6496	Максимальное число итераций:	200	0	929
6497	Метод поиска минимума:	Квазиньютоновский метод	1	929
6730	Случайное дерево:	false	2	930
6728	Минимальное число объектов в листе:	2	0	930
6729	Максиальная глубина дерева:	0	1	930
6731	Бинарное дерево:	false	3	930
6732	Использование случайных расщеплений атрибута:	false	4	930
6733	Начальное значение (Seed)	1	5	930
4072	Минимальное число объектов в листе:	2	0	931
4073	Максиальная глубина дерева:	0	1	931
4074	Случайное дерево:	false	2	931
4075	Бинарное дерево:	false	3	931
4076	Использование случайных расщеплений атрибута:	false	4	931
4077	Начальное значение (Seed)	1	5	931
6390	Минимальное число объектов в листе:	2	0	932
6391	Максиальная глубина дерева:	0	1	932
6392	Случайное дерево:	false	2	932
6393	Бинарное дерево:	true	3	932
6394	Использование случайных расщеплений атрибута:	false	4	932
6395	Начальное значение (Seed)	1	5	932
5119	Минимальное число объектов в листе:	2	0	933
5120	Максиальная глубина дерева:	0	1	933
5121	Случайное дерево:	false	2	933
5122	Бинарное дерево:	true	3	933
5123	Использование случайных расщеплений атрибута:	false	4	933
5124	Начальное значение (Seed)	1	5	933
5401	Минимальное число объектов в листе:	2	0	934
5402	Максиальная глубина дерева:	0	1	934
5403	Случайное дерево:	false	2	934
5404	Бинарное дерево:	true	3	934
5405	Использование случайных расщеплений атрибута:	false	4	934
5406	Начальное значение (Seed)	1	5	934
5407	Уровень значимости alpha:	0.05	6	934
5143	Минимальное число объектов в листе:	2	0	935
5144	Бинарное дерево:	false	1	935
5145	Усеченное дерево:	true	2	935
5146	Число блоков:	3	3	935
5489	Минимальное число объектов в листе:	2	0	936
5490	Бинарное дерево:	true	1	936
5491	Усеченное дерево:	true	2	936
5492	Число блоков:	3	3	936
6419	Минимальное число объектов в листе:	2	0	937
6420	Бинарное дерево:	true	1	937
6421	Усеченное дерево:	false	2	937
5223	Минимальное число объектов в листе:	2	0	938
5224	Максиальная глубина дерева:	0	1	938
5225	Случайное дерево:	false	2	938
5226	Бинарное дерево:	false	3	938
5227	Использование случайных расщеплений атрибута:	false	4	938
5228	Начальное значение (Seed)	1	5	938
3896	Максимальное число итераций:	200	0	939
3897	Метод поиска минимума:	Квазиньютоновский метод	1	939
4403	Минимальное число объектов в листе:	2	0	940
4404	Максиальная глубина дерева:	0	1	940
4405	Случайное дерево:	false	2	940
4406	Бинарное дерево:	false	3	940
4407	Использование случайных расщеплений атрибута:	false	4	940
4408	Начальное значение (Seed)	1	5	940
5493	Минимальное число объектов в листе:	2	0	941
5494	Максиальная глубина дерева:	0	1	941
5495	Случайное дерево:	false	2	941
5496	Бинарное дерево:	false	3	941
5497	Использование случайных расщеплений атрибута:	false	4	941
5498	Начальное значение (Seed)	1	5	941
5499	Уровень значимости alpha:	0.05	6	941
3564	Минимальное число объектов в листе:	2	0	942
3565	Максиальная глубина дерева:	0	1	942
3566	Случайное дерево:	false	2	942
3567	Бинарное дерево:	true	3	942
3568	Использование случайных расщеплений атрибута:	false	4	942
3570	Уровень значимости alpha:	0.05	6	942
3994	Минимальное число объектов в листе:	2	0	943
3995	Бинарное дерево:	false	1	943
3996	Усеченное дерево:	true	2	943
3997	Число блоков:	3	3	943
6638	Минимальное число объектов в листе:	2	0	944
6639	Максиальная глубина дерева:	0	1	944
6640	Случайное дерево:	false	2	944
6641	Бинарное дерево:	true	3	944
6642	Использование случайных расщеплений атрибута:	false	4	944
6643	Начальное значение (Seed)	1	5	944
4655	Минимальное число объектов в листе:	2	0	945
4656	Максиальная глубина дерева:	0	1	945
4657	Случайное дерево:	false	2	945
4658	Бинарное дерево:	true	3	945
5860	Число блоков:	3	3	960
4659	Использование случайных расщеплений атрибута:	false	4	945
4660	Начальное значение (Seed)	1	5	945
6813	Максимальное число итераций:	200	0	946
6814	Метод поиска минимума:	Квазиньютоновский метод	1	946
6592	Максимальное число итераций:	200	0	947
6593	Метод поиска минимума:	Квазиньютоновский метод	1	947
6372	Минимальное число объектов в листе:	2	0	948
6373	Максиальная глубина дерева:	0	1	948
6374	Случайное дерево:	false	2	948
6375	Бинарное дерево:	false	3	948
6376	Использование случайных расщеплений атрибута:	false	4	948
6377	Начальное значение (Seed)	1	5	948
5837	Минимальное число объектов в листе:	2	0	949
5838	Максиальная глубина дерева:	0	1	949
5839	Случайное дерево:	false	2	949
5840	Бинарное дерево:	true	3	949
5841	Использование случайных расщеплений атрибута:	false	4	949
5842	Начальное значение (Seed)	1	5	949
6090	Минимальное число объектов в листе:	2	0	950
6091	Максиальная глубина дерева:	0	1	950
6092	Случайное дерево:	false	2	950
6093	Бинарное дерево:	false	3	950
6094	Использование случайных расщеплений атрибута:	false	4	950
6095	Начальное значение (Seed)	1	5	950
6096	Уровень значимости alpha:	0.05	6	950
6463	Минимальное число объектов в листе:	2	0	951
6464	Бинарное дерево:	false	1	951
6465	Усеченное дерево:	true	2	951
6466	Число блоков:	3	3	951
3967	Минимальное число объектов в листе:	2	0	952
3968	Максиальная глубина дерева:	0	1	952
3969	Случайное дерево:	false	2	952
3970	Бинарное дерево:	true	3	952
3971	Использование случайных расщеплений атрибута:	false	4	952
3972	Начальное значение (Seed)	1	5	952
4433	Минимальное число объектов в листе:	2	0	953
4434	Максиальная глубина дерева:	0	1	953
4435	Случайное дерево:	false	2	953
4436	Бинарное дерево:	true	3	953
4437	Использование случайных расщеплений атрибута:	false	4	953
4438	Начальное значение (Seed)	1	5	953
4439	Уровень значимости alpha:	0.05	6	953
6818	Минимальное число объектов в листе:	2	0	954
6819	Бинарное дерево:	false	1	954
6820	Усеченное дерево:	false	2	954
6692	Минимальное число объектов в листе:	2	0	955
6693	Бинарное дерево:	true	1	955
6694	Усеченное дерево:	false	2	955
4506	Максимальное число итераций:	200	0	956
4507	Метод поиска минимума:	Квазиньютоновский метод	1	956
6097	Минимальное число объектов в листе:	2	0	957
6098	Максиальная глубина дерева:	0	1	957
6099	Случайное дерево:	false	2	957
6100	Бинарное дерево:	false	3	957
6101	Использование случайных расщеплений атрибута:	false	4	957
6102	Начальное значение (Seed)	1	5	957
6796	Минимальное число объектов в листе:	2	0	958
6797	Максиальная глубина дерева:	0	1	958
6798	Случайное дерево:	false	2	958
6799	Бинарное дерево:	false	3	958
6800	Использование случайных расщеплений атрибута:	false	4	958
6801	Начальное значение (Seed)	1	5	958
6507	Минимальное число объектов в листе:	2	0	959
6508	Максиальная глубина дерева:	0	1	959
6509	Случайное дерево:	false	2	959
6510	Бинарное дерево:	true	3	959
6511	Использование случайных расщеплений атрибута:	false	4	959
6512	Начальное значение (Seed)	1	5	959
5857	Минимальное число объектов в листе:	2	0	960
5858	Бинарное дерево:	false	1	960
6519	Минимальное число объектов в листе:	2	0	961
6520	Максиальная глубина дерева:	0	1	961
6521	Случайное дерево:	false	2	961
6522	Бинарное дерево:	true	3	961
6523	Использование случайных расщеплений атрибута:	false	4	961
6524	Начальное значение (Seed)	1	5	961
5717	Минимальное число объектов в листе:	2	0	962
5718	Максиальная глубина дерева:	0	1	962
5719	Случайное дерево:	false	2	962
5720	Бинарное дерево:	true	3	962
5721	Использование случайных расщеплений атрибута:	false	4	962
5722	Начальное значение (Seed)	1	5	962
5723	Уровень значимости alpha:	0.05	6	962
4114	Минимальное число объектов в листе:	2	0	963
4115	Бинарное дерево:	true	1	963
4116	Усеченное дерево:	true	2	963
4117	Число блоков:	3	3	963
6745	Минимальное число объектов в листе:	2	0	964
6746	Бинарное дерево:	false	1	964
6747	Усеченное дерево:	false	2	964
6690	Максимальное число итераций:	200	0	965
6691	Метод поиска минимума:	Квазиньютоновский метод	1	965
5843	Минимальное число объектов в листе:	2	0	966
5844	Максиальная глубина дерева:	0	1	966
5845	Случайное дерево:	false	2	966
5846	Бинарное дерево:	true	3	966
5847	Использование случайных расщеплений атрибута:	false	4	966
5848	Начальное значение (Seed)	1	5	966
6422	Максимальное число итераций:	200	0	967
6423	Метод поиска минимума:	Квазиньютоновский метод	1	967
6590	Максимальное число итераций:	200	0	968
6591	Метод поиска минимума:	Квазиньютоновский метод	1	968
5903	Минимальное число объектов в листе:	2	0	969
5904	Максиальная глубина дерева:	0	1	969
5905	Случайное дерево:	false	2	969
5906	Бинарное дерево:	false	3	969
5907	Использование случайных расщеплений атрибута:	false	4	969
5908	Начальное значение (Seed)	1	5	969
6714	Минимальное число объектов в листе:	2	0	970
6715	Максиальная глубина дерева:	0	1	970
6716	Случайное дерево:	false	2	970
6717	Бинарное дерево:	false	3	970
6718	Использование случайных расщеплений атрибута:	false	4	970
6719	Начальное значение (Seed)	1	5	970
5415	Минимальное число объектов в листе:	2	0	971
5416	Максиальная глубина дерева:	0	1	971
5417	Случайное дерево:	false	2	971
5418	Бинарное дерево:	true	3	971
5419	Использование случайных расщеплений атрибута:	false	4	971
5420	Начальное значение (Seed)	1	5	971
4354	Число деревьев:	100	0	972
4355	Минимальное число объектов в листе:	2	1	972
4356	Максиальная глубина дерева:	0	2	972
4357	Число случайных атрибутов:	6	3	972
4358	Алгоритм построения дерева решений:	CART	4	972
4359	Число потоков	2	5	972
4360	Начальное значение (Seed)	1	6	972
4361	Число случайных расщеплений атрибута:	20	7	972
4362	Формирование обучающих выборок:	Исходное обучающее множество	8	972
6118	Число деревьев:	75	0	973
6119	Минимальное число объектов в листе:	2	1	973
6120	Максиальная глубина дерева:	0	2	973
6121	Число случайных атрибутов:	3	3	973
6122	Алгоритм построения дерева решений:	C45	4	973
6123	Число потоков	4	5	973
6124	Начальное значение (Seed)	1	6	973
6125	Число случайных расщеплений атрибута:	17	7	973
6126	Формирование обучающих выборок:	Исходное обучающее множество	8	973
3571	Минимальное число объектов в листе:	2	0	974
3572	Максиальная глубина дерева:	0	1	974
3573	Случайное дерево:	false	2	974
3574	Бинарное дерево:	false	3	974
3575	Использование случайных расщеплений атрибута:	false	4	974
3576	Начальное значение (Seed)	1	5	974
6260	Минимальное число объектов в листе:	2	0	975
6261	Максиальная глубина дерева:	0	1	975
6262	Случайное дерево:	false	2	975
6263	Бинарное дерево:	false	3	975
6264	Использование случайных расщеплений атрибута:	false	4	975
6265	Начальное значение (Seed)	1	5	975
4803	Минимальное число объектов в листе:	2	0	976
4804	Максиальная глубина дерева:	0	1	976
4805	Случайное дерево:	false	2	976
4806	Бинарное дерево:	true	3	976
4807	Использование случайных расщеплений атрибута:	false	4	976
4808	Начальное значение (Seed)	1	5	976
5987	Минимальное число объектов в листе:	2	0	977
5988	Максиальная глубина дерева:	0	1	977
5989	Случайное дерево:	false	2	977
5990	Бинарное дерево:	false	3	977
5991	Использование случайных расщеплений атрибута:	false	4	977
5992	Начальное значение (Seed)	1	5	977
5993	Уровень значимости alpha:	0.05	6	977
6202	Минимальное число объектов в листе:	2	0	978
6203	Бинарное дерево:	false	1	978
6204	Усеченное дерево:	true	2	978
6205	Число блоков:	3	3	978
6700	Минимальное число объектов в листе:	2	0	979
6701	Максиальная глубина дерева:	0	1	979
6702	Случайное дерево:	false	2	979
6703	Бинарное дерево:	true	3	979
6704	Использование случайных расщеплений атрибута:	false	4	979
6705	Начальное значение (Seed)	1	5	979
6788	Минимальное число объектов в листе:	2	0	980
6789	Максиальная глубина дерева:	0	1	980
6790	Случайное дерево:	false	2	980
6791	Бинарное дерево:	true	3	980
6792	Использование случайных расщеплений атрибута:	false	4	980
6793	Начальное значение (Seed)	1	5	980
4959	Минимальное число объектов в листе:	2	0	981
4960	Максиальная глубина дерева:	0	1	981
4961	Случайное дерево:	false	2	981
4962	Бинарное дерево:	true	3	981
4963	Использование случайных расщеплений атрибута:	false	4	981
4964	Начальное значение (Seed)	1	5	981
4965	Уровень значимости alpha:	0.05	6	981
6057	Максимальное число итераций:	200	0	982
6058	Метод поиска минимума:	Квазиньютоновский метод	1	982
4250	Минимальное число объектов в листе:	2	0	983
4251	Бинарное дерево:	true	1	983
4252	Усеченное дерево:	true	2	983
4253	Число блоков:	3	3	983
4440	Минимальное число объектов в листе:	2	0	984
4441	Бинарное дерево:	false	1	984
4442	Усеченное дерево:	false	2	984
6436	Минимальное число объектов в листе:	2	0	985
6437	Бинарное дерево:	true	1	985
6438	Усеченное дерево:	false	2	985
3436	Число итераций:	25	0	986
3437	Минимальная допустимая ошибка классификатора:	0	1	986
3438	Максимальная допустимая ошибка классификатора:	0,5	2	986
3439	Начальное значение (Seed)	1	3	986
3440	Базовый классификатор 0:	KNearestNeighbours	4	986
3441	Базовый классификатор 1:	KNearestNeighbours	5	986
3665	Число итераций:	25	0	987
3666	Минимальная допустимая ошибка классификатора:	0	1	987
3667	Максимальная допустимая ошибка классификатора:	0,5	2	987
3668	Начальное значение (Seed)	1	3	987
3669	Базовый классификатор 0:	KNearestNeighbours	4	987
3670	Базовый классификатор 1:	KNearestNeighbours	5	987
5176	Минимальное число объектов в листе:	2	0	988
5177	Бинарное дерево:	false	1	988
5178	Усеченное дерево:	true	2	988
5179	Число блоков:	3	3	988
6477	Минимальное число объектов в листе:	2	0	989
6478	Бинарное дерево:	false	1	989
6479	Усеченное дерево:	false	2	989
6726	Максимальное число итераций:	200	0	990
6727	Метод поиска минимума:	Квазиньютоновский метод	1	990
5648	Случайное дерево:	false	2	991
5646	Минимальное число объектов в листе:	2	0	991
5647	Максиальная глубина дерева:	0	1	991
5649	Бинарное дерево:	true	3	991
5650	Использование случайных расщеплений атрибута:	false	4	991
5651	Начальное значение (Seed)	1	5	991
5632	Минимальное число объектов в листе:	2	0	992
5633	Максиальная глубина дерева:	0	1	992
5634	Случайное дерево:	false	2	992
5635	Бинарное дерево:	false	3	992
5636	Использование случайных расщеплений атрибута:	false	4	992
5637	Начальное значение (Seed)	1	5	992
5427	Минимальное число объектов в листе:	2	0	993
5428	Максиальная глубина дерева:	0	1	993
5429	Случайное дерево:	false	2	993
5430	Бинарное дерево:	false	3	993
5431	Использование случайных расщеплений атрибута:	false	4	993
5432	Начальное значение (Seed)	1	5	993
4819	Минимальное число объектов в листе:	2	0	994
4820	Максиальная глубина дерева:	0	1	994
4821	Случайное дерево:	false	2	994
4822	Бинарное дерево:	false	3	994
4823	Использование случайных расщеплений атрибута:	false	4	994
4824	Начальное значение (Seed)	1	5	994
4825	Уровень значимости alpha:	0.05	6	994
3351	Число деревьев:	10	0	995
3352	Минимальное число объектов в листе:	2	1	995
3353	Максиальная глубина дерева:	0	2	995
3354	Число случайных атрибутов:	18	3	995
3355	Алгоритм построения дерева решений:	CART	4	995
3356	Число потоков	4	5	995
3357	Начальное значение (Seed)	1	6	995
3358	Число случайных расщеплений атрибута:	7	7	995
3359	Формирование обучающих выборок:	Исходное обучающее множество	8	995
3619	Число деревьев:	10	0	996
3620	Минимальное число объектов в листе:	2	1	996
3621	Максиальная глубина дерева:	0	2	996
3622	Число случайных атрибутов:	18	3	996
3623	Алгоритм построения дерева решений:	CART	4	996
3624	Число потоков	1	5	996
3625	Начальное значение (Seed)	1	6	996
3626	Число случайных расщеплений атрибута:	7	7	996
3627	Формирование обучающих выборок:	Исходное обучающее множество	8	996
5828	Начальное значение (Seed)	1	6	997
5829	Число случайных расщеплений атрибута:	7	7	997
5830	Формирование обучающих выборок:	Исходное обучающее множество	8	997
5822	Число деревьев:	10	0	997
5823	Минимальное число объектов в листе:	2	1	997
5824	Максиальная глубина дерева:	0	2	997
5825	Число случайных атрибутов:	18	3	997
5826	Алгоритм построения дерева решений:	CART	4	997
5827	Число потоков	4	5	997
6370	Максимальное число итераций:	200	0	998
6371	Метод поиска минимума:	Квазиньютоновский метод	1	998
5248	Минимальное число объектов в листе:	2	0	999
5249	Максиальная глубина дерева:	0	1	999
5250	Случайное дерево:	false	2	999
5251	Бинарное дерево:	false	3	999
5252	Использование случайных расщеплений атрибута:	false	4	999
5253	Начальное значение (Seed)	1	5	999
4913	Минимальное число объектов в листе:	2	0	1000
4914	Максиальная глубина дерева:	0	1	1000
4915	Случайное дерево:	false	2	1000
4916	Бинарное дерево:	false	3	1000
4917	Использование случайных расщеплений атрибута:	false	4	1000
4918	Начальное значение (Seed)	1	5	1000
6042	Минимальное число объектов в листе:	2	0	1001
6043	Максиальная глубина дерева:	0	1	1001
6044	Случайное дерево:	false	2	1001
6045	Бинарное дерево:	true	3	1001
6046	Использование случайных расщеплений атрибута:	false	4	1001
6047	Начальное значение (Seed)	1	5	1001
3780	Минимальное число объектов в листе:	2	0	1002
3781	Максиальная глубина дерева:	0	1	1002
3782	Случайное дерево:	false	2	1002
3783	Бинарное дерево:	false	3	1002
3784	Использование случайных расщеплений атрибута:	false	4	1002
3785	Начальное значение (Seed)	1	5	1002
3786	Уровень значимости alpha:	0.05	6	1002
6471	Минимальное число объектов в листе:	2	0	1003
6472	Бинарное дерево:	false	1	1003
6473	Усеченное дерево:	true	2	1003
6474	Число блоков:	3	3	1003
5147	Минимальное число объектов в листе:	2	0	1004
5148	Бинарное дерево:	false	1	1004
5149	Усеченное дерево:	false	2	1004
3671	Количество нейронов во входном слое:	8	0	1005
3672	Количество нейронов в выходном слое:	2	1	1005
3673	Количество скрытых слоев:	1	2	1005
3674	Структура скрытого слоя:	14	3	1005
3675	Максимальное число итераций:	1000000	4	1005
3676	Допустимая ошибка:	0,00001	5	1005
3677	Активационная функция нейронов скрытого слоя:	Логистическая	6	1005
3678	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1005
3679	Активационная функция нейронов выходного слоя:	Логистическая	8	1005
3680	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1005
3681	Алгоритм обучения:	BackPropagation	10	1005
3682	Коэффициент скорости обучения:	0,1	11	1005
3683	Коэффициент момента:	0,2	12	1005
3684	Начальное значение (Seed)	1	13	1005
5471	Количество нейронов во входном слое:	8	0	1006
5472	Количество нейронов в выходном слое:	2	1	1006
5473	Количество скрытых слоев:	1	2	1006
5474	Структура скрытого слоя:	14	3	1006
5475	Максимальное число итераций:	1000000	4	1006
5476	Допустимая ошибка:	0,00001	5	1006
5477	Активационная функция нейронов скрытого слоя:	Гиперболический тангенс	6	1006
5478	Формула активационной функции нейронов скрытого слоя:	f(S)=(exp(S)-exp(-S))/(exp(S)+exp(-S))	7	1006
5479	Активационная функция нейронов выходного слоя:	Логистическая	8	1006
5480	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1006
5481	Алгоритм обучения:	BackPropagation	10	1006
5482	Коэффициент скорости обучения:	0,1	11	1006
5483	Коэффициент момента:	0,2	12	1006
5484	Начальное значение (Seed)	1	13	1006
5186	Количество нейронов во входном слое:	8	0	1007
5187	Количество нейронов в выходном слое:	2	1	1007
5188	Количество скрытых слоев:	1	2	1007
5189	Структура скрытого слоя:	14	3	1007
5190	Максимальное число итераций:	1000000	4	1007
5191	Допустимая ошибка:	0,00001	5	1007
5192	Активационная функция нейронов скрытого слоя:	Функция SoftSign	6	1007
5193	Формула активационной функции нейронов скрытого слоя:	f(S)=S/(1+|S|)	7	1007
5194	Активационная функция нейронов выходного слоя:	Логистическая	8	1007
4799	Бинарное дерево:	false	3	1018
5195	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1007
5196	Алгоритм обучения:	BackPropagation	10	1007
5197	Коэффициент скорости обучения:	0,1	11	1007
5198	Коэффициент момента:	0,2	12	1007
5199	Начальное значение (Seed)	1	13	1007
6426	Число итераций:	25	0	1008
6427	Минимальная допустимая ошибка классификатора:	0	1	1008
6428	Максимальная допустимая ошибка классификатора:	0,5	2	1008
6429	Метод голосования:	Метод большинства голосов	3	1008
6430	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	1008
6431	Выбор классификатора:	Случайный классификатор	5	1008
6432	Число потоков	4	6	1008
6433	Начальное значение (Seed)	1	7	1008
6434	Базовый классификатор 0:	NeuralNetwork	8	1008
6435	Базовый классификатор 1:	NeuralNetwork	9	1008
5150	Число итераций:	25	0	1009
5151	Минимальная допустимая ошибка классификатора:	0	1	1009
5152	Максимальная допустимая ошибка классификатора:	0,5	2	1009
5153	Метод голосования:	Метод большинства голосов	3	1009
5154	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	1009
5155	Выбор классификатора:	Случайный классификатор	5	1009
5156	Число потоков	4	6	1009
5157	Начальное значение (Seed)	1	7	1009
5158	Базовый классификатор 0:	NeuralNetwork	8	1009
5159	Базовый классификатор 1:	NeuralNetwork	9	1009
6531	Максимальное число итераций:	200	0	1010
6532	Метод поиска минимума:	Квазиньютоновский метод	1	1010
6513	Минимальное число объектов в листе:	2	0	1011
6514	Максиальная глубина дерева:	0	1	1011
6515	Случайное дерево:	false	2	1011
6516	Бинарное дерево:	false	3	1011
6517	Использование случайных расщеплений атрибута:	false	4	1011
6518	Начальное значение (Seed)	1	5	1011
4423	Минимальное число объектов в листе:	2	0	1012
4424	Максиальная глубина дерева:	0	1	1012
4425	Случайное дерево:	false	2	1012
4426	Бинарное дерево:	true	3	1012
4427	Использование случайных расщеплений атрибута:	false	4	1012
4428	Начальное значение (Seed)	1	5	1012
6684	Минимальное число объектов в листе:	2	0	1013
6685	Максиальная глубина дерева:	0	1	1013
6686	Случайное дерево:	false	2	1013
6687	Бинарное дерево:	true	3	1013
6688	Использование случайных расщеплений атрибута:	false	4	1013
6689	Начальное значение (Seed)	1	5	1013
6315	Минимальное число объектов в листе:	2	0	1014
6316	Максиальная глубина дерева:	0	1	1014
6317	Случайное дерево:	false	2	1014
6318	Бинарное дерево:	false	3	1014
6319	Использование случайных расщеплений атрибута:	false	4	1014
6320	Начальное значение (Seed)	1	5	1014
4016	Минимальное число объектов в листе:	2	0	1015
4017	Максиальная глубина дерева:	0	1	1015
4018	Случайное дерево:	false	2	1015
4019	Бинарное дерево:	true	3	1015
4020	Использование случайных расщеплений атрибута:	false	4	1015
4021	Начальное значение (Seed)	1	5	1015
5876	Минимальное число объектов в листе:	2	0	1016
5877	Бинарное дерево:	false	1	1016
5878	Усеченное дерево:	true	2	1016
5879	Число блоков:	3	3	1016
6467	Минимальное число объектов в листе:	2	0	1017
6468	Бинарное дерево:	true	1	1017
6469	Усеченное дерево:	true	2	1017
6470	Число блоков:	3	3	1017
4796	Минимальное число объектов в листе:	2	0	1018
4797	Максиальная глубина дерева:	0	1	1018
4798	Случайное дерево:	false	2	1018
4800	Использование случайных расщеплений атрибута:	false	4	1018
4801	Начальное значение (Seed)	1	5	1018
4802	Уровень значимости alpha:	0.05	6	1018
5681	Минимальное число объектов в листе:	2	0	1019
5682	Максиальная глубина дерева:	0	1	1019
5683	Случайное дерево:	false	2	1019
5684	Бинарное дерево:	true	3	1019
5685	Использование случайных расщеплений атрибута:	false	4	1019
5686	Начальное значение (Seed)	1	5	1019
5687	Уровень значимости alpha:	0.05	6	1019
5017	Минимальное число объектов в листе:	2	0	1020
5018	Бинарное дерево:	false	1	1020
5019	Усеченное дерево:	true	2	1020
5020	Число блоков:	3	3	1020
3817	Минимальное число объектов в листе:	2	0	1021
3818	Бинарное дерево:	false	1	1021
3819	Усеченное дерево:	false	2	1021
3475	Число деревьев:	100	0	1022
3476	Минимальное число объектов в листе:	2	1	1022
3477	Максиальная глубина дерева:	0	2	1022
3478	Число случайных атрибутов:	4	3	1022
3479	Алгоритм построения дерева решений:	CART	4	1022
3480	Число потоков	1	5	1022
3481	Начальное значение (Seed)	1	6	1022
3541	Число деревьев:	100	0	1023
3542	Минимальное число объектов в листе:	2	1	1023
3543	Максиальная глубина дерева:	0	2	1023
3544	Число случайных атрибутов:	4	3	1023
3545	Алгоритм построения дерева решений:	CART	4	1023
3546	Число потоков	1	5	1023
3547	Начальное значение (Seed)	1	6	1023
3286	Число деревьев:	100	0	1024
3287	Минимальное число объектов в листе:	2	1	1024
3288	Максиальная глубина дерева:	0	2	1024
3289	Число случайных атрибутов:	4	3	1024
3290	Алгоритм построения дерева решений:	CART	4	1024
3291	Число потоков	1	5	1024
3292	Начальное значение (Seed)	1	6	1024
3333	Число деревьев:	100	0	1025
3334	Минимальное число объектов в листе:	2	1	1025
3335	Максиальная глубина дерева:	0	2	1025
3336	Число случайных атрибутов:	4	3	1025
3337	Алгоритм построения дерева решений:	CART	4	1025
3338	Число потоков	2	5	1025
3339	Начальное значение (Seed)	1	6	1025
3340	Число случайных расщеплений атрибута:	25	7	1025
3341	Формирование обучающих выборок:	Исходное обучающее множество	8	1025
5654	Число деревьев:	100	0	1026
5655	Минимальное число объектов в листе:	2	1	1026
5656	Максиальная глубина дерева:	0	2	1026
5657	Число случайных атрибутов:	4	3	1026
5658	Алгоритм построения дерева решений:	C45	4	1026
5659	Число потоков	3	5	1026
5660	Начальное значение (Seed)	1	6	1026
5661	Число случайных расщеплений атрибута:	25	7	1026
5662	Формирование обучающих выборок:	Исходное обучающее множество	8	1026
4865	Число деревьев:	100	0	1027
4866	Минимальное число объектов в листе:	2	1	1027
4867	Максиальная глубина дерева:	0	2	1027
4868	Число случайных атрибутов:	4	3	1027
4869	Алгоритм построения дерева решений:	CART	4	1027
4870	Число потоков	3	5	1027
4871	Начальное значение (Seed)	1	6	1027
4872	Число случайных расщеплений атрибута:	15	7	1027
4873	Формирование обучающих выборок:	Исходное обучающее множество	8	1027
6127	Число деревьев:	100	0	1028
6128	Минимальное число объектов в листе:	2	1	1028
6129	Максиальная глубина дерева:	0	2	1028
6130	Число случайных атрибутов:	4	3	1028
6131	Алгоритм построения дерева решений:	CART	4	1028
6132	Число потоков	4	5	1028
6133	Начальное значение (Seed)	1	6	1028
6134	Число случайных расщеплений атрибута:	25	7	1028
6135	Формирование обучающих выборок:	Исходное обучающее множество	8	1028
3833	Число деревьев:	100	0	1029
3834	Минимальное число объектов в листе:	2	1	1029
3835	Максиальная глубина дерева:	0	2	1029
3836	Число случайных атрибутов:	4	3	1029
3837	Алгоритм построения дерева решений:	CART	4	1029
3838	Число потоков	4	5	1029
3839	Начальное значение (Seed)	1	6	1029
3840	Число случайных расщеплений атрибута:	25	7	1029
3841	Формирование обучающих выборок:	Бутстрэп-выборки	8	1029
5867	Число деревьев:	100	0	1030
5868	Минимальное число объектов в листе:	2	1	1030
5869	Максиальная глубина дерева:	0	2	1030
5870	Число случайных атрибутов:	8	3	1030
5871	Алгоритм построения дерева решений:	CART	4	1030
5872	Число потоков	4	5	1030
5873	Начальное значение (Seed)	1	6	1030
5874	Число случайных расщеплений атрибута:	25	7	1030
5875	Формирование обучающих выборок:	Исходное обучающее множество	8	1030
4280	Число итераций:	10	0	1031
4281	Минимальная допустимая ошибка сети:	0	1	1031
4282	Максимальная допустимая ошибка сети:	0,5	2	1031
4283	Формирование обучающих выборок:	Бутстрэп-выборки	3	1031
4284	Число потоков	4	4	1031
4285	Начальное значение (Seed)	1	5	1031
4570	Число деревьев:	100	0	1032
4571	Минимальное число объектов в листе:	2	1	1032
4572	Максиальная глубина дерева:	0	2	1032
4573	Число случайных атрибутов:	4	3	1032
4574	Алгоритм построения дерева решений:	CART	4	1032
4575	Число потоков	1	5	1032
4576	Начальное значение (Seed)	1	6	1032
4527	Число деревьев:	100	0	1033
4528	Минимальное число объектов в листе:	2	1	1033
4529	Максиальная глубина дерева:	0	2	1033
4530	Число случайных атрибутов:	8	3	1033
4531	Алгоритм построения дерева решений:	CART	4	1033
4532	Число потоков	4	5	1033
4533	Начальное значение (Seed)	1	6	1033
3577	Число деревьев:	100	0	1034
3578	Минимальное число объектов в листе:	2	1	1034
3579	Максиальная глубина дерева:	0	2	1034
3580	Число случайных атрибутов:	12	3	1034
3581	Алгоритм построения дерева решений:	CART	4	1034
3582	Число потоков	4	5	1034
3583	Начальное значение (Seed)	1	6	1034
6211	Минимальное число объектов в листе:	2	0	1035
6212	Максиальная глубина дерева:	0	1	1035
6213	Случайное дерево:	false	2	1035
6214	Бинарное дерево:	false	3	1035
6215	Использование случайных расщеплений атрибута:	false	4	1035
6216	Начальное значение (Seed)	1	5	1035
4022	Число деревьев:	75	0	1036
4023	Минимальное число объектов в листе:	2	1	1036
4024	Максиальная глубина дерева:	0	2	1036
4025	Число случайных атрибутов:	3	3	1036
4026	Алгоритм построения дерева решений:	C45	4	1036
4027	Число потоков	4	5	1036
4028	Начальное значение (Seed)	1	6	1036
4029	Число случайных расщеплений атрибута:	17	7	1036
4030	Формирование обучающих выборок:	Исходное обучающее множество	8	1036
3984	Число итераций:	25	0	1037
3985	Минимальная допустимая ошибка классификатора:	0	1	1037
3986	Максимальная допустимая ошибка классификатора:	0,5	2	1037
3987	Метод голосования:	Метод большинства голосов	3	1037
3988	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	1037
3989	Выбор классификатора:	Случайный классификатор	5	1037
3990	Число потоков	4	6	1037
3991	Начальное значение (Seed)	1	7	1037
3992	Базовый классификатор 0:	NeuralNetwork	8	1037
3993	Базовый классификатор 1:	NeuralNetwork	9	1037
3548	Минимальное число объектов в листе:	2	0	1038
3549	Максиальная глубина дерева:	0	1	1038
3550	Случайное дерево:	false	2	1038
3551	Бинарное дерево:	false	3	1038
3552	Использование случайных расщеплений атрибута:	false	4	1038
3553	Начальное значение (Seed)	1	5	1038
6768	Максимальное число итераций:	200	0	1039
6769	Метод поиска минимума:	Квазиньютоновский метод	1	1039
5724	Минимальное число объектов в листе:	2	0	1040
5725	Максиальная глубина дерева:	0	1	1040
5726	Случайное дерево:	false	2	1040
5727	Бинарное дерево:	true	3	1040
5728	Использование случайных расщеплений атрибута:	false	4	1040
5729	Начальное значение (Seed)	1	5	1040
6821	Максимальное число итераций:	200	0	1041
6822	Метод поиска минимума:	Квазиньютоновский метод	1	1041
6833	Минимальное число объектов в листе:	2	0	1042
6834	Максиальная глубина дерева:	0	1	1042
6835	Случайное дерево:	false	2	1042
6836	Бинарное дерево:	false	3	1042
6837	Использование случайных расщеплений атрибута:	false	4	1042
6838	Начальное значение (Seed)	1	5	1042
6452	Минимальное число объектов в листе:	2	0	1043
6453	Максиальная глубина дерева:	0	1	1043
6454	Случайное дерево:	false	2	1043
6455	Бинарное дерево:	true	3	1043
6456	Использование случайных расщеплений атрибута:	false	4	1043
6457	Начальное значение (Seed)	1	5	1043
6741	Максимальное число итераций:	200	0	1044
6742	Метод поиска минимума:	Квазиньютоновский метод	1	1044
6669	Максимальное число итераций:	200	0	1045
6670	Метод поиска минимума:	Квазиньютоновский метод	1	1045
4702	Минимальное число объектов в листе:	2	0	1046
4703	Максиальная глубина дерева:	0	1	1046
4704	Случайное дерево:	false	2	1046
4705	Бинарное дерево:	false	3	1046
4706	Использование случайных расщеплений атрибута:	false	4	1046
4707	Начальное значение (Seed)	1	5	1046
4274	Минимальное число объектов в листе:	2	0	1047
4275	Максиальная глубина дерева:	0	1	1047
4276	Случайное дерево:	false	2	1047
4277	Бинарное дерево:	false	3	1047
4278	Использование случайных расщеплений атрибута:	false	4	1047
4279	Начальное значение (Seed)	1	5	1047
4696	Минимальное число объектов в листе:	2	0	1048
4697	Максиальная глубина дерева:	0	1	1048
4698	Случайное дерево:	false	2	1048
4699	Бинарное дерево:	true	3	1048
4700	Использование случайных расщеплений атрибута:	false	4	1048
4701	Начальное значение (Seed)	1	5	1048
6658	Минимальное число объектов в листе:	2	0	1049
6659	Бинарное дерево:	false	1	1049
6660	Усеченное дерево:	true	2	1049
6661	Число блоков:	3	3	1049
4223	Минимальное число объектов в листе:	2	0	1050
4224	Максиальная глубина дерева:	0	1	1050
4225	Случайное дерево:	false	2	1050
4226	Бинарное дерево:	false	3	1050
4227	Использование случайных расщеплений атрибута:	false	4	1050
4228	Начальное значение (Seed)	1	5	1050
4229	Уровень значимости alpha:	0.05	6	1050
4254	Количество нейронов во входном слое:	9	0	1051
4255	Количество нейронов в выходном слое:	2	1	1051
4256	Количество скрытых слоев:	1	2	1051
4257	Структура скрытого слоя:	5	3	1051
4258	Максимальное число итераций:	1000000	4	1051
4259	Допустимая ошибка:	0,00001	5	1051
4260	Активационная функция нейронов скрытого слоя:	Логистическая	6	1051
4261	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1051
4262	Активационная функция нейронов выходного слоя:	Логистическая	8	1051
4263	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1051
4264	Алгоритм обучения:	BackPropagation	10	1051
4265	Коэффициент скорости обучения:	0,1	11	1051
4266	Коэффициент момента:	0,2	12	1051
4267	Начальное значение (Seed)	1	13	1051
6500	Число деревьев:	10	0	1052
6501	Минимальное число объектов в листе:	2	1	1052
6502	Максиальная глубина дерева:	0	2	1052
6503	Число случайных атрибутов:	3	3	1052
6504	Алгоритм построения дерева решений:	CART	4	1052
6505	Число потоков	3	5	1052
6506	Начальное значение (Seed)	1	6	1052
6192	Число деревьев:	10	0	1053
6193	Минимальное число объектов в листе:	2	1	1053
6194	Максиальная глубина дерева:	0	2	1053
6195	Число случайных атрибутов:	3	3	1053
6196	Алгоритм построения дерева решений:	C45	4	1053
6197	Число потоков	1	5	1053
6198	Начальное значение (Seed)	1	6	1053
6628	Минимальное число объектов в листе:	2	0	1054
6629	Максиальная глубина дерева:	0	1	1054
6630	Случайное дерево:	false	2	1054
6631	Бинарное дерево:	false	3	1054
6632	Использование случайных расщеплений атрибута:	false	4	1054
6633	Начальное значение (Seed)	1	5	1054
5931	Число итераций:	25	0	1055
5932	Минимальная допустимая ошибка классификатора:	0	1	1055
5933	Максимальная допустимая ошибка классификатора:	0,5	2	1055
5934	Метод голосования:	Метод взвешенного голосования	3	1055
5935	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	1055
5936	Выбор классификатора:	Оптимальный классификатор	5	1055
5937	Число потоков	4	6	1055
5938	Начальное значение (Seed)	1	7	1055
5939	Базовый классификатор 0:	NeuralNetwork	8	1055
5940	Базовый классификатор 1:	KNearestNeighbours	9	1055
6743	Максимальное число итераций:	200	0	1056
6744	Метод поиска минимума:	Квазиньютоновский метод	1	1056
5994	Минимальное число объектов в листе:	2	0	1057
5995	Максиальная глубина дерева:	0	1	1057
5996	Случайное дерево:	false	2	1057
5997	Бинарное дерево:	true	3	1057
5998	Использование случайных расщеплений атрибута:	false	4	1057
5999	Начальное значение (Seed)	1	5	1057
3948	Количество нейронов во входном слое:	9	0	1058
3949	Количество нейронов в выходном слое:	6	1	1058
3950	Количество скрытых слоев:	1	2	1058
3951	Структура скрытого слоя:	9	3	1058
3952	Максимальное число итераций:	1000000	4	1058
3953	Допустимая ошибка:	0,00001	5	1058
3954	Активационная функция нейронов скрытого слоя:	Логистическая	6	1058
3955	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1058
3956	Активационная функция нейронов выходного слоя:	Логистическая	8	1058
3957	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1058
3958	Алгоритм обучения:	BackPropagation	10	1058
3959	Коэффициент скорости обучения:	0,1	11	1058
3960	Коэффициент момента:	0,2	12	1058
3961	Начальное значение (Seed)	1	13	1058
6424	Максимальное число итераций:	200	0	1059
6425	Метод поиска минимума:	Квазиньютоновский метод	1	1059
3554	Минимальное число объектов в листе:	2	0	1060
3555	Максиальная глубина дерева:	0	1	1060
3556	Случайное дерево:	false	2	1060
3557	Бинарное дерево:	false	3	1060
3558	Использование случайных расщеплений атрибута:	false	4	1060
3559	Начальное значение (Seed)	1	5	1060
4145	Бинарное дерево:	true	3	1061
4142	Минимальное число объектов в листе:	2	0	1061
4143	Максиальная глубина дерева:	0	1	1061
4144	Случайное дерево:	false	2	1061
4146	Использование случайных расщеплений атрибута:	false	4	1061
4147	Начальное значение (Seed)	1	5	1061
5254	Минимальное число объектов в листе:	2	0	1062
5255	Максиальная глубина дерева:	0	1	1062
5256	Случайное дерево:	false	2	1062
5257	Бинарное дерево:	true	3	1062
5258	Использование случайных расщеплений атрибута:	false	4	1062
5259	Начальное значение (Seed)	1	5	1062
3685	Минимальное число объектов в листе:	2	0	1063
3686	Максиальная глубина дерева:	0	1	1063
3687	Случайное дерево:	false	2	1063
3688	Бинарное дерево:	false	3	1063
3689	Использование случайных расщеплений атрибута:	false	4	1063
3690	Начальное значение (Seed)	1	5	1063
3691	Уровень значимости alpha:	0.05	6	1063
6530	Начальное значение (Seed)	1	5	1064
6525	Минимальное число объектов в листе:	2	0	1064
6526	Максиальная глубина дерева:	0	1	1064
6527	Случайное дерево:	false	2	1064
6528	Бинарное дерево:	true	3	1064
6529	Использование случайных расщеплений атрибута:	false	4	1064
6784	Максимальное число итераций:	200	0	1065
6785	Метод поиска минимума:	Квазиньютоновский метод	1	1065
3592	Количество нейронов во входном слое:	19	0	1066
3593	Количество нейронов в выходном слое:	4	1	1066
3594	Количество скрытых слоев:	1	2	1066
3595	Структура скрытого слоя:	12	3	1066
3596	Максимальное число итераций:	1000000	4	1066
3597	Допустимая ошибка:	0,00001	5	1066
3598	Активационная функция нейронов скрытого слоя:	Логистическая	6	1066
3599	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1066
3600	Активационная функция нейронов выходного слоя:	Логистическая	8	1066
3601	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1066
3602	Алгоритм обучения:	BackPropagation	10	1066
3603	Коэффициент скорости обучения:	0,1	11	1066
3604	Коэффициент момента:	0,2	12	1066
3605	Начальное значение (Seed)	1	13	1066
6302	Минимальное число объектов в листе:	2	0	1067
6303	Максиальная глубина дерева:	0	1	1067
6304	Случайное дерево:	false	2	1067
6305	Бинарное дерево:	false	3	1067
6306	Использование случайных расщеплений атрибута:	false	4	1067
6307	Начальное значение (Seed)	1	5	1067
4294	Количество нейронов во входном слое:	19	0	1068
4295	Количество нейронов в выходном слое:	4	1	1068
4296	Количество скрытых слоев:	1	2	1068
4297	Структура скрытого слоя:	10	3	1068
4298	Максимальное число итераций:	1000000	4	1068
4299	Допустимая ошибка:	0,00001	5	1068
4300	Активационная функция нейронов скрытого слоя:	Экспоненциальная	6	1068
4301	Формула активационной функции нейронов скрытого слоя:	f(S)=exp(-S^2)	7	1068
4302	Активационная функция нейронов выходного слоя:	Логистическая	8	1068
4303	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1068
4304	Алгоритм обучения:	BackPropagation	10	1068
4305	Коэффициент скорости обучения:	0,1	11	1068
4306	Коэффициент момента:	0,2	12	1068
4307	Начальное значение (Seed)	1	13	1068
4673	Минимальное число объектов в листе:	2	0	1069
4674	Максиальная глубина дерева:	0	1	1069
4675	Случайное дерево:	false	2	1069
4676	Бинарное дерево:	true	3	1069
4677	Использование случайных расщеплений атрибута:	false	4	1069
4678	Начальное значение (Seed)	1	5	1069
5880	Минимальное число объектов в листе:	2	0	1070
5881	Максиальная глубина дерева:	0	1	1070
5882	Случайное дерево:	false	2	1070
5883	Бинарное дерево:	false	3	1070
5884	Использование случайных расщеплений атрибута:	false	4	1070
5885	Начальное значение (Seed)	1	5	1070
6748	Минимальное число объектов в листе:	2	0	1071
6749	Максиальная глубина дерева:	0	1	1071
6750	Случайное дерево:	false	2	1071
6751	Бинарное дерево:	false	3	1071
6752	Использование случайных расщеплений атрибута:	false	4	1071
6753	Начальное значение (Seed)	1	5	1071
6360	Максимальное число итераций:	200	0	1072
6361	Метод поиска минимума:	Квазиньютоновский метод	1	1072
4777	Количество нейронов во входном слое:	33	0	1073
4778	Количество нейронов в выходном слое:	2	1	1073
4779	Количество скрытых слоев:	1	2	1073
4780	Структура скрытого слоя:	2	3	1073
4781	Максимальное число итераций:	1000000	4	1073
4782	Допустимая ошибка:	0,00001	5	1073
4783	Активационная функция нейронов скрытого слоя:	Логистическая	6	1073
4784	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1073
4785	Активационная функция нейронов выходного слоя:	Логистическая	8	1073
4786	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1073
4787	Алгоритм обучения:	BackPropagation	10	1073
4788	Коэффициент скорости обучения:	0,1	11	1073
4789	Коэффициент момента:	0,2	12	1073
4790	Начальное значение (Seed)	1	13	1073
4966	Количество нейронов во входном слое:	33	0	1074
4967	Количество нейронов в выходном слое:	2	1	1074
4968	Количество скрытых слоев:	1	2	1074
4969	Структура скрытого слоя:	14	3	1074
4970	Максимальное число итераций:	1000000	4	1074
4971	Допустимая ошибка:	0,00001	5	1074
4972	Активационная функция нейронов скрытого слоя:	Логистическая	6	1074
4973	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1074
4974	Активационная функция нейронов выходного слоя:	Логистическая	8	1074
4975	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1074
4976	Алгоритм обучения:	BackPropagation	10	1074
4977	Коэффициент скорости обучения:	0,1	11	1074
4978	Коэффициент момента:	0,2	12	1074
4979	Начальное значение (Seed)	1	13	1074
5544	Количество нейронов во входном слое:	33	0	1075
5545	Количество нейронов в выходном слое:	2	1	1075
5546	Количество скрытых слоев:	2	2	1075
5547	Структура скрытого слоя:	14,12	3	1075
5548	Максимальное число итераций:	1000000	4	1075
5549	Допустимая ошибка:	0,00001	5	1075
5550	Активационная функция нейронов скрытого слоя:	Экспоненциальная	6	1075
5551	Формула активационной функции нейронов скрытого слоя:	f(S)=exp(-S^2)	7	1075
5552	Активационная функция нейронов выходного слоя:	Логистическая	8	1075
5553	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1075
5554	Алгоритм обучения:	BackPropagation	10	1075
5555	Коэффициент скорости обучения:	0,1	11	1075
5556	Коэффициент момента:	0,2	12	1075
5557	Начальное значение (Seed)	1	13	1075
4727	Минимальное число объектов в листе:	2	0	1076
4728	Максиальная глубина дерева:	0	1	1076
4729	Случайное дерево:	false	2	1076
4730	Бинарное дерево:	true	3	1076
4731	Использование случайных расщеплений атрибута:	false	4	1076
4732	Начальное значение (Seed)	1	5	1076
6273	Максимальное число итераций:	200	0	1077
6274	Метод поиска минимума:	Квазиньютоновский метод	1	1077
5071	Количество нейронов во входном слое:	20	0	1078
5072	Количество нейронов в выходном слое:	2	1	1078
5073	Количество скрытых слоев:	1	2	1078
5074	Структура скрытого слоя:	8	3	1078
5075	Максимальное число итераций:	1000000	4	1078
5076	Допустимая ошибка:	0,00001	5	1078
5077	Активационная функция нейронов скрытого слоя:	Логистическая	6	1078
5078	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1078
5079	Активационная функция нейронов выходного слоя:	Логистическая	8	1078
5080	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1078
5081	Алгоритм обучения:	BackPropagation	10	1078
5082	Коэффициент скорости обучения:	0,1	11	1078
5083	Коэффициент момента:	0,2	12	1078
5084	Начальное значение (Seed)	1	13	1078
3256	Число ближайших соседей:	10	0	1079
3257	Вес ближайшего соседа:	1	1	1079
3258	Функция расстояния:	Евкилидово расстояние	2	1079
4174	Минимальное число объектов в листе:	2	0	1080
4175	Максиальная глубина дерева:	0	1	1080
4176	Случайное дерево:	false	2	1080
4177	Бинарное дерево:	false	3	1080
4178	Использование случайных расщеплений атрибута:	false	4	1080
4179	Начальное значение (Seed)	1	5	1080
4661	Минимальное число объектов в листе:	2	0	1081
4662	Максиальная глубина дерева:	0	1	1081
4663	Случайное дерево:	false	2	1081
4664	Бинарное дерево:	false	3	1081
4665	Использование случайных расщеплений атрибута:	false	4	1081
4666	Начальное значение (Seed)	1	5	1081
6141	Минимальное число объектов в листе:	2	0	1082
6142	Максиальная глубина дерева:	0	1	1082
6143	Случайное дерево:	false	2	1082
6144	Бинарное дерево:	false	3	1082
6145	Использование случайных расщеплений атрибута:	false	4	1082
6146	Начальное значение (Seed)	1	5	1082
6147	Уровень значимости alpha:	0.05	6	1082
5742	Минимальное число объектов в листе:	2	0	1083
5743	Бинарное дерево:	false	1	1083
5744	Усеченное дерево:	true	2	1083
5745	Число блоков:	3	3	1083
3923	Минимальное число объектов в листе:	2	0	1084
3924	Максиальная глубина дерева:	0	1	1084
3925	Случайное дерево:	false	2	1084
3926	Бинарное дерево:	false	3	1084
3927	Использование случайных расщеплений атрибута:	false	4	1084
3928	Начальное значение (Seed)	1	5	1084
5529	Максимальное число итераций:	200	0	1085
5530	Метод поиска минимума:	Квазиньютоновский метод	1	1085
5669	Минимальное число объектов в листе:	2	0	1086
5670	Максиальная глубина дерева:	0	1	1086
5671	Случайное дерево:	false	2	1086
5672	Бинарное дерево:	false	3	1086
5673	Использование случайных расщеплений атрибута:	false	4	1086
5674	Начальное значение (Seed)	1	5	1086
5485	Минимальное число объектов в листе:	2	0	1087
5486	Бинарное дерево:	false	1	1087
5487	Усеченное дерево:	true	2	1087
5488	Число блоков:	3	3	1087
5308	Минимальное число объектов в листе:	2	0	1088
5309	Максиальная глубина дерева:	0	1	1088
5310	Случайное дерево:	false	2	1088
5311	Бинарное дерево:	false	3	1088
5312	Использование случайных расщеплений атрибута:	false	4	1088
5313	Начальное значение (Seed)	1	5	1088
5314	Уровень значимости alpha:	0.05	6	1088
6227	Минимальное число объектов в листе:	2	0	1089
6228	Максиальная глубина дерева:	0	1	1089
6229	Случайное дерево:	false	2	1089
6230	Бинарное дерево:	false	3	1089
6231	Использование случайных расщеплений атрибута:	false	4	1089
6232	Начальное значение (Seed)	1	5	1089
4738	Число итераций:	50	0	1090
4739	Минимальная допустимая ошибка классификатора:	0	1	1090
4740	Максимальная допустимая ошибка классификатора:	0,5	2	1090
4741	Метод голосования:	Метод большинства голосов	3	1090
4742	Формирование обучающих выборок:	Бутстрэп выборки	4	1090
4743	Выбор классификатора:	Случайный классификатор	5	1090
4744	Число потоков	1	6	1090
4745	Начальное значение (Seed)	1	7	1090
4746	Базовый классификатор 0:	Logistic	8	1090
3496	Начальное значение (Seed)	1	7	1091
3497	Базовый классификатор 0:	NeuralNetwork	8	1091
3498	Базовый классификатор 1:	KNearestNeighbours	9	1091
3489	Число итераций:	25	0	1091
3490	Минимальная допустимая ошибка классификатора:	0	1	1091
3491	Максимальная допустимая ошибка классификатора:	0,5	2	1091
3492	Метод голосования:	Метод взвешенного голосования	3	1091
3493	Формирование обучающих выборок:	Бутстрэп выборки случайного размера	4	1091
3494	Выбор классификатора:	Оптимальный классификатор	5	1091
3495	Число потоков	2	6	1091
3749	Число итераций:	25	0	1092
3750	Минимальная допустимая ошибка классификатора:	0	1	1092
3751	Максимальная допустимая ошибка классификатора:	0,5	2	1092
3752	Начальное значение (Seed)	1	3	1092
3753	Базовый классификатор 0:	KNearestNeighbours	4	1092
3754	Базовый классификатор 1:	KNearestNeighbours	5	1092
6676	Число итераций:	25	0	1093
6677	Минимальная допустимая ошибка классификатора:	0	1	1093
6678	Максимальная допустимая ошибка классификатора:	0,5	2	1093
6679	Начальное значение (Seed)	1	3	1093
6680	Базовый классификатор 0:	KNearestNeighbours	4	1093
6681	Базовый классификатор 1:	KNearestNeighbours	5	1093
3799	Число итераций:	25	0	1094
3800	Минимальная допустимая ошибка классификатора:	0	1	1094
3801	Максимальная допустимая ошибка классификатора:	0,5	2	1094
3802	Начальное значение (Seed)	1	3	1094
3803	Базовый классификатор 0:	J48	4	1094
5849	Число итераций:	25	0	1095
5850	Минимальная допустимая ошибка классификатора:	0	1	1095
5851	Максимальная допустимая ошибка классификатора:	0,5	2	1095
5852	Начальное значение (Seed)	1	3	1095
5853	Базовый классификатор 0:	CART	4	1095
5854	Базовый классификатор 1:	ID3	5	1095
5971	Минимальное число объектов в листе:	2	0	1096
5972	Максиальная глубина дерева:	0	1	1096
5973	Случайное дерево:	false	2	1096
5974	Бинарное дерево:	false	3	1096
5975	Использование случайных расщеплений атрибута:	false	4	1096
5976	Начальное значение (Seed)	1	5	1096
5977	Уровень значимости alpha:	0.1	6	1096
6343	Максимальное число итераций:	500	0	1097
6344	Метод поиска минимума:	Квазиньютоновский метод	1	1097
5561	Минимальное число объектов в листе:	2	0	1098
5562	Максиальная глубина дерева:	0	1	1098
5563	Случайное дерево:	false	2	1098
5564	Бинарное дерево:	true	3	1098
5565	Использование случайных расщеплений атрибута:	false	4	1098
5566	Уровень значимости alpha:	0.05	5	1098
3238	Количество нейронов во входном слое:	16	0	1099
3239	Количество нейронов в выходном слое:	2	1	1099
3240	Количество скрытых слоев:	1	2	1099
3241	Структура скрытого слоя:	10	3	1099
3242	Максимальное число итераций:	1000000	4	1099
3243	Допустимая ошибка:	0,00001	5	1099
3244	Активационная функция нейронов скрытого слоя:	Логистическая	6	1099
3245	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1099
3246	Активационная функция нейронов выходного слоя:	Логистическая	8	1099
3247	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1099
3248	Алгоритм обучения:	BackPropagation	10	1099
3249	Коэффициент скорости обучения:	0,1	11	1099
3250	Коэффициент момента:	0,2	12	1099
4110	Число итераций:	10	0	1100
4111	Минимальная допустимая ошибка сети:	0	1	1100
4112	Максимальная допустимая ошибка сети:	0,5	2	1100
4113	Формирование обучающих выборок:	Бутстрэп-выборки	3	1100
4980	Число итераций:	10	0	1101
4981	Минимальная допустимая ошибка классификатора:	0	1	1101
4982	Максимальная допустимая ошибка классификатора:	0,5	2	1101
4983	Метод голосования:	Метод большинства голосов	3	1101
4984	Формирование обучающих выборок:	Бутстрэп выборки	4	1101
4985	Выбор классификатора:	Случайный классификатор	5	1101
4986	Базовый классификатор 0:	KNearestNeighbours	6	1101
4317	Количество нейронов во входном слое:	18	0	1102
4318	Количество нейронов в выходном слое:	7	1	1102
4319	Количество скрытых слоев:	1	2	1102
4320	Структура скрытого слоя:	36	3	1102
4321	Максимальное число итераций:	1000000	4	1102
4322	Допустимая ошибка:	0,00001	5	1102
4323	Активационная функция нейронов скрытого слоя:	Логистическая	6	1102
4324	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1102
4325	Активационная функция нейронов выходного слоя:	Логистическая	8	1102
4326	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1102
4327	Алгоритм обучения:	BackPropagation	10	1102
4328	Коэффициент скорости обучения:	0,1	11	1102
4329	Коэффициент момента:	0,2	12	1102
4377	Количество нейронов во входном слое:	18	0	1103
4378	Количество нейронов в выходном слое:	7	1	1103
4379	Количество скрытых слоев:	1	2	1103
4380	Структура скрытого слоя:	21	3	1103
4381	Максимальное число итераций:	1000000	4	1103
4382	Допустимая ошибка:	0,00001	5	1103
4383	Активационная функция нейронов скрытого слоя:	Логистическая	6	1103
4384	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1103
4385	Активационная функция нейронов выходного слоя:	Логистическая	8	1103
4386	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1103
4387	Алгоритм обучения:	BackPropagation	10	1103
4388	Коэффициент скорости обучения:	0,1	11	1103
4389	Коэффициент момента:	0,2	12	1103
6414	Минимальное число объектов в листе:	2	0	1104
6415	Максиальная глубина дерева:	0	1	1104
6416	Случайное дерево:	false	2	1104
6417	Бинарное дерево:	false	3	1104
6418	Использование случайных расщеплений атрибута:	false	4	1104
5500	Число итераций:	10	0	1105
5501	Минимальная допустимая ошибка классификатора:	0	1	1105
5502	Максимальная допустимая ошибка классификатора:	0,5	2	1105
5503	Метод голосования:	Метод взвешенного голосования	3	1105
5504	Формирование обучающих выборок:	Бутстрэп выборки	4	1105
5505	Выбор классификатора:	Оптимальный классификатор	5	1105
5506	Базовый классификатор 0:	CART	6	1105
5507	Базовый классификатор 1:	C45	7	1105
5688	Минимальное число объектов в листе:	2	0	1106
5689	Максиальная глубина дерева:	0	1	1106
5690	Случайное дерево:	false	2	1106
5691	Бинарное дерево:	true	3	1106
5692	Использование случайных расщеплений атрибута:	false	4	1106
6458	Минимальное число объектов в листе:	2	0	1107
6459	Максиальная глубина дерева:	0	1	1107
6460	Случайное дерево:	false	2	1107
6461	Бинарное дерево:	true	3	1107
6462	Использование случайных расщеплений атрибута:	false	4	1107
5000	Число итераций:	25	0	1108
5001	Минимальная допустимая ошибка классификатора:	0	1	1108
5002	Максимальная допустимая ошибка классификатора:	0,5	2	1108
5003	Метод голосования:	Метод большинства голосов	3	1108
5004	Формирование обучающих выборок:	Бутстрэп выборки	4	1108
5005	Выбор классификатора:	Случайный классификатор	5	1108
5006	Базовый классификатор 0:	C45	6	1108
4092	Минимальное число объектов в листе:	2	0	1109
4093	Максиальная глубина дерева:	0	1	1109
4094	Случайное дерево:	false	2	1109
4095	Бинарное дерево:	true	3	1109
4096	Использование случайных расщеплений атрибута:	false	4	1109
4925	Минимальное число объектов в листе:	2	0	1110
4926	Максиальная глубина дерева:	0	1	1110
4927	Случайное дерево:	false	2	1110
4928	Бинарное дерево:	true	3	1110
4929	Использование случайных расщеплений атрибута:	false	4	1110
4330	Число итераций:	10	0	1111
4331	Минимальная допустимая ошибка классификатора:	0	1	1111
4332	Максимальная допустимая ошибка классификатора:	0,5	2	1111
4333	Метод голосования:	Метод большинства голосов	3	1111
4334	Формирование обучающих выборок:	Бутстрэп выборки	4	1111
4335	Выбор классификатора:	Случайный классификатор	5	1111
4336	Базовый классификатор 0:	Logistic	6	1111
4337	Базовый классификатор 1:	CART	7	1111
3318	Число итераций:	10	0	1112
3319	Минимальная допустимая ошибка классификатора:	0	1	1112
3320	Максимальная допустимая ошибка классификатора:	0,5	2	1112
3321	Метод голосования:	Метод большинства голосов	3	1112
3322	Формирование обучающих выборок:	Бутстрэп выборки	4	1112
3323	Выбор классификатора:	Случайный классификатор	5	1112
3324	Базовый классификатор 0:	CART	6	1112
6555	Число деревьев:	10	0	1113
6556	Минимальное число объектов в листе:	2	1	1113
6557	Максиальная глубина дерева:	0	2	1113
6558	Число случайных атрибутов:	3	3	1113
6559	Алгоритм построения дерева решений:	CART	4	1113
6560	Число случайных расщеплений атрибута:	10	5	1113
6561	Формирование обучающих выборок:	Исходное обучающее множество	6	1113
5693	Число деревьев:	10	0	1114
5694	Минимальное число объектов в листе:	2	1	1114
5695	Максиальная глубина дерева:	0	2	1114
5696	Число случайных атрибутов:	3	3	1114
5697	Алгоритм построения дерева решений:	CHAID	4	1114
5698	Число случайных расщеплений атрибута:	10	5	1114
5699	Формирование обучающих выборок:	Исходное обучающее множество	6	1114
5520	Число деревьев:	10	0	1115
5521	Минимальное число объектов в листе:	2	1	1115
5522	Максиальная глубина дерева:	0	2	1115
5523	Число случайных атрибутов:	3	3	1115
5524	Алгоритм построения дерева решений:	C45	4	1115
5525	Число случайных расщеплений атрибута:	15	5	1115
5526	Формирование обучающих выборок:	Исходное обучающее множество	6	1115
5356	Число деревьев:	10	0	1116
5357	Минимальное число объектов в листе:	2	1	1116
5358	Максиальная глубина дерева:	0	2	1116
5359	Число случайных атрибутов:	3	3	1116
5360	Алгоритм построения дерева решений:	C45	4	1116
5361	Число случайных расщеплений атрибута:	20	5	1116
5362	Формирование обучающих выборок:	Исходное обучающее множество	6	1116
5964	Число деревьев:	50	0	1117
5965	Минимальное число объектов в листе:	2	1	1117
5966	Максиальная глубина дерева:	0	2	1117
5967	Число случайных атрибутов:	3	3	1117
5968	Алгоритм построения дерева решений:	CART	4	1117
4534	Число деревьев:	50	0	1118
4535	Минимальное число объектов в листе:	2	1	1118
4536	Максиальная глубина дерева:	0	2	1118
4537	Число случайных атрибутов:	3	3	1118
4538	Алгоритм построения дерева решений:	C45	4	1118
4539	Число случайных расщеплений атрибута:	25	5	1118
4540	Формирование обучающих выборок:	Исходное обучающее множество	6	1118
4367	Минимальное число объектов в листе:	2	0	1119
4368	Максиальная глубина дерева:	0	1	1119
4369	Случайное дерево:	false	2	1119
4370	Бинарное дерево:	true	3	1119
4371	Использование случайных расщеплений атрибута:	false	4	1119
3293	Число итераций:	50	0	1120
3294	Минимальная допустимая ошибка классификатора:	0	1	1120
3295	Максимальная допустимая ошибка классификатора:	0,5	2	1120
3296	Метод голосования:	Метод большинства голосов	3	1120
3297	Формирование обучающих выборок:	Случайные подвыборки	4	1120
3298	Выбор классификатора:	Оптимальный классификатор	5	1120
3299	Базовый классификатор 0:	CART	6	1120
3300	Базовый классификатор 1:	C45	7	1120
6287	Максимальное число итераций:	500	0	1121
6288	Метод поиска минимума:	Квазиньютоновский метод	1	1121
4587	Структура скрытого слоя:	9	3	1122
4588	Максимальное число итераций:	1000000	4	1122
4584	Количество нейронов во входном слое:	9	0	1122
4585	Количество нейронов в выходном слое:	6	1	1122
4586	Количество скрытых слоев:	1	2	1122
4589	Допустимая ошибка:	0,00001	5	1122
4590	Активационная функция нейронов скрытого слоя:	Логистическая	6	1122
4591	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1122
4592	Активационная функция нейронов выходного слоя:	Логистическая	8	1122
4593	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1122
4594	Алгоритм обучения:	BackPropagation	10	1122
4595	Коэффициент скорости обучения:	0,1	11	1122
4596	Коэффициент момента:	0,2	12	1122
3360	Минимальное число объектов в листе:	2	0	1123
3361	Максиальная глубина дерева:	0	1	1123
3362	Случайное дерево:	false	2	1123
3363	Бинарное дерево:	false	3	1123
3364	Использование случайных расщеплений атрибута:	false	4	1123
4449	Количество нейронов во входном слое:	27	0	1124
4450	Количество нейронов в выходном слое:	4	1	1124
4451	Количество скрытых слоев:	1	2	1124
4452	Структура скрытого слоя:	37	3	1124
4453	Максимальное число итераций:	1000000	4	1124
4454	Допустимая ошибка:	0,00001	5	1124
4455	Активационная функция нейронов скрытого слоя:	Логистическая	6	1124
4456	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1124
4457	Активационная функция нейронов выходного слоя:	Логистическая	8	1124
4458	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1124
4459	Алгоритм обучения:	BackPropagation	10	1124
4460	Коэффициент скорости обучения:	0,1	11	1124
4461	Коэффициент момента:	0,2	12	1124
3499	Число деревьев:	10	0	1125
3500	Минимальное число объектов в листе:	2	1	1125
3501	Максиальная глубина дерева:	0	2	1125
3502	Число случайных атрибутов:	5	3	1125
3503	Алгоритм построения дерева решений:	CART	4	1125
3504	Число случайных расщеплений атрибута:	10	5	1125
3505	Формирование обучающих выборок:	Исходное обучающее множество	6	1125
3628	Количество нейронов во входном слое:	27	0	1126
3629	Количество нейронов в выходном слое:	4	1	1126
3630	Количество скрытых слоев:	1	2	1126
3631	Структура скрытого слоя:	37	3	1126
3632	Максимальное число итераций:	1000000	4	1126
3633	Допустимая ошибка:	0,00001	5	1126
3634	Активационная функция нейронов скрытого слоя:	Экспоненциальная	6	1126
3635	Формула активационной функции нейронов скрытого слоя:	f(S)=exp(-S^2)	7	1126
3636	Активационная функция нейронов выходного слоя:	Логистическая	8	1126
3637	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1126
3638	Алгоритм обучения:	BackPropagation	10	1126
3639	Коэффициент скорости обучения:	0,1	11	1126
3640	Коэффициент момента:	0,2	12	1126
6364	Максимальное число итераций:	500	0	1127
6365	Метод поиска минимума:	Квазиньютоновский метод	1	1127
4031	Число деревьев:	10	0	1128
4032	Минимальное число объектов в листе:	2	1	1128
4033	Максиальная глубина дерева:	0	2	1128
4034	Число случайных атрибутов:	3	3	1128
4035	Алгоритм построения дерева решений:	C45	4	1128
4036	Число случайных расщеплений атрибута:	15	5	1128
4037	Формирование обучающих выборок:	Исходное обучающее множество	6	1128
5346	Число итераций:	10	0	1129
5347	Минимальная допустимая ошибка классификатора:	0	1	1129
5348	Максимальная допустимая ошибка классификатора:	0,5	2	1129
5349	Метод голосования:	Метод взвешенного голосования	3	1129
5350	Формирование обучающих выборок:	Бутстрэп выборки	4	1129
5351	Выбор классификатора:	Случайный классификатор	5	1129
5352	Базовый классификатор 0:	NeuralNetwork	6	1129
5353	Базовый классификатор 1:	Logistic	7	1129
5354	Базовый классификатор 2:	CART	8	1129
5355	Базовый классификатор 3:	C45	9	1129
5924	Минимальное число объектов в листе:	2	0	1130
5925	Бинарное дерево:	false	1	1130
5926	Усеченное дерево:	true	2	1130
5927	Число блоков:	3	3	1130
5909	Число деревьев:	10	0	1131
5910	Минимальное число объектов в листе:	2	1	1131
5911	Максиальная глубина дерева:	0	2	1131
5912	Число случайных атрибутов:	5	3	1131
5913	Алгоритм построения дерева решений:	CART	4	1131
5914	Число потоков	1	5	1131
6345	Число деревьев:	100	0	1132
6346	Минимальное число объектов в листе:	2	1	1132
6347	Максиальная глубина дерева:	0	2	1132
6348	Число случайных атрибутов:	4	3	1132
6349	Алгоритм построения дерева решений:	CART	4	1132
6350	Число потоков	1	5	1132
6275	Число деревьев:	10	0	1133
6276	Минимальное число объектов в листе:	2	1	1133
6277	Максиальная глубина дерева:	0	2	1133
6278	Число случайных атрибутов:	5	3	1133
6279	Алгоритм построения дерева решений:	CHAID	4	1133
6280	Число потоков	2	5	1133
6281	Число случайных расщеплений атрибута:	12	6	1133
6282	Формирование обучающих выборок:	Бутстрэп-выборки	7	1133
6839	Максимальное число итераций:	200	0	1134
6840	Метод поиска минимума:	Квазиньютоновский метод	1	1134
4052	Число деревьев:	100	0	1135
4053	Минимальное число объектов в листе:	2	1	1135
4054	Максиальная глубина дерева:	0	2	1135
4055	Число случайных атрибутов:	5	3	1135
4056	Алгоритм построения дерева решений:	C45	4	1135
4057	Число потоков	4	5	1135
3641	Число деревьев:	100	0	1136
3642	Минимальное число объектов в листе:	2	1	1136
3643	Максиальная глубина дерева:	0	2	1136
3644	Число случайных атрибутов:	5	3	1136
3645	Алгоритм построения дерева решений:	C45	4	1136
3646	Число потоков	4	5	1136
5580	Число деревьев:	100	0	1137
5581	Минимальное число объектов в листе:	2	1	1137
5582	Максиальная глубина дерева:	0	2	1137
5583	Число случайных атрибутов:	3	3	1137
5584	Алгоритм построения дерева решений:	CART	4	1137
5585	Число потоков	1	5	1137
5586	Число случайных расщеплений атрибута:	15	6	1137
5587	Формирование обучающих выборок:	Исходное обучающее множество	7	1137
6775	Минимальное число объектов в листе:	2	0	1138
6776	Максиальная глубина дерева:	0	1	1138
6777	Случайное дерево:	false	2	1138
6778	Бинарное дерево:	false	3	1138
6779	Использование случайных расщеплений атрибута:	false	4	1138
4363	Минимальное число объектов в листе:	2	0	1139
4364	Бинарное дерево:	false	1	1139
4365	Усеченное дерево:	true	2	1139
4366	Число блоков:	3	3	1139
4097	Количество нейронов во входном слое:	35	0	1140
4098	Количество нейронов в выходном слое:	19	1	1140
4099	Количество скрытых слоев:	1	2	1140
4100	Структура скрытого слоя:	23	3	1140
4101	Максимальное число итераций:	1000000	4	1140
4102	Допустимая ошибка:	0,00001	5	1140
4103	Активационная функция нейронов скрытого слоя:	Логистическая	6	1140
4104	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1140
4105	Активационная функция нейронов выходного слоя:	Логистическая	8	1140
4106	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1140
4107	Алгоритм обучения:	BackPropagation	10	1140
4108	Коэффициент скорости обучения:	0,1	11	1140
4109	Коэффициент момента:	0,2	12	1140
5328	Минимальное число объектов в листе:	2	0	1141
5329	Максиальная глубина дерева:	0	1	1141
5330	Случайное дерево:	false	2	1141
5331	Бинарное дерево:	false	3	1141
5332	Использование случайных расщеплений атрибута:	false	4	1141
5513	Минимальное число объектов в листе:	2	0	1142
5514	Бинарное дерево:	false	1	1142
5515	Усеченное дерево:	true	2	1142
5516	Число блоков:	3	3	1142
4987	Количество нейронов во входном слое:	19	0	1143
4988	Количество нейронов в выходном слое:	4	1	1143
4989	Количество скрытых слоев:	1	2	1143
4990	Структура скрытого слоя:	2	3	1143
4991	Максимальное число итераций:	1000000	4	1143
4992	Допустимая ошибка:	0,00001	5	1143
4993	Активационная функция нейронов скрытого слоя:	Логистическая	6	1143
4994	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1143
4995	Активационная функция нейронов выходного слоя:	Логистическая	8	1143
4996	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1143
4997	Алгоритм обучения:	BackPropagation	10	1143
4998	Коэффициент скорости обучения:	0,1	11	1143
4999	Коэффициент момента:	0,2	12	1143
5558	Минимальное число объектов в листе:	2	0	1144
5559	Бинарное дерево:	true	1	1144
5560	Усеченное дерево:	false	2	1144
6048	Максимальное число итераций:	200	0	1145
6049	Метод поиска минимума:	Квазиньютоновский метод	1	1145
3560	Минимальное число объектов в листе:	2	0	1146
3561	Бинарное дерево:	false	1	1146
3562	Усеченное дерево:	true	2	1146
3563	Число блоков:	3	3	1146
6600	Максимальное число итераций:	200	0	1147
6601	Метод поиска минимума:	Квазиньютоновский метод	1	1147
4826	Минимальное число объектов в листе:	2	0	1148
4827	Максиальная глубина дерева:	0	1	1148
4828	Случайное дерево:	false	2	1148
4829	Бинарное дерево:	false	3	1148
4830	Использование случайных расщеплений атрибута:	false	4	1148
4831	Уровень значимости alpha:	0.05	5	1148
5112	Максимальное число итераций:	200	0	1149
5113	Метод поиска минимума:	Квазиньютоновский метод	1	1149
6480	Минимальное число объектов в листе:	2	0	1150
6481	Бинарное дерево:	false	1	1150
6482	Усеченное дерево:	true	2	1150
6483	Число блоков:	3	3	1150
5978	Минимальное число объектов в листе:	2	0	1151
5979	Бинарное дерево:	false	1	1151
5980	Усеченное дерево:	true	2	1151
5981	Число блоков:	3	3	1151
3251	Минимальное число объектов в листе:	2	0	1152
3252	Максиальная глубина дерева:	0	1	1152
3253	Случайное дерево:	false	2	1152
3254	Бинарное дерево:	false	3	1152
3255	Использование случайных расщеплений атрибута:	false	4	1152
3842	Минимальное число объектов в листе:	2	0	1153
3843	Максиальная глубина дерева:	0	1	1153
3844	Случайное дерево:	false	2	1153
3845	Бинарное дерево:	false	3	1153
3846	Использование случайных расщеплений атрибута:	false	4	1153
5960	Минимальное число объектов в листе:	2	0	1154
5961	Бинарное дерево:	false	1	1154
5962	Усеченное дерево:	true	2	1154
5963	Число блоков:	3	3	1154
3400	Количество нейронов во входном слое:	8	0	1155
3401	Количество нейронов в выходном слое:	4	1	1155
3402	Количество скрытых слоев:	1	2	1155
3403	Структура скрытого слоя:	5	3	1155
3404	Максимальное число итераций:	1000000	4	1155
3405	Допустимая ошибка:	0,00001	5	1155
3406	Активационная функция нейронов скрытого слоя:	Логистическая	6	1155
3407	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1155
3408	Активационная функция нейронов выходного слоя:	Логистическая	8	1155
3409	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1155
3410	Алгоритм обучения:	BackPropagation	10	1155
3411	Коэффициент скорости обучения:	0,1	11	1155
3412	Коэффициент момента:	0,2	12	1155
4714	Число деревьев:	100	0	1156
4715	Минимальное число объектов в листе:	2	1	1156
4716	Максиальная глубина дерева:	0	2	1156
4717	Число случайных атрибутов:	5	3	1156
4718	Алгоритм построения дерева решений:	CART	4	1156
4719	Число потоков	1	5	1156
5733	Число деревьев:	100	0	1157
5734	Минимальное число объектов в листе:	2	1	1157
5735	Максиальная глубина дерева:	0	2	1157
5736	Число случайных атрибутов:	5	3	1157
5737	Алгоритм построения дерева решений:	CART	4	1157
5738	Число потоков	4	5	1157
6000	Число деревьев:	100	0	1158
6001	Минимальное число объектов в листе:	2	1	1158
6002	Максиальная глубина дерева:	0	2	1158
6003	Число случайных атрибутов:	5	3	1158
6004	Алгоритм построения дерева решений:	CART	4	1158
6005	Число потоков	1	5	1158
5700	Число деревьев:	100	0	1159
5701	Минимальное число объектов в листе:	2	1	1159
5702	Максиальная глубина дерева:	0	2	1159
5703	Число случайных атрибутов:	5	3	1159
5704	Алгоритм построения дерева решений:	CART	4	1159
5705	Число потоков	4	5	1159
6811	Максимальное число итераций:	200	0	1160
6812	Метод поиска минимума:	Квазиньютоновский метод	1	1160
3826	Максимальное число итераций:	200	0	1161
3827	Метод поиска минимума:	Квазиньютоновский метод	1	1161
5421	Число деревьев:	100	0	1162
5422	Минимальное число объектов в листе:	2	1	1162
5423	Максиальная глубина дерева:	0	2	1162
5424	Число случайных атрибутов:	4	3	1162
5425	Алгоритм построения дерева решений:	CART	4	1162
5426	Число потоков	4	5	1162
6388	Максимальное число итераций:	200	0	1163
6389	Метод поиска минимума:	Квазиньютоновский метод	1	1163
5104	Число деревьев:	10	0	1164
5105	Минимальное число объектов в листе:	2	1	1164
5106	Максиальная глубина дерева:	0	2	1164
5107	Число случайных атрибутов:	3	3	1164
5108	Алгоритм построения дерева решений:	CART	4	1164
5109	Число потоков	1	5	1164
5110	Число случайных расщеплений атрибута:	15	6	1164
5111	Формирование обучающих выборок:	Исходное обучающее множество	7	1164
5063	Число деревьев:	10	0	1165
5064	Минимальное число объектов в листе:	2	1	1165
5065	Максиальная глубина дерева:	0	2	1165
5066	Число случайных атрибутов:	3	3	1165
5067	Алгоритм построения дерева решений:	CART	4	1165
5068	Число потоков	3	5	1165
5069	Число случайных расщеплений атрибута:	15	6	1165
5070	Формирование обучающих выборок:	Исходное обучающее множество	7	1165
6570	Число итераций:	10	0	1166
6571	Минимальная допустимая ошибка сети:	0	1	1166
6572	Максимальная допустимая ошибка сети:	0,5	2	1166
6573	Формирование обучающих выборок:	Исходное обучающее множество	3	1166
6574	Число потоков	4	4	1166
4953	Число деревьев:	250	0	1167
4954	Минимальное число объектов в листе:	2	1	1167
4955	Максиальная глубина дерева:	0	2	1167
4956	Число случайных атрибутов:	4	3	1167
4957	Алгоритм построения дерева решений:	CART	4	1167
4958	Число потоков	1	5	1167
5948	Число деревьев:	250	0	1168
5949	Минимальное число объектов в листе:	2	1	1168
5950	Максиальная глубина дерева:	0	2	1168
5951	Число случайных атрибутов:	4	3	1168
5952	Алгоритм построения дерева решений:	CART	4	1168
5953	Число потоков	2	5	1168
4667	Число деревьев:	250	0	1169
4668	Минимальное число объектов в листе:	2	1	1169
4669	Максиальная глубина дерева:	0	2	1169
4670	Число случайных атрибутов:	4	3	1169
4671	Алгоритм построения дерева решений:	CART	4	1169
4672	Число потоков	2	5	1169
3787	Число деревьев:	250	0	1170
3788	Минимальное число объектов в листе:	2	1	1170
3789	Максиальная глубина дерева:	0	2	1170
3790	Число случайных атрибутов:	4	3	1170
3791	Алгоритм построения дерева решений:	CART	4	1170
3792	Число потоков	1	5	1170
4690	Число деревьев:	250	0	1171
4691	Минимальное число объектов в листе:	2	1	1171
4692	Максиальная глубина дерева:	0	2	1171
4693	Число случайных атрибутов:	4	3	1171
4694	Алгоритм построения дерева решений:	CART	4	1171
4695	Число потоков	4	5	1171
4617	Число итераций:	100	0	1172
4618	Минимальная допустимая ошибка классификатора:	0	1	1172
4619	Максимальная допустимая ошибка классификатора:	0,5	2	1172
4620	Метод голосования:	Метод большинства голосов	3	1172
4621	Формирование обучающих выборок:	Бутстрэп выборки	4	1172
4622	Выбор классификатора:	Оптимальный классификатор	5	1172
4623	Число потоков	1	6	1172
4624	Базовый классификатор 0:	C45	7	1172
4625	Базовый классификатор 1:	CART	8	1172
4626	Базовый классификатор 2:	Logistic	9	1172
6026	Число итераций:	100	0	1173
6027	Минимальная допустимая ошибка классификатора:	0	1	1173
6028	Максимальная допустимая ошибка классификатора:	0,5	2	1173
6029	Метод голосования:	Метод большинства голосов	3	1173
6030	Формирование обучающих выборок:	Бутстрэп выборки	4	1173
6031	Выбор классификатора:	Оптимальный классификатор	5	1173
6032	Число потоков	1	6	1173
6033	Базовый классификатор 0:	C45	7	1173
6034	Базовый классификатор 1:	CART	8	1173
6035	Базовый классификатор 2:	Logistic	9	1173
3442	Число деревьев:	100	0	1174
3443	Минимальное число объектов в листе:	2	1	1174
3444	Максиальная глубина дерева:	3	2	1174
3445	Число случайных атрибутов:	3	3	1174
3446	Алгоритм построения дерева решений:	C45	4	1174
3447	Число потоков	1	5	1174
3448	Число случайных расщеплений атрибута:	25	6	1174
3449	Формирование обучающих выборок:	Исходное обучающее множество	7	1174
5055	Число деревьев:	100	0	1175
5056	Минимальное число объектов в листе:	2	1	1175
5057	Максиальная глубина дерева:	0	2	1175
5058	Число случайных атрибутов:	3	3	1175
5059	Алгоритм построения дерева решений:	C45	4	1175
5060	Число потоков	1	5	1175
5061	Число случайных расщеплений атрибута:	25	6	1175
5062	Формирование обучающих выборок:	Бутстрэп-выборки	7	1175
6823	Максимальное число итераций:	200	0	1176
6824	Метод поиска минимума:	Квазиньютоновский метод	1	1176
3423	Количество нейронов во входном слое:	19	0	1177
3424	Количество нейронов в выходном слое:	4	1	1177
3425	Количество скрытых слоев:	1	2	1177
3426	Структура скрытого слоя:	22	3	1177
3427	Максимальное число итераций:	1000000	4	1177
3428	Допустимая ошибка:	0,00001	5	1177
3429	Активационная функция нейронов скрытого слоя:	Тригонометрический синус	6	1177
3430	Формула активационной функции нейронов скрытого слоя:	f(S)=sin(S)	7	1177
3431	Активационная функция нейронов выходного слоя:	Логистическая	8	1177
3432	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1177
3433	Алгоритм обучения:	BackPropagation	10	1177
3434	Коэффициент скорости обучения:	0,1	11	1177
3435	Коэффициент момента:	0,2	12	1177
4118	Количество нейронов во входном слое:	8	0	1178
4119	Количество нейронов в выходном слое:	2	1	1178
4120	Количество скрытых слоев:	1	2	1178
4121	Структура скрытого слоя:	14	3	1178
4122	Максимальное число итераций:	1000000	4	1178
4123	Допустимая ошибка:	0,00001	5	1178
4124	Активационная функция нейронов скрытого слоя:	Логистическая	6	1178
4125	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-1,68*S))	7	1178
4126	Активационная функция нейронов выходного слоя:	Логистическая	8	1178
4127	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1178
4128	Алгоритм обучения:	BackPropagation	10	1178
4129	Коэффициент скорости обучения:	0,1	11	1178
4130	Коэффициент момента:	0,2	12	1178
5663	Число ближайших соседей:	10	0	1179
5664	Вес ближайшего соседа:	1	1	1179
5665	Функция расстояния:	Евкилидово расстояние	2	1179
6712	Максимальное число итераций:	200	0	1180
6713	Метод поиска минимума:	Квазиньютоновский метод	1	1180
3606	Количество нейронов во входном слое:	9	0	1181
3607	Количество нейронов в выходном слое:	6	1	1181
3608	Количество скрытых слоев:	5	2	1181
3609	Структура скрытого слоя:	9,13,7,16,14	3	1181
3610	Максимальное число итераций:	1000000	4	1181
3611	Допустимая ошибка:	0,00001	5	1181
3612	Активационная функция нейронов скрытого слоя:	Гиперболический тангенс	6	1181
3613	Формула активационной функции нейронов скрытого слоя:	f(S)=(exp(1,453*S)-exp(-1,453*S))/(exp(1,453*S)+exp(-1,453*S))	7	1181
3614	Активационная функция нейронов выходного слоя:	Логистическая	8	1181
3615	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1181
3616	Алгоритм обучения:	BackPropagation	10	1181
3617	Коэффициент скорости обучения:	0,1	11	1181
3618	Коэффициент момента:	0,2	12	1181
3660	Минимальное число объектов в листе:	2	0	1182
3661	Максиальная глубина дерева:	0	1	1182
3662	Случайное дерево:	false	2	1182
3663	Бинарное дерево:	true	3	1182
3664	Использование случайных расщеплений атрибута:	false	4	1182
3706	Число ближайших соседей:	10	0	1183
3707	Вес ближайшего соседа:	0,78	1	1183
3708	Функция расстояния:	Квадрат Евклидова расстояния	2	1183
6850	Максимальное число итераций:	200	0	1184
6851	Метод поиска минимума:	Квазиньютоновский метод	1	1184
3746	Мета-классификатор:	C45	0	1185
3747	Метод формирования мета-признаков:	Использование обучающего множества	1	1185
3748	Базовый классификатор 0:	Logistic	2	1185
5274	Число деревьев:	100	0	1186
5275	Минимальное число объектов в листе:	2	1	1186
5276	Максиальная глубина дерева:	0	2	1186
5277	Число случайных атрибутов:	6	3	1186
5278	Алгоритм построения дерева решений:	C45	4	1186
5279	Число потоков	1	5	1186
5280	Число случайных расщеплений атрибута:	24	6	1186
5281	Формирование обучающих выборок:	Исходное обучающее множество	7	1186
5888	Минимальное число объектов в листе:	2	0	1187
5889	Максиальная глубина дерева:	0	1	1187
5890	Случайное дерево:	false	2	1187
5891	Бинарное дерево:	false	3	1187
5892	Использование случайных расщеплений атрибута:	false	4	1187
6206	Минимальное число объектов в листе:	2	0	1188
6207	Максиальная глубина дерева:	0	1	1188
6208	Случайное дерево:	false	2	1188
6209	Бинарное дерево:	true	3	1188
6210	Использование случайных расщеплений атрибута:	false	4	1188
5242	Минимальное число объектов в листе:	2	0	1189
5243	Максиальная глубина дерева:	0	1	1189
5244	Случайное дерево:	false	2	1189
5245	Бинарное дерево:	false	3	1189
5246	Использование случайных расщеплений атрибута:	false	4	1189
5247	Уровень значимости alpha:	0.05	5	1189
6199	Минимальное число объектов в листе:	2	0	1190
6200	Бинарное дерево:	false	1	1190
6201	Усеченное дерево:	false	2	1190
5819	Минимальное число объектов в листе:	2	0	1191
5820	Бинарное дерево:	true	1	1191
5821	Усеченное дерево:	false	2	1191
5291	Число деревьев:	25	0	1192
5292	Минимальное число объектов в листе:	2	1	1192
5293	Максиальная глубина дерева:	0	2	1192
5296	Число потоков	1	5	1192
5294	Число случайных атрибутов:	4	3	1192
5295	Алгоритм построения дерева решений:	CART	4	1192
5297	Число случайных расщеплений атрибута:	25	6	1192
5298	Формирование обучающих выборок:	Исходное обучающее множество	7	1192
5652	Максимальное число итераций:	200	0	1193
5653	Метод поиска минимума:	Квазиньютоновский метод	1	1193
4064	Число итераций:	10	0	1194
4065	Минимальная допустимая ошибка классификатора:	0	1	1194
4066	Максимальная допустимая ошибка классификатора:	0,5	2	1194
4067	Метод голосования:	Метод большинства голосов	3	1194
4068	Формирование обучающих выборок:	Использование исходной выборки	4	1194
4069	Выбор классификатора:	Случайный классификатор	5	1194
4070	Число потоков	1	6	1194
4071	Базовый классификатор 0:	Logistic	7	1194
6575	Число итераций:	10	0	1195
6576	Минимальная допустимая ошибка классификатора:	0	1	1195
6577	Максимальная допустимая ошибка классификатора:	0,5	2	1195
6578	Метод голосования:	Метод большинства голосов	3	1195
6579	Формирование обучающих выборок:	Использование исходной выборки	4	1195
6580	Выбор классификатора:	Случайный классификатор	5	1195
6581	Число потоков	1	6	1195
6582	Базовый классификатор 0:	Logistic	7	1195
4184	Максимальное число итераций:	200	0	1196
4185	Метод поиска минимума:	Квазиньютоновский метод	1	1196
4230	Количество нейронов во входном слое:	9	0	1197
4231	Количество нейронов в выходном слое:	6	1	1197
4232	Количество скрытых слоев:	1	2	1197
4233	Структура скрытого слоя:	9	3	1197
4234	Максимальное число итераций:	1000000	4	1197
4235	Допустимая ошибка:	0,00001	5	1197
4236	Активационная функция нейронов скрытого слоя:	Логистическая	6	1197
4237	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1197
4238	Активационная функция нейронов выходного слоя:	Логистическая	8	1197
4239	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1197
4240	Алгоритм обучения:	BackPropagation	10	1197
4241	Коэффициент скорости обучения:	0,1	11	1197
4242	Коэффициент момента:	0,2	12	1197
4635	Количество нейронов во входном слое:	9	0	1198
4636	Количество нейронов в выходном слое:	6	1	1198
4637	Количество скрытых слоев:	1	2	1198
4638	Структура скрытого слоя:	9	3	1198
4639	Максимальное число итераций:	1000000	4	1198
4640	Допустимая ошибка:	0,00001	5	1198
4641	Активационная функция нейронов скрытого слоя:	Логистическая	6	1198
4642	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1198
4643	Активационная функция нейронов выходного слоя:	Логистическая	8	1198
4644	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1198
4645	Алгоритм обучения:	BackPropagation	10	1198
4646	Коэффициент скорости обучения:	0,1	11	1198
4647	Коэффициент момента:	0,2	12	1198
4648	Начальное значение (Seed)	1	13	1198
5666	Число ближайших соседей:	10	0	1199
5667	Вес ближайшего соседа:	1	1	1199
5668	Функция расстояния:	Евкилидово расстояние	2	1199
4649	Минимальное число объектов в листе:	2	0	1200
4650	Максиальная глубина дерева:	0	1	1200
4651	Случайное дерево:	false	2	1200
4652	Бинарное дерево:	false	3	1200
4653	Использование случайных расщеплений атрибута:	false	4	1200
4654	Начальное значение (Seed)	1	5	1200
4547	Минимальное число объектов в листе:	2	0	1201
4548	Бинарное дерево:	false	1	1201
4549	Усеченное дерево:	true	2	1201
4550	Число блоков:	3	3	1201
6084	Минимальное число объектов в листе:	2	0	1202
6085	Максиальная глубина дерева:	0	1	1202
6086	Случайное дерево:	false	2	1202
6087	Бинарное дерево:	false	3	1202
6088	Использование случайных расщеплений атрибута:	false	4	1202
6089	Начальное значение (Seed)	1	5	1202
6634	Минимальное число объектов в листе:	2	0	1203
6635	Бинарное дерево:	false	1	1203
6636	Усеченное дерево:	true	2	1203
6637	Число блоков:	3	3	1203
6706	Минимальное число объектов в листе:	2	0	1204
6707	Максиальная глубина дерева:	0	1	1204
6708	Случайное дерево:	false	2	1204
6709	Бинарное дерево:	true	3	1204
6710	Использование случайных расщеплений атрибута:	false	4	1204
6711	Начальное значение (Seed)	1	5	1204
6246	Число деревьев:	25	0	1205
6247	Минимальное число объектов в листе:	2	1	1205
6248	Максиальная глубина дерева:	0	2	1205
6249	Число случайных атрибутов:	4	3	1205
6250	Алгоритм построения дерева решений:	CART	4	1205
6251	Число потоков	1	5	1205
6252	Начальное значение (Seed)	1	6	1205
6253	Число случайных расщеплений атрибута:	25	7	1205
6254	Формирование обучающих выборок:	Исходное обучающее множество	8	1205
3878	Число деревьев:	25	0	1206
3879	Минимальное число объектов в листе:	2	1	1206
3880	Максиальная глубина дерева:	0	2	1206
3881	Число случайных атрибутов:	4	3	1206
3882	Алгоритм построения дерева решений:	CART	4	1206
3883	Число потоков	4	5	1206
3884	Начальное значение (Seed)	1	6	1206
3653	Число деревьев:	50	0	1207
3654	Минимальное число объектов в листе:	2	1	1207
3655	Максиальная глубина дерева:	0	2	1207
3656	Число случайных атрибутов:	4	3	1207
3657	Алгоритм построения дерева решений:	CART	4	1207
3658	Число потоков	4	5	1207
3659	Начальное значение (Seed)	1	6	1207
6644	Число деревьев:	25	0	1208
6645	Минимальное число объектов в листе:	2	1	1208
6646	Максиальная глубина дерева:	0	2	1208
6647	Число случайных атрибутов:	4	3	1208
6648	Алгоритм построения дерева решений:	ID3	4	1208
6649	Число потоков	4	5	1208
6650	Начальное значение (Seed)	1	6	1208
5299	Число деревьев:	25	0	1209
5300	Минимальное число объектов в листе:	2	1	1209
5301	Максиальная глубина дерева:	0	2	1209
5302	Число случайных атрибутов:	4	3	1209
5303	Алгоритм построения дерева решений:	C45	4	1209
5304	Число потоков	4	5	1209
5305	Начальное значение (Seed)	1	6	1209
5306	Число случайных расщеплений атрибута:	20	7	1209
5307	Формирование обучающих выборок:	Бутстрэп-выборки	8	1209
4577	Число деревьев:	25	0	1210
4578	Минимальное число объектов в листе:	2	1	1210
4579	Максиальная глубина дерева:	0	2	1210
4580	Число случайных атрибутов:	4	3	1210
4581	Алгоритм построения дерева решений:	CHAID	4	1210
4582	Число потоков	4	5	1210
4583	Начальное значение (Seed)	1	6	1210
6109	Минимальное число объектов в листе:	2	0	1211
6110	Максиальная глубина дерева:	0	1	1211
6111	Случайное дерево:	false	2	1211
6112	Бинарное дерево:	true	3	1211
6113	Использование случайных расщеплений атрибута:	false	4	1211
6114	Начальное значение (Seed)	1	5	1211
4720	Минимальное число объектов в листе:	2	0	1212
4721	Максиальная глубина дерева:	0	1	1212
4722	Случайное дерево:	false	2	1212
4723	Бинарное дерево:	false	3	1212
4724	Использование случайных расщеплений атрибута:	false	4	1212
4725	Начальное значение (Seed)	1	5	1212
4726	Уровень значимости alpha:	0.05	6	1212
3413	Минимальное число объектов в листе:	2	0	1213
3414	Бинарное дерево:	false	1	1213
3415	Усеченное дерево:	false	2	1213
6103	Минимальное число объектов в листе:	2	0	1214
6104	Максиальная глубина дерева:	0	1	1214
6105	Случайное дерево:	false	2	1214
6106	Бинарное дерево:	true	3	1214
6107	Использование случайных расщеплений атрибута:	false	4	1214
6108	Начальное значение (Seed)	1	5	1214
3280	Минимальное число объектов в листе:	2	0	1215
3281	Максиальная глубина дерева:	0	1	1215
3282	Случайное дерево:	false	2	1215
3283	Бинарное дерево:	true	3	1215
3284	Использование случайных расщеплений атрибута:	false	4	1215
3285	Начальное значение (Seed)	1	5	1215
6654	Минимальное число объектов в листе:	2	0	1216
6655	Бинарное дерево:	true	1	1216
6656	Усеченное дерево:	true	2	1216
6657	Число блоков:	3	3	1216
4078	Количество нейронов во входном слое:	27	0	1217
4079	Количество нейронов в выходном слое:	4	1	1217
4080	Количество скрытых слоев:	1	2	1217
4081	Структура скрытого слоя:	37	3	1217
4082	Максимальное число итераций:	1000000	4	1217
4083	Допустимая ошибка:	0,00001	5	1217
4084	Активационная функция нейронов скрытого слоя:	Логистическая	6	1217
4085	Формула активационной функции нейронов скрытого слоя:	f(S)=1/(1+exp(-S))	7	1217
4086	Активационная функция нейронов выходного слоя:	Логистическая	8	1217
4087	Формула активационной функции нейронов выходного слоя:	f(S)=1/(1+exp(-S))	9	1217
4088	Алгоритм обучения:	BackPropagation	10	1217
4089	Коэффициент скорости обучения:	0,1	11	1217
4090	Коэффициент момента:	0,2	12	1217
4091	Начальное значение (Seed)	1	13	1217
6602	Минимальное число объектов в листе:	2	0	1218
6603	Максиальная глубина дерева:	0	1	1218
6604	Случайное дерево:	false	2	1218
6605	Бинарное дерево:	false	3	1218
6606	Использование случайных расщеплений атрибута:	false	4	1218
6607	Начальное значение (Seed)	1	5	1218
6841	Минимальное число объектов в листе:	2	0	1219
6842	Максиальная глубина дерева:	0	1	1219
6843	Случайное дерево:	false	2	1219
6844	Бинарное дерево:	true	3	1219
6845	Использование случайных расщеплений атрибута:	false	4	1219
6846	Начальное значение (Seed)	1	5	1219
3301	Минимальное число объектов в листе:	2	0	1220
3302	Бинарное дерево:	true	1	1220
3303	Усеченное дерево:	true	2	1220
3304	Число блоков:	3	3	1220
6498	Максимальное число итераций:	200	0	1221
6499	Метод поиска минимума:	Квазиньютоновский метод	1	1221
5408	Минимальное число объектов в листе:	2	0	1222
5409	Максиальная глубина дерева:	0	1	1222
5410	Случайное дерево:	false	2	1222
5411	Бинарное дерево:	false	3	1222
5412	Использование случайных расщеплений атрибута:	false	4	1222
5413	Начальное значение (Seed)	1	5	1222
5414	Уровень значимости alpha:	0.05	6	1222
5229	Минимальное число объектов в листе:	2	0	1223
5230	Максиальная глубина дерева:	0	1	1223
5231	Случайное дерево:	false	2	1223
5232	Бинарное дерево:	true	3	1223
5233	Использование случайных расщеплений атрибута:	false	4	1223
5234	Начальное значение (Seed)	1	5	1223
6411	Минимальное число объектов в листе:	2	0	1224
6412	Бинарное дерево:	true	1	1224
6413	Усеченное дерево:	false	2	1224
6439	Минимальное число объектов в листе:	2	0	1225
6440	Максиальная глубина дерева:	0	1	1225
6441	Случайное дерево:	false	2	1225
6442	Бинарное дерево:	true	3	1225
6443	Использование случайных расщеплений атрибута:	false	4	1225
6444	Начальное значение (Seed)	1	5	1225
5831	Минимальное число объектов в листе:	2	0	1226
5832	Максиальная глубина дерева:	0	1	1226
5833	Случайное дерево:	false	2	1226
5834	Бинарное дерево:	true	3	1226
5835	Использование случайных расщеплений атрибута:	false	4	1226
5836	Начальное значение (Seed)	1	5	1226
6050	Минимальное число объектов в листе:	2	0	1227
6051	Максиальная глубина дерева:	0	1	1227
6052	Случайное дерево:	false	2	1227
6053	Бинарное дерево:	false	3	1227
6054	Использование случайных расщеплений атрибута:	false	4	1227
6055	Начальное значение (Seed)	1	5	1227
6056	Уровень значимости alpha:	0.05	6	1227
6878	Число итераций:	50	0	1228
6879	Минимальная допустимая ошибка классификатора:	0	1	1228
6880	Максимальная допустимая ошибка классификатора:	0,5	2	1228
6881	Начальное значение (Seed)	1	3	1228
6882	Базовый классификатор 0:	KNearestNeighbours	4	1228
6886	Число итераций:	30	0	1229
6887	Минимальная допустимая ошибка классификатора:	0	1	1229
6888	Максимальная допустимая ошибка классификатора:	0,5	2	1229
6889	Начальное значение (Seed)	1	3	1229
6890	Базовый классификатор 0:	KNearestNeighbours	4	1229
6894	Максимальное число итераций:	200	0	1230
6895	Метод поиска минимума:	Квазиньютоновский метод	1	1230
6899	Число итераций:	25	0	1231
6900	Минимальная допустимая ошибка классификатора:	0	1	1231
6901	Максимальная допустимая ошибка классификатора:	0,5	2	1231
6902	Начальное значение (Seed)	1	3	1231
6903	Базовый классификатор 0:	KNearestNeighbours	4	1231
6907	Число итераций:	28	0	1232
6908	Минимальная допустимая ошибка классификатора:	0	1	1232
6909	Максимальная допустимая ошибка классификатора:	0,5	2	1232
6910	Начальное значение (Seed)	1	3	1232
6911	Базовый классификатор 0:	KNearestNeighbours	4	1232
6915	Число деревьев:	10	0	1233
6916	Минимальное число объектов в листе:	2	1	1233
6917	Максиальная глубина дерева:	0	2	1233
6918	Число случайных атрибутов:	4	3	1233
6919	Алгоритм построения дерева решений:	CART	4	1233
6921	Начальное значение (Seed)	1	6	1233
6925	Число деревьев:	10	0	1234
6926	Минимальное число объектов в листе:	2	1	1234
6927	Максиальная глубина дерева:	0	2	1234
6928	Число случайных атрибутов:	4	3	1234
6929	Алгоритм построения дерева решений:	CART	4	1234
6930	Число потоков	1	5	1234
6931	Начальное значение (Seed)	1	6	1234
6932	Число случайных расщеплений атрибута:	15	7	1234
6933	Формирование обучающих выборок:	Исходное обучающее множество	8	1234
6937	Число деревьев:	25	0	1235
6938	Минимальное число объектов в листе:	2	1	1235
6939	Максиальная глубина дерева:	0	2	1235
6940	Число случайных атрибутов:	6	3	1235
6941	Алгоритм построения дерева решений:	CART	4	1235
6942	Число потоков	4	5	1235
6943	Начальное значение (Seed)	1	6	1235
6944	Число случайных расщеплений атрибута:	13	7	1235
6945	Формирование обучающих выборок:	Исходное обучающее множество	8	1235
6949	Число деревьев:	50	0	1236
6950	Минимальное число объектов в листе:	2	1	1236
6951	Максиальная глубина дерева:	0	2	1236
6952	Число случайных атрибутов:	6	3	1236
6953	Алгоритм построения дерева решений:	CART	4	1236
6955	Начальное значение (Seed)	1	6	1236
6956	Число случайных расщеплений атрибута:	13	7	1236
6957	Формирование обучающих выборок:	Исходное обучающее множество	8	1236
6961	Число итераций:	25	0	1237
6962	Минимальная допустимая ошибка классификатора:	0	1	1237
6963	Максимальная допустимая ошибка классификатора:	0,5	2	1237
6964	Начальное значение (Seed)	1	3	1237
6965	Базовый классификатор 0:	KNearestNeighbours	4	1237
6972	Число итераций:	25	0	1238
6973	Минимальная допустимая ошибка классификатора:	0	1	1238
6974	Максимальная допустимая ошибка классификатора:	0,5	2	1238
6975	Начальное значение (Seed)	1	3	1238
6976	Базовый классификатор 0:	KNearestNeighbours	4	1238
6979	Число деревьев:	50	0	1239
6980	Минимальное число объектов в листе:	2	1	1239
6981	Максиальная глубина дерева:	0	2	1239
6982	Число случайных атрибутов:	6	3	1239
6983	Алгоритм построения дерева решений:	C45	4	1239
6984	Число потоков	4	5	1239
6985	Начальное значение (Seed)	1	6	1239
6986	Число случайных расщеплений атрибута:	13	7	1239
6987	Формирование обучающих выборок:	Бутстрэп-выборки	8	1239
6991	Число деревьев:	40	0	1240
6992	Минимальное число объектов в листе:	2	1	1240
6993	Максиальная глубина дерева:	0	2	1240
6994	Число случайных атрибутов:	6	3	1240
6995	Алгоритм построения дерева решений:	C45	4	1240
6996	Число потоков	4	5	1240
6997	Начальное значение (Seed)	1	6	1240
6998	Число случайных расщеплений атрибута:	13	7	1240
6999	Формирование обучающих выборок:	Бутстрэп-выборки	8	1240
7003	Число деревьев:	60	0	1241
7004	Минимальное число объектов в листе:	2	1	1241
7005	Максиальная глубина дерева:	0	2	1241
7006	Число случайных атрибутов:	6	3	1241
7007	Алгоритм построения дерева решений:	C45	4	1241
7008	Число потоков	4	5	1241
7009	Начальное значение (Seed)	1	6	1241
7010	Число случайных расщеплений атрибута:	13	7	1241
7011	Формирование обучающих выборок:	Бутстрэп-выборки	8	1241
7015	Число деревьев:	45	0	1242
7016	Минимальное число объектов в листе:	2	1	1242
7017	Максиальная глубина дерева:	0	2	1242
7018	Число случайных атрибутов:	6	3	1242
7019	Алгоритм построения дерева решений:	CART	4	1242
7020	Число потоков	4	5	1242
7021	Начальное значение (Seed)	1	6	1242
7022	Число случайных расщеплений атрибута:	13	7	1242
7023	Формирование обучающих выборок:	Бутстрэп-выборки	8	1242
7027	Число деревьев:	45	0	1243
7028	Минимальное число объектов в листе:	2	1	1243
7029	Максиальная глубина дерева:	0	2	1243
7030	Число случайных атрибутов:	6	3	1243
7031	Алгоритм построения дерева решений:	C45	4	1243
7032	Число потоков	4	5	1243
7033	Начальное значение (Seed)	1	6	1243
7034	Число случайных расщеплений атрибута:	13	7	1243
7035	Формирование обучающих выборок:	Бутстрэп-выборки	8	1243
7039	Число деревьев:	40	0	1244
7040	Минимальное число объектов в листе:	2	1	1244
7041	Максиальная глубина дерева:	0	2	1244
7042	Число случайных атрибутов:	6	3	1244
7043	Алгоритм построения дерева решений:	C45	4	1244
7044	Число потоков	4	5	1244
7045	Начальное значение (Seed)	1	6	1244
7046	Число случайных расщеплений атрибута:	13	7	1244
7047	Формирование обучающих выборок:	Бутстрэп-выборки	8	1244
7051	Число деревьев:	55	0	1245
7052	Минимальное число объектов в листе:	2	1	1245
7053	Максиальная глубина дерева:	0	2	1245
7054	Число случайных атрибутов:	6	3	1245
7055	Алгоритм построения дерева решений:	C45	4	1245
7056	Число потоков	4	5	1245
7057	Начальное значение (Seed)	1	6	1245
7058	Число случайных расщеплений атрибута:	13	7	1245
7059	Формирование обучающих выборок:	Бутстрэп-выборки	8	1245
7063	Число деревьев:	52	0	1246
7064	Минимальное число объектов в листе:	2	1	1246
7065	Максиальная глубина дерева:	0	2	1246
7066	Число случайных атрибутов:	6	3	1246
7067	Алгоритм построения дерева решений:	C45	4	1246
7068	Число потоков	4	5	1246
7069	Начальное значение (Seed)	1	6	1246
7070	Число случайных расщеплений атрибута:	13	7	1246
7071	Формирование обучающих выборок:	Бутстрэп-выборки	8	1246
7075	Число деревьев:	50	0	1247
7076	Минимальное число объектов в листе:	2	1	1247
7077	Максиальная глубина дерева:	0	2	1247
7078	Число случайных атрибутов:	6	3	1247
7079	Алгоритм построения дерева решений:	C45	4	1247
7080	Число потоков	4	5	1247
7081	Начальное значение (Seed)	1	6	1247
7082	Число случайных расщеплений атрибута:	14	7	1247
7083	Формирование обучающих выборок:	Бутстрэп-выборки	8	1247
7087	Число деревьев:	48	0	1248
7088	Минимальное число объектов в листе:	2	1	1248
7089	Максиальная глубина дерева:	0	2	1248
7090	Число случайных атрибутов:	6	3	1248
7091	Алгоритм построения дерева решений:	C45	4	1248
7092	Число потоков	4	5	1248
7093	Начальное значение (Seed)	1	6	1248
7094	Число случайных расщеплений атрибута:	13	7	1248
7095	Формирование обучающих выборок:	Исходное обучающее множество	8	1248
7099	Число деревьев:	51	0	1249
7100	Минимальное число объектов в листе:	2	1	1249
7101	Максиальная глубина дерева:	0	2	1249
7102	Число случайных атрибутов:	6	3	1249
7103	Алгоритм построения дерева решений:	C45	4	1249
7104	Число потоков	4	5	1249
7105	Начальное значение (Seed)	1	6	1249
7106	Число случайных расщеплений атрибута:	13	7	1249
7107	Формирование обучающих выборок:	Бутстрэп-выборки	8	1249
7111	Число деревьев:	50	0	1250
7112	Минимальное число объектов в листе:	2	1	1250
7113	Максиальная глубина дерева:	0	2	1250
7114	Число случайных атрибутов:	6	3	1250
7115	Алгоритм построения дерева решений:	C45	4	1250
7116	Число потоков	4	5	1250
7117	Начальное значение (Seed)	1	6	1250
7118	Число случайных расщеплений атрибута:	13	7	1250
7119	Формирование обучающих выборок:	Бутстрэп-выборки	8	1250
7126	Число деревьев:	40	0	1251
7127	Минимальное число объектов в листе:	2	1	1251
7128	Максиальная глубина дерева:	0	2	1251
7129	Число случайных атрибутов:	6	3	1251
7130	Алгоритм построения дерева решений:	C45	4	1251
7131	Число потоков	4	5	1251
7132	Начальное значение (Seed)	1	6	1251
7133	Число случайных расщеплений атрибута:	13	7	1251
7134	Формирование обучающих выборок:	Бутстрэп-выборки	8	1251
7137	Число итераций:	25	0	1252
7138	Минимальная допустимая ошибка классификатора:	0	1	1252
7139	Максимальная допустимая ошибка классификатора:	0,5	2	1252
7140	Начальное значение (Seed)	1	3	1252
7141	Базовый классификатор 0:	J48	4	1252
7145	Число итераций:	50	0	1253
7146	Минимальная допустимая ошибка классификатора:	0	1	1253
7147	Максимальная допустимая ошибка классификатора:	0,5	2	1253
7148	Начальное значение (Seed)	1	3	1253
7149	Базовый классификатор 0:	J48	4	1253
7153	Число итераций:	50	0	1254
7154	Минимальная допустимая ошибка классификатора:	0	1	1254
7155	Максимальная допустимая ошибка классификатора:	0,5	2	1254
7156	Начальное значение (Seed)	1	3	1254
7157	Базовый классификатор 0:	J48	4	1254
7161	Число итераций:	65	0	1255
7162	Минимальная допустимая ошибка классификатора:	0	1	1255
7163	Максимальная допустимая ошибка классификатора:	0,5	2	1255
7164	Начальное значение (Seed)	1	3	1255
7165	Базовый классификатор 0:	J48	4	1255
7169	Число итераций:	60	0	1256
7170	Минимальная допустимая ошибка классификатора:	0	1	1256
7171	Максимальная допустимая ошибка классификатора:	0,5	2	1256
7172	Начальное значение (Seed)	1	3	1256
7173	Базовый классификатор 0:	J48	4	1256
7177	Число итераций:	70	0	1257
7178	Минимальная допустимая ошибка классификатора:	0	1	1257
7179	Максимальная допустимая ошибка классификатора:	0,5	2	1257
7180	Начальное значение (Seed)	1	3	1257
7181	Базовый классификатор 0:	J48	4	1257
7185	Число итераций:	75	0	1258
7186	Минимальная допустимая ошибка классификатора:	0	1	1258
7187	Максимальная допустимая ошибка классификатора:	0,5	2	1258
7188	Начальное значение (Seed)	1	3	1258
7189	Базовый классификатор 0:	J48	4	1258
7193	Число итераций:	100	0	1259
7194	Минимальная допустимая ошибка классификатора:	0	1	1259
7195	Максимальная допустимая ошибка классификатора:	0,5	2	1259
7196	Начальное значение (Seed)	1	3	1259
7197	Базовый классификатор 0:	J48	4	1259
7201	Число итераций:	80	0	1260
7202	Минимальная допустимая ошибка классификатора:	0	1	1260
7203	Максимальная допустимая ошибка классификатора:	0,5	2	1260
7204	Начальное значение (Seed)	1	3	1260
7205	Базовый классификатор 0:	J48	4	1260
7209	Число итераций:	75	0	1261
7210	Минимальная допустимая ошибка классификатора:	0	1	1261
7211	Максимальная допустимая ошибка классификатора:	0,5	2	1261
7212	Начальное значение (Seed)	1	3	1261
7213	Базовый классификатор 0:	J48	4	1261
7217	Число итераций:	76	0	1262
7218	Минимальная допустимая ошибка классификатора:	0	1	1262
7219	Максимальная допустимая ошибка классификатора:	0,5	2	1262
7220	Начальное значение (Seed)	1	3	1262
7221	Базовый классификатор 0:	J48	4	1262
7225	Число итераций:	77	0	1263
7226	Минимальная допустимая ошибка классификатора:	0	1	1263
7227	Максимальная допустимая ошибка классификатора:	0,5	2	1263
7228	Начальное значение (Seed)	1	3	1263
7229	Базовый классификатор 0:	J48	4	1263
7233	Число итераций:	76	0	1264
7234	Минимальная допустимая ошибка классификатора:	0	1	1264
7235	Максимальная допустимая ошибка классификатора:	0,5	2	1264
7236	Начальное значение (Seed)	1	3	1264
7237	Базовый классификатор 0:	J48	4	1264
7241	Число итераций:	76	0	1265
7242	Минимальная допустимая ошибка классификатора:	0	1	1265
7243	Максимальная допустимая ошибка классификатора:	0,5	2	1265
7244	Начальное значение (Seed)	1	3	1265
7245	Базовый классификатор 0:	J48	4	1265
7249	Число итераций:	76	0	1266
7250	Минимальная допустимая ошибка классификатора:	0	1	1266
7251	Максимальная допустимая ошибка классификатора:	0,5	2	1266
7252	Начальное значение (Seed)	1	3	1266
7253	Базовый классификатор 0:	J48	4	1266
7260	Число итераций:	76	0	1267
7261	Минимальная допустимая ошибка классификатора:	0	1	1267
7262	Максимальная допустимая ошибка классификатора:	0,5	2	1267
7263	Начальное значение (Seed)	1	3	1267
7264	Базовый классификатор 0:	J48	4	1267
7267	Число итераций:	78	0	1268
7268	Минимальная допустимая ошибка классификатора:	0	1	1268
7269	Максимальная допустимая ошибка классификатора:	0,5	2	1268
7270	Начальное значение (Seed)	1	3	1268
7271	Базовый классификатор 0:	J48	4	1268
7275	Число итераций:	78	0	1269
7276	Минимальная допустимая ошибка классификатора:	0	1	1269
7277	Максимальная допустимая ошибка классификатора:	0,5	2	1269
7278	Начальное значение (Seed)	1	3	1269
7279	Базовый классификатор 0:	J48	4	1269
7283	Число итераций:	74	0	1270
7284	Минимальная допустимая ошибка классификатора:	0	1	1270
7285	Максимальная допустимая ошибка классификатора:	0,5	2	1270
7286	Начальное значение (Seed)	1	3	1270
7287	Базовый классификатор 0:	J48	4	1270
7291	Число итераций:	68	0	1271
7292	Минимальная допустимая ошибка классификатора:	0	1	1271
7293	Максимальная допустимая ошибка классификатора:	0,5	2	1271
7294	Начальное значение (Seed)	1	3	1271
7295	Базовый классификатор 0:	J48	4	1271
7302	Число итераций:	25	0	1272
7303	Минимальная допустимая ошибка классификатора:	0	1	1272
7304	Максимальная допустимая ошибка классификатора:	0,5	2	1272
7305	Начальное значение (Seed)	1	3	1272
7306	Базовый классификатор 0:	KNearestNeighbours	4	1272
11429	Вес ближайшего соседа:	0,8399	1	11427
11430	Функция расстояния:	Евкилидово расстояние	2	11427
11433	Число ближайших соседей:	124	0	11432
11434	Вес ближайшего соседа:	0,8342	1	11432
11435	Функция расстояния:	Манхеттенское расстояние	2	11432
11438	Минимальное число объектов в листе:	2	0	11437
11439	Максиальная глубина дерева:	4	1	11437
11440	Случайное дерево:	false	2	11437
11441	Бинарное дерево:	true	3	11437
11442	Использование случайных расщеплений атрибута:	false	4	11437
11443	Начальное значение (Seed)	1	5	11437
11446	Минимальное число объектов в листе:	3	0	11445
11447	Максиальная глубина дерева:	4	1	11445
11448	Случайное дерево:	false	2	11445
11449	Бинарное дерево:	false	3	11445
11450	Использование случайных расщеплений атрибута:	false	4	11445
11451	Начальное значение (Seed)	1	5	11445
11454	Минимальное число объектов в листе:	4	0	11453
11455	Максиальная глубина дерева:	4	1	11453
11456	Случайное дерево:	false	2	11453
11457	Бинарное дерево:	false	3	11453
11458	Использование случайных расщеплений атрибута:	false	4	11453
11459	Начальное значение (Seed)	1	5	11453
11462	Минимальное число объектов в листе:	2	0	11461
11463	Максиальная глубина дерева:	8	1	11461
11464	Случайное дерево:	false	2	11461
11465	Бинарное дерево:	true	3	11461
11466	Использование случайных расщеплений атрибута:	false	4	11461
11467	Начальное значение (Seed)	1	5	11461
11470	Минимальное число объектов в листе:	10	0	11469
11471	Максиальная глубина дерева:	7	1	11469
11472	Случайное дерево:	false	2	11469
11473	Бинарное дерево:	true	3	11469
11474	Использование случайных расщеплений атрибута:	false	4	11469
11475	Начальное значение (Seed)	1	5	11469
11485	Функция расстояния:	Манхеттенское расстояние	2	11482
11488	Число ближайших соседей:	95	0	11487
11489	Вес ближайшего соседа:	0,6113	1	11487
11490	Функция расстояния:	Манхеттенское расстояние	2	11487
11493	Число ближайших соседей:	263	0	11492
11494	Вес ближайшего соседа:	0,6193	1	11492
11495	Функция расстояния:	Манхеттенское расстояние	2	11492
11498	Число ближайших соседей:	275	0	11497
11499	Вес ближайшего соседа:	0,6231	1	11497
11500	Функция расстояния:	Манхеттенское расстояние	2	11497
11503	Число ближайших соседей:	914	0	11502
11504	Вес ближайшего соседа:	0,9073	1	11502
11505	Функция расстояния:	Евкилидово расстояние	2	11502
11508	Число ближайших соседей:	990	0	11507
11509	Вес ближайшего соседа:	0,9064	1	11507
11510	Функция расстояния:	Евкилидово расстояние	2	11507
11513	Число ближайших соседей:	341	0	11512
11514	Вес ближайшего соседа:	0,9023	1	11512
11515	Функция расстояния:	Евкилидово расстояние	2	11512
11518	Число ближайших соседей:	493	0	11517
11519	Вес ближайшего соседа:	0,9002	1	11517
11520	Функция расстояния:	Манхеттенское расстояние	2	11517
11523	Число ближайших соседей:	715	0	11522
11524	Вес ближайшего соседа:	0,9006	1	11522
11525	Функция расстояния:	Евкилидово расстояние	2	11522
11528	Число деревьев:	39	0	11527
11529	Минимальное число объектов в листе:	2	1	11527
11530	Максиальная глубина дерева:	0	2	11527
11531	Число случайных атрибутов:	4	3	11527
11532	Алгоритм построения дерева решений:	ID3	4	11527
11533	Число потоков	1	5	11527
11534	Начальное значение (Seed)	1	6	11527
11537	Число деревьев:	29	0	11536
11538	Минимальное число объектов в листе:	2	1	11536
11539	Максиальная глубина дерева:	0	2	11536
11540	Число случайных атрибутов:	2	3	11536
11541	Алгоритм построения дерева решений:	ID3	4	11536
11542	Число потоков	1	5	11536
11543	Начальное значение (Seed)	1	6	11536
11544	Число случайных расщеплений атрибута:	44	7	11536
11545	Формирование обучающих выборок:	Исходное обучающее множество	8	11536
11548	Число деревьев:	45	0	11547
11549	Минимальное число объектов в листе:	2	1	11547
11550	Максиальная глубина дерева:	0	2	11547
11551	Число случайных атрибутов:	5	3	11547
11552	Алгоритм построения дерева решений:	C45	4	11547
11553	Число потоков	1	5	11547
11554	Начальное значение (Seed)	1	6	11547
11555	Число случайных расщеплений атрибута:	10	7	11547
11556	Формирование обучающих выборок:	Исходное обучающее множество	8	11547
11559	Число деревьев:	33	0	11558
11560	Минимальное число объектов в листе:	4	1	11558
11561	Максиальная глубина дерева:	0	2	11558
11562	Число случайных атрибутов:	7	3	11558
11563	Алгоритм построения дерева решений:	CART	4	11558
11564	Число потоков	1	5	11558
11565	Начальное значение (Seed)	1	6	11558
11568	Число деревьев:	30	0	11567
11569	Минимальное число объектов в листе:	3	1	11567
11570	Максиальная глубина дерева:	0	2	11567
11571	Число случайных атрибутов:	9	3	11567
11572	Алгоритм построения дерева решений:	CART	4	11567
11573	Число потоков	1	5	11567
11574	Начальное значение (Seed)	1	6	11567
\.


--
-- TOC entry 2498 (class 0 OID 16429)
-- Dependencies: 192
-- Data for Name: classifier_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classifier_options (id, options_name, creation_date, config, config_md5_hash, configuration_id, created_by) FROM stdin;
11624	J48Options	2021-02-16 19:47:39.985446	{"type":"j48","minNumObj":4,"binarySplits":false,"unpruned":true,"numFolds":null}	6bfb8eb0b1ba195887cf81c3b4bcacaf	11622	admin
11629	J48Options	2021-02-16 19:47:42.614751	{"type":"j48","minNumObj":3,"binarySplits":false,"unpruned":true,"numFolds":null}	5d01525347fec7158838acf107a73c84	11622	admin
11633	J48Options	2021-02-16 19:47:42.64954	{"type":"j48","minNumObj":2,"binarySplits":false,"unpruned":false,"numFolds":null}	e0967b1658ef276d90381f5532d4f76a	11622	admin
11638	DecisionTreeOptions	2021-02-16 19:47:42.702855	{"type":"decision_tree","decisionTreeType":"CHAID","minObj":2,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":null,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	1110e540d68fb6588e0f8abae6fbff70	11622	admin
11643	DecisionTreeOptions	2021-02-16 19:47:42.751269	{"type":"decision_tree","decisionTreeType":"ID3","minObj":3,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":true,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	5ef8b06d8274804cc6c194bafd516754	11622	admin
11647	DecisionTreeOptions	2021-02-16 19:47:42.794598	{"type":"decision_tree","decisionTreeType":"C45","minObj":4,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":null,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	5b385f63740dd7ccc1faa1223a2a6aff	11622	admin
11655	DecisionTreeOptions	2021-02-16 19:47:42.842798	{"type":"decision_tree","decisionTreeType":"CART","minObj":4,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":null,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	e7103be98eaf4e43e2435e59467cf128	11622	admin
11654	DecisionTreeOptions	2021-02-16 19:47:42.84236	{"type":"decision_tree","decisionTreeType":"C45","minObj":2,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":null,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	0622acc04ffaaf8e3797a13f50836b71	11622	admin
11623	J48Options	2021-02-16 19:47:39.985716	{"type":"j48","minNumObj":4,"binarySplits":true,"unpruned":false,"numFolds":null}	15547695e8d0b2c036d4f03092ef5ca0	11622	admin
11636	DecisionTreeOptions	2021-02-16 19:47:42.696791	{"type":"decision_tree","decisionTreeType":"CHAID","minObj":4,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":null,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	38a57822f65f6c6aad9b3f4cc8666e77	11622	admin
11642	DecisionTreeOptions	2021-02-16 19:47:42.749536	{"type":"decision_tree","decisionTreeType":"ID3","minObj":3,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":null,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	a2f6e1625c5d06379aa83138efd3886d	11622	admin
11625	J48Options	2021-02-16 19:47:39.985692	{"type":"j48","minNumObj":2,"binarySplits":true,"unpruned":true,"numFolds":null}	093bc673f75cb7270c1cc8ea862efc87	11622	admin
11630	J48Options	2021-02-16 19:47:42.614751	{"type":"j48","minNumObj":4,"binarySplits":false,"unpruned":false,"numFolds":null}	fb312fdca3183d9020f26d6b7a288b74	11622	admin
11635	DecisionTreeOptions	2021-02-16 19:47:42.664077	{"type":"decision_tree","decisionTreeType":"CHAID","minObj":3,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":true,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	01327a618cb534c3bfdca9d78142de74	11622	admin
11646	DecisionTreeOptions	2021-02-16 19:47:42.770699	{"type":"decision_tree","decisionTreeType":"ID3","minObj":4,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":null,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	b61f5858f8528028c1afbd8902b5eec5	11622	admin
11648	DecisionTreeOptions	2021-02-16 19:47:42.797391	{"type":"decision_tree","decisionTreeType":"C45","minObj":2,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":true,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	1ac8dcaf8e2afa0639757e9bec19c188	11622	admin
11653	DecisionTreeOptions	2021-02-16 19:47:42.840218	{"type":"decision_tree","decisionTreeType":"CART","minObj":3,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":null,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	679533c2a977cb59892943ff204442e9	11622	admin
11626	J48Options	2021-02-16 19:47:39.956357	{"type":"j48","minNumObj":4,"binarySplits":true,"unpruned":true,"numFolds":null}	57ca378186b35fd4713c26c10a01ea9b	11622	admin
11631	J48Options	2021-02-16 19:47:42.623929	{"type":"j48","minNumObj":2,"binarySplits":false,"unpruned":true,"numFolds":null}	10749055d712db4074c8657a67a22968	11622	admin
11640	DecisionTreeOptions	2021-02-16 19:47:42.711013	{"type":"decision_tree","decisionTreeType":"CHAID","minObj":4,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":true,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	0a0bae19b972f9abe54cbd4adc3b9442	11622	admin
11644	DecisionTreeOptions	2021-02-16 19:47:42.754712	{"type":"decision_tree","decisionTreeType":"ID3","minObj":2,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":true,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	54c900d2ab19a198cecaf3815191c4ee	11622	admin
11650	DecisionTreeOptions	2021-02-16 19:47:42.801269	{"type":"decision_tree","decisionTreeType":"C45","minObj":4,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":true,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	505c43e8700947fe55620bb6c8adc715	11622	admin
11652	DecisionTreeOptions	2021-02-16 19:47:42.836584	{"type":"decision_tree","decisionTreeType":"CART","minObj":2,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":null,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	e8e9a4c578954382a46c7c9fe2f5b03b	11622	admin
11627	J48Options	2021-02-16 19:47:39.956562	{"type":"j48","minNumObj":3,"binarySplits":true,"unpruned":false,"numFolds":null}	ac621fcbba5068fc76eb4cb3220ca226	11622	admin
11634	J48Options	2021-02-16 19:47:42.648224	{"type":"j48","minNumObj":3,"binarySplits":false,"unpruned":false,"numFolds":null}	05552dbc5b27df3c521d06525483d602	11622	admin
11639	DecisionTreeOptions	2021-02-16 19:47:42.705957	{"type":"decision_tree","decisionTreeType":"CHAID","minObj":3,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":null,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	5eca05afc334a3a0abee121e92dd3021	11622	admin
11649	DecisionTreeOptions	2021-02-16 19:47:42.79955	{"type":"decision_tree","decisionTreeType":"C45","minObj":3,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":true,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	2768c08416711a2a697d8f995eb8bd20	11622	admin
11628	J48Options	2021-02-16 19:47:39.956562	{"type":"j48","minNumObj":3,"binarySplits":true,"unpruned":true,"numFolds":null}	ddb3301dcfb8f026d4d365bb4d47556d	11622	admin
11632	J48Options	2021-02-16 19:47:42.638606	{"type":"j48","minNumObj":2,"binarySplits":true,"unpruned":false,"numFolds":null}	94206ddfd2bfe5db086e6282b996debc	11622	admin
11599	J48Options	2021-02-16 19:37:21.285866	{"type":"j48","minNumObj":null,"binarySplits":false,"unpruned":true,"numFolds":null}	cfeb8ee002d6447f9bdd84bef854ef19	11598	\N
11600	J48Options	2021-02-16 19:37:21.287689	{"type":"j48","minNumObj":null,"binarySplits":false,"unpruned":false,"numFolds":null}	287bfb2acf4072ec5352fac626928c28	11598	\N
11603	NeuralNetworkOptions	2021-02-16 19:37:21.297006	{"type":"neural_network","numInNeurons":null,"numOutNeurons":null,"hiddenLayer":null,"seed":null,"numIterations":null,"minError":null,"activationFunctionOptions":{"activationFunctionType":"INVERSE_SQUARE_ROOT_UNIT","coefficient":null},"backPropagationOptions":null}	68da380837e983027038eaa41cc765f2	11598	\N
11604	LogisticOptions	2021-02-16 19:37:21.321248	{"type":"logistic","maxIts":null,"useConjugateGradientDescent":null}	96ddecfada3790f51fb2ec63e55a1b41	11598	\N
11605	NeuralNetworkOptions	2021-02-16 19:37:21.280872	{"type":"neural_network","numInNeurons":null,"numOutNeurons":null,"hiddenLayer":null,"seed":null,"numIterations":null,"minError":null,"activationFunctionOptions":{"activationFunctionType":"EXPONENTIAL","coefficient":null},"backPropagationOptions":null}	3d706034575b8ac9e6e11e5c05104aa6	11598	\N
11608	KNearestNeighboursOptions	2021-02-16 19:37:21.304503	{"type":"knn","numNeighbours":null,"weight":null,"distanceType":"SQUARE_EUCLID"}	70b9637947a5bcf78b74416f04eb7d09	11598	\N
11609	J48Options	2021-02-16 19:37:21.288148	{"type":"j48","minNumObj":null,"binarySplits":true,"unpruned":false,"numFolds":null}	6b2d3a94d869dc98d00c9d66afb0e3e6	11598	\N
11611	KNearestNeighboursOptions	2021-02-16 19:37:21.313892	{"type":"knn","numNeighbours":null,"weight":null,"distanceType":"EUCLID"}	2999286f3346f7bb55005cb3869a4d44	11598	\N
11612	NeuralNetworkOptions	2021-02-16 19:37:21.298532	{"type":"neural_network","numInNeurons":null,"numOutNeurons":null,"hiddenLayer":null,"seed":null,"numIterations":null,"minError":null,"activationFunctionOptions":{"activationFunctionType":"HYPERBOLIC_TANGENT","coefficient":null},"backPropagationOptions":null}	481ad8add5e02c54bd2b1f0fcd5881a5	11598	\N
11613	NeuralNetworkOptions	2021-02-16 19:37:21.278562	{"type":"neural_network","numInNeurons":null,"numOutNeurons":null,"hiddenLayer":null,"seed":null,"numIterations":null,"minError":null,"activationFunctionOptions":{"activationFunctionType":"SOFT_SIGN","coefficient":null},"backPropagationOptions":null}	258dc12cf3c7acc92c5a22b608de265d	11598	\N
11614	KNearestNeighboursOptions	2021-02-16 19:37:21.31438	{"type":"knn","numNeighbours":null,"weight":null,"distanceType":"MANHATTAN"}	8c43b9f2a9a3a46a44d6f1d5fb4f45a7	11598	\N
11616	J48Options	2021-02-16 19:37:21.297569	{"type":"j48","minNumObj":null,"binarySplits":true,"unpruned":true,"numFolds":null}	d0ba21c4e308a3da8b3d803f0a028226	11598	\N
11617	NeuralNetworkOptions	2021-02-16 19:37:21.317138	{"type":"neural_network","numInNeurons":null,"numOutNeurons":null,"hiddenLayer":null,"seed":null,"numIterations":null,"minError":null,"activationFunctionOptions":{"activationFunctionType":"SINUSOID","coefficient":null},"backPropagationOptions":null}	3b0e8497c6aaeaec58d00ad3f8f33bda	11598	\N
11618	KNearestNeighboursOptions	2021-02-16 19:37:21.296407	{"type":"knn","numNeighbours":null,"weight":null,"distanceType":"CHEBYSHEV"}	d072b582d80e4c90504bc301e6f1273f	11598	\N
11620	NeuralNetworkOptions	2021-02-16 19:37:21.290705	{"type":"neural_network","numInNeurons":null,"numOutNeurons":null,"hiddenLayer":null,"seed":null,"numIterations":null,"minError":null,"activationFunctionOptions":{"activationFunctionType":"LOGISTIC","coefficient":null},"backPropagationOptions":null}	ecfaf9ec59ce2b852a0fb0e2ed5c2532	11598	\N
11637	DecisionTreeOptions	2021-02-16 19:47:42.702388	{"type":"decision_tree","decisionTreeType":"CHAID","minObj":2,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":true,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	acd2e4dba1267a4e3d78b2bba682e9f9	11622	admin
11641	DecisionTreeOptions	2021-02-16 19:47:42.721878	{"type":"decision_tree","decisionTreeType":"ID3","minObj":4,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":true,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	bcc7ecfb86eae2bb804131debf80855c	11622	admin
11645	DecisionTreeOptions	2021-02-16 19:47:42.757369	{"type":"decision_tree","decisionTreeType":"ID3","minObj":2,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":null,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	39f1e3398066126a7ec251b2b96eb411	11622	admin
11651	DecisionTreeOptions	2021-02-16 19:47:42.810984	{"type":"decision_tree","decisionTreeType":"C45","minObj":3,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":null,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"additionalOptions":null}	a52faae8580850531ff6b483c2472fcb	11622	admin
11656	DecisionTreeOptions	2022-12-09 13:05:38.277683	{"type":"decision_tree","decisionTreeType":"CHAID","minObj":null,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":true,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"alpha":null,"additionalOptions":null}	76198559d63b37f8252cc25feda8caef	11598	\N
11657	DecisionTreeOptions	2022-12-09 13:05:38.283008	{"type":"decision_tree","decisionTreeType":"ID3","minObj":null,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":false,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"alpha":null,"additionalOptions":null}	bbd1fb592a914c953b2d32bbd679a9b1	11598	\N
11658	DecisionTreeOptions	2022-12-09 13:05:38.28446	{"type":"decision_tree","decisionTreeType":"CART","minObj":null,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":null,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"alpha":null,"additionalOptions":null}	ad6a3ec6fe610f15a0c9666113b00336	11598	\N
11659	DecisionTreeOptions	2022-12-09 13:05:38.284775	{"type":"decision_tree","decisionTreeType":"ID3","minObj":null,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":true,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"alpha":null,"additionalOptions":null}	5873b0a055e7e196a1359529af89c4b4	11598	\N
11660	DecisionTreeOptions	2022-12-09 13:05:38.280729	{"type":"decision_tree","decisionTreeType":"C45","minObj":null,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":false,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"alpha":null,"additionalOptions":null}	563fce686ce83bc909ee1545821f6c3e	11598	\N
11661	DecisionTreeOptions	2022-12-09 13:05:38.281516	{"type":"decision_tree","decisionTreeType":"C45","minObj":null,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":true,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"alpha":null,"additionalOptions":null}	64dd46072a1c69570bf3c8564cadcade	11598	\N
11662	DecisionTreeOptions	2022-12-09 13:05:38.285066	{"type":"decision_tree","decisionTreeType":"CHAID","minObj":null,"maxDepth":null,"randomTree":null,"numRandomAttr":null,"useBinarySplits":false,"useRandomSplits":null,"numRandomSplits":null,"seed":null,"alpha":null,"additionalOptions":null}	4b2a3ee305ef61bf610d3a33273bcfbb	11598	\N
\.


--
-- TOC entry 2500 (class 0 OID 16437)
-- Dependencies: 194
-- Data for Name: classifier_options_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classifier_options_request (id, creation_date, source, classifier_options_request_model_id) FROM stdin;
2114	2018-06-21 21:14:07.227	ERS	2112
2219	2018-06-21 22:27:46.565	ERS	2217
2222	2018-06-21 22:28:22.325	CACHE	2217
2304	2018-06-25 23:40:45.409	ERS	2302
2310	2018-06-25 23:41:48.268	CACHE	2302
2417	2018-06-29 00:22:46.944	ERS	2415
2420	2018-06-29 00:25:23.296	CACHE	2415
2509	2018-07-07 23:28:49.993	ERS	2507
2512	2018-07-07 23:30:24.156	CACHE	2507
2536	2018-07-08 14:15:38.201	CACHE	2507
2574	2018-07-19 23:24:25.279	ERS	2572
2579	2018-07-19 23:25:10.453	ERS	2577
2609	2018-08-23 21:11:06.584	ERS	2607
2717	2018-08-31 21:13:23.105	ERS	2715
3167	2019-01-05 19:40:23.757	ERS	3165
3172	2019-01-05 19:43:09.546	ERS	3170
3175	2019-01-05 19:43:32.755	CACHE	3170
3180	2019-01-05 19:44:23.336	ERS	3178
3185	2019-01-05 19:44:54.05	ERS	3183
6969	2019-04-13 15:29:58.106	ERS	6967
7123	2019-04-13 15:35:57.287	ERS	7121
7257	2019-04-13 15:42:53.602	ERS	7255
7299	2019-06-03 23:04:53.291	ERS	7297
\.


--
-- TOC entry 2502 (class 0 OID 16442)
-- Dependencies: 196
-- Data for Name: classifier_options_request_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classifier_options_request_model (id, relation_name, data_md5_hash, evaluation_method, num_folds, num_tests, seed) FROM stdin;
2112	Glass	c2067a52a8a8e587facd068107356843	CROSS_VALIDATION	10	1	1
2217	MedData	e40e66095f7d265c7f5c9f5095c15dbd	CROSS_VALIDATION	10	1	1
2302	ionosphere	28baefa8292085eb2641f6fe2a2368e0	CROSS_VALIDATION	10	1	1
2415	pima_diabetes	3081e0d5b30d4f96c9ee816e375ad999	CROSS_VALIDATION	10	1	1
2507	german_credit	a6c81a40b9a3b9c71361911a5735f525	CROSS_VALIDATION	10	1	1
2572	Glass	c2067a52a8a8e587facd068107356843	CROSS_VALIDATION	10	1	1
2577	pima_diabetes	3081e0d5b30d4f96c9ee816e375ad999	CROSS_VALIDATION	10	1	1
2607	GeneratedData1535033359192	aa4ea06e2142b0a08ea7465d494a3f79	CROSS_VALIDATION	10	1	1
2715	breast-cancer	520ef0cfec150aa127e058246c021a23	CROSS_VALIDATION	10	1	1
3165	breast-cancer	d9b4ae424f234d81cfd6b4d2aafe8373	CROSS_VALIDATION	10	1	1
3170	MedData	83eec941a3172fb87b9a4936358f80dc	CROSS_VALIDATION	10	1	1
3178	ionosphere	de5e1d2eee6d45d2f9cc9576cfef709f	CROSS_VALIDATION	10	1	1
3183	Glass	b9d2aab36df39f508f3720ca184f439e	CROSS_VALIDATION	10	1	1
6967	MedData	83eec941a3172fb87b9a4936358f80dc	CROSS_VALIDATION	10	1	1
7121	Glass	b9d2aab36df39f508f3720ca184f439e	CROSS_VALIDATION	10	1	1
7255	ionosphere	de5e1d2eee6d45d2f9cc9576cfef709f	CROSS_VALIDATION	10	1	1
7297	MedData	83eec941a3172fb87b9a4936358f80dc	CROSS_VALIDATION	10	1	1
\.


--
-- TOC entry 2504 (class 0 OID 16450)
-- Dependencies: 198
-- Data for Name: classifier_options_response_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classifier_options_response_model (id, classifier_name, classifier_description, classifier_options, classifier_options_request_model_id) FROM stdin;
2113	ExtraTreesClassifier	\N	{"type":"extra_trees","numIterations":75,"numThreads":4,"seed":1,"numRandomAttr":3,"minObj":2,"maxDepth":0,"decisionTreeType":"C45","numRandomSplits":17,"useBootstrapSamples":false}	2112
2218	AdaBoostClassifier	\N	{"type":"ada_boost","numIterations":25,"numThreads":null,"seed":1,"minError":0.0,"maxError":0.5,"classifierOptions":[{"type":"knn","numNeighbours":10,"weight":1.0,"distanceType":"CHEBYSHEV"},{"type":"knn","numNeighbours":10,"weight":1.0,"distanceType":"MANHATTAN"}]}	2217
2303	ExtraTreesClassifier	\N	{"type":"extra_trees","numIterations":10,"numThreads":4,"seed":1,"numRandomAttr":18,"minObj":2,"maxDepth":0,"decisionTreeType":"CART","numRandomSplits":7,"useBootstrapSamples":false}	2302
2416	ModifiedHeterogeneousClassifier	\N	{"type":"heterogeneous_classifier","numIterations":25,"numThreads":4,"seed":1,"minError":0.0,"maxError":0.5,"classifierOptions":[{"type":"neural_network","numInNeurons":8,"numOutNeurons":2,"hiddenLayer":"14","seed":1,"numIterations":1000000,"minError":1.0E-5,"activationFunctionOptions":{"activationFunctionType":"SINUSOID","coefficient":1.0},"backPropagationOptions":{"learningRate":0.1,"momentum":0.2}},{"type":"neural_network","numInNeurons":8,"numOutNeurons":2,"hiddenLayer":"14","seed":1,"numIterations":1000000,"minError":1.0E-5,"activationFunctionOptions":{"activationFunctionType":"LOGISTIC","coefficient":1.0},"backPropagationOptions":{"learningRate":0.1,"momentum":0.2}}],"useWeightedVotes":false,"useRandomClassifier":true,"samplingMethod":"RANDOM_BAGGING","useRandomSubspaces":true}	2415
2508	RandomForests	\N	{"type":"RandomForestsOptions","numIterations":100,"numThreads":1,"seed":1,"numRandomAttr":4,"minObj":2,"maxDepth":0,"decisionTreeType":"CART"}	2507
2573	ExtraTreesClassifier	\N	{"type":"extra_trees","numIterations":75,"numThreads":4,"seed":1,"numRandomAttr":3,"minObj":2,"maxDepth":0,"decisionTreeType":"C45","numRandomSplits":17,"useBootstrapSamples":false}	2572
2578	ModifiedHeterogeneousClassifier	\N	{"type":"heterogeneous_classifier","numIterations":25,"numThreads":4,"seed":1,"minError":0.0,"maxError":0.5,"classifierOptions":[{"type":"neural_network","numInNeurons":8,"numOutNeurons":2,"hiddenLayer":"14","seed":1,"numIterations":1000000,"minError":1.0E-5,"activationFunctionOptions":{"activationFunctionType":"SINUSOID","coefficient":1.0},"backPropagationOptions":{"learningRate":0.1,"momentum":0.2}},{"type":"neural_network","numInNeurons":8,"numOutNeurons":2,"hiddenLayer":"14","seed":1,"numIterations":1000000,"minError":1.0E-5,"activationFunctionOptions":{"activationFunctionType":"LOGISTIC","coefficient":1.0},"backPropagationOptions":{"learningRate":0.1,"momentum":0.2}}],"useWeightedVotes":false,"useRandomClassifier":true,"samplingMethod":"RANDOM_BAGGING","useRandomSubspaces":true}	2577
2608	Logistic	\N	{"type":"logistic","maxIts":200,"useConjugateGradientDescent":false}	2607
2716	ModifiedHeterogeneousClassifier	\N	{"type":"heterogeneous_classifier","numIterations":25,"numThreads":4,"seed":1,"minError":0.0,"maxError":0.5,"classifierOptions":[{"type":"neural_network","numInNeurons":9,"numOutNeurons":2,"hiddenLayer":"5","seed":1,"numIterations":1000000,"minError":1.0E-5,"activationFunctionOptions":{"activationFunctionType":"INVERSE_SQUARE_ROOT_UNIT","coefficient":1.0},"backPropagationOptions":{"learningRate":0.1,"momentum":0.2}},{"type":"knn","numNeighbours":10,"weight":1.0,"distanceType":"EUCLID"}],"useWeightedVotes":true,"useRandomClassifier":false,"samplingMethod":"RANDOM_BAGGING","useRandomSubspaces":true}	2715
3166	ModifiedHeterogeneousClassifier	\N	{"type":"heterogeneous_classifier","numIterations":25,"numThreads":2,"seed":1,"minError":0.0,"maxError":0.5,"classifierOptions":[{"type":"neural_network","numInNeurons":9,"numOutNeurons":2,"hiddenLayer":"5","seed":1,"numIterations":1000000,"minError":1.0E-5,"activationFunctionOptions":{"activationFunctionType":"INVERSE_SQUARE_ROOT_UNIT","coefficient":1.0},"backPropagationOptions":{"learningRate":0.1,"momentum":0.2}},{"type":"knn","numNeighbours":10,"weight":1.0,"distanceType":"MANHATTAN"}],"useWeightedVotes":true,"useRandomClassifier":false,"samplingMethod":"RANDOM_BAGGING","useRandomSubspaces":true}	3165
3171	AdaBoostClassifier	\N	{"type":"ada_boost","numIterations":25,"numThreads":null,"seed":1,"minError":0.0,"maxError":0.5,"classifierOptions":[{"type":"knn","numNeighbours":10,"weight":1.0,"distanceType":"CHEBYSHEV"},{"type":"knn","numNeighbours":10,"weight":1.0,"distanceType":"MANHATTAN"}]}	3170
3179	AdaBoostClassifier	\N	{"type":"ada_boost","numIterations":25,"numThreads":null,"seed":1,"minError":0.0,"maxError":0.5,"classifierOptions":[{"type":"j48","minNumObj":2,"binarySplits":false,"unpruned":false,"numFolds":3}]}	3178
3184	AdaBoostClassifier	\N	{"type":"ada_boost","numIterations":25,"numThreads":null,"seed":1,"minError":0.0,"maxError":0.5,"classifierOptions":[{"type":"decision_tree","decisionTreeType":"CART","minObj":2,"maxDepth":0,"randomTree":false,"numRandomAttr":0,"useBinarySplits":true,"useRandomSplits":false,"numRandomSplits":1,"seed":1,"additionalOptions":null},{"type":"decision_tree","decisionTreeType":"ID3","minObj":2,"maxDepth":0,"randomTree":false,"numRandomAttr":0,"useBinarySplits":true,"useRandomSplits":false,"numRandomSplits":1,"seed":1,"additionalOptions":null}]}	3183
6968	AdaBoostClassifier	\N	{"type":"ada_boost","numIterations":25,"numThreads":null,"seed":1,"minError":0.0,"maxError":0.5,"classifierOptions":[{"type":"knn","numNeighbours":10,"weight":1.0,"distanceType":"CHEBYSHEV"}]}	6967
7122	ExtraTreesClassifier	\N	{"type":"extra_trees","numIterations":40,"numThreads":4,"seed":1,"numRandomAttr":6,"minObj":2,"maxDepth":0,"decisionTreeType":"C45","numRandomSplits":13,"useBootstrapSamples":true}	7121
7256	AdaBoostClassifier	\N	{"type":"ada_boost","numIterations":76,"numThreads":null,"seed":1,"minError":0.0,"maxError":0.5,"classifierOptions":[{"type":"j48","minNumObj":2,"binarySplits":false,"unpruned":false,"numFolds":10}]}	7255
7298	AdaBoostClassifier	\N	{"type":"ada_boost","numIterations":25,"numThreads":null,"seed":1,"minError":0.0,"maxError":0.5,"classifierOptions":[{"type":"knn","numNeighbours":10,"weight":1.0,"distanceType":"CHEBYSHEV"}]}	7297
\.


--
-- TOC entry 2506 (class 0 OID 16458)
-- Dependencies: 200
-- Data for Name: classifiers_configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classifiers_configuration (id, configuration_name, creation_date, updated, build_in, is_active, created_by) FROM stdin;
11622	Decision trees v1.0	2021-02-16 19:46:42.972352	2021-02-16 19:47:42.847351	f	f	admin
11598	Default configuration	2021-02-16 19:37:21.065778	2022-12-09 13:05:38.443815	t	t	\N
\.


--
-- TOC entry 2548 (class 0 OID 17602)
-- Dependencies: 242
-- Data for Name: classifiers_configuration_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classifiers_configuration_history (id, action_type, message_text, created_at, created_by, configuration_id) FROM stdin;
\.


--
-- TOC entry 2508 (class 0 OID 16468)
-- Dependencies: 202
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	roman.batygin@mail.ru	db/changelog/000000000021.xml	2019-09-27 15:53:54.313895	75	EXECUTED	8:e66bb2aa9607abc9ee00870ea8eda321	createTable tableName=classifier_info		\N	3.7.0	schema	\N	9574433590
2	roman.batygin@mail.ru	db/changelog/000000000021.xml	2019-09-27 15:53:54.511086	76	EXECUTED	8:236c975d984a44ffe10fff95f0f06ea7	addColumn tableName=classifier_input_options		\N	3.7.0	schema	\N	9574433590
3	roman.batygin@mail.ru	db/changelog/000000000021.xml	2019-09-27 15:53:54.62395	77	EXECUTED	8:c50cb812088334c3e6994ffa159bd211	addColumn tableName=evaluation_log		\N	3.7.0	schema	\N	9574433590
1	roman.batygin@mail.ru	db/changelog/000000000023.xml	2019-09-27 17:28:41.127083	85	EXECUTED	8:521b1a41d60c27a8540e56218699357d	dropColumn columnName=experiment_id, tableName=experiment_results_request		\N	3.7.0	schema	\N	9580118641
2	roman.batygin@mail.ru	db/changelog/000000000023.xml	2019-09-27 17:28:41.87661	86	EXECUTED	8:206e17948f421e408b8469adf53a64ca	addNotNullConstraint columnName=experiment_results_id, tableName=experiment_results_request		\N	3.7.0	schema	\N	9580118641
3	roman.batygin@mail.ru	db/changelog/000000000023.xml	2019-09-27 17:28:42.040322	87	EXECUTED	8:bfc479c7b8443a6a63055110a4c17a79	addNotNullConstraint columnName=classifier_info_id, tableName=classifier_input_options		\N	3.7.0	schema	\N	9580118641
1	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2020-01-11 01:49:18.504093	88	MARK_RAN	8:a3d354491071bf1899da0ff55cd58976	createSequence sequenceName=hibernate_sequence		\N	3.7.0	\N	\N	8682158063
2	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2020-01-11 01:49:18.551151	89	MARK_RAN	8:c4b6d26f7ec7723cad0cb1f2ac9be9a7	createTable tableName=instances_info		\N	3.7.0	schema	\N	8682158063
3	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2020-01-11 01:49:18.679842	90	MARK_RAN	8:f3bcf245536138b4540b485f7b2dd9da	createTable tableName=evaluation_log		\N	3.7.0	schema	\N	8682158063
4	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2020-01-11 01:49:18.69281	91	MARK_RAN	8:253dc175faecacdc5e49ff7de493510b	createTable tableName=evaluation_options; addPrimaryKey constraintName=pk_evaluation_options, tableName=evaluation_options		\N	3.7.0	schema	\N	8682158063
5	roman.batygin@mail.ru	db/changelog/v0-init-schema.xml	2020-01-11 01:49:18.714273	92	MARK_RAN	8:d44d7fd8a5d0c877bd1704927873bd38	createTable tableName=experiment		\N	3.7.0	schema	\N	8682158063
1	roman.batygin@mail.ru	db/changelog/v24-add-classifier-options-md5hash-column.xml	2020-01-11 01:49:18.888736	93	EXECUTED	8:438812a5744575c2ae3084a3ebe31697	addColumn tableName=classifier_options		\N	3.7.0	schema	\N	8682158063
1	roman.batygin@mail.ru	db/changelog/24-11-17.xml	2017-12-30 01:59:04.093584	1	EXECUTED	\N	addColumn tableName=experiment		\N	3.5.3	schema	\N	4588343935
4	roman.batygin@mail.ru	db/changelog/000000000021.xml	2019-09-27 15:55:55.387039	78	EXECUTED	8:051392335ede73b5247d1afcc72df1dd	sqlFile		\N	3.7.0	\N	\N	9574554392
5	roman.batygin@mail.ru	db/changelog/000000000021.xml	2019-09-27 15:55:55.406194	79	EXECUTED	8:7435434ceb46a855b3eae4f2260be23f	dropColumn columnName=classifier_name, tableName=evaluation_log		\N	3.7.0	schema	\N	9574554392
6	roman.batygin@mail.ru	db/changelog/000000000021.xml	2019-09-27 15:55:55.419432	80	EXECUTED	8:92f7a7e63f4b90fcdaaa66c28579c066	dropColumn columnName=evaluation_log_id, tableName=classifier_input_options		\N	3.7.0	schema	\N	9574554392
7	roman.batygin@mail.ru	db/changelog/000000000021.xml	2019-09-27 15:55:55.446958	81	EXECUTED	8:ee19982180dfe24a963fc8a0f02c26ea	update tableName=filter_field		\N	3.7.0	data	\N	9574554392
8	roman.batygin@mail.ru	db/changelog/000000000021.xml	2019-09-27 15:55:55.488931	82	EXECUTED	8:28ae4df0e1ea5948d82179b8fb5c4789	update tableName=global_filter_field		\N	3.7.0	data	\N	9574554392
1	roman.batygin@mail.ru	db/changelog/000000000022.xml	2019-09-27 15:55:55.541867	83	EXECUTED	8:d2b7ec873b8d82e7db7e245546102776	createTable tableName=experiment_results		\N	3.7.0	schema	\N	9574554392
2	roman.batygin@mail.ru	db/changelog/000000000022.xml	2019-09-27 15:55:55.596747	84	EXECUTED	8:9c9f20170f73b3a8d5cd24352bacba41	addColumn tableName=experiment_results_request		\N	3.7.0	schema	\N	9574554392
1	roman.batygin@mail.ru	db/changelog/000000000001.xml	2018-02-01 23:50:36.885963	2	MARK_RAN	8:674af100e8bb059de97ec6a3ccff1661	addColumn tableName=experiment		\N	3.5.3	schema	\N	7518236719
1	roman.batygin@mail.ru	db/changelog/000000000002.xml	2018-02-01 23:50:38.379656	3	EXECUTED	8:a37106a923f2e5a88336eecb0eb718c2	createTable tableName=classifier_options		\N	3.5.3	schema	\N	7518236719
1	roman.batygin@mail.ru	db/changelog/000000000003.xml	2018-03-07 23:56:47.197504	4	EXECUTED	8:205462fcbe2204e80960a45beff12cde	addColumn tableName=email		\N	3.5.3	schema	\N	0456206937
2	roman.batygin@mail.ru	db/changelog/000000000003.xml	2018-03-07 23:56:47.261484	5	EXECUTED	8:e907decc15d6392137ea31f8eaf2ec78	addColumn tableName=email		\N	3.5.3	schema	\N	0456206937
3	roman.batygin@mail.ru	db/changelog/000000000003.xml	2018-03-07 23:56:47.274185	6	EXECUTED	8:90299b299e86e77d2083fda71437c9e7	addColumn tableName=email		\N	3.5.3	schema	\N	0456206937
4	roman.batygin@mail.ru	db/changelog/000000000003.xml	2018-03-07 23:56:47.747223	7	EXECUTED	8:670ffa11ddb6558965035b357fcc7341	addColumn tableName=email		\N	3.5.3	schema	\N	0456206937
5	roman.batygin@mail.ru	db/changelog/000000000003.xml	2018-03-07 23:56:47.793428	8	EXECUTED	8:b14aeae8eebd1655d3c854304438960b	sql		\N	3.5.3	schema	\N	0456206937
6	roman.batygin@mail.ru	db/changelog/000000000003.xml	2018-03-07 23:56:47.815903	9	EXECUTED	8:1bc7e35910e82d6401fc8bca74d3ec87	sql		\N	3.5.3	schema	\N	0456206937
1	roman.batygin@mail.ru	db/changelog/000000000004.xml	2018-06-10 21:25:06.664648	10	EXECUTED	8:2c54e1e2990543e5643ed6a9e01f9d79	createTable tableName=ers_request		\N	3.5.3	schema	\N	8655106432
3	roman.batygin@mail.ru	db/changelog/000000000004.xml	2018-06-10 21:25:06.889521	12	EXECUTED	8:bc61a63480559e53115ac98058d747f0	createTable tableName=experiment_results_request; addForeignKeyConstraint baseTableName=experiment_results_request, constraintName=fk_experiment_results_id, referencedTableName=ers_request		\N	3.5.3	schema	\N	8655106432
1	roman.batygin@mail.ru	db/changelog/000000000005.xml	2018-06-13 00:09:55.726891	13	EXECUTED	8:b439db5499a2068905229fb8617fb410	addColumn tableName=evaluation_log		\N	3.5.3	schema	\N	8837795331
2	roman.batygin@mail.ru	db/changelog/000000000005.xml	2018-06-13 00:09:56.375065	14	EXECUTED	8:412394de64974047f6512ea145cbeb7a	createIndex indexName=idx_request_id, tableName=evaluation_log		\N	3.5.3	schema	\N	8837795331
3	roman.batygin@mail.ru	db/changelog/000000000005.xml	2018-06-13 00:09:56.468564	15	EXECUTED	8:f19ea536e87799663267a25865fc3a71	createIndex indexName=idx_evaluation_status, tableName=evaluation_log		\N	3.5.3	schema	\N	8837795331
4	roman.batygin@mail.ru	db/changelog/000000000005.xml	2018-06-13 00:09:56.542103	16	EXECUTED	8:9ceb944cfff0eba281c4cd63ac87ff11	createIndex indexName=idx_uuid, tableName=experiment		\N	3.5.3	schema	\N	8837795331
5	roman.batygin@mail.ru	db/changelog/000000000005.xml	2018-06-13 00:09:56.605134	17	EXECUTED	8:2af6734213aa7cfe51b46857aee3cced	createIndex indexName=idx_experiment_status, tableName=experiment		\N	3.5.3	schema	\N	8837795331
1	roman.batygin@mail.ru	db/changelog/000000000014.xml	2019-06-21 21:10:20.055724	46	EXECUTED	8:16b0ac19750358b4a44f8926c42fb9fb	renameColumn newColumnName=filter_field_type, oldColumnName=filter_type, tableName=filter_field		\N	3.5.3	schema	\N	1126219308
1	roman.batygin@mail.ru	db/changelog/000000000006.xml	2018-06-21 21:06:17.222308	18	EXECUTED	8:bbdde2d67b484c16f8359d46c2e63009	createTable tableName=classifier_options_request_model; addForeignKeyConstraint baseTableName=classifier_options_request_model, constraintName=fk_classifier_options_request_id, referencedTableName=ers_request		\N	3.5.3	schema	\N	9604375733
2	roman.batygin@mail.ru	db/changelog/000000000006.xml	2018-06-21 21:06:17.47963	19	EXECUTED	8:23384f5064308b85bfa087f069210ff3	createIndex indexName=idx_data_md5_hash, tableName=classifier_options_request_model		\N	3.5.3	schema	\N	9604375733
3	roman.batygin@mail.ru	db/changelog/000000000006.xml	2018-06-21 21:06:18.060696	20	EXECUTED	8:c0a0345a89545537526ce05828f01952	createTable tableName=classifier_options_response_model		\N	3.5.3	schema	\N	9604375733
4	roman.batygin@mail.ru	db/changelog/000000000006.xml	2018-06-21 21:06:18.413182	21	EXECUTED	8:cd39e167c4ff2894bfb19c9898b09f29	createTable tableName=classifier_options_request		\N	3.5.3	schema	\N	9604375733
1	roman.batygin@mail.ru	db/changelog/000000000007.xml	2018-06-21 21:06:18.594774	22	EXECUTED	8:b78ce81a558f275da8a92d12c5813506	dropColumn columnName=ip_address, tableName=evaluation_log		\N	3.5.3	schema	\N	9604375733
2	roman.batygin@mail.ru	db/changelog/000000000007.xml	2018-06-21 21:06:18.648118	23	EXECUTED	8:c9e51a23838ee3a52196b966781144a6	dropColumn columnName=ip_address, tableName=experiment		\N	3.5.3	schema	\N	9604375733
2	roman.batygin@mail.ru	db/changelog/000000000008.xml	2018-07-07 02:01:28.942731	25	EXECUTED	8:ae88cde96c4b2a6e9c7355f189efe86c	dropColumn columnName=failed_attempts_to_sent, tableName=experiment		\N	3.5.3	schema	\N	0918088829
3	roman.batygin@mail.ru	db/changelog/000000000008.xml	2018-07-07 02:01:29.069344	26	EXECUTED	8:3368504d4bcdc14b09e71f4152a14755	createTable tableName=email_request		\N	3.5.3	schema	\N	0918088829
1	roman.batygin@mail.ru	db/changelog/000000000009.xml	2018-12-29 02:08:39.442736	27	EXECUTED	8:f95b69116d17d2396d24e01030367e6e	createTable tableName=filter_template		\N	3.5.3	schema	\N	6024118236
2	roman.batygin@mail.ru	db/changelog/000000000009.xml	2018-12-29 02:08:39.764104	28	EXECUTED	8:e4ba129aa4741dc071ffa7ced19d0679	createTable tableName=filter_dictionary		\N	3.5.3	schema	\N	6024118236
4	roman.batygin@mail.ru	db/changelog/000000000009.xml	2018-12-29 02:08:40.462679	30	EXECUTED	8:09a65d3c8c32bbbe66f180c02c9402fc	createTable tableName=filter_dictionary_value		\N	3.5.3	schema	\N	6024118236
5	roman.batygin@mail.ru	db/changelog/000000000009.xml	2018-12-29 02:08:40.577504	31	EXECUTED	8:d0a3f9fba0857c70610f9479b6ae4b14	insert tableName=filter_dictionary; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value		\N	3.5.3	data	\N	6024118236
7	roman.batygin@mail.ru	db/changelog/000000000009.xml	2018-12-29 02:08:40.896272	33	EXECUTED	8:19695c1d1554425c3e5a14e69ca348ad	insert tableName=filter_dictionary; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; i...		\N	3.5.3	data	\N	6024118236
8	roman.batygin@mail.ru	db/changelog/000000000009.xml	2018-12-29 02:08:41.041718	34	EXECUTED	8:ad2181b50b236487dd876186d2443b8c	insert tableName=filter_dictionary; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; i...		\N	3.5.3	data	\N	6024118236
1	roman.batygin@mail.ru	db/changelog/000000000018.xml	2019-07-11 13:42:18.899307	64	EXECUTED	8:e2b42de614dea7cd0a82df7f28a29105	update tableName=filter_dictionary_value		\N	3.5.3	data	\N	2827334950
2	roman.batygin@mail.ru	db/changelog/000000000004.xml	2018-06-10 21:25:06.76463	11	EXECUTED	8:d98f930e59763e1adc43a67260054974	createTable tableName=evaluation_results_request; addForeignKeyConstraint baseTableName=evaluation_results_request, constraintName=fk_evaluation_results_id, referencedTableName=ers_request		\N	3.5.3	schema	\N	8655106432
1	roman.batygin@mail.ru	db/changelog/000000000008.xml	2018-07-07 02:01:28.919969	24	EXECUTED	8:a9b2325f5d3dd6469f6efb246385fa03	dropTable tableName=email		\N	3.5.3	schema	\N	0918088829
3	roman.batygin@mail.ru	db/changelog/000000000009.xml	2018-12-29 02:08:40.110345	29	EXECUTED	8:69bf77afd0ab507b9660d87bd5597f0c	createTable tableName=filter_field		\N	3.5.3	schema	\N	6024118236
6	roman.batygin@mail.ru	db/changelog/000000000009.xml	2018-12-29 02:08:40.707635	32	EXECUTED	8:26085c996b91929c004e69bc2c415ab4	insert tableName=filter_dictionary; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value		\N	3.5.3	data	\N	6024118236
10	roman.batygin@mail.ru	db/changelog/000000000009.xml	2018-12-29 02:08:41.303896	36	EXECUTED	8:fed8db0177f1ce4d8997fa4e33668353	insert tableName=filter_template; insert tableName=filter_field; insert tableName=filter_field; insert tableName=filter_field; insert tableName=filter_field; insert tableName=filter_field; insert tableName=filter_field		\N	3.5.3	data	\N	6024118236
11	roman.batygin@mail.ru	db/changelog/000000000009.xml	2018-12-29 02:08:41.407006	37	EXECUTED	8:ff83f00744b77a43e9b6be966045d77c	insert tableName=filter_template; insert tableName=filter_field; insert tableName=filter_field; insert tableName=filter_field; insert tableName=filter_field; insert tableName=filter_field; insert tableName=filter_field		\N	3.5.3	data	\N	6024118236
1	roman.batygin@mail.ru	db/changelog/000000000010.xml	2019-02-25 22:06:48.804455	38	EXECUTED	8:ef6c5165237beeb8f0135612ee2330e9	createTable tableName=classifier_input_options		\N	3.5.3	schema	\N	1107208450
1	roman.batygin@mail.ru	db/changelog/000000000011.xml	2019-02-25 22:57:50.768409	39	EXECUTED	8:54b5f9fc3dea96455d75e410ae24f578	dropTable tableName=input_options		\N	3.5.3	schema	\N	1110270567
1	roman.batygin@mail.ru	db/changelog/000000000012.xml	2019-06-11 21:55:33.855441	40	EXECUTED	8:8d915fb6c5c26040b2950950f5a56ec5	insert tableName=filter_field; update tableName=filter_field; update tableName=filter_field; update tableName=filter_field; update tableName=filter_field		\N	3.5.3	data	\N	0264933256
1	roman.batygin@mail.ru	db/changelog/000000000013.xml	2019-06-21 21:10:19.714254	41	EXECUTED	8:1b413e2b2b29474f0248e4fdb9163ca8	createTable tableName=global_filter_template		\N	3.5.3	schema	\N	1126219308
2	roman.batygin@mail.ru	db/changelog/000000000013.xml	2019-06-21 21:10:19.923993	42	EXECUTED	8:0ac91be0e90734684d22f75dc17204e2	createTable tableName=global_filter_field		\N	3.5.3	schema	\N	1126219308
4	roman.batygin@mail.ru	db/changelog/000000000013.xml	2019-06-21 21:10:19.976527	44	EXECUTED	8:d9cc17f348c9136c613efe5ea0b5dd60	insert tableName=global_filter_template; insert tableName=global_filter_field; insert tableName=global_filter_field; insert tableName=global_filter_field		\N	3.5.3	data	\N	1126219308
11	roman.batygin@mail.ru	db/changelog/000000000013.xml	2019-06-21 21:10:19.9969	45	EXECUTED	8:5579dda7c0dd49194fd81d1dbccfd631	insert tableName=global_filter_template; insert tableName=global_filter_field; insert tableName=global_filter_field		\N	3.5.3	data	\N	1126219308
3	roman.batygin@mail.ru	db/changelog/v36-create-app-instance-table.xml	2021-02-16 19:37:13.081389	133	EXECUTED	8:63ffa28dd38eb5672a1bbfe5e2289641	addColumn tableName=evaluation_log		\N	3.7.0	schema	\N	3479031894
2	roman.batygin@mail.ru	db/changelog/000000000014.xml	2019-06-21 21:10:20.066949	47	EXECUTED	8:8504f165a6cbdff0b605605973ae6790	renameColumn newColumnName=field_name, oldColumnName=name, tableName=filter_field		\N	3.5.3	schema	\N	1126219308
3	roman.batygin@mail.ru	db/changelog/000000000014.xml	2019-06-21 21:10:20.083512	48	EXECUTED	8:a75fc5f71d76d3fb67a0c9128c8d5996	renameColumn newColumnName=template_name, oldColumnName=name, tableName=filter_template		\N	3.5.3	schema	\N	1126219308
1	roman.batygin@mail.ru	db/changelog/000000000015.xml	2019-07-11 13:42:15.215252	49	EXECUTED	8:6546dc0956b5949a772462a99ac9aab9	update tableName=filter_dictionary		\N	3.5.3	data	\N	2827334950
2	roman.batygin@mail.ru	db/changelog/000000000015.xml	2019-07-11 13:42:15.337511	50	EXECUTED	8:ab5c9cc1d72beb2e44ee102eca6b6b55	update tableName=filter_dictionary		\N	3.5.3	data	\N	2827334950
3	roman.batygin@mail.ru	db/changelog/000000000015.xml	2019-07-11 13:42:15.366366	51	EXECUTED	8:f95da3bfc5575cce793336df41d30e6b	update tableName=filter_dictionary		\N	3.5.3	data	\N	2827334950
4	roman.batygin@mail.ru	db/changelog/000000000015.xml	2019-07-11 13:42:15.392651	52	EXECUTED	8:074382fe776297ae4f5f96fdd05679f5	update tableName=filter_dictionary		\N	3.5.3	data	\N	2827334950
1	roman.batygin@mail.ru	db/changelog/000000000017.xml	2019-07-11 13:42:17.918413	54	EXECUTED	8:abdcd34834a28bbf5632006d64881392	addColumn tableName=filter_field		\N	3.5.3	data	\N	2827334950
2	roman.batygin@mail.ru	db/changelog/000000000017.xml	2019-07-11 13:42:17.993642	55	EXECUTED	8:7b88a3d3ee81531f4846f13156ca2a24	delete tableName=filter_field		\N	3.5.3	data	\N	2827334950
3	roman.batygin@mail.ru	db/changelog/000000000017.xml	2019-07-11 13:42:18.135388	56	EXECUTED	8:b80b9fa76682750b5d97baa2b7bdba95	update tableName=filter_field		\N	3.5.3	data	\N	2827334950
4	roman.batygin@mail.ru	db/changelog/000000000017.xml	2019-07-11 13:42:18.387968	57	EXECUTED	8:a3b545ef2d178eb697404031a285c970	delete tableName=filter_field		\N	3.5.3	data	\N	2827334950
5	roman.batygin@mail.ru	db/changelog/000000000017.xml	2019-07-11 13:42:18.494132	58	EXECUTED	8:5fe847c4c164d0ca305d2c705cd2d5a4	update tableName=filter_field		\N	3.5.3	data	\N	2827334950
7	roman.batygin@mail.ru	db/changelog/000000000017.xml	2019-07-11 13:42:18.683276	60	EXECUTED	8:5ad500efa84630b338b9ac717f7d24d8	update tableName=filter_field		\N	3.5.3	data	\N	2827334950
8	roman.batygin@mail.ru	db/changelog/000000000017.xml	2019-07-11 13:42:18.7297	61	EXECUTED	8:cb7854c01d1e5f177678316525f4cdec	delete tableName=filter_field		\N	3.5.3	data	\N	2827334950
9	roman.batygin@mail.ru	db/changelog/000000000017.xml	2019-07-11 13:42:18.804062	62	EXECUTED	8:257af86373844f6a235e833f7eebf7a3	update tableName=filter_field		\N	3.5.3	data	\N	2827334950
10	roman.batygin@mail.ru	db/changelog/000000000017.xml	2019-07-11 13:42:18.859872	63	EXECUTED	8:288f39a36cfc33ee2f0a32ba2cb33476	update tableName=filter_field		\N	3.5.3	data	\N	2827334950
3	roman.batygin@mail.ru	db/changelog/000000000018.xml	2019-07-11 13:42:19.146481	66	EXECUTED	8:e63b9a770244b05d965a1c0e753ecc28	update tableName=filter_dictionary_value		\N	3.5.3	data	\N	2827334950
1	roman.batygin@mail.ru	db/changelog/000000000019.xml	2019-07-23 20:49:37.925	67	EXECUTED	8:2e23eb40a0f7f2041b99c1724b9ea779	addColumn tableName=experiment		\N	3.5.3	schema	\N	3889777568
9	roman.batygin@mail.ru	db/changelog/000000000009.xml	2018-12-29 02:08:41.20068	35	EXECUTED	8:1442209d70b70ec66bf615fc8adf6271	insert tableName=filter_template; insert tableName=filter_field; insert tableName=filter_field; insert tableName=filter_field; insert tableName=filter_field; insert tableName=filter_field; insert tableName=filter_field; insert tableName=filter_fie...		\N	3.5.3	data	\N	6024118236
3	roman.batygin@mail.ru	db/changelog/000000000013.xml	2019-06-21 21:10:19.962217	43	EXECUTED	8:abc1da7383ebb1438d6a98a7e3bc0ac7	insert tableName=global_filter_template; insert tableName=global_filter_field; insert tableName=global_filter_field; insert tableName=global_filter_field		\N	3.5.3	data	\N	1126219308
1	roman.batygin@mail.ru	db/changelog/000000000016.xml	2019-07-11 13:42:15.474953	53	EXECUTED	8:51142fb50acd45278dda7544cd60482c	delete tableName=filter_dictionary_value		\N	3.5.3	data	\N	2827334950
6	roman.batygin@mail.ru	db/changelog/000000000017.xml	2019-07-11 13:42:18.530526	59	EXECUTED	8:04acb947037428b06155c8841d895d4e	delete tableName=filter_field		\N	3.5.3	data	\N	2827334950
2	roman.batygin@mail.ru	db/changelog/000000000018.xml	2019-07-11 13:42:19.116505	65	EXECUTED	8:7fcfac15e3965afe5cc1a0542aecd8dd	update tableName=filter_dictionary_value		\N	3.5.3	data	\N	2827334950
1	roman.batygin@mail.ru	db/changelog/000000000020.xml	2019-08-06 13:37:31.689219	68	EXECUTED	8:ccf505e1038412f151c95ecefedb30be	insert tableName=global_filter_field		\N	3.7.0	data	\N	5073451501
2	roman.batygin@mail.ru	db/changelog/000000000020.xml	2019-08-06 13:37:31.727966	69	EXECUTED	8:9ffc6c7350f166391032edd2ed9dee99	insert tableName=global_filter_field		\N	3.7.0	data	\N	5073451501
3	roman.batygin@mail.ru	db/changelog/000000000020.xml	2019-08-06 13:37:31.740309	70	EXECUTED	8:8c9ad521cc4bba97bba748d9b90809a0	insert tableName=global_filter_field		\N	3.7.0	data	\N	5073451501
4	roman.batygin@mail.ru	db/changelog/000000000020.xml	2019-08-06 13:37:31.756164	71	EXECUTED	8:18a203a01c23a29b2dc1a2eb6b361e44	insert tableName=global_filter_field		\N	3.7.0	data	\N	5073451501
5	roman.batygin@mail.ru	db/changelog/000000000020.xml	2019-08-06 13:37:31.775742	72	EXECUTED	8:71e63695cc4464c3799fbd9d4d413f48	insert tableName=global_filter_field		\N	3.7.0	data	\N	5073451501
6	roman.batygin@mail.ru	db/changelog/000000000020.xml	2019-08-06 13:37:31.827379	73	EXECUTED	8:f0255c264160a77d6ffc6a70ff27fe11	insert tableName=global_filter_field		\N	3.7.0	data	\N	5073451501
7	roman.batygin@mail.ru	db/changelog/000000000020.xml	2019-08-06 13:37:31.844358	74	EXECUTED	8:2289ce5093ba1e5eaf3f991e9d26e34e	insert tableName=global_filter_field		\N	3.7.0	data	\N	5073451501
1	roman.batygin@mail.ru	db/changelog/v25-drop-evaluation-options-table.xml	2021-02-16 19:37:12.247852	94	EXECUTED	8:baa91180b906c20222db49d0686d785e	addColumn tableName=evaluation_log		\N	3.7.0	schema	\N	3479031894
2	roman.batygin@mail.ru	db/changelog/v25-drop-evaluation-options-table.xml	2021-02-16 19:37:12.278549	95	EXECUTED	8:f2963aa57c4ffd8e30b10e150f9e3b2d	addColumn tableName=evaluation_log		\N	3.7.0	schema	\N	3479031894
3	roman.batygin@mail.ru	db/changelog/v25-drop-evaluation-options-table.xml	2021-02-16 19:37:12.305742	96	EXECUTED	8:211c9107f087aab465f3b503df8a44b2	addColumn tableName=evaluation_log		\N	3.7.0	schema	\N	3479031894
4	roman.batygin@mail.ru	db/changelog/v25-drop-evaluation-options-table.xml	2021-02-16 19:37:12.404761	97	EXECUTED	8:a19055fc0277c02f699c70087f42065f	sqlFile		\N	3.7.0	\N	\N	3479031894
5	roman.batygin@mail.ru	db/changelog/v25-drop-evaluation-options-table.xml	2021-02-16 19:37:12.420748	98	EXECUTED	8:179dd85c3344c375570cf77fc60b538f	dropTable tableName=evaluation_options		\N	3.7.0	schema	\N	3479031894
1	roman.batygin@mail.ru	db/changelog/v26-add-experiment-cross-validation-fields.xml	2021-02-16 19:37:12.43621	99	EXECUTED	8:6591890d7726015223eb841810c53c91	addColumn tableName=experiment		\N	3.7.0	schema	\N	3479031894
2	roman.batygin@mail.ru	db/changelog/v26-add-experiment-cross-validation-fields.xml	2021-02-16 19:37:12.455232	100	EXECUTED	8:537af2eca83741ce21b3c31d971ef7c2	addColumn tableName=experiment		\N	3.7.0	schema	\N	3479031894
3	roman.batygin@mail.ru	db/changelog/v26-add-experiment-cross-validation-fields.xml	2021-02-16 19:37:12.476349	101	EXECUTED	8:8a9fb6b5055be8902281e72994f360e6	addColumn tableName=experiment		\N	3.7.0	schema	\N	3479031894
4	roman.batygin@mail.ru	db/changelog/v26-add-experiment-cross-validation-fields.xml	2021-02-16 19:37:12.488076	102	EXECUTED	8:e2e6bf819ae37827dead9dc09fb1aa2b	update tableName=experiment		\N	3.7.0	data	\N	3479031894
5	roman.batygin@mail.ru	db/changelog/v26-add-experiment-cross-validation-fields.xml	2021-02-16 19:37:12.50254	103	EXECUTED	8:2759415287db06c6ed10d1524203fba8	update tableName=experiment		\N	3.7.0	data	\N	3479031894
6	roman.batygin@mail.ru	db/changelog/v26-add-experiment-cross-validation-fields.xml	2021-02-16 19:37:12.532348	104	EXECUTED	8:cfa327ee7e21929a29b464b60da26a17	update tableName=experiment		\N	3.7.0	data	\N	3479031894
7	roman.batygin@mail.ru	db/changelog/v26-add-experiment-cross-validation-fields.xml	2021-02-16 19:37:12.543274	105	EXECUTED	8:94a137cb6258320f98c3b5a0635e1eb9	update tableName=experiment		\N	3.7.0	data	\N	3479031894
8	roman.batygin@mail.ru	db/changelog/v26-add-experiment-cross-validation-fields.xml	2021-02-16 19:37:12.561772	106	EXECUTED	8:1ba8fe79f771df567baff344c56c07b5	update tableName=evaluation_log		\N	3.7.0	data	\N	3479031894
9	roman.batygin@mail.ru	db/changelog/v26-add-experiment-cross-validation-fields.xml	2021-02-16 19:37:12.575928	107	EXECUTED	8:d7a87ad38cb4b0dc43fbbc494f32f75a	update tableName=evaluation_log		\N	3.7.0	data	\N	3479031894
1	roman.batygin@mail.ru	db/changelog/v27-rename-evaluation-log-fields.xml	2021-02-16 19:37:12.593791	108	EXECUTED	8:34847ec4c6aa079c6c417d77b3e77ee0	renameColumn newColumnName=request_status, oldColumnName=evaluation_status, tableName=evaluation_log		\N	3.7.0	schema	\N	3479031894
2	roman.batygin@mail.ru	db/changelog/v27-rename-evaluation-log-fields.xml	2021-02-16 19:37:12.614177	109	EXECUTED	8:abed61a0618bd136ffef30d5e9389472	update tableName=filter_field		\N	3.7.0	data	\N	3479031894
3	roman.batygin@mail.ru	db/changelog/v27-rename-evaluation-log-fields.xml	2021-02-16 19:37:12.643033	110	EXECUTED	8:e9e8a277edcb58041a1b62db5fa7c794	update tableName=global_filter_field		\N	3.7.0	data	\N	3479031894
1	roman.batygin@mail.ru	db/changelog/v28-rename-experiment-fields.xml	2021-02-16 19:37:12.671173	111	EXECUTED	8:5a60451b24ecf91edacfb6f4342385c0	renameColumn newColumnName=request_status, oldColumnName=experiment_status, tableName=experiment		\N	3.7.0	schema	\N	3479031894
2	roman.batygin@mail.ru	db/changelog/v28-rename-experiment-fields.xml	2021-02-16 19:37:12.699616	112	EXECUTED	8:78749a05f67f3e8d04ef33dc99e280a3	renameColumn newColumnName=request_id, oldColumnName=uuid, tableName=experiment		\N	3.7.0	schema	\N	3479031894
3	roman.batygin@mail.ru	db/changelog/v28-rename-experiment-fields.xml	2021-02-16 19:37:12.731068	113	EXECUTED	8:8b1e2968f44d6db63dedd09fa7d7c702	update tableName=filter_field		\N	3.7.0	data	\N	3479031894
4	roman.batygin@mail.ru	db/changelog/v28-rename-experiment-fields.xml	2021-02-16 19:37:12.755215	114	EXECUTED	8:ba8e3b62c6450dc02db217a1bb3b7bbd	update tableName=global_filter_field		\N	3.7.0	data	\N	3479031894
5	roman.batygin@mail.ru	db/changelog/v28-rename-experiment-fields.xml	2021-02-16 19:37:12.774859	115	EXECUTED	8:782421e3a640ebb526c6ebc129033ae9	update tableName=filter_field		\N	3.7.0	data	\N	3479031894
6	roman.batygin@mail.ru	db/changelog/v28-rename-experiment-fields.xml	2021-02-16 19:37:12.792312	116	EXECUTED	8:095b199e44d898f3bc5004e7c19e927c	update tableName=global_filter_field		\N	3.7.0	data	\N	3479031894
1	roman.batygin@mail.ru	db/changelog/v29-create-classifiers-configuration-table.xml	2021-02-16 19:37:12.832533	117	EXECUTED	8:f74fc81d7418dc260222de55899b6809	createTable tableName=classifiers_configuration		\N	3.7.0	schema	\N	3479031894
2	roman.batygin@mail.ru	db/changelog/v29-create-classifiers-configuration-table.xml	2021-02-16 19:37:12.840958	118	EXECUTED	8:27d74434eae3c976aa38a8a1f3976461	delete tableName=classifier_options		\N	3.7.0	schema	\N	3479031894
3	roman.batygin@mail.ru	db/changelog/v29-create-classifiers-configuration-table.xml	2021-02-16 19:37:12.853664	119	EXECUTED	8:b72cfa1554ba21b1622c247663205b56	dropColumn columnName=version, tableName=classifier_options		\N	3.7.0	schema	\N	3479031894
4	roman.batygin@mail.ru	db/changelog/v29-create-classifiers-configuration-table.xml	2021-02-16 19:37:12.875146	120	EXECUTED	8:95467230ec0dc1b7ee6abc57d2cb7237	addColumn tableName=classifier_options		\N	3.7.0	schema	\N	3479031894
1	roman.batygin@mail.ru	db/changelog/v30-add-classifiers-configuration-global-filter-fields.xml	2021-02-16 19:37:12.899534	121	EXECUTED	8:0df4e24791b98208835ab407a6dedc7d	insert tableName=global_filter_template		\N	3.7.0	data	\N	3479031894
2	roman.batygin@mail.ru	db/changelog/v30-add-classifiers-configuration-global-filter-fields.xml	2021-02-16 19:37:12.909003	122	EXECUTED	8:5d56510952bee49c8ad96965fa109aea	insert tableName=global_filter_field		\N	3.7.0	data	\N	3479031894
1	roman.batygin@mail.ru	db/changelog/v31-drop-email-request-table.xml	2021-02-16 19:37:12.918272	123	EXECUTED	8:33c5a4c999ec460b79b143c42dfd2f92	dropTable tableName=email_request		\N	3.7.0	schema	\N	3479031894
1	roman.batygin@mail.ru	db/changelog/v32-delete-ers-response-statuses.xml	2021-02-16 19:37:12.933685	124	EXECUTED	8:a8882c76f7ef8b05145917b6b84c474a	delete tableName=filter_dictionary_value		\N	3.7.0	data	\N	3479031894
2	roman.batygin@mail.ru	db/changelog/v32-delete-ers-response-statuses.xml	2021-02-16 19:37:12.941326	125	EXECUTED	8:33f982a04ff01e91abe427c4791dfff4	delete tableName=filter_dictionary_value		\N	3.7.0	data	\N	3479031894
1	roman.batygin@mail.ru	db/changelog/v33-add-classifiers-configuration-created-by-column.xml	2021-02-16 19:37:12.949004	126	EXECUTED	8:2f9cb615a74f414bff0d7490ca82c7d6	renameColumn newColumnName=creation_date, oldColumnName=created, tableName=classifiers_configuration		\N	3.7.0	schema	\N	3479031894
2	roman.batygin@mail.ru	db/changelog/v33-add-classifiers-configuration-created-by-column.xml	2021-02-16 19:37:12.972631	127	EXECUTED	8:66cb78939155ef0c8c9a1dd4503b1cef	addColumn tableName=classifier_options		\N	3.7.0	schema	\N	3479031894
3	roman.batygin@mail.ru	db/changelog/v33-add-classifiers-configuration-created-by-column.xml	2021-02-16 19:37:12.983327	128	EXECUTED	8:1f93e9814375a943b477f28ecb3ecd68	addColumn tableName=classifiers_configuration		\N	3.7.0	schema	\N	3479031894
1	roman.batygin@mail.ru	db/changelog/v34-add-classifiers-configuration-created-by-global-filter.xml	2021-02-16 19:37:12.990905	129	EXECUTED	8:38aacc7a83e02e62b423e332d5f22832	insert tableName=global_filter_field		\N	3.7.0	data	\N	3479031894
1	roman.batygin@mail.ru	db/changelog/v35-create-lock-table.xml	2021-02-16 19:37:13.030124	130	EXECUTED	8:d577b56d1c7a5547de45986d2ddfb20f	createTable tableName=lock; addUniqueConstraint constraintName=lock_name_key_unique_idx, tableName=lock		\N	3.7.0	schema	\N	3479031894
1	roman.batygin@mail.ru	db/changelog/v36-create-app-instance-table.xml	2021-02-16 19:37:13.051139	131	EXECUTED	8:c5915718d4e1628705991c28d6e70acb	createTable tableName=app_instance; addUniqueConstraint constraintName=instance_name_unique_idx, tableName=app_instance		\N	3.7.0	schema	\N	3479031894
2	roman.batygin@mail.ru	db/changelog/v36-create-app-instance-table.xml	2021-02-16 19:37:13.067611	132	EXECUTED	8:e5d52f2912fddbcca11b8808f0500ee7	addColumn tableName=experiment		\N	3.7.0	schema	\N	3479031894
4	roman.batygin@mail.ru	db/changelog/v36-create-app-instance-table.xml	2021-02-16 19:37:13.101726	134	EXECUTED	8:8cfae3cd1f628fac0442ac47ee2b9905	addColumn tableName=classifier_options_request_model		\N	3.7.0	schema	\N	3479031894
1	roman.batygin@mail.ru	db/changelog/v37-create-experiment-progress-table.xml	2021-02-16 19:37:13.133985	135	EXECUTED	8:480d8281b39e68330d07645e88ccc87e	createTable tableName=experiment_progress		\N	3.7.0	schema	\N	3479031894
1	roman.batygin@mail.ru	db/changelog/v38-add-experiment-class-index-column.xml	2021-02-16 19:37:13.146435	136	EXECUTED	8:2aa8739188df16d3fe7e941a1bf0ffc5	addColumn tableName=experiment		\N	3.7.0	schema	\N	3479031894
1	roman.batygin@mail.ru	db/changelog/v39-insert-in-progress-request-status.xml	2021-02-16 19:37:13.167055	137	EXECUTED	8:76957cf69d0b52997e6a85278b773061	insert tableName=filter_dictionary_value		\N	3.7.0	data	\N	3479031894
2	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.238523	138	EXECUTED	8:ce3cee988923dcfb6b72a043f93532cc	addNotNullConstraint columnName=classifier_name, tableName=classifier_info		\N	3.7.0	schema	\N	7867667823
3	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.262091	139	EXECUTED	8:8ca7bb42cc8303ac1d3a7da038b7da15	addNotNullConstraint columnName=option_name, tableName=classifier_input_options		\N	3.7.0	schema	\N	7867667823
4	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.273642	140	EXECUTED	8:2cc32811b7a507f670a1998585b9f58b	addNotNullConstraint columnName=option_order, tableName=classifier_input_options		\N	3.7.0	schema	\N	7867667823
5	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.298958	141	EXECUTED	8:c784cd6ffbf8e90eb8f5ff69b16b3347	addNotNullConstraint columnName=configuration_name, tableName=classifiers_configuration		\N	3.7.0	schema	\N	7867667823
6	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.315393	142	EXECUTED	8:4e8041fa46650085f54ed365b9e18e30	addNotNullConstraint columnName=creation_date, tableName=classifiers_configuration		\N	3.7.0	schema	\N	7867667823
7	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.326958	143	EXECUTED	8:44fe7014bc8ad8c902b6cc207cce9e5f	addNotNullConstraint columnName=options_name, tableName=classifier_options		\N	3.7.0	schema	\N	7867667823
8	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.348211	144	EXECUTED	8:9f5d9fd00c4200d8b51ac420e8faa613	addNotNullConstraint columnName=config, tableName=classifier_options		\N	3.7.0	schema	\N	7867667823
9	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.367598	145	EXECUTED	8:554a81aeed16a2655e7617a5542a3f8a	addNotNullConstraint columnName=config_md5_hash, tableName=classifier_options		\N	3.7.0	schema	\N	7867667823
10	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.378022	146	EXECUTED	8:ea9e4dfaf6c7ac0f589d0af5dfe20e8f	addNotNullConstraint columnName=creation_date, tableName=classifier_options		\N	3.7.0	schema	\N	7867667823
11	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.390595	147	EXECUTED	8:779afc17e73e51296691830cc728c625	addNotNullConstraint columnName=relation_name, tableName=instances_info		\N	3.7.0	schema	\N	7867667823
12	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.402117	148	EXECUTED	8:066bd4ef0543d2f4ec43933cace683fb	addNotNullConstraint columnName=num_instances, tableName=instances_info		\N	3.7.0	schema	\N	7867667823
13	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.409852	149	EXECUTED	8:0402fe9d72144c8798a1752ceec14adf	addNotNullConstraint columnName=num_attributes, tableName=instances_info		\N	3.7.0	schema	\N	7867667823
14	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.426169	150	EXECUTED	8:3f28827378dbf3355580fe9590d7cc0b	addNotNullConstraint columnName=num_classes, tableName=instances_info		\N	3.7.0	schema	\N	7867667823
15	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.439942	151	EXECUTED	8:b821287c8537f92a10dc5d692eeb38f6	addNotNullConstraint columnName=class_name, tableName=instances_info		\N	3.7.0	schema	\N	7867667823
16	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.453442	152	EXECUTED	8:d956b6c37fe96f949529201c9440d122	addNotNullConstraint columnName=filter_name, tableName=global_filter_template		\N	3.7.0	schema	\N	7867667823
17	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.472999	153	EXECUTED	8:b9bb9bb3bb622c4891b1ef725574ad3e	addNotNullConstraint columnName=template_type, tableName=global_filter_template		\N	3.7.0	schema	\N	7867667823
18	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.481839	154	EXECUTED	8:d7892635f243856d4c9eef74a92da0d5	addNotNullConstraint columnName=field_name, tableName=global_filter_field		\N	3.7.0	schema	\N	7867667823
19	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.500267	155	EXECUTED	8:ec49b1dab71d60809abf1db151e28ac9	addNotNullConstraint columnName=template_type, tableName=filter_template		\N	3.7.0	schema	\N	7867667823
20	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.513057	156	EXECUTED	8:8e55803d40801e80479074936669ce35	addNotNullConstraint columnName=template_name, tableName=filter_template		\N	3.7.0	schema	\N	7867667823
21	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.521649	157	EXECUTED	8:170fb77a300c17f09df4a99e69737661	addNotNullConstraint columnName=created, tableName=filter_template		\N	3.7.0	schema	\N	7867667823
22	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.536792	158	EXECUTED	8:36648a2c13ee2819309d7065eda5dedd	addNotNullConstraint columnName=name, tableName=filter_dictionary		\N	3.7.0	schema	\N	7867667823
23	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.554663	159	EXECUTED	8:0c4da96cae90838262077df0c88e28e5	addNotNullConstraint columnName=label, tableName=filter_dictionary_value		\N	3.7.0	schema	\N	7867667823
24	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.563572	160	EXECUTED	8:de52521365c97a66a6ca4ef487734d62	addNotNullConstraint columnName=value, tableName=filter_dictionary_value		\N	3.7.0	schema	\N	7867667823
25	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.582548	161	EXECUTED	8:ccbe34ea217dff699560dab8b7890fd4	addNotNullConstraint columnName=field_name, tableName=filter_field		\N	3.7.0	schema	\N	7867667823
26	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.589998	162	EXECUTED	8:68bf20e6c637fbb1732c412c7efa3832	addNotNullConstraint columnName=description, tableName=filter_field		\N	3.7.0	schema	\N	7867667823
27	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.600956	163	EXECUTED	8:b5663fa463100f171256b986f206d1a2	addNotNullConstraint columnName=filter_field_type, tableName=filter_field		\N	3.7.0	schema	\N	7867667823
28	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.612294	164	EXECUTED	8:f33aa834b0a26e3e0906885a1d2490ce	addNotNullConstraint columnName=match_mode, tableName=filter_field		\N	3.7.0	schema	\N	7867667823
29	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.621209	165	EXECUTED	8:17a4b37127ab680cbcf2871dab7ba511	addNotNullConstraint columnName=request_id, tableName=evaluation_log		\N	3.7.0	schema	\N	7867667823
30	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.63252	166	EXECUTED	8:82e276ad515c20eebdf40c18f812222e	addNotNullConstraint columnName=creation_date, tableName=evaluation_log		\N	3.7.0	schema	\N	7867667823
31	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.645091	167	EXECUTED	8:a21b5657a25ff4b52cac8d963e29ada5	addNotNullConstraint columnName=request_status, tableName=evaluation_log		\N	3.7.0	schema	\N	7867667823
32	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.657803	168	EXECUTED	8:217896eeed5e07522bd3d58655bcdd03	addNotNullConstraint columnName=evaluation_method, tableName=evaluation_log		\N	3.7.0	schema	\N	7867667823
33	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.668711	169	EXECUTED	8:551c40995254a0d060585e99e1234a65	addNotNullConstraint columnName=instances_info_id, tableName=evaluation_log		\N	3.7.0	schema	\N	7867667823
34	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.683085	170	EXECUTED	8:575e4ad537f61c104ff9b149b3c465a6	addNotNullConstraint columnName=classifier_info_id, tableName=evaluation_log		\N	3.7.0	schema	\N	7867667823
35	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.697592	171	EXECUTED	8:5b515bf4663d246531eb337f7a2c11b0	addNotNullConstraint columnName=request_id, tableName=experiment		\N	3.7.0	schema	\N	7867667823
36	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.721066	172	EXECUTED	8:782ba962bad7abf0c2f7247b0c20d91f	addNotNullConstraint columnName=creation_date, tableName=experiment		\N	3.7.0	schema	\N	7867667823
37	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.737099	173	EXECUTED	8:205683f275fd45b53b92fb497e07cfa3	addNotNullConstraint columnName=request_status, tableName=experiment		\N	3.7.0	schema	\N	7867667823
38	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.748797	174	EXECUTED	8:24a7ff1c98897694036f590677046853	addNotNullConstraint columnName=evaluation_method, tableName=experiment		\N	3.7.0	schema	\N	7867667823
39	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.761904	175	EXECUTED	8:f11a9cfbc17fcb9f509f3bca42db8d53	addNotNullConstraint columnName=experiment_type, tableName=experiment		\N	3.7.0	schema	\N	7867667823
40	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.779176	176	EXECUTED	8:e30e1b985e0701e09d14ae9a6f7d6e9a	addNotNullConstraint columnName=first_name, tableName=experiment		\N	3.7.0	schema	\N	7867667823
41	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.793267	177	EXECUTED	8:93c72dfc4e87ec728dac7bb23f5bb257	addNotNullConstraint columnName=email, tableName=experiment		\N	3.7.0	schema	\N	7867667823
42	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.802071	178	EXECUTED	8:0f6d7dc4404b25cbe5c0c0b25c8a0398	addNotNullConstraint columnName=results_index, tableName=experiment_results		\N	3.7.0	schema	\N	7867667823
43	roman.batygin@email.ru	db/changelog/v40-add-not-null-constraints.xml	2021-04-08 14:41:08.818081	179	EXECUTED	8:ef3cf2f52c34e022082fc8a7df0400e8	addNotNullConstraint columnName=classifier_info_id, tableName=experiment_results		\N	3.7.0	schema	\N	7867667823
1	roman.batygin@mail.ru	db/changelog/v41-drop-lock-table.xml	2021-12-02 13:19:15.139307	180	EXECUTED	8:77aaf109680588ebaf38ac8b220cc3a4	dropTable tableName=lock		\N	3.7.0	schema	\N	8425954716
create_audit_group_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2021-12-02 13:19:15.21084	181	EXECUTED	8:112e0769f50b6016ed2ef835793f4bf0	createTable tableName=audit_group		\N	3.7.0	schema	\N	8425954716
create_audit_code_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2021-12-02 13:19:15.257647	182	EXECUTED	8:904288ce7cefab647509b310c5715a82	createTable tableName=audit_code		\N	3.7.0	schema	\N	8425954716
create_audit_event_template_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2021-12-02 13:19:15.296333	183	EXECUTED	8:f44dbaff8192c97b691c220bf0fa9181	createTable tableName=audit_event_template		\N	3.7.0	schema	\N	8425954716
add_audit_event_template_code_id_event_type_unique_index	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2021-12-02 13:19:15.306407	184	EXECUTED	8:70743a754f4bb16fff3ecd33d25acae3	addUniqueConstraint constraintName=audit_event_template_code_id_event_type_unique_index, tableName=audit_event_template		\N	3.7.0	schema	\N	8425954716
create_audit_event_request_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2021-12-02 13:19:15.354325	185	EXECUTED	8:950918154a4b4a51c4549de8ec9f8427	createTable tableName=audit_event_request		\N	3.7.0	schema	\N	8425954716
insert_audit_groups_1	roman.batygin@mail.ru	db/changelog/v42-insert-audit-codes-and-events.xml	2021-12-02 13:19:16.23602	186	EXECUTED	8:2ed9eb377410f470c656052cb235e5ad	loadUpdateData tableName=audit_group		\N	3.7.0	data	\N	8425954716
insert_audit_codes_1	roman.batygin@mail.ru	db/changelog/v42-insert-audit-codes-and-events.xml	2021-12-02 13:19:17.095463	187	EXECUTED	8:190b8e512c22aa1c206378ac15ec69fe	loadUpdateData tableName=audit_code		\N	3.7.0	data	\N	8425954716
insert_audit_event_templates_2	roman.batygin@mail.ru	db/changelog/v42-insert-audit-codes-and-events.xml	2021-12-02 13:19:17.960676	188	EXECUTED	8:d05835e2eb48cdef40d219c3653394f2	loadUpdateData tableName=audit_event_template		\N	3.7.0	data	\N	8425954716
create_global_filter_template	roman.batygin@mail.ru	classpath:db/../filter-template-changelog.xml	2021-12-02 13:19:17.981388	189	MARK_RAN	8:cda8ce64a6a0ed0b153fc32329a6bbc6	createTable tableName=global_filter_template		\N	3.7.0	schema	\N	8425954716
create_global_filter_field	roman.batygin@mail.ru	classpath:db/../filter-template-changelog.xml	2021-12-02 13:19:17.987757	190	MARK_RAN	8:208fa1a1dea8d771abc9ff8cbadf633a	createTable tableName=global_filter_field		\N	3.7.0	schema	\N	8425954716
create_filter_template	roman.batygin@mail.ru	classpath:db/../filter-template-changelog.xml	2021-12-02 13:19:17.997428	191	MARK_RAN	8:eef92c0687a1a6dd158fd71ff3837ce3	createTable tableName=filter_template		\N	3.7.0	schema	\N	8425954716
create_filter_dictionary	roman.batygin@mail.ru	classpath:db/../filter-template-changelog.xml	2021-12-02 13:19:18.003232	192	MARK_RAN	8:c70f4717adc271d0d4c4c6d6450884e8	createTable tableName=filter_dictionary		\N	3.7.0	schema	\N	8425954716
create_filter_field	roman.batygin@mail.ru	classpath:db/../filter-template-changelog.xml	2021-12-02 13:19:18.020881	193	MARK_RAN	8:3b2b63d3773cd2af170a833724b21ca6	createTable tableName=filter_field		\N	3.7.0	schema	\N	8425954716
create_filter_dictionary_value	roman.batygin@mail.ru	classpath:db/../filter-template-changelog.xml	2021-12-02 13:19:18.040314	194	MARK_RAN	8:d6f60bac76ab39d3dd5dbb02834e7cb3	createTable tableName=filter_dictionary_value		\N	3.7.0	schema	\N	8425954716
1	roman.batygin@mail.ru	db/changelog/v43-add-classifiers-configuration-id-global-filter.xml	2021-12-02 13:19:18.049042	195	EXECUTED	8:9fd75667c956f6290478fd54f526041c	insert tableName=global_filter_field		\N	3.7.0	data	\N	8425954716
1	roman.batygin@mail.ru	db/changelog/v44-drop-app-instance-table.xml	2021-12-02 13:19:18.07572	196	EXECUTED	8:4c155a39881839257fcc33e45f0b888f	dropColumn columnName=app_instance_id, tableName=evaluation_log		\N	3.7.0	schema	\N	8425954716
2	roman.batygin@mail.ru	db/changelog/v44-drop-app-instance-table.xml	2021-12-02 13:19:18.096157	197	EXECUTED	8:7b855592f56d3668795cc52e5918c877	dropColumn columnName=app_instance_id, tableName=experiment		\N	3.7.0	schema	\N	8425954716
3	roman.batygin@mail.ru	db/changelog/v44-drop-app-instance-table.xml	2021-12-02 13:19:18.103826	198	EXECUTED	8:f40aaf29143b923e0fe3a1a41efeb3e8	dropColumn columnName=app_instance_id, tableName=classifier_options_request_model		\N	3.7.0	schema	\N	8425954716
4	roman.batygin@mail.ru	db/changelog/v44-drop-app-instance-table.xml	2021-12-02 13:19:18.111926	199	EXECUTED	8:245348623bed4119c5384dbf5202f945	dropTable tableName=app_instance		\N	3.7.0	schema	\N	8425954716
1	roman.batygin@mail.ru	db/changelog/v45-add-channel-type-column.xml	2021-12-02 13:19:18.132327	200	EXECUTED	8:ce9853410a4d20b8ca76aec6e9f946be	addColumn tableName=experiment; addNotNullConstraint columnName=channel_type, tableName=experiment		\N	3.7.0	schema	\N	8425954716
2	roman.batygin@mail.ru	db/changelog/v45-add-channel-type-column.xml	2021-12-02 13:19:18.141019	201	EXECUTED	8:70c1df88973008fda6e9fee60b9e8e3d	addColumn tableName=experiment		\N	3.7.0	schema	\N	8425954716
3	roman.batygin@mail.ru	db/changelog/v45-add-channel-type-column.xml	2021-12-02 13:19:18.154002	202	EXECUTED	8:75aa74bc4f3c947ce71553836108e0b5	addColumn tableName=experiment		\N	3.7.0	schema	\N	8425954716
create_email_request_table	roman.batygin@mail.ru	classpath:db/../mail-client-changelog.xml	2021-12-02 13:19:18.181637	203	EXECUTED	8:e24d5e5a0e951172d40d18fbf6f09f33	createTable tableName=email_request		\N	3.7.0	schema	\N	8425954716
add_tx_id_column_to_email_request_table	roman.batygin@mail.ru	classpath:db/../mail-client-changelog.xml	2021-12-02 13:19:18.190309	204	EXECUTED	8:9706f6c02927601dd101b526befee487	addColumn tableName=email_request		\N	3.7.0	schema	\N	8425954716
1	roman.batygin@mail.ru	db/changelog/v46-drop-experiment-sent-date-column.xml	2021-12-02 13:19:18.203369	205	EXECUTED	8:ade9affe2ece46ec224bf44a875a9004	dropColumn columnName=sent_date, tableName=experiment		\N	3.7.0	schema	\N	8425954716
2	roman.batygin@mail.ru	db/changelog/v46-drop-experiment-sent-date-column.xml	2021-12-02 13:19:18.21029	206	EXECUTED	8:ec0ed97f69f0a4bfbf4a306e0acfc876	delete tableName=filter_field		\N	3.7.0	data	\N	8425954716
1	roman.batygin@mail.ru	db/changelog/v47-create-ers-retry-request-table.xml	2021-12-02 13:19:18.234759	207	EXECUTED	8:35caedcc60737642f6a027ec0e616b5a	createTable tableName=ers_retry_request		\N	3.7.0	schema	\N	8425954716
add_correlation_id_column_in_audit_event_request_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2022-12-09 13:05:18.604562	208	EXECUTED	8:9dc73daf828a4cdf30ed23fd5899321d	addColumn tableName=audit_event_request		\N	3.7.0	schema	\N	0565918001
drop_audit_event_request_table	roman.batygin@mail.ru	classpath:db/../audit-changelog.xml	2022-12-09 13:05:18.63268	209	EXECUTED	8:9e3dfc52bdb8f4eac4a39d460d561000	dropTable tableName=audit_event_request		\N	3.7.0	schema	\N	0565918001
create_retry_request_table	roman.batygin@mail.ru	classpath:db/../redelivery-changelog.xml	2022-12-09 13:05:18.689935	210	EXECUTED	8:f83ceeb7d4537c55a66b655ec31e6bb8	createTable tableName=retry_request		\N	3.7.0	schema	\N	0565918001
add_retry_at_column_in_retry_request_table	roman.batygin@mail.ru	classpath:db/../redelivery-changelog.xml	2022-12-09 13:05:18.712115	211	EXECUTED	8:5e9a79b47863935b83b6d3a644b656b8	addColumn tableName=retry_request		\N	3.7.0	schema	\N	0565918001
insert_audit_groups_2	roman.batygin@mail.ru	db/changelog/v42-insert-audit-codes-and-events.xml	2022-12-09 13:05:19.75792	212	EXECUTED	8:fcf2ebe1e707973261dbdd4cf7ec7744	loadUpdateData tableName=audit_group		\N	3.7.0	data	\N	0565918001
insert_audit_codes_3	roman.batygin@mail.ru	db/changelog/v42-insert-audit-codes-and-events.xml	2022-12-09 13:05:20.595497	213	EXECUTED	8:477d275b5256d02690950ca45d8f0839	loadUpdateData tableName=audit_code		\N	3.7.0	data	\N	0565918001
insert_audit_event_templates_7	roman.batygin@mail.ru	db/changelog/v42-insert-audit-codes-and-events.xml	2022-12-09 13:05:21.298943	214	EXECUTED	8:e82a2d757414dd11c3588c3544160d7a	loadUpdateData tableName=audit_event_template		\N	3.7.0	data	\N	0565918001
drop_email_request_table	roman.batygin@mail.ru	classpath:db/../mail-client-changelog.xml	2022-12-09 13:05:21.325345	215	EXECUTED	8:33c5a4c999ec460b79b143c42dfd2f92	dropTable tableName=email_request		\N	3.7.0	schema	\N	0565918001
1	roman.batygin@mail.ru	db/changelog/v48-drop-ers-retry-request-table.xml	2022-12-09 13:05:21.338835	216	EXECUTED	8:1abda24ab898fdc2a46dee5723b5632b	dropTable tableName=ers_retry_request		\N	3.7.0	schema	\N	0565918001
1	roman.batygin@mail.ru	db/changelog/v49-add-request-id-unique-idx.xml	2022-12-09 13:05:21.355531	217	EXECUTED	8:5e00c1c8f334e570db4764bee8358cd4	addNotNullConstraint columnName=request_id, tableName=ers_request		\N	3.7.0	schema	\N	0565918001
2	roman.batygin@mail.ru	db/changelog/v49-add-request-id-unique-idx.xml	2022-12-09 13:05:21.394997	218	EXECUTED	8:f72cbb9c96759bbb2236adcbeb222b63	addUniqueConstraint constraintName=ers_request_id_unique_idx, tableName=ers_request		\N	3.7.0	schema	\N	0565918001
3	roman.batygin@mail.ru	db/changelog/v49-add-request-id-unique-idx.xml	2022-12-09 13:05:21.407008	219	EXECUTED	8:733356c0e31f5ab05101178bdff011e6	addNotNullConstraint columnName=response_status, tableName=ers_request		\N	3.7.0	schema	\N	0565918001
4	roman.batygin@mail.ru	db/changelog/v49-add-request-id-unique-idx.xml	2022-12-09 13:05:21.419277	220	EXECUTED	8:6ffe59320ec0da0340f59ea0ce998f67	addUniqueConstraint constraintName=evaluation_log_request_id_unique_idx, tableName=evaluation_log		\N	3.7.0	schema	\N	0565918001
5	roman.batygin@mail.ru	db/changelog/v49-add-request-id-unique-idx.xml	2022-12-09 13:05:21.430764	221	EXECUTED	8:b89efa1463f569a41bf5dd0e503bf60e	addUniqueConstraint constraintName=experiment_results_request_experiment_results_id_unique_idx, tableName=experiment_results_request		\N	3.7.0	schema	\N	0565918001
6	roman.batygin@mail.ru	db/changelog/v49-add-request-id-unique-idx.xml	2022-12-09 13:05:21.441376	222	EXECUTED	8:a11416e915dd8aeda77b9c3806413b1b	addUniqueConstraint constraintName=evaluation_results_request_evaluation_log_id_unique_idx, tableName=evaluation_results_request		\N	3.7.0	schema	\N	0565918001
create_form_templates_group	roman.batygin@mail.ru	classpath:db/../form-template-changelog.xml	2022-12-09 13:05:21.467307	223	EXECUTED	8:ee9e27e1c05c092bace5a3c98f7525fa	createTable tableName=form_template_group		\N	3.7.0	schema	\N	0565918001
add_form_template_group_name_unique_index	roman.batygin@mail.ru	classpath:db/../form-template-changelog.xml	2022-12-09 13:05:21.483221	224	EXECUTED	8:8d17b3a2c929db877bb81c7c431e2ccc	addUniqueConstraint constraintName=form_template_group_name_unique_idx, tableName=form_template_group		\N	3.7.0	schema	\N	0565918001
create_form_template	roman.batygin@mail.ru	classpath:db/../form-template-changelog.xml	2022-12-09 13:05:21.512949	225	EXECUTED	8:457b3f05a8e8d85e334d6672cb5f173b	createTable tableName=form_template		\N	3.7.0	schema	\N	0565918001
add_form_template_name_unique_index	roman.batygin@mail.ru	classpath:db/../form-template-changelog.xml	2022-12-09 13:05:21.528163	226	EXECUTED	8:ccd41908c89571021aa6fa91a43fb07a	addUniqueConstraint constraintName=form_template_name_unique_idx, tableName=form_template		\N	3.7.0	schema	\N	0565918001
create_form_field_dictionary	roman.batygin@mail.ru	classpath:db/../form-template-changelog.xml	2022-12-09 13:05:21.545457	227	EXECUTED	8:495c94a4402a6771eb2f9735f0b6b72b	createTable tableName=form_field_dictionary		\N	3.7.0	schema	\N	0565918001
create_form_field	roman.batygin@mail.ru	classpath:db/../form-template-changelog.xml	2022-12-09 13:05:21.568666	228	EXECUTED	8:104743947c60a071c0111318a9fc978a	createTable tableName=form_field		\N	3.7.0	schema	\N	0565918001
add_form_field_name_template_id_unique_index	roman.batygin@mail.ru	classpath:db/../form-template-changelog.xml	2022-12-09 13:05:21.580402	229	EXECUTED	8:be6f082666ad5eb52274e0fc39c26c0d	addUniqueConstraint constraintName=form_field_name_template_id_unique_idx, tableName=form_field		\N	3.7.0	schema	\N	0565918001
create_form_field_dictionary_value	roman.batygin@mail.ru	classpath:db/../form-template-changelog.xml	2022-12-09 13:05:21.603787	230	EXECUTED	8:73fd4128e35de24596823d8260f0fcf0	createTable tableName=form_field_dictionary_value		\N	3.7.0	schema	\N	0565918001
add_form_field_dictionary_value_dictionary_id_unique_index	roman.batygin@mail.ru	classpath:db/../form-template-changelog.xml	2022-12-09 13:05:21.617085	231	EXECUTED	8:d6776dfeaeeea8fdedc6677d2d020651	addUniqueConstraint constraintName=form_field_dictionary_value_dictionary_id_unique_idx, tableName=form_field_dictionary_value		\N	3.7.0	schema	\N	0565918001
add_form_field_read_only_column	roman.batygin@mail.ru	classpath:db/../form-template-changelog.xml	2022-12-09 13:05:21.632967	232	EXECUTED	8:9e40303eff92086654f1e790639e99d1	addColumn tableName=form_field		\N	3.7.0	schema	\N	0565918001
insert_classifier_form_templates_group_2	roman.batygin@mail.ru	db/changelog/v50-insert-classifier-form-templates.xml	2022-12-09 13:05:22.542947	233	EXECUTED	8:eb2022b4b0f31f29f335ae4f662e9f81	loadUpdateData tableName=form_template_group		\N	3.7.0	data	\N	0565918001
insert_classifier_form_templates_2	roman.batygin@mail.ru	db/changelog/v50-insert-classifier-form-templates.xml	2022-12-09 13:05:23.442948	234	EXECUTED	8:6267e46a412604c88e5eab25d9af1a5e	loadUpdateData tableName=form_template		\N	3.7.0	data	\N	0565918001
insert_classifier_form_field_dictionaries_2	roman.batygin@mail.ru	db/changelog/v50-insert-classifier-form-templates.xml	2022-12-09 13:05:24.21047	235	EXECUTED	8:b563f684f862c8f62156c7da4be05e77	loadUpdateData tableName=form_field_dictionary		\N	3.7.0	data	\N	0565918001
insert_classifier_form_field_dictionaries_values_2	roman.batygin@mail.ru	db/changelog/v50-insert-classifier-form-templates.xml	2022-12-09 13:05:24.985309	236	EXECUTED	8:2a0b6f1ec97013ee7f5adc360b46e133	loadUpdateData tableName=form_field_dictionary_value		\N	3.7.0	data	\N	0565918001
insert_classifiers_form_fields_5	roman.batygin@mail.ru	db/changelog/v50-insert-classifier-form-templates.xml	2022-12-09 13:05:25.87676	237	EXECUTED	8:13739d009d10a579d3c6cd40a1f50db6	loadUpdateData tableName=form_field		\N	3.7.0	data	\N	0565918001
1	roman.batygin@mail.ru	db/changelog/v51-add-classifier-options-column.xml	2022-12-09 13:05:25.894624	238	EXECUTED	8:3cdb10392a0499ce38705f753b24e2d2	addColumn tableName=classifier_info		\N	3.7.0	schema	\N	0565918001
1	roman.batygin@mail.ru	db/changelog/v52-insert-classifiers-filter-dictionary.xml	2022-12-09 13:05:25.922847	239	EXECUTED	8:bccf658be4de9285e500e866335493f5	insert tableName=filter_dictionary; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; i...		\N	3.7.0	data	\N	0565918001
2	roman.batygin@mail.ru	db/changelog/v52-insert-classifiers-filter-dictionary.xml	2022-12-09 13:05:25.932493	240	EXECUTED	8:bf210e4aa2c4698c34f5d7e29a812288	update tableName=filter_field		\N	3.7.0	data	\N	0565918001
create-classifiers-configuration-history-table	roman.batygin@mail.ru	db/changelog/v53-create-classifiers-configuration-history-table.xml	2022-12-09 13:05:25.983048	241	EXECUTED	8:8b45ce29b8a2e253372d6839b4d1f46c	createTable tableName=classifiers_configuration_history		\N	3.7.0	schema	\N	0565918001
insert-classifiers-configuration-history-global-filter-template	roman.batygin@mail.ru	db/changelog/v54-add-classifiers-configuration-history-global-filter-fields.xml	2022-12-09 13:05:26.015754	242	EXECUTED	8:afaa60268777f79cf83bccd0adba606b	insert tableName=global_filter_template		\N	3.7.0	data	\N	0565918001
insert-action-type-filed-to-classifiers-configuration-history-global-filter-template	roman.batygin@mail.ru	db/changelog/v54-add-classifiers-configuration-history-global-filter-fields.xml	2022-12-09 13:05:26.048637	243	EXECUTED	8:dd2e5a74a079c9340504306ece583422	insert tableName=global_filter_field		\N	3.7.0	data	\N	0565918001
insert-message-text-filed-to-classifiers-configuration-history-global-filter-template	roman.batygin@mail.ru	db/changelog/v54-add-classifiers-configuration-history-global-filter-fields.xml	2022-12-09 13:05:26.074873	244	EXECUTED	8:a2f4806a5ed825ff3c75ac8aaaa01d72	insert tableName=global_filter_field		\N	3.7.0	data	\N	0565918001
insert-created_by-filed-to-classifiers-configuration-history-global-filter-template	roman.batygin@mail.ru	db/changelog/v54-add-classifiers-configuration-history-global-filter-fields.xml	2022-12-09 13:05:26.081453	245	EXECUTED	8:701759bb6d3a1406bbd16354dd0e6cef	insert tableName=global_filter_field		\N	3.7.0	data	\N	0565918001
insert-classifiers-configuration-action-types-dictionary	roman.batygin@mail.ru	db/changelog/v55-insert-classifiers-configuration-history-filter-template.xml	2022-12-09 13:05:26.090661	246	EXECUTED	8:b2f976ea0bb41b7f7816263c8b9c7852	insert tableName=filter_dictionary; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; insert tableName=filter_dictionary_value; i...		\N	3.7.0	data	\N	0565918001
insert-classifiers-configuration-history-filter-template	roman.batygin@mail.ru	db/changelog/v55-insert-classifiers-configuration-history-filter-template.xml	2022-12-09 13:05:26.099729	247	EXECUTED	8:ff3b6c8a69eb6fec006976024bd9df8e	insert tableName=filter_template; insert tableName=filter_field; insert tableName=filter_field; insert tableName=filter_field		\N	3.7.0	data	\N	0565918001
create-message-template-table	roman.batygin@mail.ru	db/changelog/v56-create-message-template-table.xml	2022-12-09 13:05:26.145454	248	EXECUTED	8:c0c9cd75b7a98f468660b56da1abc084	createTable tableName=message_template		\N	3.7.0	schema	\N	0565918001
add-message-template-text-not-null-constraint	roman.batygin@mail.ru	db/changelog/v56-create-message-template-table.xml	2022-12-09 13:05:26.157254	249	EXECUTED	8:82c21b586a2c1613e25869894366b07c	addNotNullConstraint columnName=template_text, tableName=message_template		\N	3.7.0	schema	\N	0565918001
insert_message_templates_3	roman.batygin@mail.ru	db/changelog/v57-insert-message-templates.xml	2022-12-09 13:05:27.061741	250	EXECUTED	8:353f9c765c7de3f37587bda42b3254ea	loadUpdateData tableName=message_template		\N	3.7.0	data	\N	0565918001
add_experiment_download_url_column	roman.batygin@mail.ru	db/changelog/v58-add-experiment-download-url-column.xml	2022-12-09 13:05:27.074029	251	EXECUTED	8:ce76e829f826fc0f808ca9358c803911	addColumn tableName=experiment		\N	3.7.0	schema	\N	0565918001
drop_experiment_token_column	roman.batygin@mail.ru	db/changelog/v58-add-experiment-download-url-column.xml	2022-12-09 13:05:27.085224	252	EXECUTED	8:aed53e00645dbf3783b9968ad2803f27	dropColumn columnName=token, tableName=experiment		\N	3.7.0	schema	\N	0565918001
rename_experiment_absolute_path_column	roman.batygin@mail.ru	db/changelog/v58-add-experiment-download-url-column.xml	2022-12-09 13:05:27.097279	253	EXECUTED	8:b9921bcb0a86fe4bb849f8b0c4791d1c	renameColumn newColumnName=experiment_path, oldColumnName=experiment_absolute_path, tableName=experiment		\N	3.7.0	schema	\N	0565918001
rename_experiment_training_data_absolute_path	roman.batygin@mail.ru	db/changelog/v58-add-experiment-download-url-column.xml	2022-12-09 13:05:27.104763	254	EXECUTED	8:ec8ea575a0fb42cd66a3a523392fb326	renameColumn newColumnName=training_data_path, oldColumnName=training_data_absolute_path, tableName=experiment		\N	3.7.0	schema	\N	0565918001
add_experiment_instances_info_id_column	roman.batygin@mail.ru	db/changelog/v58-add-experiment-download-url-column.xml	2022-12-09 13:05:27.124473	255	EXECUTED	8:56ed5ad0a59bbc7ca2cfc38ff62a78a1	addColumn tableName=experiment		\N	3.7.0	schema	\N	0565918001
insert_experiment_relation_name_field_in_global_filter_template	roman.batygin@mail.ru	db/changelog/v59-insert-experiment-relation-name-in-filter-templates.xml	2022-12-09 13:05:27.13719	256	EXECUTED	8:e6b1dca653dff6699cdffabc0af769f0	insert tableName=global_filter_field		\N	3.7.0	data	\N	0565918001
reorder_experiment_filter_template_fields	roman.batygin@mail.ru	db/changelog/v59-insert-experiment-relation-name-in-filter-templates.xml	2022-12-09 13:05:27.148745	257	EXECUTED	8:e2aeeaee64a022b3c3fca859f4d3ff88	update tableName=filter_field		\N	3.7.0	data	\N	0565918001
insert_experiment_relation_name_field_in_filter_template	roman.batygin@mail.ru	db/changelog/v59-insert-experiment-relation-name-in-filter-templates.xml	2022-12-09 13:05:27.155365	258	EXECUTED	8:0fd9cc631928e2e10d85c00d62e6bb07	insert tableName=filter_field		\N	3.7.0	data	\N	0565918001
create-experiment-step-table	roman.batygin@mail.ru	db/changelog/v60-create-experiment-step-table.xml	2022-12-09 13:05:27.189706	259	EXECUTED	8:d83bbbf865d3e2ea0f497c57cb7cffee	createTable tableName=experiment_step		\N	3.7.0	schema	\N	0565918001
add_experiment_step_experiment_id_step_unique_idx	roman.batygin@mail.ru	db/changelog/v60-create-experiment-step-table.xml	2022-12-09 13:05:27.408506	260	EXECUTED	8:77ee35534cb445053a87f7e9c2235c14	createIndex indexName=experiment_step_experiment_id_step_unique_idx, tableName=experiment_step		\N	3.7.0	schema	\N	0565918001
add_experiment_step_experiment_id_step_order_unique_idx	roman.batygin@mail.ru	db/changelog/v60-create-experiment-step-table.xml	2022-12-09 13:05:27.561117	261	EXECUTED	8:1b6459438a6eb16eb5652a446d4111f0	createIndex indexName=experiment_step_experiment_id_step_order_unique_idx, tableName=experiment_step		\N	3.7.0	schema	\N	0565918001
drop_experiment_first_name_column	roman.batygin@mail.ru	db/changelog/v61-drop-experiment-first-name-column.xml	2022-12-09 13:05:27.568183	262	EXECUTED	8:557cbe13f056dec0906a1a0c61b5b541	dropColumn columnName=first_name, tableName=experiment		\N	3.7.0	schema	\N	0565918001
remove_experiment_first_name_column_from_global_filter	roman.batygin@mail.ru	db/changelog/v61-drop-experiment-first-name-column.xml	2022-12-09 13:05:27.572849	263	EXECUTED	8:a208ba5be0b8ebbb7346d3b1db182983	delete tableName=global_filter_field		\N	3.7.0	data	\N	0565918001
drop_experiment_email_not_null_constraint	roman.batygin@mail.ru	db/changelog/v62-drop-experiment-email-not-null-constraint.xml	2022-12-09 13:05:27.583423	264	EXECUTED	8:c2ee0e43958a34b9ceb8441cce689cab	dropNotNullConstraint columnName=email, tableName=experiment		\N	3.7.0	schema	\N	0565918001
\.


--
-- TOC entry 2509 (class 0 OID 16474)
-- Dependencies: 203
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- TOC entry 2510 (class 0 OID 16485)
-- Dependencies: 204
-- Data for Name: ers_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ers_request (id, request_date, request_id, response_status, details) FROM stdin;
2021	2018-06-10 21:27:09.41	8ac20f1f-28b6-4e75-b186-149e47a47f20	SUCCESS	\N
2024	2018-06-10 21:27:32.254	c3d84a54-84e2-4264-94dd-b52e05816d24	SUCCESS	\N
2027	2018-06-10 21:27:41.926	ee62b035-6367-42fc-9b91-34f7e419d8f7	SUCCESS	\N
2030	2018-06-10 21:27:54.504	94dec56a-227b-4b8e-81ca-2f0112fe50ff	SUCCESS	\N
2033	2018-06-10 21:28:03.629	79dba8e3-568c-49e4-a1b4-db5155261411	SUCCESS	\N
2036	2018-06-10 21:28:13.473	48fe8521-aa1e-45de-a9c9-ef1ed3cd36da	SUCCESS	\N
2039	2018-06-10 21:28:35.754	57b1319a-98c5-4798-a5aa-8c8fedb0623f	SUCCESS	\N
2042	2018-06-10 21:28:46.379	93433388-5c1c-45ed-aebf-aada27daf67e	SUCCESS	\N
2045	2018-06-10 21:29:03.911	d3f2c471-853e-4909-bb13-6ac2fa3501e1	SUCCESS	\N
2050	2018-06-12 15:09:50.278	09d81517-a006-481c-832a-8e3394d0de04	SUCCESS	\N
2051	2018-06-12 15:09:50.278	e08e31cd-78d5-4bdf-b168-d202bff176ba	SUCCESS	\N
2052	2018-06-12 15:09:50.278	2b01e03b-854e-4e06-bbde-95c058441a9a	SUCCESS	\N
2053	2018-06-12 15:09:50.278	ff3a3f5c-ac41-4b55-ad6a-8953fcc39b3d	SUCCESS	\N
2054	2018-06-12 15:09:50.278	5ebf5b75-525e-4469-9e46-c433911331ee	SUCCESS	\N
2056	2018-06-12 15:11:36.435	2b6ce883-9f03-4c8d-a839-278af27783fa	SUCCESS	\N
2057	2018-06-12 15:11:36.435	efa4ee1c-0156-4f11-a81f-0c3ef385d374	SUCCESS	\N
2058	2018-06-12 15:11:36.466	29eb8be5-a4d0-4ab0-af61-987181ffd612	SUCCESS	\N
2059	2018-06-12 15:11:36.435	c2619692-498b-4beb-91e5-a5832c40e8d3	SUCCESS	\N
2060	2018-06-12 15:11:36.435	2e7b53cb-82ab-4877-ba6a-214e8cd1758e	SUCCESS	\N
2061	2018-06-12 15:12:24.529	5102a2c0-0e42-4b4f-907d-3bad10e4b82a	SUCCESS	\N
2062	2018-06-12 15:12:24.529	2e8e9da8-fb1d-4977-b7d5-c3deeed6c5c6	SUCCESS	\N
2063	2018-06-12 15:12:24.545	ba567a16-2ee6-4fec-abdf-0fab0256c927	SUCCESS	\N
2064	2018-06-12 15:12:24.545	df71837b-48fb-4554-93d9-cdb412f6c8af	SUCCESS	\N
2065	2018-06-12 15:12:24.529	12b1ac88-c031-46e3-9c46-07e7712e11bf	SUCCESS	\N
2066	2018-06-12 15:14:44.717	2462140c-5781-452e-b4af-b03fc88bbecc	SUCCESS	\N
2067	2018-06-12 15:14:44.718	31afa2d5-c364-49cf-9ebe-2157aa803cae	SUCCESS	\N
2068	2018-06-12 15:14:44.717	37653683-1f0d-461e-ad7b-a46315dfda1b	SUCCESS	\N
2069	2018-06-12 15:14:44.718	651ec08d-77d2-4116-9f4c-b6d8f609b8fa	SUCCESS	\N
2070	2018-06-12 15:14:44.717	738664a1-18fe-4c7a-ad2e-f58f275f7756	SUCCESS	\N
2071	2018-06-12 15:16:54.274	61010a95-dad4-4e0a-b348-62b03e307368	SUCCESS	\N
2072	2018-06-12 15:16:54.273	4d9757d0-b78b-41e9-8238-56691c87c2cf	SUCCESS	\N
2073	2018-06-12 15:16:54.273	ebfbf3b1-ac98-42e8-aece-60516083564b	SUCCESS	\N
2074	2018-06-12 15:16:54.273	5d85118a-5b57-41cc-8526-9b92b478682f	SUCCESS	\N
2075	2018-06-12 15:16:54.273	578cdd61-96c2-4daa-9d14-68e3138ea652	SUCCESS	\N
2083	2018-06-12 15:25:30.341	1df34a4b-c864-4e1e-9c37-92c2fa62e51d	SUCCESS	\N
2084	2018-06-12 15:25:30.34	fd1f6f3d-1ca0-4f0c-bdea-345a9102756b	SUCCESS	\N
2085	2018-06-12 15:25:30.34	900e13e6-361c-4372-9b85-bd3aa25e0a22	SUCCESS	\N
2086	2018-06-12 15:25:30.341	dd5969e5-8f22-4a55-a3ba-cf11da6b5b92	SUCCESS	\N
2087	2018-06-12 15:25:30.341	fc9243e8-16a1-40e6-9183-0679158423aa	SUCCESS	\N
2089	2018-06-12 15:28:46.018	b88d1967-0d05-4f62-af96-1d7fc2b64af3	SUCCESS	\N
2090	2018-06-12 15:28:46.019	352e4c33-e1eb-4af3-a33a-309d4d5b18f0	SUCCESS	\N
2091	2018-06-12 15:28:46.019	e55386b3-2bd4-4f74-a8d8-e9a4ad8144f3	SUCCESS	\N
2092	2018-06-12 15:28:46.018	fbdcfe38-bee4-47fb-8510-6cddd0ed9295	SUCCESS	\N
2093	2018-06-12 15:28:46.02	bd812c31-47b4-499e-a20f-0d828e20b0d4	SUCCESS	\N
2097	2018-06-12 15:36:03.761	d7a328ff-ddb7-4b4b-8e3d-2cfaf83c83cc	SUCCESS	\N
2098	2018-06-12 15:36:03.762	e9926843-cfd4-460e-b7f8-ede608af5c53	SUCCESS	\N
2099	2018-06-12 15:36:03.761	405affae-2450-45af-aefa-8e951896f3cb	SUCCESS	\N
2100	2018-06-12 15:36:03.761	e21561a0-3cd1-449f-953a-b7f7957dc156	SUCCESS	\N
2101	2018-06-12 15:36:03.763	d993cfac-bbce-4bd4-943f-e21b6ac0b042	SUCCESS	\N
2104	2018-06-12 17:01:19.417	3fef429a-5ab6-4a07-b31b-ce6b7ac1660f	SUCCESS	\N
2105	2018-06-12 17:01:19.427	14f2d497-41f1-4f6b-9a2b-ce885f69e3b0	SUCCESS	\N
2106	2018-06-12 17:01:19.418	12606939-f824-4466-baf1-ed752c688a2d	SUCCESS	\N
2107	2018-06-12 17:01:19.416	78b15381-0cfe-45f8-bb16-cc149c5fbce8	SUCCESS	\N
2108	2018-06-12 17:01:19.424	9dc90694-ee7f-417f-9f94-f0a3f28bc613	SUCCESS	\N
2111	2018-06-13 00:14:18.34	158f0ece-970f-4cc6-bc7f-f6ab584f14f1	SUCCESS	\N
2112	2018-06-21 21:14:07.264	91a29060-7c28-48ae-9d54-e5e5cdb06f3c	SUCCESS	\N
2119	2018-06-21 21:18:04.17	6a94f35c-e25f-4bce-94cf-a4bcbbbafd69	SUCCESS	\N
2122	2018-06-21 21:18:10.943	c6ce989d-0c85-45e1-9876-488e0b412cf3	SUCCESS	\N
2125	2018-06-21 21:18:24.762	762f63ab-00d9-4da4-acfc-d019e362c88d	SUCCESS	\N
2128	2018-06-21 21:18:32.281	7d8476ce-af27-4f86-a588-d77383e0f284	SUCCESS	\N
2131	2018-06-21 21:18:38.827	f6a531d3-ff38-48e4-930a-f17e98a4db82	SUCCESS	\N
2134	2018-06-21 21:18:47.952	54e9870b-ab4b-4b3c-a217-114b31c856fb	SUCCESS	\N
2137	2018-06-21 21:18:55.09	89429313-1315-4213-b413-d91ae9eb6fe0	SUCCESS	\N
2140	2018-06-21 21:19:01.388	dba3f9d3-9479-44ab-8a5b-2e1f37bf5426	SUCCESS	\N
2143	2018-06-21 21:19:06.672	e8ecba8e-e924-480e-ba70-914ebae8227d	SUCCESS	\N
2146	2018-06-21 21:19:14.404	170054e6-a455-4136-a0ca-42728bb4bc07	SUCCESS	\N
2149	2018-06-21 21:19:21.345	ffa91d4b-fb27-4f78-87b4-55568872228a	SUCCESS	\N
2152	2018-06-21 21:19:28.565	a37e4651-b679-4de2-a4ad-fc0a0d5c13b9	SUCCESS	\N
2170	2018-06-21 21:39:16.725	64c67b1b-b3dc-4a75-a23b-407b12ef73bd	SUCCESS	\N
2171	2018-06-21 21:39:16.726	b5653c9b-7181-4301-a5c9-7581852e61cb	SUCCESS	\N
2172	2018-06-21 21:39:16.726	2b4fab77-8ef8-4a04-a5fb-ef1988e62daf	SUCCESS	\N
2173	2018-06-21 21:39:16.726	416e96d4-5e95-4786-9140-1628deba2376	SUCCESS	\N
2174	2018-06-21 21:39:16.725	a0823f90-4549-4ab4-9eb8-cc1ae2117e7a	SUCCESS	\N
2177	2018-06-21 21:42:25.108	445fc2fd-6e1d-4559-b4b5-1914dbaf4f4a	SUCCESS	\N
2175	2018-06-21 21:42:25.594	c2c9c0e9-926f-4f66-ac72-7377d4873bc6	SUCCESS	\N
2176	2018-06-21 21:42:24.957	a8c0c087-3130-41bd-9902-c517fb1bb03e	SUCCESS	\N
2179	2018-06-21 21:42:25.305	0fdb7b52-a3ac-47d2-b6a9-e552476720a9	SUCCESS	\N
2178	2018-06-21 21:42:25.357	e07887a6-3c08-4186-9ab2-a26c5e3771b3	SUCCESS	\N
2180	2018-06-21 21:45:42.095	f66896a1-2ff0-43e4-b9cb-89f73b475653	SUCCESS	\N
2181	2018-06-21 21:45:42.095	f56cbbdb-19e2-419a-98a5-e398d7b8c4c1	SUCCESS	\N
2182	2018-06-21 21:45:42.095	044ba56c-0aa2-43f7-8b66-839b03828bad	SUCCESS	\N
2183	2018-06-21 21:45:42.095	87f27f78-303a-4765-b6a3-1b64540dcc90	SUCCESS	\N
2184	2018-06-21 21:45:42.095	abaead55-ff91-4134-9957-92f03173f42f	SUCCESS	\N
2185	2018-06-21 21:46:33.102	cdeb2c42-d846-4439-b835-a29cfee2c058	SUCCESS	\N
2186	2018-06-21 21:46:33.102	976e45e1-c1bf-436c-bec3-fc7e5859419e	SUCCESS	\N
2187	2018-06-21 21:46:33.102	2d27c861-2cac-4ff7-9b70-a625f57f9dbf	SUCCESS	\N
2189	2018-06-21 21:46:33.103	b252f18a-ddd2-427a-a54d-354b3c14b3c1	SUCCESS	\N
2188	2018-06-21 21:46:33.103	de4bfa98-1e40-4b50-93ca-18d66ccd63d3	SUCCESS	\N
2191	2018-06-21 21:47:09.713	3d4e6268-fcab-446d-b763-1e114bd832cb	SUCCESS	\N
2196	2018-06-21 21:48:48.921	4e1bb220-1e6a-48db-a33f-09610b427407	SUCCESS	\N
2199	2018-06-21 21:48:48.921	5610a72b-2a64-49c1-aab8-e47de2acbeb5	SUCCESS	\N
2200	2018-06-21 21:50:23.033	f9839db9-e68d-4f97-b20c-845b2164a73b	SUCCESS	\N
2208	2018-06-21 21:51:46.767	65864106-1609-46d7-8702-fd316b6bad24	SUCCESS	\N
2190	2018-06-21 21:47:09.707	9bb86efb-418a-4d81-b3ae-3e7f1f1246d5	SUCCESS	\N
2192	2018-06-21 21:47:09.706	8622e3f1-4c59-49d2-bc87-8ee08dbf4037	SUCCESS	\N
2193	2018-06-21 21:47:09.707	1536ee76-b825-4758-824b-51929aa52049	SUCCESS	\N
2194	2018-06-21 21:47:09.719	ef59bd5f-85d3-420b-830b-ace0fe2ba1b2	SUCCESS	\N
2195	2018-06-21 21:48:48.921	e53c0411-5d4c-4e8f-b9a1-7aadb0ff00ea	SUCCESS	\N
2202	2018-06-21 21:50:23.034	a4c7e6d9-6fa7-41f3-b98d-f52de7fa89cb	SUCCESS	\N
2203	2018-06-21 21:50:23.034	82b2c801-9f9c-450b-8868-023e6f38b7d3	SUCCESS	\N
2207	2018-06-21 21:51:46.766	0f904163-9590-4d31-a070-3c294c3ac0f2	SUCCESS	\N
2197	2018-06-21 21:48:48.921	17d44b4c-d26b-4848-a47f-ed46af5fd29b	SUCCESS	\N
2198	2018-06-21 21:48:48.921	f879d2f8-2872-4ca4-a9c5-df53bab1f569	SUCCESS	\N
2201	2018-06-21 21:50:23.034	1eb8ac51-4c4c-4a44-aa4c-0ac7cffed708	SUCCESS	\N
2204	2018-06-21 21:50:23.033	fab37813-03ff-4dd3-8aac-4d13db522153	SUCCESS	\N
2206	2018-06-21 21:51:46.766	a9a6d68e-7a50-4898-b066-360c0f4ba226	SUCCESS	\N
2209	2018-06-21 21:51:46.766	5fa91a6f-8c5b-44e4-be90-7b397c867548	SUCCESS	\N
2217	2018-06-21 22:27:46.6	8f2b7b71-92f4-43af-bf5d-f1e7a10ac627	SUCCESS	\N
2210	2018-06-21 21:51:46.766	4a0ce931-b9e0-4744-81c2-7c88e8cebcd7	SUCCESS	\N
2235	2018-06-25 23:08:03.89	402ef91c-36a4-4da9-b465-1021e18ae34b	SUCCESS	\N
2232	2018-06-25 23:08:03.873	e10d4551-d860-4f7b-a053-58dc639cbfc8	SUCCESS	\N
2233	2018-06-25 23:08:03.89	285afd47-1b98-4130-945e-9889f67ac3bb	SUCCESS	\N
2231	2018-06-25 23:08:03.89	dcf1662a-e984-4327-91c0-0c251bd999c4	SUCCESS	\N
2234	2018-06-25 23:08:03.89	a1c835ab-b20c-4227-8fd1-e90edf3d4bf6	SUCCESS	\N
2236	2018-06-25 23:18:39.593	5cd92f9c-3374-43bc-b6de-a3cdbfcd0a60	SUCCESS	\N
2237	2018-06-25 23:18:39.594	1f66ac8a-9020-4245-811a-bef6db633bfa	SUCCESS	\N
2238	2018-06-25 23:18:39.593	33299c70-1002-4118-b2b1-c8a8aad29513	SUCCESS	\N
2239	2018-06-25 23:18:39.594	2ff3a7fa-19ab-417e-96eb-00ab8c48e550	SUCCESS	\N
2240	2018-06-25 23:18:39.593	2ec2b502-5f21-4550-8151-08d3096dda9a	SUCCESS	\N
2242	2018-06-25 23:20:55.443	eb5db9cf-7069-4885-88e4-e0bb209a6dc0	SUCCESS	\N
2243	2018-06-25 23:20:55.443	df82a160-e8cf-49fa-8e14-084d4b02ada8	SUCCESS	\N
2244	2018-06-25 23:20:55.443	0c69c930-b70b-4462-8774-63dbdada9e2a	SUCCESS	\N
2245	2018-06-25 23:20:55.443	8eee21c2-401c-4f86-ac15-1fb2472bd1c2	SUCCESS	\N
2246	2018-06-25 23:20:55.443	41450288-4924-4e81-b00d-5b0a3a7800f5	SUCCESS	\N
2253	2018-06-25 23:23:45.855	329a0a86-8801-4cf4-8e2b-97ac64e5af6c	SUCCESS	\N
2254	2018-06-25 23:23:45.873	a9cbfaac-d0c7-4006-931a-3ddca4bf7943	SUCCESS	\N
2255	2018-06-25 23:23:45.823	14adcff3-f74c-4e03-81ae-b11ed0279781	SUCCESS	\N
2256	2018-06-25 23:23:45.781	3c7fabfe-c636-475c-8fb6-23552bc42db1	SUCCESS	\N
2257	2018-06-25 23:23:45.789	9e7f2b56-b95b-4910-886d-e8e2a4f6e48f	SUCCESS	\N
2259	2018-06-25 23:24:07.957	96bceab6-bedc-4379-aa47-0fa79a1efa3f	SUCCESS	\N
2260	2018-06-25 23:24:07.957	589de682-da57-4c20-bf78-59c1865a8122	SUCCESS	\N
2261	2018-06-25 23:24:07.957	415e2475-8696-48ce-b2f6-bfe8ce9a9ef4	SUCCESS	\N
2262	2018-06-25 23:24:07.972	69b7dfc0-dadb-4b4b-9bda-983cd348ec0c	SUCCESS	\N
2263	2018-06-25 23:24:07.957	4eb9407b-110e-4b47-b680-30974f537d96	SUCCESS	\N
2270	2018-06-25 23:37:29.297	c74506f0-dbcb-41e4-b157-f66a035cb22f	SUCCESS	\N
2271	2018-06-25 23:37:29.297	58378d39-cc44-4947-90d4-f312f605c8bf	SUCCESS	\N
2272	2018-06-25 23:37:29.297	7ac9a0bf-29ac-4155-9c6e-d7d969b72553	SUCCESS	\N
2273	2018-06-25 23:37:29.297	5159b72d-5915-4dcf-a461-b245f679521b	SUCCESS	\N
2274	2018-06-25 23:37:29.297	2f6e28d4-4cb0-4296-b4ee-9ab64e464f2b	SUCCESS	\N
2277	2018-06-25 23:39:09.037	a9360f9d-9f9c-4155-a26d-6dbf7a1a5993	SUCCESS	\N
2280	2018-06-25 23:39:26.207	af8a0746-ce7d-4dd9-a0dc-95bbd9cf91a7	SUCCESS	\N
2283	2018-06-25 23:39:32.63	1b2524c3-76c8-4962-b5f3-a0ac20352d2a	SUCCESS	\N
2286	2018-06-25 23:39:45.052	d95a8bee-e6f6-4772-bf09-49fb959ef582	SUCCESS	\N
2289	2018-06-25 23:39:54.96	aee5a4c9-14dd-4a5a-bbb7-be05e9c5af24	SUCCESS	\N
2292	2018-06-25 23:40:04.424	b84412a8-e4f3-44bb-b6e4-d0034a366db5	SUCCESS	\N
2295	2018-06-25 23:40:13.277	a1d90b47-1aaa-4ac0-b75d-8aec18fc68f1	SUCCESS	\N
2297	2018-06-25 23:40:19.143	5e015cbb-a1cc-4544-9b11-28b5e19a365c	SUCCESS	\N
2298	2018-06-25 23:40:19.142	00b8472d-ba31-4e5e-af70-e265ed41b3a7	SUCCESS	\N
2299	2018-06-25 23:40:19.141	a094f5f7-938e-4ac3-b486-9352e16581f3	SUCCESS	\N
2300	2018-06-25 23:40:19.141	115754e3-2115-4b5d-8e9a-8ffeee0c70f2	SUCCESS	\N
2301	2018-06-25 23:40:19.142	d84a0f0c-7e02-4757-a87b-fcc5661a801b	SUCCESS	\N
2302	2018-06-25 23:40:45.596	b2a3655d-5f3a-4af7-bd30-48b4f271fe59	SUCCESS	\N
2309	2018-06-25 23:41:31.548	f6c016e8-bd26-4764-a5d6-79c8041fde6f	SUCCESS	\N
2316	2018-06-26 00:01:45.393	01981823-2c4d-4ff1-86f6-eec724680fc1	SUCCESS	\N
2317	2018-06-26 00:01:45.403	553c71d0-b923-4bda-adef-cc34b7e47d18	SUCCESS	\N
2319	2018-06-26 00:01:45.393	288ac92c-9eda-4769-9c0a-919f4c3a1da0	SUCCESS	\N
2318	2018-06-26 00:01:45.39	618d87c7-2e92-4bda-a5f3-785e9717d5af	SUCCESS	\N
2320	2018-06-26 00:01:45.389	90ed4da8-d6a5-411e-b83b-f6c72732c272	SUCCESS	\N
2327	2018-06-26 21:25:44.459	233b3450-49b3-4ef5-8cf6-322cc5995390	SUCCESS	\N
2330	2018-06-26 21:26:00.875	f2fd1f59-2a51-4a8b-a0b4-ef3d15a9ae15	SUCCESS	\N
2333	2018-06-26 21:26:14.253	e9f940e9-2ee4-4022-904d-95bd5548cbd5	SUCCESS	\N
2336	2018-06-26 21:26:23.131	bc67f7cd-5dca-4df7-9d21-d84e6c1a7004	SUCCESS	\N
2339	2018-06-26 21:26:34.316	df2c8f9f-548c-4ba5-ab89-20a277c66854	SUCCESS	\N
2342	2018-06-26 21:26:43.786	24bdb702-64a9-4c09-b74d-7aaa15239d5f	SUCCESS	\N
2345	2018-06-26 21:27:04.826	1b35ac9a-451a-4dfd-becb-a50b4eaa67cd	SUCCESS	\N
2347	2018-06-26 21:36:17.378	a1ef68e7-d5f9-4b91-813e-bd1f5ee4b8a9	SUCCESS	\N
2348	2018-06-26 21:36:17.378	7082f8e9-eb07-428b-be55-13be5fff6796	SUCCESS	\N
2349	2018-06-26 21:36:17.378	d00789bb-9b68-41ff-b06b-b9e4af1d3410	SUCCESS	\N
2350	2018-06-26 21:36:17.378	2fde81fc-f6ac-4100-b8b2-79edef7947c8	SUCCESS	\N
2351	2018-06-26 21:36:17.456	7f1cbe32-8811-4987-9cab-a0b1d2f080b7	SUCCESS	\N
2355	2018-06-26 21:49:00.434	db3987a9-b843-41f7-a371-c3df99afa2cd	SUCCESS	\N
2356	2018-06-26 21:49:00.434	a413b652-184a-452e-824c-94cefb15d9c6	SUCCESS	\N
2358	2018-06-26 21:49:00.434	063c48a9-388e-42d8-8143-51c626ee87e2	SUCCESS	\N
2357	2018-06-26 21:49:00.434	ee53116d-7a19-416f-b272-e1ae90c7038a	SUCCESS	\N
2359	2018-06-26 21:49:00.434	0da835bf-e1d5-4c0a-82d1-b11779f0c827	SUCCESS	\N
2361	2018-06-26 21:49:52.848	6a481586-912e-4f0d-98cf-1c03319b095c	SUCCESS	\N
2362	2018-06-26 21:49:52.837	0288c6c7-2077-4e5d-8c8c-dcba7f607167	SUCCESS	\N
2363	2018-06-26 21:49:52.873	9a48284e-d139-48f0-ac00-955231b0a1ad	SUCCESS	\N
2364	2018-06-26 21:49:52.844	4d472acf-0390-40f6-80f1-b398bdb39fc1	SUCCESS	\N
2365	2018-06-26 21:49:52.835	58340031-cb66-420c-a31e-7e0e9df5916a	SUCCESS	\N
2369	2018-06-26 22:38:47.943	ea14a152-d2eb-4f00-9902-f5243744ba50	SUCCESS	\N
2370	2018-06-26 22:38:47.942	6219db3f-24dc-4a31-b1d5-f78d1af1f9f7	SUCCESS	\N
2371	2018-06-26 22:38:47.942	dfff6f18-f6f4-4d27-87c0-fec76d7927ce	SUCCESS	\N
2372	2018-06-26 22:38:47.943	fed0dbf0-1d6f-4ab8-9483-ad81e9fee089	SUCCESS	\N
2373	2018-06-26 22:38:47.943	6c92077f-aa55-42c7-a6f2-22b0d0fb73c3	SUCCESS	\N
2376	2018-06-26 22:47:55.503	485aa815-9b58-43b7-849c-69530578e706	SUCCESS	\N
2381	2018-06-26 23:03:20.726	0853226f-7073-4180-b62e-bc19b29d278d	ERROR	Not Found [404]
2386	2018-06-26 23:08:24.434	76ee74c6-2850-4f14-b4f6-0d210f930d88	SUCCESS	\N
2388	2018-06-27 00:30:03.345	17c7bff6-2b54-470e-a879-b44fd4379412	SUCCESS	\N
2389	2018-06-27 00:30:03.334	a3c0228c-ef2a-48c7-9a33-f1c3853504a7	SUCCESS	\N
2390	2018-06-27 00:30:03.279	6bb7c5a0-0c49-4c94-b543-62da573a5507	SUCCESS	\N
2391	2018-06-27 00:30:03.279	97d20280-19b5-4868-836c-93ded984bc5d	SUCCESS	\N
2392	2018-06-27 00:30:03.357	f6a8d023-3546-41f9-98e1-8c8157df37b6	SUCCESS	\N
2395	2018-06-27 22:22:55.252	d8e4336f-6e50-4ad3-ae55-614203fba979	SUCCESS	\N
2398	2018-06-27 22:22:55.252	c07c65d6-053f-422a-a0db-8dd4e7607efc	SUCCESS	\N
2396	2018-06-27 22:22:55.252	686b8a54-823e-4dce-8677-b8b1a124a1f0	SUCCESS	\N
2397	2018-06-27 22:22:55.252	58812592-3a15-4bef-af1a-5753f8fa16a5	SUCCESS	\N
2404	2018-06-27 22:41:57.454	c88159ee-afc5-4530-a647-3511654f59b3	SUCCESS	\N
2394	2018-06-27 22:22:55.252	349f5e1e-b3d5-49f9-a9e4-7b232f0d95ed	SUCCESS	\N
2402	2018-06-27 22:41:57.453	cfa16f3c-392f-438e-84c3-89d9d4ae1905	SUCCESS	\N
2403	2018-06-27 22:41:57.455	86dac20e-1c22-4ef3-86eb-4eb688802429	SUCCESS	\N
2406	2018-06-27 22:41:57.454	5b3d8b57-e511-47af-bf5c-dd03370823fb	SUCCESS	\N
2405	2018-06-27 22:41:57.453	851101bf-3b52-4dfe-92a8-ac0dd82f2688	SUCCESS	\N
2411	2018-06-28 23:23:16.304	2df42bf2-1343-401c-9b18-04d1296c82bf	SUCCESS	\N
2414	2018-06-28 23:23:16.303	d2d5954e-8632-4ade-a5d8-01266e788eb7	SUCCESS	\N
2412	2018-06-28 23:23:16.303	ee2a19d2-bb76-44e1-88e4-38690fea9472	SUCCESS	\N
2413	2018-06-28 23:23:16.303	571881be-03e9-4741-8a42-c1fbf10f7021	SUCCESS	\N
2410	2018-06-28 23:23:16.304	dcd0be38-9f2e-45da-8006-59fa482a021c	SUCCESS	\N
2415	2018-06-29 00:22:46.987	83e634f0-6110-41d8-93fa-550444e66244	SUCCESS	\N
2428	2018-06-29 13:04:42.02	2248109b-98cf-4d1d-9f09-7302a8b9a294	SUCCESS	\N
2429	2018-06-29 13:04:42.02	6963edd8-67db-4862-8167-c507372d0776	SUCCESS	\N
2430	2018-06-29 13:04:42.02	5a7e9fac-328a-4830-804f-8bdc6255e373	SUCCESS	\N
2426	2018-06-29 13:04:42.02	4054d0aa-a4f5-4a71-a4c1-220821271dbc	SUCCESS	\N
2427	2018-06-29 13:04:42.02	a548344c-2d17-459d-9b2e-9caece6b8d7d	SUCCESS	\N
2434	2018-07-07 02:13:34.767	9f98cf9c-d3f2-4d91-bfe5-6de04db8470b	SUCCESS	\N
2435	2018-07-07 02:13:34.693	fe1196bc-58ba-4faf-9c1d-4bbca0848101	SUCCESS	\N
2436	2018-07-07 02:13:34.693	59c16513-fcae-4ed0-b6f9-6f0b1373ca1a	SUCCESS	\N
2437	2018-07-07 02:13:34.689	c1fc185d-30e8-4192-aa83-a7c91ddabdb4	SUCCESS	\N
2438	2018-07-07 02:13:34.7	0d777c66-17e7-4708-92a7-59ad2464af8e	SUCCESS	\N
2447	2018-07-07 13:03:30.721	f2909da8-c575-4ab5-9156-b5f5b27d96ee	SUCCESS	\N
2444	2018-07-07 13:03:30.721	164455a5-59dc-456a-b4a2-09ffb7705e6c	SUCCESS	\N
2445	2018-07-07 13:03:30.721	72214f87-18a1-424a-9352-979c52f64639	SUCCESS	\N
2448	2018-07-07 13:03:30.721	08442f2b-68b3-426f-8b74-154ff8c4ac2c	SUCCESS	\N
2446	2018-07-07 13:03:30.721	5c655ab8-e57b-4ad6-b330-48cc1deab40b	SUCCESS	\N
2450	2018-07-07 13:28:45.486	dc5984c4-5d1c-4788-9d80-33fc30acb57b	SUCCESS	\N
2451	2018-07-07 13:28:45.488	1ac4992e-c9c1-4f20-b958-fa524a13deb5	SUCCESS	\N
2452	2018-07-07 13:28:45.486	441ff9ce-b78f-49fd-9039-dfb620e7d708	SUCCESS	\N
2453	2018-07-07 13:28:45.487	0e5ebc9d-11a1-4cb1-a9d1-c632b8f2a430	SUCCESS	\N
2454	2018-07-07 13:28:45.487	f70dd828-3128-4661-a6cc-a0a567a913f9	SUCCESS	\N
2457	2018-07-07 13:31:56.284	4a62a2fc-e65d-4e98-a799-ec1988411eb1	SUCCESS	\N
2460	2018-07-07 13:32:08.735	5fb588ee-9ddf-4f02-9759-b19785b40e6b	SUCCESS	\N
2463	2018-07-07 13:32:20.531	fa8ad001-2053-409a-983e-6baf1344d640	SUCCESS	\N
2466	2018-07-07 13:32:34.066	0a8151ff-eceb-4cd5-98d1-f92e91b442e7	SUCCESS	\N
2469	2018-07-07 13:32:41.816	7dd548c6-f589-4b0d-9e24-ce9eae38d163	SUCCESS	\N
2472	2018-07-07 13:32:54.941	684d6932-2a27-419b-be0a-4defcd235757	SUCCESS	\N
2475	2018-07-07 13:33:02.968	6f22e514-7196-4e72-a30c-6a492d3783c4	SUCCESS	\N
2478	2018-07-07 13:33:18.773	63d7a485-6fdd-4f98-8b98-658ae84018e9	SUCCESS	\N
2481	2018-07-07 13:33:28.693	d3d8f774-e336-4716-8acb-3f8b1667193a	SUCCESS	\N
2484	2018-07-07 13:33:41.006	c7b6b2c5-c675-417d-a1ef-c9ddbc877b99	SUCCESS	\N
2487	2018-07-07 13:35:15.746	6cd6a996-53f5-4bda-b206-c735827fe923	SUCCESS	\N
2496	2018-07-07 17:23:17.69	6aeba3ea-6096-4595-85ee-96ab4f0ac829	SUCCESS	\N
2497	2018-07-07 17:23:17.69	4fedc46b-2113-4b59-8a94-ca9cc543edc4	SUCCESS	\N
2495	2018-07-07 17:23:17.689	8da16444-9de9-439a-bb75-b80611c37d70	SUCCESS	\N
2498	2018-07-07 17:23:17.689	64f3ca1c-d12e-446e-8dfa-4097d2a7140c	SUCCESS	\N
2494	2018-07-07 17:23:17.689	9fcc5032-d564-4d75-887c-16ee0cdee6a6	SUCCESS	\N
2505	2018-07-07 18:52:50.985	d08e1d27-28fc-4eb9-9133-1aefeae75906	SUCCESS	\N
2504	2018-07-07 18:52:50.982	3b66408d-0a49-4fdf-b4aa-e33423082d8a	SUCCESS	\N
2503	2018-07-07 18:52:50.985	106529bb-93c9-4e9d-a2c5-b6f2fde19471	SUCCESS	\N
2506	2018-07-07 18:52:50.984	20ad5bfc-6e23-4352-afc0-71bdbf22794a	SUCCESS	\N
2502	2018-07-07 18:52:50.985	a09e5653-8ab3-4bf4-aecf-6529775e1846	SUCCESS	\N
2507	2018-07-07 23:28:51.209	e6279735-d284-4ef4-8025-46df7d05bb2f	SUCCESS	\N
2517	2018-07-08 14:09:23.267	bf8bd5da-87d2-46df-b0a0-426308d81ff6	SUCCESS	\N
2520	2018-07-08 14:10:17.193	c9c99d65-da14-419c-b386-a59af61dba9d	SUCCESS	\N
2523	2018-07-08 14:10:49.01	869e96e0-578b-439e-ae05-f380d2c12e54	SUCCESS	\N
2526	2018-07-08 14:11:21.026	5040b408-0ec5-4867-a256-1784d12de15a	SUCCESS	\N
2529	2018-07-08 14:11:59.919	8f0630fd-d333-4638-a689-3a2a6a3ae924	SUCCESS	\N
2532	2018-07-08 14:12:52.693	a057bf35-b183-4de6-813d-7bdce10f848e	SUCCESS	\N
2535	2018-07-08 14:14:19.102	cecdf528-5ec1-47ed-b2df-695d7d97cbbd	SUCCESS	\N
2541	2018-07-08 14:17:12.834	3ae7868f-c4d8-4235-ac86-ec82c5c9b338	SUCCESS	\N
2544	2018-07-08 14:18:27.787	9f551b79-a91e-4b83-a084-f931b097e530	SUCCESS	\N
2547	2018-07-08 14:20:25.129	e879a18f-618b-4cbc-a60c-585cc3d1dd35	SUCCESS	\N
2553	2018-07-19 23:20:50.384	684c7564-2974-4334-b03f-66f1fe44f346	SUCCESS	\N
2551	2018-07-19 23:20:50.384	42c21a09-413c-4842-adae-44acfbc06a03	SUCCESS	\N
2554	2018-07-19 23:20:50.386	df538d3a-eb3b-468b-9c0c-8840d9e416e0	SUCCESS	\N
2550	2018-07-19 23:20:50.388	ab3bbb7a-8663-4cb7-80c2-bb7ee68853cc	SUCCESS	\N
2552	2018-07-19 23:20:50.386	f7dfd9bb-a3dc-45b2-bd88-6be384954f6c	SUCCESS	\N
2561	2018-07-19 23:22:02.69	83bec0e0-653e-4db4-a562-c8c6a22a36a3	SUCCESS	\N
2562	2018-07-19 23:22:02.645	7bef9eb4-35bc-4f5e-8a5b-05f0d674607b	SUCCESS	\N
2563	2018-07-19 23:22:02.648	c570299d-845d-47b7-b0af-95f79994d524	SUCCESS	\N
2564	2018-07-19 23:22:02.672	e30913bd-f3ec-4002-8044-3892d2365322	SUCCESS	\N
2565	2018-07-19 23:22:02.702	6bba5265-3d10-45ae-b968-06a2d91c285f	SUCCESS	\N
2566	2018-07-19 23:23:11.244	06095230-f9d9-48bc-90b9-affe741f2c09	SUCCESS	\N
2569	2018-07-19 23:23:11.244	5fe9b60d-08ce-4ec2-83fd-ceee88c227eb	SUCCESS	\N
2570	2018-07-19 23:23:11.244	92247339-27c7-40db-8a1b-24c25e4668e2	SUCCESS	\N
2571	2018-07-19 23:23:11.244	c7b2f464-978e-4e73-aa87-1296975d6338	SUCCESS	\N
2572	2018-07-19 23:24:25.412	edec2755-2db1-4fbf-8678-05b8a69d80a1	SUCCESS	\N
2577	2018-07-19 23:25:10.457	53eebefb-29c2-4198-b61a-05e0fc1a12ea	SUCCESS	\N
2586	2018-07-19 23:31:47.129	bb7abd95-8d35-49e3-9677-8f7ba7c0488b	SUCCESS	\N
2587	2018-07-19 23:31:47.127	4234cce6-d26b-4385-b35d-89caf38fecbe	SUCCESS	\N
2588	2018-07-19 23:31:47.128	75ab4bc3-9227-42e0-9be4-cfa3395642f7	SUCCESS	\N
2589	2018-07-19 23:31:47.129	f2983b01-3506-40c5-b1a9-787caa7668a6	SUCCESS	\N
2590	2018-07-19 23:31:47.129	c696f711-aaf1-4a51-8dfa-ec87bba7846f	SUCCESS	\N
2591	2018-07-19 23:32:51.706	ea5b4ea6-047b-40e1-bd82-5fc1483011fd	SUCCESS	\N
2592	2018-07-19 23:32:51.707	b0a0181c-02be-40b9-bcae-26d9acb7765b	SUCCESS	\N
2568	2018-07-19 23:23:11.244	bccdfa10-b8eb-4f83-abba-d6651700e2ef	SUCCESS	\N
2593	2018-07-19 23:32:51.705	ccb858df-a55f-4d26-8fa3-0dae7a10b0d0	SUCCESS	\N
2594	2018-07-19 23:32:51.706	13410408-2355-4aa6-bb6d-924af900c8c3	SUCCESS	\N
2595	2018-07-19 23:32:51.705	52bfcf1c-907b-4d1c-87a4-470f21e59cca	SUCCESS	\N
2600	2018-08-23 21:10:36.109	379dcf39-f737-4bc5-932b-443b5b8143de	SUCCESS	\N
2603	2018-08-23 21:10:49.055	3ac19b41-756e-4fd5-a277-b8e29277a206	SUCCESS	\N
2606	2018-08-23 21:10:59.237	1103cd82-e43c-4fe2-8f27-405162fa8f46	SUCCESS	\N
2607	2018-08-23 21:11:06.695	0500dbb6-8acf-4a01-8661-e482e7fa3b6c	SUCCESS	\N
2614	2018-08-23 21:12:40.732	bd9dc392-dbd6-4f44-a7c0-2f6f1474c0e1	SUCCESS	\N
2617	2018-08-23 21:12:56.59	edd74751-d396-43e2-996e-b355f7e64a49	SUCCESS	\N
2620	2018-08-23 21:13:03.868	65eb2eff-5681-4e8d-8745-8f51124b45a6	SUCCESS	\N
2623	2018-08-23 21:14:41.144	fa7928c5-e2b2-4d5d-b8fa-1aee03d674bc	SUCCESS	\N
2626	2018-08-23 21:14:47.763	7209b4b8-1135-42c5-931c-a7368248d9c6	SUCCESS	\N
2629	2018-08-23 21:14:55.307	4c8ba13c-6944-4420-a468-f4cfb1d47af0	SUCCESS	\N
2632	2018-08-23 21:15:02.394	f3fc7c18-3802-4199-b20e-ecddc9a24146	SUCCESS	\N
2635	2018-08-23 21:15:13.536	3b21a0f7-acd1-47c5-ae94-6ee742a2888a	SUCCESS	\N
2638	2018-08-23 21:15:29.53	fd2bca88-2cc1-45de-96c6-b0239e8fed58	SUCCESS	\N
2641	2018-08-23 21:15:39.643	3bc55b37-bd19-42fb-a370-0ea9dafc6825	SUCCESS	\N
2644	2018-08-23 21:15:51.552	49917d10-1ca9-4601-9af6-7823d985fb27	SUCCESS	\N
2647	2018-08-23 21:16:00.948	c99ed092-8436-43ba-9d32-b9316e10434e	SUCCESS	\N
2650	2018-08-23 21:16:38.625	54be2980-5f60-4ead-92f3-3956f00ad49d	SUCCESS	\N
2662	2018-08-23 21:23:28.487	7f53c947-2cb7-48ee-ba4f-971b83b590ff	SUCCESS	\N
2666	2018-08-23 21:23:28.487	8d88c23e-2d5f-4fbd-86e8-c779790a7783	SUCCESS	\N
2665	2018-08-23 21:23:28.487	e11f7255-4387-4489-aaea-cb726ec7b542	SUCCESS	\N
2664	2018-08-23 21:23:28.487	77ab8004-6e46-4eda-ad7c-100054c3f045	SUCCESS	\N
2663	2018-08-23 21:23:28.487	334aadf8-7593-4e83-9e1c-db536d6b6082	SUCCESS	\N
2667	2018-08-23 21:33:40.47	a0fdaea4-877a-41c7-8b76-f20f4457fa3d	SUCCESS	\N
2668	2018-08-23 21:33:40.471	c8c518f4-bd64-42b2-9194-408117cf66bb	SUCCESS	\N
2669	2018-08-23 21:33:40.471	efe8abc8-4a57-473f-bc58-9f5a533c28b1	SUCCESS	\N
2670	2018-08-23 21:33:40.471	7ccd3375-d708-4b03-8e24-4039b7ecbe07	SUCCESS	\N
2671	2018-08-23 21:33:40.47	9d09d4e6-ef50-45e5-8a80-9577edaf329a	SUCCESS	\N
2672	2018-08-23 21:38:07.519	07768b11-1447-4385-98b4-efc62d4d32cf	SUCCESS	\N
2673	2018-08-23 21:38:07.52	17ffd1f5-d51d-41f2-91a0-f1be80e2e9eb	SUCCESS	\N
2674	2018-08-23 21:38:07.521	845d9add-b99a-4005-bbfe-64451eae315c	SUCCESS	\N
2675	2018-08-23 21:38:07.521	f266dc8f-68f9-458a-9148-d5c1183b21e3	SUCCESS	\N
2676	2018-08-23 21:38:07.519	f7414c42-0104-4362-82ef-58e16a012bed	SUCCESS	\N
2677	2018-08-23 21:38:12.229	91c535c4-6489-49de-8b85-ac1c5d5a0750	SUCCESS	\N
2678	2018-08-23 21:38:12.23	40fa587e-8615-43aa-b6d0-bed29b9992d3	SUCCESS	\N
2679	2018-08-23 21:38:12.233	cbbfb165-1bf5-4a0d-8702-0bf356b8fe47	SUCCESS	\N
2680	2018-08-23 21:38:12.239	baa69c76-4292-4274-94a4-f425ae2d2015	SUCCESS	\N
2681	2018-08-23 21:38:12.238	06557e2f-9868-4fe9-bd24-79203ebd472f	SUCCESS	\N
2682	2018-08-23 21:42:43.43	90cbb0b6-b4a6-4c78-81a6-0d258dd3c768	SUCCESS	\N
2683	2018-08-23 21:42:43.43	3586256e-0614-4aa1-ba42-07c0f9aa80dc	SUCCESS	\N
2684	2018-08-23 21:42:43.43	04ddcfeb-afde-4353-b41c-195c49138c3d	SUCCESS	\N
2685	2018-08-23 21:42:43.431	aca82613-e28e-4b4d-b02b-9a0ef633faf5	SUCCESS	\N
2686	2018-08-23 21:42:43.431	d3675ba1-45ea-4230-835e-0a95617ea98c	SUCCESS	\N
2698	2018-08-23 22:58:07.928	2ba6abcd-6df2-4fa1-ab72-3cfef08b5ce0	SUCCESS	\N
2699	2018-08-23 22:58:08.106	d757c878-c19c-4f5c-97e5-9c98e0c9318f	SUCCESS	\N
2700	2018-08-23 22:58:07.902	c54edde4-5dc1-406a-98d9-530e7db3ca6e	SUCCESS	\N
2702	2018-08-23 22:58:08.066	9a4eeaac-7e63-46a2-963f-538f26870226	SUCCESS	\N
2701	2018-08-23 22:58:08.095	6fd8c7b8-e7fe-4a43-9a85-014a8c7b0821	SUCCESS	\N
2706	2018-08-24 00:29:08.369	5264ca09-05aa-48b1-a9f9-189d4ba75b60	SUCCESS	\N
2703	2018-08-24 00:29:08.346	02b827b8-6827-4656-9180-060115d59a4c	SUCCESS	\N
2707	2018-08-24 00:29:08.346	5bf0b281-c60a-41ed-b64e-b9040fd266d7	SUCCESS	\N
2705	2018-08-24 00:29:08.363	bc326136-a0a7-4525-823b-7fc3b567ddc0	SUCCESS	\N
2704	2018-08-24 00:29:08.358	7cd6bdb0-9dfa-43fe-bf6c-945b11a1b531	SUCCESS	\N
2708	2018-08-24 00:54:07.097	f6e51f80-452c-4715-a270-09c2ee4a33fa	SUCCESS	\N
2709	2018-08-24 00:54:07.097	c1f56e38-04b0-43a8-8f17-1f9ccd3d5ab0	SUCCESS	\N
2711	2018-08-24 00:54:07.098	4db1516c-c934-41b9-9586-477534f95ce6	SUCCESS	\N
2710	2018-08-24 00:54:07.098	96af79fc-3603-49f0-922d-e8a89e0dbf89	SUCCESS	\N
2712	2018-08-24 00:54:07.097	b7306732-4b68-4ca5-94b0-78149ce914ab	SUCCESS	\N
2715	2018-08-31 21:13:23.392	b0c377de-09c5-447b-b109-d75c2ca106dd	SUCCESS	\N
2726	2018-09-17 14:20:56.49	76abeb44-b5b9-4c6d-805d-93eb7396f6a0	SUCCESS	\N
2724	2018-09-17 14:20:56.49	c3bd4d64-4723-48ff-b6ee-76bc7cce5cae	SUCCESS	\N
2723	2018-09-17 14:20:56.49	bc0b7727-f7f6-4ed0-a5fe-f1fa6bc1ad6c	SUCCESS	\N
2727	2018-09-17 14:20:56.49	d0e95b9b-a2a5-46e1-936e-3fc7258e63cc	SUCCESS	\N
2725	2018-09-17 14:20:56.49	4f1a7c41-d96d-4c70-8192-14694b6d936e	SUCCESS	\N
2756	2018-12-29 02:13:37.364	808e629a-c4f3-4059-9b83-de2ee154b23a	SUCCESS	\N
2757	2018-12-29 02:13:39.607	203afc53-da05-43a1-99d9-b29e6c85a29a	SUCCESS	\N
2758	2018-12-29 02:13:39.974	77a9013a-d694-4dce-8836-0c670e56cbb5	SUCCESS	\N
2759	2018-12-29 02:13:40.318	28e75b9b-6495-4215-ad45-c00a544f054f	SUCCESS	\N
2760	2018-12-29 02:13:40.874	d40b13df-e2d4-4694-bb51-fbd946f62e50	SUCCESS	\N
2762	2018-12-29 02:14:16.221	a8c580b2-2769-4904-87a4-c3f4fcdb8fa5	SUCCESS	\N
2763	2018-12-29 02:14:16.632	ffb44802-546a-4ea4-b329-0ee1474b5162	SUCCESS	\N
2764	2018-12-29 02:14:16.811	c75c1d8e-b30a-4f31-afdd-60107f2b0de6	SUCCESS	\N
2765	2018-12-29 02:14:17.032	5a8d853d-d691-47c7-9d56-0000d8948cf1	SUCCESS	\N
2766	2018-12-29 02:14:17.254	4d7e6f50-db5d-4e8d-9ee1-5eca646effee	SUCCESS	\N
2767	2018-12-29 02:22:09.602	34afdb15-2c5e-490e-b8c7-c18a8b4c0a92	SUCCESS	\N
2768	2018-12-29 02:22:10.097	2c4584a1-0a33-4a5e-a363-01263e243cc4	SUCCESS	\N
2769	2018-12-29 02:22:10.308	ea39ebfa-96c4-40fe-932d-1795f766cfc4	SUCCESS	\N
2770	2018-12-29 02:22:10.568	94632832-9136-407b-bf7e-bf295484865e	SUCCESS	\N
2771	2018-12-29 02:22:10.741	3553d20b-1591-4bee-a38d-962956bd2f3f	SUCCESS	\N
2779	2018-12-29 11:36:56.76	0f740001-41b7-4bdb-bcd4-32b1387352e3	SUCCESS	\N
2780	2018-12-29 11:37:00.888	728aa26b-4564-4623-9f85-1adb0c48f747	SUCCESS	\N
2781	2018-12-29 11:37:01.454	c3539fa5-b80c-4ff9-ab61-853c49b0e733	SUCCESS	\N
2782	2018-12-29 11:37:01.888	4bab46db-b24f-4dc8-8ecd-fe5899a9156f	SUCCESS	\N
2783	2018-12-29 11:37:02.288	779a05af-ce31-49b9-a025-b85e76273cda	SUCCESS	\N
2814	2018-12-29 20:12:46.41	39951fdb-4e05-443c-a9f5-e3cd0e38dde1	SUCCESS	\N
2815	2018-12-29 20:12:48.343	c93712ae-53af-49a9-b600-7878d202309c	SUCCESS	\N
2816	2018-12-29 20:12:48.721	ea86cb72-800a-43f9-a7b3-c99a37b85bbc	SUCCESS	\N
2817	2018-12-29 20:12:49.099	3add3374-e155-4900-aed0-460c61243eea	SUCCESS	\N
2818	2018-12-29 20:12:49.377	ca47f73b-d930-4331-b288-3b4ee47e2038	SUCCESS	\N
2822	2018-12-29 20:19:49.051	fae09873-447e-4079-aa4c-9c3135331e0a	SUCCESS	\N
2823	2018-12-29 20:19:49.317	16e0ec5f-eb22-476d-a383-f79d53e52aad	SUCCESS	\N
2824	2018-12-29 20:19:49.562	6a7a6265-ecf9-4767-aaef-c7733c10203d	SUCCESS	\N
2825	2018-12-29 20:19:49.884	8e9eb265-5178-4c7b-9590-83fb7596b480	SUCCESS	\N
2826	2018-12-29 20:19:50.317	562bffe9-0050-410f-8fce-9dba0238abac	SUCCESS	\N
2832	2018-12-29 20:23:14.893	70f60c51-f4a3-450e-81ea-ad76a7b5811d	SUCCESS	\N
2835	2018-12-29 20:23:31.29	1b308d3c-8709-42a5-ac79-a7b8575a4c02	SUCCESS	\N
2838	2018-12-29 20:23:46.266	5bb5107a-ad95-4c93-951c-a0cf979679c1	SUCCESS	\N
2839	2018-12-29 20:23:46.488	96f1130f-b90f-4c51-a13b-8d71feb81384	SUCCESS	\N
2840	2018-12-29 20:23:46.666	d542c417-f83b-43ea-965c-1f5a3c3eea4b	SUCCESS	\N
2841	2018-12-29 20:23:46.833	69f24a33-4285-46d4-8d07-854447ae9d61	SUCCESS	\N
2842	2018-12-29 20:23:47.022	c73cade7-1f75-4f0f-add4-1d111ddab16d	SUCCESS	\N
2844	2018-12-29 20:23:52.169	ff8839b0-fd9d-4434-9805-0083c45c3b6d	SUCCESS	\N
2847	2018-12-29 20:26:07.301	5bd90d31-5bb2-42e8-b7ea-c3eaec23857d	SUCCESS	\N
2850	2018-12-29 20:26:25.869	6ebfc155-c2e7-4191-be48-0351c4b83093	SUCCESS	\N
2853	2018-12-29 20:26:36.492	097fb265-d651-4aec-b7fe-0818fa81548f	SUCCESS	\N
2856	2018-12-29 20:26:47.611	65df0e4e-4a60-4334-865e-76d78500e6c2	SUCCESS	\N
2859	2018-12-29 20:36:33.705	e8c9d24c-568d-46d3-be84-c04c4964df21	SUCCESS	\N
2860	2018-12-29 20:36:33.987	0cca3bfa-1ad2-4e54-9c6d-870921bbd424	SUCCESS	\N
2861	2018-12-29 20:36:34.237	f222bf04-a4af-44e3-8e4f-44e14e39b1fb	SUCCESS	\N
2862	2018-12-29 20:36:34.508	6db4da90-d1b6-4b09-a0ee-5568b1433523	SUCCESS	\N
2863	2018-12-29 20:36:34.752	be17f25c-4034-4b69-836c-217fedd7d495	SUCCESS	\N
2867	2018-12-29 20:52:41.858	48ca90f5-5d11-4f5b-994e-a2d28814638d	SUCCESS	\N
2868	2018-12-29 20:52:42.057	2d5f1c5a-cf97-4c21-ac9b-eab1f6ee42dd	SUCCESS	\N
2869	2018-12-29 20:52:42.324	1f165ef2-d094-46a9-bd92-efde859536ea	SUCCESS	\N
2870	2018-12-29 20:52:42.47	284613bf-a13f-4624-b5de-84f200992cfe	SUCCESS	\N
2871	2018-12-29 20:52:42.624	501ed457-245a-4560-964a-0f8bb55510a0	SUCCESS	\N
2879	2018-12-30 14:51:16.312	8201e022-f310-4c31-8d88-9d0a69573cbd	SUCCESS	\N
2880	2018-12-30 14:51:18.822	38e2f953-7566-49c5-94de-08e6f754f5d6	SUCCESS	\N
2881	2018-12-30 14:51:19.177	98e902e1-bce8-4f71-b2c7-c2de32e2f42c	SUCCESS	\N
2882	2018-12-30 14:51:19.445	2903d184-f91e-4e2f-a9e0-a66d605573f5	SUCCESS	\N
2883	2018-12-30 14:51:19.699	d1cfd4d3-d6ee-4f23-9186-0c11a3a2c025	SUCCESS	\N
2889	2018-12-30 14:54:27.017	10a6b9e2-3d8d-4a7f-aa83-7dbac13b4772	SUCCESS	\N
2890	2018-12-30 14:54:27.316	92d7f5a8-04c9-44f6-bb61-17c2701c118d	SUCCESS	\N
2891	2018-12-30 14:54:27.516	1925b680-cb84-4e9f-9b05-ee4fadd8b970	SUCCESS	\N
2892	2018-12-30 14:54:27.738	7f761f27-36a9-49eb-8850-594915c32342	SUCCESS	\N
2893	2018-12-30 14:54:27.927	fd962a4f-ade1-4702-bc43-0334a2e479d6	SUCCESS	\N
2894	2018-12-30 14:55:10.104	55400691-599d-4b0b-9e41-14a6ea535d78	SUCCESS	\N
2895	2018-12-30 14:55:10.359	c866de0d-cd52-48e1-bcba-dd606109a4b0	SUCCESS	\N
2896	2018-12-30 14:55:10.537	d930e943-7100-4bdb-a106-bc7cc1741085	SUCCESS	\N
2897	2018-12-30 14:55:10.747	c987aefa-9fdb-4962-a8c4-c31d241511b7	SUCCESS	\N
2898	2018-12-30 14:55:10.892	d3dc8516-314c-44bd-9201-a687d3946f72	SUCCESS	\N
2901	2018-12-30 14:56:23.295	5728f1f2-d042-44d9-9e91-89ac3d2d5ddf	SUCCESS	\N
2902	2018-12-30 14:56:23.481	2a8ede0f-2b1d-4548-b56b-ed5ff00e5354	SUCCESS	\N
2903	2018-12-30 14:56:23.618	fbd9dcb8-b496-4359-bf1e-15c66282a663	SUCCESS	\N
2904	2018-12-30 14:56:23.805	01302b0a-a7c6-467a-a113-85fec185a2fe	SUCCESS	\N
2905	2018-12-30 14:56:24.04	b6842a0a-e854-48b3-a53b-168fe90cfc49	SUCCESS	\N
2906	2018-12-30 14:56:53.651	fa03b727-720a-404a-9903-51ee408e1c53	SUCCESS	\N
2907	2018-12-30 14:56:53.861	0d714935-b258-4afe-898f-b944d8374de1	SUCCESS	\N
2908	2018-12-30 14:56:54.039	f44b9f65-4d4c-4a4e-af2f-fb0404fdbf96	SUCCESS	\N
2909	2018-12-30 14:56:54.183	ee8d76b2-f0ea-40cb-9284-a5c06cd4e4bf	SUCCESS	\N
2910	2018-12-30 14:56:54.306	e4f84303-3872-431d-a472-6d03a9dc0722	SUCCESS	\N
2915	2018-12-30 15:11:57.083	6a320496-9d39-4655-8e7e-cf1f297925e4	SUCCESS	\N
2918	2018-12-30 15:12:40.215	ad94a4ef-e04a-40ab-825b-43ba03ee7f06	SUCCESS	\N
2921	2018-12-30 15:12:47.463	45cd4596-5bb8-49dd-bda2-436b193ca38b	SUCCESS	\N
2924	2018-12-30 15:12:58.804	ec4c0e03-0e2d-41f3-8e77-efc263faabea	SUCCESS	\N
2927	2018-12-30 15:13:32.566	a40cb91a-8a4d-4b07-a3bf-d404f3efeb74	SUCCESS	\N
2932	2018-12-30 15:15:21.391	31a11656-6bb7-41d4-86d8-21b1cbb84efe	SUCCESS	\N
2935	2018-12-30 15:17:27.819	4cca6c4f-2666-422a-8d2c-68f1dd7e0b65	SUCCESS	\N
2936	2018-12-30 15:17:28.074	cb5c5847-56ee-4815-a60f-df630e13fc25	SUCCESS	\N
2937	2018-12-30 15:17:28.196	346d3e31-d15b-4f4d-a38f-3c264acb7ae0	SUCCESS	\N
2938	2018-12-30 15:17:28.34	929c78dd-54d8-4607-9d9b-3a1053b0e7d0	SUCCESS	\N
2939	2018-12-30 15:17:28.464	7cb2fc99-8069-444c-88b0-d39fdd16ba77	SUCCESS	\N
2941	2018-12-30 15:19:27.131	dc868beb-0974-4d26-99f5-8716193e42a6	SUCCESS	\N
2942	2018-12-30 15:19:27.419	ecc26d7d-4764-41e5-8c65-942b382b51a6	SUCCESS	\N
2943	2018-12-30 15:19:27.597	a4ca16fd-eed8-4526-a1fb-5447eed7593e	SUCCESS	\N
2944	2018-12-30 15:19:27.753	4146406a-89e8-48e4-bbc5-3ef929ce5775	SUCCESS	\N
2945	2018-12-30 15:19:27.919	b8b4423c-5fee-45d8-a965-a04da7c9a962	SUCCESS	\N
2949	2018-12-30 17:50:45.34	c7c59937-daa5-43e3-ae22-86386abbca6b	SUCCESS	\N
2950	2018-12-30 17:50:45.829	b29a29b2-3b67-4325-a62f-cfc586def5aa	SUCCESS	\N
2951	2018-12-30 17:50:46.095	f7bba2e9-005b-40f8-8973-f048b15b1caf	SUCCESS	\N
2952	2018-12-30 17:50:46.284	fdc31fb1-81c5-4183-a926-889b1d9ed53f	SUCCESS	\N
2953	2018-12-30 17:50:46.585	d7f320c8-8e96-4a5d-9d5f-017316a83449	SUCCESS	\N
2959	2018-12-30 21:33:12.524	740dc494-ac7d-4397-ae15-977f0152b8c4	SUCCESS	\N
2962	2018-12-30 21:33:28.739	eb815924-9f76-4ac0-a175-65cb875bf36b	SUCCESS	\N
2965	2018-12-30 21:33:39.698	c860ca20-2a89-4dbb-93b0-456ff3ae8522	SUCCESS	\N
2968	2018-12-30 21:33:47.113	5207d202-00de-4280-90d1-f32c392f221d	SUCCESS	\N
2971	2018-12-30 21:33:54.611	088d4c7c-5bd1-4e2c-92dc-65cd24ef3591	SUCCESS	\N
2974	2018-12-30 21:34:11.283	7a881cfe-7b4c-4bd2-b2da-99d1e834f850	SUCCESS	\N
2977	2018-12-30 21:36:03.011	0d22a8c6-34a6-4a5a-8e24-976a38fef92e	SUCCESS	\N
2978	2018-12-30 21:36:03.19	ee16cb80-58cb-4132-b296-65546e65144d	SUCCESS	\N
2979	2018-12-30 21:36:03.345	698b4f7c-dbb8-465b-a9b1-07235f25715a	SUCCESS	\N
2980	2018-12-30 21:36:03.479	814ecd07-0482-4167-9e86-d200d7ca22e6	SUCCESS	\N
2981	2018-12-30 21:36:03.801	21a0de15-c7f7-432c-875b-c5e37f7f9f46	SUCCESS	\N
2983	2018-12-30 21:51:22.387	6ee2b769-1064-4d73-ad62-3fcddb5a2427	SUCCESS	\N
2984	2018-12-30 21:51:23.937	5d5810ed-e988-4f03-9dbd-179a133d55f0	SUCCESS	\N
2985	2018-12-30 21:51:24.682	1f3cae74-9796-47a4-9c05-309c97e65e93	SUCCESS	\N
2986	2018-12-30 21:51:25.07	4e706baa-dac4-4d31-94ad-982d2ca6dd2c	SUCCESS	\N
2987	2018-12-30 21:51:25.882	bbb15d4e-ff8e-4c94-a58c-9a45546330c3	SUCCESS	\N
2995	2018-12-31 13:23:21.928	812e1a07-13b6-44e8-8490-9a47bf7ec5dd	SUCCESS	\N
2996	2018-12-31 13:24:34.367	504c8331-5603-45b4-b4f1-852a6a484182	SUCCESS	\N
2997	2018-12-31 13:24:34.854	698e7e97-eab4-4463-945b-fdaee1aeac50	SUCCESS	\N
2998	2018-12-31 13:24:35.187	68240937-d313-48fd-9ae7-91fef3f7f9de	SUCCESS	\N
2999	2018-12-31 13:24:35.421	a4c37e4b-afe9-4207-8480-4a45d5a5615c	SUCCESS	\N
3000	2018-12-31 13:24:35.61	c92a5d6a-57f0-4675-b3cd-5e7297faa1b1	SUCCESS	\N
3002	2018-12-31 13:25:52.413	b8bf5bb1-8e05-46ad-bd6c-63df24ce1af2	SUCCESS	\N
3003	2018-12-31 13:25:52.646	0597a22b-66ec-4d38-b65d-8619e50ee055	SUCCESS	\N
3004	2018-12-31 13:25:52.803	e4da76f3-935b-4944-a77e-f4127f8e78dc	SUCCESS	\N
3005	2018-12-31 13:25:53.042	9d2a9bba-70b2-4c2e-9e76-26f27a5c6b7e	SUCCESS	\N
3006	2018-12-31 13:25:53.257	60cabe22-578b-41f9-a878-4aa0b2837732	SUCCESS	\N
3012	2018-12-31 13:30:02.794	00700379-a313-4a4a-8ac9-c80c31f772bb	SUCCESS	\N
3013	2018-12-31 13:30:03.071	3bcb01cf-df4a-40da-823e-eb7e07b92cc2	SUCCESS	\N
3014	2018-12-31 13:30:03.306	42dc6486-18df-43b0-a964-09ca3cb3dfc5	SUCCESS	\N
3015	2018-12-31 13:30:03.483	6656437d-7b72-4e0b-9d71-b8bd60d4a49d	SUCCESS	\N
3016	2018-12-31 13:30:03.671	23195de3-3896-479c-afb4-9b446eec4b99	SUCCESS	\N
3018	2018-12-31 13:30:54.19	907add67-5480-4a72-aa61-8bb5d147b711	SUCCESS	\N
3019	2018-12-31 13:30:54.4	0b24b163-7351-470d-b1d4-3144fd5fdcd3	SUCCESS	\N
3020	2018-12-31 13:30:54.534	fd3b6a82-0c1e-4071-a106-b85eb1a4f2de	SUCCESS	\N
3021	2018-12-31 13:30:54.767	519e2942-e58e-4ce4-b3cf-2b7bc5d6d33c	SUCCESS	\N
3022	2018-12-31 13:30:54.934	dac3c5cf-515f-4e80-b561-dcc0f30b4308	SUCCESS	\N
3028	2019-01-04 03:07:09.699	b0a42c5b-8cd4-4e9f-94bf-2f7d8c96f759	SUCCESS	\N
3029	2019-01-04 03:07:11.099	6f6b161e-5d4d-4053-a5d3-023ecee69ff6	SUCCESS	\N
3030	2019-01-04 03:07:11.331	9d709834-5793-43c1-9739-64ee95c30001	SUCCESS	\N
3031	2019-01-04 03:07:11.543	6b170b13-1331-4a0e-a2cf-0518207c7258	SUCCESS	\N
3032	2019-01-04 03:07:11.754	0a0ada07-ddc1-4524-b717-55fe32a5759c	SUCCESS	\N
3046	2019-01-04 03:26:52.723	6cdfb221-1804-43af-9570-24e66818ab3d	SUCCESS	\N
3047	2019-01-04 03:26:53.045	22a924a4-089f-4f87-9403-95407e05360f	SUCCESS	\N
3048	2019-01-04 03:26:53.345	5c94375e-ce7b-46ee-8e43-df7b9139fda4	SUCCESS	\N
3049	2019-01-04 03:26:53.601	442b1593-8a9a-4092-a9c4-9fc239830a37	SUCCESS	\N
3050	2019-01-04 03:26:53.767	4c4e7258-33f2-4d9c-afbf-5e721de64c70	SUCCESS	\N
3051	2019-01-04 03:27:10.846	a3fbf449-6b42-4bcc-a514-7f5512cbfff7	SUCCESS	\N
3052	2019-01-04 03:27:11.102	963091b1-48f9-4f1e-bdc3-f4870418912f	SUCCESS	\N
3053	2019-01-04 03:27:11.323	4a880f7e-d446-4bda-a5f3-e19d884503d7	SUCCESS	\N
3054	2019-01-04 03:27:11.524	0d14b3f5-e947-4abd-bb08-ab2d394edc88	SUCCESS	\N
3055	2019-01-04 03:27:11.823	9f51e904-a585-4a98-bf5b-44bf1c6dfadd	SUCCESS	\N
3058	2019-01-04 17:49:17.065	40d48ffc-5534-4188-b030-4806f487bd49	SUCCESS	\N
3059	2019-01-04 17:49:18.777	d41d1c34-3d04-4132-b969-d2d889e4c9ff	SUCCESS	\N
3060	2019-01-04 17:49:19.087	255c613c-efb7-49a3-8034-6e2e084ca2c2	SUCCESS	\N
3061	2019-01-04 17:49:19.443	824c37c9-76ca-468a-a6bc-62782ceb9459	SUCCESS	\N
3062	2019-01-04 17:49:19.676	a880c1a6-bf73-4427-b3b8-c95aa027aa4a	SUCCESS	\N
3063	2019-01-04 17:49:23.733	11de2d35-5ad3-47a8-8d61-b0dfb32ead71	SUCCESS	\N
3064	2019-01-04 17:49:23.999	74b9e1fd-73ca-4031-913e-0f6ed20bf72e	SUCCESS	\N
3065	2019-01-04 17:49:24.21	487bccbe-cb36-4d13-9cb0-995fc57c5a50	SUCCESS	\N
3066	2019-01-04 17:49:24.421	4617439e-e5a4-4344-aede-4d18b119747b	SUCCESS	\N
3067	2019-01-04 17:49:24.665	df98fea9-e106-42ae-aa7c-af5ffdc29a0f	SUCCESS	\N
3068	2019-01-04 17:49:30.31	45efe0a8-787e-4477-87a4-9e8e1de5e6a2	SUCCESS	\N
3069	2019-01-04 17:49:30.444	3877aaf6-d2ea-4631-aea7-233555c229e7	SUCCESS	\N
3070	2019-01-04 17:49:30.577	7d572ee9-d714-42dd-b209-054132fc42d2	SUCCESS	\N
3071	2019-01-04 17:49:30.699	24218120-280a-426c-a8c4-008007214441	SUCCESS	\N
3072	2019-01-04 17:49:30.811	15c9cdaa-ffbb-4e7d-adf8-43beb2a7249c	SUCCESS	\N
3073	2019-01-04 17:50:24.825	419e9576-b8a7-4b31-b3a8-c1792c62465d	SUCCESS	\N
3074	2019-01-04 17:50:25.058	7fa5bba1-d440-4172-9b9a-3193a9c03de8	SUCCESS	\N
3075	2019-01-04 17:50:25.224	9d66bc03-7464-479a-ac88-b67e94dc7588	SUCCESS	\N
3076	2019-01-04 17:50:25.38	c1bffed1-aeb3-4bde-82e9-457e16ece0c8	SUCCESS	\N
3077	2019-01-04 17:50:25.535	852af7d8-04d7-4e05-87f9-e4d6e4af60b2	SUCCESS	\N
3078	2019-01-04 17:50:32.469	f98cf0c9-2cfe-46fd-acaf-3fced181f44f	SUCCESS	\N
3079	2019-01-04 17:50:32.67	77f4bd4b-e90d-45e4-b1f5-0a29b4e391ee	SUCCESS	\N
3080	2019-01-04 17:50:32.825	6aee01a0-4896-4eb5-8b2d-410cf5e0d948	SUCCESS	\N
3081	2019-01-04 17:50:32.981	36185087-ea64-4fbf-bd6d-2ec9f245d2e8	SUCCESS	\N
3082	2019-01-04 17:50:33.158	9e11d6dd-b652-455f-adcc-1f00b4578f2a	SUCCESS	\N
3092	2019-01-05 17:24:52.952	f462be34-08a5-492a-b9a8-380e4a6e233b	ERROR	I/O error: evaluation-results-service; nested exception is java.net.UnknownHostException: evaluation-results-service
3095	2019-01-05 17:25:02.472	bf55af3b-0baf-4b1c-ac99-9e7e02571c43	ERROR	I/O error: evaluation-results-service; nested exception is java.net.UnknownHostException: evaluation-results-service
3098	2019-01-05 17:25:12.548	7b84c03d-d0ef-46a1-b3a7-c9f331416e4e	ERROR	I/O error: evaluation-results-service; nested exception is java.net.UnknownHostException: evaluation-results-service
3101	2019-01-05 17:25:23.751	a6c8da4f-6b4f-46e2-9515-3ed28a559fdf	ERROR	I/O error: evaluation-results-service; nested exception is java.net.UnknownHostException: evaluation-results-service
3104	2019-01-05 17:25:34.266	8481cbf3-0b08-4cb2-992b-db990453ca7d	ERROR	I/O error: evaluation-results-service; nested exception is java.net.UnknownHostException: evaluation-results-service
3107	2019-01-05 17:25:44.207	a68c4fc2-565f-447e-9317-93ad6f674e0b	ERROR	I/O error: evaluation-results-service; nested exception is java.net.UnknownHostException: evaluation-results-service
3110	2019-01-05 17:25:54.206	05915c78-a96b-41d8-b1cc-a2c86c0347e2	ERROR	I/O error: evaluation-results-service; nested exception is java.net.UnknownHostException: evaluation-results-service
3113	2019-01-05 17:26:08.343	86d70574-c228-4966-a91b-41d1e49c0cec	ERROR	I/O error: evaluation-results-service; nested exception is java.net.UnknownHostException: evaluation-results-service
3123	2019-01-05 18:55:29.022	d0727e05-9508-470f-88df-1f594f62a63a	SUCCESS	\N
3124	2019-01-05 18:55:30.788	bb540eaf-3dda-404f-b096-2bdd9daa18db	SUCCESS	\N
3125	2019-01-05 18:55:31.055	7bd7efb6-bf04-4a59-acde-2f9132a7ce17	SUCCESS	\N
3126	2019-01-05 18:55:31.31	15ed9538-6074-4613-af65-2b20c723db89	SUCCESS	\N
3127	2019-01-05 18:55:31.477	bf9889a0-595f-4a8d-bf25-75f3ddd98dc7	SUCCESS	\N
3130	2019-01-05 19:20:00.933	582ee5ef-56a4-4b5e-a23d-d58de6ee9847	SUCCESS	\N
3133	2019-01-05 19:20:12.918	66f771f2-fc01-4718-84e6-abf1b1cd974b	SUCCESS	\N
3136	2019-01-05 19:20:24.809	23e538f1-9d67-4d4c-bbd9-0b508b72a940	SUCCESS	\N
3139	2019-01-05 19:20:35.095	5eede6e8-7851-4581-ae7b-2347f3eb8d9d	SUCCESS	\N
3142	2019-01-05 19:20:54.723	7e781bb1-32ed-46e3-afd7-2c4a27153fdb	SUCCESS	\N
3145	2019-01-05 19:21:06.535	ff3cc5b7-dd47-409f-aa83-bb22ad454ef6	SUCCESS	\N
3148	2019-01-05 19:22:04.027	22876c30-d769-4c43-b433-9e8ba2849be1	SUCCESS	\N
3149	2019-01-05 19:22:04.305	1d95715c-a4ae-4f4c-bb9e-9e9dff3f693e	SUCCESS	\N
3150	2019-01-05 19:22:04.605	fb42af62-c043-4d55-988d-96f5284d2b5c	SUCCESS	\N
3151	2019-01-05 19:22:04.838	304641d4-101b-4ba3-8a7c-d83306aab4bd	SUCCESS	\N
3152	2019-01-05 19:22:05.149	6e70a499-1d44-4d7f-a584-d22b09b782eb	SUCCESS	\N
3153	2019-01-05 19:22:26.838	e98f23f0-214f-4a51-8f91-cdcb7f2cecbf	SUCCESS	\N
3154	2019-01-05 19:30:33.021	a6b83a6e-c831-4688-b1d7-e77d67265c47	SUCCESS	\N
3155	2019-01-05 19:30:33.287	9e8c78a2-56c9-47a7-b9ea-3e4d553c3850	SUCCESS	\N
3156	2019-01-05 19:30:33.488	fd3ee167-bdb2-49e4-aa09-11ee26c4bb83	SUCCESS	\N
3157	2019-01-05 19:30:33.687	0e692a08-b069-4e7f-9b97-e3cce0222d56	SUCCESS	\N
3158	2019-01-05 19:30:33.854	11e769a2-f1d6-4b45-90df-7d57c92e53f8	SUCCESS	\N
3165	2019-01-05 19:40:23.804	7152c8f4-d617-46d2-bda1-a0dd85d02a7b	SUCCESS	\N
3170	2019-01-05 19:43:09.549	d6d7d9e2-0c81-4659-a56f-290911b4476c	SUCCESS	\N
3178	2019-01-05 19:44:23.353	693f0058-8234-400c-a47d-bfaa9ba69445	SUCCESS	\N
3183	2019-01-05 19:44:54.064	75a826ae-17c5-4ef3-bb62-2cebd8aff7fe	SUCCESS	\N
3213	2019-02-23 00:18:06.543	1c350ea9-3b71-43dc-8253-7b7e906e801c	SUCCESS	\N
3216	2019-02-23 00:22:36.278	bfa8b120-452f-4bfe-861b-d1f6a699852f	SUCCESS	\N
3217	2019-02-23 00:22:36.647	454e8681-d575-4b47-9436-3e93639ca5e2	SUCCESS	\N
3218	2019-02-23 00:22:37.033	3bd64ec6-fdde-4b54-91f1-6682e6040c1e	SUCCESS	\N
3219	2019-02-23 00:22:37.363	68a43691-426c-4b6c-b9a1-e37ece404e95	SUCCESS	\N
3220	2019-02-23 00:22:37.617	2fa5e269-0409-44f8-ae8a-d79fea20b0c8	SUCCESS	\N
6875	2019-04-13 14:46:18.992	5fe62010-3053-4ebe-bd30-9faaa971de81	SUCCESS	\N
6883	2019-04-13 14:47:54.683	cd815697-3487-41ab-aad7-7c61045b554f	SUCCESS	\N
6891	2019-04-13 14:48:32.103	936b868d-8b14-4c27-a073-a8c87d156c60	SUCCESS	\N
6896	2019-04-13 14:48:41.887	b5b5dc0c-5d56-463a-b7ea-2160bb929707	SUCCESS	\N
6904	2019-04-13 14:50:07.547	12732a82-3852-441a-8714-0618891bc881	SUCCESS	\N
6912	2019-04-13 14:50:23.696	1512a491-f7de-4de0-b283-5cd0134801f5	SUCCESS	\N
6922	2019-04-13 14:55:29.939	fb79866b-f6ed-4db0-959e-7f1ae3a79f52	SUCCESS	\N
6934	2019-04-13 14:56:18.282	d19c1248-8ab1-4ad8-87ff-1ffb993632dc	SUCCESS	\N
6946	2019-04-13 14:57:02.574	6a551411-4035-4716-8af2-0e513c6db5a5	SUCCESS	\N
6958	2019-04-13 14:57:45.12	61b4a186-4a19-43a9-8f83-cba85f74cc5f	SUCCESS	\N
6966	2019-04-13 15:29:40.422	851c22db-dd76-48cf-9006-96de3d688e2d	SUCCESS	\N
6967	2019-04-13 15:29:58.227	f4919a1c-80bc-48ac-896a-e846fe0c65a3	SUCCESS	\N
6988	2019-04-13 15:30:55.812	f3808ebd-aea9-4a0d-ac51-7efe8a308f00	SUCCESS	\N
7000	2019-04-13 15:31:23.308	4d60b504-a6b8-4376-bf6b-8284870ba379	SUCCESS	\N
7012	2019-04-13 15:32:10.778	c7ea8f20-e4ab-43e8-9192-9a0abd066145	SUCCESS	\N
7024	2019-04-13 15:32:28.626	65ec9326-1dfb-4dba-8327-9b297c6384cf	SUCCESS	\N
7036	2019-04-13 15:32:49.873	1982eb18-5a4f-4dbf-b8c2-01011a96b6a8	SUCCESS	\N
7048	2019-04-13 15:33:19.262	bce7e604-b7fd-43c0-8187-eed2c9003408	SUCCESS	\N
7060	2019-04-13 15:33:44.868	b5514850-974d-4c9a-8d60-17a0ee6ebc68	SUCCESS	\N
7072	2019-04-13 15:34:07.635	7215a121-ec5e-4cdd-a85c-915a07dcaede	SUCCESS	\N
7084	2019-04-13 15:34:33.347	7581ae59-5ccf-4242-b964-f63021338713	SUCCESS	\N
7096	2019-04-13 15:34:57.556	a2972701-2c7e-41db-a4c0-37273d6f9b32	SUCCESS	\N
7108	2019-04-13 15:35:23.348	44cc8a80-1f67-4da9-a1c3-a6a3c957b0e8	SUCCESS	\N
7120	2019-04-13 15:35:50.459	7e4735a6-df39-4b64-a401-a356c90d9fa1	SUCCESS	\N
7121	2019-04-13 15:35:57.289	8c161cbf-b675-459c-bb44-7c0f40304ecd	SUCCESS	\N
7142	2019-04-13 15:37:09.974	edc844ad-f5eb-4e84-8b9a-5072712c8995	SUCCESS	\N
7150	2019-04-13 15:37:34.288	1b035c69-1d76-4427-86f8-1871776cb2cc	SUCCESS	\N
7158	2019-04-13 15:37:57.135	c08962e5-ed81-4b31-a558-2c906c569ed6	SUCCESS	\N
7166	2019-04-13 15:38:16.611	913894b1-0619-47a4-8b12-1c9e8c9529c3	SUCCESS	\N
7174	2019-04-13 15:38:55.713	b3e026ef-c915-4b7f-b9b4-e528b988cb98	SUCCESS	\N
7182	2019-04-13 15:39:12.052	23415411-b3f1-40d8-8f44-1e00231b476f	SUCCESS	\N
7190	2019-04-13 15:39:31.488	3e7fe2a3-f73d-4d83-b0e5-7b4a38b37ad7	SUCCESS	\N
7198	2019-04-13 15:39:51.237	ed572391-b081-4cad-aac6-98ce81039f69	SUCCESS	\N
7206	2019-04-13 15:40:07.846	4c1bce21-a3ef-4156-b37c-c60b250e881c	SUCCESS	\N
7214	2019-04-13 15:40:23.284	18b2c4d7-0247-4b1e-b6ee-4f996fd524a3	SUCCESS	\N
7222	2019-04-13 15:40:41.531	7e225521-80d4-493a-b3cb-6bc5f47983de	SUCCESS	\N
7230	2019-04-13 15:40:56.8	a1ea9d9a-8c3e-443f-8b32-b59a1ca4f8f3	SUCCESS	\N
7238	2019-04-13 15:41:30.221	f68fdfb0-bfa4-411d-be09-09af0bfcb6e3	SUCCESS	\N
7246	2019-04-13 15:41:59.497	dd3c5138-6970-411b-83ae-852fd35256b9	SUCCESS	\N
7254	2019-04-13 15:42:32.129	5643d43b-3e50-4e10-8777-9e5242e5d1ba	SUCCESS	\N
7255	2019-04-13 15:42:53.604	ab923f4f-6404-4bc7-b6a4-548f08783a01	SUCCESS	\N
7272	2019-04-13 16:19:29.273	23f345d0-cc90-4fe0-b668-701c8b265d93	SUCCESS	\N
7280	2019-04-13 16:19:56.281	6b35a6af-6034-4743-a29f-8d70833eb87d	SUCCESS	\N
7288	2019-04-13 16:20:15.405	3399a79a-b68b-4581-862e-8b8c6ed37fce	SUCCESS	\N
7296	2019-04-13 16:20:30.228	a2e3c204-4b40-4066-a04a-18a8c9021ceb	SUCCESS	\N
7297	2019-06-03 23:04:53.353	40e40d1f-f3af-4e61-98eb-d2d4ae634758	SUCCESS	\N
7307	2019-06-03 23:04:57.442	d0630e75-9853-45f1-babf-f0e897846cdc	SUCCESS	\N
\.


--
-- TOC entry 2512 (class 0 OID 16501)
-- Dependencies: 206
-- Data for Name: evaluation_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evaluation_log (id, creation_date, end_date, error_message, evaluation_method, request_status, start_date, instances_info_id, request_id, classifier_info_id, num_folds, num_tests, seed) FROM stdin;
415	2018-02-02 00:44:29.827	2018-02-02 00:44:29.872	\N	TRAINING_DATA	FINISHED	2018-02-02 00:44:29.827	416	23d1c7bb-5a41-4ee1-a71d-0deb2a9e2f5e	728	\N	\N	\N
783	2018-03-28 22:54:28.985	2018-03-28 22:54:28.999	\N	TRAINING_DATA	FINISHED	2018-03-28 22:54:28.985	784	7ddd25cf-00b9-4014-8309-6f497421554b	836	\N	\N	\N
417	2018-02-02 00:45:50.157	2018-02-02 00:45:51.861	\N	TRAINING_DATA	FINISHED	2018-02-02 00:45:50.157	418	409cd0f4-889b-4c32-98ee-113f4c77be38	729	\N	\N	\N
262	2017-11-06 13:00:33.177	2017-11-06 13:00:33.219	\N	TRAINING_DATA	FINISHED	2017-11-06 13:00:33.177	263	75d65057-abd5-452b-af8b-c0e69dee0718	685	\N	\N	\N
302	2017-12-30 02:13:38.743	2017-12-30 02:13:40.693	\N	TRAINING_DATA	FINISHED	2017-12-30 02:13:38.743	303	9a0a9525-053d-43fa-88a6-430dbe23d848	700	\N	\N	\N
306	2017-12-31 02:02:22.906	2017-12-31 02:02:23.906	\N	TRAINING_DATA	FINISHED	2017-12-31 02:02:22.906	307	4b2b5ec7-5308-456a-b14d-f4862f1dd88b	701	\N	\N	\N
310	2017-12-31 15:51:01.82	2017-12-31 15:51:03.791	\N	TRAINING_DATA	FINISHED	2017-12-31 15:51:01.82	311	af6dd9de-a662-46bb-87f5-a52fead4f5b4	702	\N	\N	\N
327	2018-01-01 16:56:48.25	2018-01-01 16:56:52.5	\N	TRAINING_DATA	FINISHED	2018-01-01 16:56:48.25	328	90b077d6-dee4-4522-9a5a-e6b7dc126b02	705	\N	\N	\N
382	2018-01-06 01:02:20.023	2018-01-06 01:02:22.555	\N	TRAINING_DATA	FINISHED	2018-01-06 01:02:20.023	383	89135f15-3d2a-4e05-851e-294dbee98bac	724	\N	\N	\N
409	2018-02-02 00:43:23.035	2018-02-02 00:43:26.255	\N	TRAINING_DATA	FINISHED	2018-02-02 00:43:23.035	410	41c1f5a8-1aef-4cae-a209-065f28c3a35d	726	\N	\N	\N
413	2018-02-02 00:44:18.062	2018-02-02 00:44:18.094	\N	TRAINING_DATA	FINISHED	2018-02-02 00:44:18.062	414	12046f73-93e7-4f41-ab6a-4b322a9da95f	727	\N	\N	\N
421	2018-02-02 01:04:05.633	2018-02-02 01:04:07.641	\N	TRAINING_DATA	FINISHED	2018-02-02 01:04:05.633	422	bc88336d-d04b-4521-bcfd-f2015bd92a9a	730	\N	\N	\N
425	2018-02-02 01:04:36.985	2018-02-02 01:04:40.192	\N	TRAINING_DATA	FINISHED	2018-02-02 01:04:36.985	426	3e24b75a-dfda-4b99-a5a4-d23e8e3828a2	731	\N	\N	\N
427	2018-02-02 01:04:55.631	2018-02-02 01:04:57.164	\N	TRAINING_DATA	FINISHED	2018-02-02 01:04:55.631	428	f8a3717b-ca5d-4445-ba8a-078f28d8565a	732	\N	\N	\N
433	2018-02-02 01:07:58.914	2018-02-02 01:07:58.998	Не удалось построить модель: ни один классификатор не был включен в ансамбль!	TRAINING_DATA	ERROR	2018-02-02 01:07:58.914	434	fc201f6d-5eea-4776-bacd-458c8245d293	733	\N	\N	\N
435	2018-02-02 01:08:11.549	2018-02-02 01:08:11.593	\N	TRAINING_DATA	FINISHED	2018-02-02 01:08:11.549	436	db91777d-2869-48d7-91b9-eac6c00b3061	734	\N	\N	\N
437	2018-02-02 01:08:22.493	2018-02-02 01:08:22.557	\N	TRAINING_DATA	FINISHED	2018-02-02 01:08:22.493	438	84bf2c52-33a4-4427-8507-f685387d1751	735	\N	\N	\N
439	2018-02-02 01:08:37.766	2018-02-02 01:08:37.799	\N	TRAINING_DATA	FINISHED	2018-02-02 01:08:37.766	440	21c22938-c487-4ed7-8b96-8291a84d2c8a	736	\N	\N	\N
441	2018-02-02 01:08:50.15	2018-02-02 01:08:50.233	\N	TRAINING_DATA	FINISHED	2018-02-02 01:08:50.15	442	32da253f-3784-4de7-96dd-266a5f085842	737	\N	\N	\N
443	2018-02-02 01:09:30.839	2018-02-02 01:09:30.854	\N	TRAINING_DATA	ERROR	2018-02-02 01:09:30.839	444	2b7d4357-fe87-40bd-aa87-5b2ceb69a3b0	738	\N	\N	\N
447	2018-02-02 01:37:37.344	2018-02-02 01:37:37.654	\N	TRAINING_DATA	FINISHED	2018-02-02 01:37:37.344	448	aac5964d-ad59-4b77-85bd-4ea42155eeb0	739	\N	\N	\N
449	2018-02-02 01:37:59.628	2018-02-02 01:37:59.859	\N	TRAINING_DATA	FINISHED	2018-02-02 01:37:59.628	450	3ab49f1c-9d05-430d-a02f-da3b3924d851	740	\N	\N	\N
453	2018-02-02 01:39:05.505	2018-02-02 01:39:07.97	\N	TRAINING_DATA	FINISHED	2018-02-02 01:39:05.505	454	b012fd6c-6e69-41d4-8d90-fb2d53360d93	741	\N	\N	\N
455	2018-02-02 01:39:36.168	2018-02-02 01:39:37.478	\N	TRAINING_DATA	FINISHED	2018-02-02 01:39:36.168	456	069bbd97-a3be-4416-85f2-9a82e518a191	742	\N	\N	\N
457	2018-02-02 01:39:52.028	2018-02-02 01:39:54.433	\N	TRAINING_DATA	FINISHED	2018-02-02 01:39:52.028	458	b04729aa-c2e5-4e1d-90af-8fe7c8bfeab6	743	\N	\N	\N
461	2018-02-03 03:01:39.458	2018-02-03 03:01:41.645	\N	TRAINING_DATA	FINISHED	2018-02-03 03:01:39.458	462	656e1149-838b-4c1d-ae45-1a8809f83a0c	744	\N	\N	\N
463	2018-02-03 03:02:19.974	2018-02-03 03:02:20.474	\N	TRAINING_DATA	FINISHED	2018-02-03 03:02:19.974	464	b6d088f0-344f-4deb-9ac7-0013b41e1bd2	745	\N	\N	\N
467	2018-02-03 11:17:33.576	2018-02-03 11:17:36.311	\N	TRAINING_DATA	FINISHED	2018-02-03 11:17:33.576	468	d09a0ca1-8bcb-4d8b-8650-838ebd89ce05	746	\N	\N	\N
475	2018-02-03 14:00:47.18	2018-02-03 14:00:48.802	\N	TRAINING_DATA	FINISHED	2018-02-03 14:00:47.18	476	1f8b25d1-0e48-46ad-b7f0-8e64cc5bf9f2	747	\N	\N	\N
477	2018-02-03 14:01:08.371	2018-02-03 14:01:08.417	\N	TRAINING_DATA	FINISHED	2018-02-03 14:01:08.371	478	446bb1f7-7904-43b1-8359-0717192e1b59	748	\N	\N	\N
481	2018-02-03 14:01:28.853	2018-02-03 14:01:28.938	\N	TRAINING_DATA	FINISHED	2018-02-03 14:01:28.853	482	a88e3053-a261-4302-bc96-deb78b8ca0eb	749	\N	\N	\N
483	2018-02-03 14:01:41.313	2018-02-03 14:02:01.174	\N	TRAINING_DATA	FINISHED	2018-02-03 14:01:41.313	484	3c8f1c49-39f7-4da4-8560-8dd70f9acde2	750	\N	\N	\N
485	2018-02-03 14:02:24.289	2018-02-03 14:02:27.598	\N	TRAINING_DATA	FINISHED	2018-02-03 14:02:24.289	486	57169457-b084-4a9b-a37e-a725a14d7fb2	751	\N	\N	\N
514	2018-02-03 14:09:57.863	2018-02-03 14:09:58.13	\N	TRAINING_DATA	FINISHED	2018-02-03 14:09:57.863	515	2f55a0ce-86cb-41a7-8a4d-4beb7d24a5a6	761	\N	\N	\N
635	2018-02-05 23:46:37.128	2018-02-05 23:46:38.205	\N	TRAINING_DATA	FINISHED	2018-02-05 23:46:37.128	636	67a32ce9-8364-4a9d-b696-dc1da6e3b9fd	790	\N	\N	\N
639	2018-02-08 23:28:17.294	2018-02-08 23:28:17.419	\N	TRAINING_DATA	FINISHED	2018-02-08 23:28:17.294	640	c9681d0d-f651-4116-9f0a-b0be4cb8060b	791	\N	\N	\N
643	2018-02-18 15:43:37.605	2018-02-18 15:43:48.475	\N	TRAINING_DATA	FINISHED	2018-02-18 15:43:37.605	644	d175bf56-5708-480a-a55c-6e1a1998806b	792	\N	\N	\N
645	2018-02-18 15:45:01.065	2018-02-18 15:45:02.549	\N	TRAINING_DATA	FINISHED	2018-02-18 15:45:01.065	646	04625b20-810d-432f-a343-295dddee34f8	793	\N	\N	\N
649	2018-02-18 15:45:31.763	2018-02-18 15:45:33.53	\N	TRAINING_DATA	FINISHED	2018-02-18 15:45:31.763	650	37f2afad-63c5-4dd8-8a4e-69f5eb0eff90	794	\N	\N	\N
651	2018-02-18 15:45:45.496	2018-02-18 15:45:46.543	\N	TRAINING_DATA	FINISHED	2018-02-18 15:45:45.496	652	46fa10df-695b-481d-b16e-baa142f4a260	795	\N	\N	\N
655	2018-02-18 15:46:49.273	2018-02-18 15:46:50.195	\N	TRAINING_DATA	FINISHED	2018-02-18 15:46:49.273	656	fb71d31f-bfb3-4b09-b3ca-b49ff5968494	796	\N	\N	\N
657	2018-02-18 15:47:02.759	2018-02-18 15:47:03.728	\N	TRAINING_DATA	FINISHED	2018-02-18 15:47:02.759	658	05b6dd57-55b9-41d4-a80d-a3fc047cde79	797	\N	\N	\N
659	2018-02-18 15:47:14.21	2018-02-18 15:47:15.148	\N	TRAINING_DATA	FINISHED	2018-02-18 15:47:14.21	660	4eff87f4-1dc1-47cc-a319-36b78fecfe05	798	\N	\N	\N
671	2018-02-23 02:05:41.242	2018-02-23 02:05:43.565	\N	TRAINING_DATA	FINISHED	2018-02-23 02:05:41.242	672	878c24a1-afa8-451a-9469-05d2155388e3	802	\N	\N	\N
673	2018-02-23 02:05:56.073	2018-02-23 02:05:56.255	\N	TRAINING_DATA	FINISHED	2018-02-23 02:05:56.073	674	72e3dadd-0cd6-4c66-afa3-0d927208f009	803	\N	\N	\N
679	2018-02-25 00:43:57.294	2018-02-25 00:43:57.345	\N	TRAINING_DATA	FINISHED	2018-02-25 00:43:57.294	680	50e53444-61c3-4a89-a9ee-a5ea03d07ba2	804	\N	\N	\N
681	2018-03-07 23:58:27.458	2018-03-07 23:58:29.571	\N	TRAINING_DATA	FINISHED	2018-03-07 23:58:27.458	682	9535d256-c36e-464d-9fdb-c9915c17bf48	805	\N	\N	\N
685	2018-03-07 23:59:10.938	2018-03-07 23:59:12.235	\N	TRAINING_DATA	FINISHED	2018-03-07 23:59:10.938	686	51b4fde3-7260-4873-8007-bcb138f03b8a	806	\N	\N	\N
687	2018-03-07 23:59:34.496	2018-03-07 23:59:40.352	\N	TRAINING_DATA	FINISHED	2018-03-07 23:59:34.496	688	824f7f24-8e0d-4b15-8ddb-58e9562f1fd3	807	\N	\N	\N
689	2018-03-07 23:59:57.673	2018-03-08 00:00:01.033	\N	TRAINING_DATA	FINISHED	2018-03-07 23:59:57.674	690	ac30e400-1f03-4434-9a64-cc46a7dfc36b	808	\N	\N	\N
693	2018-03-08 00:00:43.126	2018-03-08 00:00:49.059	\N	TRAINING_DATA	FINISHED	2018-03-08 00:00:43.126	694	10fddf33-5b80-4d50-b747-f7949063127c	809	\N	\N	\N
764	2018-03-09 22:23:14.697	2018-03-09 22:23:22.89	\N	TRAINING_DATA	FINISHED	2018-03-09 22:23:14.697	765	5d3de952-ada9-477e-ba4d-d499467813c8	831	\N	\N	\N
768	2018-03-09 22:24:20.695	2018-03-09 22:24:25.145	\N	TRAINING_DATA	FINISHED	2018-03-09 22:24:20.695	769	cb00e875-8dac-49dd-a487-be6a5344eba1	832	\N	\N	\N
770	2018-03-09 22:24:43.001	2018-03-09 22:24:44.973	\N	TRAINING_DATA	FINISHED	2018-03-09 22:24:43.001	771	1fb4356e-2502-493d-ae91-0e83dfe81004	833	\N	\N	\N
772	2018-03-09 22:25:39.288	2018-03-09 22:25:41.099	\N	TRAINING_DATA	FINISHED	2018-03-09 22:25:39.288	773	04a6eed9-815e-4d22-be9f-89b51b659a7c	834	\N	\N	\N
781	2018-03-28 22:51:34.871	2018-03-28 22:51:42.498	\N	TRAINING_DATA	FINISHED	2018-03-28 22:51:34.871	782	519f3a0d-4742-4aef-86a6-31bfd4729b78	835	\N	\N	\N
785	2018-03-28 22:56:58.564	2018-03-28 22:56:58.574	\N	TRAINING_DATA	FINISHED	2018-03-28 22:56:58.564	786	6bcb5ece-6e25-41d3-ae29-1cba8e9d5a1d	837	\N	\N	\N
790	2018-03-31 13:03:13.976	2018-03-31 13:03:14.35	\N	TRAINING_DATA	FINISHED	2018-03-31 13:03:13.976	791	05f70a67-fc38-4f11-8861-213e9b808a4e	838	\N	\N	\N
813	2018-04-01 17:09:00.181	2018-04-01 17:09:00.522	\N	TRAINING_DATA	FINISHED	2018-04-01 17:09:00.181	814	4c9d8b7e-d2a3-4b97-928b-e2201a7b4e61	843	\N	\N	\N
847	2018-04-25 23:49:40.441	2018-04-25 23:49:41.947	\N	TRAINING_DATA	FINISHED	2018-04-25 23:49:40.441	848	515e027d-e7ed-4576-b6d3-29a40e92f522	844	\N	\N	\N
849	2018-04-25 23:52:13.528	2018-04-25 23:52:13.563	\N	TRAINING_DATA	FINISHED	2018-04-25 23:52:13.528	850	d4ae89cc-16e4-42dd-be2a-8bb73a248ee0	845	\N	\N	\N
853	2018-04-26 00:00:29.591	2018-04-26 00:00:29.851	\N	TRAINING_DATA	FINISHED	2018-04-26 00:00:29.591	854	cb2a3331-dd5b-4d34-873d-40c166ebbf2e	846	\N	\N	\N
855	2018-04-26 00:03:58.51	2018-04-26 00:03:58.912	\N	TRAINING_DATA	FINISHED	2018-04-26 00:03:58.51	856	f1ccfb1d-5912-482e-bc91-b27770391652	847	\N	\N	\N
857	2018-04-27 23:32:17.99	2018-04-27 23:32:19.484	\N	TRAINING_DATA	FINISHED	2018-04-27 23:32:17.99	858	d8585c61-7b4b-4a66-b5ab-ce5e603ab348	848	\N	\N	\N
861	2018-04-27 23:48:33.797	2018-04-27 23:48:41.004	\N	TRAINING_DATA	FINISHED	2018-04-27 23:48:33.797	862	b054bf09-9726-4bf1-a513-36f55af81eb2	849	\N	\N	\N
865	2018-04-27 23:58:08.753	2018-04-27 23:58:08.896	\N	TRAINING_DATA	FINISHED	2018-04-27 23:58:08.754	866	30a95eed-e125-4318-bab9-5af78b1a317b	850	\N	\N	\N
869	2018-04-29 00:32:08.22	2018-04-29 00:32:08.423	\N	TRAINING_DATA	FINISHED	2018-04-29 00:32:08.22	870	c9c61bb0-5a5c-48af-8161-7805f7305801	851	\N	\N	\N
871	2018-05-01 00:06:15.261	2018-05-01 00:06:20.105	\N	TRAINING_DATA	FINISHED	2018-05-01 00:06:15.261	872	230fa1c1-9cbd-4a7e-b774-8b2562e9ec2c	852	\N	\N	\N
873	2018-05-01 00:06:42.996	2018-05-01 00:06:43.371	\N	TRAINING_DATA	FINISHED	2018-05-01 00:06:42.996	874	ba30e775-978c-44f5-aabf-fcb4e7eb6c6d	853	\N	\N	\N
877	2018-05-02 23:52:57.197	2018-05-02 23:52:57.33	\N	TRAINING_DATA	FINISHED	2018-05-02 23:52:57.197	878	15841927-4a35-4940-bab5-33b469bea0b0	854	\N	\N	\N
879	2018-05-02 23:54:29.387	2018-05-02 23:54:30.471	\N	TRAINING_DATA	FINISHED	2018-05-02 23:54:29.387	880	e7349f38-6404-436a-980b-e720a32eb6b3	855	\N	\N	\N
881	2018-05-02 23:57:51.422	2018-05-02 23:57:51.65	\N	TRAINING_DATA	FINISHED	2018-05-02 23:57:51.423	882	7c283d5b-2acb-4521-8912-70123f153da7	856	\N	\N	\N
885	2018-05-05 21:01:38.916	2018-05-05 21:01:39.65	\N	TRAINING_DATA	FINISHED	2018-05-05 21:01:38.916	886	31a9039a-a060-41a3-80bb-addd21d02331	857	\N	\N	\N
887	2018-05-05 21:02:56.463	2018-05-05 21:02:56.557	\N	TRAINING_DATA	FINISHED	2018-05-05 21:02:56.463	888	eebd21b9-17d0-46e9-92c5-e1cc4b3ee030	858	\N	\N	\N
901	2018-05-19 23:35:24.144	2018-05-19 23:35:25.075	\N	TRAINING_DATA	FINISHED	2018-05-19 23:35:24.144	902	1a4d15bb-2eca-42b0-90b1-e8f6a33da4f0	863	\N	\N	\N
910	2018-05-20 00:07:16.315	2018-05-20 00:07:17.596	\N	TRAINING_DATA	FINISHED	2018-05-20 00:07:16.315	911	7d04437c-f40d-41c2-8e0b-07d9acf7a727	864	\N	\N	\N
913	2018-05-20 00:08:22.967	2018-05-20 00:08:23.016	\N	TRAINING_DATA	FINISHED	2018-05-20 00:08:22.967	914	fd6b0af3-9284-4f1c-b3c7-b39c4f3fa2d1	865	\N	\N	\N
916	2018-05-20 00:08:51.712	2018-05-20 00:08:52.024	\N	TRAINING_DATA	FINISHED	2018-05-20 00:08:51.712	917	b824e9a6-fd62-4cb3-97f6-f94c70d324f6	866	\N	\N	\N
922	2018-05-20 01:02:32.554	2018-05-20 01:02:33.626	\N	TRAINING_DATA	FINISHED	2018-05-20 01:02:32.554	923	41874aea-0f2e-4631-8afb-d0ea299a8d99	867	\N	\N	\N
925	2018-05-20 01:05:41.63	2018-05-20 01:05:42.341	\N	TRAINING_DATA	FINISHED	2018-05-20 01:05:41.63	926	66f6cdd6-13d7-4ab1-b0da-aa4576fd8f8d	868	\N	\N	\N
928	2018-05-20 01:05:52.733	2018-05-20 01:05:52.78	\N	TRAINING_DATA	FINISHED	2018-05-20 01:05:52.733	929	1b95a1a9-ec78-4434-9709-5e7ed702e086	869	\N	\N	\N
1711	2018-06-02 00:11:00.939	2018-06-02 00:11:04.437	\N	TRAINING_DATA	FINISHED	2018-06-02 00:11:00.939	1712	a4684fb6-c071-4fdb-a41c-0eb576d6721c	944	\N	\N	\N
1915	2018-06-10 00:33:28.421	2018-06-10 00:33:28.614	\N	TRAINING_DATA	FINISHED	2018-06-10 00:33:28.421	1916	ed992312-93df-4549-91a2-d407fec42110	956	\N	\N	\N
1957	2018-06-10 01:14:43.663	2018-06-10 01:14:45.978	\N	TRAINING_DATA	FINISHED	2018-06-10 01:14:43.663	1958	94b59c0f-c115-4c57-aecd-73142569983e	966	\N	\N	\N
2019	2018-06-10 21:27:08.05	2018-06-10 21:27:09.378	\N	TRAINING_DATA	FINISHED	2018-06-10 21:27:08.05	2020	51f9eb13-1574-44a3-8a49-9553a94c25c1	967	\N	\N	\N
2913	2018-12-30 15:11:56.694	2018-12-30 15:11:56.99	\N	TRAINING_DATA	FINISHED	2018-12-30 15:11:56.694	2914	c96eb67b-5d81-4ac9-9939-3fd173077ec3	1063	\N	\N	\N
677	2018-02-25 00:43:44.467	2018-02-25 00:43:44.78	\N	TRAINING_DATA	FINISHED	2018-02-25 00:43:44.467	678	76e2fdf9-9edb-4262-88a4-8968803b774b	1160	\N	\N	\N
3211	2019-02-23 00:18:05.65	2019-02-23 00:18:06.459	\N	TRAINING_DATA	FINISHED	2019-02-23 00:18:05.65	3212	38660fc5-201f-4a13-b790-b2533ed2f12b	1096	\N	\N	\N
128	2017-11-05 00:58:38.775	2017-11-05 00:58:40.099	\N	TRAINING_DATA	FINISHED	2017-11-05 00:58:38.775	129	903d2b2b-2252-4317-a6f8-0411f1584117	1097	\N	\N	\N
312	2017-12-31 15:51:15.635	2017-12-31 15:51:15.873	\N	TRAINING_DATA	FINISHED	2017-12-31 15:51:15.635	313	cc553fd6-3a43-468d-9557-d8d12a325ffc	1121	\N	\N	\N
384	2018-01-06 01:03:13.668	2018-01-06 01:03:14.413	\N	TRAINING_DATA	FINISHED	2018-01-06 01:03:13.668	385	a0063c9a-88e2-462d-bc73-77f1833efc9f	1129	\N	\N	\N
411	2018-02-02 00:44:04.17	2018-02-02 00:44:04.204	\N	TRAINING_DATA	FINISHED	2018-02-02 00:44:04.17	412	551e46aa-eff5-487e-9b0c-c50f97d188b6	1130	\N	\N	\N
419	2018-02-02 00:46:19.668	2018-02-02 00:46:19.83	\N	TRAINING_DATA	FINISHED	2018-02-02 00:46:19.668	420	41ff43ce-50bc-4647-b9a0-b6f6b67f67c8	1131	\N	\N	\N
423	2018-02-02 01:04:18.113	2018-02-02 01:04:18.447	\N	TRAINING_DATA	FINISHED	2018-02-02 01:04:18.114	424	5f59f09e-8ac9-49be-97d2-5d40ee444845	1132	\N	\N	\N
431	2018-02-02 01:07:22.826	2018-02-02 01:07:22.858	Не удалось построить модель: ни один классификатор не был включен в ансамбль!	TRAINING_DATA	ERROR	2018-02-02 01:07:22.826	432	f288213c-fe60-4c1b-90c8-75393246a8ee	1133	\N	\N	\N
445	2018-02-02 01:37:19.775	2018-02-02 01:37:20.814	\N	TRAINING_DATA	FINISHED	2018-02-02 01:37:19.775	446	211732be-cef6-4d17-8b05-628618475aec	1134	\N	\N	\N
451	2018-02-02 01:38:48.147	2018-02-02 01:38:49.892	\N	TRAINING_DATA	FINISHED	2018-02-02 01:38:48.147	452	75cb9a66-9f45-41db-947e-2fb7f2ec530b	1135	\N	\N	\N
459	2018-02-02 01:40:07.651	2018-02-02 01:40:08.975	\N	TRAINING_DATA	FINISHED	2018-02-02 01:40:07.651	460	4ad48927-50ac-49d5-ba55-8e09a611fd04	1136	\N	\N	\N
465	2018-02-03 11:17:01.139	2018-02-03 11:17:04.951	\N	TRAINING_DATA	FINISHED	2018-02-03 11:17:01.139	466	6b0962ea-7160-46e2-9286-8f381b0e03ac	1137	\N	\N	\N
479	2018-02-03 14:01:18.933	2018-02-03 14:01:19.037	\N	TRAINING_DATA	FINISHED	2018-02-03 14:01:18.933	480	cec47395-3fe1-4474-a220-25be39059d0d	1138	\N	\N	\N
519	2018-02-03 16:09:15.236	2018-02-03 16:09:15.906	\N	TRAINING_DATA	FINISHED	2018-02-03 16:09:15.236	520	1864d47b-d019-4c8f-85bc-7997fd6fb3f2	1143	\N	\N	\N
637	2018-02-08 23:27:53.387	2018-02-08 23:27:56.106	\N	TRAINING_DATA	FINISHED	2018-02-08 23:27:53.387	638	5a075538-07f5-40f1-a8f6-3f3f6cdbec6f	1155	\N	\N	\N
647	2018-02-18 15:45:17.149	2018-02-18 15:45:18.648	\N	TRAINING_DATA	FINISHED	2018-02-18 15:45:17.149	648	7e425b1e-7ced-4c5a-8b4c-4897498d4682	1156	\N	\N	\N
653	2018-02-18 15:46:32.393	2018-02-18 15:46:33.237	\N	TRAINING_DATA	FINISHED	2018-02-18 15:46:32.393	654	e3caeafa-b6fb-4b79-b596-f9966a1f91d6	1157	\N	\N	\N
661	2018-02-18 15:47:24.045	2018-02-18 15:47:25.469	\N	TRAINING_DATA	FINISHED	2018-02-18 15:47:24.045	662	a0e8c277-43cc-44df-8fb4-c95d606be9d1	1158	\N	\N	\N
683	2018-03-07 23:58:45.044	2018-03-07 23:58:45.293	\N	TRAINING_DATA	FINISHED	2018-03-07 23:58:45.044	684	6679a2be-45e3-4c64-8549-39a773d6c489	1161	\N	\N	\N
691	2018-03-08 00:00:24.357	2018-03-08 00:00:27.27	\N	TRAINING_DATA	FINISHED	2018-03-08 00:00:24.357	692	a1576d3c-d604-4431-a56b-e4ccf309a81e	1162	\N	\N	\N
766	2018-03-09 22:23:46.166	2018-03-09 22:23:50.942	\N	TRAINING_DATA	FINISHED	2018-03-09 22:23:46.166	767	ea3e72de-f339-4f10-b7e2-40696712d8eb	1172	\N	\N	\N
774	2018-03-09 22:26:02.742	2018-03-09 22:26:07.487	\N	TRAINING_DATA	FINISHED	2018-03-09 22:26:02.742	775	cf1c40a6-0f99-4b26-b3df-f5c2763006d0	1173	\N	\N	\N
788	2018-03-31 13:02:42.338	2018-03-31 13:02:42.88	\N	TRAINING_DATA	FINISHED	2018-03-31 13:02:42.338	789	01db260f-2bf5-4f23-91e9-205adcf61c31	1174	\N	\N	\N
837	2018-04-10 23:55:47.035	2018-04-10 23:55:48.519	\N	TRAINING_DATA	FINISHED	2018-04-10 23:55:47.035	838	cb0f4640-bee9-454d-809d-462be3202ba9	1176	\N	\N	\N
851	2018-04-25 23:55:27.144	2018-04-25 23:55:27.263	\N	TRAINING_DATA	FINISHED	2018-04-25 23:55:27.144	852	3c3a0cc6-88b8-4304-a98e-5596c1c64c96	1177	\N	\N	\N
859	2018-04-27 23:47:00.544	2018-04-27 23:47:01.827	\N	TRAINING_DATA	FINISHED	2018-04-27 23:47:00.544	860	529b1ec2-06b1-49af-8728-6119ccd7b420	1178	\N	\N	\N
867	2018-04-29 00:31:55.466	2018-04-29 00:31:56.592	\N	TRAINING_DATA	FINISHED	2018-04-29 00:31:55.466	868	a457a2cf-e148-47c7-93eb-21d3eb91b7c3	1179	\N	\N	\N
875	2018-05-02 23:51:14.733	2018-05-02 23:51:16.4	\N	TRAINING_DATA	FINISHED	2018-05-02 23:51:14.733	876	d4f6c8e8-f8c8-45e3-9146-06f864a5d8a6	1180	\N	\N	\N
883	2018-05-05 20:57:40.804	2018-05-05 20:57:59.398	\N	TRAINING_DATA	FINISHED	2018-05-05 20:57:40.804	884	940a5e64-ce27-4ccc-85fa-44faab033401	1181	\N	\N	\N
919	2018-05-20 00:09:09.957	2018-05-20 00:09:09.993	\N	TRAINING_DATA	FINISHED	2018-05-20 00:09:09.957	920	ca42a550-66df-4d24-8be0-814b47d7577f	1185	\N	\N	\N
1960	2018-06-10 01:15:04.013	2018-06-10 01:15:04.122	\N	TRAINING_DATA	FINISHED	2018-06-10 01:15:04.013	1961	be5c9a71-2f3c-4b15-988a-e9bb0de51d66	1225	\N	\N	\N
130	2017-11-05 01:08:25.945	2017-11-05 01:08:27.865	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:08:25.945	131	b175466b-3742-40a3-bce9-17166d53566a	637	10	10	3
132	2017-11-05 01:08:38.799	2017-11-05 01:08:39.176	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:08:38.799	133	4d1dc1cf-bd68-45ab-8160-e27a572bcdf3	638	10	10	3
136	2017-11-05 01:09:01.41	2017-11-05 01:09:01.679	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:09:01.41	137	31370518-5207-4608-82f7-a9da9f8fe40b	639	10	10	3
138	2017-11-05 01:09:08.438	2017-11-05 01:09:08.995	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:09:08.438	139	c2efd716-7aa0-4552-971f-3afb5abc7d0f	640	10	10	3
142	2017-11-05 01:09:41.331	2017-11-05 01:09:41.513	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:09:41.331	143	97c48fec-35d8-48b2-8fc5-b51d960c8505	641	10	10	3
144	2017-11-05 01:09:50.139	2017-11-05 01:09:50.683	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:09:50.139	145	ca86fca4-4158-4eb3-9079-2ee06f521f2c	642	10	10	3
148	2017-11-05 01:12:26.688	2017-11-05 01:12:26.754	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:12:26.688	149	bd420b32-7766-4b97-a3b0-b73a5be72db3	643	10	10	3
150	2017-11-05 01:12:43.755	2017-11-05 01:12:48.695	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:12:43.755	151	600cf074-c36b-4f0d-9c2d-d189c8ac8272	644	10	10	3
6868	2019-04-13 14:46:15.628	2019-04-13 14:46:18.366	\N	CROSS_VALIDATION	FINISHED	2019-04-13 14:46:15.628	6869	4815de0e-a075-433a-a09f-3ff9ae136cf2	875	10	1	1
1217	2018-05-25 22:50:28.042	2018-05-25 22:50:37.612	\N	CROSS_VALIDATION	FINISHED	2018-05-25 22:50:28.042	1218	ea04c8d9-e0d2-4f9a-900c-4b494eee94eb	901	10	1	1
1223	2018-05-25 22:55:46.94	2018-05-25 22:55:56.271	\N	CROSS_VALIDATION	FINISHED	2018-05-25 22:55:46.94	1224	730e375d-7423-4380-b9d5-a7c57acfc2e2	902	10	1	1
1226	2018-05-25 22:56:56.365	2018-05-25 22:56:57.531	\N	CROSS_VALIDATION	FINISHED	2018-05-25 22:56:56.365	1227	f3e1c9a3-1fee-4ef3-b5c9-9487a0f7f311	903	10	1	1
1232	2018-05-25 22:57:18.223	2018-05-25 22:57:18.325	\N	CROSS_VALIDATION	FINISHED	2018-05-25 22:57:18.223	1233	d7e2d51a-bafe-4359-ac4e-f9fe0ff65ac2	904	10	1	1
1235	2018-05-25 22:57:27.323	2018-05-25 22:57:27.442	\N	CROSS_VALIDATION	FINISHED	2018-05-25 22:57:27.323	1236	173c98c3-6c06-4f9b-ac1d-d991c0bf3d6b	905	10	1	1
2115	2018-06-21 21:14:08.229	2018-06-21 21:14:10.501	\N	CROSS_VALIDATION	FINISHED	2018-06-21 21:14:08.229	2116	a5a97466-a07a-42c6-9db9-d350631380fa	973	10	1	1
2220	2018-06-21 22:27:47.955	2018-06-21 22:27:49.612	\N	CROSS_VALIDATION	FINISHED	2018-06-21 22:27:47.955	2221	f6f7c60b-7003-4997-ae7f-7a8c82a19145	986	10	1	1
2223	2018-06-21 22:28:22.644	2018-06-21 22:28:24.348	\N	CROSS_VALIDATION	FINISHED	2018-06-21 22:28:22.644	2224	2a71612a-c4f0-4b43-a6d8-2dad27daf298	987	10	1	1
2305	2018-06-25 23:40:45.829	2018-06-25 23:40:46.061	\N	CROSS_VALIDATION	FINISHED	2018-06-25 23:40:45.829	2306	134b2ddf-9f36-4482-ada3-7c5402a68d9c	995	10	1	1
2311	2018-06-25 23:41:48.287	2018-06-25 23:41:48.484	\N	CROSS_VALIDATION	FINISHED	2018-06-25 23:41:48.287	2312	284e5081-48f2-4990-9bee-66ad3143cd2a	997	10	1	1
2418	2018-06-29 00:22:47.356	2018-06-29 00:23:01.466	\N	CROSS_VALIDATION	FINISHED	2018-06-29 00:22:47.356	2419	d3d1bd24-c977-4452-a86a-7dcc01251e5a	1008	10	1	1
2421	2018-06-29 00:25:23.367	2018-06-29 00:25:36.966	\N	CROSS_VALIDATION	FINISHED	2018-06-29 00:25:23.367	2422	3b3b6f17-f382-4688-8a3a-fa660393b702	1009	10	1	1
2510	2018-07-07 23:29:00.47	2018-07-07 23:29:54.377	\N	CROSS_VALIDATION	FINISHED	2018-07-07 23:29:00.47	2511	390f6dae-d05b-477e-a630-9d94e1dcfc92	1023	10	1	1
2513	2018-07-07 23:30:24.768	2018-07-07 23:31:18.019	\N	CROSS_VALIDATION	FINISHED	2018-07-07 23:30:24.768	2514	b6a23e23-119a-48fe-8cf8-a5a36aab8e25	1024	10	1	1
2537	2018-07-08 14:15:38.329	2018-07-08 14:16:14.504	\N	CROSS_VALIDATION	FINISHED	2018-07-08 14:15:38.329	2538	0b92f72c-c370-4a63-889b-617b48d93219	1032	10	1	1
2575	2018-07-19 23:24:25.653	2018-07-19 23:24:26.586	\N	CROSS_VALIDATION	FINISHED	2018-07-19 23:24:25.653	2576	80e2b9dd-eb9d-4657-a9e2-c6e108c63863	1036	10	1	1
2580	2018-07-19 23:25:10.572	2018-07-19 23:25:24.24	\N	CROSS_VALIDATION	FINISHED	2018-07-19 23:25:10.572	2581	41c3b81f-bc9d-4d41-9a42-983c628542e1	1037	10	1	1
2610	2018-08-23 21:11:06.86	2018-08-23 21:11:06.954	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:11:06.86	2611	9008f9a8-ded2-4fa1-8a47-e2b2393cf064	1041	10	1	1
2718	2018-08-31 21:13:25.146	2018-08-31 21:14:06.992	\N	CROSS_VALIDATION	FINISHED	2018-08-31 21:13:25.146	2719	f58eb880-0a3a-4ae9-b8bb-cc7ce2537a7b	1055	10	1	1
3168	2019-01-05 19:40:24.684	2019-01-05 19:41:45.716	\N	CROSS_VALIDATION	FINISHED	2019-01-05 19:40:24.684	3169	60434a90-c818-4c94-a312-f28967afa77c	1091	10	1	1
3173	2019-01-05 19:43:09.9	2019-01-05 19:43:14.662	\N	CROSS_VALIDATION	FINISHED	2019-01-05 19:43:09.9	3174	b50425d7-96ea-40b7-8158-648a58ce429e	1092	10	1	1
3176	2019-01-05 19:43:32.872	2019-01-05 19:43:36.554	\N	CROSS_VALIDATION	FINISHED	2019-01-05 19:43:32.872	3177	0c3ad005-205c-4534-839f-e57dbb14779a	1093	10	1	1
3181	2019-01-05 19:44:23.656	2019-01-05 19:44:26.738	\N	CROSS_VALIDATION	FINISHED	2019-01-05 19:44:23.656	3182	be7017b0-b2f7-4bde-a527-3ba56ebb1e39	1094	10	1	1
3186	2019-01-05 19:44:54.465	2019-01-05 19:45:02.824	\N	CROSS_VALIDATION	FINISHED	2019-01-05 19:44:54.465	3187	d79c94f1-8346-41d1-8ecd-78a80789f030	1095	10	1	1
2833	2018-12-29 20:23:30.976	2018-12-29 20:23:31.182	\N	CROSS_VALIDATION	FINISHED	2018-12-29 20:23:30.976	2834	176f2ece-8a62-4bc2-8741-1b45b685af37	1057	10	1	1
2836	2018-12-29 20:23:43.109	2018-12-29 20:23:52.096	\N	CROSS_VALIDATION	FINISHED	2018-12-29 20:23:43.109	2837	ffda1b44-0a70-456f-be29-4e0a29e948b9	1058	10	1	1
2845	2018-12-29 20:26:06.875	2018-12-29 20:26:07.228	\N	CROSS_VALIDATION	FINISHED	2018-12-29 20:26:06.875	2846	37d53578-2912-4aa9-996b-a75d7a7f1f77	1059	10	1	1
2848	2018-12-29 20:26:25.735	2018-12-29 20:26:25.818	\N	CROSS_VALIDATION	FINISHED	2018-12-29 20:26:25.735	2849	70fdbea4-9604-43d9-bf26-0e66833e2fb7	1060	10	1	1
2851	2018-12-29 20:26:35.972	2018-12-29 20:26:36.4	\N	CROSS_VALIDATION	FINISHED	2018-12-29 20:26:35.972	2852	6ae1abbe-887b-4e76-8555-30f58257533e	1061	10	1	1
2854	2018-12-29 20:26:47.164	2018-12-29 20:26:47.566	\N	CROSS_VALIDATION	FINISHED	2018-12-29 20:26:47.164	2855	be39c553-a46c-4675-a2b9-e923d810fca9	1062	10	1	1
2916	2018-12-30 15:12:39.958	2018-12-30 15:12:40.132	\N	CROSS_VALIDATION	FINISHED	2018-12-30 15:12:39.958	2917	e7dfbafe-657e-4e91-8b6d-f1387f364073	1064	10	1	1
2919	2018-12-30 15:12:47.043	2018-12-30 15:12:47.394	\N	CROSS_VALIDATION	FINISHED	2018-12-30 15:12:47.043	2920	a9e44168-61f7-469d-a48c-75900a1ebf73	1065	10	1	1
2922	2018-12-30 15:12:56.46	2018-12-30 15:12:58.719	\N	CROSS_VALIDATION	FINISHED	2018-12-30 15:12:56.46	2923	4b3caad7-02e0-4be7-8f6c-1d4b9bb206dd	1066	10	1	1
2925	2018-12-30 15:13:32.265	2018-12-30 15:13:32.519	\N	CROSS_VALIDATION	FINISHED	2018-12-30 15:13:32.265	2926	2788a1ca-551f-459b-9416-e48c76e02438	1067	10	1	1
1220	2018-05-25 22:50:52.882	2018-05-25 22:51:00.999	\N	CROSS_VALIDATION	FINISHED	2018-05-25 22:50:52.882	1221	679004be-1903-486d-825a-dc23fa4ddf40	1198	10	1	1
1229	2018-05-25 22:57:09.438	2018-05-25 22:57:09.522	\N	CROSS_VALIDATION	FINISHED	2018-05-25 22:57:09.438	1230	9d34303e-085e-47f5-a5a2-0ffe60adfcec	1199	10	1	1
1244	2018-05-25 22:57:53.717	2018-05-25 22:57:53.857	\N	CROSS_VALIDATION	FINISHED	2018-05-25 22:57:53.718	1245	d4406bb2-c4c6-42a0-b84e-45e0e466c206	1200	10	1	1
1253	2018-05-25 22:59:35.06	2018-05-25 22:59:35.182	\N	CROSS_VALIDATION	FINISHED	2018-05-25 22:59:35.06	1254	9fec91ce-515a-4ab3-8bcf-4d6a50166259	1201	10	1	1
1377	2018-05-27 15:21:30.701	2018-05-27 15:21:32.264	\N	CROSS_VALIDATION	FINISHED	2018-05-27 15:21:30.701	1378	49513885-d76a-4d0b-aa1c-978c04b8c84f	1202	10	1	1
1386	2018-05-27 15:23:32.484	2018-05-27 15:23:32.765	\N	CROSS_VALIDATION	FINISHED	2018-05-27 15:23:32.484	1387	2bc33a1e-6c9d-48de-bee4-fd1a01bcfcfb	1203	10	1	1
1422	2018-05-27 17:31:26.893	2018-05-27 17:31:32.049	\N	CROSS_VALIDATION	FINISHED	2018-05-27 17:31:26.893	1423	2de151e7-0661-4e0f-9d01-a00348a203be	1204	10	1	1
1449	2018-05-27 21:34:18.035	2018-05-27 21:34:32.363	\N	CROSS_VALIDATION	FINISHED	2018-05-27 21:34:18.035	1450	d633172d-53cb-4e05-8f58-0a73a536a856	1205	10	1	1
1461	2018-05-27 22:57:39.031	2018-05-27 22:57:44.075	\N	CROSS_VALIDATION	FINISHED	2018-05-27 22:57:39.031	1462	10e5a2c2-208a-45c0-a77b-c5862761171f	1206	10	1	1
1464	2018-05-27 22:58:05.857	2018-05-27 22:58:14.257	\N	CROSS_VALIDATION	FINISHED	2018-05-27 22:58:05.857	1465	7d786b09-592c-43bf-84ff-7382d1890403	1207	10	1	1
1467	2018-05-27 22:58:40.85	2018-05-27 22:58:48.037	\N	CROSS_VALIDATION	FINISHED	2018-05-27 22:58:40.85	1468	64eba348-e16e-4085-aacd-921f1bb1bfe8	1208	10	1	1
6970	2019-04-13 15:29:58.538	2019-04-13 15:29:59.792	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:29:58.538	6971	b7d26648-2e1d-434c-8960-eed281a09bbc	1238	10	1	1
7124	2019-04-13 15:35:57.607	2019-04-13 15:35:58.251	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:35:57.607	7125	7be81933-37da-46e3-80e0-f2a1ef33f91a	1251	10	1	1
7258	2019-04-13 15:43:02.152	2019-04-13 15:43:06.668	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:43:02.152	7259	a438fb8c-d488-41b7-b388-78a3c814331f	1267	10	1	1
7300	2019-06-03 23:04:54.244	2019-06-03 23:04:57.297	\N	CROSS_VALIDATION	FINISHED	2019-06-03 23:04:54.244	7301	1712eca5-e7da-4e79-a0a4-87df90cdf214	1272	10	1	1
152	2017-11-05 01:12:56.453	2017-11-05 01:12:57.971	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:12:56.453	153	47246f7d-d424-4c04-92a3-6e60cdda3a1f	645	10	10	3
154	2017-11-05 01:13:05.291	2017-11-05 01:13:23.288	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:13:05.291	155	57c8723b-882d-47ff-8033-c17feaa4be48	646	10	10	3
156	2017-11-05 01:13:31.102	2017-11-05 01:13:31.991	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:13:31.102	157	9ad9238e-7205-4570-95e6-278cd76812f9	647	10	10	3
158	2017-11-05 01:13:45.307	2017-11-05 01:14:06.859	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:13:45.307	159	ba401b0a-de36-42fa-9a88-e37e6546c2e0	648	10	10	3
162	2017-11-05 01:14:58.613	2017-11-05 01:15:56.307	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:14:58.613	163	387d57b9-6a9e-413e-93b7-c6d922076662	649	10	10	3
164	2017-11-05 01:16:23.012	2017-11-05 01:40:38.316	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:16:23.012	165	13bdae35-e692-46df-9ef3-54476837b31c	650	10	10	3
166	2017-11-05 13:29:27.356	2017-11-05 13:29:46.44	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:29:27.356	167	00c40c25-e6e5-40a7-bf39-6b0248c678c2	651	10	1	3
168	2017-11-05 13:30:06.346	2017-11-05 13:30:25.583	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:30:06.346	169	5f996fa3-cebd-452a-bd5f-3b14e5f1d4c2	652	10	1	3
172	2017-11-05 13:32:21.027	2017-11-05 13:32:27.808	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:32:21.027	173	60d51353-1759-4a96-a50c-5bad4b59f81e	653	10	1	3
174	2017-11-05 13:32:35.625	2017-11-05 13:32:41.158	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:32:35.625	175	a46c8335-2c29-43a2-b033-66c7486697cb	654	10	1	3
178	2017-11-05 13:32:59.671	2017-11-05 13:33:00.244	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:32:59.671	179	9a8dba99-7042-4aa4-96b5-5c32b4146a71	655	10	1	3
180	2017-11-05 13:33:17.162	2017-11-05 13:33:29.102	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:33:17.162	181	27c8595a-47b8-4ab0-81dc-259a9da80ad0	656	10	1	3
182	2017-11-05 13:33:42.996	2017-11-05 13:33:43.746	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:33:42.996	183	d8c907f7-5089-42fe-aa1e-e2aa1cee806e	657	10	1	3
186	2017-11-05 13:34:25.035	2017-11-05 13:36:16.191	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:34:25.035	187	784ce863-5cbb-4f87-86a2-ce6150f2a43f	658	10	1	3
188	2017-11-05 13:36:40.94	2017-11-05 13:37:35.484	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:36:40.94	189	bcce1788-cd66-4767-b5d7-d0ab38017bfd	659	10	1	3
192	2017-11-05 13:39:44.125	2017-11-05 13:39:45.173	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:39:44.125	193	b6b7b658-828c-4658-8e4a-bfbe6ca6f4d0	660	10	1	3
194	2017-11-05 13:39:54.504	2017-11-05 13:40:05.142	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:39:54.504	195	76b3db86-884e-4f78-b632-7c1a49f0962f	661	10	1	3
196	2017-11-05 13:40:20.534	2017-11-05 13:41:10.725	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:40:20.534	197	fcc07098-bd2b-49f0-9cdc-0a5b10bfb604	662	10	1	3
198	2017-11-05 13:41:27.852	2017-11-05 13:41:33.27	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:41:27.852	199	346d3ab6-5f71-4586-a25e-8c107282dea1	663	10	1	3
202	2017-11-05 13:41:57.475	2017-11-05 13:42:02.85	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:41:57.475	203	29f7e55a-c6de-44a7-b9ea-16848b75ae8b	664	10	1	3
204	2017-11-05 13:42:17.612	2017-11-05 13:42:32.505	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:42:17.612	205	2d481aec-4de0-4b07-802a-3b76c6761fca	665	10	3	3
208	2017-11-05 13:43:10.89	2017-11-05 13:43:15.696	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:43:10.89	209	d219cefe-ff91-4899-9796-087038bb2865	666	10	1	3
210	2017-11-05 13:43:21.925	2017-11-05 13:43:26.713	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:43:21.925	211	4bba4d3c-29e4-4bb8-afa6-f31dbffdd37f	667	10	1	3
214	2017-11-05 13:46:28.039	2017-11-05 13:46:33.418	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:46:28.039	215	a92beca0-d3f7-4dc6-9f5e-00fd590bcc5e	668	10	1	3
216	2017-11-05 13:46:46.246	2017-11-05 13:47:10.483	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:46:46.246	217	e0ab7122-7f1f-4d5a-953e-1d3d9e19aa7b	669	10	5	3
218	2017-11-05 13:47:48.317	2017-11-05 13:47:50.781	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:47:48.317	219	ba00a4e8-d23c-45bc-ae36-5e3ce618194b	670	5	1	3
220	2017-11-05 13:48:18.28	2017-11-05 13:49:09.38	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:48:18.28	221	67632894-0ffb-4922-89cc-990d7c089554	671	10	10	3
224	2017-11-06 12:51:40.692	2017-11-06 12:53:18.043	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:51:40.692	225	187124d3-bb4e-458d-8111-c6c6adbbbf97	672	10	10	3
226	2017-11-06 12:53:31.195	2017-11-06 12:53:38.101	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:53:31.195	227	b79ee909-40e1-4d96-955f-191da8bc66f0	673	10	10	3
230	2017-11-06 12:54:41.77	2017-11-06 12:54:43.759	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:54:41.77	231	3b33bc2e-ea3e-493f-a7c5-698b45410f00	674	10	10	3
232	2017-11-06 12:54:56.128	2017-11-06 12:55:24.082	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:54:56.128	233	f5043277-ec43-4d73-a436-1d98b0b0a095	675	10	10	3
234	2017-11-06 12:55:34.052	2017-11-06 12:55:36.027	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:55:34.052	235	1553ed10-42c2-4ce4-8217-fe670b11374e	676	10	10	3
238	2017-11-06 12:56:47.054	2017-11-06 12:56:52.736	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:56:47.054	239	0fba416a-238b-4bcf-9a73-07ad40c66064	677	10	10	3
240	2017-11-06 12:57:35.165	2017-11-06 12:57:40.836	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:57:35.165	241	1f9c9bd3-7c8c-477b-a3d9-eeaf1401bdb5	678	10	10	3
244	2017-11-06 12:58:21.565	2017-11-06 12:58:27.821	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:58:21.565	245	76e25091-4542-4766-8af6-1f485ae0520b	679	10	10	3
246	2017-11-06 12:58:38.225	2017-11-06 12:58:38.682	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:58:38.225	247	c62903f8-0db5-415c-953c-77700909730e	680	10	10	3
248	2017-11-06 12:58:46.348	2017-11-06 12:58:47.548	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:58:46.348	249	07347ea0-6a9d-42e7-917b-333a3e85df48	681	10	10	3
252	2017-11-06 12:59:20.942	2017-11-06 12:59:22.604	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:59:20.942	253	2ca783ff-e1ae-44bf-b3f0-e888919b8616	682	10	10	3
254	2017-11-06 12:59:41.524	2017-11-06 12:59:42.675	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:59:41.524	255	45fd3d5b-55c1-4f61-8cd1-bb350e2479ad	683	10	10	3
258	2017-11-06 13:00:03.842	2017-11-06 13:00:05.501	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:00:03.842	259	53ab6d74-bbf7-4595-bd47-0bf82e84e3bf	684	10	10	3
264	2017-11-06 13:00:59.141	2017-11-06 13:01:02.061	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:00:59.141	265	265d3544-c4fc-4a32-a1e5-7164667c0674	686	10	10	3
266	2017-11-06 13:01:15.606	2017-11-06 13:01:22.934	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:01:15.606	267	63de207f-5a3b-44f3-a4db-0a7f1b653037	687	10	10	3
270	2017-11-06 13:01:53.756	2017-11-06 13:02:00.988	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:01:53.756	271	4f7ad9e4-a235-4fb7-953a-cc0d5749cb03	688	10	10	3
272	2017-11-06 13:02:55.15	2017-11-06 13:02:57.208	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:02:55.15	273	069f9e8e-14f5-4221-b629-a8207301fadf	689	10	10	3
274	2017-11-06 13:03:11.803	2017-11-06 13:03:26.313	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:03:11.803	275	d04ef877-b22c-4ba5-84ad-8a666346df0f	690	10	10	3
278	2017-11-06 13:05:06.762	2017-11-06 13:05:16.9	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:05:06.762	279	8fd714c9-160a-4c10-869f-c68d0ebd7635	691	10	10	3
280	2017-11-06 13:05:31.059	2017-11-06 13:06:00.847	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:05:31.059	281	c082a660-3aa8-440e-b450-5e5f81fbfb93	692	10	10	3
282	2017-11-06 13:06:14.756	2017-11-06 13:06:29.209	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:06:14.756	283	a4c3ddf4-1dfd-43b7-a510-833ae3994d8a	693	10	10	3
286	2017-11-06 13:07:56.252	2017-11-06 13:08:09.393	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:07:56.252	287	8ee25143-57ab-4f2f-bb16-2fa51dbd4fd7	694	10	10	3
288	2017-11-06 13:08:23.634	2017-11-06 13:08:38.06	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:08:23.634	289	51819610-085a-4f5b-86e6-d1c9d57aa4c0	695	10	10	3
290	2017-11-06 13:08:55.707	2017-11-06 13:09:03.31	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:08:55.707	291	227ef14d-26a7-4e93-b122-9164f3f609e6	696	10	10	3
294	2017-11-06 13:09:29.849	2017-11-06 13:09:31.826	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:09:29.849	295	f53912be-5010-43d9-8dae-4e22e9d9ea55	697	10	10	3
296	2017-11-06 13:09:38.825	2017-11-06 13:09:39.302	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:09:38.825	297	309636a2-424e-4ec2-af43-17d49660bd09	698	10	10	3
300	2017-12-14 20:38:12.14	2017-12-14 20:38:49.844	\N	CROSS_VALIDATION	FINISHED	2017-12-14 20:38:12.14	301	62c342ba-981a-4977-8db1-a217070e3cbe	699	10	1	3
321	2017-12-31 21:57:14.932	2017-12-31 21:57:15.557	\N	CROSS_VALIDATION	FINISHED	2017-12-31 21:57:14.932	322	6c269a11-5f6f-4ebd-ae93-6479b621746b	703	10	1	3
323	2017-12-31 21:57:24.336	2017-12-31 21:57:25.189	\N	CROSS_VALIDATION	FINISHED	2017-12-31 21:57:24.336	324	06b895c9-e7ca-4e25-8fd1-911f5eb3aa82	704	10	1	3
332	2018-01-04 16:48:30.626	2018-01-04 16:48:32.464	\N	CROSS_VALIDATION	FINISHED	2018-01-04 16:48:30.626	333	db1c3f61-70ca-41a0-a0c8-110e0ca380a1	706	10	1	3
334	2018-01-04 16:48:43.551	2018-01-04 16:48:43.953	\N	CROSS_VALIDATION	FINISHED	2018-01-04 16:48:43.551	335	64a65f41-c9c5-4f8e-8258-06469b0e5b7d	707	10	1	3
338	2018-01-04 16:49:06.757	2018-01-04 16:49:08.67	\N	CROSS_VALIDATION	FINISHED	2018-01-04 16:49:06.757	339	0956fe03-872c-4f57-92ca-f356280cb0af	708	10	1	3
340	2018-01-04 16:49:21.091	2018-01-04 16:49:34.302	\N	CROSS_VALIDATION	FINISHED	2018-01-04 16:49:21.091	341	0010804e-df9b-43ed-b9cc-d2e567c54255	709	10	1	3
344	2018-01-04 16:52:35.234	2018-01-04 16:52:59.117	\N	CROSS_VALIDATION	FINISHED	2018-01-04 16:52:35.234	345	a72d17fb-45a5-4517-9e58-95e30537f093	710	10	1	3
346	2018-01-04 16:53:29.862	2018-01-04 16:54:45.142	\N	CROSS_VALIDATION	FINISHED	2018-01-04 16:53:29.862	347	767c24c4-24e8-4bda-a3be-a364806cb0fd	711	10	1	3
348	2018-01-04 16:58:51.034	2018-01-04 16:59:00.012	\N	CROSS_VALIDATION	FINISHED	2018-01-04 16:58:51.034	349	1ac90590-d0a4-4fbd-a99f-9f2d5953bab5	712	10	1	3
352	2018-01-04 16:59:41.989	2018-01-04 16:59:50.622	\N	CROSS_VALIDATION	FINISHED	2018-01-04 16:59:41.99	353	9e405326-290d-4eba-b286-7dd850de0816	713	10	1	3
354	2018-01-04 17:00:39.16	2018-01-04 17:00:40.622	\N	CROSS_VALIDATION	FINISHED	2018-01-04 17:00:39.16	355	26ce486f-00fa-46c3-b144-fc6c06dca43c	714	10	1	3
356	2018-01-04 17:00:51.454	2018-01-04 17:00:52.681	\N	CROSS_VALIDATION	FINISHED	2018-01-04 17:00:51.454	357	afb6a559-43e5-4ce9-a8a6-804e5b0cd405	715	10	1	3
360	2018-01-04 17:01:17.896	2018-01-04 17:01:19.097	\N	CROSS_VALIDATION	FINISHED	2018-01-04 17:01:17.896	361	ba27669d-0634-41aa-ac40-05db84cebdc0	716	10	1	3
363	2018-01-04 20:30:55.566	2018-01-04 20:30:56.597	\N	CROSS_VALIDATION	FINISHED	2018-01-04 20:30:55.566	364	e9a2e089-52c8-402b-83af-d789c0da48d6	717	10	1	3
365	2018-01-04 20:31:05.613	2018-01-04 20:31:08.253	\N	CROSS_VALIDATION	FINISHED	2018-01-04 20:31:05.613	366	d71e97fc-d006-42ad-9c33-45003c71554c	718	10	1	3
369	2018-01-04 20:31:26.238	2018-01-04 20:31:27.41	\N	CROSS_VALIDATION	FINISHED	2018-01-04 20:31:26.238	370	7c551391-81e4-45b7-a546-3da3c0a45987	719	10	1	3
371	2018-01-04 20:31:41.207	2018-01-04 20:31:55.457	\N	CROSS_VALIDATION	FINISHED	2018-01-04 20:31:41.207	372	e5932956-79cb-4744-af4e-b329fe62cfbd	720	10	1	3
375	2018-01-04 20:35:20.744	2018-01-04 20:35:21.166	\N	CROSS_VALIDATION	FINISHED	2018-01-04 20:35:20.744	376	302f4ee5-c5df-43ff-94ee-5babd00751bb	721	10	1	3
377	2018-01-04 20:35:33.182	2018-01-04 20:35:34.51	\N	CROSS_VALIDATION	FINISHED	2018-01-04 20:35:33.182	378	d22f57b0-6828-43cc-b6b0-b66af7bbec43	722	10	1	3
379	2018-01-04 20:35:51.369	2018-01-04 20:35:52.932	\N	CROSS_VALIDATION	FINISHED	2018-01-04 20:35:51.369	380	b367b3a3-5c57-44d6-b4cf-2252c2849272	723	10	1	3
386	2018-01-06 01:04:00.517	2018-01-06 01:06:17.382	\N	CROSS_VALIDATION	FINISHED	2018-01-06 01:04:00.517	387	dbc29ef4-b3a9-474a-be4e-f6dfc9063072	725	10	10	3
489	2018-02-03 14:02:54.86	2018-02-03 14:02:55.034	\N	CROSS_VALIDATION	FINISHED	2018-02-03 14:02:54.86	490	ff991e39-8a35-464f-968b-fdfebb0db675	752	10	1	3
491	2018-02-03 14:03:02.068	2018-02-03 14:03:02.253	\N	CROSS_VALIDATION	FINISHED	2018-02-03 14:03:02.068	492	656b56a5-f3a5-4edb-a105-7c40fe5299ea	753	10	1	3
495	2018-02-03 14:04:32.752	2018-02-03 14:04:32.815	\N	CROSS_VALIDATION	FINISHED	2018-02-03 14:04:32.752	496	f5d373af-6564-47c3-b332-de5b7e01262f	754	10	1	3
497	2018-02-03 14:04:54.242	2018-02-03 14:04:54.332	\N	CROSS_VALIDATION	FINISHED	2018-02-03 14:04:54.242	498	6a2a1ad1-24ae-4905-ae9d-e1d9d857a5dd	755	10	1	3
500	2018-02-03 14:05:56.09	2018-02-03 14:05:56.899	\N	CROSS_VALIDATION	FINISHED	2018-02-03 14:05:56.09	501	cdf6c280-46b2-4fcb-b6ef-dc3af6775bfa	756	10	1	3
504	2018-02-03 14:07:16.56	2018-02-03 14:07:16.636	\N	CROSS_VALIDATION	FINISHED	2018-02-03 14:07:16.56	505	14b44a9b-a93f-4320-ada3-2c3bdb3ca299	757	10	1	3
506	2018-02-03 14:07:25.057	2018-02-03 14:07:37.429	\N	CROSS_VALIDATION	FINISHED	2018-02-03 14:07:25.057	507	081b2149-568b-4980-aab1-37df5fb27f17	758	10	1	3
510	2018-02-03 14:08:11.254	2018-02-03 14:08:11.565	\N	CROSS_VALIDATION	FINISHED	2018-02-03 14:08:11.254	511	2799b1ef-2321-418c-869f-9f9883e23e98	759	10	1	3
512	2018-02-03 14:08:55.645	2018-02-03 14:08:58.061	\N	CROSS_VALIDATION	FINISHED	2018-02-03 14:08:55.645	513	da779a58-5994-4d20-8490-330d3530225f	760	10	1	3
526	2018-02-04 18:50:02.844	2018-02-04 18:50:04.157	\N	CROSS_VALIDATION	FINISHED	2018-02-04 18:50:02.844	527	e6c1e2c7-c37e-49f1-add0-49d62f8aa99b	762	10	10	3
528	2018-02-04 18:50:13.494	2018-02-04 18:50:14.313	\N	CROSS_VALIDATION	FINISHED	2018-02-04 18:50:13.494	529	33368466-d54e-427e-9d49-e02a75468376	763	10	10	3
530	2018-02-04 18:50:25.859	2018-02-04 18:50:26.467	\N	CROSS_VALIDATION	FINISHED	2018-02-04 18:50:25.859	531	4817eec2-44a3-4d44-9e97-41131317f3c4	764	10	10	3
534	2018-02-04 18:50:46.557	2018-02-04 18:50:51.53	\N	CROSS_VALIDATION	FINISHED	2018-02-04 18:50:46.557	535	30338159-273b-4211-ab26-be7f704cc8c4	765	10	10	3
536	2018-02-04 18:50:59.561	2018-02-04 18:51:04.979	\N	CROSS_VALIDATION	FINISHED	2018-02-04 18:50:59.561	537	922545a7-8a93-4014-9a22-8c1cbb44dad1	766	10	10	3
540	2018-02-04 18:51:27.03	2018-02-04 18:51:28.695	\N	CROSS_VALIDATION	FINISHED	2018-02-04 18:51:27.03	541	4128f5e1-2474-4de3-ab71-6383f863c246	767	10	10	3
542	2018-02-04 18:52:30.701	2018-02-04 18:52:30.819	\N	CROSS_VALIDATION	FINISHED	2018-02-04 18:52:30.701	543	822065a4-3b69-4316-83ca-a862e8440e1d	768	10	1	3
544	2018-02-04 18:52:40.33	2018-02-04 18:52:40.873	\N	CROSS_VALIDATION	FINISHED	2018-02-04 18:52:40.33	545	327c4eda-f587-4236-93ee-3fd7a38b2395	769	10	1	3
548	2018-02-04 18:52:58.236	2018-02-04 18:52:58.848	\N	CROSS_VALIDATION	FINISHED	2018-02-04 18:52:58.236	549	a56d0d61-4c91-45bf-a537-d3b0b35b519b	770	10	1	3
550	2018-02-04 18:53:06.075	2018-02-04 18:53:06.64	\N	CROSS_VALIDATION	FINISHED	2018-02-04 18:53:06.075	551	b9635007-b503-4415-92d9-15fa441c0418	771	10	1	3
558	2018-02-04 19:21:20.802	2018-02-04 19:21:20.931	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:21:20.802	559	e0ef6215-0554-4874-a47b-7209174c84c4	772	10	1	3
560	2018-02-04 19:21:28.986	2018-02-04 19:21:29.278	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:21:28.986	561	8a404046-e8f8-4f2e-b0da-9a7decca6a3c	773	10	1	3
562	2018-02-04 19:21:37.41	2018-02-04 19:21:37.47	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:21:37.41	563	e706f5bb-7aed-4f00-84c2-23eee7214e9d	774	10	1	3
566	2018-02-04 19:21:54.093	2018-02-04 19:21:56.127	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:21:54.093	567	d14c41b0-2c39-4d40-a38c-c32011719455	775	10	1	3
568	2018-02-04 19:22:04.977	2018-02-04 19:22:05.001	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:22:04.977	569	e0b7e694-3657-4546-a424-d244c38564af	776	10	1	3
570	2018-02-04 19:22:36.028	2018-02-04 19:22:36.042	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:22:36.028	571	284853e9-849e-4e50-926a-410be77372db	777	10	1	3
574	2018-02-04 19:23:40.082	2018-02-04 19:23:54.726	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:23:40.082	575	d003a6f7-fc9b-4afe-8feb-9ae1e88e8e77	778	10	1	3
578	2018-02-04 19:24:44.726	2018-02-04 19:24:58.339	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:24:44.726	579	33d40917-8fe0-44ff-ba89-ad318dad18cd	779	10	1	3
580	2018-02-04 19:25:11.098	2018-02-04 19:25:12.429	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:25:11.098	581	14a8e87e-0dd7-4e79-b096-2dfb0919b7be	780	10	1	3
584	2018-02-04 19:25:34.374	2018-02-04 19:25:36.297	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:25:34.374	585	326492fb-e107-45bf-8e7c-10e08720be05	781	10	1	3
586	2018-02-04 19:25:47.571	2018-02-04 19:25:47.675	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:25:47.571	587	9f434d0f-9b0b-4768-9570-552e74949703	782	10	1	3
590	2018-02-04 19:26:22.321	2018-02-04 19:26:23.51	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:26:22.321	591	4a6c76d0-1c45-4f02-8942-2e9ce46f0f85	783	10	1	3
592	2018-02-04 19:26:33.566	2018-02-04 19:26:33.655	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:26:33.566	593	63a520dc-7c27-4f09-94d7-17fe163f1dc8	784	10	1	3
594	2018-02-04 19:27:10.328	2018-02-04 19:27:12.128	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:27:10.328	595	769b393a-7484-4a5e-9185-6f0586719cdb	785	10	1	3
598	2018-02-04 19:27:30.078	2018-02-04 19:27:30.897	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:27:30.078	599	16ba161e-2357-45be-a424-b064c70d75c8	786	10	1	3
600	2018-02-04 19:27:39.106	2018-02-04 19:27:41.838	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:27:39.106	601	a63fc594-e033-4457-bf96-84dd2dda0eb0	787	10	1	3
604	2018-02-04 19:28:00.018	2018-02-04 19:28:00.982	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:28:00.018	605	95592c79-b53a-428e-b095-4705818faa49	788	10	1	3
607	2018-02-04 19:32:23.286	2018-02-04 19:32:53.285	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:32:23.286	608	3e096075-4d41-47fa-9a94-c28e2416d9db	789	10	1	3
663	2018-02-18 15:47:45.919	2018-02-18 15:47:57.832	\N	CROSS_VALIDATION	FINISHED	2018-02-18 15:47:45.919	664	946bfca6-28cf-4735-84cb-d8cb46a82278	799	10	1	3
665	2018-02-18 15:48:15.139	2018-02-18 15:48:26.753	\N	CROSS_VALIDATION	FINISHED	2018-02-18 15:48:15.139	666	14dc6126-59f9-4f83-b970-ee60f0760844	800	10	1	3
669	2018-02-18 15:49:08.039	2018-02-18 15:49:14.872	\N	CROSS_VALIDATION	FINISHED	2018-02-18 15:49:08.039	670	f9816eca-0d98-4012-a82a-af13311be08b	801	10	1	3
699	2018-03-08 17:43:11.952	2018-03-08 17:43:13.251	\N	CROSS_VALIDATION	FINISHED	2018-03-08 17:43:11.952	700	2c1c372d-ae14-4573-8e6b-47216d784f88	810	10	1	3
701	2018-03-08 17:43:21.635	2018-03-08 17:43:21.793	\N	CROSS_VALIDATION	FINISHED	2018-03-08 17:43:21.635	702	67161ca0-73c4-4109-a731-bd0ce79d9917	811	10	1	3
705	2018-03-08 17:43:36.664	2018-03-08 17:43:36.791	\N	CROSS_VALIDATION	FINISHED	2018-03-08 17:43:36.664	706	dc464a7d-2a3d-4c9b-8f16-ef0d54ec76aa	812	10	1	3
707	2018-03-08 17:43:46.418	2018-03-08 17:43:53.389	\N	CROSS_VALIDATION	FINISHED	2018-03-08 17:43:46.418	708	b191312e-0e4d-4ee1-889f-2d04c65fac95	813	10	1	3
715	2018-03-09 14:15:16.251	2018-03-09 14:15:16.751	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:15:16.251	716	44cf9e29-b852-42b3-b525-36a33a2a5099	814	10	1	3
717	2018-03-09 14:15:39.563	2018-03-09 14:15:40.266	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:15:39.564	718	d2e5efe2-a2ad-4bc5-b9fc-7d482061c476	815	10	1	3
719	2018-03-09 14:16:17.962	2018-03-09 14:16:18.364	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:16:17.962	720	1d5f2ac6-bfe2-4583-90fc-68ca8e70d953	816	10	1	3
723	2018-03-09 14:16:42.535	2018-03-09 14:16:43.295	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:16:42.536	724	4a59b036-d89d-4e91-9a67-4c0ee5a99997	817	10	1	3
725	2018-03-09 14:17:15.289	2018-03-09 14:17:15.688	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:17:15.289	726	d353f34c-f495-4c36-8df5-2e02be646a9d	818	10	1	3
727	2018-03-09 14:17:30.602	2018-03-09 14:17:30.98	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:17:30.602	728	318e6d41-a462-4dbb-a531-7b9099c320eb	819	10	1	3
731	2018-03-09 14:19:53.853	2018-03-09 14:19:54.746	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:19:53.853	732	b75fbe6f-2514-49f8-8d43-4208fd789e1d	820	10	1	3
733	2018-03-09 14:20:03.072	2018-03-09 14:20:03.907	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:20:03.072	734	0aae9f19-fb3e-4197-bc6c-6a314536a428	821	10	1	3
735	2018-03-09 14:20:15.348	2018-03-09 14:20:16.118	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:20:15.348	736	8965cc80-b70c-4932-bc60-8aae88786397	822	10	1	3
739	2018-03-09 14:20:40.386	2018-03-09 14:20:42.542	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:20:40.386	740	47e4a7a2-b265-41fa-ab8c-314b470ab540	823	10	1	3
741	2018-03-09 14:20:54.439	2018-03-09 14:20:55.894	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:20:54.439	742	81492239-8586-411f-980b-0be372e29092	824	10	1	3
745	2018-03-09 14:21:27.157	2018-03-09 14:21:28.511	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:21:27.157	746	e669dbb2-db3d-418b-bf2f-674c8b155e28	825	10	1	3
747	2018-03-09 14:21:43.207	2018-03-09 14:21:44.945	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:21:43.207	748	90f8acfb-2fc1-4027-8854-4722bc97cd24	826	10	1	3
753	2018-03-09 14:22:29.726	2018-03-09 14:22:31.876	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:22:29.726	754	63a4cce5-5030-486e-b290-d2924c57a7ca	827	10	1	3
713	2018-03-09 13:34:34.13	2018-03-09 14:22:42.481	\N	CROSS_VALIDATION	FINISHED	2018-03-09 13:34:34.13	714	3793304e-2dcc-48c4-949c-079f7028b118	828	10	10	3
755	2018-03-09 14:22:40.918	2018-03-09 14:22:42.855	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:22:40.918	756	879699e7-27e1-4510-9d2f-99bf643048e3	829	10	1	3
760	2018-03-09 14:29:24.807	2018-03-09 14:40:06.086	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:29:24.807	761	13594168-8efc-4625-97fe-29cefa7affc9	830	10	1	3
793	2018-03-31 13:03:40.716	2018-03-31 13:04:01.929	\N	CROSS_VALIDATION	FINISHED	2018-03-31 13:03:40.716	794	260608e7-a625-476a-a9a0-2ecd36617d3b	839	10	10	3
797	2018-03-31 13:12:02.345	2018-03-31 13:12:04.625	\N	CROSS_VALIDATION	FINISHED	2018-03-31 13:12:02.345	798	8d05b0a0-fffd-4cc0-bda6-a4408550d607	840	10	1	3
799	2018-03-31 13:12:23.938	2018-03-31 13:12:26.22	\N	CROSS_VALIDATION	FINISHED	2018-03-31 13:12:23.938	800	0f37a886-5521-4d18-af4e-52327968d48c	841	10	1	3
809	2018-04-01 14:51:23.502	2018-04-01 14:51:24.422	\N	CROSS_VALIDATION	FINISHED	2018-04-01 14:51:23.502	810	bebf3dc2-00c9-43d9-8c53-74c83b2a4b25	842	10	1	3
891	2018-05-05 21:03:29.901	2018-05-05 21:04:34.846	\N	CROSS_VALIDATION	FINISHED	2018-05-05 21:03:29.901	892	4c96d01a-e7e5-43ea-925a-dbc4356f1ac9	859	10	10	3
893	2018-05-05 21:06:35.407	2018-05-05 21:06:41.939	\N	CROSS_VALIDATION	FINISHED	2018-05-05 21:06:35.407	894	6a9446e8-60f7-4e9c-ad9d-d57bf344a029	860	10	10	3
897	2018-05-05 21:11:44.889	2018-05-05 21:21:46.997	\N	CROSS_VALIDATION	FINISHED	2018-05-05 21:11:44.889	898	83e4d0a2-04c5-4a5f-a30a-c00f7a4a2b40	861	10	10	3
899	2018-05-05 21:24:27.623	2018-05-05 21:24:33.217	\N	CROSS_VALIDATION	FINISHED	2018-05-05 21:24:27.623	900	dd594d28-0460-4abe-918a-cb0881c96a82	862	10	10	3
998	2018-05-20 15:53:02.39	2018-05-20 16:45:48.41	\N	CROSS_VALIDATION	FINISHED	2018-05-20 15:53:02.39	999	df0a13d8-ae8d-4330-b4c6-2111e1a7d8c9	870	10	10	3
1074	2018-05-22 00:05:44.065	2018-05-22 00:05:46.278	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:05:44.065	1075	c855b0bb-d463-47e3-a4e8-5a2919e32721	871	10	1	3
1077	2018-05-22 00:05:56.95	2018-05-22 00:06:00.948	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:05:56.95	1078	73b250a1-1276-43ef-9312-dd6fa871d36e	872	10	1	3
1083	2018-05-22 00:06:24.053	2018-05-22 00:06:28.019	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:06:24.053	1084	57dbb899-e810-4115-a1cd-fd8e450a3344	873	10	1	3
1086	2018-05-22 00:06:34.71	2018-05-22 00:06:38.64	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:06:34.71	1087	d4a9404c-8094-4831-9538-2c15a41ea5b6	874	10	1	3
1092	2018-05-22 00:07:00.737	2018-05-22 00:07:06.959	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:07:00.737	1093	eb935775-d6d4-4d3c-967d-98ab5ed94283	876	10	1	3
1098	2018-05-22 00:07:27.403	2018-05-22 00:07:33.917	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:07:27.403	1099	ed754e8b-99bb-4d90-a9c7-66c9a849476a	877	10	1	3
1101	2018-05-22 00:08:07.303	2018-05-22 00:08:16.076	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:08:07.304	1102	925dcfc9-d6cd-49b9-a968-faaf4ba108b0	878	10	1	3
1104	2018-05-22 00:08:26.798	2018-05-22 00:08:27.403	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:08:26.798	1105	a41132f7-4d07-42ee-a1ad-307a8c99e78d	879	10	1	3
1110	2018-05-22 00:08:50.879	2018-05-22 00:08:52.033	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:08:50.879	1111	48705838-a596-4ad1-8aa0-9818fe53f787	880	10	1	3
1113	2018-05-22 00:09:01.71	2018-05-22 00:09:03.31	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:09:01.71	1114	238b1717-f375-49f2-b0f4-adf3a80bdd17	881	10	1	3
1119	2018-05-22 00:09:37.306	2018-05-22 00:09:38.336	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:09:37.306	1120	2a857363-1679-478e-907e-87211d379aec	882	10	1	3
1122	2018-05-22 00:10:01.065	2018-05-22 00:10:02.68	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:10:01.065	1123	05927ce3-82d3-4c18-892f-ecb1302a23a9	883	10	1	3
1127	2018-05-22 21:57:12.922	2018-05-22 21:57:37.75	\N	CROSS_VALIDATION	FINISHED	2018-05-22 21:57:12.922	1128	80183869-a0b2-4ef1-913a-abd1874de767	884	10	1	3
1139	2018-05-22 21:59:04.985	2018-05-22 21:59:23.485	\N	CROSS_VALIDATION	FINISHED	2018-05-22 21:59:04.985	1140	c6128282-87e7-4580-98f9-9e2ce0d8c14c	885	10	1	3
1142	2018-05-22 21:59:45.111	2018-05-22 21:59:57.689	\N	CROSS_VALIDATION	FINISHED	2018-05-22 21:59:45.111	1143	b35ec628-af70-4d65-b363-d3dda9b76801	886	10	1	3
1145	2018-05-22 22:00:39.642	2018-05-22 22:00:45.845	\N	CROSS_VALIDATION	FINISHED	2018-05-22 22:00:39.642	1146	ad562d6a-78eb-4275-82e1-7b85a749d4cf	887	10	1	3
1165	2018-05-23 23:15:20.808	2018-05-23 23:15:54.713	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:15:20.808	1166	b64765cb-c89b-4540-ac6e-3e5fe432b91e	888	10	1	3
1169	2018-05-23 23:19:41.022	2018-05-23 23:19:51.338	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:19:41.022	1170	6b9e3cbf-0fbe-47d7-ac73-42b70c6f8939	889	10	1	3
1175	2018-05-23 23:42:55.309	2018-05-23 23:44:30.669	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:42:55.309	1176	5ab9e9a1-d3c8-4f2a-97f3-11c9bbeacf7e	890	10	1	3
1178	2018-05-23 23:49:51.676	2018-05-23 23:49:53.023	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:49:51.676	1179	d32e0e64-d9de-4422-8d98-e399f8ac73c5	891	10	1	3
1181	2018-05-23 23:51:28.948	2018-05-23 23:51:30.15	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:51:28.948	1182	b0a0eae5-feae-4619-9d2d-4eb779dec61b	892	10	1	3
1187	2018-05-23 23:52:41.499	2018-05-23 23:52:42.341	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:52:41.499	1188	4410636b-e921-4e2d-97ce-d4e31bd9effa	893	10	1	3
1190	2018-05-23 23:53:01.855	2018-05-23 23:53:02.795	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:53:01.855	1191	a39cecb3-5154-4332-b042-a971799cb6b8	894	10	1	3
1193	2018-05-23 23:56:42.465	2018-05-23 23:56:43.964	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:56:42.465	1194	74f158df-d008-4d33-b9b4-e0602ef97004	895	10	1	3
1199	2018-05-23 23:57:11.207	2018-05-23 23:57:12.169	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:57:11.207	1200	9b6597a0-2813-4266-a4c7-8dd68e100f9b	896	10	1	3
1202	2018-05-23 23:57:27.476	2018-05-23 23:57:27.846	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:57:27.476	1203	5d54bb20-f57b-4aec-ba84-8b5f419434f2	897	10	1	3
1205	2018-05-23 23:57:35.914	2018-05-23 23:57:36.281	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:57:35.914	1206	28d60880-ae58-4a21-84a3-2bdbe8987867	898	10	1	3
1211	2018-05-23 23:58:06.432	2018-05-23 23:58:24.591	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:58:06.433	1212	5d670d6d-98c2-4587-af16-0b739c541aec	899	10	1	3
1214	2018-05-23 23:58:31.583	2018-05-23 23:58:32.512	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:58:31.583	1215	c0d3420f-fd11-4d76-b24b-0fa7dcb43563	900	10	1	3
134	2017-11-05 01:08:52.778	2017-11-05 01:08:53.093	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:08:52.778	135	bad54e7d-05ea-4054-8bd3-7e99a7e0d5a8	1098	10	10	3
140	2017-11-05 01:09:28.676	2017-11-05 01:09:30.29	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:09:28.676	141	5ce75997-0c86-4b2a-a6d2-b823b350af7a	1099	10	10	3
146	2017-11-05 01:10:00.422	2017-11-05 01:10:17.391	Не удалось построить модель: ни один классификатор не был включен в ансамбль!	CROSS_VALIDATION	ERROR	2017-11-05 01:10:00.423	147	3343a5c9-1510-426f-8a2a-f07de4e536ea	1100	10	10	3
160	2017-11-05 01:14:25.146	2017-11-05 01:14:40.567	\N	CROSS_VALIDATION	FINISHED	2017-11-05 01:14:25.146	161	b73fe548-35ae-4584-8508-21c7ef0da302	1101	10	10	3
170	2017-11-05 13:31:24.099	2017-11-05 13:31:34.851	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:31:24.1	171	ebda36ac-bef7-421a-938f-5d70f28df6f0	1102	10	1	3
176	2017-11-05 13:32:48.307	2017-11-05 13:32:53.172	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:32:48.307	177	4d85d637-4a59-440e-9e24-2dad84d40e44	1103	10	1	3
184	2017-11-05 13:33:51.557	2017-11-05 13:33:56.522	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:33:51.557	185	b47a49ee-fe45-4f80-8178-6c4b60db0bbf	1104	10	1	3
190	2017-11-05 13:37:53.067	2017-11-05 13:39:34.375	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:37:53.067	191	71570079-3841-4533-b77e-a277a97a991e	1105	10	1	3
200	2017-11-05 13:41:42.17	2017-11-05 13:41:47.557	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:41:42.17	201	6b962a74-b824-4e5c-b304-cc96333c64b6	1106	10	1	3
206	2017-11-05 13:42:43.515	2017-11-05 13:42:58.397	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:42:43.515	207	5777bccc-ea2a-4f5a-a2ac-72d5c223931c	1107	10	3	3
212	2017-11-05 13:43:49.277	2017-11-05 13:45:50.454	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:43:49.277	213	d944563d-fd63-4848-9cbd-81d2933d8d63	1108	10	1	3
222	2017-11-05 13:50:52.587	2017-11-05 13:50:58.587	\N	CROSS_VALIDATION	FINISHED	2017-11-05 13:50:52.587	223	94e1ca94-f0d2-428b-9173-d651820524f3	1109	10	1	3
228	2017-11-06 12:53:53.393	2017-11-06 12:53:55.612	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:53:53.393	229	998a6b50-a9f5-4898-ae5e-5c0e681bc04f	1110	10	10	3
236	2017-11-06 12:55:50.68	2017-11-06 12:56:11.449	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:55:50.68	237	0bd37bcb-6ef7-4653-9a2b-ce00f85b1597	1111	10	10	3
242	2017-11-06 12:57:51.711	2017-11-06 12:58:08.196	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:57:51.711	243	58baf8b8-08a7-4fc2-ba66-7753b2b648a6	1112	10	10	3
250	2017-11-06 12:59:06.574	2017-11-06 12:59:07.869	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:59:06.574	251	94af46a5-02a6-48f2-ab79-29a0106bbfa0	1113	10	10	3
256	2017-11-06 12:59:52.992	2017-11-06 12:59:54.327	\N	CROSS_VALIDATION	FINISHED	2017-11-06 12:59:52.993	257	02e7e496-0ddc-4f35-8549-92d82342f6ff	1114	10	10	3
260	2017-11-06 13:00:16.444	2017-11-06 13:00:18.749	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:00:16.444	261	5bde995f-ea3b-4be1-bfea-3694ed3c1268	1115	10	10	3
268	2017-11-06 13:01:38.8	2017-11-06 13:01:41.722	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:01:38.8	269	fa6f2aff-1154-4bec-a887-b9ffe4cea874	1116	10	10	3
276	2017-11-06 13:04:01.304	2017-11-06 13:04:29.817	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:04:01.304	277	fe3c10ca-9254-4663-b51e-5232b6af57c9	1117	10	10	3
284	2017-11-06 13:07:11.187	2017-11-06 13:07:28.722	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:07:11.187	285	f3486ef0-d988-4e4f-9abe-e766ab8e9102	1118	10	10	3
292	2017-11-06 13:09:17.672	2017-11-06 13:09:19.47	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:09:17.672	293	018fd5bf-ad1b-469d-950c-0257784b94db	1119	10	10	3
298	2017-11-06 13:10:04.703	2017-11-06 13:11:18.614	\N	CROSS_VALIDATION	FINISHED	2017-11-06 13:10:04.703	299	3291a8f6-b9f1-4cf7-876b-0909f4f6862c	1120	10	10	3
325	2017-12-31 21:57:32.045	2017-12-31 21:57:43.551	\N	CROSS_VALIDATION	FINISHED	2017-12-31 21:57:32.045	326	01d6716a-7b54-4c38-bb56-6c420f41b3ad	1122	10	1	3
336	2018-01-04 16:48:52.452	2018-01-04 16:48:55.117	\N	CROSS_VALIDATION	FINISHED	2018-01-04 16:48:52.452	337	fae1d7c2-3b76-4dd2-a15f-09d75d1376e8	1123	10	1	3
342	2018-01-04 16:52:11.908	2018-01-04 16:52:21.579	\N	CROSS_VALIDATION	FINISHED	2018-01-04 16:52:11.908	343	a1146fb4-b3ea-4b94-9046-a614b873e56e	1124	10	1	3
350	2018-01-04 16:59:15.095	2018-01-04 16:59:24.567	\N	CROSS_VALIDATION	FINISHED	2018-01-04 16:59:15.095	351	5fb224be-f189-49d2-94d4-14bc2c5762bd	1125	10	1	3
358	2018-01-04 17:01:01.21	2018-01-04 17:01:06.602	\N	CROSS_VALIDATION	FINISHED	2018-01-04 17:01:01.21	359	02efcdf8-7104-44f9-b6c1-6cb448dfda2c	1126	10	1	3
367	2018-01-04 20:31:14.847	2018-01-04 20:31:15.207	\N	CROSS_VALIDATION	FINISHED	2018-01-04 20:31:14.847	368	f6a04570-cb97-4485-a3f8-29a4c2ef2a36	1127	10	1	3
373	2018-01-04 20:34:51.884	2018-01-04 20:34:53.056	\N	CROSS_VALIDATION	FINISHED	2018-01-04 20:34:51.884	374	65017118-a56e-449a-b711-5f3c0bd3b33c	1128	10	1	3
487	2018-02-03 14:02:46.476	2018-02-03 14:02:46.722	\N	CROSS_VALIDATION	FINISHED	2018-02-03 14:02:46.476	488	01f66194-d398-429a-8d36-38176121996b	1139	10	1	3
493	2018-02-03 14:03:13.828	2018-02-03 14:03:44.734	\N	CROSS_VALIDATION	FINISHED	2018-02-03 14:03:13.828	494	04079826-f51f-48a1-b30d-e625c97bf8f0	1140	10	1	3
502	2018-02-03 14:06:14.229	2018-02-03 14:06:14.485	\N	CROSS_VALIDATION	FINISHED	2018-02-03 14:06:14.229	503	49340ef2-949e-4ee9-9a70-8fbe97aed59c	1141	10	1	3
508	2018-02-03 14:08:01.749	2018-02-03 14:08:01.933	\N	CROSS_VALIDATION	FINISHED	2018-02-03 14:08:01.749	509	51cebe59-d8ec-40f0-8f4e-99bfc12abe78	1142	10	1	3
532	2018-02-04 18:50:37.192	2018-02-04 18:50:37.792	\N	CROSS_VALIDATION	FINISHED	2018-02-04 18:50:37.192	533	4f0f14d0-4dce-480b-9555-4371519e9361	1144	10	10	3
538	2018-02-04 18:51:13.375	2018-02-04 18:51:15.213	\N	CROSS_VALIDATION	FINISHED	2018-02-04 18:51:13.375	539	c11c521a-dd0b-4b53-80e1-0480da2ab65d	1145	10	10	3
546	2018-02-04 18:52:50.729	2018-02-04 18:52:50.826	\N	CROSS_VALIDATION	FINISHED	2018-02-04 18:52:50.729	547	62d67485-e111-46ca-ad31-520c81f27dbd	1146	10	1	3
556	2018-02-04 19:21:11.936	2018-02-04 19:21:12.203	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:21:11.936	557	d1a62bb0-6b2e-417e-af8d-7d03d83b3eb2	1147	10	1	3
564	2018-02-04 19:21:46.064	2018-02-04 19:21:46.113	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:21:46.064	565	1ab096da-8f11-45b0-9024-3247b24b0c53	1148	10	1	3
572	2018-02-04 19:23:15.876	2018-02-04 19:23:22.491	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:23:15.876	573	de67f0d4-0ba3-4218-84c0-733faee5ddfe	1149	10	1	3
576	2018-02-04 19:24:03.373	2018-02-04 19:24:03.602	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:24:03.373	577	c330ccc4-2228-47ee-a070-82913d2427fc	1150	10	1	3
582	2018-02-04 19:25:22.004	2018-02-04 19:25:22.095	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:25:22.004	583	3557537c-da6d-470f-aee5-d7e2f3f73d93	1151	10	1	3
588	2018-02-04 19:26:05.028	2018-02-04 19:26:06.936	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:26:05.028	589	f562ee57-f379-4759-bf70-147135048e3d	1152	10	1	3
596	2018-02-04 19:27:21.109	2018-02-04 19:27:22.808	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:27:21.109	597	ddc8302d-4745-4d7e-b472-4ca9f49defc9	1153	10	1	3
602	2018-02-04 19:27:51.544	2018-02-04 19:27:51.647	\N	CROSS_VALIDATION	FINISHED	2018-02-04 19:27:51.544	603	4d530436-2449-4671-bc38-c1da8d675cd6	1154	10	1	3
667	2018-02-18 15:48:38.223	2018-02-18 15:48:44.691	\N	CROSS_VALIDATION	FINISHED	2018-02-18 15:48:38.223	668	e78de0ca-e58a-43ac-8b99-b676e3afa7e9	1159	10	1	3
703	2018-03-08 17:43:28.638	2018-03-08 17:43:29.572	\N	CROSS_VALIDATION	FINISHED	2018-03-08 17:43:28.638	704	3f5005ec-5295-4b67-a48d-0887c397deb8	1163	10	1	3
711	2018-03-09 13:33:35.052	2018-03-09 13:33:37.117	\N	CROSS_VALIDATION	FINISHED	2018-03-09 13:33:35.052	712	456ee530-9c95-4598-8975-3a89977d7859	1164	10	10	3
721	2018-03-09 14:16:28.944	2018-03-09 14:16:29.331	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:16:28.944	722	539e3bb1-d04a-4adc-8c74-16fd6c2f4879	1165	10	1	3
729	2018-03-09 14:18:05.658	2018-03-09 14:19:26.683	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:18:05.658	730	5022c520-405e-49d7-8fdb-dfd1db631a0f	1166	10	1	3
737	2018-03-09 14:20:26.055	2018-03-09 14:20:28.28	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:20:26.055	738	d33b97ac-dff2-4a54-969c-a687c19ef6bb	1167	10	1	3
743	2018-03-09 14:21:07.924	2018-03-09 14:21:09.16	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:21:07.924	744	f435b030-9d00-4ab8-9e02-122aed8ec8d3	1168	10	1	3
749	2018-03-09 14:22:02.565	2018-03-09 14:22:03.729	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:22:02.565	750	291a5e28-fec9-41d9-98b3-0551a2d76523	1169	10	1	3
751	2018-03-09 14:22:17.107	2018-03-09 14:22:18.949	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:22:17.107	752	9e67807e-8491-4725-98b6-cfd66c6bd164	1170	10	1	3
757	2018-03-09 14:22:54.29	2018-03-09 14:22:55.368	\N	CROSS_VALIDATION	FINISHED	2018-03-09 14:22:54.291	758	54ca6dd9-0541-4a12-89a5-0722398423c1	1171	10	1	3
795	2018-03-31 13:05:35.771	2018-03-31 13:05:57.049	\N	CROSS_VALIDATION	FINISHED	2018-03-31 13:05:35.771	796	dcf1ea84-501e-4fa9-b729-a31d3b2a0c67	1175	10	10	3
889	2018-05-05 21:03:12.088	2018-05-05 21:03:13.073	\N	CROSS_VALIDATION	FINISHED	2018-05-05 21:03:12.088	890	2defeca1-7a02-44d0-8747-998f489e27a4	1182	10	10	3
895	2018-05-05 21:07:15.639	2018-05-05 21:07:16.154	\N	CROSS_VALIDATION	FINISHED	2018-05-05 21:07:15.639	896	3d0f68df-0d6b-4063-ad93-00f15d9ce37e	1183	10	10	3
904	2018-05-19 23:35:41.703	2018-05-19 23:35:42.777	\N	CROSS_VALIDATION	FINISHED	2018-05-19 23:35:41.703	905	31631d3c-7951-420b-ba4b-b86842b58247	1184	10	10	3
995	2018-05-20 15:15:38.718	2018-05-20 15:16:27.509	\N	CROSS_VALIDATION	FINISHED	2018-05-20 15:15:38.718	996	aa59cba8-367c-49b3-94e6-f3f2a4f50064	1186	10	10	3
1080	2018-05-22 00:06:12.844	2018-05-22 00:06:16.766	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:06:12.844	1081	1973f8e6-a385-4ecc-9735-54fd08c9801c	1187	10	1	3
1089	2018-05-22 00:06:47.504	2018-05-22 00:06:53.834	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:06:47.504	1090	78368729-47aa-4864-a373-3a6b437ae053	1188	10	1	3
1095	2018-05-22 00:07:15.233	2018-05-22 00:07:18.525	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:07:15.233	1096	0cbec18b-116c-4007-9366-83534d1c01da	1189	10	1	3
1107	2018-05-22 00:08:42.653	2018-05-22 00:08:42.885	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:08:42.654	1108	85ac28f5-4a0b-41c7-ba0e-4a864b500040	1190	10	1	3
1116	2018-05-22 00:09:10.889	2018-05-22 00:09:11.167	\N	CROSS_VALIDATION	FINISHED	2018-05-22 00:09:10.889	1117	b4cc3ba0-e1de-4173-9e48-b75c2419c2fc	1191	10	1	3
1130	2018-05-22 21:58:25.5	2018-05-22 21:58:42.594	\N	CROSS_VALIDATION	FINISHED	2018-05-22 21:58:25.5	1131	bf48353a-bc8c-40f0-a05d-a60074e709ef	1192	10	1	3
1163	2018-05-23 23:14:35.761	2018-05-23 23:15:04.632	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:14:35.761	1164	2e63d39a-87ad-41e0-9cd1-7a8f7919498a	1193	10	1	3
1172	2018-05-23 23:20:45.477	2018-05-23 23:21:02.966	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:20:45.477	1173	4147aa95-6934-4cc7-b02b-00a536f7de40	1194	10	1	3
1184	2018-05-23 23:52:02.087	2018-05-23 23:52:03.271	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:52:02.087	1185	161f7254-8d88-4764-93b1-886cfaf67381	1195	10	1	3
1196	2018-05-23 23:56:51.578	2018-05-23 23:56:52.407	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:56:51.578	1197	9f8087f6-0ebe-4aea-a79f-b4427ca53ebe	1196	10	1	3
1208	2018-05-23 23:57:42.783	2018-05-23 23:57:57.482	\N	CROSS_VALIDATION	FINISHED	2018-05-23 23:57:42.783	1209	11d72589-f5ff-46e8-9348-74119d17aa56	1197	10	1	3
1238	2018-05-25 22:57:35.869	2018-05-25 22:57:35.996	\N	CROSS_VALIDATION	FINISHED	2018-05-25 22:57:35.869	1239	39dd4ced-3d5d-4023-8cea-e0fa2f558d1f	906	10	1	1
1241	2018-05-25 22:57:45.06	2018-05-25 22:57:45.313	\N	CROSS_VALIDATION	FINISHED	2018-05-25 22:57:45.06	1242	3b163b98-e925-47e8-9cad-1d835bddd6bd	907	10	1	1
1247	2018-05-25 22:58:03.269	2018-05-25 22:58:03.402	\N	CROSS_VALIDATION	FINISHED	2018-05-25 22:58:03.269	1248	96c40b04-c580-4b74-8f16-f4062fd184cd	908	10	1	1
1250	2018-05-25 22:58:13.987	2018-05-25 22:58:14.2	\N	CROSS_VALIDATION	FINISHED	2018-05-25 22:58:13.987	1251	a78a49c2-6b98-433d-915e-088eaf6bed89	909	10	1	1
1256	2018-05-25 22:59:46.044	2018-05-25 22:59:46.095	\N	CROSS_VALIDATION	FINISHED	2018-05-25 22:59:46.044	1257	30c4cd7c-a6f6-4eeb-a1ec-8cb0166d1b93	910	10	1	1
1365	2018-05-27 15:21:01.373	2018-05-27 15:21:03.826	\N	CROSS_VALIDATION	FINISHED	2018-05-27 15:21:01.373	1366	94a511f2-986c-4e5e-9ddf-fb0d7f121832	911	10	1	1
1374	2018-05-27 15:21:21.592	2018-05-27 15:21:23.248	\N	CROSS_VALIDATION	FINISHED	2018-05-27 15:21:21.592	1375	e576b19b-104a-4ddd-86e3-ed82b7227d5a	912	10	1	1
1380	2018-05-27 15:21:42.779	2018-05-27 15:21:45.248	\N	CROSS_VALIDATION	FINISHED	2018-05-27 15:21:42.779	1381	48b204dd-4c0d-4dae-aad1-46cb410c7353	913	10	1	1
1383	2018-05-27 15:21:54.248	2018-05-27 15:21:55.467	\N	CROSS_VALIDATION	FINISHED	2018-05-27 15:21:54.248	1384	428d360a-908c-4be1-a6c7-ebe1ced678bd	914	10	1	1
1389	2018-05-27 15:23:43.999	2018-05-27 15:23:44.171	\N	CROSS_VALIDATION	FINISHED	2018-05-27 15:23:43.999	1390	697461f7-5b58-4a93-afb6-a42298c9ddd3	915	10	1	1
1392	2018-05-27 15:23:53.187	2018-05-27 15:23:53.828	\N	CROSS_VALIDATION	FINISHED	2018-05-27 15:23:53.187	1393	cd84b29c-798c-4697-af7f-294531194b66	916	10	1	1
1395	2018-05-27 15:24:01.875	2018-05-27 15:24:02	\N	CROSS_VALIDATION	FINISHED	2018-05-27 15:24:01.875	1396	d3419c7c-3a19-429c-bdd9-6772d5354bde	917	10	1	1
1425	2018-05-27 17:31:45.198	2018-05-27 17:31:49.485	\N	CROSS_VALIDATION	FINISHED	2018-05-27 17:31:45.198	1426	fcd11c92-9f6a-4ebf-9e08-7574f1eb83c6	918	10	1	1
1428	2018-05-27 17:32:01.547	2018-05-27 17:32:04.647	\N	CROSS_VALIDATION	FINISHED	2018-05-27 17:32:01.547	1429	eb9a09d9-90cd-4d39-9eeb-bcaa3b91475d	919	10	1	1
1452	2018-05-27 22:54:54.927	2018-05-27 22:55:29.271	\N	CROSS_VALIDATION	FINISHED	2018-05-27 22:54:54.927	1453	c8190297-c350-4a65-8a83-9ea0a32f47c6	920	10	1	1
1455	2018-05-27 22:56:03.334	2018-05-27 22:57:00.397	\N	CROSS_VALIDATION	FINISHED	2018-05-27 22:56:03.334	1456	bd7c9228-09fa-4216-91b5-3bf6561e0526	921	10	1	1
1458	2018-05-27 22:57:17.125	2018-05-27 22:57:25.031	\N	CROSS_VALIDATION	FINISHED	2018-05-27 22:57:17.125	1459	d3bacaa2-8d41-4610-bb0f-7e4e4fc63aa8	922	10	1	1
1470	2018-05-27 22:59:04.72	2018-05-27 22:59:07.388	\N	CROSS_VALIDATION	FINISHED	2018-05-27 22:59:04.72	1471	1f6c4683-168c-491c-9744-b03fc2c2edeb	923	10	1	1
1473	2018-05-27 22:59:19.466	2018-05-27 22:59:22.43	\N	CROSS_VALIDATION	FINISHED	2018-05-27 22:59:19.466	1474	f2709192-8456-417e-bf4c-ea93e76741b7	924	10	1	1
1479	2018-05-27 23:00:08.017	2018-05-27 23:00:11.205	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:00:08.017	1480	788be6bd-786e-4f9c-be0f-edb9d835cc11	925	10	1	1
1482	2018-05-27 23:00:29.549	2018-05-27 23:00:39.439	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:00:29.549	1483	ca1b5222-c34b-459c-a17e-f15f46086009	926	10	1	1
1485	2018-05-27 23:00:52.096	2018-05-27 23:00:56.393	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:00:52.096	1486	25bdb761-8aa5-4e61-9dea-fce98bbea16b	927	10	1	1
1491	2018-05-27 23:01:45.831	2018-05-27 23:01:49.065	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:01:45.831	1492	b0e90cf7-3630-4915-a7f0-4b5dbdce8962	928	10	1	1
1494	2018-05-27 23:10:03.508	2018-05-27 23:10:04.945	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:10:03.508	1495	2441bc5b-3f82-41c9-a0e9-b51d9a26f824	929	10	1	1
1497	2018-05-27 23:10:17.399	2018-05-27 23:10:17.571	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:10:17.399	1498	d78ba8fd-6edd-4d50-87f5-d0ccc55a4926	930	10	1	1
1503	2018-05-27 23:10:32.711	2018-05-27 23:10:32.868	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:10:32.711	1504	52a13d92-b726-49b4-b622-71b99d62d090	931	10	1	1
1506	2018-05-27 23:10:41.836	2018-05-27 23:10:41.946	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:10:41.836	1507	e80b9a85-1a91-48b8-9d08-6f099e52e0aa	932	10	1	1
1509	2018-05-27 23:10:51.446	2018-05-27 23:10:51.524	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:10:51.446	1510	ba12220f-7358-4b4c-a085-df5c905495cf	933	10	1	1
1515	2018-05-27 23:11:13.571	2018-05-27 23:11:13.649	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:11:13.571	1516	73d6c8d5-eec5-45de-8a05-56c62235b27c	934	10	1	1
1518	2018-05-27 23:11:20.665	2018-05-27 23:11:20.79	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:11:20.665	1519	6675d8bc-f1ac-411d-a691-22c3f58a7cb5	935	10	1	1
1524	2018-05-27 23:11:39.368	2018-05-27 23:11:39.446	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:11:39.368	1525	0ae01858-190d-4344-b3da-dd5095ec46fb	936	10	1	1
1527	2018-05-27 23:11:46.993	2018-05-27 23:11:47.025	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:11:46.993	1528	d73020dc-32a6-43f7-9fab-844e47fd3af7	937	10	1	1
1607	2018-05-27 23:41:37.132	2018-05-27 23:41:38.669	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:41:37.132	1608	61d956ce-ad62-4b51-bfb4-b78dd357b1ea	938	10	1	1
1613	2018-05-27 23:41:54.438	2018-05-27 23:41:54.704	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:41:54.438	1614	40bb7e56-d0a6-4b62-80fa-3eb2075df63a	939	10	1	1
1616	2018-05-27 23:42:01.654	2018-05-27 23:42:03.212	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:42:01.654	1617	88814b04-b271-4bb8-9c20-9e57ab99b08f	940	10	1	1
1622	2018-05-27 23:42:19.025	2018-05-27 23:42:20.103	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:42:19.025	1623	b988b5c5-1acc-4444-8687-5d298c6e90bf	941	10	1	1
1625	2018-05-27 23:42:29.184	2018-05-27 23:42:30.213	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:42:29.184	1626	6f235069-5864-4550-ae22-88a456aa720a	942	10	1	1
1628	2018-05-27 23:42:36.958	2018-05-27 23:42:37.036	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:42:36.958	1629	9a66c6c4-3b7e-4168-865a-7c95d74d25a4	943	10	1	1
1714	2018-06-02 00:12:11.308	2018-06-02 00:12:31.707	\N	CROSS_VALIDATION	FINISHED	2018-06-02 00:12:11.308	1715	8df507b6-ee2b-4fd2-9a99-6e99dad6a2ec	945	10	1	1
1720	2018-06-02 00:15:20.801	2018-06-02 00:15:34.199	\N	CROSS_VALIDATION	FINISHED	2018-06-02 00:15:20.801	1721	2b23f404-434c-4dd6-9541-43b9119f58ac	946	10	1	1
1745	2018-06-07 22:02:07.596	2018-06-07 22:02:09.292	\N	CROSS_VALIDATION	FINISHED	2018-06-07 22:02:07.596	1746	69e1455f-d08d-47f6-ad75-9a5113bd38b1	947	10	1	1
1748	2018-06-07 22:03:06.98	2018-06-07 22:03:07.142	\N	CROSS_VALIDATION	FINISHED	2018-06-07 22:03:06.98	1749	3beed982-3e04-4ed0-871b-1108a063ebe1	948	10	1	1
1754	2018-06-07 22:03:23.536	2018-06-07 22:03:23.672	\N	CROSS_VALIDATION	FINISHED	2018-06-07 22:03:23.536	1755	8419f0a9-20d8-46e4-9396-675ec106dd81	949	10	1	1
1757	2018-06-07 22:03:35.282	2018-06-07 22:03:35.402	\N	CROSS_VALIDATION	FINISHED	2018-06-07 22:03:35.282	1758	61f3e91c-efc4-41dd-9e5d-36946bca3267	950	10	1	1
1760	2018-06-07 22:03:42.579	2018-06-07 22:03:42.661	\N	CROSS_VALIDATION	FINISHED	2018-06-07 22:03:42.579	1761	8bd13a7e-82b8-4353-838d-d52878af24d3	951	10	1	1
1766	2018-06-07 22:04:17.598	2018-06-07 22:04:17.674	\N	CROSS_VALIDATION	FINISHED	2018-06-07 22:04:17.598	1767	16be9be7-99b2-4f32-8a11-bf28c5cf5246	952	10	1	1
1769	2018-06-07 22:04:28.165	2018-06-07 22:04:28.23	\N	CROSS_VALIDATION	FINISHED	2018-06-07 22:04:28.165	1770	4eaddc1b-dc35-49cd-a8b0-ff048ba582ac	953	10	1	1
1775	2018-06-07 22:05:01.257	2018-06-07 22:05:01.292	\N	CROSS_VALIDATION	FINISHED	2018-06-07 22:05:01.257	1776	11d0a60b-db05-4aba-a859-933126551d9a	954	10	1	1
1778	2018-06-07 22:05:09.16	2018-06-07 22:05:09.2	\N	CROSS_VALIDATION	FINISHED	2018-06-07 22:05:09.16	1779	7860117d-8a40-4c7a-92b8-43516485ba1f	955	10	1	1
1921	2018-06-10 00:33:54.545	2018-06-10 00:33:54.619	\N	CROSS_VALIDATION	FINISHED	2018-06-10 00:33:54.545	1922	d6d56aa9-458a-4743-80a7-e7e2a4a64562	957	10	1	1
1924	2018-06-10 00:34:00.978	2018-06-10 00:34:01.043	\N	CROSS_VALIDATION	FINISHED	2018-06-10 00:34:00.978	1925	5df069dd-4726-484f-a3ac-6aeafaea368a	958	10	1	1
1927	2018-06-10 00:34:06.86	2018-06-10 00:34:06.903	\N	CROSS_VALIDATION	FINISHED	2018-06-10 00:34:06.86	1928	f2fb51ac-c375-4656-9e0a-066ae48dddff	959	10	1	1
1933	2018-06-10 00:34:21.125	2018-06-10 00:34:21.14	\N	CROSS_VALIDATION	FINISHED	2018-06-10 00:34:21.125	1934	bd89e3df-5784-4484-8fbe-17d208a23638	960	10	1	1
1936	2018-06-10 00:34:45.672	2018-06-10 00:34:45.749	\N	CROSS_VALIDATION	FINISHED	2018-06-10 00:34:45.672	1937	008a8e9d-68ab-4190-954f-59b92a142431	961	10	1	1
1942	2018-06-10 00:35:13.494	2018-06-10 00:35:13.556	\N	CROSS_VALIDATION	FINISHED	2018-06-10 00:35:13.494	1943	e4cbdb34-caa9-470d-b536-1052ebdf5e03	962	10	1	1
1945	2018-06-10 00:35:21.584	2018-06-10 00:35:21.61	\N	CROSS_VALIDATION	FINISHED	2018-06-10 00:35:21.584	1946	db2ff7d0-8757-4e47-b8e9-8def86740cef	963	10	1	1
1948	2018-06-10 00:35:30.408	2018-06-10 00:35:30.422	\N	CROSS_VALIDATION	FINISHED	2018-06-10 00:35:30.408	1949	58a2887f-13f8-4d26-a3cb-4d6dd0f3f696	964	10	1	1
1954	2018-06-10 00:42:35.596	2018-06-10 00:42:35.75	\N	CROSS_VALIDATION	FINISHED	2018-06-10 00:42:35.596	1955	e911f069-86fc-4e07-9b1a-e026d0b837d7	965	10	1	1
2022	2018-06-10 21:27:31.269	2018-06-10 21:27:32.254	\N	CROSS_VALIDATION	FINISHED	2018-06-10 21:27:31.269	2023	8edc1ee6-7622-41da-bf4f-e9744afe04f0	968	10	1	1
2025	2018-06-10 21:27:41.66	2018-06-10 21:27:41.926	\N	CROSS_VALIDATION	FINISHED	2018-06-10 21:27:41.66	2026	b9fc4212-3859-49ea-bd7f-3884bc50c049	969	10	1	1
2031	2018-06-10 21:28:03.426	2018-06-10 21:28:03.629	\N	CROSS_VALIDATION	FINISHED	2018-06-10 21:28:03.426	2032	ba43d6d8-a263-4f38-a476-6ab82d69313f	970	10	1	1
2034	2018-06-10 21:28:13.332	2018-06-10 21:28:13.473	\N	CROSS_VALIDATION	FINISHED	2018-06-10 21:28:13.332	2035	ba7d7347-26bb-4da7-ad8c-377fe023b4eb	971	10	1	1
2109	2018-06-13 00:14:15.762	2018-06-13 00:14:18.325	\N	CROSS_VALIDATION	FINISHED	2018-06-13 00:14:15.762	2110	d525bba6-cb21-4cc7-a699-8d919b197e00	972	10	1	1
2117	2018-06-21 21:18:03.987	2018-06-21 21:18:04.134	\N	CROSS_VALIDATION	FINISHED	2018-06-21 21:18:03.987	2118	bfccb852-6ed2-4141-bb3f-f53c5955e7cb	974	10	1	1
2120	2018-06-21 21:18:10.807	2018-06-21 21:18:10.936	\N	CROSS_VALIDATION	FINISHED	2018-06-21 21:18:10.807	2121	4a0da135-f3c8-42c0-9dd4-282492bb4c1e	975	10	1	1
2123	2018-06-21 21:18:24.674	2018-06-21 21:18:24.757	\N	CROSS_VALIDATION	FINISHED	2018-06-21 21:18:24.674	2124	654158c0-db71-46d6-8111-8e1a3653ce1d	976	10	1	1
2126	2018-06-21 21:18:32.183	2018-06-21 21:18:32.277	\N	CROSS_VALIDATION	FINISHED	2018-06-21 21:18:32.183	2127	ac5c907a-9d7b-44d9-a4ed-7ad029d5b0a0	977	10	1	1
2129	2018-06-21 21:18:38.732	2018-06-21 21:18:38.822	\N	CROSS_VALIDATION	FINISHED	2018-06-21 21:18:38.732	2130	dc7bb348-cff0-4047-af89-4148b0192160	978	10	1	1
2132	2018-06-21 21:18:47.859	2018-06-21 21:18:47.945	\N	CROSS_VALIDATION	FINISHED	2018-06-21 21:18:47.859	2133	ce874530-18f6-4274-a5bb-f876cfc9a69d	979	10	1	1
2135	2018-06-21 21:18:55.005	2018-06-21 21:18:55.086	\N	CROSS_VALIDATION	FINISHED	2018-06-21 21:18:55.005	2136	d9a52724-a4b6-4dab-8952-acb33069cde9	980	10	1	1
2138	2018-06-21 21:19:01.304	2018-06-21 21:19:01.384	\N	CROSS_VALIDATION	FINISHED	2018-06-21 21:19:01.304	2139	73b3afcb-cde6-479f-bfb2-8c4098243ea8	981	10	1	1
2141	2018-06-21 21:19:06.151	2018-06-21 21:19:06.667	\N	CROSS_VALIDATION	FINISHED	2018-06-21 21:19:06.151	2142	cbf77d1e-78c5-4e7f-b9b8-e88a3f3b6d3d	982	10	1	1
2144	2018-06-21 21:19:14.322	2018-06-21 21:19:14.4	\N	CROSS_VALIDATION	FINISHED	2018-06-21 21:19:14.322	2145	f0218bbd-d0c1-4ddc-a851-9ca1178ce738	983	10	1	1
2147	2018-06-21 21:19:21.309	2018-06-21 21:19:21.339	\N	CROSS_VALIDATION	FINISHED	2018-06-21 21:19:21.309	2148	91abf83b-9ff0-4013-85cc-7b43413bfaad	984	10	1	1
2150	2018-06-21 21:19:28.523	2018-06-21 21:19:28.561	\N	CROSS_VALIDATION	FINISHED	2018-06-21 21:19:28.523	2151	a9e8857f-71c9-4891-85da-d416bb258934	985	10	1	1
2275	2018-06-25 23:39:08.061	2018-06-25 23:39:09.019	\N	CROSS_VALIDATION	FINISHED	2018-06-25 23:39:08.061	2276	6b253abe-a800-469b-8c97-816b48c0c399	988	10	1	1
2278	2018-06-25 23:39:25.977	2018-06-25 23:39:26.201	\N	CROSS_VALIDATION	FINISHED	2018-06-25 23:39:25.977	2279	e7def2c8-4c52-49eb-879c-a1c9fd42eaab	989	10	1	1
2281	2018-06-25 23:39:32.252	2018-06-25 23:39:32.625	\N	CROSS_VALIDATION	FINISHED	2018-06-25 23:39:32.252	2282	c9710e9f-8a6c-4744-a1f0-d1380d9ccebc	990	10	1	1
2284	2018-06-25 23:39:43.701	2018-06-25 23:39:45.041	\N	CROSS_VALIDATION	FINISHED	2018-06-25 23:39:43.701	2285	7219718e-91a6-4486-aaf9-3bf58c3ddf17	991	10	1	1
2287	2018-06-25 23:39:52.608	2018-06-25 23:39:54.956	\N	CROSS_VALIDATION	FINISHED	2018-06-25 23:39:52.608	2288	d1b9f981-4be9-4154-8839-1db74cfbf097	992	10	1	1
2290	2018-06-25 23:40:01.946	2018-06-25 23:40:04.419	\N	CROSS_VALIDATION	FINISHED	2018-06-25 23:40:01.946	2291	98dddd34-259a-455a-a612-b4547cb8c140	993	10	1	1
2293	2018-06-25 23:40:11.919	2018-06-25 23:40:13.273	\N	CROSS_VALIDATION	FINISHED	2018-06-25 23:40:11.919	2294	8e6a5b1e-ec34-4046-aefa-7d3f11170492	994	10	1	1
2307	2018-06-25 23:41:31.147	2018-06-25 23:41:31.544	\N	CROSS_VALIDATION	FINISHED	2018-06-25 23:41:31.147	2308	11b3b1be-5153-4703-bc50-80784f515921	996	10	1	1
2325	2018-06-26 21:25:43.544	2018-06-26 21:25:44.4	\N	CROSS_VALIDATION	FINISHED	2018-06-26 21:25:43.544	2326	f79f4510-10be-4077-92ec-ff7ec11ec295	998	10	1	1
2328	2018-06-26 21:25:58.436	2018-06-26 21:26:00.832	\N	CROSS_VALIDATION	FINISHED	2018-06-26 21:25:58.436	2329	28ba9249-2582-4812-a3df-8f1a74bfa44b	999	10	1	1
2331	2018-06-26 21:26:11.416	2018-06-26 21:26:14.228	\N	CROSS_VALIDATION	FINISHED	2018-06-26 21:26:11.416	2332	9002a3be-c69c-4136-aedb-84652a8e18f3	1000	10	1	1
2334	2018-06-26 21:26:21.787	2018-06-26 21:26:23.072	\N	CROSS_VALIDATION	FINISHED	2018-06-26 21:26:21.787	2335	1bd5a2b0-a4cd-468f-8e76-822848040ea1	1001	10	1	1
2337	2018-06-26 21:26:32.821	2018-06-26 21:26:34.264	\N	CROSS_VALIDATION	FINISHED	2018-06-26 21:26:32.821	2338	586d2f5a-6720-4e9d-9f8c-046a365faea2	1002	10	1	1
2340	2018-06-26 21:26:43.323	2018-06-26 21:26:43.76	\N	CROSS_VALIDATION	FINISHED	2018-06-26 21:26:43.324	2341	8f13fc8b-47a3-4c7d-9d49-7193e6f9b8d2	1003	10	1	1
2343	2018-06-26 21:27:04.74	2018-06-26 21:27:04.813	\N	CROSS_VALIDATION	FINISHED	2018-06-26 21:27:04.74	2344	9d5be651-cf5c-4199-9d5b-eff1ba257822	1004	10	1	1
2374	2018-06-26 22:47:54.895	2018-06-26 22:47:55.491	\N	CROSS_VALIDATION	FINISHED	2018-06-26 22:47:54.895	2375	68c80a22-476f-4971-bb8a-fbfa9e8a44f6	1005	10	1	1
2379	2018-06-26 23:03:19.095	2018-06-26 23:03:20.558	\N	CROSS_VALIDATION	FINISHED	2018-06-26 23:03:19.095	2380	ea0d9294-e7b7-4bcc-86e3-b100bc0a0eb1	1006	10	1	1
2384	2018-06-26 23:08:23.355	2018-06-26 23:08:24.392	\N	CROSS_VALIDATION	FINISHED	2018-06-26 23:08:23.355	2385	db8e353f-235b-49f2-bf39-fd76634a4367	1007	10	1	1
2455	2018-07-07 13:31:54.831	2018-07-07 13:31:56.273	\N	CROSS_VALIDATION	FINISHED	2018-07-07 13:31:54.831	2456	01daba8f-8f16-4edf-b805-1cdbe14224cd	1010	10	1	1
2458	2018-07-07 13:32:07.314	2018-07-07 13:32:08.73	\N	CROSS_VALIDATION	FINISHED	2018-07-07 13:32:07.314	2459	77eacd03-f444-40d2-90bb-94923fe2e84d	1011	10	1	1
2461	2018-07-07 13:32:17.22	2018-07-07 13:32:20.527	\N	CROSS_VALIDATION	FINISHED	2018-07-07 13:32:17.22	2462	925ae0ba-e6fc-47ef-a4ae-869fd6bbaca6	1012	10	1	1
2464	2018-07-07 13:32:31.612	2018-07-07 13:32:34.062	\N	CROSS_VALIDATION	FINISHED	2018-07-07 13:32:31.612	2465	d334bc38-1bf9-4def-b7da-3af554a142d5	1013	10	1	1
2467	2018-07-07 13:32:40.427	2018-07-07 13:32:41.812	\N	CROSS_VALIDATION	FINISHED	2018-07-07 13:32:40.427	2468	d100332b-8ace-470c-8334-e4485cc70c67	1014	10	1	1
2470	2018-07-07 13:32:51.597	2018-07-07 13:32:54.937	\N	CROSS_VALIDATION	FINISHED	2018-07-07 13:32:51.597	2471	31f3cf66-f48d-413d-902e-94a12aaac5e0	1015	10	1	1
2473	2018-07-07 13:33:02.883	2018-07-07 13:33:02.964	\N	CROSS_VALIDATION	FINISHED	2018-07-07 13:33:02.883	2474	cef3caf1-2f19-42f2-84f8-a40a7e501aba	1016	10	1	1
2476	2018-07-07 13:33:18.552	2018-07-07 13:33:18.77	\N	CROSS_VALIDATION	FINISHED	2018-07-07 13:33:18.552	2477	5db43881-ac48-4831-88e7-ab2a790f6755	1017	10	1	1
2479	2018-07-07 13:33:27.642	2018-07-07 13:33:28.69	\N	CROSS_VALIDATION	FINISHED	2018-07-07 13:33:27.642	2480	06ea8b29-8950-433d-a3ec-ae2330409262	1018	10	1	1
2482	2018-07-07 13:33:38.715	2018-07-07 13:33:41.001	\N	CROSS_VALIDATION	FINISHED	2018-07-07 13:33:38.715	2483	5056d121-c469-4c47-b315-417c68bdaea1	1019	10	1	1
2040	2018-06-10 21:28:46.114	2018-06-10 21:28:46.254	\N	CROSS_VALIDATION	FINISHED	2018-06-10 21:28:46.114	2041	410f39d4-910e-4172-845a-39b74c29dd82	1020	10	1	1
2043	2018-06-10 21:29:03.864	2018-06-10 21:29:03.911	\N	CROSS_VALIDATION	FINISHED	2018-06-10 21:29:03.864	2044	90355fe4-4745-41c7-85d9-3dd41adbfce6	1021	10	1	1
2485	2018-07-07 13:34:25.087	2018-07-07 13:35:15.743	\N	CROSS_VALIDATION	FINISHED	2018-07-07 13:34:25.087	2486	51a1dfd4-5df1-4209-8617-74998e138f47	1022	10	1	1
2515	2018-07-08 14:09:01.935	2018-07-08 14:09:23.235	\N	CROSS_VALIDATION	FINISHED	2018-07-08 14:09:01.935	2516	e8f2b896-238b-4390-b16a-1b20fcfab577	1025	10	1	1
2518	2018-07-08 14:09:54.803	2018-07-08 14:10:17.188	\N	CROSS_VALIDATION	FINISHED	2018-07-08 14:09:54.803	2519	0f08b71c-2fbe-4b5b-a2ea-b610e95a3759	1026	10	1	1
2521	2018-07-08 14:10:40.856	2018-07-08 14:10:49.005	\N	CROSS_VALIDATION	FINISHED	2018-07-08 14:10:40.856	2522	99927745-03be-49b3-a6b3-6ae868be576b	1027	10	1	1
2524	2018-07-08 14:11:09.662	2018-07-08 14:11:21.022	\N	CROSS_VALIDATION	FINISHED	2018-07-08 14:11:09.662	2525	5abf51a6-3d2b-46e4-bbb3-32561fa09fcf	1028	10	1	1
2527	2018-07-08 14:11:48.73	2018-07-08 14:11:59.913	\N	CROSS_VALIDATION	FINISHED	2018-07-08 14:11:48.73	2528	124d3d7d-6006-497b-b095-cc5215fddc45	1029	10	1	1
2530	2018-07-08 14:12:31.695	2018-07-08 14:12:52.688	\N	CROSS_VALIDATION	FINISHED	2018-07-08 14:12:31.695	2531	257641e9-7518-41cc-adba-02f7b3c7f7e7	1030	10	1	1
2533	2018-07-08 14:13:27.14	2018-07-08 14:14:19.082	\N	CROSS_VALIDATION	FINISHED	2018-07-08 14:13:27.14	2534	38b6d846-5079-406f-ad68-18bd67941e6f	1031	10	1	1
2539	2018-07-08 14:16:38.034	2018-07-08 14:17:12.829	\N	CROSS_VALIDATION	FINISHED	2018-07-08 14:16:38.034	2540	c5593f6f-1a18-4583-b092-b065eaa6e82e	1033	10	1	1
2542	2018-07-08 14:17:37.193	2018-07-08 14:18:27.783	\N	CROSS_VALIDATION	FINISHED	2018-07-08 14:17:37.193	2543	7c1af2c8-1372-4fd2-9bff-70810d32365b	1034	10	1	1
2545	2018-07-08 14:20:23.226	2018-07-08 14:20:25.125	\N	CROSS_VALIDATION	FINISHED	2018-07-08 14:20:23.226	2546	e862f69b-4b86-4c92-b0f4-0ea53306a199	1035	10	1	1
2598	2018-08-23 21:10:34.606	2018-08-23 21:10:36.066	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:10:34.607	2599	3b4fe1ca-67e0-4df6-80d4-e6153dadd868	1038	10	1	1
2601	2018-08-23 21:10:48.877	2018-08-23 21:10:49.048	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:10:48.877	2602	3de50426-9b9c-45ed-b945-0cc110992457	1039	10	1	1
2604	2018-08-23 21:10:59.113	2018-08-23 21:10:59.233	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:10:59.113	2605	bfbdac4d-a9ae-4cfe-93c9-58e59662f5f2	1040	10	1	1
2612	2018-08-23 21:12:33.946	2018-08-23 21:12:40.727	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:12:33.946	2613	9e212d52-3aec-4a29-bf91-4460a4b0ac24	1042	10	1	1
2615	2018-08-23 21:12:49.275	2018-08-23 21:12:56.585	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:12:49.275	2616	13b9367d-f9ef-4acf-8ef7-2423ead059e8	1043	10	1	1
2618	2018-08-23 21:13:02.934	2018-08-23 21:13:03.861	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:13:02.934	2619	ae362ec7-308d-4939-881a-2a62dd473b91	1044	10	1	1
2621	2018-08-23 21:14:40.963	2018-08-23 21:14:41.138	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:14:40.963	2622	7d85a173-b154-4fa6-8b8c-29124298c00f	1045	10	1	1
2624	2018-08-23 21:14:47.736	2018-08-23 21:14:47.757	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:14:47.736	2625	605d6169-463d-458a-9565-94f411302fb9	1046	10	1	1
2627	2018-08-23 21:14:55.259	2018-08-23 21:14:55.302	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:14:55.259	2628	b58b8c1e-da20-4a08-ba44-ad4a98f24246	1047	10	1	1
2630	2018-08-23 21:15:02.089	2018-08-23 21:15:02.39	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:15:02.089	2631	6525ab67-e703-4130-a517-8e88491a14da	1048	10	1	1
2633	2018-08-23 21:15:13.453	2018-08-23 21:15:13.532	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:15:13.453	2634	1807a2c8-4da6-4bc7-95fb-a6ea07dee9e5	1049	10	1	1
2636	2018-08-23 21:15:29.499	2018-08-23 21:15:29.525	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:15:29.499	2637	f8de89e0-a406-48f0-9252-520fee8eb090	1050	10	1	1
2639	2018-08-23 21:15:37.547	2018-08-23 21:15:39.64	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:15:37.547	2640	665b00dd-c6b0-4776-a0d9-50ec290ee150	1051	10	1	1
2642	2018-08-23 21:15:50.986	2018-08-23 21:15:51.548	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:15:50.986	2643	4e0729f9-cdf1-4be7-a876-6b63fb123697	1052	10	1	1
2645	2018-08-23 21:15:59.471	2018-08-23 21:16:00.944	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:15:59.471	2646	436616b4-81d8-48c7-8c06-6e3f7e723d57	1053	10	1	1
2648	2018-08-23 21:16:23.964	2018-08-23 21:16:38.621	\N	CROSS_VALIDATION	FINISHED	2018-08-23 21:16:23.964	2649	0f4404a9-e2d0-4078-ac98-2c4e901164e3	1054	10	1	1
2830	2018-12-29 20:23:13.347	2018-12-29 20:23:14.762	\N	CROSS_VALIDATION	FINISHED	2018-12-29 20:23:13.347	2831	16995c34-18f4-4c3f-af23-65ff7712cdfa	1056	10	1	1
2930	2018-12-30 15:15:20.471	2018-12-30 15:15:21.298	\N	CROSS_VALIDATION	FINISHED	2018-12-30 15:15:20.471	2931	84802195-669b-42f3-ad03-abf4613c2f94	1068	10	1	1
2957	2018-12-30 21:33:10.315	2018-12-30 21:33:12.373	\N	CROSS_VALIDATION	FINISHED	2018-12-30 21:33:10.315	2958	5f7f8345-09fc-4da5-a342-263344c5bbc3	1069	10	1	1
2960	2018-12-30 21:33:26.36	2018-12-30 21:33:28.61	\N	CROSS_VALIDATION	FINISHED	2018-12-30 21:33:26.36	2961	201c0657-09de-435f-9938-76c3e1bcbc51	1070	10	1	1
2963	2018-12-30 21:33:37.372	2018-12-30 21:33:39.617	\N	CROSS_VALIDATION	FINISHED	2018-12-30 21:33:37.372	2964	3d818784-86c6-44ed-ad6a-9a174616beeb	1071	10	1	1
2966	2018-12-30 21:33:46.511	2018-12-30 21:33:47.032	\N	CROSS_VALIDATION	FINISHED	2018-12-30 21:33:46.511	2967	d446eef5-343e-448b-a3ce-3196d017577b	1072	10	1	1
2969	2018-12-30 21:33:53.664	2018-12-30 21:33:54.533	\N	CROSS_VALIDATION	FINISHED	2018-12-30 21:33:53.664	2970	93d160a6-3a0b-41c9-9914-a8ff459f778a	1073	10	1	1
2972	2018-12-30 21:34:10.922	2018-12-30 21:34:11.232	\N	CROSS_VALIDATION	FINISHED	2018-12-30 21:34:10.922	2973	814f11c0-7cd0-4274-b129-d6a45f06a044	1074	10	1	1
2993	2018-12-31 13:23:19.828	2018-12-31 13:23:21.75	\N	CROSS_VALIDATION	FINISHED	2018-12-31 13:23:19.828	2994	70cea94f-0b9b-4a80-bb96-2bf1715685f9	1075	10	1	1
3090	2019-01-05 17:24:48.412	2019-01-05 17:24:52.744	\N	CROSS_VALIDATION	FINISHED	2019-01-05 17:24:48.412	3091	733ea29d-820d-4e4b-a56e-9d1e7942ee0e	1076	10	1	1
3093	2019-01-05 17:25:01.129	2019-01-05 17:25:02.38	\N	CROSS_VALIDATION	FINISHED	2019-01-05 17:25:01.13	3094	d53ec236-ec3c-48a5-83ff-b22975709b85	1077	10	1	1
3096	2019-01-05 17:25:11.22	2019-01-05 17:25:12.444	\N	CROSS_VALIDATION	FINISHED	2019-01-05 17:25:11.22	3097	ac863a52-8dba-4854-abbd-7b45e03a497e	1078	10	1	1
3099	2019-01-05 17:25:22.689	2019-01-05 17:25:23.673	\N	CROSS_VALIDATION	FINISHED	2019-01-05 17:25:22.689	3100	4fb1e374-f99d-461c-b7ca-b22ad2141e63	1079	10	1	1
3102	2019-01-05 17:25:30.734	2019-01-05 17:25:34.161	\N	CROSS_VALIDATION	FINISHED	2019-01-05 17:25:30.734	3103	f246f1fa-c933-4019-8de1-30c06db7aa65	1080	10	1	1
3105	2019-01-05 17:25:40.82	2019-01-05 17:25:44.082	\N	CROSS_VALIDATION	FINISHED	2019-01-05 17:25:40.82	3106	39b18664-3d28-43e1-829b-b81089a13af9	1081	10	1	1
3108	2019-01-05 17:25:51.368	2019-01-05 17:25:54.057	\N	CROSS_VALIDATION	FINISHED	2019-01-05 17:25:51.368	3109	9a6700a2-ba7d-4f8b-9092-7f17c186122d	1082	10	1	1
3111	2019-01-05 17:26:07.781	2019-01-05 17:26:08.247	\N	CROSS_VALIDATION	FINISHED	2019-01-05 17:26:07.781	3112	8632272b-b962-4a36-ba82-63622bc2396e	1083	10	1	1
3128	2019-01-05 19:19:58.575	2019-01-05 19:20:00.813	\N	CROSS_VALIDATION	FINISHED	2019-01-05 19:19:58.575	3129	6546a922-c172-4d9b-971d-b36a2fa65ae9	1084	10	1	1
3131	2019-01-05 19:20:11.924	2019-01-05 19:20:12.795	\N	CROSS_VALIDATION	FINISHED	2019-01-05 19:20:11.924	3132	4a65d44f-3836-4e1f-9a52-aeacdf264269	1085	10	1	1
3134	2019-01-05 19:20:22.711	2019-01-05 19:20:24.764	\N	CROSS_VALIDATION	FINISHED	2019-01-05 19:20:22.711	3135	f241fc1d-0d44-4ecd-8099-ba60a1f30d47	1086	10	1	1
3137	2019-01-05 19:20:34.895	2019-01-05 19:20:35.053	\N	CROSS_VALIDATION	FINISHED	2019-01-05 19:20:34.895	3138	f608d69d-a8a9-400f-80ad-c69df4273827	1087	10	1	1
3140	2019-01-05 19:20:53.001	2019-01-05 19:20:54.642	\N	CROSS_VALIDATION	FINISHED	2019-01-05 19:20:53.001	3141	0d822221-3841-451b-a8f7-e0860ba7b141	1088	10	1	1
3143	2019-01-05 19:21:04.329	2019-01-05 19:21:06.456	\N	CROSS_VALIDATION	FINISHED	2019-01-05 19:21:04.329	3144	ac058a3b-1f44-4aa2-a2b4-e678aae01815	1089	10	1	1
3146	2019-01-05 19:21:44.613	2019-01-05 19:22:26.75	\N	CROSS_VALIDATION	FINISHED	2019-01-05 19:21:44.613	3147	f41321a8-3e02-4297-8e45-91ccc527549c	1090	10	1	1
1476	2018-05-27 22:59:41.47	2018-05-27 22:59:45.439	\N	CROSS_VALIDATION	FINISHED	2018-05-27 22:59:41.47	1477	09545082-96c6-4442-8319-3270561c623f	1209	10	1	1
1488	2018-05-27 23:01:12.159	2018-05-27 23:01:16.362	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:01:12.159	1489	d7cb0434-cf8b-4150-9ffc-82c279786b3b	1210	10	1	1
1500	2018-05-27 23:10:26.133	2018-05-27 23:10:26.274	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:10:26.133	1501	558813df-3c9b-4dea-8d4b-464cd2cbf303	1211	10	1	1
1512	2018-05-27 23:11:04.024	2018-05-27 23:11:04.149	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:11:04.024	1513	f18185b8-10f2-4754-a166-a5969b86b72e	1212	10	1	1
1521	2018-05-27 23:11:31.993	2018-05-27 23:11:32.024	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:11:31.993	1522	a04e220d-30a7-4221-92e6-421ab058b79e	1213	10	1	1
1610	2018-05-27 23:41:46.651	2018-05-27 23:41:48.088	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:41:46.651	1611	d6b177e4-179d-4331-9043-307677e2b05a	1214	10	1	1
1619	2018-05-27 23:42:11.369	2018-05-27 23:42:12.338	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:42:11.369	1620	8fecc04e-724f-4466-8894-26b53793a741	1215	10	1	1
1631	2018-05-27 23:42:44.144	2018-05-27 23:42:44.253	\N	CROSS_VALIDATION	FINISHED	2018-05-27 23:42:44.144	1632	b35ce98b-1122-44f2-a198-9ec0fb532899	1216	10	1	1
1717	2018-06-02 00:13:01.999	2018-06-02 00:13:12.172	\N	CROSS_VALIDATION	FINISHED	2018-06-02 00:13:01.999	1718	55f8a857-c286-4008-8783-c27a6f928120	1217	10	1	1
1751	2018-06-07 22:03:16.373	2018-06-07 22:03:16.471	\N	CROSS_VALIDATION	FINISHED	2018-06-07 22:03:16.373	1752	08835223-6edc-4acf-baff-e05f70f44591	1218	10	1	1
1763	2018-06-07 22:04:07.084	2018-06-07 22:04:07.174	\N	CROSS_VALIDATION	FINISHED	2018-06-07 22:04:07.084	1764	cddd4e66-afe7-4307-9cb1-64c4c5712140	1219	10	1	1
1772	2018-06-07 22:04:36.952	2018-06-07 22:04:37.024	\N	CROSS_VALIDATION	FINISHED	2018-06-07 22:04:36.952	1773	127b6109-9149-461e-948d-3493e34583ee	1220	10	1	1
1918	2018-06-10 00:33:46.445	2018-06-10 00:33:46.617	\N	CROSS_VALIDATION	FINISHED	2018-06-10 00:33:46.445	1919	e8117b0b-0a67-4d85-b541-2a7924c3330e	1221	10	1	1
1930	2018-06-10 00:34:13.981	2018-06-10 00:34:14.062	\N	CROSS_VALIDATION	FINISHED	2018-06-10 00:34:13.981	1931	7814aeef-da32-4343-ba72-a12dd064f099	1222	10	1	1
1939	2018-06-10 00:34:54.911	2018-06-10 00:34:54.979	\N	CROSS_VALIDATION	FINISHED	2018-06-10 00:34:54.911	1940	b292f505-f0c3-4e1c-87a3-5926b5cc2954	1223	10	1	1
1951	2018-06-10 00:35:39.878	2018-06-10 00:35:39.893	\N	CROSS_VALIDATION	FINISHED	2018-06-10 00:35:39.878	1952	2e2ac7d7-08a7-4735-9e20-2a92936617d9	1224	10	1	1
2028	2018-06-10 21:27:54.348	2018-06-10 21:27:54.504	\N	CROSS_VALIDATION	FINISHED	2018-06-10 21:27:54.348	2029	3ed7e6dd-f441-46c6-8d0e-ff2ff0aa7392	1226	10	1	1
2037	2018-06-10 21:28:35.567	2018-06-10 21:28:35.754	\N	CROSS_VALIDATION	FINISHED	2018-06-10 21:28:35.567	2038	e7439cc1-bd91-40ec-b1c3-4bb259314dc0	1227	10	1	1
6876	2019-04-13 14:47:52.771	2019-04-13 14:47:54.614	\N	CROSS_VALIDATION	FINISHED	2019-04-13 14:47:52.771	6877	7b332722-8411-48b6-8817-e95233a4db83	1228	10	1	1
6884	2019-04-13 14:48:30.793	2019-04-13 14:48:32.047	\N	CROSS_VALIDATION	FINISHED	2019-04-13 14:48:30.793	6885	d4c2ee45-ea51-4db2-b677-7085d9860c81	1229	10	1	1
6892	2019-04-13 14:48:41.12	2019-04-13 14:48:41.788	\N	CROSS_VALIDATION	FINISHED	2019-04-13 14:48:41.12	6893	63041daa-01ec-4d6a-9ae1-0d7117973dee	1230	10	1	1
6897	2019-04-13 14:50:06.329	2019-04-13 14:50:07.399	\N	CROSS_VALIDATION	FINISHED	2019-04-13 14:50:06.329	6898	66820616-5e83-4f9d-a7e3-073cb63c4b9c	1231	10	1	1
6905	2019-04-13 14:50:22.616	2019-04-13 14:50:23.649	\N	CROSS_VALIDATION	FINISHED	2019-04-13 14:50:22.616	6906	a55cd067-4e6e-4b3c-a7cd-1e5cb0e8a6ff	1232	10	1	1
6913	2019-04-13 14:55:29.712	2019-04-13 14:55:29.906	\N	CROSS_VALIDATION	FINISHED	2019-04-13 14:55:29.712	6914	144755b9-ab5a-4965-9ed8-545bd1ef3c8e	1233	10	1	1
6923	2019-04-13 14:56:18.153	2019-04-13 14:56:18.26	\N	CROSS_VALIDATION	FINISHED	2019-04-13 14:56:18.153	6924	2878e181-551d-48af-a63c-e5a42e887736	1234	10	1	1
6935	2019-04-13 14:57:02.071	2019-04-13 14:57:02.532	\N	CROSS_VALIDATION	FINISHED	2019-04-13 14:57:02.071	6936	521d616f-0321-4dcb-b8ac-5e3cd3686b1c	1235	10	1	1
6947	2019-04-13 14:57:42.127	2019-04-13 14:57:44.514	\N	CROSS_VALIDATION	FINISHED	2019-04-13 14:57:42.127	6948	aa187e83-93ad-4111-98cc-baea2b495e55	1236	10	1	1
6959	2019-04-13 15:29:37.403	2019-04-13 15:29:39.883	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:29:37.403	6960	e808a503-a5a3-4e2b-8012-cded16d0e180	1237	10	1	1
6977	2019-04-13 15:30:53.669	2019-04-13 15:30:55.412	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:30:53.669	6978	01f86715-be38-4769-86c4-301b94640f87	1239	10	1	1
6989	2019-04-13 15:31:22.562	2019-04-13 15:31:23.266	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:31:22.562	6990	51b996af-f9a6-42a3-87f4-3bcae1bc7c22	1240	10	1	1
7001	2019-04-13 15:32:09.571	2019-04-13 15:32:10.726	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:32:09.571	7002	ef87331b-e252-4042-a399-61bb285c02a0	1241	10	1	1
7013	2019-04-13 15:32:27.714	2019-04-13 15:32:28.583	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:32:27.714	7014	ad40353e-6528-4a93-87b6-f7f65b232630	1242	10	1	1
7025	2019-04-13 15:32:49.053	2019-04-13 15:32:49.815	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:32:49.053	7026	492125ff-7345-4d51-944b-57fbb6293924	1243	10	1	1
7037	2019-04-13 15:33:18.389	2019-04-13 15:33:19.118	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:33:18.389	7038	3030f690-f07b-4b9b-ac3c-c5a9223e11e2	1244	10	1	1
7049	2019-04-13 15:33:43.992	2019-04-13 15:33:44.84	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:33:43.992	7050	2958d232-7fb6-4f89-971a-444cc0f801a3	1245	10	1	1
7061	2019-04-13 15:34:06.384	2019-04-13 15:34:07.617	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:34:06.384	7062	0dbc56c2-1adb-4b3e-acc4-3024c1a8c223	1246	10	1	1
7073	2019-04-13 15:34:32.384	2019-04-13 15:34:33.325	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:34:32.384	7074	12eee724-de25-48b5-b39e-9174ee13cff0	1247	10	1	1
7085	2019-04-13 15:34:56.658	2019-04-13 15:34:57.529	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:34:56.658	7086	951a979c-432d-4e90-a971-a1157fbadac4	1248	10	1	1
7097	2019-04-13 15:35:22.43	2019-04-13 15:35:23.303	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:35:22.431	7098	5d37072b-31a5-495e-8cf5-1fb13b87beb3	1249	10	1	1
7109	2019-04-13 15:35:49.698	2019-04-13 15:35:50.437	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:35:49.698	7110	c5cabac6-eced-4d07-a0f3-d7dd4b405442	1250	10	1	1
7135	2019-04-13 15:37:07.881	2019-04-13 15:37:09.948	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:37:07.881	7136	88c5dd34-50c3-4150-8a98-8f7714d792f3	1252	10	1	1
7143	2019-04-13 15:37:31.796	2019-04-13 15:37:34.259	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:37:31.796	7144	9dec394d-c0be-46fd-b7ab-e27fac308ff4	1253	10	1	1
7151	2019-04-13 15:37:54.775	2019-04-13 15:37:57.107	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:37:54.775	7152	34836ba4-40cb-4a56-8cd4-0f18506dcab7	1254	10	1	1
7159	2019-04-13 15:38:13.474	2019-04-13 15:38:16.592	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:38:13.474	7160	6881179f-9af5-4d7b-bb8b-a2542336438a	1255	10	1	1
7167	2019-04-13 15:38:52.854	2019-04-13 15:38:55.683	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:38:52.854	7168	97709b40-445c-472a-9fa5-a91c47e78afd	1256	10	1	1
7175	2019-04-13 15:39:08.537	2019-04-13 15:39:11.975	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:39:08.537	7176	68fd8d5d-12ba-463a-87fc-f97771030a3c	1257	10	1	1
7183	2019-04-13 15:39:27.801	2019-04-13 15:39:31.397	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:39:27.801	7184	bfdf6f33-9ac3-43af-aa9d-8004da2d149c	1258	10	1	1
7191	2019-04-13 15:39:46.47	2019-04-13 15:39:51.172	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:39:46.47	7192	d8de5b98-d397-4755-92f1-ad00878c81dd	1259	10	1	1
7199	2019-04-13 15:40:03.643	2019-04-13 15:40:07.768	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:40:03.643	7200	00f4bda0-6117-441d-bcad-0f1c60a3706c	1260	10	1	1
7207	2019-04-13 15:40:19.803	2019-04-13 15:40:23.263	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:40:19.803	7208	5fe6ff01-44bd-4aae-8e25-30c0b3de1bdf	1261	10	1	1
7215	2019-04-13 15:40:37.672	2019-04-13 15:40:41.472	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:40:37.672	7216	75811236-9850-4a72-a89c-c0f14b4950f5	1262	10	1	1
7223	2019-04-13 15:40:52.976	2019-04-13 15:40:56.739	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:40:52.976	7224	87174455-068c-42e3-a306-c062a772a167	1263	10	1	1
7231	2019-04-13 15:41:26.661	2019-04-13 15:41:30.194	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:41:26.661	7232	fe72b176-1caa-4db1-ad48-acf693efaa22	1264	10	1	1
7239	2019-04-13 15:41:55.97	2019-04-13 15:41:59.436	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:41:55.97	7240	91197f2e-398b-469b-9c8d-2b59a6ab6256	1265	10	1	1
7247	2019-04-13 15:42:27.196	2019-04-13 15:42:31.995	\N	CROSS_VALIDATION	FINISHED	2019-04-13 15:42:27.196	7248	6a99a5be-2615-48e0-bb81-9043d069b55f	1266	10	1	1
7265	2019-04-13 16:19:25.43	2019-04-13 16:19:29.175	\N	CROSS_VALIDATION	FINISHED	2019-04-13 16:19:25.43	7266	6ecddfc2-7c9b-42c7-8ed6-5901613fb242	1268	10	1	1
7273	2019-04-13 16:19:52.321	2019-04-13 16:19:56.235	\N	CROSS_VALIDATION	FINISHED	2019-04-13 16:19:52.321	7274	221c10a2-e006-4e7f-9400-6ac64841e8fd	1269	10	1	1
7281	2019-04-13 16:20:11.908	2019-04-13 16:20:15.375	\N	CROSS_VALIDATION	FINISHED	2019-04-13 16:20:11.908	7282	249274b2-8bc5-4041-aa3f-4173a59de788	1270	10	1	1
7289	2019-04-13 16:20:26.959	2019-04-13 16:20:30.199	\N	CROSS_VALIDATION	FINISHED	2019-04-13 16:20:26.959	7290	a7896966-1894-41b7-8737-7d5c3d6c7054	1271	10	1	1
\.


--
-- TOC entry 2513 (class 0 OID 16507)
-- Dependencies: 207
-- Data for Name: evaluation_results_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evaluation_results_request (id, evaluation_log_id) FROM stdin;
2021	2019
2024	2022
2027	2025
2030	2028
2033	2031
2036	2034
2039	2037
2042	2040
2045	2043
2111	2109
2119	2117
2122	2120
2125	2123
2128	2126
2131	2129
2134	2132
2137	2135
2140	2138
2143	2141
2146	2144
2149	2147
2152	2150
2277	2275
2280	2278
2283	2281
2286	2284
2289	2287
2292	2290
2295	2293
2309	2307
2327	2325
2330	2328
2333	2331
2336	2334
2339	2337
2342	2340
2345	2343
2376	2374
2381	2379
2386	2384
2457	2455
2460	2458
2463	2461
2466	2464
2469	2467
2472	2470
2475	2473
2478	2476
2481	2479
2484	2482
2487	2485
2517	2515
2520	2518
2523	2521
2526	2524
2529	2527
2532	2530
2535	2533
2541	2539
2544	2542
2547	2545
2600	2598
2603	2601
2606	2604
2614	2612
2617	2615
2620	2618
2623	2621
2626	2624
2629	2627
2632	2630
2635	2633
2638	2636
2641	2639
2644	2642
2647	2645
2650	2648
2832	2830
2835	2833
2844	2836
2847	2845
2850	2848
2853	2851
2856	2854
2915	2913
2918	2916
2921	2919
2924	2922
2927	2925
2932	2930
2959	2957
2962	2960
2965	2963
2968	2966
2971	2969
2974	2972
2995	2993
3092	3090
3095	3093
3098	3096
3101	3099
3104	3102
3107	3105
3110	3108
3113	3111
3130	3128
3133	3131
3136	3134
3139	3137
3142	3140
3145	3143
3153	3146
3213	3211
6875	6868
6883	6876
6891	6884
6896	6892
6904	6897
6912	6905
6922	6913
6934	6923
6946	6935
6958	6947
6966	6959
6988	6977
7000	6989
7012	7001
7024	7013
7036	7025
7048	7037
7060	7049
7072	7061
7084	7073
7096	7085
7108	7097
7120	7109
7142	7135
7150	7143
7158	7151
7166	7159
7174	7167
7182	7175
7190	7183
7198	7191
7206	7199
7214	7207
7222	7215
7230	7223
7238	7231
7246	7239
7254	7247
7272	7265
7280	7273
7288	7281
7296	7289
7307	7300
\.


--
-- TOC entry 2515 (class 0 OID 16512)
-- Dependencies: 209
-- Data for Name: experiment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experiment (id, creation_date, email, end_date, error_message, evaluation_method, experiment_path, request_status, experiment_type, start_date, training_data_path, request_id, deleted_date, num_folds, num_tests, seed, class_index, channel_type, reply_to, correlation_id, experiment_download_url, instances_info_id) FROM stdin;
315	2017-12-31 15:52:06.05	bat1238@yandex.ru	2017-12-31 20:57:06.382	\N	TRAINING_DATA	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2017-12-31 20:07:35.319	\N	79999430-5378-49bb-851e-77f83dcd18ce	2018-02-25 00:00:01.038	\N	\N	\N	\N	QUEUE	\N	\N	\N	\N
471	2018-02-03 11:34:26.444	bat1238@yandex.ru	2018-02-03 11:36:11.415	\N	TRAINING_DATA	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-02-03 11:35:47.118	\N	0bed63b8-151f-42f4-8c5f-574fd68737b5	2018-03-08 00:00:00.204	\N	\N	\N	\N	QUEUE	\N	\N	\N	\N
472	2018-02-03 11:35:08.586	bat1238@yandex.ru	2018-02-03 11:36:12.774	\N	TRAINING_DATA	\N	FINISHED	KNN	2018-02-03 11:36:11.415	\N	620d806d-a669-46f8-a046-fdad950bb567	2018-03-08 00:00:00.229	\N	\N	\N	\N	QUEUE	\N	\N	\N	\N
429	2018-02-02 01:05:44.842	roman.batygin@mail.ru	2018-02-02 01:06:27.228	\N	TRAINING_DATA	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-02-02 01:05:55.953	\N	500f0e0d-60ad-4a8b-bd39-358c510b0f75	2018-03-08 00:00:00.105	\N	\N	\N	\N	QUEUE	\N	\N	\N	\N
697	2018-03-08 00:20:30.371	roman.batygin@mail.ru	2018-03-08 00:25:17.7	\N	TRAINING_DATA	\N	FINISHED	NEURAL_NETWORKS	2018-03-08 00:20:35.23	\N	6c10d912-3122-4a59-89cd-6e8b10ba05fc	2018-04-11 00:00:00.074	\N	\N	\N	\N	QUEUE	\N	\N	\N	\N
695	2018-03-08 00:01:30.062	roman.batygin@mail.ru	2018-03-08 00:09:35.082	\N	TRAINING_DATA	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-03-08 00:01:54.358	\N	a13ba049-7d9b-4298-b8f0-83800563db86	2018-04-11 00:00:00.043	\N	\N	\N	\N	QUEUE	\N	\N	\N	\N
469	2018-02-03 11:18:06.092	bat1238@yandex.ru	2018-02-03 11:27:06.976	java.lang.OutOfMemoryError: GC overhead limit exceeded	TRAINING_DATA	\N	ERROR	HETEROGENEOUS_ENSEMBLE	2018-02-03 11:18:20.615	\N	ace00794-bea3-4e23-ab9e-cd9a61f05d64	2018-03-08 00:00:00.147	\N	\N	\N	\N	QUEUE	\N	\N	\N	\N
839	2018-04-10 23:56:17.519	bat1238@yandex.ru	2018-04-10 23:59:34.683	Can't save object ExperimentHistory(experiment=[eca.core.evaluation.EvaluationResults@6a2f9e04, eca.core.evaluation.EvaluationResults@47e57ff9, eca.core.evaluation.EvaluationResults@4aad1fd2, eca.core.evaluation.EvaluationResults@58798550, eca.core.evaluation.EvaluationResults@4e30ffe5, eca.core.evaluation.EvaluationResults@22c65b6d, eca.core.evaluation.EvaluationResults@379368, eca.core.evaluation.EvaluationResults@1470c53b, eca.core.evaluation.EvaluationResults@5d76df87, eca.core.evaluation.EvaluationResults@4dfbea77, eca.core.evaluation.EvaluationResults@71eb9c73, eca.core.evaluation.EvaluationResults@6320c668, eca.core.evaluation.EvaluationResults@8c1a76c, eca.core.evaluation.EvaluationResults@1afb5c51, eca.core.evaluation.EvaluationResults@375e4379, eca.core.evaluation.EvaluationResults@5228d07c, eca.core.evaluation.EvaluationResults@57d7e792, eca.core.evaluation.EvaluationResults@178e20ed, eca.core.evaluation.EvaluationResults@520eecee, eca.core.evaluation.EvaluationResults@46b16de3, eca.core.evaluation.EvaluationResults@2eb2e9d0, eca.core.evaluation.EvaluationResults@485d2da3, eca.core.evaluation.EvaluationResults@6d91d1da, eca.core.evaluation.EvaluationResults@200267fe, eca.core.evaluation.EvaluationResults@1947e647], dataSet=@relation MedData\n\n@attribute Возраст numeric\n@attribute Этиология {'синдром Такаясу',атеросклероз,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)'}\n@attribute Стадия {3,1,2}\n@attribute 'Тип реконструкции дуги' {'агрессивный косой анастомоз','многобраншевый протез','техника «островка»'}\n@attribute 'Вид перфузии головного мозга' {'ретроградная перфузия','без перфузии','антеградная перфузия'}\n@attribute 'Вмешательство на корне аорты' {'операция Бенталла','супракоронарное протезирование (операция Де Бейки, Вольфа)','операция Дэвида'}\n@attribute 'Искусственное кровообращение' numeric\n@attribute 'Циркуляторный арест' numeric\n@attribute 'Тип нарушения мозгового кровообращения' {нет,'гипоксическая энцефалопатия',инсульт,'транзиторные ишемические атаки'}\n\n@data\n38,'синдром Такаясу',3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',143,44,нет\n57,атеросклероз,3,'агрессивный косой анастомоз','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',208,52,'гипоксическая энцефалопатия'\n52,атеросклероз,1,'многобраншевый протез','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',248,25,нет\n45,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'многобраншевый протез','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',348,78,'гипоксическая энцефалопатия'\n39,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'многобраншевый протез','без перфузии','операция Бенталла',285,72,'гипоксическая энцефалопатия'\n30,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','без перфузии','операция Бенталла',596,41,нет\n48,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',252,46,'гипоксическая энцефалопатия'\n37,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'многобраншевый протез','без перфузии','операция Бенталла',258,88,нет\n53,атеросклероз,1,'агрессивный косой анастомоз','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',292,40,'гипоксическая энцефалопатия'\n36,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',203,74,'гипоксическая энцефалопатия'\n35,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',232,33,нет\n52,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',342,79,нет\n47,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'многобраншевый протез','без перфузии','операция Бенталла',212,55,нет\n64,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',284,15,нет\n50,атеросклероз,2,'агрессивный косой анастомоз','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',190,63,инсульт\n47,'синдром Такаясу',2,'многобраншевый протез','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',134,47,'гипоксическая энцефалопатия'\n63,атеросклероз,3,'многобраншевый протез','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',146,36,нет\n34,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',350,54,нет\n34,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Дэвида',265,38,'транзиторные ишемические атаки'\n55,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Дэвида',222,33,нет\n51,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Дэвида',153,35,нет\n49,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',266,50,нет\n57,атеросклероз,1,'агрессивный косой анастомоз','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',230,44,нет\n57,атеросклероз,1,'техника «островка»','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',265,65,нет\n50,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',272,34,нет\n52,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',250,46,нет\n40,'синдром Такаясу',3,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',184,78,'транзиторные ишемические атаки'\n45,атеросклероз,3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',243,73,'гипоксическая энцефалопатия'\n55,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',251,29,нет\n42,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'техника «островка»','антеградная перфузия','операция Бенталла',277,48,нет\n26,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',162,40,нет\n25,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','антеградная перфузия','операция Бенталла',165,41,нет\n60,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',520,100,'гипоксическая энцефалопатия'\n41,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',201,62,нет\n36,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',221,28,'гипоксическая энцефалопатия'\n45,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',167,61,нет\n42,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',168,39,нет\n43,атеросклероз,1,'агрессивный косой анастомоз','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',149,58,нет\n41,атеросклероз,2,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',177,51,нет\n52,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',186,51,нет\n28,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',204,46,нет\n38,атеросклероз,3,'техника «островка»','антеградная перфузия','операция Бенталла',190,75,нет\n56,атеросклероз,3,'агрессивный косой анастомоз','без перфузии','операция Бенталла',190,44,нет\n55,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',188,52,нет\n58,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',242,41,нет\n60,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',218,42,нет\n45,атеросклероз,3,'техника «островка»','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',252,69,нет\n65,атеросклероз,3,'многобраншевый протез','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',249,73,инсульт\n46,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',143,49,нет\n44,атеросклероз,1,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',249,53,нет\n47,атеросклероз,1,'техника «островка»','ретроградная перфузия','операция Бенталла',387,51,нет\n51,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',281,41,нет\n52,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',234,46,нет\n45,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',208,56,нет\n46,атеросклероз,2,'агрессивный косой анастомоз','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',343,52,'гипоксическая энцефалопатия'\n51,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',245,69,нет\n47,атеросклероз,3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',192,68,нет\n59,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',142,38,нет\n58,атеросклероз,3,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',204,48,нет\n62,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',207,48,'гипоксическая энцефалопатия'\n53,атеросклероз,3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',185,75,нет\n50,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',326,46,нет\n40,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',204,72,нет\n51,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',211,45,нет\n42,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',300,44,нет\n45,атеросклероз,1,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',220,63,нет\n44,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',211,56,нет\n60,атеросклероз,3,'многобраншевый протез','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',267,50,нет\n56,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',307,53,нет\n26,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',2,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',176,32,нет\n52,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',231,60,нет\n39,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',198,60,нет\n38,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',217,55,нет\n19,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',300,45,нет\n55,атеросклероз,3,'техника «островка»','антеградная перфузия','операция Бенталла',246,51,нет\n38,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',2,'техника «островка»','ретроградная перфузия','операция Бенталла',265,58,нет\n60,атеросклероз,3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',206,57,нет\n44,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',201,54,нет\n35,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',220,72,'гипоксическая энцефалопатия'\n57,атеросклероз,1,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',275,56,'гипоксическая энцефалопатия'\n34,атеросклероз,3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',273,52,нет\n42,атеросклероз,3,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',259,54,нет\n69,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',245,45,нет\n45,атеросклероз,3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',204,72,нет\n50,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',174,44,нет\n58,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',168,59,нет\n63,атеросклероз,3,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',269,49,инсульт\n26,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',136,60,нет\n41,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',1,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',210,61,нет\n40,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'техника «островка»','антеградная перфузия','операция Бенталла',355,114,нет\n52,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',258,40,'гипоксическая энцефалопатия'\n38,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',200,40,нет\n65,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',202,35,'гипоксическая энцефалопатия'\n55,атеросклероз,3,'агрессивный косой анастомоз','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',312,49,'транзиторные ишемические атаки'\n56,атеросклероз,3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',280,87,'транзиторные ишемические атаки'\n57,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',248,45,нет\n62,атеросклероз,3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',213,60,нет\n65,атеросклероз,2,'агрессивный косой анастомоз','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',120,21,'гипоксическая энцефалопатия'\n67,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',210,50,нет\n64,атеросклероз,1,'агрессивный косой анастомоз','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',166,39,нет\n53,атеросклероз,1,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',250,50,'гипоксическая энцефалопатия'\n60,атеросклероз,3,'техника «островка»','антеградная перфузия','операция Бенталла',235,54,инсульт\n55,атеросклероз,1,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',270,77,'гипоксическая энцефалопатия'\n51,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',248,34,нет\n50,атеросклероз,1,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',227,54,'гипоксическая энцефалопатия'\n57,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',192,65,нет\n19,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','антеградная перфузия','операция Бенталла',154,25,нет\n64,атеросклероз,3,'агрессивный косой анастомоз','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',240,63,'гипоксическая энцефалопатия'\n65,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Дэвида',291,52,'гипоксическая энцефалопатия'\n68,атеросклероз,2,'техника «островка»','антеградная перфузия','операция Бенталла',217,39,'гипоксическая энцефалопатия'\n62,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',255,24,'гипоксическая энцефалопатия'\n49,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','антеградная перфузия','операция Бенталла',245,36,нет\n56,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',363,91,нет\n28,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',2,'агрессивный косой анастомоз','без перфузии','операция Бенталла',198,45,нет\n50,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',233,33,нет\n58,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',190,45,нет\n53,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',177,40,нет\n42,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',1,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',158,58,нет\n51,атеросклероз,3,'техника «островка»','ретроградная перфузия','операция Бенталла',163,42,нет\n59,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',138,44,'гипоксическая энцефалопатия'\n51,атеросклероз,3,'техника «островка»','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',340,64,нет\n43,атеросклероз,2,'техника «островка»','ретроградная перфузия','операция Бенталла',260,45,нет\n36,атеросклероз,2,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',320,55,нет\n71,атеросклероз,3,'агрессивный косой анастомоз','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',126,30,нет, evaluationMethod=TRAINING_DATA, evaluationParams=null) to file 'D:\\experiment\\experiment1523393974621.txt'	TRAINING_DATA	\N	ERROR	NEURAL_NETWORKS	2018-04-10 23:56:32.479	\N	77f494f2-67be-4e02-99ad-2c8ff77f9625	2018-05-21 00:17:04.086	\N	\N	\N	\N	QUEUE	\N	\N	\N	\N
863	2018-04-27 23:49:32.963	bat1238@yandex.ru	2018-04-27 23:53:11.986	\N	TRAINING_DATA	\N	FINISHED	STACKING_CV	2018-04-27 23:49:43.805	\N	99b281d7-a10c-4e39-a46d-ef43287c27cf	2018-05-28 00:08:00.181	\N	\N	\N	\N	QUEUE	\N	\N	\N	\N
845	2018-04-11 00:13:53.854	bat1238@yandex.ru	2018-04-11 00:14:24.323	\N	TRAINING_DATA	\N	FINISHED	RANDOM_FORESTS	2018-04-11 00:14:07.12	\N	356f157c-2756-4458-9f9b-42acd2902e8e	2018-05-21 00:17:04.205	\N	\N	\N	\N	QUEUE	\N	\N	\N	\N
907	2018-05-19 23:36:06.505	bat1238@yandex.ru	2018-05-19 23:36:14.167	\N	TRAINING_DATA	\N	FINISHED	KNN	2018-05-19 23:36:12.801	\N	8c397b5c-be73-4556-a5eb-4a0647ace9a1	2018-06-10 00:00:00.866	\N	\N	\N	\N	QUEUE	\N	\N	\N	\N
980	2018-05-20 11:54:20.89	roman.batygin@mail.ru	2018-05-20 13:32:37.377	\N	TRAINING_DATA	\N	FINISHED	RANDOM_FORESTS	2018-05-20 13:32:07.062	\N	a8df4dd2-e515-4e87-ba35-64af28a27c9e	2018-06-10 00:00:01.506	\N	\N	\N	\N	QUEUE	\N	\N	\N	\N
840	2018-04-10 23:56:35.541	bat1238@yandex.ru	2018-04-11 00:05:15.251	Can't save object ExperimentHistory(experiment=[eca.core.evaluation.EvaluationResults@304b5c91, eca.core.evaluation.EvaluationResults@74b08d7, eca.core.evaluation.EvaluationResults@17bff8d9, eca.core.evaluation.EvaluationResults@a28060c, eca.core.evaluation.EvaluationResults@60ed7c0c, eca.core.evaluation.EvaluationResults@3fbfcd76, eca.core.evaluation.EvaluationResults@572e8368, eca.core.evaluation.EvaluationResults@1d7ce7e7, eca.core.evaluation.EvaluationResults@167ae558, eca.core.evaluation.EvaluationResults@576f5e9c, eca.core.evaluation.EvaluationResults@74f9a2da, eca.core.evaluation.EvaluationResults@ec0207d, eca.core.evaluation.EvaluationResults@4fd144d8, eca.core.evaluation.EvaluationResults@62677800, eca.core.evaluation.EvaluationResults@5bb1f9e4, eca.core.evaluation.EvaluationResults@54fde927, eca.core.evaluation.EvaluationResults@114f90e4, eca.core.evaluation.EvaluationResults@48314db5, eca.core.evaluation.EvaluationResults@1c1bf38e, eca.core.evaluation.EvaluationResults@271485fb, eca.core.evaluation.EvaluationResults@4ab1f94d, eca.core.evaluation.EvaluationResults@8af494b, eca.core.evaluation.EvaluationResults@4b6b4c53, eca.core.evaluation.EvaluationResults@48d32398, eca.core.evaluation.EvaluationResults@d6dd05e], dataSet=@relation MedData\n\n@attribute Возраст numeric\n@attribute Этиология {'синдром Такаясу',атеросклероз,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)'}\n@attribute Стадия {3,1,2}\n@attribute 'Тип реконструкции дуги' {'агрессивный косой анастомоз','многобраншевый протез','техника «островка»'}\n@attribute 'Вид перфузии головного мозга' {'ретроградная перфузия','без перфузии','антеградная перфузия'}\n@attribute 'Вмешательство на корне аорты' {'операция Бенталла','супракоронарное протезирование (операция Де Бейки, Вольфа)','операция Дэвида'}\n@attribute 'Искусственное кровообращение' numeric\n@attribute 'Циркуляторный арест' numeric\n@attribute 'Тип нарушения мозгового кровообращения' {нет,'гипоксическая энцефалопатия',инсульт,'транзиторные ишемические атаки'}\n\n@data\n38,'синдром Такаясу',3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',143,44,нет\n57,атеросклероз,3,'агрессивный косой анастомоз','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',208,52,'гипоксическая энцефалопатия'\n52,атеросклероз,1,'многобраншевый протез','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',248,25,нет\n45,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'многобраншевый протез','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',348,78,'гипоксическая энцефалопатия'\n39,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'многобраншевый протез','без перфузии','операция Бенталла',285,72,'гипоксическая энцефалопатия'\n30,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','без перфузии','операция Бенталла',596,41,нет\n48,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',252,46,'гипоксическая энцефалопатия'\n37,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'многобраншевый протез','без перфузии','операция Бенталла',258,88,нет\n53,атеросклероз,1,'агрессивный косой анастомоз','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',292,40,'гипоксическая энцефалопатия'\n36,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',203,74,'гипоксическая энцефалопатия'\n35,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',232,33,нет\n52,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',342,79,нет\n47,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'многобраншевый протез','без перфузии','операция Бенталла',212,55,нет\n64,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',284,15,нет\n50,атеросклероз,2,'агрессивный косой анастомоз','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',190,63,инсульт\n47,'синдром Такаясу',2,'многобраншевый протез','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',134,47,'гипоксическая энцефалопатия'\n63,атеросклероз,3,'многобраншевый протез','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',146,36,нет\n34,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',350,54,нет\n34,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Дэвида',265,38,'транзиторные ишемические атаки'\n55,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Дэвида',222,33,нет\n51,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Дэвида',153,35,нет\n49,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',266,50,нет\n57,атеросклероз,1,'агрессивный косой анастомоз','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',230,44,нет\n57,атеросклероз,1,'техника «островка»','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',265,65,нет\n50,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',272,34,нет\n52,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',250,46,нет\n40,'синдром Такаясу',3,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',184,78,'транзиторные ишемические атаки'\n45,атеросклероз,3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',243,73,'гипоксическая энцефалопатия'\n55,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',251,29,нет\n42,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'техника «островка»','антеградная перфузия','операция Бенталла',277,48,нет\n26,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',162,40,нет\n25,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','антеградная перфузия','операция Бенталла',165,41,нет\n60,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',520,100,'гипоксическая энцефалопатия'\n41,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',201,62,нет\n36,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',221,28,'гипоксическая энцефалопатия'\n45,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',167,61,нет\n42,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',168,39,нет\n43,атеросклероз,1,'агрессивный косой анастомоз','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',149,58,нет\n41,атеросклероз,2,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',177,51,нет\n52,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',186,51,нет\n28,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',204,46,нет\n38,атеросклероз,3,'техника «островка»','антеградная перфузия','операция Бенталла',190,75,нет\n56,атеросклероз,3,'агрессивный косой анастомоз','без перфузии','операция Бенталла',190,44,нет\n55,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',188,52,нет\n58,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',242,41,нет\n60,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',218,42,нет\n45,атеросклероз,3,'техника «островка»','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',252,69,нет\n65,атеросклероз,3,'многобраншевый протез','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',249,73,инсульт\n46,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',143,49,нет\n44,атеросклероз,1,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',249,53,нет\n47,атеросклероз,1,'техника «островка»','ретроградная перфузия','операция Бенталла',387,51,нет\n51,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',281,41,нет\n52,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',234,46,нет\n45,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',208,56,нет\n46,атеросклероз,2,'агрессивный косой анастомоз','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',343,52,'гипоксическая энцефалопатия'\n51,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',245,69,нет\n47,атеросклероз,3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',192,68,нет\n59,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',142,38,нет\n58,атеросклероз,3,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',204,48,нет\n62,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',207,48,'гипоксическая энцефалопатия'\n53,атеросклероз,3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',185,75,нет\n50,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',326,46,нет\n40,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',204,72,нет\n51,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',211,45,нет\n42,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',300,44,нет\n45,атеросклероз,1,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',220,63,нет\n44,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',211,56,нет\n60,атеросклероз,3,'многобраншевый протез','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',267,50,нет\n56,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',307,53,нет\n26,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',2,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',176,32,нет\n52,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',231,60,нет\n39,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',198,60,нет\n38,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',217,55,нет\n19,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',300,45,нет\n55,атеросклероз,3,'техника «островка»','антеградная перфузия','операция Бенталла',246,51,нет\n38,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',2,'техника «островка»','ретроградная перфузия','операция Бенталла',265,58,нет\n60,атеросклероз,3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',206,57,нет\n44,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',201,54,нет\n35,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',220,72,'гипоксическая энцефалопатия'\n57,атеросклероз,1,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',275,56,'гипоксическая энцефалопатия'\n34,атеросклероз,3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',273,52,нет\n42,атеросклероз,3,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',259,54,нет\n69,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',245,45,нет\n45,атеросклероз,3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',204,72,нет\n50,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',174,44,нет\n58,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',168,59,нет\n63,атеросклероз,3,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',269,49,инсульт\n26,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',136,60,нет\n41,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',1,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',210,61,нет\n40,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'техника «островка»','антеградная перфузия','операция Бенталла',355,114,нет\n52,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',258,40,'гипоксическая энцефалопатия'\n38,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',200,40,нет\n65,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',202,35,'гипоксическая энцефалопатия'\n55,атеросклероз,3,'агрессивный косой анастомоз','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',312,49,'транзиторные ишемические атаки'\n56,атеросклероз,3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',280,87,'транзиторные ишемические атаки'\n57,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',248,45,нет\n62,атеросклероз,3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',213,60,нет\n65,атеросклероз,2,'агрессивный косой анастомоз','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',120,21,'гипоксическая энцефалопатия'\n67,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',210,50,нет\n64,атеросклероз,1,'агрессивный косой анастомоз','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',166,39,нет\n53,атеросклероз,1,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',250,50,'гипоксическая энцефалопатия'\n60,атеросклероз,3,'техника «островка»','антеградная перфузия','операция Бенталла',235,54,инсульт\n55,атеросклероз,1,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',270,77,'гипоксическая энцефалопатия'\n51,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',248,34,нет\n50,атеросклероз,1,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',227,54,'гипоксическая энцефалопатия'\n57,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',192,65,нет\n19,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','антеградная перфузия','операция Бенталла',154,25,нет\n64,атеросклероз,3,'агрессивный косой анастомоз','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',240,63,'гипоксическая энцефалопатия'\n65,атеросклероз,3,'агрессивный косой анастомоз','ретроградная перфузия','операция Дэвида',291,52,'гипоксическая энцефалопатия'\n68,атеросклероз,2,'техника «островка»','антеградная перфузия','операция Бенталла',217,39,'гипоксическая энцефалопатия'\n62,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',255,24,'гипоксическая энцефалопатия'\n49,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','антеградная перфузия','операция Бенталла',245,36,нет\n56,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'техника «островка»','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',363,91,нет\n28,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',2,'агрессивный косой анастомоз','без перфузии','операция Бенталла',198,45,нет\n50,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',233,33,нет\n58,атеросклероз,1,'агрессивный косой анастомоз','ретроградная перфузия','операция Бенталла',190,45,нет\n53,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',3,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',177,40,нет\n42,'дисплазии соединительной ткани (синдром Марфана, Элерса-Данло)',1,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',158,58,нет\n51,атеросклероз,3,'техника «островка»','ретроградная перфузия','операция Бенталла',163,42,нет\n59,атеросклероз,2,'агрессивный косой анастомоз','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',138,44,'гипоксическая энцефалопатия'\n51,атеросклероз,3,'техника «островка»','без перфузии','супракоронарное протезирование (операция Де Бейки, Вольфа)',340,64,нет\n43,атеросклероз,2,'техника «островка»','ретроградная перфузия','операция Бенталла',260,45,нет\n36,атеросклероз,2,'техника «островка»','ретроградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',320,55,нет\n71,атеросклероз,3,'агрессивный косой анастомоз','антеградная перфузия','супракоронарное протезирование (операция Де Бейки, Вольфа)',126,30,нет, evaluationMethod=TRAINING_DATA, evaluationParams=null) to file 'D:\\experiment\\experiment1523394315198.txt'	TRAINING_DATA	\N	ERROR	HETEROGENEOUS_ENSEMBLE	2018-04-11 00:00:04.731	\N	883fe700-be73-4743-ba6b-292cae3c31a5	2018-05-21 00:17:04.148	\N	\N	\N	\N	QUEUE	\N	\N	\N	\N
1040	2018-05-20 23:29:07.87	bat1238@yandex.ru	2018-05-21 00:16:56.94	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-21 00:14:49.423	\N	0f12069a-95b8-4d03-94b0-d0d64590d69a	2018-06-10 00:00:01.689	10	1	3	\N	QUEUE	\N	\N	\N	\N
803	2018-03-31 13:20:26.398	bat1238@yandex.ru	2018-03-31 15:33:11.854	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2018-03-31 13:20:37.094	\N	313870d3-1813-4e4e-9ad3-7822ddb0657b	2018-05-03 00:00:00.323	10	1	3	\N	QUEUE	\N	\N	\N	\N
1126	2018-05-22 21:34:03.169	roman.batygin@mail.ru	2018-05-22 21:58:45.954	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-05-22 21:34:25.716	\N	8aa901f8-5ef0-4425-8261-55f61bff7bba	2018-06-10 00:00:01.711	10	1	3	\N	QUEUE	\N	\N	\N	\N
759	2018-03-09 14:28:30.455	bat1238@yandex.ru	2018-03-09 16:32:27.259	\N	CROSS_VALIDATION	\N	ERROR	HETEROGENEOUS_ENSEMBLE	2018-03-09 16:31:44.563	\N	a8bcf16e-1c56-442f-bdff-4d739d740b31	2018-04-11 00:00:00.105	10	1	3	\N	QUEUE	\N	\N	\N	\N
805	2018-03-31 22:48:04.865	bat1238@yandex.ru	2018-03-31 22:50:06.95	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-03-31 22:48:32.236	\N	d262d2f1-177c-40d9-8454-1830297a94bd	2018-05-03 00:00:00.467	10	1	3	\N	QUEUE	\N	\N	\N	\N
807	2018-04-01 12:18:02.25	bat1238@yandex.ru	2018-04-01 14:35:07.985	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-04-01 12:18:03.659	\N	545bf804-bb24-4cd1-be52-8d20a140c8a2	2018-05-03 00:00:00.527	10	1	3	\N	QUEUE	\N	\N	\N	\N
811	2018-04-01 16:49:37.764	bat1238@yandex.ru	2018-04-01 16:50:30.799	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-04-01 16:49:39.687	\N	f4b0f31f-40ad-447a-813b-0f38fcb98222	2018-05-03 00:00:00.541	10	1	3	\N	QUEUE	\N	\N	\N	\N
843	2018-04-11 00:07:22.118	bat1238@yandex.ru	2018-04-11 00:07:46.165	Can't save object ExperimentHistory(experiment=[eca.core.evaluation.EvaluationResults@7526df34, eca.core.evaluation.EvaluationResults@4d9bb61b, eca.core.evaluation.EvaluationResults@50638c29, eca.core.evaluation.EvaluationResults@4a2d4bb, eca.core.evaluation.EvaluationResults@47be7464, eca.core.evaluation.EvaluationResults@578529e6, eca.core.evaluation.EvaluationResults@1bcbf5fb, eca.core.evaluation.EvaluationResults@9deed35, eca.core.evaluation.EvaluationResults@3df7b53e, eca.core.evaluation.EvaluationResults@43c3717f, eca.core.evaluation.EvaluationResults@76330d1, eca.core.evaluation.EvaluationResults@79aad24d, eca.core.evaluation.EvaluationResults@79f4d603, eca.core.evaluation.EvaluationResults@21e408cb, eca.core.evaluation.EvaluationResults@3f9f419e, eca.core.evaluation.EvaluationResults@1008c49a, eca.core.evaluation.EvaluationResults@4f135c56, eca.core.evaluation.EvaluationResults@4e30b72f, eca.core.evaluation.EvaluationResults@b669cc6, eca.core.evaluation.EvaluationResults@5d9cb524, eca.core.evaluation.EvaluationResults@838a32d, eca.core.evaluation.EvaluationResults@437ae4ca, eca.core.evaluation.EvaluationResults@7c45d0cf, eca.core.evaluation.EvaluationResults@44c87ff6, eca.core.evaluation.EvaluationResults@9248d89], dataSet=@relation IrisEX\n\n@attribute sepallength numeric\n@attribute sepalwidth numeric\n@attribute petallength numeric\n@attribute petalwidth numeric\n@attribute class {Iris-setosa,Iris-versicolor,Iris-virginica}\n\n@data\n5.1,3.5,1.4,0.2,Iris-setosa\n4.9,3,1.4,0.2,Iris-setosa\n4.7,3.2,1.3,0.2,Iris-setosa\n4.6,3.1,1.5,0.2,Iris-setosa\n5,3.6,1.4,0.2,Iris-setosa\n5.4,3.9,1.7,0.4,Iris-setosa\n4.6,3.4,1.4,0.3,Iris-setosa\n5,3.4,1.5,0.2,Iris-setosa\n4.4,2.9,1.4,0.2,Iris-setosa\n4.9,3.1,1.5,0.1,Iris-setosa\n5.4,3.7,1.5,0.2,Iris-setosa\n4.8,3.4,1.6,0.2,Iris-setosa\n4.8,3,1.4,0.1,Iris-setosa\n4.3,3,1.1,0.1,Iris-setosa\n5.8,4,1.2,0.2,Iris-setosa\n5.7,4.4,1.5,0.4,Iris-setosa\n5.4,3.9,1.3,0.4,Iris-setosa\n5.1,3.5,1.4,0.3,Iris-setosa\n5.7,3.8,1.7,0.3,Iris-setosa\n5.1,3.8,1.5,0.3,Iris-setosa\n5.4,3.4,1.7,0.2,Iris-setosa\n5.1,3.7,1.5,0.4,Iris-setosa\n4.6,3.6,1,0.2,Iris-setosa\n5.1,3.3,1.7,0.5,Iris-setosa\n4.8,3.4,1.9,0.2,Iris-setosa\n5,3,1.6,0.2,Iris-setosa\n5,3.4,1.6,0.4,Iris-setosa\n5.2,3.5,1.5,0.2,Iris-setosa\n5.2,3.4,1.4,0.2,Iris-setosa\n4.7,3.2,1.6,0.2,Iris-setosa\n4.8,3.1,1.6,0.2,Iris-setosa\n5.4,3.4,1.5,0.4,Iris-setosa\n5.2,4.1,1.5,0.1,Iris-setosa\n5.5,4.2,1.4,0.2,Iris-setosa\n4.9,3.1,1.5,0.1,Iris-setosa\n5,3.2,1.2,0.2,Iris-setosa\n5.5,3.5,1.3,0.2,Iris-setosa\n4.9,3.1,1.5,0.1,Iris-setosa\n4.4,3,1.3,0.2,Iris-setosa\n5.1,3.4,1.5,0.2,Iris-setosa\n5,3.5,1.3,0.3,Iris-setosa\n4.5,2.3,1.3,0.3,Iris-setosa\n4.4,3.2,1.3,0.2,Iris-setosa\n5,3.5,1.6,0.6,Iris-setosa\n5.1,3.8,1.9,0.4,Iris-setosa\n4.8,3,1.4,0.3,Iris-setosa\n5.1,3.8,1.6,0.2,Iris-setosa\n4.6,3.2,1.4,0.2,Iris-setosa\n5.3,3.7,1.5,0.2,Iris-setosa\n5,3.3,1.4,0.2,Iris-setosa\n7,3.2,4.7,1.4,Iris-versicolor\n6.4,3.2,4.5,1.5,Iris-versicolor\n6.9,3.1,4.9,1.5,Iris-versicolor\n5.5,2.3,4,1.3,Iris-versicolor\n6.5,2.8,4.6,1.5,Iris-versicolor\n5.7,2.8,4.5,1.3,Iris-versicolor\n6.3,3.3,4.7,1.6,Iris-versicolor\n4.9,2.4,3.3,1,Iris-versicolor\n6.6,2.9,4.6,1.3,Iris-versicolor\n5.2,2.7,3.9,1.4,Iris-versicolor\n5,2,3.5,1,Iris-versicolor\n5.9,3,4.2,1.5,Iris-versicolor\n6,2.2,4,1,Iris-versicolor\n6.1,2.9,4.7,1.4,Iris-versicolor\n5.6,2.9,3.6,1.3,Iris-versicolor\n6.7,3.1,4.4,1.4,Iris-versicolor\n5.6,3,4.5,1.5,Iris-versicolor\n5.8,2.7,4.1,1,Iris-versicolor\n6.2,2.2,4.5,1.5,Iris-versicolor\n5.6,2.5,3.9,1.1,Iris-versicolor\n5.9,3.2,4.8,1.8,Iris-versicolor\n6.1,2.8,4,1.3,Iris-versicolor\n6.3,2.5,4.9,1.5,Iris-versicolor\n6.1,2.8,4.7,1.2,Iris-versicolor\n6.4,2.9,4.3,1.3,Iris-versicolor\n6.6,3,4.4,1.4,Iris-versicolor\n6.8,2.8,4.8,1.4,Iris-versicolor\n6.7,3,5,1.7,Iris-versicolor\n6,2.9,4.5,1.5,Iris-versicolor\n5.7,2.6,3.5,1,Iris-versicolor\n5.5,2.4,3.8,1.1,Iris-versicolor\n5.5,2.4,3.7,1,Iris-versicolor\n5.8,2.7,3.9,1.2,Iris-versicolor\n6,2.7,5.1,1.6,Iris-versicolor\n5.4,3,4.5,1.5,Iris-versicolor\n6,3.4,4.5,1.6,Iris-versicolor\n6.7,3.1,4.7,1.5,Iris-versicolor\n6.3,2.3,4.4,1.3,Iris-versicolor\n5.6,3,4.1,1.3,Iris-versicolor\n5.5,2.5,4,1.3,Iris-versicolor\n5.5,2.6,4.4,1.2,Iris-versicolor\n6.1,3,4.6,1.4,Iris-versicolor\n5.8,2.6,4,1.2,Iris-versicolor\n5,2.3,3.3,1,Iris-versicolor\n5.6,2.7,4.2,1.3,Iris-versicolor\n5.7,3,4.2,1.2,Iris-versicolor\n5.7,2.9,4.2,1.3,Iris-versicolor\n6.2,2.9,4.3,1.3,Iris-versicolor\n5.1,2.5,3,1.1,Iris-versicolor\n5.7,2.8,4.1,1.3,Iris-versicolor\n6.3,3.3,6,2.5,Iris-virginica\n5.8,2.7,5.1,1.9,Iris-virginica\n7.1,3,5.9,2.1,Iris-virginica\n6.3,2.9,5.6,1.8,Iris-virginica\n6.5,3,5.8,2.2,Iris-virginica\n7.6,3,6.6,2.1,Iris-virginica\n4.9,2.5,4.5,1.7,Iris-virginica\n7.3,2.9,6.3,1.8,Iris-virginica\n6.7,2.5,5.8,1.8,Iris-virginica\n7.2,3.6,6.1,2.5,Iris-virginica\n6.5,3.2,5.1,2,Iris-virginica\n6.4,2.7,5.3,1.9,Iris-virginica\n6.8,3,5.5,2.1,Iris-virginica\n5.7,2.5,5,2,Iris-virginica\n5.8,2.8,5.1,2.4,Iris-virginica\n6.4,3.2,5.3,2.3,Iris-virginica\n6.5,3,5.5,1.8,Iris-virginica\n7.7,3.8,6.7,2.2,Iris-virginica\n7.7,2.6,6.9,2.3,Iris-virginica\n6,2.2,5,1.5,Iris-virginica\n6.9,3.2,5.7,2.3,Iris-virginica\n5.6,2.8,4.9,2,Iris-virginica\n7.7,2.8,6.7,2,Iris-virginica\n6.3,2.7,4.9,1.8,Iris-virginica\n6.7,3.3,5.7,2.1,Iris-virginica\n7.2,3.2,6,1.8,Iris-virginica\n6.2,2.8,4.8,1.8,Iris-virginica\n6.1,3,4.9,1.8,Iris-virginica\n6.4,2.8,5.6,2.1,Iris-virginica\n7.2,3,5.8,1.6,Iris-virginica\n7.4,2.8,6.1,1.9,Iris-virginica\n7.9,3.8,6.4,2,Iris-virginica\n6.4,2.8,5.6,2.2,Iris-virginica\n6.3,2.8,5.1,1.5,Iris-virginica\n6.1,2.6,5.6,1.4,Iris-virginica\n7.7,3,6.1,2.3,Iris-virginica\n6.3,3.4,5.6,2.4,Iris-virginica\n6.4,3.1,5.5,1.8,Iris-virginica\n6,3,4.8,1.8,Iris-virginica\n6.9,3.1,5.4,2.1,Iris-virginica\n6.7,3.1,5.6,2.4,Iris-virginica\n6.9,3.1,5.1,2.3,Iris-virginica\n5.8,2.7,5.1,1.9,Iris-virginica\n6.8,3.2,5.9,2.3,Iris-virginica\n6.7,3.3,5.7,2.5,Iris-virginica\n6.7,3,5.2,2.3,Iris-virginica\n6.3,2.5,5,1.9,Iris-virginica\n6.5,3,5.2,2,Iris-virginica\n6.2,3.4,5.4,2.3,Iris-virginica\n5.9,3,5.1,1.8,Iris-virginica, evaluationMethod=TRAINING_DATA, evaluationParams=null) to file 'D:\\experiment\\experiment1523394466071.txt'	TRAINING_DATA	\N	ERROR	KNN	2018-04-11 00:07:45.321	\N	a2442c99-c7f7-4b35-b9a2-2f62b41acbc4	2018-05-21 00:17:04.157	\N	\N	\N	\N	QUEUE	\N	\N	\N	\N
305	2017-12-31 01:51:16.024	bat1238@yandex.ru	2017-12-31 02:04:11.766	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2017-12-31 01:58:19.645	\N	98e68b4d-433b-487c-91e4-69ccde60e084	2018-02-25 00:00:00.8	10	1	3	\N	QUEUE	\N	\N	\N	\N
1010	2018-05-20 23:15:57.325	roman.batygin@mail.ru	2018-05-20 23:18:21.915	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-20 23:16:21.407	\N	05319aec-33eb-4715-9eca-42b59e727084	2018-06-10 00:00:01.63	10	1	3	\N	QUEUE	\N	\N	\N	\N
1039	2018-05-20 23:28:58.266	bat1238@yandex.ru	2018-05-21 00:14:49.325	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-05-21 00:13:46.232	\N	117636b8-45c5-4b78-8dc4-6081df8f5b3a	2018-06-10 00:00:01.684	10	1	3	\N	QUEUE	\N	\N	\N	\N
524	2018-02-04 18:40:16.276	bat1238@yandex.ru	2018-02-04 18:46:26.89	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-02-04 18:40:56.831	\N	2cc03b4b-62d5-4429-8f9e-cc248dada56a	2018-03-08 00:00:00.617	10	1	3	\N	QUEUE	\N	\N	\N	\N
316	2017-12-31 15:52:16.715	bat1238@yandex.ru	2018-01-01 14:49:56.1	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-01-01 13:53:23.321	\N	a2c8ad79-15f3-4e81-abe0-a7170bf2c41c	2018-02-25 00:00:01.147	10	1	3	\N	QUEUE	\N	\N	\N	\N
499	2018-02-03 14:05:49.032	bat1238@yandex.ru	2018-02-03 14:18:26.035	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-02-03 14:14:42.606	\N	c423393d-2e92-4eb2-9453-5d99ee14c144	2018-03-08 00:00:00.529	10	1	3	\N	QUEUE	\N	\N	\N	\N
362	2018-01-04 20:30:06.784	bat1238@yandex.ru	2018-01-04 21:36:17.141	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-01-04 20:31:43.504	\N	40344863-4473-4123-ab51-19497a6e8c0b	2018-02-25 00:00:01.421	10	1	3	\N	QUEUE	\N	\N	\N	\N
1301	2018-05-26 00:46:45.08	roman.batygin@mail.ru	2018-05-26 00:47:52.178	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-05-26 00:47:00.822	\N	5dc8c7d0-3f33-4ec6-8d28-f7d54169f950	2018-06-10 00:00:01.91	10	1	1	\N	QUEUE	\N	\N	\N	\N
1259	2018-05-25 23:00:22.985	roman.batygin@mail.ru	2018-05-25 23:00:50.375	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-05-25 23:00:47.99	\N	6dd1da7a-fae4-42c0-a981-06b0e9d54859	2018-06-10 00:00:01.798	10	1	1	\N	QUEUE	\N	\N	\N	\N
1260	2018-05-25 23:00:31.36	roman.batygin@mail.ru	2018-05-26 00:25:22.537	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2018-05-25 23:00:50.385	\N	d75677bc-9e81-4527-8432-25fa821b0b47	2018-06-10 00:00:01.839	10	1	1	\N	QUEUE	\N	\N	\N	\N
1261	2018-05-25 23:00:40.642	roman.batygin@mail.ru	2018-05-26 00:29:16.826	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-05-26 00:25:22.548	\N	78c71e95-1872-4d88-a3e5-cb9d012b6e76	2018-06-10 00:00:01.858	10	1	1	\N	QUEUE	\N	\N	\N	\N
1288	2018-05-26 00:41:10.201	roman.batygin@mail.ru	2018-05-26 00:45:30.805	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-26 00:43:19.748	\N	de2bc963-291b-493f-8ba9-05e72183c89f	2018-06-10 00:00:01.902	10	1	1	\N	QUEUE	\N	\N	\N	\N
1309	2018-05-26 00:48:33.386	roman.batygin@mail.ru	2018-05-26 00:54:45.819	\N	CROSS_VALIDATION	\N	FINISHED	STACKING_CV	2018-05-26 00:51:16.375	\N	a7850e3d-44e6-45cb-b359-36dfcf24a7fc	2018-06-10 00:00:01.927	10	1	1	\N	QUEUE	\N	\N	\N	\N
1308	2018-05-26 00:48:24.806	roman.batygin@mail.ru	2018-05-26 00:51:16.368	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-05-26 00:48:52.19	\N	ae6b09ab-623c-48a8-b92e-5630b0298c88	2018-06-10 00:00:01.918	10	1	1	\N	QUEUE	\N	\N	\N	\N
1310	2018-05-26 00:51:14.079	roman.batygin@mail.ru	2018-05-26 00:57:23.18	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-26 00:54:45.826	\N	81b7019c-7248-428a-9e36-625a9a8d60f1	2018-06-10 00:00:01.937	10	1	1	\N	QUEUE	\N	\N	\N	\N
1316	2018-05-26 00:51:21.038	roman.batygin@mail.ru	2018-05-26 12:32:02.469	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-26 12:29:50.532	\N	18c6df19-0792-4224-bb8b-a06a5a8861d4	2018-06-10 00:00:01.958	10	1	1	\N	QUEUE	\N	\N	\N	\N
1349	2018-05-26 12:41:46.404	roman.batygin@mail.ru	2018-05-26 12:44:22.032	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-26 12:42:51.147	\N	22691e59-2d6c-473b-932a-08708517d0a1	2018-06-10 00:00:01.979	10	1	1	\N	QUEUE	\N	\N	\N	\N
1280	2018-05-26 00:40:31.692	roman.batygin@mail.ru	2018-05-26 00:40:49.071	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-05-26 00:40:46.911	\N	654e5c91-1f8d-4a32-b57d-79bf81793d9a	2018-06-10 00:00:01.871	10	1	1	\N	QUEUE	\N	\N	\N	\N
1286	2018-05-26 00:40:54.533	roman.batygin@mail.ru	2018-05-26 00:43:19.739	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-26 00:41:19.078	\N	d6303402-6674-44a5-b3bc-877b80950002	2018-06-10 00:00:01.895	10	1	1	\N	QUEUE	\N	\N	\N	\N
1690	2018-05-28 21:36:12.862	bat1238@yandex.ru	2018-05-28 21:37:01.917	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-05-28 21:36:41.545	\N	57a01247-937c-474c-bbcb-a13069070b0e	2018-06-22 00:00:03.467	10	1	1	\N	QUEUE	\N	\N	\N	\N
1364	2018-05-27 15:19:22.96	roman.batygin@mail.ru	2018-05-27 15:21:17.31	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-27 15:19:29.648	\N	2e6533ec-edc9-44b9-b61c-acdc238f545e	2018-06-22 00:00:00.299	10	1	1	\N	QUEUE	\N	\N	\N	\N
1398	2018-05-27 15:24:17.922	roman.batygin@mail.ru	2018-05-27 15:25:41.282	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-05-27 15:24:47.453	\N	00252a9d-7e05-4180-814a-b11c7de7ce6c	2018-06-22 00:00:01.274	10	1	1	\N	QUEUE	\N	\N	\N	\N
1330	2018-05-26 12:30:10.663	roman.batygin@mail.ru	2018-05-26 12:35:02.559	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-26 12:32:32.489	\N	3ff3cf99-c99c-42a0-84d7-38e9f822e30c	2018-06-10 00:00:01.964	10	1	1	\N	QUEUE	\N	\N	\N	\N
1331	2018-05-26 12:30:22.826	roman.batygin@mail.ru	2018-05-26 12:40:43.102	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-05-26 12:35:02.57	\N	1613dc8d-fbd1-4b50-ba32-afd886338fcc	2018-06-10 00:00:01.969	10	1	1	\N	QUEUE	\N	\N	\N	\N
1435	2018-05-27 20:02:52.875	roman.batygin@mail.ru	2018-05-27 20:34:45.269	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-05-27 20:11:10.269	\N	6f204ce3-74e7-4b4b-a4ab-bebf7c28e722	2018-06-22 00:00:01.703	10	1	1	\N	QUEUE	\N	\N	\N	\N
1332	2018-05-26 12:30:32.229	roman.batygin@mail.ru	2018-05-26 12:42:21.131	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-26 12:40:43.114	\N	4b3e49f7-45e1-427b-ae1c-881b0b5c1e40	2018-06-10 00:00:01.974	10	1	1	\N	QUEUE	\N	\N	\N	\N
1399	2018-05-27 15:24:24.406	roman.batygin@mail.ru	2018-05-27 16:31:41.984	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2018-05-27 15:25:41.422	\N	b01a9659-5c15-4c5c-9f6a-9382edf60d4e	2018-06-22 00:00:01.369	10	1	1	\N	QUEUE	\N	\N	\N	\N
1405	2018-05-27 15:26:59.564	roman.batygin@mail.ru	2018-05-27 16:33:07.098	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-05-27 16:32:12.021	\N	95937bcb-0fea-4fb2-b967-26858be1dd1c	2018-06-22 00:00:01.379	10	1	1	\N	QUEUE	\N	\N	\N	\N
1434	2018-05-27 20:02:41.078	roman.batygin@mail.ru	2018-05-27 20:10:40.238	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-05-27 20:02:47.75	\N	40442df9-7fbd-4f98-8552-001e069d18ae	2018-06-22 00:00:01.632	10	1	1	\N	QUEUE	\N	\N	\N	\N
517	2018-02-03 14:37:09.122	bat1238@yandex.ru	2018-02-03 15:44:40.756	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-02-03 14:37:44.382	\N	2a6b7d5f-ce76-4859-9423-113368a62e47	2018-03-08 00:00:00.597	10	1	3	\N	QUEUE	\N	\N	\N	\N
552	2018-02-04 18:53:19.914	bat1238@yandex.ru	2018-02-04 19:05:46.813	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-02-04 18:54:27.268	\N	ac06cd67-102b-4f08-80eb-b1f570ee1c54	2018-03-08 00:00:00.704	10	1	3	\N	QUEUE	\N	\N	\N	\N
554	2018-02-04 19:09:54.43	bat1238@yandex.ru	2018-02-04 19:17:08.714	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-02-04 19:11:46.852	\N	696a720b-4d78-4e61-8909-06a1a7b57472	2018-03-08 00:00:00.741	10	1	3	\N	QUEUE	\N	\N	\N	\N
606	2018-02-04 19:28:12.528	bat1238@yandex.ru	2018-02-04 20:14:26.528	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-02-04 19:29:08.947	\N	05b7303a-c536-47fc-a652-ce766a2f229c	2018-03-08 00:00:00.805	10	1	3	\N	QUEUE	\N	\N	\N	\N
610	2018-02-04 20:19:50.492	bat1238@yandex.ru	2018-02-04 20:22:02.611	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-02-04 20:20:26.568	\N	dc78e30f-15ea-4974-bf65-deb2e47d868a	2018-03-08 00:00:00.836	10	1	3	\N	QUEUE	\N	\N	\N	\N
777	2018-03-28 22:42:51.531	bat1238@yandex.ru	2018-03-28 22:43:58.916	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-03-28 22:43:15.966	\N	8e5a7adc-3a4a-4591-8a23-78626087f340	2018-04-28 00:00:00.063	10	1	3	\N	QUEUE	\N	\N	\N	\N
675	2018-02-23 02:06:48.531	bat1238@yandex.ru	2018-02-24 22:16:56.483	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-02-24 21:28:53.722	\N	0e8004f6-1360-49ea-b83d-d84540bf800e	2018-04-01 00:00:00.707	10	1	3	\N	QUEUE	\N	\N	\N	\N
304	2017-12-31 01:50:57.821	bat1238@yandex.ru	2017-12-31 01:58:19.645	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2017-12-31 01:52:09.799	\N	b81a090d-d52d-4ca3-ac68-2fd146168ea4	2018-02-25 00:00:00.639	10	1	3	\N	QUEUE	\N	\N	\N	\N
314	2017-12-31 15:51:48.818	bat1238@yandex.ru	2017-12-31 20:07:34.775	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2017-12-31 15:52:19.686	\N	3a1775c5-3431-4096-a4d9-6609506b55ba	2018-02-25 00:00:00.886	10	1	3	\N	QUEUE	\N	\N	\N	\N
317	2017-12-31 15:52:25.323	bat1238@yandex.ru	2018-01-01 15:10:12.009	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-01-01 14:49:56.138	\N	a6403fd5-d625-4768-8374-ba712390b039	2018-02-25 00:00:01.257	10	1	3	\N	QUEUE	\N	\N	\N	\N
522	2018-02-04 18:20:58.299	bat1238@yandex.ru	2018-02-04 18:26:56.748	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-02-04 18:22:58.466	\N	35a01684-959c-422c-8a37-467ef7451045	2018-03-08 00:00:00.606	10	1	3	\N	QUEUE	\N	\N	\N	\N
611	2018-02-04 20:20:04.073	bat1238@yandex.ru	2018-02-04 20:23:05.498	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-02-04 20:22:02.623	\N	0edcbb4d-a432-4691-baf3-9e50516170d9	2018-03-08 00:00:00.845	10	1	3	\N	QUEUE	\N	\N	\N	\N
709	2018-03-08 17:44:45.365	bat1238@yandex.ru	2018-03-08 18:47:01.05	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-03-08 17:45:05.994	\N	85c786fb-1353-4113-abaf-7932a72b2c86	2018-04-11 00:00:00.09	10	1	3	\N	QUEUE	\N	\N	\N	\N
763	2018-03-09 21:55:43.218	bat1238@yandex.ru	2018-03-10 00:31:54.914	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-03-09 22:00:46.793	\N	a49dd5d6-8f57-4134-84fb-8888e46b8542	2018-04-11 00:00:00.121	10	1	3	\N	QUEUE	\N	\N	\N	\N
778	2018-03-28 22:43:04.125	bat1238@yandex.ru	2018-03-28 22:44:29.075	\N	CROSS_VALIDATION	\N	FINISHED	STACKING_CV	2018-03-28 22:43:58.928	\N	1ce6e0a8-1b71-4fb5-9ca4-b161775110a8	2018-04-28 00:00:00.073	10	1	3	\N	QUEUE	\N	\N	\N	\N
787	2018-03-31 13:01:14.305	bat1238@yandex.ru	2018-03-31 13:03:21.508	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-03-31 13:01:35.396	\N	ed403c3b-df9b-4f9d-bb00-b0e6203411b4	2018-05-03 00:00:00.069	10	1	3	\N	QUEUE	\N	\N	\N	\N
641	2018-02-08 23:28:42.591	bat1238@yandex.ru	2018-02-08 23:50:34	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-02-08 23:28:48.888	\N	7525b7a7-17cb-4efd-9a74-62d3e76ba638	2018-04-01 00:00:00.551	10	1	3	\N	QUEUE	\N	\N	\N	\N
1038	2018-05-20 23:28:47.509	bat1238@yandex.ru	2018-05-21 00:13:46.22	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-05-20 23:29:11.859	\N	aedfe2f8-3c52-41b3-8291-98894d7f643c	2018-06-10 00:00:01.678	10	1	3	\N	QUEUE	\N	\N	\N	\N
801	2018-03-31 13:13:38.495	bat1238@yandex.ru	2018-03-31 13:15:37.038	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-03-31 13:13:51.646	\N	887f3a9f-d0a4-4bae-9030-91e27eefee50	2018-05-03 00:00:00.276	10	1	3	\N	QUEUE	\N	\N	\N	\N
1011	2018-05-20 23:16:04.556	roman.batygin@mail.ru	2018-05-20 23:18:28.108	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-05-20 23:18:22.112	\N	ecf0ac42-f81f-4ac1-99ec-fce2dfed5208	2018-06-10 00:00:01.638	10	1	3	\N	QUEUE	\N	\N	\N	\N
1060	2018-05-21 22:17:07.314	roman.batygin@mail.ru	2018-05-21 22:57:42.717	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2018-05-21 22:18:23.652	\N	b1093ae3-a8dc-4d99-8fb0-0d4793c57c68	2018-06-10 00:00:01.7	10	1	3	\N	QUEUE	\N	\N	\N	\N
932	2018-05-20 01:07:58.426	bat1238@yandex.ru	2018-05-20 01:08:40.664	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-05-20 01:08:39.052	\N	23274c52-779f-445e-9b8d-57c102ad4949	2018-06-10 00:00:00.903	10	1	3	\N	QUEUE	\N	\N	\N	\N
3036	2019-01-04 03:07:46.199	roman.batygin@mail.ru	2019-01-04 17:49:16.985	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2019-01-04 16:56:12.146	\N	fef7fcc6-1952-47bb-80a8-1e801c6ae094	2019-02-12 00:00:01.876	10	1	1	\N	QUEUE	\N	\N	\N	\N
931	2018-05-20 01:07:35.155	bat1238@yandex.ru	2018-05-20 01:08:39.038	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-05-20 01:08:05.177	\N	1a0fc5b1-9eec-464b-9e48-43b7b03f75be	2018-06-10 00:00:00.886	10	1	3	\N	QUEUE	\N	\N	\N	\N
947	2018-05-20 02:22:02.251	roman.batygin@mail.ru	2018-05-20 02:24:24.77	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-05-20 02:22:11.09	\N	4193289a-66d8-4216-ab50-9e0df0e106a1	2018-06-10 00:00:01.219	10	1	3	\N	QUEUE	\N	\N	\N	\N
948	2018-05-20 02:22:11.838	roman.batygin@mail.ru	2018-05-20 02:25:48.026	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-20 02:24:54.796	\N	89139f8b-98dd-4aa7-8024-4da2ea0398c9	2018-06-10 00:00:01.382	10	1	3	\N	QUEUE	\N	\N	\N	\N
963	2018-05-20 02:27:14.593	roman.batygin@mail.ru	2018-05-20 02:29:46.452	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-05-20 02:27:18.072	\N	73a6145d-78bb-4b2c-9d77-f5885a89b3ef	2018-06-10 00:00:01.398	10	1	3	\N	QUEUE	\N	\N	\N	\N
971	2018-05-20 02:41:39.96	roman.batygin@mail.ru	2018-05-20 02:42:31.347	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-05-20 02:41:46.648	\N	c759dead-92e4-410c-9ce6-fa7d4f860a2a	2018-06-10 00:00:01.418	10	1	3	\N	QUEUE	\N	\N	\N	\N
979	2018-05-20 11:54:11.874	roman.batygin@mail.ru	2018-05-20 13:32:06.933	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-05-20 11:54:26.249	\N	a7355a7a-109d-4409-b27f-2323fcf594d6	2018-06-10 00:00:01.488	10	1	3	\N	QUEUE	\N	\N	\N	\N
1148	2018-05-22 22:02:55.754	roman.batygin@mail.ru	2018-05-22 22:24:15.499	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-05-22 22:03:16.211	\N	90390cf9-6aad-488f-9244-0ad376c1a1cf	2018-06-10 00:00:01.746	10	1	3	\N	QUEUE	\N	\N	\N	\N
981	2018-05-20 11:55:42.781	roman.batygin@mail.ru	2018-05-20 13:34:41.204	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-20 13:32:37.389	\N	a72b4bff-194d-48d7-a8cd-c0f568cb18c4	2018-06-10 00:00:01.544	10	1	3	\N	QUEUE	\N	\N	\N	\N
1061	2018-05-21 22:17:20.99	roman.batygin@mail.ru	2018-05-22 21:04:28.718	java.lang.OutOfMemoryError: GC overhead limit exceeded	CROSS_VALIDATION	\N	ERROR	RANDOM_FORESTS	2018-05-22 20:33:48.014	\N	6082d5f2-0131-4674-8689-04b8a3853a69	2018-06-10 00:00:01.705	10	1	3	\N	QUEUE	\N	\N	\N	\N
982	2018-05-20 11:55:51.422	roman.batygin@mail.ru	2018-05-20 13:34:43.638	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-05-20 13:34:41.215	\N	77bfb45c-93a7-4121-ba83-e70c67821c36	2018-06-10 00:00:01.559	10	1	3	\N	QUEUE	\N	\N	\N	\N
983	2018-05-20 11:56:03.391	roman.batygin@mail.ru	2018-05-20 14:16:22.356	\N	CROSS_VALIDATION	\N	FINISHED	STACKING_CV	2018-05-20 13:34:43.662	\N	2da76d39-d32e-4879-aad2-cad9a4e54245	2018-06-10 00:00:01.578	10	1	3	\N	QUEUE	\N	\N	\N	\N
984	2018-05-20 11:56:11.719	roman.batygin@mail.ru	2018-05-20 14:39:31.645	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-05-20 14:16:22.436	\N	a2dda357-b463-494b-b099-aad159aef299	2018-06-10 00:00:01.604	10	1	3	\N	QUEUE	\N	\N	\N	\N
985	2018-05-20 11:56:19.75	roman.batygin@mail.ru	2018-05-20 15:05:20.584	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-05-20 14:39:31.67	\N	42bb1791-c96b-4e68-9360-97ac93cf1204	2018-06-10 00:00:01.614	10	1	3	\N	QUEUE	\N	\N	\N	\N
986	2018-05-20 11:56:26.719	roman.batygin@mail.ru	2018-05-20 17:16:43.769	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2018-05-20 15:05:20.612	\N	173c43dc-6430-490d-b7db-11ccbbecce20	2018-06-10 00:00:01.622	10	1	3	\N	QUEUE	\N	\N	\N	\N
1012	2018-05-20 23:16:11.386	roman.batygin@mail.ru	2018-05-20 23:20:25.863	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-20 23:18:28.332	\N	75eeac89-5ca5-46f5-8cc7-3fef131ccd41	2018-06-10 00:00:01.644	10	1	3	\N	QUEUE	\N	\N	\N	\N
1013	2018-05-20 23:16:20.624	roman.batygin@mail.ru	2018-05-20 23:26:41.817	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-05-20 23:20:25.877	\N	41d5b408-b4c2-4f51-b238-a0f2f33e8b28	2018-06-10 00:00:01.649	10	1	3	\N	QUEUE	\N	\N	\N	\N
1059	2018-05-21 22:16:59.28	roman.batygin@mail.ru	2018-05-21 22:18:23.634	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-05-21 22:17:21.142	\N	2eeb8252-8909-4a79-a9de-1695d8ede954	2018-06-10 00:00:01.694	10	1	3	\N	QUEUE	\N	\N	\N	\N
1155	2018-05-22 22:27:02.048	roman.batygin@mail.ru	2018-05-22 22:38:01.038	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-05-22 22:27:15.657	\N	d1000222-5c31-417c-86ee-456e54b403f2	2018-06-10 00:00:01.752	10	1	3	\N	QUEUE	\N	\N	\N	\N
318	2017-12-31 15:52:32.942	bat1238@yandex.ru	2018-01-01 20:10:12.15	\N	CROSS_VALIDATION	\N	TIMEOUT	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-01-01 15:10:12.016	\N	e1807241-4d77-4a63-8ba4-5019f6ba0849	2018-02-25 00:00:01.293	10	1	3	\N	QUEUE	\N	\N	\N	\N
1530	2018-05-27 23:12:20.919	bat1238@yandex.ru	2018-05-27 23:25:46.612	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2018-05-27 23:12:27.888	\N	28b64fe5-cb33-4efc-9b6e-2476aa0830b6	2018-06-22 00:00:01.807	10	1	1	\N	QUEUE	\N	\N	\N	\N
1531	2018-05-27 23:12:28.528	bat1238@yandex.ru	2018-05-27 23:26:18.706	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-05-27 23:26:16.643	\N	6d18076c-814b-497e-acec-0bd0854cef72	2018-06-22 00:00:01.914	10	1	1	\N	QUEUE	\N	\N	\N	\N
1532	2018-05-27 23:12:36.294	bat1238@yandex.ru	2018-05-27 23:27:05.941	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-27 23:26:18.784	\N	2983d10f-75dd-4d6b-9d41-87ba44b7604f	2018-06-22 00:00:01.98	10	1	1	\N	QUEUE	\N	\N	\N	\N
1533	2018-05-27 23:12:42.591	bat1238@yandex.ru	2018-05-27 23:27:48.644	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-27 23:27:06.05	\N	7cb81954-b8a3-4fdf-abc8-07c40a1ddc28	2018-06-22 00:00:02.04	10	1	1	\N	QUEUE	\N	\N	\N	\N
1579	2018-05-27 23:32:59.053	bat1238@yandex.ru	2018-05-27 23:35:48.318	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-27 23:34:58.906	\N	e5d450b5-b823-4ad4-a85e-3a3ecf798c35	2018-06-22 00:00:02.813	10	1	1	\N	QUEUE	\N	\N	\N	\N
1550	2018-05-27 23:27:26.644	bat1238@yandex.ru	2018-05-27 23:28:49.142	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-05-27 23:28:18.656	\N	eb979fc8-605d-4098-b0be-53504534f103	2018-06-22 00:00:02.316	10	1	1	\N	QUEUE	\N	\N	\N	\N
1557	2018-05-27 23:27:49.519	bat1238@yandex.ru	2018-05-27 23:30:56.077	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-05-27 23:28:49.223	\N	b53f54d8-2d35-4498-a62e-3b7119dc0d4f	2018-06-22 00:00:02.517	10	1	1	\N	QUEUE	\N	\N	\N	\N
1572	2018-05-27 23:31:09.06	bat1238@yandex.ru	2018-05-27 23:32:06.557	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-05-27 23:31:26.102	\N	920e7342-6030-44f6-86bb-4ab68b753827	2018-06-22 00:00:02.615	10	1	1	\N	QUEUE	\N	\N	\N	\N
1573	2018-05-27 23:31:16.258	bat1238@yandex.ru	2018-05-27 23:34:28.895	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-05-27 23:32:06.62	\N	c799f183-a6a0-4980-98e5-dc36029f9638	2018-06-22 00:00:02.779	10	1	1	\N	QUEUE	\N	\N	\N	\N
1594	2018-05-27 23:39:10.635	bat1238@yandex.ru	2018-05-27 23:40:01.058	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-27 23:39:19.654	\N	4273bf94-f939-4069-96ab-b47fa05806fb	2018-06-22 00:00:03.164	10	1	1	\N	QUEUE	\N	\N	\N	\N
1634	2018-05-27 23:42:59.973	bat1238@yandex.ru	2018-05-27 23:43:07.183	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-05-27 23:43:01.145	\N	57842ab4-439a-400a-857a-2c2af31f0bc7	2018-06-22 00:00:03.218	10	1	1	\N	QUEUE	\N	\N	\N	\N
1641	2018-05-27 23:43:32.791	bat1238@yandex.ru	2018-05-27 23:45:37.002	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-05-27 23:43:37.198	\N	aea9da28-3c4c-4265-ab92-27634ad1f35f	2018-06-22 00:00:03.227	10	1	1	\N	QUEUE	\N	\N	\N	\N
1642	2018-05-27 23:45:03.824	bat1238@yandex.ru	2018-05-28 00:07:57.607	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-27 23:46:07.02	\N	a6d86140-6750-40ba-8c0f-0933d19f9baf	2018-06-22 00:00:03.238	10	1	1	\N	QUEUE	\N	\N	\N	\N
1691	2018-05-28 21:36:42.064	bat1238@yandex.ru	2018-05-28 21:48:22.43	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-28 21:37:31.933	\N	131f0d81-1e71-42ac-a243-42b91e7b7cbc	2018-06-22 00:00:03.51	10	1	1	\N	QUEUE	\N	\N	\N	\N
1649	2018-05-27 23:46:15.514	bat1238@yandex.ru	2018-05-28 00:10:58.177	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-05-28 00:08:27.621	\N	a217a04f-d6b5-4b27-94ff-b66f6c89161f	2018-06-22 00:00:03.269	10	1	1	\N	QUEUE	\N	\N	\N	\N
1782	2018-06-07 22:06:39.078	bat1238@yandex.ru	2018-06-07 22:21:42.432	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-06-07 22:21:39.951	\N	f88676ce-0392-40bc-b990-7c1158627318	2018-06-22 00:00:03.682	10	1	1	\N	QUEUE	\N	\N	\N	\N
1662	2018-05-28 20:57:33.253	bat1238@yandex.ru	2018-05-28 20:58:34.884	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-05-28 20:57:44.277	\N	e85ba3dd-3fd7-491b-bc67-474966177cc6	2018-06-22 00:00:03.318	10	1	1	\N	QUEUE	\N	\N	\N	\N
1419	2018-05-27 16:58:50.583	roman.batygin@mail.ru	2018-05-27 19:42:15.096	java.lang.OutOfMemoryError: GC overhead limit exceeded	CROSS_VALIDATION	\N	ERROR	HETEROGENEOUS_ENSEMBLE	2018-05-27 16:59:07.505	\N	99f95cc2-6caa-453b-b9c7-97b359e91f61	2018-06-22 00:00:01.388	10	1	1	\N	QUEUE	\N	\N	\N	\N
1663	2018-05-28 20:57:48.385	bat1238@yandex.ru	2018-05-28 21:10:48.526	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-28 20:59:04.902	\N	7a43d324-2b51-4af3-b799-563b1327a3cb	2018-06-22 00:00:03.365	10	1	1	\N	QUEUE	\N	\N	\N	\N
1664	2018-05-28 20:57:59.318	bat1238@yandex.ru	2018-05-28 21:25:39.323	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2018-05-28 21:10:48.678	\N	f56e12d5-8d6f-40be-b422-591903a55874	2018-06-22 00:00:03.416	10	1	1	\N	QUEUE	\N	\N	\N	\N
1683	2018-05-28 21:30:38.287	bat1238@yandex.ru	2018-05-28 21:32:11.473	\N	CROSS_VALIDATION	\N	FINISHED	STACKING_CV	2018-05-28 21:30:39.395	\N	f8277430-1306-4506-af8b-6f6ff25819f9	2018-06-22 00:00:03.425	10	1	1	\N	QUEUE	\N	\N	\N	\N
1787	2018-06-07 22:07:28.305	bat1238@yandex.ru	2018-06-07 22:27:50.622	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-06-07 22:27:21.427	\N	0ea06b57-1323-44ce-9e91-8373c762b0cb	2018-06-22 00:00:03.784	10	1	1	\N	QUEUE	\N	\N	\N	\N
1704	2018-05-28 22:33:34.757	bat1238@yandex.ru	2018-05-28 22:45:21.003	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-05-28 22:33:52.918	\N	877495d3-abcb-4595-89ef-98d4759af824	2018-06-22 00:00:03.597	10	1	1	\N	QUEUE	\N	\N	\N	\N
1830	2018-06-07 22:58:42.139	bat1238@yandex.ru	2018-06-07 22:59:30.382	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-06-07 22:58:50.913	\N	3148daf4-610a-47e8-87a2-2475c22dee06	2018-06-22 00:00:03.793	10	1	1	\N	QUEUE	\N	\N	\N	\N
1868	2018-06-09 21:12:40.791	bat1238@yandex.ru	2018-06-09 21:35:09.442	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-06-09 21:34:28.275	\N	6fc7833c-19f8-4be0-a318-32295648ece7	2018-06-26 00:01:48.517	10	1	1	\N	QUEUE	\N	\N	\N	\N
1783	2018-06-07 22:06:53.728	bat1238@yandex.ru	2018-06-07 22:23:43.073	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-06-07 22:21:42.499	\N	bc0f1ff6-e1ed-4c42-843e-a5d0e5aab00f	2018-06-22 00:00:03.696	10	1	1	\N	QUEUE	\N	\N	\N	\N
1784	2018-06-07 22:07:00.471	bat1238@yandex.ru	2018-06-07 22:24:27.434	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-06-07 22:23:43.082	\N	aa6c01df-21a7-4bf2-8b7a-2626c98dd1f0	2018-06-22 00:00:03.75	10	1	1	\N	QUEUE	\N	\N	\N	\N
1831	2018-06-07 22:58:49.78	bat1238@yandex.ru	2018-06-07 23:00:18.379	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-06-07 22:59:30.397	\N	2e3cb59a-20d0-4119-a71e-9b5b4321e6ba	2018-06-22 00:00:03.8	10	1	1	\N	QUEUE	\N	\N	\N	\N
1869	2018-06-09 21:12:47.173	bat1238@yandex.ru	2018-06-09 21:37:29.198	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-06-09 21:35:09.522	\N	293736b1-8054-418b-a850-bd96ad40ee72	2018-06-26 00:01:48.544	10	1	1	\N	QUEUE	\N	\N	\N	\N
1870	2018-06-09 21:12:53.745	bat1238@yandex.ru	2018-06-09 21:40:13.211	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-06-09 21:37:29.207	\N	3eb5b253-8729-4070-94e9-e75528013079	2018-06-26 00:01:48.552	10	1	1	\N	QUEUE	\N	\N	\N	\N
1871	2018-06-09 21:21:14.569	bat1238@yandex.ru	2018-06-09 21:40:57.102	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-06-09 21:40:13.222	\N	d3aceb37-df94-48f3-9a3f-c67a27bb09a9	2018-06-26 00:01:48.56	10	1	1	\N	QUEUE	\N	\N	\N	\N
1872	2018-06-09 21:21:21.389	bat1238@yandex.ru	2018-06-09 21:41:27.884	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-06-09 21:40:57.139	\N	13c6c1e9-7d2a-4dc4-886b-c4a235c2f3e7	2018-06-26 00:01:48.571	10	1	1	\N	QUEUE	\N	\N	\N	\N
1593	2018-05-27 23:39:04.3	bat1238@yandex.ru	2018-05-27 23:39:19.654	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-05-27 23:39:18.401	\N	4834a106-86da-4adc-850b-9ea1822ba964	2018-06-22 00:00:02.907	10	1	1	\N	QUEUE	\N	\N	\N	\N
1781	2018-06-07 22:06:31.617	bat1238@yandex.ru	2018-06-07 22:21:39.878	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2018-06-07 22:06:47.198	\N	29c9622b-07fc-491d-85b5-6fc009dcc407	2018-06-22 00:00:03.637	10	1	1	\N	QUEUE	\N	\N	\N	\N
1785	2018-06-07 22:07:07.092	bat1238@yandex.ru	2018-06-07 22:25:04.753	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-06-07 22:24:27.455	\N	5f2eb85f-67f4-4c30-9f0f-09c6c0b0b2d2	2018-06-22 00:00:03.763	10	1	1	\N	QUEUE	\N	\N	\N	\N
1786	2018-06-07 22:07:18.712	bat1238@yandex.ru	2018-06-07 22:27:21.42	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-06-07 22:25:04.792	\N	a7c8d745-4c87-47e6-8502-178c2d64db18	2018-06-22 00:00:03.77	10	1	1	\N	QUEUE	\N	\N	\N	\N
1866	2018-06-09 21:12:25.5	bat1238@yandex.ru	2018-06-09 21:34:24.748	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2018-06-09 21:12:46.415	\N	4f2cb299-036c-46c7-aed0-5a0f0f1676e3	2018-06-26 00:01:48.497	10	1	1	\N	QUEUE	\N	\N	\N	\N
1867	2018-06-09 21:12:34.612	bat1238@yandex.ru	2018-06-09 21:34:28.26	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-06-09 21:34:24.774	\N	457b2551-bc64-4bdc-86ab-ece6cda1d897	2018-06-26 00:01:48.507	10	1	1	\N	QUEUE	\N	\N	\N	\N
1963	2018-06-10 10:52:15.039	bat1238@yandex.ru	2018-06-10 10:52:25.117	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-06-10 10:52:21.242	\N	365b851b-99cf-4bb2-9404-4e7b621fd1ac	2018-06-26 00:01:48.616	10	1	1	\N	QUEUE	\N	\N	\N	\N
1972	2018-06-10 10:52:36.805	bat1238@yandex.ru	2018-06-10 10:57:26.307	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-06-10 10:56:36.651	\N	9c6375dc-42a2-4605-bad9-0cbf20c7a4e8	2018-06-26 00:01:48.675	10	1	1	\N	QUEUE	\N	\N	\N	\N
1964	2018-06-10 10:52:23.508	bat1238@yandex.ru	2018-06-10 10:54:55.962	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-06-10 10:52:55.149	\N	202ad9f7-e97d-4c62-8821-cd232ed995d3	2018-06-26 00:01:48.662	10	1	1	\N	QUEUE	\N	\N	\N	\N
1971	2018-06-10 10:52:30.18	bat1238@yandex.ru	2018-06-10 10:56:36.635	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-06-10 10:54:55.993	\N	9693952c-7b93-4bf9-8ab1-acc80fe7a997	2018-06-26 00:01:48.669	10	1	1	\N	QUEUE	\N	\N	\N	\N
1991	2018-06-10 11:57:09.187	bat1238@yandex.ru	2018-06-10 11:59:58.713	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-06-10 11:57:28.281	\N	04bde422-1e01-4676-9217-048e3df3546e	2018-06-26 00:01:48.681	10	1	1	\N	QUEUE	\N	\N	\N	\N
1992	2018-06-10 11:58:46.316	bat1238@yandex.ru	2018-06-10 13:28:12.161	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2018-06-10 12:00:28.831	\N	f67ff164-9b49-41ef-9fb1-2ae6f1ff1970	2018-06-26 00:01:48.687	10	1	1	\N	QUEUE	\N	\N	\N	\N
2005	2018-06-10 13:45:27.133	bat1238@yandex.ru	2018-06-10 13:47:54.095	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-06-10 13:45:42.381	\N	7cfecdf6-5e67-4c35-881b-4c30659151b8	2018-06-26 00:01:48.745	10	1	1	\N	QUEUE	\N	\N	\N	\N
2006	2018-06-10 13:45:45.984	bat1238@yandex.ru	2018-06-10 13:51:55.448	\N	CROSS_VALIDATION	\N	FINISHED	STACKING_CV	2018-06-10 13:48:24.107	\N	e99f77d3-5b79-4070-9963-b5925f5da070	2018-06-26 00:01:48.764	10	1	1	\N	QUEUE	\N	\N	\N	\N
2046	2018-06-12 15:09:24.387	bat1238@yandex.ru	2018-06-12 15:09:50.247	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-06-12 15:09:46.606	\N	f0f96dba-e0b9-4e24-b33f-3da4f8b6c333	2018-06-27 00:30:06.294	10	1	1	\N	QUEUE	\N	\N	\N	\N
2047	2018-06-12 15:09:33.137	bat1238@yandex.ru	2018-06-12 15:11:36.435	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-06-12 15:09:50.278	\N	a03d095e-74ff-4b9d-9c79-13189bbb9e7f	2018-06-27 00:30:06.323	10	1	1	\N	QUEUE	\N	\N	\N	\N
2048	2018-06-12 15:09:41.544	bat1238@yandex.ru	2018-06-12 15:12:24.529	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-06-12 15:11:36.498	\N	0bf10b90-c598-4a0f-aff0-c0f1e27fc1ba	2018-06-27 00:30:06.337	10	1	1	\N	QUEUE	\N	\N	\N	\N
2049	2018-06-12 15:09:53.45	bat1238@yandex.ru	2018-06-12 15:14:44.712	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-06-12 15:12:24.561	\N	6f545e4a-90f1-492d-9f9d-c8b24a2f6d37	2018-06-27 00:30:06.35	10	1	1	\N	QUEUE	\N	\N	\N	\N
2055	2018-06-12 15:10:03.559	bat1238@yandex.ru	2018-06-12 15:16:54.266	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-06-12 15:14:44.721	\N	4ffd1634-87df-4bad-a712-f1cdd3f5fcfb	2018-06-27 00:30:06.362	10	1	1	\N	QUEUE	\N	\N	\N	\N
2081	2018-06-12 15:20:10.676	bat1238@yandex.ru	2018-06-12 15:25:30.336	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-06-12 15:20:24.302	\N	21c10238-265f-46f9-bc98-382d5932f7b6	2018-06-27 00:30:06.371	10	1	1	\N	QUEUE	\N	\N	\N	\N
2082	2018-06-12 15:20:19.345	bat1238@yandex.ru	2018-06-12 15:28:46.013	\N	CROSS_VALIDATION	\N	FINISHED	STACKING_CV	2018-06-12 15:25:30.344	\N	f834036f-d49d-4777-8ca2-960fd3c75af6	2018-06-27 00:30:06.379	10	1	1	\N	QUEUE	\N	\N	\N	\N
2423	2018-06-29 12:30:59.444	bat1238@yandex.ru	2018-06-29 13:04:41.958	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2018-06-29 12:31:30.678	\N	aecd296c-0393-494b-af0c-c86a0f2d3996	2018-08-24 00:54:09.765	10	1	1	\N	QUEUE	\N	\N	\N	\N
2095	2018-06-12 15:30:29.37	bat1238@yandex.ru	2018-06-12 15:36:03.757	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-06-12 15:30:46.069	\N	c8105235-10f1-4d90-a04a-dbbb9ed5667b	2018-06-27 00:30:06.387	10	1	1	\N	QUEUE	\N	\N	\N	\N
2102	2018-06-12 15:56:02.649	bat1238@yandex.ru	2018-06-12 17:01:19.412	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2018-06-12 15:56:04.003	\N	98e27a2a-4d34-4248-a76e-b9cec95cf44f	2018-06-27 00:30:06.394	10	1	1	\N	QUEUE	\N	\N	\N	\N
2153	2018-06-21 21:19:53.355	roman.batygin@mail.ru	2018-06-21 21:39:16.711	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2018-06-21 21:19:59.775	\N	fcd64d5a-7347-41a6-8b15-2048a8b592fc	2018-08-24 00:54:08.964	10	1	1	\N	QUEUE	\N	\N	\N	\N
2155	2018-06-21 21:20:05.406	roman.batygin@mail.ru	2018-06-21 21:42:24.768	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-06-21 21:39:46.732	\N	941e8f58-86ef-4d06-8fb6-390e5415e290	2018-08-24 00:54:09.008	10	1	1	\N	QUEUE	\N	\N	\N	\N
2157	2018-06-21 21:20:12.702	roman.batygin@mail.ru	2018-06-21 21:45:41.842	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-06-21 21:42:24.843	\N	615320f0-8e67-431a-944d-096b82da090f	2018-08-24 00:54:09.029	10	1	1	\N	QUEUE	\N	\N	\N	\N
2159	2018-06-21 21:20:19.919	roman.batygin@mail.ru	2018-06-21 21:46:32.927	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-06-21 21:45:42.101	\N	7e94a1e3-97aa-41b5-8012-b4b676a1a569	2018-08-24 00:54:09.052	10	1	1	\N	QUEUE	\N	\N	\N	\N
2161	2018-06-21 21:20:26.112	roman.batygin@mail.ru	2018-06-21 21:47:09.699	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-06-21 21:46:33.167	\N	dca0d075-236d-48ef-8b4b-9644bbf950ef	2018-08-24 00:54:09.084	10	1	1	\N	QUEUE	\N	\N	\N	\N
2163	2018-06-21 21:20:32.868	roman.batygin@mail.ru	2018-06-21 21:48:48.371	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-06-21 21:47:09.712	\N	5fdc37ef-17d1-4542-b8fc-62abc37b5225	2018-08-24 00:54:09.152	10	1	1	\N	QUEUE	\N	\N	\N	\N
2165	2018-06-21 21:20:47.339	roman.batygin@mail.ru	2018-06-21 21:50:22.895	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-06-21 21:48:49.004	\N	58f5720e-e82d-48d5-b585-93112d0a351f	2018-08-24 00:54:09.178	10	1	1	\N	QUEUE	\N	\N	\N	\N
2167	2018-06-21 21:20:54.128	roman.batygin@mail.ru	2018-06-21 21:51:46.542	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-06-21 21:50:23.038	\N	08ab072f-b1f5-47a7-ac60-6d0fa779b1d8	2018-08-24 00:54:09.207	10	1	1	\N	QUEUE	\N	\N	\N	\N
2225	2018-06-25 23:07:28.193	bat1238@yandex.ru	2018-06-25 23:08:03.839	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-06-25 23:07:55.788	\N	278572a1-50a4-480b-b450-437aa3bb0233	2018-08-24 00:54:09.271	10	1	1	\N	QUEUE	\N	\N	\N	\N
2227	2018-06-25 23:07:39.836	bat1238@yandex.ru	2018-06-25 23:18:39.583	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-06-25 23:08:03.855	\N	73a5b9c4-a5e0-430e-bdfb-a7ccfb4f8154	2018-08-24 00:54:09.393	10	1	1	\N	QUEUE	\N	\N	\N	\N
2229	2018-06-25 23:07:48.171	bat1238@yandex.ru	2018-06-25 23:20:55.436	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-06-25 23:18:39.598	\N	82bf0901-4e0d-4bf6-a793-5108f68845d7	2018-08-24 00:54:09.41	10	1	1	\N	QUEUE	\N	\N	\N	\N
2249	2018-06-25 23:22:41.539	bat1238@yandex.ru	2018-06-25 23:23:45.757	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-06-25 23:22:55.887	\N	6409b42e-9800-499b-8e81-66f46f4f6802	2018-08-24 00:54:09.427	10	1	1	\N	QUEUE	\N	\N	\N	\N
2251	2018-06-25 23:22:51.574	bat1238@yandex.ru	2018-06-25 23:24:07.949	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-06-25 23:23:45.779	\N	42abf426-381e-46d0-a427-12f95f0e4003	2018-08-24 00:54:09.447	10	1	1	\N	QUEUE	\N	\N	\N	\N
2265	2018-06-25 23:26:03.414	bat1238@yandex.ru	2018-06-25 23:37:29.268	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-06-25 23:26:07.99	\N	ada76a36-ec1e-469c-8b8c-04295e7aca18	2018-08-24 00:54:09.504	10	1	1	\N	QUEUE	\N	\N	\N	\N
2267	2018-06-25 23:36:49.959	bat1238@yandex.ru	2018-06-25 23:40:19.137	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-06-25 23:37:59.311	\N	f419d9eb-551e-4f4d-bd68-ee7419a14b1c	2018-08-24 00:54:09.52	10	1	1	\N	QUEUE	\N	\N	\N	\N
2313	2018-06-25 23:48:35.284	bat1238@yandex.ru	2018-06-26 00:01:45.385	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2018-06-25 23:48:49.251	\N	4b67e49c-08d0-437d-9330-6099f9e39583	2018-08-24 00:54:09.537	10	1	1	\N	QUEUE	\N	\N	\N	\N
2321	2018-06-26 21:25:06.045	bat1238@yandex.ru	2018-06-26 21:36:17.371	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-06-26 21:25:14.116	\N	1fb2fff6-f7f3-4d85-9e30-f0c676c9d6b1	2018-08-24 00:54:09.61	10	1	1	\N	QUEUE	\N	\N	\N	\N
2323	2018-06-26 21:25:15.125	bat1238@yandex.ru	2018-06-26 21:49:00.428	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-06-26 21:36:47.391	\N	3ba44c84-aeff-4644-8e0c-d96841212d6b	2018-08-24 00:54:09.622	10	1	1	\N	QUEUE	\N	\N	\N	\N
2352	2018-06-26 21:44:20.495	bat1238@yandex.ru	2018-06-26 21:49:52.832	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-06-26 21:49:30.447	\N	456cda83-c856-4746-a260-7ea016ba7fc7	2018-08-24 00:54:09.631	10	1	1	\N	QUEUE	\N	\N	\N	\N
2366	2018-06-26 22:13:27.386	bat1238@yandex.ru	2018-06-26 22:38:47.863	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-06-26 22:13:40.486	\N	b902e0a7-bc36-4e72-9a0f-1b40e2413d22	2018-08-24 00:54:09.674	10	1	1	\N	QUEUE	\N	\N	\N	\N
2377	2018-06-26 22:49:26.275	bat1238@yandex.ru	2018-06-27 00:30:03.264	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-06-26 23:07:46.96	\N	fe17589c-3df6-4c0a-a1c3-e33f18f759b1	2018-08-24 00:54:09.683	10	1	1	\N	QUEUE	\N	\N	\N	\N
2499	2018-07-07 17:27:57.696	bat1238@yandex.ru	2018-07-07 18:52:50.942	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-07-07 17:28:04.459	\N	8ea92dcc-1c12-4c42-9f5c-8ace288f8a4c	2018-08-24 00:54:09.967	10	1	1	\N	QUEUE	\N	\N	\N	\N
2691	2018-08-23 22:53:39.536	bat1238@yandex.ru	2018-08-23 22:58:07.652	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-08-23 22:53:44.583	\N	bf790ae5-16c9-42b7-9c7e-4bf70d43b170	2018-11-22 00:00:01.294	10	1	1	\N	QUEUE	\N	\N	\N	\N
2548	2018-07-19 23:20:21.339	roman.batygin@mail.ru	2018-07-19 23:20:50.327	\N	CROSS_VALIDATION	\N	FINISHED	DECISION_TREE	2018-07-19 23:20:41.723	\N	f44bec05-d21f-4a91-b4de-d4a9385afe76	2018-08-24 00:54:10.004	10	1	1	\N	QUEUE	\N	\N	\N	\N
2556	2018-07-19 23:21:15.808	roman.batygin@mail.ru	2018-07-19 23:22:02.638	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-07-19 23:21:20.354	\N	69f9a848-12ca-4ef1-ae01-9f9d76be7dfa	2018-08-24 00:54:10.015	10	1	1	\N	QUEUE	\N	\N	\N	\N
2558	2018-07-19 23:21:24.481	roman.batygin@mail.ru	2018-07-19 23:23:11.237	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-07-19 23:22:32.652	\N	f192f0d7-1907-41e7-a7bb-3627888dcf83	2018-08-24 00:54:10.037	10	1	1	\N	QUEUE	\N	\N	\N	\N
2651	2018-08-23 21:18:50.703	roman.batygin@mail.ru	2018-08-23 21:23:28.473	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-08-23 21:18:56.023	\N	3ee46188-229d-40ba-8b08-583f0233df24	2018-11-22 00:00:00.252	10	1	1	\N	QUEUE	\N	\N	\N	\N
2653	2018-08-23 21:19:00.18	roman.batygin@mail.ru	2018-08-23 21:33:40.464	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-08-23 21:23:58.496	\N	af286191-a46e-4ab7-bc60-dbb78b4e7252	2018-11-22 00:00:00.934	10	1	1	\N	QUEUE	\N	\N	\N	\N
2655	2018-08-23 21:19:09.238	roman.batygin@mail.ru	2018-08-23 21:38:07.514	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-08-23 21:33:40.474	\N	15f0c864-4f88-409e-afba-b23b30a1f2b6	2018-11-22 00:00:00.977	10	1	1	\N	QUEUE	\N	\N	\N	\N
2693	2018-08-23 22:53:50.55	bat1238@yandex.ru	2018-08-24 00:29:08.047	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-08-23 22:58:37.683	\N	39e68b5d-f660-426e-a1b8-c0c98027460e	2018-11-22 00:00:01.689	10	1	1	\N	QUEUE	\N	\N	\N	\N
2399	2018-06-27 22:39:06.768	bat1238@yandex.ru	2018-06-27 22:41:57.428	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-06-27 22:39:25.425	\N	06e000fd-e67b-4059-8959-ac26098653b9	2018-08-24 00:54:09.725	10	1	1	\N	QUEUE	\N	\N	\N	\N
2695	2018-08-23 22:54:38.253	bat1238@yandex.ru	2018-08-24 00:54:07.091	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2018-08-24 00:29:08.385	\N	fe65777a-8f0f-4ba0-a78d-933c8936449d	2018-11-22 00:00:01.711	10	1	1	\N	QUEUE	\N	\N	\N	\N
2720	2018-09-17 14:19:32.858	roman.batygin@mail.ru	2018-09-17 14:20:56.467	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-09-17 14:19:50.514	\N	545db521-2679-45be-8eda-82c9bffc10b1	2018-11-22 00:00:01.727	10	1	1	\N	QUEUE	\N	\N	\N	\N
2407	2018-06-27 22:45:25.738	bat1238@yandex.ru	2018-06-28 23:23:16.215	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-06-28 21:26:49.714	\N	fac11eed-0fc6-4ba5-8fcf-743684825775	2018-08-24 00:54:09.75	10	1	1	\N	QUEUE	\N	\N	\N	\N
2382	2018-06-26 23:08:00.807	bat1238@yandex.ru	2018-06-27 22:22:55.225	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-06-27 21:59:07.514	\N	e584c331-4c0f-4411-891a-7b2713e0a1ad	2018-08-24 00:54:09.691	10	1	1	\N	QUEUE	\N	\N	\N	\N
2431	2018-07-07 02:12:08.416	roman.batygin@mail.ru	2018-07-07 02:13:34.671	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-07-07 02:12:38.066	\N	2c1743bd-1400-4e45-a3a6-feaa5f266c23	2018-08-24 00:54:09.789	10	1	1	\N	QUEUE	\N	\N	\N	\N
2439	2018-07-07 12:55:02.337	bat1238@yandex.ru	2018-07-07 13:03:30.706	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-07-07 12:55:22.832	\N	83ebef65-8ae6-4950-ae2d-8073efb1c527	2018-08-24 00:54:09.831	10	1	1	\N	QUEUE	\N	\N	\N	\N
2441	2018-07-07 12:57:16.549	bat1238@yandex.ru	2018-07-07 13:28:45.479	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-07-07 13:04:00.737	\N	a9f2e05e-4b6f-40cb-aa3d-a181e8653423	2018-08-24 00:54:09.867	10	1	1	\N	QUEUE	\N	\N	\N	\N
2488	2018-07-07 13:38:26.651	bat1238@yandex.ru	2018-07-07 16:02:06.041	java.lang.OutOfMemoryError: GC overhead limit exceeded	CROSS_VALIDATION	\N	ERROR	HETEROGENEOUS_ENSEMBLE	2018-07-07 13:38:36.365	\N	f5f81506-5e87-4e94-935f-3837f96609e8	2018-08-24 00:54:09.906	10	1	1	\N	QUEUE	\N	\N	\N	\N
2491	2018-07-07 16:48:07.535	bat1238@yandex.ru	2018-07-07 17:23:17.652	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-07-07 16:48:11.137	\N	b41ad944-0712-4d3c-b9ab-395323492734	2018-08-24 00:54:09.956	10	1	1	\N	QUEUE	\N	\N	\N	\N
2582	2018-07-19 23:26:27.38	roman.batygin@mail.ru	2018-07-19 23:31:47.12	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-07-19 23:26:41.29	\N	16c66bb5-7ddb-4758-9b47-176dca8a3c45	2018-08-24 00:54:10.066	10	1	1	\N	QUEUE	\N	\N	\N	\N
2584	2018-07-19 23:26:35.17	roman.batygin@mail.ru	2018-07-19 23:32:51.699	\N	CROSS_VALIDATION	\N	FINISHED	DECISION_TREE	2018-07-19 23:31:47.132	\N	ac164a9d-3231-4d11-9a41-4ded68f7aa29	2018-08-24 00:54:10.085	10	1	1	\N	QUEUE	\N	\N	\N	\N
2657	2018-08-23 21:19:16.869	roman.batygin@mail.ru	2018-08-23 21:38:12.224	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-08-23 21:38:07.567	\N	c323955d-eca8-4e59-9df3-c634cb9a9401	2018-11-22 00:00:01.105	10	1	1	\N	QUEUE	\N	\N	\N	\N
2659	2018-08-23 21:19:26.262	roman.batygin@mail.ru	2018-08-23 21:42:43.424	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-08-23 21:38:12.25	\N	aa63de57-3ec2-48f9-b3d2-bd0951f82110	2018-11-22 00:00:01.262	10	1	1	\N	QUEUE	\N	\N	\N	\N
2752	2018-12-29 02:11:36.329	roman.batygin@mail.ru	2018-12-29 02:14:16.173	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2018-12-29 02:14:11.205	\N	57baf95c-7f64-4c77-8d11-6a00a1550f23	2019-02-12 00:00:00.374	10	1	1	\N	QUEUE	\N	\N	\N	\N
2885	2018-12-30 14:53:05.119	roman.batygin@mail.ru	2018-12-30 14:56:23.146	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-12-30 14:55:41.055	\N	e5abc91a-45bd-4db3-ac0d-93119c2d6eca	2019-02-13 00:00:00.405	10	1	1	\N	QUEUE	\N	\N	\N	\N
2754	2018-12-29 02:11:51.451	roman.batygin@mail.ru	2018-12-29 02:22:09.302	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-12-29 02:14:17.511	\N	5c54f193-f395-424b-a6cc-2b3b4a1494ab	2019-02-12 00:00:00.429	10	1	1	\N	QUEUE	\N	\N	\N	\N
2828	2018-12-29 20:22:05.792	bat1238@yandex.ru	2018-12-29 20:23:45.424	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-12-29 20:22:20.649	\N	1261d17d-818f-483f-b495-2de7b1c657de	2019-02-12 00:00:00.807	10	1	1	\N	QUEUE	\N	\N	\N	\N
2776	2018-12-29 11:13:43.857	roman.batygin@mail.ru	2018-12-29 11:36:56.182	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-12-29 11:35:04.458	\N	eba4e0a6-c04a-4011-a06f-a5fdb5fee7a6	2019-02-12 00:00:00.551	10	1	1	\N	QUEUE	\N	\N	\N	\N
2857	2018-12-29 20:27:36.744	roman.batygin@mail.ru	2018-12-29 20:36:33.126	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-12-29 20:27:47.328	\N	780993ff-4309-4c8f-9058-ceda3b447040	2019-02-12 00:00:00.896	10	1	1	\N	QUEUE	\N	\N	\N	\N
2812	2018-12-29 20:10:08.262	bat1238@yandex.ru	2018-12-29 20:12:46.322	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-12-29 20:10:34.984	\N	aee50ca3-e207-4329-8001-2bca87765470	2019-02-12 00:00:00.63	10	1	1	\N	QUEUE	\N	\N	\N	\N
2820	2018-12-29 20:14:18.455	bat1238@yandex.ru	2018-12-29 20:19:48.99	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-12-29 20:14:19.686	\N	44930b5e-8aff-4b15-918a-0e4d2d684e4c	2019-02-12 00:00:00.718	10	1	1	\N	QUEUE	\N	\N	\N	\N
2865	2018-12-29 20:39:29.316	roman.batygin@mail.ru	2018-12-29 20:52:41.81	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-12-29 20:39:35.073	\N	ce20c83d-5e96-4c1c-a43b-fc83543b1bc1	2019-02-12 00:00:00.998	10	1	1	\N	QUEUE	\N	\N	\N	\N
2989	2018-12-31 13:21:27.409	roman.batygin@mai.ru	2018-12-31 13:24:34.275	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-12-31 13:21:38.331	\N	48ec4195-3363-486f-8ad5-cba3382a933f	2019-02-12 00:00:01.208	10	1	1	\N	QUEUE	\N	\N	\N	\N
2887	2018-12-30 14:53:16.201	roman.batygin@mail.ru	2018-12-30 14:56:53.558	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-12-30 14:56:24.349	\N	2aca7d85-4649-45a5-8424-cb240c5bc8b9	2019-02-13 00:00:00.516	10	1	1	\N	QUEUE	\N	\N	\N	\N
2928	2018-12-30 15:14:06.481	roman.batygin@mail.ru	2018-12-30 15:17:27.751	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-12-30 15:14:24.752	\N	dcb9e472-43b5-496e-9cb0-c7547b9f3aec	2019-02-13 00:00:00.628	10	1	1	\N	QUEUE	\N	\N	\N	\N
2991	2018-12-31 13:22:59.834	roman.batygin@mai.ru	2018-12-31 13:25:52.372	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-12-31 13:25:05.851	\N	558c7d2f-8e24-48da-bb49-002f35e4ba4c	2019-02-12 00:00:01.298	10	1	1	\N	QUEUE	\N	\N	\N	\N
3010	2018-12-31 13:27:17.616	roman.batygin@mai.ru	2018-12-31 13:30:54.1	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-12-31 13:30:33.842	\N	c9f77b20-5207-4b16-a288-0ba9c2597af7	2019-02-12 00:00:01.498	10	1	1	\N	QUEUE	\N	\N	\N	\N
2873	2018-12-30 14:50:49.12	roman.batygin@mail.ru	2018-12-30 14:51:16.217	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-12-30 14:50:42.964	\N	a66cac7c-5dc7-415a-a2eb-8fdc099365d2	2019-02-13 00:00:00.142	10	1	1	\N	QUEUE	\N	\N	\N	\N
2875	2018-12-30 14:50:49.007	roman.batygin@mail.ru	2018-12-30 14:54:26.865	\N	CROSS_VALIDATION	\N	FINISHED	HETEROGENEOUS_ENSEMBLE	2018-12-30 14:51:49.901	\N	5d7e60d4-e366-4ede-986c-a89b8e425c99	2019-02-13 00:00:00.238	10	1	1	\N	QUEUE	\N	\N	\N	\N
2933	2018-12-30 15:16:41.881	roman.batygin@mail.ru	2018-12-30 15:19:27.059	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-12-30 15:17:58.648	\N	32c1270b-7212-4f0e-9c65-c21da26f6830	2019-02-13 00:00:00.727	10	1	1	\N	QUEUE	\N	\N	\N	\N
2750	2018-12-29 02:11:27.503	roman.batygin@mail.ru	2018-12-29 02:13:37.054	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-12-29 02:11:32.128	\N	55c2fee2-bd71-4119-8d81-5570cfee9fe2	2019-02-12 00:00:00.237	10	1	1	\N	QUEUE	\N	\N	\N	\N
2975	2018-12-30 21:35:51.848	roman.batygin@mail.ru	2018-12-30 21:51:05.761	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2018-12-30 21:36:33.962	\N	18969954-34a5-4bef-a80b-65e7d491a088	2019-02-12 00:00:01.122	10	1	1	\N	QUEUE	\N	\N	\N	\N
3008	2018-12-31 13:26:43.078	roman.batygin@mai.ru	2018-12-31 13:30:02.736	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-12-31 13:26:53.508	\N	bb7ca36c-dbd3-4c11-84f5-84381ab144f7	2019-02-12 00:00:01.398	10	1	1	\N	QUEUE	\N	\N	\N	\N
2877	2018-12-30 14:50:56.643	roman.batygin@mail.ru	2018-12-30 14:55:09.944	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2018-12-30 14:54:28.127	\N	45800054-b061-43ec-9b55-4c8b71b63790	2019-02-13 00:00:00.316	10	1	1	\N	QUEUE	\N	\N	\N	\N
2947	2018-12-30 15:22:48.469	roman.batygin@mail.ru	2018-12-30 17:50:45.181	\N	CROSS_VALIDATION	\N	FINISHED	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-12-30 15:26:37.06	\N	42b55ed5-91d3-4f35-8800-a2644274ead6	2019-02-13 00:00:00.828	10	1	1	\N	QUEUE	\N	\N	\N	\N
2955	2018-12-30 21:31:00.45	roman.batygin@mail.ru	2018-12-30 21:36:02.787	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2018-12-30 21:31:18.853	\N	ec2d4fef-5f58-4e79-b3b8-f9a1efca4464	2019-02-13 00:00:00.927	10	1	1	\N	QUEUE	\N	\N	\N	\N
3116	2019-01-05 17:26:43.865	roman.batygin@mail.ru	2019-01-05 19:22:02.435	\N	CROSS_VALIDATION	\N	FINISHED	ADA_BOOST	2019-01-05 18:55:31.677	\N	cc7e1f54-cb4c-4a9c-839b-df48a6f6c7b2	2019-02-14 00:00:00.63	10	1	1	\N	QUEUE	\N	\N	\N	\N
3118	2019-01-05 17:50:32.988	roman.batygin@mail.ru	2019-01-05 19:30:32.801	\N	CROSS_VALIDATION	\N	FINISHED	STACKING	2019-01-05 19:22:05.393	\N	30294879-e9cf-4c2a-9f14-321b7c961fc7	2019-02-14 00:00:00.708	10	1	1	\N	QUEUE	\N	\N	\N	\N
3024	2019-01-04 03:06:52.131	roman.batygin@mail.ru	2019-01-04 03:07:09.626	\N	CROSS_VALIDATION	\N	FINISHED	DECISION_TREE	2019-01-04 03:07:00.798	\N	089c6cc6-71cd-41d5-9d11-b5db0b0c7856	2019-02-12 00:00:01.598	10	1	1	\N	QUEUE	\N	\N	\N	\N
3026	2019-01-04 03:07:05.878	roman.batygin@mail.ru	2019-01-04 03:26:52.652	\N	CROSS_VALIDATION	\N	FINISHED	NEURAL_NETWORKS	2019-01-04 03:07:41.959	\N	0210a1f2-39ed-425f-ba7e-dd25ea2a7008	2019-02-12 00:00:01.709	10	1	1	\N	QUEUE	\N	\N	\N	\N
3034	2019-01-04 03:07:31.251	roman.batygin@mail.ru	2019-01-04 03:27:10.798	\N	CROSS_VALIDATION	\N	FINISHED	DECISION_TREE	2019-01-04 03:26:54.023	\N	dad423b1-d809-4d30-9ecb-c460b2de79d3	2019-02-12 00:00:01.787	10	1	1	\N	QUEUE	\N	\N	\N	\N
3038	2019-01-04 03:07:55.841	roman.batygin@mail.ru	2019-01-04 17:49:23.662	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2019-01-04 17:49:19.877	\N	d0d09f53-da20-4afa-aa34-ccb0ad4fe082	2019-02-12 00:00:01.953	10	1	1	\N	QUEUE	\N	\N	\N	\N
3040	2019-01-04 03:08:05.017	roman.batygin@mail.ru	2019-01-04 17:49:30.22	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2019-01-04 17:49:24.855	\N	435a8826-e5fc-42d6-ac4b-5898f5900c4d	2019-02-14 00:00:00.156	10	1	1	\N	QUEUE	\N	\N	\N	\N
3042	2019-01-04 03:08:29.042	roman.batygin@mail.ru	2019-01-04 17:50:24.683	\N	CROSS_VALIDATION	\N	FINISHED	DECISION_TREE	2019-01-04 17:49:30.922	\N	a984aaca-5719-47de-9485-a1ef2173f754	2019-02-14 00:00:00.252	10	1	1	\N	QUEUE	\N	\N	\N	\N
3044	2019-01-04 03:08:37.849	roman.batygin@mail.ru	2019-01-04 17:50:32.379	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2019-01-04 17:50:25.658	\N	c6f04c75-3294-4bca-a7ea-5190179809fc	2019-02-14 00:00:00.331	10	1	1	\N	QUEUE	\N	\N	\N	\N
3120	2019-01-05 17:55:56.831	bat1238@yandex.ru	2019-01-05 19:30:59.577	\N	CROSS_VALIDATION	\N	ERROR	RANDOM_FORESTS	2019-01-05 19:30:34.043	\N	a8ba38f2-37b2-48d9-a438-4336dc69d629	2019-02-23 00:00:00.157	10	1	1	\N	QUEUE	\N	\N	\N	\N
3163	2019-01-05 19:36:15.512	roman.batygin@mail.ru	2019-01-06 08:43:59.436	\N	CROSS_VALIDATION	\N	TIMEOUT	RANDOM_FORESTS	2019-01-06 03:42:32.529	\N	3595a7e8-5d9b-4232-821b-466d1e64bd15	2019-02-23 00:00:00.166	10	1	1	\N	QUEUE	\N	\N	\N	\N
3114	2019-01-05 17:26:29.556	roman.batygin@mail.ru	2019-01-05 18:55:28.925	\N	CROSS_VALIDATION	\N	FINISHED	KNN	2019-01-05 18:54:30.873	\N	99774cf5-f57d-4ad5-b94f-3f99fed45ce9	2019-02-14 00:00:00.542	10	1	1	\N	QUEUE	\N	\N	\N	\N
2774	2018-12-29 11:13:34.458	roman.batygin@mail.ru	2018-12-29 11:30:20.142	java.lang.OutOfMemoryError: Java heap space	CROSS_VALIDATION	\N	ERROR	MODIFIED_HETEROGENEOUS_ENSEMBLE	2018-12-29 11:14:04.617	\N	dd8d1320-b6eb-4616-8d8a-a29b8df526d0	2019-02-23 00:00:00.077	10	1	1	\N	QUEUE	\N	\N	\N	\N
3088	2019-01-05 17:24:34.795	roman.batygin@mail.ru	2019-01-05 18:54:00.647	java.lang.OutOfMemoryError: GC overhead limit exceeded	CROSS_VALIDATION	\N	ERROR	HETEROGENEOUS_ENSEMBLE	2019-01-05 17:24:42.497	\N	4ce5b6d8-84d1-4457-b6c7-f56b844c4c4f	2019-02-23 00:00:00.15	10	1	1	\N	QUEUE	\N	\N	\N	\N
3214	2019-02-23 00:20:20.717	roman.batygin@mail.ru	2019-02-23 00:22:36.227	\N	CROSS_VALIDATION	\N	FINISHED	RANDOM_FORESTS	2019-02-23 00:20:21.954	\N	f3ccb2f5-8765-4895-9b61-5ca300119ea4	2019-03-24 00:00:00.077	10	1	1	\N	QUEUE	\N	\N	\N	\N
1421	2018-05-27 17:24:25.274	roman.batygin@mail.ru	2018-05-27 19:43:16.296	java.lang.OutOfMemoryError: GC overhead limit exceeded	CROSS_VALIDATION	\N	ERROR	ADA_BOOST	2018-05-27 19:43:00.968	\N	93b51e15-2f1f-4cc0-97c6-a7f4c15c3e2b	2018-06-22 00:00:01.593	10	1	1	\N	QUEUE	\N	\N	\N	\N
1420	2018-05-27 17:24:08.991	roman.batygin@mail.ru	2018-05-27 19:43:00.968	java.lang.OutOfMemoryError: GC overhead limit exceeded	CROSS_VALIDATION	\N	ERROR	STACKING	2018-05-27 19:42:45.112	\N	5d809f24-854c-478c-b91c-a84dd8b133f4	2018-06-22 00:00:01.46	10	1	1	\N	QUEUE	\N	\N	\N	\N
\.


--
-- TOC entry 2516 (class 0 OID 16518)
-- Dependencies: 210
-- Data for Name: experiment_progress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experiment_progress (id, progress, finished, experiment_id) FROM stdin;
\.


--
-- TOC entry 2518 (class 0 OID 16524)
-- Dependencies: 212
-- Data for Name: experiment_results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experiment_results (id, results_index, classifier_info_id, pct_correct, experiment_id) FROM stdin;
7308	0	7309	74.7664	2046
7313	1	7314	74.7664	2046
7318	2	7319	74.7664	2046
7323	3	7324	73.3645	2046
7328	4	7329	72.4299	2046
7333	0	7334	80.8411	2047
7344	1	7345	79.9065	2047
7355	2	7356	79.4393	2047
7366	3	7367	79.4393	2047
7375	4	7376	79.4393	2047
7384	0	7385	71.9626	2048
7390	1	7391	71.9626	2048
7396	2	7397	71.9626	2048
7402	3	7403	71.9626	2048
7408	4	7409	70.0935	2048
7414	0	7415	79.9065	2049
7422	1	7423	79.9065	2049
7431	2	7432	79.9065	2049
7439	3	7440	79.9065	2049
7448	4	7449	79.9065	2049
7456	0	7457	79.4393	2055
7467	1	7468	79.4393	2055
7478	2	7479	79.4393	2055
7489	3	7490	78.9720	2055
7500	4	7501	78.9720	2055
7511	0	7512	78.5047	2081
7524	1	7525	78.5047	2081
7536	2	7537	78.5047	2081
7548	3	7549	78.5047	2081
7560	4	7561	78.5047	2081
7573	0	7574	71.0280	2082
7580	1	7581	71.0280	2082
7587	2	7588	71.0280	2082
7595	3	7596	71.0280	2082
7602	4	7603	71.0280	2082
7610	0	7611	79.4393	2095
7622	1	7623	79.4393	2095
7635	2	7636	79.4393	2095
7647	3	7648	79.4393	2095
7659	4	7660	79.4393	2095
7672	0	7673	73.3645	2102
7688	1	7689	71.9626	2102
7704	2	7705	71.9626	2102
7720	3	7721	71.4953	2102
7736	4	7737	71.0280	2102
7752	0	7753	72.5806	2153
7768	1	7769	72.5806	2153
7784	2	7785	72.5806	2153
7800	3	7801	71.7742	2153
7816	4	7817	70.9677	2153
7832	0	7833	73.3871	2155
7845	1	7846	73.3871	2155
7858	2	7859	73.3871	2155
7871	3	7872	73.3871	2155
7882	4	7883	73.3871	2155
7893	0	7894	73.3871	2157
7907	1	7908	73.3871	2157
7918	2	7919	73.3871	2157
7929	3	7930	73.3871	2157
7942	4	7943	73.3871	2157
7955	0	7956	75.0000	2159
7963	1	7964	74.1935	2159
7972	2	7973	74.1935	2159
7981	3	7982	74.1935	2159
7991	4	7992	74.1935	2159
7999	0	8000	73.3871	2161
8005	1	8006	73.3871	2161
8011	2	8012	73.3871	2161
8017	3	8018	73.3871	2161
8023	4	8024	73.3871	2161
8030	0	8031	74.1935	2163
8039	1	8040	73.3871	2163
8048	2	8049	73.3871	2163
8057	3	8058	73.3871	2163
8066	4	8067	73.3871	2163
8075	0	8076	73.3871	2165
8086	1	8087	73.3871	2165
8097	2	8098	73.3871	2165
8108	3	8109	73.3871	2165
8119	4	8120	73.3871	2165
8128	0	8129	74.1935	2167
8139	1	8140	74.1935	2167
8148	2	8149	73.3871	2167
8159	3	8160	73.3871	2167
8170	4	8171	73.3871	2167
8181	0	8182	89.4587	2225
8186	1	8187	89.1738	2225
8191	2	8192	89.1738	2225
8196	3	8197	89.1738	2225
8201	4	8202	89.1738	2225
8206	0	8207	94.5869	2227
8217	1	8218	94.5869	2227
8228	2	8229	94.3020	2227
8239	3	8240	94.3020	2227
8250	4	8251	94.3020	2227
8261	0	8262	93.1624	2229
8272	1	8273	93.1624	2229
8283	2	8284	93.1624	2229
8294	3	8295	93.1624	2229
8305	4	8306	93.1624	2229
8317	0	8318	94.5869	2249
8324	1	8325	94.5869	2249
8332	2	8333	94.5869	2249
8339	3	8340	93.7322	2249
8347	4	8348	93.7322	2249
8355	0	8356	91.4530	2251
8361	1	8362	91.4530	2251
8367	2	8368	91.4530	2251
8374	3	8375	91.4530	2251
8381	4	8382	91.4530	2251
8388	0	8389	94.8718	2265
8399	1	8400	94.3020	2265
8410	2	8411	94.3020	2265
8421	3	8422	94.0171	2265
8432	4	8433	94.0171	2265
8443	0	8444	93.1624	2267
8456	1	8457	93.1624	2267
8469	2	8470	93.1624	2267
8480	3	8481	93.1624	2267
8491	4	8492	93.1624	2267
8502	0	8503	92.8775	2313
8518	1	8519	92.3077	2313
8534	2	8535	92.0228	2313
8550	3	8551	91.4530	2313
8566	4	8567	90.5983	2313
8582	0	8583	94.5869	2321
8593	1	8594	94.3020	2321
8604	2	8605	94.3020	2321
8615	3	8616	94.3020	2321
8626	4	8627	94.3020	2321
8637	0	8638	94.3020	2323
8648	1	8649	94.3020	2323
8659	2	8660	94.3020	2323
8670	3	8671	94.3020	2323
8681	4	8682	94.3020	2323
8692	0	8693	75.5208	2352
8697	1	8698	74.7396	2352
8702	2	8703	74.7396	2352
8707	3	8708	74.6094	2352
8712	4	8713	74.6094	2352
8717	0	8718	78.3854	2366
8729	1	8730	78.2552	2366
8742	2	8743	78.2552	2366
8754	3	8755	78.1250	2366
8767	4	8768	78.1250	2366
8780	0	8781	77.0833	2377
8787	1	8788	75.6510	2377
8794	2	8795	74.0885	2377
8802	3	8803	73.0469	2377
8810	4	8811	72.9167	2377
8817	0	8818	75.4000	2499
8829	1	8830	75.4000	2499
8841	2	8842	74.7000	2499
8852	3	8853	74.7000	2499
8863	4	8864	74.6000	2499
8876	0	8877	69.5804	2691
8883	1	8884	69.5804	2691
8891	2	8892	69.5804	2691
8900	3	8901	68.8811	2691
8907	4	8908	68.5315	2691
8916	0	8917	71.0280	2548
8924	1	8925	70.0935	2548
8932	2	8933	70.0935	2548
8940	3	8941	70.0935	2548
8948	4	8949	70.0935	2548
8956	0	8957	76.1682	2556
8967	1	8968	74.7664	2556
8976	2	8977	74.2991	2556
8987	3	8988	74.2991	2556
8996	4	8997	73.8318	2556
9007	0	9008	76.1682	2558
9018	1	9019	76.1682	2558
9029	2	9030	75.7009	2558
9040	3	9041	75.7009	2558
9049	4	9050	75.2336	2558
9060	0	9061	75.5245	2651
9069	1	9070	75.5245	2651
9080	2	9081	75.1748	2651
9089	3	9090	75.1748	2651
9100	4	9101	74.4755	2651
9111	0	9112	76.9231	2653
9125	1	9126	76.5734	2653
9137	2	9138	76.5734	2653
9149	3	9150	76.2238	2653
9161	4	9162	76.2238	2653
9173	0	9174	75.5245	2655
9179	1	9180	75.5245	2655
9185	2	9186	75.5245	2655
9191	3	9192	75.5245	2655
9197	4	9198	75.1748	2655
9204	0	9205	77.9720	2693
9216	1	9217	77.6224	2693
9229	2	9230	77.2727	2693
9241	3	9242	76.9231	2693
9253	4	9254	76.5734	2693
9265	0	9266	93.1624	2399
9278	1	9279	93.1624	2399
9291	2	9292	93.1624	2399
9302	3	9303	93.1624	2399
9313	4	9314	93.1624	2399
9324	0	9325	75.5245	2695
9340	1	9341	75.5245	2695
9356	2	9357	75.1748	2695
9372	3	9373	75.1748	2695
9388	4	9389	74.8252	2695
9404	0	9405	78.9720	2720
9415	1	9416	78.9720	2720
9426	2	9427	78.9720	2720
9435	3	9436	78.5047	2720
9446	4	9447	78.5047	2720
9457	0	9458	78.3854	2407
9469	1	9470	78.3854	2407
9481	2	9482	78.3854	2407
9492	3	9493	78.3854	2407
9503	4	9504	78.2552	2407
9515	0	9516	77.3438	2423
9531	1	9532	77.0833	2423
9547	2	9548	77.0833	2423
9563	3	9564	76.9531	2423
9579	4	9580	76.6927	2423
9595	0	9596	77.6042	2382
9602	1	9603	77.6042	2382
9608	2	9609	77.6042	2382
9614	3	9615	77.6042	2382
9620	4	9621	77.6042	2382
9626	0	9627	75.0000	2431
9631	1	9632	75.0000	2431
9636	2	9637	74.7000	2431
9641	3	9642	74.6000	2431
9646	4	9647	74.6000	2431
9651	0	9652	75.3000	2439
9657	1	9658	75.3000	2439
9663	2	9664	75.2000	2439
9669	3	9670	75.2000	2439
9675	4	9676	74.8000	2439
9684	0	9685	74.9000	2441
9691	1	9692	73.9000	2441
9699	2	9700	73.9000	2441
9707	3	9708	73.9000	2441
9716	4	9717	73.6000	2441
9725	0	9726	76.5000	2491
9738	1	9739	76.5000	2491
9751	2	9752	76.5000	2491
9764	3	9765	76.5000	2491
9777	4	9778	76.4000	2491
9789	0	9790	77.0833	2582
9798	1	9799	76.9531	2582
9809	2	9810	76.9531	2582
9820	3	9821	76.6927	2582
9829	4	9830	76.6927	2582
9840	0	9841	76.9531	2584
9848	1	9849	76.9531	2584
9856	2	9857	76.9531	2584
9864	3	9865	76.9531	2584
9872	4	9873	76.8229	2584
9880	0	9881	75.1748	2657
9885	1	9886	74.8252	2657
9890	2	9891	74.8252	2657
9895	3	9896	74.8252	2657
9900	4	9901	74.8252	2657
9905	0	9906	75.5245	2659
9914	1	9915	75.1748	2659
9925	2	9926	74.8252	2659
9934	3	9935	74.8252	2659
9943	4	9944	74.8252	2659
9954	0	9955	74.7664	2752
9959	1	9960	74.7664	2752
9964	2	9965	73.8318	2752
9969	3	9970	73.8318	2752
9974	4	9975	73.8318	2752
9979	0	9980	75.0000	2885
9987	1	9988	74.1935	2885
9996	2	9997	74.1935	2885
10005	3	10006	74.1935	2885
10015	4	10016	74.1935	2885
10023	0	10024	78.5047	2754
10035	1	10036	78.5047	2754
10047	2	10048	78.5047	2754
10059	3	10060	78.5047	2754
10072	4	10073	78.5047	2754
10085	0	10086	79.9065	2828
10096	1	10097	78.9720	2828
10107	2	10108	78.5047	2828
10116	3	10117	78.5047	2828
10125	4	10126	78.0374	2828
10134	0	10135	79.4393	2776
10145	1	10146	78.5047	2776
10156	2	10157	78.5047	2776
10167	3	10168	78.5047	2776
10176	4	10177	77.5701	2776
10185	0	10186	75.8741	2857
10196	1	10197	75.5245	2857
10207	2	10208	74.8252	2857
10216	3	10217	74.8252	2857
10227	4	10228	74.8252	2857
10238	0	10239	79.9065	2812
10246	1	10247	79.9065	2812
10254	2	10255	79.9065	2812
10262	3	10263	79.9065	2812
10271	4	10272	79.9065	2812
10280	0	10281	79.4393	2820
10292	1	10293	79.4393	2820
10304	2	10305	79.4393	2820
10316	3	10317	79.4393	2820
10329	4	10330	79.4393	2820
10342	0	10343	76.9231	2865
10356	1	10357	76.5734	2865
10368	2	10369	76.5734	2865
10380	3	10381	76.2238	2865
10392	4	10393	76.2238	2865
10404	0	10405	93.1624	2989
10415	1	10416	93.1624	2989
10426	2	10427	93.1624	2989
10437	3	10438	93.1624	2989
10448	4	10449	93.1624	2989
10460	0	10461	73.3871	2887
10466	1	10467	73.3871	2887
10472	2	10473	73.3871	2887
10478	3	10479	73.3871	2887
10484	4	10485	73.3871	2887
10491	0	10492	73.3871	2928
10505	1	10506	73.3871	2928
10516	2	10517	73.3871	2928
10527	3	10528	73.3871	2928
10540	4	10541	73.3871	2928
10553	0	10554	94.5869	2991
10560	1	10561	94.5869	2991
10567	2	10568	94.5869	2991
10575	3	10576	93.7322	2991
10583	4	10584	93.7322	2991
10591	0	10592	91.4530	3010
10597	1	10598	91.4530	3010
10603	2	10604	91.4530	3010
10610	3	10611	91.4530	3010
10617	4	10618	91.4530	3010
10624	0	10625	73.3871	2873
10633	1	10634	73.3871	2873
10642	2	10643	73.3871	2873
10651	3	10652	73.3871	2873
10660	4	10661	73.3871	2873
10669	0	10670	73.3871	2875
10682	1	10683	73.3871	2875
10695	2	10696	73.3871	2875
10708	3	10709	73.3871	2875
10719	4	10720	73.3871	2875
10730	0	10731	79.4393	2933
10741	1	10742	78.5047	2933
10750	2	10751	78.0374	2933
10759	3	10760	77.5701	2933
10770	4	10771	77.5701	2933
10779	0	10780	78.5047	2750
10790	1	10791	78.0374	2750
10801	2	10802	77.5701	2750
10810	3	10811	77.5701	2750
10819	4	10820	77.5701	2750
10830	0	10831	93.7322	2975
10839	1	10840	93.7322	2975
10850	2	10851	93.4473	2975
10859	3	10860	93.4473	2975
10868	4	10869	93.4473	2975
10877	0	10878	93.1624	3008
10890	1	10891	93.1624	3008
10903	2	10904	93.1624	3008
10914	3	10915	93.1624	3008
10925	4	10926	93.1624	3008
10936	0	10937	75.0000	2877
10944	1	10945	74.1935	2877
10953	2	10954	74.1935	2877
10962	3	10963	74.1935	2877
10972	4	10973	74.1935	2877
10980	0	10981	77.9720	2947
10992	1	10993	77.6224	2947
11005	2	11006	77.2727	2947
11017	3	11018	76.9231	2947
11029	4	11030	76.5734	2947
11041	0	11042	75.5245	2955
11047	1	11048	75.5245	2955
11053	2	11054	75.5245	2955
11059	3	11060	75.5245	2955
11065	4	11066	75.1748	2955
11072	0	11073	74.9000	3116
11079	1	11080	73.9000	3116
11087	2	11088	73.9000	3116
11095	3	11096	73.9000	3116
11104	4	11105	73.6000	3116
11113	0	11114	75.3000	3118
11119	1	11120	75.3000	3118
11125	2	11126	75.2000	3118
11131	3	11132	75.2000	3118
11137	4	11138	74.8000	3118
11146	0	11147	72.0280	3024
11154	1	11155	72.0280	3024
11162	2	11163	72.0280	3024
11170	3	11171	71.6783	3024
11178	4	11179	71.6783	3024
11186	0	11187	75.5245	3026
11202	1	11203	75.1748	3026
11218	2	11219	74.4755	3026
11234	3	11235	74.4755	3026
11250	4	11251	74.1259	3026
11266	0	11267	71.0280	3034
11274	1	11275	70.0935	3034
11282	2	11283	70.0935	3034
11290	3	11291	69.6262	3034
11298	4	11299	69.1589	3034
11306	0	11307	74.2991	3036
11322	1	11323	74.2991	3036
11338	2	11339	73.3645	3036
11354	3	11355	72.4299	3036
11370	4	11371	71.9626	3036
11386	0	11387	74.7664	3038
11391	1	11392	74.7664	3038
11396	2	11397	74.7664	3038
11401	3	11402	74.2991	3038
11406	4	11407	73.8318	3038
11411	0	11412	75.1748	3040
11416	1	11417	75.1748	3040
11421	2	11422	74.8252	3040
11426	3	11427	74.4755	3040
11431	4	11432	74.4755	3040
11436	0	11437	90.8832	3042
11444	1	11445	90.8832	3042
11452	2	11453	90.8832	3042
11460	3	11461	90.5983	3042
11468	4	11469	90.3134	3042
11476	0	11477	90.8832	3044
11481	1	11482	89.4587	3044
11486	2	11487	89.1738	3044
11491	3	11492	89.1738	3044
11496	4	11497	89.1738	3044
11501	0	11502	74.7000	3114
11506	1	11507	74.7000	3114
11511	2	11512	74.7000	3114
11516	3	11517	74.6000	3114
11521	4	11522	74.6000	3114
11526	0	11527	78.9720	3214
11535	1	11536	78.9720	3214
11546	2	11547	78.5047	3214
11557	3	11558	78.0374	3214
11566	4	11567	78.0374	3214
\.


--
-- TOC entry 2520 (class 0 OID 16529)
-- Dependencies: 214
-- Data for Name: experiment_results_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experiment_results_request (id, request_source, experiment_results_id) FROM stdin;
2054	SYSTEM	7318
2051	SYSTEM	7323
2052	SYSTEM	7328
2056	SYSTEM	7333
2057	SYSTEM	7355
2060	SYSTEM	7366
2058	SYSTEM	7375
2061	SYSTEM	7384
2063	SYSTEM	7396
2064	SYSTEM	7402
2065	SYSTEM	7408
2066	SYSTEM	7414
2068	SYSTEM	7431
2069	SYSTEM	7439
2070	SYSTEM	7448
2074	SYSTEM	7456
2071	SYSTEM	7478
2072	SYSTEM	7489
2075	SYSTEM	7500
2083	SYSTEM	7511
2085	SYSTEM	7536
2086	SYSTEM	7548
2087	SYSTEM	7560
2089	SYSTEM	7573
2091	SYSTEM	7587
2092	SYSTEM	7595
2093	SYSTEM	7602
2097	SYSTEM	7610
2099	SYSTEM	7635
2100	SYSTEM	7647
2101	SYSTEM	7659
2107	SYSTEM	7672
2106	SYSTEM	7704
2108	SYSTEM	7720
2105	SYSTEM	7736
2174	SYSTEM	7752
2171	SYSTEM	7784
2173	SYSTEM	7800
2172	SYSTEM	7816
2177	SYSTEM	7832
2179	SYSTEM	7858
2175	SYSTEM	7871
2178	SYSTEM	7882
2182	SYSTEM	7893
2184	SYSTEM	7918
2183	SYSTEM	7929
2181	SYSTEM	7942
2187	SYSTEM	7955
2186	SYSTEM	7972
2188	SYSTEM	7981
2189	SYSTEM	7991
2191	SYSTEM	7999
2192	SYSTEM	8011
2193	SYSTEM	8017
2194	SYSTEM	8023
2196	SYSTEM	8030
2195	SYSTEM	8048
2199	SYSTEM	8057
2198	SYSTEM	8066
2200	SYSTEM	8075
2203	SYSTEM	8097
2202	SYSTEM	8108
2201	SYSTEM	8119
2206	SYSTEM	8128
2207	SYSTEM	8148
2209	SYSTEM	8159
2208	SYSTEM	8170
2233	SYSTEM	8181
2232	SYSTEM	8191
2234	SYSTEM	8196
2231	SYSTEM	8201
2237	SYSTEM	8206
2240	SYSTEM	8228
2236	SYSTEM	8239
2238	SYSTEM	8250
2242	SYSTEM	8261
2244	SYSTEM	8283
2245	SYSTEM	8294
2246	SYSTEM	8305
2253	SYSTEM	8317
2256	SYSTEM	8332
2254	SYSTEM	8339
2257	SYSTEM	8347
2259	SYSTEM	8355
2261	SYSTEM	8367
2262	SYSTEM	8374
2263	SYSTEM	8381
2272	SYSTEM	8388
2274	SYSTEM	8410
2273	SYSTEM	8421
2270	SYSTEM	8432
2299	SYSTEM	8443
2297	SYSTEM	8469
2298	SYSTEM	8480
2301	SYSTEM	8491
2320	SYSTEM	8502
2317	SYSTEM	8534
2319	SYSTEM	8550
2316	SYSTEM	8566
2351	SYSTEM	8582
2347	SYSTEM	8604
2348	SYSTEM	8615
2349	SYSTEM	8626
2358	SYSTEM	8637
2357	SYSTEM	8659
2359	SYSTEM	8670
2355	SYSTEM	8681
2365	SYSTEM	8692
2364	SYSTEM	8702
2361	SYSTEM	8707
2363	SYSTEM	8712
2369	SYSTEM	8717
2372	SYSTEM	8742
2373	SYSTEM	8754
2370	SYSTEM	8767
2390	SYSTEM	8780
2392	SYSTEM	8794
2388	SYSTEM	8802
2389	SYSTEM	8810
2402	SYSTEM	9265
2396	SYSTEM	9595
2398	SYSTEM	9602
2394	SYSTEM	9608
2397	SYSTEM	9614
2505	SYSTEM	8841
2503	SYSTEM	8852
2506	SYSTEM	8863
2700	SYSTEM	8876
2702	SYSTEM	8891
2701	SYSTEM	8900
2699	SYSTEM	8907
2551	SYSTEM	8916
2552	SYSTEM	8932
2554	SYSTEM	8940
2550	SYSTEM	8948
2562	SYSTEM	8956
2563	SYSTEM	8976
2565	SYSTEM	8987
2564	SYSTEM	8996
2566	SYSTEM	9007
2569	SYSTEM	9029
2568	SYSTEM	9040
2570	SYSTEM	9049
2666	SYSTEM	9060
2664	SYSTEM	9080
2665	SYSTEM	9089
2662	SYSTEM	9100
2671	SYSTEM	9111
2669	SYSTEM	9137
2668	SYSTEM	9149
2670	SYSTEM	9161
2676	SYSTEM	9173
2673	SYSTEM	9185
2674	SYSTEM	9191
2675	SYSTEM	9197
2707	SYSTEM	9204
2704	SYSTEM	9229
2705	SYSTEM	9241
2706	SYSTEM	9253
2405	SYSTEM	9278
2406	SYSTEM	9313
2712	SYSTEM	9324
2709	SYSTEM	9340
2708	SYSTEM	9356
2710	SYSTEM	9388
2724	SYSTEM	9404
2726	SYSTEM	9415
2723	SYSTEM	9426
2727	SYSTEM	9446
2414	SYSTEM	9457
2413	SYSTEM	9469
2411	SYSTEM	9481
2412	SYSTEM	9503
2430	SYSTEM	9515
2429	SYSTEM	9531
2428	SYSTEM	9547
2426	SYSTEM	9579
2437	SYSTEM	9626
2436	SYSTEM	9631
2435	SYSTEM	9636
2438	SYSTEM	9646
2444	SYSTEM	9651
2448	SYSTEM	9657
2447	SYSTEM	9663
2446	SYSTEM	9675
2452	SYSTEM	9684
2450	SYSTEM	9691
2453	SYSTEM	9699
2451	SYSTEM	9716
2496	SYSTEM	9725
2495	SYSTEM	9738
2498	SYSTEM	9751
2497	SYSTEM	9777
2588	SYSTEM	9789
2587	SYSTEM	9798
2590	SYSTEM	9809
2586	SYSTEM	9829
2595	SYSTEM	9840
2591	SYSTEM	9848
2593	SYSTEM	9856
2592	SYSTEM	9872
2677	SYSTEM	9880
2678	SYSTEM	9885
2679	SYSTEM	9890
2680	SYSTEM	9900
2683	SYSTEM	9905
2684	SYSTEM	9914
2682	SYSTEM	9925
2686	SYSTEM	9943
2762	SYSTEM	9954
2763	SYSTEM	9959
2764	SYSTEM	9964
2766	SYSTEM	9974
2767	SYSTEM	10023
2768	SYSTEM	10035
2769	SYSTEM	10047
2771	SYSTEM	10072
2838	SYSTEM	10085
2839	SYSTEM	10096
2840	SYSTEM	10107
2842	SYSTEM	10125
2779	SYSTEM	10134
2780	SYSTEM	10145
2781	SYSTEM	10156
2783	SYSTEM	10176
2859	SYSTEM	10185
2860	SYSTEM	10196
2861	SYSTEM	10207
2863	SYSTEM	10227
2814	SYSTEM	10238
2815	SYSTEM	10246
2816	SYSTEM	10254
2818	SYSTEM	10271
2822	SYSTEM	10280
2823	SYSTEM	10292
2824	SYSTEM	10304
2826	SYSTEM	10329
2867	SYSTEM	10342
2868	SYSTEM	10356
2869	SYSTEM	10368
2871	SYSTEM	10392
2879	SYSTEM	10624
2880	SYSTEM	10633
2881	SYSTEM	10642
2756	SYSTEM	10779
2757	SYSTEM	10790
2758	SYSTEM	10801
2759	SYSTEM	10810
2050	SYSTEM	7308
2053	SYSTEM	7313
2059	SYSTEM	7344
2062	SYSTEM	7390
2067	SYSTEM	7422
2073	SYSTEM	7467
2084	SYSTEM	7524
2090	SYSTEM	7580
2098	SYSTEM	7622
2104	SYSTEM	7688
2170	SYSTEM	7768
2176	SYSTEM	7845
2180	SYSTEM	7907
2185	SYSTEM	7963
2190	SYSTEM	8005
2197	SYSTEM	8039
2204	SYSTEM	8086
2210	SYSTEM	8139
2235	SYSTEM	8186
2239	SYSTEM	8217
2243	SYSTEM	8272
2255	SYSTEM	8324
2260	SYSTEM	8361
2271	SYSTEM	8399
2300	SYSTEM	8456
2318	SYSTEM	8518
2902	SYSTEM	9987
2903	SYSTEM	9996
2904	SYSTEM	10005
2905	SYSTEM	10015
2997	SYSTEM	10415
2998	SYSTEM	10426
2999	SYSTEM	10437
3000	SYSTEM	10448
2907	SYSTEM	10466
2908	SYSTEM	10472
2909	SYSTEM	10478
2910	SYSTEM	10484
2936	SYSTEM	10505
2937	SYSTEM	10516
2938	SYSTEM	10527
2939	SYSTEM	10540
3003	SYSTEM	10560
3004	SYSTEM	10567
3005	SYSTEM	10575
3006	SYSTEM	10583
3019	SYSTEM	10597
3020	SYSTEM	10603
3021	SYSTEM	10610
3022	SYSTEM	10617
2889	SYSTEM	10669
2890	SYSTEM	10682
2891	SYSTEM	10695
2892	SYSTEM	10708
2941	SYSTEM	10730
2942	SYSTEM	10741
2943	SYSTEM	10750
2944	SYSTEM	10759
2983	SYSTEM	10830
2984	SYSTEM	10839
2985	SYSTEM	10850
2986	SYSTEM	10859
3012	SYSTEM	10877
3013	SYSTEM	10890
3014	SYSTEM	10903
3015	SYSTEM	10914
2894	SYSTEM	10936
2895	SYSTEM	10944
2896	SYSTEM	10953
2897	SYSTEM	10962
2949	SYSTEM	10980
2950	SYSTEM	10992
2951	SYSTEM	11005
2952	SYSTEM	11017
2977	SYSTEM	11041
2978	SYSTEM	11047
2979	SYSTEM	11053
2980	SYSTEM	11059
3148	SYSTEM	11072
3149	SYSTEM	11079
3150	SYSTEM	11087
3151	SYSTEM	11095
3154	SYSTEM	11113
3155	SYSTEM	11119
3156	SYSTEM	11125
3157	SYSTEM	11131
3028	SYSTEM	11146
3029	SYSTEM	11154
3030	SYSTEM	11162
3031	SYSTEM	11170
3046	SYSTEM	11186
3047	SYSTEM	11202
3048	SYSTEM	11218
3049	SYSTEM	11234
3051	SYSTEM	11266
3052	SYSTEM	11274
3053	SYSTEM	11282
3054	SYSTEM	11290
3058	SYSTEM	11306
3059	SYSTEM	11322
3060	SYSTEM	11338
3061	SYSTEM	11354
3063	SYSTEM	11386
3064	SYSTEM	11391
3065	SYSTEM	11396
3066	SYSTEM	11401
3068	SYSTEM	11411
3069	SYSTEM	11416
3070	SYSTEM	11421
3071	SYSTEM	11426
3073	SYSTEM	11436
3074	SYSTEM	11444
3075	SYSTEM	11452
3076	SYSTEM	11460
3078	SYSTEM	11476
3079	SYSTEM	11481
3080	SYSTEM	11486
3081	SYSTEM	11491
3123	SYSTEM	11501
3124	SYSTEM	11506
3125	SYSTEM	11511
3126	SYSTEM	11516
3216	SYSTEM	11526
3217	SYSTEM	11535
3218	SYSTEM	11546
3219	SYSTEM	11557
2350	SYSTEM	8593
2356	SYSTEM	8648
2362	SYSTEM	8697
2371	SYSTEM	8729
2391	SYSTEM	8787
2504	SYSTEM	8817
2502	SYSTEM	8829
2698	SYSTEM	8883
2553	SYSTEM	8924
2561	SYSTEM	8967
2571	SYSTEM	9018
2663	SYSTEM	9069
2667	SYSTEM	9125
2672	SYSTEM	9179
2703	SYSTEM	9216
2404	SYSTEM	9291
2403	SYSTEM	9302
2711	SYSTEM	9372
2725	SYSTEM	9435
2410	SYSTEM	9492
2427	SYSTEM	9563
2395	SYSTEM	9620
2434	SYSTEM	9641
2445	SYSTEM	9669
2454	SYSTEM	9707
2494	SYSTEM	9764
2589	SYSTEM	9820
2594	SYSTEM	9864
2681	SYSTEM	9895
2685	SYSTEM	9934
2765	SYSTEM	9969
2901	SYSTEM	9979
2770	SYSTEM	10059
2841	SYSTEM	10116
2782	SYSTEM	10167
2862	SYSTEM	10216
2817	SYSTEM	10262
2825	SYSTEM	10316
2870	SYSTEM	10380
2996	SYSTEM	10404
2906	SYSTEM	10460
2935	SYSTEM	10491
3002	SYSTEM	10553
3018	SYSTEM	10591
2882	SYSTEM	10651
2883	SYSTEM	10660
2893	SYSTEM	10719
2945	SYSTEM	10770
2760	SYSTEM	10819
2987	SYSTEM	10868
3016	SYSTEM	10925
2898	SYSTEM	10972
2953	SYSTEM	11029
2981	SYSTEM	11065
3152	SYSTEM	11104
3158	SYSTEM	11137
3032	SYSTEM	11178
3050	SYSTEM	11250
3055	SYSTEM	11298
3062	SYSTEM	11370
3067	SYSTEM	11406
3072	SYSTEM	11431
3077	SYSTEM	11468
3082	SYSTEM	11496
3127	SYSTEM	11521
3220	SYSTEM	11566
\.


--
-- TOC entry 2551 (class 0 OID 17631)
-- Dependencies: 245
-- Data for Name: experiment_step; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experiment_step (id, step, status, step_order, created, started, completed, error_message, num_failed_attempts, experiment_id) FROM stdin;
\.


--
-- TOC entry 2522 (class 0 OID 16534)
-- Dependencies: 216
-- Data for Name: filter_dictionary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filter_dictionary (id, name) FROM stdin;
1	evaluationMethod
2	requestStatus
3	experimentType
4	ersResponseStatus
5	classifier
6	classifiersConfigurationActionType
\.


--
-- TOC entry 2524 (class 0 OID 16539)
-- Dependencies: 218
-- Data for Name: filter_dictionary_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filter_dictionary_value (id, label, value, filter_dictionary_id) FROM stdin;
2	Использование обучающего множества	TRAINING_DATA	1
3	V-блочная кросс-проверка	CROSS_VALIDATION	1
5	Новая	NEW	2
6	Завершена	FINISHED	2
7	Ошибка	ERROR	2
8	Таймаут	TIMEOUT	2
10	Нейронные сети	NEURAL_NETWORKS	3
13	Алгоритм AdaBoost	ADA_BOOST	3
14	Алгоритм Stacking	STACKING	3
16	Случайные леса	RANDOM_FORESTS	3
17	Алгоритм Stacking CV	STACKING_CV	3
18	Деревья решений	DECISION_TREE	3
20	Успешно	SUCCESS	4
22	Заявка с таким UUID уже существует	DUPLICATE_REQUEST_ID	4
23	Ошибка	ERROR	4
25	Не найдена обучающая выборка	DATA_NOT_FOUND	4
26	Не найдены оптимальные конфигурации моделей	RESULTS_NOT_FOUND	4
11	Неоднородный ансамбль	HETEROGENEOUS_ENSEMBLE	3
12	Мод. неоднородный ансамбль	MODIFIED_HETEROGENEOUS_ENSEMBLE	3
15	Алгоритм KNN	KNN	3
27	В работе	IN_PROGRESS	2
28	Алгоритм CART	CART	5
29	Алгоритм C4.5	C45	5
30	Алгоритм ID3	ID3	5
31	Алгоритм CHAID	CHAID	5
32	Алгоритм J48	J48	5
33	Нейронная сеть (Многослойный персептрон)	NeuralNetwork	5
34	Алгоритм k - взвешенных ближайших соседей	KNearestNeighbours	5
35	Логистическая регрессия	Logistic	5
36	Алгоритм AdaBoost	AdaBoostClassifier	5
37	Неоднородный ансамблевый алгоритм	HeterogeneousClassifier	5
38	Модифицированный неоднородный ансамблевый алгоритм	ModifiedHeterogeneousClassifier	5
39	Алгоритм Stacking	StackingClassifier	5
40	Алгоритм Случайные леса	RandomForests	5
41	Алгоритм Extra trees	ExtraTreesClassifier	5
42	Алгоритм Случайные сети	RandomNetworks	5
43	Создана новая конфигурация	CREATE_CONFIGURATION	6
44	Данные конфигурации изменены	UPDATE_CONFIGURATION	6
45	Конфигурация сделана активной	SET_ACTIVE	6
46	Конфигурация перестала быть активной	DEACTIVATE	6
47	Добавлены новые настройки классификатора	ADD_CLASSIFIER_OPTIONS	6
48	Удалены настройки классификатора	REMOVE_CLASSIFIER_OPTIONS	6
\.


--
-- TOC entry 2526 (class 0 OID 16547)
-- Dependencies: 220
-- Data for Name: filter_field; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filter_field (id, field_name, description, field_order, filter_field_type, match_mode, filter_template_id, filter_dictionary_id, multiple) FROM stdin;
2	email	Email заявки	1	TEXT	LIKE	1	\N	f
10	requestId	UUID заявки	0	TEXT	LIKE	2	\N	f
16	requestId	UUID заявки	0	TEXT	LIKE	3	\N	f
17	relationName	Обучающая выборка	1	TEXT	LIKE	3	\N	f
18	evaluationMethod	Метод оценки точности	2	REFERENCE	EQUALS	3	1	f
19	responseStatus	Статус ответа от ERS	3	REFERENCE	EQUALS	3	4	f
22	instancesInfo.relationName	Обучающая выборка	2	TEXT	LIKE	2	\N	f
12	evaluationMethod	Метод оценки точности	3	REFERENCE	EQUALS	2	1	f
14	creationDate	Дата создания заявки	5	DATE	RANGE	2	\N	t
20	requestDate	Дата отправки запроса в ERS	4	DATE	RANGE	3	\N	t
13	requestStatus	Статус заявки	4	REFERENCE	EQUALS	2	2	f
1	requestId	UUID заявки	0	TEXT	LIKE	1	\N	f
11	classifierInfo.classifierName	Классификатор	1	REFERENCE	EQUALS	2	5	t
23	createdBy	Пользователь	0	TEXT	LIKE	4	\N	f
24	actionType	Тип события	1	REFERENCE	EQUALS	4	6	t
25	createdAt	Дата события	2	DATE	RANGE	4	\N	t
3	evaluationMethod	Метод оценки точности	3	REFERENCE	EQUALS	1	1	f
6	creationDate	Дата создания заявки	6	DATE	RANGE	1	\N	t
5	experimentType	Тип эксперимента	5	REFERENCE	EQUALS	1	3	t
4	requestStatus	Статус заявки	4	REFERENCE	EQUALS	1	2	f
26	instancesInfo.relationName	Обучающая выборка	2	TEXT	LIKE	1	\N	f
\.


--
-- TOC entry 2528 (class 0 OID 16556)
-- Dependencies: 222
-- Data for Name: filter_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filter_template (id, template_name, template_type, created) FROM stdin;
1	Фильтр экспериментов	EXPERIMENT	2018-12-29 02:08:41.102437
2	Фильтр классификаторов	EVALUATION_LOG	2018-12-29 02:08:41.243802
3	Фильтр оптимальных настроек классификаторов	CLASSIFIER_OPTIONS_REQUEST	2018-12-29 02:08:41.329406
4	Фильтр истории конфигурации классификаторов	CLASSIFIERS_CONFIGURATION_HISTORY	2022-12-09 13:05:26.093813
\.


--
-- TOC entry 2544 (class 0 OID 17547)
-- Dependencies: 238
-- Data for Name: form_field; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_field (id, field_name, description, field_order, field_type, min_value, min_inclusive, max_value, max_inclusive, max_length, pattern, invalid_pattern_message, place_holder, template_id, dictionary_id, default_value, read_only) FROM stdin;
1	numNeighbours	Число ближайших соседей	0	INTEGER	1.00	t	2147483647.00	t	255	\N	\N	\N	1	\N	10	f
2	weight	Вес ближайшего соседа	1	DECIMAL	0.50	t	1.00	t	255	\N	\N	\N	1	\N	1	f
3	distanceType	Функция расстояния	2	REFERENCE	\N	t	\N	t	\N	\N	\N	\N	1	1	EUCLID	f
4	maxIts	Максимальное число итераций	0	INTEGER	1.00	t	2147483647.00	t	255	\N	\N	\N	2	\N	200	f
5	useConjugateGradientDescent	Использовать метод сопряженных градиентов	1	BOOLEAN	\N	t	\N	t	\N	\N	\N	\N	2	\N	false	f
6	minNumObj	Минимальное число объектов в листе	0	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	3	\N	2	f
7	binarySplits	Бинарное дерево	1	BOOLEAN	\N	t	\N	t	\N	\N	\N	\N	3	\N	false	f
8	unpruned	Неусеченное дерево	2	BOOLEAN	\N	t	\N	t	\N	\N	\N	\N	3	\N	false	f
9	numFolds	Количество блоков	3	INTEGER	2.00	t	100.00	t	255	\N	\N	\N	3	\N	3	f
10	decisionTreeType	Алгоритм построения дерева	0	REFERENCE	\N	t	\N	t	\N	\N	\N	\N	4	2	CART	f
11	minObj	Минимальное число объектов в листе	1	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	4	\N	2	f
12	maxDepth	Максимальная глубина дерева	2	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	4	\N	0	f
13	useBinarySplits	Бинарное дерево	3	BOOLEAN	\N	t	\N	t	\N	\N	\N	\N	4	\N	false	f
14	randomTree	Случайное дерево	4	BOOLEAN	\N	t	\N	t	\N	\N	\N	\N	4	\N	false	f
15	numRandomAttr	Число случайных атрибутов	5	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	4	\N	0	f
16	useRandomSplits	Случайные расщепления атрибута	6	BOOLEAN	\N	t	\N	t	\N	\N	\N	\N	4	\N	false	f
17	numRandomSplits	Число случайных расщеплений атрибута	7	INTEGER	1.00	t	2147483647.00	t	255	\N	\N	\N	4	\N	1	f
18	seed	Начальное значение (seed)	8	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	4	\N	1	f
19	hiddenLayer	Структура скрытого слоя	2	TEXT	\N	t	\N	t	255	^([1-9],?)+$	Неправильный формат скрытого слоя. Пример 8,15,10	Введите числа, разделенные запятой	5	\N	\N	f
20	numIterations	Число итераций	3	INTEGER	1.00	t	2147483647.00	t	255	\N	\N	\N	5	\N	1000000	f
21	minError	Допустимая ошибка	4	DECIMAL	0.00	t	1.00	t	255	\N	\N	\N	5	\N	0.00001	f
22	activationFunctionOptions.activationFunctionType	Активационная функция нейронов скрытого слоя	5	REFERENCE	\N	t	\N	t	\N	\N	\N	\N	5	3	LOGISTIC	f
23	activationFunctionOptions.coefficient	Значение коэффициента	6	DECIMAL	0.00	f	2147483647.00	t	255	\N	\N	\N	5	\N	1	f
24	backPropagationOptions.learningRate	Коэффициент скорости обучения	7	DECIMAL	0.00	f	1.00	t	255	\N	\N	\N	5	\N	0.1	f
25	backPropagationOptions.momentum	Коэффициент момента	8	DECIMAL	0.00	t	1.00	f	255	\N	\N	\N	5	\N	0.2	f
26	seed	Начальное значение (seed)	9	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	5	\N	1	f
27	numIterations	Число итераций	0	INTEGER	1.00	t	2147483647.00	t	255	\N	\N	\N	6	\N	10	f
28	numThreads	Число потоков	1	INTEGER	1.00	t	10.00	t	255	\N	\N	\N	6	\N	1	f
29	minError	Минимальная допустимая ошибка классификатора	2	DECIMAL	0.00	t	0.50	t	255	\N	\N	\N	6	\N	0	f
30	maxError	Максимальная допустимая ошибка классификатора	3	DECIMAL	0.00	t	0.50	t	255	\N	\N	\N	6	\N	0.5	f
31	seed	Начальное значение (seed)	4	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	6	\N	1	f
32	numIterations	Число итераций	0	INTEGER	1.00	t	2147483647.00	t	255	\N	\N	\N	7	\N	10	f
33	numThreads	Число потоков	1	INTEGER	1.00	t	10.00	t	255	\N	\N	\N	7	\N	1	f
34	minError	Минимальная допустимая ошибка классификатора	2	DECIMAL	0.00	t	0.50	t	255	\N	\N	\N	7	\N	0	f
35	maxError	Максимальная допустимая ошибка классификатора	3	DECIMAL	0.00	t	0.50	t	255	\N	\N	\N	7	\N	0.5	f
36	useWeightedVotes	Метод взвешенного голосования	4	BOOLEAN	\N	t	\N	t	\N	\N	\N	\N	7	\N	false	f
37	useRandomClassifier	Случайный классификатор	5	BOOLEAN	\N	t	\N	t	\N	\N	\N	\N	7	\N	true	f
38	samplingMethod	Формирование обучающих выборок	6	REFERENCE	\N	t	\N	t	\N	\N	\N	\N	7	4	INITIAL	f
39	useRandomSubspaces	Использование метода случайных подпространств	7	BOOLEAN	\N	t	\N	t	\N	\N	\N	\N	7	\N	false	f
40	seed	Начальное значение (seed)	8	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	7	\N	1	f
41	decisionTreeType	Алгоритм построения дерева	0	REFERENCE	\N	t	\N	t	\N	\N	\N	\N	8	2	CART	f
42	numIterations	Число деревьев	1	INTEGER	1.00	t	2147483647.00	t	255	\N	\N	\N	8	\N	10	f
43	minObj	Минимальное число объектов в листе	2	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	8	\N	2	f
44	maxDepth	Максимальная глубина дерева	3	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	8	\N	0	f
45	numRandomAttr	Число случайных атрибутов	4	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	8	\N	0	f
46	numThreads	Число потоков	5	INTEGER	1.00	t	10.00	t	255	\N	\N	\N	8	\N	1	f
47	seed	Начальное значение (seed)	6	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	8	\N	1	f
48	decisionTreeType	Алгоритм построения дерева	0	REFERENCE	\N	t	\N	t	\N	\N	\N	\N	9	2	CART	f
49	numIterations	Число деревьев	1	INTEGER	1.00	t	2147483647.00	t	255	\N	\N	\N	9	\N	10	f
50	minObj	Минимальное число объектов в листе	2	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	9	\N	2	f
51	maxDepth	Максимальная глубина дерева	3	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	9	\N	0	f
52	numRandomAttr	Число случайных атрибутов	4	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	9	\N	0	f
53	numThreads	Число потоков	5	INTEGER	1.00	t	10.00	t	255	\N	\N	\N	9	\N	1	f
54	numRandomSplits	Число случайных расщеплений атрибута	6	INTEGER	1.00	t	2147483647.00	t	255	\N	\N	\N	9	\N	1	f
55	useBootstrapSamples	Использование бутстрэп - выборок	7	BOOLEAN	\N	t	\N	t	\N	\N	\N	\N	9	\N	false	f
56	seed	Начальное значение (seed)	8	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	9	\N	1	f
57	useCrossValidation	Использование V - блочной кросс - проверки для формирования мета - признаков	0	BOOLEAN	\N	t	\N	t	\N	\N	\N	\N	10	\N	false	f
58	numFolds	Количество блоков	1	INTEGER	2.00	t	100.00	t	255	\N	\N	\N	10	\N	10	f
59	seed	Начальное значение (seed)	2	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	10	\N	1	f
60	numIterations	Число итераций	0	INTEGER	1.00	t	2147483647.00	t	255	\N	\N	\N	11	\N	10	f
61	numThreads	Число потоков	1	INTEGER	1.00	t	10.00	t	255	\N	\N	\N	11	\N	1	f
62	minError	Минимальная допустимая ошибка классификатора	2	DECIMAL	0.00	t	0.50	t	255	\N	\N	\N	11	\N	0	f
63	maxError	Максимальная допустимая ошибка классификатора	3	DECIMAL	0.00	t	0.50	t	255	\N	\N	\N	11	\N	0.5	f
64	useBootstrapSamples	Использование бутстрэп - выборок	4	BOOLEAN	\N	t	\N	t	\N	\N	\N	\N	11	\N	false	f
65	seed	Начальное значение (seed)	5	INTEGER	0.00	t	2147483647.00	t	255	\N	\N	\N	11	\N	1	f
66	numInNeurons	Количество нейронов во входном слое	0	INTEGER	1.00	t	2147483647.00	t	\N	\N	\N	\N	5	\N	\N	t
67	numOutNeurons	Количество нейронов в выходном слое	1	INTEGER	2.00	t	2147483647.00	t	\N	\N	\N	\N	5	\N	\N	t
68	alpha	Уровень значимости для теста хи - квадрат	9	DECIMAL	0.00	t	1.00	t	255	\N	\N	\N	4	\N	0.05	t
\.


--
-- TOC entry 2542 (class 0 OID 17539)
-- Dependencies: 236
-- Data for Name: form_field_dictionary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_field_dictionary (id, name) FROM stdin;
1	distanceType
2	decisionTreeType
3	activationFunctionType
4	samplingMethod
\.


--
-- TOC entry 2546 (class 0 OID 17572)
-- Dependencies: 240
-- Data for Name: form_field_dictionary_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_field_dictionary_value (id, label, value, dictionary_id) FROM stdin;
1	Евкилидово расстояние	EUCLID	1
2	Квадрат Евклидова расстояни	SQUARE_EUCLID	1
3	Манхеттенское расстояние	MANHATTAN	1
4	Расстояние Чебышева	CHEBYSHEV	1
5	Алгоритм CART	CART	2
6	Алгоритм ID3	ID3	2
7	Алгоритм C4.5	C45	2
8	Алгоритм CHAID	CHAID	2
9	Логистическая	LOGISTIC	3
10	Гиперболический тангенс	HYPERBOLIC_TANGENT	3
11	Тригонометрический синус	SINUSOID	3
12	Экспоненциальная	EXPONENTIAL	3
13	Функция SoftSign	SOFT_SIGN	3
14	Функция ISRU	INVERSE_SQUARE_ROOT_UNIT	3
15	Использование исходной выборки	INITIAL	4
16	Бутстрэп выборки	BAGGING	4
17	Случайные подвыборки	RANDOM	4
18	Бутстрэп выборки случайного размера	RANDOM_BAGGING	4
\.


--
-- TOC entry 2540 (class 0 OID 17521)
-- Dependencies: 234
-- Data for Name: form_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_template (id, template_name, object_class, object_type, template_title, group_id) FROM stdin;
1	KNN	KNearestNeighboursOptions	knn	Алгоритм k - взвешенных ближайших соседей	1
2	LOGISTIC	LogisticOptions	logistic	Логистическая регрессия	1
3	J48	J48Options	j48	Алгоритм J48	1
4	DECISION_TREE	DecisionTreeOptions	decision_tree	Дерево решений	1
5	NEURAL_NETWORK	NeuralNetworkOptions	neural_network	Нейронная сеть (Многослойный персептрон)	1
6	ADA_BOOST	AdaBoostOptions	ada_boost	Алгоритм AdaBoost	2
7	HETEROGENEOUS_CLASSIFIER	HeterogeneousClassifierOptions	heterogeneous_classifier	Неоднородный ансамблевый алгоритм	2
8	RANDOM_FORESTS	RandomForestsOptions	RandomForestsOptions	Случайные леса	2
9	EXTRA_TREES	ExtraTreesOptions	extra_trees	Алгоритм Extra trees	2
10	STACKING	StackingOptions	stacking	Алгоритм Stacking	2
11	RANDOM_NETWORKS	RandomNetworkOptions	random_networks	Алгоритм Случайные сети	2
\.


--
-- TOC entry 2538 (class 0 OID 17511)
-- Dependencies: 232
-- Data for Name: form_template_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_template_group (id, group_name) FROM stdin;
1	classifiers
2	ensembleClassifiers
\.


--
-- TOC entry 2530 (class 0 OID 16564)
-- Dependencies: 224
-- Data for Name: global_filter_field; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.global_filter_field (id, field_name, global_filter_template_id) FROM stdin;
3	email	1
4	requestId	2
6	instancesInfo.relationName	2
7	requestId	3
8	relationName	3
10	evaluationMethod	2
11	evaluationMethod	1
13	experimentType	1
14	evaluationMethod	3
15	responseStatus	3
5	classifierInfo.classifierName	2
9	requestStatus	2
12	requestStatus	1
1	requestId	1
16	configurationName	4
17	createdBy	4
18	id	4
19	actionType	5
20	messageText	5
21	createdBy	5
22	instancesInfo.relationName	1
\.


--
-- TOC entry 2532 (class 0 OID 16569)
-- Dependencies: 226
-- Data for Name: global_filter_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.global_filter_template (id, filter_name, template_type) FROM stdin;
1	experimentFilter	EXPERIMENT
2	evaluationLogFilter	EVALUATION_LOG
3	classifierOptionsRequestFilter	CLASSIFIER_OPTIONS_REQUEST
4	classifiersConfigurationFilter	CLASSIFIERS_CONFIGURATION
5	classifiersConfigurationHistoryFilter	CLASSIFIERS_CONFIGURATION_HISTORY
\.


--
-- TOC entry 2535 (class 0 OID 16579)
-- Dependencies: 229
-- Data for Name: instances_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instances_info (id, class_name, num_attributes, num_classes, num_instances, relation_name) FROM stdin;
129	class	5	3	150	IrisEX
131	class	17	2	57	labor-neg-data
133	class	17	2	57	labor-neg-data
135	class	17	2	57	labor-neg-data
137	class	17	2	57	labor-neg-data
139	class	17	2	57	labor-neg-data
141	class	17	2	57	labor-neg-data
143	class	17	2	57	labor-neg-data
145	class	17	2	57	labor-neg-data
147	class	17	2	57	labor-neg-data
149	Class	10	2	286	breast-cancer
151	Class	10	2	286	breast-cancer
153	Class	10	2	286	breast-cancer
155	Class	10	2	286	breast-cancer
157	Class	10	2	286	breast-cancer
159	Class	10	2	286	breast-cancer
161	Class	10	2	286	breast-cancer
163	Class	10	2	286	breast-cancer
165	Class	10	2	286	breast-cancer
167	class	19	7	1500	segment
169	class	19	7	1500	segment
171	class	19	7	1500	segment
173	class	19	7	810	segment-test
175	class	19	7	810	segment-test
177	class	19	7	810	segment-test
179	class	19	7	810	segment-test
181	class	19	7	810	segment-test
183	class	19	7	810	segment-test
185	class	19	7	810	segment-test
187	class	19	7	810	segment-test
189	class	19	7	810	segment-test
191	class	19	7	810	segment-test
193	class	19	7	810	segment-test
195	class	19	7	810	segment-test
197	class	19	7	810	segment-test
199	class	19	7	810	segment-test
201	class	19	7	810	segment-test
203	class	19	7	810	segment-test
205	class	19	7	810	segment-test
207	class	19	7	810	segment-test
209	class	19	7	810	segment-test
211	class	19	7	810	segment-test
213	class	19	7	810	segment-test
215	class	19	7	810	segment-test
217	class	19	7	810	segment-test
219	class	19	7	810	segment-test
221	class	19	7	810	segment-test
223	class	19	7	810	segment-test
225	Type	10	6	214	Glass
227	Type	10	6	214	Glass
229	Type	10	6	214	Glass
231	Type	10	6	214	Glass
233	Type	10	6	214	Glass
235	Type	10	6	214	Glass
237	Type	10	6	214	Glass
239	Type	10	6	214	Glass
241	Type	10	6	214	Glass
243	Type	10	6	214	Glass
245	Type	10	6	214	Glass
247	Type	10	6	214	Glass
249	Type	10	6	214	Glass
251	Type	10	6	214	Glass
253	Type	10	6	214	Glass
255	Type	10	6	214	Glass
257	Type	10	6	214	Glass
259	Type	10	6	214	Glass
261	Type	10	6	214	Glass
263	Type	10	6	214	Glass
265	Type	10	6	214	Glass
267	Type	10	6	214	Glass
269	Type	10	6	214	Glass
271	Type	10	6	214	Glass
273	Type	10	6	214	Glass
275	Type	10	6	214	Glass
277	Type	10	6	214	Glass
279	Type	10	6	214	Glass
281	Type	10	6	214	Glass
283	Type	10	6	214	Glass
285	Type	10	6	214	Glass
287	Type	10	6	214	Glass
289	Type	10	6	214	Glass
291	Type	10	6	214	Glass
293	Type	10	6	214	Glass
295	Type	10	6	214	Glass
297	Type	10	6	214	Glass
299	Type	10	6	214	Glass
301	Type	10	6	214	Glass
303	Тип нарушения мозгового кровообращения	20	4	124	MedData
307	class	21	2	1000	german_credit
311	class	21	2	1000	german_credit
313	class	21	2	1000	german_credit
322	Type	10	6	214	Glass
324	Type	10	6	214	Glass
326	Type	10	6	214	Glass
328	Type	10	6	214	Glass
333	class	34	2	351	ionosphere
335	class	34	2	351	ionosphere
337	class	34	2	351	ionosphere
339	class	34	2	351	ionosphere
341	class	34	2	351	ionosphere
343	Class	28	4	3772	hypothyroid
345	Class	28	4	3772	hypothyroid
347	Class	28	4	3772	hypothyroid
349	Class	28	4	3772	hypothyroid
351	Class	28	4	3772	hypothyroid
353	Class	28	4	3772	hypothyroid
355	Class	28	4	3772	hypothyroid
357	Class	28	4	3772	hypothyroid
359	Class	28	4	3772	hypothyroid
361	Class	28	4	3772	hypothyroid
364	class	9	2	768	pima_diabetes
366	class	9	2	768	pima_diabetes
368	class	9	2	768	pima_diabetes
370	class	9	2	768	pima_diabetes
372	class	9	2	768	pima_diabetes
374	class	9	2	768	pima_diabetes
376	Type	10	6	214	Glass
378	Type	10	6	214	Glass
380	Type	10	6	214	Glass
383	NMK	20	4	124	MedData
385	NMK	20	4	124	MedData
387	NMK	20	4	124	MedData
410	class	5	3	150	IrisEX
412	class	5	3	150	IrisEX
414	class	5	3	150	IrisEX
416	class	5	3	150	IrisEX
418	class	34	2	351	ionosphere
420	class	34	2	351	ionosphere
422	NMK	20	4	124	MedData
424	NMK	20	4	124	MedData
426	class	34	2	351	ionosphere
428	class	34	2	351	ionosphere
432	class	34	2	351	ionosphere
434	NMK	20	4	124	MedData
436	NMK	20	4	124	MedData
438	NMK	20	4	124	MedData
440	NMK	20	4	124	MedData
442	NMK	20	4	124	MedData
444	NMK	20	4	124	MedData
446	Тип нарушения мозгового кровообращения	20	4	124	MedData
448	Тип нарушения мозгового кровообращения	20	4	124	MedData
450	Тип нарушения мозгового кровообращения	20	4	124	MedData
452	class	34	2	351	ionosphere
454	class	34	2	351	ionosphere
456	class	34	2	351	ionosphere
458	class	34	2	351	ionosphere
460	class	34	2	351	ionosphere
462	class	9	2	768	pima_diabetes
464	class	9	2	768	pima_diabetes
466	class	9	2	768	pima_diabetes
468	class	9	2	768	pima_diabetes
476	class	36	19	683	soybean
478	class	36	19	683	soybean
480	class	36	19	683	soybean
482	class	36	19	683	soybean
484	class	36	19	683	soybean
486	class	36	19	683	soybean
488	class	36	19	683	soybean
490	class	36	19	683	soybean
492	class	36	19	683	soybean
494	class	36	19	683	soybean
496	class	36	19	683	soybean
498	class	36	19	683	soybean
501	Type	10	6	214	Glass
503	Type	10	6	214	Glass
505	Type	10	6	214	Glass
507	Type	10	6	214	Glass
509	Type	10	6	214	Glass
511	Type	10	6	214	Glass
513	class	9	2	768	pima_diabetes
515	class	9	2	768	pima_diabetes
520	NMK	20	4	124	MedData
527	class	34	2	351	ionosphere
529	class	34	2	351	ionosphere
531	class	34	2	351	ionosphere
533	class	34	2	351	ionosphere
535	class	34	2	351	ionosphere
537	class	34	2	351	ionosphere
539	class	34	2	351	ionosphere
541	class	34	2	351	ionosphere
543	class	9	2	768	pima_diabetes
545	class	9	2	768	pima_diabetes
547	class	9	2	768	pima_diabetes
549	class	9	2	768	pima_diabetes
551	class	9	2	768	pima_diabetes
557	Class	10	2	286	breast-cancer
559	Class	10	2	286	breast-cancer
561	Class	10	2	286	breast-cancer
563	Class	10	2	286	breast-cancer
565	Class	10	2	286	breast-cancer
567	Class	10	2	286	breast-cancer
569	Class	10	2	286	breast-cancer
571	Class	10	2	286	breast-cancer
573	class	19	7	1500	segment
575	class	19	7	1500	segment
577	class	19	7	1500	segment
579	class	19	7	1500	segment
581	class	34	2	351	ionosphere
583	class	34	2	351	ionosphere
585	class	34	2	351	ionosphere
587	class	34	2	351	ionosphere
589	class	34	2	351	ionosphere
591	class	34	2	351	ionosphere
593	class	34	2	351	ionosphere
595	class	21	2	1000	german_credit
597	class	21	2	1000	german_credit
599	class	21	2	1000	german_credit
601	class	21	2	1000	german_credit
603	class	21	2	1000	german_credit
605	class	21	2	1000	german_credit
608	class	21	2	1000	german_credit
636	class	5	3	150	IrisEX
638	Тип нарушения мозгового кровообращения	9	4	124	MedData
640	Тип нарушения мозгового кровообращения	9	4	124	MedData
644	class	21	2	1000	german_credit
646	class	34	2	351	ionosphere
648	class	34	2	351	ionosphere
650	class	34	2	351	ionosphere
652	class	34	2	351	ionosphere
654	class	34	2	351	ionosphere
656	class	34	2	351	ionosphere
658	class	34	2	351	ionosphere
660	class	34	2	351	ionosphere
662	class	34	2	351	ionosphere
664	class	34	2	351	ionosphere
666	class	34	2	351	ionosphere
668	class	34	2	351	ionosphere
670	class	34	2	351	ionosphere
672	Тип нарушения мозгового кровообращения	9	4	124	MedData
674	Тип нарушения мозгового кровообращения	8	4	124	MedData
678	NMK	20	4	124	MedData
680	NMK	17	4	124	MedData
682	class	19	2	1000	german_credit
684	class	21	2	1000	german_credit
686	class	21	2	1000	german_credit
688	class	21	2	1000	german_credit
690	class	21	2	1000	german_credit
692	class	21	2	1000	german_credit
694	class	21	2	1000	german_credit
700	Type	10	6	214	Glass
702	Type	10	6	214	Glass
704	Type	10	6	214	Glass
706	Type	10	6	214	Glass
708	Type	10	6	214	Glass
712	Type	10	6	214	Glass
714	Type	10	6	214	Glass
716	Type	10	6	214	Glass
718	Type	10	6	214	Glass
720	Type	10	6	214	Glass
722	Type	10	6	214	Glass
724	Type	10	6	214	Glass
726	Type	10	6	214	Glass
728	Type	10	6	214	Glass
730	NMK	20	4	124	MedData
732	NMK	20	4	124	MedData
734	NMK	20	4	124	MedData
736	NMK	20	4	124	MedData
738	NMK	20	4	124	MedData
740	NMK	20	4	124	MedData
742	NMK	20	4	124	MedData
744	NMK	20	4	124	MedData
746	NMK	20	4	124	MedData
748	NMK	20	4	124	MedData
750	NMK	20	4	124	MedData
752	NMK	20	4	124	MedData
754	NMK	20	4	124	MedData
756	NMK	20	4	124	MedData
758	NMK	20	4	124	MedData
761	Type	10	6	214	Glass
765	NMK	20	4	124	MedData
767	NMK	20	4	124	MedData
769	NMK	20	4	124	MedData
771	NMK	20	4	124	MedData
773	NMK	20	4	124	MedData
775	NMK	20	4	124	MedData
782	Тип нарушения мозгового кровообращения	20	4	124	MedData
784	Тип нарушения мозгового кровообращения	20	4	124	MedData
786	Тип нарушения мозгового кровообращения	20	4	124	MedData
789	Type	10	6	214	Glass
791	Type	10	6	214	Glass
794	Type	10	6	214	Glass
796	Type	10	6	214	Glass
798	Type	10	6	214	Glass
800	Type	10	6	214	Glass
810	Type	10	6	214	Glass
814	Type	10	6	214	Glass
838	Тип нарушения мозгового кровообращения	9	4	124	MedData
848	Тип нарушения мозгового кровообращения	20	4	124	MedData
850	class	5	3	150	iris
852	Тип нарушения мозгового кровообращения	20	4	124	MedData
854	Тип нарушения мозгового кровообращения	20	4	124	MedData
856	Тип нарушения мозгового кровообращения	20	4	124	MedData
858	class	9	2	768	pima_diabetes
860	class	9	2	768	pima_diabetes
862	class	9	2	768	pima_diabetes
866	class	9	2	768	pima_diabetes
868	class	5	3	150	IrisEX
870	class	5	3	150	IrisEX
872	class	36	19	683	soybean
874	class	36	19	683	soybean
876	evaluation_status	6	2	287	stream
878	class	5	3	150	IrisEX
880	passenger_numbers	2	118	144	airline_passengers
882	evaluation_status	9	2	303	evaluation_log
884	Type	10	6	214	Glass
886	Type	10	6	214	Glass
888	Type	10	6	214	Glass
890	Type	10	6	214	Glass
892	Type	10	6	214	Glass
894	Type	10	6	214	Glass
896	Type	10	6	214	Glass
898	Type	10	6	214	Glass
900	Type	10	6	213	Glass
902	class	5	3	150	IrisEX
905	class	5	3	150	IrisEX
911	Тип нарушения мозгового кровообращения	20	4	124	MedData
914	Тип нарушения мозгового кровообращения	20	4	124	MedData
917	Тип нарушения мозгового кровообращения	20	4	124	MedData
920	Тип нарушения мозгового кровообращения	20	4	124	MedData
923	Тип нарушения мозгового кровообращения	20	4	124	MedData
926	Тип нарушения мозгового кровообращения	20	4	124	MedData
929	Тип нарушения мозгового кровообращения	20	4	124	MedData
996	Type	10	6	214	Glass
999	Type	10	6	214	Glass
1075	class	21	2	1000	german_credit
1078	class	21	2	1000	german_credit
1081	class	21	2	1000	german_credit
1084	class	21	2	1000	german_credit
1087	class	21	2	1000	german_credit
1090	class	21	2	1000	german_credit
1093	class	21	2	1000	german_credit
1096	class	21	2	1000	german_credit
1099	class	21	2	1000	german_credit
1102	class	21	2	1000	german_credit
1105	class	21	2	1000	german_credit
1108	class	21	2	1000	german_credit
1111	class	21	2	1000	german_credit
1114	class	21	2	1000	german_credit
1117	class	21	2	1000	german_credit
1120	class	21	2	1000	german_credit
1123	class	21	2	1000	german_credit
1128	class	21	2	1000	german_credit
1131	class	21	2	1000	german_credit
1140	class	21	2	1000	german_credit
1143	class	21	2	1000	german_credit
1146	class	21	2	1000	german_credit
1164	class	21	2	1000	german_credit
1166	class	21	2	1000	german_credit
1170	class	21	2	1000	german_credit
1173	class	21	2	1000	german_credit
1176	class	21	2	1000	german_credit
1179	class	21	2	1000	german_credit
1182	class	21	2	1000	german_credit
1185	class	21	2	1000	german_credit
1188	class	21	2	1000	german_credit
1191	class	21	2	1000	german_credit
1194	Type	10	6	214	Glass
1197	Type	10	6	214	Glass
1200	Type	10	6	214	Glass
1203	Type	10	6	214	Glass
1206	Type	10	6	214	Glass
1209	Type	10	6	214	Glass
1212	Type	10	6	214	Glass
1215	Type	10	6	214	Glass
1218	Type	10	6	214	Glass
1221	Type	10	6	214	Glass
1224	Type	10	6	214	Glass
1227	Type	10	6	214	Glass
1230	Type	10	6	214	Glass
1233	Type	10	6	214	Glass
1236	Type	10	6	214	Glass
1239	Type	10	6	214	Glass
1242	Type	10	6	214	Glass
1245	Type	10	6	214	Glass
1248	Type	10	6	214	Glass
1251	Type	10	6	214	Glass
1254	Type	10	6	214	Glass
1257	Type	10	6	214	Glass
1366	class	21	2	1000	german_credit
1375	class	21	2	1000	german_credit
1378	class	21	2	1000	german_credit
1381	class	21	2	1000	german_credit
1384	class	21	2	1000	german_credit
1387	class	21	2	1000	german_credit
1390	class	21	2	1000	german_credit
1393	class	21	2	1000	german_credit
1396	class	21	2	1000	german_credit
1423	class	21	2	1000	german_credit
1426	class	21	2	1000	german_credit
1429	class	21	2	1000	german_credit
1450	class	21	2	1000	german_credit
1453	class	21	2	1000	german_credit
1456	class	21	2	1000	german_credit
1459	class	21	2	1000	german_credit
1462	class	21	2	1000	german_credit
1465	class	21	2	1000	german_credit
1468	class	21	2	1000	german_credit
1471	class	21	2	1000	german_credit
1474	class	21	2	1000	german_credit
1477	class	21	2	1000	german_credit
1480	class	21	2	1000	german_credit
1483	class	21	2	1000	german_credit
1486	class	21	2	1000	german_credit
1489	class	21	2	1000	german_credit
1492	class	21	2	1000	german_credit
1495	Тип нарушения мозгового кровообращения	20	4	124	MedData
1498	Тип нарушения мозгового кровообращения	20	4	124	MedData
1501	Тип нарушения мозгового кровообращения	20	4	124	MedData
1504	Тип нарушения мозгового кровообращения	20	4	124	MedData
1507	Тип нарушения мозгового кровообращения	20	4	124	MedData
1510	Тип нарушения мозгового кровообращения	20	4	124	MedData
1513	Тип нарушения мозгового кровообращения	20	4	124	MedData
1516	Тип нарушения мозгового кровообращения	20	4	124	MedData
1519	Тип нарушения мозгового кровообращения	20	4	124	MedData
1522	Тип нарушения мозгового кровообращения	20	4	124	MedData
1525	Тип нарушения мозгового кровообращения	20	4	124	MedData
1528	Тип нарушения мозгового кровообращения	20	4	124	MedData
1608	class	34	2	351	ionosphere
1611	class	34	2	351	ionosphere
1614	class	34	2	351	ionosphere
1617	class	34	2	351	ionosphere
1620	class	34	2	351	ionosphere
1623	class	34	2	351	ionosphere
1626	class	34	2	351	ionosphere
1629	class	34	2	351	ionosphere
1632	class	34	2	351	ionosphere
1712	Class	28	4	3772	hypothyroid.docx
1715	Class	28	4	3772	hypothyroid.docx
1718	Class	28	4	3772	hypothyroid.docx
1721	Class	28	4	3772	hypothyroid.docx
1746	NMK	20	4	124	MedData
1749	NMK	20	4	124	MedData
1752	NMK	20	4	124	MedData
1755	NMK	20	4	124	MedData
1758	NMK	20	4	124	MedData
1761	NMK	20	4	124	MedData
1764	NMK	20	4	124	MedData
1767	NMK	20	4	124	MedData
1770	NMK	20	4	124	MedData
1773	NMK	20	4	124	MedData
1776	NMK	20	4	124	MedData
1779	NMK	20	4	124	MedData
1916	Тип нарушения мозгового кровообращения	20	4	124	MedData
1919	Тип нарушения мозгового кровообращения	20	4	124	MedData
1922	Тип нарушения мозгового кровообращения	20	4	124	MedData
1925	Тип нарушения мозгового кровообращения	20	4	124	MedData
1928	Тип нарушения мозгового кровообращения	20	4	124	MedData
1931	Тип нарушения мозгового кровообращения	20	4	124	MedData
1934	Тип нарушения мозгового кровообращения	20	4	124	MedData
1937	Тип нарушения мозгового кровообращения	20	4	124	MedData
1940	Тип нарушения мозгового кровообращения	20	4	124	MedData
1943	Тип нарушения мозгового кровообращения	20	4	124	MedData
1946	Тип нарушения мозгового кровообращения	20	4	124	MedData
1949	Тип нарушения мозгового кровообращения	20	4	124	MedData
1952	Тип нарушения мозгового кровообращения	20	4	124	MedData
1955	Тип нарушения мозгового кровообращения	20	4	124	MedData
1958	Этиология	20	3	124	MedData
1961	Тип нарушения мозгового кровообращения	20	4	124	MedData
2020	Type	10	6	214	Glass
2023	Type	10	6	214	Glass
2026	Type	10	6	214	Glass
2029	Type	10	6	214	Glass
2032	Type	10	6	214	Glass
2035	Type	10	6	214	Glass
2038	Type	10	6	214	Glass
2041	Type	10	6	214	Glass
2044	Type	10	6	214	Glass
2110	Type	10	6	214	Glass
2116	Type	10	6	214	Glass
2118	Тип нарушения мозгового кровообращения	20	4	124	MedData
2121	Тип нарушения мозгового кровообращения	20	4	124	MedData
2124	Тип нарушения мозгового кровообращения	20	4	124	MedData
2127	Тип нарушения мозгового кровообращения	20	4	124	MedData
2130	Тип нарушения мозгового кровообращения	20	4	124	MedData
2133	Тип нарушения мозгового кровообращения	20	4	124	MedData
2136	Тип нарушения мозгового кровообращения	20	4	124	MedData
2139	Тип нарушения мозгового кровообращения	20	4	124	MedData
2142	Тип нарушения мозгового кровообращения	20	4	124	MedData
2145	Тип нарушения мозгового кровообращения	20	4	124	MedData
2148	Тип нарушения мозгового кровообращения	20	4	124	MedData
2151	Тип нарушения мозгового кровообращения	20	4	124	MedData
2221	Тип нарушения мозгового кровообращения	20	4	124	MedData
2224	Тип нарушения мозгового кровообращения	20	4	124	MedData
2276	class	34	2	351	ionosphere
2279	class	34	2	351	ionosphere
2282	class	34	2	351	ionosphere
2285	class	34	2	351	ionosphere
2288	class	34	2	351	ionosphere
2291	class	34	2	351	ionosphere
2294	class	34	2	351	ionosphere
2306	class	34	2	351	ionosphere
2308	class	34	2	351	ionosphere
2312	class	34	2	351	ionosphere
2326	class	9	2	768	pima_diabetes
2329	class	9	2	768	pima_diabetes
2332	class	9	2	768	pima_diabetes
2335	class	9	2	768	pima_diabetes
2338	class	9	2	768	pima_diabetes
2341	class	9	2	768	pima_diabetes
2344	class	9	2	768	pima_diabetes
2375	class	9	2	768	pima_diabetes
2380	class	9	2	768	pima_diabetes
2385	class	9	2	768	pima_diabetes
2419	class	9	2	768	pima_diabetes
2422	class	9	2	768	pima_diabetes
2456	class	21	2	1000	german_credit
2459	class	21	2	1000	german_credit
2462	class	21	2	1000	german_credit
2465	class	21	2	1000	german_credit
2468	class	21	2	1000	german_credit
2471	class	21	2	1000	german_credit
2474	class	21	2	1000	german_credit
2477	class	21	2	1000	german_credit
2480	class	21	2	1000	german_credit
2483	class	21	2	1000	german_credit
2486	class	21	2	1000	german_credit
2511	class	21	2	1000	german_credit
2514	class	21	2	1000	german_credit
2516	class	21	2	1000	german_credit
2519	class	21	2	1000	german_credit
2522	class	21	2	1000	german_credit
2525	class	21	2	1000	german_credit
2528	class	21	2	1000	german_credit
2531	class	21	2	1000	german_credit
2534	class	21	2	1000	german_credit
2538	class	21	2	1000	german_credit
2540	class	21	2	1000	german_credit
2543	class	21	2	1000	german_credit
2546	class	21	2	1000	german_credit
2576	Type	10	6	214	Glass
2581	class	9	2	768	pima_diabetes
2599	class	12	2	100	GeneratedData1535033359192
2602	class	12	2	100	GeneratedData1535033359192
2605	class	12	2	100	GeneratedData1535033359192
2611	class	12	2	100	GeneratedData1535033359192
2613	Outcome	33	2	856	unbalanced
2616	Outcome	33	2	856	unbalanced
2619	Outcome	33	2	856	unbalanced
2622	Class	10	2	286	breast-cancer
2625	Class	10	2	286	breast-cancer
2628	Class	10	2	286	breast-cancer
2631	Class	10	2	286	breast-cancer
2634	Class	10	2	286	breast-cancer
2637	Class	10	2	286	breast-cancer
2640	Class	10	2	286	breast-cancer
2643	Class	10	2	286	breast-cancer
2646	Class	10	2	286	breast-cancer
2649	class	19	7	1500	segment
2719	Class	10	2	286	breast-cancer
2831	Type	10	6	214	Glass
2834	Type	10	6	214	Glass
2837	Type	10	6	214	Glass
2846	Class	10	2	286	breast-cancer
2849	Class	10	2	286	breast-cancer
2852	Class	10	2	286	breast-cancer
2855	Class	10	2	286	breast-cancer
2914	Тип нарушения мозгового кровообращения	20	4	124	MedData
2917	Тип нарушения мозгового кровообращения	20	4	124	MedData
2920	Тип нарушения мозгового кровообращения	20	4	124	MedData
2923	Тип нарушения мозгового кровообращения	20	4	124	MedData
2926	Тип нарушения мозгового кровообращения	20	4	124	MedData
2931	Тип нарушения мозгового кровообращения	20	4	124	MedData
2958	class	34	2	351	ionosphere
2961	class	34	2	351	ionosphere
2964	class	34	2	351	ionosphere
2967	class	34	2	351	ionosphere
2970	class	34	2	351	ionosphere
2973	class	34	2	351	ionosphere
2994	class	34	2	351	ionosphere
3091	class	21	2	1000	german_credit
3094	class	21	2	1000	german_credit
3097	class	21	2	1000	german_credit
3100	class	21	2	1000	german_credit
3103	class	21	2	1000	german_credit
3106	class	21	2	1000	german_credit
3109	class	21	2	1000	german_credit
3112	class	21	2	1000	german_credit
3129	class	21	2	1000	german_credit
3132	class	21	2	1000	german_credit
3135	class	21	2	1000	german_credit
3138	class	21	2	1000	german_credit
3141	class	21	2	1000	german_credit
3144	class	21	2	1000	german_credit
3147	class	21	2	1000	german_credit
3169	Class	10	2	286	breast-cancer
3174	Тип нарушения мозгового кровообращения	20	4	124	MedData
3177	Тип нарушения мозгового кровообращения	20	4	124	MedData
3182	class	34	2	351	ionosphere
3187	Type	10	6	214	Glass
3212	Type	10	6	214	Glass
6869	Тип нарушения мозгового кровообращения	20	4	124	MedData
6877	Тип нарушения мозгового кровообращения	20	4	124	MedData
6885	Тип нарушения мозгового кровообращения	20	4	124	MedData
6893	Тип нарушения мозгового кровообращения	20	4	124	MedData
6898	Тип нарушения мозгового кровообращения	20	4	124	MedData
6906	Тип нарушения мозгового кровообращения	20	4	124	MedData
6914	Тип нарушения мозгового кровообращения	20	4	124	MedData
6924	Тип нарушения мозгового кровообращения	20	4	124	MedData
6936	Type	10	6	214	Glass
6948	Type	10	6	214	Glass
6960	Тип нарушения мозгового кровообращения	20	4	124	MedData
6971	Тип нарушения мозгового кровообращения	20	4	124	MedData
6978	Type	10	6	214	Glass
6990	Type	10	6	214	Glass
7002	Type	10	6	214	Glass
7014	Type	10	6	214	Glass
7026	Type	10	6	214	Glass
7038	Type	10	6	214	Glass
7050	Type	10	6	214	Glass
7062	Type	10	6	214	Glass
7074	Type	10	6	214	Glass
7086	Type	10	6	214	Glass
7098	Type	10	6	214	Glass
7110	Type	10	6	214	Glass
7125	Type	10	6	214	Glass
7136	class	34	2	351	ionosphere
7144	class	34	2	351	ionosphere
7152	class	34	2	351	ionosphere
7160	class	34	2	351	ionosphere
7168	class	34	2	351	ionosphere
7176	class	34	2	351	ionosphere
7184	class	34	2	351	ionosphere
7192	class	34	2	351	ionosphere
7200	class	34	2	351	ionosphere
7208	class	34	2	351	ionosphere
7216	class	34	2	351	ionosphere
7224	class	34	2	351	ionosphere
7232	class	34	2	351	ionosphere
7240	class	34	2	351	ionosphere
7248	class	34	2	351	ionosphere
7259	class	34	2	351	ionosphere
7266	Type	10	6	214	Glass
7274	class	34	2	351	ionosphere
7282	class	34	2	351	ionosphere
7290	class	34	2	351	ionosphere
7301	Тип нарушения мозгового кровообращения	20	4	124	MedData
\.


--
-- TOC entry 2549 (class 0 OID 17616)
-- Dependencies: 243
-- Data for Name: message_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message_template (id, template_text) FROM stdin;
CREATE_CONFIGURATION	Создана конфигурация с именем ${classifiersConfiguration.configurationName}
UPDATE_CONFIGURATION	Изменено название конфигурации. Новое название - ${classifiersConfiguration.configurationName}
SET_ACTIVE	Конфигурация сделана активной
DEACTIVATE	Конфигурация перестала быть активной
ADD_CLASSIFIER_OPTIONS	Добавлены настройки классификатора [${classifierOptionsDescription}]. Идентификатор настроек [${classifierOptionsId}]
REMOVE_CLASSIFIER_OPTIONS	Удалены настройки классификатора [${classifierOptionsDescription}]. Идентификатор настроек [${classifierOptionsId}]
NEW_EXPERIMENT	Поступила новая заявка на эксперимент ${experiment.requestId}
IN_PROGRESS_EXPERIMENT	Заявка на эксперимент ${experiment.requestId} поступила в работу
FINISHED_EXPERIMENT	Эксперимент ${experiment.requestId} успешно завершен
ERROR_EXPERIMENT	Эксперимент ${experiment.requestId} завершился с ошибкой
TIMEOUT_EXPERIMENT	Таймаут при обработке заявки на эксперимент ${experiment.requestId}
SET_ACTIVE_CLASSIFIERS_CONFIGURATION_PUSH_MESSAGE	Сделал конфигурацию [${classifiersConfiguration.id}] активной
RENAME_CLASSIFIERS_CONFIGURATION_PUSH_MESSAGE	Изменил название конфигурации [${classifiersConfiguration.id}] на [${classifiersConfiguration.configurationName}]
ADD_CLASSIFIERS_CONFIGURATION_OPTIONS_PUSH_MESSAGE	Добавил настройки классификатора [${classifierOptionsDescription}] в конфигурацию [${classifiersConfiguration.id}]. Идентификатор настроек [${classifierOptionsId}]
DELETE_CLASSIFIERS_CONFIGURATION_OPTIONS_PUSH_MESSAGE	Удалил настройки классификатора [${classifierOptionsDescription}] из конфигурации [${classifiersConfiguration.id}]. Идентификатор настроек [${classifierOptionsId}]
\.


--
-- TOC entry 2536 (class 0 OID 17491)
-- Dependencies: 230
-- Data for Name: retry_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.retry_request (id, request_type, request_id, request, tx_id, retries, max_retries, created_at, retry_at) FROM stdin;
\.


--
-- TOC entry 2583 (class 0 OID 0)
-- Dependencies: 189
-- Name: classifier_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classifier_info_id_seq', 1272, true);


--
-- TOC entry 2584 (class 0 OID 0)
-- Dependencies: 191
-- Name: classifier_input_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classifier_input_options_id_seq', 1, false);


--
-- TOC entry 2585 (class 0 OID 0)
-- Dependencies: 193
-- Name: classifier_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classifier_options_id_seq', 1, false);


--
-- TOC entry 2586 (class 0 OID 0)
-- Dependencies: 195
-- Name: classifier_options_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classifier_options_request_id_seq', 1, false);


--
-- TOC entry 2587 (class 0 OID 0)
-- Dependencies: 197
-- Name: classifier_options_request_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classifier_options_request_model_id_seq', 1, false);


--
-- TOC entry 2588 (class 0 OID 0)
-- Dependencies: 199
-- Name: classifier_options_response_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classifier_options_response_model_id_seq', 1, false);


--
-- TOC entry 2589 (class 0 OID 0)
-- Dependencies: 241
-- Name: classifiers_configuration_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classifiers_configuration_history_id_seq', 1, false);


--
-- TOC entry 2590 (class 0 OID 0)
-- Dependencies: 201
-- Name: classifiers_configuration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classifiers_configuration_id_seq', 1, false);


--
-- TOC entry 2591 (class 0 OID 0)
-- Dependencies: 205
-- Name: ers_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ers_request_id_seq', 1, false);


--
-- TOC entry 2592 (class 0 OID 0)
-- Dependencies: 208
-- Name: evaluation_results_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evaluation_results_request_id_seq', 1, false);


--
-- TOC entry 2593 (class 0 OID 0)
-- Dependencies: 211
-- Name: experiment_progress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.experiment_progress_id_seq', 1, false);


--
-- TOC entry 2594 (class 0 OID 0)
-- Dependencies: 213
-- Name: experiment_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.experiment_results_id_seq', 1, false);


--
-- TOC entry 2595 (class 0 OID 0)
-- Dependencies: 215
-- Name: experiment_results_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.experiment_results_request_id_seq', 1, false);


--
-- TOC entry 2596 (class 0 OID 0)
-- Dependencies: 244
-- Name: experiment_step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.experiment_step_id_seq', 1, false);


--
-- TOC entry 2597 (class 0 OID 0)
-- Dependencies: 217
-- Name: filter_dictionary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filter_dictionary_id_seq', 1, false);


--
-- TOC entry 2598 (class 0 OID 0)
-- Dependencies: 219
-- Name: filter_dictionary_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filter_dictionary_value_id_seq', 48, true);


--
-- TOC entry 2599 (class 0 OID 0)
-- Dependencies: 221
-- Name: filter_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filter_field_id_seq', 26, true);


--
-- TOC entry 2600 (class 0 OID 0)
-- Dependencies: 223
-- Name: filter_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filter_template_id_seq', 1, false);


--
-- TOC entry 2601 (class 0 OID 0)
-- Dependencies: 235
-- Name: form_field_dictionary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.form_field_dictionary_id_seq', 1, false);


--
-- TOC entry 2602 (class 0 OID 0)
-- Dependencies: 239
-- Name: form_field_dictionary_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.form_field_dictionary_value_id_seq', 1, false);


--
-- TOC entry 2603 (class 0 OID 0)
-- Dependencies: 237
-- Name: form_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.form_field_id_seq', 1, false);


--
-- TOC entry 2604 (class 0 OID 0)
-- Dependencies: 231
-- Name: form_template_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.form_template_group_id_seq', 1, false);


--
-- TOC entry 2605 (class 0 OID 0)
-- Dependencies: 233
-- Name: form_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.form_template_id_seq', 1, false);


--
-- TOC entry 2606 (class 0 OID 0)
-- Dependencies: 225
-- Name: global_filter_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.global_filter_field_id_seq', 22, true);


--
-- TOC entry 2607 (class 0 OID 0)
-- Dependencies: 227
-- Name: global_filter_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.global_filter_template_id_seq', 1, false);


--
-- TOC entry 2608 (class 0 OID 0)
-- Dependencies: 228
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 11662, true);


--
-- TOC entry 2253 (class 2606 OID 16607)
-- Name: audit_code audit_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_code
    ADD CONSTRAINT audit_code_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 16611)
-- Name: audit_event_template audit_event_template_code_id_event_type_unique_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_event_template
    ADD CONSTRAINT audit_event_template_code_id_event_type_unique_index UNIQUE (audit_code_id, event_type);


--
-- TOC entry 2257 (class 2606 OID 16613)
-- Name: audit_event_template audit_event_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_event_template
    ADD CONSTRAINT audit_event_template_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 16615)
-- Name: audit_group audit_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_group
    ADD CONSTRAINT audit_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2261 (class 2606 OID 16617)
-- Name: classifier_info classifier_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_info
    ADD CONSTRAINT classifier_info_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 17610)
-- Name: classifiers_configuration_history classifiers_configuration_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifiers_configuration_history
    ADD CONSTRAINT classifiers_configuration_history_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 16619)
-- Name: classifiers_configuration classifiers_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifiers_configuration
    ADD CONSTRAINT classifiers_configuration_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 17502)
-- Name: ers_request ers_request_id_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ers_request
    ADD CONSTRAINT ers_request_id_unique_idx UNIQUE (request_id);


--
-- TOC entry 2282 (class 2606 OID 16627)
-- Name: evaluation_log evaluation_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_log
    ADD CONSTRAINT evaluation_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 17504)
-- Name: evaluation_log evaluation_log_request_id_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_log
    ADD CONSTRAINT evaluation_log_request_id_unique_idx UNIQUE (request_id);


--
-- TOC entry 2288 (class 2606 OID 17508)
-- Name: evaluation_results_request evaluation_results_request_evaluation_log_id_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_results_request
    ADD CONSTRAINT evaluation_results_request_evaluation_log_id_unique_idx UNIQUE (evaluation_log_id);


--
-- TOC entry 2292 (class 2606 OID 16629)
-- Name: experiment experiment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment
    ADD CONSTRAINT experiment_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 16631)
-- Name: experiment_progress experiment_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment_progress
    ADD CONSTRAINT experiment_progress_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 16633)
-- Name: experiment_results experiment_results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment_results
    ADD CONSTRAINT experiment_results_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 17506)
-- Name: experiment_results_request experiment_results_request_experiment_results_id_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment_results_request
    ADD CONSTRAINT experiment_results_request_experiment_results_id_unique_idx UNIQUE (experiment_results_id);


--
-- TOC entry 2346 (class 2606 OID 17640)
-- Name: experiment_step experiment_step_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment_step
    ADD CONSTRAINT experiment_step_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 17544)
-- Name: form_field_dictionary form_field_dictionary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_field_dictionary
    ADD CONSTRAINT form_field_dictionary_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 17587)
-- Name: form_field_dictionary_value form_field_dictionary_value_dictionary_id_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_field_dictionary_value
    ADD CONSTRAINT form_field_dictionary_value_dictionary_id_unique_idx UNIQUE (value, dictionary_id);


--
-- TOC entry 2338 (class 2606 OID 17580)
-- Name: form_field_dictionary_value form_field_dictionary_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_field_dictionary_value
    ADD CONSTRAINT form_field_dictionary_value_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 2606 OID 17569)
-- Name: form_field form_field_name_template_id_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_field
    ADD CONSTRAINT form_field_name_template_id_unique_idx UNIQUE (field_name, template_id);


--
-- TOC entry 2334 (class 2606 OID 17557)
-- Name: form_field form_field_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_field
    ADD CONSTRAINT form_field_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 17518)
-- Name: form_template_group form_template_group_name_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_template_group
    ADD CONSTRAINT form_template_group_name_unique_idx UNIQUE (group_name);


--
-- TOC entry 2324 (class 2606 OID 17516)
-- Name: form_template_group form_template_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_template_group
    ADD CONSTRAINT form_template_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 17536)
-- Name: form_template form_template_name_unique_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_template
    ADD CONSTRAINT form_template_name_unique_idx UNIQUE (template_name);


--
-- TOC entry 2328 (class 2606 OID 17529)
-- Name: form_template form_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_template
    ADD CONSTRAINT form_template_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 16635)
-- Name: instances_info instances_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instances_info
    ADD CONSTRAINT instances_info_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 17623)
-- Name: message_template message_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_template
    ADD CONSTRAINT message_template_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 16637)
-- Name: classifier_input_options pk_classifier_input_options; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_input_options
    ADD CONSTRAINT pk_classifier_input_options PRIMARY KEY (id);


--
-- TOC entry 2265 (class 2606 OID 16639)
-- Name: classifier_options pk_classifier_options; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_options
    ADD CONSTRAINT pk_classifier_options PRIMARY KEY (id);


--
-- TOC entry 2267 (class 2606 OID 16641)
-- Name: classifier_options_request pk_classifier_options_request; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_options_request
    ADD CONSTRAINT pk_classifier_options_request PRIMARY KEY (id);


--
-- TOC entry 2270 (class 2606 OID 16643)
-- Name: classifier_options_request_model pk_classifier_options_request_model; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_options_request_model
    ADD CONSTRAINT pk_classifier_options_request_model PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 16645)
-- Name: classifier_options_response_model pk_classifier_options_response_model; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_options_response_model
    ADD CONSTRAINT pk_classifier_options_response_model PRIMARY KEY (id);


--
-- TOC entry 2276 (class 2606 OID 16647)
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- TOC entry 2280 (class 2606 OID 16649)
-- Name: ers_request pk_ers_request; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ers_request
    ADD CONSTRAINT pk_ers_request PRIMARY KEY (id);


--
-- TOC entry 2290 (class 2606 OID 16651)
-- Name: evaluation_results_request pk_evaluation_results_request; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_results_request
    ADD CONSTRAINT pk_evaluation_results_request PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 16653)
-- Name: experiment_results_request pk_experiment_results_request; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment_results_request
    ADD CONSTRAINT pk_experiment_results_request PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 16655)
-- Name: filter_dictionary pk_filter_dictionary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_dictionary
    ADD CONSTRAINT pk_filter_dictionary PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 16657)
-- Name: filter_dictionary_value pk_filter_dictionary_value; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_dictionary_value
    ADD CONSTRAINT pk_filter_dictionary_value PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 16659)
-- Name: filter_field pk_filter_field; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_field
    ADD CONSTRAINT pk_filter_field PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 16661)
-- Name: filter_template pk_filter_template; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_template
    ADD CONSTRAINT pk_filter_template PRIMARY KEY (id);


--
-- TOC entry 2314 (class 2606 OID 16663)
-- Name: global_filter_field pk_global_filter_field; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_filter_field
    ADD CONSTRAINT pk_global_filter_field PRIMARY KEY (id);


--
-- TOC entry 2316 (class 2606 OID 16665)
-- Name: global_filter_template pk_global_filter_template; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_filter_template
    ADD CONSTRAINT pk_global_filter_template PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 17500)
-- Name: retry_request retry_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retry_request
    ADD CONSTRAINT retry_request_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 16667)
-- Name: experiment uk_jhnoogjy4omq5anp6qb0nnfwq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment
    ADD CONSTRAINT uk_jhnoogjy4omq5anp6qb0nnfwq UNIQUE (request_id);


--
-- TOC entry 2343 (class 1259 OID 17647)
-- Name: experiment_step_experiment_id_step_order_unique_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX experiment_step_experiment_id_step_order_unique_idx ON public.experiment_step USING btree (experiment_id, step_order);


--
-- TOC entry 2344 (class 1259 OID 17646)
-- Name: experiment_step_experiment_id_step_unique_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX experiment_step_experiment_id_step_unique_idx ON public.experiment_step USING btree (experiment_id, step);


--
-- TOC entry 2268 (class 1259 OID 16668)
-- Name: idx_data_md5_hash; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_data_md5_hash ON public.classifier_options_request_model USING btree (data_md5_hash);


--
-- TOC entry 2285 (class 1259 OID 16669)
-- Name: idx_evaluation_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_evaluation_status ON public.evaluation_log USING btree (request_status);


--
-- TOC entry 2293 (class 1259 OID 16670)
-- Name: idx_experiment_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_experiment_status ON public.experiment USING btree (request_status);


--
-- TOC entry 2286 (class 1259 OID 16671)
-- Name: idx_request_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_request_id ON public.evaluation_log USING btree (request_id);


--
-- TOC entry 2294 (class 1259 OID 16672)
-- Name: idx_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_uuid ON public.experiment USING btree (request_id);


--
-- TOC entry 2347 (class 2606 OID 16673)
-- Name: audit_code fk_audit_code_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_code
    ADD CONSTRAINT fk_audit_code_group_id FOREIGN KEY (audit_group_id) REFERENCES public.audit_group(id);


--
-- TOC entry 2348 (class 2606 OID 16678)
-- Name: audit_event_template fk_audit_event_template_code_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_event_template
    ADD CONSTRAINT fk_audit_event_template_code_id FOREIGN KEY (audit_code_id) REFERENCES public.audit_code(id);


--
-- TOC entry 2349 (class 2606 OID 16683)
-- Name: classifier_input_options fk_classifier_input_options_classifier_info_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_input_options
    ADD CONSTRAINT fk_classifier_input_options_classifier_info_id FOREIGN KEY (classifier_info_id) REFERENCES public.classifier_info(id);


--
-- TOC entry 2350 (class 2606 OID 16688)
-- Name: classifier_options fk_classifier_options_classifiers_configuration_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_options
    ADD CONSTRAINT fk_classifier_options_classifiers_configuration_id FOREIGN KEY (configuration_id) REFERENCES public.classifiers_configuration(id);


--
-- TOC entry 2352 (class 2606 OID 16693)
-- Name: classifier_options_request_model fk_classifier_options_request_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_options_request_model
    ADD CONSTRAINT fk_classifier_options_request_id FOREIGN KEY (id) REFERENCES public.ers_request(id);


--
-- TOC entry 2353 (class 2606 OID 16698)
-- Name: classifier_options_response_model fk_classifier_options_request_model_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_options_response_model
    ADD CONSTRAINT fk_classifier_options_request_model_id FOREIGN KEY (classifier_options_request_model_id) REFERENCES public.classifier_options_request_model(id);


--
-- TOC entry 2372 (class 2606 OID 17611)
-- Name: classifiers_configuration_history fk_classifiers_configuration_history_configuration_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifiers_configuration_history
    ADD CONSTRAINT fk_classifiers_configuration_history_configuration_id FOREIGN KEY (configuration_id) REFERENCES public.classifiers_configuration(id);


--
-- TOC entry 2356 (class 2606 OID 16708)
-- Name: evaluation_results_request fk_evaluation_log; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_results_request
    ADD CONSTRAINT fk_evaluation_log FOREIGN KEY (evaluation_log_id) REFERENCES public.evaluation_log(id);


--
-- TOC entry 2354 (class 2606 OID 16713)
-- Name: evaluation_log fk_evaluation_log_classifier_info_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_log
    ADD CONSTRAINT fk_evaluation_log_classifier_info_id FOREIGN KEY (classifier_info_id) REFERENCES public.classifier_info(id);


--
-- TOC entry 2357 (class 2606 OID 16718)
-- Name: evaluation_results_request fk_evaluation_results_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_results_request
    ADD CONSTRAINT fk_evaluation_results_id FOREIGN KEY (id) REFERENCES public.ers_request(id);


--
-- TOC entry 2358 (class 2606 OID 17624)
-- Name: experiment fk_experiment_instances_info_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment
    ADD CONSTRAINT fk_experiment_instances_info_id FOREIGN KEY (instances_info_id) REFERENCES public.instances_info(id);


--
-- TOC entry 2359 (class 2606 OID 16723)
-- Name: experiment_progress fk_experiment_progress_experiment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment_progress
    ADD CONSTRAINT fk_experiment_progress_experiment_id FOREIGN KEY (experiment_id) REFERENCES public.experiment(id);


--
-- TOC entry 2360 (class 2606 OID 16728)
-- Name: experiment_results fk_experiment_results_classifier_info_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment_results
    ADD CONSTRAINT fk_experiment_results_classifier_info_id FOREIGN KEY (classifier_info_id) REFERENCES public.classifier_info(id);


--
-- TOC entry 2361 (class 2606 OID 16733)
-- Name: experiment_results fk_experiment_results_experiment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment_results
    ADD CONSTRAINT fk_experiment_results_experiment_id FOREIGN KEY (experiment_id) REFERENCES public.experiment(id);


--
-- TOC entry 2362 (class 2606 OID 16738)
-- Name: experiment_results_request fk_experiment_results_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment_results_request
    ADD CONSTRAINT fk_experiment_results_id FOREIGN KEY (id) REFERENCES public.ers_request(id);


--
-- TOC entry 2363 (class 2606 OID 16743)
-- Name: experiment_results_request fk_experiment_results_request_experiment_results_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment_results_request
    ADD CONSTRAINT fk_experiment_results_request_experiment_results_id FOREIGN KEY (experiment_results_id) REFERENCES public.experiment_results(id);


--
-- TOC entry 2373 (class 2606 OID 17641)
-- Name: experiment_step fk_experiment_step_experiment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiment_step
    ADD CONSTRAINT fk_experiment_step_experiment_id FOREIGN KEY (experiment_id) REFERENCES public.experiment(id);


--
-- TOC entry 2364 (class 2606 OID 16748)
-- Name: filter_dictionary_value fk_filter_dictionary_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_dictionary_value
    ADD CONSTRAINT fk_filter_dictionary_id FOREIGN KEY (filter_dictionary_id) REFERENCES public.filter_dictionary(id);


--
-- TOC entry 2365 (class 2606 OID 16753)
-- Name: filter_field fk_filter_field_dictionary_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_field
    ADD CONSTRAINT fk_filter_field_dictionary_id FOREIGN KEY (filter_dictionary_id) REFERENCES public.filter_dictionary(id);


--
-- TOC entry 2366 (class 2606 OID 16758)
-- Name: filter_field fk_filter_template_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_field
    ADD CONSTRAINT fk_filter_template_id FOREIGN KEY (filter_template_id) REFERENCES public.filter_template(id);


--
-- TOC entry 2370 (class 2606 OID 17563)
-- Name: form_field fk_form_field_dictionary_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_field
    ADD CONSTRAINT fk_form_field_dictionary_id FOREIGN KEY (dictionary_id) REFERENCES public.form_field_dictionary(id);


--
-- TOC entry 2371 (class 2606 OID 17581)
-- Name: form_field_dictionary_value fk_form_field_dictionary_value_dictionary_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_field_dictionary_value
    ADD CONSTRAINT fk_form_field_dictionary_value_dictionary_id FOREIGN KEY (dictionary_id) REFERENCES public.form_field_dictionary(id);


--
-- TOC entry 2368 (class 2606 OID 17530)
-- Name: form_template fk_form_template_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_template
    ADD CONSTRAINT fk_form_template_group_id FOREIGN KEY (group_id) REFERENCES public.form_template_group(id);


--
-- TOC entry 2369 (class 2606 OID 17558)
-- Name: form_field fk_form_template_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_field
    ADD CONSTRAINT fk_form_template_id FOREIGN KEY (template_id) REFERENCES public.form_template(id);


--
-- TOC entry 2367 (class 2606 OID 16763)
-- Name: global_filter_field fk_global_filter_template_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_filter_field
    ADD CONSTRAINT fk_global_filter_template_id FOREIGN KEY (global_filter_template_id) REFERENCES public.global_filter_template(id);


--
-- TOC entry 2351 (class 2606 OID 16768)
-- Name: classifier_options_request fk_options_request_model_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifier_options_request
    ADD CONSTRAINT fk_options_request_model_id FOREIGN KEY (classifier_options_request_model_id) REFERENCES public.classifier_options_request_model(id);


--
-- TOC entry 2355 (class 2606 OID 16773)
-- Name: evaluation_log fkb7kxwy0q4hr163cpup185xohp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_log
    ADD CONSTRAINT fkb7kxwy0q4hr163cpup185xohp FOREIGN KEY (instances_info_id) REFERENCES public.instances_info(id);


-- Completed on 2022-12-09 13:06:42 +07

--
-- PostgreSQL database dump complete
--

