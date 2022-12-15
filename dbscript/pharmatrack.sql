--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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
-- Name: appointment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointment (
    id_appointment character varying(10) NOT NULL,
    "time" character varying(20),
    doctor character varying(50),
    test character varying(50),
    number character varying(50),
    address character varying(50),
    status character varying(25)
);


ALTER TABLE public.appointment OWNER TO postgres;

--
-- Name: appointment_id_appointment_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointment_id_appointment_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.appointment_id_appointment_seq OWNER TO postgres;

--
-- Name: appointment_id_appointment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointment_id_appointment_seq OWNED BY public.appointment.id_appointment;


--
-- Name: clinic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clinic (
    id_clinic character varying(50) NOT NULL,
    name_clinic character varying(50) NOT NULL,
    name_doctor character varying(50) NOT NULL,
    province character varying(50),
    city character varying(50),
    address character varying(50),
    status_clinic character varying(50)
);


ALTER TABLE public.clinic OWNER TO postgres;

--
-- Name: doctortime; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctortime (
    id_doctortime character varying(10) NOT NULL,
    doctor character varying(50),
    shift character varying(40),
    status boolean
);


ALTER TABLE public.doctortime OWNER TO postgres;

--
-- Name: prescription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prescription (
    id_prescription character varying(50)
);


ALTER TABLE public.prescription OWNER TO postgres;

--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    id_staff character varying(10) NOT NULL,
    name character varying(50),
    number character varying(50),
    type character varying(20),
    department character varying(20)
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- Name: staff_id_staff_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_id_staff_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.staff_id_staff_seq OWNER TO postgres;

--
-- Name: staff_id_staff_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_id_staff_seq OWNED BY public.staff.id_staff;


--
-- Name: appointment id_appointment; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment ALTER COLUMN id_appointment SET DEFAULT to_char(nextval('public.appointment_id_appointment_seq'::regclass), 'FMAPPOI00000'::text);


--
-- Name: staff id_staff; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN id_staff SET DEFAULT to_char(nextval('public.staff_id_staff_seq'::regclass), 'FM5TAFF00000'::text);


--
-- Data for Name: appointment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointment (id_appointment, "time", doctor, test, number, address, status) FROM stdin;
APPOI00001	6:00 - 7:00	Gunilla Franchyonok	Manic affective disorder, recurrent episode, mild	810-908-9702	1705 Melvin Hill	scheduled
APPOI00002	15:00 - 16:00	Truda Reay	Burn of unspecified site, unspecified degree	352-869-3711	84715 Sheridan Court	waiting
APPOI00003	8:00 - 9:00	Franchyonok	Manic affective disorder, recurrent episode, mild	810-908-9702	1705 Melvin Hill	scheduled
APPOI00004	8:00 - 9:00	Toby Book	Other conjunctivitis	140-647-2125	88 Pierstorff Parkway	scheduled
\.


--
-- Data for Name: clinic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clinic (id_clinic, name_clinic, name_doctor, province, city, address, status_clinic) FROM stdin;
CLC768720	Antigen Laboratories, Inc.	Martita Blannin	Hồ Chí Minh	Quận Một	15 Đường Trịnh Văn Cấn	\N
CLC749360	Natural Health Supply	Carlene Klimpt	\N	\N	\N	\N
CLC475360	OnPoint, Inc	Patton Rousell	\N	\N	\N	\N
CLC410230	Procter & Gamble Manufacturing Co.	Cornell Amies	\N	\N	\N	\N
CLC599010	Procter & Gamble Manufacturing Company	Hunter Rubenovic	\N	\N	\N	\N
CLC241800	General Injectables & Vaccines, Inc	Elsy Bouldstridge	\N	\N	\N	\N
CLC393360	Premier Bioceuticals LLC.	Nicolle Tucker	\N	\N	\N	\N
CLC348370	Allermed Laboratories, Inc.	Claudie Poole	\N	\N	\N	\N
CLC511090	Rebel Distributors Corp	Aron Bouldon	\N	\N	\N	\N
CLC847530	Cardinal Health	Bessie Argont	\N	\N	\N	\N
CLC764180	Ventura Corporation Ltd.	Merwyn Deighan	\N	\N	\N	\N
CLC369380	West-ward Pharmaceutical Corp	Joe Hargitt	\N	\N	\N	\N
CLC677990	McKesson Contract Packaging	Casar McGovern	\N	\N	\N	\N
CLC888760	Amar Remedies Limited	Hillel Van Halle	\N	\N	\N	\N
CLC691590	Natural Health Supply	Benson Klaussen	\N	\N	\N	\N
CLC268130	Kinray	Davita Neising	\N	\N	\N	\N
CLC483150	REMEDYREPACK INC.	Cad Twiggins	\N	\N	\N	\N
CLC703290	BioActive Nutritional, Inc.	Janot Freed	\N	\N	\N	\N
CLC596410	GeneraMedix Inc.	Berti Stealy	\N	\N	\N	\N
CLC711150	Mckesson	Cherish Skeete	\N	\N	\N	\N
CLC675760	Cardinal Health	Clywd Baythrop	\N	\N	\N	\N
CLC999410	BioActive Nutritional, Inc.	Anthiathia Barns	\N	\N	\N	\N
CLC697510	Nelco Laboratories, Inc.	Kacy Pennigar	\N	\N	\N	\N
CLC441500	AMERICAN SALES COMPANY	Gordie Sommer	\N	\N	\N	\N
CLC823080	K&J.C Co., Ltd	Christophe Samson	\N	\N	\N	\N
CLC734520	Stat Rx USA	Bryanty Charlwood	\N	\N	\N	\N
CLC672300	Aphena Pharma Solutions - Tennessee, LLC	Zeb Waudby	\N	\N	\N	\N
CLC137420	Hospira, Inc.	Ric Tranmer	\N	\N	\N	\N
CLC810330	KMART CORPORATION	Shamus Zum Felde	\N	\N	\N	\N
CLC481320	Watson Laboratories, Inc.	Dannie McNysche	\N	\N	\N	\N
CLC736780	Merck Sharp & Dohme Corp.	Lizette Boulger	\N	\N	\N	\N
CLC951400	Cardinal Health	Dora Sparham	\N	\N	\N	\N
CLC593720	Rebel Distributors Corp	Dehlia Franzonello	\N	\N	\N	\N
CLC150130	Kremers Urban Pharmaceuticals Inc.	Sibel Sloam	\N	\N	\N	\N
CLC737300	Contract Pharmacal Corp	Kalila Alvy	\N	\N	\N	\N
CLC965720	Northwind Pharmaceuticals	Tabby Taber	\N	\N	\N	\N
CLC414430	REMEDYREPACK INC.	Gardy Thorius	\N	\N	\N	\N
CLC231050	Energetix Corp	Gloriane Kristof	\N	\N	\N	\N
CLC626040	Aloe Vera of America, Inc.	Eugenius Orgel	\N	\N	\N	\N
CLC364720	Sun & Skin Care Research, LLC	Emlynn Darte	\N	\N	\N	\N
CLC722600	A-S Medication Solutions LLC	Van Hayball	\N	\N	\N	\N
CLC154360	West-ward Pharmaceutical Corp.	Rosene Malarkey	\N	\N	\N	\N
CLC188280	L Perrigo Company	Michael Fossey	\N	\N	\N	\N
CLC327120	AMERICAN CHEMICAL AND SANITARY SUPPLY INC	Merralee Parnham	\N	\N	\N	\N
CLC271240	SHISEIDO CO., LTD.	Trixi Bolesworth	\N	\N	\N	\N
CLC368730	Kmart Corporation	Norry Frankcomb	\N	\N	\N	\N
CLC516440	The Magni Company	Gerri Mertgen	Hồ Chí Minh	Quận Mười	22 Đường Dương Quang Trung	\N
CLC218110	Physicians Total Care, Inc.	Zulema Divina	Hồ Chí Minh	Quận Mười Một	550 Nguyễn Chí Thanh	\N
CLC744150	Supervalu Inc	Silvio McInally	Hồ Chí Minh	Quận Mười Một	72 Đường số 5 – Cư xá Bình Thới	\N
CLC620170	Hy-Vee, Inc	Ricca Ahrens	Hồ Chí Minh	Quận Mười	424 Đường Ba Tháng Hai	\N
CLC610640	Amerisource Bergen	Tuck Rannells	Hồ Chí Minh	Quận Mười Một	957 Đường Ba Tháng Hai	\N
CLC949260	AbbVie Inc.	Johanna Oldford	Hồ Chí Minh	Quận Mười	461 Đường Sư Vạn Hạnh	\N
CLC654980	Gen-Source Rx	Kizzee Pidcock	Bình Dương	Thủ Dầu Một	49/B1 ĐT 743	\N
CLC314160	Nelco Laboratories, Inc.	Selinda Sein	Bình Dương	Thủ Dầu Một	171 Phạm Ngọc Thạch	\N
CLC391850	Guthy-Renker LLC	Juan Viant	Bình Dương	Thủ Dầu Một	24 Phạm Ngũ Lão	\N
CLC693680	BluePoint Laboratories	Danyette Perett	\N	\N	\N	\N
CLC315690	Galderma Laboratories, L.P.	Hillie Zaniolo	\N	\N	\N	\N
CLC939770	ENERGIZER PERSONAL CARE LLC	Mozelle Kempston	\N	\N	\N	\N
CLC870730	A-S Medication Solutions LLC	Danni Castagnaro	\N	\N	\N	\N
CLC917010	CVS pharmacy	Lesley Mulcaster	\N	\N	\N	\N
CLC831190	DSHealthcare	Chickie Riply	\N	\N	\N	\N
CLC537040	KVK-TECH, INC.	Maddy Afonso	\N	\N	\N	\N
CLC119510	AvKARE, Inc.	Waiter King	\N	\N	\N	\N
CLC114000	Caraco Pharmaceutical Laboratories, Ltd.	Trip Olley	\N	\N	\N	\N
CLC937580	Sandoz Inc	Lanna Thomelin	\N	\N	\N	\N
CLC743740	REMEDYREPACK INC.	Jefferey Temprell	\N	\N	\N	\N
CLC273560	Mylan Pharmaceuticals Inc.	Chas Limeburner	\N	\N	\N	\N
CLC189930	Upsher-Smith Laboratories, Inc.	Aurthur Dallison	\N	\N	\N	\N
CLC629670	Eli Lilly and Company	Brook Fort	\N	\N	\N	\N
CLC816940	Physicians Total Care, Inc.	Cass Furney	\N	\N	\N	\N
CLC965790	NCS HealthCare of KY, Inc dba Vangard Labs	Bartholomeus Vernau	\N	\N	\N	\N
CLC711950	Gen-Source Rx	Toiboid Thickpenny	\N	\N	\N	\N
CLC299840	RedPharm Drug Inc.	Dorie Muller	\N	\N	\N	\N
CLC211220	GOJO Industries, Inc.	Brandon Ubsdall	\N	\N	\N	\N
CLC330150	McKesson Contract Packaging	Humfrey Leftridge	\N	\N	\N	\N
CLC988420	EQUALINE (SuperValu)	Bevvy Bloomer	\N	\N	\N	\N
CLC219280	BCM Cosmetique SAS	Anallise O'Brogane	\N	\N	\N	\N
CLC957310	American Health Packaging	Grethel Heamus	\N	\N	\N	\N
CLC424190	REMEDYREPACK INC.	Janek Di Maria	\N	\N	\N	\N
CLC848120	Allermed Laboratories, Inc.	Rickard Audritt	\N	\N	\N	\N
CLC310880	Indiana Botanic Gardens	Heddi McRorie	\N	\N	\N	\N
CLC312670	Natural Health Supply	Ianthe Jealous	\N	\N	\N	\N
CLC422440	BioActive Nutritional, Inc.	Larisa Wadeson	\N	\N	\N	\N
CLC319940	Sun Pharmaceutical Industries Limited	Jessy Sanderson	\N	\N	\N	\N
CLC961840	Sandoz Inc.	Dana Cornew	\N	\N	\N	\N
CLC563980	Amneal Pharmaceuticals	Frank Thornhill	\N	\N	\N	\N
CLC369420	State of Florida DOH Central Pharmacy	Kellen Condict	\N	\N	\N	\N
CLC200680	Prestige Brands Holdings, Inc.	Matthias Dechelette	\N	\N	\N	\N
CLC539020	Nelco Laboratories, Inc.	Ronica Mardy	\N	\N	\N	\N
CLC225020	Walgreen Company	Brod Baynam	\N	\N	\N	\N
CLC288630	Par Pharmaceutical Inc.	Judie Igo	\N	\N	\N	\N
CLC299230	Deb USA, Inc.	Cathie Kleimt	\N	\N	\N	\N
CLC604940	Mylan Institutional Inc.	Perceval Tofts	\N	\N	\N	\N
CLC903200	Rebel Distributors Corp	Murielle Korneichuk	\N	\N	\N	\N
CLC231660	Par Pharmaceutical, Inc.	Nananne Brownrigg	\N	\N	\N	\N
CLC599590	American Sales Company	Sharity Govini	\N	\N	\N	\N
CLC440580	Physicians Total Care, Inc.	Cherry Sellars	\N	\N	\N	\N
CLC317320	SHISEIDO CO., LTD.	Chiquia Wingham	\N	\N	\N	\N
\.


--
-- Data for Name: doctortime; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctortime (id_doctortime, doctor, shift, status) FROM stdin;
5TAFF00001	Nguyen Van A	8:00 - 9:00	f
5TAFF00001	Nguyen Van A	10:00 - 11:00	f
5TAFF00001	Nguyen Van A	11:00 - 12:00	f
5TAFF00001	Nguyen Van A	13:00 - 14:00	f
5TAFF00001	Nguyen Van A	15:00 - 16:00	f
5TAFF00001	Nguyen Van A	16:00 - 17:00	f
5TAFF00001	Nguyen Van A	14:00 - 15:00	f
5TAFF00001	Nguyen Van A	9:00 - 10:00	f
\.


--
-- Data for Name: prescription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prescription (id_prescription) FROM stdin;
PRES847460
PRES637830
PRES345040
PRES951260
PRES196880
PRES223440
PRES127280
PRES719320
PRES688760
PRES758800
PRES182640
PRES620040
PRES157290
PRES916820
PRES114980
PRES508560
PRES703220
PRES529790
PRES226770
PRES179000
PRES746570
PRES954170
PRES566530
PRES961890
PRES610910
PRES308390
PRES166170
PRES730030
PRES575360
PRES250130
PRES191170
PRES100350
PRES458310
PRES176590
PRES561890
PRES993010
PRES191800
PRES420710
PRES379620
PRES629440
PRES515380
PRES606780
PRES189100
PRES665760
PRES482520
PRES748940
PRES109720
PRES829880
PRES243600
PRES234580
PRES951620
PRES385810
PRES831160
PRES695360
PRES706610
PRES589880
PRES193530
PRES225800
PRES376040
PRES299220
PRES364470
PRES898700
PRES903550
PRES415380
PRES157050
PRES332810
PRES704420
PRES620950
PRES574890
PRES511430
PRES286350
PRES764750
PRES562250
PRES457390
PRES551040
PRES301410
PRES496240
PRES360620
PRES862940
PRES720790
PRES925000
PRES126720
PRES866360
PRES958070
PRES850220
PRES186560
PRES224950
PRES133710
PRES356100
PRES897980
PRES866520
PRES921130
PRES964650
PRES541740
PRES699240
PRES363660
PRES496280
PRES686680
PRES934870
PRES217540
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (id_staff, name, number, type, department) FROM stdin;
5TAFF00016	Nguyen Van D	611-449-9270	doctor	 
5TAFF00001	Nguyen Van A	611-449-9270	doctor	A
5TAFF00002	Nguyen Van B	611-449-9270	nurse	B
5TAFF00003	Nguyen Van C	611-449-9270	staff	B
5TAFF00004	Nguyen Van E	611-449-9270	doctor	 
\.


--
-- Name: appointment_id_appointment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointment_id_appointment_seq', 4, true);


--
-- Name: staff_id_staff_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_id_staff_seq', 4, true);


--
-- Name: appointment appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id_appointment);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id_staff);


--
-- PostgreSQL database dump complete
--

