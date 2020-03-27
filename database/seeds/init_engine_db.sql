--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-2.pgdg18.04+1)

-- Started on 2020-03-24 20:17:31 EDT

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
-- TOC entry 2 (class 3079 OID 16937)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 3894 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

--
-- TOC entry 197 (class 1259 OID 16974)
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
-- TOC entry 198 (class 1259 OID 16982)
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
-- TOC entry 3895 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN biometric.heart_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.biometric.heart_rate IS 'The heart rate of the patient in beats per minute';


--
-- TOC entry 3896 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN biometric.blood_pressure; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.biometric.blood_pressure IS 'The blood pressure of the patient in mmHg';


--
-- TOC entry 202 (class 1259 OID 17024)
-- Name: emotion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emotion (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    patient_id uuid NOT NULL,
    dominant_emotion character varying(255) NOT NULL,
    neutral numeric,
    anger numeric,
    happiness numeric,
    surprise numeric,
    sadness numeric,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.emotion OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16990)
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
-- TOC entry 3897 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN game.time_played; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.game.time_played IS 'Game time played in seconds';


--
-- TOC entry 200 (class 1259 OID 16995)
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
-- TOC entry 201 (class 1259 OID 17003)
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

--
-- TOC entry 3752 (class 2606 OID 17009)
-- Name: accels accels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accels
    ADD CONSTRAINT accels_pkey PRIMARY KEY (id);


--
-- TOC entry 3756 (class 2606 OID 17011)
-- Name: biometric biometric_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biometric
    ADD CONSTRAINT biometric_pkey PRIMARY KEY (id);


--
-- TOC entry 3760 (class 2606 OID 17013)
-- Name: gyros gyros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gyros
    ADD CONSTRAINT gyros_pkey PRIMARY KEY (id);


--
-- TOC entry 3764 (class 2606 OID 17015)
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- TOC entry 3766 (class 2606 OID 17017)
-- Name: test unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT "unique" UNIQUE (id);


--
-- TOC entry 3762 (class 2606 OID 17019)
-- Name: gyros unique_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gyros
    ADD CONSTRAINT unique_id UNIQUE (id);


--
-- TOC entry 3758 (class 2606 OID 17021)
-- Name: biometric unique_id_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biometric
    ADD CONSTRAINT unique_id_constraint UNIQUE (id);


--
-- TOC entry 3754 (class 2606 OID 17023)
-- Name: accels unique_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accels
    ADD CONSTRAINT unique_pkey UNIQUE (id);


--
-- TOC entry 3893 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2020-03-24 20:17:52 EDT

--
-- PostgreSQL database dump complete
--

