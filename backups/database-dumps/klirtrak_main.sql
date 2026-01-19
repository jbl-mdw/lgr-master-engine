--
-- PostgreSQL database dump
--

\restrict PDglxuWeMgiiGKDMoRHk0ycCWAFlCevRAH86WPctOcGR7D1pXN9LBiceXUT0N86

-- Dumped from database version 15.15
-- Dumped by pg_dump version 15.15

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
-- Name: outbound_queue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outbound_queue (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    phone_number text NOT NULL,
    status text DEFAULT 'pending'::text,
    call_sid text,
    outcome text,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.outbound_queue OWNER TO postgres;

--
-- Data for Name: outbound_queue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.outbound_queue (id, phone_number, status, call_sid, outcome, created_at) FROM stdin;
\.


--
-- Name: outbound_queue outbound_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outbound_queue
    ADD CONSTRAINT outbound_queue_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict PDglxuWeMgiiGKDMoRHk0ycCWAFlCevRAH86WPctOcGR7D1pXN9LBiceXUT0N86

