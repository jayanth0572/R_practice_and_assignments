-- Table: public.skills

-- DROP TABLE public.skills;

CREATE TABLE public.skills
(
    skill_id SERIAL,
    skill character varying(500) COLLATE pg_catalog."default",
    CONSTRAINT skills_pkey PRIMARY KEY (skill_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.skills
    OWNER to postgres;
	
--------------------------------------------------------------------------------------------

-- Table: public.source

-- DROP TABLE public.source;

CREATE TABLE public.source
(
    source_id SERIAL,
    source character varying(4000) COLLATE pg_catalog."default",
    source_type character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT source_pkey PRIMARY KEY (source_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.source
    OWNER to postgres;
	
--------------------------------------------------------------------------------------------

-- Table: public.supporting_factor

-- DROP TABLE public.supporting_factor;

CREATE TABLE public.supporting_factor
(
    skill_id integer,
    supporting_factor character varying(500) COLLATE pg_catalog."default",
    CONSTRAINT skill_id_fk FOREIGN KEY (skill_id)
        REFERENCES public.skills (skill_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.supporting_factor
    OWNER to postgres;

-- Index: fki_skill_id_fk

-- DROP INDEX public.fki_skill_id_fk;

CREATE INDEX fki_skill_id_fk
    ON public.supporting_factor USING btree
    (skill_id)
    TABLESPACE pg_default;
	
--------------------------------------------------------------------------------------------

-- Table: public.skill_information

-- DROP TABLE public.skill_information;

CREATE TABLE public.skill_information
(
    id SERIAL,
    skill_id integer,
    skill character varying(500) COLLATE pg_catalog."default",
    count integer,
    source_id integer,
    CONSTRAINT skill_information_pkey PRIMARY KEY (id),
    CONSTRAINT skill_id_fk FOREIGN KEY (skill_id)
        REFERENCES public.skills (skill_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.skill_information
    OWNER to postgres;

-- Index: fki_skill_id_fk1

-- DROP INDEX public.fki_skill_id_fk1;

CREATE INDEX fki_skill_id_fk1
    ON public.skill_information USING btree
    (skill_id)
    TABLESPACE pg_default;

--------------------------------------------------------------------------------------------

-- Table: public.skills_staging

-- DROP TABLE public.skills_staging;

CREATE TABLE public.skills_staging
(
    source text COLLATE pg_catalog."default",
    source_type text COLLATE pg_catalog."default",
    skill text COLLATE pg_catalog."default",
    supporting_factor text COLLATE pg_catalog."default",
    flag_processed text COLLATE pg_catalog."default",
    frequency integer
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.skills_staging
    OWNER to postgres;

	
--------------------------------------------------------------------------------------------
