-- Table: public.ride

-- DROP TABLE public.ride;

CREATE TABLE Ride
(
    id bigint NOT NULL,
    destination character varying(255) COLLATE pg_catalog."default",
    driverid character varying(255) COLLATE pg_catalog."default",
    passengerid character varying(255) COLLATE pg_catalog."default",
    pickup character varying(255) COLLATE pg_catalog."default",
    price numeric(19,2),
    rideid character varying(255) COLLATE pg_catalog."default",
    status integer NOT NULL,
    CONSTRAINT ride_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE RIDE_SEQ;

CREATE INDEX "IDX_Ride_rideId" ON Ride(rideid);