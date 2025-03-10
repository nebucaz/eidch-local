--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8 (Debian 15.8-1.pgdg120+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-03-10 14:58:44 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3372 (class 1262 OID 16384)
-- Name: base-registry-db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "base-registry-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "base-registry-db" OWNER TO postgres;

\connect -reuse-previous=on "dbname='base-registry-db'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16397)
-- Name: data; Type: SCHEMA; Schema: -; Owner: base_registry
--

CREATE SCHEMA data;


ALTER SCHEMA data OWNER TO base_registry;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16407)
-- Name: datastore_entity; Type: TABLE; Schema: data; Owner: base_registry
--

CREATE TABLE data.datastore_entity (
    id uuid NOT NULL,
    status character varying(20)
);


ALTER TABLE data.datastore_entity OWNER TO base_registry;

--
-- TOC entry 218 (class 1259 OID 16413)
-- Name: did_entity; Type: TABLE; Schema: data; Owner: base_registry
--

CREATE TABLE data.did_entity (
    id bigint NOT NULL,
    base_id uuid NOT NULL,
    file_type character varying(50),
    read_uri character varying(500),
    content text
);


ALTER TABLE data.did_entity OWNER TO base_registry;

--
-- TOC entry 217 (class 1259 OID 16412)
-- Name: did_entity_id_seq; Type: SEQUENCE; Schema: data; Owner: base_registry
--

ALTER TABLE data.did_entity ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME data.did_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16398)
-- Name: flyway_schema_history; Type: TABLE; Schema: data; Owner: base_registry
--

CREATE TABLE data.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE data.flyway_schema_history OWNER TO base_registry;

--
-- TOC entry 3364 (class 0 OID 16407)
-- Dependencies: 216
-- Data for Name: datastore_entity; Type: TABLE DATA; Schema: data; Owner: base_registry
--

INSERT INTO data.datastore_entity VALUES ('d3a1207e-28d8-4bcb-9827-2531080b6bd6', 'SETUP');
INSERT INTO data.datastore_entity VALUES ('4dddb9eb-a92f-43a4-bd3b-ed9905b59e9c', 'SETUP');
INSERT INTO data.datastore_entity VALUES ('1dce1586-f683-45b8-954b-d894439a8103', 'SETUP');
INSERT INTO data.datastore_entity VALUES ('48afa9cb-c671-4f30-8230-4f89213f1dc2', 'SETUP');
INSERT INTO data.datastore_entity VALUES ('0e1ec926-870a-4608-9842-e88e95ab237a', 'SETUP');
INSERT INTO data.datastore_entity VALUES ('98c5811f-92ad-4aac-af96-6fa331d5b424', 'SETUP');
INSERT INTO data.datastore_entity VALUES ('c19d6adc-357a-4a23-bce8-204b486a40f8', 'SETUP');
INSERT INTO data.datastore_entity VALUES ('9a96145e-bff4-4776-b27e-4f6412932d28', 'SETUP');
INSERT INTO data.datastore_entity VALUES ('0348200d-8dfb-40ef-a4e2-6b6e0beabcff', 'SETUP');
INSERT INTO data.datastore_entity VALUES ('fc77943b-74a4-4af4-a131-3032d382a242', 'ACTIVE');
INSERT INTO data.datastore_entity VALUES ('2b7580d8-2063-483d-8da5-4cce6fd681b5', 'SETUP');
INSERT INTO data.datastore_entity VALUES ('28d98e40-2ee3-4bd7-98f6-9218336a494a', 'ACTIVE');
INSERT INTO data.datastore_entity VALUES ('fa21ffbd-7bc3-4ecd-82e4-339a5698f451', 'ACTIVE');
INSERT INTO data.datastore_entity VALUES ('7a7571b3-ada9-443c-a19b-9e221d3f914b', 'ACTIVE');
INSERT INTO data.datastore_entity VALUES ('0eb031ca-c777-4102-ae20-dcd42774c6d7', 'ACTIVE');
INSERT INTO data.datastore_entity VALUES ('9064820f-ca0a-4a86-9903-0358197d14fa', 'ACTIVE');
INSERT INTO data.datastore_entity VALUES ('fc56fb99-06f2-49b5-9e33-8caf9ccb4dcf', 'ACTIVE');
INSERT INTO data.datastore_entity VALUES ('1ef920d9-3e83-48de-9871-dcf679a13a91', 'ACTIVE');
INSERT INTO data.datastore_entity VALUES ('301c5fbe-1c76-4d64-a885-6158fb0b92ff', 'ACTIVE');
INSERT INTO data.datastore_entity VALUES ('5c741243-dc32-4d02-aecc-dc97f4986cc0', 'ACTIVE');
INSERT INTO data.datastore_entity VALUES ('cfda585f-a963-43b0-8247-7d8188c53a1e', 'ACTIVE');
INSERT INTO data.datastore_entity VALUES ('665d6c52-92d6-46a7-bc8e-23dc96881912', 'ACTIVE');
INSERT INTO data.datastore_entity VALUES ('123ac2ee-57b5-4973-a72f-92f502dda07e', 'ACTIVE');


--
-- TOC entry 3366 (class 0 OID 16413)
-- Dependencies: 218
-- Data for Name: did_entity; Type: TABLE DATA; Schema: data; Owner: base_registry
--

INSERT INTO data.did_entity OVERRIDING SYSTEM VALUE VALUES (1, 'fc77943b-74a4-4af4-a131-3032d382a242', 'DID_TDW', 'http://localhost:8190/api/v1/did/fc77943b-74a4-4af4-a131-3032d382a242', '["1-Qma6g64kaj3q4CSNvrGpHpThDmU42zAYA49YTgyMrfYKEV","2025-03-07T13:12:44Z",{"method":"did:tdw:0.3","scid":"QmYnfQsUqzxyQg5w455VecLkHi5KZnfazQqYkNhPGs2hCN","updateKeys":["z6MkedCqmqVFzYiPXnQovPpcdmHL5JuxnYarsMQ9821ua4jR"]},{"value":{"@context":["https://www.w3.org/ns/did/v1","https://w3id.org/security/suites/jws-2020/v1"],"id":"did:tdw:QmYnfQsUqzxyQg5w455VecLkHi5KZnfazQqYkNhPGs2hCN:localhost%3A8190:api:v1:did:fc77943b-74a4-4af4-a131-3032d382a242","authentication":["did:tdw:QmYnfQsUqzxyQg5w455VecLkHi5KZnfazQqYkNhPGs2hCN:localhost%3A8190:api:v1:did:fc77943b-74a4-4af4-a131-3032d382a242#auth-key-01"],"assertionMethod":["did:tdw:QmYnfQsUqzxyQg5w455VecLkHi5KZnfazQqYkNhPGs2hCN:localhost%3A8190:api:v1:did:fc77943b-74a4-4af4-a131-3032d382a242#assert-key-01"],"verificationMethod":[{"id":"did:tdw:QmYnfQsUqzxyQg5w455VecLkHi5KZnfazQqYkNhPGs2hCN:localhost%3A8190:api:v1:did:fc77943b-74a4-4af4-a131-3032d382a242#auth-key-01","controller":"did:tdw:QmYnfQsUqzxyQg5w455VecLkHi5KZnfazQqYkNhPGs2hCN:localhost%3A8190:api:v1:did:fc77943b-74a4-4af4-a131-3032d382a242","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"G2Mub3dvMXhS9DfGpkB2bT_anUXeVwhc6dGmeKxYBTs","y":"6P3WmN8Bn6lj4uVaEiybxXu4Qe7rQhbrD5Qn5aN4N0E","kid":"auth-key-01"}},{"id":"did:tdw:QmYnfQsUqzxyQg5w455VecLkHi5KZnfazQqYkNhPGs2hCN:localhost%3A8190:api:v1:did:fc77943b-74a4-4af4-a131-3032d382a242#assert-key-01","controller":"did:tdw:QmYnfQsUqzxyQg5w455VecLkHi5KZnfazQqYkNhPGs2hCN:localhost%3A8190:api:v1:did:fc77943b-74a4-4af4-a131-3032d382a242","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"BUWhfv-b6SjTLBqbPJdTKxzQHCvSegCbIJ6ErmgGdrg","y":"bBNd-7XHXPu3OGrPRaSfMghKrSv2Zo8ypee_gw2kzDM","kid":"assert-key-01"}}]}},[{"type":"DataIntegrityProof","cryptosuite":"eddsa-jcs-2022","created":"2025-03-07T13:12:44Z","verificationMethod":"did:key:z6MkedCqmqVFzYiPXnQovPpcdmHL5JuxnYarsMQ9821ua4jR#z6MkedCqmqVFzYiPXnQovPpcdmHL5JuxnYarsMQ9821ua4jR","proofPurpose":"authentication","challenge":"1-Qma6g64kaj3q4CSNvrGpHpThDmU42zAYA49YTgyMrfYKEV","proofValue":"z3VUC3mu3SWsavWE3TWQkmqPGNcg7z45m7Vz8QZhSavgKhn6gRsncSV74t9ernRZn1ABb5obxWvgrqWoKLdJHHXe"}]]');
INSERT INTO data.did_entity OVERRIDING SYSTEM VALUE VALUES (2, '28d98e40-2ee3-4bd7-98f6-9218336a494a', 'DID_TDW', 'http://localhost:8190/api/v1/did/28d98e40-2ee3-4bd7-98f6-9218336a494a', '''["1-QmdibUtAofYtxM3DtztuJSegzpqEatLrvGYtxtiZY3zmfP","2025-03-07T13:26:34Z",{"method":"did:tdw:0.3","scid":"QmTCAQZoUR2XV1D5Jve8Mbit34YeRB6L2gQwHEcwrgYRzH","updateKeys":["z6MkjnWRgWcvoghGSH3npYWJhziF4rfi8AmNvmB8eajNKneW"]},{"value":{"@context":["https://www.w3.org/ns/did/v1","https://w3id.org/security/suites/jws-2020/v1"],"id":"did:tdw:QmTCAQZoUR2XV1D5Jve8Mbit34YeRB6L2gQwHEcwrgYRzH:localhost%3A8190:api:v1:did:28d98e40-2ee3-4bd7-98f6-9218336a494a","authentication":["did:tdw:QmTCAQZoUR2XV1D5Jve8Mbit34YeRB6L2gQwHEcwrgYRzH:localhost%3A8190:api:v1:did:28d98e40-2ee3-4bd7-98f6-9218336a494a#auth-key-01"],"assertionMethod":["did:tdw:QmTCAQZoUR2XV1D5Jve8Mbit34YeRB6L2gQwHEcwrgYRzH:localhost%3A8190:api:v1:did:28d98e40-2ee3-4bd7-98f6-9218336a494a#assert-key-01"],"verificationMethod":[{"id":"did:tdw:QmTCAQZoUR2XV1D5Jve8Mbit34YeRB6L2gQwHEcwrgYRzH:localhost%3A8190:api:v1:did:28d98e40-2ee3-4bd7-98f6-9218336a494a#auth-key-01","controller":"did:tdw:QmTCAQZoUR2XV1D5Jve8Mbit34YeRB6L2gQwHEcwrgYRzH:localhost%3A8190:api:v1:did:28d98e40-2ee3-4bd7-98f6-9218336a494a","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"g2116xuquU09KjwZ9tsoGEoRJ2y1fsZCPuMK9-Rsw4Q","y":"7vl_rcNUZMntgKX4u2JcKeWvamXFZE4PR2oHSuhWMyc","kid":"auth-key-01"}},{"id":"did:tdw:QmTCAQZoUR2XV1D5Jve8Mbit34YeRB6L2gQwHEcwrgYRzH:localhost%3A8190:api:v1:did:28d98e40-2ee3-4bd7-98f6-9218336a494a#assert-key-01","controller":"did:tdw:QmTCAQZoUR2XV1D5Jve8Mbit34YeRB6L2gQwHEcwrgYRzH:localhost%3A8190:api:v1:did:28d98e40-2ee3-4bd7-98f6-9218336a494a","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"FsuwLgEbmm34ibnTVHFWc5r5En4rjjmxn0nLBo86cwM","y":"N4rJVbx-1MDAWL3bTtjZ4tS-SiCuno0qRY1DbaL88yg","kid":"assert-key-01"}}]}},[{"type":"DataIntegrityProof","cryptosuite":"eddsa-jcs-2022","created":"2025-03-07T13:26:34Z","verificationMethod":"did:key:z6MkjnWRgWcvoghGSH3npYWJhziF4rfi8AmNvmB8eajNKneW#z6MkjnWRgWcvoghGSH3npYWJhziF4rfi8AmNvmB8eajNKneW","proofPurpose":"authentication","challenge":"1-QmdibUtAofYtxM3DtztuJSegzpqEatLrvGYtxtiZY3zmfP","proofValue":"z5aK1YgRjkPGUv7TBzWksRLKYA7A4kiw3mNBKfAc3gvsjhSx72CMZQhjY5V5YKBfJryv34VQQzGcRrm2NUrAKbToi"}]]''');
INSERT INTO data.did_entity OVERRIDING SYSTEM VALUE VALUES (3, 'fa21ffbd-7bc3-4ecd-82e4-339a5698f451', 'DID_TDW', 'http://localhost:8190/api/v1/did/fa21ffbd-7bc3-4ecd-82e4-339a5698f451', '''["1-QmeF28LUYX3FrnZruHzCyLKbqPLKivkGJ2EWo1QdsB9pmT","2025-03-07T13:48:40Z",{"method":"did:tdw:0.3","scid":"Qma9B2eCUNDF2m46AjvbbLQfeK2YFYphG9zitnLVUDLe7T","updateKeys":["z6Mkf3DFhQBMaEmgpj75pmB2saSMy975N9CcUH38UF8pmQNt"]},{"value":{"@context":["https://www.w3.org/ns/did/v1","https://w3id.org/security/suites/jws-2020/v1"],"id":"did:tdw:Qma9B2eCUNDF2m46AjvbbLQfeK2YFYphG9zitnLVUDLe7T:localhost%3A8190:api:v1:did:fa21ffbd-7bc3-4ecd-82e4-339a5698f451","authentication":["did:tdw:Qma9B2eCUNDF2m46AjvbbLQfeK2YFYphG9zitnLVUDLe7T:localhost%3A8190:api:v1:did:fa21ffbd-7bc3-4ecd-82e4-339a5698f451#auth-key-01"],"assertionMethod":["did:tdw:Qma9B2eCUNDF2m46AjvbbLQfeK2YFYphG9zitnLVUDLe7T:localhost%3A8190:api:v1:did:fa21ffbd-7bc3-4ecd-82e4-339a5698f451#assert-key-01"],"verificationMethod":[{"id":"did:tdw:Qma9B2eCUNDF2m46AjvbbLQfeK2YFYphG9zitnLVUDLe7T:localhost%3A8190:api:v1:did:fa21ffbd-7bc3-4ecd-82e4-339a5698f451#auth-key-01","controller":"did:tdw:Qma9B2eCUNDF2m46AjvbbLQfeK2YFYphG9zitnLVUDLe7T:localhost%3A8190:api:v1:did:fa21ffbd-7bc3-4ecd-82e4-339a5698f451","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"MFsPVFZd2knS3bVDZ_kApk3aAS2pFcLPj1C2ykGTjqI","y":"-7qkvwDhej6hz3VvHoWumW4zsX0_aWWBCQdD2g8q7Bw","kid":"auth-key-01"}},{"id":"did:tdw:Qma9B2eCUNDF2m46AjvbbLQfeK2YFYphG9zitnLVUDLe7T:localhost%3A8190:api:v1:did:fa21ffbd-7bc3-4ecd-82e4-339a5698f451#assert-key-01","controller":"did:tdw:Qma9B2eCUNDF2m46AjvbbLQfeK2YFYphG9zitnLVUDLe7T:localhost%3A8190:api:v1:did:fa21ffbd-7bc3-4ecd-82e4-339a5698f451","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"itMNfR2562R_Ar21IhbQF30cdGqlfIxUM5DbPd6mveI","y":"_S-AV3OqQltYwFywQrztchwUg0WUkOSLBucVyCfjUD4","kid":"assert-key-01"}}]}},[{"type":"DataIntegrityProof","cryptosuite":"eddsa-jcs-2022","created":"2025-03-07T13:48:40Z","verificationMethod":"did:key:z6Mkf3DFhQBMaEmgpj75pmB2saSMy975N9CcUH38UF8pmQNt#z6Mkf3DFhQBMaEmgpj75pmB2saSMy975N9CcUH38UF8pmQNt","proofPurpose":"authentication","challenge":"1-QmeF28LUYX3FrnZruHzCyLKbqPLKivkGJ2EWo1QdsB9pmT","proofValue":"z4PQM3aJoLEFQeM7JWUMrARNeKpjdieu24JYcmenRJc1dhQpttGyUhJyxtRcoXNgUTDsvm9xNwCvTv8JvD9HGUveD"}]]''');
INSERT INTO data.did_entity OVERRIDING SYSTEM VALUE VALUES (4, '7a7571b3-ada9-443c-a19b-9e221d3f914b', 'DID_TDW', 'http://localhost:8190/api/v1/did/7a7571b3-ada9-443c-a19b-9e221d3f914b', '''["1-QmeQ2wbJ2zHqGkYswJuNdVDoB6YAWEhQAtqRhsgfDwqLqG","2025-03-07T13:49:01Z",{"method":"did:tdw:0.3","scid":"Qmb21auWcWsqGpBbpBMVJzKXiwsrgVZRSifjud2fUm1SYh","updateKeys":["z6MkpV8MWDFRTBsQ1vL3DDyKwuKvZGxiFPrLC1ut8njcoyRU"]},{"value":{"@context":["https://www.w3.org/ns/did/v1","https://w3id.org/security/suites/jws-2020/v1"],"id":"did:tdw:Qmb21auWcWsqGpBbpBMVJzKXiwsrgVZRSifjud2fUm1SYh:localhost%3A8190:api:v1:did:7a7571b3-ada9-443c-a19b-9e221d3f914b","authentication":["did:tdw:Qmb21auWcWsqGpBbpBMVJzKXiwsrgVZRSifjud2fUm1SYh:localhost%3A8190:api:v1:did:7a7571b3-ada9-443c-a19b-9e221d3f914b#auth-key-01"],"assertionMethod":["did:tdw:Qmb21auWcWsqGpBbpBMVJzKXiwsrgVZRSifjud2fUm1SYh:localhost%3A8190:api:v1:did:7a7571b3-ada9-443c-a19b-9e221d3f914b#assert-key-01"],"verificationMethod":[{"id":"did:tdw:Qmb21auWcWsqGpBbpBMVJzKXiwsrgVZRSifjud2fUm1SYh:localhost%3A8190:api:v1:did:7a7571b3-ada9-443c-a19b-9e221d3f914b#auth-key-01","controller":"did:tdw:Qmb21auWcWsqGpBbpBMVJzKXiwsrgVZRSifjud2fUm1SYh:localhost%3A8190:api:v1:did:7a7571b3-ada9-443c-a19b-9e221d3f914b","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"XYzVtWQ3oMWCgn0IglLKzecu5RsTPb6h1lQkFtmjRIg","y":"HUL-hNJv8hqDMhpqLiNEjWYdCS_mAfM-Wnx1udY98yo","kid":"auth-key-01"}},{"id":"did:tdw:Qmb21auWcWsqGpBbpBMVJzKXiwsrgVZRSifjud2fUm1SYh:localhost%3A8190:api:v1:did:7a7571b3-ada9-443c-a19b-9e221d3f914b#assert-key-01","controller":"did:tdw:Qmb21auWcWsqGpBbpBMVJzKXiwsrgVZRSifjud2fUm1SYh:localhost%3A8190:api:v1:did:7a7571b3-ada9-443c-a19b-9e221d3f914b","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"Z1wdd-TWHsmuZuzLAdu6bDWxBJ7lcvw9bEOkXVTBsPA","y":"fKqmE-vEGPmlxGaq7aelgTDwj937eHKSxWUMMU2QRSA","kid":"assert-key-01"}}]}},[{"type":"DataIntegrityProof","cryptosuite":"eddsa-jcs-2022","created":"2025-03-07T13:49:01Z","verificationMethod":"did:key:z6MkpV8MWDFRTBsQ1vL3DDyKwuKvZGxiFPrLC1ut8njcoyRU#z6MkpV8MWDFRTBsQ1vL3DDyKwuKvZGxiFPrLC1ut8njcoyRU","proofPurpose":"authentication","challenge":"1-QmeQ2wbJ2zHqGkYswJuNdVDoB6YAWEhQAtqRhsgfDwqLqG","proofValue":"z4RH8m3AULG9W11FABtekNg3EtMea47fR3RWq5jVybLFANSYJDh18dGceTnUjvLHFyZmp8p9teAhvbTMpRYHodqXz"}]]''');
INSERT INTO data.did_entity OVERRIDING SYSTEM VALUE VALUES (5, '0eb031ca-c777-4102-ae20-dcd42774c6d7', 'DID_TDW', 'http://localhost:8190/api/v1/did/0eb031ca-c777-4102-ae20-dcd42774c6d7', '''["1-QmdopDiLb4QXYDR3QD2BWgbwrsyGJXK6tj9WeWMQwwpntE","2025-03-07T13:49:34Z",{"method":"did:tdw:0.3","scid":"QmT1oocdoNKXi26XgDtvaxA8SyYybZ41PNnCQES3f3XXAV","updateKeys":["z6Mkt3k8hKCTgKoEj4jQWuG1YW6pmNgkM7pfVKSMnbo1V1xr"]},{"value":{"@context":["https://www.w3.org/ns/did/v1","https://w3id.org/security/suites/jws-2020/v1"],"id":"did:tdw:QmT1oocdoNKXi26XgDtvaxA8SyYybZ41PNnCQES3f3XXAV:localhost%3A8190:api:v1:did:0eb031ca-c777-4102-ae20-dcd42774c6d7","authentication":["did:tdw:QmT1oocdoNKXi26XgDtvaxA8SyYybZ41PNnCQES3f3XXAV:localhost%3A8190:api:v1:did:0eb031ca-c777-4102-ae20-dcd42774c6d7#auth-key-01"],"assertionMethod":["did:tdw:QmT1oocdoNKXi26XgDtvaxA8SyYybZ41PNnCQES3f3XXAV:localhost%3A8190:api:v1:did:0eb031ca-c777-4102-ae20-dcd42774c6d7#assert-key-01"],"verificationMethod":[{"id":"did:tdw:QmT1oocdoNKXi26XgDtvaxA8SyYybZ41PNnCQES3f3XXAV:localhost%3A8190:api:v1:did:0eb031ca-c777-4102-ae20-dcd42774c6d7#auth-key-01","controller":"did:tdw:QmT1oocdoNKXi26XgDtvaxA8SyYybZ41PNnCQES3f3XXAV:localhost%3A8190:api:v1:did:0eb031ca-c777-4102-ae20-dcd42774c6d7","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"5AMVukf9A7J45OAt5tjvtPZYZpyrS-7ak1zFV0SNNqs","y":"SAhtJujLAMK7xeWhATz33nri-htRrJMNx3ndVLugkXU","kid":"auth-key-01"}},{"id":"did:tdw:QmT1oocdoNKXi26XgDtvaxA8SyYybZ41PNnCQES3f3XXAV:localhost%3A8190:api:v1:did:0eb031ca-c777-4102-ae20-dcd42774c6d7#assert-key-01","controller":"did:tdw:QmT1oocdoNKXi26XgDtvaxA8SyYybZ41PNnCQES3f3XXAV:localhost%3A8190:api:v1:did:0eb031ca-c777-4102-ae20-dcd42774c6d7","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"DoRtjlhTaQH_bCKV8hCKq__3R_-DU6ytf4yAl8xeHkw","y":"9GTNWU7QvzExYWMOf5R_vkNuZpj_Xqh9YZeaFxRIi8w","kid":"assert-key-01"}}]}},[{"type":"DataIntegrityProof","cryptosuite":"eddsa-jcs-2022","created":"2025-03-07T13:49:34Z","verificationMethod":"did:key:z6Mkt3k8hKCTgKoEj4jQWuG1YW6pmNgkM7pfVKSMnbo1V1xr#z6Mkt3k8hKCTgKoEj4jQWuG1YW6pmNgkM7pfVKSMnbo1V1xr","proofPurpose":"authentication","challenge":"1-QmdopDiLb4QXYDR3QD2BWgbwrsyGJXK6tj9WeWMQwwpntE","proofValue":"zXsc4XoxdzSe8WMTMUy3CcdYopWPrQB3XkjPuhFrbiAhZWoEpCHLQtzUpUWATmjnUe3nZajePVrDPZWo6RHdjYnr"}]]''');
INSERT INTO data.did_entity OVERRIDING SYSTEM VALUE VALUES (6, '9064820f-ca0a-4a86-9903-0358197d14fa', 'DID_TDW', 'http://localhost:8190/api/v1/did/9064820f-ca0a-4a86-9903-0358197d14fa', '["1-QmcmMNe9Mxgh4y4vt91Zdak51H5VZP2H9v4439WWknxJSX","2025-03-07T13:51:27Z",{"method":"did:tdw:0.3","scid":"QmWmrF2Wk588MxB8pKtE4yvLXwyirBKPSUgEpRJW5aAY1P","updateKeys":["z6MkoFbc2nxaYZAm6ahKhTCVVXdB2MLaWfWwWenvsWC9jiaJ"]},{"value":{"@context":["https://www.w3.org/ns/did/v1","https://w3id.org/security/suites/jws-2020/v1"],"id":"did:tdw:QmWmrF2Wk588MxB8pKtE4yvLXwyirBKPSUgEpRJW5aAY1P:localhost%3A8190:api:v1:did:9064820f-ca0a-4a86-9903-0358197d14fa","authentication":["did:tdw:QmWmrF2Wk588MxB8pKtE4yvLXwyirBKPSUgEpRJW5aAY1P:localhost%3A8190:api:v1:did:9064820f-ca0a-4a86-9903-0358197d14fa#auth-key-01"],"assertionMethod":["did:tdw:QmWmrF2Wk588MxB8pKtE4yvLXwyirBKPSUgEpRJW5aAY1P:localhost%3A8190:api:v1:did:9064820f-ca0a-4a86-9903-0358197d14fa#assert-key-01"],"verificationMethod":[{"id":"did:tdw:QmWmrF2Wk588MxB8pKtE4yvLXwyirBKPSUgEpRJW5aAY1P:localhost%3A8190:api:v1:did:9064820f-ca0a-4a86-9903-0358197d14fa#auth-key-01","controller":"did:tdw:QmWmrF2Wk588MxB8pKtE4yvLXwyirBKPSUgEpRJW5aAY1P:localhost%3A8190:api:v1:did:9064820f-ca0a-4a86-9903-0358197d14fa","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"NtiYxS7cBWE1qzCWVBJdaaoctxb-S2NNj3rm4pvUORo","y":"68Cd-g3tfmHuYoz4FqMvIY-o2VV0epcg4cHHJDv0axw","kid":"auth-key-01"}},{"id":"did:tdw:QmWmrF2Wk588MxB8pKtE4yvLXwyirBKPSUgEpRJW5aAY1P:localhost%3A8190:api:v1:did:9064820f-ca0a-4a86-9903-0358197d14fa#assert-key-01","controller":"did:tdw:QmWmrF2Wk588MxB8pKtE4yvLXwyirBKPSUgEpRJW5aAY1P:localhost%3A8190:api:v1:did:9064820f-ca0a-4a86-9903-0358197d14fa","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"cyYkk_c3az5i5ioxpOh0abjFCVTWGmPYOE5VxPEXBQ8","y":"epBcCxcHEJ3Z8V24klHVH38KJsBiRPIK11NLE3Jsjdc","kid":"assert-key-01"}}]}},[{"type":"DataIntegrityProof","cryptosuite":"eddsa-jcs-2022","created":"2025-03-07T13:51:27Z","verificationMethod":"did:key:z6MkoFbc2nxaYZAm6ahKhTCVVXdB2MLaWfWwWenvsWC9jiaJ#z6MkoFbc2nxaYZAm6ahKhTCVVXdB2MLaWfWwWenvsWC9jiaJ","proofPurpose":"authentication","challenge":"1-QmcmMNe9Mxgh4y4vt91Zdak51H5VZP2H9v4439WWknxJSX","proofValue":"z5kGL2XxW3qUDq6Fmi19S3eewDXMgJnW3iywYEgFRT7SaoCmTAW2PVy4gd6qCCU415YorUF6jqdZSafGEoG9YLuqx"}]]');
INSERT INTO data.did_entity OVERRIDING SYSTEM VALUE VALUES (7, 'fc56fb99-06f2-49b5-9e33-8caf9ccb4dcf', 'DID_TDW', 'http://localhost:8190/api/v1/did/fc56fb99-06f2-49b5-9e33-8caf9ccb4dcf', '["1-QmZbVw8XZC1VZoD2RvKf4jXiYVtsDRYNvZTc3BTd8ozHNo","2025-03-07T13:53:03Z",{"method":"did:tdw:0.3","scid":"QmQKGdVVLmwDutTkbqbC8iArqh4LqoEVAKARMR4FtQNicM","updateKeys":["z6MkwgRgRRZg26z2H3UFGjkc3weXAbwBsAtF1ApXzfFRUbGK"]},{"value":{"@context":["https://www.w3.org/ns/did/v1","https://w3id.org/security/suites/jws-2020/v1"],"id":"did:tdw:QmQKGdVVLmwDutTkbqbC8iArqh4LqoEVAKARMR4FtQNicM:localhost%3A8190:api:v1:did:fc56fb99-06f2-49b5-9e33-8caf9ccb4dcf","authentication":["did:tdw:QmQKGdVVLmwDutTkbqbC8iArqh4LqoEVAKARMR4FtQNicM:localhost%3A8190:api:v1:did:fc56fb99-06f2-49b5-9e33-8caf9ccb4dcf#auth-key-01"],"assertionMethod":["did:tdw:QmQKGdVVLmwDutTkbqbC8iArqh4LqoEVAKARMR4FtQNicM:localhost%3A8190:api:v1:did:fc56fb99-06f2-49b5-9e33-8caf9ccb4dcf#assert-key-01"],"verificationMethod":[{"id":"did:tdw:QmQKGdVVLmwDutTkbqbC8iArqh4LqoEVAKARMR4FtQNicM:localhost%3A8190:api:v1:did:fc56fb99-06f2-49b5-9e33-8caf9ccb4dcf#auth-key-01","controller":"did:tdw:QmQKGdVVLmwDutTkbqbC8iArqh4LqoEVAKARMR4FtQNicM:localhost%3A8190:api:v1:did:fc56fb99-06f2-49b5-9e33-8caf9ccb4dcf","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"zpcnLHvXMGzAXQo8NYXuKSS0T39z148-RmdaPEiQFEk","y":"kTkyJHHS2SoiVgOIOFcV8fe-BAz6GFv9f9zxCcNJyM8","kid":"auth-key-01"}},{"id":"did:tdw:QmQKGdVVLmwDutTkbqbC8iArqh4LqoEVAKARMR4FtQNicM:localhost%3A8190:api:v1:did:fc56fb99-06f2-49b5-9e33-8caf9ccb4dcf#assert-key-01","controller":"did:tdw:QmQKGdVVLmwDutTkbqbC8iArqh4LqoEVAKARMR4FtQNicM:localhost%3A8190:api:v1:did:fc56fb99-06f2-49b5-9e33-8caf9ccb4dcf","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"jFu0AptQDWS55ztdW5yVPs-RarC4B2IKt6l7akie46w","y":"BEcqHykPWImiWbd3cgxM1FCbVjZOM2Db42hbCPIovC4","kid":"assert-key-01"}}]}},[{"type":"DataIntegrityProof","cryptosuite":"eddsa-jcs-2022","created":"2025-03-07T13:53:03Z","verificationMethod":"did:key:z6MkwgRgRRZg26z2H3UFGjkc3weXAbwBsAtF1ApXzfFRUbGK#z6MkwgRgRRZg26z2H3UFGjkc3weXAbwBsAtF1ApXzfFRUbGK","proofPurpose":"authentication","challenge":"1-QmZbVw8XZC1VZoD2RvKf4jXiYVtsDRYNvZTc3BTd8ozHNo","proofValue":"z5ya3VrEKnAepfAhuGJ18gatPpXNC46zYQS2KB9w7BWho9HAzUWTxs3fyTwS3t8PLMNcLJCURFZVcTrSEqp35BtTi"}]]');
INSERT INTO data.did_entity OVERRIDING SYSTEM VALUE VALUES (8, '1ef920d9-3e83-48de-9871-dcf679a13a91', 'DID_TDW', 'http://localhost:8190/api/v1/did/1ef920d9-3e83-48de-9871-dcf679a13a91', '["1-QmXJRPRS3VoGC4XjAUnh71Fhf8MWDydowjvFgBd8d3fiqt","2025-03-07T13:55:50Z",{"method":"did:tdw:0.3","scid":"QmbtYhhwLZYgvUZJjKXjYjamrntT9WDb73Ng4AAyFWYwG9","updateKeys":["z6MksZzWp8B4kHtfaWobwbkZeGZScb9Czrwjjtc7XL4t3nDR"]},{"value":{"@context":["https://www.w3.org/ns/did/v1","https://w3id.org/security/suites/jws-2020/v1"],"id":"did:tdw:QmbtYhhwLZYgvUZJjKXjYjamrntT9WDb73Ng4AAyFWYwG9:localhost%3A8190:api:v1:did:1ef920d9-3e83-48de-9871-dcf679a13a91","authentication":["did:tdw:QmbtYhhwLZYgvUZJjKXjYjamrntT9WDb73Ng4AAyFWYwG9:localhost%3A8190:api:v1:did:1ef920d9-3e83-48de-9871-dcf679a13a91#auth-key-01"],"assertionMethod":["did:tdw:QmbtYhhwLZYgvUZJjKXjYjamrntT9WDb73Ng4AAyFWYwG9:localhost%3A8190:api:v1:did:1ef920d9-3e83-48de-9871-dcf679a13a91#assert-key-01"],"verificationMethod":[{"id":"did:tdw:QmbtYhhwLZYgvUZJjKXjYjamrntT9WDb73Ng4AAyFWYwG9:localhost%3A8190:api:v1:did:1ef920d9-3e83-48de-9871-dcf679a13a91#auth-key-01","controller":"did:tdw:QmbtYhhwLZYgvUZJjKXjYjamrntT9WDb73Ng4AAyFWYwG9:localhost%3A8190:api:v1:did:1ef920d9-3e83-48de-9871-dcf679a13a91","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"SRYEWot3BQReeleCl86uuAUpztlW6hdh1AqjtfkU640","y":"4QkNOhQZekDtZTCBOZ1Zq48E5I44CUPrsQERY7D57Xg","kid":"auth-key-01"}},{"id":"did:tdw:QmbtYhhwLZYgvUZJjKXjYjamrntT9WDb73Ng4AAyFWYwG9:localhost%3A8190:api:v1:did:1ef920d9-3e83-48de-9871-dcf679a13a91#assert-key-01","controller":"did:tdw:QmbtYhhwLZYgvUZJjKXjYjamrntT9WDb73Ng4AAyFWYwG9:localhost%3A8190:api:v1:did:1ef920d9-3e83-48de-9871-dcf679a13a91","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"BIhWNU-4Vd09EvovCt9Ktzn76n7SMlw905YTzU2XXfk","y":"iOAcFCONa3tofXp3iEMAom79laDVQ9fY-9YHYnksBN0","kid":"assert-key-01"}}]}},[{"type":"DataIntegrityProof","cryptosuite":"eddsa-jcs-2022","created":"2025-03-07T13:55:50Z","verificationMethod":"did:key:z6MksZzWp8B4kHtfaWobwbkZeGZScb9Czrwjjtc7XL4t3nDR#z6MksZzWp8B4kHtfaWobwbkZeGZScb9Czrwjjtc7XL4t3nDR","proofPurpose":"authentication","challenge":"1-QmXJRPRS3VoGC4XjAUnh71Fhf8MWDydowjvFgBd8d3fiqt","proofValue":"z4ShQry7XJXtNaTysrmtop3SZ8GhRVCNB1NW3bKqqphNahhWEcRgmwZRZLSUCSeLzK111AjA3yGWRrfGRwjvC5VPt"}]]');
INSERT INTO data.did_entity OVERRIDING SYSTEM VALUE VALUES (9, '301c5fbe-1c76-4d64-a885-6158fb0b92ff', 'DID_TDW', 'http://localhost:8190/api/v1/did/301c5fbe-1c76-4d64-a885-6158fb0b92ff', '["1-Qmcg6Xpbi2voQDxhsj2Pz4ftSEWV9BiGdEXnv4ueMn9SLh","2025-03-07T13:56:14Z",{"method":"did:tdw:0.3","scid":"QmV8FEfnibarYcYSMTonukMyGvZiN6FJEyPMQrYU89viBH","updateKeys":["z6Mko3ZEG9Q1JqiwyhUGqQtiwqUo4wq6L3c11TQs9LXRJmHC"]},{"value":{"@context":["https://www.w3.org/ns/did/v1","https://w3id.org/security/suites/jws-2020/v1"],"id":"did:tdw:QmV8FEfnibarYcYSMTonukMyGvZiN6FJEyPMQrYU89viBH:localhost%3A8190:api:v1:did:301c5fbe-1c76-4d64-a885-6158fb0b92ff","authentication":["did:tdw:QmV8FEfnibarYcYSMTonukMyGvZiN6FJEyPMQrYU89viBH:localhost%3A8190:api:v1:did:301c5fbe-1c76-4d64-a885-6158fb0b92ff#auth-key-01"],"assertionMethod":["did:tdw:QmV8FEfnibarYcYSMTonukMyGvZiN6FJEyPMQrYU89viBH:localhost%3A8190:api:v1:did:301c5fbe-1c76-4d64-a885-6158fb0b92ff#assert-key-01"],"verificationMethod":[{"id":"did:tdw:QmV8FEfnibarYcYSMTonukMyGvZiN6FJEyPMQrYU89viBH:localhost%3A8190:api:v1:did:301c5fbe-1c76-4d64-a885-6158fb0b92ff#auth-key-01","controller":"did:tdw:QmV8FEfnibarYcYSMTonukMyGvZiN6FJEyPMQrYU89viBH:localhost%3A8190:api:v1:did:301c5fbe-1c76-4d64-a885-6158fb0b92ff","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"Ys5OIKBOfeY_xBPfnFU6cgxNscTPVjdeCAf9uV9r5_M","y":"KrLICRGC_hefo0KLrTxBSiteaGidYGNasm47XmOapsM","kid":"auth-key-01"}},{"id":"did:tdw:QmV8FEfnibarYcYSMTonukMyGvZiN6FJEyPMQrYU89viBH:localhost%3A8190:api:v1:did:301c5fbe-1c76-4d64-a885-6158fb0b92ff#assert-key-01","controller":"did:tdw:QmV8FEfnibarYcYSMTonukMyGvZiN6FJEyPMQrYU89viBH:localhost%3A8190:api:v1:did:301c5fbe-1c76-4d64-a885-6158fb0b92ff","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"kkO3mCej6Fl74QMSsoBjkTs5mRQDRKDqA9PBf7aozK0","y":"vUb38a2k-p1cqn0GXmVCNiZjqkI2y5cH2X8ufI_xbV4","kid":"assert-key-01"}}]}},[{"type":"DataIntegrityProof","cryptosuite":"eddsa-jcs-2022","created":"2025-03-07T13:56:14Z","verificationMethod":"did:key:z6Mko3ZEG9Q1JqiwyhUGqQtiwqUo4wq6L3c11TQs9LXRJmHC#z6Mko3ZEG9Q1JqiwyhUGqQtiwqUo4wq6L3c11TQs9LXRJmHC","proofPurpose":"authentication","challenge":"1-Qmcg6Xpbi2voQDxhsj2Pz4ftSEWV9BiGdEXnv4ueMn9SLh","proofValue":"z2hCtD7FiY61cfpe4RA537C5qeZYh4c7x8mYHGCwKHPBZta1YeepUkgNM3M5EtF8yGzFLeq4hA4N9tjveNzYt1Ftk"}]]');
INSERT INTO data.did_entity OVERRIDING SYSTEM VALUE VALUES (10, '5c741243-dc32-4d02-aecc-dc97f4986cc0', 'DID_TDW', 'http://localhost:8190/api/v1/did/5c741243-dc32-4d02-aecc-dc97f4986cc0', '["1-QmUuGjYbi83pmFXMGf9afQQwSkEWifz4ZkzUkdbGadwFkv","2025-03-07T13:57:09Z",{"method":"did:tdw:0.3","scid":"Qmcx83SGCNfKGer5EVzGjjzDZFgUB1wNhfE47PPQfgRTLz","updateKeys":["z6MkuaB9Es4AExkcZjC4BnDAsMfFTvvHz2BpfP3e3RcueZPT"]},{"value":{"@context":["https://www.w3.org/ns/did/v1","https://w3id.org/security/suites/jws-2020/v1"],"id":"did:tdw:Qmcx83SGCNfKGer5EVzGjjzDZFgUB1wNhfE47PPQfgRTLz:localhost%3A8190:api:v1:did:5c741243-dc32-4d02-aecc-dc97f4986cc0","authentication":["did:tdw:Qmcx83SGCNfKGer5EVzGjjzDZFgUB1wNhfE47PPQfgRTLz:localhost%3A8190:api:v1:did:5c741243-dc32-4d02-aecc-dc97f4986cc0#auth-key-01"],"assertionMethod":["did:tdw:Qmcx83SGCNfKGer5EVzGjjzDZFgUB1wNhfE47PPQfgRTLz:localhost%3A8190:api:v1:did:5c741243-dc32-4d02-aecc-dc97f4986cc0#assert-key-01"],"verificationMethod":[{"id":"did:tdw:Qmcx83SGCNfKGer5EVzGjjzDZFgUB1wNhfE47PPQfgRTLz:localhost%3A8190:api:v1:did:5c741243-dc32-4d02-aecc-dc97f4986cc0#auth-key-01","controller":"did:tdw:Qmcx83SGCNfKGer5EVzGjjzDZFgUB1wNhfE47PPQfgRTLz:localhost%3A8190:api:v1:did:5c741243-dc32-4d02-aecc-dc97f4986cc0","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"O5DKHZx4D7lFO1JYVgSxC42KxLPQd1uEOHsZlyB8XC0","y":"SvsSXJ_PRm9n8DidTpTm9pkqXDFqLPBEe0Yt4fPvaTA","kid":"auth-key-01"}},{"id":"did:tdw:Qmcx83SGCNfKGer5EVzGjjzDZFgUB1wNhfE47PPQfgRTLz:localhost%3A8190:api:v1:did:5c741243-dc32-4d02-aecc-dc97f4986cc0#assert-key-01","controller":"did:tdw:Qmcx83SGCNfKGer5EVzGjjzDZFgUB1wNhfE47PPQfgRTLz:localhost%3A8190:api:v1:did:5c741243-dc32-4d02-aecc-dc97f4986cc0","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"XFgqZuECNmBoJQK6487zJiHqkAyuVdaRlFnm9Ts-lWM","y":"PBS_vW-9Sz0iclOUUwvr3RBXtMr3vBu3-BF6WiZVLps","kid":"assert-key-01"}}]}},[{"type":"DataIntegrityProof","cryptosuite":"eddsa-jcs-2022","created":"2025-03-07T13:57:09Z","verificationMethod":"did:key:z6MkuaB9Es4AExkcZjC4BnDAsMfFTvvHz2BpfP3e3RcueZPT#z6MkuaB9Es4AExkcZjC4BnDAsMfFTvvHz2BpfP3e3RcueZPT","proofPurpose":"authentication","challenge":"1-QmUuGjYbi83pmFXMGf9afQQwSkEWifz4ZkzUkdbGadwFkv","proofValue":"z75cLLj4jZboFLQqoij83CoecdznenJ6zjbDQ4iRcpHHC6kndzXxYC3APzRDfY9uAdtK221RMvhud5994axPHFPQ"}]]');
INSERT INTO data.did_entity OVERRIDING SYSTEM VALUE VALUES (11, 'cfda585f-a963-43b0-8247-7d8188c53a1e', 'DID_TDW', 'http://localhost:8190/api/v1/did/cfda585f-a963-43b0-8247-7d8188c53a1e', '["1-QmQYRwLdh5u248XdGpNtCaDK3SDZkYFKvh4GfHLrVW2LiC","2025-03-07T13:59:39Z",{"method":"did:tdw:0.3","scid":"QmWoSFDNQTQ3oMRghG4mxFD2oYgYz6zfFSeZEduNRTzUXW","updateKeys":["z6Mkq53qqrh1LUhuuV644kKEWBZM1SwqEYhmHbYzjcfeMagm"]},{"value":{"@context":["https://www.w3.org/ns/did/v1","https://w3id.org/security/suites/jws-2020/v1"],"id":"did:tdw:QmWoSFDNQTQ3oMRghG4mxFD2oYgYz6zfFSeZEduNRTzUXW:localhost%3A8190:api:v1:did:cfda585f-a963-43b0-8247-7d8188c53a1e","authentication":["did:tdw:QmWoSFDNQTQ3oMRghG4mxFD2oYgYz6zfFSeZEduNRTzUXW:localhost%3A8190:api:v1:did:cfda585f-a963-43b0-8247-7d8188c53a1e#auth-key-01"],"assertionMethod":["did:tdw:QmWoSFDNQTQ3oMRghG4mxFD2oYgYz6zfFSeZEduNRTzUXW:localhost%3A8190:api:v1:did:cfda585f-a963-43b0-8247-7d8188c53a1e#assert-key-01"],"verificationMethod":[{"id":"did:tdw:QmWoSFDNQTQ3oMRghG4mxFD2oYgYz6zfFSeZEduNRTzUXW:localhost%3A8190:api:v1:did:cfda585f-a963-43b0-8247-7d8188c53a1e#auth-key-01","controller":"did:tdw:QmWoSFDNQTQ3oMRghG4mxFD2oYgYz6zfFSeZEduNRTzUXW:localhost%3A8190:api:v1:did:cfda585f-a963-43b0-8247-7d8188c53a1e","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"WYJDHLFn7BxFh5eS-Q15S_AKKCEBOF6Z1SqD8flyoqk","y":"cUdiit_wbnUij5ii1T10NsXsIq-KFSQIxrU7eyBKGsk","kid":"auth-key-01"}},{"id":"did:tdw:QmWoSFDNQTQ3oMRghG4mxFD2oYgYz6zfFSeZEduNRTzUXW:localhost%3A8190:api:v1:did:cfda585f-a963-43b0-8247-7d8188c53a1e#assert-key-01","controller":"did:tdw:QmWoSFDNQTQ3oMRghG4mxFD2oYgYz6zfFSeZEduNRTzUXW:localhost%3A8190:api:v1:did:cfda585f-a963-43b0-8247-7d8188c53a1e","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"_0BR__Xi-_0iCpoI8VabjwAHH8wdfQGrYygqsawlNIA","y":"4B_UwHzZ5A9yGu1FmK_B_8-diiXkjIT4KW77eClVz8E","kid":"assert-key-01"}}]}},[{"type":"DataIntegrityProof","cryptosuite":"eddsa-jcs-2022","created":"2025-03-07T13:59:39Z","verificationMethod":"did:key:z6Mkq53qqrh1LUhuuV644kKEWBZM1SwqEYhmHbYzjcfeMagm#z6Mkq53qqrh1LUhuuV644kKEWBZM1SwqEYhmHbYzjcfeMagm","proofPurpose":"authentication","challenge":"1-QmQYRwLdh5u248XdGpNtCaDK3SDZkYFKvh4GfHLrVW2LiC","proofValue":"z3cg732VArnw6TssX1KZPuz6BG3AgAWVuDzsC9TWmYEiNctPtrVRP4VtsLhds3wxyGaCeDLc3hsa8gJdeeprpHXoE"}]]');
INSERT INTO data.did_entity OVERRIDING SYSTEM VALUE VALUES (12, '665d6c52-92d6-46a7-bc8e-23dc96881912', 'DID_TDW', 'http://localhost:8190/api/v1/did/665d6c52-92d6-46a7-bc8e-23dc96881912', '["1-QmRQfBK6wy5gUnZTjMdZQ6WNXK1sANmU6o5RYwhaxg1tC3","2025-03-07T14:07:48Z",{"method":"did:tdw:0.3","scid":"QmaF83CsX9r41P8P9ZV5Fy5xptchWQo4szES3w6X1Rfsi8","updateKeys":["z6Mkiyyqkoi1x6KieedsMKR8ehqejzpzA1dfKcApCvnncZuj"]},{"value":{"@context":["https://www.w3.org/ns/did/v1","https://w3id.org/security/suites/jws-2020/v1"],"id":"did:tdw:QmaF83CsX9r41P8P9ZV5Fy5xptchWQo4szES3w6X1Rfsi8:localhost%3A8190:api:v1:did:665d6c52-92d6-46a7-bc8e-23dc96881912","authentication":["did:tdw:QmaF83CsX9r41P8P9ZV5Fy5xptchWQo4szES3w6X1Rfsi8:localhost%3A8190:api:v1:did:665d6c52-92d6-46a7-bc8e-23dc96881912#auth-key-01"],"assertionMethod":["did:tdw:QmaF83CsX9r41P8P9ZV5Fy5xptchWQo4szES3w6X1Rfsi8:localhost%3A8190:api:v1:did:665d6c52-92d6-46a7-bc8e-23dc96881912#assert-key-01"],"verificationMethod":[{"id":"did:tdw:QmaF83CsX9r41P8P9ZV5Fy5xptchWQo4szES3w6X1Rfsi8:localhost%3A8190:api:v1:did:665d6c52-92d6-46a7-bc8e-23dc96881912#auth-key-01","controller":"did:tdw:QmaF83CsX9r41P8P9ZV5Fy5xptchWQo4szES3w6X1Rfsi8:localhost%3A8190:api:v1:did:665d6c52-92d6-46a7-bc8e-23dc96881912","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"BvsjKlQnmxDKlxnue6Nl_jmSMlNEVEW3OAVRGZ_JXmk","y":"QhLgOwx1mUE5e8s0dSs0UP9dgkj8LhvIbiqo9Z5J4q4","kid":"auth-key-01"}},{"id":"did:tdw:QmaF83CsX9r41P8P9ZV5Fy5xptchWQo4szES3w6X1Rfsi8:localhost%3A8190:api:v1:did:665d6c52-92d6-46a7-bc8e-23dc96881912#assert-key-01","controller":"did:tdw:QmaF83CsX9r41P8P9ZV5Fy5xptchWQo4szES3w6X1Rfsi8:localhost%3A8190:api:v1:did:665d6c52-92d6-46a7-bc8e-23dc96881912","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"DZahmbhlYZz2VMXbuedvx8TRR1n-JreKMR7Hr0yxHNg","y":"z29xHwJhDLc9JoWqcPSu5aUaCFWlDQPavoW2qGVqKT0","kid":"assert-key-01"}}]}},[{"type":"DataIntegrityProof","cryptosuite":"eddsa-jcs-2022","created":"2025-03-07T14:07:48Z","verificationMethod":"did:key:z6Mkiyyqkoi1x6KieedsMKR8ehqejzpzA1dfKcApCvnncZuj#z6Mkiyyqkoi1x6KieedsMKR8ehqejzpzA1dfKcApCvnncZuj","proofPurpose":"authentication","challenge":"1-QmRQfBK6wy5gUnZTjMdZQ6WNXK1sANmU6o5RYwhaxg1tC3","proofValue":"z43zw3F5KtDF5GuYxS7XJ834sPVb66eLhEeinNQG5bKYDfihNM1LMKJKARb33n4qJCabmGKqZiiU4gU1FbzGJudvm"}]]');
INSERT INTO data.did_entity OVERRIDING SYSTEM VALUE VALUES (13, '123ac2ee-57b5-4973-a72f-92f502dda07e', 'DID_TDW', 'http://localhost:8190/api/v1/did/123ac2ee-57b5-4973-a72f-92f502dda07e', '["1-QmZQxhqNK1kfan49gSZvzx5uYyZnkz9iWQ8N8Jvs1ZBNbE","2025-03-07T14:07:55Z",{"method":"did:tdw:0.3","scid":"QmdHHadaEbVjV54QADGgsCtxPxYp95AS1GrEBDpHnPw3r3","updateKeys":["z6MkefcTbdGxVVFDJgFHwqBdLNdFtQe5TqQUHmxL92RKbGnv"]},{"value":{"@context":["https://www.w3.org/ns/did/v1","https://w3id.org/security/suites/jws-2020/v1"],"id":"did:tdw:QmdHHadaEbVjV54QADGgsCtxPxYp95AS1GrEBDpHnPw3r3:localhost%3A8190:api:v1:did:123ac2ee-57b5-4973-a72f-92f502dda07e","authentication":["did:tdw:QmdHHadaEbVjV54QADGgsCtxPxYp95AS1GrEBDpHnPw3r3:localhost%3A8190:api:v1:did:123ac2ee-57b5-4973-a72f-92f502dda07e#auth-key-01"],"assertionMethod":["did:tdw:QmdHHadaEbVjV54QADGgsCtxPxYp95AS1GrEBDpHnPw3r3:localhost%3A8190:api:v1:did:123ac2ee-57b5-4973-a72f-92f502dda07e#assert-key-01"],"verificationMethod":[{"id":"did:tdw:QmdHHadaEbVjV54QADGgsCtxPxYp95AS1GrEBDpHnPw3r3:localhost%3A8190:api:v1:did:123ac2ee-57b5-4973-a72f-92f502dda07e#auth-key-01","controller":"did:tdw:QmdHHadaEbVjV54QADGgsCtxPxYp95AS1GrEBDpHnPw3r3:localhost%3A8190:api:v1:did:123ac2ee-57b5-4973-a72f-92f502dda07e","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"uNqncBX2bCNwclQx27ksBsbU502QDL5ZwZ22A5KLqag","y":"MXwgsUuWGemODjMTIuHYXqz60QwpBioCtZp-1Q3S2-I","kid":"auth-key-01"}},{"id":"did:tdw:QmdHHadaEbVjV54QADGgsCtxPxYp95AS1GrEBDpHnPw3r3:localhost%3A8190:api:v1:did:123ac2ee-57b5-4973-a72f-92f502dda07e#assert-key-01","controller":"did:tdw:QmdHHadaEbVjV54QADGgsCtxPxYp95AS1GrEBDpHnPw3r3:localhost%3A8190:api:v1:did:123ac2ee-57b5-4973-a72f-92f502dda07e","type":"JsonWebKey2020","publicKeyJwk":{"kty":"EC","crv":"P-256","x":"1v7Udmq8Rc4wezpPlB-aU-QTiaglq8IdL_Jyn8VlAH4","y":"OjoQ-vRrSPM6WPnRP5UHyticSDgSVJNDj1WZG-2np14","kid":"assert-key-01"}}]}},[{"type":"DataIntegrityProof","cryptosuite":"eddsa-jcs-2022","created":"2025-03-07T14:07:55Z","verificationMethod":"did:key:z6MkefcTbdGxVVFDJgFHwqBdLNdFtQe5TqQUHmxL92RKbGnv#z6MkefcTbdGxVVFDJgFHwqBdLNdFtQe5TqQUHmxL92RKbGnv","proofPurpose":"authentication","challenge":"1-QmZQxhqNK1kfan49gSZvzx5uYyZnkz9iWQ8N8Jvs1ZBNbE","proofValue":"z59irAbq8eDZqQKHJroAZXenreLqt9pU8BfJ7fNSjrs93zpZReMCpt5DJyHdgKMr2fP174Z7Anp1FJr4gxPJP9nx1"}]]');


--
-- TOC entry 3363 (class 0 OID 16398)
-- Dependencies: 215
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: data; Owner: base_registry
--

INSERT INTO data.flyway_schema_history VALUES (0, NULL, '<< Flyway Schema Creation >>', 'SCHEMA', '"data"', NULL, 'base_registry', '2025-03-07 09:10:39.309242', 0, true);
INSERT INTO data.flyway_schema_history VALUES (1, '1.0.0', 'create-schema', 'SQL', 'V1_0_0__create-schema.sql', 1867871596, 'base_registry', '2025-03-07 09:10:39.32381', 4, true);
INSERT INTO data.flyway_schema_history VALUES (2, '1.0.1', 'create-did-interaction-schema', 'SQL', 'V1_0_1__create-did-interaction-schema.sql', 1529232207, 'base_registry', '2025-03-07 09:10:39.339554', 5, true);
INSERT INTO data.flyway_schema_history VALUES (3, '1.0.2', 'remove-scid-from-did-store', 'SQL', 'V1_0_2__remove-scid-from-did-store.sql', -2133555243, 'base_registry', '2025-03-07 09:10:39.350431', 1, true);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 217
-- Name: did_entity_id_seq; Type: SEQUENCE SET; Schema: data; Owner: base_registry
--

SELECT pg_catalog.setval('data.did_entity_id_seq', 13, true);


--
-- TOC entry 3215 (class 2606 OID 16411)
-- Name: datastore_entity datastore_entity_pkey; Type: CONSTRAINT; Schema: data; Owner: base_registry
--

ALTER TABLE ONLY data.datastore_entity
    ADD CONSTRAINT datastore_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 3217 (class 2606 OID 16419)
-- Name: did_entity did_entity_pkey; Type: CONSTRAINT; Schema: data; Owner: base_registry
--

ALTER TABLE ONLY data.did_entity
    ADD CONSTRAINT did_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 16405)
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: data; Owner: base_registry
--

ALTER TABLE ONLY data.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- TOC entry 3213 (class 1259 OID 16406)
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: data; Owner: base_registry
--

CREATE INDEX flyway_schema_history_s_idx ON data.flyway_schema_history USING btree (success);


--
-- TOC entry 3218 (class 1259 OID 16425)
-- Name: idx_did_list; Type: INDEX; Schema: data; Owner: base_registry
--

CREATE INDEX idx_did_list ON data.did_entity USING hash (base_id);


--
-- TOC entry 3219 (class 1259 OID 16426)
-- Name: idx_did_search_authoring; Type: INDEX; Schema: data; Owner: base_registry
--

CREATE UNIQUE INDEX idx_did_search_authoring ON data.did_entity USING btree (base_id, file_type);


--
-- TOC entry 3220 (class 2606 OID 16420)
-- Name: did_entity fk_base; Type: FK CONSTRAINT; Schema: data; Owner: base_registry
--

ALTER TABLE ONLY data.did_entity
    ADD CONSTRAINT fk_base FOREIGN KEY (base_id) REFERENCES data.datastore_entity(id);


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 3372
-- Name: DATABASE "base-registry-db"; Type: ACL; Schema: -; Owner: postgres
--

GRANT CREATE,CONNECT ON DATABASE "base-registry-db" TO db_writers;


-- Completed on 2025-03-10 14:58:44 CET

--
-- PostgreSQL database dump complete
--

