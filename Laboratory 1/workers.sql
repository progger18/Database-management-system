CREATE DATABASE travel_agency_ZakirovAI_A08_N5;
-- \c travel_agency_ZakirovAI_A08_N5

CREATE TABLE workers_zakirovai_a08_n5 (
	idworker_zakirovai_a08_n5 BIGSERIAL NOT NULL,
	workername_zakirovai_a08_n5 character(30),
	salary_zakirovai_a08_n5 integer,
	work_days_zakirovai_a08_n5 integer,
	PRIMARY KEY (idworker_zakirovai_a08_n5)
);
-- \d workers_zakirovai_a08_n5