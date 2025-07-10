--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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

CREATE USER rent_service WITH PASSWORD 'postgres';

--
-- Name: brand; Type: TABLE; Schema: public; Owner: rent_service
--

CREATE TABLE public.brand (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    status boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone,
    created_by character varying(100),
    updated_by character varying(100)
);


ALTER TABLE public.brand OWNER TO rent_service;

--
-- Name: category; Type: TABLE; Schema: public; Owner: rent_service
--

CREATE TABLE public.category (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    level character varying(50),
    parent_id uuid,
    status boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone,
    created_by character varying(100),
    updated_by character varying(100)
);


ALTER TABLE public.category OWNER TO rent_service;

--
-- Name: country; Type: TABLE; Schema: public; Owner: rent_service
--

CREATE TABLE public.country (
    id uuid NOT NULL,
    name character varying(100),
    code character varying(20),
    status boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone,
    created_by character varying(100),
    updated_by character varying(100),
    currency_code character varying(20)
);


ALTER TABLE public.country OWNER TO rent_service;

--
-- Name: offer; Type: TABLE; Schema: public; Owner: rent_service
--

CREATE TABLE public.offer (
    id uuid NOT NULL,
    normal_price numeric(12,2),
    discount_price numeric(12,2),
    quantity integer,
    warranty_period integer,
    country_id uuid,
    variant_id uuid,
    additional_information jsonb,
    status boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone,
    created_by character varying(100),
    updated_by character varying(100),
    sku_no character varying(50)
);


ALTER TABLE public.offer OWNER TO rent_service;

--
-- Name: offer_period_mapping; Type: TABLE; Schema: public; Owner: rent_service
--

CREATE TABLE public.offer_period_mapping (
    period_id uuid NOT NULL,
    offer_id uuid NOT NULL
);


ALTER TABLE public.offer_period_mapping OWNER TO rent_service;

--
-- Name: period; Type: TABLE; Schema: public; Owner: rent_service
--

CREATE TABLE public.period (
    id uuid NOT NULL,
    duration integer,
    status boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone,
    created_by character varying(100),
    updated_by character varying(100)
);


ALTER TABLE public.period OWNER TO rent_service;

--
-- Name: product; Type: TABLE; Schema: public; Owner: rent_service
--

CREATE TABLE public.product (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    specs jsonb,
    brand_id uuid,
    category_id uuid,
    status boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone,
    created_by character varying(100),
    updated_by character varying(100)
);


ALTER TABLE public.product OWNER TO rent_service;

--
-- Name: variant; Type: TABLE; Schema: public; Owner: rent_service
--

CREATE TABLE public.variant (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    attributes jsonb,
    product_id uuid,
    status boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone,
    created_by character varying(100),
    updated_by character varying(100)
);


ALTER TABLE public.variant OWNER TO rent_service;

--
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: rent_service
--

COPY public.brand (id, name, description, status, created_at, updated_at, created_by, updated_by) FROM stdin;
0197edc0-f677-76c7-b4d8-095b75e425dd	Apple	Apple	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc1-2036-77f7-b816-3e1b6c74322a	Samsung	Samsung	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc1-5568-71f1-81ef-c7aa5591e89d	Google	Google	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc1-7c6b-7874-8ed8-eee4947d77af	Xiaomi	Xiaomi	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc1-a0ff-76e2-b910-108d504afd6a	Nintendo	Nintendo	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc1-c1d7-72e0-8aad-5167064a7478	Sony	Sony	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc1-e16e-7022-aa9b-ae725a8bd90e	Microsoft	Microsoft	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc2-053a-796e-a18a-8fe40adad31b	Oculus	Oculus	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc2-7676-7752-954e-02582c7b1a6d	Sonos	Sonos	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc2-ac0d-795c-bf2f-5673a7d7a62b	Bose	Bose	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc2-cfca-7c0c-bcec-fdd8b7d0fa62	JBL	JBL	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc2-ef15-7fed-bd35-59d9410b2325	Dyson	Dyson	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc3-1367-713c-ba06-31775c6537bc	Bang & Olufsen	Bang & Olufsen	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc3-361e-70f8-944d-d8125da5471b	Marshall	Marshall	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc3-5438-7f95-bded-94c470819a75	MSI	MSI	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc3-762f-7776-a63b-6940bfba84c3	Lenovo	Lenovo	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc3-b383-7cba-93be-1395cb4b20d2	Canon	Canon	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc3-d6cb-7f12-a9de-bda10c789225	GoPro	GoPro	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc3-f57e-7b70-9b2e-3154ddf0a476	Beats	Beats	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc4-1573-7dcd-adaf-477d06f34e7c	Garmin	Garmin	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc4-5479-7de3-86a3-4d8ad817c801	Razer	Razer	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc4-74f9-75c2-9733-e5c377de6a6d	HTC	HTC	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc4-9719-7a98-a66e-dc2e7a4ffc08	Epson	Epson	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc4-b9db-7735-903f-3b4bcc3de862	BenQ	BenQ	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc4-d90a-7d4e-a377-5b20f2d8712e	Dell	Dell	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc4-fddb-7533-b8e0-db87f7c343e0	Thermomix	Thermomix	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc5-26a4-73f2-b675-9631bdd6f562	Panasonic	Panasonic	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc5-442d-7435-bc8f-6a8ec831ed10	LG	LG	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc5-5fd8-72c6-b446-d0b6b6305720	Motorola	Motorola	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc5-816f-7488-ac90-100db2c5fb98	Wacom	Wacom	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc5-a0b5-7546-b8cb-36699614224f	Devialet	Devialet	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc5-bf90-7aed-9c8e-8966332a49b9	Nothing	Nothing	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc5-df19-778e-a2cf-438ff4637a98	OnePlus	OnePlus	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc5-fd6f-77b0-be3d-9027f5ee89d1	Asus	Asus	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc6-19a7-7b38-b621-f44122dc0791	Aftershock	Aftershock	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc6-3745-70e2-bb24-66ef559411fe	DJI	DJI	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc6-53e1-7513-8fca-d53dc0afc2ec	Huawei	Huawei	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
0197edc6-6f1d-7b7a-8cc5-f406fec342d8	Oppo	Oppo	t	2025-07-09 13:02:10.919618+07	2025-07-09 13:02:10.919618+07	aditya_lukman	aditya_lukman
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: rent_service
--

COPY public.category (id, name, level, parent_id, status, created_at, updated_at, created_by, updated_by) FROM stdin;
0197ede4-809c-7ad6-b9a9-4c5225390909	Computers	level_1	\N	t	2025-07-09 13:38:05.716824+07	2025-07-09 13:38:05.716824+07	aditya_lukman	aditya_lukman
0197ede4-9f11-7e23-9447-522f810eee79	Phones & Tablets	level_1	\N	t	2025-07-09 13:38:05.716824+07	2025-07-09 13:38:05.716824+07	aditya_lukman	aditya_lukman
0197ede4-ba32-73f3-970f-f560e1e72fe8	Gaming & VR	level_1	\N	t	2025-07-09 13:38:05.716824+07	2025-07-09 13:38:05.716824+07	aditya_lukman	aditya_lukman
0197ede4-d6ae-7ed8-a280-8521f097c7c7	Wearables	level_1	\N	t	2025-07-09 13:38:05.716824+07	2025-07-09 13:38:05.716824+07	aditya_lukman	aditya_lukman
0197ede4-f3aa-71f1-9d5c-7f25af98e74a	Audio & Music	level_1	\N	t	2025-07-09 13:38:05.716824+07	2025-07-09 13:38:05.716824+07	aditya_lukman	aditya_lukman
0197ede5-1054-7299-afc4-d3fb0aaf15e0	Home Entertainment	level_1	\N	t	2025-07-09 13:38:05.716824+07	2025-07-09 13:38:05.716824+07	aditya_lukman	aditya_lukman
0197ede5-2754-7202-b010-7086abb17943	Cameras & Drones	level_1	\N	t	2025-07-09 13:38:05.716824+07	2025-07-09 13:38:05.716824+07	aditya_lukman	aditya_lukman
0197ede5-3b87-79f4-8c10-479ad5697a7d	Smart Home	level_1	\N	t	2025-07-09 13:38:05.716824+07	2025-07-09 13:38:05.716824+07	aditya_lukman	aditya_lukman
0197ede8-262f-7105-aa3d-34ac9f62186d	Desktops	level_2	0197ede4-809c-7ad6-b9a9-4c5225390909	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197ede8-b74c-722e-91de-ba2851f0924b	Laptops	level_2	0197ede4-809c-7ad6-b9a9-4c5225390909	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197ede8-d254-79d9-9ff0-5d528cdd8276	Monitors	level_2	0197ede4-809c-7ad6-b9a9-4c5225390909	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197ede8-e890-70e5-93fa-5e620e67a1af	Smartphones	level_2	0197ede4-9f11-7e23-9447-522f810eee79	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197ede8-ff94-7027-9b0e-b721882b28d4	Tablets	level_2	0197ede4-9f11-7e23-9447-522f810eee79	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197ede9-154e-7f37-9bdd-69714de7353c	Gaming Console	level_2	0197ede4-ba32-73f3-970f-f560e1e72fe8	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197ede9-2c64-7dbe-9878-ff06fc8cfd21	Virtual Reality	level_2	0197ede4-ba32-73f3-970f-f560e1e72fe8	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197ede9-4271-7ee0-94a3-7672fb888d79	Smart Watches	level_2	0197ede4-d6ae-7ed8-a280-8521f097c7c7	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197ede9-5763-7dd7-89dd-65446ac30780	Headphones	level_2	0197ede4-f3aa-71f1-9d5c-7f25af98e74a	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197ede9-6c46-7a5f-ac86-4dfe4cb92c87	Speakers & Home Audio	level_2	0197ede4-f3aa-71f1-9d5c-7f25af98e74a	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197ede9-84d4-74a4-a5eb-809af3ef1588	Home Theater	level_2	0197ede5-1054-7299-afc4-d3fb0aaf15e0	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197ede9-979c-75d4-86c4-4f8cef840866	Television	level_2	0197ede5-1054-7299-afc4-d3fb0aaf15e0	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197ede9-ae3c-7c7b-a9c1-fd700b7be8f4	Digital Cameras	level_2	0197ede5-2754-7202-b010-7086abb17943	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197ede9-c12c-7e58-a55d-54f538a763e5	Camcorders	level_2	0197ede5-2754-7202-b010-7086abb17943	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197ede9-d5ba-73e7-a984-90d4a58d6566	Air Quality	level_2	0197ede5-3b87-79f4-8c10-479ad5697a7d	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197ede9-ea36-72cc-9978-91333539c62f	Smart Appliances	level_2	0197ede5-3b87-79f4-8c10-479ad5697a7d	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197edea-0005-7ec3-86a8-c736634c8cfb	Air Conditioners	level_2	0197ede5-3b87-79f4-8c10-479ad5697a7d	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197edea-1656-7177-8627-57e93a65ea39	Fridges	level_2	0197ede5-3b87-79f4-8c10-479ad5697a7d	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197edea-2ae3-761d-8df2-89da025af23c	Washer/Dryers	level_2	0197ede5-3b87-79f4-8c10-479ad5697a7d	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197edea-3e5a-78c0-8173-f77c1ce2a152	Dishwashers	level_2	0197ede5-3b87-79f4-8c10-479ad5697a7d	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
0197edea-5241-71ec-b24a-ccd79cd8a175	Air Dressers	level_2	0197ede5-3b87-79f4-8c10-479ad5697a7d	t	2025-07-09 13:40:51.68608+07	2025-07-09 13:40:51.68608+07	aditya_lukman	aditya_lukman
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: rent_service
--

COPY public.country (id, name, code, status, created_at, updated_at, created_by, updated_by, currency_code) FROM stdin;
0197edba-e15a-76c9-8ff8-27d4789b785b	Malaysia	MY	t	2025-07-09 12:50:03.689788+07	2025-07-09 12:50:03.689788+07	aditya_lukman	aditya_lukman	MYR
0197edbb-4e67-7a53-8e44-710b09f85e65	Singapore	SG	t	2025-07-09 12:50:03.710441+07	2025-07-09 12:50:03.710441+07	aditya_lukman	aditya_lukman	SGD
0197edb9-4cce-7690-b394-df8a2e9fab31	Indonesia	ID	f	2025-07-09 12:48:43.422423+07	2025-07-09 12:48:43.422423+07	aditya_lukman	aditya_lukman	IDR
\.


--
-- Data for Name: offer; Type: TABLE DATA; Schema: public; Owner: rent_service
--

COPY public.offer (id, normal_price, discount_price, quantity, warranty_period, country_id, variant_id, additional_information, status, created_at, updated_at, created_by, updated_by, sku_no) FROM stdin;
0197eedc-cff9-7bf6-8b34-d5b561fdb7f5	1400.00	1320.00	9	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee51-4683-7b5c-8f00-8299c0a25b90	\N	t	2025-07-09 18:53:36.226608+07	2025-07-09 18:06:18.278407+07	aditya_lukman	aditya_lukman	sku-MY00009
0197eedc-e510-7e37-b7b2-75c8e89879a6	1337.62	1287.00	3	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee51-02f4-734b-a2f1-f90eeaee20d2	\N	t	2025-07-09 18:53:36.229039+07	2025-07-09 18:06:18.298762+07	aditya_lukman	aditya_lukman	sku-MY00010
0197eedc-f6f0-727e-8ae2-9ef5dcac0f5f	1620.00	1470.00	7	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee51-1d3d-74ba-88a0-13fa7be0ba77	\N	t	2025-07-09 18:53:36.229869+07	2025-07-09 18:06:18.302255+07	aditya_lukman	aditya_lukman	sku-MY00011
0197ee90-4c92-7b77-b005-4165f1694abd	321.96	301.00	7	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee3f-4751-7ae6-bf15-01ec191df4fe	\N	t	2025-07-09 16:42:21.992088+07	2025-07-09 16:42:21.992088+07	aditya_lukman	aditya_lukman	sku-MY00001
0197ee90-5e84-742c-8d29-2740bb46d298	321.96	301.00	5	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee3f-5c53-7aaa-ae81-73f262795b27	\N	t	2025-07-09 16:42:22.015214+07	2025-07-09 16:42:22.015214+07	aditya_lukman	aditya_lukman	sku-MY00002
0197ee90-7062-750a-891d-07caf996a44f	321.96	301.00	3	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee3f-70c9-7e33-9fde-0e7ad42b6e7e	\N	t	2025-07-09 16:42:22.019959+07	2025-07-09 16:42:22.019959+07	aditya_lukman	aditya_lukman	sku-MY00003
0197ee90-8467-744f-b8c7-244ccdde390f	321.96	301.00	1	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee2a-898d-7b54-a87a-cbfee0a7c535	\N	t	2025-07-09 16:42:22.020746+07	2025-07-09 16:42:22.020746+07	aditya_lukman	aditya_lukman	sku-MY00004
0197ee94-e8d0-71f0-bef6-24c5e6152c8c	97.00	91.00	7	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee3f-4751-7ae6-bf15-01ec191df4fe	\N	t	2025-07-09 16:47:31.463072+07	2025-07-09 16:47:31.463072+07	aditya_lukman	aditya_lukman	sku-SG00001
0197ee95-08c8-7b15-a282-9b713c7780b5	97.00	91.00	2	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee3f-5c53-7aaa-ae81-73f262795b27	\N	t	2025-07-09 16:47:31.482375+07	2025-07-09 16:47:31.482375+07	aditya_lukman	aditya_lukman	sku-SG00002
0197ee95-1a3f-79ee-85f8-65e82fe4f5b2	97.00	91.00	1	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee3f-70c9-7e33-9fde-0e7ad42b6e7e	\N	t	2025-07-09 16:47:31.48542+07	2025-07-09 16:47:31.48542+07	aditya_lukman	aditya_lukman	sku-SG00003
0197ee95-3c83-72ee-9a23-c4e012931a0a	97.00	91.00	9	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee2a-898d-7b54-a87a-cbfee0a7c535	\N	t	2025-07-09 16:47:31.486657+07	2025-07-09 16:47:31.486657+07	aditya_lukman	aditya_lukman	sku-SG00004
0197ee9f-6f7f-792f-acd8-be00fcbbf59c	487.91	470.00	5	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee43-98ff-7a3d-ab66-aee9494fcf6f	\N	t	2025-07-09 16:59:11.095462+07	2025-07-09 16:59:11.095462+07	aditya_lukman	aditya_lukman	sku-MY00005
0197ee9f-817c-7059-b99f-eae8710eb374	487.91	470.00	3	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee43-ab24-779f-a7dc-151238f634f7	\N	t	2025-07-09 16:59:11.113329+07	2025-07-09 16:59:11.113329+07	aditya_lukman	aditya_lukman	sku-MY00006
0197ee9f-926e-7a7a-a5fe-dd1f38786b09	487.91	470.00	1	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee43-bc73-70bf-80c4-c01d5a1fafbc	\N	t	2025-07-09 16:59:11.116403+07	2025-07-09 16:59:11.116403+07	aditya_lukman	aditya_lukman	sku-MY00007
0197ee9f-a3d3-77f3-b4ba-a0bd8980bb27	487.91	470.00	6	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee43-cf89-74b2-aae6-512606f63a6f	\N	t	2025-07-09 16:59:11.117195+07	2025-07-09 16:59:11.117195+07	aditya_lukman	aditya_lukman	sku-MY00008
0197ee9f-b6b4-7b46-9228-92a5a348ba00	147.14	141.00	8	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee43-98ff-7a3d-ab66-aee9494fcf6f	\N	t	2025-07-09 16:59:11.117897+07	2025-07-09 16:59:11.117897+07	aditya_lukman	aditya_lukman	sku-SG00005
0197ee9f-ca4a-78d0-b28d-91709061cb40	147.14	141.00	2	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee43-ab24-779f-a7dc-151238f634f7	\N	t	2025-07-09 16:59:11.118538+07	2025-07-09 16:59:11.118538+07	aditya_lukman	aditya_lukman	sku-SG00006
0197ee9f-da80-7fc5-a26c-fb6cc5ab7ab5	147.14	141.00	5	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee43-bc73-70bf-80c4-c01d5a1fafbc	\N	t	2025-07-09 16:59:11.119371+07	2025-07-09 16:59:11.119371+07	aditya_lukman	aditya_lukman	sku-SG00007
0197ee9f-ebb0-7178-ad82-0778d5ec5fb9	147.14	141.00	7	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee43-cf89-74b2-aae6-512606f63a6f	\N	t	2025-07-09 16:59:11.121098+07	2025-07-09 16:59:11.121098+07	aditya_lukman	aditya_lukman	sku-SG00008
0197eedd-2c33-75aa-8c7b-0c7136764d0b	403.08	38783.00	9	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee51-02f4-734b-a2f1-f90eeaee20d2	\N	t	2025-07-09 18:06:51.922696+07	2025-07-09 18:06:51.922696+07	aditya_lukman	aditya_lukman	sku-SG00010
0197eedd-4152-7df7-8788-bb869f9d1569	488.17	442.97	5	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee51-1d3d-74ba-88a0-13fa7be0ba77	\N	t	2025-07-09 18:06:51.926609+07	2025-07-09 18:06:51.926609+07	aditya_lukman	aditya_lukman	sku-SG00011
0197eedd-560f-7291-aec4-709125075608	473.10	455.02	2	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee51-326f-7650-a166-88f4b3643d4a	\N	t	2025-07-09 18:06:51.927641+07	2025-07-09 18:06:51.927641+07	aditya_lukman	aditya_lukman	sku-SG00012
0197eee5-4eb1-79cf-ad5c-8f2a6aa02b97	355.81	345.00	5	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee59-c802-758e-a4ed-c74e10cc4e3f	\N	t	2025-07-09 18:15:16.574847+07	2025-07-09 18:15:16.574847+07	aditya_lukman	aditya_lukman	sku-MY00016
0197ef07-a434-7ad0-ba08-5ba993a9670b	305.00	270.00	5	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee61-f6d7-7a05-91e9-b3c1728e8a74	\N	t	2025-07-09 18:53:36.165002+07	2025-07-09 18:53:36.165002+07	aditya_lukman	aditya_lukman	sku-MY00017
0197ef07-b9fc-7be7-8bff-e18f605b08b4	305.00	270.00	3	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee62-0a78-7cfd-8174-cc0e93ebcbc2	\N	t	2025-07-09 18:53:36.185738+07	2025-07-09 18:53:36.185738+07	aditya_lukman	aditya_lukman	sku-MY00018
0197ef07-c8fd-726e-9828-eb9ea04b4fab	385.02	355.00	2	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee62-1ff5-72c5-8a5d-df1e507c45ff	\N	t	2025-07-09 18:53:36.191132+07	2025-07-09 18:53:36.191132+07	aditya_lukman	aditya_lukman	sku-MY00019
0197ef07-daaa-7ec4-b66b-9fea9ee724c5	385.02	355.00	4	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee62-3e76-7830-9d88-65530ca9f835	\N	t	2025-07-09 18:53:36.192502+07	2025-07-09 18:53:36.192502+07	aditya_lukman	aditya_lukman	sku-MY00020
0197ef07-e91d-70ac-9c10-aae68ffcf1ba	335.00	290.00	6	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee62-5217-7e6b-936c-7c534e53997d	\N	t	2025-07-09 18:53:36.19434+07	2025-07-09 18:53:36.19434+07	aditya_lukman	aditya_lukman	sku-MY00021
0197eedd-07f6-762f-a87c-92c038b7324d	1570.00	1510.00	2	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee51-326f-7650-a166-88f4b3643d4a	\N	t	2025-07-09 18:53:36.230501+07	2025-07-09 18:06:18.303031+07	aditya_lukman	aditya_lukman	sku-MY00012
0197eedd-18cc-7748-a312-f3d6dc586393	421.88	397.77	8	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee51-4683-7b5c-8f00-8299c0a25b90	\N	t	2025-07-09 18:06:18.304208+07	2025-07-09 18:06:18.304208+07	aditya_lukman	aditya_lukman	sku-SG00009
0197eee5-17cf-7054-8bda-a18f78f81195	285.45	270.00	3	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee59-4f7a-7e4f-84fd-a9b9f1cf2d2b	\N	t	2025-07-09 18:15:16.537627+07	2025-07-09 18:15:16.537627+07	aditya_lukman	aditya_lukman	sku-MY00013
0197eee5-2d2d-72cf-b729-e311d91a3f8d	315.81	301.00	7	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee59-a233-776e-be71-afc79d75a5b6	\N	t	2025-07-09 18:15:16.570117+07	2025-07-09 18:15:16.570117+07	aditya_lukman	aditya_lukman	sku-MY00014
0197eee5-3dbb-7e1e-ba6a-728f1cef68de	395.81	375.00	9	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee59-b3fc-79af-baae-dc0a548e311d	\N	t	2025-07-09 18:15:16.574104+07	2025-07-09 18:15:16.574104+07	aditya_lukman	aditya_lukman	sku-MY00015
0197eee5-5cf1-717c-91fe-db6ee50cc593	86.02	81.37	3	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee59-4f7a-7e4f-84fd-a9b9f1cf2d2b	\N	t	2025-07-09 18:15:16.576039+07	2025-07-09 18:15:16.576039+07	aditya_lukman	aditya_lukman	sku-SG00013
0197eee5-6e99-733f-be83-18e100b43423	95.17	90.71	6	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee59-a233-776e-be71-afc79d75a5b6	\N	t	2025-07-09 18:15:16.580743+07	2025-07-09 18:15:16.580743+07	aditya_lukman	aditya_lukman	sku-SG00014
0197eee5-84ee-7402-8a8a-4b45edf26ef4	119.28	113.01	8	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee59-b3fc-79af-baae-dc0a548e311d	\N	t	2025-07-09 18:15:16.582682+07	2025-07-09 18:15:16.582682+07	aditya_lukman	aditya_lukman	sku-SG00015
0197eee5-9522-70f8-8c5d-18b0d56b0aa0	107.23	345.00	2	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee59-c802-758e-a4ed-c74e10cc4e3f	\N	t	2025-07-09 18:15:16.58344+07	2025-07-09 18:15:16.58344+07	aditya_lukman	aditya_lukman	sku-SG00016
0197ef07-f886-7d8d-8770-c17e1e640e1b	335.00	290.00	3	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee62-674a-7236-ba27-c678cdb80b01	\N	t	2025-07-09 18:53:36.19492+07	2025-07-09 18:53:36.19492+07	aditya_lukman	aditya_lukman	sku-MY00022
0197ef08-0add-7590-9ef0-0eaef5afd075	441.00	409.00	5	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee62-7df9-725f-8aba-fb4136b404b9	\N	t	2025-07-09 18:53:36.198942+07	2025-07-09 18:53:36.198942+07	aditya_lukman	aditya_lukman	sku-MY00023
0197ef08-1a89-7bef-ba50-34581d433558	441.00	409.00	1	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee62-9205-73d5-a8f3-b65eed5bd1bd	\N	t	2025-07-09 18:53:36.199993+07	2025-07-09 18:53:36.199993+07	aditya_lukman	aditya_lukman	sku-MY00024
0197ef08-2e40-7cba-a972-5bffb78d9990	91.98	81.42	8	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee61-f6d7-7a05-91e9-b3c1728e8a74	\N	t	2025-07-09 18:53:36.202137+07	2025-07-09 18:53:36.202137+07	aditya_lukman	aditya_lukman	sku-SG00017
0197ef08-3eca-73bc-8a8a-6abd4cf326e2	91.98	81.42	9	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee62-0a78-7cfd-8174-cc0e93ebcbc2	\N	t	2025-07-09 18:53:36.204195+07	2025-07-09 18:53:36.204195+07	aditya_lukman	aditya_lukman	sku-SG00018
0197ef08-53d7-72ee-b204-f3745293a176	116.11	107.06	4	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee62-1ff5-72c5-8a5d-df1e507c45ff	\N	t	2025-07-09 18:53:36.205586+07	2025-07-09 18:53:36.205586+07	aditya_lukman	aditya_lukman	sku-SG00019
0197ef08-6d65-7a8a-a103-fed1ca86a89a	116.11	107.06	5	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee62-3e76-7830-9d88-65530ca9f835	\N	t	2025-07-09 18:53:36.206512+07	2025-07-09 18:53:36.206512+07	aditya_lukman	aditya_lukman	sku-SG00020
0197ef08-7b7d-7b8f-9ae7-a53c846fbe6c	101.02	87.45	2	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee62-5217-7e6b-936c-7c534e53997d	\N	t	2025-07-09 18:53:36.207288+07	2025-07-09 18:53:36.207288+07	aditya_lukman	aditya_lukman	sku-SG00021
0197ef08-922e-714a-aee2-dc26397a2fe1	101.02	87.45	4	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee62-674a-7236-ba27-c678cdb80b01	\N	t	2025-07-09 18:53:36.210602+07	2025-07-09 18:53:36.210602+07	aditya_lukman	aditya_lukman	sku-SG00022
0197ef08-9ff7-762f-9aca-a9dc763205e0	132.99	123.34	7	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee62-7df9-725f-8aba-fb4136b404b9	\N	t	2025-07-09 18:53:36.211834+07	2025-07-09 18:53:36.211834+07	aditya_lukman	aditya_lukman	sku-SG00023
0197ef08-acf6-72a0-870c-3bd1c10350a2	132.99	123.34	4	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee62-9205-73d5-a8f3-b65eed5bd1bd	\N	t	2025-07-09 18:53:36.212635+07	2025-07-09 18:53:36.212635+07	aditya_lukman	aditya_lukman	sku-SG00024
0197ef13-2771-77db-ae41-49f6cf09df90	252.26	248.00	4	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee6b-2452-72b6-8ec5-cc38291cf4e9	\N	t	2025-07-09 19:05:34.265649+07	2025-07-09 19:05:34.265649+07	aditya_lukman	aditya_lukman	sku-MY00025
0197ef13-38a7-7bac-b634-31e23b2a9436	298.17	282.00	7	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee6b-3b1f-7253-9457-8c5bdb906e56	\N	t	2025-07-09 19:05:34.287701+07	2025-07-09 19:05:34.287701+07	aditya_lukman	aditya_lukman	sku-MY00026
0197ef13-4726-7ded-b7cc-5267dfd1212c	345.14	338.14	5	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee6b-4feb-7e27-a9c2-12d72db39774	\N	t	2025-07-09 19:05:34.291978+07	2025-07-09 19:05:34.291978+07	aditya_lukman	aditya_lukman	sku-MY00027
0197ef13-5de1-74c0-a6dc-6b58d3284677	385.98	367.98	3	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee6b-65f7-7f04-899f-4bc16f3f734c	\N	t	2025-07-09 19:05:34.293409+07	2025-07-09 19:05:34.293409+07	aditya_lukman	aditya_lukman	sku-MY00028
0197ef13-6bfe-720a-98f6-0add0c9face6	76.03	74.75	7	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee62-9205-73d5-a8f3-b65eed5bd1bd	\N	t	2025-07-09 19:05:34.295198+07	2025-07-09 19:05:34.295198+07	aditya_lukman	aditya_lukman	sku-SG00025
0197ef13-7ce8-7f5e-a1e2-f07f2fe34d02	89.87	84.99	2	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee6b-2452-72b6-8ec5-cc38291cf4e9	\N	t	2025-07-09 19:05:34.296288+07	2025-07-09 19:05:34.296288+07	aditya_lukman	aditya_lukman	sku-SG00026
0197ef13-8e7e-7d97-8321-092a7904d6e7	104.03	101.92	8	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee6b-4feb-7e27-a9c2-12d72db39774	\N	t	2025-07-09 19:05:34.297083+07	2025-07-09 19:05:34.297083+07	aditya_lukman	aditya_lukman	sku-SG00027
0197ef13-a2d8-7c93-ba1e-f83d04de151f	116.33	110.91	2	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee6b-65f7-7f04-899f-4bc16f3f734c	\N	t	2025-07-09 19:05:34.297911+07	2025-07-09 19:05:34.297911+07	aditya_lukman	aditya_lukman	sku-SG00028
0197ef19-4127-73d6-afee-0baaafcb1f06	441.45	411.00	5	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee72-9b43-7d31-b5f4-59ebb2b0d8ab	\N	t	2025-07-09 19:12:03.031012+07	2025-07-09 19:12:03.031012+07	aditya_lukman	aditya_lukman	sku-MY00029
0197ef19-646b-7f28-9628-15923952d76a	491.19	467.19	7	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee72-ca8c-71be-951c-dc496f7d72b8	\N	t	2025-07-09 19:12:03.059555+07	2025-07-09 19:12:03.059555+07	aditya_lukman	aditya_lukman	sku-MY00030
0197ef19-7e59-7731-88a9-bb133e393bee	133.06	123.88	2	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee72-9b43-7d31-b5f4-59ebb2b0d8ab	\N	t	2025-07-09 19:12:03.079194+07	2025-07-09 19:12:03.079194+07	aditya_lukman	aditya_lukman	sku-SG00029
0197ef19-8f94-7c09-85c8-6086b56e894d	148.05	140.82	6	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee72-ca8c-71be-951c-dc496f7d72b8	\N	t	2025-07-09 19:12:03.083978+07	2025-07-09 19:12:03.083978+07	aditya_lukman	aditya_lukman	sku-SG00030
0197ef20-6176-75a1-b9eb-3091456715da	152.68	127.00	3	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee75-25cd-7a90-88a1-6aa199658a1f	\N	t	2025-07-09 19:19:32.458689+07	2025-07-09 19:19:32.458689+07	aditya_lukman	aditya_lukman	sku-MY00031
0197ef20-9bb4-7f1a-889a-2afdf56d5590	178.18	157.18	5	12	0197edba-e15a-76c9-8ff8-27d4789b785b	0197ee75-3cb0-7482-b456-49e2389530e8	\N	t	2025-07-09 19:19:52.898458+07	2025-07-09 19:19:52.898458+07	aditya_lukman	aditya_lukman	sku-MY00032
0197ef20-acb3-7d82-9c72-a2b781bd1ceb	46.04	38.30	2	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee75-25cd-7a90-88a1-6aa199658a1f	\N	t	2025-07-09 19:19:52.919247+07	2025-07-09 19:19:52.919247+07	aditya_lukman	aditya_lukman	sku-SG00031
0197ef20-bc2a-7b33-a218-3a59824a5fef	53.73	47.40	9	12	0197edbb-4e67-7a53-8e44-710b09f85e65	0197ee75-3cb0-7482-b456-49e2389530e8	\N	t	2025-07-09 19:19:52.923705+07	2025-07-09 19:19:52.923705+07	aditya_lukman	aditya_lukman	sku-SG00032
\.


--
-- Data for Name: offer_period_mapping; Type: TABLE DATA; Schema: public; Owner: rent_service
--

COPY public.offer_period_mapping (period_id, offer_id) FROM stdin;
0197edef-6112-79af-a75d-40971f7711e7	0197ee90-4c92-7b77-b005-4165f1694abd
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ee90-4c92-7b77-b005-4165f1694abd
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ee90-4c92-7b77-b005-4165f1694abd
0197edef-6112-79af-a75d-40971f7711e7	0197ee90-5e84-742c-8d29-2740bb46d298
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ee90-5e84-742c-8d29-2740bb46d298
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ee90-5e84-742c-8d29-2740bb46d298
0197edef-6112-79af-a75d-40971f7711e7	0197ee90-7062-750a-891d-07caf996a44f
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ee90-7062-750a-891d-07caf996a44f
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ee90-7062-750a-891d-07caf996a44f
0197edef-6112-79af-a75d-40971f7711e7	0197ee90-8467-744f-b8c7-244ccdde390f
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ee90-8467-744f-b8c7-244ccdde390f
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ee90-8467-744f-b8c7-244ccdde390f
0197edef-6112-79af-a75d-40971f7711e7	0197ee94-e8d0-71f0-bef6-24c5e6152c8c
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ee94-e8d0-71f0-bef6-24c5e6152c8c
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ee94-e8d0-71f0-bef6-24c5e6152c8c
0197edef-6112-79af-a75d-40971f7711e7	0197ee95-08c8-7b15-a282-9b713c7780b5
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ee95-08c8-7b15-a282-9b713c7780b5
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ee95-08c8-7b15-a282-9b713c7780b5
0197edef-6112-79af-a75d-40971f7711e7	0197ee95-1a3f-79ee-85f8-65e82fe4f5b2
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ee95-1a3f-79ee-85f8-65e82fe4f5b2
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ee95-1a3f-79ee-85f8-65e82fe4f5b2
0197edef-6112-79af-a75d-40971f7711e7	0197ee95-3c83-72ee-9a23-c4e012931a0a
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ee95-3c83-72ee-9a23-c4e012931a0a
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ee95-3c83-72ee-9a23-c4e012931a0a
0197edef-6112-79af-a75d-40971f7711e7	0197ee9f-6f7f-792f-acd8-be00fcbbf59c
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ee9f-6f7f-792f-acd8-be00fcbbf59c
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ee9f-6f7f-792f-acd8-be00fcbbf59c
0197edef-6112-79af-a75d-40971f7711e7	0197ee9f-817c-7059-b99f-eae8710eb374
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ee9f-817c-7059-b99f-eae8710eb374
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ee9f-817c-7059-b99f-eae8710eb374
0197edef-6112-79af-a75d-40971f7711e7	0197ee9f-926e-7a7a-a5fe-dd1f38786b09
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ee9f-926e-7a7a-a5fe-dd1f38786b09
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ee9f-926e-7a7a-a5fe-dd1f38786b09
0197edef-6112-79af-a75d-40971f7711e7	0197ee9f-a3d3-77f3-b4ba-a0bd8980bb27
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ee9f-a3d3-77f3-b4ba-a0bd8980bb27
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ee9f-a3d3-77f3-b4ba-a0bd8980bb27
0197edef-6112-79af-a75d-40971f7711e7	0197ee9f-b6b4-7b46-9228-92a5a348ba00
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ee9f-b6b4-7b46-9228-92a5a348ba00
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ee9f-b6b4-7b46-9228-92a5a348ba00
0197edef-6112-79af-a75d-40971f7711e7	0197ee9f-ca4a-78d0-b28d-91709061cb40
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ee9f-ca4a-78d0-b28d-91709061cb40
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ee9f-ca4a-78d0-b28d-91709061cb40
0197edef-6112-79af-a75d-40971f7711e7	0197ee9f-da80-7fc5-a26c-fb6cc5ab7ab5
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ee9f-da80-7fc5-a26c-fb6cc5ab7ab5
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ee9f-da80-7fc5-a26c-fb6cc5ab7ab5
0197edef-6112-79af-a75d-40971f7711e7	0197ee9f-ebb0-7178-ad82-0778d5ec5fb9
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ee9f-ebb0-7178-ad82-0778d5ec5fb9
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ee9f-ebb0-7178-ad82-0778d5ec5fb9
0197edef-6112-79af-a75d-40971f7711e7	0197eedc-cff9-7bf6-8b34-d5b561fdb7f5
0197edef-7fdc-7c21-80c5-746f33e2c987	0197eedc-cff9-7bf6-8b34-d5b561fdb7f5
0197edef-b478-74fc-b53d-3dd02cb012bc	0197eedc-cff9-7bf6-8b34-d5b561fdb7f5
0197edef-6112-79af-a75d-40971f7711e7	0197eedc-e510-7e37-b7b2-75c8e89879a6
0197edef-7fdc-7c21-80c5-746f33e2c987	0197eedc-e510-7e37-b7b2-75c8e89879a6
0197edef-b478-74fc-b53d-3dd02cb012bc	0197eedc-e510-7e37-b7b2-75c8e89879a6
0197edef-6112-79af-a75d-40971f7711e7	0197eedc-f6f0-727e-8ae2-9ef5dcac0f5f
0197edef-7fdc-7c21-80c5-746f33e2c987	0197eedc-f6f0-727e-8ae2-9ef5dcac0f5f
0197edef-b478-74fc-b53d-3dd02cb012bc	0197eedc-f6f0-727e-8ae2-9ef5dcac0f5f
0197edef-6112-79af-a75d-40971f7711e7	0197eedd-07f6-762f-a87c-92c038b7324d
0197edef-7fdc-7c21-80c5-746f33e2c987	0197eedd-07f6-762f-a87c-92c038b7324d
0197edef-b478-74fc-b53d-3dd02cb012bc	0197eedd-07f6-762f-a87c-92c038b7324d
0197edef-6112-79af-a75d-40971f7711e7	0197eedd-18cc-7748-a312-f3d6dc586393
0197edef-7fdc-7c21-80c5-746f33e2c987	0197eedd-18cc-7748-a312-f3d6dc586393
0197edef-b478-74fc-b53d-3dd02cb012bc	0197eedd-18cc-7748-a312-f3d6dc586393
0197edef-6112-79af-a75d-40971f7711e7	0197eedd-2c33-75aa-8c7b-0c7136764d0b
0197edef-7fdc-7c21-80c5-746f33e2c987	0197eedd-2c33-75aa-8c7b-0c7136764d0b
0197edef-b478-74fc-b53d-3dd02cb012bc	0197eedd-2c33-75aa-8c7b-0c7136764d0b
0197edef-6112-79af-a75d-40971f7711e7	0197eedd-4152-7df7-8788-bb869f9d1569
0197edef-7fdc-7c21-80c5-746f33e2c987	0197eedd-4152-7df7-8788-bb869f9d1569
0197edef-b478-74fc-b53d-3dd02cb012bc	0197eedd-4152-7df7-8788-bb869f9d1569
0197edef-6112-79af-a75d-40971f7711e7	0197eedd-560f-7291-aec4-709125075608
0197edef-7fdc-7c21-80c5-746f33e2c987	0197eedd-560f-7291-aec4-709125075608
0197edef-b478-74fc-b53d-3dd02cb012bc	0197eedd-560f-7291-aec4-709125075608
0197edef-6112-79af-a75d-40971f7711e7	0197eee5-17cf-7054-8bda-a18f78f81195
0197edef-7fdc-7c21-80c5-746f33e2c987	0197eee5-17cf-7054-8bda-a18f78f81195
0197edef-b478-74fc-b53d-3dd02cb012bc	0197eee5-17cf-7054-8bda-a18f78f81195
0197edef-6112-79af-a75d-40971f7711e7	0197eee5-2d2d-72cf-b729-e311d91a3f8d
0197edef-7fdc-7c21-80c5-746f33e2c987	0197eee5-2d2d-72cf-b729-e311d91a3f8d
0197edef-b478-74fc-b53d-3dd02cb012bc	0197eee5-2d2d-72cf-b729-e311d91a3f8d
0197edef-6112-79af-a75d-40971f7711e7	0197eee5-3dbb-7e1e-ba6a-728f1cef68de
0197edef-7fdc-7c21-80c5-746f33e2c987	0197eee5-3dbb-7e1e-ba6a-728f1cef68de
0197edef-b478-74fc-b53d-3dd02cb012bc	0197eee5-3dbb-7e1e-ba6a-728f1cef68de
0197edef-6112-79af-a75d-40971f7711e7	0197eee5-4eb1-79cf-ad5c-8f2a6aa02b97
0197edef-7fdc-7c21-80c5-746f33e2c987	0197eee5-4eb1-79cf-ad5c-8f2a6aa02b97
0197edef-b478-74fc-b53d-3dd02cb012bc	0197eee5-4eb1-79cf-ad5c-8f2a6aa02b97
0197edef-6112-79af-a75d-40971f7711e7	0197eee5-5cf1-717c-91fe-db6ee50cc593
0197edef-7fdc-7c21-80c5-746f33e2c987	0197eee5-5cf1-717c-91fe-db6ee50cc593
0197edef-b478-74fc-b53d-3dd02cb012bc	0197eee5-5cf1-717c-91fe-db6ee50cc593
0197edef-6112-79af-a75d-40971f7711e7	0197eee5-6e99-733f-be83-18e100b43423
0197edef-7fdc-7c21-80c5-746f33e2c987	0197eee5-6e99-733f-be83-18e100b43423
0197edef-b478-74fc-b53d-3dd02cb012bc	0197eee5-6e99-733f-be83-18e100b43423
0197edef-6112-79af-a75d-40971f7711e7	0197eee5-84ee-7402-8a8a-4b45edf26ef4
0197edef-7fdc-7c21-80c5-746f33e2c987	0197eee5-84ee-7402-8a8a-4b45edf26ef4
0197edef-b478-74fc-b53d-3dd02cb012bc	0197eee5-84ee-7402-8a8a-4b45edf26ef4
0197edef-6112-79af-a75d-40971f7711e7	0197eee5-9522-70f8-8c5d-18b0d56b0aa0
0197edef-7fdc-7c21-80c5-746f33e2c987	0197eee5-9522-70f8-8c5d-18b0d56b0aa0
0197edef-b478-74fc-b53d-3dd02cb012bc	0197eee5-9522-70f8-8c5d-18b0d56b0aa0
0197edef-6112-79af-a75d-40971f7711e7	0197ef07-a434-7ad0-ba08-5ba993a9670b
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef07-a434-7ad0-ba08-5ba993a9670b
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef07-a434-7ad0-ba08-5ba993a9670b
0197edef-6112-79af-a75d-40971f7711e7	0197ef07-b9fc-7be7-8bff-e18f605b08b4
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef07-b9fc-7be7-8bff-e18f605b08b4
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef07-b9fc-7be7-8bff-e18f605b08b4
0197edef-6112-79af-a75d-40971f7711e7	0197ef07-c8fd-726e-9828-eb9ea04b4fab
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef07-c8fd-726e-9828-eb9ea04b4fab
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef07-c8fd-726e-9828-eb9ea04b4fab
0197edef-6112-79af-a75d-40971f7711e7	0197ef07-daaa-7ec4-b66b-9fea9ee724c5
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef07-daaa-7ec4-b66b-9fea9ee724c5
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef07-daaa-7ec4-b66b-9fea9ee724c5
0197edef-6112-79af-a75d-40971f7711e7	0197ef07-e91d-70ac-9c10-aae68ffcf1ba
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef07-e91d-70ac-9c10-aae68ffcf1ba
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef07-e91d-70ac-9c10-aae68ffcf1ba
0197edef-6112-79af-a75d-40971f7711e7	0197ef07-f886-7d8d-8770-c17e1e640e1b
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef07-f886-7d8d-8770-c17e1e640e1b
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef07-f886-7d8d-8770-c17e1e640e1b
0197edef-6112-79af-a75d-40971f7711e7	0197ef08-0add-7590-9ef0-0eaef5afd075
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef08-0add-7590-9ef0-0eaef5afd075
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef08-0add-7590-9ef0-0eaef5afd075
0197edef-6112-79af-a75d-40971f7711e7	0197ef08-1a89-7bef-ba50-34581d433558
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef08-1a89-7bef-ba50-34581d433558
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef08-1a89-7bef-ba50-34581d433558
0197edef-6112-79af-a75d-40971f7711e7	0197ef08-2e40-7cba-a972-5bffb78d9990
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef08-2e40-7cba-a972-5bffb78d9990
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef08-2e40-7cba-a972-5bffb78d9990
0197edef-6112-79af-a75d-40971f7711e7	0197ef08-3eca-73bc-8a8a-6abd4cf326e2
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef08-3eca-73bc-8a8a-6abd4cf326e2
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef08-3eca-73bc-8a8a-6abd4cf326e2
0197edef-6112-79af-a75d-40971f7711e7	0197ef08-53d7-72ee-b204-f3745293a176
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef08-53d7-72ee-b204-f3745293a176
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef08-53d7-72ee-b204-f3745293a176
0197edef-6112-79af-a75d-40971f7711e7	0197ef08-6d65-7a8a-a103-fed1ca86a89a
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef08-6d65-7a8a-a103-fed1ca86a89a
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef08-6d65-7a8a-a103-fed1ca86a89a
0197edef-6112-79af-a75d-40971f7711e7	0197ef08-7b7d-7b8f-9ae7-a53c846fbe6c
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef08-7b7d-7b8f-9ae7-a53c846fbe6c
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef08-7b7d-7b8f-9ae7-a53c846fbe6c
0197edef-6112-79af-a75d-40971f7711e7	0197ef08-922e-714a-aee2-dc26397a2fe1
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef08-922e-714a-aee2-dc26397a2fe1
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef08-922e-714a-aee2-dc26397a2fe1
0197edef-6112-79af-a75d-40971f7711e7	0197ef08-9ff7-762f-9aca-a9dc763205e0
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef08-9ff7-762f-9aca-a9dc763205e0
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef08-9ff7-762f-9aca-a9dc763205e0
0197edef-6112-79af-a75d-40971f7711e7	0197ef08-acf6-72a0-870c-3bd1c10350a2
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef08-acf6-72a0-870c-3bd1c10350a2
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef08-acf6-72a0-870c-3bd1c10350a2
0197edef-6112-79af-a75d-40971f7711e7	0197ef13-2771-77db-ae41-49f6cf09df90
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef13-2771-77db-ae41-49f6cf09df90
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef13-2771-77db-ae41-49f6cf09df90
0197edef-6112-79af-a75d-40971f7711e7	0197ef13-38a7-7bac-b634-31e23b2a9436
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef13-38a7-7bac-b634-31e23b2a9436
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef13-38a7-7bac-b634-31e23b2a9436
0197edef-6112-79af-a75d-40971f7711e7	0197ef13-4726-7ded-b7cc-5267dfd1212c
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef13-4726-7ded-b7cc-5267dfd1212c
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef13-4726-7ded-b7cc-5267dfd1212c
0197edef-6112-79af-a75d-40971f7711e7	0197ef13-5de1-74c0-a6dc-6b58d3284677
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef13-5de1-74c0-a6dc-6b58d3284677
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef13-5de1-74c0-a6dc-6b58d3284677
0197edef-6112-79af-a75d-40971f7711e7	0197ef13-6bfe-720a-98f6-0add0c9face6
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef13-6bfe-720a-98f6-0add0c9face6
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef13-6bfe-720a-98f6-0add0c9face6
0197edef-6112-79af-a75d-40971f7711e7	0197ef13-7ce8-7f5e-a1e2-f07f2fe34d02
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef13-7ce8-7f5e-a1e2-f07f2fe34d02
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef13-7ce8-7f5e-a1e2-f07f2fe34d02
0197edef-6112-79af-a75d-40971f7711e7	0197ef13-8e7e-7d97-8321-092a7904d6e7
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef13-8e7e-7d97-8321-092a7904d6e7
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef13-8e7e-7d97-8321-092a7904d6e7
0197edef-6112-79af-a75d-40971f7711e7	0197ef13-a2d8-7c93-ba1e-f83d04de151f
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef13-a2d8-7c93-ba1e-f83d04de151f
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef13-a2d8-7c93-ba1e-f83d04de151f
0197edef-6112-79af-a75d-40971f7711e7	0197ef19-4127-73d6-afee-0baaafcb1f06
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef19-4127-73d6-afee-0baaafcb1f06
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef19-4127-73d6-afee-0baaafcb1f06
0197edef-6112-79af-a75d-40971f7711e7	0197ef19-646b-7f28-9628-15923952d76a
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef19-646b-7f28-9628-15923952d76a
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef19-646b-7f28-9628-15923952d76a
0197edef-6112-79af-a75d-40971f7711e7	0197ef19-7e59-7731-88a9-bb133e393bee
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef19-7e59-7731-88a9-bb133e393bee
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef19-7e59-7731-88a9-bb133e393bee
0197edef-6112-79af-a75d-40971f7711e7	0197ef19-8f94-7c09-85c8-6086b56e894d
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef19-8f94-7c09-85c8-6086b56e894d
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef19-8f94-7c09-85c8-6086b56e894d
0197edef-6112-79af-a75d-40971f7711e7	0197ef20-6176-75a1-b9eb-3091456715da
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef20-6176-75a1-b9eb-3091456715da
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef20-6176-75a1-b9eb-3091456715da
0197edef-6112-79af-a75d-40971f7711e7	0197ef20-9bb4-7f1a-889a-2afdf56d5590
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef20-9bb4-7f1a-889a-2afdf56d5590
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef20-9bb4-7f1a-889a-2afdf56d5590
0197edef-6112-79af-a75d-40971f7711e7	0197ef20-acb3-7d82-9c72-a2b781bd1ceb
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef20-acb3-7d82-9c72-a2b781bd1ceb
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef20-acb3-7d82-9c72-a2b781bd1ceb
0197edef-6112-79af-a75d-40971f7711e7	0197ef20-bc2a-7b33-a218-3a59824a5fef
0197edef-7fdc-7c21-80c5-746f33e2c987	0197ef20-bc2a-7b33-a218-3a59824a5fef
0197edef-b478-74fc-b53d-3dd02cb012bc	0197ef20-bc2a-7b33-a218-3a59824a5fef
\.


--
-- Data for Name: period; Type: TABLE DATA; Schema: public; Owner: rent_service
--

COPY public.period (id, duration, status, created_at, updated_at, created_by, updated_by) FROM stdin;
0197edef-6112-79af-a75d-40971f7711e7	3	t	2025-07-09 13:47:25.271402+07	2025-07-09 13:47:25.271402+07	aditya_lukman	aditya_lukman
0197edef-7fdc-7c21-80c5-746f33e2c987	6	t	2025-07-09 13:47:25.271402+07	2025-07-09 13:47:25.271402+07	aditya_lukman	aditya_lukman
0197edef-b478-74fc-b53d-3dd02cb012bc	12	t	2025-07-09 13:47:25.271402+07	2025-07-09 13:47:25.271402+07	aditya_lukman	aditya_lukman
0197edef-3dd9-7323-a0c3-325eeea5bf9e	1	f	2025-07-09 13:47:25.271402+07	2025-07-09 13:47:25.271402+07	aditya_lukman	aditya_lukman
0197edef-9c23-78cd-87fe-fcca6397dc39	9	f	2025-07-09 13:47:25.271402+07	2025-07-09 13:47:25.271402+07	aditya_lukman	aditya_lukman
0197edef-d23f-7fe3-90e4-538f002ee8c5	15	f	2025-07-09 13:47:25.271402+07	2025-07-09 13:47:25.271402+07	aditya_lukman	aditya_lukman
0197edef-ec18-7a74-a515-b593b3fa33f2	18	f	2025-07-09 13:47:25.271402+07	2025-07-09 13:47:25.271402+07	aditya_lukman	aditya_lukman
0197edf0-11ae-76f5-9339-b263c03c6cef	21	f	2025-07-09 13:47:25.271402+07	2025-07-09 13:47:25.271402+07	aditya_lukman	aditya_lukman
0197edf0-2d83-771c-8b87-9db769bb70cf	24	f	2025-07-09 13:47:25.271402+07	2025-07-09 13:47:25.271402+07	aditya_lukman	aditya_lukman
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: rent_service
--

COPY public.product (id, name, description, specs, brand_id, category_id, status, created_at, updated_at, created_by, updated_by) FROM stdin;
0197ee11-3043-75b5-94b2-d2ed87197e80	Microsoft Surface Pro (11th Edition)	The Microsoft Surface Pro (11th Edition) redefines productivity and portability with its innovative features and sleek design. Powered by the cutting-edge Snapdragon X Plus (10-Core) processor, it delivers exceptional performance, seamless multitasking, and energy efficiency. The vibrant LCD display offers stunning clarity and responsiveness, ideal for work, creativity, and entertainment. With built-in Copilot+ PC, the Surface Pro integrates intelligent AI assistance to enhance productivity, streamline workflows, and provide real-time suggestions tailored to your needs. Whether you're tackling demanding tasks or staying connected on the go, this versatile 2-in-1 device effortlessly adapts to your lifestyle.\n	{"depth": "287mm", "ports": "2x USBC", "width": "209mm", "height": "9.3mm", "memory": "16GB", "weight": "895g", "display": "13 inch PixelSense Flow Display", "graphics": "Qualcomm Adreno", "processor": "Snapdragon X Plus 10 Core with LCD display", "dimensions": "28.7 cm x 20.9 cm x 0.93 cm", "resolution": "2880 x 1920", "year_model": 2024, "rear_camera": "10MP", "screen_size": "13 inch", "connectivity": "WiFi, Bluetooth", "refresh_rate": "120Hz", "operating_system": "Windows 11 Home"}	0197edc1-e16e-7022-aa9b-ae725a8bd90e	0197ede8-ff94-7027-9b0e-b721882b28d4	t	2025-07-09 14:28:38.387626+07	2025-07-09 14:28:38.387626+07	aditya_lukman	aditya_lukman
0197ee17-3e93-7ff5-bef6-900756499709	Apple Pro Display XDR	Apple 32 inches Pro Display XDR 16:9 Retina 6K HDR IPS Display (Standard Glass)\n	{"depth": "11.6 cm", "ports": "Thunderbolt 3 Input", "width": "86.2 cm", "height": "57 cm", "weight": "13.79 kg", "dimensions": "57 x 86.2 x 11.6 cm", "resolution": "6016 x 3384", "year_model": 2023, "screen_size": "31 inches", "connectivity": "Thunderbolt 3", "refresh_rate": "60 Hz"}	0197edc0-f677-76c7-b4d8-095b75e425dd	0197ede8-262f-7105-aa3d-34ac9f62186d	t	2025-07-09 14:31:35.209916+07	2025-07-09 14:31:35.209916+07	aditya_lukman	aditya_lukman
0197ee1d-d2e4-7b90-a495-db284f65f59e	Apple MacBook Pro 14" M4	The Apple MacBook Pro 14” with M4 chip and 24GB of memory is designed for unparalleled performance. Its advanced 12MP Center Stage camera ensures professional-quality video calls, while Thunderbolt 5 enables blazing-fast data transfers and seamless connectivity. The all-new nano-texture display option offers exceptional clarity, making it perfect for creatives and professionals alike. With powerful processing and expanded memory, the MacBook Pro handles intensive tasks effortlessly, from high-resolution editing to complex 3D rendering.\n	{"depth": "15.5 mm", "ports": "Three Thunderbolt 5 ports, HDMI port, SDXC card slot, headphone jack, MagSafe 3 port", "width": "221.2mm", "height": "312.6mm", "max_mp": "12MP", "memory": "24GB", "weight": "1.54kg", "display": "Liquid Retina XDR display", "processor": "Apple M4 chip with 10-core CPU, 10-core GPU, 16-core Neural Engine", "dimensions": "312.6 x 221.2 x 15.5 mm", "resolution": "3024 x 1964", "year_model": 2024, "screen_size": "14-inch", "connectivity": "USB, Bluetooth, Wi-Fi", "front_camera": "12MP", "no_of_cameras": 1, "operating_system": "Mac OSx"}	0197edc0-f677-76c7-b4d8-095b75e425dd	0197ede8-ff94-7027-9b0e-b721882b28d4	t	2025-07-09 14:37:25.931694+07	2025-07-09 14:37:25.931694+07	aditya_lukman	aditya_lukman
0197ee28-7fe7-7462-9a68-55858e6a33da	Dell UltraSharp Monitor	Crafted with premium platinum silver finish, the U2722DE comes with a small base and an improved cable management design that hides cables in the monitor riser for a clutter free desk space. Navigate and adjust your monitor screen settings with the easy-to-use joystick control.\n	{"depth": "18.542 cm", "width": "61.214 cm", "height": "38.608 cm", "weight": "10kg", "display": "27\\" 4K IPS", "dimensions": "38.608 x 61.214 x 18.542 cm", "resolution": "2560 x 1440", "year_model": 2022, "screen_size": "27 Inches", "connectivity": "HDMI, DisplayPort, USB-C, USB, 3.5mm Audio, RJ45", "refresh_rate": "60Hz"}	0197edc4-d90a-7d4e-a377-5b20f2d8712e	0197ede8-d254-79d9-9ff0-5d528cdd8276	t	2025-07-09 14:49:32.13155+07	2025-07-09 14:49:32.13155+07	aditya_lukman	aditya_lukman
0197ee1f-86d7-7f86-8ae3-7822d28b6722	ThinkPad T14 Gen 5	The Lenovo ThinkPad T14 Gen 5 is a robust and secure business-class laptop powered by the Intel® Core™ Ultra 7 155U processor (up to 4.80 GHz), paired with 32GB DDR5 RAM and a 512GB PCIe Gen4 SSD, ensuring smooth multitasking and fast data access. Its 14" WUXGA (1920x1200) anti-glare display delivers 400 nits brightness and 60Hz refresh rate for efficient productivity. Built in a durable black chassis, it includes a 5MP RGB+IR front-facing camera, a backlit keyboard, and wired Ethernet for reliable connectivity. The device runs on Windows 11 Pro, offers Wi-Fi 6E with Bluetooth 5.3, and supports Rapid Charge via a 65W USB-C adapter—making it ideal for professionals needing high performance on the go.\n	{"depth": "226.9 mm", "ports": "2x USB-A 3.2 Gen 1, 2x USB-C (including Thunderbolt 4), HDMI 2.1, Ethernet, 3.5mm audio jack", "width": "317.7 mm", "height": "18.0 mm", "max_mp": "5MP", "memory": "32GB", "weight": "1.32 kg", "display": "14\\" WUXGA", "graphics": "Integrated Intel Graphics", "processor": "Intel Core Ultra 7 155U", "dimensions": "317.7 x 226.9 x 18.0 mm", "resolution": "1920 x 1200", "year_model": 2024, "screen_size": "14 inches", "connectivity": "Wi-Fi, Bluetooth 5.3, Wired Ethernet", "front_camera": "5MP", "refresh_rate": "60Hz", "no_of_cameras": 1, "battery_capacity": "52.5Wh", "operating_system": "Windows 11 Pro"}	0197edc3-762f-7776-a63b-6940bfba84c3	0197ede8-ff94-7027-9b0e-b721882b28d4	t	2025-07-09 14:40:17.876956+07	2025-07-09 14:40:17.876956+07	aditya_lukman	aditya_lukman
0197ee26-478e-76e8-a80c-3c46714739e1	Samsung Odyssey Neo G8	32" Odyssey Neo G8 240Hz UHD Curved Gaming Monitor\n	{"ports": "USB 2.0, HDMI", "weight": "8.9kg", "display": "Quantum Matrix Technology", "dimensions": "713.0 X 606.4 X 311.1 inches", "resolution": "3840 X 2160", "year_model": 2022, "screen_size": "32 inches", "refresh_rate": "240fps", "power_consumption": 74}	0197edc1-2036-77f7-b816-3e1b6c74322a	0197ede8-d254-79d9-9ff0-5d528cdd8276	t	2025-07-09 14:47:03.907682+07	2025-07-09 14:47:03.907682+07	aditya_lukman	aditya_lukman
0197ee19-d954-7f10-8dc6-554f8779f6bc	ASUS ROG NUC ULTRA 7	The ASUS ROG NUC (model RNUC14SRKU7168A0I) is a high-performance, compact gaming PC that delivers powerful desktop-class performance in a small form factor. Powered by the latest Intel® Core™ Ultra 7 155H processor (16 cores, 22 threads), and paired with Intel Arc™ integrated graphics, this mini-PC is designed for gamers, content creators, and professionals needing top-tier power in limited space. It features support for up to 64GB of DDR5 RAM, PCIe Gen4 SSD storage, and offers extensive connectivity including Thunderbolt 4, HDMI, DisplayPort, and multiple USB 3.2 ports. The ROG NUC stands out with customizable RGB lighting and the iconic ROG design, optimized for thermal efficiency and silent operation.\n	{"depth": "180 mm", "ports": "2x Thunderbolt 4, 1x HDMI 2.1, 1x DisplayPort 1.4, 6x USB 3.2, 2.5G Ethernet", "width": "180 mm", "height": "50 mm", "memory": "Supports up to 64GB DDR5 (typically configured with 16GB/32GB/64GB options)", "weight": "1.5 kg", "display": "Supports external displays via HDMI, DisplayPort, Thunderbolt", "graphics": "Integrated Intel® Arc™ Graphics", "processor": "Intel® Core™ Ultra 7 155H (E-cores up to 3.80 GHz, P-cores up to 4.80 GHz)", "dimensions": "180 x 180 x 50 mm", "resolution": "Supports up to 4K (external monitors)", "year_model": 2024, "screen_size": "N/A (supports external monitors)", "connectivity": "Wi-Fi 6E, Bluetooth 5.3, Thunderbolt 4, HDMI 2.1, USB 3.2, Ethernet", "refresh_rate": "Supports up to 144Hz (dependent on external display)", "battery_capacity": "N/A (desktop/mini PC)", "operating_system": "Windows 11 Pro (varies by configuration)"}	0197edc5-fd6f-77b0-be3d-9027f5ee89d1	0197ede8-262f-7105-aa3d-34ac9f62186d	t	2025-07-09 14:34:32.321789+07	2025-07-09 14:34:32.321789+07	aditya_lukman	aditya_lukman
\.


--
-- Data for Name: variant; Type: TABLE DATA; Schema: public; Owner: rent_service
--

COPY public.variant (id, name, description, attributes, product_id, status, created_at, updated_at, created_by, updated_by) FROM stdin;
0197ee3f-4751-7ae6-bf15-01ec191df4fe	Plus 8/128GB Platinum	Plus 8/128GB Platinum	{"ram": "8gb", "type": "plus", "color": "platinum", "storage": "128"}	0197ee11-3043-75b5-94b2-d2ed87197e80	t	2025-07-09 15:13:53.69695+07	2025-07-09 15:13:53.69695+07	aditya_lukman	aditya_lukman
0197ee3f-5c53-7aaa-ae81-73f262795b27	Plus 8/128GB Saphire	Plus 8/128GB Saphire	{"ram": "8gb", "type": "plus", "color": "saphire", "storage": "128"}	0197ee11-3043-75b5-94b2-d2ed87197e80	t	2025-07-09 15:13:53.714631+07	2025-07-09 15:13:53.714631+07	aditya_lukman	aditya_lukman
0197ee2a-898d-7b54-a87a-cbfee0a7c535	Plus 8/128GB Black	Plus 8/128GB Black	{"ram": "8gb", "type": "plus", "color": "black", "storage": "128"}	0197ee11-3043-75b5-94b2-d2ed87197e80	t	2025-07-09 15:11:27.451555+07	2025-07-09 15:11:27.451555+07	aditya_lukman	aditya_lukman
0197ee43-98ff-7a3d-ab66-aee9494fcf6f	Elite 16/256GB Black	Elite 16/256GB Black	{"ram": "16gb", "type": "elite", "color": "black", "storage": "256"}	0197ee11-3043-75b5-94b2-d2ed87197e80	t	2025-07-09 15:18:35.516691+07	2025-07-09 15:18:35.516691+07	aditya_lukman	aditya_lukman
0197ee43-ab24-779f-a7dc-151238f634f7	Elite 16/256GB Platinum	Elite 16/256GB Platinum	{"ram": "16gb", "type": "elite", "color": "platinum", "storage": "256"}	0197ee11-3043-75b5-94b2-d2ed87197e80	t	2025-07-09 15:18:35.543922+07	2025-07-09 15:18:35.543922+07	aditya_lukman	aditya_lukman
0197ee43-bc73-70bf-80c4-c01d5a1fafbc	Elite 16/256GB Saphire	Elite 16/256GB Saphire	{"ram": "16gb", "type": "elite", "color": "saphire", "storage": "256"}	0197ee11-3043-75b5-94b2-d2ed87197e80	t	2025-07-09 15:18:35.548305+07	2025-07-09 15:18:35.548305+07	aditya_lukman	aditya_lukman
0197ee43-cf89-74b2-aae6-512606f63a6f	Elite 16/256GB Dune	Elite 16/256GB Dune	{"ram": "16gb", "type": "elite", "color": "dune", "storage": "256"}	0197ee11-3043-75b5-94b2-d2ed87197e80	t	2025-07-09 15:18:35.550709+07	2025-07-09 15:18:35.550709+07	aditya_lukman	aditya_lukman
0197ee51-4683-7b5c-8f00-8299c0a25b90	Nano Glass Pro Stand	Nano Glass Pro Stand	{"glass": "nano", "stand": "pro stand"}	0197ee17-3e93-7ff5-bef6-900756499709	t	2025-07-09 15:36:00.273058+07	2025-07-09 15:36:00.273058+07	aditya_lukman	aditya_lukman
0197ee51-02f4-734b-a2f1-f90eeaee20d2	Standard Glass Non Stand	Standard Glass Non Stand	{"glass": "standard", "stand": "non stand"}	0197ee17-3e93-7ff5-bef6-900756499709	t	2025-07-09 15:36:00.292876+07	2025-07-09 15:33:18.722882+07	aditya_lukman	aditya_lukman
0197ee51-1d3d-74ba-88a0-13fa7be0ba77	Nano Glass Non Stand	Nano Glass Non Stand	{"glass": "standard", "stand": "pro stand"}	0197ee17-3e93-7ff5-bef6-900756499709	t	2025-07-09 15:36:00.296178+07	2025-07-09 15:33:18.745832+07	aditya_lukman	aditya_lukman
0197ee51-326f-7650-a166-88f4b3643d4a	Standard Glass Pro Stand	Standard Glass Pro Stand	{"glass": "nano", "stand": "non stand"}	0197ee17-3e93-7ff5-bef6-900756499709	t	2025-07-09 15:36:00.297217+07	2025-07-09 15:33:18.75086+07	aditya_lukman	aditya_lukman
0197ee59-a233-776e-be71-afc79d75a5b6	1Tb Intel Core Ultra 7 155h Processor	1Tb Intel Core Ultra 7 155h Processor	{"cpu": "Core Ultra 7 155h", "storage": "1tb"}	0197ee19-d954-7f10-8dc6-554f8779f6bc	t	2025-07-09 15:42:39.163568+07	2025-07-09 15:42:39.163568+07	aditya_lukman	aditya_lukman
0197ee59-b3fc-79af-baae-dc0a548e311d	512Gb Intel Core Ultra 9 185h Processor	512Gb Intel Core Ultra 9 185h Processor	{"cpu": "Core Ultra 9 185h", "storage": "512Gb"}	0197ee19-d954-7f10-8dc6-554f8779f6bc	t	2025-07-09 15:42:39.191741+07	2025-07-09 15:42:39.191741+07	aditya_lukman	aditya_lukman
0197ee59-c802-758e-a4ed-c74e10cc4e3f	1tb Intel Core Ultra 9 185h Processor	1tb Intel Core Ultra 9 185h Processor	{"cpu": "Core Ultra 9 185h", "storage": "1tb"}	0197ee19-d954-7f10-8dc6-554f8779f6bc	t	2025-07-09 15:42:39.195909+07	2025-07-09 15:42:39.195909+07	aditya_lukman	aditya_lukman
0197ee61-f6d7-7a05-91e9-b3c1728e8a74	16Gb 512Gb Silver 	16Gb 512Gb Silver 	{"ram": "16gb", "color": "silver", "storage": "512Gb"}	0197ee1d-d2e4-7b90-a495-db284f65f59e	t	2025-07-09 15:52:11.675948+07	2025-07-09 15:52:11.675948+07	aditya_lukman	aditya_lukman
0197ee62-0a78-7cfd-8174-cc0e93ebcbc2	16Gb 512Gb Space Black	16Gb 512Gb Space Black	{"ram": "16gb", "color": "space black", "storage": "512Gb"}	0197ee1d-d2e4-7b90-a495-db284f65f59e	t	2025-07-09 15:52:11.696015+07	2025-07-09 15:52:11.696015+07	aditya_lukman	aditya_lukman
0197ee62-1ff5-72c5-8a5d-df1e507c45ff	24Gb 512Gb Silver	24Gb 512Gb Silver	{"ram": "24gb", "color": "silver", "storage": "512Gb"}	0197ee1d-d2e4-7b90-a495-db284f65f59e	t	2025-07-09 15:52:11.699553+07	2025-07-09 15:52:11.699553+07	aditya_lukman	aditya_lukman
0197ee62-3e76-7830-9d88-65530ca9f835	24Gb 512Gb Space Black	24Gb 512Gb Space Black	{"ram": "24gb", "color": "space black", "storage": "512Gb"}	0197ee1d-d2e4-7b90-a495-db284f65f59e	t	2025-07-09 15:52:11.708181+07	2025-07-09 15:52:11.708181+07	aditya_lukman	aditya_lukman
0197ee62-5217-7e6b-936c-7c534e53997d	16Gb 1tb Silver 	16Gb 1tb Silver 	{"ram": "16gb", "color": "silver", "storage": "1tb"}	0197ee1d-d2e4-7b90-a495-db284f65f59e	t	2025-07-09 15:52:11.710092+07	2025-07-09 15:52:11.710092+07	aditya_lukman	aditya_lukman
0197ee62-674a-7236-ba27-c678cdb80b01	16Gb 1tb Space Black 	16Gb 1tb Space Black 	{"ram": "16gb", "color": "silver", "storage": "1tb"}	0197ee1d-d2e4-7b90-a495-db284f65f59e	t	2025-07-09 15:52:11.71092+07	2025-07-09 15:52:11.71092+07	aditya_lukman	aditya_lukman
0197ee62-7df9-725f-8aba-fb4136b404b9	24Gb 1tb Silver 	24Gb 1tb Silver 	{"ram": "24gb", "color": "silver", "storage": "1tb"}	0197ee1d-d2e4-7b90-a495-db284f65f59e	t	2025-07-09 15:52:11.711601+07	2025-07-09 15:52:11.711601+07	aditya_lukman	aditya_lukman
0197ee62-9205-73d5-a8f3-b65eed5bd1bd	24Gb 1tb Space Black 	24Gb 1tb Space Black 	{"ram": "24gb", "color": "space black", "storage": "1tb"}	0197ee1d-d2e4-7b90-a495-db284f65f59e	t	2025-07-09 15:52:11.712213+07	2025-07-09 15:52:11.712213+07	aditya_lukman	aditya_lukman
0197ee59-4f7a-7e4f-84fd-a9b9f1cf2d2b	512Gb Intel Core Ultra 7 155h Processor	512Gb Intel Core Ultra 7 155h Processor	{"cpu": "Core Ultra 7 155h", "storage": "512Gb"}	0197ee19-d954-7f10-8dc6-554f8779f6bc	t	2025-07-09 15:42:07.946117+07	2025-07-09 15:42:07.946117+07	aditya_lukman	aditya_lukman
0197ee6b-2452-72b6-8ec5-cc38291cf4e9	I7 16Gb 512Gb	I7 16Gb 512Gb	{"ram": "16Gb", "storage": "512Gb", "processor": "Intel Core i7"}	0197ee1f-86d7-7f86-8ae3-7822d28b6722	t	2025-07-09 16:01:50.211827+07	2025-07-09 16:01:50.211827+07	aditya_lukman	aditya_lukman
0197ee6b-3b1f-7253-9457-8c5bdb906e56	I7 32Gb 512Gb	I7 32Gb 512Gb	{"ram": "32Gb", "storage": "512Gb", "processor": "Intel Core i7"}	0197ee1f-86d7-7f86-8ae3-7822d28b6722	t	2025-07-09 16:01:50.263815+07	2025-07-09 16:01:50.263815+07	aditya_lukman	aditya_lukman
0197ee6b-4feb-7e27-a9c2-12d72db39774	I9 16Gb 1tb	I9 16Gb 1tb	{"ram": "16Gb", "storage": "1tb", "processor": "Intel Core i9"}	0197ee1f-86d7-7f86-8ae3-7822d28b6722	t	2025-07-09 16:01:50.267216+07	2025-07-09 16:01:50.267216+07	aditya_lukman	aditya_lukman
0197ee6b-65f7-7f04-899f-4bc16f3f734c	I9 32Gb 1tb	I9 32Gb 1tb	{"ram": "32Gb", "storage": "1tb", "processor": "Intel Core i9"}	0197ee1f-86d7-7f86-8ae3-7822d28b6722	t	2025-07-09 16:01:50.268709+07	2025-07-09 16:01:50.268709+07	aditya_lukman	aditya_lukman
0197ee75-25cd-7a90-88a1-6aa199658a1f	27Inch White	27Inch White	{"color": "white", "screen": "27Inch"}	0197ee28-7fe7-7462-9a68-55858e6a33da	t	2025-07-09 16:12:35.850993+07	2025-07-09 16:12:35.850993+07	aditya_lukman	aditya_lukman
0197ee75-3cb0-7482-b456-49e2389530e8	32Inch White	32Inch White	{"color": "white", "screen": "32Inch"}	0197ee28-7fe7-7462-9a68-55858e6a33da	t	2025-07-09 16:12:35.8866+07	2025-07-09 16:12:35.8866+07	aditya_lukman	aditya_lukman
0197ee72-9b43-7d31-b5f4-59ebb2b0d8ab	27Inch Black	27Inch Black	{"color": "black", "screen": "27Inch"}	0197ee26-478e-76e8-a80c-3c46714739e1	t	2025-07-09 16:12:35.893247+07	2025-07-09 16:09:45.24545+07	aditya_lukman	aditya_lukman
0197ee72-ca8c-71be-951c-dc496f7d72b8	32Inch Black	32Inch Black	{"color": "black", "screen": "32Inch"}	0197ee26-478e-76e8-a80c-3c46714739e1	t	2025-07-09 16:09:55.238793+07	2025-07-09 16:09:55.238793+07	aditya_lukman	aditya_lukman
0197ee3f-70c9-7e33-9fde-0e7ad42b6e7e	Plus 8/128GB Dune	Plus 8/128GB Dune	{"ram": "8gb", "type": "plus", "color": "dune", "storage": "128"}	0197ee11-3043-75b5-94b2-d2ed87197e80	t	2025-07-09 15:13:53.719707+07	2025-07-09 15:13:53.719707+07	aditya_lukman	aditya_lukman
\.


--
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: offer offer_pkey; Type: CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT offer_pkey PRIMARY KEY (id);


--
-- Name: offer offer_sku_no_unique_key; Type: CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT offer_sku_no_unique_key UNIQUE (sku_no);


--
-- Name: offer_period_mapping offers_periode_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.offer_period_mapping
    ADD CONSTRAINT offers_periode_mapping_pkey PRIMARY KEY (period_id, offer_id);


--
-- Name: period periode_pkey; Type: CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.period
    ADD CONSTRAINT periode_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: variant variant_pkey; Type: CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_pkey PRIMARY KEY (id);


--
-- Name: idx_country_id; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_country_id ON public.country USING btree (id);


--
-- Name: idx_offer_status; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_offer_status ON public.offer USING btree (status);


--
-- Name: idx_offer_status_price; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_offer_status_price ON public.offer USING btree (status, discount_price);


--
-- Name: idx_opm_offer_id; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_opm_offer_id ON public.offer_period_mapping USING btree (offer_id);


--
-- Name: idx_opm_period_id; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_opm_period_id ON public.offer_period_mapping USING btree (period_id);


--
-- Name: idx_period_duration; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_period_duration ON public.period USING btree (duration);


--
-- Name: idx_period_id; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_period_id ON public.period USING btree (id);


--
-- Name: idx_period_status; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_period_status ON public.period USING btree (status);


--
-- Name: idx_product_brand_category; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_product_brand_category ON public.product USING btree (brand_id, category_id);


--
-- Name: idx_product_brand_id; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_product_brand_id ON public.product USING btree (brand_id);


--
-- Name: idx_product_category_id; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_product_category_id ON public.product USING btree (category_id);


--
-- Name: idx_product_id; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_product_id ON public.product USING btree (id);


--
-- Name: idx_product_name; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_product_name ON public.product USING btree (name);


--
-- Name: idx_product_status; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_product_status ON public.product USING btree (status);


--
-- Name: idx_variant_id; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_variant_id ON public.variant USING btree (id);


--
-- Name: idx_variant_name; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_variant_name ON public.variant USING btree (name);


--
-- Name: idx_variant_product_id; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_variant_product_id ON public.variant USING btree (product_id);


--
-- Name: idx_variant_status; Type: INDEX; Schema: public; Owner: rent_service
--

CREATE INDEX idx_variant_status ON public.variant USING btree (status);


--
-- Name: category category_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.category(id);


--
-- Name: offer offer_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT offer_region_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- Name: offer offer_variant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT offer_variant_id_fkey FOREIGN KEY (variant_id) REFERENCES public.variant(id);


--
-- Name: offer_period_mapping offers_periode_mapping_offers_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.offer_period_mapping
    ADD CONSTRAINT offers_periode_mapping_offers_id_fkey FOREIGN KEY (offer_id) REFERENCES public.offer(id);


--
-- Name: offer_period_mapping offers_periode_mapping_periode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.offer_period_mapping
    ADD CONSTRAINT offers_periode_mapping_periode_id_fkey FOREIGN KEY (period_id) REFERENCES public.period(id);


--
-- Name: product product_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brand(id);


--
-- Name: product product_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: variant variant_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rent_service
--

ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- PostgreSQL database dump complete
--

