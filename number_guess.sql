--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE highscore;
--
-- Name: highscore; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE highscore WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE highscore OWNER TO freecodecamp;

\connect highscore

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
-- Name: usernames; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usernames (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.usernames OWNER TO freecodecamp;

--
-- Name: usernames_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.usernames_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usernames_user_id_seq OWNER TO freecodecamp;

--
-- Name: usernames_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.usernames_user_id_seq OWNED BY public.usernames.user_id;


--
-- Name: usernames user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames ALTER COLUMN user_id SET DEFAULT nextval('public.usernames_user_id_seq'::regclass);


--
-- Data for Name: usernames; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usernames VALUES (19, 'user_1675767619034', 2, 660);
INSERT INTO public.usernames VALUES (9, 'Damian', 3, 11);
INSERT INTO public.usernames VALUES (18, 'user_1675767619035', 5, 418);
INSERT INTO public.usernames VALUES (11, 'user_1675767238826', 2, 254);
INSERT INTO public.usernames VALUES (10, 'user_1675767238827', 5, 219);
INSERT INTO public.usernames VALUES (21, 'user_1675767625138', 2, 101);
INSERT INTO public.usernames VALUES (13, 'user_1675767357199', 2, 552);
INSERT INTO public.usernames VALUES (20, 'user_1675767625139', 5, 118);
INSERT INTO public.usernames VALUES (12, 'user_1675767357200', 5, 337);
INSERT INTO public.usernames VALUES (15, 'user_1675767487493', 2, 331);
INSERT INTO public.usernames VALUES (14, 'user_1675767487494', 5, 158);
INSERT INTO public.usernames VALUES (17, 'user_1675767535451', 2, 271);
INSERT INTO public.usernames VALUES (16, 'user_1675767535452', 5, 321);


--
-- Name: usernames_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.usernames_user_id_seq', 21, true);


--
-- Name: usernames usernames_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames
    ADD CONSTRAINT usernames_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

