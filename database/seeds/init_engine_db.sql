--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

-- Started on 2020-03-06 19:32:58 EST

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
-- TOC entry 1 (class 3079 OID 13039)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 24721)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 24758)
-- Name: accels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accels (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    accel_id uuid NOT NULL,
    description character varying(255) NOT NULL,
    patient_id uuid NOT NULL,
    x numeric,
    y numeric,
    z numeric,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.accels OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 24766)
-- Name: biometric; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.biometric (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    patient_id uuid NOT NULL,
    heart_rate numeric,
    blood_pressure numeric,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.biometric OWNER TO postgres;

--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN biometric.heart_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.biometric.heart_rate IS 'The heart rate of the patient in beats per minute';


--
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN biometric.blood_pressure; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.biometric.blood_pressure IS 'The blood pressure of the patient in mmHg';


--
-- TOC entry 199 (class 1259 OID 24774)
-- Name: game; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    game_id uuid NOT NULL,
    description character varying(255) NOT NULL,
    patient_id uuid NOT NULL,
    game_score integer,
    time_played integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.game OWNER TO postgres;

--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN game.time_played; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.game.time_played IS 'Game time played in seconds';


--
-- TOC entry 200 (class 1259 OID 24779)
-- Name: gyros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gyros (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    gyro_id uuid NOT NULL,
    description character varying(255) NOT NULL,
    patient_id uuid NOT NULL,
    x numeric,
    y numeric,
    z numeric,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.gyros OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 24787)
-- Name: test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    test_id uuid NOT NULL,
    description character varying(255) NOT NULL,
    patient_id uuid NOT NULL,
    test_score integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.test OWNER TO postgres;

-- Completed on 2020-03-06 19:32:58 EST

--
-- PostgreSQL database dump complete
--

