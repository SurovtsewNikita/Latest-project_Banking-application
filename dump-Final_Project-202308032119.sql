--
-- PostgreSQL database dump
--

-- Dumped from database version 8.4.22
-- Dumped by pg_dump version 14.2

-- Started on 2023-08-03 21:19:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET row_security = off;

DROP DATABASE "postgres";
--
-- TOC entry 1808 (class 1262 OID 82620)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "postgres" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "postgres" OWNER TO postgres;

\connect "postgres"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 1809 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 141 (class 1259 OID 82628)
-- Name: balance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.balance (
    id bigint NOT NULL,
    balance bigint NOT NULL
);


ALTER TABLE public.balance OWNER TO postgres;

--
-- TOC entry 140 (class 1259 OID 82626)
-- Name: balance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.balance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.balance_id_seq OWNER TO postgres;

--
-- TOC entry 1811 (class 0 OID 0)
-- Dependencies: 140
-- Name: balance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.balance_id_seq OWNED BY public.balance.id;


--
-- TOC entry 143 (class 1259 OID 82799)
-- Name: operation_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operation_list (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    operation_type_number integer NOT NULL,
    operation_type_name character varying NOT NULL,
    operation_time timestamp with time zone NOT NULL
);


ALTER TABLE public.operation_list OWNER TO postgres;

--
-- TOC entry 142 (class 1259 OID 82797)
-- Name: operation_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.operation_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operation_list_id_seq OWNER TO postgres;

--
-- TOC entry 1812 (class 0 OID 0)
-- Dependencies: 142
-- Name: operation_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.operation_list_id_seq OWNED BY public.operation_list.id;


--
-- TOC entry 145 (class 1259 OID 82815)
-- Name: transfer_operations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transfer_operations (
    id bigint NOT NULL,
    usersenderid bigint NOT NULL,
    userreceiverid bigint NOT NULL,
    transfermoney bigint NOT NULL,
    transfer_operation_time timestamp with time zone NOT NULL
);


ALTER TABLE public.transfer_operations OWNER TO postgres;

--
-- TOC entry 144 (class 1259 OID 82813)
-- Name: transfer_operations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transfer_operations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transfer_operations_id_seq OWNER TO postgres;

--
-- TOC entry 1813 (class 0 OID 0)
-- Dependencies: 144
-- Name: transfer_operations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transfer_operations_id_seq OWNED BY public.transfer_operations.id;


--
-- TOC entry 1699 (class 2604 OID 82631)
-- Name: balance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.balance ALTER COLUMN id SET DEFAULT nextval('public.balance_id_seq'::regclass);


--
-- TOC entry 1700 (class 2604 OID 82802)
-- Name: operation_list id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation_list ALTER COLUMN id SET DEFAULT nextval('public.operation_list_id_seq'::regclass);


--
-- TOC entry 1701 (class 2604 OID 82818)
-- Name: transfer_operations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_operations ALTER COLUMN id SET DEFAULT nextval('public.transfer_operations_id_seq'::regclass);


--
-- TOC entry 1798 (class 0 OID 82628)
-- Dependencies: 141
-- Data for Name: balance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.balance (id, balance) FROM stdin;
3	1000
5	12345
2	20050
1	2300
4	9845
\.


--
-- TOC entry 1800 (class 0 OID 82799)
-- Dependencies: 143
-- Data for Name: operation_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operation_list (id, user_id, operation_type_number, operation_type_name, operation_time) FROM stdin;
\.


--
-- TOC entry 1802 (class 0 OID 82815)
-- Dependencies: 145
-- Data for Name: transfer_operations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transfer_operations (id, usersenderid, userreceiverid, transfermoney, transfer_operation_time) FROM stdin;
\.


--
-- TOC entry 1814 (class 0 OID 0)
-- Dependencies: 140
-- Name: balance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.balance_id_seq', 5, true);


--
-- TOC entry 1815 (class 0 OID 0)
-- Dependencies: 142
-- Name: operation_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.operation_list_id_seq', 70, true);


--
-- TOC entry 1816 (class 0 OID 0)
-- Dependencies: 144
-- Name: transfer_operations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transfer_operations_id_seq', 4, true);


--
-- TOC entry 1705 (class 2606 OID 82807)
-- Name: operation_list operation_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation_list
    ADD CONSTRAINT operation_list_pkey PRIMARY KEY (id);


--
-- TOC entry 1703 (class 2606 OID 82633)
-- Name: balance pk_balance; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.balance
    ADD CONSTRAINT pk_balance PRIMARY KEY (id);


--
-- TOC entry 1707 (class 2606 OID 82820)
-- Name: transfer_operations transfer_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_operations
    ADD CONSTRAINT transfer_operations_pkey PRIMARY KEY (id);


--
-- TOC entry 1708 (class 2606 OID 82808)
-- Name: operation_list operation_list_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation_list
    ADD CONSTRAINT operation_list_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.balance(id);


--
-- TOC entry 1710 (class 2606 OID 82826)
-- Name: transfer_operations transfer_operations_userreceiverid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_operations
    ADD CONSTRAINT transfer_operations_userreceiverid_fkey FOREIGN KEY (userreceiverid) REFERENCES public.balance(id);


--
-- TOC entry 1709 (class 2606 OID 82821)
-- Name: transfer_operations transfer_operations_usersenderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_operations
    ADD CONSTRAINT transfer_operations_usersenderid_fkey FOREIGN KEY (usersenderid) REFERENCES public.balance(id);


--
-- TOC entry 1810 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-08-03 21:19:16

--
-- PostgreSQL database dump complete
--

