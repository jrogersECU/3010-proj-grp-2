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
CREATE ROLE webuser1;
ALTER ROLE webuser1 WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:KzEk4NH4B9BrmCk54uCtXQ==$1VbJHoLDBOocCjv4DcSqiEy2bW2FMBMYZMkjpotnxMA=:aKfa85j8iQVCjU01hg+fKEiHGZMzZHfqnE4vloyGmtk=';






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

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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

CREATE DATABASE group2db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


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
-- Name: committee_assignments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.committee_assignments (
    faculty_id integer,
    committee_id integer,
    start character varying,
    end_date character varying,
    remarks character varying
);


ALTER TABLE public.committee_assignments OWNER TO postgres;

--
-- Name: committee_names; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.committee_names (
    id integer,
    committee_name character varying,
    remarks character varying
);


ALTER TABLE public.committee_names OWNER TO postgres;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: webuser1
--

CREATE TABLE public.courses (
    prefix character varying,
    number integer,
    title character varying,
    gu character varying,
    ch integer,
    frequency integer,
    active character varying,
    description character varying,
    remarks character varying
);


ALTER TABLE public.courses OWNER TO webuser1;

--
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    prefix character varying,
    number integer,
    coursedirectorid integer,
    remarks character varying
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- Name: faculty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculty (
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


ALTER TABLE public.faculty OWNER TO postgres;

--
-- Name: prereq; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prereq (
    prefix character varying,
    number character varying,
    pc_prefix character varying,
    pc_number character varying,
    pc_code character varying
);


ALTER TABLE public.prereq OWNER TO postgres;

--
-- Name: prerequisites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prerequisites (
    prefix character varying,
    number integer,
    pc_prefix character varying,
    pc_number character varying,
    pc_code character varying
);


ALTER TABLE public.prerequisites OWNER TO postgres;

--
-- Name: sched; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sched (
    year integer,
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


ALTER TABLE public.sched OWNER TO postgres;

--
-- Name: schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedule (
    year integer,
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
-- Name: schedule2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedule2 (
    year integer,
    semester character varying,
    prefix character varying,
    number integer,
    section integer,
    crn integer,
    instructor integer,
    days character varying,
    begintime time without time zone,
    endtime time without time zone,
    remarks character varying
);


ALTER TABLE public.schedule2 OWNER TO postgres;

--
-- Name: test2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test2 (
    year integer,
    semester character varying,
    prefix character varying,
    number integer,
    section integer,
    crn integer,
    instructor integer,
    days character varying,
    begintime time without time zone,
    endtime time without time zone,
    remarks character varying(100)
);


ALTER TABLE public.test2 OWNER TO postgres;

--
-- Name: test3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test3 (
    year integer,
    semester character varying,
    prefix character varying,
    number integer,
    section integer,
    crn integer,
    instructor integer,
    days character varying,
    begintime time without time zone,
    endtime time without time zone,
    remarks text
);


ALTER TABLE public.test3 OWNER TO postgres;

--
-- Name: test4; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test4 (
    year integer,
    semester character varying,
    prefix character varying,
    number integer,
    section integer,
    crn integer,
    instructor integer,
    days character varying,
    begintime text,
    endtime text,
    remarks text
);


ALTER TABLE public.test4 OWNER TO postgres;

--
-- Name: test5; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test5 (
    year integer,
    semester character varying,
    prefix character varying,
    number integer,
    section integer,
    crn integer,
    instructor integer,
    days character varying,
    begintime integer,
    endtime integer,
    remarks character varying
);


ALTER TABLE public.test5 OWNER TO postgres;

--
-- Name: test6; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test6 (
    year integer,
    semester character varying,
    prefix character varying,
    number integer,
    section integer,
    crn integer,
    instructor integer,
    days character varying,
    begintime integer,
    endtime integer,
    remarks character varying
);


ALTER TABLE public.test6 OWNER TO postgres;

--
-- Name: test7; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test7 (
    year integer,
    semester character varying,
    prefix character varying,
    number integer,
    section integer,
    crn integer,
    instructor integer,
    days text,
    begintime integer,
    endtime integer,
    remarks character varying
);


ALTER TABLE public.test7 OWNER TO postgres;

--
-- Data for Name: committee_assignments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.committee_assignments (faculty_id, committee_id, start, end_date, remarks) FROM stdin;
1	1	Aug-2018	Jul-2021	\N
4	1	Aug-2018	Jul-2021	\N
9	1	Aug-2019	Jul-2022	\N
15	2	Aug-2018	Jul-2021	\N
8	2	Aug-2019	Jul-2022	\N
12	2	Aug-2018	Jul-2021	\N
1	3	Aug-2020	Jul-2023	\N
7	3	Aug-2018	Jul-2021	\N
9	3	Aug-2008	Jul-2021	\N
3	4	Jan-2021	Dec-2023	\N
5	4	Jan-2021	Dec-2023	\N
5	5	Jan-2021	Dec-2023	\N
12	5	Jan-2021	Dec-2023	\N
1	6	\N	\N	\N
4	6	\N	\N	\N
5	6	\N	\N	\N
8	6	\N	\N	\N
15	6	\N	\N	\N
1	7	\N	\N	\N
4	7	\N	\N	\N
5	7	\N	\N	\N
8	7	\N	\N	\N
15	7	\N	\N	\N
15	8	Jan-2021	May-2021	\N
\.


--
-- Data for Name: committee_names; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.committee_names (id, committee_name, remarks) FROM stdin;
1	Undergraduate Curriculum Committee	\N
2	Graduate Curriculum Committee	\N
3	Assessment Committee	\N
4	Awards Committee	\N
5	Scholarships Committee	\N
6	Personnel Committee	\N
7	Promotion and Tenure Committee	\N
8	CET Budget Workgroup Committee	 CET ad hoc committee to explore ways to meet projected budget cuts
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: webuser1
--

COPY public.courses (prefix, number, title, gu, ch, frequency, active, description, remarks) FROM stdin;
CSCI	1000	Explorations in Computing	U	3	1	Yes	Central principles of problem-solving and programming on a computer in a high-level programming language. Testing programs by hand and on a computer. Common classes of algorithms and how to write them. 2 lecture and 2 lab hours per week	\N
CSCI	1003	Explorations in Computing Lab	U	0	1	Yes	2 lecture and 2 lab hours per week. C: CSCI 1000. Implementing and testing basic algorithms using a high-level programming language.	\N
CSCI	1010	Algorithmic Problem Solving	U	4	1	Yes	3 lecture and 2 lab hours per week. P: Appropriate score on math section of the SAT/ACT or MATH 1065 or CSCI 1000; C: CSCI 1011. Design of algorithms and their implementation as programs in a high-level programming language such as Java.	\N
CSCI	1011	Algorithmic Problem Solving Lab	U	0	1	 Yes	3 lecture and 2 lab hours per week. C: CSCI 1010. Design, implement, and test fundamental algorithms using a high-level programming language such as Java. 	\N
CSCI	2400	Discrete Structures I	U	3	1	Yes	P: MATH 1065. Application of basic concepts in discrete mathematics to solving problems in the computing discipline	\N
CSCI	2405	Discrete Structures II	U	3	1	 Yes	P: CSCI 2400. Continuation of CSCI 2400. Application of advanced concepts in discrete mathematics to solve computational problems	\N
CSCI	2410	Digital Logic Design	 U	3	1	Yes	P: ENGR 1014 or ENGR 1016 and ENGR 2050. Introduction to digital logic and digital electronics, including Boolean algebra, number systems, logic gates, data structures, and both combinational and sequential logical design and optimization.	\N
CSCI	2530	Algorithms and Data Structures	U	4	1	Yes	P: CSCI 1010; P/C: CSCI 2400. Computational problem solving using fundamental algorithms and physical data structures. Design and analysis of algorithms that operate on these data structures.	\N
CSCI	2540	Data Abstraction and Object-Oriented Data Structures	U	3	1	Yes	P: CSCI 2530; P/C: CSCI 2405. Data abstractions including stacks, queues, graphs, tables, sets and domain-specific data abstractions. Implementations of data abstractions in object-oriented style and principles of class design.	\N
CSCI	3000	Operating Systems	U	3	1	Yes	P: CSCI 2405, CSCI 2530. Operating system design and implementation. Process and memory management, and file systems. Operating system support for distributed systems.	\N
CSCI	3010	Computer Networks	U	3	1	Yes	P: CSCI 2530. Design and analysis of computer communication networks. Topics include application layer protocols, Internet protocols, network interfaces, local and wide area networks, wireless networks, bridging and routing.	\N
CSCI	3030	Software Engineering I	U	3	1	Yes	P: CSCI 2540. Software engineering principles, development methodologies and tools for developing large and complex software systems.	\N
CSCI	3200	Data Structures and Their Applications	U	3	1	Yes	Common data structures and how to use them in advanced problem solving.	\N
CSCI	3550	Computer Game Development I	U	3	1	Yes	P: CSCI 2530 or  CSCI 3200. A broad view of computer game development from an applied computer science point of view. Content creation and the concepts behind the development of story, character, environment, level design, user interface, and sound.	\N
CSCI	3584	Computational Linear Algebra	U	3	1	Yes	May not count toward MATH major or minor. P: Calculus course. Introduces vectors, matrices, and determinants. Special emphasis on application of linear algebra to solution of practical problems.	\N
CSCI	3650	Design and Analysis of Algorithms	U	3	1	Yes	P: CSCI 2530. Formal techniques to support the design and analysis of algorithms. Asymptotic complexity bounds, techniques of analysis, and algorithmic strategies.	\N
CSCI	3675	Principles of Programming Languages	U	3	1	Yes	P: CSCI 2540. Applied course in programming language constructs. Emphasis on run-time behavior of programs. Provides appropriate background for advanced-level courses involving formal and theoretical aspects of programming languages and compilation process.	\N
CSCI	3700	Database Management Systems	U	3	1	Yes	P: CSCI 2540. Relational database systems theory and database development. Topics include relational data model and integrity constraints specification, data modeling and relational schema design, normalization of relational schema, relational algebra, SQL, and database programming.	\N
CSCI	3800	Computer Graphics	U	3	1	Yes	P: CSCI 2540; MATH 3256 or MATH 3584. Computer graphics systems, hardware, interactive methods; line and curve drawing; two- and three-dimensional transformations; and perspective transformation.	\N
CSCI	4110	High Performance Computing	U	3	1	Yes	P: CSCI 3000, CSCI 3675. Software design and development targeting high performance computing architectures. Multi-core and many-core systems. MPI, OpenMP, MapReduce, CUDA, and OpenCL computing models.	\N
CSCI	4120	Machine Learning	U	3	1	Yes	P: CSCI 2540; MATH 2228 or MATH 2283. Machine learning and statistical pattern recognition algorithms and their application to data analytics, bioinformatics, speech recognition, natural language processing, robotic control, autonomous navigation, and text and web data processing.	\N
CSCI	4130	Information Retrieval	U	3	1	Yes	P: CSCI 2540; MATH 2228 or MATH 2283. Theory and algorithms for modeling and retrieving text. Text representation, IR models, query operations, retrieval evaluation, information extraction, text classification and clustering, enterprise and Web search, and recommender systems.	\N
CSCI	4140	Natural Language Processing	U	3	1	Yes	P: CSCI 2540; MATH 2228 or MATH 2283. Fundamental algorithms and computational models for core tasks in natural language processing. Word and sentence tokenization, parsing, information and meaning extraction, spelling correction, text summarization, question answering, and sentiment analysis	\N
CSCI	4150	Digital Image Processing	U	3	1	Yes	P: CSCI 2540; MATH 2228 or MATH 2283. Mathematical techniques and algorithms for image sampling, quantization, intensity transformations, spatial filtering, Fourier transforms, frequency domain filtering, restoration and reconstruction, morphological image processing, and segmentation.	\N
CSCI	4160	Cybersecurity: Theory and Practice	U	3	1	Yes	P: CSCI 3000, CSCI 3010. Computing systems security principles and models. Vulnerability assessment and prevention measures. Authentication and access control in distributed systems. Operating system, network, and database security	\N
CSCI	4170	Cloud Computing	U	3	1	Yes	P: CSCI 3000, CSCI 3010. Cloud computing as a cost effective platform for developing and deploying highly available and scalable applications. Theory, application frameworks, and tools of cloud computing	\N
CSCI	4180	Big Data Analytics	U	3	1	Yes	P: CSCI 3700. Hands-on introduction to very big data and the practical issues surrounding how the data is stored, processed, analyzed, and visualized. Work with cloud-based high performance computing systems, large data collections, and high velocity data streams.	\N
CSCI	4190	Cryptography and Information Security	U	3	1	Yes	P: CSCI 3650;  RP: CSCI 3584. Study of private key and public key cryptographic techniques that enable secret communication, message authentication and user identification.	\N
CSCI	4230	Software Engineering II	U	4	1	Yes	4 practicum and 2 lab hours per week. P: CSCI 3030, CSCI 3700; C: CSCI 4231. Application of technical and professional skills in solving a real-world problem in a team environment. Professional code of conduct, societal issues, copyrights and patents, intellectual capital, entrepreneurship, and transition from student to an industry professional in the context of software engineering.	\N
CSCI	4231	Software Engineering II Lab	U	0	1	Yes	4 practicum and 2 lab hours per week. C: CSCI 4230. Developing fully functional computing applications which solve practical problems.	\N
CSCI	4300	Systems Programming	U	3	1	Yes	P: CSCI 3200. Programming issues related to the functionality and general structure of operating systems, networking, security, and the general architecture of information systems are covered.	\N
CSCI	4520	Computer Architecture	U	3	1	Yes	P: CSCI major; CSCI 2410. Organization of basic elements of computer system, including processor, memory, control unit, and I/O units.	\N
CSCI	4540	Mobile Computing	U	3	1	Yes	P: CSCI 3010. Mobile computing and mobile application development. Mobile computing applications, technologies and wireless communication. Computing in environments with limited resources and low power, fault tolerance, and persistence. Mobile application frameworks and development environments. User interface design and evaluating user experience.	\N
CSCI	4550	Computer Game Development II	U	3	1	Yes	P: CSCI 3550. Animation development, multi-layer technologies, haptic displays, spatial issues in gaming and 3D immersion technology, terrain and special effects	\N
CSCI	4602	Automata Computability and Complexity	U	3	1	Yes	P: CSCI 2405, CSCI 2530. Fundamental concepts in automata theory and formal languages including grammars, finite automata, regular expressions, formal languages, pushdown automata, and Turing machines.	\N
CSCI	4627	Procedural Languages and Compilers	U	3	1	Yes	P: CSCI major; CSCI 2410, CSCI 3675. State of the art techniques for compiling procedural languages	\N
CSCI	4710	Web Applications	U	3	1	Yes	P: CSCI 3700.  Integration of several technologies including markup languages, scripting languages, network protocols, interactive graphics, event-driven programming, and databases in enabling Web applications development.	\N
CSCI	4900	Ethical and Professional Issues in Computer Science	U	3	1	Yes	To be taken by CSCI seniors in final semester.  P: CSCI major and senior standing. Professional, ethical, legal, security, and social issues and responsibilities related to the practice of computer science.	\N
CSCI	4905	Selected Topics in Computer Science	U	3	1	Yes	May be repeated with change of topic for maximum of 6 s.h. P: CSCI major; CSCI 2530 or CSCI 2540. Consideration of new or advanced topics in computer science.	\N
SENG	1000	Software Engineering Foundations and Practice	U	3	1	Yes	P: ACT Math score of 24 or SAT Math score of 560 or MATH 1065. Introduction to modern software engineering and computational problem-solving using object-oriented principles and a high-level programming language	\N
SENG	1010	Discrete Structures for Software Engineers I	U	3	1	Yes	P: ACT Math score of 24 or SAT Math score of 560 or MATH 1065. Fundamentals of discrete mathematics, including logic and elementary proofs, sequences, induction and recursion, sets and relations, and elementary number theory. Application of discrete mathematical concepts to solving software engineering problems	\N
SENG	1020	Data Structures for Software Engineers	U	3	1	Yes	P: SENG 1000. Introduction to data structures and their implementation. Computational problem-solving using data structures.	\N
SENG	1030	Discrete Structures for Software Engineers II	U	3	1	Yes	Continuation of SENG 1010. P: SENG 1010. Principles of discrete mathematics, including combinatorial proofs, discrete probability, recurrence relations and generating functions, graphs and trees, and analysis of algorithm efficiency. Application of discrete mathematical concepts to solving software engineering problems	\N
SENG	2000	Advanced Data Structures and Algorithms	U	3	1	Yes	P: SENG 1020. Design and analysis of algorithms using recursion, dynamic programming, and branch and bound. Solving computational problems using maps, hash tables, skip lists, and graph data structures	\N
SENG	2010	Requirements Specification and Analysis	U	3	1	Yes	P: SENG 1020. Methods and processes for eliciting, evaluating, managing, analyzing, documenting, and specifying software-intensive systems for achieving objectives, functions, qualities, and constraints.	\N
SENG	2020	Linear Algebra for Software Engineers	U	3	1	Yes	P: SENG 1030. Study of vectors, matrices, and determinants. Special emphasis on application of linear algebra to solving software engineering problems.	\N
SENG	3000	Software Architecture and Design	U	3	1	Yes	P: SENG 2010. Software architecture and design including iterative development process, modeling and analysis of software systems, object-oriented design, and design patterns	\N
SENG	3010	Software Construction	U	3	1	Yes	P: SENG 3000. Software construction tools and practice, including software development environments, object-oriented programming, software specification, automated testing, version control, and build management for software systems.	\N
SENG	3020	Software Verification and Validation	U	3	1	Yes	P: SENG 3000. Software quality attainment through software testing and other alternatives to quality assurance, including process improvement, inspection, fault tolerance, and reliability assurance	\N
SENG	3700	Database Design and Development	U	3	1	Yes	P: SENG 2000. Relational database systems theory and database development. Topics include relational data model and integrity constraints specification, data modeling and relational schema design, normalization of relational schema, relational algebra, SQL, and database programming.	\N
SENG	4500	Software Engineering Capstone Project I	U	3	1	Yes	P: SENG 3010, SENG 3700. Application of technical and professional skills in solving a real-world problem in a team environment. Topics include professional code of conduct, intellectual property, patents and copyrights, legal and ethical issues, entrepreneurship, and transition from student to software engineering professional.	\N
SENG	4510	Software Engineering Capstone Project II	U	3	1	Yes	Continuation of SENG 4500 P: SENG 4500. Application of technical and professional skills in solving a real-world problem in a team environment. Professional code of conduct, intellectual property, patents and copyrights, legal and ethical issues, entrepreneurship, and transition from student to software engineering professional.	\N
CSCI	5002	Logic for Mathematics and Computer Science	G	3	1	Yes	P: CSCI 2540 or CSCI 3200 or MATE 3223 or MATH 2427 or MATH 2775 or MATH 3256 or PHIL 3580 or equivalent. Methods of mathematical logic important in mathematics and computer science applications.	\N
CSCI	5220	Program Translation	G	3	1	Yes	P: CSCI 4627 or consent of instructor. Formal language specification for programming languages. Advanced parsing techniques. Code generation and optimization.	\N
CSCI	5501	Independent Study	G	3	1	Yes	Minimum of 3-6 hours per week depending on the nature of the work assigned. P: CSCI 2540 or CSCI 3200 or equivalent or consent of instructor. Advanced computer science students study topics that supplement regular curriculum.	\N
CSCI	5502	Independent Study	G	3	1	Yes	Minimum of 3-6 hours per week depending on the nature of the work assigned. P: CSCI 2540 or CSCI 3200 or equivalent or consent of instructor. Advanced computer science students study topics that supplement regular curriculum.	\N
CSCI	5503	Independent Study	G	3	1	Yes	Minimum of 3-6 hours per week depending on the nature of the work assigned. P: CSCI 2540 or CSCI 3200 or equivalent or consent of instructor. Advanced computer science students study topics that supplement regular curriculum.	\N
CSCI	5800	Artificial Intelligence	G	3	1	Yes	P: CSCI 2540 or CSCI 3200 or consent of instructor. Fundamental problems and techniques of artificial intelligence. Heuristic search. Concepts of expert systems.	\N
CSCI	6010	Big Data Analytics and Management	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Approaches to storing, processing, retrieving, analyzing, and managing massive-scale structured and unstructured data. High-performance computing and architectures and methods for developing and querying databases for Big Data. Column-relational, key-value, column-oriented, RDF, document-oriented, native XML, and graph databases.	\N
CSCI	6020	Machine Learning	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Mathematical, statistical and computational foundations of machine learning. Supervised and unsupervised learning, learning theory, reinforcement learning and control, and deep learning.	\N
CSCI	6030	Information Extraction and Retrieval	G	3	1	Yes	P: Enrolled in the computer science or software engineering programs or consent of instructor. Focuses on extracting, modeling, and retrieving unstructured data, primarily text documents. Text preprocessing, information extraction, term weighting and indexing, information retrieval models, relevance feedback and query expansion, system evaluation, document summarization, link analysis and web search, and activity analytics for relevance optimization and personalization.	\N
CSCI	6040	Computational Analysis of Natural Languages	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Theory and methods of natural language analysis and understanding. Morphological analysis and tagging, grammars and parsing, machine translation and natural language generation, semantic similarity, information extraction and question answering, text analytics and visualization.	\N
CSCI	6045	Cyber-Physical Systems	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Computational and application aspects of cyber-physical systems. Sensor networks, architectures, network protocols, and wireless technologies for designing and developing cyber-physical systems.	\N
CSCI	6050	Digital Image Analysis and Understanding	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Mathematical techniques and algorithms for image sampling, quantization, intensity transformations, and spatial filtering. Frequency domain filtering techniques for image restoration and reconstruction. Principles of color imaging, wavelets, morphological processing, segmentation and scene description.	\N
CSCI	6100	Cryptography and Information Security	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Cryptographic techniques to provide secrecy and authenticity of information communicated over an insecure channel; private-key cryptography, public-key cryptography and deployed cryptography.	\N
CSCI	6120	Computer Systems Architecture	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Sequential architectures, instruction sets, addressing modes, and control structures. Introduces parallel architectures.	\N
CSCI	6130	Networking and Telecommunication	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Theory and case studies of modern networking protocols and telecommunication methods. Local area and long-haul networks	\N
CSCI	6140	Mobile Communications and Wireless Security	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Signals, access protocols, application requirements, and security issues with a focus on digital data transfer.	\N
CSCI	6150	Computer and Network Security	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Computer and network security topics include cryptographic primitives, authentication, and access control. Network security, real-world security protocols, and privacy, legal, social, and ethical issues in software applications.	\N
CSCI	6220	Topics in Language Design	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Semantics and implementation characteristics of languages supporting modern computing paradigms such as functional programming, logic programming, constraint programming, and object-oriented programming.	\N
CSCI	6230	Software Engineering Foundations	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Software project development using software engineering principles and current software development techniques.	\N
CSCI	6300	Cryptographic Protocols	G	3	1	Yes	P: CSCI 6100 or consent of instructor. Design and analysis of cryptographic protocols for various tasks; emphasis on applications beyond providing secrecy and authenticity of messages.	\N
CSCI	6410	Design and Analysis of Algorithms	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Methods of designing efficient algorithms, case studies. Analysis of complexity of algorithm.	\N
CSCI	6420	Computability and Complexity	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Computability, Church’s thesis, formal models of computation. Introduces complexity theory.	\N
CSCI	6510	Distributed Computing	G	3	1	Yes	P: Consent of instructor. Principles and techniques for governing computation that is distributed over several machines connected by a network. Focuses on asynchronous distributed systems with partial failures. Topics include logical time, global state, reliable broadcast, causal broadcast, distributed shared memory, distributed mutual exclusion, stable property detection, and consensus.	\N
CSCI	6600	Database Management Systems	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Database system implementation theory and techniques. Transaction management; query processing and optimization; organization of database systems, advanced indexing, multi-dimensional data, similarity-based retrieval, and performance evaluation.	\N
CSCI	6710	Developing e-Commerce Systems	G	3	1	Yes	P:Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Concepts, technologies, and building blocks from computer science and practical software engineering required for developing web applications. Web application architectures, client and server-side programming, state management, authentication, and authorization.	\N
CSCI	6810	Topics in Artificial Intelligence	G	3	1	Yes	P: CSCI 5800 or consent of instructor. Study of state of the art in selected topic on artificial intelligence.	\N
CSCI	6820	Computer Graphics	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Principles and techniques of image rendering. Use of image rendering software.	\N
CSCI	6840	Data Mining	G	3	1	Yes	P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Data mining concepts and techniques and state of the art in data mining, including association rule mining, classification, clustering, data mining on complex type of data, and other data mining algorithms and applications.	\N
CSCI	6905	Topics in Computer Science	G	3	1	Yes	May be repeated once with change of topic. P: Enrolled in the master of science in computer science or software engineering programs or consent of instructor. Current topic in computer science.	\N
CSCI	6995	Research Project	G	3	1	Yes	P: Approval of director of graduate studies. Student selects, investigates, and reports to faculty on challenging research project.	\N
CSCI	7000	Thesis	G	3	1	Yes	May be repeated. May count maximum of 6 s.h.	\N
CSCI	7001	Thesis: Summer Research	G	3	1	Yes	May be repeated. No credit may count toward degree. Students conducting thesis research may only register for this course during the summer.	\N
SENG	5000	Programming and Data Structures Foundations	G	4	1	Yes	P: Enrolled in the master of science in software engineering program or master of science in computer science program or consent of instructor. Designed for students who are admitted to the master of science in software engineering program, but whose BS degrees are in engineering, mathematics, statistics, physics, chemistry, or similar analytic disciplines. Accelerated introduction to programming, data structures, and data abstraction using a high level language.	\N
SENG	5005	Discrete Structures and Algorithmic Foundations	G	4	1	Yes	P: Enrolled in the master of science in software engineering program or master of science in computer science program or consent of instructor. Designed for students who are admitted to the master of science in software engineering program, but whose BS degrees are in engineering, mathematics, statistics, physics, chemistry, or similar analytic disciplines. Accelerated introduction to the essentials of discrete structures, combinatorics, graph theory, automata, and algorithms.	\N
SENG	6230	Software Engineering Foundations	G	3	1	Yes	P: Enrolled in the master of science in software engineering program or consent of instructor. Software project development using software engineering principles and current software development techniques.	\N
SENG	6235	Software Project Management	G	3	1	Yes	P/C: SENG 6230 or consent of instructor. Advanced methods and techniques to initiate, plan, and control large and complex software development projects.	\N
SENG	6240	Software Architecture and Design	G	3	1	Yes	P/C: SENG 6230 or consent of instructor. Software development issues related to software architecture and design. Examines software development and implementation.	\N
SENG	6245	Software Construction	G	3	1	Yes	P: SENG 6230 or consent of instructor. Application of software specifications, design patterns, object-oriented design and concurrent programming, and testing techniques for designing, constructing, and testing large-scale software systems.	\N
SENG	6247	Software Security Engineering	G	3	1	Yes	P: Consent of instructor. Practical and theoretical knowledge in relation to design of secure software systems.	\N
SENG	6250	Software Systems Modeling and Analysis	G	3	1	Yes	P/C: SENG 6230 or consent of instructor. Methods for the construction of software including formal notation language and its application to the analysis and specification of software system requirements.	\N
SENG	6255	Software Requirements Engineering	G	3	1	Yes	P: Consent of instructor. Methods and processes for managing, analyzing and specifying requirements; use-case modeling; systems for requirements analysis and management.	\N
SENG	6260	Software Metrics and Quality Management	G	3	1	Yes	P/C: SENG 6230 or consent of instructor. Software quality metrics associated with process and product metrics. Examines development of software using various types of metrics and models employed in the field of software quality engineering.	\N
SENG	6265	Foundations of Software Testing	G	3	1	Yes	P: Consent of instructor. Fundamentals of software testing, test management, testing tools, test planning approaches, and basic static and dynamic testing methods.	\N
SENG	6270	Software Verification and Validation	G	3	1	Yes	P/C: SENG 6230 or consent of instructor. Verification and validation strategies and techniques throughout the software life-cycle, including processes that assure the desired software and documentation are developed and maintained.	\N
SENG	6275	Dependable Systems and Software Reliability	G	3	1	Yes	P: Consent of instructor. Analysis, modeling, and development of dependable systems. Foundations of software reliability.	\N
SENG	6280	Process Management and Lifecycle Modeling	G	3	1	Yes	P/C: SENG 6230 or consent of instructor. Foundations of software management and support over the complete life cycle including maturity models, change management, and optimization.	\N
SENG	6285	Cloud Computing	G	3	1	Yes	P:Consent of instructor. Techniques for developing applications and services to run on distributed networks using virtualized resources accessed over the Internet.	\N
SENG	6290	Software Engineering Project	G	3	1	Yes	P/C: SENG 6230 or consent of instructor. Practical process based and industry-oriented view of software engineering practices. Exposure to research, software development, and implementation of professional level software	\N
SENG	7000	Thesis	G	3	1	Yes	P: SENG 6230 and consent of instructor. May be repeated. May count maximum of 6 s.h.	\N
DASC	6000	Data Science Methods I	G	3	1	Yes	First of a two-course sequence. P: Enrolled in the master of science in data science program or consent of instructor. Essential mathematical, statistical, and computational knowledge needed for data scientists. Review of set theory, permutations and combinations, sums, functions, relations, recurrences, essence of differentiation and integration, elementary graph theory, and essential linear algebra. Other topics include conditional and joint probability, random variables and their distributions, expectation and moments, transformations and conditional expectation, inequalities and limit theorems, Markov Chains and  Markov Chain Monte Carlo, and Poisson processes.	\N
DASC	6005	Data Science Methods II	G	3	1	Yes	Second of a two-course sequence. P: DASC 6000 or consent of instructor. Essential mathematical, statistical, and computational knowledge needed for data scientists. Topics include Bayesian learning and probabilistic graphical models, network representations, inference, and learning.	\N
DASC	6010	Big Data Analytics and Management	G	3	1	Yes	P: Enrolled in the master of science in data science program or consent of instructor. Approaches to storing, processing, retrieving, analyzing, and managing massive-scale structured and unstructured data. High-performance computing and architectures and methods for developing and querying databases for Big Data using NoSQL systems.	\N
DASC	6020	Machine Learning	G	3	1	Yes	Mathematical, statistical, and computational foundations of machine learning and their application to Data Science problems. Regression, clustering, and classification as general-purpose machine learning tools. Neural network algorithms and deep learning.	\N
DASC	6030	Information Extraction and Retrieval	G	3	1	Yes	P: Enrolled in the master of science in data science program or consent of instructor. Extracting, modeling, and retrieving unstructured data, primarily text documents. Algorithms and tools for text preprocessing, information extraction, term weighting and indexing. Information retrieval models, query processing, and system evaluation. Link analysis and web search.	\N
DASC	6040	Computational Analysis of Natural Languages	G	3	1	Yes	P: Enrolled in the master of science in data science or consent of instructor. Theory and methods of natural language analysis and understanding for data science applications. Morphological analysis and tagging, grammars and parsing, machine translation, natural language generation, semantic similarity, question answering, text analytics, and visualization.	\N
DASC	6050	Digital Image Analysis and Understanding	G	3	1	Yes	P: Enrolled in the master of science in data science program or consent of instructor. Mathematical techniques and algorithms for extracting knowledge from images. Algorithms and tools for knowledge extraction include image sampling, quantization, intensity transformations, and spatial filtering. Frequency domain filters for image restoration and reconstruction. Techniques for color imaging, wavelets, morphological processing, segmentation, and scene description.	\N
DASC	6060	Health Informatics	G	3	1	Yes	P: Consent of instructor. Theoretical and practical foundations of health informatics for clinical, managerial, community health, and public health services.	\N
DASC	6070	Decision Support in Health Care	G	3	1	Yes	Theories and applications of decision science in health care	\N
DASC	6090	Data Science Practicum	G	3	1	Yes	P: Enrolled in the master of science in data science program and consent of instructor. Application of technical and professional skills in solving a real-world data science problem in a team environment. Application of project management principles, industry best practices, and tools. Application of analysis and design skills to solving medical and health care problems. Evaluating solutions and communicating results to a diverse audience in both oral and written form.	\N
\.


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors (prefix, number, coursedirectorid, remarks) FROM stdin;
CSCI	1000	14	\N
CSCI	1003	14	\N
CSCI	1010	14	\N
CSCI	1011	14	\N
CSCI	2400	12	\N
CSCI	2405	12	\N
CSCI	2410	5	\N
CSCI	2530	1	\N
CSCI	2540	1	\N
CSCI	3000	9	\N
CSCI	3010	9	\N
CSCI	3030	12	\N
CSCI	3200	12	\N
CSCI	3550	9	\N
CSCI	3584	5	\N
CSCI	3650	5	\N
CSCI	3675	1	\N
CSCI	3700	4	\N
CSCI	3800	9	\N
CSCI	4110	7	\N
CSCI	4120	16	\N
CSCI	4130	6	\N
CSCI	4140	7	\N
CSCI	4150	6	\N
CSCI	4160	5	\N
CSCI	4170	8	\N
CSCI	4180	7	\N
CSCI	4190	5	\N
CSCI	4230	8	\N
CSCI	4231	8	\N
CSCI	4300	6	\N
CSCI	4520	9	\N
CSCI	4540	8	\N
CSCI	4550	9	\N
CSCI	4602	1	\N
CSCI	4627	1	\N
CSCI	4710	16	\N
CSCI	4900	14	\N
CSCI	4905	6	\N
SENG	1000	15	\N
SENG	1010	16	\N
SENG	1020	16	\N
SENG	1030	16	\N
SENG	2000	11	\N
SENG	2010	11	\N
SENG	2020	8	\N
SENG	3000	8	\N
SENG	3010	3	\N
SENG	3020	3	\N
SENG	3700	6	\N
SENG	4500	11	\N
SENG	4510	11	\N
CSCI	5002	5	\N
CSCI	5220	1	\N
CSCI	5501	6	\N
CSCI	5502	6	\N
CSCI	5503	6	\N
CSCI	5800	7	\N
CSCI	6010	7	\N
CSCI	6020	16	\N
CSCI	6030	6	\N
CSCI	6040	7	\N
CSCI	6045	15	\N
CSCI	6050	6	\N
CSCI	6100	5	\N
CSCI	6120	15	\N
CSCI	6130	15	\N
CSCI	6140	15	\N
CSCI	6150	5	\N
CSCI	6220	1	\N
CSCI	6230	8	\N
CSCI	6300	5	\N
CSCI	6410	5	\N
CSCI	6420	1	\N
CSCI	6510	5	\N
CSCI	6600	4	\N
CSCI	6710	16	\N
CSCI	6810	7	\N
CSCI	6820	6	\N
CSCI	6840	4	\N
CSCI	6905	6	\N
CSCI	6995	1	\N
CSCI	7000	8	\N
CSCI	7001	8	\N
SENG	5000	8	\N
SENG	5005	5	\N
SENG	6230	8	\N
SENG	6235	15	\N
SENG	6240	15	\N
SENG	6245	8	\N
SENG	6247	12	\N
SENG	6250	8	\N
SENG	6255	3	\N
SENG	6260	3	\N
SENG	6265	3	\N
SENG	6270	3	\N
SENG	6275	3	\N
SENG	6280	8	\N
SENG	6285	15	\N
SENG	6290	15	\N
SENG	7000	15	\N
DASC	6000	6	\N
DASC	6005	6	\N
DASC	6010	7	\N
DASC	6020	16	\N
DASC	6030	6	\N
DASC	6040	7	\N
DASC	6050	6	\N
DASC	6060	6	\N
DASC	6070	6	\N
DASC	6090	6	\N
\.


--
-- Data for Name: faculty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faculty (id, honorific, first, mi, last, email, phone, office, research, rank, remarks, employed) FROM stdin;
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
-- Data for Name: prereq; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prereq (prefix, number, pc_prefix, pc_number, pc_code) FROM stdin;
\.


--
-- Data for Name: prerequisites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prerequisites (prefix, number, pc_prefix, pc_number, pc_code) FROM stdin;
\.


--
-- Data for Name: sched; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sched (year, semester, prefix, number, section, crn, enrollment, instructor, days, begintime, endtime, remarks) FROM stdin;
\.


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schedule (year, semester, prefix, number, section, crn, enrollment, instructor, days, begintime, endtime, remarks) FROM stdin;
2021	Spring	CSCI	1010	1	31764	49	14	 MWF	900	950	\N
2021	Spring	CSCI	1010	2	31769	51	14	 MWF	1100	1150	\N
2021	Spring	CSCI	1011	1	31773	25	14	 M	1200	1340	\N
2021	Spring	CSCI	1011	2	31883	24	14	T	1200	1340	\N
2021	Spring	CSCI	1011	3	31885	26	14	W	1200	1340	\N
2021	Spring	CSCI	1011	4	31887	25	14	R	1200	1340	\N
2021	Spring	CSCI	2400	1	31891	54	1	\N	\N	\N	\N
2021	Spring	CSCI	2400	2	32794	45	1	\N	\N	\N	\N
2021	Spring	CSCI	2405	1	31892	50	1	\N	\N	\N	\N
2021	Spring	CSCI	2530	1	31895	27	9	TR	930	1045	\N
2021	Spring	CSCI	2530	2	32985	50	9	TR	1230	1345	\N
2021	Spring	CSCI	2540	1	31897	15	4	TR	930	1045	\N
2021	Spring	CSCI	2540	2	32866	35	4	TR	1230	1345	\N
2021	Spring	CSCI	3000	1	31899	40	12	TR	1100	1215	\N
2021	Spring	CSCI	3000	2	32997	37	12	TR	\N	\N	\N
2021	Spring	CSCI	3010	1	31901	24	9	MW	1400	1515	\N
2021	Spring	CSCI	3010	2	33003	49	9	MW	1700	1815	\N
2021	Spring	CSCI	3650	1	31907	7	5	MW	1400	1515	\N
2021	Spring	CSCI	3650	601	32880	80	5	MW	1400	1515	\N
2021	Spring	CSCI	4110	601	36431	5	7	\N	\N	\N	\N
2021	Spring	CSCI	4130	1	31914	39	3	MW	1530	1645	\N
2021	Spring	CSCI	4140	1	31918	36	7	TR	1230	1345	\N
2021	Spring	CSCI	4170	1	31921	40	8	TR	1400	1515	\N
2021	Spring	CSCI	4190	1	31923	1	5	MW	1700	1815	\N
2021	Spring	CSCI	4190	601	33853	14	5	MW	1700	1815	\N
2021	Spring	CSCI	4230	1	31924	28	11	MW	1100	1150	WI
2021	Spring	CSCI	4230	2	31926	26	12	TR	\N	\N	WI
2021	Spring	CSCI	4231	1	31927	28	11	T	1700	1840	\N
2021	Spring	CSCI	4231	2	31928	26	12	R	1700	1840	\N
2021	Spring	CSCI	4550	1	31929	35	9	TR	1530	1645	\N
2021	Spring	CSCI	4710	1	31930	42	16	MW	1400	1515	\N
2021	Spring	CSCI	4900	601	32990	2	14	T	1800	1850	\N
2021	Spring	CSCI	6010	1	31932	4	7	TR	930	1045	\N
2021	Spring	CSCI	6010	601	31933	14	7	\N	\N	\N	\N
2021	Spring	CSCI	6030	1	31934	4	3	MW	1530	1645	\N
2021	Spring	CSCI	6030	601	31935	1	3	\N	\N	\N	\N
2021	Spring	CSCI	6040	601	31937	4	7	\N	\N	\N	\N
2021	Spring	CSCI	6100	601	31939	4	5	\N	\N	\N	\N
2021	Spring	CSCI	6600	1	31942	2	4	TR	1530	1645	\N
2021	Spring	CSCI	6600	601	31943	15	4	\N	\N	\N	\N
2021	Spring	CSCI	6710	1	31940	7	16	MW	1400	1515	\N
2021	Spring	CSCI	6710	601	31941	10	16	\N	\N	\N	\N
2021	Spring	CSCI	6995	601	36491	1	16	\N	\N	\N	\N
2021	Spring	CSCI	7000	1	36103	1	3	\N	\N	\N	\N
2021	Spring	CSCI	7000	2	36212	1	12	\N	\N	\N	\N
2021	Spring	CSCI	7000	3	36259	1	15	\N	\N	\N	\N
2021	Spring	CSCI	7000	4	36351	1	7	\N	\N	\N	\N
2021	Spring	CSCI	7000	5	36445	1	6	\N	\N	\N	\N
2021	Spring	DASC	6005	1	31950	1	6	MW	1700	1815	\N
2021	Spring	DASC	6005	601	31953	12	6	\N	\N	\N	\N
2021	Spring	DASC	6010	601	31958	17	7	\N	\N	\N	\N
2021	Spring	DASC	6030	1	32010	1	3	MW	1530	1645	\N
2021	Spring	DASC	6030	601	32011	4	3	\N	\N	\N	\N
2021	Spring	DASC	6040	601	32021	2	7	\N	\N	\N	\N
2021	Spring	SENG	1010	1	32026	9	1	\N	\N	\N	\N
2021	Spring	SENG	1020	1	32030	7	11	MWF	1000	1100	\N
2021	Spring	SENG	1030	1	32034	8	16	MW	1600	1715	\N
2021	Spring	SENG	2000	1	32040	7	11	MWF	1500	1550	\N
2021	Spring	SENG	2010	601	33987	6	15	MW	1230	1345	\N
2021	Spring	SENG	3000	1	32059	5	15	MW	1000	1115	\N
2021	Spring	SENG	6250	1	32981	2	8	TR	1100	1215	\N
2021	Spring	SENG	6250	601	32983	4	8	\N	\N	\N	\N
2021	Spring	SENG	6255	601	32087	6	15	\N	\N	\N	\N
2021	Spring	SENG	6285	1	32095	5	8	TR	1400	1515	\N
2021	Spring	SENG	6285	601	32097	17	8	\N	\N	\N	\N
2021	Spring	SENG	6290	601	36039	1	8	\N	\N	\N	\N
2021	Spring	SENG	7000	1	36062	2	15	\N	\N	\N	\N
2021	Spring	SENG	7000	602	36189	1	15	\N	\N	\N	\N
2021	Spring	SENG	7000	603	36584	1	15	\N	\N	\N	\N
2020	Fall	CSCI	1000	1	84173	19	14	MWF	1000	1130	\N
2020	Fall	CSCI	1003	1	84103	19	14	F	1200	1340	\N
2020	Fall	CSCI	2410	1	84146	48	9	\N	\N	\N	\N
2020	Fall	CSCI	2410	2	84152	31	9	\N	\N	\N	\N
2020	Fall	CSCI	3030	1	84138	16	8	TR	1230	1445	\N
2020	Fall	CSCI	3584	1	84093	42	5	MWF	1000	1130	\N
2020	Fall	CSCI	3584	2	84094	39	5	MWF	1000	1130	\N
2020	Fall	CSCI	3675	1	84136	44	7	\N	1530	1715	\N
2020	Fall	CSCI	3675	2	84137	28	7	\N	1530	1715	\N
2020	Fall	CSCI	3700	1	84091	22	4	TR	930	1145	\N
2020	Fall	CSCI	3700	2	84092	45	4	TR	1230	1445	\N
2020	Fall	CSCI	4602	1	84066	48	1	MWF	1300	1430	\N
2020	Fall	CSCI	4602	2	84071	22	1	MWF	1500	1630	\N
2020	Fall	SENG	1000	1	84161	15	11	MWF	1200	1330	\N
2020	Fall	SENG	2010	1	84189	6	15	TR	930	1145	\N
2020	Fall	CSCI	4120	1	84224	36	16	MWF	1530	1645	\N
2020	Fall	CSCI	4150	1	84110	15	6	TR	1100	1215	\N
2020	Fall	CSCI	4150	601	87014	6	6	\N	\N	\N	\N
2020	Fall	CSCI	5501	0	86882	3	7	\N	\N	\N	\N
2020	Fall	CSCI	6020	1	84230	8	16	MWF	1530	1645	\N
2020	Fall	CSCI	6020	601	84234	15	16	\N	\N	\N	\N
2020	Fall	CSCI	6050	1	84114	8	6	TR	1100	1215	\N
2020	Fall	CSCI	6050	601	84117	9	6	\N	\N	\N	\N
2020	Fall	CSCI	6410	1	84083	1	5	MWF	1700	1815	\N
2020	Fall	CSCI	6410	601	84084	11	5	\N	\N	\N	\N
2020	Fall	CSCI	6995	1	86372	1	4	\N	\N	\N	\N
2020	Fall	CSCI	6995	601	87020	1	8	\N	\N	\N	\N
2020	Fall	CSCI	7000	1	86182	1	6	\N	\N	\N	\N
2020	Fall	CSCI	7000	2	86635	1	15	\N	\N	\N	\N
2020	Fall	CSCI	7000	3	86253	1	7	\N	\N	\N	\N
2020	Fall	CSCI	7000	4	86260	1	5	\N	\N	\N	\N
2020	Fall	CSCI	7000	5	86369	1	12	\N	\N	\N	\N
2020	Fall	CSCI	7000	601	86669	1	6	\N	\N	\N	\N
2020	Fall	DASC	6000	1	84121	1	6	MW	1700	1815	\N
2020	Fall	DASC	6000	601	84125	14	6	\N	\N	\N	\N
2020	Fall	DASC	6020	1	84236	4	16	MW	1530	1645	\N
2020	Fall	DASC	6020	601	84239	8	16	\N	\N	\N	\N
2020	Fall	DASC	6050	1	84131	3	6	TR	1100	1215	\N
2020	Fall	DASC	6050	601	84134	3	6	\N	\N	\N	\N
2020	Fall	SENG	5000	601	85813	8	12	\N	\N	\N	\N
2020	Fall	SENG	5005	601	85138	8	6	\N	\N	\N	\N
2020	Fall	SENG	6230	1	84195	6	15	TR	1400	1515	\N
2020	Fall	SENG	6230	601	84199	12	15	\N	\N	\N	\N
2020	Fall	SENG	6235	1	84203	2	15	TR	1530	1645	\N
2020	Fall	SENG	6235	601	84207	4	15	\N	\N	\N	\N
2020	Fall	SENG	6245	1	84088	5	3	TR	930	1045	\N
2020	Fall	SENG	6245	601	84089	5	3	\N	\N	\N	\N
2020	Fall	SENG	6265	1	85135	6	3	TR	1230	1345	\N
2020	Fall	SENG	6265	601	85136	14	3	\N	\N	\N	\N
2020	Fall	SENG	7000	2	86184	1	8	\N	\N	\N	\N
2020	Fall	SENG	7000	3	86254	1	7	\N	\N	\N	\N
2020	Fall	SENG	7000	4	86589	1	15	\N	\N	\N	\N
2020	Fall	SENG	7000	6	86878	1	15	\N	\N	\N	\N
2020	Fall	CSCI	1010	1	84181	46	14	MWF	1300	1350	\N
2020	Fall	CSCI	1010	2	84187	49	14	MWF	1500	1550	\N
2020	Fall	CSCI	1011	1	84105	19	14	M	900	1040	\N
2020	Fall	CSCI	1011	2	84106	22	14	M	1100	1240	\N
2020	Fall	CSCI	1011	3	84107	20	14	W	900	1040	\N
2020	Fall	CSCI	1011	4	84108	20	14	W	1100	1240	\N
2020	Fall	CSCI	1011	5	86696	14	14	T	900	1040	\N
2020	Fall	CSCI	2400	1	84054	36	1	MWF	900	950	\N
2020	Fall	CSCI	2400	2	84062	39	1	MWF	1100	1150	\N
2020	Fall	CSCI	2405	1	84157	38	12	TR	1100	1215	\N
2020	Fall	CSCI	2405	2	84158	17	12	TR	1400	1515	\N
2020	Fall	CSCI	2530	1	84141	63	9	MW	\N	\N	\N
2020	Fall	CSCI	2540	1	84090	43	4	TR	1530	1745	\N
2020	Fall	CSCI	3030	2	84139	31	8	TR	1400	1615	\N
2020	Fall	CSCI	3550	1	84142	60	9	MW	\N	\N	\N
2020	Fall	CSCI	4180	1	85800	22	14	TR	1630	1745	\N
2020	Fall	SENG	1010	1	84077	10	1	MWF	900	950	\N
2020	Fall	SENG	1020	1	84155	7	16	MWF	1100	1150	\N
2020	Fall	SENG	1030	1	84164	9	12	TR	1100	1315	\N
2020	Fall	SENG	2000	1	84156	5	11	MWF	1400	1450	\N
2020	Spring	CSCI	1010	1	35431	40	14	MWF	1000	1050	\N
2020	Spring	CSCI	1010	2	35430	35	14	MWF	1300	1350	\N
2020	Spring	CSCI	1011	1	35558	20	14	M	1700	1840	\N
2020	Spring	CSCI	1011	2	35560	21	14	T	1700	1840	\N
2020	Spring	CSCI	1011	3	35561	18	14	W	1700	1840	\N
2020	Spring	CSCI	1011	4	35563	16	14	R	1700	1840	\N
2020	Spring	CSCI	2400	1	35531	30	5	TR	1100	1215	\N
2020	Spring	CSCI	2400	2	35541	36	5	TR	1400	1515	\N
2020	Spring	CSCI	2405	1	35506	32	1	MWF	1100	1150	\N
2020	Spring	CSCI	2405	2	35429	16	17	TR	1400	1515	\N
2020	Spring	CSCI	2530	1	35507	34	1	MWRF	1300	1350	\N
2020	Spring	CSCI	2530	2	35509	19	1	MWRF	1400	1450	\N
2020	Spring	CSCI	2540	1	35511	12	4	TR	930	1045	\N
2020	Spring	CSCI	2540	2	35513	30	4	TR	1230	1345	\N
2020	Spring	CSCI	3000	1	35442	11	12	MWF	900	950	\N
2020	Spring	CSCI	3000	2	35441	26	12	MWF	1100	1150	\N
2020	Spring	CSCI	3000	3	35438	37	12	MW	1400	1515	\N
2020	Spring	CSCI	3010	1	35449	42	9	MWF	1000	1050	\N
2020	Spring	CSCI	3010	2	35446	47	9	MWF	1300	1350	\N
2020	Spring	CSCI	3030	3	35510	18	8	TR	1530	1645	\N
2020	Spring	CSCI	3650	1	35436	45	13	MWF	900	950	\N
2020	Spring	CSCI	3650	2	35434	43	13	MWF	1100	1150	\N
2020	Spring	CSCI	4130	1	35565	44	3	TR	1100	1215	\N
2020	Spring	CSCI	4140	1	35487	38	7	MWF	1000	1050	\N
2020	Spring	CSCI	4230	1	35483	30	8	TR	1230	1345	\N
2020	Spring	CSCI	4230	2	35471	31	8	TR	1400	1515	\N
2020	Spring	CSCI	4231	1	35476	30	8	M	1700	1840	\N
2020	Spring	CSCI	4231	2	35465	31	8	W	1700	1840	\N
2020	Spring	CSCI	4550	1	35443	29	9	MWF	1600	1650	\N
2020	Spring	CSCI	4710	1	35606	50	16	TR	930	1045	\N
2020	Spring	CSCI	4905	1	35827	9	5	TR	1700	1815	\N
2020	Spring	CSCI	5501	1	35589	6	6	M	1700	1750	\N
2020	Spring	CSCI	6030	1	35590	3	15	TR	1530	1645	\N
2020	Spring	CSCI	6030	601	35593	6	15	TR	1530	1645	\N
2020	Spring	CSCI	6040	1	35553	13	6	MW	1400	1515	\N
2020	Spring	CSCI	6040	601	35559	11	6	MW	1400	1515	\N
2020	Spring	CSCI	6300	1	35828	1	5	TR	1700	1815	\N
2020	Spring	CSCI	6710	1	35609	6	16	TR	1400	1515	\N
2020	Spring	CSCI	6710	601	35610	6	16	TR	1400	1515	\N
2020	Spring	CSCI	6840	1	35516	7	4	TR	1530	1645	\N
2020	Spring	CSCI	6840	601	35521	12	4	TR	1530	1645	\N
2020	Spring	CSCI	7000	2	34900	1	6	\N	\N	\N	\N
2020	Spring	CSCI	7000	5	35075	1	15	\N	\N	\N	\N
2020	Spring	CSCI	7000	6	35087	1	16	\N	\N	\N	\N
2020	Spring	CSCI	7000	8	35093	2	3	\N	\N	\N	\N
2020	Spring	CSCI	7000	9	36243	1	5	\N	\N	\N	\N
2020	Spring	CSCI	7000	601	34880	1	4	\N	\N	\N	\N
2020	Spring	CSCI	7000	605	35082	1	15	\N	\N	\N	\N
2020	Spring	CSCI	7000	610	36726	1	6	\N	\N	\N	\N
2020	Spring	DASC	6005	1	35505	2	6	MW	1530	1645	\N
2020	Spring	DASC	6005	601	35504	2	6	MW	1530	1645	\N
2020	Spring	DASC	6030	1	35594	2	15	TR	1530	1645	\N
2020	Spring	DASC	6030	601	35595	4	15	TR	1530	1645	\N
2020	Spring	DASC	6040	1	35498	3	6	MW	1400	1515	\N
2020	Spring	DASC	6040	601	35492	2	6	MW	1400	1515	\N
2020	Spring	SENG	1000	1	36626	8	18	TR	1530	1645	\N
2020	Spring	SENG	1010	1	35678	11	19	TR	930	1045	\N
2020	Spring	SENG	1020	1	35681	4	14	MW	1530	1645	\N
2020	Spring	SENG	6240	1	35658	2	15	TR	930	1045	\N
2020	Spring	SENG	6240	601	35661	13	15	TR	930	1045	\N
2020	Spring	SENG	6285	1	35544	3	15	TR	1230	1345	\N
2020	Spring	SENG	6285	601	35546	16	15	TR	1230	1345	\N
2020	Spring	SENG	6290	601	35428	2	8	\N	\N	\N	\N
2020	Spring	SENG	6290	605	35592	1	7	\N	\N	\N	\N
2020	Spring	SENG	7000	1	35460	1	8	\N	\N	\N	\N
2020	Spring	SENG	7000	2	35554	1	15	\N	\N	\N	\N
2020	Spring	SENG	7000	6	35641	1	7	\N	\N	\N	\N
2020	Spring	SENG	7000	7	35648	1	16	\N	\N	\N	\N
2020	Spring	SENG	7000	8	35652	2	6	\N	\N	\N	\N
2020	Spring	SENG	7000	602	35557	1	15	\N	\N	\N	\N
2020	Spring	SENG	7000	609	36725	1	15	\N	\N	\N	\N
2019	Fall	CSCI	1000	1	84138	7	3	MW	1000	1050	\N
2019	Fall	CSCI	1003	1	83986	7	3	M	1300	1440	\N
2019	Fall	CSCI	1010	1	84139	41	14	MWF	1000	1050	\N
2019	Fall	CSCI	1010	2	84140	46	14	MWF	1300	1350	\N
2019	Fall	CSCI	1011	1	84015	17	14	M	1100	1240	\N
2019	Fall	CSCI	1011	2	84018	18	14	W	1100	1240	\N
2019	Fall	CSCI	1011	3	84023	19	14	F	1100	1240	\N
2019	Fall	CSCI	1011	4	84058	18	14	T	900	1040	\N
2019	Fall	CSCI	1011	5	84083	16	14	T	1100	1240	\N
2019	Fall	CSCI	2400	1	84128	41	12	TR	930	1045	\N
2019	Fall	CSCI	2400	2	84129	40	12	TR	1530	1645	\N
2019	Fall	CSCI	2405	1	84136	29	13	MWF	900	950	\N
2019	Fall	CSCI	2405	2	84159	35	16	TR	930	1045	\N
2019	Fall	CSCI	2410	1	84116	39	9	MWF	1200	1250	\N
2019	Fall	CSCI	2410	2	84117	37	9	MWF	1600	1650	\N
2019	Fall	CSCI	2530	1	83635	31	1	MWRF	1300	1350	\N
2019	Fall	CSCI	2530	2	83641	32	1	MWRF	1500	1550	\N
2019	Fall	CSCI	2540	1	83766	32	4	TR	1530	1645	\N
2019	Fall	CSCI	3030	2	84109	30	8	TR	1230	1345	\N
2019	Fall	CSCI	3030	1	84108	30	8	TR	930	1045	\N
2019	Fall	CSCI	3550	1	84118	45	9	MWF	1400	1450	\N
2019	Fall	CSCI	3584	1	83908	43	5	MWF	1000	1050	\N
2019	Fall	CSCI	3584	2	83915	41	5	MWF	1100	1150	\N
2019	Fall	CSCI	3675	1	84125	55	7	TR	1400	1515	\N
2019	Fall	CSCI	3700	2	83786	29	4	TR	930	1045	\N
2019	Fall	CSCI	3700	1	83780	38	4	TR	1230	1345	\N
2019	Fall	CSCI	4120	1	84160	38	16	TR	1530	1645	\N
2019	Fall	CSCI	4120	601	86824	1	16	TR	1530	1645	\N
2019	Fall	CSCI	4180	3	84141	14	14	MW	1700	1815	\N
2019	Fall	CSCI	4520	1	84137	35	13	MWF	1300	1350	\N
2019	Fall	CSCI	4602	1	83643	44	1	MWF	1100	1150	\N
2019	Fall	CSCI	4602	2	83698	35	1	MWF	900	950	\N
2019	Fall	CSCI	4905	1	83950	6	5	MW	1530	1645	\N
2019	Fall	CSCI	5501	1	84143	6	6	T	1530	1620	\N
2019	Fall	CSCI	6010	1	84119	8	7	TR	1700	1815	\N
2019	Fall	CSCI	6010	601	84120	9	7	\N	\N	\N	\N
2019	Fall	CSCI	6020	1	84089	7	6	MW	1100	1215	\N
2019	Fall	CSCI	6020	601	84091	7	6	\N	\N	\N	\N
2019	Fall	CSCI	6410	1	84121	8	3	MW	1700	1815	\N
2019	Fall	CSCI	6410	601	84122	4	3	MW	1700	1815	\N
2019	Fall	CSCI	6510	1	85769	1	5	MW	1530	1645	\N
2019	Fall	CSCI	6995	7	84161	1	16	\N	\N	\N	\N
2019	Fall	CSCI	6995	603	85894	1	4	\N	\N	\N	\N
2019	Fall	CSCI	6995	607	85898	1	16	\N	\N	\N	\N
2019	Fall	CSCI	7000	3	84099	1	6	\N	\N	\N	\N
2019	Fall	CSCI	7000	8	86377	1	15	\N	\N	\N	\N
2019	Fall	CSCI	7000	601	85899	1	4	\N	\N	\N	\N
2019	Fall	CSCI	7000	603	85901	1	6	\N	\N	\N	\N
2019	Fall	CSCI	7000	606	85904	1	15	\N	\N	\N	\N
2019	Fall	CSCI	7000	607	85905	2	16	\N	\N	\N	\N
2019	Fall	DASC	6000	1	84126	3	6	MW	1400	1515	\N
2019	Fall	DASC	6000	601	84127	3	6	MW	1400	1515	\N
2019	Fall	DASC	6010	1	84123	1	7	TR	1700	1815	\N
2019	Fall	DASC	6010	601	84124	2	7	\N	\N	\N	\N
2019	Fall	DASC	6020	1	84103	2	6	MW	1100	1215	\N
2019	Fall	SENG	1000	1	86554	9	3	MWF	1000	1050	\N
2019	Fall	SENG	5000	1	84132	2	12	TR	1730	1910	\N
2019	Fall	SENG	5000	601	84133	7	12	TR	1700	1840	\N
2019	Fall	SENG	5005	1	84153	1	6	MW	1700	1840	\N
2019	Fall	SENG	5005	601	84154	8	6	MW	1700	1840	\N
2019	Fall	SENG	6230	1	84146	5	15	TR	1230	1345	\N
2019	Fall	SENG	6230	601	84147	7	15	TR	1230	1345	\N
2019	Fall	SENG	6235	1	84148	5	15	TR	930	1045	\N
2019	Fall	SENG	6235	601	84149	8	15	\N	\N	\N	\N
2019	Fall	SENG	6250	1	85858	3	8	TR	1530	1645	\N
2019	Fall	SENG	6250	601	85861	7	8	TR	1530	1645	\N
2019	Fall	SENG	6265	1	84155	7	20	MW	1230	1345	\N
2019	Fall	SENG	6265	601	84156	8	20	\N	1230	1345	\N
2019	Fall	SENG	6290	3	84150	1	15	\N	\N	\N	\N
2019	Fall	SENG	7000	4	84158	2	6	\N	\N	\N	\N
2019	Fall	SENG	7000	1	84115	1	8	\N	\N	\N	\N
2019	Fall	SENG	7000	605	85910	1	16	\N	\N	\N	\N
2019	Fall	SENG	7000	606	86998	1	15	\N	\N	\N	\N
2019	Spring	CSCI	1010	1	33038	42	14	MWF	1000	1050	\N
2019	Spring	CSCI	1010	2	33040	44	14	MWF	1300	1350	\N
2019	Spring	CSCI	1011	1	33042	19	14	M	1700	1840	\N
2019	Spring	CSCI	1011	2	33046	20	14	T	1700	1840	\N
2019	Spring	CSCI	1011	3	33050	23	14	W	1700	1840	\N
2019	Spring	CSCI	1011	4	33051	24	14	M	1500	1640	\N
2019	Spring	CSCI	2400	1	33070	38	21	TR	1100	1215	\N
2019	Spring	CSCI	2400	2	33071	53	21	TR	1700	1815	\N
2019	Spring	CSCI	2405	1	33024	29	13	MWF	1100	1150	\N
2019	Spring	CSCI	2405	3	33072	24	21	TR	1400	1515	\N
2019	Spring	CSCI	2410	1	33054	40	10	\N	\N	\N	\N
2019	Spring	CSCI	2530	1	32837	40	1	MWRF	1300	1350	\N
2019	Spring	CSCI	2530	2	32840	33	1	MWRF	1600	1650	\N
2019	Spring	CSCI	2540	1	32852	25	4	TR	930	1045	\N
2019	Spring	CSCI	2540	2	32853	16	4	TR	1230	1345	\N
2019	Spring	CSCI	3000	1	32869	15	12	MWF	900	950	\N
2019	Spring	CSCI	3000	2	32872	41	12	MWF	1100	1150	\N
2019	Spring	CSCI	3000	3	33021	13	12	TR	930	1045	\N
2019	Spring	CSCI	3010	1	33017	29	9	MWF	1000	1050	\N
2019	Spring	CSCI	3010	2	33018	48	9	MWF	1300	1350	\N
2019	Spring	CSCI	3010	3	33020	20	9	MWF	1500	1550	\N
2019	Spring	CSCI	3650	1	32843	53	1	MWF	1000	1050	\N
2019	Spring	CSCI	3650	2	33960	29	5	TR	1230	1345	\N
2019	Spring	CSCI	4130	1	32991	53	6	TR	1100	1215	\N
2019	Spring	CSCI	4140	1	33027	26	13	MWF	900	950	\N
2019	Spring	CSCI	4230	1	33003	44	8	TR	1400	1515	\N
2019	Spring	CSCI	4231	1	33009	44	8	TR	1600	1800	\N
2019	Spring	CSCI	4710	1	33074	48	16	TR	1815	1930	\N
2019	Spring	CSCI	4905	1	32874	19	5	MW	1530	1645	\N
2019	Spring	CSCI	5501	1	33057	27	14	M	1700	1750	\N
2019	Spring	CSCI	6030	1	32994	12	6	TR	1100	1215	\N
2019	Spring	CSCI	6030	601	32996	5	6	TR	\N	\N	\N
2019	Spring	CSCI	6100	1	32989	3	5	MW	1530	1645	\N
2019	Spring	CSCI	6600	1	32865	3	4	TR	1530	1645	\N
2019	Spring	CSCI	6600	601	32867	5	4	TR	\N	\N	\N
2019	Spring	CSCI	6710	1	33075	7	16	TR	1815	1930	\N
2019	Spring	CSCI	6710	601	33078	10	16	TR	\N	\N	\N
2019	Spring	CSCI	7000	2	34466	2	6	\N	\N	\N	\N
2019	Spring	CSCI	7000	5	34472	4	15	\N	\N	\N	\N
2019	Spring	CSCI	7000	6	34444	1	16	\N	\N	\N	\N
2019	Spring	CSCI	7000	602	34467	1	6	\N	\N	\N	\N
2019	Spring	CSCI	7000	606	34452	1	16	\N	\N	\N	\N
2019	Spring	DASC	6030	1	35503	1	6	TR	1100	1215	\N
2019	Spring	DASC	6030	601	32999	1	6	TR	\N	\N	\N
2019	Spring	SENG	5000	1	37048	4	14	TR	1700	1840	\N
2019	Spring	SENG	5005	2	37081	2	21	MW	1700	1840	\N
2019	Spring	SENG	6245	1	33015	4	8	TR	1230	1345	\N
2019	Spring	SENG	6245	601	33012	9	8	TR	\N	\N	\N
2019	Spring	SENG	6260	1	33033	4	15	MW	1100	1215	\N
2019	Spring	SENG	6260	601	33035	9	15	MW	\N	\N	\N
2019	Spring	SENG	6285	1	33036	1	15	MW	1530	1645	\N
2019	Spring	SENG	6285	601	33037	10	15	\N	\N	\N	\N
2019	Spring	SENG	6290	601	37039	1	15	\N	\N	\N	\N
2019	Spring	SENG	7000	2	34460	3	15	\N	\N	\N	\N
2019	Spring	SENG	7000	4	36617	1	15	\N	\N	\N	\N
2019	Spring	SENG	7000	601	34459	1	8	\N	\N	\N	\N
2019	Spring	SENG	7000	602	34461	2	15	\N	\N	\N	\N
2019	Spring	SENG	7000	604	37080	1	12	\N	\N	\N	\N
2018	Fall	CSCI	1000	1	85584	22	14	MW	1100	1150	\N
2018	Fall	CSCI	1003	1	85585	23	14	M	1200	1340	\N
2018	Fall	CSCI	1010	1	85586	120	9	MWF	1300	1350	\N
2018	Fall	CSCI	1011	1	85587	21	9	M	1400	1540	\N
2018	Fall	CSCI	1011	2	85588	15	9	R	1500	1640	\N
2018	Fall	CSCI	1011	3	85589	20	9	T	1500	1640	\N
2018	Fall	CSCI	1011	4	85590	7	9	F	1500	1640	\N
2018	Fall	CSCI	1011	5	85592	23	9	W	1500	1640	\N
2018	Fall	CSCI	1011	6	85594	23	9	R	1300	1440	\N
2018	Fall	CSCI	1011	7	86831	11	9	M	1600	1740	\N
2018	Fall	CSCI	2400	1	85595	66	13	MWF	900	950	\N
2018	Fall	CSCI	2400	2	86798	39	13	MWF	1100	1150	\N
2018	Fall	CSCI	2405	1	84646	28	16	TR	1230	1345	\N
2018	Fall	CSCI	2405	2	86990	24	16	TR	1230	1345	\N
2018	Fall	CSCI	2410	1	84648	60	10	TR	800	915	\N
2018	Fall	CSCI	2410	2	86799	40	10	TR	1100	1215	\N
2018	Fall	CSCI	2530	1	84651	58	1	MWRF	1600	1650	\N
2018	Fall	CSCI	2540	1	84654	25	13	MW	1400	1515	\N
2018	Fall	CSCI	3030	1	84659	49	8	TR	930	1045	\N
2018	Fall	CSCI	3030	2	86797	20	8	TR	1530	1645	\N
2018	Fall	CSCI	3200	1	85596	7	4	TR	900	1040	\N
2018	Fall	CSCI	3584	1	85597	68	5	MWF	1000	1050	\N
2018	Fall	CSCI	3675	1	84660	46	1	MWF	1400	1450	\N
2018	Fall	CSCI	3700	1	84661	48	6	TR	1100	1215	\N
2018	Fall	CSCI	3700	2	86795	30	4	TR	1230	1345	\N
2018	Fall	CSCI	4120	1	84714	55	6	TR	1400	1515	\N
2018	Fall	CSCI	4180	1	85598	23	14	MW	1530	1645	\N
2018	Fall	CSCI	4520	1	84663	23	9	MWF	1500	1550	\N
2018	Fall	CSCI	4602	1	84709	46	1	MWF	1100	1150	\N
2018	Fall	CSCI	5501	1	86111	16	14	F	1600	1650	\N
2018	Fall	CSCI	6020	1	86860	12	6	TR	1400	1515	\N
2018	Fall	CSCI	6020	601	86861	6	6	TR	1400	1515	\N
2018	Fall	CSCI	6410	1	85678	15	5	MW	1530	1645	\N
2018	Fall	CSCI	6410	601	85686	4	5	MW	\N	\N	\N
2018	Fall	CSCI	6840	1	84792	3	4	TR	1530	1645	\N
2018	Fall	CSCI	6840	601	84793	5	4	\N	\N	\N	\N
2018	Fall	CSCI	6995	601	84795	1	15	\N	\N	\N	\N
2018	Fall	CSCI	7000	1	84796	3	15	\N	\N	\N	\N
2018	Fall	CSCI	7000	4	86031	0	12	\N	\N	\N	\N
2018	Fall	CSCI	7000	6	86039	1	6	\N	\N	\N	\N
2018	Fall	CSCI	7000	7	86909	0	6	\N	\N	\N	\N
2018	Fall	SENG	5000	1	85690	2	12	TR	1400	1540	\N
2018	Fall	SENG	5000	601	85694	5	12	\N	\N	\N	\N
2018	Fall	SENG	5005	1	85695	2	5	TR	1600	1740	\N
2018	Fall	SENG	5005	601	85696	4	5	TR	\N	\N	\N
2018	Fall	SENG	6230	1	85697	6	8	TR	1230	1345	\N
2018	Fall	SENG	6230	601	85698	6	8	\N	\N	\N	\N
2018	Fall	SENG	6235	1	85699	1	15	MW	1100	1215	\N
2018	Fall	SENG	6235	601	85700	7	15	MW	\N	\N	\N
2018	Fall	SENG	6240	1	85711	4	15	MW	1400	1515	\N
2018	Fall	SENG	6240	601	85712	5	15	\N	\N	\N	\N
2018	Fall	SENG	6250	1	85714	3	12	TR	930	1045	\N
2018	Fall	SENG	6250	601	85715	1	12	\N	\N	\N	\N
2018	Fall	SENG	6265	1	85706	3	6	TR	1100	1215	\N
2018	Fall	SENG	6265	1	85706	3	20	TR	1100	1215	\N
2018	Fall	SENG	6265	601	85708	9	20	\N	\N	\N	\N
2018	Fall	SENG	6265	601	85708	9	6	\N	\N	\N	\N
2018	Fall	SENG	6290	606	86763	1	4	\N	\N	\N	\N
2018	Fall	SENG	6290	608	87208	1	6	\N	\N	\N	\N
2018	Fall	SENG	7000	1	86043	3	15	\N	\N	\N	\N
2018	Fall	SENG	7000	4	86114	1	12	\N	\N	\N	\N
2018	Fall	SENG	7000	601	86044	1	15	\N	\N	\N	\N
2018	Fall	SENG	7000	605	86117	2	8	\N	\N	\N	\N
2018	Fall	SENG	7000	606	86994	2	8	\N	\N	\N	\N
2018	Fall	SENG	7000	607	87190	1	15	\N	\N	\N	\N
2018	Spring	CSCI	1010	1	32219	98	9	MWF	1400	1450	\N
2018	Spring	CSCI	1011	1	32220	18	9	M	1000	1150	\N
2018	Spring	CSCI	1011	2	32221	20	9	W	1000	1150	\N
2018	Spring	CSCI	1011	3	32222	23	9	F	1000	1150	\N
2018	Spring	CSCI	1011	4	32223	19	9	W	800	950	\N
2018	Spring	CSCI	1011	5	32224	17	9	F	800	950	\N
2018	Spring	CSCI	2400	1	32225	67	13	MW	1530	1645	\N
2018	Spring	CSCI	2400	2	36952	16	5	TR	1530	1645	\N
2018	Spring	CSCI	2405	1	32226	28	1	MWF	1500	1550	\N
2018	Spring	CSCI	2530	1	32227	58	1	MWF	1000	1050	\N
2018	Spring	CSCI	2540	1	32228	36	4	TR	930	1045	\N
2018	Spring	CSCI	3000	1	32229	50	22	MWF	1300	1350	\N
2018	Spring	CSCI	3010	1	32230	61	10	MWF	1100	1150	\N
2018	Spring	CSCI	3200	1	32231	7	12	TR	1400	1540	\N
2018	Spring	CSCI	3650	1	32232	56	5	TR	1230	1345	\N
2018	Spring	CSCI	4000	1	32238	28	8	W	1200	1250	\N
2018	Spring	CSCI	4130	1	32240	48	6	TR	1400	1515	\N
2018	Spring	CSCI	4140	1	32241	25	13	MWF	900	950	\N
2018	Spring	CSCI	4230	1	32235	31	12	TR	900	1040	\N
2018	Spring	CSCI	4231	1	32237	31	12	TR	900	1040	\N
2018	Spring	CSCI	4627	1	35557	1	1	\N	\N	\N	\N
2018	Spring	CSCI	4710	1	32242	31	9	MWF	1500	1550	\N
2018	Spring	CSCI	6600	1	32323	8	4	TR	1230	1345	\N
2018	Spring	CSCI	6600	601	32324	8	4	TR	1230	1345	\N
2018	Spring	CSCI	6905	1	32325	5	6	TR	1400	1515	\N
2018	Spring	CSCI	6905	2	32327	9	15	TR	930	1045	\N
2018	Spring	CSCI	6905	601	32326	4	6	TR	1400	1515	\N
2018	Spring	CSCI	6905	602	32328	2	15	TR	930	1045	\N
2018	Spring	CSCI	6995	601	36616	1	15	\N	\N	\N	\N
2018	Spring	CSCI	7000	1	36797	1	6	\N	\N	\N	\N
2018	Spring	CSCI	7000	3	37121	1	12	\N	\N	\N	\N
2018	Spring	SENG	6245	1	32329	8	8	MW	1400	1515	\N
2018	Spring	SENG	6245	601	32330	8	8	MW	1400	1515	\N
2018	Spring	SENG	6255	1	32331	14	21	MW	1230	1345	\N
2018	Spring	SENG	6255	601	32332	11	21	MW	1230	1345	\N
2018	Spring	SENG	6270	1	32333	15	21	MW	1530	1645	\N
2018	Spring	SENG	6270	601	32334	16	21	MW	1530	1645	\N
2018	Spring	SENG	6290	1	36613	1	8	\N	\N	\N	\N
2018	Spring	SENG	6290	601	36615	1	8	\N	\N	\N	\N
2018	Spring	SENG	7000	1	36617	2	15	\N	\N	\N	\N
2018	Spring	SENG	7000	3	36620	2	8	\N	\N	\N	\N
2018	Spring	SENG	7000	4	36788	1	6	\N	\N	\N	\N
2018	Spring	SENG	7000	6	37122	2	12	\N	\N	\N	\N
2018	Spring	SENG	7000	603	36621	1	8	\N	\N	\N	\N
2018	Spring	SENG	7000	606	36968	1	4	\N	\N	\N	\N
2017	Fall	CSCI	1000	1	85476	17	9	MWF	1300	1350	\N
2017	Fall	CSCI	1003	1	85477	3	9	M	1000	1150	\N
2017	Fall	CSCI	1003	2	85498	6	9	M	1400	1550	\N
2017	Fall	CSCI	1003	3	85507	2	9	W	1000	1150	\N
2017	Fall	CSCI	1003	4	85511	4	9	W	1400	1550	\N
2017	Fall	CSCI	1003	5	85522	1	9	F	1000	1150	\N
2017	Fall	CSCI	1003	6	85523	1	9	F	1400	1550	\N
2017	Fall	CSCI	1010	1	85475	136	9	MWF	1500	1550	\N
2017	Fall	CSCI	1011	1	85526	23	9	M	1200	1350	\N
2017	Fall	CSCI	1011	2	85527	22	9	W	1200	1350	\N
2017	Fall	CSCI	1011	3	85528	21	9	F	1200	1350	\N
2017	Fall	CSCI	1011	4	85529	24	9	T	1230	1350	\N
2017	Fall	CSCI	1011	5	85844	24	9	T	1400	1550	\N
2017	Fall	CSCI	1011	6	85846	23	9	R	1230	1350	\N
2017	Fall	CSCI	2400	1	85065	56	23	MWF	1400	1450	\N
2017	Fall	CSCI	2400	2	87074	13	21	TR	1530	1645	\N
2017	Fall	CSCI	2405	1	84708	35	1	MWF	1000	1050	\N
2017	Fall	CSCI	2410	1	85533	78	10	TR	930	1045	\N
2017	Fall	CSCI	2530	1	85433	52	1	MTWF	1300	1350	\N
2017	Fall	CSCI	2540	1	85546	21	13	MW	1400	1515	\N
2017	Fall	CSCI	3030	1	85545	52	12	MWF	1200	1250	\N
2017	Fall	CSCI	3200	1	85543	13	4	TR	1100	1240	\N
2017	Fall	CSCI	3584	1	85531	47	5	MWF	900	950	\N
2017	Fall	CSCI	3675	1	85455	46	1	MWF	1500	1550	\N
2017	Fall	CSCI	3700	1	85544	46	4	TR	1400	1515	\N
2017	Fall	CSCI	4000	1	86097	18	12	W	1000	1050	\N
2017	Fall	CSCI	4110	1	85535	5	22	TR	1100	1215	\N
2017	Fall	CSCI	4180	1	85548	10	14	TR	1530	1645	\N
2017	Fall	CSCI	4520	1	85547	36	13	MWF	900	950	\N
2017	Fall	CSCI	4540	1	85460	10	8	TR	930	1045	\N
2017	Fall	CSCI	4602	1	85532	29	5	MWF	1100	1150	\N
2017	Fall	CSCI	4627	1	85882	1	1	\N	\N	\N	\N
2017	Fall	CSCI	6905	1	85472	16	8	TR	930	1045	\N
2017	Fall	CSCI	6905	2	85536	6	22	TR	1100	1215	\N
2017	Fall	CSCI	6905	5	87145	1	6	\N	\N	\N	\N
2017	Fall	CSCI	6905	601	85466	3	8	TR	930	1045	\N
2017	Fall	CSCI	6905	602	85539	1	22	TR	1100	1215	\N
2017	Fall	CSCI	7000	1	86393	1	6	\N	\N	\N	\N
2017	Fall	CSCI	7000	4	86769	1	22	\N	\N	\N	\N
2017	Fall	CSCI	7000	6	87106	2	15	\N	\N	\N	\N
2017	Fall	CSCI	7000	7	86771	1	12	\N	\N	\N	\N
2017	Fall	CSCI	7000	102	87169	1	4	\N	\N	\N	\N
2017	Fall	SENG	5000	1	86759	3	6	MW	1300	1440	\N
2017	Fall	SENG	5000	601	86760	4	6	MW	1300	1440	\N
2017	Fall	SENG	6230	1	85473	15	8	TR	1400	1515	\N
2017	Fall	SENG	6230	601	85474	7	8	TR	1400	1515	\N
2017	Fall	SENG	6235	1	85549	7	15	TR	1230	1345	\N
2017	Fall	SENG	6235	601	85550	8	15	TR	1230	1345	\N
2017	Fall	SENG	6240	1	85551	11	15	TR	1530	1645	\N
2017	Fall	SENG	6240	601	85552	10	15	TR	1530	1645	\N
2017	Fall	SENG	6250	1	85540	1	22	TR	930	1045	\N
2017	Fall	SENG	6250	601	85542	6	22	\N	\N	\N	\N
2017	Fall	SENG	6265	1	85554	11	21	TR	1100	1215	\N
2017	Fall	SENG	6265	601	85555	7	21	TR	1100	1215	\N
2017	Fall	SENG	6290	601	86399	3	15	\N	\N	\N	\N
2017	Fall	SENG	6290	602	86955	1	8	\N	\N	\N	\N
2017	Fall	SENG	7000	1	86557	1	4	\N	\N	\N	\N
2017	Fall	SENG	7000	4	86841	2	15	\N	\N	\N	\N
2017	Fall	SENG	7000	5	87095	1	21	\N	\N	\N	\N
2017	Fall	SENG	7000	601	87193	1	15	\N	\N	\N	\N
2017	Fall	SENG	7000	603	86787	1	8	\N	\N	\N	\N
2017	Fall	SENG	7000	607	87107	1	8	\N	\N	\N	\N
2017	Spring	CSCI	1010	1	34041	112	9	MWF	1000	1050	\N
2017	Spring	CSCI	1011	1	34051	24	9	M	1200	1340	\N
2017	Spring	CSCI	1011	2	34929	24	9	T	1400	1540	\N
2017	Spring	CSCI	1011	3	34932	22	9	W	1200	1340	\N
2017	Spring	CSCI	1011	4	34933	23	9	R	1400	1540	\N
2017	Spring	CSCI	1011	5	34935	20	9	F	1200	1340	\N
2017	Spring	CSCI	2400	1	34225	49	5	MWF	1100	1150	\N
2017	Spring	CSCI	2405	1	34226	9	21	TR	1230	1345	\N
2017	Spring	CSCI	2530	1	34227	39	1	MTWR	1700	1750	\N
2017	Spring	CSCI	2540	1	34228	26	4	TR	1100	1215	\N
2017	Spring	CSCI	3000	1	34230	44	1	MWF	1400	1450	\N
2017	Spring	CSCI	3010	1	34231	53	9	MWF	1100	1150	\N
2017	Spring	CSCI	3200	1	34232	19	10	TR	930	1045	\N
2017	Spring	CSCI	3650	1	34236	58	13	MWF	1300	1350	\N
2017	Spring	CSCI	3800	1	34233	3	26	TR	1530	1645	\N
2017	Spring	CSCI	4000	1	34244	26	22	T	1400	1450	\N
2017	Spring	CSCI	4120	1	34245	22	6	TR	1400	1515	\N
2017	Spring	CSCI	4140	1	34339	15	13	MWF	900	950	\N
2017	Spring	CSCI	4160	1	34349	5	5	MW 	1530	1645	\N
2017	Spring	CSCI	4170	1	34927	9	12	TR	930	1045	\N
2017	Spring	CSCI	4230	1	34241	41	22	TR	1100	1250	\N
2017	Spring	CSCI	4231	1	34242	37	22	TR	1700	1800	\N
2017	Spring	CSCI	4550	1	34234	13	26	TR	930	1045	\N
2017	Spring	CSCI	4710	1	34938	16	9	MWF	1400	1450	\N
2017	Spring	CSCI	6905	1	34263	4	6	TR	1400	1515	\N
2017	Spring	CSCI	6905	2	34634	1	5	MW	1530	1645	\N
2017	Spring	CSCI	6905	601	34943	2	6	\N	1400	1515	\N
2017	Spring	CSCI	6905	602	36949	1	12	\N	\N	\N	\N
2017	Spring	CSCI	7000	6	36072	1	12	\N	\N	\N	\N
2017	Spring	CSCI	7000	7	36073	2	6	\N	\N	\N	\N
2017	Spring	CSCI	7000	8	36885	1	15	\N	\N	\N	\N
2017	Spring	SENG	6230	601	34947	8	15	MW	1400	1515	\N
2017	Spring	SENG	6245	1	34950	12	8	TR	1230	1345	\N
2017	Spring	SENG	6245	601	34957	10	8	TR	1230	1345	\N
2017	Spring	SENG	6255	1	34966	2	15	MW	1600	1715	\N
2017	Spring	SENG	6255	601	34967	13	15	MW	1600	1715	\N
2017	Spring	SENG	6275	1	34961	11	21	TR	1600	1715	\N
2017	Spring	SENG	6275	601	34963	9	21	TR	1600	1715	\N
2017	Spring	SENG	6290	5	36626	3	15	\N	\N	\N	\N
2017	Spring	SENG	6290	601	36919	1	8	\N	\N	\N	\N
2017	Spring	SENG	7000	1	36021	1	8	\N	\N	\N	\N
2017	Spring	SENG	7000	2	36022	1	21	\N	\N	\N	\N
2017	Spring	SENG	7000	3	36023	5	15	\N	\N	\N	\N
2017	Spring	SENG	7000	4	36024	2	12	\N	\N	\N	\N
2017	Spring	SENG	7000	107	36814	2	6	\N	\N	\N	\N
2017	Spring	SENG	7000	601	36795	2	8	\N	\N	\N	\N
2017	Spring	SENG	7000	606	36918	1	8	\N	\N	\N	\N
2016	Fall	CSCI	1000	1	86692	30	9	MW	1400	1515	\N
2016	Fall	CSCI	1010	1	86694	143	9	MW	1600	1715	\N
2016	Fall	CSCI	1011	1	86695	21	9	M	1000	1150	\N
2016	Fall	CSCI	1011	2	86696	23	9	T	1100	1250	\N
2016	Fall	CSCI	1011	3	86697	26	9	W	1200	1350	\N
2016	Fall	CSCI	1011	4	86698	26	9	R	1100	1250	\N
2016	Fall	CSCI	1011	5	86699	24	6	M	1400	1550	\N
2016	Fall	CSCI	1011	6	86700	23	6	W	1400	1550	\N
2016	Fall	CSCI	2400	1	86707	50	27	TR	800	915	\N
2016	Fall	CSCI	2410	1	83460	61	10	MWF	1500	1550	\N
2016	Fall	CSCI	2530	1	86704	42	1	MWF	1300	1350	\N
2016	Fall	CSCI	2540	1	86705	25	13	MW 	1700	1815	\N
2016	Fall	CSCI	3030	1	86706	48	8	TR	1530	1645	\N
2016	Fall	CSCI	3200	1	83447	26	12	MWRF	1400	1450	\N
2016	Fall	CSCI	3550	1	85747	26	26	MWF	900	950	\N
2016	Fall	CSCI	3584	1	84760	37	26	MWF	1200	1250	\N
2016	Fall	CSCI	3675	1	84762	47	1	MWF	1100	1150	\N
2016	Fall	CSCI	3700	1	83462	48	4	TR	1230	1345	\N
2016	Fall	CSCI	4000	1	84764	8	6	M	1400	1450	\N
2016	Fall	CSCI	4520	1	85791	18	13	MWF	900	950	\N
2016	Fall	CSCI	4602	1	83466	45	1	TR	1400	1515	\N
2016	Fall	CSCI	4905	1	83625	2	5	MWF	1100	1150	\N
2016	Fall	CSCI	5210	1	85257	8	22	TR	1100	1215	\N
2016	Fall	CSCI	5210	601	85258	1	22	\N	\N	\N	\N
2016	Fall	CSCI	5503	1	86689	1	15	\N	\N	\N	\N
2016	Fall	CSCI	6120	1	85363	4	22	TR	1400	1515	\N
2016	Fall	CSCI	6120	601	85364	5	22	\N	\N	\N	\N
2016	Fall	CSCI	6230	1	85392	3	21	TR	1230	1345	\N
2016	Fall	CSCI	6230	601	85393	3	21	\N	\N	\N	\N
2016	Fall	CSCI	6300	1	85708	2	5	MWF	1100	1150	\N
2016	Fall	CSCI	6410	1	85710	5	5	MWF	1400	1450	\N
2016	Fall	CSCI	6410	601	85847	1	5	\N	\N	\N	\N
2016	Fall	CSCI	6840	1	85259	4	4	TR	1530	1645	\N
2016	Fall	CSCI	6840	601	85260	3	4	\N	\N	\N	\N
2016	Fall	CSCI	6905	1	86590	7	6	MWF	1100	1150	\N
2016	Fall	CSCI	6905	601	86602	2	6	\N	\N	\N	\N
2016	Fall	CSCI	6995	1	85261	1	13	\N	\N	\N	\N
2016	Fall	CSCI	6995	4	85302	2	6	\N	\N	\N	\N
2016	Fall	CSCI	6995	5	85748	1	8	\N	\N	\N	\N
2016	Fall	CSCI	6995	606	85751	1	15	\N	\N	\N	\N
2016	Fall	CSCI	7000	1	87033	1	4	\N	\N	\N	\N
2016	Fall	SENG	6230	1	83469	8	21	TR	1230	1345	\N
2016	Fall	SENG	6230	601	83470	10	21	\N	\N	\N	\N
2016	Fall	SENG	6235	1	85254	9	15	MW	1230	1345	\N
2016	Fall	SENG	6235	601	85256	8	15	\N	\N	\N	\N
2016	Fall	SENG	6240	1	85702	6	15	MW	1530	1645	\N
2016	Fall	SENG	6240	601	85703	7	15	MW	1230	1345	\N
2016	Fall	SENG	6250	1	85704	5	8	TR	1400	1515	\N
2016	Fall	SENG	6250	601	85705	7	8	\N	\N	\N	\N
2016	Fall	SENG	6265	1	83624	10	21	TR	1100	1215	\N
2016	Fall	SENG	6265	601	85317	8	21	\N	\N	\N	\N
2016	Fall	SENG	6290	1	85338	1	8	\N	\N	\N	\N
2016	Fall	SENG	6290	2	85344	1	15	\N	\N	\N	\N
2016	Fall	SENG	6290	3	85349	1	22	\N	\N	\N	\N
2016	Fall	SENG	6290	6	86998	1	12	\N	\N	\N	\N
2016	Fall	SENG	6290	601	85341	2	21	\N	\N	\N	\N
2016	Fall	SENG	6290	602	85346	1	15	\N	\N	\N	\N
2016	Fall	SENG	6290	603	85350	1	22	\N	\N	\N	\N
2016	Fall	SENG	6290	605	86799	1	6	\N	\N	\N	\N
2016	Fall	SENG	7000	1	85756	2	15	\N	\N	\N	\N
2016	Fall	SENG	7000	4	86009	1	22	\N	\N	\N	\N
2016	Fall	SENG	7000	601	85759	2	15	\N	\N	\N	\N
2016	Fall	SENG	7000	602	85761	2	8	\N	\N	\N	\N
2016	Fall	SENG	7000	604	87099	1	22	\N	\N	\N	\N
2016	Spring	CSCI	1001	1	35358	34	9	TR	1100	1215	\N
2016	Spring	CSCI	2310	1	35295	92	6	MWF	900	950	\N
2016	Spring	CSCI	2311	1	35325	25	6	M	1000	1140	\N
2016	Spring	CSCI	2311	2	35332	19	6	TR	1100	1240	\N
2016	Spring	CSCI	2311	3	35337	27	6	W	1200	1340	\N
2016	Spring	CSCI	2311	4	35355	21	6	R	1300	1440	\N
2016	Spring	CSCI	2410	1	36378	28	10	MWF	900	950	\N
2016	Spring	CSCI	2427	1	35291	56	5	MWF	1000	1050	\N
2016	Spring	CSCI	3200	1	35377	24	13	MTWF	900	950	\N
2016	Spring	CSCI	3300	1	35142	38	1	MWR	1100	1150	\N
2016	Spring	CSCI	3310	1	35124	21	4	TR	1400	1515	\N
2016	Spring	CSCI	3650	1	35387	32	13	MWF	1300	1350	\N
2016	Spring	CSCI	3800	1	35340	13	26	MWF	900	950	\N
2016	Spring	CSCI	4000	1	35391	26	13	M	1600	1700	\N
2016	Spring	CSCI	4230	1	35341	33	8	TR	1400	1515	\N
2016	Spring	CSCI	4530	1	35364	25	9	TR	1230	1345	\N
2016	Spring	CSCI	4550	1	35351	15	26	MWF	1200	1250	\N
2016	Spring	CSCI	4630	1	35252	31	22	TR	1230	1345	\N
2016	Spring	CSCI	4710	1	35372	26	9	TR	1700	1815	\N
2016	Spring	CSCI	4905	1	35277	13	5	MWF	1500	1550	\N
2016	Spring	CSCI	4905	2	36405	10	14	WF	1400	1515	\N
2016	Spring	CSCI	5220	1	35204	8	1	MWF	1300	1350	\N
2016	Spring	CSCI	5220	601	36195	5	1	MWF	1300	1350	\N
2016	Spring	CSCI	5502	1	36902	1	13	\N	\N	\N	\N
2016	Spring	CSCI	5503	1	36926	1	21	\N	800	850	\N
2016	Spring	CSCI	6100	1	35305	3	5	MWF	1500	1550	\N
2016	Spring	CSCI	6230	1	35379	2	15	TR	1230	1335	\N
2016	Spring	CSCI	6230	601	35392	2	15	\N	\N	\N	\N
2016	Spring	CSCI	6420	1	35095	6	1	MWF	1600	1650	\N
2016	Spring	CSCI	6420	601	35122	5	1	\N	\N	\N	\N
2016	Spring	CSCI	6600	1	35191	7	6	MWF	1100	1150	\N
2016	Spring	CSCI	6600	601	35218	4	6	\N	\N	\N	\N
2016	Spring	CSCI	6905	2	36460	1	15	\N	\N	\N	\N
2016	Spring	CSCI	6995	1	36384	2	8	\N	\N	\N	\N
2016	Spring	CSCI	7000	1	36190	3	15	\N	\N	\N	\N
2016	Spring	CSCI	7000	2	36907	1	6	\N	\N	\N	\N
2016	Spring	SENG	6230	1	35367	1	15	TR	1230	1335	\N
2016	Spring	SENG	6230	601	35375	1	15	\N	\N	\N	\N
2016	Spring	SENG	6245	1	35298	4	22	TR	1100	1215	\N
2016	Spring	SENG	6245	601	35328	11	22	\N	\N	\N	\N
2016	Spring	SENG	6260	1	35395	8	15	TR	930	1045	\N
2016	Spring	SENG	6260	601	35401	6	15	\N	\N	\N	\N
2016	Spring	SENG	6270	1	35150	13	21	TR	1530	1645	\N
2016	Spring	SENG	6270	601	35189	11	21	\N	\N	\N	\N
2016	Spring	SENG	6280	1	36376	4	21	TR	1400	1515	\N
2016	Spring	SENG	6280	601	36377	7	21	\N	\N	\N	\N
2016	Spring	SENG	6290	1	36492	1	21	\N	\N	\N	\N
2016	Spring	SENG	6290	601	36425	1	21	\N	\N	\N	\N
2016	Spring	SENG	6290	602	36493	2	15	\N	\N	\N	\N
2016	Spring	SENG	7000	2	36235	1	15	\N	\N	\N	\N
2016	Spring	SENG	7000	3	36265	1	15	\N	\N	\N	\N
2016	Spring	SENG	7000	4	36766	1	22	\N	\N	\N	\N
2016	Spring	SENG	7000	601	36152	2	15	\N	\N	\N	\N
2016	Spring	SENG	7000	602	36154	1	21	\N	\N	\N	\N
2016	Spring	SENG	7000	603	36232	1	8	\N	\N	\N	\N
2016	Spring	SENG	7000	604	36240	1	4	\N	\N	\N	\N
2016	Spring	SENG	7000	605	36241	1	22	\N	\N	\N	\N
2016	Spring	SENG	7000	606	36578	1	8	\N	\N	\N	\N
2015	Fall	CSCI	1001	1	82943	22	24	MWF	1000	1050	\N
2015	Fall	CSCI	1001	2	82946	22	25	TR	930	1045	\N
2015	Fall	CSCI	2310	1	82949	38	6	TR	930	1045	\N
2015	Fall	CSCI	2310	2	82955	39	9	TR	1100	1215	\N
2015	Fall	CSCI	2310	3	86778	43	6	MWF	1200	1250	\N
2015	Fall	CSCI	2311	1	82958	19	9	TR	1300	1450	\N
2015	Fall	CSCI	2311	2	82963	20	9	R	1300	1450	\N
2015	Fall	CSCI	2311	3	83037	19	6	M	1300	1450	\N
2015	Fall	CSCI	2311	4	83051	20	6	W	1300	1450	\N
2015	Fall	CSCI	2311	5	86782	21	6	M	1500	1650	\N
2015	Fall	CSCI	2311	6	86783	21	6	W	1500	1650	\N
2015	Fall	CSCI	2410	1	83054	44	5	MWF	1100	1150	\N
2015	Fall	CSCI	2427	1	83061	58	21	TR	1400	1515	\N
2015	Fall	CSCI	3200	1	83062	16	1	MTWF	1300	1350	\N
2015	Fall	CSCI	3300	1	83071	33	1	MTWF	900	950	\N
2015	Fall	CSCI	3310	1	83073	20	13	MW 	1700	1815	\N
2015	Fall	CSCI	3550	1	83074	26	26	MWF	1000	1050	\N
2015	Fall	CSCI	3584	1	83075	40	26	MWF	1200	1250	\N
2015	Fall	CSCI	3675	1	83078	29	1	MWF	1100	1150	\N
2015	Fall	CSCI	3700	1	83080	37	4	TR	1400	1515	\N
2015	Fall	CSCI	4000	1	83082	12	9	TR	1530	1620	\N
2015	Fall	CSCI	4200	1	83090	15	8	TR	930	1045	\N
2015	Fall	CSCI	4200	2	83092	23	8	TR	1230	1345	\N
2015	Fall	CSCI	4230	1	87120	1	8	MWF	1200	1250	\N
2015	Fall	CSCI	4300	1	83096	16	9	TR	1700	1815	\N
2015	Fall	CSCI	4520	1	83100	12	13	MWF	900	950	\N
2015	Fall	CSCI	4602	1	83101	41	5	MW 	1530	1645	\N
2015	Fall	CSCI	5210	1	83252	5	5	MWF	1400	1450	\N
2015	Fall	CSCI	5210	601	83265	2	5	\N	\N	\N	\N
2015	Fall	CSCI	5800	1	83277	7	13	MW	1400	1515	\N
2015	Fall	CSCI	5800	601	83280	1	13	\N	\N	\N	\N
2015	Fall	CSCI	6120	1	83284	13	9	TR	2000	2115	\N
2015	Fall	CSCI	6120	1	83284	13	15	TR	2000	2115	\N
2015	Fall	CSCI	6120	601	83288	6	9	\N	\N	\N	\N
2015	Fall	CSCI	6120	601	83288	6	15	\N	\N	\N	\N
2015	Fall	CSCI	6230	1	83344	4	15	TR	1730	1845	\N
2015	Fall	CSCI	6230	601	83346	1	15	\N	\N	\N	\N
2015	Fall	CSCI	6840	1	83298	5	4	TR	1100	1215	\N
2015	Fall	CSCI	6840	601	83313	8	4	\N	\N	\N	\N
2015	Fall	CSCI	6995	1	86806	0	4	\N	\N	\N	\N
2015	Fall	CSCI	7000	1	86585	1	15	\N	\N	\N	\N
2015	Fall	CSCI	7000	2	86586	0	5	\N	\N	\N	\N
2015	Fall	CSCI	7000	4	87382	1	4	\N	\N	\N	\N
2015	Fall	SENG	6230	1	83351	5	15	TR	1400	1515	\N
2015	Fall	SENG	6230	601	83356	8	15	\N	\N	\N	\N
2015	Fall	SENG	6235	1	83361	7	15	TR	1530	1645	\N
2015	Fall	SENG	6235	601	83388	16	15	\N	\N	\N	\N
2015	Fall	SENG	6240	1	83401	12	22	MW	1400	1515	\N
2015	Fall	SENG	6240	601	83436	9	22	\N	\N	\N	\N
2015	Fall	SENG	6250	1	83445	9	22	MW	1530	1645	\N
2015	Fall	SENG	6250	601	83461	11	22	\N	\N	\N	\N
2015	Fall	SENG	6255	1	83466	12	21	TR	1600	1715	\N
2015	Fall	SENG	6255	601	83469	9	21	\N	\N	\N	\N
2015	Fall	SENG	6275	1	87121	1	8	\N	\N	\N	\N
2015	Fall	SENG	6290	1	86860	2	21	\N	\N	\N	\N
2015	Fall	SENG	6290	2	87230	4	8	\N	\N	\N	\N
2015	Fall	SENG	6290	3	87342	1	13	\N	\N	\N	\N
2015	Fall	SENG	6290	601	86789	2	22	\N	\N	\N	\N
2015	Fall	SENG	6290	602	87091	2	15	\N	\N	\N	\N
2015	Fall	SENG	6290	603	87356	1	8	\N	\N	\N	\N
2015	Fall	SENG	7000	1	86539	4	15	\N	\N	\N	\N
2015	Fall	SENG	7000	2	86909	1	8	\N	\N	\N	\N
2015	Fall	SENG	7000	601	86871	1	21	\N	\N	\N	\N
2015	Fall	SENG	7000	602	87079	1	15	\N	\N	\N	\N
2015	Fall	SENG	7000	603	87277	1	8	\N	\N	\N	\N
\.


--
-- Data for Name: schedule2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schedule2 (year, semester, prefix, number, section, crn, instructor, days, begintime, endtime, remarks) FROM stdin;
\.


--
-- Data for Name: test2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test2 (year, semester, prefix, number, section, crn, instructor, days, begintime, endtime, remarks) FROM stdin;
\.


--
-- Data for Name: test3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test3 (year, semester, prefix, number, section, crn, instructor, days, begintime, endtime, remarks) FROM stdin;
\.


--
-- Data for Name: test4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test4 (year, semester, prefix, number, section, crn, instructor, days, begintime, endtime, remarks) FROM stdin;
\.


--
-- Data for Name: test5; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test5 (year, semester, prefix, number, section, crn, instructor, days, begintime, endtime, remarks) FROM stdin;
\.


--
-- Data for Name: test6; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test6 (year, semester, prefix, number, section, crn, instructor, days, begintime, endtime, remarks) FROM stdin;
\.


--
-- Data for Name: test7; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test7 (year, semester, prefix, number, section, crn, instructor, days, begintime, endtime, remarks) FROM stdin;
\.


--
-- Name: DATABASE group2db; Type: ACL; Schema: -; Owner: postgres
--

GRANT CONNECT ON DATABASE group2db TO webuser1;


--
-- Name: TABLE committee_assignments; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.committee_assignments TO webuser1;


--
-- Name: TABLE committee_names; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.committee_names TO webuser1;


--
-- Name: TABLE directors; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.directors TO webuser1;


--
-- Name: TABLE faculty; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.faculty TO webuser1;


--
-- Name: TABLE prereq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.prereq TO webuser1;


--
-- Name: TABLE schedule; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.schedule TO webuser1;


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

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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
-- PostgreSQL database cluster dump complete
--

