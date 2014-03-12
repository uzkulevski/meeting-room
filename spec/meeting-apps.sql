--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: area; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE area (
    area_id integer NOT NULL,
    area_nama character varying(50),
    status integer
);


ALTER TABLE public.area OWNER TO admin;

--
-- Name: COLUMN area.status; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN area.status IS '1 = available, 2 = maintenance, 3 = disabled';


--
-- Name: facility; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE facility (
    fac_id integer NOT NULL,
    facility character varying(30),
    status_id integer
);


ALTER TABLE public.facility OWNER TO admin;

--
-- Name: room; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE room (
    room_id integer NOT NULL,
    area_id integer,
    capacity integer,
    status_id integer,
    name character varying(30)
);


ALTER TABLE public.room OWNER TO admin;

--
-- Name: schedule; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE schedule (
    schedule_id integer NOT NULL,
    title character varying(100),
    start_date date,
    start_time time without time zone,
    end_date date,
    end_time time without time zone,
    status_id integer,
    bookers integer
);


ALTER TABLE public.schedule OWNER TO admin;

--
-- Name: status; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE status (
    status_id integer NOT NULL,
    status character varying(30)
);


ALTER TABLE public.status OWNER TO admin;

--
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY area (area_id, area_nama, status) FROM stdin;
\.


--
-- Data for Name: facility; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY facility (fac_id, facility, status_id) FROM stdin;
\.


--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY room (room_id, area_id, capacity, status_id, name) FROM stdin;
\.


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY schedule (schedule_id, title, start_date, start_time, end_date, end_time, status_id, bookers) FROM stdin;
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY status (status_id, status) FROM stdin;
1	Available
2	Maintenance
3	Disabled
4	Booked
5	cancel
\.


--
-- Name: area_pkey; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY area
    ADD CONSTRAINT area_pkey PRIMARY KEY (area_id);


--
-- Name: facility_pkey; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY facility
    ADD CONSTRAINT facility_pkey PRIMARY KEY (fac_id);


--
-- Name: room_pkey; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY room
    ADD CONSTRAINT room_pkey PRIMARY KEY (room_id);


--
-- Name: schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (schedule_id);


--
-- Name: status_pkey; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY status
    ADD CONSTRAINT status_pkey PRIMARY KEY (status_id);


--
-- Name: fk_area; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY room
    ADD CONSTRAINT fk_area FOREIGN KEY (area_id) REFERENCES area(area_id);


--
-- Name: fk_status; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY room
    ADD CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES status(status_id);


--
-- Name: fk_status; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY facility
    ADD CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES status(status_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: admin
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM admin;
GRANT ALL ON SCHEMA public TO admin;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

