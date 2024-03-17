
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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size numeric NOT NULL,
    orbit_radius numeric NOT NULL,
    description text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
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
    diameter numeric NOT NULL,
    num_stars integer NOT NULL,
    num_planets integer NOT NULL,
    num_moons integer NOT NULL
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
    diameter numeric NOT NULL,
    distance_from_planet numeric NOT NULL,
    is_inhabited boolean NOT NULL,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    radius numeric NOT NULL,
    mass numeric NOT NULL,
    is_habitable boolean NOT NULL,
    star_id integer NOT NULL,
    description text
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
    temperature integer NOT NULL,
    mass numeric NOT NULL,
    luminosity numeric NOT NULL,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, 413.8, 'Ceres is the largest object in the asteroid belt between Mars and Jupiter.');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 356, 'Vesta is the second-largest object in the asteroid belt.');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 600, 543.9, 'One of the largest asteroids in the asteroid belt.');


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'The Orion constellation is one of the most recognizable constellations in the night sky.');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'Ursa Major, also known as the Great Bear, is a prominent constellation visible throughout the year.');
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 'A queen in Greek mythology, known for her vanity and her punishment by Poseidon.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 200, 500, 1000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, 300, 600, 120);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 80000, 50, 200, 50);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 70000, 40, 150, 30);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 60000, 30, 100, 20);
INSERT INTO public.galaxy VALUES (7, 'Black Eye', 50000, 20, 70, 10);
INSERT INTO public.galaxy VALUES (8, 'Sombrero', 40000, 15, 50, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3475, 384400, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 22.2, 9377, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 12.4, 23460, false, 2);
INSERT INTO public.moon VALUES (15, 'Europa', 3121, 671034, false, 3);
INSERT INTO public.moon VALUES (16, 'Ganymede', 5268, 1070412, false, 3);
INSERT INTO public.moon VALUES (17, 'Titan', 5150, 1221870, false, 5);
INSERT INTO public.moon VALUES (18, 'Triton', 2707.2, 354759, false, 6);
INSERT INTO public.moon VALUES (19, 'Charon', 1212, 19591, false, 7);
INSERT INTO public.moon VALUES (22, 'Io', 3637.4, 421700, false, 5);
INSERT INTO public.moon VALUES (23, 'Callisto', 4820, 1882709, false, 3);
INSERT INTO public.moon VALUES (24, 'Rhea', 764.3, 527068, false, 6);
INSERT INTO public.moon VALUES (25, 'Iapetus', 1436, 3560820, false, 6);
INSERT INTO public.moon VALUES (26, 'Nix', 23, 48694, false, 23);
INSERT INTO public.moon VALUES (27, 'Hydra', 30, 64738, false, 23);
INSERT INTO public.moon VALUES (28, 'Kerberos', 12, 57783, false, 23);
INSERT INTO public.moon VALUES (29, 'Styx', 10, 42378, false, 23);
INSERT INTO public.moon VALUES (30, 'Proteus', 418, 117647, false, 6);
INSERT INTO public.moon VALUES (31, 'Larissa', 194, 73548, false, 22);
INSERT INTO public.moon VALUES (32, 'Miranda', 235.8, 129900, false, 22);
INSERT INTO public.moon VALUES (33, 'Ariel', 578.9, 191020, false, 22);
INSERT INTO public.moon VALUES (34, 'Umbriel', 584.7, 266000, false, 22);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 6371, 5972000000000000000000000, true, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 3389.5, 639000000000000000000000, true, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Kepler-452b', 24000, 5000000000000000000000000, false, 2, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 69911, 1898000000000000000000000000, false, 1, 'The largest planet in the Solar System and the fifth planet from the Sun.');
INSERT INTO public.planet VALUES (6, 'Saturn', 58232, 568300000000000000000000000, false, 2, 'The sixth planet from the Sun and the second-largest in the Solar System, after Jupiter.');
INSERT INTO public.planet VALUES (7, 'Uranus', 25362, 86810000000000000000000000, false, 2, 'The seventh planet from the Sun. It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System.');
INSERT INTO public.planet VALUES (20, 'Mercury', 2439.7, 330220000000000000000000, false, 1, 'The smallest and innermost planet in the Solar System.');
INSERT INTO public.planet VALUES (21, 'Venus', 6051.8, 4867000000000000000000000, false, 1, 'The second planet from the Sun. It is named after the Roman goddess of love and beauty.');
INSERT INTO public.planet VALUES (22, 'Neptune', 24622, 102400000000000000000000000, false, 2, 'The eighth and farthest-known Solar planet from the Sun in the Solar System.');
INSERT INTO public.planet VALUES (23, 'Pluto', 1188.3, 13030000000000000000000, false, 1, 'A dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune.');
INSERT INTO public.planet VALUES (24, 'Kepler-22b', 35752, 19000000000000000000000000, false, 3, 'An exoplanet orbiting within the habitable zone of the Sun-like star Kepler-22.');
INSERT INTO public.planet VALUES (25, 'HD 189733b', 105000, 1138000000000000000000000000, false, 5, 'An extrasolar planet approximately 63 light-years away from Earth in the constellation of Vulpecula.');
INSERT INTO public.planet VALUES (26, '55 Cancri e', 38757, 8630000000000000000000000, false, 6, 'A super-Earth exoplanet orbiting in the inner regions of its planetary system.');
INSERT INTO public.planet VALUES (27, 'K2-18b', 12207, 7840000000000000000000000, true, 7, 'An exoplanet orbiting the red dwarf K2-18, about 124 light-years from Earth.');
INSERT INTO public.planet VALUES (28, 'TRAPPIST-1d', 7792, 3980000000000000000000000, true, 8, 'An exoplanet in the TRAPPIST-1 system, located about 39 light-years away from Earth.');
INSERT INTO public.planet VALUES (29, 'Proxima Centauri b', 5990, 1170000000000000000000000, true, 3, 'An exoplanet orbiting in the habitable zone of the red dwarf star Proxima Centauri.');
INSERT INTO public.planet VALUES (30, 'Gliese 581d', 15500, 56000000000000000000000000, true, 3, 'A potentially habitable exoplanet in the Gliese 581 system, about 20.3 light-years from Earth.');
INSERT INTO public.planet VALUES (31, 'Kepler-186f', 8750, 5000000000000000000000000, true, 3, 'An exoplanet orbiting within the habitable zone of the red dwarf star Kepler-186, about 582 light-years from Earth.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5778, 1989000000000000000000000000000, 382800000000000000000000000, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 9940, 2020000000000000000000000000000, 2540000000000000000000000000, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 5790, 2180000000000000000000000000000, 484000000000000000000000000, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 3600, 15000000000000000000000000000000, 100000000000000000000000000000000, 1);
INSERT INTO public.star VALUES (6, 'Vega', 9600, 2150000000000000000000000000000, 4012000000000000000000000000, 2);
INSERT INTO public.star VALUES (7, 'Polaris', 6000, 5400000000000000000000000000000, 43000000000000000000000000, 2);
INSERT INTO public.star VALUES (8, 'Deneb', 8200, 19000000000000000000000000000000, 20000000000000000000000000000000, 2);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 34, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 31, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- PostgreSQL database dump complete
--





