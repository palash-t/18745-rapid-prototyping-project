--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-2.pgdg18.04+1)

-- Started on 2020-04-24 15:56:24 EDT

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
-- TOC entry 2 (class 3079 OID 25234)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 3937 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

--
-- TOC entry 197 (class 1259 OID 25271)
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
-- TOC entry 198 (class 1259 OID 25279)
-- Name: biometric; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.biometric (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    patient_id uuid NOT NULL,
    heart_rate numeric,
    sbp numeric,
    dbp numeric,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.biometric OWNER TO postgres;

--
-- TOC entry 3938 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN biometric.heart_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.biometric.heart_rate IS 'The heart rate of the patient in beats per minute';


--
-- TOC entry 3939 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN biometric.sbp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.biometric.sbp IS 'The systolic blood pressure of the patient in mmHg';


--
-- TOC entry 3940 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN biometric.dbp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.biometric.dbp IS 'The diastolic blood pressure of the patient in mmHg';


--
-- TOC entry 199 (class 1259 OID 25287)
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
-- TOC entry 200 (class 1259 OID 25295)
-- Name: game; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    game_id uuid NOT NULL,
    description character varying(255) NOT NULL,
    patient_id uuid NOT NULL,
    left_hand_score integer,
    right_hand_score integer,
    time_played integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.game OWNER TO postgres;

--
-- TOC entry 3941 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN game.time_played; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.game.time_played IS 'Game time played in seconds';


--
-- TOC entry 201 (class 1259 OID 25300)
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
-- TOC entry 202 (class 1259 OID 25308)
-- Name: medication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medication (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    patient_id uuid NOT NULL,
    device_id uuid NOT NULL,
    scheduled_time character varying(255) NOT NULL,
    response boolean,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.medication OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 25313)
-- Name: personal_check_in; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_check_in (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    patient_id uuid NOT NULL,
    category character varying(255) NOT NULL,
    value character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.personal_check_in OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 25321)
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
-- TOC entry 205 (class 1259 OID 25349)
-- Name: trajectories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trajectories (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    description character varying(255) NOT NULL,
    patient_id uuid NOT NULL,
    x numeric,
    y numeric,
    z numeric,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.trajectories OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 25357)
-- Name: tremor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tremor (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    description character varying(255) NOT NULL,
    patient_id uuid NOT NULL,
    stationary boolean,
    severity integer,
    displacement numeric,
    frequency numeric,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.tremor OWNER TO postgres;

--
-- TOC entry 3942 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN tremor.stationary; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tremor.stationary IS 'The stationary status of the patient - true or false';


--
-- TOC entry 3943 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN tremor.severity; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tremor.severity IS 'The severity of the tremors expressed as a numeric value';


--
-- TOC entry 3944 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN tremor.displacement; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tremor.displacement IS 'The displacement of the tremors, expressed as a numeric value';


--
-- TOC entry 3945 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN tremor.frequency; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tremor.frequency IS 'The frequency of the tremors in Hz';


--
-- TOC entry 3921 (class 0 OID 25271)
-- Dependencies: 197
-- Data for Name: accels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accels (id, accel_id, description, patient_id, x, y, z, created_at, updated_at, deleted_at) FROM stdin;
55ced28a-be6b-48b4-9b2f-3dd8a2a634fc	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.3	-64.82	997.68	2020-04-21 00:17:30.223341	\N	\N
feb82fa1-58a5-450e-8f3e-67830d1c7969	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-5.8	-64.45	996.52	2020-04-21 00:17:30.6426	\N	\N
054662fc-9cd2-4ccc-899f-a7b0de053701	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.66	-65.0	1000.31	2020-04-21 00:17:31.121888	\N	\N
8f85bd21-af38-4673-8581-a22db157c878	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-2.81	-63.66	995.85	2020-04-21 00:17:32.22589	\N	\N
1d3cb45d-1e38-4558-9e8a-3ae1e4a1c96a	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-2.01	-64.15	996.46	2020-04-21 00:17:33.342901	\N	\N
849bef96-3503-4c89-8201-911db2ef5cf4	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.36	-63.9	995.0	2020-04-21 00:17:34.527755	\N	\N
9f097e21-e986-4e13-9235-594449765bdf	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-5.37	-62.5	995.67	2020-04-21 00:17:35.56781	\N	\N
91f03f51-3d72-4635-b02a-e6d6607ebd1a	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-6.71	-66.71	997.92	2020-04-21 00:17:36.677616	\N	\N
42234ab2-cf60-4e33-934e-d650c0dc29c1	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-4.27	-66.47	1004.7	2020-04-21 00:17:37.788136	\N	\N
18ff9f78-4685-494e-bc00-ec4644865385	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-2.44	-66.22	999.82	2020-04-21 00:17:38.908723	\N	\N
3545394b-6e3b-43dd-873e-fd06f5e4ad79	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-6.9	-66.89	996.89	2020-04-21 00:17:40.007634	\N	\N
33e1d28f-9f86-4b4f-9553-86949ef37e41	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.11	-64.94	996.34	2020-04-21 00:17:41.107853	\N	\N
06f9b972-a05e-4680-b2d8-3184ffa476f8	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-4.03	-67.44	996.52	2020-04-21 00:17:42.208174	\N	\N
f9c6e6d2-6a4f-41a6-a530-d7b5c375463b	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-4.52	-65.98	998.9	2020-04-21 00:17:43.315967	\N	\N
fefeb897-70eb-4528-9432-95e0a7c0931b	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-4.94	-66.65	1000.12	2020-04-21 00:17:44.425853	\N	\N
3cf18553-17ae-4cfb-b490-a0853684d086	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.6	-68.54	998.9	2020-04-21 00:17:45.534948	\N	\N
92a6598b-78f3-47ca-98ed-7506877d280a	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-5.07	-65.25	1002.2	2020-04-21 00:17:46.643676	\N	\N
3a992d7a-623b-485d-9d55-92f5b3b7c79a	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-2.81	-67.44	1003.11	2020-04-21 00:17:47.768113	\N	\N
76adb0a7-7c3c-4810-8d1e-0e4b8a8dd65b	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.66	-65.55	995.79	2020-04-21 00:17:48.86389	\N	\N
b79345bf-9f95-4eb0-82d2-41acf30f01e1	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.42	-63.17	997.92	2020-04-21 00:17:49.97027	\N	\N
46387205-3f56-403e-add6-57077d660c3a	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-1.71	-66.65	999.39	2020-04-21 00:17:51.081577	\N	\N
ebda1275-a720-4abf-b62a-40febe31303f	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-1.34	-61.71	998.96	2020-04-21 00:17:52.191932	\N	\N
129b241d-4d12-4413-ad9b-b0075f24ddaa	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-4.21	-65.67	994.93	2020-04-21 00:17:53.311073	\N	\N
e49c3ae2-9aeb-47e3-9d86-6dde6b3bc0c2	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-6.23	-62.32	998.17	2020-04-21 00:17:54.422332	\N	\N
e4299b10-5cbb-4a8d-979c-30c2a08251b7	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.6	-64.94	999.08	2020-04-21 00:17:55.538679	\N	\N
447d8525-258e-41bf-a734-967854db4542	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.6	-63.84	1001.04	2020-04-21 00:17:56.648353	\N	\N
cb116171-02a9-446e-b156-7858f3ed1776	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-4.76	-65.61	1003.91	2020-04-21 00:17:57.757951	\N	\N
3d456c9f-01b5-4ef2-ac7d-6a08fc7db720	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.78	-66.89	998.23	2020-04-21 00:17:58.87113	\N	\N
b670191f-24ff-4814-8620-e2bd54e5c34c	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-6.71	-63.23	998.05	2020-04-21 00:18:00.051899	\N	\N
50889f52-11b0-41b2-a78c-7c1c6a570ce5	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-4.7	-64.33	998.54	2020-04-21 00:18:01.061731	\N	\N
00a0d28f-b455-4677-b9a8-946ae7662d1c	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	0.0	-63.29	1001.16	2020-04-21 00:18:02.169791	\N	\N
d31d10b8-6e91-47c1-b996-e6234b6f2757	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-1.83	-63.96	998.9	2020-04-21 00:18:03.280058	\N	\N
a092fb17-1e0e-4186-929d-c046037009f2	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.11	-62.81	1000.06	2020-04-21 00:18:04.387598	\N	\N
0fa1036c-7b09-4f89-b2a3-c7d43cb95ee1	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-4.03	-63.66	997.25	2020-04-21 00:18:05.50535	\N	\N
a1439c8e-d435-44b7-bf55-bf11e4fd3b8f	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-4.09	-62.01	1001.71	2020-04-21 00:18:06.620713	\N	\N
4418b7a3-3ee4-4025-b861-7d943d139a62	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.23	-67.5	1003.05	2020-04-21 00:18:07.732003	\N	\N
8f1fcaed-ba64-4b4a-8e9f-f97dd74fd254	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.66	-66.89	997.38	2020-04-21 00:18:08.826375	\N	\N
fbd8f5e3-d8ea-443f-896d-f2bea49b3eb6	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-4.7	-63.96	998.05	2020-04-21 00:18:10.01864	\N	\N
7fd4b0ee-3dce-457d-93a9-6a592b55b68d	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-5.19	-67.44	1000.0	2020-04-21 00:18:11.069026	\N	\N
084ff2bd-5bd6-4db1-b019-9f5ba7b77d9e	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.6	-67.69	997.13	2020-04-21 00:18:12.177691	\N	\N
1f2a2846-26c3-4126-8a8c-9ab6324c9414	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-4.21	-66.53	997.74	2020-04-21 00:18:13.277891	\N	\N
e65221d6-275f-4033-a37d-6abb6901db56	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-5.13	-62.74	1000.12	2020-04-21 00:18:14.387423	\N	\N
97396f2d-9e38-40a9-8f38-0070968e1155	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.05	-62.13	1000.37	2020-04-21 00:18:15.497509	\N	\N
3698cc3b-3287-4dad-bd05-0457e48266ea	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.36	-65.12	999.08	2020-04-21 00:18:16.598211	\N	\N
0e9cccf2-def8-463c-8b77-47967127f75f	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.36	-65.61	1002.5	2020-04-21 00:18:17.707454	\N	\N
9b23e1a9-8bef-41f7-a045-7615287ab467	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-6.23	-66.47	1001.28	2020-04-21 00:18:18.82744	\N	\N
93d824cb-98f3-4a45-8a9c-8ab9636afdcd	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-2.2	-66.83	998.72	2020-04-21 00:18:19.940798	\N	\N
6192aa10-18f2-48e9-a2e3-917f077b5adb	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-5.0	-61.83	1000.0	2020-04-21 00:18:21.047984	\N	\N
68776850-7ff3-4f28-aadf-082b5a01dac1	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-2.56	-62.74	996.09	2020-04-21 00:18:22.150085	\N	\N
93feffd8-0650-4443-b2eb-a601070b4124	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.66	-66.35	993.04	2020-04-21 00:18:23.242512	\N	\N
3ea0fb56-56fc-4567-bd1f-d22a6aed4e2f	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-5.62	-61.71	1001.34	2020-04-21 00:18:24.352185	\N	\N
f89f186b-2da2-461c-a67d-054e4f3deea9	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.67	-67.5	995.0	2020-04-21 00:18:25.462645	\N	\N
852d2a26-a708-4d1e-a8e7-54599b8d9ca8	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-1.4	-64.39	1000.98	2020-04-21 00:18:26.57105	\N	\N
3d6cf67c-83fa-490c-a6e5-a695df03fec4	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.17	-63.48	998.66	2020-04-21 00:18:27.679118	\N	\N
9239adae-7a36-4953-967b-3e113e1dae67	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-4.39	-62.99	1001.53	2020-04-21 00:18:28.78955	\N	\N
6ed7dadb-231b-41f4-881b-472906c6f81a	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-4.82	-64.94	996.15	2020-04-21 00:18:29.895615	\N	\N
dcbc434a-e722-425f-9a96-d6ad832e1c19	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-3.66	-67.38	998.6	2020-04-21 00:18:31.006955	\N	\N
a657a7e1-a577-46c3-8495-3c847e3e7a99	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-5.19	-61.04	997.13	2020-04-21 00:18:32.114358	\N	\N
463f2f4d-06b8-492a-9369-f0b2414f1905	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-6.41	-64.15	994.26	2020-04-21 00:18:33.228613	\N	\N
04c9dfe1-91fe-4ff9-90ea-0a369a24fac3	f9293421-f20a-4139-828d-8406d96a11ff	patient accelorometer data	fb4711c3-b412-49b4-9045-ed9a10d66862	-1.71	-65.49	998.29	2020-04-21 00:18:34.331719	\N	\N
a63f09dc-321e-4dda-a87d-59df68dd04da	69cea2f3-5f90-4e5d-b21f-a95a9af4c5b6	patient dashboard local test	585e8a5c-5a08-4398-bb57-55c9a4ed1180	2.3	2.3	2.3	2020-04-21 00:21:13.025693	\N	\N
eea297ac-bd8f-48c8-ad57-bd18e2aaa645	33789d3a-e9e5-4190-8660-443959654791	patient dashboard local test	beb1bf63-b243-41f4-8644-b914a29f2229	2.3	2.3	2.3	2020-04-21 00:25:22.442157	\N	\N
af32b354-0583-4a5d-87a6-e3ea910d463f	351fed30-2fcd-4842-a047-646c9b20ac0b	patient dashboard local test	17cd3489-5a6b-4333-a78f-508044546310	2.3	2.3	2.3	2020-04-21 00:26:03.569716	\N	\N
c01bfdf2-4032-45fb-b9fa-7d64c403cd38	738ea5c6-39e6-49f8-b012-75d17d3c6910	patient dashboard local test	687c40e1-0544-4168-9b14-0139948a3f79	2.3	2.3	2.3	2020-04-21 00:37:54.438117	\N	\N
6fb3c3b3-7d9a-44a8-b3ef-cb6ab3ba3114	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	62.56	36.32	962.46	2020-04-21 00:41:12.089181	\N	\N
5fe24909-20cf-488d-998c-3560a2d65969	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	64.82	53.34	991.7	2020-04-21 00:41:12.50597	\N	\N
28671af8-2709-49e1-b15e-0bc2b4b02ae9	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	30.58	-637.82	847.05	2020-04-21 00:41:13.013724	\N	\N
e2da0e61-466c-452a-b22c-057d26abde9b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.43	128.91	1000.18	2020-04-21 00:41:15.386389	\N	\N
957a7262-b26b-4097-837d-0d597bf8eaf0	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	73.43	-404.54	962.46	2020-04-21 00:41:15.802469	\N	\N
1754ea9b-26a3-4074-9787-91481d7a1300	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	47.06	-565.43	879.27	2020-04-21 00:41:16.325175	\N	\N
fe438f5b-1209-4bb3-890f-b6e8525e1cbc	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	15.81	353.82	868.53	2020-04-21 00:41:17.425999	\N	\N
cc28ddf5-4e9e-44f0-a668-a52f8d7d769c	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	56.64	145.63	952.21	2020-04-21 00:41:18.535726	\N	\N
1ae30f9d-b6af-4f5a-802d-78b635e2fa45	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	165.83	-31.43	949.95	2020-04-21 00:41:19.645586	\N	\N
bbed6045-824d-44ea-91a5-e402a4ef3b60	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	104.68	-67.5	988.16	2020-04-21 00:41:20.755223	\N	\N
9df4c24b-09d6-44a5-bd71-692ae449fcfe	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	128.66	-124.82	999.51	2020-04-21 00:41:21.866631	\N	\N
5a940622-c1b6-468e-a1af-349f0b712fef	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.77	-97.84	1000.06	2020-04-21 00:41:23.234146	\N	\N
05d82cc1-0da1-4766-b3b7-7c52b200877a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.31	-103.21	1003.91	2020-04-21 00:41:24.1093	\N	\N
92693c7d-b9d4-4a2d-ab1e-973e73d63f20	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.7	-93.75	997.31	2020-04-21 00:41:25.206957	\N	\N
5ead99d1-a526-4d41-8cee-f7c8cb250d9c	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.69	-99.91	999.39	2020-04-21 00:41:26.306062	\N	\N
f7f626e0-e3e1-48ac-a807-9deb4db2e1d9	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.43	-95.15	996.7	2020-04-21 00:41:27.415875	\N	\N
26e3e9fe-afdc-48d3-b188-c0f0f901e7e0	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.43	-97.05	1000.55	2020-04-21 00:41:28.526055	\N	\N
536a1fac-7d8e-4b5c-afd3-3e389352e923	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.04	-92.96	996.34	2020-04-21 00:41:29.626739	\N	\N
05136d4f-7fad-45db-b571-080cfca72fae	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.28	-96.86	998.23	2020-04-21 00:41:30.736002	\N	\N
611083c4-a8f9-43b8-b4a7-7e09afcbd8e1	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.12	-97.9	1000.55	2020-04-21 00:41:31.845735	\N	\N
eb24ba78-93e1-4a76-8144-46cba389ca84	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.12	-97.11	1001.04	2020-04-21 00:41:32.956806	\N	\N
61e55fc4-7f48-4f76-b5d7-dfb454fc29f7	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.56	-92.9	1002.75	2020-04-21 00:41:34.065825	\N	\N
ca698cf2-4c7a-48fe-ae18-f59f11d222b8	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.22	-95.95	999.82	2020-04-21 00:41:35.17629	\N	\N
439118c4-0047-4656-b803-7654c5e79258	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.53	-95.28	995.85	2020-04-21 00:41:36.285835	\N	\N
f28fd99a-27f2-4148-8d1d-371b4252cc77	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.85	-94.12	998.23	2020-04-21 00:41:37.395836	\N	\N
b2a79300-9397-4e47-8083-bceab4434cd9	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.73	-95.34	999.82	2020-04-21 00:41:38.507442	\N	\N
762943de-5566-4498-bb13-eafdb5d26aa1	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.38	-93.14	996.58	2020-04-21 00:41:39.617183	\N	\N
b858576d-9b98-4938-aa63-8e756439c11d	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.2	-92.71	999.82	2020-04-21 00:41:40.890665	\N	\N
bd062d99-4aba-4312-b22c-b2c0f0566fd5	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.98	-95.58	998.96	2020-04-21 00:41:41.825691	\N	\N
b0b8697f-3032-4bc8-92ce-f548ef886e36	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.59	-96.5	1005.37	2020-04-21 00:41:43.144484	\N	\N
d3396b6e-299e-4f02-a99d-46c2f90dddec	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.31	-96.56	999.94	2020-04-21 00:41:44.049699	\N	\N
5a34c45f-7e16-4656-b1b1-87197caedcd9	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.59	-96.56	997.31	2020-04-21 00:41:45.16757	\N	\N
ab5c4084-911f-4afa-85bb-636b49c9a145	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.06	-98.27	996.58	2020-04-21 00:41:46.26561	\N	\N
b8ed595e-4917-4474-be3e-9477aa34b335	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.12	-95.76	997.38	2020-04-21 00:41:47.380141	\N	\N
aedfecc9-80b9-4f27-b066-e617cb5fc621	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.75	-99.43	1000.24	2020-04-21 00:41:48.497789	\N	\N
e5156c3d-14b1-4773-8c8a-a359a879fae7	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.12	-97.29	997.13	2020-04-21 00:41:49.60778	\N	\N
f074320f-b55d-405e-8998-67a6531a3566	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.85	-97.53	995.54	2020-04-21 00:41:50.706059	\N	\N
2b321628-af6e-4a12-a1d2-839c1e9e755b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.46	-97.17	998.17	2020-04-21 00:41:51.806516	\N	\N
f7c4a67f-2d12-4953-9ebc-7765a1b69d77	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.22	-96.19	1002.01	2020-04-21 00:41:52.915873	\N	\N
64f62f9f-8322-41dd-88cb-5f9a4946b2ad	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.22	-95.52	1001.83	2020-04-21 00:41:54.027119	\N	\N
c0d4f831-0907-420f-93aa-64ce2b982f4b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.73	-96.31	999.21	2020-04-21 00:41:55.136979	\N	\N
f766e3eb-f641-48fa-99f5-f9ff2bb0e62a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.75	-97.47	999.88	2020-04-21 00:41:56.251283	\N	\N
de5c224b-bff0-431b-b675-34ac6a7b7171	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.24	-95.76	999.27	2020-04-21 00:41:57.35729	\N	\N
b8e38d86-e3ac-478c-8f6f-65a7ff77a628	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.37	-96.13	1002.14	2020-04-21 00:41:58.477951	\N	\N
c9bf99a7-4da4-4eaf-bf2d-1df288fc1f2e	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.92	-96.13	998.05	2020-04-21 00:41:59.559891	\N	\N
3e7cadf8-b92d-4d4b-9b55-bf7090faa49c	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.31	-94.6	1000.85	2020-04-21 00:42:00.670345	\N	\N
00e0e9cc-14e3-4443-8456-a5ec4428f714	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.49	-96.86	998.6	2020-04-21 00:42:01.779324	\N	\N
c359df01-7f64-4827-a007-b78b8531bec5	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.12	-96.74	997.07	2020-04-21 00:42:02.903499	\N	\N
4073814e-5d64-4522-80dd-ec67f7a12875	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.83	-96.37	1000.31	2020-04-21 00:42:04.002393	\N	\N
6ab4fbbc-4641-4f8f-b7c3-7a8db42336ff	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.37	-95.46	1005.86	2020-04-21 00:42:05.17563	\N	\N
7412cdaf-429e-45de-bfc2-8053ca17bb97	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.43	-97.41	997.01	2020-04-21 00:42:06.265946	\N	\N
2c505c33-6ee1-4b1a-8d70-7af6a5d59a6b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.1	-94.24	996.4	2020-04-21 00:42:07.337278	\N	\N
2afd4281-da10-4461-851d-fc5767c571e5	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.59	-94.91	1001.46	2020-04-21 00:42:08.446506	\N	\N
6eb02bfd-fc9f-42cc-961e-367674163342	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.04	-98.08	994.32	2020-04-21 00:42:09.557923	\N	\N
cee7d5e6-eca8-4fdd-bb5f-05b1b90e8975	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.65	-96.68	997.86	2020-04-21 00:42:11.777819	\N	\N
1a4f93af-6651-4be4-adf5-c75e2618ace7	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.83	-97.41	997.44	2020-04-21 00:42:12.193839	\N	\N
834224c3-813c-4dd1-8e8f-2a2772e90585	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.73	-94.6	1001.71	2020-04-21 00:42:13.357004	\N	\N
9744bb35-06ea-435c-a93a-d1bfd589df78	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.22	-95.03	999.39	2020-04-21 00:42:14.007947	\N	\N
f213d825-0744-49a7-8381-331d55efe173	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.85	-97.47	999.94	2020-04-21 00:42:15.09625	\N	\N
7fae5f95-911e-44c4-9895-624e13e90889	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.31	-94.18	999.63	2020-04-21 00:42:16.206341	\N	\N
2018f297-c64e-45ba-ad44-7b95b1ec7d9b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.43	-95.09	994.08	2020-04-21 00:42:17.316828	\N	\N
05907888-ca29-4bf4-a850-71717dd95b02	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.73	-95.4	996.95	2020-04-21 00:42:18.42605	\N	\N
6ba87f7d-a3f7-4a32-a182-a703a445f569	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.37	-96.37	994.45	2020-04-21 00:42:19.542344	\N	\N
49e924c8-2192-458d-818a-c612b194f29a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.34	-96.68	1000.18	2020-04-21 00:42:20.646041	\N	\N
85a3e17f-0a31-41b4-9913-a4234fab0317	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.89	-92.35	1000.43	2020-04-21 00:42:21.756349	\N	\N
f6a16cc4-6d00-4d63-b54b-5ba3ca5778b1	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.18	-97.6	1000.06	2020-04-21 00:42:22.866954	\N	\N
9ce66980-f9e0-4f0f-a1ae-02a3ee3ff3fd	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.09	-92.41	994.57	2020-04-21 00:42:23.975996	\N	\N
c150365a-80e8-4a6e-82ec-57a52377bfa3	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.55	-94.91	1002.08	2020-04-21 00:42:25.085929	\N	\N
b37f7ba1-3ab4-481f-89c4-2a2d8947534a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.24	-91.43	1001.4	2020-04-21 00:42:26.195571	\N	\N
9816bded-2db5-472e-bca0-72e63e61f6f2	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.32	-96.13	995.12	2020-04-21 00:42:27.289971	\N	\N
b18217aa-5891-4461-972b-33d352b4a29f	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.93	-97.29	993.35	2020-04-21 00:42:28.475988	\N	\N
fab02b62-a035-4edd-90b6-c52b5bf69fc6	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.46	-99.55	998.66	2020-04-21 00:42:29.51584	\N	\N
8671af31-e7cf-423a-899a-7b4324aea81f	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.34	-97.23	998.11	2020-04-21 00:42:30.629881	\N	\N
0756290d-02a4-48cc-b92c-b415aa5021df	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.81	-95.89	999.69	2020-04-21 00:42:31.738676	\N	\N
ef257de3-8d3d-4e69-b63f-b4031d44531f	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.43	-96.44	997.38	2020-04-21 00:42:32.846158	\N	\N
96a1486b-59b5-403c-b602-6cc533c6c244	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.85	-93.75	998.6	2020-04-21 00:42:33.957324	\N	\N
d9e6b1dc-9a9e-48db-8b1f-03837a27f397	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.37	-99.37	997.19	2020-04-21 00:42:35.065821	\N	\N
2717eb57-84cc-43ca-8ce7-0653de0e1585	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.67	-93.63	1003.78	2020-04-21 00:42:36.175852	\N	\N
ef63c14f-9e67-4aa4-a0ab-dbc862ae5cdd	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.18	-97.47	997.07	2020-04-21 00:42:37.287372	\N	\N
c830d421-df0f-49f2-8377-8536db85be0d	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.79	-93.44	995.3	2020-04-21 00:42:38.386805	\N	\N
95c95fa8-7102-4a65-89d3-2254689f9539	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.98	-96.92	998.84	2020-04-21 00:42:39.514575	\N	\N
46810c48-07a7-4b3d-a0e7-f6fbe3b425b7	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.73	-96.92	998.05	2020-04-21 00:42:40.60849	\N	\N
6794d193-9518-4045-b9d0-74650b91534a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.85	-96.37	999.63	2020-04-21 00:42:41.715582	\N	\N
c0c64eef-6599-4460-8cae-938b5e27b4bf	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.4	-99.12	1001.22	2020-04-21 00:42:42.828975	\N	\N
25216cce-69c1-4552-ae8c-2c640b95204c	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.53	-94.3	996.77	2020-04-21 00:42:43.937113	\N	\N
f2d7a9eb-1c6b-488d-a80b-55fb101f28d6	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.34	-93.81	998.66	2020-04-21 00:42:45.049989	\N	\N
0419f728-a308-4c05-b8b5-494bb4922013	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.18	-95.4	1002.81	2020-04-21 00:42:46.155589	\N	\N
f5623d06-3b91-4611-8eaf-ddcbde3f78db	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.49	-96.56	1001.77	2020-04-21 00:42:47.266986	\N	\N
d6c6541c-f7e0-43c0-b2bd-de180263feec	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.49	-93.2	994.38	2020-04-21 00:42:48.390669	\N	\N
4d4db6c2-cb00-4595-be43-da6d885d4d98	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.12	-94.3	997.99	2020-04-21 00:42:49.517874	\N	\N
adae1648-379a-4b30-823c-393c509b137d	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.43	-93.26	998.11	2020-04-21 00:42:50.596083	\N	\N
bcf42dec-ebe1-4bf3-827b-4f0bb13cd275	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.71	-93.2	997.01	2020-04-21 00:42:51.705459	\N	\N
8bea13a5-b598-43b7-8cf1-89d2702d80e9	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.49	-93.81	999.76	2020-04-21 00:42:52.816477	\N	\N
63a3840b-9fcd-4397-b265-77f632dca176	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.1	-97.9	999.57	2020-04-21 00:42:53.919579	\N	\N
634edbc0-c1f3-4e1b-baf0-5ae4955c2d2c	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.34	-98.45	1000.49	2020-04-21 00:42:55.018989	\N	\N
f70609c1-3483-4115-b136-7d3003e9d535	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.18	-94.18	1000.98	2020-04-21 00:42:56.121905	\N	\N
aad3f9a1-952e-447d-b28c-a57eb0368f85	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.22	-99.55	1003.6	2020-04-21 00:42:57.231135	\N	\N
84f9129e-b1bd-4f3d-adf4-d26d815d51d5	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.01	-100.52	995.97	2020-04-21 00:42:58.340154	\N	\N
d9438f77-ecdd-41ee-9df6-e8fb4b06b932	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.26	-91.43	998.54	2020-04-21 00:42:59.657519	\N	\N
a842adef-7efa-4f53-8734-7046ae23d365	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.31	-95.58	1000.61	2020-04-21 00:43:00.606679	\N	\N
274818ce-3770-49cc-be24-98b3745ddbae	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.46	-96.86	997.62	2020-04-21 00:43:01.683562	\N	\N
9e425142-c0f6-495f-97d9-a538a9f013d0	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.31	-96.62	996.28	2020-04-21 00:43:02.791951	\N	\N
b88cf3c2-5244-4a80-a94a-99e47c21bba8	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.79	-97.96	996.7	2020-04-21 00:43:03.903774	\N	\N
71b43771-2e03-4d59-a5b1-0abc184213c8	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.26	-94.85	1001.16	2020-04-21 00:43:04.994625	\N	\N
ec568c1b-ace6-437c-bbb9-c521ed01045a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	-94.48	1000.49	2020-04-21 00:43:06.119856	\N	\N
aa439522-85bc-46fa-b940-16b4a8389a2d	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.12	-98.51	1002.75	2020-04-21 00:43:07.211782	\N	\N
f8b9a612-1bb8-4a4d-b68d-9fefc50cc309	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.22	-93.02	999.15	2020-04-21 00:43:08.338764	\N	\N
55d04dd0-8e5f-49f2-8ee6-e7da2bd5f2df	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.77	-96.8	996.22	2020-04-21 00:43:09.521347	\N	\N
d1526a92-7d4f-4d6c-af61-7986f8ea3ffa	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.77	-94.06	1004.15	2020-04-21 00:43:10.5575	\N	\N
6192e5e2-09a9-43d9-ab63-b5163cda754c	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.49	-97.6	998.6	2020-04-21 00:43:11.665919	\N	\N
d0a74471-83fa-4fa6-88b1-055d95e6ba03	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.71	-98.14	1002.5	2020-04-21 00:43:12.872069	\N	\N
154030e7-d9b8-418d-a669-b1cda0a57d36	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.77	-95.15	998.6	2020-04-21 00:43:13.877696	\N	\N
b3adf683-de4a-4f51-bbfb-b7bf52041ace	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.98	-96.37	1000.49	2020-04-21 00:43:14.985941	\N	\N
4407f0bc-9f24-4527-acdd-34385022d220	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.79	-95.76	997.01	2020-04-21 00:43:17.346253	\N	\N
90a79caa-b8f3-4dc4-9a17-77961ad9ae19	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.81	-93.81	1000.18	2020-04-21 00:43:17.763136	\N	\N
e762a1ad-97f9-4c98-aa74-feb38a1822e2	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	-98.14	998.35	2020-04-21 00:43:18.317208	\N	\N
d197d1b8-dde2-4eb3-ab1c-5aa209c5845a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.1	-95.34	997.92	2020-04-21 00:43:19.465813	\N	\N
9fe7251a-221a-482f-9bdf-d6eceaa31d9b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.53	-95.46	998.47	2020-04-21 00:43:20.554199	\N	\N
2f887dd8-3bc5-4591-81ed-44aaab5404c6	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.43	-97.78	1001.4	2020-04-21 00:43:21.646547	\N	\N
53adeb17-3af5-4ad9-8d3d-b946a41e523a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.79	-95.58	999.21	2020-04-21 00:43:22.756377	\N	\N
a8cfafec-060a-4019-9e77-8248fa905f9a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.2	-96.13	996.77	2020-04-21 00:43:23.867368	\N	\N
047f8d10-a6c1-4e72-95fa-52816afe1557	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.43	-98.57	999.02	2020-04-21 00:43:24.96236	\N	\N
7299f800-d315-4e32-a7f1-78eb9bd3c8b4	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.04	-99.3	999.27	2020-04-21 00:43:26.070772	\N	\N
8cdf7299-e09e-4fb0-9726-3913b50a0b28	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.28	-92.47	1001.34	2020-04-21 00:43:27.256841	\N	\N
5a96451f-0214-44b7-9a40-114f6cb01b0d	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.18	-93.69	1002.08	2020-04-21 00:43:28.295886	\N	\N
982b4b9e-f14d-4677-9ca6-8e21b36743a5	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-3.6	-97.66	997.5	2020-04-21 00:43:29.617326	\N	\N
4193d845-252c-49ef-a464-9e5a66b9178a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.28	-96.98	994.87	2020-04-21 00:43:30.518166	\N	\N
0e590a1d-4731-444f-ad9f-8ca81b462af9	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.95	-100.65	995.67	2020-04-21 00:43:31.627521	\N	\N
6ca5a1be-8ef0-4791-aa05-789afac118fa	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.46	-95.76	996.95	2020-04-21 00:43:32.737761	\N	\N
8d696c04-5bfa-40c2-a00f-26fc61580900	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.46	-100.1	999.51	2020-04-21 00:43:33.850012	\N	\N
001956ac-4e37-4cc1-9e7b-bd3c8abb5a32	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.34	-93.99	997.25	2020-04-21 00:43:34.943618	\N	\N
12cd0c0c-77d0-48cd-b70e-d2a133b858e4	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.34	-96.01	998.35	2020-04-21 00:43:36.13601	\N	\N
89495b21-b43f-4bb9-a605-c423a840692a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.98	-96.31	996.34	2020-04-21 00:43:37.176654	\N	\N
547e58ea-1c2f-436e-9b12-f0ab352b8b9b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.31	-94.24	997.92	2020-04-21 00:43:38.275843	\N	\N
277c77a1-be09-43c2-9558-bfa5f13fbc16	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.24	-90.52	1003.05	2020-04-21 00:43:39.392921	\N	\N
2b3ea232-29a3-4c31-a832-fabd344c43e6	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.1	-95.76	998.66	2020-04-21 00:43:40.495755	\N	\N
2c5049a9-6f1a-4fcc-ad6f-37020e1ce72e	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.11	-94.18	999.82	2020-04-21 00:43:41.606438	\N	\N
7518c8b2-ec10-4390-8e92-b83ae8691561	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.18	-100.04	999.39	2020-04-21 00:43:42.863866	\N	\N
b6035660-808c-482d-93fe-02fadac5bd24	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.56	-96.98	999.27	2020-04-21 00:43:45.243927	\N	\N
b02c99fc-b706-44a0-89c5-1652bcca65e8	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.43	-98.88	1000.12	2020-04-21 00:43:45.659726	\N	\N
d3cb228a-13b3-42cc-be68-bde41c17e0ee	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.04	-95.95	996.52	2020-04-21 00:43:46.075229	\N	\N
adfcc1d9-95b3-4c02-b880-83df7a2e8c67	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.99	-99.73	1002.99	2020-04-21 00:43:47.138458	\N	\N
4b893a04-5b95-4605-ad5f-bacb6e420830	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.49	-96.56	996.7	2020-04-21 00:43:48.252713	\N	\N
32c71868-f88d-4ef2-980e-92b9542b35a4	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.73	-95.03	1003.3	2020-04-21 00:43:49.356171	\N	\N
1f1ba20e-9bf4-4351-9163-da6e622e137b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.61	-94.67	998.35	2020-04-21 00:43:50.466303	\N	\N
7ef18278-105b-432c-83bb-3de5cad0ac63	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.06	-99.61	1003.3	2020-04-21 00:43:51.573882	\N	\N
b6e635c7-d6a1-4e8f-b28f-66a3909035ab	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.28	-98.14	997.62	2020-04-21 00:43:52.685141	\N	\N
1083163c-9d62-40c8-91c1-def91c575e77	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.28	-93.44	996.09	2020-04-21 00:43:53.79382	\N	\N
4c4dcc98-f6df-4614-902d-91c9fdb9ed4b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.31	-98.08	1001.1	2020-04-21 00:43:54.903172	\N	\N
2b312770-77cc-47df-b1fc-0a45674c1357	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.26	-96.37	1000.24	2020-04-21 00:43:56.010104	\N	\N
ca71cf25-eeb3-451c-9d4d-bea5bb4d3bb0	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.95	-95.28	995.3	2020-04-21 00:43:57.121018	\N	\N
d01010d6-ce26-439f-b99b-57a601a300b2	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.49	-97.47	1000.85	2020-04-21 00:43:58.229772	\N	\N
76bff6ba-8104-4b88-99ba-b59389fe4c41	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.95	-96.74	1002.99	2020-04-21 00:43:59.338425	\N	\N
63de89cf-1b00-4703-bfdc-2f24e3705e34	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.12	-95.34	999.88	2020-04-21 00:44:00.447726	\N	\N
0924e043-36f5-4aae-9a2a-ebceb1593840	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.59	-97.11	995.18	2020-04-21 00:44:01.578656	\N	\N
c5cb4d64-8d89-4a5c-8c45-d4638185ab87	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.83	-93.38	996.03	2020-04-21 00:44:02.677699	\N	\N
e1df7dc8-28e0-4de7-984f-79427c76dbfd	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.37	-96.13	999.15	2020-04-21 00:44:03.785988	\N	\N
d68db89b-daab-40a7-baf8-b9891805dd05	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.55	-94.54	999.02	2020-04-21 00:44:04.895735	\N	\N
b183f636-e5d2-4c3a-8f1f-7de753b8a170	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.18	-94.91	996.95	2020-04-21 00:44:06.007327	\N	\N
02161536-f5c1-42f2-a715-88cc43f08be0	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.28	-99.98	1000.24	2020-04-21 00:44:07.116728	\N	\N
47892931-6fa9-48a9-8c72-c2625fb66830	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.46	-94.18	1001.22	2020-04-21 00:44:08.226039	\N	\N
e609dafe-199c-4b91-8d06-1974e03ea9a4	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.43	-97.66	1002.62	2020-04-21 00:44:09.338354	\N	\N
90774e62-4820-4155-89d2-8e5a6b2aa992	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.43	-93.08	1003.72	2020-04-21 00:44:10.447687	\N	\N
fefd7855-a6cb-4bc3-8c26-40ede04691c6	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.12	-96.19	1001.04	2020-04-21 00:44:11.562568	\N	\N
84fcf9a1-08f4-4f34-b490-4bf3e813aa25	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.71	-96.25	999.88	2020-04-21 00:44:12.657157	\N	\N
b7c4cc62-558b-4d79-9b6f-02c8f2d86c36	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.14	-94.54	994.08	2020-04-21 00:44:13.767576	\N	\N
18a9218a-bcac-47a4-a6fe-dc18fe242bcf	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.26	-97.47	995.42	2020-04-21 00:44:14.915735	\N	\N
25b6bea3-d1ef-4272-a1cf-aa3d4ca9964b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.55	-95.4	995.3	2020-04-21 00:44:15.986652	\N	\N
4229bb9d-6d7e-4a7e-be4d-02ef3a235a6e	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.16	-95.52	1000.67	2020-04-21 00:44:17.096755	\N	\N
0e525460-7564-45da-aedc-01badc80be60	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.65	-94.79	997.8	2020-04-21 00:44:18.208354	\N	\N
d80535a9-2613-43cf-b07d-7d66f235153a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.1	-94.79	1000.31	2020-04-21 00:44:19.319418	\N	\N
a3a81d5f-f705-47f8-844c-b10eb5980fdb	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.14	-96.37	998.66	2020-04-21 00:44:20.42758	\N	\N
69730ead-f310-4ee8-9cdf-1bb2a9fac05d	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.22	-95.21	997.25	2020-04-21 00:44:21.53621	\N	\N
87a66841-3553-4871-a9bb-df047c805d84	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.67	-98.02	996.95	2020-04-21 00:44:22.811769	\N	\N
11a15515-29c5-4b4e-be48-037a3ea615f7	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.4	-93.75	999.21	2020-04-21 00:44:23.755383	\N	\N
b1680a82-a0d7-428a-9dbe-621c6408dda3	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.28	-97.66	1000.67	2020-04-21 00:44:24.85636	\N	\N
fda70b46-85fb-42fd-8476-07c945fb79de	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.95	-96.74	996.09	2020-04-21 00:44:25.965876	\N	\N
aa9a5a8b-2677-403f-bdcd-44ee5a83a3bc	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.12	-91.55	998.23	2020-04-21 00:44:27.094343	\N	\N
2a8a4ecc-93f7-4372-9052-754e93017d34	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.24	-95.7	999.15	2020-04-21 00:44:29.874031	\N	\N
06030b9b-838d-44a9-a212-e3056de53519	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.67	-99.12	1000.55	2020-04-21 00:44:30.290369	\N	\N
67600355-ae4b-421e-ad9a-dbd32a859716	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.92	-96.5	1000.43	2020-04-21 00:44:30.706065	\N	\N
fed0a6f8-ef1d-4d88-a600-85f3f566e47a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.37	-92.47	998.29	2020-04-21 00:44:31.499861	\N	\N
fead2c0d-3c67-4ea7-b35a-5cdfbabb340f	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.67	-93.81	1005.49	2020-04-21 00:44:32.632329	\N	\N
d447438b-51ee-4fa1-95df-7e18465d30d9	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.04	-93.75	998.66	2020-04-21 00:44:33.718135	\N	\N
f62bfb43-3259-4679-9c31-b21621b8451b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.37	-92.41	996.15	2020-04-21 00:44:34.917914	\N	\N
ac3f2e20-3a18-420b-89a4-701b576d0f18	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.79	-96.68	999.02	2020-04-21 00:44:35.946557	\N	\N
a2c6d2da-1dd7-47d9-89df-b9d9fd887d01	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.24	-91.37	1004.09	2020-04-21 00:44:37.069892	\N	\N
0a9ec486-0207-4037-80a6-5aa81a77f475	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.18	-93.08	999.08	2020-04-21 00:44:38.165657	\N	\N
2b2903e1-24b6-455d-9920-72f1b9080f0d	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.85	-96.5	997.38	2020-04-21 00:44:39.275601	\N	\N
a68e7723-0e14-4467-b314-1a10e6a964ba	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.56	-92.41	1000.61	2020-04-21 00:44:40.386784	\N	\N
e8490c02-9339-440e-ab55-35d38b000287	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.46	-92.96	999.76	2020-04-21 00:44:41.497556	\N	\N
681a7463-1abc-46df-91ad-16b7a7cf329f	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.31	-94.67	999.45	2020-04-21 00:44:42.610738	\N	\N
e05b432d-9524-4194-aba6-a9a0d055d689	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.23	-90.39	996.89	2020-04-21 00:44:43.716385	\N	\N
8388bdd8-4776-4e0a-8c6d-0193bb5f1395	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.59	-95.58	999.57	2020-04-21 00:44:44.826505	\N	\N
324a4e82-d2ef-4a72-afe2-b4cd401e86de	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.75	-96.37	999.51	2020-04-21 00:44:45.937075	\N	\N
b069673e-88be-4802-985f-5c0c718841ff	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.38	-97.72	997.25	2020-04-21 00:44:47.03632	\N	\N
587c32c0-b55b-48bf-8a62-d68fa6971cb9	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.04	-90.03	997.13	2020-04-21 00:44:48.146903	\N	\N
8ebbcf31-1284-4662-adb1-246b0217f49d	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-188.84	364.69	827.7	2020-04-21 00:44:49.256777	\N	\N
75b51499-63ea-40c2-9be6-7a1e787b907e	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-337.04	390.44	1008.3	2020-04-21 00:44:50.365788	\N	\N
85fc5c73-1233-48b0-95f7-9cc0a73bd886	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-270.26	-131.77	959.59	2020-04-21 00:44:51.486153	\N	\N
221c6f6b-37df-49bc-a6f4-454aea6f27ca	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-443.91	-2.2	909.73	2020-04-21 00:44:52.596475	\N	\N
3b1a5d28-c109-47a4-9933-b47f5eddc57b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-384.83	117.43	924.13	2020-04-21 00:44:53.707325	\N	\N
3960c51a-bac1-4f0e-b422-eabbea19c59d	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-515.32	6.29	887.51	2020-04-21 00:44:54.815521	\N	\N
e908a03c-d2df-4ac2-8748-c060dc979fa2	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-500.98	39.98	857.06	2020-04-21 00:44:56.085219	\N	\N
4f8cb756-6d9e-4ceb-bc55-d35e0a6a0fb0	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-537.78	-17.58	810.73	2020-04-21 00:44:57.076635	\N	\N
1151f72c-7aa6-4d03-9bcb-25c007217dde	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-540.65	8.91	807.86	2020-04-21 00:44:58.146679	\N	\N
5b8a3af4-c6a4-4a6f-bdae-d7f5d051c415	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-575.56	-294.92	733.89	2020-04-21 00:44:59.257056	\N	\N
d6f2d1a6-ac73-4178-88c5-e26d9d9a4900	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-620.0	170.96	734.31	2020-04-21 00:45:00.365886	\N	\N
18a58b38-442a-45d7-bd51-5758d6632b4c	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-411.68	-48.52	958.31	2020-04-21 00:45:01.478888	\N	\N
f84bfe66-2c40-4f07-9edf-840263682e6e	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-366.58	9.46	930.73	2020-04-21 00:45:02.619848	\N	\N
c26d39f8-8fbe-4f2e-a6f0-c3a26fa977d3	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	256.59	-94.36	1049.07	2020-04-21 00:45:04.324388	\N	\N
b5cae43a-68a0-49b9-863a-53e87b661025	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.88	-87.52	998.11	2020-04-21 00:45:04.786429	\N	\N
c22a8142-2df7-4f8f-a57b-7f29292b9d50	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.32	-83.98	995.79	2020-04-21 00:45:05.895616	\N	\N
35f63a30-66d9-409f-80f1-1f6d5379a186	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-8.36	-80.57	998.54	2020-04-21 00:45:07.005699	\N	\N
31d9ce1b-ac78-4340-a32d-b76a6b109dae	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-5.49	-83.62	1001.1	2020-04-21 00:45:08.115675	\N	\N
5f993512-274c-4005-b9ca-b4f0ee16bcd0	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-14.28	-102.54	1015.2	2020-04-21 00:45:09.485514	\N	\N
0e75b854-1170-412a-bdfc-06cff41c3fb6	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.38	-89.11	999.45	2020-04-21 00:45:10.336417	\N	\N
7a534726-9a64-4dae-bc0f-8e376f8a6ca6	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.66	-92.77	1001.28	2020-04-21 00:45:11.448509	\N	\N
12197d34-2dc4-40dd-8ac9-b725a7697644	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.85	-94.79	999.51	2020-04-21 00:45:12.582518	\N	\N
0fcab097-6d8b-46c8-a278-ccc8f7d796b9	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.87	-91.31	999.76	2020-04-21 00:45:13.672396	\N	\N
9b19f35d-08c0-4dcb-a941-190590898356	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.24	-96.19	998.54	2020-04-21 00:45:14.766473	\N	\N
5d4be9b6-41a5-47fa-aec1-89e5dc767c22	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.99	-89.29	998.84	2020-04-21 00:45:15.875587	\N	\N
cea0676e-f7e0-4384-8cd9-6220425a9ec1	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.14	-98.08	1000.0	2020-04-21 00:45:16.986218	\N	\N
7c162378-035b-40a3-9083-c5145115e805	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.08	-88.32	1000.92	2020-04-21 00:45:18.096264	\N	\N
c7706f92-e2a6-44c6-8fae-8395fe9a5f39	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.69	-96.68	1000.49	2020-04-21 00:45:19.206092	\N	\N
86e38615-e282-4f67-b870-8d805fecb8d0	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.92	-92.16	994.32	2020-04-21 00:45:20.316252	\N	\N
b99c8710-6ba8-4c66-9a16-01a50cb8936f	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.31	-97.11	997.31	2020-04-21 00:45:21.426408	\N	\N
e0feaea4-be91-4f21-b501-2934cc4f188e	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.38	-89.72	1001.46	2020-04-21 00:45:22.535992	\N	\N
74b07607-18ed-46ed-9806-e832267a88f9	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.46	-90.94	1005.31	2020-04-21 00:45:23.645816	\N	\N
f388be40-4df8-4f64-821f-5de6f38bbad5	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	11.54	-105.53	986.94	2020-04-21 00:45:24.755983	\N	\N
6e29bc96-e978-4afc-a4a8-946573a110f3	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-10.01	-95.4	1004.21	2020-04-21 00:45:25.855736	\N	\N
2cedb7ce-0248-456c-868d-bb5ab55cc287	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.95	-91.37	1000.0	2020-04-21 00:45:26.966504	\N	\N
c5774ca4-3b29-4e53-ac93-c01978608ab2	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.77	-91.19	997.13	2020-04-21 00:45:28.202929	\N	\N
cf3ba2d1-52dc-4eb5-8ce9-3da2e1c574d8	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.92	-91.43	996.28	2020-04-21 00:45:29.187151	\N	\N
b11c4766-8755-4029-9bb4-da044e11e479	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.52	-92.22	1000.24	2020-04-21 00:45:30.296316	\N	\N
93530185-caeb-4f7a-9c4a-80fb464addcd	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.59	-91.06	996.7	2020-04-21 00:45:31.406341	\N	\N
d5189e4d-5213-4c14-814d-ceaaea6f3883	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.21	-91.8	1001.59	2020-04-21 00:45:32.515941	\N	\N
8ae0f0cb-4b22-4da0-8e54-720cdbf73ebf	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.11	-91.49	999.15	2020-04-21 00:45:33.626203	\N	\N
9249b809-92ba-4eea-9db8-8212f3577f63	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.7	-93.38	1002.99	2020-04-21 00:45:34.735967	\N	\N
8e6032af-e40c-4c15-98ee-e14a72d4f768	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.27	-92.22	997.25	2020-04-21 00:45:36.063493	\N	\N
a9d61bee-29a0-4606-b078-042d60c21b3f	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	9.95	-122.5	981.69	2020-04-21 00:45:36.955825	\N	\N
83fcb6f5-a192-4353-aa68-c9f23cdae0e2	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-215.15	173.28	974.91	2020-04-21 00:45:38.079048	\N	\N
0280bd30-6ecc-4398-8768-2be0a9de1eac	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-501.95	-266.48	995.36	2020-04-21 00:45:39.165728	\N	\N
2754cba8-95bb-47a6-8b43-6c2695491902	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-499.69	174.32	926.03	2020-04-21 00:45:40.275901	\N	\N
a112eb7c-7eac-4509-8284-c384ea804133	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-217.96	-130.07	960.51	2020-04-21 00:45:41.596231	\N	\N
5a54137f-bb47-453c-806a-147f5cb6b016	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-508.91	-127.99	869.45	2020-04-21 00:45:43.94636	\N	\N
5731c7fc-b973-4944-89e1-37050348d1f0	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-567.38	-43.58	812.19	2020-04-21 00:45:44.362306	\N	\N
3412ddb3-c992-4478-bb99-a359ceb960d4	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-537.54	-46.63	895.26	2020-04-21 00:45:44.77804	\N	\N
f9c3ebf2-76f6-462c-91b2-f21783c450d0	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-510.68	-66.71	897.77	2020-04-21 00:45:45.847102	\N	\N
7914e499-b73d-40f0-95a1-f8d1b3783b63	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-487.37	-72.81	863.22	2020-04-21 00:45:46.955793	\N	\N
edbedc9e-09a2-4f6d-bf4d-cf9eead4c342	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-102.72	-279.72	1057.62	2020-04-21 00:45:48.081654	\N	\N
81661d80-72d2-4186-97e8-7e97e6f91962	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.72	-86.43	999.45	2020-04-21 00:45:49.216456	\N	\N
d2725a8a-c447-4561-83b5-98fb5885bc44	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	7.02	-87.28	1000.43	2020-04-21 00:45:50.28628	\N	\N
9fb4e5c3-84cc-4b30-beea-8c58a2bdad4c	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	7.39	-87.46	997.25	2020-04-21 00:45:51.385787	\N	\N
5a780756-0519-4342-bf5d-efba1d4e4dba	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.21	-90.21	998.35	2020-04-21 00:45:52.470864	\N	\N
b5f3cb3c-290b-4171-b8a9-7ab7114b7e17	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	10.19	-95.89	1001.95	2020-04-21 00:45:53.58987	\N	\N
1c3a850e-9707-47b1-8388-21f62328dd0a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.54	-85.82	995.54	2020-04-21 00:45:54.806207	\N	\N
2cc02e1b-252c-412d-bfa3-b713cba5c7f8	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.9	-92.59	1003.85	2020-04-21 00:45:55.805839	\N	\N
a5299dd4-fb26-43dd-979e-6c2d91a323a1	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.41	-78.12	1003.85	2020-04-21 00:45:56.915877	\N	\N
7de97fba-33c3-4dc1-9d23-3b2b5b3c0496	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.98	-88.26	996.34	2020-04-21 00:45:58.025847	\N	\N
07d86bdc-508c-4ce6-8da4-ab5a2be1cfe6	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.16	-88.56	995.12	2020-04-21 00:45:59.12606	\N	\N
3a2f7012-1ba8-43bb-9df5-93d7115f796b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.23	-86.18	998.29	2020-04-21 00:46:00.296354	\N	\N
ab182356-d55e-4e2b-8ce1-c3bcc836868c	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.29	-92.65	1000.31	2020-04-21 00:46:01.744137	\N	\N
c5ae53ca-a048-41cb-ad15-f8dc5f08752a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.46	-88.13	998.96	2020-04-21 00:46:02.457813	\N	\N
06a5609f-58ca-4068-b0e4-3036ff5967a9	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.92	-86.0	997.01	2020-04-21 00:46:03.586832	\N	\N
679d1036-4205-4742-84e7-56869afb6663	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	64.45	-114.14	1007.2	2020-04-21 00:46:04.674693	\N	\N
2781953c-8952-42d6-90c0-4640a05e45c7	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	7.81	-85.51	1003.36	2020-04-21 00:46:05.77249	\N	\N
1eece5fd-fb94-4127-a8dc-db15071184be	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.91	-91.86	997.74	2020-04-21 00:46:06.894132	\N	\N
e3c7d547-64e9-4180-94bb-5e91f3f868ad	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.92	-87.59	999.76	2020-04-21 00:46:07.995946	\N	\N
104d55be-cad6-48e7-ae82-e6892258e255	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.7	-89.97	1003.54	2020-04-21 00:46:09.106574	\N	\N
b242887e-b9ff-4524-903d-1ca7d72b941a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.65	-87.04	998.05	2020-04-21 00:46:10.215797	\N	\N
85a38bf0-9f9d-43fc-9162-bacab0f0f101	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.49	-86.85	997.19	2020-04-21 00:46:11.326452	\N	\N
eda1fc6e-01ca-4264-b4bb-2c5c54da82a0	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.21	-89.66	1002.69	2020-04-21 00:46:12.437411	\N	\N
b6648dff-2bde-4a3e-be2c-aba64d4c4429	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.23	-90.94	999.39	2020-04-21 00:46:13.546118	\N	\N
385a5d28-1d66-4ea8-b346-fa0fb363f2de	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.68	-91.31	997.38	2020-04-21 00:46:14.656061	\N	\N
51e8b0cd-c1b5-4aed-9fac-e88c4fedecd9	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.04	-91.13	1003.72	2020-04-21 00:46:15.766132	\N	\N
994b598b-1303-4591-ac87-43c07000ba90	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.04	-86.49	1002.01	2020-04-21 00:46:16.866144	\N	\N
e10d3b83-696c-4238-8ba2-1857280f8246	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	7.32	-90.39	999.82	2020-04-21 00:46:17.975886	\N	\N
88039449-3fe2-49ac-97b3-c17d51c5424e	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	8.36	-85.51	996.58	2020-04-21 00:46:19.093997	\N	\N
f0b8545f-b0dd-46e3-80b2-a40d72675ff5	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	8.97	-92.1	1002.69	2020-04-21 00:46:20.247611	\N	\N
2e63b6df-e3ac-4b3c-a87a-6653acda667e	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.59	-88.5	1000.37	2020-04-21 00:46:21.388781	\N	\N
3b23d276-0d15-4f7b-8fa8-e35ce03c2b24	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.9	-93.08	999.02	2020-04-21 00:46:22.417084	\N	\N
a643418d-18a8-4112-91b9-401b5808ad09	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.43	-89.29	998.23	2020-04-21 00:46:23.674335	\N	\N
f8a98a8b-0dcb-41fe-a55a-5e1807bc71d8	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.13	-89.97	1001.28	2020-04-21 00:46:24.636003	\N	\N
b74a403d-2277-43ca-99fe-d1880ca92f82	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.42	-89.54	997.8	2020-04-21 00:46:25.747548	\N	\N
2e08968b-c900-44b2-978f-ddd223a487c2	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.71	-88.75	1000.92	2020-04-21 00:46:26.857961	\N	\N
b6d4c54e-868f-4990-a169-c105354617fb	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.03	-88.75	1000.0	2020-04-21 00:46:27.955962	\N	\N
29f968f6-efb6-4f08-bf3d-fc13ac54e19b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	7.2	-88.93	997.38	2020-04-21 00:46:29.0662	\N	\N
671243e0-caff-4624-8729-a1a57c2dba94	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	7.26	-87.89	1000.92	2020-04-21 00:46:30.175704	\N	\N
30d4fa7e-d129-4a36-a2b8-0f6646ea1530	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.76	-91.49	992.98	2020-04-21 00:46:31.286798	\N	\N
63ea4c08-273e-4268-8939-8fcc91842d04	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	8.3	-86.24	998.84	2020-04-21 00:46:32.396598	\N	\N
43cb08c5-b3b8-4f20-8188-dfa143d68e8a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.94	-88.01	998.35	2020-04-21 00:46:33.507944	\N	\N
f155a1ea-49cf-4dd0-af43-b778a78470e5	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	7.63	-89.54	996.64	2020-04-21 00:46:34.617529	\N	\N
b419d603-28cd-4062-9345-ed30c5c21287	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.25	-88.07	1000.37	2020-04-21 00:46:35.726194	\N	\N
ca90ef63-40b6-4516-8eed-a76732fa140b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.53	-91.61	1001.04	2020-04-21 00:46:36.835901	\N	\N
365bcf9e-3eab-433e-ac73-5ca6ac692703	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.19	-85.94	1000.73	2020-04-21 00:46:37.946871	\N	\N
6badddf8-8ed7-43f5-889e-62f217f12dbb	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.74	-89.6	997.25	2020-04-21 00:46:39.063409	\N	\N
4f6b28ad-df0b-446e-9871-8c7fecf8ff34	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.94	-89.17	998.41	2020-04-21 00:46:40.155908	\N	\N
8bb41654-b8fb-4811-a21d-3ec59a302e1e	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.59	-88.62	1001.34	2020-04-21 00:46:41.267311	\N	\N
35247937-cdf3-418c-bb12-ee48e439b06a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.15	-90.94	996.52	2020-04-21 00:46:42.375786	\N	\N
14d229a0-9d82-4b19-a9b0-3e632c475ed8	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.27	-91.19	997.8	2020-04-21 00:46:43.485876	\N	\N
5e0c10f8-a954-4dc8-a4c9-f1fa1d839aeb	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.8	-91.0	998.54	2020-04-21 00:46:44.609016	\N	\N
ac0d838b-dc08-441e-9a4b-9c8b5e3bc6ad	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.23	-85.33	996.28	2020-04-21 00:46:45.70698	\N	\N
ff3c81cc-f808-4747-bec6-862480cca601	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-41.14	144.29	1066.89	2020-04-21 00:46:46.817843	\N	\N
18efb307-9164-46d9-8620-f03afe73a878	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-556.64	194.34	747.44	2020-04-21 00:46:47.925918	\N	\N
23418d3f-cb2c-44d2-9419-a72b189f12a4	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-669.31	64.27	548.58	2020-04-21 00:46:49.036867	\N	\N
924c6562-8ac3-4591-add0-cea67752218e	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-591.86	-26.79	766.11	2020-04-21 00:46:50.405744	\N	\N
b97c3572-2394-4d0e-9a0f-3cc50c8e3a25	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-539.98	-124.51	781.37	2020-04-21 00:46:51.255808	\N	\N
bd5c9628-9fed-4fff-b397-5f0bc99f9dc2	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-502.01	-146.61	857.91	2020-04-21 00:46:52.367587	\N	\N
08ad372c-f368-46c3-81cf-45e78501d46e	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-520.02	-234.56	891.6	2020-04-21 00:46:53.475755	\N	\N
7ab87212-6c4f-4d50-8e39-bd4898053fc7	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-546.75	-276.06	888.67	2020-04-21 00:46:54.576265	\N	\N
633f9fb2-733c-43c8-a8f4-f946d497882f	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-567.69	-189.94	806.34	2020-04-21 00:46:55.788806	\N	\N
9405cf3d-a713-4b6f-9b7f-eadc40445294	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-603.82	-162.35	715.39	2020-04-21 00:46:56.845951	\N	\N
655cfb9c-9867-488f-8b8a-3ca4c6971b92	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.23	-89.84	996.22	2020-04-21 00:46:57.909095	\N	\N
365fb713-49a9-4f7a-89ed-bd5eb7eab37a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.78	-91.0	1003.42	2020-04-21 00:46:59.227194	\N	\N
a04c3ec7-b5ca-4385-85fe-d6547edf9531	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.49	-91.61	1000.73	2020-04-21 00:47:00.127462	\N	\N
5ed42d4e-ccf9-40b1-88ff-11e50433f821	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.05	-92.53	994.63	2020-04-21 00:47:01.235745	\N	\N
64c566a5-ab8b-46ea-90c1-4a953796a2f0	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.16	-87.71	994.63	2020-04-21 00:47:02.34723	\N	\N
5fb9e7e3-87f9-4048-bd3d-f2f85a75d5b4	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.27	-92.65	995.36	2020-04-21 00:47:03.457086	\N	\N
26ba0294-66fe-46f8-b213-80faee382b2a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	7.39	-88.99	997.86	2020-04-21 00:47:04.551596	\N	\N
d363cc09-43cb-40ce-a90c-706c2abca660	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	7.93	-88.87	998.66	2020-04-21 00:47:06.867543	\N	\N
3c20b331-43c7-4cb8-a66d-559e478647dd	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.61	-86.98	997.62	2020-04-21 00:47:07.283513	\N	\N
f15e96c3-cbce-428c-b9d8-72abfe32e759	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.09	-92.53	996.22	2020-04-21 00:47:07.885714	\N	\N
cf73f4d3-0f3f-4ba9-a191-06d0226980ce	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	10.13	-89.6	999.08	2020-04-21 00:47:08.995744	\N	\N
b4ae6098-78e0-4892-976e-18d2d85b368a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.64	-89.9	1004.33	2020-04-21 00:47:10.123167	\N	\N
f39f11c1-ae14-47b4-af21-480608fe8bd9	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.31	-86.91	997.13	2020-04-21 00:47:11.217354	\N	\N
81310d1b-146e-4a93-b630-4a3156dead76	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	8.36	-88.13	996.46	2020-04-21 00:47:12.326706	\N	\N
e453c8c5-4c58-47ac-babb-4e20dd6e456c	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.74	-88.93	998.66	2020-04-21 00:47:13.486523	\N	\N
c76b55be-2433-4deb-81ef-7ed22f003636	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.09	-89.42	997.99	2020-04-21 00:47:14.547191	\N	\N
5bc89349-fc92-43f3-9a4b-90329bcc3f85	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.69	-90.27	997.62	2020-04-21 00:47:15.656738	\N	\N
ff604a6c-2c9d-473b-b4f3-aaf5af09d76a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.31	-86.79	999.76	2020-04-21 00:47:16.766235	\N	\N
ae89052d-690c-4ca1-8042-569454e8264f	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.33	-89.72	995.06	2020-04-21 00:47:17.865817	\N	\N
4aa76053-e73e-4743-8dd3-27a0c76d9cc9	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.96	-91.31	998.05	2020-04-21 00:47:18.969947	\N	\N
8e7ad5cb-e1f9-468c-9c23-ebb0097dbe53	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.07	-88.93	1000.85	2020-04-21 00:47:20.199474	\N	\N
f0f5d543-b542-4317-95e2-afe50b0451e3	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.16	-94.24	1000.06	2020-04-21 00:47:21.295685	\N	\N
44b5c1af-905f-430e-9313-d3c791761f26	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.1	-88.81	999.08	2020-04-21 00:47:22.305856	\N	\N
c4ba5756-b391-44c8-a640-d7925d18010f	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.31	-86.61	994.51	2020-04-21 00:47:23.416803	\N	\N
1cf698db-ee3e-41a6-875c-5990f8168a36	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.69	-87.59	998.96	2020-04-21 00:47:24.526264	\N	\N
9494fbd9-1a1d-474f-bec6-efb4200a972a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-45.47	223.45	801.15	2020-04-21 00:47:25.635667	\N	\N
45969d76-292d-4524-acc3-1e58b43f7811	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-328.86	305.54	838.99	2020-04-21 00:47:26.745961	\N	\N
6d16eaa7-c759-4bdb-8e09-4a26506650dd	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-465.88	103.09	989.69	2020-04-21 00:47:27.856553	\N	\N
591635d5-87a9-421a-bdd8-8f15f627f006	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-546.75	34.3	849.79	2020-04-21 00:47:30.070485	\N	\N
7ca1f616-1460-4db6-a05a-5d679abb7f70	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-571.72	-77.39	722.66	2020-04-21 00:47:30.487067	\N	\N
5744ab8f-7d66-430f-8864-a4a6ec8b2ce2	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-573.61	-20.45	839.48	2020-04-21 00:47:31.177262	\N	\N
83370046-7184-44e5-ba5c-682e6026fb09	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-540.34	-28.99	828.43	2020-04-21 00:47:32.285936	\N	\N
b5c08222-ab37-4848-9786-d41261d5974d	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-389.59	65.92	906.37	2020-04-21 00:47:33.395653	\N	\N
663be3bc-ab6b-4d04-a566-a9f6b9ee8769	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	9.83	-82.64	1000.18	2020-04-21 00:47:34.50644	\N	\N
b1c168c6-716e-4d36-88e9-26d304845f46	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.78	-80.63	995.61	2020-04-21 00:47:35.626608	\N	\N
49b8462e-e753-44a6-a4f6-a8ba3ed6330b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.13	-90.27	998.78	2020-04-21 00:47:36.727441	\N	\N
cfb459e9-e5b5-4321-b8a7-b818ec69667a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.55	-80.93	999.88	2020-04-21 00:47:37.835955	\N	\N
fdc0a54e-87d0-44cb-ac47-a85ec2361254	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	7.39	-87.95	1006.23	2020-04-21 00:47:39.627586	\N	\N
a908d1d1-7069-4480-a643-9ed1aceba2c7	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.46	-85.14	997.74	2020-04-21 00:47:40.062385	\N	\N
cfd4faf7-0b32-4954-9f22-052832f10d99	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	7.08	-86.12	998.96	2020-04-21 00:47:41.170418	\N	\N
0141851c-42b3-4803-b02e-a0a4a73c5341	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.39	-83.8	998.17	2020-04-21 00:47:42.268348	\N	\N
819f870c-87db-42cd-bb63-d5d6b80302f6	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	10.68	-80.81	1001.95	2020-04-21 00:47:43.37711	\N	\N
60896111-c5f1-4d4a-b45f-509447d672b1	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	8.3	-83.74	995.85	2020-04-21 00:47:44.486843	\N	\N
586141dd-ac61-4d4e-80ec-d94a062c89cb	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	7.39	-87.4	997.92	2020-04-21 00:47:45.596295	\N	\N
0bda3c41-2f97-4930-b5a1-208fa1acc6dd	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.8	-83.07	998.41	2020-04-21 00:47:46.70601	\N	\N
33338a69-6fee-4953-b026-2d0f79123bc2	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	8.0	-89.6	996.77	2020-04-21 00:47:47.816169	\N	\N
ab91d023-130d-4686-9629-39d13b908b46	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.94	-86.06	1001.71	2020-04-21 00:47:48.925836	\N	\N
40503fe1-1b2a-4de9-ac2c-7e8a79e1fd06	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.55	-80.02	998.05	2020-04-21 00:47:50.036423	\N	\N
ed8c2454-2924-4ef9-8472-a9df71d3fd33	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.35	-86.67	997.44	2020-04-21 00:47:51.146459	\N	\N
cf3e6b38-82ce-4691-b205-e76bdedf1397	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.71	-83.5	999.57	2020-04-21 00:47:52.265951	\N	\N
7ecbb53d-7e42-40de-a421-50087804e97c	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	6.65	-86.0	998.54	2020-04-21 00:47:53.365836	\N	\N
812c5321-20cc-49a0-b682-0491409b430a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	8.48	-85.08	998.66	2020-04-21 00:47:54.465698	\N	\N
ba7e0720-6879-4fae-a55b-51520b484bde	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.23	-90.58	1000.85	2020-04-21 00:47:55.710029	\N	\N
46e81cea-edb5-40d7-b040-bb253a17a4e9	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.6	-89.05	1000.43	2020-04-21 00:47:56.675702	\N	\N
02798acf-0ad1-4bf5-bca5-ab6ad7bfa459	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.52	-88.32	996.15	2020-04-21 00:47:57.783954	\N	\N
8d151f7d-8df4-46ab-b4c9-4091247d545a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.8	-88.38	999.15	2020-04-21 00:47:58.892092	\N	\N
f494f8e5-6df7-41c3-b2d2-50468498be2b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	10.8	-89.29	997.62	2020-04-21 00:48:00.018542	\N	\N
b1f81420-382c-434f-b567-b9561571c938	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.28	-80.81	1001.4	2020-04-21 00:48:01.136627	\N	\N
8216c695-6eaa-4baf-bf7b-8a7a28f9adc2	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.13	-91.37	1001.77	2020-04-21 00:48:02.219614	\N	\N
037a391a-38fc-425c-a22d-2459f2e2c216	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-308.11	210.94	910.83	2020-04-21 00:48:03.346039	\N	\N
a4bc6d8c-4a0f-41c8-ba59-ab3ab6d30f15	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-816.16	-73.61	756.53	2020-04-21 00:48:04.455835	\N	\N
f012704f-7cca-4b25-bd3e-ebf7aee750d4	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-433.53	21.06	1017.46	2020-04-21 00:48:05.566029	\N	\N
4dafb454-f061-4e0e-9b57-fe7bbf33343e	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-533.69	-49.26	884.16	2020-04-21 00:48:06.927359	\N	\N
5b01555f-a858-4116-bf50-145034ac3202	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-508.24	-75.32	895.45	2020-04-21 00:48:07.777314	\N	\N
567ba387-0f5f-4dd7-9a64-8000e1976d6d	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-496.58	-82.21	875.12	2020-04-21 00:48:11.02631	\N	\N
6e0f0c3f-aa80-4719-b8c6-eef351a24b03	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-264.95	-185.55	1060.12	2020-04-21 00:48:11.442574	\N	\N
59c1a2d2-3ee8-458a-aed6-c56e9734e24b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-341.49	-107.85	834.23	2020-04-21 00:48:11.858438	\N	\N
c7baa60a-9a9b-484f-bc2f-2e82b2156512	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-288.82	-143.86	911.93	2020-04-21 00:48:12.27429	\N	\N
910fa45d-3e0b-47e5-9677-63787788a86c	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-368.1	-132.63	881.16	2020-04-21 00:48:13.326298	\N	\N
bb943a1a-290a-47cc-9a8d-455861a6d10a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-330.32	-155.4	927.61	2020-04-21 00:48:14.438317	\N	\N
3ad8cca0-7ef2-4cd6-9fb8-400b6f12e074	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-199.65	-133.79	586.67	2020-04-21 00:48:15.586123	\N	\N
35b88125-0526-4ae6-b9dd-f5758d7559d5	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-340.64	-56.21	896.06	2020-04-21 00:48:16.656944	\N	\N
925ed682-e703-4c44-a0ba-f515c24c3264	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-319.58	-43.52	966.98	2020-04-21 00:48:17.765772	\N	\N
ee175099-119d-4549-896d-e806125ac138	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-300.23	-21.85	929.75	2020-04-21 00:48:19.088842	\N	\N
2dd9b3d6-eb5e-4d83-96fe-e10f5d3475ca	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-249.82	-144.04	954.1	2020-04-21 00:48:19.986076	\N	\N
f474e28b-4d68-4102-bf72-7d4fdca69c1d	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-475.34	-107.12	852.11	2020-04-21 00:48:21.141478	\N	\N
6c451a37-4140-4398-8e56-38f5a3a692f7	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-510.38	-278.14	884.83	2020-04-21 00:48:22.196963	\N	\N
f64f1a9b-0bbd-479a-849f-43077a9407e5	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-315.06	-81.42	956.79	2020-04-21 00:48:23.445987	\N	\N
a1511664-6b10-49d5-b547-a212525a024a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-266.91	-33.94	1010.31	2020-04-21 00:48:24.456272	\N	\N
a57e41e6-683e-41dc-99e8-b6883cc6fd2d	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	36.01	-215.76	995.18	2020-04-21 00:48:25.60722	\N	\N
f7384a84-e9ca-45c1-bd95-24b699195b4a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.76	-181.95	1004.88	2020-04-21 00:48:26.685833	\N	\N
277fec9b-9559-44e8-9fa6-6d7812ea2f60	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.97	-90.03	1001.28	2020-04-21 00:48:27.83708	\N	\N
c5da2d7c-b972-44a0-b911-5a6bd3ecfbee	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.85	-89.9	999.08	2020-04-21 00:48:28.905628	\N	\N
b621d701-ac1d-4b3a-a8d7-a2437ffea5ee	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.03	-69.82	1000.67	2020-04-21 00:48:30.015873	\N	\N
634c678f-507b-4f9b-aed6-98bd351b366b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-3.17	-76.72	999.02	2020-04-21 00:48:31.285349	\N	\N
c3847e25-0a6d-48b5-80a4-0b2e09a158f4	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-6.71	-73.85	998.9	2020-04-21 00:48:32.265881	\N	\N
41a7b9f6-746a-49ae-8534-039993e05435	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-34.67	-45.65	1059.75	2020-04-21 00:48:33.337039	\N	\N
7400ca60-6106-4bc1-be6f-8f8cfaa174fb	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.75	-86.85	1001.95	2020-04-21 00:48:34.446577	\N	\N
316ccf6c-cb37-4d11-8b20-65b5d006d1f4	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.28	-98.57	1000.85	2020-04-21 00:48:35.507615	\N	\N
bc7d147c-c423-4860-a714-6ff8831d158b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.56	-95.83	999.51	2020-04-21 00:48:36.665553	\N	\N
678a8551-006b-470b-9f73-16cf2e789742	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-9.4	-108.7	1009.4	2020-04-21 00:48:37.726645	\N	\N
72d40f00-c55d-43a9-970a-8bb57b46afe1	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.85	-116.52	993.23	2020-04-21 00:48:38.885773	\N	\N
b7030cfb-65c9-4257-a622-dd88579adf7c	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-299.74	-74.95	928.65	2020-04-21 00:48:39.995773	\N	\N
e908495a-795d-4c72-bb85-f196a5c20c0d	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	7.63	-194.82	968.69	2020-04-21 00:48:41.097195	\N	\N
8323cd7d-04cd-4186-8197-ecbfb79acdad	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-11.9	255.8	958.98	2020-04-21 00:48:42.216244	\N	\N
d7af316a-560b-45a8-be93-2e36673f886a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-96.86	28.87	966.92	2020-04-21 00:48:43.837363	\N	\N
eaeb03d8-c4a8-4992-94c6-a608ce9482aa	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	51.94	-140.44	973.08	2020-04-21 00:48:44.386171	\N	\N
c9849eec-6294-4dcc-85c2-b221b4317d68	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-152.28	-192.63	992.07	2020-04-21 00:48:45.495712	\N	\N
5717acce-11b6-47e6-a10e-53b72c38c153	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-115.78	449.34	824.83	2020-04-21 00:48:46.596786	\N	\N
c3fb9d47-36f9-4ded-af99-53c981d6bd0b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-56.21	277.04	908.57	2020-04-21 00:48:47.706104	\N	\N
353b3ec1-0d05-4173-a682-7e375858e8b0	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-59.2	310.36	904.72	2020-04-21 00:48:48.8168	\N	\N
7626c35e-66d2-4a59-92eb-484780e48f07	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-50.54	313.9	969.42	2020-04-21 00:48:49.964604	\N	\N
88e13b5c-8a29-4eb8-a64c-e7ed7bf26585	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.79	-100.04	996.83	2020-04-21 00:48:51.036159	\N	\N
0368f287-5168-430c-9892-692016f4787a	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	57.43	-48.89	987.61	2020-04-21 00:48:52.157986	\N	\N
e792b721-f3d0-4cdb-910d-bd7c76c4aa65	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.87	-152.89	994.63	2020-04-21 00:48:53.25603	\N	\N
631e3206-8bde-447d-a53b-189b9bdd1265	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-5.74	-30.52	994.26	2020-04-21 00:48:54.367509	\N	\N
e17bc4a3-c732-48ad-b169-defa619b0377	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	8.48	-81.3	984.19	2020-04-21 00:48:55.479898	\N	\N
85238e90-a847-4adc-8599-33bc4d441894	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	-107.97	1010.5	2020-04-21 00:48:56.586057	\N	\N
091509f3-abbe-49a5-bf6d-e6efec844e29	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	13.0	-145.08	994.14	2020-04-21 00:48:57.69582	\N	\N
2ddc81fc-3efa-41c1-8754-ec5c4250077b	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	8.79	397.71	901.98	2020-04-21 00:48:58.806451	\N	\N
ecd6d972-f0c0-4de4-822d-7525019293d1	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-41.63	214.23	958.19	2020-04-21 00:48:59.907682	\N	\N
38eaceb5-084e-4eab-b2bf-5a44c77070b4	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-13.18	168.4	977.11	2020-04-21 00:49:01.020824	\N	\N
a90bc1aa-c58c-4ca7-8b1e-bae93a78ebb9	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-3.6	126.4	959.17	2020-04-21 00:49:02.126449	\N	\N
68b93fe4-fee7-4e54-912d-2488a4293fe5	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	27.71	147.71	967.29	2020-04-21 00:49:03.236263	\N	\N
fac7d174-a2e7-4330-8df4-433d142d31ee	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.92	173.28	965.52	2020-04-21 00:49:04.347647	\N	\N
1307d9c6-ab0b-4ef6-b405-49a9f2f815c5	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	19.9	164.12	947.57	2020-04-21 00:49:05.456028	\N	\N
ffb73e0e-eb7a-4d73-b564-ebaf17c97251	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	45.17	166.63	963.87	2020-04-21 00:49:06.566228	\N	\N
68973e5b-ee26-47d4-a86d-5e8c4d57d722	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	57.98	140.2	1005.68	2020-04-21 00:49:07.679477	\N	\N
0d523a9f-5e9a-4956-94ab-109f6cef1508	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	34.3	100.52	986.02	2020-04-21 00:49:08.785976	\N	\N
c31eafc3-899e-44e0-b1a7-f4ba7f701677	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	36.19	132.63	952.82	2020-04-21 00:49:09.95604	\N	\N
90c944f1-3167-4453-ab4c-b576687b6f86	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	62.38	128.11	974.61	2020-04-21 00:49:11.006076	\N	\N
7fb3b967-7e42-4623-acb5-af043353ac7f	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	18.8	-147.28	989.87	2020-04-21 00:49:12.116045	\N	\N
911b6262-b798-4562-bb5f-0182be9eaa82	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.53	-92.53	999.82	2020-04-21 00:49:13.216088	\N	\N
d61865e5-6b2f-4f29-aa1d-c40adec4ae86	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-5.62	-99.43	999.88	2020-04-21 00:49:14.328499	\N	\N
3c6bc326-b0b7-4669-80ef-d0e89520d1e2	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-4.09	-101.56	1002.44	2020-04-21 00:49:15.43699	\N	\N
c17c0b68-777b-4095-93f9-42afe05a488c	bfa83ea2-1b57-4535-8e88-6daf08acbf37	patient accelorometer data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-3.36	-97.23	1003.3	2020-04-21 00:49:16.546751	\N	\N
8834287c-672a-4114-a450-253845509996	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.48	-81.97	999.33	2020-04-21 00:56:42.616799	\N	\N
a5637786-958f-41e7-8689-8fe9c04bda53	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-13.0	-78.43	999.39	2020-04-21 00:56:43.045853	\N	\N
2e1db080-b9a5-4b89-8c4d-213bbfe380d4	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-10.19	-78.61	997.01	2020-04-21 00:56:43.505242	\N	\N
6625f489-3520-4999-ad56-b7f292ab1f36	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-11.96	-77.45	997.07	2020-04-21 00:56:44.615279	\N	\N
b6fc5142-3151-4769-b3c0-3a06e8d3da6f	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-89.11	-63.35	1055.48	2020-04-21 00:56:45.726425	\N	\N
79ce74b8-740b-40bb-ae62-9f6ceef421e6	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	234.25	-165.47	1097.53	2020-04-21 00:56:46.916411	\N	\N
2ae2e65b-912e-46ab-884f-1f6efd9adb4a	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	221.56	-235.23	967.96	2020-04-21 00:56:47.955575	\N	\N
e3733671-8c04-4bcd-992d-e57e17ad0678	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	193.48	-601.5	937.87	2020-04-21 00:56:49.065449	\N	\N
39b3a48e-5f16-40ac-89cf-238d34a20a26	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	190.19	-136.66	965.7	2020-04-21 00:56:50.17552	\N	\N
64d0dff8-4a94-44e6-950b-91192ae786c8	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	110.78	-266.66	836.0	2020-04-21 00:56:51.286727	\N	\N
d0bff0b5-7dad-4fb3-b686-032fdc7091e2	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	80.08	-65.86	1035.46	2020-04-21 00:56:52.616942	\N	\N
0d315eb5-c25f-4e0e-8136-8f79839faca9	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	126.95	-685.12	807.68	2020-04-21 00:56:53.495354	\N	\N
6bc2737e-8599-4002-b3d9-5ba140cf2a07	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	83.86	-135.93	974.67	2020-04-21 00:56:55.95672	\N	\N
838cacbe-630a-47f7-a013-c19722a84d02	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	86.12	-426.7	967.29	2020-04-21 00:56:56.384705	\N	\N
2668b0b0-37a7-4596-b91e-8558b912ace8	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	17.88	766.48	555.91	2020-04-21 00:56:56.825147	\N	\N
2dced019-9d99-4e3e-a78b-55e61713362b	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	146.55	-912.35	805.73	2020-04-21 00:56:57.935277	\N	\N
7a244d2f-0d9c-4f06-b1cb-c27fbb7d263b	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-701.9	-439.27	493.59	2020-04-21 00:56:59.045954	\N	\N
8bf05383-a6b9-4c79-a8c5-023cfd7ee5e6	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-390.32	914.25	323.24	2020-04-21 00:57:00.166494	\N	\N
98fedd00-dad9-4701-8839-f4ad61dfe027	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	169.01	-341.92	1060.06	2020-04-21 00:57:01.275691	\N	\N
58ca64a8-de6d-49b8-98ea-9951d1fb567a	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	72.2	-948.97	476.62	2020-04-21 00:57:02.405525	\N	\N
58c9debb-b853-41ec-8fde-bb16eea0f536	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	304.87	-567.44	868.59	2020-04-21 00:57:06.946099	\N	\N
f6e15ae8-906d-40c0-80a7-b973a1294891	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	274.48	-597.11	882.93	2020-04-21 00:57:07.374454	\N	\N
6e587d22-e57a-42c1-9f9e-d9b89a8ea8d5	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	283.26	-560.97	800.23	2020-04-21 00:57:07.802312	\N	\N
9230e7c2-4662-49ad-82ca-bf971b4fecb5	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	269.65	-546.08	862.49	2020-04-21 00:57:08.230964	\N	\N
71ca325e-13ab-465f-a5ee-dc6a2216ff57	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	280.09	-566.35	793.33	2020-04-21 00:57:08.658463	\N	\N
8df469a4-9bf0-4197-ae2e-d72665e2c354	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	268.62	-511.54	877.2	2020-04-21 00:57:09.086467	\N	\N
8c72ba99-a075-436b-89a6-d2071fe67464	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	245.73	-549.38	883.24	2020-04-21 00:57:10.123895	\N	\N
c955449e-74a2-4eaf-9d79-5e477f85d1db	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	251.83	-530.33	872.56	2020-04-21 00:57:11.233266	\N	\N
0686557a-e1a9-4210-a986-9ad727c2d98e	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	235.47	-522.34	887.76	2020-04-21 00:57:12.345282	\N	\N
22bb3aa8-0f0c-4be0-b37d-974a91bc2c7e	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	238.04	-517.15	820.92	2020-04-21 00:57:13.451236	\N	\N
c0a23500-d83c-4638-8f51-25c46ef1cb74	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	1.83	-164.67	992.55	2020-04-21 00:57:14.562356	\N	\N
4d239e9f-f5a3-44ec-bf62-50dbde15d8b8	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-38.15	-212.34	987.06	2020-04-21 00:57:16.859833	\N	\N
8ca40927-01c5-4ad5-93e9-17b91eea2aa6	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	17.52	-169.43	954.96	2020-04-21 00:57:17.287938	\N	\N
8d4c355f-0049-44a0-bc52-b793600f5384	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	93.08	-203.92	935.67	2020-04-21 00:57:17.905771	\N	\N
1054132e-39b3-42d7-aa73-d2a73d550160	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.79	-78.86	994.57	2020-04-21 00:57:19.019093	\N	\N
364afae5-d3a4-4b2b-bd16-6222f0ca2829	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.8	-74.34	997.19	2020-04-21 00:57:20.130587	\N	\N
ce6b9ff9-a60c-43e7-b8e1-44b3806f79ff	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.8	-75.32	992.92	2020-04-21 00:57:21.239411	\N	\N
5520e98e-9987-43b2-945e-d0e428e69c93	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.86	-73.61	997.31	2020-04-21 00:57:22.350042	\N	\N
b660cdf1-70e7-4300-a43e-49c9e66d4a0b	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-9.22	-75.74	996.83	2020-04-21 00:57:23.431982	\N	\N
510f6685-09af-4ba9-b9a5-6c34bad8b115	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.29	-76.72	995.79	2020-04-21 00:57:24.560995	\N	\N
7b3a621c-804e-40c9-b778-8e2d11303f7b	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-10.5	-74.52	998.72	2020-04-21 00:57:25.650423	\N	\N
9ea3b2c7-8a9a-4912-a556-96d1ec0323e8	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.48	-72.63	996.7	2020-04-21 00:57:26.760303	\N	\N
f220783b-6525-46a9-9e4c-2d183f881bda	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-10.25	-75.5	998.84	2020-04-21 00:57:27.873321	\N	\N
7d936a52-fca2-4b5b-a041-bf1fc60b7d3a	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.87	-75.62	998.54	2020-04-21 00:57:28.977335	\N	\N
624cbb2a-3e63-4c3b-938d-87615d976fc8	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.87	-74.65	1003.05	2020-04-21 00:57:30.086333	\N	\N
5fbee3f0-2b44-4a17-8e55-f60ef05f7e99	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-4.52	-72.81	997.25	2020-04-21 00:57:31.25445	\N	\N
be8e2bf3-4382-460c-8ee1-0d80aed6e794	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-9.52	-72.81	984.44	2020-04-21 00:57:32.303127	\N	\N
709e1165-94e5-4001-ba45-a62fc04a3094	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-2.93	-74.77	995.67	2020-04-21 00:57:33.413396	\N	\N
0856608d-0114-4f86-9e39-5d66eb5f07d6	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.81	-75.81	997.07	2020-04-21 00:57:34.521575	\N	\N
77d73bcd-ef1a-4f33-aa5d-6429319dd521	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-9.03	-77.03	995.97	2020-04-21 00:57:35.632942	\N	\N
44853b8e-ebe1-4eba-9c05-71b8bca0f97e	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.06	-77.03	999.27	2020-04-21 00:57:36.739486	\N	\N
f01da75a-74c2-4356-9605-ef357ebbeaf5	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.12	-74.65	997.44	2020-04-21 00:57:37.850194	\N	\N
02310b8a-cbe0-4932-8088-4b3129f63821	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-9.34	-72.02	999.45	2020-04-21 00:57:38.958418	\N	\N
9e3b4b7c-bf7e-4ceb-916a-76695c8cd7c2	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-4.94	-75.01	1000.24	2020-04-21 00:57:40.072375	\N	\N
9d2677a6-4c94-40d6-babc-dfc92730c212	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-9.22	-81.67	1000.43	2020-04-21 00:57:41.177194	\N	\N
fc916265-4b4e-42c9-b349-36fb930cccbd	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.0	-70.74	995.3	2020-04-21 00:57:42.287424	\N	\N
915f645e-72cd-4668-91e1-9a16aed1cd28	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-10.25	-75.01	996.22	2020-04-21 00:57:43.411525	\N	\N
943f9651-efa0-4a52-919c-32855cc2599a	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-2.26	-73.18	1000.31	2020-04-21 00:57:44.503396	\N	\N
1ce7530f-91b3-4de4-8707-eea87146b09d	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.42	-75.87	995.97	2020-04-21 00:57:45.61331	\N	\N
6b82c755-28b1-4788-981c-788941c82efb	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.86	-74.46	996.22	2020-04-21 00:57:46.72115	\N	\N
7d24db28-cdac-47cb-b604-989be6d69ae2	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.61	-74.52	998.11	2020-04-21 00:57:47.831523	\N	\N
3b178ba7-1187-4523-8345-b9bf4ebe0261	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-10.25	-74.77	996.95	2020-04-21 00:57:48.939797	\N	\N
193854c2-2253-4ba6-ba23-fc8ff7d2a7ed	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.69	-73.12	995.48	2020-04-21 00:57:50.051062	\N	\N
f47e3077-69da-4431-b9c5-3cd9919c9c0b	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.97	-73.3	1003.78	2020-04-21 00:57:51.160117	\N	\N
a7b90231-9053-4119-a915-8ffeca6e1d87	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.73	-77.03	997.74	2020-04-21 00:57:52.266777	\N	\N
f1ac5dda-fd63-4424-8403-3b978cc79729	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.25	-74.65	993.9	2020-04-21 00:57:53.378474	\N	\N
0d59c3a4-c74f-4dad-9de5-1a51843a3b48	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-9.89	-80.14	996.15	2020-04-21 00:57:54.487314	\N	\N
01450105-f32c-4286-9f50-29088f57ac76	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-4.27	-72.14	997.31	2020-04-21 00:57:55.680094	\N	\N
8be00e04-30be-490f-ac20-7f1748e2363b	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.85	-76.9	995.3	2020-04-21 00:57:56.770179	\N	\N
a87ff287-7bd6-4486-afb6-cd2d4e2f8010	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.85	-75.38	995.18	2020-04-21 00:57:57.831567	\N	\N
9605db3d-5570-41dd-8bdb-f0c82750f00f	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-2.26	-76.48	998.47	2020-04-21 00:57:58.942517	\N	\N
f7eb7e03-0b83-4fd9-94d9-2fb4e22df700	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.69	-77.21	997.62	2020-04-21 00:58:00.201213	\N	\N
94be29fe-0afc-49b0-8373-d46d55cdb90b	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.12	-75.56	1000.55	2020-04-21 00:58:01.150664	\N	\N
1d418577-7d66-467a-abca-e0c09983529e	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.08	-72.81	996.52	2020-04-21 00:58:02.261185	\N	\N
8350bb2d-c2f0-4e50-ad1b-7e31f4ef4209	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-9.28	-73.67	997.8	2020-04-21 00:58:03.373099	\N	\N
69a1e581-a97a-45a3-ae79-9e1980184d3c	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.8	-78.06	995.61	2020-04-21 00:58:04.479945	\N	\N
e8986cac-fae3-4ec5-a00c-cd5218d4591a	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.65	-76.17	998.05	2020-04-21 00:58:05.612126	\N	\N
861ecba4-ac7c-4ed0-813e-d8e6e4cfb8e7	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.62	-74.83	994.45	2020-04-21 00:58:06.701051	\N	\N
b2b91502-1b18-4de5-993c-0ffbc084f7ac	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.71	-76.9	1000.24	2020-04-21 00:58:07.80978	\N	\N
f2b43b48-e112-4451-81c4-e30107f32c91	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.86	-73.61	996.52	2020-04-21 00:58:08.920235	\N	\N
0579bdef-10c7-4a59-94a0-46fc1cd3ea39	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.57	-77.03	997.74	2020-04-21 00:58:10.029839	\N	\N
778ad191-d784-4640-a2e8-6ebc4cc0eb8a	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.25	-75.81	999.57	2020-04-21 00:58:11.352286	\N	\N
4d334156-1147-4490-b04d-c9fe045c320e	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-9.09	-74.58	997.07	2020-04-21 00:58:12.249542	\N	\N
d802c811-104c-429b-b87b-08ea59877aa5	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-10.13	-75.87	997.38	2020-04-21 00:58:13.3399	\N	\N
6347c176-23c2-4d6f-b95b-d87cf53c0398	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.2	-75.81	995.61	2020-04-21 00:58:14.453864	\N	\N
3ef57a0b-8e8e-4ee2-9f0f-8e032b5d729d	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.24	-75.93	993.65	2020-04-21 00:58:15.557729	\N	\N
fe22ee85-1c4d-4320-ad64-19ea725c8511	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.12	-71.17	1000.06	2020-04-21 00:58:16.667461	\N	\N
f971e50a-c9c1-4720-bee5-f0d0637be3c6	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.9	-77.27	1000.0	2020-04-21 00:58:17.77547	\N	\N
39b8509b-58ba-46fc-8b4e-2ae65f62acfc	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.51	-74.71	996.46	2020-04-21 00:58:18.888729	\N	\N
38f1148c-0cc8-4320-a1a6-53e77e6768a7	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.18	-72.94	998.35	2020-04-21 00:58:19.993659	\N	\N
68c74ebf-0bb5-4927-a839-f31f88212838	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.87	-75.01	998.17	2020-04-21 00:58:21.117726	\N	\N
31e5cf07-5244-4a9f-98d8-3d92f242ab30	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-9.64	-79.41	999.15	2020-04-21 00:58:22.214182	\N	\N
0dbf7cb6-c4ef-41f6-9065-c9c66c1dedde	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.06	-73.61	1000.37	2020-04-21 00:58:23.321167	\N	\N
0f4c98fb-947f-4e46-9e5e-3756c8d1ac92	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.39	-76.23	996.52	2020-04-21 00:58:24.444043	\N	\N
4a10bd91-4d06-4d44-aafe-ed06b497d32d	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.86	-72.57	997.19	2020-04-21 00:58:25.53949	\N	\N
b8260be9-2318-4681-95f7-5f86d6c2b96b	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.69	-73.18	1000.43	2020-04-21 00:58:26.64966	\N	\N
7faf0c85-f112-4cae-b18e-f2f8119bfcbc	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.81	-74.34	996.22	2020-04-21 00:58:27.757856	\N	\N
8a596fdf-8a7a-4479-b6a3-ac48ffcf601b	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.62	-76.29	998.66	2020-04-21 00:58:28.86933	\N	\N
907eb1d1-06be-4ac7-a3d3-efea06e9f785	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-4.7	-70.68	996.09	2020-04-21 00:58:29.976078	\N	\N
f5094ffb-909d-4b88-ada8-c305c3b0ba28	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.97	-68.73	997.19	2020-04-21 00:58:31.086204	\N	\N
b08e5d50-6a13-491e-b98e-b5906b3fd9f8	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.42	-73.18	1000.85	2020-04-21 00:58:32.194047	\N	\N
e99f2932-135d-42cc-8cbb-9da14dfa13a3	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.59	-76.66	996.83	2020-04-21 00:58:33.304165	\N	\N
ebc7e655-1c38-40ee-b2ce-538d72a0c354	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.0	-72.33	993.96	2020-04-21 00:58:34.411367	\N	\N
9e6eb69d-f2a4-40f0-bc2e-8299fca8a315	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.24	-76.84	997.25	2020-04-21 00:58:35.531387	\N	\N
77bfb659-ef4c-4ed3-8840-295db388a8f5	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.36	-75.87	996.09	2020-04-21 00:58:36.630373	\N	\N
0a46db6f-23cb-434f-a824-4b6096c593f6	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.14	-73.3	998.47	2020-04-21 00:58:37.741561	\N	\N
b3f22111-7bdc-494c-82d1-22402cc0c6e3	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-9.52	-74.58	995.85	2020-04-21 00:58:38.847854	\N	\N
cc11caae-3c43-4234-82a7-063c76f93d01	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.41	-72.57	998.96	2020-04-21 00:58:39.957601	\N	\N
382b3d6c-cbc2-43aa-8c03-64d29cfda041	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-14.77	-76.05	994.02	2020-04-21 00:58:41.069069	\N	\N
7d071983-4e5f-42de-ae06-c1ce1c84ae2f	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.41	-74.77	998.54	2020-04-21 00:58:42.176097	\N	\N
f232b1ac-4169-45ff-86f6-552a8785b576	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.2	-70.31	996.64	2020-04-21 00:58:43.347325	\N	\N
3c4f9da6-db2c-4f95-9db9-4c896b56f324	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.57	-74.83	995.54	2020-04-21 00:58:44.393582	\N	\N
c580f07b-a9fa-4198-8a9e-a648613a7354	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-9.34	-74.4	993.65	2020-04-21 00:58:45.50438	\N	\N
be4c5359-8143-44ec-a961-4b3eface7b5e	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.32	-73.43	996.95	2020-04-21 00:58:46.611298	\N	\N
2e763a57-7797-4c7a-885f-c2c12772c08b	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.35	-75.13	996.52	2020-04-21 00:58:47.722215	\N	\N
91e4d696-f714-4635-970c-9d4affbc31a3	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.35	-72.45	995.48	2020-04-21 00:58:48.829847	\N	\N
81d57ecf-10e6-4d62-b1fe-6260a5459ef9	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.93	-72.69	994.93	2020-04-21 00:58:49.940194	\N	\N
1a06602b-4b83-4b96-9d2d-74fa2893a8fc	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.14	-69.95	996.46	2020-04-21 00:58:51.236442	\N	\N
86522ecd-ee6b-4a9d-876b-75ce67c41c9d	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.2	-74.28	997.56	2020-04-21 00:58:52.157909	\N	\N
76ef1491-3175-4095-9121-fae825bf60fe	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.8	-74.58	1003.85	2020-04-21 00:58:53.267702	\N	\N
fad0b0b1-28fa-4990-a697-3e5d1176c45b	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.59	-74.4	999.76	2020-04-21 00:58:54.375999	\N	\N
49ddd455-b015-441a-8c8c-4adc70a2bc8f	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.48	-72.88	995.73	2020-04-21 00:58:55.486001	\N	\N
76526263-36a6-4dcd-9c97-6ebf030f433d	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.57	-75.68	998.11	2020-04-21 00:58:56.599638	\N	\N
d8d9c347-72b1-40c0-9aa7-80f32d6170be	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-9.46	-76.11	994.26	2020-04-21 00:58:57.720828	\N	\N
83187245-7af5-4b80-86c8-3ee5f57e4829	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.74	-72.39	996.7	2020-04-21 00:58:58.812784	\N	\N
dadd21b0-1ccc-40ad-89e3-f7ff4161fd66	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.79	-74.71	994.81	2020-04-21 00:58:59.921925	\N	\N
d7321516-72ed-4033-9abb-f0a9589e944e	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.0	-78.61	992.86	2020-04-21 00:59:01.029926	\N	\N
39df56c2-2e96-4b5c-975e-7d5806998587	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.0	-69.82	998.23	2020-04-21 00:59:02.160379	\N	\N
6ab1bb66-09a4-4f65-99dd-d5f2eefbe5e5	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.08	-78.49	999.21	2020-04-21 00:59:03.248041	\N	\N
b0237d48-7ad6-4e90-ae92-026067ba13fc	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.26	-76.35	998.96	2020-04-21 00:59:04.57487	\N	\N
89d48103-b8de-4742-8517-47f9d9131e11	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.14	-74.04	995.85	2020-04-21 00:59:05.46761	\N	\N
36256c99-c470-44fb-adb7-6459629efa97	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.81	-75.01	997.38	2020-04-21 00:59:06.575924	\N	\N
4b715acc-e02a-49d1-9fbc-f57b3491b588	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.45	-74.4	994.2	2020-04-21 00:59:07.686757	\N	\N
aae2a3db-8183-4d98-8f54-4cf512bbbabc	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.47	-71.11	997.8	2020-04-21 00:59:08.794406	\N	\N
4b377ff8-4c0f-4289-8a9c-905e1e0b5938	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.26	-73.12	997.68	2020-04-21 00:59:09.90349	\N	\N
4d82f428-371d-4af6-a7eb-d2fe509f034a	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.26	-71.9	997.8	2020-04-21 00:59:11.011884	\N	\N
fe567d29-edf8-4a98-92a8-414f491585cb	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.35	-74.34	996.03	2020-04-21 00:59:12.122262	\N	\N
a54e841e-eb72-4267-b007-41759df83fda	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.61	-77.39	999.02	2020-04-21 00:59:13.232125	\N	\N
20cbcf03-7153-4d9f-8da0-7b4f116b66c5	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.59	-77.21	998.11	2020-04-21 00:59:14.341198	\N	\N
ea9fd55f-91b4-41d7-9e4d-1e2d45ae55bb	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.75	-73.91	1000.18	2020-04-21 00:59:15.448367	\N	\N
a40b5c92-b54d-4c43-b180-6dc874b5e97a	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-9.22	-73.24	996.83	2020-04-21 00:59:16.557689	\N	\N
a5643f20-e7eb-46b1-8530-a048e382141c	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.41	-74.16	997.62	2020-04-21 00:59:17.665941	\N	\N
7284f049-469a-49d6-b625-8efa95090ef8	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.06	-72.63	998.84	2020-04-21 00:59:18.775541	\N	\N
abed947f-9eef-47e0-b971-25dee026dcba	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.61	-71.96	997.07	2020-04-21 00:59:19.885913	\N	\N
18a82846-f18b-42b6-a407-d6047c1b9470	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.98	-73.3	998.17	2020-04-21 00:59:20.993291	\N	\N
f2c05d58-83a2-41e6-a29f-8979979f89fb	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.23	-75.32	995.3	2020-04-21 00:59:22.104367	\N	\N
e1e2ba1c-ee28-4dca-b351-f5b10927a26d	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.71	-72.94	996.09	2020-04-21 00:59:23.213959	\N	\N
d793e568-a99e-4b91-ae2a-0db94cbf1b87	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.87	-73.12	998.41	2020-04-21 00:59:24.320955	\N	\N
ac23ba71-f891-476e-9c69-b6721a1afb5b	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.54	-73.91	1000.24	2020-04-21 00:59:25.42973	\N	\N
60a6323b-3c7d-442c-a173-ede374889676	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.92	-68.66	1000.67	2020-04-21 00:59:26.540606	\N	\N
78f798e1-8304-43de-b3dd-bf9443e4a58a	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.91	-74.95	998.72	2020-04-21 00:59:27.662881	\N	\N
bc4eb067-c154-4bd9-9c86-364026666c73	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-4.33	-72.33	995.85	2020-04-21 00:59:28.762356	\N	\N
6da6154e-fca3-40e4-8704-5a7252322023	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.69	-77.45	997.19	2020-04-21 00:59:29.866029	\N	\N
248b7d9d-e493-415b-a1e8-2434aa2f2ed8	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.29	-70.62	997.38	2020-04-21 00:59:30.976318	\N	\N
9275e20a-d832-462b-a970-15301657f1db	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.2	-76.48	994.69	2020-04-21 00:59:32.083326	\N	\N
4395dac7-d6a5-4edf-b0aa-58e35b97714c	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-9.22	-72.27	998.23	2020-04-21 00:59:33.19733	\N	\N
6239dc43-6c7c-4798-8f10-6fc86f6bc0f2	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.61	-70.01	997.31	2020-04-21 00:59:34.301513	\N	\N
70691a63-d417-4ad1-8b03-976c4a8d7a6c	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-6.59	-72.57	995.12	2020-04-21 00:59:35.413084	\N	\N
de8c0500-ec25-4e90-ab51-63e2aaf886b4	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.92	-74.89	1000.61	2020-04-21 00:59:36.520151	\N	\N
7b56566f-9e2e-4342-a7a5-7cd26acc5ccf	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.61	-73.67	997.01	2020-04-21 00:59:37.630729	\N	\N
c0e46d67-5abf-44b8-8086-21eda04d6f1f	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-9.52	-73.3	994.02	2020-04-21 00:59:38.737902	\N	\N
36e9a6eb-c217-44cb-a8dd-b4cc3377cfd1	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.2	-74.4	995.42	2020-04-21 00:59:39.847752	\N	\N
f1f7f3e1-e6f0-464b-968c-d7616a686aa1	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-2.32	-74.34	996.28	2020-04-21 00:59:40.957791	\N	\N
c9e834d1-d445-4e43-9d23-e4b89cc3c6ec	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-9.89	-74.16	996.34	2020-04-21 00:59:42.065446	\N	\N
e8795fcf-9894-4678-aafc-580e2b7fab5f	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-11.66	-72.94	993.65	2020-04-21 00:59:43.1754	\N	\N
6d50387d-ad67-482a-b303-0a25e43436d4	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-5.25	-72.57	995.73	2020-04-21 00:59:44.283908	\N	\N
0985d8cb-0d64-484b-9e7c-d7cb5bcc6b2e	21d0e358-5730-4292-8758-ee9ea69321d9	patient accelorometer data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-8.48	-73.12	994.02	2020-04-21 00:59:45.393775	\N	\N
413dd788-1751-4b40-b5d2-a39f8383736c	589d7838-888e-4fc4-a7c8-d518452cbdf2	dashboard local test	6aa42f09-25e5-4cb9-90a4-80ef6ecd3e77	1.1	1.1	1.1	2020-04-21 01:28:08.407095	\N	\N
98f9a5af-38c3-4add-8702-d74d224f1f36	bc3f39cd-affc-4450-a411-888d7535d8d8	patient dashboard local test	fd3a25da-7971-4074-b62d-ac34665d3b40	2.3	2.3	2.3	2020-04-21 01:44:19.966062	\N	\N
d7c78948-6098-472d-aace-6ca521e0a63e	a635f81c-2384-421a-9dd5-a61c494e51bb	patient dashboard local test	3f0d2110-939e-4ec0-ae48-d43a405c472e	2.3	2.3	2.3	2020-04-21 02:12:25.626409	\N	\N
cdd8ae7b-f1d9-4a1f-9e2a-2425131ebb08	f70d17b6-1148-45b7-9a95-615c1286175c	patient dashboard local test	730f07f6-4d9c-4b1c-b7fe-5c288678fdc0	2.3	2.3	2.3	2020-04-21 02:27:16.21421	\N	\N
5e8e0c19-1ef8-47f7-b6cb-61235c377fc8	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-94.48	-70.13	907.59	2020-04-21 04:08:41.171738	\N	\N
2868e580-b2e0-406a-9239-002412ab48bf	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-90.39	-63.96	914.31	2020-04-21 04:08:41.594183	\N	\N
b2025850-9f2d-40d3-92ea-8ce86b2efc5f	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-101.62	-72.51	909.48	2020-04-21 04:08:42.050091	\N	\N
4209e3b8-bc3a-41f4-95c3-d057f2bab907	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-121.52	-24.6	953.74	2020-04-21 04:08:43.248577	\N	\N
0ca7d078-3033-4dee-bb7a-ce19195f4336	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	1.95	300.35	758.48	2020-04-21 04:08:44.286595	\N	\N
d62ac3d0-12c1-4370-9caa-298014883a21	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	34.97	-322.88	859.07	2020-04-21 04:08:45.398154	\N	\N
bf90fa65-f324-46ad-9b8b-294c76cc4abb	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	77.7	-175.48	894.78	2020-04-21 04:08:46.614447	\N	\N
7e490ec9-53ab-4332-b696-a986333d6a97	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	39.37	-92.65	984.68	2020-04-21 04:08:47.607633	\N	\N
8fa4dd10-ace2-447e-8313-4b7887a4bf86	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	54.02	-75.81	879.94	2020-04-21 04:08:48.721558	\N	\N
bf5841c0-7448-476a-9e6e-45e6bd796906	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	51.76	-107.79	924.93	2020-04-21 04:08:49.8294	\N	\N
d85dd870-77bf-4eed-bbcb-af66cf707b34	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	51.39	-113.53	930.73	2020-04-21 04:08:54.483886	\N	\N
d8478e87-5cd9-4762-af48-eb4df33eb254	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	87.1	-483.15	887.33	2020-04-21 04:08:54.90506	\N	\N
d5baa6ae-f3f8-4dd0-a1ae-c0660fd70716	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	6.96	-152.4	907.29	2020-04-21 04:08:55.332839	\N	\N
d05f3daa-572a-4460-99b4-019d5b9de4c0	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	58.65	-21.79	888.73	2020-04-21 04:08:55.754158	\N	\N
74e9a966-ae21-4ffc-9bd1-a6548623453a	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	58.17	-70.07	902.65	2020-04-21 04:08:56.175953	\N	\N
f438915a-0283-4a4e-b64e-1e569edbda2d	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	16.11	-73.97	975.65	2020-04-21 04:08:56.597587	\N	\N
c4d6a909-cce6-473b-9ab4-6fc4755eba79	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	126.04	-136.72	849.55	2020-04-21 04:08:57.581303	\N	\N
359dad97-b8f2-4051-9cbc-e989fc6245e4	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	91.06	-156.49	911.13	2020-04-21 04:08:58.707322	\N	\N
04c7a00d-a428-4bda-b49b-7bc052c26595	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	72.69	-167.05	876.1	2020-04-21 04:08:59.807008	\N	\N
d91a23f9-2244-4483-8f02-0b72a8e0dbd4	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	67.38	-136.41	884.03	2020-04-21 04:09:00.906788	\N	\N
d59b815b-2426-4a08-9ef9-a4f1463d54cb	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	53.1	-149.9	892.09	2020-04-21 04:09:02.01657	\N	\N
dd0eed45-73e7-4a70-a6ad-73bf2c740c8b	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	36.93	-146.55	917.18	2020-04-21 04:09:03.126227	\N	\N
35d0b24a-06a9-4d04-9f85-be0d10631240	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	40.65	-154.97	881.41	2020-04-21 04:09:04.236672	\N	\N
5ecaed34-e00b-4ed1-b076-213097f6b17d	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	18.8	-162.11	933.59	2020-04-21 04:09:07.107244	\N	\N
a62324dc-0b76-48f4-adee-5a5599a93a30	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	23.86	-156.8	874.33	2020-04-21 04:09:07.528478	\N	\N
4203c8a8-f924-4095-bc94-e14e4af29b28	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	15.99	-172.3	893.49	2020-04-21 04:09:07.949683	\N	\N
4c4636aa-f983-4c88-8c48-6f06e57b3792	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-14.1	-148.5	910.16	2020-04-21 04:09:08.676719	\N	\N
945037f8-c259-4b77-9f8d-af1b323a93c2	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-98.21	-144.9	909.97	2020-04-21 04:09:09.788853	\N	\N
1f152cf2-ea53-49a3-a85a-44acb9a20ed1	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-143.86	-148.44	932.13	2020-04-21 04:09:10.921575	\N	\N
ca596579-4509-4eec-83cb-6c0f26a88794	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-106.14	-93.63	940.19	2020-04-21 04:09:12.008409	\N	\N
8dea118f-02e7-4aa9-9d08-c81293325b06	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-90.82	-128.54	906.25	2020-04-21 04:09:13.116781	\N	\N
19be1b33-5690-40da-a24e-f09b08227893	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-89.17	-103.64	897.77	2020-04-21 04:09:14.22678	\N	\N
178167b4-7cfd-45ac-a596-b9b68a18c369	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-95.7	-63.72	911.68	2020-04-21 04:09:15.327267	\N	\N
4844528d-4db2-4644-b372-376a0c6e49ce	819dd94b-d18a-4740-8dab-a6e659fac248	patient accelorometer data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-93.57	-67.75	910.52	2020-04-21 04:09:16.436446	\N	\N
f133b270-8e3f-4b79-80d3-ad0b7e3b4650	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-91.8	-91.61	908.69	2020-04-21 04:15:50.473916	\N	\N
e3bbd4b2-5886-485a-8bb7-358677267762	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-89.9	-91.8	902.95	2020-04-21 04:15:50.897355	\N	\N
209175dd-ff79-4bf4-839e-d00fac30aa7f	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-68.85	-96.5	876.46	2020-04-21 04:15:51.33301	\N	\N
4e0de6da-8e72-4777-a79a-dfc18ed0e8dd	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-222.53	155.64	855.59	2020-04-21 04:15:52.449156	\N	\N
f1a2dd31-3d3d-43f7-b2e8-4c40fc790917	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-11.29	476.26	756.96	2020-04-21 04:15:53.555606	\N	\N
9f9f9579-6ec4-4605-89d5-21c26f0d6b06	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	84.66	-370.91	876.53	2020-04-21 04:15:54.666094	\N	\N
5ecef588-1065-4309-9b4d-6d38ee4b2754	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	86.67	492.68	751.95	2020-04-21 04:15:55.755858	\N	\N
cbbf58da-d180-4680-b6a9-eb376c737e14	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-91.25	-444.82	824.52	2020-04-21 04:15:56.885004	\N	\N
c6341340-647a-49e3-94a8-05e98ff2ec74	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-11.84	-997.38	349.24	2020-04-21 04:15:57.962046	\N	\N
13315433-114a-43ab-95b8-287accdeb6a7	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	79.65	-1140.38	-260.01	2020-04-21 04:15:59.102497	\N	\N
dbd53671-3d16-4012-8f81-d366eb359f5f	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-2.75	-1107.97	-125.24	2020-04-21 04:16:00.204175	\N	\N
1df1c752-fd7d-4577-acbe-9f632e1648e0	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-18.55	-1075.81	-22.71	2020-04-21 04:16:01.406367	\N	\N
450aa3c2-c87e-4005-97bd-3e0f03f8dc92	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-57.19	-1117.61	-52.31	2020-04-21 04:16:02.439222	\N	\N
85991189-1930-4e67-b5aa-57e07ad604ea	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-142.33	-236.88	1106.57	2020-04-21 04:16:03.55813	\N	\N
a089a6c0-0889-4c04-85b6-55dccfaa96fd	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-101.26	-322.81	844.54	2020-04-21 04:16:04.651344	\N	\N
fa04fe4b-e0c2-497d-a9ff-357796d1ee92	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-108.64	-137.15	1026.79	2020-04-21 04:16:05.769308	\N	\N
ce24aaa1-18b3-45a9-a954-cd64435b0bed	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-131.71	-117.07	958.8	2020-04-21 04:16:06.862325	\N	\N
79935754-0657-4373-ab25-68f8febefec9	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-103.88	-79.1	907.04	2020-04-21 04:16:07.971988	\N	\N
44e4b7a4-96d1-425e-84ad-2d04f6a2321a	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-101.5	-78.55	903.75	2020-04-21 04:16:09.090511	\N	\N
07b7c720-b55d-4339-9c89-1822a9c0839a	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-107.67	-82.58	902.95	2020-04-21 04:16:10.180056	\N	\N
77bf891d-666b-40c5-9c55-4a4b929be1b1	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-106.63	-80.32	906.01	2020-04-21 04:16:11.277309	\N	\N
3e79155b-8864-4685-be7e-8098a09c8465	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-100.83	-87.52	911.56	2020-04-21 04:16:12.410292	\N	\N
e732c390-fef0-4259-92d4-573836deb838	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-107.48	-82.58	906.62	2020-04-21 04:16:13.501469	\N	\N
61c9218d-3b69-471d-ae32-91819ac4a254	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-109.07	-80.69	903.08	2020-04-21 04:16:14.600139	\N	\N
a1fc131f-16ec-499a-a76d-4eecb971f3be	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-105.04	-77.94	904.48	2020-04-21 04:16:15.718928	\N	\N
24accc5a-d14c-4ea2-810f-b9ff7440393d	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-104.25	-78.55	908.08	2020-04-21 04:16:16.829398	\N	\N
354a02ae-083c-4c13-8380-36cc074d552d	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-111.63	-79.35	906.07	2020-04-21 04:16:17.929168	\N	\N
f33d45d6-9783-41fe-8901-c0a5898141bb	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-104.19	-82.89	901.31	2020-04-21 04:16:19.136265	\N	\N
e26c51da-f8d9-42b6-9b74-dbac222b0c2a	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-107.18	-77.15	902.53	2020-04-21 04:16:20.179166	\N	\N
2905f61d-762f-4cb9-bb65-4ad3d04b42c8	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-107.3	-79.9	907.9	2020-04-21 04:16:21.284518	\N	\N
daf04a86-2139-433d-843b-46a27b522e88	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-107.3	-80.87	907.41	2020-04-21 04:16:22.390539	\N	\N
146c3e11-79ef-483d-b4dd-4c34c2c55dcb	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-108.46	-79.35	906.25	2020-04-21 04:16:23.501589	\N	\N
d03d6fd3-fdaf-4922-b1e2-118ebbe9dd34	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-104.61	-73.67	909.24	2020-04-21 04:16:24.589151	\N	\N
4ce8a0f8-b9eb-4db6-b8de-571987cbc220	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-106.14	-82.7	904.6	2020-04-21 04:16:25.715164	\N	\N
c5c9dd68-fd77-4a5f-b497-839d14d9138a	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-106.51	-83.86	896.73	2020-04-21 04:16:26.810824	\N	\N
80909c1b-1139-4455-82d8-51949c8a61f3	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-108.89	-83.56	904.24	2020-04-21 04:16:27.929471	\N	\N
987f23c3-3b0b-483a-b5fa-e581502fcadf	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-106.45	-79.35	907.78	2020-04-21 04:16:29.034301	\N	\N
5ac03813-b428-4c02-9da6-cabbdf856ba9	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-106.08	-79.35	906.92	2020-04-21 04:16:30.460867	\N	\N
1bc9c717-8e16-4fb8-b0c3-12b882d627ec	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-108.09	-79.35	901.12	2020-04-21 04:16:31.23035	\N	\N
2dad0655-819d-4c77-a845-0ecb7b1c7e74	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-108.52	-80.75	906.07	2020-04-21 04:16:32.329053	\N	\N
9a98a191-fa07-4443-82af-c037053c12f6	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-109.13	-78.19	907.84	2020-04-21 04:16:33.455887	\N	\N
857fee44-49b2-4a0a-8023-0c8edf4c79d7	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-104.0	-81.3	906.37	2020-04-21 04:16:34.728416	\N	\N
6283858d-8a14-41af-abca-c9dace9d03d9	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-107.6	-78.31	906.92	2020-04-21 04:16:35.700641	\N	\N
c5a8f420-7380-4794-986a-1878139e4b0e	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-106.69	-82.95	903.69	2020-04-21 04:16:36.7915	\N	\N
b3768dc1-9dca-45de-88a6-017e76c319a5	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-105.59	-77.76	907.17	2020-04-21 04:16:37.898679	\N	\N
293f8867-bf3e-4e5d-8a06-c12765d231da	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-109.31	-80.75	901.12	2020-04-21 04:16:39.00521	\N	\N
bfce6b8a-8e48-4a1a-a299-369b2b1638f0	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-102.91	-81.24	905.46	2020-04-21 04:16:40.106765	\N	\N
3edfa2a3-eeec-465c-beac-60130b3e320b	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-108.03	-80.75	901.98	2020-04-21 04:16:41.227779	\N	\N
59bb3075-1ee7-4713-9bf9-015ffc8fef97	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-110.47	-79.47	908.2	2020-04-21 04:16:42.325232	\N	\N
125d86bc-3e8f-4cf4-9705-305f38f612e9	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-108.52	-82.21	905.58	2020-04-21 04:16:43.448207	\N	\N
253071b9-0569-422a-9a0f-fa6caf6445c8	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-107.6	-80.08	905.52	2020-04-21 04:16:44.543894	\N	\N
4923b9ae-5d6c-4e1b-8e59-a3eef18d5e6b	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-109.62	-78.74	909.79	2020-04-21 04:16:45.663864	\N	\N
11318744-61c0-43ab-83bf-922cb99bbf87	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-106.32	-82.09	910.16	2020-04-21 04:16:46.773898	\N	\N
cd35f770-be96-42aa-921a-67f403e6a7e0	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-109.25	-77.88	908.75	2020-04-21 04:16:47.879884	\N	\N
16357469-15c9-49c8-bb8b-372dc275f230	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-107.54	-79.65	906.56	2020-04-21 04:16:48.994077	\N	\N
78dc4553-640e-4ebd-b948-0e390bd3e71e	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-105.71	-83.25	905.21	2020-04-21 04:16:50.107414	\N	\N
efeae2db-e891-4a73-887f-8fa6a698eb46	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-106.69	-78.49	905.33	2020-04-21 04:16:51.211806	\N	\N
938fd630-f04c-4e3c-8bf0-10d3ebd0efa4	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-106.63	-76.78	908.02	2020-04-21 04:16:52.318212	\N	\N
9304b97d-5b85-450d-b0af-6a5afa6f2d17	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-104.37	-79.96	905.58	2020-04-21 04:16:53.436802	\N	\N
6bedbbcd-b2f7-44c6-9748-df61e8528db7	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-106.75	-81.36	905.82	2020-04-21 04:16:54.553512	\N	\N
0443a80d-3d5d-47f4-9c67-1ffaa7a656df	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-108.34	-76.29	907.04	2020-04-21 04:16:55.644105	\N	\N
0ef6b724-dd43-44f5-af7a-0ae2554e6659	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-107.73	-81.97	906.19	2020-04-21 04:16:56.751738	\N	\N
3a03c6f4-340c-43cb-96eb-aa9c46105f88	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-106.87	-79.47	911.44	2020-04-21 04:16:57.861025	\N	\N
9ca9cb4f-aa62-4560-ab6e-2d0bf9a890e7	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-109.44	-78.49	912.17	2020-04-21 04:16:58.968159	\N	\N
af092404-f3f1-4c5e-9fee-6df1ce02d43c	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-107.18	-80.87	904.05	2020-04-21 04:17:00.07382	\N	\N
e712a58d-5475-4070-a4a4-fb6ebc95450b	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-108.46	-80.99	901.98	2020-04-21 04:17:01.30895	\N	\N
8914983d-602b-4090-a088-c45a72c720f1	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-105.9	-79.59	904.72	2020-04-21 04:17:02.282822	\N	\N
947d3b2a-d0f2-4e5e-95be-d9be48212396	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-110.05	-76.66	909.42	2020-04-21 04:17:03.413575	\N	\N
bb6c2969-f1b5-42a2-9a6f-bea4ac52a0f7	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-110.72	-85.02	901.79	2020-04-21 04:17:04.513267	\N	\N
2bee58f8-8c4c-4286-bffd-03b1583e3aaa	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-106.32	-78.61	906.07	2020-04-21 04:17:05.619022	\N	\N
745292f9-137b-4ca1-b57e-72700bef6ccb	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-109.74	-82.64	908.02	2020-04-21 04:17:06.732642	\N	\N
3e388a14-a9d2-4b11-a370-de82fa333347	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-108.03	-76.54	909.85	2020-04-21 04:17:07.836256	\N	\N
a2790d4d-ac24-4d28-81df-33fcef376279	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-108.89	-80.75	904.54	2020-04-21 04:17:08.950107	\N	\N
dbb0ff06-7979-4b09-87c8-f5ab6a3f38ca	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-106.45	-80.02	907.04	2020-04-21 04:17:10.091145	\N	\N
ed6de6a8-2cfd-4b3b-ac69-49a45c4228ae	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-109.01	-80.75	908.2	2020-04-21 04:17:11.205932	\N	\N
4e15e101-959f-421c-8ada-4941d327f66c	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-109.5	-82.34	901.73	2020-04-21 04:17:12.296274	\N	\N
5ac77611-41ce-4095-9bc2-6fbf8be39e6f	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-109.07	-73.3	904.72	2020-04-21 04:17:13.410622	\N	\N
db8d3bdf-5fba-4c62-971d-1e96f32dc639	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-108.4	-83.07	902.89	2020-04-21 04:17:14.507391	\N	\N
69d5627a-468b-4364-8d52-54402279fe45	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-109.01	-78.49	909.79	2020-04-21 04:17:15.616302	\N	\N
4ff90d47-0e7f-4997-a461-509bca671448	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-106.2	-94.36	903.56	2020-04-21 04:17:16.732816	\N	\N
9fa0d7bd-eb4a-4abb-9d16-dc2ba0a8121f	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-104.43	-75.81	907.96	2020-04-21 04:17:17.851989	\N	\N
a5dfd0ae-83c8-42ff-881b-f26a44a62a16	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-101.38	-78.37	906.07	2020-04-21 04:17:18.962598	\N	\N
f1e13574-063a-4020-9794-368f7db0739e	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-107.36	-80.32	904.24	2020-04-21 04:17:20.064057	\N	\N
acea1df8-ab14-4370-83d8-1513406e39e2	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-107.18	-79.47	909.55	2020-04-21 04:17:21.167507	\N	\N
88481894-0890-4254-a11f-c2738110055c	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-105.29	-85.08	906.62	2020-04-21 04:17:22.48591	\N	\N
12221be6-370b-4c3b-b542-dc1b39e04b25	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-108.52	-81.05	903.14	2020-04-21 04:17:23.377378	\N	\N
9a37afdd-9795-4e54-b0b3-d0e6225182be	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-108.09	-83.62	906.13	2020-04-21 04:17:24.506437	\N	\N
669cd80f-23e6-402a-92d9-49624383b4a8	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-108.58	-79.71	906.86	2020-04-21 04:17:25.592202	\N	\N
dcb2e998-0103-48a8-a1e5-4dfa33bf427b	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-148.44	23.8	875.92	2020-04-21 04:17:26.699552	\N	\N
94d961b5-a658-47b0-9653-bb0c78416211	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-102.54	-67.5	903.99	2020-04-21 04:17:27.909727	\N	\N
d994f032-5d65-4850-bd12-09280cc49a14	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-100.95	-68.97	904.79	2020-04-21 04:17:28.944103	\N	\N
3623001d-f14d-4a99-abc5-d48cd5b4337e	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-94.6	-71.04	905.82	2020-04-21 04:17:30.066659	\N	\N
b3a50ce5-aec0-4f91-81ac-42db3b1a82d8	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-139.83	-64.94	1001.53	2020-04-21 04:17:31.147409	\N	\N
b9121067-d72b-4574-b185-f476dee2cdd4	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-155.88	-111.63	844.42	2020-04-21 04:17:32.256957	\N	\N
c56e08fa-aa9e-49bf-9cbb-a278bcd7a452	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-182.62	-18.13	934.33	2020-04-21 04:17:33.377777	\N	\N
f31365b7-ceca-49a6-835d-fba63afe3470	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-228.52	-42.24	867.31	2020-04-21 04:17:34.498334	\N	\N
5550ccb6-268e-4329-9b87-a996e7b8ebaa	ce6b6d8a-a8f8-4a21-bbaa-6801a11f1e4e	patient accelorometer data	7772620d-2731-4a7f-9fda-6a412c37ee76	-92.47	-185.3	870.97	2020-04-21 04:17:35.594753	\N	\N
fcc3d0cf-96a3-4646-8b32-0744f29d687b	7d2be69a-cb46-4d55-b211-2784f7494c71	patient dashboard local test	f0451969-a187-4c96-a7c6-edf3e78abc7c	2.3	2.3	2.3	2020-04-21 19:19:52.684834	\N	\N
03e9a52c-d8c9-47e5-b673-5d4645d40811	649031f6-eb8e-4a49-a0cb-338641b448b1	patient dashboard local test	3745b6b2-894d-432f-a2dd-4cee16e60585	2.3	2.3	2.3	2020-04-21 19:21:11.786537	\N	\N
bda678a8-ce94-4ccc-b692-144a8b9d64bb	739fb199-ed81-4440-9353-71b1496d9d1f	patient dashboard local test	3a0417fc-cc82-4846-b1f8-27e81bfcfd16	2.3	2.3	2.3	2020-04-21 19:31:06.56836	\N	\N
2554c9b7-ebce-4daa-8ab0-a4c014deac03	71d20feb-e727-4b8f-89cd-8aa22d82833a	patient dashboard local test	6ef14045-d247-43ad-bd84-4e94dc038bcc	2.3	2.3	2.3	2020-04-21 19:31:54.578543	\N	\N
53ffdde7-c0fa-433f-ba2b-cb60ff03f173	eac23da7-408c-4d0b-a336-11c36e4027c8	patient dashboard local test	8132c6b0-1ef6-40d3-b9cf-b5dcd40c8dae	2.3	2.3	2.3	2020-04-21 19:46:54.187179	\N	\N
15087981-f340-4148-92ee-aa3a8978d4e4	b16c30bd-332f-45fa-987e-243022eb71b4	patient dashboard local test	5269bb19-f662-436f-a020-25f7e537ef88	2.3	2.3	2.3	2020-04-21 19:47:58.510482	\N	\N
41bfdded-fa80-46d6-970e-c1d3a7194e25	74875408-f543-46b9-b478-299f8392d2e4	patient dashboard local test	95de7023-1afa-49ac-a1c4-eded23b73048	2.3	2.3	2.3	2020-04-21 20:02:01.595209	\N	\N
8655e094-8656-4270-961e-00666643240a	bd8921e6-5909-42c1-9b45-0ccf95057a48	patient dashboard local test	2e66cbe3-0ed6-4b69-8d3a-d2999d31ea87	2.3	2.3	2.3	2020-04-21 23:17:33.203907	\N	\N
39509a81-2d2c-4dc0-810b-24c30df8c0e8	07a313ca-1f53-488c-928e-a8634a289538	patient dashboard local test	44ba6e55-ee1b-46fb-8c0c-bff3acbda66a	2.3	2.3	2.3	2020-04-21 23:28:14.149433	\N	\N
832865f0-d8cb-4f5e-8507-224f260b6360	63801eaf-9290-495b-bbf2-e42cc42c873e	patient dashboard local test	93ad735b-1ff7-4362-8649-469ea9707c5a	2.3	2.3	2.3	2020-04-21 23:32:46.568902	\N	\N
6aebbfad-81a7-4d69-bc2f-32e9917dee3d	e56bb73f-140d-470d-9b72-1b7801b342bc	patient dashboard local test	f869a92d-bd71-4406-bad9-6c7f1a70bff5	2.3	2.3	2.3	2020-04-21 23:34:24.599944	\N	\N
ef9c13ba-1c59-4a9c-ad7f-254f137dba0f	41e4039a-a370-417b-869c-341120f9a7af	patient dashboard local test	18c22bbb-558d-4c0b-bcf6-c58fe65c9033	2.3	2.3	2.3	2020-04-21 23:34:26.137635	\N	\N
801b0d00-2db5-4482-8299-92639eed2d55	83a4a97c-e8af-438e-882d-6aed1126b35d	patient dashboard local test	f58fa700-ab75-45d8-b1a8-9f5d0cb36c3b	2.3	2.3	2.3	2020-04-21 23:34:49.790302	\N	\N
70b6e0d7-ba92-4e8e-a7eb-a19a3918bc37	e35af47a-e39e-42ce-8cab-622565ba56d5	patient dashboard local test	24c5e75f-323d-49a3-81aa-3561df1c7dee	2.3	2.3	2.3	2020-04-21 23:34:59.016203	\N	\N
0ae17376-a3e4-4ddd-adbc-cb35f716fe8f	7f73d313-aa61-46d2-92a6-d3e28654bc26	patient dashboard local test	5949c1f3-2177-4aa7-b80d-90297d99f372	2.3	2.3	2.3	2020-04-21 23:35:08.354128	\N	\N
15054692-b917-438c-8eee-4ee73ba2ccf3	b1933cfb-977b-4705-9858-4756ea2ca37d	patient dashboard local test	e0191f8f-ceb7-4182-a292-c63925e7e0df	2.3	2.3	2.3	2020-04-21 23:35:41.931954	\N	\N
3486e57a-b6af-4249-86b9-bec974f71544	5cc98bd4-8060-4292-9530-1c213fc082b3	patient dashboard local test	0100e0c1-ea52-415f-9b97-1093e3e9336c	2.3	2.3	2.3	2020-04-21 23:36:33.401928	\N	\N
96107334-6aed-4faf-8a1f-4b63059f6dda	8320b76e-c915-4603-a88d-28d4abb551b3	patient dashboard local test	137856bd-e8b7-499b-9eb5-231a13650e63	2.3	2.3	2.3	2020-04-22 00:28:01.52071	\N	\N
f47965cc-7b1b-45a7-bd7b-3a6464e8bfd9	e6621a51-3a0a-4f32-add0-8dbef25e21ea	patient dashboard local test	02a176e5-e050-4c58-8762-ad8435394151	2.3	2.3	2.3	2020-04-22 00:30:20.729524	\N	\N
89aac528-754f-4111-b5a2-cb10947efd77	a5fb421b-565c-422b-87f1-43a70abac001	patient dashboard local test	448156ef-7db0-439c-966f-6457eec67b21	2.3	2.3	2.3	2020-04-22 00:33:28.63262	\N	\N
d81e12cc-f060-4ee5-a358-0354d8ac5a85	d0352232-d5bc-4cfc-9a17-6b1cd015928b	patient dashboard local test	c3621c10-f393-43a8-aa94-3c745f280293	2.3	2.3	2.3	2020-04-22 00:39:01.81894	\N	\N
8fd77942-ddbd-4266-8bc9-851812269e5d	1cc98395-4a5b-4d49-8282-ec8b80876811	patient dashboard local test	f6053985-49c1-44e5-9b95-7e9da0cc883a	2.3	2.3	2.3	2020-04-22 00:40:30.060079	\N	\N
64b9664e-0504-41c4-b1a1-258d83e7e8e6	31743e4f-5112-42ee-8329-fa976c945f79	patient dashboard local test	a55a2aa7-f604-42b1-8744-90c468e27c5b	2.3	2.3	2.3	2020-04-22 01:02:46.95488	\N	\N
e3d2a9ed-6f3b-4923-9530-5669df2d8af3	f822ea1b-d5d3-4239-9450-28675655407e	patient dashboard local test	7f4751bc-70f9-4ee5-bab7-d5ee89598cc8	2.3	2.3	2.3	2020-04-22 01:03:27.231007	\N	\N
a1c6b58b-cb76-4874-9400-3d5b508fc0fa	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	9.7	-37.96	997.86	2020-04-22 18:49:37.364163	\N	\N
2c84b129-6eb9-4415-8d9a-0cbb17a1ff5b	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	34.67	-72.57	978.82	2020-04-22 18:49:37.791444	\N	\N
7a304a13-de98-4b36-97a8-0f71fa2ea535	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	52.92	276.86	981.81	2020-04-22 18:49:38.222143	\N	\N
d8a07680-5162-450c-8ea1-0ef64fab0a82	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	182.74	-359.25	1034.06	2020-04-22 18:49:39.333701	\N	\N
d8a19e28-e1de-4238-ad5f-3a1cb38b1629	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	2.93	-183.59	955.75	2020-04-22 18:49:40.442523	\N	\N
267ad469-75af-413f-b62f-403f1febba81	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	91.19	496.64	819.4	2020-04-22 18:49:41.550503	\N	\N
d8002656-7262-4731-abfe-a03bd7e366fc	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	78.12	489.75	818.79	2020-04-22 18:49:42.660977	\N	\N
00920c1e-9aaa-4386-813b-8c7d2ae20773	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	89.54	462.83	862.98	2020-04-22 18:49:43.778459	\N	\N
d84afa9d-002e-4218-946f-2af9cfae108d	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	237.37	-532.71	1071.17	2020-04-22 18:49:44.888358	\N	\N
2a12afb2-0653-4338-9333-a001a674cf8a	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	221.07	-389.53	968.44	2020-04-22 18:49:45.998364	\N	\N
f3a66e67-60d6-4b39-acce-7c60bd746b6a	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-49.87	76.23	956.54	2020-04-22 18:49:47.108627	\N	\N
c29a2304-49b0-4d1d-a149-0d88bcaeb0ec	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-83.37	47.36	925.35	2020-04-22 18:49:48.218608	\N	\N
b4c0ced5-154b-4127-855a-601755e5d755	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-61.46	85.14	942.02	2020-04-22 18:49:49.33857	\N	\N
0abaf923-3731-4223-97b3-2fa464e7b25b	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-74.89	27.47	988.65	2020-04-22 18:49:50.449785	\N	\N
e5b3c19f-4310-494b-bacd-252e47d656b0	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-71.9	50.35	998.78	2020-04-22 18:49:51.52813	\N	\N
9483d28d-2358-438a-b7e7-481cbc05994f	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-66.65	69.82	987.3	2020-04-22 18:49:52.641193	\N	\N
cfb7cee8-7ff4-425b-aebd-9816c3dd6400	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-79.47	105.96	1007.63	2020-04-22 18:49:53.750288	\N	\N
fef83828-0d95-4b7a-a1c2-f574fd6cc89b	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-60.42	61.04	986.69	2020-04-22 18:49:54.856828	\N	\N
0096c6b4-c51a-4a27-85f4-42f3dce1a493	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-68.36	70.56	966.19	2020-04-22 18:49:55.964433	\N	\N
8958b26f-ae64-457e-bf8d-257b659865a6	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-86.3	65.25	972.11	2020-04-22 18:49:57.074909	\N	\N
d2759c8a-6338-484c-b081-176bb135aa0f	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-194.58	-2.08	896.48	2020-04-22 18:49:58.184788	\N	\N
7779eab6-2894-42c0-b1ed-0c552ff8cd68	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	209.9	218.2	878.11	2020-04-22 18:49:59.439492	\N	\N
ff31cb40-2ab8-43c4-8cca-a3aa88ead7de	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	181.76	247.38	931.09	2020-04-22 18:50:00.402405	\N	\N
d5c4383f-8538-4190-ac51-2047e992223d	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	157.9	219.6	916.08	2020-04-22 18:50:01.512432	\N	\N
2d2630bc-84d3-46b7-a3b3-802179ca6fb7	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-251.89	-32.1	956.42	2020-04-22 18:50:02.621943	\N	\N
bba8f0e6-c66e-4843-b1ae-5fc3b5cf2b5b	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-59.39	-2.14	999.88	2020-04-22 18:50:03.750615	\N	\N
bbfa6c68-4c87-4af3-8c62-88ec10a79dee	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-56.58	-3.6	998.96	2020-04-22 18:50:04.849608	\N	\N
477d5392-c2d7-4699-bd3a-1b5ee7fd7a23	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-60.0	-5.98	999.69	2020-04-22 18:50:05.958433	\N	\N
234f24a3-14a0-45a6-928e-c1f9173aec8e	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	106.2	-58.11	219.06	2020-04-22 18:50:07.06852	\N	\N
fae4e5aa-72f7-4bfb-89b6-a6270b5119a9	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-100.4	-180.18	983.34	2020-04-22 18:50:08.183729	\N	\N
da0c30d8-ec85-4684-909f-2e0478dd2ac8	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-143.31	-120.61	1036.38	2020-04-22 18:50:09.291779	\N	\N
1fb7c4b2-d1be-4f0b-ae5b-3ec45290e11d	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-495.48	-69.4	1522.09	2020-04-22 18:50:11.75176	\N	\N
99b26862-eaf4-4198-b3f0-49d0d2334792	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-439.03	-119.38	1017.33	2020-04-22 18:50:12.178567	\N	\N
46618d2e-c4e5-4b90-9ba9-0cb448af6693	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	209.05	335.51	891.17	2020-04-22 18:50:12.619237	\N	\N
5075ece1-5eed-46e6-a91f-b966b4c496b1	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-82.89	-209.53	1162.9	2020-04-22 18:50:13.728154	\N	\N
b2ee0d0c-0717-4e24-adab-89ac449a5701	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-62.5	-0.55	1000.0	2020-04-22 18:50:14.839407	\N	\N
4e48e1b1-1a77-4b6c-8e1a-b7aae0187506	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-59.14	-2.2	998.72	2020-04-22 18:50:15.948721	\N	\N
d66269b8-88e9-47c2-9efc-abff9efcbef6	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-28.99	-186.46	1014.22	2020-04-22 18:50:17.062148	\N	\N
f314c83d-b187-4cb4-8641-5cc59ac37d53	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-14.59	-190.19	895.87	2020-04-22 18:50:18.197436	\N	\N
45744213-1115-4270-b6c6-e08cd5cbac97	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-203.19	-134.83	1025.63	2020-04-22 18:50:20.751561	\N	\N
39130947-edd6-4c21-8bbc-5e246c2cb3d3	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-54.2	0.55	1000.55	2020-04-22 18:50:21.179091	\N	\N
ced660a4-cb92-4e8d-8df3-0ad01825e99e	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-60.24	-4.94	1000.79	2020-04-22 18:50:21.605219	\N	\N
cbd05f90-d4c4-4655-b402-912c867bb6ac	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-52.73	-2.75	1004.15	2020-04-22 18:50:22.599174	\N	\N
f7dc67bb-e0aa-44b5-a907-55ab3893e134	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-57.62	-4.64	999.21	2020-04-22 18:50:23.708857	\N	\N
ae915620-5cfd-4e5e-acdb-d81482d1b957	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-56.82	-4.27	995.12	2020-04-22 18:50:24.821179	\N	\N
f2dcd86e-2d8f-45d7-b601-fa0bf6b3fa7f	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-55.66	-9.03	998.84	2020-04-22 18:50:25.930363	\N	\N
dfaa1a20-7734-4ddd-a8f5-681f268f4702	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-59.2	-2.93	1001.59	2020-04-22 18:50:27.039431	\N	\N
b9923720-a0d5-4877-a3c1-3c5e64461171	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-60.18	-7.93	998.78	2020-04-22 18:50:28.168089	\N	\N
6d298639-f736-4c14-9f21-b0780e82b847	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-50.72	-3.17	998.6	2020-04-22 18:50:29.241073	\N	\N
bd6e65b8-d98b-492b-9305-89201e4e9b1d	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-54.69	-4.7	997.8	2020-04-22 18:50:30.364909	\N	\N
7bf4bfe6-81df-4b78-a27f-758188081f3c	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-54.75	0.0	999.57	2020-04-22 18:50:31.462761	\N	\N
58e76805-ca30-4150-9d62-1df92718b67e	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-60.85	-4.82	1000.55	2020-04-22 18:50:32.566154	\N	\N
7a78598f-a2f2-4f34-9160-88a447ff280c	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-54.87	-1.89	1004.27	2020-04-22 18:50:33.677118	\N	\N
53ae01e1-19d1-4be2-a2b2-01f1f774004e	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-56.21	-2.93	999.02	2020-04-22 18:50:34.78494	\N	\N
6d5ba08f-af92-490f-ab97-c49b0f97d7a2	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-54.02	-4.64	995.97	2020-04-22 18:50:35.894391	\N	\N
13fd36de-1ae6-4797-8cef-553f184774db	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-55.66	-4.33	996.15	2020-04-22 18:50:37.181984	\N	\N
e6a17734-1237-43d2-bee6-2a3ba8dc1f9b	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-58.04	-3.72	1001.04	2020-04-22 18:50:38.113101	\N	\N
23b17827-e144-407a-87ac-7c263d54adb3	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-54.69	-0.79	997.62	2020-04-22 18:50:39.220605	\N	\N
2d675c38-7521-4349-991a-f5e2f226985e	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-62.87	-7.32	1000.98	2020-04-22 18:50:40.330296	\N	\N
8c7a4a27-91b2-4d99-a023-1beee92281f6	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-56.34	-2.44	998.23	2020-04-22 18:50:41.439087	\N	\N
119aa638-264d-4064-9fad-16562d20c80e	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-57.13	-4.09	1001.77	2020-04-22 18:50:42.54932	\N	\N
118672c6-32a6-4fbe-8ce3-ed53c647deb5	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-58.23	-2.01	1001.04	2020-04-22 18:50:43.657062	\N	\N
f037ef78-c235-42f6-a9a0-8ffe31ff4518	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-54.38	-2.08	999.82	2020-04-22 18:50:44.767076	\N	\N
1ad15f1a-ac1e-457d-a114-3b19b5a919b8	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-56.7	-5.92	993.47	2020-04-22 18:50:45.877787	\N	\N
9c0deed3-95b3-424b-b8e0-b80a1bacd6a3	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-56.4	-1.16	998.47	2020-04-22 18:50:46.985095	\N	\N
ddb77959-6f94-4ee6-97ef-944c8107fd81	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-58.78	-6.35	998.23	2020-04-22 18:50:48.092333	\N	\N
ddd59e61-a3ae-4ec2-8043-e32aa0088500	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-58.84	-5.62	998.35	2020-04-22 18:50:49.202383	\N	\N
524e5a3d-7355-44cd-8380-26d2b4777743	e62c65bb-5ac0-4f11-b815-53107487fd42	patient accelorometer data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-56.58	-4.76	998.11	2020-04-22 18:50:50.311563	\N	\N
4cd2d669-a048-45e5-92be-89364b04b033	0aec7cc6-72d9-4bc4-b917-02e7ada1219f	patient dashboard local test	1bf7002c-e2ec-4a7c-85fe-dbdc81bc7018	2.3	2.3	2.3	2020-04-22 18:52:17.228916	\N	\N
bafb2e73-04a2-4f4f-aab2-697d24c895fc	a0c78395-df9e-4c11-9f95-4a649feea51b	patient dashboard local test	2e7a6d3d-30c4-4651-833d-e7d06db82d40	2.3	2.3	2.3	2020-04-22 18:57:50.90038	\N	\N
f7728224-2853-4aa5-85d4-90847f044cdc	6a81c61a-603f-4a4e-8184-81fa66569cf6	patient dashboard local test	c82f64aa-6f5b-4682-9054-237cb50f5030	2.3	2.3	2.3	2020-04-22 18:58:34.201434	\N	\N
77b2fa1d-f2a8-4c3f-a195-4a4f44804b18	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	28.5	436.16	884.28	2020-04-22 18:58:36.348009	\N	\N
2ddaeb44-10a4-4ae9-b7ba-351cbee61b21	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-6.47	398.74	864.69	2020-04-22 18:58:36.777717	\N	\N
204d88bd-8ff1-4584-b49b-8ca5944234f0	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	59.69	160.83	974.18	2020-04-22 18:58:37.269367	\N	\N
c031b538-af23-403e-ac67-b820a02666fd	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	7.32	164.92	977.05	2020-04-22 18:58:38.378208	\N	\N
c4e3c436-bad5-43ae-8e89-4411b9c12222	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-32.04	169.43	984.92	2020-04-22 18:58:39.438026	\N	\N
49796c8a-f748-42e2-ae36-93ae0280523c	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-24.17	157.23	974.3	2020-04-22 18:58:40.770074	\N	\N
a60e9fa4-4b41-4dad-8028-c47bd8d2287a	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-45.1	156.19	980.65	2020-04-22 18:58:41.64764	\N	\N
623d5326-35ac-45b4-935c-b4eba09e4bc9	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-80.08	202.88	967.29	2020-04-22 18:58:42.759026	\N	\N
13305083-a8df-4646-ada2-0a729ff10d98	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-108.34	182.86	983.89	2020-04-22 18:58:43.8626	\N	\N
afca6e5d-4f4f-445a-a0e7-7edafd0f234d	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-92.22	170.65	972.23	2020-04-22 18:58:45.048897	\N	\N
688b7982-0010-400d-98e9-ef681a641118	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-90.94	166.93	986.39	2020-04-22 18:58:46.088712	\N	\N
18012e46-d19e-4758-9e57-ce3d591c261d	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-89.17	169.01	988.65	2020-04-22 18:58:47.220933	\N	\N
6c11b04c-4b9c-40a0-bad9-ae9f8da33f21	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-271.73	454.16	886.47	2020-04-22 18:58:48.308965	\N	\N
4876b130-8f79-44de-958a-50ac8a0e84e2	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-122.8	-73.61	969.36	2020-04-22 18:58:49.42561	\N	\N
d1f846ca-a906-4b32-b895-b6c025c062e6	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-214.84	13.43	989.01	2020-04-22 18:58:50.529672	\N	\N
fca53af1-717a-42b8-a822-b1b11ab69e46	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-256.04	69.46	952.33	2020-04-22 18:58:51.638048	\N	\N
495f77e5-2060-4fee-a78f-75b6631c1ddc	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.09	-26.18	1001.4	2020-04-22 18:58:53.148387	\N	\N
73a2d87b-dba8-4c53-b14e-fd62823632e2	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.14	-24.9	998.6	2020-04-22 18:58:53.859076	\N	\N
3cdea92d-5834-40a1-8e74-f32b6d832e85	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-63.96	-23.38	998.9	2020-04-22 18:58:54.959705	\N	\N
b0659884-97e0-4f2a-8dff-8340c0ab0322	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-63.29	-25.27	1000.31	2020-04-22 18:58:56.076242	\N	\N
85e72cd8-f0df-4d25-8bde-2c05a4ff1bb0	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.61	-24.29	999.51	2020-04-22 18:58:57.178958	\N	\N
01533496-4fce-407e-97e8-f098c3a6485c	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-63.29	-22.16	997.92	2020-04-22 18:58:58.288345	\N	\N
9adbcfef-89fa-4540-b98b-3a6aafd2ef06	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.7	-25.09	997.07	2020-04-22 18:58:59.399375	\N	\N
dac922db-7a2c-43a9-9330-791f3e755f34	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.61	-25.45	998.47	2020-04-22 18:59:00.558305	\N	\N
bd269056-aeeb-4414-bb38-6b98f9c5f54f	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.45	-27.1	1001.46	2020-04-22 18:59:01.621624	\N	\N
462b95b5-68f3-4db8-b784-268d26fc9912	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.39	-21.12	1001.1	2020-04-22 18:59:02.728997	\N	\N
538ad596-8ac1-4045-9a91-1a014d983878	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.77	-36.74	999.21	2020-04-22 18:59:03.827488	\N	\N
a4fbdf7a-d8f9-4197-b9e3-49159f4d74ac	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.33	13.55	1002.5	2020-04-22 18:59:04.941061	\N	\N
b002c208-342b-4cbe-9fff-425c6a8d4366	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-71.9	-3.48	1000.0	2020-04-22 18:59:06.063574	\N	\N
b92e3366-8f1c-430e-9036-f68783d22ba6	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.59	-21.61	1002.44	2020-04-22 18:59:07.169177	\N	\N
2dbd5188-f04c-4198-aa51-b244c60282dd	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.0	-14.28	1009.83	2020-04-22 18:59:08.271556	\N	\N
10a7c463-3bd5-4857-b7e9-27b05b624605	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	44.43	-46.81	982.79	2020-04-22 18:59:09.378289	\N	\N
8db583d9-5e29-464e-82f5-ef0c991c97a8	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-80.99	-40.1	986.08	2020-04-22 18:59:10.487944	\N	\N
b3c08d7b-ea42-4e36-b16f-8d302f4de741	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-387.21	-103.39	938.78	2020-04-22 18:59:11.598213	\N	\N
56d36a15-2a14-4086-96e2-b15b53364881	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-410.64	-84.96	932.25	2020-04-22 18:59:12.725847	\N	\N
b25c0a97-9d23-478c-ba3d-88187029a6e1	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-367.31	7.39	941.59	2020-04-22 18:59:13.808145	\N	\N
176b4a39-30b9-47c8-a331-c47011a21036	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-325.81	35.95	985.84	2020-04-22 18:59:15.399172	\N	\N
4b7c270e-c9ca-46a1-add5-2ddb658263e5	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-182.01	152.71	968.26	2020-04-22 18:59:16.062759	\N	\N
024cc1ad-489c-4a17-9ffe-73c74db68a5d	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-248.96	-5.98	966.43	2020-04-22 18:59:17.168675	\N	\N
1b409017-aa20-4848-97f5-d25a6f95c0cc	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-185.61	-38.21	1070.98	2020-04-22 18:59:18.268405	\N	\N
07cfd13d-98c6-4a83-b087-5f2fd32ef094	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-312.44	-35.22	203.55	2020-04-22 18:59:19.37915	\N	\N
3c595d11-eaf5-49fa-8ffe-32f31f435897	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-68.24	27.47	1015.87	2020-04-22 18:59:20.488376	\N	\N
86c5e1b8-69cf-4bc4-8c71-bf632365f983	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.93	-26.79	997.19	2020-04-22 18:59:21.589825	\N	\N
404f37f3-ac8a-4fbf-be5b-fa0325d0fc99	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.55	-24.78	997.86	2020-04-22 18:59:22.725948	\N	\N
a42ab609-a3f7-4fe1-b4e5-5c9090dc445f	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.8	-23.8	995.61	2020-04-22 18:59:23.808207	\N	\N
92dac40c-910c-4a6a-990e-9ff4303b517c	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.99	-27.89	999.15	2020-04-22 18:59:24.91824	\N	\N
ea57846a-6110-41eb-a369-31cc5f8c45ed	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.82	-23.8	1000.37	2020-04-22 18:59:26.028349	\N	\N
dffcd392-3d47-4174-a955-634888097591	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.35	-25.82	998.78	2020-04-22 18:59:27.346282	\N	\N
7804b59f-f170-4b3c-90bd-5b912839abe2	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-74.28	-39.98	999.27	2020-04-22 18:59:28.238982	\N	\N
68314442-92d8-4739-815d-ce9fae372dcb	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.96	-25.76	1001.71	2020-04-22 18:59:29.348332	\N	\N
2abb1cf4-99ec-4560-8452-eff4665f6005	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.8	-23.44	1001.22	2020-04-22 18:59:30.458269	\N	\N
7953dd6a-0cbc-4053-92e1-cb0e70285d7f	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-68.18	-25.94	999.51	2020-04-22 18:59:32.750259	\N	\N
ce710cae-9ca2-4845-8720-3269efc24159	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-62.93	-22.95	997.01	2020-04-22 18:59:33.179114	\N	\N
14e92793-2945-40a0-9865-8d2bff204f31	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-70.8	-24.96	996.4	2020-04-22 18:59:33.788244	\N	\N
8db73411-dcd2-42e6-901c-e570ee0f8368	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.22	-22.64	1000.49	2020-04-22 18:59:34.888655	\N	\N
23e276f1-efa4-4313-aebf-a111f272f1a4	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-71.47	-27.4	996.83	2020-04-22 18:59:36.076677	\N	\N
be862299-7172-4157-8f1f-46c53c5e5e2b	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.55	-25.02	983.28	2020-04-22 18:59:37.109358	\N	\N
a6fe4220-81f4-4462-a8c1-a6dc7b892e62	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.08	-26.31	996.4	2020-04-22 18:59:38.245618	\N	\N
76f7887a-5afd-4d8b-9537-f305bff9aadd	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.2	-25.39	997.19	2020-04-22 18:59:39.329106	\N	\N
79613e39-9d69-4fe1-b398-6f981f3d202a	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.1	-27.71	1002.32	2020-04-22 18:59:40.445407	\N	\N
73b2b574-64f6-447b-b5fb-2a594d85f648	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-73.61	-25.57	1001.59	2020-04-22 18:59:41.588163	\N	\N
aea2a5c4-fa34-4c2c-bd30-941db0d4b15f	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.03	-24.41	998.6	2020-04-22 18:59:42.660139	\N	\N
b7631b07-a9a9-4e12-9629-e1983d7fc15e	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-69.64	-26.37	997.13	2020-04-22 18:59:43.76855	\N	\N
1fa5e018-5fd0-4d4d-98a5-85d3e96d1d8a	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.47	-25.82	998.84	2020-04-22 18:59:44.87971	\N	\N
7b34aad8-1aaa-4740-9aa0-130b4368ca0d	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.39	-22.22	999.39	2020-04-22 18:59:45.988186	\N	\N
0708e471-754d-4816-a1ec-121b990a2083	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.04	-28.44	999.76	2020-04-22 18:59:47.090982	\N	\N
bca5386c-982b-4033-bc80-acbbd3518250	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-63.96	-27.53	998.72	2020-04-22 18:59:48.204484	\N	\N
71e4c7f3-44c4-430a-b55c-82767f8042be	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.12	-25.21	998.41	2020-04-22 18:59:49.312521	\N	\N
0438a0c2-7ff8-4f0d-a389-c0bbf78b2c0b	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-62.07	-27.53	1000.12	2020-04-22 18:59:50.406757	\N	\N
55116408-dfed-4bf6-bcf6-28d449131911	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.87	-25.02	999.51	2020-04-22 18:59:51.516911	\N	\N
a1fa3a1a-d661-4b89-a3a2-4f15adbfab3b	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.22	-24.41	1003.97	2020-04-22 18:59:52.626663	\N	\N
e8961f01-8550-4759-8d19-e1e2aea0b2df	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.14	-17.09	1000.31	2020-04-22 18:59:53.758764	\N	\N
4355a948-3d42-4b45-9613-cb447f9f96eb	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-68.85	-27.34	997.13	2020-04-22 18:59:54.84306	\N	\N
29c193fc-10b7-42f1-8b53-5c12146bac74	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.14	-24.05	999.02	2020-04-22 18:59:55.9525	\N	\N
3b28b35c-9c40-4f56-9da8-dbe5c4402657	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-70.01	-27.95	999.57	2020-04-22 18:59:57.062891	\N	\N
59b7a9e0-db22-43a1-a871-d8ed2657d5f0	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-68.48	-27.53	998.41	2020-04-22 18:59:58.403735	\N	\N
7048e1ec-5dcd-422f-ab96-79ca1259cdc6	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-62.5	-23.62	998.17	2020-04-22 18:59:59.299736	\N	\N
6ee1d1ac-e15e-4e0e-89b2-042a37bcabab	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-71.72	-24.66	996.95	2020-04-22 19:00:00.399038	\N	\N
413ce20f-dd2c-4169-9905-e706dbdbd26a	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.81	-23.32	1000.12	2020-04-22 19:00:01.508725	\N	\N
b0fdc2b0-91a3-4485-b372-0e3550011735	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-70.07	-28.44	998.41	2020-04-22 19:00:02.617899	\N	\N
63db0ebd-22d9-4fd6-8a68-fd77774328b3	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.35	-22.83	996.64	2020-04-22 19:00:03.728905	\N	\N
0c3bb5f2-8abc-4728-a678-b3ceccd61a03	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.25	-26.49	1000.06	2020-04-22 19:00:04.838403	\N	\N
2fca5590-a050-4dfe-96dd-d51045d3c5f4	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-69.21	-26.67	998.96	2020-04-22 19:00:05.95791	\N	\N
60fb6b2c-fdde-42a9-bf31-508942695c49	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-68.6	-26.0	1000.24	2020-04-22 19:00:07.068868	\N	\N
6cbc8b00-417f-4f2b-8902-4c90f9331b72	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-63.72	-24.48	1001.4	2020-04-22 19:00:08.226461	\N	\N
629f59fb-c453-4129-a5f1-d474949015ad	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.63	-24.17	999.15	2020-04-22 19:00:09.290348	\N	\N
245d94d6-bb7a-4430-ba42-5da29e71984c	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-70.68	-28.5	999.82	2020-04-22 19:00:10.401982	\N	\N
649cc75c-b003-4e99-b83a-8f6f6cb5d11b	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-68.42	-24.84	1002.69	2020-04-22 19:00:11.508086	\N	\N
f4613763-306e-4523-be93-5f32e263d275	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.59	-26.98	1000.12	2020-04-22 19:00:12.620209	\N	\N
61e0f9dc-8e16-470b-b9e6-300687224a9b	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-68.24	-21.67	997.44	2020-04-22 19:00:13.717735	\N	\N
a552ee23-8c05-4346-8332-52a75232bf10	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-70.31	-26.0	996.34	2020-04-22 19:00:14.828194	\N	\N
f9005034-51a6-473f-ac67-de341c367c04	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.75	-25.21	1004.52	2020-04-22 19:00:15.937761	\N	\N
e8b5eb21-1456-4d73-b244-c90db539c76d	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.73	-27.4	1003.17	2020-04-22 19:00:18.161175	\N	\N
a5636349-eae4-4508-806c-e8c251f86c82	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-70.37	-26.92	994.63	2020-04-22 19:00:18.589948	\N	\N
24ea70c9-7e64-412b-8447-777e4c4efa15	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.33	-26.37	1000.92	2020-04-22 19:00:19.2714	\N	\N
2855bde8-3640-4d96-9305-86246d1179d6	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-71.66	-26.86	998.23	2020-04-22 19:00:20.808551	\N	\N
ee77c2b8-a6db-42a6-9d2b-918d6fbd527f	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-69.89	-29.11	996.15	2020-04-22 19:00:21.478184	\N	\N
1d31e0bb-8b2b-432c-a92d-d02fe2905641	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.39	-24.11	997.25	2020-04-22 19:00:22.590166	\N	\N
a03cc8a7-47f1-4412-a56b-8cd0a098614e	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-72.2	-26.12	996.83	2020-04-22 19:00:23.701948	\N	\N
f50ca28c-b40a-4caa-a59b-2cfbb2bc3873	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-68.6	-25.09	998.96	2020-04-22 19:00:24.808883	\N	\N
51a3743e-741d-4852-a1f2-3cf4bd6e217e	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-68.85	-28.99	1002.5	2020-04-22 19:00:25.909284	\N	\N
0f47c8c2-4057-4d15-9d46-be532dea6d37	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-69.76	-21.36	1001.34	2020-04-22 19:00:27.018554	\N	\N
b30897be-7006-4200-b79a-4c99d4ab1c96	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.02	-30.46	1000.61	2020-04-22 19:00:28.192739	\N	\N
b66c7e0f-cb45-4bc8-b16e-5f0241d11a5a	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-70.62	-20.14	1002.69	2020-04-22 19:00:29.497009	\N	\N
dc3c7e5e-9d47-4bf5-8b8c-1cdd5dd810ab	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-71.96	-27.22	1000.12	2020-04-22 19:00:30.351193	\N	\N
4926f972-8bda-4ac2-b1ab-67700132474e	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-68.3	-21.42	998.11	2020-04-22 19:00:31.463216	\N	\N
a1672398-aa03-4967-bd4c-854cfbac7c4a	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-71.72	-26.31	1001.95	2020-04-22 19:00:32.568705	\N	\N
0712f7db-30b5-4b80-a28d-d362350d980e	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.96	-23.99	998.84	2020-04-22 19:00:33.686225	\N	\N
720867cf-59e4-4446-8596-c0bcf7076dc2	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.2	-25.51	997.92	2020-04-22 19:00:34.789272	\N	\N
773a677b-3b39-4d4b-8cc4-236db225a983	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.81	-26.43	1001.46	2020-04-22 19:00:35.89888	\N	\N
98893851-6cd2-487f-b240-016006281878	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.16	-26.86	999.45	2020-04-22 19:00:37.009664	\N	\N
fd71d23b-f36e-472b-95b8-3dc51d6f2c82	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-70.56	-29.36	1001.77	2020-04-22 19:00:38.108557	\N	\N
5e02b9c2-1f2c-49d4-a199-9dde803fe22c	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-68.66	-21.97	995.85	2020-04-22 19:00:39.808015	\N	\N
10eb047b-bd73-411c-b617-264fbfc10bd5	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.2	-22.95	1000.31	2020-04-22 19:00:40.328177	\N	\N
735ee6fe-cf80-4258-b66e-e1a0b9dca449	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-71.96	-25.39	995.73	2020-04-22 19:00:41.467471	\N	\N
1297781e-1b95-4fc3-a564-92d951d4ff30	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-68.48	-23.56	998.96	2020-04-22 19:00:42.548485	\N	\N
a28c8887-5e4b-48c9-90c7-0cca15f3cbab	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.99	-24.05	997.31	2020-04-22 19:00:43.658615	\N	\N
005e48f1-d371-4c13-b387-6c9c4e3725c0	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-68.3	-23.68	998.05	2020-04-22 19:00:44.769225	\N	\N
ccc1637d-dc62-4d49-a3ee-73609bb0b081	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-70.92	-24.05	997.38	2020-04-22 19:00:45.878138	\N	\N
e160721c-9d97-4435-bf7a-5f45573b988a	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.8	-23.93	998.84	2020-04-22 19:00:46.991175	\N	\N
a9df89a3-7970-4b50-990a-2961026d34c9	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.81	-24.48	1000.06	2020-04-22 19:00:48.098613	\N	\N
73024156-6d22-4dae-aee2-52ba9cc2d5de	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.35	-23.5	1002.2	2020-04-22 19:00:49.208306	\N	\N
cab931ff-5af2-4246-ae5f-d951be056bb5	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.67	-24.05	997.5	2020-04-22 19:00:50.32028	\N	\N
03550442-acf9-4a42-93d9-d84afde64253	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-279.24	522.58	767.76	2020-04-22 19:00:52.909552	\N	\N
d65e84c3-70f4-4654-9045-90d18947ccb9	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-563.6	625.55	628.48	2020-04-22 19:00:53.338445	\N	\N
18b2d14c-f5b1-4177-9da3-16e9ba97e3e9	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-54.14	70.13	960.88	2020-04-22 19:00:53.981621	\N	\N
4bd32c16-a83c-4b13-b97e-caf509bcba16	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	21.36	221.92	1156.49	2020-04-22 19:00:55.252481	\N	\N
c4865343-0ed8-44d7-b815-fd4e76c099dc	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-270.2	340.76	1240.97	2020-04-22 19:00:55.857619	\N	\N
1017fb04-1ab5-4fe5-8272-074d88c3a1f8	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-121.64	-108.7	938.72	2020-04-22 19:00:56.99664	\N	\N
9b98bf09-e1ec-494a-b353-d297be41c15c	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-93.63	228.03	982.24	2020-04-22 19:00:58.129758	\N	\N
2d8de3db-1c44-4c61-9f81-e4c0bfa7c61a	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-143.25	-115.78	1012.7	2020-04-22 19:00:59.188061	\N	\N
6379b832-1114-4466-a0a1-b49b6abe8129	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-156.68	-98.27	969.73	2020-04-22 19:01:00.298581	\N	\N
b30833f9-8ad9-4ab3-b490-25ef20ea6af0	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-108.7	-191.65	971.86	2020-04-22 19:01:01.411403	\N	\N
51c06e8f-2731-44d2-aef4-dd865d1dc2c5	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-206.24	-39.92	1002.62	2020-04-22 19:01:02.51837	\N	\N
c54cda4d-2111-4deb-af24-60c2e86bea1d	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	190.49	-409.55	552.98	2020-04-22 19:01:03.628156	\N	\N
0357d158-caf1-4bdc-bc27-66780ac49901	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-63.72	-24.05	1000.92	2020-04-22 19:01:04.740729	\N	\N
82994c01-78ad-4a7e-becd-f83ff3d57246	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-62.74	-22.83	1002.32	2020-04-22 19:01:05.838572	\N	\N
96d70a3f-059f-49c1-9d50-e91be9c5c8a3	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-62.01	-24.29	999.76	2020-04-22 19:01:06.957493	\N	\N
28d79c24-6edb-4013-91be-9401d3d26cc8	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.31	-24.78	1000.18	2020-04-22 19:01:08.062716	\N	\N
ba90dd52-f468-45ad-866f-93247df899bc	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-61.52	-22.58	999.88	2020-04-22 19:01:09.168875	\N	\N
e16de091-3215-43fe-b8c4-bb419050a4d3	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.21	-21.48	1000.06	2020-04-22 19:01:10.94971	\N	\N
b8781704-e9e4-4e58-8bea-af698eebf076	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.98	-23.44	1002.32	2020-04-22 19:01:11.389093	\N	\N
e23b2f4d-69f4-4d94-ad25-506d95c6b4d8	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.94	-26.43	1000.06	2020-04-22 19:01:12.49911	\N	\N
c18b6b14-f7bf-4542-863a-d157e90324bf	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.58	-24.29	998.78	2020-04-22 19:01:13.609633	\N	\N
06ce6869-2a25-4d19-8974-0ec45a4f5f52	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.86	-23.62	1000.49	2020-04-22 19:01:14.756648	\N	\N
9ff8d7e9-812a-4c94-9860-afc7cb28739b	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.45	-24.6	1000.0	2020-04-22 19:01:15.8287	\N	\N
8cab22cf-472d-4304-93e0-21ac093ef29a	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-63.35	-23.38	1001.83	2020-04-22 19:01:16.938819	\N	\N
16cb9b05-37c6-4509-a0f8-67290b07c5d7	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.88	-23.07	999.57	2020-04-22 19:01:18.038146	\N	\N
f1493d90-f44d-4c30-8bbc-16457bdfd983	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.7	-23.32	1000.0	2020-04-22 19:01:19.148775	\N	\N
fffab69f-f12d-42b6-bd08-ba5e475ae78e	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-61.89	-23.19	996.7	2020-04-22 19:01:20.25849	\N	\N
a68b7c38-dd18-4de0-8568-cacaea9a2559	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.47	-23.19	999.39	2020-04-22 19:01:21.368427	\N	\N
36c6b357-ecf3-42b6-ad86-483d80059c77	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-63.29	-21.85	997.38	2020-04-22 19:01:22.506811	\N	\N
fc4b9377-c337-4888-bb63-3eb799f9e5f2	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.45	-24.11	1005.31	2020-04-22 19:01:23.588518	\N	\N
1a75e593-222e-488e-a254-c8403f7cb83a	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-63.05	-23.56	995.73	2020-04-22 19:01:24.698486	\N	\N
63b5c2b8-72cb-47ca-a60b-344eed32b39b	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.06	-24.17	1002.32	2020-04-22 19:01:25.808011	\N	\N
29bd90d8-08f4-4b30-8504-0ef64ef09600	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-63.05	-23.8	1002.38	2020-04-22 19:01:26.918527	\N	\N
57023c5c-d0ca-46a9-a757-b9f0c6b79267	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-62.87	-22.71	996.77	2020-04-22 19:01:28.02866	\N	\N
6dc21c56-7324-4aa0-af81-5f84a3694901	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.98	-23.01	1002.08	2020-04-22 19:01:29.138013	\N	\N
40b87583-4ae3-4c47-930b-13725d2d084e	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.28	-23.38	1000.06	2020-04-22 19:01:30.25625	\N	\N
981559f2-2745-4b9e-afd5-d5b6ba55a00e	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-63.48	-24.35	995.97	2020-04-22 19:01:31.349445	\N	\N
20496329-6f7f-4b46-ba7a-0426c0e191a3	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.45	-23.8	997.19	2020-04-22 19:01:32.458218	\N	\N
fe18e321-b83f-4c1c-b396-c61766b31b25	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.12	-22.89	997.92	2020-04-22 19:01:33.572884	\N	\N
e6650f1f-6696-477a-bce3-41ebda3779d9	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.31	-23.68	996.83	2020-04-22 19:01:34.67794	\N	\N
b530cdd3-0c04-46af-a3ec-acc49f18598b	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-62.13	-24.41	1000.0	2020-04-22 19:01:35.789429	\N	\N
42f4f4b0-8078-4e21-ad61-886d05ab8538	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-63.54	-23.38	997.62	2020-04-22 19:01:36.900951	\N	\N
7dbb7bfe-86f6-4ac8-ba51-9708af8aaa2d	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.06	-25.82	997.5	2020-04-22 19:01:38.126265	\N	\N
2c8c5e49-9808-4684-a75a-bf0d7969a033	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-63.48	-22.89	999.76	2020-04-22 19:01:39.118271	\N	\N
90ae7fda-8a61-4b00-bee1-0f7d8b012329	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.92	-24.96	999.69	2020-04-22 19:01:40.22901	\N	\N
506472cf-0710-494f-b57b-42977eef3d80	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.77	-23.56	999.15	2020-04-22 19:01:41.339294	\N	\N
7547c09f-2fe7-4c9c-9f78-0dce5ab12122	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.03	-23.19	999.63	2020-04-22 19:01:42.449682	\N	\N
ee36fc3d-9430-476b-bb4a-361f24418803	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.96	-24.41	998.11	2020-04-22 19:01:43.548401	\N	\N
70b58ac8-1200-450a-a144-7d354ca308bf	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.51	-22.77	1000.61	2020-04-22 19:01:44.657878	\N	\N
783a5228-4a68-4b58-aaef-429afec42456	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.37	-22.95	1001.28	2020-04-22 19:01:45.768473	\N	\N
0345437c-157d-409a-810b-b0f3945030b7	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.47	-21.67	999.94	2020-04-22 19:01:46.878001	\N	\N
8f6338a3-0d5f-4c09-baed-f7c35bb052d1	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.31	-23.86	995.0	2020-04-22 19:01:48.006074	\N	\N
830ad6de-13b7-411c-a4c7-5065f9e56058	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.04	-26.12	996.7	2020-04-22 19:01:49.098283	\N	\N
b84693ce-7c16-4cd1-ada9-00d38c773f3d	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.43	-24.35	999.21	2020-04-22 19:01:50.211223	\N	\N
d067b051-5628-4ff4-95f5-178f69af14b0	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-63.54	-24.11	996.77	2020-04-22 19:01:51.319316	\N	\N
97db5377-dd25-4def-aa6b-89f2dc7596ba	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.82	-23.38	995.12	2020-04-22 19:01:52.430389	\N	\N
c56f0928-4e45-42ba-a752-1ce677d9af58	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.8	-23.86	1001.1	2020-04-22 19:01:53.538861	\N	\N
2c15e9e0-eb22-4a68-b739-231381e432ce	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-63.17	-25.76	1001.46	2020-04-22 19:01:54.698132	\N	\N
d77069af-bf50-4c43-88e1-06d095be4d4a	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.96	-24.23	1001.95	2020-04-22 19:01:55.748759	\N	\N
82ff8556-0222-402f-a8b7-5c872e82239f	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-67.44	-21.61	999.08	2020-04-22 19:01:56.858365	\N	\N
951a3bda-15c9-4f51-8f7e-07267b70d57b	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.25	-24.66	998.35	2020-04-22 19:01:57.968862	\N	\N
6d8643a6-1ebb-44ed-8864-633de4acb7e1	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.51	-23.62	1000.67	2020-04-22 19:01:59.079103	\N	\N
5bf91ff1-11d7-4c9d-82d6-1fbe540cd74d	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.12	-24.78	997.31	2020-04-22 19:02:00.334372	\N	\N
6bd7263e-3d95-4759-949b-36e29d03a55c	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.16	-25.27	1001.71	2020-04-22 19:02:01.298819	\N	\N
76ac1165-61de-4b6a-86b3-6a57f6e7b983	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-62.56	-23.74	996.7	2020-04-22 19:02:02.410724	\N	\N
f418aa1d-5f58-4c34-a2cf-713f8e9248d3	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-65.49	-24.9	999.02	2020-04-22 19:02:03.537858	\N	\N
e049665e-5bff-4223-93f5-cb76d8b712de	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-64.82	-25.39	1000.73	2020-04-22 19:02:04.628233	\N	\N
d3cdf823-8c16-4a15-9dcc-008847763d73	18194907-abcf-4d7c-986c-dafd2cf251f6	patient accelorometer data	2c083db9-d0ad-47e3-81b9-4f8990734037	-66.41	-24.54	997.99	2020-04-22 19:02:05.738747	\N	\N
eda87dba-7373-4940-be97-7d53407916ff	0293f7df-b21b-465b-8fb3-ec73abca33a8	patient dashboard local test	87e445bd-d145-4b42-9cac-ef9d40345a54	2.3	2.3	2.3	2020-04-22 19:33:41.921089	\N	\N
b63772ea-6bb1-419d-9c83-7ed6e37c6ba7	af25e546-69b7-4bea-ba17-19d4b8848e4c	patient dashboard local test	64a4fd65-a137-4eca-989b-b5809d4251c4	2.3	2.3	2.3	2020-04-22 22:50:14.588329	\N	\N
cdb70d39-6a3b-4af1-a951-1bbf735bc62b	51dcb744-6a08-49b9-a51a-0d4cd23f7cf5	patient dashboard local test	792a5be4-f42a-4d06-9b8f-8de21fa4b39c	2.3	2.3	2.3	2020-04-22 22:53:18.421235	\N	\N
9fabc125-f609-48a3-bac3-f6aa5d4183ab	8a7241bf-d9be-433d-bdc7-95d4013e5cbb	patient dashboard local test	d042d658-e9bc-4876-ae19-f0ad3034e9ed	2.3	2.3	2.3	2020-04-22 23:03:42.181525	\N	\N
fdb6525d-e263-4539-bbd6-cd52329fef3c	28dbb6ab-5b31-4234-8f9a-e36638c3b13a	patient dashboard local test	8ede6278-ebff-4c88-b2b6-98e246af93e9	2.3	2.3	2.3	2020-04-22 23:10:39.630178	\N	\N
2e9163b3-d84e-436c-b5d4-99fe1bf626de	cc534d76-14da-4f81-a75b-3f448c2da367	patient dashboard local test	351ba6da-e182-478c-a767-04217ebf9027	2.3	2.3	2.3	2020-04-22 23:15:48.826398	\N	\N
29aa817a-55de-482b-ba1f-bf8fca79a033	ed8c1137-e1ab-4ed4-bb0a-64a01135556a	patient dashboard local test	f5ca4161-4a11-4c05-b125-06795be61325	2.3	2.3	2.3	2020-04-22 23:15:54.481166	\N	\N
eb6b0122-01d9-4187-b138-e1faf63c49ee	a8b64dfa-1d87-405c-a8bd-82e794f16041	patient dashboard local test	87352af0-5bee-4792-ac49-885c4e151ca1	2.3	2.3	2.3	2020-04-22 23:17:53.578145	\N	\N
637002ba-2242-4320-bd08-bd84ea829874	002d5950-23dc-4d41-8183-9ce7c2391afe	patient dashboard local test	80b9f471-73fd-4ebd-957f-7d8a2ee661f0	2.3	2.3	2.3	2020-04-22 23:18:05.743331	\N	\N
9b598417-0d7e-4906-831e-840c7fd4bd45	38765af8-a6cf-481c-8a59-289faeb06705	patient dashboard local test	be5c88ff-2938-4be1-804f-ed504e37ce91	2.3	2.3	2.3	2020-04-23 00:15:13.121471	\N	\N
ec86fddc-a79a-4226-9f0f-db16be129e1f	1af81127-4712-4d83-8684-12fcabd2fa7d	patient dashboard local test	7db2fd53-098c-4c2a-991a-284d5d043f40	2.3	2.3	2.3	2020-04-24 00:10:04.13197	\N	\N
b419ab6b-bff4-4133-a655-ff24b7355934	21be8ecf-c704-42ce-b1ee-bcf68f1fcaf0	patient dashboard local test	895a7274-6f8b-4752-be9e-4a63512642bd	2.3	2.3	2.3	2020-04-24 00:18:28.967233	\N	\N
86548cd3-435b-46fb-86e2-a34e166789f8	719e7542-239b-459f-8680-934bcdc2bde2	patient dashboard local test	16daad88-272e-4887-9f24-ce42c05b44b3	2.3	2.3	2.3	2020-04-24 00:19:11.36302	\N	\N
cc6d3ba5-1093-4ae2-9b6e-fe7f6d7165f5	b2515cf6-045f-4b42-926f-d6412b0da33a	patient dashboard local test	5ae7bc55-e9d4-485f-b81b-bb95197e104f	2.3	2.3	2.3	2020-04-24 00:19:22.908172	\N	\N
963aa495-411a-4591-a15b-7cfafe7cb80e	33c8b0ad-cac1-4764-a96f-5809e254223b	patient dashboard local test	c53718f3-793c-41cc-9a06-62052370901f	2.3	2.3	2.3	2020-04-24 00:54:16.728399	\N	\N
87253035-6531-4ed7-a68e-37a7e8354556	7fd7e225-588b-4e03-b2b3-16d42baa422c	patient dashboard local test	90043e45-61e6-4a52-968e-f3faa7c66628	2.3	2.3	2.3	2020-04-24 03:52:01.456095	\N	\N
ab4b6012-52d8-4acc-a494-31493b7031ef	b3ec426e-2325-43d1-a21d-a11859fd6460	patient dashboard local test	389a5767-05d0-4809-b324-6f477858aebb	2.3	2.3	2.3	2020-04-24 03:56:04.083405	\N	\N
\.


--
-- TOC entry 3922 (class 0 OID 25279)
-- Dependencies: 198
-- Data for Name: biometric; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.biometric (id, patient_id, heart_rate, sbp, dbp, created_at, updated_at, deleted_at) FROM stdin;
e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	2c9ca6f4-e9da-41fa-8027-fcfc0293644b	43	120	70	2020-04-23 16:48:35.589111	\N	\N
b9d224f7-c888-4efe-8996-d8cde5a4b5c2	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	66	120	80	2020-04-23 17:25:52.604073	\N	\N
504ae90a-2f36-425a-af2f-19e772118031	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	115	117	71	2020-04-23 17:25:52.604073	\N	\N
c03551c1-e914-4bea-a72e-b8513b3341d2	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	73	117	81	2020-04-23 17:25:52.604073	\N	\N
0d6760c4-97ab-42d7-8c30-55fed4a527cd	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	74	125	87	2020-04-23 17:25:52.604073	\N	\N
a8accf7e-e4d9-46b3-9801-21392a75d94a	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	74	114	76	2020-04-23 17:25:52.604073	\N	\N
08ae8873-7df6-44f3-8ee0-61249f4a4a28	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	84	112	70	2020-04-23 17:25:52.604073	\N	\N
5f8d75db-0aeb-45a6-a02e-77ab12696c3f	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	77	120	77	2020-04-23 17:25:52.604073	\N	\N
e57665a5-1fc5-4310-84d2-f4256056d93e	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	78	107	58	2020-04-23 17:25:52.604073	\N	\N
449ef558-3045-4cf3-8e3e-e7095a9406a5	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	82	113	70	2020-04-23 17:25:52.604073	\N	\N
a254b7a4-cecc-4ff0-a1f0-29ddcc664228	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	86	108	70	2020-04-23 17:25:52.604073	\N	\N
4096b654-6325-4508-b77f-255dcd9611c6	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	85	121	75	2020-04-23 17:25:52.604073	\N	\N
a287a4fc-3830-489e-8778-7b7fd790bc17	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	77	109	65	2020-04-23 17:25:52.604073	\N	\N
c46c2267-90ad-498e-b27c-58a8f359e706	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	72	115	73	2020-04-23 17:25:52.604073	\N	\N
cfa7cb3c-c286-46c0-8995-cd45e6bfebd6	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	85	116	74	2020-04-23 17:25:52.604073	\N	\N
bdfb90e3-9320-4b90-bbe2-f61ee8094abe	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	84	120	74	2020-04-23 17:25:52.604073	\N	\N
55d41d2f-8f0f-41c8-8d98-340fdcd40009	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	85	107	67	2020-04-23 17:25:52.604073	\N	\N
f517b7d4-33b5-4dec-957e-8b65967ce27f	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	74	101	65	2020-04-23 17:25:52.604073	\N	\N
fd810be9-fc3b-4ae2-9935-3cd8875cfcda	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	70	103	63	2020-04-23 17:25:52.604073	\N	\N
5becb8c1-0dbb-4827-8ca1-5b637c110597	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	90	96	49	2020-04-23 17:25:52.604073	\N	\N
0be674c0-8152-4254-8dc7-862360652cf4	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	97	128	80	2020-04-23 17:25:52.604073	\N	\N
a41bd2aa-641f-4c4a-8570-9b007867f121	e0fb2aac-fa7b-4eef-9b55-d35a4481ea53	67	99	72	2020-04-23 17:25:52.604073	\N	\N
\.


--
-- TOC entry 3923 (class 0 OID 25287)
-- Dependencies: 199
-- Data for Name: emotion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emotion (id, patient_id, dominant_emotion, neutral, anger, happiness, surprise, sadness, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3924 (class 0 OID 25295)
-- Dependencies: 200
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game (id, game_id, description, patient_id, left_hand_score, right_hand_score, time_played, created_at, updated_at, deleted_at) FROM stdin;
8ee9489b-83b6-4022-be3d-2db2480b3bb2	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	38	36	194	2020-04-21 01:16:21.672657	\N	\N
3c4bac95-841e-4fc1-9161-f0ff029f7f90	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	23	21	194	2020-04-21 01:16:21.926388	\N	\N
629f4978-6a1e-4d70-9832-c7dde4ed3835	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd270-833b-11ea-bc55-0242ac130003	57	53	194	2020-04-21 01:16:22.177979	\N	\N
c46da123-28d0-47a1-9be5-f8332ab8fc0e	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd270-833b-11ea-bc55-0242ac130003	43	39	194	2020-04-21 01:16:22.424892	\N	\N
29788df5-9114-4a38-9bdc-b30c61def547	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	85	89	194	2020-04-21 01:16:22.735128	\N	\N
e890497d-f4ac-4b02-845c-ffedb4b74a0b	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	93	97	194	2020-04-21 01:16:23.189382	\N	\N
af5e9338-462e-4a72-ad06-345751eaca14	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd608-833b-11ea-bc55-0242ac130003	79	81	194	2020-04-21 01:16:23.435137	\N	\N
ce7e3a4c-9c70-4a3d-b2b2-1f801ee5ee02	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd608-833b-11ea-bc55-0242ac130003	84	86	194	2020-04-21 01:16:23.678137	\N	\N
9376e61c-bfd9-4ec7-b26f-8c77411f262f	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	48	43	215	2020-04-21 17:06:55.77816	\N	\N
a74f806c-b647-4c9a-95bc-08beae92d487	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	38	33	215	2020-04-21 17:06:56.027398	\N	\N
a67d2dff-d7de-446d-bfad-29c21d33011e	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd270-833b-11ea-bc55-0242ac130003	64	69	194	2020-04-21 17:06:56.274878	\N	\N
68d31d27-08f6-424e-922f-c2bf87fa0857	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd270-833b-11ea-bc55-0242ac130003	51	56	194	2020-04-21 17:06:56.522404	\N	\N
59ab153b-99a5-4688-ba0c-bfd46565d9ea	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	88	86	207	2020-04-21 17:06:56.769158	\N	\N
e1f97fb2-de1c-46ab-ac47-3452143b2f6b	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	94	92	207	2020-04-21 17:06:57.029161	\N	\N
2b10b09b-19c3-41d7-9da9-84d1040d5d8f	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd608-833b-11ea-bc55-0242ac130003	81	85	207	2020-04-21 17:06:57.285669	\N	\N
af37687f-191e-44ef-818b-a9d2b8be66b9	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd608-833b-11ea-bc55-0242ac130003	88	92	207	2020-04-21 17:06:57.534159	\N	\N
9eefee84-9cd6-4264-a1df-d4957b80c678	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	55	56	215	2020-04-22 18:15:12.104304	\N	\N
8196fc44-2f6b-49aa-9073-a3ad8a4ad26e	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	51	52	215	2020-04-22 18:15:12.366045	\N	\N
7917d246-454a-44a1-af8f-ac95672242e4	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd270-833b-11ea-bc55-0242ac130003	71	73	194	2020-04-22 18:15:12.635521	\N	\N
6e69616a-0242-4fc1-b5ca-26a7594aad44	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd270-833b-11ea-bc55-0242ac130003	65	67	194	2020-04-22 18:15:13.58854	\N	\N
d5b865c4-ed61-4373-b828-131b029d73b6	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	88	85	215	2020-04-22 18:15:13.862142	\N	\N
4ceaa01a-2b79-4171-8c70-04832b6670e2	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	94	91	215	2020-04-22 18:15:14.762543	\N	\N
1fb1cc2e-7958-4824-bc59-55121dba5e1b	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd608-833b-11ea-bc55-0242ac130003	84	85	194	2020-04-22 18:15:15.016343	\N	\N
400d83d1-207a-4548-98ca-6f1e2d0eb6e7	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd608-833b-11ea-bc55-0242ac130003	88	89	194	2020-04-22 18:15:15.281565	\N	\N
7ac4d7b7-b0fc-495a-ac8a-c7ae61f1a9ba	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	61	63	215	2020-04-23 22:30:32.433299	\N	\N
d32a173d-6e30-4b0b-8cd7-4da163a704b1	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	62	64	215	2020-04-23 22:30:32.680188	\N	\N
20ebf9c1-9ecb-4b2c-b471-a04c0e3ff8e3	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd270-833b-11ea-bc55-0242ac130003	75	75	194	2020-04-23 22:30:32.944471	\N	\N
bef577c0-c388-4d43-adca-dd178eedfe51	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd270-833b-11ea-bc55-0242ac130003	71	71	194	2020-04-23 22:30:33.198243	\N	\N
0866a493-7902-443f-97b2-96d4a46e5fc0	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	89	84	194	2020-04-23 22:30:33.444939	\N	\N
f4abbe35-86ae-4c6f-8fae-8faecc182ff4	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	95	90	194	2020-04-23 22:30:33.688543	\N	\N
914b4595-8142-4e64-a1c8-d3b3b67db44a	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd608-833b-11ea-bc55-0242ac130003	88	90	215	2020-04-23 22:30:33.962041	\N	\N
b668cc8b-88f3-483f-a22f-90a0be66af05	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd608-833b-11ea-bc55-0242ac130003	91	93	215	2020-04-23 22:30:34.204197	\N	\N
3dfc2ce1-3914-4bc0-aff7-127af93200b0	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	61	61	215	2020-04-24 19:37:52.699852	\N	\N
326b7f33-1a9d-47a8-bba6-2d2a8d78b258	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	62	62	215	2020-04-24 19:37:52.942994	\N	\N
8169a99e-92e0-4b30-a9c8-6ca1767fd673	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd270-833b-11ea-bc55-0242ac130003	75	71	215	2020-04-24 19:37:53.187093	\N	\N
a48965be-335d-483b-a3c5-1661f5e7d853	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd270-833b-11ea-bc55-0242ac130003	71	67	215	2020-04-24 19:37:53.431115	\N	\N
18574c9f-163b-4d35-8bde-f6c3c1a96b6a	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	89	84	194	2020-04-24 19:37:53.673509	\N	\N
68008bbd-9023-449a-a623-275d04bd7695	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	95	90	194	2020-04-24 19:37:53.91475	\N	\N
6cc3de29-c17b-487a-a86e-3bbdb87bb364	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd608-833b-11ea-bc55-0242ac130003	88	84	194	2020-04-24 19:37:54.15727	\N	\N
2cdb6b82-d916-4d1b-8b8c-314f54d5ce04	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd608-833b-11ea-bc55-0242ac130003	91	87	194	2020-04-24 19:37:54.402511	\N	\N
8ee9489b-83b6-4022-be3d-2db2480b3bb2	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	38	36	194	2020-04-21 01:16:21.672657	\N	\N
3c4bac95-841e-4fc1-9161-f0ff029f7f90	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	23	21	194	2020-04-21 01:16:21.926388	\N	\N
629f4978-6a1e-4d70-9832-c7dde4ed3835	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd270-833b-11ea-bc55-0242ac130003	57	53	194	2020-04-21 01:16:22.177979	\N	\N
c46da123-28d0-47a1-9be5-f8332ab8fc0e	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd270-833b-11ea-bc55-0242ac130003	43	39	194	2020-04-21 01:16:22.424892	\N	\N
29788df5-9114-4a38-9bdc-b30c61def547	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	85	89	194	2020-04-21 01:16:22.735128	\N	\N
e890497d-f4ac-4b02-845c-ffedb4b74a0b	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	93	97	194	2020-04-21 01:16:23.189382	\N	\N
af5e9338-462e-4a72-ad06-345751eaca14	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd608-833b-11ea-bc55-0242ac130003	79	81	194	2020-04-21 01:16:23.435137	\N	\N
ce7e3a4c-9c70-4a3d-b2b2-1f801ee5ee02	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd608-833b-11ea-bc55-0242ac130003	84	86	194	2020-04-21 01:16:23.678137	\N	\N
9376e61c-bfd9-4ec7-b26f-8c77411f262f	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	48	43	215	2020-04-21 17:06:55.77816	\N	\N
a74f806c-b647-4c9a-95bc-08beae92d487	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	38	33	215	2020-04-21 17:06:56.027398	\N	\N
a67d2dff-d7de-446d-bfad-29c21d33011e	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd270-833b-11ea-bc55-0242ac130003	64	69	194	2020-04-21 17:06:56.274878	\N	\N
68d31d27-08f6-424e-922f-c2bf87fa0857	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd270-833b-11ea-bc55-0242ac130003	51	56	194	2020-04-21 17:06:56.522404	\N	\N
59ab153b-99a5-4688-ba0c-bfd46565d9ea	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	88	86	207	2020-04-21 17:06:56.769158	\N	\N
e1f97fb2-de1c-46ab-ac47-3452143b2f6b	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	94	92	207	2020-04-21 17:06:57.029161	\N	\N
2b10b09b-19c3-41d7-9da9-84d1040d5d8f	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd608-833b-11ea-bc55-0242ac130003	81	85	207	2020-04-21 17:06:57.285669	\N	\N
af37687f-191e-44ef-818b-a9d2b8be66b9	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd608-833b-11ea-bc55-0242ac130003	88	92	207	2020-04-21 17:06:57.534159	\N	\N
9eefee84-9cd6-4264-a1df-d4957b80c678	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	55	56	215	2020-04-22 18:15:12.104304	\N	\N
8196fc44-2f6b-49aa-9073-a3ad8a4ad26e	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	51	52	215	2020-04-22 18:15:12.366045	\N	\N
7917d246-454a-44a1-af8f-ac95672242e4	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd270-833b-11ea-bc55-0242ac130003	71	73	194	2020-04-22 18:15:12.635521	\N	\N
6e69616a-0242-4fc1-b5ca-26a7594aad44	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd270-833b-11ea-bc55-0242ac130003	65	67	194	2020-04-22 18:15:13.58854	\N	\N
d5b865c4-ed61-4373-b828-131b029d73b6	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	88	85	215	2020-04-22 18:15:13.862142	\N	\N
4ceaa01a-2b79-4171-8c70-04832b6670e2	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	94	91	215	2020-04-22 18:15:14.762543	\N	\N
1fb1cc2e-7958-4824-bc59-55121dba5e1b	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd608-833b-11ea-bc55-0242ac130003	84	85	194	2020-04-22 18:15:15.016343	\N	\N
400d83d1-207a-4548-98ca-6f1e2d0eb6e7	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd608-833b-11ea-bc55-0242ac130003	88	89	194	2020-04-22 18:15:15.281565	\N	\N
7ac4d7b7-b0fc-495a-ac8a-c7ae61f1a9ba	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	61	63	215	2020-04-23 22:30:32.433299	\N	\N
d32a173d-6e30-4b0b-8cd7-4da163a704b1	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	62	64	215	2020-04-23 22:30:32.680188	\N	\N
20ebf9c1-9ecb-4b2c-b471-a04c0e3ff8e3	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd270-833b-11ea-bc55-0242ac130003	75	75	194	2020-04-23 22:30:32.944471	\N	\N
bef577c0-c388-4d43-adca-dd178eedfe51	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd270-833b-11ea-bc55-0242ac130003	71	71	194	2020-04-23 22:30:33.198243	\N	\N
0866a493-7902-443f-97b2-96d4a46e5fc0	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	89	84	194	2020-04-23 22:30:33.444939	\N	\N
f4abbe35-86ae-4c6f-8fae-8faecc182ff4	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	95	90	194	2020-04-23 22:30:33.688543	\N	\N
914b4595-8142-4e64-a1c8-d3b3b67db44a	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd608-833b-11ea-bc55-0242ac130003	88	90	215	2020-04-23 22:30:33.962041	\N	\N
b668cc8b-88f3-483f-a22f-90a0be66af05	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd608-833b-11ea-bc55-0242ac130003	91	93	215	2020-04-23 22:30:34.204197	\N	\N
3dfc2ce1-3914-4bc0-aff7-127af93200b0	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	61	61	215	2020-04-24 19:37:52.699852	\N	\N
326b7f33-1a9d-47a8-bba6-2d2a8d78b258	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	62	62	215	2020-04-24 19:37:52.942994	\N	\N
8169a99e-92e0-4b30-a9c8-6ca1767fd673	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd270-833b-11ea-bc55-0242ac130003	75	71	215	2020-04-24 19:37:53.187093	\N	\N
a48965be-335d-483b-a3c5-1661f5e7d853	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd270-833b-11ea-bc55-0242ac130003	71	67	215	2020-04-24 19:37:53.431115	\N	\N
18574c9f-163b-4d35-8bde-f6c3c1a96b6a	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	89	84	194	2020-04-24 19:37:53.673509	\N	\N
68008bbd-9023-449a-a623-275d04bd7695	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	95	90	194	2020-04-24 19:37:53.91475	\N	\N
6cc3de29-c17b-487a-a86e-3bbdb87bb364	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd608-833b-11ea-bc55-0242ac130003	88	84	194	2020-04-24 19:37:54.15727	\N	\N
2cdb6b82-d916-4d1b-8b8c-314f54d5ce04	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd608-833b-11ea-bc55-0242ac130003	91	87	194	2020-04-24 19:37:54.402511	\N	\N
8ee9489b-83b6-4022-be3d-2db2480b3bb2	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	38	36	194	2020-04-21 01:16:21.672657	\N	\N
3c4bac95-841e-4fc1-9161-f0ff029f7f90	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	23	21	194	2020-04-21 01:16:21.926388	\N	\N
629f4978-6a1e-4d70-9832-c7dde4ed3835	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd270-833b-11ea-bc55-0242ac130003	57	53	194	2020-04-21 01:16:22.177979	\N	\N
c46da123-28d0-47a1-9be5-f8332ab8fc0e	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd270-833b-11ea-bc55-0242ac130003	43	39	194	2020-04-21 01:16:22.424892	\N	\N
29788df5-9114-4a38-9bdc-b30c61def547	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	85	89	194	2020-04-21 01:16:22.735128	\N	\N
e890497d-f4ac-4b02-845c-ffedb4b74a0b	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	93	97	194	2020-04-21 01:16:23.189382	\N	\N
af5e9338-462e-4a72-ad06-345751eaca14	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd608-833b-11ea-bc55-0242ac130003	79	81	194	2020-04-21 01:16:23.435137	\N	\N
ce7e3a4c-9c70-4a3d-b2b2-1f801ee5ee02	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd608-833b-11ea-bc55-0242ac130003	84	86	194	2020-04-21 01:16:23.678137	\N	\N
9376e61c-bfd9-4ec7-b26f-8c77411f262f	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	48	43	215	2020-04-21 17:06:55.77816	\N	\N
a74f806c-b647-4c9a-95bc-08beae92d487	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	38	33	215	2020-04-21 17:06:56.027398	\N	\N
a67d2dff-d7de-446d-bfad-29c21d33011e	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd270-833b-11ea-bc55-0242ac130003	64	69	194	2020-04-21 17:06:56.274878	\N	\N
68d31d27-08f6-424e-922f-c2bf87fa0857	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd270-833b-11ea-bc55-0242ac130003	51	56	194	2020-04-21 17:06:56.522404	\N	\N
59ab153b-99a5-4688-ba0c-bfd46565d9ea	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	88	86	207	2020-04-21 17:06:56.769158	\N	\N
e1f97fb2-de1c-46ab-ac47-3452143b2f6b	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	94	92	207	2020-04-21 17:06:57.029161	\N	\N
2b10b09b-19c3-41d7-9da9-84d1040d5d8f	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd608-833b-11ea-bc55-0242ac130003	81	85	207	2020-04-21 17:06:57.285669	\N	\N
af37687f-191e-44ef-818b-a9d2b8be66b9	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd608-833b-11ea-bc55-0242ac130003	88	92	207	2020-04-21 17:06:57.534159	\N	\N
9eefee84-9cd6-4264-a1df-d4957b80c678	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	55	56	215	2020-04-22 18:15:12.104304	\N	\N
8196fc44-2f6b-49aa-9073-a3ad8a4ad26e	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	51	52	215	2020-04-22 18:15:12.366045	\N	\N
7917d246-454a-44a1-af8f-ac95672242e4	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd270-833b-11ea-bc55-0242ac130003	71	73	194	2020-04-22 18:15:12.635521	\N	\N
6e69616a-0242-4fc1-b5ca-26a7594aad44	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd270-833b-11ea-bc55-0242ac130003	65	67	194	2020-04-22 18:15:13.58854	\N	\N
d5b865c4-ed61-4373-b828-131b029d73b6	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	88	85	215	2020-04-22 18:15:13.862142	\N	\N
4ceaa01a-2b79-4171-8c70-04832b6670e2	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	94	91	215	2020-04-22 18:15:14.762543	\N	\N
1fb1cc2e-7958-4824-bc59-55121dba5e1b	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd608-833b-11ea-bc55-0242ac130003	84	85	194	2020-04-22 18:15:15.016343	\N	\N
400d83d1-207a-4548-98ca-6f1e2d0eb6e7	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd608-833b-11ea-bc55-0242ac130003	88	89	194	2020-04-22 18:15:15.281565	\N	\N
7ac4d7b7-b0fc-495a-ac8a-c7ae61f1a9ba	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	61	63	215	2020-04-23 22:30:32.433299	\N	\N
d32a173d-6e30-4b0b-8cd7-4da163a704b1	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	62	64	215	2020-04-23 22:30:32.680188	\N	\N
20ebf9c1-9ecb-4b2c-b471-a04c0e3ff8e3	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd270-833b-11ea-bc55-0242ac130003	75	75	194	2020-04-23 22:30:32.944471	\N	\N
bef577c0-c388-4d43-adca-dd178eedfe51	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd270-833b-11ea-bc55-0242ac130003	71	71	194	2020-04-23 22:30:33.198243	\N	\N
0866a493-7902-443f-97b2-96d4a46e5fc0	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	89	84	194	2020-04-23 22:30:33.444939	\N	\N
f4abbe35-86ae-4c6f-8fae-8faecc182ff4	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	95	90	194	2020-04-23 22:30:33.688543	\N	\N
914b4595-8142-4e64-a1c8-d3b3b67db44a	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd608-833b-11ea-bc55-0242ac130003	88	90	215	2020-04-23 22:30:33.962041	\N	\N
b668cc8b-88f3-483f-a22f-90a0be66af05	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd608-833b-11ea-bc55-0242ac130003	91	93	215	2020-04-23 22:30:34.204197	\N	\N
3dfc2ce1-3914-4bc0-aff7-127af93200b0	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	61	61	215	2020-04-24 19:37:52.699852	\N	\N
326b7f33-1a9d-47a8-bba6-2d2a8d78b258	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9ccfdc-833b-11ea-bc55-0242ac130003	62	62	215	2020-04-24 19:37:52.942994	\N	\N
8169a99e-92e0-4b30-a9c8-6ca1767fd673	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd270-833b-11ea-bc55-0242ac130003	75	71	215	2020-04-24 19:37:53.187093	\N	\N
a48965be-335d-483b-a3c5-1661f5e7d853	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd270-833b-11ea-bc55-0242ac130003	71	67	215	2020-04-24 19:37:53.431115	\N	\N
18574c9f-163b-4d35-8bde-f6c3c1a96b6a	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	89	84	194	2020-04-24 19:37:53.673509	\N	\N
68008bbd-9023-449a-a623-275d04bd7695	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd50e-833b-11ea-bc55-0242ac130003	95	90	194	2020-04-24 19:37:53.91475	\N	\N
6cc3de29-c17b-487a-a86e-3bbdb87bb364	d478236c-a361-4ba5-8a70-01a1288c1bb4	BeatBox Easy	0c9cd608-833b-11ea-bc55-0242ac130003	88	84	194	2020-04-24 19:37:54.15727	\N	\N
2cdb6b82-d916-4d1b-8b8c-314f54d5ce04	e9d2684a-f30c-4002-82fc-a40fde00d8f3	TwistFit Easy	0c9cd608-833b-11ea-bc55-0242ac130003	91	87	194	2020-04-24 19:37:54.402511	\N	\N
\.


--
-- TOC entry 3925 (class 0 OID 25300)
-- Dependencies: 201
-- Data for Name: gyros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gyros (id, gyro_id, description, patient_id, x, y, z, created_at, updated_at, deleted_at) FROM stdin;
47ccdca0-20b2-4135-ab0c-2a14be6da413	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.07	0.21	0.02	2020-04-21 00:17:30.433071	\N	\N
83a5e921-dc7a-4fce-b7b0-1cd2eaf72172	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.14	0.14	-0.02	2020-04-21 00:17:30.852557	\N	\N
bd18a3b8-445d-416e-a012-e504c81975d9	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.09	0.07	0.1	2020-04-21 00:17:31.330955	\N	\N
59f61e36-75dd-4217-ab35-90fccf56bf56	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.11	0.11	-0.04	2020-04-21 00:17:32.435093	\N	\N
5037acf9-bd83-400e-afdf-834436422a06	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.07	0.03	0.02	2020-04-21 00:17:33.552197	\N	\N
49d0f7e9-0652-4a9c-bf91-6cd1e480d259	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.04	0.1	0.1	2020-04-21 00:17:34.737228	\N	\N
5b5ac522-5d2a-44f8-9d8f-9f60b8582960	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.15	0.18	0.05	2020-04-21 00:17:35.777277	\N	\N
4de8d2e3-fd2d-4990-834f-ac5b51ed980b	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.08	0.13	0.14	2020-04-21 00:17:36.887005	\N	\N
3eac63c8-7eb8-4d30-b1e1-ba3440493695	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.11	0.08	0.02	2020-04-21 00:17:37.997616	\N	\N
ff82dbb6-a518-431e-a561-978dda085fef	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	0.03	0.04	0.03	2020-04-21 00:17:39.117855	\N	\N
12e92073-45cc-40ed-8bfb-b312e090140f	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.12	0.14	-0.05	2020-04-21 00:17:40.216836	\N	\N
4964cdc9-be7d-47b5-be45-1dc20de2ed63	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.02	0.1	-0.05	2020-04-21 00:17:41.317209	\N	\N
f94e4d15-4b6b-40a0-ab6c-c5f193507a51	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.18	0.09	0.11	2020-04-21 00:17:42.419633	\N	\N
17b7a046-7f24-4b09-84c4-1226532408bf	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.01	0.11	-0.05	2020-04-21 00:17:43.525706	\N	\N
6cd850af-4d8d-42cc-96bc-274d9780d09c	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.14	0.0	0.14	2020-04-21 00:17:44.635337	\N	\N
2bec5065-a634-4a1c-9ec5-0d7e8d4e2430	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.01	0.06	0.1	2020-04-21 00:17:45.744388	\N	\N
48db9230-c86e-45c7-8f23-453dfa27cf91	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.06	0.02	0.05	2020-04-21 00:17:46.853174	\N	\N
9a8503d4-244f-48e8-a03f-f457edbda0ed	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.08	0.04	0.11	2020-04-21 00:17:47.977308	\N	\N
baf051f2-d190-46fa-a2c4-357a012aee19	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.12	0.1	0.04	2020-04-21 00:17:49.072867	\N	\N
ffdfb36a-6964-4b20-bc7e-0eb9e2cbe548	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.02	0.1	-0.02	2020-04-21 00:17:50.179724	\N	\N
1ec5c63e-fe7b-4d71-bef8-2edf1b4b0f31	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.04	0.08	0.11	2020-04-21 00:17:51.290796	\N	\N
b8edafbf-67ec-4995-9a6f-4eae54da72fd	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.12	0.11	-0.02	2020-04-21 00:17:52.401012	\N	\N
fdb75293-fb8d-4571-b500-7a5ad6ee41b3	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.02	0.11	0.02	2020-04-21 00:17:53.520269	\N	\N
a0081308-1ee5-4193-89bd-7c7b2ef70cbe	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.05	0.08	-0.02	2020-04-21 00:17:54.631607	\N	\N
3d397e95-6343-4aa2-a7f1-1ffaaab02809	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.22	0.07	0.05	2020-04-21 00:17:55.748978	\N	\N
9bc9cd8a-0e1a-4b1d-adde-89ce77f2c8c0	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.03	0.1	0.02	2020-04-21 00:17:56.857827	\N	\N
e42f8853-b54f-4679-a708-3fecf654aaa1	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.11	0.09	0.01	2020-04-21 00:17:57.967454	\N	\N
c178f78e-171a-4131-8859-d665fc3b902f	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	0.05	0.04	0.05	2020-04-21 00:17:59.080204	\N	\N
7addd9d7-f47d-476e-9f77-ca472f714aec	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.02	0.05	0.05	2020-04-21 00:18:00.261119	\N	\N
5a001af0-2338-4dc2-b1ea-d7cfd51716e2	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.05	0.12	0.18	2020-04-21 00:18:01.271117	\N	\N
b72661d6-9319-4028-805d-a54629d12eed	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.06	0.27	-0.12	2020-04-21 00:18:02.379181	\N	\N
131f311c-c7e2-45f3-a0f7-c471ffabfb12	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.01	0.12	0.02	2020-04-21 00:18:03.489361	\N	\N
6120e703-304b-4b6d-bf45-e0c0dda0d3de	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.13	0.18	0.12	2020-04-21 00:18:04.596987	\N	\N
2986a191-70ca-40ba-8317-2f5fdc338ce8	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.18	0.03	0.05	2020-04-21 00:18:05.714616	\N	\N
8d680b25-e332-43da-80d2-675baa965112	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.06	-0.01	-0.05	2020-04-21 00:18:06.830034	\N	\N
334db29e-b615-4380-aabe-5fd3656fef18	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.13	0.16	0.0	2020-04-21 00:18:07.941332	\N	\N
e2f05ecc-8674-4e39-bc89-8747b68b7b3e	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.11	0.02	0.07	2020-04-21 00:18:09.03569	\N	\N
cbff1db1-3305-4433-9f67-e3b53dbcc0fa	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.06	0.06	0.08	2020-04-21 00:18:10.227926	\N	\N
5c707a77-0590-49a3-bd67-b0ce99fa713d	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.01	0.17	-0.07	2020-04-21 00:18:11.278312	\N	\N
7516a27e-b723-4cc0-8726-743eed828f44	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.11	0.11	-0.03	2020-04-21 00:18:12.386948	\N	\N
8c34c3d9-500f-4930-9131-615e598a838e	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.07	0.14	0.09	2020-04-21 00:18:13.487804	\N	\N
ba6c4a33-07bd-4b2a-bfb4-a65e8acfd101	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	0.0	0.12	0.11	2020-04-21 00:18:14.596531	\N	\N
e787ffa1-9d3a-4764-9c05-8e8a9ca78950	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.13	0.03	0.04	2020-04-21 00:18:15.706829	\N	\N
84a30a84-415c-4a6d-a838-ad45fbc437c0	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.04	0.14	-0.02	2020-04-21 00:18:16.807642	\N	\N
e2cba5ec-76d3-441c-a689-eba858d7d34d	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	0.0	-0.01	0.07	2020-04-21 00:18:17.916815	\N	\N
13ca4f4f-575f-4db3-845d-0118ed9c0910	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.09	0.1	0.04	2020-04-21 00:18:19.03697	\N	\N
b2d7466f-abd6-4491-bcb5-a4a9a08d409d	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.04	0.06	0.04	2020-04-21 00:18:20.150196	\N	\N
ba4f3135-61a2-4adc-a475-4f80014215cf	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	0.03	0.1	0.13	2020-04-21 00:18:21.257406	\N	\N
777d2515-a8d7-4955-8502-9196fbbc55f9	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.04	0.04	0.02	2020-04-21 00:18:22.359295	\N	\N
746c5bf3-b9f1-45a6-8d96-96df00647373	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.11	0.05	0.01	2020-04-21 00:18:23.451829	\N	\N
d1db42a4-b3b1-441e-920d-faf3b771585e	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.06	0.17	-0.08	2020-04-21 00:18:24.561755	\N	\N
08f8a5ae-6bc1-485f-bfac-faf7d0f46671	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.24	0.05	0.0	2020-04-21 00:18:25.67202	\N	\N
730724f7-b7e8-4bf5-8958-dc7d85b1a713	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.13	0.22	0.02	2020-04-21 00:18:26.780634	\N	\N
c9f476a2-48c2-4c96-bd74-7228bb1f3590	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.17	0.11	0.07	2020-04-21 00:18:27.888633	\N	\N
2aa21ff5-9192-4e17-8aaa-5728b7e17135	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	0.02	0.09	0.0	2020-04-21 00:18:28.999118	\N	\N
c630a9e2-5902-4ce3-acdc-98c5ee517a9f	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.05	0.07	-0.01	2020-04-21 00:18:30.105427	\N	\N
bc25946a-9bc2-4a2f-a710-cb87f0e86091	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.11	0.01	0.03	2020-04-21 00:18:31.2162	\N	\N
37e6eb18-dea7-471c-acc8-5f9488e6034f	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.17	0.17	0.03	2020-04-21 00:18:32.32382	\N	\N
8888e7e1-362a-4c77-a1ba-ec2ac482b7ff	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.18	-0.03	0.07	2020-04-21 00:18:33.438436	\N	\N
2296fe2f-8a7d-4dca-a791-d65ed8ef8179	e66c5d87-e9d3-4d0c-9a26-cb5716d3dcd2	patient gyroscope data	fb4711c3-b412-49b4-9045-ed9a10d66862	-0.06	0.09	0.11	2020-04-21 00:18:34.541212	\N	\N
e1fcaae7-612d-49a3-849a-ddc6e82860fa	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.14	6.36	-0.42	2020-04-21 00:41:12.297805	\N	\N
cafb6a15-53dd-4352-a508-b405e3ccae02	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.87	8.85	0.07	2020-04-21 00:41:12.714258	\N	\N
a20887ff-f43b-433e-9b2b-ca85f28aff4d	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	68.98	-0.37	-11.5	2020-04-21 00:41:13.221799	\N	\N
d595e6a6-2d0f-4f0e-ae9e-b6afb7d2af75	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-86.98	-16.33	25.02	2020-04-21 00:41:15.594646	\N	\N
ab33fd05-be42-49df-88ab-46fbd4538bcb	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-4.36	-7.9	-0.74	2020-04-21 00:41:16.010304	\N	\N
b9561dd1-e096-49ed-980e-0ed3683b8d72	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.2	-2.62	2.35	2020-04-21 00:41:16.533284	\N	\N
31a792bb-4266-4f61-9c1f-26d3e6fcb075	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-7.76	3.56	1.56	2020-04-21 00:41:17.634078	\N	\N
35d694c1-43e4-4794-b22c-5e203b4d560b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-33.99	-9.48	3.45	2020-04-21 00:41:18.743966	\N	\N
19eb7640-cd8a-4bab-8312-86a0fa71d7d2	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	13.13	-2.75	-3.62	2020-04-21 00:41:19.853619	\N	\N
9c6fd95d-0c25-4240-bc16-9d94e9fa175e	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.86	4.52	0.89	2020-04-21 00:41:20.963295	\N	\N
141b76ad-cc6f-4e88-974c-49607a3bcb08	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.43	-18.47	1.5	2020-04-21 00:41:22.074767	\N	\N
2a3097bd-7ce0-4e40-9634-74fd10aa2f74	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.1	0.24	2020-04-21 00:41:23.442224	\N	\N
8b9c155b-12dd-435b-8dbe-f28a82016e3f	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	-0.03	-0.03	2020-04-21 00:41:24.317327	\N	\N
68f96c29-87ef-44d5-8160-6283f238f289	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.01	0.02	0.02	2020-04-21 00:41:25.415069	\N	\N
d89f609f-895f-4a53-8868-2a714dbae434	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.05	-0.02	2020-04-21 00:41:26.515804	\N	\N
a889cae0-c8db-44d8-b55a-dd8ae93c10eb	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.05	0.1	2020-04-21 00:41:27.623982	\N	\N
5a1bd9a1-8230-4cb3-8ea6-2974508857e6	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.12	-0.01	0.11	2020-04-21 00:41:28.734123	\N	\N
7866b80f-e5ee-4902-8687-7550045edddc	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.01	0.08	0.06	2020-04-21 00:41:29.836993	\N	\N
4ef68962-d9c6-436c-8876-77765ebbf9cf	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.05	0.06	2020-04-21 00:41:30.944002	\N	\N
b636e47b-1534-4bf0-8f9a-d85c9153a17b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.1	0.01	0.0	2020-04-21 00:41:32.054151	\N	\N
6b804f49-973d-4fe2-b520-97ff73fe8183	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.06	-0.05	2020-04-21 00:41:33.165143	\N	\N
a1a176b4-20c6-49ef-bb9d-906b98ab778f	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	0.07	0.06	2020-04-21 00:41:34.273873	\N	\N
f81e7960-662b-4417-b9a3-b81ad4a8828a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	0.14	0.06	2020-04-21 00:41:35.38418	\N	\N
2a957ec6-0b71-4c06-ad22-61100bdad6f3	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.14	0.11	2020-04-21 00:41:36.494079	\N	\N
4515504b-317f-404e-88bb-0b577afc5179	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.09	0.08	0.11	2020-04-21 00:41:37.603839	\N	\N
9854282c-c3f9-409d-93a0-b52369ddc8a4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.05	-0.04	0.05	2020-04-21 00:41:38.715346	\N	\N
dc0c0c20-9901-42b7-9797-d4d588d05e4f	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.04	0.05	2020-04-21 00:41:39.825013	\N	\N
5e3b9d26-cf4c-43cb-a134-0002e740f986	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.04	0.02	0.05	2020-04-21 00:41:41.098719	\N	\N
2fb3a895-814b-4a76-b2b5-c7fb7cd624f4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.07	0.1	2020-04-21 00:41:42.033789	\N	\N
8209ce2f-455d-4559-9a64-064934c13106	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.03	-0.02	0.05	2020-04-21 00:41:42.93636	\N	\N
f463a5c9-b394-4337-bce4-f32aa5a73238	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.0	0.11	0.11	2020-04-21 00:41:44.257534	\N	\N
8e035d21-599e-442a-9c71-775f9ce0fa02	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	-0.01	0.11	2020-04-21 00:41:45.375288	\N	\N
8156221d-3363-4b25-8da0-48556ecb2a11	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.01	0.02	-0.01	2020-04-21 00:41:46.474134	\N	\N
068f53fb-e67c-4179-8608-fdef64c79963	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	0.07	0.05	2020-04-21 00:41:47.58801	\N	\N
f76d5ce9-eaf8-4f83-9116-5baa3caf86de	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.05	0.02	2020-04-21 00:41:48.705796	\N	\N
d8445bdb-b14b-415a-8382-bbf2ccb4555b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.08	0.02	2020-04-21 00:41:49.815977	\N	\N
cfef4649-6980-4c02-97eb-f41f8ca79f3b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	-0.08	0.02	2020-04-21 00:41:50.914187	\N	\N
a01fa8b4-19ac-43df-b231-e8acb3c227a7	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	-0.11	0.15	2020-04-21 00:41:52.014456	\N	\N
8d26af43-58d4-4caa-89bc-2b7f3f05b1a2	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.09	0.07	0.01	2020-04-21 00:41:53.123908	\N	\N
bd2b539b-eb38-4944-ab90-6d1130a0d435	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.03	0.02	0.04	2020-04-21 00:41:54.234936	\N	\N
a7191ce0-fb6d-46e9-955c-44f1cab3dfc5	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.08	-0.05	2020-04-21 00:41:55.345369	\N	\N
94f5082d-8792-4c34-a8f2-7f9837475a75	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.07	0.1	0.12	2020-04-21 00:41:56.459382	\N	\N
02e7ea67-424a-4c34-8cf9-84cc9cceb42a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.07	0.1	0.06	2020-04-21 00:41:57.565357	\N	\N
e8709163-4db5-4aef-a812-21fc16a43d56	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	0.05	0.02	2020-04-21 00:41:58.686044	\N	\N
3a8751f4-2640-4dae-bc01-72fccbd983a3	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	0.1	0.0	2020-04-21 00:41:59.767811	\N	\N
f62d1d39-9813-40d1-9d69-da40ef83382d	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.12	0.01	2020-04-21 00:42:00.878247	\N	\N
5a7f5463-a232-4881-9e4c-cf76b635b285	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.05	0.06	2020-04-21 00:42:01.98778	\N	\N
dc55bf2b-8455-4ba0-9c57-2cce3187190f	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.02	0.1	2020-04-21 00:42:03.111565	\N	\N
d38daef7-cd1c-43e8-b279-807013ff14d0	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	0.14	0.06	2020-04-21 00:42:04.210451	\N	\N
bddaa350-1428-4374-af3e-10a09c6c895c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.06	0.11	2020-04-21 00:42:05.383776	\N	\N
22c06a2e-8227-4915-af69-63b924180eea	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.07	0.1	0.05	2020-04-21 00:42:06.474092	\N	\N
0dd80eec-574b-41a6-8f16-c15b445ec75f	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.05	0.04	0.01	2020-04-21 00:42:07.545316	\N	\N
59c4859e-0520-4871-958f-c604a53bf2d4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	-0.02	0.05	2020-04-21 00:42:08.654494	\N	\N
cbd5961c-abcc-4e52-83a9-a539f0717750	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.0	-0.01	2020-04-21 00:42:09.765788	\N	\N
db2b2981-0231-4868-ae25-0f69de78fd62	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	0.03	0.02	2020-04-21 00:42:11.985987	\N	\N
2af4aa1f-42c6-4243-95d7-2ab58e5cec84	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.05	0.04	2020-04-21 00:42:12.401727	\N	\N
1dfc571b-5de3-43ea-8bba-662019ebac2a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.0	0.1	-0.02	2020-04-21 00:42:13.565052	\N	\N
c99d0c78-2452-408a-87dc-8ff52727b897	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.15	0.05	-0.02	2020-04-21 00:42:14.216049	\N	\N
e8c13ad1-bebd-4657-b84c-6bbbc5a5c45c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.05	-0.02	-0.05	2020-04-21 00:42:15.304527	\N	\N
00874a7e-f1d9-4248-9a3b-05919bb18152	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.0	0.13	0.11	2020-04-21 00:42:16.414396	\N	\N
4a33add8-65d5-4ff6-a90d-79ef52cc784c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.16	0.03	0.15	2020-04-21 00:42:17.524983	\N	\N
ebaa40ff-5a69-44e0-a676-58bee7464228	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.04	0.1	2020-04-21 00:42:18.634031	\N	\N
4d9fd9c7-694b-487d-be2e-cfc899672c62	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.08	0.08	0.02	2020-04-21 00:42:19.7502	\N	\N
24703b78-6af6-48c0-bd1e-115fa68353e3	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.01	-0.04	0.09	2020-04-21 00:42:20.854882	\N	\N
b420c87f-fddc-481f-ad95-e3b9dae685d4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.01	0.13	2020-04-21 00:42:21.964344	\N	\N
21782f37-e35a-45e1-8ccb-572930c93483	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.01	0.1	2020-04-21 00:42:23.074982	\N	\N
51dcc10d-4050-4978-b5f4-2b43713b4efd	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	-0.05	0.1	2020-04-21 00:42:24.184065	\N	\N
15efbe0c-3451-4d23-bca1-a56208f6a021	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.14	0.06	2020-04-21 00:42:25.294166	\N	\N
7afc5816-3154-43a6-8daa-b3f8ff97b0e2	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.1	0.08	0.09	2020-04-21 00:42:26.40366	\N	\N
d9abdad0-500c-4f98-900c-831e14db3050	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.06	0.13	2020-04-21 00:42:27.497945	\N	\N
6a057a20-efc1-46ff-9432-24bc09f5762c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.07	0.11	2020-04-21 00:42:28.683944	\N	\N
558a3e5c-5e6c-465a-8459-c6bc36db7e79	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.0	0.16	0.04	2020-04-21 00:42:29.723889	\N	\N
9365d58a-8a8c-4fa6-8384-dc9ca6c6e6a8	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.01	0.03	0.09	2020-04-21 00:42:30.837987	\N	\N
5c31814c-c395-47e7-9ab4-b5a83feabc2f	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.07	-0.1	2020-04-21 00:42:31.946465	\N	\N
dc9e80a2-0c8e-4751-bf0e-32bb1461cb50	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.04	-0.05	2020-04-21 00:42:33.054153	\N	\N
6e04beeb-7f5a-490d-82e4-dc497f935b88	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.13	0.02	2020-04-21 00:42:34.165174	\N	\N
bc625386-23f0-4854-a17f-ccada425263d	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.06	0.09	2020-04-21 00:42:35.273929	\N	\N
a8fb91f3-d340-49f4-b281-bd1b17d08d67	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.15	0.05	0.1	2020-04-21 00:42:36.383974	\N	\N
0e2b5063-f7be-4c11-af4c-287439b81c0e	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.09	-0.01	0.13	2020-04-21 00:42:37.495476	\N	\N
068a6f60-e060-4079-9e1b-91f91a0b2ce4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.08	0.02	2020-04-21 00:42:38.5951	\N	\N
d803fb31-3d71-4250-b324-0665b42fdd83	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.08	0.05	2020-04-21 00:42:39.72274	\N	\N
3596b10b-4a2f-4508-adba-eb3ab8c694e7	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.02	-0.02	2020-04-21 00:42:40.816658	\N	\N
db07f892-37d7-4063-94a7-98648cd01a35	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	0.1	-0.01	2020-04-21 00:42:41.923184	\N	\N
3610e435-09c8-4215-8fad-0ab45a0e31b4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.03	0.09	-0.02	2020-04-21 00:42:43.036314	\N	\N
1a86f5a8-c311-48bd-8ee6-05a4b53e636d	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.0	0.01	0.02	2020-04-21 00:42:44.144605	\N	\N
13e08b2e-9932-410c-8de0-09b28087b4d5	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.13	0.07	0.11	2020-04-21 00:42:45.257484	\N	\N
4f8d036b-fd11-46ea-be49-4fed036baded	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.09	-0.05	0.07	2020-04-21 00:42:46.362961	\N	\N
c3124c4a-796c-40c5-b454-3aff64567741	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	0.08	0.04	2020-04-21 00:42:47.474419	\N	\N
c1e9cc37-9265-44d2-8309-a1e085bac69c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.09	0.04	2020-04-21 00:42:48.598038	\N	\N
f5f99261-7b5e-49e4-a8f0-a23035818d96	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.16	-0.02	2020-04-21 00:42:49.725009	\N	\N
f8b19455-a55d-4d1b-9cc9-2e21a715ba27	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	-0.03	0.05	2020-04-21 00:42:50.803505	\N	\N
61406aa4-e341-4577-80d0-17e6299caeab	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.1	0.12	-0.04	2020-04-21 00:42:51.913696	\N	\N
c6898f1e-3a80-4973-a793-a4fc32874f33	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.02	0.03	2020-04-21 00:42:53.024003	\N	\N
a83d64cf-bacb-41aa-8f7d-b25eb1335cb2	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.07	-0.03	0.09	2020-04-21 00:42:54.127274	\N	\N
ee051950-d23e-4c31-99d9-d4c297c1a3e5	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	-0.02	0.1	2020-04-21 00:42:55.227259	\N	\N
f830df75-ad8f-44bb-9987-926dcf860697	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.01	0.01	-0.08	2020-04-21 00:42:56.330008	\N	\N
ddb18701-d46a-4564-aea0-38ea1a0148a0	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	-0.08	0.11	2020-04-21 00:42:57.439309	\N	\N
0a587a77-2f06-42e9-97e4-618dab444394	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.13	0.23	0.04	2020-04-21 00:42:58.548248	\N	\N
098b2801-0a88-44b3-a130-a6d40b4c47a4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.12	0.02	0.11	2020-04-21 00:42:59.449801	\N	\N
93e6d27a-162a-40c6-bdfe-78ff2cd88d43	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.01	0.05	0.02	2020-04-21 00:43:00.81462	\N	\N
2a2d8924-dfbf-47bc-8ab6-81d527a64f80	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.03	0.07	2020-04-21 00:43:01.891476	\N	\N
ce032cfa-a09b-4bda-86f5-f0746028f045	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.07	0.11	2020-04-21 00:43:02.99999	\N	\N
8b27cd6b-f2b8-49f4-96ef-cefee4072a26	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.05	0.05	2020-04-21 00:43:04.11161	\N	\N
90f777ab-b0f9-48f4-a774-1226689c4e70	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.02	0.12	2020-04-21 00:43:05.202702	\N	\N
67f3b55b-26d3-40ba-8347-94c657684f2b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.09	0.1	0.03	2020-04-21 00:43:06.328073	\N	\N
61d66caa-884b-4c2c-b9cc-8f017e6c0a6b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.09	0.11	2020-04-21 00:43:07.420147	\N	\N
d80b0f2e-e7ca-4526-b132-819cd57cf521	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.01	0.05	0.1	2020-04-21 00:43:08.5467	\N	\N
640c97f1-a769-4e2b-8b72-3292edd68ee6	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.04	0.02	2020-04-21 00:43:09.729223	\N	\N
31874061-a3ec-4356-8d62-e4d6483425f8	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.14	0.11	0.09	2020-04-21 00:43:10.765673	\N	\N
96fdc811-081f-4fdf-b24e-a7f1b0c4bf53	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	-0.01	0.03	2020-04-21 00:43:11.876214	\N	\N
93c38880-c98a-4fe9-bd5b-90e7ec046777	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	0.1	-0.03	2020-04-21 00:43:13.080273	\N	\N
d94158ea-5e78-44e3-9330-0ad767362b63	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.0	0.1	0.05	2020-04-21 00:43:14.085648	\N	\N
c6cd7ba0-f7ad-467c-a4da-d5afbeea4a08	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	-0.06	-0.05	2020-04-21 00:43:15.194048	\N	\N
d6bf1789-ec7a-4eb8-ae07-b33a39874879	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.07	0.1	0.05	2020-04-21 00:43:17.554939	\N	\N
0ea74b70-f69e-473d-8ad9-7aec42823c0a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.02	-0.02	2020-04-21 00:43:17.971153	\N	\N
b2257f61-2d8f-48ba-8acd-4c6832c01865	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.01	0.11	2020-04-21 00:43:18.524915	\N	\N
6e665b83-52f7-4fa9-9fb9-6fbe0d75da9e	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.06	-0.02	2020-04-21 00:43:19.673889	\N	\N
d3f250e7-d5ab-4ee2-8b36-9f820762be35	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.03	0.06	2020-04-21 00:43:20.762206	\N	\N
2384899e-42d9-4301-a6c3-637ca9b438ab	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.1	-0.05	0.06	2020-04-21 00:43:21.854766	\N	\N
4f1863a5-d859-4482-9cfd-1865ef479ced	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.05	0.05	2020-04-21 00:43:22.964463	\N	\N
77ee5de8-98b7-4bac-bf82-f8798b42870e	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.11	0.04	2020-04-21 00:43:24.075899	\N	\N
f0087c93-f24e-4107-ae0f-a729a31ad79d	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.02	0.05	2020-04-21 00:43:25.170413	\N	\N
3aeeae04-5f47-4514-afaf-60bf47996520	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.02	-0.06	2020-04-21 00:43:26.278743	\N	\N
c45da9cb-ae3a-4296-89c4-a34637d154e7	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.11	0.03	2020-04-21 00:43:27.464969	\N	\N
98bdfad1-5760-4abb-8df0-8b96ce5fe39b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.16	0.1	2020-04-21 00:43:28.503818	\N	\N
5963d70e-3657-4d58-8fb3-ef46041c1d4f	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.05	0.05	0.04	2020-04-21 00:43:29.40962	\N	\N
683e6176-4f7d-491d-ad59-a3f48debebd6	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.02	0.02	2020-04-21 00:43:30.726128	\N	\N
f72d387c-4404-4f2e-ab73-4c3393e44cfd	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.01	0.13	0.11	2020-04-21 00:43:31.835522	\N	\N
9f27e1e2-5ff3-4492-ba61-519714b2cecb	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.14	-0.03	0.25	2020-04-21 00:43:32.94596	\N	\N
5052c4cc-a866-48c3-a8f1-f1a36ee62dea	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	-0.05	0.15	2020-04-21 00:43:34.057856	\N	\N
4609b0f2-35f2-4c62-9aac-40b62282ffb8	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.1	0.1	2020-04-21 00:43:35.151841	\N	\N
f7b1550f-819e-4e9b-a03c-6b1f35a7ec20	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.1	0.1	2020-04-21 00:43:36.343922	\N	\N
abe2662e-3c6c-4dc4-ad39-1c943ac4f4e4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.07	0.01	0.08	2020-04-21 00:43:37.384709	\N	\N
9363f41d-ea82-4528-aa0c-33ab5154c6ed	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.01	-0.05	0.05	2020-04-21 00:43:38.48368	\N	\N
875daaec-0c96-4912-83a4-6d2a0e093b67	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	-0.09	0.07	2020-04-21 00:43:39.60074	\N	\N
05419408-dca0-489c-9ea4-67b592fcab99	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.0	0.05	0.02	2020-04-21 00:43:40.706537	\N	\N
eb81b339-3d7b-4cdc-b92e-22ca483d1688	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.09	0.05	0.02	2020-04-21 00:43:41.814362	\N	\N
db08b69a-856c-491a-b692-9c72edd59a36	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.13	0.12	-0.08	2020-04-21 00:43:43.071913	\N	\N
9cba82ec-a278-4d71-8410-262f315a477f	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	-0.02	0.05	2020-04-21 00:43:45.451859	\N	\N
5a2c2d11-9610-44b8-9050-24a98e83936c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	0.05	0.08	2020-04-21 00:43:45.8674	\N	\N
9d57cb00-5e4c-44d8-863e-e231e5d0a5f6	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.17	0.05	-0.04	2020-04-21 00:43:46.28321	\N	\N
5923ade6-7103-48de-b7b4-4b5697b98e9e	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.04	0.14	0.05	2020-04-21 00:43:47.346454	\N	\N
44abbea0-7555-4d33-a6a1-734fb016ff4b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.07	0.08	0.07	2020-04-21 00:43:48.460463	\N	\N
cd56e43a-e226-4829-805e-8fffde2c04d0	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.01	0.08	0.02	2020-04-21 00:43:49.564186	\N	\N
f944b6c6-a852-47dd-9737-a76205e7c635	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.01	0.05	2020-04-21 00:43:50.674432	\N	\N
1a0efdca-af15-4c8c-b993-8ab2b73704c7	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.06	0.04	-0.08	2020-04-21 00:43:51.781842	\N	\N
98c0c23e-57f4-4d27-b4f8-b69eceb52b45	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.06	-0.07	2020-04-21 00:43:52.893273	\N	\N
f7f67280-bd2d-4353-8f6f-ab7ae7062de5	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.08	0.02	0.08	2020-04-21 00:43:54.001807	\N	\N
8f3188f9-9c1a-4c90-b5bb-7b6fb431280a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.0	0.05	0.08	2020-04-21 00:43:55.111305	\N	\N
5c5d5bf2-bd5d-4d8f-b368-138e6f80046c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.07	0.1	0.08	2020-04-21 00:43:56.218169	\N	\N
f5cc56f9-a938-4e17-bdd3-153e4d908cf3	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.05	0.08	0.03	2020-04-21 00:43:57.329063	\N	\N
1560b753-5c47-4dd6-8358-0044251d3b17	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.03	0.05	2020-04-21 00:43:58.437798	\N	\N
6762c994-958d-4486-b359-7f7263b5f8d8	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.0	0.04	0.08	2020-04-21 00:43:59.546425	\N	\N
3cf59581-e392-4668-aaba-f9e6f187ca28	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	-0.08	0.09	2020-04-21 00:44:00.655603	\N	\N
93df6238-cb9d-41a4-9b0f-1f5bd1b26325	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.0	0.08	2020-04-21 00:44:01.78683	\N	\N
4d962253-28ec-414f-a99c-e8a1454b1645	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.0	0.1	-0.02	2020-04-21 00:44:02.886386	\N	\N
e3b030a4-9080-4e86-9a85-b94c8337afa3	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.11	0.01	2020-04-21 00:44:03.993915	\N	\N
ce1052cb-2a00-4bec-bda0-85e03844c240	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.05	0.04	2020-04-21 00:44:05.103955	\N	\N
bb614dc8-4c92-4aa3-bf39-e6cf7bec1599	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	0.17	0.03	2020-04-21 00:44:06.215689	\N	\N
08dc8c72-dddf-40cc-81f4-3dd9a1a30e2a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.02	0.03	2020-04-21 00:44:07.324868	\N	\N
465651e7-73c5-48ee-b6d9-5d49eb9723a0	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.18	-0.04	0.12	2020-04-21 00:44:08.434078	\N	\N
f91e04db-ab8c-430e-aa9e-7004846b00f1	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.11	0.07	2020-04-21 00:44:09.546409	\N	\N
c70f9e8d-bf58-4988-9779-9fec1d43330b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.14	-0.02	2020-04-21 00:44:10.655734	\N	\N
bec3d06c-957e-4bff-9332-946ee51e72ec	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.15	-0.03	2020-04-21 00:44:11.770703	\N	\N
de352ce1-038c-4080-8e94-b63c3847d47d	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.03	0.07	2020-04-21 00:44:12.865091	\N	\N
7d6ff4b6-b498-4f1e-8144-fa3ba1bed1ef	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.0	0.1	0.05	2020-04-21 00:44:13.975632	\N	\N
908b468f-3a1d-401f-b94b-33f0ab99dc4a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.0	0.14	2020-04-21 00:44:15.123952	\N	\N
b496046d-dca9-4c6e-814d-add44e653287	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.02	0.03	2020-04-21 00:44:16.19474	\N	\N
95a17be6-be6b-406f-8d2f-807a537a67d6	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.06	-0.03	2020-04-21 00:44:17.304828	\N	\N
bb401918-ba0f-4832-a2a8-72fcb6d3e67e	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.01	-0.02	2020-04-21 00:44:18.416191	\N	\N
33e57095-d452-43bd-aba9-6319e8f995fb	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.14	0.16	2020-04-21 00:44:19.527338	\N	\N
780968f7-4e67-4dba-afa5-d24070b64ba6	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.12	-0.03	0.02	2020-04-21 00:44:20.635584	\N	\N
432f3d1b-c57b-4b1c-b3e5-9e1b89f3352c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.18	0.14	2020-04-21 00:44:21.744261	\N	\N
47e8ee4c-701c-4a89-87e4-5a4ada649696	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.15	0.05	2020-04-21 00:44:23.019663	\N	\N
8b1ffa59-4fd3-4737-b48d-f63757726506	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.07	0.13	0.05	2020-04-21 00:44:23.963417	\N	\N
6c83855a-59bd-4d3b-a7b7-b4ecbfc913e1	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	-0.02	0.09	2020-04-21 00:44:25.064583	\N	\N
bcf76361-e9e5-49f3-9a9a-bcacd7076a8c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	-0.01	0.02	2020-04-21 00:44:26.174253	\N	\N
7461fe8a-6118-4aa0-8dbf-e2bacffa49d3	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.04	0.08	2020-04-21 00:44:27.302306	\N	\N
3b5c053a-fc8a-4f14-aa8a-167701c6977e	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.01	0.0	0.02	2020-04-21 00:44:30.082569	\N	\N
04c1df24-4f43-4491-b4d6-aee4c5ef3c34	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.05	0.02	2020-04-21 00:44:30.498109	\N	\N
961d076e-5404-4c99-8b6c-669ea6179118	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	-0.01	0.08	2020-04-21 00:44:30.913886	\N	\N
9ed7dbda-596d-4e07-8cf3-2d52b8d0ab03	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.04	-0.02	2020-04-21 00:44:31.707887	\N	\N
6bf07a97-3f11-4bca-8ecb-aaa9677af93c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.08	-0.05	2020-04-21 00:44:32.84017	\N	\N
acca4630-85f3-452a-8a51-724dc8ac78ef	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.06	0.08	2020-04-21 00:44:33.92591	\N	\N
294401ba-e265-415a-b4b7-36f7319d6c26	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.01	0.03	0.1	2020-04-21 00:44:35.126383	\N	\N
c12085d7-f162-4d65-a6b5-e07fa0b7dc02	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.13	0.05	2020-04-21 00:44:36.155011	\N	\N
a20ec9eb-786c-485a-b960-0cd1cb8a75f8	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.15	2.85	2020-04-21 00:44:37.277891	\N	\N
465b54e6-f6c7-411d-ae44-196a98d85277	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.1	0.1	2020-04-21 00:44:38.373503	\N	\N
e4df32ce-a0fa-436a-9eea-5eb5a79f0ffe	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.11	0.09	2020-04-21 00:44:39.483362	\N	\N
262795d0-1faa-4614-95d2-bc3ef4f121b0	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.03	0.08	-0.02	2020-04-21 00:44:40.594935	\N	\N
31b041a1-689b-4be5-b403-82ec992e2f00	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	-0.05	0.09	2020-04-21 00:44:41.705735	\N	\N
a4890766-9cf0-4830-b0b9-037b28e8768b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.11	0.15	2020-04-21 00:44:42.81898	\N	\N
bc1a22fd-6c3b-4d3a-bfdf-e457ce92c2cd	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.12	0.08	2020-04-21 00:44:43.92437	\N	\N
5a450a04-d7c3-4070-a081-34b67a0b8622	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.01	0.08	2020-04-21 00:44:45.034573	\N	\N
7a91ea27-9f34-449c-a5cc-03e6c7d9ad1c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.02	0.03	2020-04-21 00:44:46.144984	\N	\N
1de093a3-a38d-474a-8e81-93c86760d1a8	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.05	0.13	0.12	2020-04-21 00:44:47.244423	\N	\N
0c57de84-860a-4944-93b9-fa0e91b821b6	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.01	-0.08	0.17	2020-04-21 00:44:48.354813	\N	\N
43007699-a6cb-461e-bd99-4314fc7d6a23	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	9.7	48.2	-33.54	2020-04-21 00:44:49.464997	\N	\N
81f21994-c710-4569-8ab4-12e9bed08a3a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	15.13	-115.19	13.3	2020-04-21 00:44:50.573908	\N	\N
6c42b702-2758-4707-992c-b820904fdd85	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.3	0.54	-2.61	2020-04-21 00:44:51.694215	\N	\N
c02eb54b-7039-4e88-9ca9-dfc32342b13f	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	10.88	26.74	-20.29	2020-04-21 00:44:52.804358	\N	\N
e1552105-a22a-4032-864c-7a5f5b8c7a4d	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	18.69	-55.69	-2.46	2020-04-21 00:44:53.915237	\N	\N
c81cc95c-5723-4a29-83de-54c52df1e1b7	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-5.09	2.62	-4.13	2020-04-21 00:44:55.023663	\N	\N
cdd1bd25-5fc9-43c5-9c53-f9dab7cacfe8	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	8.51	-2.85	-0.88	2020-04-21 00:44:56.293218	\N	\N
67c952d6-5297-48f1-95e9-0a0b0f35ded7	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.89	2.05	0.13	2020-04-21 00:44:57.28473	\N	\N
39e72329-828a-43f5-a09c-ec2f87cc9201	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.95	-2.37	6.09	2020-04-21 00:44:58.354488	\N	\N
963040dc-3615-4fb0-ad2f-822f6d8f4353	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-9.16	0.87	-19.14	2020-04-21 00:44:59.464833	\N	\N
43db3989-bd82-4524-817f-62664cc91ad4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	19.9	39.27	27.36	2020-04-21 00:45:00.573668	\N	\N
d6cd2155-176c-43b4-8270-0efbc674c5c7	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	-7.51	-2.1	2020-04-21 00:45:01.687538	\N	\N
54f3464d-8bdc-4d26-9a32-c3c44a35952c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	42.81	-56.84	67.25	2020-04-21 00:45:02.827996	\N	\N
9e4d4b1c-1d02-4d62-a318-959d59f42f4c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-45.17	97.05	4.32	2020-04-21 00:45:04.532991	\N	\N
61254508-7474-4de7-a53c-5a223e8ad485	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.17	0.01	5.08	2020-04-21 00:45:04.994587	\N	\N
d393406d-1af9-4f39-ba85-b933193882d6	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.22	0.34	-0.69	2020-04-21 00:45:06.103849	\N	\N
b48b4ff8-e90a-410c-b2dd-188367f39eb4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.33	0.14	2.56	2020-04-21 00:45:07.213626	\N	\N
69ffdc81-bb8f-4b2c-a2a4-51ab1bff4502	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.1	0.11	-0.01	2020-04-21 00:45:08.323821	\N	\N
fc81318b-b522-4440-a9a6-62b59ec24486	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.56	2.51	19.14	2020-04-21 00:45:09.277671	\N	\N
30541c52-c54a-4ad5-ad57-ccc784ac5654	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.01	0.07	-0.19	2020-04-21 00:45:10.544402	\N	\N
b219ad42-88b7-4cdd-8841-ac0376847638	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.09	0.09	-0.04	2020-04-21 00:45:11.656502	\N	\N
523e7e00-e7b6-4928-9031-d24c30afc996	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.07	0.12	0.02	2020-04-21 00:45:12.790597	\N	\N
c97d019c-a845-4fe8-b7ba-54e3d2e348a2	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	0.01	0.09	2020-04-21 00:45:13.880312	\N	\N
3b6f18da-a835-4bac-9796-651ab4e472f5	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.11	0.11	2020-04-21 00:45:14.974896	\N	\N
ef146f1a-315b-498d-b4ac-9cbd7a4fc33a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	-0.07	0.05	2020-04-21 00:45:16.083538	\N	\N
875a77d4-66ef-46bc-a9cf-50b257971e9e	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.06	0.02	2020-04-21 00:45:17.194314	\N	\N
384b29bf-e66f-4f8c-b139-22096a36d3c8	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.05	0.12	2020-04-21 00:45:18.304565	\N	\N
5f7b195a-7d1a-4e6e-9360-88eaaffcb7b4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.12	0.0	2020-04-21 00:45:19.413821	\N	\N
168680a5-ff84-4f12-bfaa-7cb3fb4623ee	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.08	-0.06	2020-04-21 00:45:20.524374	\N	\N
08c124cd-8de6-4dd6-a9ac-3607e928ff40	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.08	0.12	0.05	2020-04-21 00:45:21.634492	\N	\N
49304bcf-8abc-48ce-aaf3-955ee453f0dc	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	-0.01	0.01	2020-04-21 00:45:22.744228	\N	\N
32c66d04-2087-4dac-a016-e76ed1c89806	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.14	0.07	0.11	2020-04-21 00:45:23.853994	\N	\N
2ce9c28c-babc-498b-9bff-99f626f4bd21	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	-2.1	-26.08	2020-04-21 00:45:24.964589	\N	\N
baf7eb58-d283-498e-b7f1-e1e7dc274376	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-12.96	1.81	-7.84	2020-04-21 00:45:26.064117	\N	\N
ab44a30f-4531-4eea-bd84-00b2ea744855	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.07	0.02	0.01	2020-04-21 00:45:27.174571	\N	\N
c820bc91-c3ab-4aa9-a2df-68eaac818311	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	-0.05	0.06	2020-04-21 00:45:28.410852	\N	\N
0bdc6314-2d7f-471f-87ca-2ae3b72c2a50	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.03	0.06	-0.02	2020-04-21 00:45:29.395299	\N	\N
073019c7-d6ed-4faa-b234-b5f7eea20b9b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.05	0.08	2020-04-21 00:45:30.504146	\N	\N
2d7f7d24-a89a-4ada-99d5-3fdb0cee827c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.1	0.05	2020-04-21 00:45:31.614329	\N	\N
c6ea830d-d103-4486-9bdd-b2cb3da2b19f	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.1	0.07	-0.01	2020-04-21 00:45:32.724277	\N	\N
19cf8c4c-522e-478f-b3fc-0602baea9e60	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.11	0.02	2020-04-21 00:45:33.834573	\N	\N
b40fb084-95ee-46d9-a4be-b460997de240	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.16	-0.07	2020-04-21 00:45:34.944124	\N	\N
a9ed1e24-1264-4723-9984-57ef845e4d04	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.09	0.02	2020-04-21 00:45:36.271548	\N	\N
1c508f7a-68f5-48fb-93fe-925a93792a86	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.31	-0.34	2020-04-21 00:45:37.163802	\N	\N
24bc9670-7256-45b8-9b06-e81da1e6980f	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	8.13	15.72	-26.84	2020-04-21 00:45:38.287059	\N	\N
eb616d27-97d7-4858-b840-97be25bb1289	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.2	8.34	-8.03	2020-04-21 00:45:39.373752	\N	\N
45480520-5d79-48da-866b-85857a227e41	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-75.71	-25.95	-13.75	2020-04-21 00:45:40.483905	\N	\N
f6f9eaea-5c43-45be-b6f9-b12fe3e739d4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.49	-5.53	-6.32	2020-04-21 00:45:41.388281	\N	\N
c1bf774f-c5e0-47e5-b5b5-b063231bd1c4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.1	0.07	2.72	2020-04-21 00:45:44.15442	\N	\N
06fadd58-cf05-44f0-9892-35f26b4db7f5	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.27	11.52	-3.11	2020-04-21 00:45:44.570226	\N	\N
09df5cee-f113-4997-b635-0c0259831b8d	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-7.42	-30.43	4.97	2020-04-21 00:45:44.985886	\N	\N
90e6820d-aedf-4ac0-9be2-96592ef42e76	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-3.07	2.1	-1.5	2020-04-21 00:45:46.055242	\N	\N
9a3b8fab-276b-427d-b8d3-593bead6ec0a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.27	-2.72	2.52	2020-04-21 00:45:47.163738	\N	\N
a77561e7-af5f-4bb1-9609-a958b8c582e3	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-20.34	-11.47	-27.03	2020-04-21 00:45:48.289591	\N	\N
f1511afc-12ab-4ba4-a43e-3f2fac7dc3a6	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	-0.03	0.16	2020-04-21 00:45:49.424334	\N	\N
0a34d572-29c7-46bf-8137-1b8f0f5896b1	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.05	0.11	0.22	2020-04-21 00:45:50.494478	\N	\N
63bf6fdf-b3a2-4962-a12f-5c652095cd44	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.07	0.18	2020-04-21 00:45:51.593677	\N	\N
220b61b3-cbed-4a35-91c5-ea7ce862d461	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.01	-0.04	2020-04-21 00:45:52.678776	\N	\N
d201e81d-fd7e-4c5b-bdd4-733e85661053	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.07	0.02	2020-04-21 00:45:53.798085	\N	\N
44451b15-e36a-42b6-a439-775c179b909e	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	0.02	0.06	2020-04-21 00:45:55.014099	\N	\N
56c0e378-f6ef-45ab-b314-f357909c3428	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.02	0.05	2020-04-21 00:45:56.01382	\N	\N
e390db73-7834-40eb-88df-708c257ec82c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.07	-0.04	-0.05	2020-04-21 00:45:57.124112	\N	\N
3915051c-cca5-47ed-8bce-197dbae84151	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.09	0.01	0.06	2020-04-21 00:45:58.233868	\N	\N
8011a463-b2f8-4b3d-91ad-50015f01542e	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.08	0.08	2020-04-21 00:45:59.334865	\N	\N
98c075d4-0b3e-47f0-a6e9-5eb1457cfef5	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	-0.06	0.11	2020-04-21 00:46:00.504585	\N	\N
7f755827-d20a-42d4-a967-3fa2746e6959	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.19	-0.02	0.12	2020-04-21 00:46:01.952186	\N	\N
f16c8bc5-af83-4ae8-a96e-01ea4503b4c4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.06	0.05	2020-04-21 00:46:02.665774	\N	\N
5a63a9e8-7b5a-44fa-87a0-23c7fd48a1c9	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.01	0.17	0.04	2020-04-21 00:46:03.794996	\N	\N
7f026abe-46ff-4c01-95ea-a381274611f4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.01	0.58	-7.08	2020-04-21 00:46:04.883088	\N	\N
7f373cd4-c1c7-44d2-b8ab-8d3b8056bc65	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.16	0.03	0.08	2020-04-21 00:46:05.981583	\N	\N
4b8e1857-f98d-42ea-b55f-4fcee7f693c2	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.05	0.08	2020-04-21 00:46:07.10208	\N	\N
eda3296c-e3c2-4688-ac60-276545331131	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.12	0.14	0.09	2020-04-21 00:46:08.204551	\N	\N
97bca1da-7f6e-4339-83aa-9f26af1595bf	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	0.12	0.13	2020-04-21 00:46:09.314459	\N	\N
791ffdbd-efd4-484b-bd62-bcd31d3d8755	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.1	-0.02	0.15	2020-04-21 00:46:10.423872	\N	\N
fc8ad75f-ab91-491b-92d9-1c093b2a4d59	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.04	0.11	2020-04-21 00:46:11.534547	\N	\N
a340443a-e3e5-4e77-b280-37dde52e2113	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	-0.03	0.11	2020-04-21 00:46:12.645588	\N	\N
38906044-6fd6-4a2a-a216-3ce66112df09	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.06	0.09	2020-04-21 00:46:13.753974	\N	\N
4a9c3a56-8996-4fec-a336-a778b4701e0a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	-0.05	0.0	2020-04-21 00:46:14.865498	\N	\N
6e2fd14c-1d7a-42db-a9fd-86da081fcf08	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.07	0.1	2020-04-21 00:46:15.974208	\N	\N
aeb9b19d-a185-4eb2-a0dd-78d648e6b76e	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.0	0.08	0.04	2020-04-21 00:46:17.074064	\N	\N
f341af8d-0ac7-4ae7-98e4-21b51d1c94c5	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.15	0.05	2020-04-21 00:46:18.183915	\N	\N
5de074c9-bd91-4d37-800f-c6ca37d7a7a8	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	-0.04	0.09	2020-04-21 00:46:19.301824	\N	\N
b86cf650-bf91-4d2f-a523-cfd0a36fb65b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.09	0.0	0.19	2020-04-21 00:46:20.455531	\N	\N
0b5245c6-0be9-4056-947b-e7cd8abb8317	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.09	0.07	2020-04-21 00:46:21.596858	\N	\N
51630bce-20bb-405d-a450-8b17fcdc3dd7	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.04	0.07	0.14	2020-04-21 00:46:22.624932	\N	\N
2b72decc-6589-4187-84b2-ef86bf5cc22b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.05	0.1	2020-04-21 00:46:23.882583	\N	\N
cdcb35ae-caab-4509-8d6a-42901c587e37	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	0.06	0.11	2020-04-21 00:46:24.844094	\N	\N
44e15c38-d8c2-4c37-8921-8b2d49b1c806	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.02	0.08	2020-04-21 00:46:25.955772	\N	\N
32d760a8-e533-4142-88a2-30c798bcfb48	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	0.14	0.05	2020-04-21 00:46:27.067286	\N	\N
8d900204-c50c-4c29-b549-6bc9616a50c9	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.01	-0.05	0.24	2020-04-21 00:46:28.163833	\N	\N
98ee414e-9de5-4cc7-9a1b-9035a9532d2b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.06	0.08	0.08	2020-04-21 00:46:29.274292	\N	\N
01573da8-af0f-490d-aeda-a88f723bb658	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.13	0.05	-0.08	2020-04-21 00:46:30.383795	\N	\N
b76797b0-7d87-4e93-9bc3-0cf72c7e9ce1	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.01	0.18	0.08	2020-04-21 00:46:31.494696	\N	\N
066c28c9-21b2-40ff-842e-43fb1c1f7b9e	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	0.14	0.11	2020-04-21 00:46:32.604813	\N	\N
7ed19750-cd59-4c63-a512-f8044a07a773	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	-0.06	0.1	2020-04-21 00:46:33.715973	\N	\N
2fcea9b3-39e0-4980-95e7-a426cf5eed68	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.13	0.05	0.11	2020-04-21 00:46:34.825951	\N	\N
38f3cb79-1eff-4283-8168-0ad8270d1052	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.05	0.05	2020-04-21 00:46:35.934487	\N	\N
bd9b283e-8f53-4657-bc13-f48cd8d6ece9	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.03	0.08	-0.07	2020-04-21 00:46:37.044118	\N	\N
565f510e-649a-4169-89e1-af3e2779e911	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.03	-0.03	2020-04-21 00:46:38.154683	\N	\N
810289a5-8442-4479-8b41-aabf618ee0e2	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.09	-0.02	2020-04-21 00:46:39.271168	\N	\N
aaed6b71-ad65-4fc8-99ba-a071c45816a4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.01	0.05	0.08	2020-04-21 00:46:40.363806	\N	\N
8a6ef1ca-27bf-44fe-b562-3f40332f3a9f	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.1	0.07	0.05	2020-04-21 00:46:41.475474	\N	\N
edbdf93a-5eff-4b6f-a4fe-eeed2875da5b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.0	0.16	2020-04-21 00:46:42.58373	\N	\N
c72cda83-832d-4a28-8f0a-60c0d7f3fe8a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	-0.02	0.06	2020-04-21 00:46:43.694001	\N	\N
52fc2330-dc42-48b1-8a0f-cd52e106f7f2	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	-0.02	0.08	2020-04-21 00:46:44.817207	\N	\N
057a8740-dae8-40d7-ba21-bacbb8c1dde5	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.13	0.04	2020-04-21 00:46:45.915236	\N	\N
ccd42fa3-55c4-4f8d-8eb1-42c15632519f	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	13.71	45.1	-42.06	2020-04-21 00:46:47.025782	\N	\N
c9b253d0-6c58-406a-9cba-aebcf832ac65	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-139.6	-159.81	11.97	2020-04-21 00:46:48.133954	\N	\N
90d65006-819d-448a-acd1-bf861b46e92d	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-6.58	-92.04	-89.34	2020-04-21 00:46:49.244582	\N	\N
3d62f27c-363a-4bcb-b424-560d38e79147	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	8.88	5.39	2.88	2020-04-21 00:46:50.613914	\N	\N
249b7401-7cb1-4f2f-8ca8-dead12052c9e	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.55	-12.6	-6.43	2020-04-21 00:46:51.463641	\N	\N
819b2f41-1f04-4bdd-9e50-552d2f8f1099	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.72	-3.14	-0.7	2020-04-21 00:46:52.575529	\N	\N
77df32ef-3a0d-4761-8e7f-f7593318adf4	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-24.38	-4.04	-10.75	2020-04-21 00:46:53.683601	\N	\N
6a87613c-36ce-4bc9-8d05-65e41e065b2d	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	31.1	10.2	17.71	2020-04-21 00:46:54.784329	\N	\N
67e1903b-cca9-4a3b-9224-726bd378e745	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.72	2.49	-1.49	2020-04-21 00:46:55.997031	\N	\N
a3707f05-46b8-4c7e-82af-07178ca5aeb0	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	4.14	11.2	9.56	2020-04-21 00:46:57.054059	\N	\N
122be683-68b2-48cb-9bad-a811a62876f2	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	-0.05	0.05	2020-04-21 00:46:58.117046	\N	\N
188931b3-016c-45f5-be0c-4f1c8f7058be	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.09	-0.06	0.12	2020-04-21 00:46:59.019408	\N	\N
a65a51df-ae60-4da9-a639-60757355509c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.01	-0.03	0.11	2020-04-21 00:47:00.335615	\N	\N
80fc11ba-8b36-4683-9407-621ff604b503	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.1	0.08	2020-04-21 00:47:01.443626	\N	\N
11773dc1-ce54-4f35-a99b-9cb97c0d3249	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.08	0.05	2020-04-21 00:47:02.55567	\N	\N
54256431-c42b-47dc-9f98-a84e25cd48fc	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.01	0.14	2020-04-21 00:47:03.664981	\N	\N
42f49b13-1c0e-453e-ab62-a89a97bf0f2d	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.07	0.14	2020-04-21 00:47:04.759717	\N	\N
f89a5aa2-90c2-4d0c-a33b-68ddfe29b902	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.03	-0.01	2020-04-21 00:47:07.075688	\N	\N
ad7dce6f-5dbe-467b-8f52-c8d65c7aca8a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.09	0.12	2020-04-21 00:47:07.491238	\N	\N
ef9dc76b-ba9f-4ea3-828e-4b7a1da47f32	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.08	0.03	2020-04-21 00:47:08.094254	\N	\N
9e6daf00-b171-41d1-a1ad-3e08fd1415d2	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.08	0.04	0.13	2020-04-21 00:47:09.203695	\N	\N
219f41e5-7eb8-40f2-ac20-8fc70704b357	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.22	0.08	0.14	2020-04-21 00:47:10.331442	\N	\N
4440bd78-e319-4901-b56b-521d29278e2c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.13	-0.02	0.16	2020-04-21 00:47:11.425355	\N	\N
c69f2a67-b2e3-45e3-ba27-f42eca3b4229	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.05	0.03	0.12	2020-04-21 00:47:12.535502	\N	\N
9e4267c6-fcf1-405c-ad91-f13f88117777	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.05	0.02	2020-04-21 00:47:13.694488	\N	\N
e74ff14e-9ff6-47ac-a2d8-36c1e50d5046	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.0	0.02	0.08	2020-04-21 00:47:14.755291	\N	\N
158b0031-04d7-4d4c-931e-fbb5fbc2ec1a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.13	0.06	0.11	2020-04-21 00:47:15.865073	\N	\N
3ec6e69c-3d52-4e70-a865-75107ab2182c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	0.07	0.16	2020-04-21 00:47:16.974301	\N	\N
dce0eaa5-cbde-4177-803c-4e1bbbe28878	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.14	0.14	0.11	2020-04-21 00:47:18.073809	\N	\N
a7052758-7022-4d01-9568-d822533d2949	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.11	0.05	2020-04-21 00:47:19.177937	\N	\N
7d25b863-4cb9-4f06-8027-b11022db2c4b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.02	0.15	2020-04-21 00:47:20.407603	\N	\N
9990c9bf-17d2-4cfc-b763-5d127ab0bd0d	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.13	0.01	0.15	2020-04-21 00:47:21.503597	\N	\N
2939c9a1-f1c8-4d4f-9665-fdab2de1dd35	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.01	0.02	0.09	2020-04-21 00:47:22.514046	\N	\N
518b5fd3-e08c-4cdd-8355-2914ef861ac9	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	0.08	0.05	2020-04-21 00:47:23.624972	\N	\N
495fb25f-2284-4564-bede-0abaa2438d65	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.0	0.04	0.09	2020-04-21 00:47:24.734526	\N	\N
723500ce-55fd-439c-982c-97066a7c81e1	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	99.11	134.24	-23.46	2020-04-21 00:47:25.843948	\N	\N
d4b97483-247c-4135-aa6f-ec6ec8dbe0f9	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-6.0	7.93	-22.66	2020-04-21 00:47:26.954476	\N	\N
d87f57d0-430e-431e-b0a1-5f6e64bdafc1	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-7.14	7.01	-14.56	2020-04-21 00:47:28.064777	\N	\N
48343f75-90a4-4ea5-9459-7b415ee45820	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-9.16	5.73	-5.55	2020-04-21 00:47:30.278571	\N	\N
c26cc187-5e64-42bf-9502-b2e722e6a9aa	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-22.58	-8.58	-1.91	2020-04-21 00:47:30.69536	\N	\N
eab86eef-a537-4d64-bce4-38cc1fe6c058	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.05	-3.01	-0.08	2020-04-21 00:47:31.385094	\N	\N
94e11a23-4934-44b7-aef0-1d0fe0ee60d0	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-3.33	3.94	0.62	2020-04-21 00:47:32.494024	\N	\N
94da961e-372b-45db-b68e-551eeaa09902	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-19.71	-23.19	14.06	2020-04-21 00:47:33.603559	\N	\N
3d114f16-57dc-4be4-8989-508a1b7407f2	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.04	-0.02	2020-04-21 00:47:34.714449	\N	\N
cf9a881d-b757-4b7b-93b7-5f0b19f9247a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.08	-0.02	0.1	2020-04-21 00:47:35.834743	\N	\N
ae5f533d-7ce7-4cf6-9b51-d9ecb3fde090	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.09	-0.1	0.07	2020-04-21 00:47:36.935478	\N	\N
fd44d981-e20b-422d-961b-a3abc5c98095	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.09	-0.04	0.08	2020-04-21 00:47:38.044112	\N	\N
18b64461-7792-4ff0-bf3b-841d75cb9c30	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.14	-0.08	-0.02	2020-04-21 00:47:39.835497	\N	\N
b86cb3f9-50dc-47ec-88b7-cfa19c1ce8e8	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.09	0.04	2020-04-21 00:47:40.270379	\N	\N
f25a6653-9e32-459c-aaff-c8d564e19774	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.01	0.1	2020-04-21 00:47:41.378449	\N	\N
09e74530-d427-4e3f-bdb4-264695559e94	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.05	0.09	0.02	2020-04-21 00:47:42.476367	\N	\N
bef1d4fd-7d21-4b7e-9a9a-942cc3ac718c	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	-0.05	0.11	2020-04-21 00:47:43.585173	\N	\N
c40b5f7e-350a-47f7-8972-6dc9e3c76fb1	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.09	0.11	0.04	2020-04-21 00:47:44.694847	\N	\N
1d14a665-989e-4736-91b3-5c56990204a3	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.07	0.12	0.05	2020-04-21 00:47:45.804236	\N	\N
443b9d72-b959-40a0-b448-6bc4baca40ab	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.04	0.08	2020-04-21 00:47:46.913912	\N	\N
dc93018f-c70e-47c0-9448-85bb5794a825	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.05	0.17	0.06	2020-04-21 00:47:48.024095	\N	\N
5756af7d-bfd6-4da6-b678-825a69d74e69	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.04	0.11	-0.05	2020-04-21 00:47:49.133802	\N	\N
f217e4ee-4bc6-4fa8-ac5c-ef2f6576fe66	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.0	0.02	-0.05	2020-04-21 00:47:50.244433	\N	\N
5536a161-7363-4085-bd9f-3010d4b207b7	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	0.06	0.04	2020-04-21 00:47:51.354442	\N	\N
4fef9348-b939-4d04-84df-2c7759602201	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.09	0.02	0.14	2020-04-21 00:47:52.47409	\N	\N
5be91c7f-58ac-4cf8-b954-b50416479e80	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.07	0.04	0.05	2020-04-21 00:47:53.573864	\N	\N
2bd5f408-defb-45c5-a4ed-8368007d1f24	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	-0.18	0.2	2020-04-21 00:47:54.674028	\N	\N
cd3a1e89-cfd2-4569-881a-41295f8f9b14	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.14	0.02	0.08	2020-04-21 00:47:55.917947	\N	\N
c1e9d926-9b4d-4a0f-981b-a149aaae0a82	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.02	0.18	0.0	2020-04-21 00:47:56.883721	\N	\N
97cbb877-6531-4047-ba72-ae0d8f00a2c5	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.09	0.01	0.09	2020-04-21 00:47:57.991951	\N	\N
5521989e-d6f2-4b6d-99a0-fbac0e86a3d9	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.01	0.03	0.02	2020-04-21 00:47:59.099992	\N	\N
1c9b45ee-08ad-4039-a186-00569ec19cea	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	-0.04	0.08	2020-04-21 00:48:00.226638	\N	\N
af402fd6-9171-4c57-931d-9543bb78f1b1	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	0.04	0.04	2020-04-21 00:48:01.345451	\N	\N
9e929f4b-45e6-4d4e-a901-be35b93e8133	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.06	0.07	0.16	2020-04-21 00:48:02.427853	\N	\N
a62a513f-1cdf-4db9-8436-ba4f056297df	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.28	7.51	-41.04	2020-04-21 00:48:03.553952	\N	\N
6e2a4dcf-3bf4-43f7-b005-609e5ce91f23	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-42.02	36.61	-16.55	2020-04-21 00:48:04.663926	\N	\N
9b2d4c3f-4db9-4815-aaa3-713b2954c847	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.48	26.23	-4.65	2020-04-21 00:48:05.774092	\N	\N
b079da3c-e285-4920-b306-e19e8da3ab98	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.63	2.24	-3.81	2020-04-21 00:48:06.719435	\N	\N
c278f019-6304-448a-9b50-77945a20fcec	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.13	1.67	0.12	2020-04-21 00:48:07.985292	\N	\N
21c2c71d-edbf-433b-ba8f-faa0e2370870	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-3.63	-4.83	-0.11	2020-04-21 00:48:11.234695	\N	\N
0da115c6-a10f-4611-ade1-6229b18e0f17	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-28.96	-85.08	-5.67	2020-04-21 00:48:11.650464	\N	\N
deff7e6a-4f0d-4430-86a9-5014fda13910	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.61	-6.74	3.22	2020-04-21 00:48:12.066255	\N	\N
f9467c35-7b2d-4a55-882f-b972baa4ac6e	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-23.24	9.17	-5.65	2020-04-21 00:48:12.482309	\N	\N
f1c4ad6f-f20e-4e44-aee9-128fa63c86c9	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.7	5.34	-2.76	2020-04-21 00:48:13.534598	\N	\N
90bb5788-852a-4db1-bb28-bc148a17413f	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-4.94	3.51	-0.21	2020-04-21 00:48:14.646157	\N	\N
d4caa3e1-9e77-4bf5-bc43-0f40fd9c743e	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.62	14.11	10.33	2020-04-21 00:48:15.794272	\N	\N
dd1d5383-ffa4-4054-bff2-07282d69388d	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	5.24	1.78	1.43	2020-04-21 00:48:16.864991	\N	\N
762821a2-f73f-4696-adf1-cb3bae0aebec	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.84	-0.24	-0.4	2020-04-21 00:48:17.974313	\N	\N
90473d50-62e3-43ef-adbe-87fad4f169cb	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-7.04	-3.48	1.1	2020-04-21 00:48:18.881012	\N	\N
b8ed71cd-3332-4ecb-9c6e-8eb7cfa33522	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	31.49	17.96	-6.35	2020-04-21 00:48:20.194164	\N	\N
6a8b3fc9-83d5-4896-927b-0624e62efacf	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.97	-24.53	5.01	2020-04-21 00:48:21.349734	\N	\N
526245df-f3db-4e9f-8d4b-8a663ab9ba21	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	94.87	38.6	45.88	2020-04-21 00:48:22.406386	\N	\N
3e9051af-93f9-40ae-9ff3-b2ffe4c2cfe2	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.85	12.06	-2.98	2020-04-21 00:48:23.653924	\N	\N
769bea2a-156b-4e64-8786-9965b2433433	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.2	-70.11	46.86	2020-04-21 00:48:24.664296	\N	\N
69b3b7e6-38a3-4c42-a696-b72a39bde9e8	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.17	0.67	1.16	2020-04-21 00:48:25.815455	\N	\N
0aeab91f-5aea-48bd-ad2d-847087b4a62b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.38	-1.75	-23.37	2020-04-21 00:48:26.893829	\N	\N
66164837-8eb1-4690-a59b-068b5a4faa22	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.09	0.08	1.55	2020-04-21 00:48:28.045195	\N	\N
d548c1d5-e7e6-45bb-a300-7191eebe4041	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.16	-0.1	0.75	2020-04-21 00:48:29.113523	\N	\N
40c7b66d-8cb8-4e7d-8664-1788d5133fdd	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	13.53	1.6	13.69	2020-04-21 00:48:30.223913	\N	\N
ca94847a-00b9-4877-baf8-71eb5a8b1223	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.39	0.36	2.24	2020-04-21 00:48:31.493278	\N	\N
0850a686-e5fa-4c8d-b54c-c092c8ba4e88	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.47	0.03	0.07	2020-04-21 00:48:32.473922	\N	\N
54fe1a56-453f-4752-9755-e517eea36907	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.06	-3.34	0.21	2020-04-21 00:48:33.545095	\N	\N
2d2db7ff-9e8b-44ca-9026-684381f6d213	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.86	-0.12	-0.91	2020-04-21 00:48:34.654669	\N	\N
773827c1-2a44-44c1-8380-d4f5995a93b3	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.04	-0.02	-0.02	2020-04-21 00:48:35.715763	\N	\N
3181467a-cf91-499e-8fd8-dd1834f4b27b	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.13	0.06	0.12	2020-04-21 00:48:36.873878	\N	\N
126a0f72-2f4b-49dd-a36a-0ee005c6028f	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.03	-1.05	4.39	2020-04-21 00:48:37.934606	\N	\N
8fda570f-df3b-4cf2-891f-49b523e9b1af	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.07	0.52	-0.28	2020-04-21 00:48:39.093693	\N	\N
03d8c947-d4f3-4e6d-b6bd-69e939810aa6	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.53	-57.14	15.56	2020-04-21 00:48:40.203952	\N	\N
2b3a694c-d6b8-45ce-9590-11d6c1046f45	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	37.25	13.53	-6.29	2020-04-21 00:48:41.305252	\N	\N
8cdb06e6-ce99-4396-ad4e-6e95caa74830	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	29.12	9.71	-10.25	2020-04-21 00:48:42.424436	\N	\N
63e462bf-dd34-4fdb-aca4-f97ab1fd968a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.65	-4.51	3.44	2020-04-21 00:48:44.045297	\N	\N
46f66759-9741-4467-a1cc-dfd9f34fa1c9	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.08	6.05	0.14	2020-04-21 00:48:44.593919	\N	\N
64eae735-e7c2-40d9-a709-1e1b1b15aaf8	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-18.17	16.28	-0.61	2020-04-21 00:48:45.703719	\N	\N
d2e1c42b-7443-4277-b6b9-8f4074be9d83	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	33.83	-0.55	7.29	2020-04-21 00:48:46.804739	\N	\N
3bc9154b-1c47-45f6-8cc2-1dd5f2ded19f	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-3.44	-0.49	1.14	2020-04-21 00:48:47.914056	\N	\N
4646fa84-45f9-4b62-bc59-7385a9ed4d07	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.24	-2.95	-0.02	2020-04-21 00:48:49.024588	\N	\N
49cb6be6-f0c7-4668-b430-db108875d78d	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-25.63	13.57	0.65	2020-04-21 00:48:50.172609	\N	\N
a08ea957-b46d-4d31-9e17-8cfc54799915	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.11	-0.39	0.11	2020-04-21 00:48:51.245583	\N	\N
3cf078b6-c5df-4830-b771-b5a54c515cb9	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-32.96	23.12	-10.33	2020-04-21 00:48:52.365831	\N	\N
a38b08aa-4456-4c4c-b8a3-ae7c6186b6e7	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.15	5.07	-13.14	2020-04-21 00:48:53.464299	\N	\N
496682f9-de27-4d14-8c1d-ecf36f134340	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.78	-0.18	0.89	2020-04-21 00:48:54.575419	\N	\N
3e9ae781-cc0e-4f57-a7a1-54f43a1fa2b3	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-4.8	-4.26	6.39	2020-04-21 00:48:55.687926	\N	\N
f612cd06-dd67-438c-b9ea-37232c22afd0	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	2.6	0.9	0.69	2020-04-21 00:48:56.794013	\N	\N
189c6045-4acc-4ae8-b16e-f0d1d8a0e3ef	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-18.5	-36.82	-1.85	2020-04-21 00:48:57.904055	\N	\N
8e4d5cc9-33d5-45c9-abb9-a816e2a81fce	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-13.07	35.89	-11.67	2020-04-21 00:48:59.014186	\N	\N
b8efcdd0-1848-45b7-8cfd-b2b3107ac0f5	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-33.6	5.19	-0.79	2020-04-21 00:49:00.119995	\N	\N
cfbc6f9e-ae71-40ce-88eb-863d76c635ce	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.27	-6.24	0.81	2020-04-21 00:49:01.228757	\N	\N
12cf2fff-ff26-463a-b89c-66e14dda1159	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.43	5.11	-0.59	2020-04-21 00:49:02.334531	\N	\N
2dc4a525-8071-4e2a-9c6c-f29d21c9a3a0	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.12	2.15	0.41	2020-04-21 00:49:03.444158	\N	\N
7caa8910-f30c-4881-9f8e-64dfde4e0d91	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.82	2.3	0.11	2020-04-21 00:49:04.555603	\N	\N
73f9dc5b-416b-4e93-a576-0fdd4dc96048	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.08	3.11	2.52	2020-04-21 00:49:05.664521	\N	\N
f508477a-3a59-4fef-9517-117dc817cb52	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	1.35	-1.6	0.05	2020-04-21 00:49:06.774263	\N	\N
f70eeceb-7882-4876-9572-444b1bd18c7a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	3.49	-13.53	1.63	2020-04-21 00:49:07.887452	\N	\N
f3097a49-3f2d-4204-bc5a-95ea1fa0e18a	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.56	-6.8	-0.2	2020-04-21 00:49:08.993734	\N	\N
3476ef5f-c2d4-4b9c-b0b6-63044b74bc13	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.27	3.07	-1.29	2020-04-21 00:49:10.164105	\N	\N
2ebecabb-f72f-4776-accb-988ca1b3f6bc	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-2.75	1.93	1.34	2020-04-21 00:49:11.214437	\N	\N
97e8a8bb-622a-4279-8d49-1a3c58ea2839	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-1.75	-8.31	-15.58	2020-04-21 00:49:12.324	\N	\N
f2c29d01-0e03-440c-998f-680be04422a6	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.03	0.02	0.06	2020-04-21 00:49:13.42404	\N	\N
193ba9d5-b71b-4c59-a5cf-540bfb2c2b50	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	0.02	-0.03	0.12	2020-04-21 00:49:14.536538	\N	\N
21042d6b-d617-478c-8055-5cea0c768472	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.01	0.05	0.07	2020-04-21 00:49:15.645166	\N	\N
b6e4b467-ec11-46c6-a8b9-84fedbc5ebd3	2f073c0c-c564-48c5-97ef-b53bae2516e9	patient gyroscope data	d85f43bb-43b5-44a2-b2a7-01fe9f12880b	-0.13	0.02	0.14	2020-04-21 00:49:16.75486	\N	\N
206f4ad5-32ad-4aee-b0c2-3b25509f1e58	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.16	-0.01	0.37	2020-04-21 00:56:42.831454	\N	\N
33ae43f2-742e-4869-a360-aaa6109f9794	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.18	-0.08	0.34	2020-04-21 00:56:43.25962	\N	\N
41de5ea2-e8db-4664-ac00-f6dc041268ac	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.24	0.02	0.24	2020-04-21 00:56:43.719106	\N	\N
b293fb50-e194-4645-bdf2-d78b45e3104b	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	0.09	0.31	2020-04-21 00:56:44.829112	\N	\N
f1d9f3bc-7008-4eea-9844-b71fd933254b	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-69.83	30.16	-8.59	2020-04-21 00:56:45.940601	\N	\N
55308900-a6d2-4430-b405-ecb9c1794b98	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	24.66	22.11	-6.58	2020-04-21 00:56:47.130841	\N	\N
03f35f50-e04f-48db-9864-603311530b12	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-3.44	-3.01	0.85	2020-04-21 00:56:48.16957	\N	\N
c3024d1f-bc3e-453d-a9e5-b095e4bba17b	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	49.45	7.83	6.11	2020-04-21 00:56:49.27929	\N	\N
da40db8c-af96-47ad-81bd-0be0b59b717f	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	74.19	11.38	1.46	2020-04-21 00:56:50.389876	\N	\N
f232a4c0-899e-4200-8656-43db1f6e7533	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	7.29	34.5	-0.46	2020-04-21 00:56:51.500675	\N	\N
67f84486-c05e-44b3-9c96-0f011ca7339d	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-7.73	5.1	-1.47	2020-04-21 00:56:52.40301	\N	\N
66b57967-411a-41e1-891b-b4f1c02c252d	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-179.31	19.36	-27.34	2020-04-21 00:56:53.709522	\N	\N
f9c41902-7920-4df3-bc8a-ec7eddb8c680	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-3.49	1.43	5.05	2020-04-21 00:56:56.170802	\N	\N
40fa4826-6703-4a42-b868-700ffbf96d88	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-86.73	-10.25	-7.59	2020-04-21 00:56:56.598485	\N	\N
3e422d5b-3749-4737-a8da-c9fedf48f507	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	35.84	-35.9	-0.27	2020-04-21 00:56:57.039338	\N	\N
d6af5ab5-8f3a-436c-8398-22ca8e3852e9	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-72.88	37.01	21.71	2020-04-21 00:56:58.149336	\N	\N
bebcad4d-b41f-4b90-8214-64403627c958	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	94.94	7.1	78.23	2020-04-21 00:56:59.259989	\N	\N
ebecdca9-79e0-4348-a0b4-e3bd6c2a19b4	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-43.51	-36.32	44.09	2020-04-21 00:57:00.38027	\N	\N
31d1c799-b2ee-42ca-90f2-c27a8326f82c	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-103.04	17.45	-6.94	2020-04-21 00:57:01.489812	\N	\N
c881754b-f78b-4d0c-87da-ea1dbc661e7c	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	83.6	31.57	46.66	2020-04-21 00:57:02.61949	\N	\N
fbfbb822-2215-44e4-bce6-a1c2e28cab64	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	9.9	-23.0	-2.1	2020-04-21 00:57:07.16059	\N	\N
7cd11e97-a507-44b9-bcd8-bbe2e72fb1f1	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	1.37	4.85	-0.9	2020-04-21 00:57:07.588567	\N	\N
74816f61-2255-48b5-ad56-1cade370bb17	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	1.1	4.85	-1.57	2020-04-21 00:57:08.016243	\N	\N
0b8de585-5567-4374-9a1b-2f692b9b7161	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	0.04	-2.6	-0.23	2020-04-21 00:57:08.444671	\N	\N
45eac93e-57fa-41a4-b182-c9a266a64ca0	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-1.6	-1.8	1.3	2020-04-21 00:57:08.872416	\N	\N
ca28ab0f-bc9d-4292-8b59-5f63f4bf24f0	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-4.06	-0.21	-0.4	2020-04-21 00:57:09.300246	\N	\N
bb1a02a0-99d9-4ad2-b71a-900c1b4fb849	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.37	0.69	1.59	2020-04-21 00:57:10.337765	\N	\N
9a525652-7739-48b6-b09b-7b968c43d0eb	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-1.34	-4.4	0.52	2020-04-21 00:57:11.447479	\N	\N
114be5df-dca1-45bf-9727-043a1e692d64	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.34	3.2	-0.43	2020-04-21 00:57:12.55933	\N	\N
024286b0-7b4f-4c18-977c-cb01ffe5359f	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	6.29	1.36	-0.52	2020-04-21 00:57:13.665179	\N	\N
e5e67a7d-68b8-4af9-bd70-6ce556171bb0	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	0.63	0.12	1.58	2020-04-21 00:57:14.776256	\N	\N
d374117b-42c5-46f4-81d9-afb2dbc2f979	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-26.55	13.21	11.33	2020-04-21 00:57:17.073824	\N	\N
5590510a-d066-42de-b1fd-03d41284fdd2	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	15.01	-30.69	-3.27	2020-04-21 00:57:17.502173	\N	\N
1bf6b088-0d4f-44ff-a5e4-69e448f04e7e	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	18.26	6.64	1.42	2020-04-21 00:57:18.119941	\N	\N
3c0515cb-8f91-4a7b-b227-af7ab1a703d9	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.18	0.02	0.25	2020-04-21 00:57:19.233124	\N	\N
0587582c-ec04-4700-9cee-54691eacb8b3	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.23	0.04	0.19	2020-04-21 00:57:20.344649	\N	\N
7292d963-2437-4c87-ad4f-db53386c94a6	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.16	0.05	0.28	2020-04-21 00:57:21.453389	\N	\N
5bf2b01f-6aa1-40b5-95eb-4076f4b53e4a	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.18	0.01	0.4	2020-04-21 00:57:22.563935	\N	\N
d227f284-480b-4656-8d00-43a28c938c36	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	0.03	0.32	2020-04-21 00:57:23.645699	\N	\N
46f2cb3a-db34-41d3-a0cd-88a9835583ce	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	0.05	0.3	2020-04-21 00:57:24.775138	\N	\N
591a7116-d03a-4c4a-975e-5603ae1e1eed	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.11	0.09	0.26	2020-04-21 00:57:25.864962	\N	\N
efcf3a46-4be0-43ba-b704-f0cf479b9625	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.18	0.03	0.31	2020-04-21 00:57:26.974449	\N	\N
ae3c7030-a552-427a-acfb-558e9fbd23a5	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.22	0.21	0.27	2020-04-21 00:57:28.087264	\N	\N
3c6a17fb-6f30-44ac-9d1a-e44df2aece5a	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.21	-0.09	0.21	2020-04-21 00:57:29.191154	\N	\N
008c3318-0009-459c-8831-f2f2e0c2e702	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	0.06	0.26	2020-04-21 00:57:30.300444	\N	\N
37caa4bc-ee2d-4c09-aa42-11854a076fb1	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	-0.06	0.31	2020-04-21 00:57:31.468714	\N	\N
41d089e5-d0df-4eaa-bf0a-03ea494daece	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.08	0.15	0.27	2020-04-21 00:57:32.517658	\N	\N
3d231b19-387d-4172-8756-c937736e58ce	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.16	0.05	0.21	2020-04-21 00:57:33.627322	\N	\N
fc3ea127-f2a1-4288-a289-ec06b730796d	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.19	0.02	0.21	2020-04-21 00:57:34.735658	\N	\N
d2d53685-15e9-4ab5-ba3c-19af22a08efd	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.16	0.08	0.26	2020-04-21 00:57:35.846845	\N	\N
3c9e1892-453c-4653-b96c-3fb8dbd5584a	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	0.05	0.31	2020-04-21 00:57:36.95324	\N	\N
ba37b2b2-62fa-4df6-8074-1475e8609b2e	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.26	0.06	0.31	2020-04-21 00:57:38.064056	\N	\N
518d9daa-fdb3-45f0-a281-55bd0dc1d55e	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.16	0.15	0.36	2020-04-21 00:57:39.172323	\N	\N
d9537522-d130-47da-a4fe-4a887c69bc25	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.21	0.05	0.24	2020-04-21 00:57:40.286533	\N	\N
77d92a6a-610f-4265-98db-da790120595f	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.22	-0.04	0.35	2020-04-21 00:57:41.391429	\N	\N
d7ff1e2a-1b25-4374-bcda-255666eee237	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.21	0.08	0.24	2020-04-21 00:57:42.501126	\N	\N
9d305ed2-625c-4df3-b68b-633b7b4be39a	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.12	0.08	0.29	2020-04-21 00:57:43.625532	\N	\N
9a2c5d3c-af0b-48fb-9b74-3a2e71ace164	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.09	-0.03	0.34	2020-04-21 00:57:44.717283	\N	\N
e6573a89-27fa-4d9b-ac4a-bde99c7dabc6	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	0.02	0.25	2020-04-21 00:57:45.827183	\N	\N
84a4c901-4c79-4956-be78-ca77ea18f913	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.06	0.12	0.35	2020-04-21 00:57:46.935099	\N	\N
bc759649-6808-48b4-991e-b1ef7ec1eb41	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.1	-0.03	0.26	2020-04-21 00:57:48.045537	\N	\N
99b1df7d-6ab8-43f3-a591-3a38060c699f	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.08	0.02	0.19	2020-04-21 00:57:49.153805	\N	\N
05b9c0fc-e1b7-4fa2-95e9-db502d444105	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.07	0.06	0.31	2020-04-21 00:57:50.265174	\N	\N
f8d4a486-65d2-4cab-8f60-428b11454c48	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.15	0.08	0.28	2020-04-21 00:57:51.37405	\N	\N
24370b14-6a2e-4243-99bf-0fb39268fd61	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.29	0.02	0.26	2020-04-21 00:57:52.480575	\N	\N
a100cec1-fa75-431b-8730-372883d1858d	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.17	0.0	0.23	2020-04-21 00:57:53.592306	\N	\N
95c6fbf6-042d-4d96-9daf-ccfacf6d8433	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.1	0.08	0.31	2020-04-21 00:57:54.701135	\N	\N
0bc6177b-f196-45aa-bf85-abc25ca8b77c	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.17	0.02	0.22	2020-04-21 00:57:55.894046	\N	\N
175c0990-c719-4a20-bcc8-f09ab1e9eb5c	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.08	0.07	0.19	2020-04-21 00:57:56.98424	\N	\N
761f4ead-53ce-44ac-8830-7131d65e9d27	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.1	0.02	0.21	2020-04-21 00:57:58.045724	\N	\N
110caa22-f709-4faa-8528-03b712059812	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.21	0.02	0.29	2020-04-21 00:57:59.156293	\N	\N
5bf0eced-5cc0-4d5c-8492-a77c04b7408b	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.15	0.14	0.28	2020-04-21 00:58:00.415037	\N	\N
36e8c2cf-43de-4c30-8c52-d774c4ac0337	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.1	0.02	0.4	2020-04-21 00:58:01.364884	\N	\N
e3cff661-50cb-4b5c-8584-9c75fb099f45	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.07	0.19	0.31	2020-04-21 00:58:02.475074	\N	\N
b22c31b3-4ca9-4ed6-aa66-f5e6a2b37945	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.15	0.04	0.26	2020-04-21 00:58:03.586875	\N	\N
9a8eea0b-3419-4ac2-b2b6-f4175073dd87	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.2	0.03	0.32	2020-04-21 00:58:04.693843	\N	\N
4e8e6dcf-91eb-4b94-aab1-ebba198e2c37	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	0.15	0.28	2020-04-21 00:58:05.82591	\N	\N
dd788701-1e3d-4a2a-a28f-cdd6fb274252	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.02	-0.02	0.29	2020-04-21 00:58:06.915244	\N	\N
4d4b0cbf-440f-4524-b668-e08fde9e177b	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.17	-0.02	0.31	2020-04-21 00:58:08.023689	\N	\N
23246d0b-ebd2-4fe5-86ee-a251a472ced1	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.06	-0.02	0.31	2020-04-21 00:58:09.134106	\N	\N
d568ec47-fa51-4566-9dce-a4f8842ccdda	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.16	0.11	0.21	2020-04-21 00:58:10.243612	\N	\N
232d5d36-1ead-4f16-a17e-c34eede766e7	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.05	0.11	0.27	2020-04-21 00:58:11.566194	\N	\N
13666af7-fb3f-4cdb-8d55-23d44724a74b	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.18	0.05	0.43	2020-04-21 00:58:12.463486	\N	\N
b3f17b80-67ea-4421-8711-4500bf0d20ab	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.13	-0.01	0.29	2020-04-21 00:58:13.553928	\N	\N
72937ba3-e2b5-4175-b4c9-fcef482e63ac	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.16	0.06	0.31	2020-04-21 00:58:14.668111	\N	\N
6729c5c5-fead-44a5-8a26-37116dc1865e	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	0.1	0.36	2020-04-21 00:58:15.771945	\N	\N
48095f64-bed6-4033-9460-6bf4f88ef969	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.23	0.31	0.34	2020-04-21 00:58:16.881582	\N	\N
3ff90cb0-050d-44dc-a5d5-eaf9955f0100	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.22	0.03	0.27	2020-04-21 00:58:17.989498	\N	\N
b5d91609-017f-43a5-b906-32e5adcdd5ac	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.15	0.02	0.37	2020-04-21 00:58:19.102726	\N	\N
0f7c41bf-bd21-43b5-af99-c41261999059	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.15	0.06	0.38	2020-04-21 00:58:20.207779	\N	\N
3b6241fe-9040-4489-9085-2e8c61d476d8	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.16	-0.02	0.25	2020-04-21 00:58:21.331717	\N	\N
19b8a1ab-2fa8-419a-9a12-998a6f3a8473	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.13	0.08	0.3	2020-04-21 00:58:22.428059	\N	\N
5d802915-a9b3-4d88-abd6-ddd0f0ae04a5	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	0.02	0.29	2020-04-21 00:58:23.535115	\N	\N
f7d1842a-8553-40c5-afb4-e10aca3ca44a	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.08	0.07	0.21	2020-04-21 00:58:24.658234	\N	\N
93d5235e-4d65-466a-827c-46c44cfb847f	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.13	0.13	0.3	2020-04-21 00:58:25.75362	\N	\N
4e7f430d-dde6-4dd6-932e-cea94cba6176	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.17	0.14	0.37	2020-04-21 00:58:26.864753	\N	\N
e5f065b9-4185-402d-8c79-be1e32cc8a83	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.22	0.11	0.31	2020-04-21 00:58:27.971951	\N	\N
4e56a6b7-e342-41db-a791-e8f5bc2533d8	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.11	0.09	0.22	2020-04-21 00:58:29.083003	\N	\N
331ec93c-bd0e-4cf3-91b2-59e40a3a49ae	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.21	0.11	0.24	2020-04-21 00:58:30.190182	\N	\N
22c9f9bf-fa01-4d89-b46b-7d75538e0b21	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.15	0.1	0.27	2020-04-21 00:58:31.299995	\N	\N
d50d3eda-a7e8-4a0a-a9ad-4f6d2f852f5f	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.09	0.08	0.25	2020-04-21 00:58:32.408184	\N	\N
01119282-ae1c-47b0-908a-edd4ec68d8f2	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.09	-0.01	0.27	2020-04-21 00:58:33.518948	\N	\N
03ebccf7-2551-46da-bb3c-7ef1f8d41ac1	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.2	0.0	0.26	2020-04-21 00:58:34.625449	\N	\N
7f260e0c-6589-480e-8a40-3381c8690668	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.21	0.04	0.34	2020-04-21 00:58:35.745682	\N	\N
19d54b51-f070-485e-833f-ad966fea0682	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.11	0.01	0.34	2020-04-21 00:58:36.844229	\N	\N
2b63f9cd-7144-46d5-8da8-b7ad72430b65	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.06	0.0	0.26	2020-04-21 00:58:37.955694	\N	\N
6e675cf7-0968-4130-9276-b9f18d13bede	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.06	0.05	0.21	2020-04-21 00:58:39.061942	\N	\N
1f2745dd-c727-42ac-98cf-4494250771bf	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.18	0.21	0.3	2020-04-21 00:58:40.171481	\N	\N
8e161e7c-d5c8-4664-ab12-8bb63f66f0db	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.12	0.15	0.14	2020-04-21 00:58:41.283344	\N	\N
9a7e98ae-77f0-454a-a7bd-53898ad07e8a	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.12	-0.01	0.26	2020-04-21 00:58:42.39024	\N	\N
5d078d52-0213-4113-a01f-65a8dae40848	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.18	-0.01	0.32	2020-04-21 00:58:43.561473	\N	\N
3904c23d-bd89-4779-934f-77d98d313228	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.25	0.02	0.31	2020-04-21 00:58:44.607784	\N	\N
bb74bf32-1ceb-4f84-8ca1-bf583e3d18f4	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.17	-0.01	0.25	2020-04-21 00:58:45.718726	\N	\N
d8c3ac84-542c-4ba5-97c5-0582a51be1bc	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.16	0.04	0.26	2020-04-21 00:58:46.825329	\N	\N
f90a0a16-6ca0-4727-a833-e53b26493e36	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.22	0.1	0.31	2020-04-21 00:58:47.936165	\N	\N
5729d4f8-e1d1-40ed-baab-56fdee3f042a	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.06	0.01	0.24	2020-04-21 00:58:49.043946	\N	\N
e74da712-bcf1-40aa-a78c-c58aece0122c	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	0.13	0.34	2020-04-21 00:58:50.154199	\N	\N
a125ed0b-221c-4760-81eb-1cadeb321109	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.12	0.06	0.25	2020-04-21 00:58:51.450476	\N	\N
23094f79-4bb1-42b0-988c-5e6ff97127b2	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.24	-0.01	0.27	2020-04-21 00:58:52.371861	\N	\N
3d63a1bc-5255-4df5-9677-23dcf4588171	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	0.08	0.25	2020-04-21 00:58:53.481649	\N	\N
337f10b1-ab60-43c4-ae60-37c5ad4f8264	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.18	0.08	0.34	2020-04-21 00:58:54.590143	\N	\N
c3f1641f-ee60-4413-875a-f2a73949e3a8	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	0.05	0.25	2020-04-21 00:58:55.699855	\N	\N
4e2e6934-7f3d-49ab-8678-458755cfdb56	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.21	0.02	0.21	2020-04-21 00:58:56.813693	\N	\N
af27abfc-5b8f-4f39-8d83-0521dda513a4	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.05	0.06	0.2	2020-04-21 00:58:57.934865	\N	\N
d32bf02c-7d04-4c74-a116-622e678e7cd5	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.13	0.08	0.22	2020-04-21 00:58:59.026616	\N	\N
ac6846c2-dd09-4df8-ab72-5a1be9bd4def	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.15	0.11	0.25	2020-04-21 00:59:00.135891	\N	\N
d89fa5da-4374-434d-b78b-90cbc273eeac	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.08	-0.12	0.38	2020-04-21 00:59:01.243966	\N	\N
abe7c2d7-71a6-44d4-8187-1ad0d2eaa956	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.18	-0.08	0.21	2020-04-21 00:59:02.374922	\N	\N
83e8d50f-783f-442e-9fed-010d37ae2db6	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.07	0.08	0.34	2020-04-21 00:59:03.462265	\N	\N
922ed848-11b5-409e-bcb0-5be96d2d28de	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.16	0.07	0.31	2020-04-21 00:59:04.360751	\N	\N
b63f75d0-33d8-49a0-9108-9dc85dd7b2c5	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.19	0.05	0.26	2020-04-21 00:59:05.681739	\N	\N
6b6905a6-e042-4d9f-a027-97b5a3db7649	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.15	-0.02	0.31	2020-04-21 00:59:06.790196	\N	\N
03cc80d8-59d0-42cc-86cc-0dbcf7a88598	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.06	-0.07	0.42	2020-04-21 00:59:07.900634	\N	\N
057e27f5-a4de-4563-895a-eaa619430ad8	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	0.06	0.26	2020-04-21 00:59:09.008261	\N	\N
a4fc0961-40ae-46ec-ad09-03bd6967d6bc	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.05	0.11	0.26	2020-04-21 00:59:10.117418	\N	\N
23bc6296-ccc1-4e98-b7dc-0803661b4a19	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.08	0.05	0.26	2020-04-21 00:59:11.226026	\N	\N
92a0cfbb-8f16-400e-8661-c992e18a6a14	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	0.04	0.27	2020-04-21 00:59:12.336735	\N	\N
14160fb3-07e9-4eca-9578-7699a93d0468	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.2	0.11	0.24	2020-04-21 00:59:13.446189	\N	\N
b6dae807-0014-4f36-89cf-40424966b2d5	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.16	0.09	0.34	2020-04-21 00:59:14.555241	\N	\N
3c563506-7b18-4a1c-907a-4d02823be2f1	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.18	0.05	0.27	2020-04-21 00:59:15.662402	\N	\N
5fa2b82b-3cf8-4127-a249-a0d7285bfcb4	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.08	0.02	0.28	2020-04-21 00:59:16.771785	\N	\N
5af65117-3464-427b-9b60-a8e7948fecf7	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.04	0.02	0.31	2020-04-21 00:59:17.879632	\N	\N
73deb092-1372-43df-8dfb-7130bebede5a	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.09	0.14	0.26	2020-04-21 00:59:18.989524	\N	\N
f150b1f4-16b9-48d5-a9dd-60fb79151956	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.19	0.14	0.34	2020-04-21 00:59:20.100084	\N	\N
ac505f01-4da2-42c3-a08c-ec9aad5ffcc4	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.18	0.08	0.31	2020-04-21 00:59:21.207499	\N	\N
b462768e-8a4f-49fc-a248-4c04aa596e74	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.12	-0.02	0.34	2020-04-21 00:59:22.318751	\N	\N
6534f493-f4f1-43ea-ba34-ac3e79460686	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.09	0.08	0.31	2020-04-21 00:59:23.427966	\N	\N
1c451d52-dc1b-4160-8b3c-3fd0f635a076	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	0.14	0.33	2020-04-21 00:59:24.534963	\N	\N
9f26433a-789e-4f31-a77e-1fbeb878cb72	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.02	0.05	0.28	2020-04-21 00:59:25.643846	\N	\N
2689abfe-a7dd-4d05-8c2b-fb73365659cb	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.18	0.08	0.35	2020-04-21 00:59:26.75455	\N	\N
f6f3d86d-252c-47fd-98b6-eefb2d5347c3	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.19	-0.02	0.24	2020-04-21 00:59:27.877043	\N	\N
793dd3b0-2e41-4b2c-9192-3f4738533f68	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	-0.02	0.31	2020-04-21 00:59:28.976041	\N	\N
4f358d47-c427-43f5-9bef-c8005dd1809f	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.07	0.02	0.22	2020-04-21 00:59:30.079852	\N	\N
ae1ed2c6-43bf-4c3a-b3da-30b657b544cc	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.23	0.11	0.33	2020-04-21 00:59:31.190532	\N	\N
94c23b44-69e3-4b73-8f62-422c1bf29cbe	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.08	0.05	0.33	2020-04-21 00:59:32.297443	\N	\N
47138c40-280b-42f0-98ca-1d5b6a6a9112	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.25	0.02	0.23	2020-04-21 00:59:33.411219	\N	\N
ae977077-5e12-4a85-b2a0-2c5854ea9a84	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.11	0.03	0.14	2020-04-21 00:59:34.51573	\N	\N
5569a8d8-3f91-4c0e-9578-662e497c7872	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.21	0.02	0.27	2020-04-21 00:59:35.627247	\N	\N
e7ac355a-62d2-44dd-8950-9aad081ec57d	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.05	0.06	0.18	2020-04-21 00:59:36.734172	\N	\N
e5d637ef-c64c-4d50-9295-603a411853ed	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.21	-0.02	0.24	2020-04-21 00:59:37.844771	\N	\N
363bdc6b-79f1-4611-b544-9a9bc62547ff	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.19	0.06	0.24	2020-04-21 00:59:38.951876	\N	\N
1699c87b-7221-42be-89c1-5be34403d7e0	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	0.08	0.26	2020-04-21 00:59:40.061905	\N	\N
e1fb6552-4ed3-44b4-89af-13a557abb6c3	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	-0.02	0.27	2020-04-21 00:59:41.171877	\N	\N
e7b3f5de-6977-40d2-afb9-1b1a558e8141	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.2	0.07	0.33	2020-04-21 00:59:42.279362	\N	\N
a55897e4-8a9f-4e28-82da-5e9603121f60	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.21	0.08	0.27	2020-04-21 00:59:43.390271	\N	\N
90029e13-0b95-420e-b3e6-0edd59dc9909	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.14	-0.04	0.27	2020-04-21 00:59:44.497944	\N	\N
9a2cd58f-fed1-449f-8b5a-83449acf2671	569102de-8ad7-49c4-841a-224969b4504c	patient gyroscope data	e2616599-869d-45cf-a3c7-67ae4bb0163f	-0.18	0.07	0.12	2020-04-21 00:59:45.608137	\N	\N
f107872e-7b79-459a-abc3-1f40212c9892	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-0.11	0.05	-0.01	2020-04-21 04:08:41.383144	\N	\N
30dadc48-e751-44c1-936e-f1f99cc2d985	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-0.02	0.1	0.13	2020-04-21 04:08:41.804881	\N	\N
d38af27d-1515-4bd5-95e0-b712af6e3854	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	0.02	0.08	0.05	2020-04-21 04:08:42.26067	\N	\N
4ac16193-3da6-48d7-9cf9-4cd4d8eb8aa0	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-2.16	-25.7	-2.91	2020-04-21 04:08:43.459813	\N	\N
996c7713-22b1-466e-a14b-3c0a712c8b13	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	0.69	-17.52	-2.11	2020-04-21 04:08:44.498383	\N	\N
18277101-de96-4df8-ab58-7088195fa43c	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-13.57	-0.24	-7.48	2020-04-21 04:08:45.608907	\N	\N
55847c98-523f-43d2-b0fd-a4c5ae431f38	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	0.77	-4.61	6.73	2020-04-21 04:08:46.825355	\N	\N
ce94384c-269b-4389-a589-57a144fb7ddc	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	9.86	14.14	4.38	2020-04-21 04:08:47.818388	\N	\N
932440ad-72cc-4b79-bfe1-c24ee2549916	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	3.51	-0.37	0.79	2020-04-21 04:08:48.932622	\N	\N
a9ea4406-af6f-4c36-9297-30d76e43ca3c	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-1.66	2.92	-1.38	2020-04-21 04:08:50.040046	\N	\N
cb0b0bba-a806-4cc5-b30f-909ba148c608	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-3.85	4.77	2.68	2020-04-21 04:08:54.694469	\N	\N
87312743-40ca-4b7a-ac9d-2ae7597a6559	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-77.03	28.62	-60.58	2020-04-21 04:08:55.122013	\N	\N
b096d4dc-b510-47e8-9000-a7ad1e68b327	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	11.25	-11.6	0.08	2020-04-21 04:08:55.543274	\N	\N
85d66644-441a-433d-bec7-ab86e9af2cbb	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-3.83	-1.99	1.28	2020-04-21 04:08:55.965153	\N	\N
046b0da4-76fc-4892-8e17-55defec8a74f	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	0.52	-0.55	0.64	2020-04-21 04:08:56.386674	\N	\N
adc31879-33de-45fd-b8fa-307cdd701d5e	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	22.96	-13.06	-2.79	2020-04-21 04:08:56.808251	\N	\N
0e870f2a-9c87-4dbc-b513-6f13c38658aa	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	25.46	11.47	-4.88	2020-04-21 04:08:57.79194	\N	\N
8e7e525f-bdb8-45f1-aa52-67d44d7c40b0	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	1.52	0.53	-0.45	2020-04-21 04:08:58.918003	\N	\N
aa64ea98-ebc6-4d8e-843a-e51080e8881f	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-0.52	0.28	0.08	2020-04-21 04:09:00.017677	\N	\N
bbdc243f-6326-44a8-b481-e8fd8dc5df85	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-0.29	-4.04	-0.66	2020-04-21 04:09:01.117562	\N	\N
c72f9e93-7e49-47a8-9394-eaf3a5b333c8	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	0.2	-0.12	0.47	2020-04-21 04:09:02.227643	\N	\N
238ac350-f23b-44e9-86bb-b85411b32ff0	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-2.05	-1.92	0.31	2020-04-21 04:09:03.336787	\N	\N
13ae4d8d-1193-4d6b-815d-e4d93f25b162	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-2.43	-2.85	-0.14	2020-04-21 04:09:04.448416	\N	\N
783652af-8f6a-42cf-8708-f4141fe516b6	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	0.53	4.14	0.09	2020-04-21 04:09:07.317787	\N	\N
65cb5543-2102-4049-88ac-53fb5a434efa	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	0.54	-1.99	-0.46	2020-04-21 04:09:07.738999	\N	\N
50ca6a67-09c2-442d-a07e-7f02c840316a	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-0.3	-0.55	0.45	2020-04-21 04:09:08.160595	\N	\N
a7859b3f-3f4b-4cab-bb62-3b1810877694	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	0.45	11.99	-0.32	2020-04-21 04:09:08.887512	\N	\N
e5d64aa6-600d-42e9-b4c1-4c70c086f396	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	1.37	1.61	0.22	2020-04-21 04:09:09.999522	\N	\N
526c7d72-fca8-4ab7-a97b-42152b408e1e	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-2.15	3.82	0.43	2020-04-21 04:09:11.132632	\N	\N
b12b9a6f-7cb5-4f44-8b93-dcfb1accaaa4	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-7.52	1.41	2.83	2020-04-21 04:09:12.219576	\N	\N
78305882-73ec-404c-a6ad-bbcffe7aa6a8	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	1.13	-0.11	-0.14	2020-04-21 04:09:13.327464	\N	\N
a926563e-6e0b-408a-8cde-5520e3b97393	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	-2.98	-0.37	-12.8	2020-04-21 04:09:14.437555	\N	\N
fc7c5ed9-41a6-4a0e-bfc3-9558e462d3a8	53f7acf2-70c5-4a2e-afe2-88ec69b9e46f	patient gyroscope data	4bc1fa0b-f47f-44bc-b3f5-d013b94537ae	0.13	0.04	0.11	2020-04-21 04:09:15.53798	\N	\N
c5bb4f95-7efe-420b-9e16-f8b698d487db	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.02	-0.01	-0.09	2020-04-21 04:15:50.685952	\N	\N
881c7e0b-f15b-489e-a8ff-b140b6bea11d	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.01	0.16	-0.05	2020-04-21 04:15:51.108642	\N	\N
bc4337a4-850a-4d62-8d19-eb92604e9ef4	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-9.42	0.6	-11.57	2020-04-21 04:15:51.544164	\N	\N
a23a73d4-f015-4613-b16d-03a43f06d644	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-7.56	-15.15	-17.04	2020-04-21 04:15:52.660114	\N	\N
2a1f857f-f8f3-4455-bfec-656a5a1ffabf	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-18.72	-8.99	43.14	2020-04-21 04:15:53.76694	\N	\N
05762de3-39b8-42dc-9069-1e6df0986863	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-33.4	11.41	10.13	2020-04-21 04:15:54.877515	\N	\N
10da44d1-2cbb-44ce-8b9f-69720f77a435	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-33.97	23.27	-14.59	2020-04-21 04:15:55.96702	\N	\N
3c4a9605-1a9b-46ea-a7ac-15797eb19bb2	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-39.52	8.68	4.32	2020-04-21 04:15:57.096172	\N	\N
e46c901e-36f1-417a-a762-5104983c12b8	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-80.99	-14.43	13.63	2020-04-21 04:15:58.173048	\N	\N
5ac4cc7e-8e2e-4d82-8f71-0045b16e8fa5	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-10.37	22.03	21.47	2020-04-21 04:15:59.313599	\N	\N
fed29b12-fc2f-4137-a0c6-93d62241b365	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-17.44	-1.43	-7.23	2020-04-21 04:16:00.415297	\N	\N
ce5ffa40-c78e-47b7-a650-fb8d78023b8e	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	14.81	55.05	7.17	2020-04-21 04:16:01.617515	\N	\N
d620ab50-ffc7-4d01-b87c-1bb172b43ae3	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	10.59	-6.42	6.2	2020-04-21 04:16:02.65047	\N	\N
2236fc84-031f-4e1a-b4ae-fb2e67b6095a	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	49.07	-17.23	-52.04	2020-04-21 04:16:03.769596	\N	\N
bedfbc23-788c-4dd3-a2e3-20e812891f93	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	17.59	7.29	-21.27	2020-04-21 04:16:04.862584	\N	\N
7ed12a02-1432-4e6c-95f5-8e72ddfc61dc	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	18.26	-28.45	3.08	2020-04-21 04:16:05.98047	\N	\N
4e3224b8-bc6b-4c5a-b4d3-6e897a80d607	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-23.09	36.97	20.76	2020-04-21 04:16:07.073417	\N	\N
5405d367-870b-4283-9385-04128dc9a03c	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.11	0.07	0.05	2020-04-21 04:16:08.182867	\N	\N
5571914e-d364-48ed-b51c-d3bfba5a5625	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.08	-0.1	0.0	2020-04-21 04:16:09.301486	\N	\N
0b7c0d70-70d0-41b5-b8ab-ade589b26378	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.07	-0.03	0.06	2020-04-21 04:16:10.392317	\N	\N
d82131e2-2454-4b89-a0a3-6c37dd7a554d	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.21	0.08	0.06	2020-04-21 04:16:11.488795	\N	\N
28eeaca2-3633-4108-ac49-b12be7b4f3d0	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.07	-0.28	0.12	2020-04-21 04:16:12.621264	\N	\N
4e2c2199-d45b-4f52-96d5-d3b9d6b67bba	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.03	-0.02	0.05	2020-04-21 04:16:13.712824	\N	\N
b06d0c35-6c35-4e36-b6c3-a5b6fb50a96a	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.02	0.19	0.07	2020-04-21 04:16:14.811244	\N	\N
3cb25087-3dcb-4914-a210-df476632f8c1	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.05	0.11	0.0	2020-04-21 04:16:15.929923	\N	\N
3c1b8cec-4f43-4843-b84b-d5d7c63b68c3	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.04	0.05	0.13	2020-04-21 04:16:17.040346	\N	\N
107fdaa1-a1df-4e95-ba8e-34ba100c874f	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.12	0.08	0.01	2020-04-21 04:16:18.140402	\N	\N
acb5082c-7afc-42ee-9f32-b72f17a3540a	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.06	0.13	0.04	2020-04-21 04:16:19.347535	\N	\N
bfecdc05-9257-4508-8c1c-34f03aaeca83	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.14	0.04	0.05	2020-04-21 04:16:20.390381	\N	\N
3397f2df-2584-4afc-8d2d-4c910f87a44f	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.02	0.0	0.05	2020-04-21 04:16:21.495679	\N	\N
781eedaa-c95a-42e4-8d24-1e38ea04b656	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.02	0.08	0.01	2020-04-21 04:16:22.601679	\N	\N
fccd7356-b2c8-4a72-bc2f-0e453a3d1c74	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.17	0.08	0.05	2020-04-21 04:16:23.712787	\N	\N
a49d8c3b-8ffb-4676-971f-eeb22c4dda67	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.02	0.14	0.08	2020-04-21 04:16:24.800373	\N	\N
5e9d6818-114f-4ede-8eb5-d2d59cc7f117	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.04	-0.01	0.14	2020-04-21 04:16:25.926513	\N	\N
01f497b8-a3d0-454e-8d36-afc747785d24	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.04	-0.14	0.08	2020-04-21 04:16:27.022395	\N	\N
a6aa49b5-a161-49a4-9030-24df9132b884	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.05	0.16	0.02	2020-04-21 04:16:28.141029	\N	\N
dc059e64-639a-4107-b230-c4b83de2bebb	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.05	0.05	0.0	2020-04-21 04:16:29.245586	\N	\N
8dcf5a9a-a430-4fe8-b486-7dd9ed3b9324	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.07	0.05	0.07	2020-04-21 04:16:30.671829	\N	\N
964680ec-979a-4a57-8d5f-b6c7091ef5b6	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.1	-0.06	0.05	2020-04-21 04:16:31.441296	\N	\N
1bb2ee98-6b42-4b46-aa59-f97b24c3e1cc	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.11	0.14	0.08	2020-04-21 04:16:32.540657	\N	\N
5fb1a82f-4ea0-461e-b558-8ce542a87691	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.1	0.09	0.04	2020-04-21 04:16:33.666939	\N	\N
0ab5f039-673d-4f94-b76a-a372d8af7bbb	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.0	0.02	0.15	2020-04-21 04:16:34.939505	\N	\N
eb62e190-6c48-4c01-a8aa-fbdf0d3a655b	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.02	0.01	0.09	2020-04-21 04:16:35.911951	\N	\N
663ac0a9-50ce-4209-bba6-76a9055178b5	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.12	0.05	-0.03	2020-04-21 04:16:37.002578	\N	\N
e2652afa-4907-41ac-8b62-a91a4b8cca2b	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.02	-0.01	0.0	2020-04-21 04:16:38.109765	\N	\N
572d76f2-c158-4e90-a59a-ac3e6de3f94d	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.07	0.04	0.01	2020-04-21 04:16:39.216401	\N	\N
636647af-89c4-49c7-8adc-de625704c631	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.02	0.08	0.02	2020-04-21 04:16:40.318162	\N	\N
27222d9b-a82c-4d7a-81e9-36de40d1e48a	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.09	0.09	0.0	2020-04-21 04:16:41.438773	\N	\N
b2499a11-4049-4b36-925d-037027f11dd4	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.05	0.05	-0.08	2020-04-21 04:16:42.53644	\N	\N
4aabbb74-bba0-4750-9e3b-ae0f6c6756b1	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.02	0.12	0.07	2020-04-21 04:16:43.659427	\N	\N
0f5f10e8-0f05-41fd-a5e0-b320d56cbfb5	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.02	0.11	-0.06	2020-04-21 04:16:44.755505	\N	\N
733ef1f4-d25c-4b17-81d2-2465ad0a677b	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.12	0.1	0.07	2020-04-21 04:16:45.875016	\N	\N
8a09175e-e6a8-4bbd-bdfb-b5d060e2d242	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.08	0.0	0.12	2020-04-21 04:16:46.984736	\N	\N
877c3833-a4f0-4934-87ff-4632182a5540	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.03	0.0	0.16	2020-04-21 04:16:48.090854	\N	\N
6a896417-9eb3-4f69-893d-51db4e7ce594	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.04	0.14	0.05	2020-04-21 04:16:49.205211	\N	\N
d6a886a6-2756-41d6-95aa-e2e9ad82b39c	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.01	0.11	-0.06	2020-04-21 04:16:50.318601	\N	\N
90c0d1d7-e04c-4aaa-90da-9835b2daa5cf	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.03	0.02	-0.02	2020-04-21 04:16:51.4229	\N	\N
93f1cb71-9f38-48c1-a3cc-f0789109a4f2	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.05	0.06	0.05	2020-04-21 04:16:52.529348	\N	\N
dd9414a0-e3df-4239-97b4-984bd2ccefb9	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.02	0.11	0.16	2020-04-21 04:16:53.648014	\N	\N
00e13b8a-9839-4c10-abb2-f94185e5b568	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.05	0.05	0.06	2020-04-21 04:16:54.764521	\N	\N
edce5808-39c2-4267-8c3d-6233eea9c399	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.03	-0.02	0.06	2020-04-21 04:16:55.855108	\N	\N
07030b93-fe20-4a3e-9bd6-11314173f93d	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.08	0.01	0.15	2020-04-21 04:16:56.963326	\N	\N
7e0f3e74-cc01-4b5d-9036-bf9bc47635de	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.04	0.07	0.17	2020-04-21 04:16:58.072369	\N	\N
5be757fe-e732-4f3e-909d-8a925b33cb99	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.01	0.05	0.06	2020-04-21 04:16:59.179222	\N	\N
141ec0c8-6fde-4a13-a31c-ac094b9b38aa	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.05	0.02	0.0	2020-04-21 04:17:00.284717	\N	\N
2b12d478-73b7-421f-8543-81c9223cfd24	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.02	0.06	0.11	2020-04-21 04:17:01.520061	\N	\N
b449a9cd-b9f2-49f3-a66f-336100edd710	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.07	0.12	0.0	2020-04-21 04:17:02.493845	\N	\N
45f30a52-508e-4523-9273-793f249ee887	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.02	0.01	-0.02	2020-04-21 04:17:03.624511	\N	\N
c99cb8f9-6490-4619-b919-d43aec53012a	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.02	-0.03	-0.04	2020-04-21 04:17:04.724506	\N	\N
a4ddf94e-5cf0-47bf-87d6-80e2f2a1dd15	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.11	0.1	0.14	2020-04-21 04:17:05.830464	\N	\N
9530804a-03df-4034-bae8-e4cd4e7f2032	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.0	0.14	0.02	2020-04-21 04:17:06.943825	\N	\N
9315ab5e-394c-4cf8-9eba-407d4e12d1bb	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.01	0.11	0.02	2020-04-21 04:17:08.04741	\N	\N
897d30be-b8aa-4cf6-a833-cb21b0a401d9	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.17	0.21	0.1	2020-04-21 04:17:09.16126	\N	\N
7cf5d876-fc9e-4fcc-b4e6-649d772d697e	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.08	0.02	0.0	2020-04-21 04:17:10.302054	\N	\N
448b47af-282b-4cac-9b2b-5bec23d6a8d5	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.01	0.07	-0.09	2020-04-21 04:17:11.417265	\N	\N
6e1d7fc3-9ced-42c2-9e25-352e8bf3a40d	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.07	0.02	0.05	2020-04-21 04:17:12.507776	\N	\N
39b8aa45-021b-4e23-82b9-879cb09c17fa	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.08	0.02	0.11	2020-04-21 04:17:13.621887	\N	\N
deded3ae-e15b-439e-9963-3907105ce90d	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.11	0.0	-0.03	2020-04-21 04:17:14.719414	\N	\N
093ecc6f-2d4f-40ef-aabc-911cf68c432b	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.13	0.1	0.02	2020-04-21 04:17:15.827894	\N	\N
85b0f574-8f97-45b8-915c-0d24ada25dce	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.07	0.06	-0.14	2020-04-21 04:17:16.943794	\N	\N
7a67c331-cf2d-43f1-b7a6-0d370b5b5eb8	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.11	0.01	0.02	2020-04-21 04:17:18.063135	\N	\N
bd902744-cfbf-49f1-8b2b-50fecc6c3c16	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.02	0.05	0.05	2020-04-21 04:17:19.173704	\N	\N
ddc1db74-3125-4cb0-bcea-f4dce70521dc	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.11	0.08	-0.08	2020-04-21 04:17:20.275189	\N	\N
e58f73fe-73b8-4ae8-ac1f-e66fcf77cede	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.03	0.04	-0.02	2020-04-21 04:17:21.378411	\N	\N
9d7eb226-0e67-4bac-9f67-71a64ec942d0	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.06	-0.05	-0.03	2020-04-21 04:17:22.275001	\N	\N
094bdae1-486b-41df-aeba-2fa5ee83d86a	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.02	0.02	0.06	2020-04-21 04:17:23.588406	\N	\N
d9a7e13f-c970-4cd0-a57e-334b2ce7c9b3	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	0.0	0.07	0.07	2020-04-21 04:17:24.717773	\N	\N
e1c74df3-0063-4358-bc37-aaa00f1d49d7	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.02	0.02	0.06	2020-04-21 04:17:25.803604	\N	\N
6499d69c-3337-4a64-8c97-ee21ec1d9dc5	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.1	10.87	249.99	2020-04-21 04:17:26.910747	\N	\N
d1d4b8d9-a628-49d0-a836-62160714c180	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.33	-0.44	3.58	2020-04-21 04:17:28.120941	\N	\N
14632aad-0652-492b-adf1-59de991433f7	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.1	0.21	2.33	2020-04-21 04:17:29.155311	\N	\N
2a371618-fb82-4695-bdb1-846f300017ed	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-0.09	0.27	-0.5	2020-04-21 04:17:30.277903	\N	\N
38b93e60-18d0-4f35-ba42-9664efd02dd8	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-54.7	-24.35	-28.24	2020-04-21 04:17:31.358466	\N	\N
981d1acd-aa71-42c0-be0a-a3d95fbfa9fa	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	25.75	-5.55	1.55	2020-04-21 04:17:32.46828	\N	\N
c3b63eb3-6234-49c4-9fbe-c2ad59c150a7	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-11.39	4.65	-0.29	2020-04-21 04:17:33.589004	\N	\N
45b4b11b-ec12-4826-8e46-ef0091f71a53	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-3.97	-0.4	-0.86	2020-04-21 04:17:34.709878	\N	\N
701f9c55-c88b-411b-95d0-7f4a322bcdcb	24cfab21-74c6-4481-b686-083be6e02763	patient gyroscope data	7772620d-2731-4a7f-9fda-6a412c37ee76	-5.42	-0.11	5.6	2020-04-21 04:17:35.806015	\N	\N
e0aaed83-f6f5-4182-b18b-2e6d6454a0f0	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-3.86	-4.35	2.04	2020-04-22 18:49:37.578037	\N	\N
85264200-c958-4129-a7e3-4bbbfc6c2ba2	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	1.61	-0.18	0.4	2020-04-22 18:49:38.004862	\N	\N
bdbea07f-b40c-40db-b587-81d8a1d64b76	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	44.84	-4.05	-2.15	2020-04-22 18:49:38.434985	\N	\N
9dc8679f-f6e5-4438-b297-5891da4964e0	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-82.82	35.74	6.34	2020-04-22 18:49:39.54716	\N	\N
52e8baad-e04e-43f0-86af-a57b8cd31fc5	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	93.39	-6.45	16.85	2020-04-22 18:49:40.655714	\N	\N
368e1e81-4973-4981-b3f3-f2de6ad39447	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-26.54	4.15	2.11	2020-04-22 18:49:41.76367	\N	\N
0ea0ec1a-b071-444b-8e67-241215affee6	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-2.65	-0.4	-0.64	2020-04-22 18:49:42.874386	\N	\N
743fd9d9-f333-47c8-9256-1df179aed0d1	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.98	2.97	0.47	2020-04-22 18:49:43.99161	\N	\N
541fa29a-3fb9-4ebc-8094-6468a107552d	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	21.73	30.53	-0.59	2020-04-22 18:49:45.101885	\N	\N
1254943c-f716-448e-90d1-009c089c1feb	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	2.48	9.7	3.64	2020-04-22 18:49:46.21182	\N	\N
d532ef86-a854-4505-a529-341c61dcac99	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.15	-6.74	-8.0	2020-04-22 18:49:47.321577	\N	\N
7fa34660-5128-4998-84f7-5f508010df0d	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-7.93	-7.92	0.31	2020-04-22 18:49:48.43187	\N	\N
e6a99b11-5b00-48bb-85b5-cd09f21a2285	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-4.46	-0.64	1.91	2020-04-22 18:49:49.551517	\N	\N
b50d5024-10fe-442d-9fdf-12c2ce113877	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-1.62	-4.05	-0.27	2020-04-22 18:49:50.663152	\N	\N
f312969a-6941-409e-898b-8b3b9a82f0d9	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-2.08	-5.11	-0.4	2020-04-22 18:49:51.74119	\N	\N
73a06133-ae15-4f22-b6ef-c282222ded4c	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.31	-0.25	-0.66	2020-04-22 18:49:52.854272	\N	\N
f182a5c0-2eaf-4de0-aa4f-8c4a0899262f	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-1.72	-1.82	0.33	2020-04-22 18:49:53.96356	\N	\N
0400bf4e-623f-4744-afad-08c51898e602	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-1.07	0.26	0.08	2020-04-22 18:49:55.070128	\N	\N
0d741044-0888-45cb-8bd6-bf65ef2f4cb3	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-2.91	-10.07	-1.19	2020-04-22 18:49:56.177808	\N	\N
f4cbe45a-b69f-4764-b74f-77764292b1b1	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-2.07	1.36	-2.88	2020-04-22 18:49:57.288128	\N	\N
25cf40fd-c407-4c67-9365-60876212eac6	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-13.46	-23.39	-1.69	2020-04-22 18:49:58.397891	\N	\N
b690fed5-1ff9-440e-b9ea-555e7fd0557d	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-4.71	-7.55	-2.11	2020-04-22 18:49:59.652569	\N	\N
b0a7c52f-0c24-44cb-b67d-5d72f9a3b672	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	2.73	14.96	0.99	2020-04-22 18:50:00.615464	\N	\N
dcf2f0ef-fd3b-4c3a-ad2c-3cc0104c93f6	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-7.25	-15.91	-8.72	2020-04-22 18:50:01.726233	\N	\N
35d5f58e-cd3e-461d-bb8e-4ba16ca1d0a6	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-16.67	-40.08	11.77	2020-04-22 18:50:02.835149	\N	\N
5cbf603d-ba5d-478a-af60-99f638f4085e	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.11	0.01	0.15	2020-04-22 18:50:03.963626	\N	\N
bf1efad3-690f-4e37-8fdc-ca76baadd848	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.04	0.07	0.16	2020-04-22 18:50:05.063177	\N	\N
6ba0d2a4-ceaf-43a4-a7f6-19aae1a54ec6	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.05	-0.01	0.15	2020-04-22 18:50:06.171704	\N	\N
ccc689d6-a8e8-40e2-a29f-33c70d336c2a	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	39.18	-44.35	46.42	2020-04-22 18:50:07.281585	\N	\N
314f022d-c277-40f1-b2b6-1a03b5017fec	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.63	-7.85	-0.73	2020-04-22 18:50:08.396907	\N	\N
5a18f88e-8e83-4f55-92f5-3ab5eaaefeb6	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-5.69	-2.2	1.02	2020-04-22 18:50:09.505167	\N	\N
2f2fe043-ea48-44b7-9ccd-abcf358bb207	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-2.06	95.02	20.03	2020-04-22 18:50:11.965209	\N	\N
569544a9-153b-44c3-a607-ad19b3eb9a22	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	23.91	3.53	-2.87	2020-04-22 18:50:12.391761	\N	\N
78d985e6-386f-401b-9510-13bd7712f0be	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-33.3	-7.05	-15.15	2020-04-22 18:50:12.832424	\N	\N
f23c0cb9-3408-40c7-8dd3-bb57a90ac3b0	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	2.33	55.97	78.93	2020-04-22 18:50:13.941321	\N	\N
54f18eb8-adde-400f-9621-e2fba0d0129c	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.14	0.12	0.02	2020-04-22 18:50:15.052747	\N	\N
9846af9a-ad1a-402e-b747-734481dd2b48	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.08	0.12	0.12	2020-04-22 18:50:16.162275	\N	\N
e3aba05b-db00-4101-ab90-927706a8c08b	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	36.35	-3.74	-25.3	2020-04-22 18:50:17.275376	\N	\N
60a98e38-6114-4ca6-9512-83ed0f727f3b	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-15.15	-13.46	-1.63	2020-04-22 18:50:18.410667	\N	\N
02316743-ab79-4162-bf11-84723f44347f	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	2.27	-24.37	16.2	2020-04-22 18:50:20.965815	\N	\N
14975dbe-b643-4d82-a071-b329493facfe	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.07	0.01	0.09	2020-04-22 18:50:21.392385	\N	\N
841d2814-5c9c-420d-becf-d9ab8988c8dd	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.02	0.05	0.21	2020-04-22 18:50:21.81809	\N	\N
f2f5d68d-5643-43b7-a963-65df7f9e3dad	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.0	0.17	0.08	2020-04-22 18:50:22.812356	\N	\N
a25878ab-12dc-4e9c-b44b-73e0d9370bc8	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.06	0.2	0.08	2020-04-22 18:50:23.922079	\N	\N
12687706-1d13-489b-8497-21350907feab	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.02	-0.06	0.11	2020-04-22 18:50:25.03447	\N	\N
aabed754-5782-42b1-9977-3255490489c2	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.03	0.02	0.13	2020-04-22 18:50:26.144031	\N	\N
547b884b-0a0a-42d6-a626-dcc2dc19fb01	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.05	0.05	0.08	2020-04-22 18:50:27.252454	\N	\N
f1a7db02-0831-4e4f-ab60-15e3573bfad7	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.0	-0.02	0.21	2020-04-22 18:50:28.381521	\N	\N
2d065285-e905-49a4-a85b-1d31755b706f	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.03	0.02	0.0	2020-04-22 18:50:29.454316	\N	\N
ef1e84cb-469a-4999-95ef-0bf3a41c5052	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.09	0.02	0.1	2020-04-22 18:50:30.578117	\N	\N
9a105f67-348c-418d-92bc-bdd40caf95d4	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.02	-0.05	0.11	2020-04-22 18:50:31.675753	\N	\N
7061dc40-837d-48e3-b3a2-04e3e574a6da	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.08	0.09	0.15	2020-04-22 18:50:32.779537	\N	\N
d0403e39-9fd8-4476-820e-3aaf521ea613	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.05	-0.06	0.14	2020-04-22 18:50:33.890411	\N	\N
8e68a132-6357-4ea2-871b-678aab5aefee	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.09	0.0	0.04	2020-04-22 18:50:34.9983	\N	\N
327ad006-0fdb-4ffc-8462-bcb4b4bd7c14	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.05	0.12	0.1	2020-04-22 18:50:36.107749	\N	\N
d7372681-69a4-40f0-8907-774a62886c57	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.01	0.01	0.05	2020-04-22 18:50:37.39552	\N	\N
9e40b68b-d0c5-43c9-962b-167db9cf0d57	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.11	0.0	0.07	2020-04-22 18:50:38.326525	\N	\N
81e87b47-ba71-4d5a-b4c9-ba8c2be0e49c	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.0	-0.08	0.08	2020-04-22 18:50:39.433926	\N	\N
508e7c72-a589-4ab8-9ec3-960820fd3ac6	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.12	0.0	0.16	2020-04-22 18:50:40.543595	\N	\N
39cf8004-860c-4529-9ac3-f0b823b2bff9	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.02	0.05	0.09	2020-04-22 18:50:41.652273	\N	\N
74cec7d6-3230-499f-b25d-70fb76464200	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.02	-0.05	0.09	2020-04-22 18:50:42.762672	\N	\N
c8ab69c0-8165-4015-a2b1-a689283201f2	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.05	0.05	0.22	2020-04-22 18:50:43.870265	\N	\N
620c3a76-9434-453c-bbc3-c087a8ac9384	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.08	0.05	0.12	2020-04-22 18:50:44.980632	\N	\N
3e14aa4a-e6b8-4b81-ac87-0edbb8d62810	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.05	-0.07	0.28	2020-04-22 18:50:46.090974	\N	\N
b281a011-5032-424c-a172-0a25ad3abbf5	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.05	0.03	0.03	2020-04-22 18:50:47.198681	\N	\N
244d88c3-ac5c-4d2e-afb8-e05a4a443cb4	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.03	0.09	0.19	2020-04-22 18:50:48.305527	\N	\N
b65e8cf7-9362-4ddf-9a64-e7d2baebeb5f	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	0.0	-0.01	0.2	2020-04-22 18:50:49.415376	\N	\N
744e60d0-804d-40b9-a47f-dbc44a1e9160	2925c13a-905d-4e88-996d-a0161ea5a9e7	patient gyroscope data	0b69ec6a-e16d-41dc-ad0e-cb226c4870c7	-0.03	0.14	0.21	2020-04-22 18:50:50.525073	\N	\N
519d2968-c9d4-4ff9-aefa-63b1b37222fc	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	4.2	2.82	-2.35	2020-04-22 18:58:36.562915	\N	\N
b94fef7e-52e6-4c07-959d-5fd7ff82f7c1	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-10.61	3.17	13.63	2020-04-22 18:58:36.992085	\N	\N
6c108fcf-4051-4a3b-935c-b87765994bc3	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-15.85	-7.11	-18.92	2020-04-22 18:58:37.483485	\N	\N
c65b5bc2-40ec-481c-ba8b-b01fa44b8608	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-3.61	2.55	3.88	2020-04-22 18:58:38.592518	\N	\N
5620b1a3-89d0-4007-97b8-a3806100e86d	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	1.69	1.83	1.61	2020-04-22 18:58:39.652523	\N	\N
f962f764-cada-4d46-8c98-377ff58627aa	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-2.73	-0.38	1.8	2020-04-22 18:58:40.555775	\N	\N
f893cef6-6a65-49e7-b56a-7311b041014b	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.77	-0.49	1.31	2020-04-22 18:58:41.861915	\N	\N
171fe3ec-1b9b-42ed-8424-df0b924ccc10	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	8.29	5.65	-2.66	2020-04-22 18:58:42.973588	\N	\N
35683724-68d9-419a-a267-ddf2ce91574b	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	2.4	1.75	0.63	2020-04-22 18:58:44.078818	\N	\N
d62e43b7-a9f6-4063-b6f5-7edbe403c340	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.5	-0.41	-0.66	2020-04-22 18:58:45.263385	\N	\N
24a34a32-e40d-490d-a99b-8973f5fac293	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-2.66	-2.17	0.75	2020-04-22 18:58:46.303168	\N	\N
50db0d74-0002-460e-b92c-60dcc9b9068e	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-1.5	-0.21	1.21	2020-04-22 18:58:47.435723	\N	\N
d9133dcc-6d4e-428b-ace6-e51400ce3ec8	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	61.34	1.75	24.92	2020-04-22 18:58:48.523403	\N	\N
3100d832-16dc-4806-acbf-acfae934ecde	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	15.06	-2.52	0.29	2020-04-22 18:58:49.640145	\N	\N
9b5f794a-d5ef-4bc3-8ac5-4ed7ddbfa733	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	3.97	-1.4	1.61	2020-04-22 18:58:50.744176	\N	\N
885088ad-0465-430d-ba0a-3dec5dde0722	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-25.88	-18.53	1.03	2020-04-22 18:58:51.852674	\N	\N
4ce58c7d-2ca8-4cad-a592-b0619f6a525b	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.14	0.02	0.3	2020-04-22 18:58:53.362942	\N	\N
60584aa8-c520-41fd-8c22-ef38b2aa691e	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.17	-0.02	0.05	2020-04-22 18:58:54.073548	\N	\N
a2f65cb3-cf4c-4a4e-8d14-b4ee1f8877ee	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.05	-0.02	0.04	2020-04-22 18:58:55.173966	\N	\N
7ed4b943-747d-4465-b166-494b28f2ae8f	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.01	0.02	0.11	2020-04-22 18:58:56.290309	\N	\N
e321da78-c5b6-44b0-acf3-17d95fc66969	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	0.0	-0.02	2020-04-22 18:58:57.393208	\N	\N
596e5d26-393a-425d-98ee-1cd5f4a74e75	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.03	-0.09	0.14	2020-04-22 18:58:58.502563	\N	\N
102db961-303e-4834-a34d-a03df2ca4e5b	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.03	-0.05	0.15	2020-04-22 18:58:59.613422	\N	\N
12e1aa3e-921d-4ee1-91bb-068dde053eea	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.04	0.02	0.1	2020-04-22 18:59:00.772539	\N	\N
082b0844-3809-44c6-9909-77337d14c1a7	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.03	-0.05	0.07	2020-04-22 18:59:01.835783	\N	\N
cddda689-22f5-4941-a0ee-c3e346bdcf5e	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	0.02	0.11	2020-04-22 18:59:02.943361	\N	\N
e0102e99-8d23-4243-88e3-9de7d7b4f41b	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.55	-0.81	0.26	2020-04-22 18:59:04.041841	\N	\N
59378eb2-7fef-463d-8e6a-fe67aa928ff0	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	1.53	0.18	3.87	2020-04-22 18:59:05.155881	\N	\N
900e7e0a-9c25-414a-9a5d-bf3450b9ab18	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-3.81	-5.8	-2.74	2020-04-22 18:59:06.279068	\N	\N
e9d90452-4e8f-48f2-bbf1-1eff3ea737e1	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.04	-0.02	0.11	2020-04-22 18:59:07.383504	\N	\N
23487647-c3ba-425a-b938-d578e95bc2b8	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.67	11.1	-0.61	2020-04-22 18:59:08.485782	\N	\N
85260eea-e796-45d5-bfb4-5df06827da5f	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-3.81	11.64	4.26	2020-04-22 18:59:09.59265	\N	\N
025311ae-842c-4b7a-a500-47eec35b9825	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-14.28	15.8	30.86	2020-04-22 18:59:10.702077	\N	\N
12c26a99-ec39-40f0-8cf7-bb791f190679	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-10.81	-3.24	-5.59	2020-04-22 18:59:11.812474	\N	\N
05d11e6f-4332-4ac2-b602-66a370cef860	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	8.89	-12.84	1.43	2020-04-22 18:59:12.940142	\N	\N
dfbb6598-6389-4114-89bf-5268ded63423	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.49	-5.74	0.63	2020-04-22 18:59:14.02224	\N	\N
a8588f9e-a4c3-4faa-ac7b-2064e7533f75	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.34	-2.69	0.35	2020-04-22 18:59:15.613549	\N	\N
a29fa713-49ca-472b-82b1-c01eaa4312bb	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-1.31	-8.27	4.28	2020-04-22 18:59:16.277299	\N	\N
6ff47fef-0114-40c9-8b66-c2760aa79e0e	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-13.29	16.78	-3.71	2020-04-22 18:59:17.38305	\N	\N
d45cd14a-2bf4-496f-8fd3-fa63f7529b8b	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	32.84	-1.01	12.08	2020-04-22 18:59:18.48317	\N	\N
229e9b9c-fc2a-40ff-9622-4bf3a8c2eca3	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-22.4	81.68	26.02	2020-04-22 18:59:19.59349	\N	\N
7c3c6e74-0f26-46e3-aa33-47f0ae7744ca	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	5.29	1.22	14.55	2020-04-22 18:59:20.702881	\N	\N
ac0ba06f-5066-41bf-9b74-f53b84987b48	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	0.12	0.04	2020-04-22 18:59:21.804239	\N	\N
bd63b019-7cba-48b7-8bdc-959242af22e7	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.05	0.04	-0.02	2020-04-22 18:59:22.940659	\N	\N
3f169e1a-c0a0-495e-b24e-533b4d910e00	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.05	-0.02	0.09	2020-04-22 18:59:24.022605	\N	\N
7cd46da7-b249-4933-b06d-1081dac6ad93	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	0.01	0.05	2020-04-22 18:59:25.132698	\N	\N
a1a22d95-615a-4189-b0ab-33fad77fe01d	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	0.05	0.14	2020-04-22 18:59:26.242772	\N	\N
49e5b181-b733-4921-9c46-9b1131036775	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.05	-0.02	0.08	2020-04-22 18:59:27.13195	\N	\N
04878c49-2719-47f9-b68d-204b5042f6f7	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.02	0.03	0.11	2020-04-22 18:59:28.453385	\N	\N
8baa943a-ec7c-4f9e-baee-81addb3201b4	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.02	-0.09	0.15	2020-04-22 18:59:29.562772	\N	\N
be6b8239-67f7-4466-bcd1-97e4a40e2e21	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.03	-0.05	0.11	2020-04-22 18:59:30.672503	\N	\N
329b025f-8feb-4c19-ac17-6dbe9b96f3f5	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.09	-0.09	0.15	2020-04-22 18:59:32.964579	\N	\N
04b96b02-c7d8-4ba2-b307-5e0a32ad263d	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.01	-0.02	0.24	2020-04-22 18:59:33.393581	\N	\N
44798ae2-a683-45ea-82cb-1c82f39bdbdb	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.04	-0.09	0.22	2020-04-22 18:59:34.002673	\N	\N
e9ba78c7-c0ba-4748-8391-3406cab2951a	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.08	0.08	0.09	2020-04-22 18:59:35.103601	\N	\N
153525a6-5df5-4995-920a-6b871ee3610e	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.04	0.01	0.07	2020-04-22 18:59:36.291216	\N	\N
7e26cb97-0a8a-44ac-ba69-178ec5927aa2	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.25	-0.08	0.18	2020-04-22 18:59:37.325053	\N	\N
8c35febe-618c-47a0-aded-fb3288717585	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	-0.1	0.14	2020-04-22 18:59:38.459929	\N	\N
dd13ede9-c648-4577-9ef8-8b6079ac80e0	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.0	-0.02	0.05	2020-04-22 18:59:39.543543	\N	\N
acd7a080-9554-49c9-b4b3-6ad50a5eb0a7	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.08	-0.13	-0.01	2020-04-22 18:59:40.660312	\N	\N
e5713078-197d-492c-b817-f47e7b6b956a	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.06	-0.01	0.06	2020-04-22 18:59:41.802327	\N	\N
35bd2497-3af8-4c34-b0df-47393cb0cc65	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.05	0.01	0.11	2020-04-22 18:59:42.876081	\N	\N
3ce50418-df1e-4dac-977c-8882fae0bd26	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.03	0.03	0.09	2020-04-22 18:59:43.982783	\N	\N
88915bb1-2691-408a-b640-1ddfd29226bd	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.05	-0.03	0.1	2020-04-22 18:59:45.094235	\N	\N
64a51a81-6ef9-473c-ac8a-0515074da917	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.05	-0.01	0.18	2020-04-22 18:59:46.202738	\N	\N
80e7458e-33e0-4e26-8f2b-af168c1e5dee	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.11	0.05	0.08	2020-04-22 18:59:47.305346	\N	\N
166fec5e-b904-41b1-bc18-bd0d6b7c8118	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.07	-0.02	0.13	2020-04-22 18:59:48.418848	\N	\N
2d5a95ac-87fd-4333-84a5-3b0d67094038	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	0.07	0.14	2020-04-22 18:59:49.526855	\N	\N
d1f99ff0-f71d-4f35-8b11-e3114bce99a0	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.08	-0.02	0.06	2020-04-22 18:59:50.621037	\N	\N
1f400247-0139-4e77-b4d3-ec909b0deff7	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.05	-0.06	-0.04	2020-04-22 18:59:51.731143	\N	\N
a0532674-9b12-4f42-a3c2-06ddbfd73426	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.01	0.0	0.18	2020-04-22 18:59:52.841017	\N	\N
42e798d5-24da-4a4e-820e-9720bc6b9be0	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.02	0.02	0.21	2020-04-22 18:59:53.973294	\N	\N
0098135a-22d0-4e6d-a05f-32305b3d46cb	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.08	0.01	0.11	2020-04-22 18:59:55.057488	\N	\N
409b96f4-2765-4f30-9c8e-b8a3cef03c2c	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.04	-0.01	0.05	2020-04-22 18:59:56.16744	\N	\N
5aa64bca-d959-48e8-9bc8-d777b113bf7b	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.05	-0.08	0.17	2020-04-22 18:59:57.277216	\N	\N
88d5d097-44a4-4f42-b9cd-18e4a9c88f8f	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.08	-0.03	0.11	2020-04-22 18:59:58.189161	\N	\N
520f8a9a-3c2a-4e91-9675-9bb4355d05ff	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.0	-0.1	0.06	2020-04-22 18:59:59.513716	\N	\N
d9c07c7f-87a4-4f7e-95a1-a121b853b3d5	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.07	0.03	0.16	2020-04-22 19:00:00.613307	\N	\N
12e5b84c-4843-48f0-840e-8875a351fda4	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.07	0.03	0.05	2020-04-22 19:00:01.723225	\N	\N
352a5a4a-359e-490c-b7c2-b08993354e3c	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	0.08	0.1	2020-04-22 19:00:02.832782	\N	\N
17e7278f-ff93-43af-a0a9-dba341e41278	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.08	0.01	0.11	2020-04-22 19:00:03.943084	\N	\N
cce87eb8-ba13-45e4-8257-62baf728cfe9	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	0.04	0.12	2020-04-22 19:00:05.052897	\N	\N
d90674d7-e6d3-4999-a787-84653354ef9a	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.0	-0.08	0.18	2020-04-22 19:00:06.172213	\N	\N
3ed12165-762d-4887-869e-6f54634b8e9b	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.01	0.11	0.1	2020-04-22 19:00:07.283417	\N	\N
dd347c93-b635-470e-9890-0f846da32963	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.08	-0.04	0.12	2020-04-22 19:00:08.440811	\N	\N
32c696a9-dc94-4ad3-8fa1-135c4de05822	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.08	-0.01	0.11	2020-04-22 19:00:09.504725	\N	\N
2e171fa7-52ac-42dd-9965-c1ea21a27c37	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.02	-0.02	0.27	2020-04-22 19:00:10.616299	\N	\N
54080f30-9d64-4232-9293-2b9ff9893a21	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.02	-0.14	0.14	2020-04-22 19:00:11.722343	\N	\N
63811fd6-95a5-4a23-84f3-26af18f15198	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.08	0.03	0.11	2020-04-22 19:00:12.834625	\N	\N
e07beb4b-82d7-45a3-a5b1-42c0463be660	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	0.14	0.18	2020-04-22 19:00:13.932527	\N	\N
201f8c69-a9c5-48a5-885e-9799e74d492b	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.02	-0.07	0.12	2020-04-22 19:00:15.042659	\N	\N
7df8cb98-2957-406d-ba9b-1b799158d606	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.08	-0.01	0.11	2020-04-22 19:00:16.152032	\N	\N
44fd58d3-130a-4cb8-8b2c-05254c0b994c	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.01	-0.1	0.17	2020-04-22 19:00:18.375589	\N	\N
0c2aa5e6-3f5b-4e53-8736-13018c74c3c2	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.02	0.0	0.11	2020-04-22 19:00:18.804029	\N	\N
4e84c74e-56c5-468c-a495-7ce61e2b24bd	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	-0.06	0.14	2020-04-22 19:00:19.485583	\N	\N
b9be00dc-d8f4-40f7-bd44-4b63b2826c5a	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.01	-0.02	0.18	2020-04-22 19:00:21.022985	\N	\N
4be8d6aa-8850-4cf6-972e-c13eeca0d1d6	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.06	-0.02	0.11	2020-04-22 19:00:21.69243	\N	\N
369feef3-5988-4d83-9999-496b1e2c6424	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.03	0.02	0.24	2020-04-22 19:00:22.804664	\N	\N
9e6c3846-2179-4bf3-a4c6-7d113914619c	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.05	-0.02	0.21	2020-04-22 19:00:23.916025	\N	\N
9224bd03-1440-4384-ba4f-293213cbda5d	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	-0.13	0.14	2020-04-22 19:00:25.023408	\N	\N
ce0354bf-b274-45c5-a761-2b6efb4cdc71	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.01	-0.01	0.03	2020-04-22 19:00:26.123617	\N	\N
408b140c-ece1-4606-9c04-a5ea95a23736	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.08	-0.14	0.13	2020-04-22 19:00:27.232811	\N	\N
aaf68c27-ec47-4d26-a993-937e5475405e	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.06	0.05	0.12	2020-04-22 19:00:28.406898	\N	\N
36347138-4d8c-4f6e-b0c7-3a65570764bf	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.05	-0.08	0.18	2020-04-22 19:00:29.282882	\N	\N
bb7a5668-d9d2-4e7f-941d-ed34364daff6	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.12	-0.01	0.17	2020-04-22 19:00:30.565566	\N	\N
bebac886-bc7c-4fde-88f4-f561bf32d49c	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	-0.02	0.07	2020-04-22 19:00:31.67731	\N	\N
f9c381d8-666c-414b-ad3a-1268dd23b91e	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.08	-0.01	0.14	2020-04-22 19:00:32.783197	\N	\N
6a1b6eff-408c-4d9f-b59b-7aca94ab537a	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.03	0.02	0.22	2020-04-22 19:00:33.90066	\N	\N
5fa52d02-a215-4b7c-8bd1-6c0111508bee	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.01	0.06	0.08	2020-04-22 19:00:35.003521	\N	\N
5c8ccceb-8b4e-4cce-a175-3c28df37179d	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	-0.1	0.13	2020-04-22 19:00:36.113605	\N	\N
d5788766-a5c2-412b-8c30-d065b005675b	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.05	-0.01	0.17	2020-04-22 19:00:37.224243	\N	\N
417e3e0e-fa02-46af-b00d-b196e63465d5	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.07	-0.01	0.11	2020-04-22 19:00:38.322957	\N	\N
542abe94-29cd-49e6-ad15-b1578ce9cf92	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.01	0.03	0.15	2020-04-22 19:00:40.02235	\N	\N
7c9d5e82-c576-4a87-b9fa-6f4d242b5615	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.09	-0.05	0.1	2020-04-22 19:00:40.542215	\N	\N
b2bc9105-4629-42e6-ae4e-fc4607d33630	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.05	0.02	0.26	2020-04-22 19:00:41.682083	\N	\N
96ad1d0f-9782-4139-890f-74f2c980eb7b	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.05	0.1	0.16	2020-04-22 19:00:42.763491	\N	\N
6fc7ba12-0de5-4a97-bc6c-6b7ac0a35ad6	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.05	0.03	0.08	2020-04-22 19:00:43.873146	\N	\N
4d33bc0f-e839-4f2f-b867-7e90bbeb8980	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.07	-0.08	0.11	2020-04-22 19:00:44.983961	\N	\N
90d15fd8-8455-4ce4-a6d2-13be9528b153	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.01	0.01	0.08	2020-04-22 19:00:46.092871	\N	\N
eca80e6a-a325-4b16-922c-e4ce350393c6	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.05	0.02	0.14	2020-04-22 19:00:47.20592	\N	\N
a2de1c1d-c2f9-492e-8d6c-bef6d222a5f4	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.05	0.05	0.11	2020-04-22 19:00:48.313127	\N	\N
fed90576-30c3-46d4-812d-432d550548c7	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.1	0.03	0.18	2020-04-22 19:00:49.422959	\N	\N
ad068a0b-7bce-479d-8444-b3a7a64be201	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.08	-0.02	0.29	2020-04-22 19:00:50.534617	\N	\N
abb14d39-9c75-4772-8e71-408040a7a82a	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-16.51	24.94	-65.61	2020-04-22 19:00:53.123908	\N	\N
c2ddf79b-5c79-457a-b17b-dbfaa4bf20e6	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	15.91	-52.71	-75.07	2020-04-22 19:00:53.55274	\N	\N
53936ffe-927a-4b50-9cba-6536cb2fd40c	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-2.77	-73.39	0.88	2020-04-22 19:00:53.767194	\N	\N
850a506e-eea9-4747-8026-a581a8131b23	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-7.37	56.86	36.54	2020-04-22 19:00:55.466699	\N	\N
8530887c-0d88-4466-83b8-3b9cf73280ae	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	4.72	-46.62	144.1	2020-04-22 19:00:56.071856	\N	\N
40782c71-5972-4f61-9a5c-b7200d9280f0	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	127.08	-30.45	63.72	2020-04-22 19:00:57.211166	\N	\N
ce2ded7a-ca43-4b9a-96c8-be3dcfc12194	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.95	24.74	14.28	2020-04-22 19:00:58.344208	\N	\N
14b739b2-fa07-40f6-9011-b052e185b0f4	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-7.97	1.82	1.37	2020-04-22 19:00:59.402381	\N	\N
52016da4-c0c3-470f-a396-64cc7a8ea9c6	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	2.82	-16.18	24.97	2020-04-22 19:01:00.5135	\N	\N
04ae25c6-5c80-4762-8f5f-36f90e2a2b2f	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	2.84	37.29	-28.71	2020-04-22 19:01:01.626668	\N	\N
940482e3-5ffe-4301-b954-3bb3b383a7cc	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-24.64	-14.02	16.44	2020-04-22 19:01:02.732801	\N	\N
03894c1e-2dd3-417e-900a-536cc2ccba31	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	51.5	-14.61	50.95	2020-04-22 19:01:03.842462	\N	\N
97589d71-1895-44ad-a4be-a18b49756a98	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.01	-0.02	0.05	2020-04-22 19:01:04.95503	\N	\N
833a2e0f-5eb4-42af-b923-b3cf71e532e2	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.05	-0.02	0.17	2020-04-22 19:01:06.053251	\N	\N
234fcd18-dbe0-4c24-92c6-8b8142778451	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.01	0.02	0.17	2020-04-22 19:01:07.171888	\N	\N
8579e950-00f3-4098-bc55-63e661fe1f41	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.05	-0.05	0.1	2020-04-22 19:01:08.277052	\N	\N
75b23c43-e25e-45f1-a031-2e47df7859f7	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.04	-0.1	0.09	2020-04-22 19:01:09.383329	\N	\N
067800b9-9042-4c80-9bc1-dc5377953bcf	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.01	0.02	0.02	2020-04-22 19:01:11.164229	\N	\N
71e360da-792a-437d-9c92-eb8d3eb1d3f6	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.03	-0.08	0.14	2020-04-22 19:01:11.603494	\N	\N
4401b039-9244-4a92-b52c-d23f620ad4c3	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.01	0.0	0.05	2020-04-22 19:01:12.713629	\N	\N
b215c7d1-be97-48d6-bd71-687d9d516e3b	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	-0.03	0.07	2020-04-22 19:01:13.824279	\N	\N
74568430-ac5e-4468-9f3a-cd3b69dd48c4	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.05	0.06	0.18	2020-04-22 19:01:14.970835	\N	\N
2cf52d33-9fb8-4752-b701-37f1b42626b7	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.08	0.11	0.06	2020-04-22 19:01:16.043214	\N	\N
bbc3959f-c1d1-44c2-bb37-021394541854	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.02	-0.08	0.09	2020-04-22 19:01:17.153051	\N	\N
a9ba17b5-3ee1-4933-ac13-bdc24cf069d0	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	-0.06	0.2	2020-04-22 19:01:18.252576	\N	\N
7de7ed1b-53f6-4113-845b-cb15ab302ed6	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.05	0.05	0.01	2020-04-22 19:01:19.363455	\N	\N
fbb32549-95e1-4882-b48a-4c5f2af75ce7	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.09	-0.04	0.17	2020-04-22 19:01:20.472965	\N	\N
f1fe2f9c-f783-4fa6-bbf5-711c453a669d	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.08	-0.05	0.15	2020-04-22 19:01:21.582894	\N	\N
80f0d869-48ae-4aff-9c88-f0f7932a1c98	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.03	-0.02	0.2	2020-04-22 19:01:22.721399	\N	\N
002f8843-0330-44ee-96b9-14408145f692	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	-0.02	0.18	2020-04-22 19:01:23.803215	\N	\N
182dc1d0-4f91-48c1-9510-10a4888ae244	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.02	0.06	0.11	2020-04-22 19:01:24.913008	\N	\N
8a140017-2fcb-43f4-a82c-77487cc17c7b	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.04	-0.13	0.0	2020-04-22 19:01:26.022686	\N	\N
227d42c4-c42c-46c3-a428-6419f6372df8	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.08	-0.02	0.19	2020-04-22 19:01:27.133012	\N	\N
e0c6d7b6-9e85-4d26-8c39-b3b94fa97634	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.01	-0.11	0.03	2020-04-22 19:01:28.242914	\N	\N
b38fda01-d1c8-4765-9914-d1b5b909043a	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.05	0.03	0.18	2020-04-22 19:01:29.352529	\N	\N
95f9fbcb-048f-467e-8676-ef671947b03a	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.08	-0.01	0.11	2020-04-22 19:01:30.47076	\N	\N
2046b414-ffbb-45c5-bdb7-de2ad8db3fc1	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	-0.01	0.05	2020-04-22 19:01:31.564711	\N	\N
11a6d407-e1bf-4ca2-b9eb-42100c5bc2ae	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.05	-0.07	0.08	2020-04-22 19:01:32.67439	\N	\N
213ff8df-4230-4d68-9f40-d67f98ee0268	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.04	-0.01	0.08	2020-04-22 19:01:33.787306	\N	\N
8b695358-4cab-4e0d-9999-50f888947f4f	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.03	0.02	0.01	2020-04-22 19:01:34.892221	\N	\N
c84d8fa4-f1ce-4a77-b9f8-7f8c56fbca1c	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.05	0.1	0.13	2020-04-22 19:01:36.004053	\N	\N
14746b2c-9142-461a-b34c-4d401251d8b7	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.02	0.17	0.24	2020-04-22 19:01:37.115341	\N	\N
94fc7bcf-c061-4809-9bb4-351151e5f2fa	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.05	-0.11	0.12	2020-04-22 19:01:38.340796	\N	\N
c15f1e15-312b-4619-935e-a85461dbf1c4	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.03	-0.01	0.14	2020-04-22 19:01:39.332471	\N	\N
a44d077e-9448-4c81-bc90-9f4c20e328c2	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	0.07	0.19	2020-04-22 19:01:40.443424	\N	\N
12d97821-e6ed-4c0b-942c-757a834bb923	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	0.02	0.04	2020-04-22 19:01:41.553911	\N	\N
a821541b-d583-4143-8106-6d7d8ebaa4c5	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.14	-0.06	0.24	2020-04-22 19:01:42.664363	\N	\N
09a704b8-f395-4ba4-945a-356bbdf6d27d	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.06	0.1	0.14	2020-04-22 19:01:43.762864	\N	\N
25c9a5b1-6b7a-4645-b5d1-7e044d92bfee	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.06	-0.04	0.18	2020-04-22 19:01:44.872164	\N	\N
d605fa88-2d22-402f-b0b5-5fca84caf87e	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.02	0.12	0.21	2020-04-22 19:01:45.982921	\N	\N
b2169970-2eb9-4a32-816d-fe2610ab9285	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	-0.02	0.1	2020-04-22 19:01:47.092303	\N	\N
e2c2a165-8fda-4a4c-8fd9-ffcab1f0cc94	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.06	0.0	0.27	2020-04-22 19:01:48.220388	\N	\N
81d5ac8d-0313-415a-a439-5bd31499e1a5	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.0	-0.06	0.24	2020-04-22 19:01:49.312593	\N	\N
7c5d0cae-fe1d-4566-8afd-91137bae6a27	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.02	0.02	0.08	2020-04-22 19:01:50.425419	\N	\N
be4d86f0-10a5-4352-a79d-68f7e7bdbfef	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.05	0.08	0.1	2020-04-22 19:01:51.533988	\N	\N
8a2e5854-d4fa-466f-953e-db9d0ddf206c	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	-0.02	0.05	2020-04-22 19:01:52.644662	\N	\N
dc2c2791-7eee-4ace-935e-92a44f868a0a	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.08	-0.01	0.05	2020-04-22 19:01:53.753865	\N	\N
8ff70dc0-9842-47bc-b404-03f435df9f31	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.1	-0.03	0.11	2020-04-22 19:01:54.912351	\N	\N
6bd764a3-697d-4da0-a714-6933dcb2f3b4	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.11	0.0	0.2	2020-04-22 19:01:55.963219	\N	\N
bf507737-7681-46c8-b4b2-fdfca4d2c73b	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.03	-0.02	0.09	2020-04-22 19:01:57.073136	\N	\N
6e3b778b-b1be-492e-ba4e-820e7e93792e	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.02	-0.05	0.16	2020-04-22 19:01:58.183264	\N	\N
e05b5705-48f0-46ca-b736-de19b4c14577	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.08	0.05	0.11	2020-04-22 19:01:59.293812	\N	\N
e0e24700-9bc5-4847-b999-087e18213882	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	-0.08	-0.04	0.13	2020-04-22 19:02:00.54858	\N	\N
81dd6481-f92f-4bb8-92ba-e6b8c84baf04	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.04	0.0	0.2	2020-04-22 19:02:01.513141	\N	\N
77263b09-3fc0-4ea4-8ee9-c5a9a4baa84a	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.08	-0.07	0.01	2020-04-22 19:02:02.625924	\N	\N
397d1b8a-3f21-4ba9-8dce-494c5ccaa388	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.0	-0.05	0.16	2020-04-22 19:02:03.752052	\N	\N
93135385-51f8-4aa6-bc9c-ed7eab8e479f	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.0	-0.05	0.18	2020-04-22 19:02:04.842548	\N	\N
ef616bfa-3b44-4863-8231-882bc9590bfe	7ebdf3c0-502d-44de-a26d-7bb0f3cab467	patient gyroscope data	2c083db9-d0ad-47e3-81b9-4f8990734037	0.06	0.05	0.04	2020-04-22 19:02:05.952701	\N	\N
\.


--
-- TOC entry 3926 (class 0 OID 25308)
-- Dependencies: 202
-- Data for Name: medication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medication (id, patient_id, device_id, scheduled_time, response, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3927 (class 0 OID 25313)
-- Dependencies: 203
-- Data for Name: personal_check_in; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_check_in (id, patient_id, category, value, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3928 (class 0 OID 25321)
-- Dependencies: 204
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test (id, test_id, description, patient_id, test_score, created_at, updated_at, deleted_at) FROM stdin;
8332633d-b974-4467-87e1-bbde1896f06d	9655c909-642a-4030-81a9-b9e919ae295e	short-term memory local test	0221e3b5-6123-4eef-b1e0-6c65e2265920	100	2020-04-21 01:31:54.024852	\N	\N
7f230b48-b1a9-4661-9c4f-5b014733e9b6	745e006f-4598-4586-86f1-c6a75ae421a1	short-term memory local test	427416a0-65e5-4134-bc72-51cc0ac4d4cd	100	2020-04-21 01:32:25.916774	\N	\N
bfbdad8e-1648-4ac3-bd7a-71ffb11c6bfd	7b2aa5e7-2c36-4ce5-bb9b-27b90576ff67	short-term memory local test	b2b98f5a-880c-4dd4-97ba-2858869cc4b8	100	2020-04-21 01:32:35.960501	\N	\N
062393b7-4f9b-49ca-a2da-31e02e2b2c19	5ad50e86-1d13-46f4-9acf-56f1d50a9a4b	short-term memory local test	745ec135-8d0a-46d8-b743-bce8eb9414b3	100	2020-04-21 01:32:52.597245	\N	\N
f68b4167-81eb-4249-9cc4-8a031049a712	8bc20f83-ecb8-494a-9ad3-4594d7758cd9	short-term memory local test	212ffc63-e97d-469d-9c0f-b9ad714896a5	100	2020-04-21 01:33:31.083041	\N	\N
\.


--
-- TOC entry 3929 (class 0 OID 25349)
-- Dependencies: 205
-- Data for Name: trajectories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trajectories (id, description, patient_id, x, y, z, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3930 (class 0 OID 25357)
-- Dependencies: 206
-- Data for Name: tremor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tremor (id, description, patient_id, stationary, severity, displacement, frequency, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3779 (class 2606 OID 25327)
-- Name: accels accels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accels
    ADD CONSTRAINT accels_pkey PRIMARY KEY (id);


--
-- TOC entry 3783 (class 2606 OID 25329)
-- Name: biometric biometric_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biometric
    ADD CONSTRAINT biometric_pkey PRIMARY KEY (id);


--
-- TOC entry 3789 (class 2606 OID 25331)
-- Name: gyros gyros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gyros
    ADD CONSTRAINT gyros_pkey PRIMARY KEY (id);


--
-- TOC entry 3797 (class 2606 OID 25333)
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- TOC entry 3799 (class 2606 OID 25335)
-- Name: test unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT "unique" UNIQUE (id);


--
-- TOC entry 3791 (class 2606 OID 25337)
-- Name: gyros unique_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gyros
    ADD CONSTRAINT unique_id UNIQUE (id);


--
-- TOC entry 3785 (class 2606 OID 25339)
-- Name: biometric unique_id_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biometric
    ADD CONSTRAINT unique_id_constraint UNIQUE (id);


--
-- TOC entry 3781 (class 2606 OID 25341)
-- Name: accels unique_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accels
    ADD CONSTRAINT unique_pkey UNIQUE (id);


--
-- TOC entry 3787 (class 2606 OID 25343)
-- Name: emotion unique_pkey_emotion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emotion
    ADD CONSTRAINT unique_pkey_emotion UNIQUE (id);


--
-- TOC entry 3793 (class 2606 OID 25345)
-- Name: medication unique_pkey_medication; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medication
    ADD CONSTRAINT unique_pkey_medication UNIQUE (id);


--
-- TOC entry 3795 (class 2606 OID 25347)
-- Name: personal_check_in unique_pkey_personal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_check_in
    ADD CONSTRAINT unique_pkey_personal UNIQUE (id);


--
-- TOC entry 3936 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2020-04-24 15:56:46 EDT

--
-- PostgreSQL database dump complete
--

