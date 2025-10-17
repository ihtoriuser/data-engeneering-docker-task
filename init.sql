--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2025-10-11 09:54:18
-- Create role for Superset if not exists

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
--SET transaction_timeout = 0;
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
-- TOC entry 224 (class 1259 OID 24616)
-- Name: bikes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bikes (
    bike_id integer NOT NULL,
    bike_number character varying(50),
    color character varying(50),
    cost numeric(10,2),
    mark character varying(50),
    bought_date date,
    lost boolean DEFAULT false,
    state_10 integer,
    expence_id integer,
    type_of_repairing character varying(255)
);


ALTER TABLE public.bikes OWNER TO superset;

--
-- TOC entry 223 (class 1259 OID 24615)
-- Name: bikes_bike_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bikes_bike_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bikes_bike_id_seq OWNER TO superset;

--
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 223
-- Name: bikes_bike_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bikes_bike_id_seq OWNED BY public.bikes.bike_id;


--
-- TOC entry 220 (class 1259 OID 24597)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    client_id integer NOT NULL,
    tenants character varying(255),
    address text,
    passport character varying(50),
    phone_number character varying(30),
    paid_summ numeric(10,2),
    debt_in_days integer,
    comment text,
    banned boolean DEFAULT false,
    days_of_rent integer
);


ALTER TABLE public.clients OWNER TO superset;

--
-- TOC entry 219 (class 1259 OID 24596)
-- Name: clients_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_client_id_seq OWNER TO superset;

--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 219
-- Name: clients_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_client_id_seq OWNED BY public.clients.client_id;


--
-- TOC entry 222 (class 1259 OID 24607)
-- Name: expences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.expences (
    expence_id integer NOT NULL,
    date date,
    service character varying(255),
    comment text,
    price numeric
);


ALTER TABLE public.expences OWNER TO superset;

--
-- TOC entry 221 (class 1259 OID 24606)
-- Name: expences_expence_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.expences_expence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.expences_expence_id_seq OWNER TO superset;

--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 221
-- Name: expences_expence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.expences_expence_id_seq OWNED BY public.expences.expence_id;


--
-- TOC entry 226 (class 1259 OID 24629)
-- Name: rents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rents (
    rent_id integer NOT NULL,
    client_id integer NOT NULL,
    bike_id integer NOT NULL,
    start_date date NOT NULL,
    days_of_rent integer,
    city character varying(100),
    city_rent_price numeric(10,2),
    status character varying(50),
    number_of_payments integer
);


ALTER TABLE public.rents OWNER TO superset;

--
-- TOC entry 225 (class 1259 OID 24628)
-- Name: rents_rent_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rents_rent_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rents_rent_number_seq OWNER TO superset;

--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 225
-- Name: rents_rent_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rents_rent_number_seq OWNED BY public.rents.rent_id;


--
-- TOC entry 218 (class 1259 OID 24586)
-- Name: solo_general; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solo_general (
    id integer NOT NULL,
    tenant character varying(100),
    tenant_address character varying(200),
    city character varying(50),
    city_rent_price numeric(10,2),
    bike_color character varying(30),
    bike_number character varying(20),
    quantity_of_rented_bikes integer,
    date_of_rent date,
    days_of_rent integer,
    summ numeric(10,2),
    status character varying(20),
    debt_in_days integer,
    number_of_payments integer,
    return_bike boolean,
    return_condition character varying(50),
    repairs_were_needed boolean,
    type_of_repairs character varying(100),
    repairs_cost numeric(10,2),
    tenant_paid boolean,
    banned boolean
);


ALTER TABLE public.solo_general OWNER TO superset;

--
-- TOC entry 217 (class 1259 OID 24585)
-- Name: solo_general_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solo_general_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solo_general_id_seq OWNER TO superset;

--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 217
-- Name: solo_general_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solo_general_id_seq OWNED BY public.solo_general.id;


--
-- TOC entry 4665 (class 2604 OID 24619)
-- Name: bikes bike_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bikes ALTER COLUMN bike_id SET DEFAULT nextval('public.bikes_bike_id_seq'::regclass);


--
-- TOC entry 4662 (class 2604 OID 24600)
-- Name: clients client_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN client_id SET DEFAULT nextval('public.clients_client_id_seq'::regclass);


--
-- TOC entry 4664 (class 2604 OID 24610)
-- Name: expences expence_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expences ALTER COLUMN expence_id SET DEFAULT nextval('public.expences_expence_id_seq'::regclass);


--
-- TOC entry 4667 (class 2604 OID 24632)
-- Name: rents rent_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rents ALTER COLUMN rent_id SET DEFAULT nextval('public.rents_rent_number_seq'::regclass);


--
-- TOC entry 4661 (class 2604 OID 24589)
-- Name: solo_general id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solo_general ALTER COLUMN id SET DEFAULT nextval('public.solo_general_id_seq'::regclass);


--
-- TOC entry 4833 (class 0 OID 24616)
-- Dependencies: 224
-- Data for Name: bikes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bikes VALUES (1, 'B001', 'Black - Green', 80.00, 'BONVI', '2024-03-12', false, 5, 7, 'Tire replacement');
INSERT INTO public.bikes VALUES (2, 'B002', 'Black - Green ', 80.00, 'BONVI', '2024-03-12', true, 0, 8, 'Tire replacement');
INSERT INTO public.bikes VALUES (3, 'B003', 'Black - Green', 80.00, 'BONVI', '2024-03-12', false, 7, 8, 'Tire replacement');
INSERT INTO public.bikes VALUES (4, 'B004', 'Blue ', 80.00, 'BONVI', '2024-03-12', true, 0, 8, 'Tire replacement');
INSERT INTO public.bikes VALUES (5, 'B005', 'Black-Green', 80.00, 'BONVI', '2024-03-12', false, 9, NULL, 'No repairs are required');
INSERT INTO public.bikes VALUES (6, 'B006', 'Grey ', 80.00, 'BONVI', '2024-03-12', false, 5, 10, 'No repairs are required');
INSERT INTO public.bikes VALUES (7, 'B007', 'Black-Red ', 60.00, 'BONVI', '2024-03-12', false, 6, 11, 'Tire replacement');
INSERT INTO public.bikes VALUES (8, 'B008', 'Black-Red', 60.00, 'BONVI', '2024-03-12', false, 9, NULL, 'No repairs are required');
INSERT INTO public.bikes VALUES (9, 'B009', 'Black-Red', 60.00, 'BONVI', '2024-03-12', false, 8, 16, 'Tire replacement');
INSERT INTO public.bikes VALUES (10, 'B010', 'Grey', 60.00, 'BONVI', '2024-03-12', false, 9, NULL, 'No repairs are required');
INSERT INTO public.bikes VALUES (11, 'B011', 'Black-Red', 60.00, 'BONVI', '2024-03-12', false, 7, 18, 'Brake adjustment');
INSERT INTO public.bikes VALUES (12, 'B012', 'Black Red', 60.00, 'BONVI', '2024-03-12', false, 6, NULL, 'No repairs are required');
INSERT INTO public.bikes VALUES (13, 'B013', 'Blue', 75.00, 'BONVI', '2024-03-12', false, 9, 2, 'Seat adjustment');
INSERT INTO public.bikes VALUES (14, 'B014', 'Black-Red ', 75.00, 'BONVI', '2024-03-12', true, 0, 17, 'Gear system repair');
INSERT INTO public.bikes VALUES (15, 'B015', 'Black Green', 75.00, 'BONVI', '2024-03-12', false, 9, 15, 'Tire replacement');
INSERT INTO public.bikes VALUES (16, 'B016', 'Black Green', 75.00, 'BONVI', '2024-03-12', false, 9, 8, 'Pedal replacement');
INSERT INTO public.bikes VALUES (17, 'B017', 'Black Green', 75.00, 'BONVI', '2024-03-12', false, 8, 10, 'Tire replacement');
INSERT INTO public.bikes VALUES (18, 'B018', 'Black Green', 90.00, 'Velomax', '2024-04-01', false, 9, 10, 'Full service');
INSERT INTO public.bikes VALUES (19, 'B019', 'Black Green', 90.00, 'Velomax', '2024-04-01', false, 9, 10, 'Brake pads replacement');
INSERT INTO public.bikes VALUES (20, 'B020', 'Black-Green ', 90.00, 'Velomax', '2024-04-01', false, 9, 10, 'Tire replacement');
INSERT INTO public.bikes VALUES (21, 'B021', 'Black Green', 90.00, 'Velomax', '2024-04-01', false, 9, 10, 'Brake adjustment');
INSERT INTO public.bikes VALUES (22, 'B022', 'Black-Red ', 90.00, 'Velomax', '2024-04-01', false, 9, 10, 'Tire replacement');
INSERT INTO public.bikes VALUES (23, 'B023', 'Black Green', 90.00, 'Velomax', '2024-04-01', false, 9, 10, 'Tire replacement');
INSERT INTO public.bikes VALUES (24, 'B024', 'Grey ', 90.00, 'Velomax', '2024-04-01', false, 9, 10, 'Gear system repair');
INSERT INTO public.bikes VALUES (25, 'B025', 'Black-Red ', 90.00, 'Velomax', '2024-04-01', true, 0, 16, 'Wheel alignment');
INSERT INTO public.bikes VALUES (26, 'B026', 'Black-Red ', 90.00, 'Velomax', '2024-04-01', false, 9, 4, 'Pedal replacement');
INSERT INTO public.bikes VALUES (27, 'B027', 'Black-Red', 90.00, 'Velomax', '2024-04-01', false, 8, 6, 'Handlebar adjustment');
INSERT INTO public.bikes VALUES (28, 'B028', 'Black Green', 105.00, 'Velomax', '2024-04-01', false, 9, 15, 'Tire replacement');
INSERT INTO public.bikes VALUES (29, 'B029', 'Blue ', 105.00, 'Velomax', '2024-04-01', true, 0, 2, 'Brake pads replacement');
INSERT INTO public.bikes VALUES (30, 'B030', 'Black-Green ', 105.00, 'Velomax', '2024-04-01', false, 9, 7, 'Tire replacement');
INSERT INTO public.bikes VALUES (31, 'B031', 'Black-Red ', 105.00, 'Velomax', '2024-04-01', false, 5, 6, 'Brake adjustment');
INSERT INTO public.bikes VALUES (32, 'B032', 'Black-Red', 105.00, 'Velomax', '2024-04-01', false, 9, 6, 'Chain replacement');
INSERT INTO public.bikes VALUES (33, 'B033', 'Black-Red ', 105.00, 'Velomax', '2024-04-01', false, 6, 15, 'Tire replacement');
INSERT INTO public.bikes VALUES (34, 'B034', 'Black-Red ', 105.00, 'Velomax', '2024-04-01', false, 9, 10, 'Gear system repair');
INSERT INTO public.bikes VALUES (35, 'B035', 'Black-Red ', 105.00, 'Velomax', '2024-04-01', false, 9, NULL, 'No repairs are required');
INSERT INTO public.bikes VALUES (36, 'B036', 'Black-Red ', 105.00, 'Velomax', '2024-04-01', true, 0, 8, 'Tire replacement');
INSERT INTO public.bikes VALUES (37, 'B037', 'Black-Red ', 105.00, 'Velomax', '2024-04-01', false, 9, 7, 'Handlebar adjustment');
INSERT INTO public.bikes VALUES (38, 'B038', 'Black-Red ', 105.00, 'Velomax', '2024-04-01', true, 0, 10, 'Full service');
INSERT INTO public.bikes VALUES (39, 'B039', 'Black-Red', 80.00, 'Velomax', '2024-04-01', false, 9, 2, 'Brake pads replacement');
INSERT INTO public.bikes VALUES (40, 'B040', 'Black-Red ', 80.00, 'Velomax', '2024-04-01', true, 0, 7, 'Tire replacement');
INSERT INTO public.bikes VALUES (41, 'B041', 'Black-Green', 80.00, 'Velomax', '2024-04-01', false, 9, 10, 'Brake adjustment');
INSERT INTO public.bikes VALUES (42, 'B042', 'Green', 80.00, 'Velomax', '2024-04-01', true, 0, 10, 'Chain replacement');
INSERT INTO public.bikes VALUES (43, 'B043', 'Red', 80.00, 'Velomax', '2024-04-01', false, 9, 8, 'Tire replacement');
INSERT INTO public.bikes VALUES (44, 'B044', 'Blue', 80.00, 'Velomax', '2024-04-01', false, 7, 2, 'Gear system repair');
INSERT INTO public.bikes VALUES (45, 'B045', 'Green', 80.00, 'Velomax', '2024-04-01', false, 8, 7, 'Tire replacement');
INSERT INTO public.bikes VALUES (46, 'B046', 'Grey', 80.00, 'Velomax', '2024-04-01', false, 9, 7, 'Tire replacement');
INSERT INTO public.bikes VALUES (47, 'B047', 'Grey', 80.00, 'Velomax', '2024-04-01', false, 8, 10, 'Handlebar adjustment');
INSERT INTO public.bikes VALUES (48, 'B048', 'Red', 80.00, 'Velomax', '2024-04-01', false, 9, 10, 'Full service');
INSERT INTO public.bikes VALUES (49, 'B049', 'Green', 80.00, 'Velomax', '2024-04-01', false, 7, 8, 'Tire replacement');
INSERT INTO public.bikes VALUES (50, 'B050', 'Red', 80.00, 'Velomax', '2024-04-01', false, 9, 8, 'Tire replacement');
INSERT INTO public.bikes VALUES (51, 'B051', 'Green', 75.00, 'Velomax', '2024-04-01', false, 8, 10, 'Seat adjustment');
INSERT INTO public.bikes VALUES (52, 'B052', 'Red', 75.00, 'Velomax', '2024-04-01', false, 9, 11, 'Gear system repair');
INSERT INTO public.bikes VALUES (53, 'B053', 'Green', 75.00, 'Velomax', '2024-04-01', false, 5, 16, 'Wheel alignment');
INSERT INTO public.bikes VALUES (54, 'B054', 'Red', 75.00, 'Velomax', '2024-04-01', false, 9, NULL, 'No repairs are required');
INSERT INTO public.bikes VALUES (55, 'B055', 'Grey', 75.00, 'Velomax', '2024-04-01', false, 7, 17, 'Handlebar adjustment');
INSERT INTO public.bikes VALUES (56, 'B056', 'Grey', 75.00, 'Velomax', '2024-04-01', false, 7, 11, 'Full service');
INSERT INTO public.bikes VALUES (57, 'B057', 'Green', 75.00, 'Velomax', '2024-04-01', false, 9, 10, 'Brake pads replacement');
INSERT INTO public.bikes VALUES (58, 'B058', 'Green', 75.00, 'Velomax', '2024-04-01', false, 7, 11, 'Brake pads replacement');
INSERT INTO public.bikes VALUES (59, 'B059', 'Red', 75.00, 'Velomax', '2024-04-01', false, 6, 6, 'Seat adjustment');
INSERT INTO public.bikes VALUES (60, 'B060', 'Red', 75.00, 'Velomax', '2024-04-01', false, 9, NULL, 'No repairs are required');
INSERT INTO public.bikes VALUES (61, 'B061', 'Blue', 75.00, 'Velomax', '2024-04-01', false, 6, NULL, 'No repairs are required');
INSERT INTO public.bikes VALUES (62, 'B062', 'Black - Green', 75.00, 'Velomax', '2024-04-01', false, 7, 15, 'Tire replacement');
INSERT INTO public.bikes VALUES (63, 'B063', 'Black - Green', 75.00, 'Velomax', '2024-04-01', false, 6, NULL, 'No repairs are required');


--
-- TOC entry 4829 (class 0 OID 24597)
-- Dependencies: 220
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clients VALUES (1, 'Xamirbekov Zahriddin', 'UZ-TO', 'AD 0162044', '9.99E+11', 481036.00, 0, 'Ended. 21.04', false, 44);
INSERT INTO public.clients VALUES (2, 'Jamshid Bashirov', 'UZ-JI', 'AD 0728725', '9.99E+11', 742942.00, 63, 'Has got really bad conditions at home. Stopped the timer. Will bring back the bike other person and make part of the payment. +22.942', false, 66);
INSERT INTO public.clients VALUES (3, 'Olmosbek Egamberdiyev', 'UZ-QA', 'AD 5578246', '9.98E+11', 12000.00, 0, 'No comment', false, 2);
INSERT INTO public.clients VALUES (4, 'Aloxoov Saidnabixon', 'UZ-SA', 'AC 3059296', '9.99E+11', 80000.00, 0, 'No comment', false, 8);
INSERT INTO public.clients VALUES (5, 'Saypbekov Sultonbek Bahtiyorjon o`g`li', 'UZ-QR', 'AD 1533770', '9.99E+11', 836000.00, 0, 'Ended 26.05.2024', false, 81);
INSERT INTO public.clients VALUES (6, 'Kenjibayev Pazilbek Nurlibayevich', 'UZ-QR', 'AD 1388378', '9.99E+11', 720000.00, 0, 'Ended 13.05.2024', false, 64);
INSERT INTO public.clients VALUES (7, 'Kaynarov Azamjon Izzatillo o`g`li', 'UZ-SA', 'AA 4937063', '9.99E+11', 162000.00, 0, 'Came and Paid', false, 13);
INSERT INTO public.clients VALUES (8, 'Soliyev Oybek Shuhrat o`g`li', 'UZ-SI', 'AD 4770340', '9.99E+11', 330000.00, 0, 'Ended. 15.04.2024', false, 38);
INSERT INTO public.clients VALUES (9, 'Qurboov Jaloliddin Shavkat o`g`li', 'UZ-JI', 'AD 2118968', '9.99E+11', 287883.00, 0, 'Ended. Paid in advance', false, 2);
INSERT INTO public.clients VALUES (10, 'Yusupbayev Jalolbek Quvondik o`g`li', 'UZ-XO', 'AC 0801686', '9.99E+11', 653569.00, 0, 'Ended. 07.05.2024', false, 60);
INSERT INTO public.clients VALUES (11, 'Ibrohimov Abdurashid Rahmonjon o`g`li', 'UZ-FA', 'AA 5340036', '9.98E+11', 80000.00, 0, 'Ended after a few days', false, 8);
INSERT INTO public.clients VALUES (12, 'Iskandarov Furqat', 'UZ-SU', 'AD 1403013', '9.99E+11', 412000.00, 0, 'Ended', false, 39);
INSERT INTO public.clients VALUES (13, 'Sobirov Asadbek Hayotjon o`g`li', 'UZ-SA', 'AD 0862273', '9.98E+11', 412000.00, 0, 'Ended', false, 39);
INSERT INTO public.clients VALUES (14, 'Mahkamov Tohirbek Zafarjon o`g`li', 'UZ-NG', 'AD 1124069', '9.99E+11', 80000.00, 236, 'Bicycle was taken by POlice due to unlocked condition of it. Waits for Judgment', true, 8);
INSERT INTO public.clients VALUES (15, 'Nuridiov Azamjon Mahmudjon o`g`li', 'UZ-NG', 'AB 7241172', '9.99E+11', 80000.00, 236, 'Big DEBTOR. Not answering', true, 8);
INSERT INTO public.clients VALUES (16, 'Janibekov Jamshidbek Hurmatbek o`g`li', 'UZ-XO', 'AD 0554069', '9.99E+11', 12000.00, 0, 'Ended 06.05.2024', false, 2);
INSERT INTO public.clients VALUES (17, 'Kadambayev Jamshidbek', 'UZ-XO', 'AB 6457309', '9.99E+11', 12000.00, 0, 'Ended', false, 2);
INSERT INTO public.clients VALUES (18, 'ortojiyev Quvonchbek', 'UZ-SA', 'AC 1997828', '9.99E+11', 972000.00, 0, 'Ended 28.05.2024. Broke back baggage. Paid 60k', false, 51);
INSERT INTO public.clients VALUES (19, 'Obidov Shuhrat Narzullayevich', 'UZ-SA', 'AB 8486645', '9.99E+11', 0.00, 0, 'No comment', false, 2);
INSERT INTO public.clients VALUES (20, 'Abdunazarov Murodbek Bahtiyor o`g`li', 'UZ-TO', 'AD 0646189', NULL, 836000.00, 0, 'Ended 22.05.2024', false, 60);
INSERT INTO public.clients VALUES (21, 'Hudoyberdiyev Obid Shomurod o`g`li', 'UZ-TO', 'AD 4451148', '9.99E+11', 640000.00, 0, 'Ended 06.04.2024', false, 61);
INSERT INTO public.clients VALUES (22, 'Xamroyev Xondamir Ihtiyorovich', 'UZ-NW', 'AC 2911748', '9.99E+11', 424000.00, 0, 'Ended. 22.04.2024', false, 40);
INSERT INTO public.clients VALUES (23, 'Ismailov Otabek Gayrat o`g`li', 'UZ-QA', 'AD 0182240', '9.99E+11', 264000.00, 0, 'Ended 30.03.2024', false, 2);
INSERT INTO public.clients VALUES (24, 'Usmaov Shohruh Erkinjon o`g`li', 'UZ-TO', 'AB 8823151', '9.99E+11', 12000.00, 0, 'Ended', false, 2);
INSERT INTO public.clients VALUES (25, 'Xoliqov Sarvarbek Sardor ogli', 'UZ-TO', 'AD1090401', '9.99E+11', 12000.00, 0, 'Ended', false, 8);
INSERT INTO public.clients VALUES (26, 'Djanakulov Umidjon ormotovich', 'UZ-QA', 'AD1280324', NULL, 300000.00, 0, 'No comment', false, 30);
INSERT INTO public.clients VALUES (27, 'Vohobov Rufat Madiqul ogli', 'UZ-NG', 'AB 8022511', '9.99E+11', 12000.00, 242, 'Still works. Will make a payment. Deleted the chat. MF', true, 2);
INSERT INTO public.clients VALUES (28, 'Nabiyev Shaxboz', 'UZ-TO', 'AB 1234567', '9.99E+11', 584000.00, 0, 'Ended 21.05.2024', false, 54);
INSERT INTO public.clients VALUES (29, 'Abdullayev Haytboy Umid o`g`li', 'UZ-TK ', 'AB 8289088', '9.99E+11', NULL, 0, 'Ended. 19.04', false, NULL);
INSERT INTO public.clients VALUES (30, 'Usibjoov Khasanboy Valijon ogli', 'UZ-NG', 'AC2829541', NULL, 300000.00, 0, 'Ended. 08 april', false, 31);
INSERT INTO public.clients VALUES (31, 'Kamolov Sardorbek Qalandar ogli', 'UZ-NG', 'AD0746565', NULL, 12000.00, 0, 'Ended', false, 2);
INSERT INTO public.clients VALUES (32, 'Turoov Og`abek Rafikjon o`g`li', 'UZ-FA', 'AC 3018457', '9.99E+11', 2546000.00, 91, 'Paid 1.590.000 for the bike. Will pay by parts. Made a deal', false, 83);
INSERT INTO public.clients VALUES (33, 'Mirzasaidov Jahongir', 'UZ-FA', 'AD 0275612', '9.99E+11', 320000.00, 0, 'Ended', false, 30);
INSERT INTO public.clients VALUES (34, 'Ahmedov Bakir Olimjon o`g`li', 'UZ-JI', 'AB 6827450', '9.99E+11', 426000.00, 0, 'Ended 13.05.2024', false, 40);
INSERT INTO public.clients VALUES (35, 'Alikulov Jasur Bahtiyor o`g`li', 'UZ-SI', 'AB 6685913', '9.99E+11', 328000.00, 0, 'Ended 06.05.2024', false, 33);
INSERT INTO public.clients VALUES (36, 'Aminjoov Ozodbek', 'UZ-FA', 'AD 1027294', '9.99E+11', 320000.00, 0, 'Ended 13.05.2024', false, 29);
INSERT INTO public.clients VALUES (37, 'Sherqobilov Abdurahmon Olimovich', 'UZ-TO', 'AD2008299', '9.99E+11', 680000.00, 0, 'Ended 18.05.2024', false, 62);
INSERT INTO public.clients VALUES (38, 'Shokirov Ilyoshon Toyirjonivich', 'UZ-TO', 'AC2009359', '9.98E+11', 12000.00, 0, 'No comment', false, 2);
INSERT INTO public.clients VALUES (39, 'Ahmedov Bakir Olimjon o`g`li', 'UZ-JI', 'AB 6827450', '9.99E+11', 412000.00, 0, 'Ended 13.05.2024 (minus 2 days, cause of our absence)', false, 39);
INSERT INTO public.clients VALUES (40, 'Ibrohimov Bekhzodjon Shuhrat ogli', 'UZ-TK', 'AB 1234567', '9.99E+11', 80000.00, 0, 'Ended 31.03.2024', false, 8);
INSERT INTO public.clients VALUES (41, 'Qutlimurodov Sherzod Qosimovich', 'UZ-TO', 'AD6436512', '9.99E+11', 940000.00, 0, 'Said that will make a payment today 05.06.2024. Could not pay ''cause no one called or written him since that time. Ended 19.06.2024', false, 91);
INSERT INTO public.clients VALUES (42, 'Mirzayev Doston Ortiq ogli', 'UZ-TK', 'AD6240604', '9.99E+11', 264000.00, 225, 'Ended. 15.04.2024', false, 8);
INSERT INTO public.clients VALUES (43, 'orqizilov Abdurazzoq', 'UZ-QA', 'AB 9646022', '9.99E+11', 475000.00, 0, 'Holder bought too. Problem with bagage (by us). Fixed the bicycle for 35.000. Ended 14.06.2024', false, 47);
INSERT INTO public.clients VALUES (44, 'Khudoyshukurov Sardorbek Ali ogli', 'UZ-TO', 'AC2735686', '9.99E+11', 312000.00, 0, 'Ended. 15.04.2024', false, 2);
INSERT INTO public.clients VALUES (45, 'Primov Zuhriddin', 'UZ-JI', 'AB 9227578', '9.99E+11', 544000.00, 0, 'Came with 1079. Ended 08.06.2024.', false, 50);
INSERT INTO public.clients VALUES (46, 'Bakhtiyorov Ilkhomjon Xudoyor ogli', 'UZ-TO', 'AC2277974', '9.99E+11', 12000.00, 231, 'Talked at 01/07 last time. Than disapeared', true, 2);
INSERT INTO public.clients VALUES (47, 'Astaov Dilshod', 'UZ-JI', 'AB 8687095', '9.99E+11', 664000.00, 0, 'Came with 1078. Will come and pay in 10.06.2024. Worked in Yandex. Ended', false, 60);
INSERT INTO public.clients VALUES (48, 'Murodbekov Asadbek', 'UZ-TO', 'AD 0752430', '9.99E+11', 280000.00, 0, 'Ended. 24.04. Paid in advance', false, 8);
INSERT INTO public.clients VALUES (49, 'Negmatov Nekruz Raxmatovich', 'UZ-SA', 'AC2912880', '9.99E+11', NULL, 225, 'No comment', true, 8);
INSERT INTO public.clients VALUES (50, 'Mamayusupov Bobur Tolqinivich', 'UZ-TO', 'AD2473483', '9.99E+11', 12000.00, 231, 'Have lost a bicycle. Will pay in three days all debt.
LEFT everything after God. God bless him', true, 2);
INSERT INTO public.clients VALUES (51, 'Ismailov Amirbek', 'UZ-BU', 'AC 2677179', '9.99E+11', 584000.00, 0, 'Endedn 05.06.2024', false, 52);
INSERT INTO public.clients VALUES (52, 'Sheribayev Ramazan Jumabay Uli', 'UZ-TO', 'AD2025803', '9.99E+11', 502000.00, 0, 'Ended. 02.05.2024', false, 45);
INSERT INTO public.clients VALUES (53, 'Akbarov Abdurashidxon Raximjon ogli', 'UZ-FA', 'AC0230607', '9.99E+11', 344000.00, 231, 'Ended. 20.04', false, 2);
INSERT INTO public.clients VALUES (54, 'Zulfiqorov Abdulaziz Rahmonqul ogli', 'UZ-NG', 'AB9256127', '9.98E+11', 624000.00, 0, 'Ended 08.05.2024', false, 44);
INSERT INTO public.clients VALUES (55, 'Adahamjoov Murtozbek', 'UZ-AN', 'AC 0239634', '9.99E+11', 1664000.00, 161, 'Ended 09.10.2024, Have to pay a debt. Made a plan of payment for him', false, 8);
INSERT INTO public.clients VALUES (56, 'Shukurov Suxrobjon', 'UZ-SA', 'AD 0788897', '9.98E+11', 1112000.00, 14, 'Gonna bring back the bike', false, 102);
INSERT INTO public.clients VALUES (57, 'Salimov Xurshidjon Shavkat ogli', 'UZ-BU', 'AC0355427', '9.99E+11', 1883569.00, 0, 'Ended 23.08.2024', false, 158);
INSERT INTO public.clients VALUES (58, 'Rustamov Azizbek Qobiljon ogli', 'UZ-SA', 'AB 1234567', '9.99E+11', 1298000.00, 0, 'Ended 16.07.2024', false, 120);
INSERT INTO public.clients VALUES (59, 'Abdiolimov Ravshanbek Rustambek ogli', 'UZ-TO', 'AD 0672463', '9.99E+11', 12000.00, 231, 'Not available', true, 2);
INSERT INTO public.clients VALUES (60, 'Karimov Sunnatillo Karim ogli', 'UZ-JI', 'AD0327107', '9.99E+11', 512000.00, 0, 'Gone to Russia, +8000.
Avazbek +998950434205 his friend, will bring back the bike on 02.09.2024 and pay 400.000 and also pay other debt in a month.

Avazbek brought back the bike 12.09.2024', false, 43);
INSERT INTO public.clients VALUES (61, 'Baratov Alimuxammad Turabek ogli', 'UZ-TO', 'AB3104819', '9.99E+11', 12000.00, 230, 'Not responding', true, 2);
INSERT INTO public.clients VALUES (62, 'Tajiaxmedov Bobirjon Toxirjon ogli', 'UZ-QA', 'AD0563860', '9.99E+11', 332000.00, 0, 'Ended. 01.05.2024', false, 32);
INSERT INTO public.clients VALUES (63, 'Majidov Xoliqnazar Muzaffar ogli', 'UZ-JI', 'AD4683684', '9.99E+11', 12000.00, 230, 'From Zomin. Will pay by parts. Disapeared, friends say that he is a jerk', true, 2);
INSERT INTO public.clients VALUES (64, 'Kibirov Shaxzod Maxmud ogli', 'UZ-TK', 'AC2059231', '9.99E+11', 356000.00, 0, 'Ended 20.04.2024', false, 32);
INSERT INTO public.clients VALUES (65, 'Abdullajoov Abrorbek', 'UZ-TK', 'AB 1234567', '9.99E+11', 130000.00, 176, 'Has lost a bicycle ''cause gave it to his friend in the park. Firstly gonna pay for a debt and then divide bicycle fee to two parts each 15 day of the month from June.', true, 15);
INSERT INTO public.clients VALUES (66, 'Dadajon (name is like that)', 'UZ-BU', 'AB 1234567', '9.99E+11', 472000.00, 0, 'Ended 30.05.2024, and paid for repairing 92.000', false, 36);
INSERT INTO public.clients VALUES (67, 'Xolbozorov Quvonchbek', 'UZ-TK', 'AB 1234567', '9.99E+11', 160000.00, 0, 'Ended in 2 weeks. ', false, 15);
INSERT INTO public.clients VALUES (68, 'Shomurodov Doniyor Bahtiyor o`g`li', 'UZ-QR', 'KA 1102377', '9.99E+11', 996000.00, 0, 'Ended 23.07.2024', false, 90);
INSERT INTO public.clients VALUES (69, 'Ernazarov Iftihor Olimboy o`g`li', 'UZ-TO', 'AD 1547799', '9.99E+11', 320000.00, 164, 'CALL!!!', true, 31);
INSERT INTO public.clients VALUES (70, 'Xushvaqtov Oybek Otabek o`g`li', 'UZ-SU', 'AB 6508197', '9.99E+11', 400000.00, 0, 'Ended 08.06.2024', false, 8);
INSERT INTO public.clients VALUES (71, 'Almasov Jaloliddin Yusup o`g`li', 'UZ-SU', 'AB 1234567', '9.99E+11', 420000.00, 0, 'Ended 12.06.2024', false, 40);
INSERT INTO public.clients VALUES (72, 'Mamatmumiov Anvarxon Abdihamid o`g`li', 'UZ-SU', 'AB 1234567', '9.99E+11', 420000.00, 0, 'Ended 12.06.2024', false, 40);
INSERT INTO public.clients VALUES (73, 'Sharafiddiov Asrorjon', 'UZ-FA', 'AB 9535169', '9.99E+11', 330000.00, 0, 'Ended 04.06.2024', false, 32);
INSERT INTO public.clients VALUES (74, 'Abduvaliyev Jamshidbek', 'UZ-FA', 'AC 2397502', '9.99E+11', 1056000.00, 0, 'Ended 10.08.2024. Will pay for the tire', false, 90);
INSERT INTO public.clients VALUES (75, 'To`ychiyev Shaxriyor Bobomurod o`g`li', 'UZ-JI', 'AD 0604712', '9.99E+11', 386000.00, 0, 'Ended 07.06.2024. Paid 20.000 additional for bag', false, 32);
INSERT INTO public.clients VALUES (76, 'Qurbonmurodov Samandar', 'UZ-QA', 'AD 0273728', '9.99E+11', 332000.00, 144, 'Said that damaged the bike. CALL!!!', true, 32);
INSERT INTO public.clients VALUES (77, 'Xaydarov Bahtiyor Abdumannapovich', 'UZ-TO', 'AD 1206380', '9.98E+11', 164000.00, 0, 'Ended', false, 15);
INSERT INTO public.clients VALUES (78, 'Nurqobilov Javohir', 'UZ-SU', 'AD 0828641', '9.99E+11', 420000.00, 0, 'Ended 27.06.2024', false, 31);
INSERT INTO public.clients VALUES (79, 'Erkaboyev Akbar Tulqi o`g`li', 'UZ-QA', 'AD 0444644', '9.99E+11', 80000.00, 0, 'Ended 26.05.2024', false, 8);
INSERT INTO public.clients VALUES (80, 'Tashboltayev Tolmos Kobil o`g`li', 'UZ-SA', 'AD 0383216', '9.99E+11', 288000.00, 0, 'Ended 11.06.2024', false, 22);
INSERT INTO public.clients VALUES (81, 'Madijoov Shamshodbek ', 'UZ-NG', 'AD 0181223', '9.99E+11', 252000.00, 0, 'Ended 02.06.2024', false, 10);
INSERT INTO public.clients VALUES (82, 'Usmaov Izzatillo Lutpillo o`g`li', 'UZ-AN', 'AD 1547799', '9.99E+11', 48000.00, 161, 'No respond', true, 5);
INSERT INTO public.clients VALUES (83, 'Sherbutayev Botir Shuhrat o`g`li', 'UZ-QA', 'AC 0385255', '9.99E+11', 285824.00, 0, 'Ended 30.06.2024', false, 12);
INSERT INTO public.clients VALUES (84, 'Hamidov Bobojon', 'UZ-NG', 'AC 1376343', '9.99E+11', 64000.00, 0, 'Ended 29.05.2024', false, 5);
INSERT INTO public.clients VALUES (85, 'Shomurodov Shokhzod', 'UZ-XO', 'AC 1789818', '9.99E+11', 330000.00, 0, 'No comment', false, 30);
INSERT INTO public.clients VALUES (86, 'Xasanjoov Qobilbek Erkin o`g`li ', 'UZ-TO', 'AB 1234567', '9.99E+11', 340000.00, 0, 'Ended 28.06.2024', false, 31);
INSERT INTO public.clients VALUES (87, 'Karimov Durbek Latifjon o`g`li', 'UZ-FA', 'AC 2420459', '9.99E+11', 320000.00, 0, 'Ended 10.06.2024. Good boy', false, 29);
INSERT INTO public.clients VALUES (88, 'Akbarov Shuhrat Jurayevich', 'UZ-QA', 'AD 1236465', '9.99E+11', 320000.00, 0, 'No comment', false, 31);
INSERT INTO public.clients VALUES (89, 'Rahmoov Madrahim', 'UZ-QA', 'AB 1234567', NULL, 12000.00, 0, 'Gave up for hte next day', false, 1);
INSERT INTO public.clients VALUES (90, 'Tursuon Yorqinbek Jasur o`g`li', 'UZ-QA', 'AD 1349766', '9.99E+11', 80000.00, 142, 'No respond', true, 8);
INSERT INTO public.clients VALUES (91, 'Musayev Bekzod Samad o`g`li', 'UZ-QA', 'AC 2606789', '9.99E+11', 560000.00, 0, 'Ended 30.07.2024', false, 31);
INSERT INTO public.clients VALUES (92, 'Ravshaov Ilhom Ravshaovich', 'UZ-TK', 'AB 1234567', '9.99E+11', 24000.00, 0, 'Ended 12.06.2024', false, 3);
INSERT INTO public.clients VALUES (93, 'Abduvaliyev Abdullaziz Farhod o`g`li', 'UZ-TO', 'AB 6434765', '9.99E+11', 320000.00, 0, 'Ended 12.07.2024', false, 31);
INSERT INTO public.clients VALUES (94, 'Djandullayev Baxt Xamidulla o`g`li', 'UZ-TO', 'AD 1347173', '9.99E+11', 328628.00, 0, 'Ended. Check it!!!', false, 34);
INSERT INTO public.clients VALUES (95, 'Allabergaov Jasur Mansur o`g`li', 'UZ-QR', 'AG 1162222', '9.99E+11', 440000.00, 0, 'Ended 30.07.2024', false, 38);
INSERT INTO public.clients VALUES (96, 'Holboyev Elshod Shavkat o`g`li', 'UZ-QA', 'AD 0527667', '9.99E+11', 612000.00, 0, 'Ended 23.08.2024', false, 58);
INSERT INTO public.clients VALUES (97, 'Ashirov Asadbek Dilshod o`g`li', 'UZ-JI', 'AB 7130833', '9.99E+11', 480000.00, 0, 'Ended 01.08.2024. Good boy', false, 43);
INSERT INTO public.clients VALUES (98, 'Jurayev Abbos Hudoyberdi o`g`li', 'UZ-SA', 'AA 7474421', '9.99E+11', 160000.00, 0, 'Ended 26.06.2024', false, 15);
INSERT INTO public.clients VALUES (99, 'Rahmonqulov Azizbek Karomat o`g`li', 'UZ-SU', 'AC 1176108', '9.99E+11', 1520000.00, 2, 'No comment', false, 134);
INSERT INTO public.clients VALUES (100, 'Abdug`ofurov Abdurahmon Obidjon o`g`li', 'UZ-TO', 'AD 0588562', '9.99E+11', 321765.00, 0, 'Ended 30.07.2024. Given 3 days ''cause of comming back home', false, 33);
INSERT INTO public.clients VALUES (101, 'Bosimov Elmurod Dilshod o`g`li', 'UZ-JI', 'AD 1673636', '9.99E+11', 160000.00, 0, 'Ended 12.07.2024. Paid 70.000 for repairing', false, 15);
INSERT INTO public.clients VALUES (102, 'Yuldashev Fatxulla Hayrulla o`g`li', 'UZ-FA', 'AD 0992574', '9.99E+11', 320000.00, 0, 'CALL!!!', false, 30);
INSERT INTO public.clients VALUES (103, 'Turdaliyev Sunnat', 'UZ-TO', 'AB 9219606', '9.98E+11', 160000.00, 0, 'Ended 30.07.2024', false, 15);
INSERT INTO public.clients VALUES (104, 'Murodbekov Asadbek Shaxzodbek o`g`li', 'UZ-TO', 'AB 1234567', '9.99E+11', 540000.00, 0, 'Ended 03.09.2024', false, 45);
INSERT INTO public.clients VALUES (105, 'Shaydullayev Ulug`bek', 'UZ-SU', 'AC 2040421', '9.99E+11', 320000.00, 0, 'Ended 18.08.2024', false, 31);
INSERT INTO public.clients VALUES (106, 'Valijoov Jaloliddin', 'UZ-NG', 'AC 0449615', '9.99E+11', 400000.00, 0, 'Ended 05.09.2024', false, 37);
INSERT INTO public.clients VALUES (107, 'ormurodov Diyorbek', 'UZ-TK', 'AB 1234567', '9.98E+11', 240392.00, 74, 'No comment', false, 22);
INSERT INTO public.clients VALUES (108, 'Istamburiyev Akhmad', 'UZ-QA', 'AC 2564842', '9.99E+11', 720000.00, 0, 'Will pay on 20th of October for repairment of the bike. Ended 10.10.2024', false, 31);
INSERT INTO public.clients VALUES (109, 'Abduraimov Farkhod', 'UZ-SU', 'AD 1271165', '9.99E+11', 40000.00, 0, 'Ended 12.09.2024', false, 3);
INSERT INTO public.clients VALUES (110, 'Oltiboyev Kamol', 'UZ-SU', 'AB 1234567', NULL, 40000.00, 0, 'Ended 12.09.2024', false, 3);
INSERT INTO public.clients VALUES (111, 'Choriyev Dilshodbek', 'UZ-SU', 'AB 1234567', '9.98E+11', 180000.00, 0, 'Ended 19.08.2024. Before deadline. Black list', false, 15);
INSERT INTO public.clients VALUES (112, 'Adamboyev Farrux', 'UZ-TO', 'AB 2424902', '9.99E+11', 95000.00, 0, 'Ended before the time. Gave up working. Good man.', false, 1);
INSERT INTO public.clients VALUES (113, 'Umrzokov Abdurahimjon', 'UZ-FA', 'AB 1583323', '9.99E+11', 253333.00, 0, 'Ended 08.10.2024', false, 1);
INSERT INTO public.clients VALUES (114, 'Usmoov Azizbek', 'UZ-QR', 'AD 0133229', '9.99E+11', 95000.00, 40, 'пообещал заплатить 1го ноября ', false, 1);
INSERT INTO public.clients VALUES (115, 'Boltaboyev Usmonho`ja ', 'UZ-AN', 'AD 0805912', '9.98E+11', 475000.00, 0, 'Call!!! Wanted to bring back the bike on Oct 20/1 номер несущ, а 2 недоступен ', false, 1);
INSERT INTO public.clients VALUES (116, 'Toshtemirov Javlonbek', 'UZ-SA', 'AB 6513618', '9.99E+11', 190000.00, 0, 'Ended 06.10.2024. Debt for the Cameras of the bike 40.000', false, 1);
INSERT INTO public.clients VALUES (117, 'Ismoilov Ashurbek', 'UZ-TK', 'AD 2546131', '9.99E+11', 408000.00, 0, 'Ended 21.10.2024', false, 1);
INSERT INTO public.clients VALUES (118, 'Hurramov O`gabek', 'UZ-SU', 'AC 2029044', '9.99E+11', 190000.00, 0, 'Ended 03.10.2024', false, 1);
INSERT INTO public.clients VALUES (119, 'Tilovqobilov Holbo`ta', 'UZ-SU', 'AC 2307894', '9.99E+11', 285000.00, 0, 'Ended 16.10.2024. Good boy', false, 1);
INSERT INTO public.clients VALUES (120, 'Yigitaliyev Abdubanob', 'UZ-FA', 'AC 3193344', '9.99E+11', 570000.00, 0, 'Ended 29.10.2024', false, 1);
INSERT INTO public.clients VALUES (121, 'Qulmatov Tohirbek', 'UZ-SA', 'AD 0810577', '9.99E+11', 378000.00, 0, 'Ended 23.10.2024. Debt 2.000 additional.Broke 6 Spitsas. Little brother paid 30.000 for it', false, 1);
INSERT INTO public.clients VALUES (122, 'Ramazoov Ilkhom', 'UZ-NW', 'AC 0281167', '9.99E+11', 190000.00, 35, 'Ended 09.10.2024', false, 1);
INSERT INTO public.clients VALUES (123, 'Mustafoyev Nuriddin', 'UZ-JI', 'AB 1234567', '9.99E+11', 503000.00, 0, 'Ended 02.11.2024', false, 1);
INSERT INTO public.clients VALUES (124, 'Hasaov Zikrullox', 'UZ-FA', 'AD 0020223', '9.99E+11', 475000.00, 3, 'No comment', false, 1);
INSERT INTO public.clients VALUES (125, 'Matkarimov Islomjon', 'UZ-FA', 'AD 2031915', '9.99E+11', 285000.00, 0, 'Ended 19.10.2024', false, 1);
INSERT INTO public.clients VALUES (126, 'Raximov Navro?zbek', 'UZ-FA', 'AA 8119225', '9.99E+11', 380000.00, 1, 'оплатит завтра вечером ', false, 1);
INSERT INTO public.clients VALUES (127, 'Ayteov Jahongir', 'UZ-QR', 'AD 1619740', '9.99E+11', 285000.00, 0, 'Ended 21.10.2024', false, 1);
INSERT INTO public.clients VALUES (128, 'Sodiqov Muxsinjon', 'UZ-FA', 'AD 1847416', '9.99E+11', 232000.00, 0, 'Ended 18.10.2024', false, 1);
INSERT INTO public.clients VALUES (129, 'Abdusamadov Azizbek ', 'UZ-FA', 'AD 1602899', '9.99E+11', 204000.00, 0, 'Ended 18.10.2024', false, 1);
INSERT INTO public.clients VALUES (130, 'Eshonkhoov Muhammadayubkhon', 'UZ-NG', 'AC 3095959', '9.99E+11', 190000.00, 21, 'Call./недоступен', false, 1);
INSERT INTO public.clients VALUES (131, 'Aliyev Azizbek Baxtiyor o`g`li ', 'UZ-NG', 'AB 1234567', '9.99E+11', 380000.00, 3, 'Took a bike from his friend Amirbek.', false, 1);
INSERT INTO public.clients VALUES (132, 'Latipov Sarvarbek Yodgorbek o`g`li', 'UZ-AN', 'AD 0993614', '9.99E+11', 290000.00, 0, '+5000 (''cause paid 100)', false, 1);
INSERT INTO public.clients VALUES (133, 'O`lmasov Diyorbek Ihtiyorjon o`g`li', 'UZ-FA', 'AB 5471600', '9.99E+11', 95000.00, 0, 'Ended 26.10.2024', false, 1);
INSERT INTO public.clients VALUES (134, 'Toshtemirov O`lmasjon Shodi o`g`li', 'UZ-SA', 'AC 1767185', '9.99E+11', 288039.00, 5, '3039', false, 1);
INSERT INTO public.clients VALUES (135, 'Bekpulatov Nuriddin G`ayratjon o`g`li', 'UZ-NW', 'AD 2774911', '9.99E+11', 95000.00, 0, 'No comment', false, 1);
INSERT INTO public.clients VALUES (136, 'Shoydullayev Fazliddin Bahtiyor o`g`li', 'UZ-SI', 'AD 1206161', '9.99E+11', 190000.00, 0, 'Ended 02.11.2024', false, 1);
INSERT INTO public.clients VALUES (137, 'Jalgasbayev Doniyor Dauranbekovich', 'UZ-QR', 'AD 1213255', '9.99E+11', 190000.00, 2, 'No comment', false, 1);
INSERT INTO public.clients VALUES (138, 'Muhammadaliyev Qobiljon Sadridin o`g`li', 'UZ-FA', 'AD 157 5913', '9.99E+11', 285000.00, 6, 'Came with 1171', false, 1);
INSERT INTO public.clients VALUES (139, 'Nematov Ozodbek Keldiyor o`g`li', 'UZ-SA', 'AD 0749832', '9.99E+11', 190000.00, 1, 'Came with 1170', false, 1);
INSERT INTO public.clients VALUES (140, 'Ergashev Sardor Sirojiddin o`g`li', 'UZ-QA', 'AC 2724549', '9.99E+11', 100000.00, 4, '5', false, 1);
INSERT INTO public.clients VALUES (141, 'Shomurodov Doniyor', 'UZ-QR', 'AC 1401238', '9.99E+11', 95000.00, 4, 'No comment', false, 1);
INSERT INTO public.clients VALUES (142, 'Raupov Muhammadamin Akmal o`g`li', 'UZ-SA', 'AB 1234567', '9.99E+11', 95000.00, 1, 'No comment', false, 1);
INSERT INTO public.clients VALUES (143, 'Tillaboyev Azizbek Anvarovich', 'UZ-FA', 'AB 6740946', '9.99E+11', 95000.00, -4, 'No comment', false, 1);
INSERT INTO public.clients VALUES (144, 'Ahmadaliyev Asliddin Adhamjon o`g`li', 'UZ-FA', 'AC 1234567', '9.99E+11', NULL, 0, 'No comment', false, 1);
INSERT INTO public.clients VALUES (145, 'Abduraufov Muhammadyusuf Muhammadjon o`g`li', 'UZ-FA', 'AC 2977273', '9.99E+11', NULL, 0, 'No comment', false, 1);
INSERT INTO public.clients VALUES (146, 'Abdumadjidov Abdurahmon', 'UZ-FA', 'AC 2095078', '9.99E+11', NULL, 0, 'No comment', false, 1);
INSERT INTO public.clients VALUES (147, 'Yo`ldashev Hojiakbar Azizbek o`g`li', 'UZ-AN', 'AD 1482184', '9.99E+11', NULL, 0, 'No comment', false, 1);
INSERT INTO public.clients VALUES (148, 'Ibrohimov Ahmadullo To`tasin o`g`li', 'UZ-FA', 'AD 0912417', '9.99E+11', 520000.00, 0, 'Has taken 2 bikes. Ended 23.10.2024', false, 1);
INSERT INTO public.clients VALUES (149, 'Obidov Umidjon', 'UZ-TK', 'AC 1234567', '9.99E+11', 320000.00, 0, 'No comment', false, 1);
INSERT INTO public.clients VALUES (150, 'Olimov Bahtiyorjon Abdumumin o`g`li', 'UZ-AN', 'AC 2169001', '9.99E+11', 60000.00, 0, 'ENDED', false, 8);
INSERT INTO public.clients VALUES (151, 'Abdurahimov Hurshid', 'UZ-FA', 'AD 0351391', '9.99E+11', 150000.00, 0, 'Problems with bice -50.000 / ENDED', false, 11);
INSERT INTO public.clients VALUES (152, 'Adhamov Izzatilla', 'UZ-FA', 'AC 3048668', '9.99E+11', 1260000.00, 0, 'Ended 11.06.2024', false, 127);
INSERT INTO public.clients VALUES (153, 'Shavkatjoov Shoxruxjon Shavkatjon o`g`li', 'UZ-TK', 'AC 2184202', '9.99E+11', 1170000.00, 0, 'Ended 25.05.2024', false, 114);
INSERT INTO public.clients VALUES (154, 'Ergashev Yahyobek Tohirjon o`g`li', 'UZ-NG', 'AD 0368157', '9.99E+11', 80000.00, 0, 'ENDED', false, 9);
INSERT INTO public.clients VALUES (155, 'Turguov Kamronbek Mirzayo`ldosh o`g`li', 'UZ-FA', 'AD 1092374', '9.99E+11', 410000.00, 0, 'Ended. 11.03.2024', false, 42);
INSERT INTO public.clients VALUES (156, 'Sodikov Muhammadaziz Tohirjon o`g`li', 'UZ-FA', 'AB 4029011', '9.99E+11', 50000.00, 0, 'ENDED (before expirasion day)', true, 5);
INSERT INTO public.clients VALUES (157, 'Abduqodirov Mardonbek Marufjon o`g`li', 'UZ-FA', 'AB 8070298', '9.99E+11', 170000.00, 0, 'ENDED', false, 17);
INSERT INTO public.clients VALUES (158, 'Karimov Zoirjon Erkinjon o`g`li', 'UZ-FA', 'AB 8658946', '9.99E+11', 30000.00, 0, 'ENDED', false, 4);
INSERT INTO public.clients VALUES (159, 'Shukuriddiov Qudratillo Qurbonali o`g`li', 'UZ-FA', 'AD 0844433', '9.99E+11', 70000.00, 0, 'ENDED', false, 8);
INSERT INTO public.clients VALUES (160, 'Abdurahmoov Samandar Abduvahob o`g`li', 'UZ-AN', 'AC 2045425', '9.99E+11', 70000.00, 0, 'ENDED', false, 8);
INSERT INTO public.clients VALUES (161, 'Yo`lchiboyev Sherzodbek Sherali o`g`li ', 'UZ-FA', 'AC 2192269', '9.99E+11', 730000.00, 0, 'ENDEDю 16.04.2024', false, 74);
INSERT INTO public.clients VALUES (162, 'Zoxidov Diyorbek Zohid o`g`li', 'UZ-SI', 'AD 0493932', '9.99E+11', 70000.00, 0, 'Ended', false, 15);
INSERT INTO public.clients VALUES (163, 'Odilov Abdullaziz To`htasin o`g`li', 'UZ-FA', NULL, '9.99E+11', 10000.00, 0, 'ENDED. Gave Up', false, 17);
INSERT INTO public.clients VALUES (164, 'Burhoov Shaxzod Barot o`g`li', 'UZ-TK', 'AD 1057718', '9.99E+11', 260000.00, 0, 'With Saminov Nurmuhammad. Ended', false, 33);
INSERT INTO public.clients VALUES (165, 'Samiov Nurmuhammad Lazizjon o`g`li', 'UZ-FA', 'AD 2006628', '9.99E+11', 260000.00, 0, 'With Burhonov Shahzod. Ended', false, 33);
INSERT INTO public.clients VALUES (166, 'Pardayev Abbos Kamoliddiovich', 'UZ-SA', 'AC 2673037', '9.99E+11', 140000.00, 0, 'ENDED', false, 15);
INSERT INTO public.clients VALUES (167, 'Tursunaliyev Farhodjon Tulkinali o`g`li', 'UZ-NG', 'AC 1797974', '9.99E+11', 1140000.00, 0, 'Ended 01.06.2024', false, 78);
INSERT INTO public.clients VALUES (168, 'Hasaov Bekmuhammad Umidjon o`g`li', 'UZ-FA', 'AC 1505819', '9.99E+11', 290000.00, 0, 'ENDED', false, 30);
INSERT INTO public.clients VALUES (169, 'Ismoilov Islombek Alisher o`g`li', 'UZ-FA', 'AB 6627719', '9.99E+11', 460000.00, 230, 'Promised to pay on 22 of July 1.000.000', true, 46);
INSERT INTO public.clients VALUES (170, 'Tursunboyev Sulaymonjon Toxirjon o`g`li', 'UZ-TK', 'AC 3126209', '9.99E+11', 770000.00, 0, 'Ended 06.05.2024. Good boy', false, 78);
INSERT INTO public.clients VALUES (171, 'Gaybullayev Zufarbek Saydullo o`g`li', 'UZ-FA', 'AC 2527972', '9.99E+11', 1370000.00, 0, 'Ended 03.07.2024', false, 121);
INSERT INTO public.clients VALUES (172, 'Mamurjoov Islombek', 'UZ-TK', 'AB 1234567', '9.99E+11', 1190000.00, 0, 'Ended 11.06.2024', false, 119);
INSERT INTO public.clients VALUES (173, 'Abdullayev Abdulhafiz Muhammadjon o`g`li', 'UZ-FA', 'AC 2202773', '9.99E+11', 280000.00, 0, 'Ended. 17.03.2024', false, 29);
INSERT INTO public.clients VALUES (174, 'Soliyev Abdurauf Nuriddin o`g`li', 'UZ-NG', 'AA 7314397', '9.99E+11', 961000.00, 0, 'Ended 08.06.2024', false, 97);
INSERT INTO public.clients VALUES (175, 'Usmonaliyev Alimardon Numonjon o`g`li', 'UZ-FA', 'AB 1886275', '9.99E+11', 50000.00, 0, 'Ended.', false, 8);
INSERT INTO public.clients VALUES (176, 'Avazov Fazliddin Rashid o`g`li', 'UZ-SU', 'AC 2346971', '9.99E+11', 210000.00, 0, 'Ended 11.03', false, 22);
INSERT INTO public.clients VALUES (177, 'Omonboyev Hushnutbek Tolibjon o`g`li', 'UZ-FA', 'AD 0817599', '9.99E+11', 50000.00, 0, 'Ended . 02.03', false, 8);
INSERT INTO public.clients VALUES (178, 'Begjoov Javlonbek Qodirjon o`g`li', 'UZ-FA', 'AC 1646088', '9.99E+11', 10000.00, 0, 'With Otajonov. Giveuppers', true, 6);
INSERT INTO public.clients VALUES (179, 'Otajoov Otabek Azizovich', 'UZ-FA', 'AC 1702279', '9.99E+11', 60000.00, 0, 'With Begjonov. Giveuppers', true, 8);
INSERT INTO public.clients VALUES (180, 'Asilbek Ibrohimov', 'UZ-TK', 'AB 1234567', '9.99E+11', 1700000.00, 43, 'Ahmadullo Ibrohimov, Gave the Bice to his brother / Still works. 
Said that will pay for a debt 07.08.2024. 

Ended 28.09.2024. Have to pay debt', false, 171);
INSERT INTO public.clients VALUES (181, 'G`ofurjoov Sarvarbek G`olibjon o`g`li', 'UZ-NG', 'AC 0369256', '9.99E+11', 180000.00, 0, 'Ended. Talked on Telegram. Polite, but gave up in advance', false, 18);
INSERT INTO public.clients VALUES (182, 'Allaberdiyev Shohruh Abdurashid o`g`li', 'UZ-SU', 'AD 0574222', '9.99E+11', 35000.00, 0, 'Ended. 04.03.2024', false, 5);
INSERT INTO public.clients VALUES (183, 'Qobuljoov Eldorbek', 'UZ-TK', 'AB 1234567', '9.99E+11', 840980.00, 0, 'Ended 27.05.2024', false, 85);
INSERT INTO public.clients VALUES (184, 'Ashurov Bobur Ravshan o`g`li', 'UZ-FA', 'AC 2932092', '9.99E+11', 780000.00, 0, 'оплатил полную сумму ', false, 78);
INSERT INTO public.clients VALUES (185, 'Qodriov Abdumalik Abdusobir o`g`li', 'UZ-FA', 'AB 6091532', '9.98E+11', 1030000.00, 0, 'Ended 19.05.2024', false, 104);
INSERT INTO public.clients VALUES (186, 'Odilov Abduvosit Sharafjon o`g`li', 'UZ-FA', 'AB 7555738', '9.99E+11', 10000.00, 243, 'No comment', true, 2);
INSERT INTO public.clients VALUES (187, 'Abdurahimov Abduqahhor Abduhalim o`g`li', 'UZ-FA', 'AB 6091532', '9.99E+11', 310000.00, 0, 'Ended. 14.04.2024', false, 31);
INSERT INTO public.clients VALUES (188, 'Abdug`afforov Samandar Bahrom o`g`li', 'UZ-FA', 'AC 2706436', '9.99E+11', 10000.00, 0, 'BANNED. Ended. Gave up right on the first day', true, 2);
INSERT INTO public.clients VALUES (189, 'Saidov Salohiddin Nazirjon o`g`li', 'UZ-QA', 'AD 0854059', '9.99E+11', 370000.00, 0, 'Ended 23.04.2024', false, 38);
INSERT INTO public.clients VALUES (190, 'Exsoov Olimjon', 'UZ-FA', 'AD 3039877', '9.99E+11', 570000.00, 0, 'Ended 14.05.2024', false, 32);
INSERT INTO public.clients VALUES (191, 'Odilbekov Muhammadbek Oybek o`g`li', 'UZ-FA', 'AC 1986700', '9.99E+11', 270000.00, 0, 'Ended ', false, 1);
INSERT INTO public.clients VALUES (192, 'Shamsiddiov Muhammadazim Bahriddin o`g`li', 'UZ-FA', 'AD 3811517', '9.99E+11', 300000.00, 0, 'Ended 26.04.2024', false, 31);
INSERT INTO public.clients VALUES (193, 'Sodiqov Hojiakbar Ilhomjon o`g`li', 'UZ-FA', 'AB 8080934', '9.99E+11', 60000.00, 0, 'Ended. 01.04.2024. Debtor - 50.000 for 5 days', false, 8);
INSERT INTO public.clients VALUES (194, 'Muhtarov Akmaljon Azizjon o`g`li', 'UZ-FA', 'AD 1015385', '9.99E+11', 70000.00, 221, 'Doesn''t work for a long time that''s why could not pay for a rent. Little Jerk', true, 8);
INSERT INTO public.clients VALUES (195, 'Turdaliyev Sunnat Risboy o`g`li', 'UZ-TO', 'AB 9219606', '9.99E+11', 410000.00, 0, 'Ended', false, 42);
INSERT INTO public.clients VALUES (196, 'Ibrohimov Shakhboz Hasanboy o`g`li', 'UZ-FA', 'AC 1626406', '9.99E+11', 853000.00, 0, 'Ended 05.07.2024. BLACK LIST', false, 84);
INSERT INTO public.clients VALUES (197, 'Ibrohimov Islombek Husanboy o`g`li', 'UZ-FA', 'AD 1685378', '9.99E+11', 980000.00, 22, 'Bought a new bike, but not exactly what was. Needs to sell it and bring back the same ike as took. Stopped the timer ''cause of his conditions', false, 83);
INSERT INTO public.clients VALUES (198, 'Kazakbayev Tohir osir o`g`li', 'UZ-JI', 'AB 5785846', '9.99E+11', 300000.00, 0, 'Ended 23.05.2024', false, 31);
INSERT INTO public.clients VALUES (199, 'Qosimjoov Abrorbek Hursanali o`g`li', 'UZ-FA', 'AD 3435701', '9.99E+11', 160000.00, 186, 'Said tht will make a payment in a few days. ', false, 17);
INSERT INTO public.clients VALUES (200, 'Kurboov Amriddin Husniddin o`g`li', 'UZ-NW', 'AC 1674302', '9.99E+11', 220000.00, 0, 'Ended', false, 23);
INSERT INTO public.clients VALUES (201, 'Muqimov Muhriddin Fazliddin o`g`li', 'UZ-FA', 'AB 9084239', '9.99E+11', 720000.00, 114, 'CALL!!! Has lost a the bike and wanted to buy new one', false, 73);
INSERT INTO public.clients VALUES (202, 'Bekchaov Ahmadjon Mahmudjon o`g`li', 'UZ-QR', 'KA 1254344', '9.99E+11', 300000.00, 0, 'Ended 04.06.2024', false, 31);
INSERT INTO public.clients VALUES (203, 'Nematjoov Jamshidbek Soibjon o`g`li', 'UZ-FA', 'AB 8567036', '9.99E+11', 430000.00, 0, 'Ended 01.07.2024', false, 44);
INSERT INTO public.clients VALUES (204, 'Sobirjoov Nuriddin Otabek o`g`li', 'UZ-FA', 'AC 2939424', '9.99E+11', 630000.00, 80, 'Said that will pay today by bankomat if it will work, or by bank on Monday', false, 64);
INSERT INTO public.clients VALUES (205, 'Iomjoov Temurbek Tulanboy o`g`li', 'UZ-AN', 'AC 2909241', '9.99E+11', 323333.00, 0, 'Ended', false, 33);
INSERT INTO public.clients VALUES (206, 'Aslidin Ahmadaliyev ', 'UZ-TK', 'AD 6970529', '9.99E+11', 320000.00, 0, 'Ended before deadline. 12 days in advance', false, 31);


--
-- TOC entry 4831 (class 0 OID 24607)
-- Dependencies: 222
-- Data for Name: expences; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.expences VALUES (1, '2024-04-15', 'Operator', 'Full April', 350000);
INSERT INTO public.expences VALUES (2, '2024-04-15', 'Locker', 'Blue', 40000);
INSERT INTO public.expences VALUES (3, '2024-04-15', 'Locker', 'Black', 40000);
INSERT INTO public.expences VALUES (4, '2024-05-07', 'Repairing', '2 Bicycles', 290000);
INSERT INTO public.expences VALUES (5, '2024-05-13', 'Operator', 'Half of the may month', 200000);
INSERT INTO public.expences VALUES (6, '2024-05-16', 'Repairing', 'Two part of bicycle', 200000);
INSERT INTO public.expences VALUES (7, '2024-05-25', 'Repairing of the tire', 'Outer and inner parts of the tire', 150000);
INSERT INTO public.expences VALUES (8, '2024-05-27', 'Repairing of the tire', 'Outer and inner parts of the tire', 150000);
INSERT INTO public.expences VALUES (9, '2024-05-26', 'Operator (in Advance)', 'No comment', 590000);
INSERT INTO public.expences VALUES (10, '2024-05-30', 'Huge repairing', 'Ruller part and everything on a tire', 270000);
INSERT INTO public.expences VALUES (11, '2024-06-02', 'Repairing of the tire', 'No comment', 110000);
INSERT INTO public.expences VALUES (12, '2024-06-22', 'Repaired the tire and bought NASOS', 'No comment', 150000);
INSERT INTO public.expences VALUES (13, '2024-06-22', 'Bought NASOS', 'No comment', 40000);
INSERT INTO public.expences VALUES (14, '2024-06-24', 'Bought NASOS', 'No comment', 30000);
INSERT INTO public.expences VALUES (15, '2024-07-11', 'Repairing of the tire', 'Went and paid by himself', 60000);
INSERT INTO public.expences VALUES (16, '2024-07-17', 'Bikes repairing', '2 bikes with tire and ruller problems', 280000);
INSERT INTO public.expences VALUES (17, '2024-07-18', 'Bike repairing', 'Scoring details', 200000);
INSERT INTO public.expences VALUES (18, '2024-08-09', 'Bike repairing', 'Something went wrong', 80000);
INSERT INTO public.expences VALUES (19, '2024-10-09', 'Holder of a courier', 'Boy bought the holder, payment by a company', 42000);


--
-- TOC entry 4835 (class 0 OID 24629)
-- Dependencies: 226
-- Data for Name: rents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rents VALUES (1, 1, 1, '2024-03-07', 44, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (2, 2, 2, '2024-03-07', 66, 'Tashkent', 12000.00, 'debt', 3);
INSERT INTO public.rents VALUES (3, 3, 20, '2024-03-07', 2, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (4, 4, 21, '2024-03-07', 8, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (5, 5, 25, '2024-03-07', 81, 'Tashkent', 12000.00, 'full', 4);
INSERT INTO public.rents VALUES (6, 6, 28, '2024-03-07', 64, 'Tashkent', 12000.00, 'full', 4);
INSERT INTO public.rents VALUES (7, 7, 35, '2024-03-07', 13, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (8, 8, 15, '2024-03-07', 38, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (9, 9, 3, '2024-03-07', 2, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (10, 10, 20, '2024-03-07', 60, 'Tashkent', 12000.00, 'full', 4);
INSERT INTO public.rents VALUES (11, 11, 25, '2024-03-07', 8, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (12, 12, 29, '2024-03-07', 39, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (13, 13, 28, '2024-03-07', 39, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (14, 14, 21, '2024-03-07', 8, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (15, 15, 4, '2024-03-07', 8, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (16, 16, 5, '2024-03-07', 2, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (17, 17, 23, '2024-03-07', 2, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (18, 18, 6, '2024-03-07', 51, 'Tashkent', 12000.00, 'full', 3);
INSERT INTO public.rents VALUES (19, 19, 24, '2024-03-07', 2, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (20, 20, 7, '2024-03-07', 60, 'Tashkent', 12000.00, 'full', 4);
INSERT INTO public.rents VALUES (21, 21, 8, '2024-03-07', 61, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (22, 22, 9, '2024-03-13', 40, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (23, 23, 10, '2024-03-07', 2, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (24, 24, 11, '2024-03-07', 2, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (25, 25, 12, '2024-03-07', 8, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (26, 26, 13, '2024-03-07', 30, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (27, 27, 14, '2024-03-07', 2, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (28, 28, 19, '2024-03-29', 54, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (29, 29, 37, '2024-03-18', 1, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (30, 30, 15, '2024-03-18', 31, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (31, 31, 16, '2024-03-18', 2, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (32, 32, 38, '2024-03-25', 83, 'Tashkent', 12000.00, 'debt', 8);
INSERT INTO public.rents VALUES (33, 33, 39, '2024-03-31', 30, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (34, 34, 45, '2024-04-01', 40, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (35, 35, 15, '2024-04-04', 33, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (36, 36, 60, '2024-04-07', 29, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (37, 37, 17, '2024-03-18', 62, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (38, 38, 18, '2024-03-18', 2, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (39, 39, 52, '2024-04-02', 39, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (40, 40, 19, '2024-03-18', 8, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (41, 41, 20, '2024-03-18', 91, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (42, 42, 21, '2024-03-18', 8, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (43, 43, 22, '2024-04-16', 47, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (44, 44, 23, '2024-03-18', 2, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (45, 45, 24, '2024-04-17', 50, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (46, 46, 25, '2024-03-18', 2, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (47, 47, 26, '2024-04-17', 60, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (48, 48, 27, '2024-04-16', 8, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (49, 49, 28, '2024-03-18', 8, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (50, 50, 29, '2024-03-18', 2, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (51, 51, 30, '2024-04-15', 52, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (52, 52, 31, '2024-03-18', 45, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (53, 53, 32, '2024-03-18', 2, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (54, 54, 33, '2024-03-18', 44, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (55, 55, 53, '2024-04-18', 8, 'Tashkent', 12000.00, 'debt', 3);
INSERT INTO public.rents VALUES (56, 56, 33, '2024-04-21', 102, 'Tashkent', 12000.00, 'debt', 2);
INSERT INTO public.rents VALUES (57, 57, 34, '2024-03-18', 158, 'Tashkent', 12000.00, 'full', 4);
INSERT INTO public.rents VALUES (58, 58, 35, '2024-03-18', 120, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (59, 59, 36, '2024-03-18', 2, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (60, 60, 37, '2024-03-19', 43, 'Tashkent', 12000.00, 'debt', 3);
INSERT INTO public.rents VALUES (61, 61, 38, '2024-03-19', 2, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (62, 62, 39, '2024-03-19', 32, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (63, 63, 40, '2024-03-19', 2, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (64, 64, 41, '2024-03-19', 32, 'Tashkent', 12000.00, 'full', 4);
INSERT INTO public.rents VALUES (65, 65, 12, '2024-04-29', 15, 'Tashkent', 12000.00, 'debt', 2);
INSERT INTO public.rents VALUES (66, 66, 45, '2024-04-25', 36, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (67, 67, 23, '2024-04-23', 15, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (68, 68, 61, '2024-04-24', 90, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (69, 69, 8, '2024-04-25', 31, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (70, 70, 34, '2024-05-01', 8, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (71, 71, 56, '2024-05-04', 40, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (72, 72, 7, '2024-05-04', 40, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (73, 73, 49, '2024-05-04', 32, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (74, 74, 2, '2024-05-04', 90, 'Tashkent', 12000.00, 'debt', 4);
INSERT INTO public.rents VALUES (75, 75, 37, '2024-05-07', 32, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (76, 76, 50, '2024-05-14', 32, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (77, 77, 15, '2024-05-15', 15, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (78, 78, 62, '2024-05-16', 31, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (79, 79, 29, '2024-05-16', 8, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (80, 80, 42, '2024-05-16', 22, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (81, 81, 19, '2024-05-22', 10, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (82, 82, 53, '2024-05-24', 5, 'Tashkent', 12000.00, 'debt', 2);
INSERT INTO public.rents VALUES (83, 83, 31, '2024-05-25', 12, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (84, 84, 16, '2024-05-25', 5, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (85, 85, 58, '2024-05-27', 30, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (86, 86, 44, '2024-05-28', 31, 'Tashkent', 12000.00, 'full', 4);
INSERT INTO public.rents VALUES (87, 87, 22, '2024-05-14', 29, 'Tashkent', 12000.00, 'full', 4);
INSERT INTO public.rents VALUES (88, 88, 6, '2024-06-03', 31, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (89, 89, 48, '2024-06-04', 1, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (90, 90, 55, '2024-06-09', 8, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (91, 91, 35, '2024-06-09', 31, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (92, 92, 14, '2024-06-10', 3, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (93, 93, 59, '2024-06-13', 31, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (94, 94, 3, '2024-06-19', 34, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (95, 95, 52, '2024-06-20', 38, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (96, 96, 28, '2024-06-22', 58, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (97, 97, 46, '2024-06-22', 43, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (98, 98, 18, '2024-06-22', 15, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (99, 99, 60, '2024-06-23', 134, 'Tashkent', 12000.00, 'debt', 17);
INSERT INTO public.rents VALUES (100, 100, 38, '2024-06-27', 33, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (101, 101, 25, '2024-06-27', 15, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (102, 102, 54, '2024-07-11', 30, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (103, 103, 20, '2024-07-15', 15, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (104, 104, 40, '2024-07-18', 45, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (105, 105, 11, '2024-07-18', 31, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (106, 106, 33, '2024-07-31', 37, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (107, 107, 27, '2024-08-02', 22, 'Tashkent', 12000.00, 'debt', 2);
INSERT INTO public.rents VALUES (108, 108, 51, '2024-08-04', 31, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (109, 109, 17, '2024-09-12', 3, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (110, 110, 43, '2024-09-12', 3, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (111, 111, 30, '2024-08-07', 15, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (112, 112, 24, '2024-09-13', 1, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (113, 113, 9, '2024-09-18', 1, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (114, 114, 47, '2024-09-19', 1, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (115, 115, 43, '2024-09-20', 1, 'Tashkent', 12000.00, 'debt', 4);
INSERT INTO public.rents VALUES (116, 116, 44, '2024-09-20', 1, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (117, 117, 12, '2024-09-20', 1, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (118, 118, 45, '2024-09-21', 1, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (119, 119, 46, '2024-09-22', 1, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (120, 120, 11, '2024-09-22', 1, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (121, 121, 47, '2024-09-24', 1, 'Tashkent', 12000.00, 'full', 3);
INSERT INTO public.rents VALUES (122, 122, 48, '2024-09-24', 1, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (123, 123, 14, '2024-09-25', 1, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (124, 124, 26, '2024-09-26', 1, 'Tashkent', 12000.00, 'debt', 2);
INSERT INTO public.rents VALUES (125, 125, 49, '2024-09-26', 1, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (126, 126, 50, '2024-09-28', 1, 'Tashkent', 12000.00, 'debt', 3);
INSERT INTO public.rents VALUES (127, 127, 20, '2024-09-29', 1, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (128, 128, 51, '2024-09-29', 1, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (129, 129, 52, '2024-10-01', 1, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (130, 130, 53, '2024-10-01', 1, 'Tashkent', 12000.00, 'debt', 2);
INSERT INTO public.rents VALUES (131, 131, 51, '2024-10-04', 1, 'Tashkent', 12000.00, 'debt', 3);
INSERT INTO public.rents VALUES (132, 132, 54, '2024-10-07', 1, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (133, 133, 55, '2024-10-11', 1, 'Tashkent', 12000.00, 'full', 2);
INSERT INTO public.rents VALUES (134, 134, 56, '2024-10-10', 1, 'Tashkent', 12000.00, 'debt', 2);
INSERT INTO public.rents VALUES (135, 135, 45, '2024-10-16', 1, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (136, 136, 43, '2024-10-18', 1, 'Tashkent', 12000.00, 'full', 1);
INSERT INTO public.rents VALUES (137, 137, 41, '2024-10-20', 1, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (138, 138, 57, '2024-10-21', 1, 'Tashkent', 12000.00, 'debt', 2);
INSERT INTO public.rents VALUES (139, 139, 58, '2024-10-21', 1, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (140, 140, 59, '2024-10-25', 1, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (141, 141, 60, '2024-10-25', 1, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (142, 142, 61, '2024-10-27', 1, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (143, 143, 62, '2024-11-02', 1, 'Tashkent', 12000.00, 'debt', 1);
INSERT INTO public.rents VALUES (144, 144, 15, '2024-09-19', 1, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (145, 145, 62, '2024-09-18', 1, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (146, 146, 29, '2024-09-18', 1, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (147, 147, 42, '2024-09-24', 1, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (148, 148, 19, '2024-09-30', 1, 'Fergana', 10000.00, 'full', 2);
INSERT INTO public.rents VALUES (149, 149, 53, '2024-10-28', 1, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (150, 150, 63, '2024-01-27', 8, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (151, 151, 12, '2024-01-28', 11, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (152, 152, 45, '2024-01-28', 127, 'Fergana', 10000.00, 'full', 11);
INSERT INTO public.rents VALUES (153, 153, 23, '2024-01-28', 114, 'Fergana', 10000.00, 'full', 12);
INSERT INTO public.rents VALUES (154, 154, 61, '2024-01-28', 9, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (155, 155, 8, '2024-01-29', 42, 'Fergana', 10000.00, 'full', 5);
INSERT INTO public.rents VALUES (156, 156, 34, '2024-01-29', 5, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (157, 157, 56, '2024-01-29', 17, 'Fergana', 10000.00, 'full', 8);
INSERT INTO public.rents VALUES (158, 158, 7, '2024-01-30', 4, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (159, 159, 49, '2024-01-30', 8, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (160, 160, 2, '2024-02-01', 8, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (161, 161, 37, '2024-02-02', 74, 'Fergana', 10000.00, 'full', 3);
INSERT INTO public.rents VALUES (162, 162, 50, '2024-02-02', 15, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (163, 163, 15, '2024-02-04', 17, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (164, 164, 62, '2024-02-04', 33, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (165, 165, 29, '2024-02-04', 33, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (166, 166, 42, '2024-02-06', 15, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (167, 167, 19, '2024-02-06', 78, 'Fergana', 10000.00, 'full', 7);
INSERT INTO public.rents VALUES (168, 168, 53, '2024-02-09', 30, 'Fergana', 10000.00, 'full', 4);
INSERT INTO public.rents VALUES (169, 169, 31, '2024-02-10', 46, 'Fergana', 10000.00, 'debt', 9);
INSERT INTO public.rents VALUES (170, 170, 16, '2024-02-18', 78, 'Fergana', 10000.00, 'full', 10);
INSERT INTO public.rents VALUES (171, 171, 58, '2024-02-17', 121, 'Fergana', 10000.00, 'full', 4);
INSERT INTO public.rents VALUES (172, 172, 44, '2024-02-18', 119, 'Fergana', 10000.00, 'full', 12);
INSERT INTO public.rents VALUES (173, 173, 22, '2024-02-18', 29, 'Fergana', 10000.00, 'full', 4);
INSERT INTO public.rents VALUES (174, 174, 6, '2024-02-21', 97, 'Fergana', 10000.00, 'full', 3);
INSERT INTO public.rents VALUES (175, 175, 48, '2024-02-22', 8, 'Fergana', 10000.00, 'full', 2);
INSERT INTO public.rents VALUES (176, 176, 55, '2024-02-22', 22, 'Fergana', 10000.00, 'full', 3);
INSERT INTO public.rents VALUES (177, 177, 35, '2024-02-26', 8, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (178, 178, 14, '2024-02-26', 6, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (179, 179, 59, '2024-02-26', 8, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (180, 180, 3, '2024-02-27', 171, 'Fergana', 10000.00, 'debt', 5);
INSERT INTO public.rents VALUES (181, 181, 52, '2024-03-01', 18, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (182, 182, 28, '2024-03-03', 5, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (183, 183, 46, '2024-03-04', 85, 'Fergana', 10000.00, 'full', 2);
INSERT INTO public.rents VALUES (184, 184, 18, '2024-03-06', 78, 'Fergana', 10000.00, 'full', 16);
INSERT INTO public.rents VALUES (185, 185, 60, '2024-03-07', 104, 'Fergana', 10000.00, 'full', 12);
INSERT INTO public.rents VALUES (186, 186, 38, '2024-03-12', 2, 'Fergana', 10000.00, 'debt', 1);
INSERT INTO public.rents VALUES (187, 187, 25, '2024-03-14', 31, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (188, 188, 54, '2024-03-14', 2, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (189, 189, 20, '2024-03-15', 38, 'Fergana', 10000.00, 'full', 2);
INSERT INTO public.rents VALUES (190, 190, 40, '2024-03-18', 32, 'Fergana', 10000.00, 'full', 2);
INSERT INTO public.rents VALUES (191, 191, 11, '2024-03-24', 1, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (192, 192, 33, '2024-03-24', 31, 'Fergana', 10000.00, 'full', 3);
INSERT INTO public.rents VALUES (193, 193, 27, '2024-03-25', 8, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (194, 194, 51, '2024-03-28', 8, 'Fergana', 10000.00, 'debt', 1);
INSERT INTO public.rents VALUES (195, 195, 17, '2024-03-28', 42, 'Fergana', 10000.00, 'full', 5);
INSERT INTO public.rents VALUES (196, 196, 43, '2024-04-06', 84, 'Fergana', 10000.00, 'full', 2);
INSERT INTO public.rents VALUES (197, 197, 30, '2024-04-06', 83, 'Fergana', 10000.00, 'debt', 1);
INSERT INTO public.rents VALUES (198, 198, 24, '2024-04-23', 31, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (199, 199, 9, '2024-04-23', 17, 'Fergana', 10000.00, 'debt', 2);
INSERT INTO public.rents VALUES (200, 200, 47, '2024-04-24', 23, 'Fergana', 10000.00, 'full', 2);
INSERT INTO public.rents VALUES (201, 201, 39, '2024-05-09', 73, 'Fergana', 10000.00, 'debt', 6);
INSERT INTO public.rents VALUES (202, 202, 13, '2024-05-11', 31, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (203, 203, 5, '2024-05-19', 44, 'Fergana', 10000.00, 'full', 2);
INSERT INTO public.rents VALUES (204, 204, 32, '2024-06-21', 64, 'Fergana', 10000.00, 'debt', 3);
INSERT INTO public.rents VALUES (205, 205, 10, '2024-06-21', 33, 'Fergana', 10000.00, 'full', 1);
INSERT INTO public.rents VALUES (206, 206, 41, '2024-08-20', 31, 'Fergana', 10000.00, 'full', 1);


--
-- TOC entry 4827 (class 0 OID 24586)
-- Dependencies: 218
-- Data for Name: solo_general; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.solo_general VALUES (1, 'Xamirbekov Zahriddin', 'Tashkent region Pskent district Mustaqillik MFY Yoshlik street 11 uy', 'Tashkent', 12000.00, 'Black - Green', '1', 1, '2024-03-07', 44, 481036.00, 'full', 0, 1, true, 'good', false, 'Tire repair', 0.00, false, false);
INSERT INTO public.solo_general VALUES (2, 'Jamshid Bashirov', 'Jizzah G`ala orol tuman Ibn Sino street 77', 'Tashkent', 12000.00, 'Black - Green ', '2', 1, '2024-03-07', 66, 742942.00, 'debt', 63, 3, false, 'lost', false, 'Tube replacement', 0.00, false, false);
INSERT INTO public.solo_general VALUES (3, 'Olmosbek Egamberdiyev', 'Qashqadaryo Qarshi Mustaqillik street 12', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-07', 2, 12000.00, 'full', 0, 1, true, 'good', false, 'Spokes replacement', 0.00, false, false);
INSERT INTO public.solo_general VALUES (4, 'Aloxonov Saidnabixon', 'Samarkand Toylok tuman A. Temur street 89', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-07', 8, 80000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (5, 'Saypbekov Sultonbek Bahtiyorjon o`g`li', 'Karakalpakstan Kegile district Bozoto yo`li street 34', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-07', 81, 836000.00, 'full', 0, 4, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (6, 'Kenjibayev Pazilbek Nurlibayevich', 'Karakalpakstan Nukus city 22 - kichik rayon 19 - voyenniy 54 flat', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-07', 64, 720000.00, 'full', 0, 4, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (7, 'Kaynarov Azamjon Izzatillo o`g`li', 'Samarkand kattakurgan district Millakurpa street 56', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-07', 13, 162000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (8, 'Soliyev Oybek Shuhrat o`g`li', 'Sirdaryo Guliston tuman h. Alimjon MFY Yakkatut street 37', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-07', 38, 330000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (9, 'Qurbonov Jaloliddin Shavkat o`g`li', 'Jizzah Zaribdor tuman Mustaqillik MFY J. Manguberdi street 2', 'Tashkent', 12000.00, 'Black - Green', '3', 1, '2024-03-07', 2, 287883.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (10, 'Yusupbayev Jalolbek Quvondik o`g`li', 'Xorezm Yangi bozor tuman Shirinqo`ng`irot district Nurobod street 10', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-07', 60, 653569.00, 'full', 0, 4, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (11, 'Ibrohimov Abdurashid Rahmonjon o`g`li', 'Fergana region Kokand city Baynalminal street 17', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-07', 8, 80000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (12, 'Iskandarov Furqat', 'Surxandaryo region Sariosiyo tuman Boysunobod street 72', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-07', 39, 412000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (13, 'Sobirov Asadbek Hayotjon o`g`li', 'Samarkand region Kattakurgan tuman Yangiobod MFY 24', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-07', 39, 412000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (14, 'Mahkamov Tohirbek Zafarjon o`g`li', 'Namangan region Chortoq tuman Navbahor MFYGálaba street 14', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-07', 8, 80000.00, 'debt', 236, 1, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (15, 'Nuridinov Azamjon Mahmudjon o`g`li', 'Namangan region Chortoq tuman Navbahor MFY Mo`jas street 32', 'Tashkent', 12000.00, 'Blue ', '4', 1, '2024-03-07', 8, 80000.00, 'debt', 236, 1, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (16, 'Janibekov Jamshidbek Hurmatbek o`g`li', 'Horezm region Kush kupir tuman Adolat MFY Ustalar street 26', 'Tashkent', 12000.00, 'Black-Green', '5', 1, '2024-03-07', 2, 12000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (17, 'Kadambayev Jamshidbek', 'Horezm region Urgench city Yangi o`rta bog` MFY Tinch ostona street 108', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-07', 2, 12000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (18, 'Nortojiyev Quvonchbek', 'Samarqand region Narpay tuman Olti o`g`il MFY Chuvlok ', 'Tashkent', 12000.00, 'Grey ', '6', 1, '2024-03-07', 51, 972000.00, 'full', 0, 3, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (19, 'Obidov Shuhrat Narzullayevich', 'Samarqand region Payariq tuman Chelek city Uzbekistan mahalla Faol street 42', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-07', 2, 0.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (20, 'Abdunazarov Murodbek Bahtiyor o`g`li', 'Tashkent region Chinaz tuman Yaxshi niyyat MFY Ulug`bek street 37', 'Tashkent', 12000.00, 'Black-Red ', '7', 1, '2024-03-07', 60, 836000.00, 'full', 0, 4, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (21, 'Hudoyberdiyev Obid Shomurod o`g`li', 'Tashkent region Ohangaron city Ivalik street house 12 podyezd 2 28', 'Tashkent', 12000.00, 'Black-Red', '8', 1, '2024-03-07', 61, 640000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (22, 'Xamroyev Xondamir Ihtiyorovich', 'Navoiy region Karmana tuman Paxtaobod MFY Koinot street 49', 'Tashkent', 12000.00, 'Black-Red', '9', 1, '2024-03-13', 40, 424000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (23, 'Ismailov Otabek Gayrat o`g`li', 'Qashqadaryo region Nishon tuman Mirzo Ulugbek MFY Bobur street 74', 'Tashkent', 12000.00, 'Grey', '10', 1, '2024-03-07', 2, 264000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (24, 'Usmanov Shohruh Erkinjon o`g`li', 'Tashkent region Kibray tuman Baykurgan MFY Istoqbol street 39', 'Tashkent', 12000.00, 'Black-Red', '11', 1, '2024-03-07', 2, 12000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (25, 'Xoliqov Sarvarbek Sardor ogli', 'Yozyovon tumani', 'Tashkent', 12000.00, 'Black Red', '12', 1, '2024-03-07', 8, 12000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (26, 'Djanakulov Umidjon Normotovich', 'AD1280324', 'Tashkent', 12000.00, 'Blue', '13', 1, '2024-03-07', 30, 300000.00, 'full', 0, NULL, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (27, 'Vohobov Rufat Madiqul ogli', 'Tayloq tumani', 'Tashkent', 12000.00, 'Black-Red ', '14', 1, '2024-03-07', 2, 12000.00, 'debt', 242, NULL, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (28, 'Nabiyev Shaxboz', NULL, 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-29', 54, 584000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (29, 'Abdullayev Haytboy Umid o`g`li', 'Tashkent region Sergili tuman Samo street 2', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-18', NULL, NULL, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (30, 'Usibjonov Khasanboy Valijon ogli', 'AC2829541', 'Tashkent', 12000.00, 'Blek Green', '15', 1, '2024-03-18', 31, 300000.00, 'full', 0, NULL, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (31, 'Kamolov Sardorbek Qalandar ogli', 'AD0746565', 'Tashkent', 12000.00, 'Blek Green', '16', 1, '2024-03-18', 2, 12000.00, 'full', 0, NULL, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (32, 'Turonov Og`abek Rafikjon o`g`li', 'Fargana region Dang`ara district Abdusamad village 22', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-25', 83, 2546000.00, 'debt', 91, 8, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (33, 'Mirzasaidov Jahongir', 'Fergana region Oltiariq tuman Eshon MFY Hidoyat 127', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-03-31', 30, 320000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (34, 'Ahmedov Bakir Olimjon o`g`li', 'Jizzah region Bahmal tuman Gulbuloq MFY Hunarmand street 28', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-04-01', 40, 426000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (35, 'Alikulov Jasur Bahtiyor o`g`li', 'Sirdaryo region Sardoba tuman Jasorat street 2/11', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-04-04', 33, 328000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (36, 'Aminjonov Ozodbek', 'Fergana region Rishtan tuman Kashkayron MFY Yangi-yul 19', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-04-07', 29, 320000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (37, 'Sherqobilov Abdurahmon Olimovich', 'Denov tumani', 'Tashkent', 12000.00, ' Blek Green', '17', 1, '2024-03-18', 62, 680000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (38, 'Shokirov Ilyoshon Toyirjonivich', 'Mirzo-Ulugbek tumani', 'Tashkent', 12000.00, 'Blek Green', '18', 1, '2024-03-18', 2, 12000.00, 'full', 0, NULL, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (39, 'Ahmedov Bakir Olimjon o`g`li', 'Jizzax region Bahmal tuman Gulbulok MFY Hunarmand street 28', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-04-02', 39, 412000.00, 'full', 0, NULL, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (40, 'Ibrohimov Bekhzodjon Shuhrat ogli', 'Toshkent ', 'Tashkent', 12000.00, 'Blek Green', '19', 1, '2024-03-18', 8, 80000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (41, 'Qutlimurodov Sherzod Qosimovich', 'Bogot tumani', 'Tashkent', 12000.00, 'Black-Green ', '20', 1, '2024-03-18', 91, 940000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (42, 'Mirzayev Doston Ortiq ogli', 'Toshkent ', 'Tashkent', 12000.00, 'Blek Green', '21', 1, '2024-03-18', 8, 264000.00, 'full', 225, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (43, 'Norqizilov Abdurazzoq', 'Qashqadaryo region Kuk dala tuman An-Naruz MFY Yangi Yer street 39', 'Tashkent', 12000.00, 'Black-Red ', '22', 1, '2024-04-16', 47, 475000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (44, 'Khudoyshukurov Sardorbek Ali ogli', 'Oltinsoy tumani', 'Tashkent', 12000.00, 'Blek Green', '23', 1, '2024-03-18', 2, 312000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (45, 'Primov Zuhriddin', 'Jizzah region Jizzah tuman', 'Tashkent', 12000.00, 'Grey ', '24', 1, '2024-04-17', 50, 544000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (46, 'Bakhtiyorov Ilkhomjon Xudoyor ogli', 'Peshku tuman', 'Tashkent', 12000.00, 'Black-Red ', '25', 1, '2024-03-18', 2, 12000.00, 'debt', 231, 1, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (47, 'Astanov Dilshod', 'Jizzah region Bahmal tuman', 'Tashkent', 12000.00, 'Black-Red ', '26', 1, '2024-04-17', 60, 664000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (48, 'Murodbekov Asadbek', 'Tashkent region Yakkasaray tuman Lapatino street 60/31', 'Tashkent', 12000.00, 'Black-Red', '27', 1, '2024-04-16', 8, 280000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (49, 'Negmatov Nekruz Raxmatovich', 'Samarqand tumani', 'Tashkent', 12000.00, 'Blek Green ', '28', 1, '2024-03-18', 8, NULL, 'debt', 225, NULL, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (50, 'Mamayusupov Bobur Tolqinivich', 'Denov tumani', 'Tashkent', 12000.00, 'Blue ', '29', 1, '2024-03-18', 2, 12000.00, 'debt', 231, NULL, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (51, 'Ismailov Amirbek', 'Buxoro region Buxoro city Gafur Gulam MFY Vobkent street 43a', 'Tashkent', 12000.00, 'Black-Green ', '30', 1, '2024-04-15', 52, 584000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (52, 'Sheribayev Ramazan Jumabay Uli', 'Xojeli Rayoni', 'Tashkent', 12000.00, 'Black-Red ', '31', 1, '2024-03-18', 45, 502000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (53, 'Akbarov Abdurashidxon Raximjon ogli', 'Fargona tumani', 'Tashkent', 12000.00, 'Black-Red', '32', 1, '2024-03-18', 2, 344000.00, 'full', 231, NULL, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (54, 'Zulfiqorov Abdulaziz Rahmonqul ogli', 'Sardoba tumani', 'Tashkent', 12000.00, 'Black-Red ', '33', 1, '2024-03-18', 44, 624000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (55, 'Adahamjonov Murtozbek', 'Andijon region Xo`jaobod tuman Ipakchi MFY Pillakor street 40', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-04-18', 8, 1664000.00, 'debt', 161, 3, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (56, 'Shukurov Suxrobjon', 'Samarkand region Ok-daryo tuman Bozorjoy MFY Muqimiy 1', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-04-21', 102, 1112000.00, 'debt', 14, 2, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (57, 'Salimov Xurshidjon Shavkat ogli', 'Vobkent tumani', 'Tashkent', 12000.00, 'Black-Red ', '34', 1, '2024-03-18', 158, 1883569.00, 'full', 0, 4, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (58, 'Rustamov Azizbek Qobiljon ogli', 'Narpay tumani', 'Tashkent', 12000.00, 'Black-Red ', '35', 1, '2024-03-18', 120, 1298000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (59, 'Abdiolimov Ravshanbek Rustambek ogli', 'Oltinkol tumani', 'Tashkent', 12000.00, 'Black-Red ', '36', 1, '2024-03-18', 2, 12000.00, 'debt', 231, 1, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (60, 'Karimov Sunnatillo Karim ogli', 'Zomin tumani', 'Tashkent', 12000.00, 'Black-Red ', '37', 1, '2024-03-19', 43, 512000.00, 'debt', 0, 3, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (61, 'Baratov Alimuxammad Turabek ogli', 'Chinoz tumani', 'Tashkent', 12000.00, 'Black-Red ', '38', 1, '2024-03-19', 2, 12000.00, 'debt', 230, NULL, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (62, 'Tajiaxmedov Bobirjon Toxirjon ogli', 'Uchqorgon tumani', 'Tashkent', 12000.00, 'Black-Red', '39', 1, '2024-03-19', 32, 332000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (63, 'Majidov Xoliqnazar Muzaffar ogli', 'Zomin tumani', 'Tashkent', 12000.00, 'Black-Red ', '40', 1, '2024-03-19', 2, 12000.00, 'debt', 230, NULL, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (64, 'Kibirov Shaxzod Maxmud ogli', 'Toshkent ', 'Tashkent', 12000.00, 'Black-Green', '41', 1, '2024-03-19', 32, 356000.00, 'full', 0, 4, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (65, 'Abdullajonov Abrorbek', 'Toshkent ', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-04-29', 15, 130000.00, 'debt', 176, 2, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (66, 'Dadajon (name is like that)', 'Buxoro', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-04-25', 36, 472000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (67, 'Xolbozorov Quvonchbek', NULL, 'Tashkent', 12000.00, NULL, NULL, 1, '2024-04-23', 15, 160000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (68, 'Shomurodov Doniyor Bahtiyor o`g`li', 'Karakalpakstan Republic Amudaryo tuman Jumurto`v street 36', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-04-24', 90, 996000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (69, 'Ernazarov Iftihor Olimboy o`g`li', 'Tashkent region Bekobod tuman Chanoq KFY Kolgonsir MFY', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-04-25', 31, 320000.00, 'debt', 164, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (70, 'Xushvaqtov Oybek Otabek o`g`li', 'Surxndaryo tuman Termez city Temiryo`lchi MFY Sherabad street 96', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-01', 8, 400000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (71, 'Almasov Jaloliddin Yusup o`g`li', 'Surxandarya region Kumkurgan tuman Korsokli MFY Jilg`i street 53', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-04', 40, 420000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (72, 'Mamatmuminov Anvarxon Abdihamid o`g`li', 'Surxandarya region Kumkurgan tuman Korsokli MFY Jilg`i street 40', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-04', 40, 420000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (73, 'Sharafiddinov Asrorjon', 'Farg`ona  Beshariq tuman Shabada dahasi MFY Oydin street 8', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-04', 32, 330000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (74, 'Abduvaliyev Jamshidbek', 'Farg`ona  Beshariq tuman Kapayangi MFY Kapayangi street 71', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-04', 90, 1056000.00, 'debt', 0, 4, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (75, 'To`ychiyev Shaxriyor Bobomurod o`g`li', 'Jizzah region G`allarol district Jarbuloq 250', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-07', 32, 386000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (76, 'Qurbonmurodov Samandar', 'Kashkadarya region Dekhkanabad tuman Bo`ston street 66', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-14', 32, 332000.00, 'debt', 144, 1, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (77, 'Xaydarov Bahtiyor Abdumannapovich', 'Tashkent region Yunusabad tuman 1-otchopar MFY Chinobod street (Tupik) 13', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-15', 15, 164000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (78, 'Nurqobilov Javohir', 'Surkhandarya region Qiziriq tuman Do`stlik MFY 20', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-16', 31, 420000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (79, 'Erkaboyev Akbar Tulqi o`g`li', 'Qashkadarya region Nishon tuman Talmirjon shahar Mahtiquli street 10/3', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-16', 8, 80000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (80, 'Tashboltayev Tolmos Kobil o`g`li', 'Samarand region Jomboy tuman Nagahon MFY Dauchar district 177', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-16', 22, 288000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (81, 'Madijonov Shamshodbek ', 'Namangan region Pop tuman G`ursaroy district Hurramsaroy street  1', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-22', 10, 252000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (82, 'Usmanov Izzatillo Lutpillo o`g`li', 'Andijan region Shahrihon tuman Begbachcha MFY Sharxon 33', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-24', 5, 48000.00, 'debt', 161, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (83, 'Sherbutayev Botir Shuhrat o`g`li', 'Qashkadaryo region Koson tuman Mustaqillik street 15', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-25', 12, 285824.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (84, 'Hamidov Bobojon', 'Sirdaryo region Bayovud tuman Do`stlik MFY Tumaris 10', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-25', 5, 64000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (85, 'Shomurodov Shokhzod', 'Xorazm region Gurlan tuman Paxtakor street Jaloloddin Manguberdi 17', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-27', 30, 330000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (86, 'Xasanjonov Qobilbek Erkin o`g`li ', 'Tashkent region Bekobod tuman DVZ 4', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-28', 31, 340000.00, 'full', 0, 4, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (87, 'Karimov Durbek Latifjon o`g`li', 'Farg`ona region Qo`shtepa tuman', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-05-14', 29, 320000.00, 'full', 0, 4, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (88, 'Akbarov Shuhrat Jurayevich', 'Kashkadarya region Karshi city Saxtapiyoz 21', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-06-03', 31, 320000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (89, 'Rahmonov Madrahim', 'Kashkadarya region Yakkabog` tuman Ajrim village 374', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-06-04', 1, 12000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (90, 'Tursunon Yorqinbek Jasur o`g`li', 'Qashkadarya region Qarshi tuman Charimgar MFY Saroy 11', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-06-09', 8, 80000.00, 'debt', 142, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (91, 'Musayev Bekzod Samad o`g`li', 'Kashkadarya region Koson tuman Etak MFY Yangiobod 51', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-06-09', 31, 560000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (92, 'Ravshanov Ilhom Ravshanovich', 'Tashkent city Almazar region Namuna street 88', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-06-10', 3, 24000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (93, 'Abduvaliyev Abdullaziz Farhod o`g`li', 'Tashkent region Chinaz tuman Olmazor micro-district Nafis MFY Uzbekistan street 63', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-06-13', 31, 320000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (94, 'Djandullayev Baxt Xamidulla o`g`li', 'Tashkent region Quyichirchiq tuman', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-06-19', 34, 328628.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (95, 'Allaberganov Jasur Mansur o`g`li', 'Karakalpakstan Republic Beruniy tuman Abay MFY', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-06-20', 38, 440000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (96, 'Holboyev Elshod Shavkat o`g`li', 'Kashkadarya region Kamash tuman Kamay MFY Mirza dala district 29', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-06-22', 58, 612000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (97, 'Ashirov Asadbek Dilshod o`g`li', 'Jizzah region Sh. Rashidov tuman Kuyov boshi MFY Lolazor 60', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-06-22', 43, 480000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (98, 'Jurayev Abbos Hudoyberdi o`g`li', 'Samarkand region Katta kurgan ssaray Kurgan MFY Nurli yo`l 15', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-06-22', 15, 160000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (99, 'Rahmonqulov Azizbek Karomat o`g`li', 'Surxandarya region Jarkurgan tuman Jarkurgan minora Ibn Sino street 56', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-06-23', 134, 1520000.00, 'debt', 2, 17, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (100, 'Abdug`ofurov Abdurahmon Obidjon o`g`li', 'Tashkent region Yunusabad tuman Bodomzor Chingiz Aytmatov street 133', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-06-27', 33, 321765.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (101, 'Bosimov Elmurod Dilshod o`g`li', 'Jizzah region Zomin tuman Olma MFY 48', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-06-27', 15, 160000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (102, 'Yuldashev Fatxulla Hayrulla o`g`li', 'Farg`ona region Furqat tuman Polvontosh MFY Qo`rgóncha 40', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-07-11', 30, 320000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (103, 'Turdaliyev Sunnat', 'Tashkent region To`ytepa district', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-07-15', 15, 160000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (104, 'Murodbekov Asadbek Shaxzodbek o`g`li', 'Tashkent region Yakkasaray tuman Lapatino 60/31', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-07-18', 45, 540000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (105, 'Shaydullayev Ulug`bek', 'Surxandarya region Shurchi tuman Elbayon MFY Tadbirkorlar 28', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-07-18', 31, 320000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (106, 'Valijonov Jaloliddin', 'Namangan region Pop tuman Chodak district Dehqonobod street 102', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-07-31', 37, 400000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (107, 'Normurodov Diyorbek', NULL, 'Tashkent', 12000.00, NULL, NULL, 1, '2024-08-02', 22, 240392.00, 'debt', 74, 2, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (108, 'Istamburiyev Akhmad', 'Kashkadarya region Qarshi tuman', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-08-04', 31, 720000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (109, 'Abduraimov Farkhod', 'Surxandarya region Sherobod tuman Ho`ja qiya 2 157', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-09-12', 3, 40000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (110, 'Oltiboyev Kamol', 'Surxandarya region Sherobod tuman Sherobod MFY Usmon Yusuf street 3', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-09-12', 3, 40000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (111, 'Choriyev Dilshodbek', 'Suraxandarya Jarkurgan tuman Mopir MFY Navro`z street 61', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-08-07', 15, 180000.00, 'full', 0, NULL, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (112, 'Adamboyev Farrux', 'Tashkent region Orta Chirchik tuman Yuqori Ovul ', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-09-13', NULL, 95000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (113, 'Umrzokov Abdurahimjon', 'Fergana region Fergana city Yuqori kirguli 10', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-09-18', NULL, 253333.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (114, 'Usmonov Azizbek', 'Karakalpakstan Republic Amudarya tuman Tolkin MFY Marifatchilar street 29', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-09-19', NULL, 95000.00, 'debt', 40, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (115, 'Boltaboyev Usmonho`ja ', 'Andijan region Ho`jaobod tuman Matonat street 130', 'Tashkent', 12000.00, 'Green', '43', 1, '2024-09-20', NULL, 475000.00, 'debt', 0, 4, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (116, 'Toshtemirov Javlonbek', 'Samarqand region Qushrabod tuman Qovunchi MFY Shamolli street 8', 'Tashkent', 12000.00, 'Red', '44', 1, '2024-09-20', NULL, 190000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (117, 'Ismoilov Ashurbek', 'Shayhantahur Kichik xalqa yo`li street 37', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-09-20', NULL, 408000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (118, 'Hurramov O`gabek', 'Suraxndarya region Jarkurgan tumanm Obod MFY Obod street 10', 'Tashkent', 12000.00, 'Blue', '45', 1, '2024-09-21', NULL, 190000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (119, 'Tilovqobilov Holbo`ta', 'Surxandarya region Muzrabot tuman Buyuk Ipak yo`li MFY Amu sohil street 30', 'Tashkent', 12000.00, 'Green', '46', 1, '2024-09-22', NULL, 285000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (120, 'Yigitaliyev Abdubannob', 'Farg`ona region Quva tuman Fidokor street', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-09-22', NULL, 570000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (121, 'Qulmatov Tohirbek', 'Samarqand region Qo‘shrabot tuman Mayintepa MFY Toʻmanovul village 93', 'Tashkent', 12000.00, 'Grey', '47', 1, '2024-09-24', NULL, 378000.00, 'full', 0, 3, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (122, 'Ramazonov Ilkhom', 'Navoi region Karmana tuman Beshkent MFY 15', 'Tashkent', 12000.00, 'Grey', '48', 1, '2024-09-24', NULL, 190000.00, 'full', 35, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (123, 'Mustafoyev Nuriddin', 'Jizzah region Forish tuman Egiz Buloq MFY Gul buloq street 9', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-09-25', NULL, 503000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (124, 'Hasanov Zikrullox', 'Farg`ona region Buvayda Yangi qo`rg`on 16', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-09-26', NULL, 475000.00, 'debt', 3, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (125, 'Matkarimov Islomjon', 'Farg`ona viloyat O`zbekiston tuman Mevazor MFY 8 uy', 'Tashkent', 12000.00, 'Red', '49', 1, '2024-09-26', NULL, 285000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (126, 'Raximov Navroʻzbek', 'Fergana region Furqat tuman Ardahshon MFY Ardahshon village 517', 'Tashkent', 12000.00, 'Green', '50', 1, '2024-09-28', NULL, 380000.00, 'debt', 1, 3, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (127, 'Aytenov Jahongir', 'Karakalpakstan Republic Qo`ng`irot region Kiyot OFY Saqlab 23', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-09-29', NULL, 285000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (128, 'Sodiqov Muxsinjon', 'Farg`ona viloyati O`zbekiston tuman Dahana qaqir MFY 34', 'Tashkent', 12000.00, 'Red', '51', 1, '2024-09-29', NULL, 232000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (129, 'Abdusamadov Azizbek ', 'Farg`ona viloyati O`zbekiston tuman Karimdona village Ziyokor street 68', 'Tashkent', 12000.00, 'Green', '52', 1, '2024-10-01', NULL, 204000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (130, 'Eshonkhonov Muhammadayubkhon', 'Namangan region Kosonsoy tuman Chorboq MFY 37', 'Tashkent', 12000.00, 'Red', '53', 1, '2024-10-01', NULL, 190000.00, 'debt', 21, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (131, 'Aliyev Azizbek Baxtiyor o`g`li ', 'Namangan region Chust tuman Boborahim Mashrab street 135', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-10-04', NULL, 380000.00, 'debt', 3, 3, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (132, 'Latipov Sarvarbek Yodgorbek o`g`li', 'Andijan region Xo`jaobod tuman Manak MFY Diliobod street 103', 'Tashkent', 12000.00, 'Green', '54', 1, '2024-10-07', NULL, 290000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (133, 'O`lmasov Diyorbek Ihtiyorjon o`g`li', 'Fergana region Rishtan tuman Yoyilma village To`lqin street 56', 'Tashkent', 12000.00, 'Red', '55', 1, '2024-10-11', NULL, 95000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (134, 'Toshtemirov O`lmasjon Shodi o`g`li', 'Smaarqand region Qo`shrabod tuman Biksariq village 7', 'Tashkent', 12000.00, 'Grey', '56', 1, '2024-10-10', NULL, 288039.00, 'debt', 5, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (135, 'Bekpulatov Nuriddin G`ayratjon o`g`li', 'Navoiy region Zarafshan city 11 kichik tuman 1/4', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-10-16', NULL, 95000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (136, 'Shoydullayev Fazliddin Bahtiyor o`g`li', 'Sirdarya region Bandikhon tuman Fidokor street 9', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-10-18', NULL, 190000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (137, 'Jalgasbayev Doniyor Dauranbekovich', 'Karakalpakstan Republic Nukus city Qizil tut street 25', 'Tashkent', 12000.00, NULL, NULL, 1, '2024-10-20', NULL, 190000.00, 'debt', 2, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (138, 'Muhammadaliyev Qobiljon Sadridin o`g`li', 'Farg`ona region Bagdad tuman Mirshikor MFY 48', 'Tashkent', 12000.00, 'Grey', '57', 1, '2024-10-21', NULL, 285000.00, 'debt', -6, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (139, 'Nematov Ozodbek Keldiyor o`g`li', 'Samarqand region Ishtikhon tuman Beshariq district 82', 'Tashkent', 12000.00, 'Green', '58', 1, '2024-10-21', NULL, 190000.00, 'debt', 1, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (140, 'Ergashev Sardor Sirojiddin o`g`li', 'Qashqadaryo region Kasbi tuman Qora tepa MFY Mustaqillik 9', 'Tashkent', 12000.00, 'Green', '59', 1, '2024-10-25', NULL, 100000.00, 'debt', 4, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (141, 'Shomurodov Doniyor', 'Karakalpakstan Republic Amudarya tuman Jumorto` street 10', 'Tashkent', 12000.00, 'Red', '60', 1, '2024-10-25', NULL, 95000.00, 'debt', 4, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (142, 'Raupov Muhammadamin Akmal o`g`li', 'Samarkand region Samarkand city Katta qishloq 70 A', 'Tashkent', 12000.00, 'Red', '61', 1, '2024-10-27', NULL, 95000.00, 'debt', 1, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (143, 'Tillaboyev Azizbek Anvarovich', 'Fergana region Fergana city Mustaqillik shukronasi 4 street 214', 'Tashkent', 12000.00, 'Blue', '62', 1, '2024-11-02', NULL, 95000.00, 'debt', -4, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (144, 'Ahmadaliyev Asliddin Adhamjon o`g`li', 'Fergana region Uzbekiston tuman Yuqori Kukoncha MFY', 'Fergana', 10000.00, NULL, NULL, 1, '2024-09-19', NULL, NULL, 'full', 0, NULL, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (145, 'Abduraufov Muhammadyusuf Muhammadjon o`g`li', 'Fergana region O`zbekiston tuman Bo`ston MFY', 'Fergana', 10000.00, NULL, NULL, 1, '2024-09-18', NULL, NULL, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (146, 'Abdumadjidov Abdurahmon', 'Fergana region O`zbekiston tuman Yaypan', 'Fergana', 10000.00, NULL, NULL, 1, '2024-09-18', NULL, NULL, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (147, 'Yo`ldashev Hojiakbar Azizbek o`g`li', 'Andijan region Balikchi tuman Nasriddin obod street 8', 'Fergana', 10000.00, NULL, NULL, 1, '2024-09-24', NULL, NULL, 'full', 0, NULL, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (148, 'Ibrohimov Ahmadullo To`tasin o`g`li', 'Fergana region Quva tuman', 'Fergana', 10000.00, NULL, NULL, 1, '2024-09-30', NULL, 520000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (149, 'Obidov Umidjon', NULL, 'Fergana', 10000.00, NULL, NULL, 1, '2024-10-28', NULL, 320000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (150, 'Olimov Bahtiyorjon Abdumumin o`g`li', 'Andijan Eskikurgan MFY Milliy tiklanish street 218', 'Fergana', 10000.00, 'Black - Green', '63', 1, '2024-01-27', 8, 60000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (151, 'Abdurahimov Hurshid', 'Fergana Toshloq district Xorazm street 170', 'Fergana', 10000.00, 'Black - Green', '64', 1, '2024-01-28', 11, 150000.00, 'full', 0, NULL, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (152, 'Adhamov Izzatilla', 'Fergana Dang`ara district Katta boybo`cha streeet 112', 'Fergana', 10000.00, NULL, NULL, 1, '2024-01-28', 127, 1260000.00, 'full', 0, 11, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (153, 'Shavkatjonov Shoxruxjon Shavkatjon o`g`li', NULL, 'Fergana', 10000.00, NULL, NULL, 1, '2024-01-28', 114, 1170000.00, 'full', 0, 12, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (154, 'Ergashev Yahyobek Tohirjon o`g`li', 'Namangan Pop district Aslzoda street 10', 'Fergana', 10000.00, NULL, NULL, 1, '2024-01-28', 9, 80000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (155, 'Turgunov Kamronbek Mirzayo`ldosh o`g`li', 'Fergana Saylgoh street 40-a 34', 'Fergana', 10000.00, NULL, NULL, 1, '2024-01-29', 42, 410000.00, 'full', 0, 5, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (156, 'Sodikov Muhammadaziz Tohirjon o`g`li', 'Fergana region Honqiz Mevazor 54', 'Fergana', 10000.00, NULL, NULL, 1, '2024-01-29', 5, 50000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (157, 'Abduqodirov Mardonbek Marufjon o`g`li', 'Fergana Buvayda Toyqishloq Soyguzar 31', 'Fergana', 10000.00, NULL, NULL, 1, '2024-01-29', 17, 170000.00, 'full', 0, 8, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (158, 'Karimov Zoirjon Erkinjon o`g`li', 'Fergana Beshariq district Uzun valley', 'Fergana', 10000.00, NULL, NULL, 1, '2024-01-30', 4, 30000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (159, 'Shukuriddinov Qudratillo Qurbonali o`g`li', 'Fergana Toshloq Xorazm 148', 'Fergana', 10000.00, NULL, NULL, 1, '2024-01-30', 8, 70000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (160, 'Abdurahmonov Samandar Abduvahob o`g`li', 'Andijan region Marhamat district A.Temur street', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-01', 8, 70000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (161, 'Yo`lchiboyev Sherzodbek Sherali o`g`li ', 'Fergana Bagdad Zafarabad', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-02', 74, 730000.00, 'full', 0, 3, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (162, 'Zoxidov Diyorbek Zohid o`g`li', 'Sirdarya region Soyhunobod rayon', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-02', 15, 70000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (163, 'Odilov Abdullaziz To`htasin o`g`li', 'Fergana region Bog`dod rayon Marifat street 13', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-04', 17, 10000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (164, 'Burhonov Shaxzod Barot o`g`li', NULL, 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-04', 33, 260000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (165, 'Saminov Nurmuhammad Lazizjon o`g`li', 'Fergana city Chexova street 12/22', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-04', 33, 260000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (166, 'Pardayev Abbos Kamoliddinovich', 'Samarkand region Paxtachinskiy rayon Oqtepa street', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-06', 15, 140000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (167, 'Tursunaliyev Farhodjon Tulkinali o`g`li', 'Namangan region Namangan rayon Kurama street', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-06', 78, 1140000.00, 'full', 0, 7, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (168, 'Hasanov Bekmuhammad Umidjon o`g`li', 'Fergana region Bagdad Bekabad street', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-09', 30, 290000.00, 'full', 0, 4, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (169, 'Ismoilov Islombek Alisher o`g`li', 'Fergana street Jami 7/25', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-10', 46, 460000.00, 'debt', 230, 9, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (170, 'Tursunboyev Sulaymonjon Toxirjon o`g`li', '9.99E+11', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-18', 78, 770000.00, 'full', 0, 10, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (171, 'Gaybullayev Zufarbek Saydullo o`g`li', 'Fergana region Novkent district Yog`du street', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-17', 121, 1370000.00, 'full', 0, 4, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (172, 'Mamurjonov Islombek', NULL, 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-18', 119, 1190000.00, 'full', 0, 12, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (173, 'Abdullayev Abdulhafiz Muhammadjon o`g`li', 'Fergana region Quvasoy district Bog`cha Oq Tosh street 69', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-18', 29, 280000.00, 'full', 0, 4, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (174, 'Soliyev Abdurauf Nuriddin o`g`li', 'Namanga region Toraqorg`on district', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-21', 97, 961000.00, 'full', 0, 3, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (175, 'Usmonaliyev Alimardon Numonjon o`g`li', 'Fergana region Avval district O`zbekiston 6 yilligi street 30', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-22', 8, 50000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (176, 'Avazov Fazliddin Rashid o`g`li', 'Surkhandarya region Kushjurgan district Yangiobod street', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-22', 22, 210000.00, 'full', 0, 3, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (177, 'Omonboyev Hushnutbek Tolibjon o`g`li', 'Fergana region Quva district Chirmoch MFY', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-26', 8, 50000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (178, 'Begjonov Javlonbek Qodirjon o`g`li', 'Fergana Hidoyat street 50', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-26', 6, 10000.00, 'full', 0, NULL, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (179, 'Otajonov Otabek Azizovich', 'Fergana Sanoat street 41', 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-26', 8, 60000.00, 'full', 0, NULL, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (180, 'Asilbek Ibrohimov', NULL, 'Fergana', 10000.00, NULL, NULL, 1, '2024-02-27', 171, 1700000.00, 'debt', 43, 5, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (181, 'G`ofurjonov Sarvarbek G`olibjon o`g`li', 'Namangan region Norin rayon Naymanobod MFY', 'Fergana', 10000.00, NULL, NULL, 1, '2024-03-01', 18, 180000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (182, 'Allaberdiyev Shohruh Abdurashid o`g`li', 'Surxandaryo region Sherobod rayon. Oltin voha street 15', 'Fergana', 10000.00, NULL, NULL, 1, '2024-03-03', 5, 35000.00, 'full', 0, NULL, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (183, 'Qobuljonov Eldorbek', NULL, 'Fergana', 10000.00, NULL, NULL, 1, '2024-03-04', 85, 840980.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (184, 'Ashurov Bobur Ravshan o`g`li', 'Fergana region Fergana city', 'Fergana', 10000.00, NULL, NULL, 1, '2024-03-06', 78, 780000.00, 'full', 0, 16, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (185, 'Qodriov Abdumalik Abdusobir o`g`li', 'Farg`ona region Uzbekistan district', 'Fergana', 10000.00, NULL, NULL, 1, '2024-03-07', 104, 1030000.00, 'full', 0, 12, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (186, 'Odilov Abduvosit Sharafjon o`g`li', 'Fergana region Besharik district Beshovul qishlog`i', 'Fergana', 10000.00, NULL, NULL, 1, '2024-03-12', 2, 10000.00, 'debt', 243, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (187, 'Abdurahimov Abduqahhor Abduhalim o`g`li', 'Farg`ona region Rishtan district', 'Fergana', 10000.00, NULL, NULL, 1, '2024-03-14', 31, 310000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (188, 'Abdug`afforov Samandar Bahrom o`g`li', 'Farg`ona region Rishtan district', 'Fergana', 10000.00, NULL, NULL, 1, '2024-03-14', 2, 10000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (189, 'Saidov Salohiddin Nazirjon o`g`li', 'Kashkadarya region Kitab district', 'Fergana', 10000.00, NULL, NULL, 1, '2024-03-15', 38, 370000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (190, 'Exsonov Olimjon', 'Fergana region Buvayda district', 'Fergana', 10000.00, NULL, NULL, 1, '2024-03-18', 32, 570000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (191, 'Odilbekov Muhammadbek Oybek o`g`li', 'Fergana region Tashlak district Varzak Bektupi', 'Fergana', 10000.00, NULL, NULL, 1, '2024-03-24', 1, 270000.00, 'full', 0, NULL, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (192, 'Shamsiddinov Muhammadazim Bahriddin o`g`li', 'Fergana region Vodil tuman', 'Fergana', 10000.00, NULL, NULL, 1, '2024-03-24', 31, 300000.00, 'full', 0, 3, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (193, 'Sodiqov Hojiakbar Ilhomjon o`g`li', 'Fergana region Fergan city Al-Farg`oniy street 83/10', 'Fergana', 10000.00, NULL, NULL, 1, '2024-03-25', 8, 60000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (194, 'Muhtarov Akmaljon Azizjon o`g`li', 'Fergana region Rishtan district', 'Fergana', 10000.00, NULL, NULL, 1, '2024-03-28', 8, 70000.00, 'debt', 221, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (195, 'Turdaliyev Sunnat Risboy o`g`li', 'Tashkent region To`ytepa district', 'Fergana', 10000.00, NULL, NULL, 1, '2024-03-28', 42, 410000.00, 'full', 0, 5, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (196, 'Ibrohimov Shakhboz Hasanboy o`g`li', 'Fergana region Fergana district', 'Fergana', 10000.00, NULL, NULL, 1, '2024-04-06', 84, 853000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (197, 'Ibrohimov Islombek Husanboy o`g`li', 'Fergana region Quva tuman', 'Fergana', 10000.00, NULL, NULL, 1, '2024-04-06', 83, 980000.00, 'debt', 22, 1, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (198, 'Kazakbayev Tohir Nosir o`g`li', 'Jizzakh region G`alla orol tuman Kuytosh MFY Karimsoy district', 'Fergana', 10000.00, NULL, NULL, 1, '2024-04-23', 31, 300000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (199, 'Qosimjonov Abrorbek Hursanali o`g`li', 'Fergana region Yazyavan district Qorasoy MFY', 'Fergana', 10000.00, NULL, NULL, 1, '2024-04-23', 17, 160000.00, 'debt', 186, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (200, 'Kurbonov Amriddin Husniddin o`g`li', 'Navoi region Karmana district', 'Fergana', 10000.00, NULL, NULL, 1, '2024-04-24', 23, 220000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (201, 'Muqimov Muhriddin Fazliddin o`g`li', 'Fergana region Vodil tuman Chimyon street', 'Fergana', 10000.00, NULL, NULL, 1, '2024-05-09', 73, 720000.00, 'debt', 114, 6, false, 'lost', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (202, 'Bekchanov Ahmadjon Mahmudjon o`g`li', 'Karakalpakstan Republic Beruniy tuman Qiyot MFY Farkhod street 28', 'Fergana', 10000.00, NULL, NULL, 1, '2024-05-11', 31, 300000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (203, 'Nematjonov Jamshidbek Soibjon o`g`li', 'Fergana region Fergana city Jambul street 62', 'Fergana', 10000.00, NULL, NULL, 1, '2024-05-19', 44, 430000.00, 'full', 0, 2, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (204, 'Sobirjonov Nuriddin Otabek o`g`li', 'Fergana region Quva tuman Yangi QIshloq 33', 'Fergana', 10000.00, NULL, NULL, 1, '2024-06-21', 64, 630000.00, 'debt', 80, 3, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (205, 'Inomjonov Temurbek Tulanboy o`g`li', 'Andijan region Boz tuman Kohinur MFY Fidoiy 87', 'Fergana', 10000.00, NULL, NULL, 1, '2024-06-21', 33, 323333.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (206, 'Aslidin Ahmadaliyev ', NULL, 'Fergana', 10000.00, NULL, NULL, 1, '2024-08-20', 31, 320000.00, 'full', 0, 1, true, 'good', false, NULL, 0.00, false, false);
INSERT INTO public.solo_general VALUES (207, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 1, 29820.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (208, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 1, 29820.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (209, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (210, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (211, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (212, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (213, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (214, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (215, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (216, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (217, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (218, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (219, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (220, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (221, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (222, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (223, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (224, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (225, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (226, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (227, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 2, 40420.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (228, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 3, 51020.05, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (229, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 3, 51020.05, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (230, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 3, 51020.05, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (231, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 4, 61619.81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (232, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 5, 72219.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (233, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 5, 72219.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (234, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 5, 72219.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (235, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 5, 72219.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (236, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 6, 82819.34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (237, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (238, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (239, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (240, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (241, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (242, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (243, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (244, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (245, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (246, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (247, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (248, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (249, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (250, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (251, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (252, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (253, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (254, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (255, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (256, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (257, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 8, 104018.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (258, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 9, 114618.63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (259, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 10, 125218.40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (260, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 11, 135818.16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (261, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 12, 146417.93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (262, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 13, 157017.69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (263, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 15, 178217.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (264, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 15, 178217.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (265, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 15, 178217.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (266, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 15, 178217.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (267, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 15, 178217.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (268, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 15, 178217.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (269, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 15, 178217.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (270, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 15, 178217.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (271, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 15, 178217.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (272, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 17, 199416.75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (273, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 17, 199416.75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (274, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 17, 199416.75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (275, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 18, 210016.51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (276, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 22, 252415.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (277, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 22, 252415.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (278, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 22, 252415.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (279, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 23, 263015.34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (280, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 29, 326613.93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (281, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 29, 326613.93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (282, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 29, 326613.93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (283, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 30, 337213.69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (284, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 30, 337213.69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (285, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 30, 337213.69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (286, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 30, 337213.69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (287, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 30, 337213.69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (288, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 31, 347813.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (289, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 31, 347813.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (290, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 31, 347813.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (291, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 31, 347813.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (292, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 31, 347813.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (293, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 31, 347813.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (294, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 31, 347813.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (295, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 31, 347813.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (296, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 31, 347813.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (297, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 31, 347813.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (298, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 31, 347813.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (299, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 31, 347813.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (300, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 31, 347813.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (301, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 31, 347813.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (302, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 32, 358413.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (303, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 32, 358413.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (304, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 32, 358413.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (305, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 32, 358413.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (306, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 32, 358413.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (307, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 32, 358413.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (308, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 33, 369012.98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (309, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 33, 369012.98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (310, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 33, 369012.98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (311, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 33, 369012.98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (312, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 33, 369012.98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (313, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 34, 379612.75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (314, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (315, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (316, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (317, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (318, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (319, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (320, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (321, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (322, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (323, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (324, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (325, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (326, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (327, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (328, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (329, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (330, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (331, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (332, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (333, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (334, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (335, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (336, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (337, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (338, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (339, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (340, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (341, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (342, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (343, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (344, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (345, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (346, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (347, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (348, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (349, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (350, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (351, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (352, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 35, 387546.70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (353, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 36, 400812.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (354, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 37, 411412.04, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (355, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 38, 422011.81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (356, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 38, 422011.81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (357, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 38, 422011.81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (358, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 39, 432611.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (359, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 39, 432611.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (360, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 39, 432611.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (361, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 40, 443211.34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (362, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 40, 443211.34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (363, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 40, 443211.34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (364, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 40, 443211.34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (365, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 42, 464410.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (366, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 42, 464410.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (367, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 43, 475010.63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (368, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 43, 475010.63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (369, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 44, 485610.39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (370, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 44, 485610.39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (371, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 44, 485610.39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (372, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 45, 496210.16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (373, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 45, 496210.16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (374, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 46, 506809.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (375, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 47, 517409.69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (376, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 50, 549208.98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (377, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 51, 559808.75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (378, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 52, 570408.51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (379, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 54, 591608.04, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (380, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 58, 634007.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (381, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 60, 655206.63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (382, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 60, 655206.63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (383, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 60, 655206.63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (384, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 61, 665806.39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (385, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 62, 676406.16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (386, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 64, 697605.69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (387, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 64, 697605.69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (388, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 66, 718805.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (389, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 73, 793003.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (390, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 74, 803603.33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (391, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 78, 846002.39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (392, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 78, 846002.39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (393, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 78, 846002.39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (394, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 81, 877801.69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (395, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 83, 899001.21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (396, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 83, 899001.21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (397, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 84, 909600.98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (398, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 85, 920200.74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (399, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 90, 973199.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (400, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 90, 973199.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (401, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 91, 983799.33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (402, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 97, 1047397.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (403, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 102, 1100396.74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (404, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 104, 1121596.27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (405, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 114, 1227593.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (406, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 119, 1280592.74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (407, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 120, 1291192.51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (408, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 121, 1301792.27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (409, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 127, 1365390.86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (410, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 134, 1439589.21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (411, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 158, 1693983.56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.solo_general VALUES (412, 'Predicted User', NULL, 'Predicted', NULL, NULL, NULL, NULL, NULL, 171, 1831780.50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 223
-- Name: bikes_bike_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bikes_bike_id_seq', 1, false);


--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 219
-- Name: clients_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_client_id_seq', 1, false);


--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 221
-- Name: expences_expence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.expences_expence_id_seq', 1, false);


--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 225
-- Name: rents_rent_number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rents_rent_number_seq', 1, false);


--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 217
-- Name: solo_general_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solo_general_id_seq', 1, false);


--
-- TOC entry 4675 (class 2606 OID 24622)
-- Name: bikes bikes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bikes
    ADD CONSTRAINT bikes_pkey PRIMARY KEY (bike_id);


--
-- TOC entry 4671 (class 2606 OID 24605)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (client_id);


--
-- TOC entry 4673 (class 2606 OID 24614)
-- Name: expences expences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expences
    ADD CONSTRAINT expences_pkey PRIMARY KEY (expence_id);


--
-- TOC entry 4677 (class 2606 OID 24634)
-- Name: rents rents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rents
    ADD CONSTRAINT rents_pkey PRIMARY KEY (rent_id);


--
-- TOC entry 4669 (class 2606 OID 24593)
-- Name: solo_general solo_general_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solo_general
    ADD CONSTRAINT solo_general_pkey PRIMARY KEY (id);


--
-- TOC entry 4678 (class 2606 OID 24623)
-- Name: bikes bikes_expence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bikes
    ADD CONSTRAINT bikes_expence_id_fkey FOREIGN KEY (expence_id) REFERENCES public.expences(expence_id);


--
-- TOC entry 4679 (class 2606 OID 24640)
-- Name: rents rents_bike_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rents
    ADD CONSTRAINT rents_bike_id_fkey FOREIGN KEY (bike_id) REFERENCES public.bikes(bike_id) ON DELETE SET NULL;


--
-- TOC entry 4680 (class 2606 OID 24635)
-- Name: rents rents_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rents
    ADD CONSTRAINT rents_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(client_id) ON DELETE CASCADE;


-- Completed on 2025-10-11 09:54:19

--
-- PostgreSQL database dump complete
--

