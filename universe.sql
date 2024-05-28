--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(20),
    description text,
    age_in_millions_of_years integer,
    galaxy_types character varying(15),
    has_life boolean NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(20),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth_in_light_yrs integer,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    volume_in_earths numeric(5,2) NOT NULL,
    density_in_gpercm3 numeric(3,2),
    temperature_in_k integer,
    name character varying(30),
    more_info_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(20),
    age_in_millions_of_years integer,
    planet_types character varying(20),
    distance_from_earth_in_light_yrs numeric(4,1),
    has_life boolean,
    star_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(50),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('milky way', 'The Milky Way is the galaxy that includes the Solar System', 13610, 'spiral', true, 1);
INSERT INTO public.galaxy VALUES ('andromeda', 'Closest to the Milky Way', 8000, 'spiral', false, 2);
INSERT INTO public.galaxy VALUES ('large magellanic', 'Satellites the Milky Way', 11010, 'dwarf irregular', false, 3);
INSERT INTO public.galaxy VALUES ('cartwheel', 'The Cartwheel Galaxy is a lenticular ring galaxy', 400, 'Lenticular', false, 4);
INSERT INTO public.galaxy VALUES ('sombrero', 'The Sombrero Galaxy is a peculiar galaxy of unclear classification.', 13250, 'spiral', false, 5);
INSERT INTO public.galaxy VALUES ('whirlpool', 'an interacting grand-design spiral galaxy', 400, 'spiral', false, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('moon', false, true, 44600, 0, 1, 1);
INSERT INTO public.moon VALUES ('phobos', false, true, 45030, 0, 2, 2);
INSERT INTO public.moon VALUES ('deimos', false, true, 45030, 0, 3, 2);
INSERT INTO public.moon VALUES ('titania', false, true, 46000, 0, 4, 3);
INSERT INTO public.moon VALUES ('ariel', false, true, 100, 0, 5, 3);
INSERT INTO public.moon VALUES ('setebos', false, true, NULL, 0, 6, 3);
INSERT INTO public.moon VALUES ('oberon', false, true, NULL, 0, 7, 3);
INSERT INTO public.moon VALUES ('miranda', false, true, 35000, 0, 8, 3);
INSERT INTO public.moon VALUES ('trinculo', false, true, NULL, 0, 9, 3);
INSERT INTO public.moon VALUES ('umbriel', false, true, NULL, 0, 10, 3);
INSERT INTO public.moon VALUES ('puck', false, true, NULL, 0, 11, 3);
INSERT INTO public.moon VALUES ('sycorax', false, true, 0, 0, 12, 3);
INSERT INTO public.moon VALUES ('titan', false, true, 40030, 0, 13, 4);
INSERT INTO public.moon VALUES ('enceladus', false, true, NULL, 0, 14, 4);
INSERT INTO public.moon VALUES ('mimas', false, true, NULL, 0, 15, 4);
INSERT INTO public.moon VALUES ('lapetus', false, true, 45640, 0, 16, 4);
INSERT INTO public.moon VALUES ('tethys', false, true, 45600, 0, 17, 4);
INSERT INTO public.moon VALUES ('hyperion', false, true, NULL, 0, 18, 4);
INSERT INTO public.moon VALUES ('epimetheus', false, true, 40000, 0, 19, 4);
INSERT INTO public.moon VALUES ('telesto', false, true, NULL, 0, 20, 4);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1.00, 5.51, 255, 'earth', 1, 1);
INSERT INTO public.more_info VALUES (0.15, 3.93, 209, 'mars', 2, 2);
INSERT INTO public.more_info VALUES (63.10, 1.27, 49, 'uranus', 3, 3);
INSERT INTO public.more_info VALUES (763.60, 0.69, 134, 'saturn', 4, 4);
INSERT INTO public.more_info VALUES (0.90, 5.24, 232, 'venus', 5, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('earth', 45430, 'terrestrial', NULL, true, 1, 1);
INSERT INTO public.planet VALUES ('mars', 46030, 'terrestrial', 0.0, false, 1, 2);
INSERT INTO public.planet VALUES ('uranus', 45030, 'ice giant', 0.0, false, 1, 3);
INSERT INTO public.planet VALUES ('saturn', 45030, 'gas giant', 0.0, false, 1, 4);
INSERT INTO public.planet VALUES ('neptune', 45030, 'ice giant', 0.0, false, 1, 5);
INSERT INTO public.planet VALUES ('mercury', 45030, 'terrestrial', 0.0, false, 1, 6);
INSERT INTO public.planet VALUES ('jupiter', 46030, 'gas giant', 0.0, false, 1, 7);
INSERT INTO public.planet VALUES ('venus', 45030, 'terrestrial', 0.0, false, 1, 8);
INSERT INTO public.planet VALUES ('YZ Ceti b', 5000, 'terrestrial', 12.0, false, 7, 9);
INSERT INTO public.planet VALUES ('YZ ceti C', 5000, 'exoplanet', 12.0, false, 7, 10);
INSERT INTO public.planet VALUES ('YZ ceti d', 5000, 'exoplanet', 12.0, false, 7, 11);
INSERT INTO public.planet VALUES ('proxima centauri d', 4850, 'exoplanet', 4.0, false, 8, 12);
INSERT INTO public.planet VALUES ('proxima centauri b', 4850, 'exoplanet', 4.0, false, 8, 13);
INSERT INTO public.planet VALUES ('proxima centauri c', 4850, 'exoplanet', 4.0, false, 8, 14);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('sun', false, true, 46030, 1, 1);
INSERT INTO public.star VALUES ('Alpheratz', false, false, 447, 2, 2);
INSERT INTO public.star VALUES ('R71', false, false, NULL, 3, 3);
INSERT INTO public.star VALUES ('Betelegeuse', false, false, 10, 4, 1);
INSERT INTO public.star VALUES ('Nembus', false, false, NULL, 5, 2);
INSERT INTO public.star VALUES ('antares', false, false, 12, 6, 1);
INSERT INTO public.star VALUES ('YZ ceti', false, false, 5000, 7, 1);
INSERT INTO public.star VALUES ('proxima centauri', false, false, 4850, 8, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_more_info_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_more_info_id_key UNIQUE (more_info_id);


--
-- Name: more_info more_info_more_info_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_more_info_id_key1 UNIQUE (more_info_id);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: more_info more_info_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

