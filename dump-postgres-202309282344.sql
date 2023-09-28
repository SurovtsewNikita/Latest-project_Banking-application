--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-09-28 23:44:54

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16595)
-- Name: balance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.balance (
    id integer NOT NULL,
    balance integer NOT NULL
);


ALTER TABLE public.balance OWNER TO postgres;

--
-- TOC entry 4778 (class 0 OID 16595)
-- Dependencies: 216
-- Data for Name: balance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.balance (id, balance) FROM stdin;
1	1000
2	500
3	750
4	1200
5	300
\.


--
-- TOC entry 4634 (class 2606 OID 16599)
-- Name: balance balance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.balance
    ADD CONSTRAINT balance_pkey PRIMARY KEY (id);


-- Completed on 2023-09-28 23:44:54

--
-- PostgreSQL database dump complete
--

