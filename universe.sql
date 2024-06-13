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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    dominant_stars text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    distance integer,
    mass double precision,
    diameter double precision,
    age numeric,
    constellation_id integer,
    discovery_year integer,
    discoverer character varying(100),
    notes text
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
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    mass double precision,
    radius double precision,
    semimajor_axis double precision,
    orbital_period double precision,
    discovery_year integer,
    discoverer character varying(100),
    notes text,
    planet_id integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    mass double precision,
    radius double precision,
    semimajor_axis double precision,
    orbital_period double precision,
    discovery_year integer,
    discoverer character varying(100),
    notes text,
    star_id integer,
    has_atmosphere boolean,
    is_habitable boolean
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
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    spectral_type character varying(10),
    luminosity double precision,
    temperature integer,
    mass double precision,
    radius double precision,
    age numeric,
    galaxy_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'Alpheratz, Mirach, Almach');
INSERT INTO public.constellation VALUES (3, 'Triangulum', 'Mothallah, Rasalhague, Deltotum');
INSERT INTO public.constellation VALUES (4, 'Leo', 'Regulus, Denebola, Algieba');
INSERT INTO public.constellation VALUES (5, 'Canes Venatici', 'Cor Caroli, Chara, La Superba');
INSERT INTO public.constellation VALUES (6, 'Ursa Major', 'Dubhe, Merak, Alkaid');
INSERT INTO public.constellation VALUES (2, 'Milky Way', 'Sun');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Spiral', 2540000, 110, 220000, 13.5, 1, 964, 'Abd al-Rahman al-Sufi', 'Also known as Messier 31');
INSERT INTO public.galaxy VALUES (2, 'Milky Way Galaxy', 'Spiral', 0, 100, 100000, 13.6, 2, NULL, 'Greek astronomers', 'Home to the Solar System');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Spiral', 3000000, 50, 60000, 12, 3, 1784, 'Charles Messier', 'Also known as Messier 33');
INSERT INTO public.galaxy VALUES (4, 'Leo I', 'Dwarf elliptical', 8200000, 0.0003, 2300, 13, 4, 1950, 'Robert Harrington', 'First discovered satellite galaxy of the Milky Way');
INSERT INTO public.galaxy VALUES (5, 'Canes Venatici I', 'Dwarf spheroidal', 2100000, 0.0001, 2500, 13, 5, 2006, 'Pan-STARRS', 'Satellite galaxy of the Milky Way');
INSERT INTO public.galaxy VALUES (6, 'M81', 'Spiral', 12000000, 70, 95000, 12, 1, 1774, 'Johann Elert Bode', 'Also known as Bode''s Galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Natural satellite', 0.0123, 1737.1, 384400, 27.32, -3000, 'Ancient astronomers', 'Earth''s only natural satellite', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Natural satellite', 1.08e-06, 11.1, 9376, 0.3189, 1877, 'Asaph Hall', 'Largest moon of Mars', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Natural satellite', 2.2e-07, 6.2, 23459, 1.263, 1877, 'Asaph Hall', 'Second moon of Mars', 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Natural satellite', 0.025, 2634.1, 1070400, 7.15, 1610, 'Galileo Galilei', 'Largest moon in the Solar System', 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Natural satellite', 0.018, 2408, 1882700, 16.7, 1610, 'Galileo Galilei', 'Second largest moon of Jupiter', 5);
INSERT INTO public.moon VALUES (6, 'Io', 'Natural satellite', 0.015, 1821.6, 421700, 1.77, 1610, 'Galileo Galilei', 'Known for its volcanic activity', 5);
INSERT INTO public.moon VALUES (7, 'Europa', 'Natural satellite', 0.008, 1560.8, 671100, 3.55, 1610, 'Galileo Galilei', 'Believed to have a subsurface ocean', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Natural satellite', 0.0225, 2575, 1221870, 15.95, 1655, 'Christiaan Huygens', 'Largest moon of Saturn', 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Natural satellite', 0.00095, 763.8, 527040, 4.52, 1672, 'Giovanni Domenico Cassini', 'Second largest moon of Saturn', 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Natural satellite', 0.00062, 734.5, 3560820, 79.33, 1671, 'Giovanni Domenico Cassini', 'Known for its two-tone coloration', 6);
INSERT INTO public.moon VALUES (11, 'Proteus', 'Natural satellite', 2.1e-06, 210, 117647, 1.12, 1989, 'Voyager 2', 'The second largest moon of Neptune', 7);
INSERT INTO public.moon VALUES (12, 'Charon', 'Natural satellite', 0.000254, 606, 19591, 6.39, 1978, 'James Christy', 'Largest moon of Pluto', 8);
INSERT INTO public.moon VALUES (13, 'Nereid', 'Natural satellite', 4e-08, 170, 5513812, 360.14, 1949, 'Gerard Kuiper', 'Second moon of Neptune by distance from the planet', 7);
INSERT INTO public.moon VALUES (14, 'Miranda', 'Natural satellite', 7e-07, 235.8, 129390, 1.41, 1948, 'Gerard Kuiper', 'The smallest and innermost of Uranus''s five major moons', 8);
INSERT INTO public.moon VALUES (15, 'Ariel', 'Natural satellite', 0.0006, 578.9, 191020, 2.52, 1851, 'William Lassell', 'One of the five major moons of Uranus', 8);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'Natural satellite', 0.00045, 584.7, 266300, 4.14, 1851, 'William Lassell', 'One of the five major moons of Uranus', 8);
INSERT INTO public.moon VALUES (17, 'Titania', 'Natural satellite', 0.0006, 788.9, 435910, 8.71, 1787, 'William Herschel', 'Largest moon of Uranus', 8);
INSERT INTO public.moon VALUES (18, 'Oberon', 'Natural satellite', 0.0005, 761.4, 583520, 13.46, 1787, 'William Herschel', 'Second largest moon of Uranus', 8);
INSERT INTO public.moon VALUES (19, 'Dione', 'Natural satellite', 0.0005, 561.4, 377396, 2.74, 1684, 'Giovanni Domenico Cassini', 'Fourth-largest moon of Saturn', 6);
INSERT INTO public.moon VALUES (20, 'Triton', 'Natural satellite', 0.0036, 1353.4, 354759, 5.876, -1846, 'William Lassell', 'Largest moon of Neptune', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 0.055, 0.383, 0.39, 87.97, -3000, 'Ancient astronomers', 'Closest planet to the Sun', 1, false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 0.815, 0.95, 0.72, 224.7, -3000, 'Ancient astronomers', 'Known for its thick atmosphere', 1, true, false);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 1, 1, 1, 365.25, -3000, 'Ancient astronomers', 'Home to humanity', 1, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 0.107, 0.532, 1.52, 687, -1600, 'Galileo Galilei', 'Known as the Red Planet', 1, true, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 317.8, 11.2, 5.2, 4331, 1610, 'Galileo Galilei', 'Largest planet in the Solar System', 2, true, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 95.2, 9.45, 9.58, 10747, 1610, 'Galileo Galilei', 'Known for its prominent rings', 2, true, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 14.6, 4.01, 19.22, 30660, 1781, 'William Herschel', 'Tilted on its side', 2, true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 17.2, 3.88, 30.05, 60190, 1846, 'Urbain Le Verrier, John Couch Adams', 'Discovered through mathematical predictions', 2, true, false);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 'Terrestrial', NULL, NULL, 1.05, 384.84, 2015, 'Kepler space telescope', 'Potentially habitable exoplanet', 3, true, true);
INSERT INTO public.planet VALUES (10, 'HD 189733b', 'Gas Giant', NULL, NULL, 0.031, 2.22, 2005, 'Transit method', 'Known for its deep blue color', 3, true, false);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 'Terrestrial', NULL, NULL, 0.0282, 4.05, 2017, 'Transit method', 'Part of the TRAPPIST-1 system', 3, true, true);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 'Terrestrial', NULL, NULL, 0.146, 36.6, 2010, 'Radial velocity method', 'Located in the habitable zone of its star', 3, true, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 1, 5778, 1, 1, 4.6, 2);
INSERT INTO public.star VALUES (2, 'Sirius', 'A1V', 25.4, 9940, 2.06, 1.71, 0.24, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'G2V', 1.52, 5790, 1.1, 1.2, 6.3, 2);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'K1V', 0.5, 5260, 0.907, 0.863, 6.3, 2);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'M5.5V', 0.0017, 2550, 0.123, 0.141, 4.85, 2);
INSERT INTO public.star VALUES (6, 'Vega', 'A0V', 40.12, 9602, 2.15, 2.362, 0.455, 2);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: constellation unique_name_constellation; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: star unique_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- PostgreSQL database dump complete
--

