--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE student;
ALTER ROLE student WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:HDDayzrbfHLj6tzE6700zQ==$vKGaMrHfd4caz/9S6xNvl+Gb6uZnVWcPCeDOGuPlqKE=:eEG6kU7I9x+7qZ1CJsLiOpuhqMjJqsrJ7TX3fPXEDVM=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)

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
-- PostgreSQL database dump complete
--

--
-- Database "group2db" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)

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
-- Name: group2db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE group2db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE group2db OWNER TO postgres;

\connect group2db

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
-- Name: assignments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assignments (
    faculty_id integer NOT NULL,
    committee_id integer,
    start_date character varying,
    end_date character varying,
    remarks character varying
);


ALTER TABLE public.assignments OWNER TO postgres;

--
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    prefix character varying NOT NULL,
    number integer,
    coursedirectorid integer,
    remarks character varying
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- Name: faculty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculty (
    id integer NOT NULL,
    honorific character varying,
    mi character varying,
    last character varying,
    email character varying,
    phone character varying,
    office character varying,
    research character varying,
    rank character varying,
    remarks character varying,
    employed character varying
);


ALTER TABLE public.faculty OWNER TO postgres;

--
-- Name: faculty2; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.faculty2 (
    id integer,
    honorific character varying,
    first character varying,
    mi character varying,
    last character varying,
    email character varying,
    phone character varying,
    office character varying,
    research character varying,
    rank character varying,
    remarks character varying,
    employed character varying
);


ALTER TABLE public.faculty2 OWNER TO student;

--
-- Name: names; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.names (
    id integer NOT NULL,
    committee_name character varying,
    remarks character varying
);


ALTER TABLE public.names OWNER TO postgres;

--
-- Name: prerequisites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prerequisites (
    prefix character varying NOT NULL,
    number integer,
    pc_prefix character varying,
    pc_number character varying,
    pc_code character varying
);


ALTER TABLE public.prerequisites OWNER TO postgres;

--
-- Name: schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedule (
    year integer NOT NULL,
    semester character varying,
    prefix character varying,
    number integer,
    section integer,
    crn integer,
    enrollment integer,
    instructor integer,
    days character varying,
    begintime integer,
    endtime integer,
    remarks character varying
);


ALTER TABLE public.schedule OWNER TO postgres;

--
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assignments (faculty_id, committee_id, start_date, end_date, remarks) FROM stdin;
\.


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors (prefix, number, coursedirectorid, remarks) FROM stdin;
\.


--
-- Data for Name: faculty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faculty (id, honorific, mi, last, email, phone, office, research, rank, remarks, employed) FROM stdin;
\.


--
-- Data for Name: faculty2; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.faculty2 (id, honorific, first, mi, last, email, phone, office, research, rank, remarks, employed) FROM stdin;
1	Dr.	Karl	\N	Arahamson	abrahamsonk@ecu.edu	252-328-9689	Sci-Tech C113	Programming Languages	Associate Professor	Undergraduate Program Director	Yes
2	Ms.	Sheaneatha	D	Applewhite-Hopkins	applewhitehopkins16@ecu.edu	252-328-9680	Sci-Tech C107	\N	Administrative Assistant	\N	Yes
3	Dr.	Maral	\N	Azizi	azizim19@ecu.edu	252-328-9680	Sci-Tech C108	Software Engineering, Information Retrieval, Database Design, Machine Learning	Assistant Professor	\N	Yes
4	Dr.	Qin	\N	Ding	dingq@ecu.edu	252-328-9686	Sci-Tech C118	Databases, Data mining, Bioinformatics	Associate Professor	\N	Yes
5	Dr.	Krishnan	\N	Gopal	gopal@ecu.edu	252-328-9688	Sci-Tech C118	Combinatorics, Cryptography and Information Security, Distributed Computing, Algorithms and Theoretical Computer Science	Associate Professor	\N	Yes
6	Dr.	Venkat	N	Gudivada	gudivadav15@ecu.edu	252-328-9680	Sci-Tech C-107	Data Management/Analytics, Information Retrieval/Systems, Natural Language Processing, Computer Vision, Personalized Learning	Professor	Department Chair	Yes
7	Dr.	Nick	\N	Herndon	herndonn19@ecu.edu	252-328-9696	Sci-Tech C108	Artificial Intelligence, Machine Learning, Data Science, Big Data Analytics, and Computational Biology	Assistant Professor	\N	Yes
8	Dr.	Mark	\N	Hills	hillsma@ecu.edu	252-328-9692	Sci-Tech C110	Program Analysis, Programming Language Implementation, Domain-Specific Languages, Software Modeling and Verification, Software Analytics, Formal Semantics of Programming Languages	Associate Professor	Graduate Program Director	Yes
9	Mr.	Bobby	\N	Hoggard	hoggardr@ecu.edu	252-328-9695	Sci-Tech C105	Cloud Computing, Computer Architecture, Web Applications, Computer Science Education	Instructor	\N	Yes
10	Mr.	John	\N	Jones	jonesjo@ecu.edu	252-328-9606	Sci-Tech 109	Data Structures and Algorithms, Digital Electronics, Software Construction, Networking, Data Center Virtualization, Distributed Computing, Storage Management, Operating Systems	Adjunct Instructor	\N	Yes
11	Dr.	Jonathan	A	Saddler	saddlerj20@ecu.edu	252-328-9687	Sci-Tech C117	Software Engineering	Teaching Assistant Professor	\N	Yes
12	Dr.	Kamran	\N	Sartipi	sartipik16@ecu.edu	252-328-9694	Sci-Tech C122	Software Engineering, Knowledge Engineering and Data Mining, Cyber Security and Data Privacy, User-Behavior based Access Control, Medical & Health Systems Integration and Informatics, Service Intelligence for Cloud, Decision Support Systems	Assistant Professor	\N	Yes
13	Dr.	Ronnie	\N	Smith	smithron@cs.ecu.edu	252-328-9687	Sci-Tech C117	Artificial Intelligence, Spoken Natural Languages	Research Associate Professor	\N	No
14	Mr.	Joel	\N	Sweatte	sweattej@ecu.edu	252-328-9439	Sci-Tech C112	Data Center Virtualization, Cloud Computing, Mainframe Platform Computing, Storage Management	Instructor	\N	Yes
15	Dr.	Nasseh	\N	Tabrizi	tabrizim@ecu.edu	252-328-9691	Sci-Tech C112	Big Data Analytics, Cloud Computing, Computer Vision, Software Requirement Engineering, Information Retrieval, Virtual Reality, Machine Learning, Computer Science and Software Engineering Education	Professor	\N	Yes
16	Dr.	Rui	\N	Wu	wur18@ecu.edu	252-328-9682	Sci-Tech C107	Data Processing and Visualization, Interdisciplinary Research	Assistant Professor	\N	Yes
17	Dr.	Patyi	\N	Imre	patyii@ecu.edu	252-328-6461	\N	\N	Associate Professor	No	\N
18	Ms.	Sumati	R	Kulkarni	\N	\N	\N	\N	Teaching Assistant	\N	No
19	Ms.	Logan	G	Childers	\N	\N	\N	\N	Teaching Assistant	\N	No
20	Mr.	Gregory	\N	Knight	\N	\N	\N	\N	Adjunct Instructor	\N	No
21	Dr.	 Sergiy	\N	Vilkomir	\N	\N	\N	Software Testing	Associate Professor	\N	No
22	Dr.	Ding	\N	Junhua	\N	\N	\N	Software Testing, Machine Learning	Associate Professor	\N	No
23	Mr.	David	M	Anderson	\N	\N	\N	\N	Teaching Assistant	\N	No
24	Mr.	Aryan	\N	Azimzadeh	\N	\N	\N	\N	Teaching Assistant	\N	No
25	Mr.	Shawn	K	Braddy	\N	\N	\N	\N	Teaching Assistant	\N	No
26	Dr.	Masao	\N	Kishore	\N	\N	\N	\N	Associate Professor	\N	No
27	Mr.	David	R	Hoffman	\N	\N	\N	\N	Teaching Assistant	\N	No
\.


--
-- Data for Name: names; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.names (id, committee_name, remarks) FROM stdin;
\.


--
-- Data for Name: prerequisites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prerequisites (prefix, number, pc_prefix, pc_number, pc_code) FROM stdin;
\.


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schedule (year, semester, prefix, number, section, crn, enrollment, instructor, days, begintime, endtime, remarks) FROM stdin;
\.


--
-- Name: assignments assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (faculty_id);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (prefix);


--
-- Name: faculty faculty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT faculty_pkey PRIMARY KEY (id);


--
-- Name: names names_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.names
    ADD CONSTRAINT names_pkey PRIMARY KEY (id);


--
-- Name: prerequisites prerequisites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prerequisites
    ADD CONSTRAINT prerequisites_pkey PRIMARY KEY (prefix);


--
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (year);


--
-- PostgreSQL database dump complete
--

--
-- Database "groupx" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)

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
-- Name: groupx; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE groupx WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE groupx OWNER TO postgres;

\connect groupx

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
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, email) FROM stdin;
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: DATABASE groupx; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE groupx TO student;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)

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
-- Name: faculty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculty (
    name character varying(255),
    rank character varying(255),
    email character varying(255),
    phone character varying(255),
    office character varying(255),
    researchinterest character varying(255),
    remarks character varying(255)
);


ALTER TABLE public.faculty OWNER TO postgres;

--
-- Data for Name: faculty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faculty (name, rank, email, phone, office, researchinterest, remarks) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

