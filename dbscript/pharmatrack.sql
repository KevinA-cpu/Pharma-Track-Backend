--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2022-11-21 21:59:54

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
-- TOC entry 218 (class 1259 OID 16833)
-- Name: appointment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointment (
    id_appointment integer NOT NULL,
    "time" character varying(10),
    doctor character varying(50),
    test character varying(50),
    number character varying(50),
    address character varying(50),
    status character varying(25)
);


ALTER TABLE public.appointment OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16832)
-- Name: appointments_id_appointment_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_id_appointment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_id_appointment_seq OWNER TO postgres;

--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 217
-- Name: appointments_id_appointment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_id_appointment_seq OWNED BY public.appointment.id_appointment;


--
-- TOC entry 214 (class 1259 OID 16807)
-- Name: clinic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clinic (
    id bigint NOT NULL,
    id_clinic character varying(50) NOT NULL,
    name_clinic character varying(50) NOT NULL,
    name_doctor character varying(50) NOT NULL,
    country character varying(50),
    address character varying(50),
    status_clinic character varying(50) NOT NULL
);


ALTER TABLE public.clinic OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16810)
-- Name: clinic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clinic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clinic_id_seq OWNER TO postgres;

--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 215
-- Name: clinic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clinic_id_seq OWNED BY public.clinic.id;


--
-- TOC entry 216 (class 1259 OID 16811)
-- Name: prescription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prescription (
    id_presctiption integer,
    image character varying(50),
    date_medical date
);


ALTER TABLE public.prescription OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16840)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    id_staff integer NOT NULL,
    name character varying(50),
    number character varying(50),
    type character varying(20)
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16839)
-- Name: staff_id_staff_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_id_staff_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_id_staff_seq OWNER TO postgres;

--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 219
-- Name: staff_id_staff_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_id_staff_seq OWNED BY public.staff.id_staff;


--
-- TOC entry 3188 (class 2604 OID 16836)
-- Name: appointment id_appointment; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment ALTER COLUMN id_appointment SET DEFAULT nextval('public.appointments_id_appointment_seq'::regclass);


--
-- TOC entry 3187 (class 2604 OID 16814)
-- Name: clinic id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clinic ALTER COLUMN id SET DEFAULT nextval('public.clinic_id_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 16843)
-- Name: staff id_staff; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN id_staff SET DEFAULT nextval('public.staff_id_staff_seq'::regclass);


--
-- TOC entry 3342 (class 0 OID 16833)
-- Dependencies: 218
-- Data for Name: appointment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointment (id_appointment, "time", doctor, test, number, address, status) FROM stdin;
1	6:06 PM	Toby Book	Other conjunctivitis	140-647-2125	88 Pierstorff Parkway	waiting
2	6:04 PM	Gunilla Franchyonok	Manic affective disorder, recurrent episode, mild	810-908-9702	1705 Melvin Hill	scheduled
3	3:57 AM	Truda Reay	Burn of unspecified site, unspecified degree	352-869-3711	84715 Sheridan Court	waiting
\.


--
-- TOC entry 3338 (class 0 OID 16807)
-- Dependencies: 214
-- Data for Name: clinic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clinic (id, id_clinic, name_clinic, name_doctor, country, address, status_clinic) FROM stdin;
1	14-078-3217	The Magni Company	Gerri Mertgen	\N	\N	false
2	53-646-6025	Physicians Total Care, Inc.	Zulema Divina	\N	\N	true
3	28-175-7897	Supervalu Inc	Silvio McInally	\N	\N	true
4	85-036-0471	Hy-Vee, Inc	Ricca Ahrens	\N	\N	false
5	20-031-2574	Antigen Laboratories, Inc.	Martita Blannin	\N	\N	true
6	87-572-8146	Amerisource Bergen	Tuck Rannells	\N	\N	false
7	62-528-3614	AbbVie Inc.	Johanna Oldford	\N	\N	true
8	21-412-3609	Gen-Source Rx	Kizzee Pidcock	\N	\N	false
9	80-354-3139	Nelco Laboratories, Inc.	Selinda Sein	\N	\N	false
10	50-956-3927	Guthy-Renker LLC	Juan Viant	\N	\N	false
11	16-192-1359	Natural Health Supply	Carlene Klimpt	\N	\N	false
12	29-498-9707	BluePoint Laboratories	Danyette Perett	\N	\N	true
13	29-674-6502	Galderma Laboratories, L.P.	Hillie Zaniolo	\N	\N	false
14	39-684-0844	ENERGIZER PERSONAL CARE LLC	Mozelle Kempston	\N	\N	false
15	91-730-5079	A-S Medication Solutions LLC	Danni Castagnaro	\N	\N	true
16	69-682-0038	CVS pharmacy	Lesley Mulcaster	\N	\N	true
17	44-735-8272	DSHealthcare	Chickie Riply	\N	\N	true
18	58-119-9155	KVK-TECH, INC.	Maddy Afonso	\N	\N	true
19	21-891-7981	AvKARE, Inc.	Waiter King	\N	\N	false
20	13-605-7583	OnPoint, Inc	Patton Rousell	\N	\N	true
21	62-063-9074	Procter & Gamble Manufacturing Co.	Cornell Amies	\N	\N	false
22	08-537-5918	Procter & Gamble Manufacturing Company	Hunter Rubenovic	\N	\N	true
23	06-040-2379	General Injectables & Vaccines, Inc	Elsy Bouldstridge	\N	\N	true
24	42-496-2476	Premier Bioceuticals LLC.	Nicolle Tucker	\N	\N	true
25	52-829-7967	Allermed Laboratories, Inc.	Claudie Poole	\N	\N	true
26	92-819-9055	Rebel Distributors Corp	Aron Bouldon	\N	\N	true
27	54-113-1375	Cardinal Health	Bessie Argont	\N	\N	true
28	92-440-2713	Ventura Corporation Ltd.	Merwyn Deighan	\N	\N	false
29	57-207-6822	West-ward Pharmaceutical Corp	Joe Hargitt	\N	\N	false
30	49-174-9633	McKesson Contract Packaging	Casar McGovern	\N	\N	true
31	88-879-6319	Amar Remedies Limited	Hillel Van Halle	\N	\N	true
32	33-325-1011	Natural Health Supply	Benson Klaussen	\N	\N	false
33	42-761-3044	Kinray	Davita Neising	\N	\N	true
34	28-244-5107	REMEDYREPACK INC.	Cad Twiggins	\N	\N	false
35	70-591-7781	BioActive Nutritional, Inc.	Janot Freed	\N	\N	false
36	11-195-8270	GeneraMedix Inc.	Berti Stealy	\N	\N	false
37	51-192-8079	Mckesson	Cherish Skeete	\N	\N	false
38	86-166-8379	Cardinal Health	Clywd Baythrop	\N	\N	false
39	59-029-9357	BioActive Nutritional, Inc.	Anthiathia Barns	\N	\N	true
40	18-493-6908	Nelco Laboratories, Inc.	Kacy Pennigar	\N	\N	false
41	11-175-0973	AMERICAN SALES COMPANY	Gordie Sommer	\N	\N	false
42	14-391-0704	K&J.C Co., Ltd	Christophe Samson	\N	\N	true
43	51-966-5913	Stat Rx USA	Bryanty Charlwood	\N	\N	false
44	27-338-7207	Aphena Pharma Solutions - Tennessee, LLC	Zeb Waudby	\N	\N	false
45	32-951-6208	Hospira, Inc.	Ric Tranmer	\N	\N	true
46	68-086-0681	KMART CORPORATION	Shamus Zum Felde	\N	\N	true
47	59-756-4733	Watson Laboratories, Inc.	Dannie McNysche	\N	\N	true
48	75-300-3442	Merck Sharp & Dohme Corp.	Lizette Boulger	\N	\N	true
49	03-871-3409	Cardinal Health	Dora Sparham	\N	\N	false
50	21-417-7974	Rebel Distributors Corp	Dehlia Franzonello	\N	\N	true
51	02-728-1897	Kremers Urban Pharmaceuticals Inc.	Sibel Sloam	\N	\N	false
52	27-484-8106	Contract Pharmacal Corp	Kalila Alvy	\N	\N	true
53	54-443-4649	Northwind Pharmaceuticals	Tabby Taber	\N	\N	false
54	62-137-6398	REMEDYREPACK INC.	Gardy Thorius	\N	\N	true
55	14-295-9791	Caraco Pharmaceutical Laboratories, Ltd.	Trip Olley	\N	\N	true
56	38-117-0336	Sandoz Inc	Lanna Thomelin	\N	\N	true
57	79-215-9424	REMEDYREPACK INC.	Jefferey Temprell	\N	\N	true
58	89-762-9833	Mylan Pharmaceuticals Inc.	Chas Limeburner	\N	\N	false
59	02-058-3191	Upsher-Smith Laboratories, Inc.	Aurthur Dallison	\N	\N	false
60	33-351-5129	Eli Lilly and Company	Brook Fort	\N	\N	false
61	34-968-8153	Physicians Total Care, Inc.	Cass Furney	\N	\N	true
62	31-604-9363	NCS HealthCare of KY, Inc dba Vangard Labs	Bartholomeus Vernau	\N	\N	false
63	64-798-4335	Gen-Source Rx	Toiboid Thickpenny	\N	\N	true
64	40-683-4165	RedPharm Drug Inc.	Dorie Muller	\N	\N	true
65	49-926-4466	GOJO Industries, Inc.	Brandon Ubsdall	\N	\N	false
66	43-663-2810	McKesson Contract Packaging	Humfrey Leftridge	\N	\N	false
67	61-192-0689	EQUALINE (SuperValu)	Bevvy Bloomer	\N	\N	false
68	25-650-8253	BCM Cosmetique SAS	Anallise O'Brogane	\N	\N	false
69	05-973-8638	American Health Packaging	Grethel Heamus	\N	\N	false
70	44-726-6447	REMEDYREPACK INC.	Janek Di Maria	\N	\N	true
71	10-550-5772	Allermed Laboratories, Inc.	Rickard Audritt	\N	\N	true
72	97-080-3471	Indiana Botanic Gardens	Heddi McRorie	\N	\N	false
73	12-006-4171	Natural Health Supply	Ianthe Jealous	\N	\N	true
74	87-049-5698	BioActive Nutritional, Inc.	Larisa Wadeson	\N	\N	false
75	50-518-0768	Sun Pharmaceutical Industries Limited	Jessy Sanderson	\N	\N	false
76	93-743-8352	Sandoz Inc.	Dana Cornew	\N	\N	false
77	34-849-8751	Amneal Pharmaceuticals	Frank Thornhill	\N	\N	true
78	52-615-1164	State of Florida DOH Central Pharmacy	Kellen Condict	\N	\N	false
79	19-019-6474	Prestige Brands Holdings, Inc.	Matthias Dechelette	\N	\N	true
80	44-130-5117	Nelco Laboratories, Inc.	Ronica Mardy	\N	\N	false
81	23-597-0905	Walgreen Company	Brod Baynam	\N	\N	false
82	02-065-2223	Par Pharmaceutical Inc.	Judie Igo	\N	\N	false
83	04-613-0527	Deb USA, Inc.	Cathie Kleimt	\N	\N	false
84	13-111-3124	Mylan Institutional Inc.	Perceval Tofts	\N	\N	false
85	02-663-3330	Rebel Distributors Corp	Murielle Korneichuk	\N	\N	true
86	54-611-7186	Par Pharmaceutical, Inc.	Nananne Brownrigg	\N	\N	true
87	07-966-8181	American Sales Company	Sharity Govini	\N	\N	true
88	83-368-9670	Physicians Total Care, Inc.	Cherry Sellars	\N	\N	true
89	58-991-6786	SHISEIDO CO., LTD.	Chiquia Wingham	\N	\N	false
90	74-542-4548	Energetix Corp	Gloriane Kristof	\N	\N	false
91	26-026-5383	Aloe Vera of America, Inc.	Eugenius Orgel	\N	\N	true
92	88-009-9719	Sun & Skin Care Research, LLC	Emlynn Darte	\N	\N	true
93	38-984-2817	A-S Medication Solutions LLC	Van Hayball	\N	\N	true
94	29-205-1296	West-ward Pharmaceutical Corp.	Rosene Malarkey	\N	\N	true
95	70-100-7171	L Perrigo Company	Michael Fossey	\N	\N	false
96	16-885-9016	AMERICAN CHEMICAL AND SANITARY SUPPLY INC	Merralee Parnham	\N	\N	false
97	20-350-0083	SHISEIDO CO., LTD.	Trixi Bolesworth	\N	\N	false
98	70-454-9131	Kmart Corporation	Norry Frankcomb	\N	\N	false
\.


--
-- TOC entry 3340 (class 0 OID 16811)
-- Dependencies: 216
-- Data for Name: prescription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prescription (id_presctiption, image, date_medical) FROM stdin;
1	http://dummyimage.com/145x100.png/5fa2dd/ffffff	2022-10-19
2	http://dummyimage.com/117x100.png/cc0000/ffffff	2022-10-04
3	http://dummyimage.com/141x100.png/5fa2dd/ffffff	2021-12-14
4	http://dummyimage.com/180x100.png/ff4444/ffffff	2022-05-10
5	http://dummyimage.com/141x100.png/ff4444/ffffff	2022-02-01
6	http://dummyimage.com/120x100.png/5fa2dd/ffffff	2021-11-24
7	http://dummyimage.com/243x100.png/ff4444/ffffff	2022-09-03
8	http://dummyimage.com/223x100.png/ff4444/ffffff	2022-01-05
9	http://dummyimage.com/123x100.png/dddddd/000000	2022-07-10
10	http://dummyimage.com/219x100.png/dddddd/000000	2022-03-29
11	http://dummyimage.com/106x100.png/cc0000/ffffff	2022-02-09
12	http://dummyimage.com/136x100.png/5fa2dd/ffffff	2022-01-11
13	http://dummyimage.com/201x100.png/cc0000/ffffff	2021-12-18
14	http://dummyimage.com/119x100.png/dddddd/000000	2022-09-30
15	http://dummyimage.com/185x100.png/dddddd/000000	2022-01-24
16	http://dummyimage.com/202x100.png/dddddd/000000	2022-04-22
17	http://dummyimage.com/170x100.png/5fa2dd/ffffff	2022-07-24
18	http://dummyimage.com/133x100.png/dddddd/000000	2022-02-19
19	http://dummyimage.com/198x100.png/dddddd/000000	2022-01-07
20	http://dummyimage.com/147x100.png/cc0000/ffffff	2022-05-09
21	http://dummyimage.com/211x100.png/dddddd/000000	2022-07-14
22	http://dummyimage.com/225x100.png/5fa2dd/ffffff	2022-03-31
23	http://dummyimage.com/152x100.png/dddddd/000000	2022-01-26
24	http://dummyimage.com/129x100.png/ff4444/ffffff	2022-01-13
25	http://dummyimage.com/212x100.png/cc0000/ffffff	2022-04-20
26	http://dummyimage.com/113x100.png/ff4444/ffffff	2022-08-21
27	http://dummyimage.com/192x100.png/5fa2dd/ffffff	2022-02-17
28	http://dummyimage.com/119x100.png/dddddd/000000	2022-02-08
29	http://dummyimage.com/101x100.png/dddddd/000000	2022-06-18
30	http://dummyimage.com/108x100.png/5fa2dd/ffffff	2022-03-22
31	http://dummyimage.com/212x100.png/cc0000/ffffff	2022-03-31
32	http://dummyimage.com/167x100.png/ff4444/ffffff	2022-06-23
33	http://dummyimage.com/212x100.png/dddddd/000000	2022-02-10
34	http://dummyimage.com/214x100.png/5fa2dd/ffffff	2022-08-04
35	http://dummyimage.com/243x100.png/cc0000/ffffff	2022-06-05
36	http://dummyimage.com/193x100.png/5fa2dd/ffffff	2021-12-14
37	http://dummyimage.com/136x100.png/dddddd/000000	2022-01-06
38	http://dummyimage.com/166x100.png/dddddd/000000	2022-06-20
39	http://dummyimage.com/187x100.png/dddddd/000000	2022-03-17
40	http://dummyimage.com/184x100.png/ff4444/ffffff	2022-05-24
41	http://dummyimage.com/157x100.png/5fa2dd/ffffff	2022-08-04
42	http://dummyimage.com/214x100.png/5fa2dd/ffffff	2022-07-05
43	http://dummyimage.com/200x100.png/cc0000/ffffff	2022-07-06
44	http://dummyimage.com/235x100.png/ff4444/ffffff	2022-06-24
45	http://dummyimage.com/135x100.png/dddddd/000000	2022-03-08
46	http://dummyimage.com/139x100.png/dddddd/000000	2022-08-14
47	http://dummyimage.com/109x100.png/cc0000/ffffff	2022-09-01
48	http://dummyimage.com/217x100.png/5fa2dd/ffffff	2022-10-09
49	http://dummyimage.com/176x100.png/ff4444/ffffff	2022-11-15
50	http://dummyimage.com/102x100.png/ff4444/ffffff	2022-05-22
51	http://dummyimage.com/176x100.png/cc0000/ffffff	2022-09-27
52	http://dummyimage.com/165x100.png/cc0000/ffffff	2022-07-06
53	http://dummyimage.com/148x100.png/cc0000/ffffff	2022-01-02
54	http://dummyimage.com/191x100.png/cc0000/ffffff	2022-03-27
55	http://dummyimage.com/174x100.png/dddddd/000000	2022-01-20
56	http://dummyimage.com/237x100.png/dddddd/000000	2022-04-22
57	http://dummyimage.com/174x100.png/ff4444/ffffff	2022-03-23
58	http://dummyimage.com/140x100.png/cc0000/ffffff	2022-10-28
59	http://dummyimage.com/248x100.png/cc0000/ffffff	2022-02-12
60	http://dummyimage.com/192x100.png/dddddd/000000	2022-11-12
61	http://dummyimage.com/173x100.png/dddddd/000000	2022-10-06
62	http://dummyimage.com/132x100.png/5fa2dd/ffffff	2022-11-01
63	http://dummyimage.com/191x100.png/5fa2dd/ffffff	2022-02-11
64	http://dummyimage.com/237x100.png/ff4444/ffffff	2022-02-20
65	http://dummyimage.com/148x100.png/5fa2dd/ffffff	2022-01-18
66	http://dummyimage.com/105x100.png/5fa2dd/ffffff	2022-03-09
67	http://dummyimage.com/118x100.png/dddddd/000000	2022-05-19
68	http://dummyimage.com/250x100.png/5fa2dd/ffffff	2022-02-25
69	http://dummyimage.com/249x100.png/5fa2dd/ffffff	2022-01-10
70	http://dummyimage.com/178x100.png/5fa2dd/ffffff	2022-05-13
71	http://dummyimage.com/187x100.png/ff4444/ffffff	2022-05-09
72	http://dummyimage.com/223x100.png/dddddd/000000	2022-01-25
73	http://dummyimage.com/107x100.png/5fa2dd/ffffff	2022-09-03
74	http://dummyimage.com/147x100.png/cc0000/ffffff	2022-09-18
75	http://dummyimage.com/247x100.png/5fa2dd/ffffff	2022-07-16
76	http://dummyimage.com/163x100.png/dddddd/000000	2022-04-26
77	http://dummyimage.com/219x100.png/dddddd/000000	2022-07-31
78	http://dummyimage.com/197x100.png/cc0000/ffffff	2022-04-11
79	http://dummyimage.com/167x100.png/ff4444/ffffff	2022-07-31
80	http://dummyimage.com/131x100.png/cc0000/ffffff	2022-04-01
81	http://dummyimage.com/194x100.png/cc0000/ffffff	2022-07-23
82	http://dummyimage.com/236x100.png/dddddd/000000	2022-09-12
83	http://dummyimage.com/149x100.png/ff4444/ffffff	2022-02-21
84	http://dummyimage.com/206x100.png/cc0000/ffffff	2022-07-01
85	http://dummyimage.com/168x100.png/dddddd/000000	2022-03-30
86	http://dummyimage.com/198x100.png/5fa2dd/ffffff	2022-06-14
87	http://dummyimage.com/187x100.png/ff4444/ffffff	2022-01-28
88	http://dummyimage.com/161x100.png/dddddd/000000	2022-05-25
89	http://dummyimage.com/128x100.png/dddddd/000000	2022-02-25
90	http://dummyimage.com/250x100.png/5fa2dd/ffffff	2022-05-05
91	http://dummyimage.com/109x100.png/5fa2dd/ffffff	2021-12-04
92	http://dummyimage.com/229x100.png/cc0000/ffffff	2022-02-02
93	http://dummyimage.com/127x100.png/dddddd/000000	2022-11-19
94	http://dummyimage.com/160x100.png/cc0000/ffffff	2022-10-14
95	http://dummyimage.com/183x100.png/cc0000/ffffff	2022-09-28
96	http://dummyimage.com/129x100.png/ff4444/ffffff	2022-03-16
97	http://dummyimage.com/147x100.png/5fa2dd/ffffff	2022-01-02
98	http://dummyimage.com/120x100.png/dddddd/000000	2022-03-13
99	http://dummyimage.com/179x100.png/ff4444/ffffff	2022-10-08
100	http://dummyimage.com/210x100.png/5fa2dd/ffffff	2021-12-06
\.


--
-- TOC entry 3344 (class 0 OID 16840)
-- Dependencies: 220
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (id_staff, name, number, type) FROM stdin;
1	Tibold Thirst	611-449-9470	doctor
2	Doris Simenon	348-748-3881	nurse
3	Gene Petrozzi	381-966-5716	staff
\.


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 217
-- Name: appointments_id_appointment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_id_appointment_seq', 3, true);


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 215
-- Name: clinic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clinic_id_seq', 98, true);


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 219
-- Name: staff_id_staff_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_id_staff_seq', 3, true);


--
-- TOC entry 3193 (class 2606 OID 16838)
-- Name: appointment appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id_appointment);


--
-- TOC entry 3191 (class 2606 OID 16816)
-- Name: clinic clinic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clinic
    ADD CONSTRAINT clinic_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 16845)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id_staff);


-- Completed on 2022-11-21 21:59:54

--
-- PostgreSQL database dump complete
--

