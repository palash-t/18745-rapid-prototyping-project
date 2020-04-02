--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-2.pgdg18.04+1)

-- Started on 2020-03-28 15:54:36 EDT

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
-- TOC entry 2 (class 3079 OID 18281)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 3900 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

--
-- TOC entry 197 (class 1259 OID 18318)
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
-- TOC entry 198 (class 1259 OID 18326)
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
-- TOC entry 3901 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN biometric.heart_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.biometric.heart_rate IS 'The heart rate of the patient in beats per minute';


--
-- TOC entry 3902 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN biometric.blood_pressure; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.biometric.blood_pressure IS 'The blood pressure of the patient in mmHg';


--
-- TOC entry 199 (class 1259 OID 18334)
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
-- TOC entry 200 (class 1259 OID 18342)
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
-- TOC entry 3903 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN game.time_played; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.game.time_played IS 'Game time played in seconds';


--
-- TOC entry 201 (class 1259 OID 18347)
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
-- TOC entry 202 (class 1259 OID 18355)
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
-- TOC entry 3888 (class 0 OID 18318)
-- Dependencies: 197
-- Data for Name: accels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accels (id, accel_id, description, patient_id, x, y, z, created_at, updated_at, deleted_at) FROM stdin;
00000000-0000-0000-0000-000000000010	00000000-0000-0000-0001-000000000000	test accel 1	10000000-0000-0000-0000-000000000000	1	2	3	2020-03-27 19:49:24.824219	\N	\N
00000000-0000-0000-0000-000000000020	00000000-0000-0000-0002-000000000000	test accel 2	10000000-0000-0000-0000-000000000000	4	5	6	2020-03-27 19:49:24.824219	\N	\N
00000000-0000-0000-0000-000000000030	00000000-0000-0000-0001-000000000000	test accel 1	20000000-0000-0000-0000-000000000000	7	8	9	2020-03-27 19:49:24.824219	\N	\N
00000000-0000-0000-0000-000000000040	00000000-0000-0000-0002-000000000000	test accel 2	20000000-0000-0000-0000-000000000000	10	11	12	2020-03-27 19:49:24.824219	\N	\N
\.


--
-- TOC entry 3889 (class 0 OID 18326)
-- Dependencies: 198
-- Data for Name: biometric; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.biometric (id, patient_id, heart_rate, blood_pressure, created_at, updated_at, deleted_at) FROM stdin;
00000000-0000-0000-0000-000000000001	10000000-0000-0000-0000-000000000000	61	120	2020-03-27 19:49:24.751844	\N	\N
00000000-0000-0000-0000-000000000002	20000000-0000-0000-0000-000000000000	62	120	2020-03-27 19:49:24.751844	\N	\N
00000000-0000-0000-0000-000000000003	30000000-0000-0000-0000-000000000000	63	120	2020-03-27 19:49:24.751844	\N	\N
00000000-0000-0000-0000-000000000004	40000000-0000-0000-0000-000000000000	64	120	2020-03-27 19:49:24.751844	\N	\N
\.


--
-- TOC entry 3890 (class 0 OID 18334)
-- Dependencies: 199
-- Data for Name: emotion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emotion (id, patient_id, dominant_emotion, neutral, anger, happiness, surprise, sadness, created_at, updated_at, deleted_at) FROM stdin;
00000000-0000-0000-0000-000000100000	10000000-0000-0000-0000-000000000000	neutral	0.7	0.1	0.05	0.05	0.1	2020-03-27 19:49:25.1116	\N	\N
00000000-0000-0000-0000-000000200000	20000000-0000-0000-0000-000000000000	happiness	0.2	0.1	0.4	0.1	0.2	2020-03-27 19:49:25.1116	\N	\N
00000000-0000-0000-0000-000000300000	30000000-0000-0000-0000-000000000000	anger	0.1	0.9	0.0	0.0	0.0	2020-03-27 19:49:25.1116	\N	\N
00000000-0000-0000-0000-000000400000	40000000-0000-0000-0000-000000000000	surprise	0.2	0.1	0.1	0.5	0.1	2020-03-27 19:49:25.1116	\N	\N
00000000-0000-0000-0000-000000500000	50000000-0000-0000-0000-000000000000	sadness	0.0	0.0	0.0	0.4	0.5	2020-03-27 19:49:25.1116	\N	\N
\.


--
-- TOC entry 3891 (class 0 OID 18342)
-- Dependencies: 200
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game (id, game_id, description, patient_id, game_score, time_played, created_at, updated_at, deleted_at) FROM stdin;
00000000-0000-0000-0000-000000010000	00000001-0000-0000-0000-000000000000	test game 1	10000000-0000-0000-0000-000000000000	5	10	2020-03-27 19:49:25.039924	\N	\N
00000000-0000-0000-0000-000000020000	00000002-0000-0000-0000-000000000000	test game 2	10000000-0000-0000-0000-000000000000	6	11	2020-03-27 19:49:25.039924	\N	\N
00000000-0000-0000-0000-000000030000	00000001-0000-0000-0000-000000000000	test game 1	20000000-0000-0000-0000-000000000000	7	12	2020-03-27 19:49:25.039924	\N	\N
00000000-0000-0000-0000-000000040000	00000002-0000-0000-0000-000000000000	test game 2	20000000-0000-0000-0000-000000000000	8	13	2020-03-27 19:49:25.039924	\N	\N
\.


--
-- TOC entry 3892 (class 0 OID 18347)
-- Dependencies: 201
-- Data for Name: gyros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gyros (id, gyro_id, description, patient_id, x, y, z, created_at, updated_at, deleted_at) FROM stdin;
00000000-0000-0000-0000-000000000100	00000000-0000-0001-0000-000000000000	test gyro 1	10000000-0000-0000-0000-000000000000	1	2	3	2020-03-27 19:49:24.896337	\N	\N
00000000-0000-0000-0000-000000000200	00000000-0000-0002-0000-000000000000	test gyro 2	10000000-0000-0000-0000-000000000000	4	5	6	2020-03-27 19:49:24.896337	\N	\N
00000000-0000-0000-0000-000000000300	00000000-0000-0001-0000-000000000000	test gyro 1	20000000-0000-0000-0000-000000000000	7	8	9	2020-03-27 19:49:24.896337	\N	\N
00000000-0000-0000-0000-000000000400	00000000-0000-0002-0000-000000000000	test gyro 2	20000000-0000-0000-0000-000000000000	10	11	12	2020-03-27 19:49:24.896337	\N	\N
\.


--
-- TOC entry 3893 (class 0 OID 18355)
-- Dependencies: 202
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test (id, test_id, description, patient_id, test_score, created_at, updated_at, deleted_at) FROM stdin;
00000000-0000-0000-0000-000000001000	00000000-0001-0000-0000-000000000000	test 1	10000000-0000-0000-0000-000000000000	1	2020-03-27 19:49:24.968168	\N	\N
00000000-0000-0000-0000-000000002000	00000000-0002-0000-0000-000000000000	test 2	10000000-0000-0000-0000-000000000000	2	2020-03-27 19:49:24.968168	\N	\N
00000000-0000-0000-0000-000000003000	00000000-0001-0000-0000-000000000000	test 1	20000000-0000-0000-0000-000000000000	3	2020-03-27 19:49:24.968168	\N	\N
00000000-0000-0000-0000-000000004000	00000000-0002-0000-0000-000000000000	test 2	20000000-0000-0000-0000-000000000000	4	2020-03-27 19:49:24.968168	\N	\N
\.


--
-- TOC entry 3752 (class 2606 OID 18361)
-- Name: accels accels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accels
    ADD CONSTRAINT accels_pkey PRIMARY KEY (id);


--
-- TOC entry 3756 (class 2606 OID 18363)
-- Name: biometric biometric_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biometric
    ADD CONSTRAINT biometric_pkey PRIMARY KEY (id);


--
-- TOC entry 3760 (class 2606 OID 18365)
-- Name: gyros gyros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gyros
    ADD CONSTRAINT gyros_pkey PRIMARY KEY (id);


--
-- TOC entry 3764 (class 2606 OID 18367)
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- TOC entry 3766 (class 2606 OID 18369)
-- Name: test unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT "unique" UNIQUE (id);


--
-- TOC entry 3762 (class 2606 OID 18371)
-- Name: gyros unique_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gyros
    ADD CONSTRAINT unique_id UNIQUE (id);


--
-- TOC entry 3758 (class 2606 OID 18373)
-- Name: biometric unique_id_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biometric
    ADD CONSTRAINT unique_id_constraint UNIQUE (id);


--
-- TOC entry 3754 (class 2606 OID 18375)
-- Name: accels unique_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accels
    ADD CONSTRAINT unique_pkey UNIQUE (id);


--
-- TOC entry 3899 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2020-03-28 15:54:53 EDT

--
-- PostgreSQL database dump complete
--

