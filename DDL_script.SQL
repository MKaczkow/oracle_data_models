/*
Created: 2021-11-29
Modified: 2021-11-29
Model: SpoldzielniaMieszkaniowa (5e4fb63) (df82488)
Database: Oracle 19c
*/


-- Create sequences section -------------------------------------------------

CREATE SEQUENCE "NrSpoldzielniSeq"
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE "NrZarzaduSeq"
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE "NrUprawnienSeq"
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE "NrRoliSeq"
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE "NrAdministratoraSeq"
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE "NrStronySeq"
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE "NrCzlonkaSeq"
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE "NrDzialkiSeq"
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE "NrDomuSeq"
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE "NrBlokuSeq"
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE "NrAdresuSeq"
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE "NrPocztySeq"
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE "NrMieszkaniaSeq"
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE "NrKlientaSeq"
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE "NrPracownikaSeq"
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

-- Create tables section -------------------------------------------------

-- Table SpoldzielnieMieszkaniowe

CREATE TABLE "SpoldzielnieMieszkaniowe"(
  "numer_spoldzielni_PK" Integer NOT NULL,
  "REGON" Char(10 ) NOT NULL,
  "KRS" Char(9 ) NOT NULL,
  "NIP" Char(10 ) NOT NULL,
  "Nr_adresu" Integer NOT NULL
)
/

-- Create indexes for table SpoldzielnieMieszkaniowe

CREATE INDEX "IX_Relationship4" ON "SpoldzielnieMieszkaniowe" ("Nr_adresu")
/

-- Add keys for table SpoldzielnieMieszkaniowe

ALTER TABLE "SpoldzielnieMieszkaniowe" ADD CONSTRAINT "numer_spoldzielni_PK" PRIMARY KEY ("numer_spoldzielni_PK")
/

-- Table Zarzady

CREATE TABLE "Zarzady"(
  "numer_zarzadu_PK" Integer NOT NULL,
  "rozpoczecie_kadencji" Date NOT NULL,
  "planowane_zakonczenie_kadencji" Date NOT NULL,
  "numer_spoldzielni_PK" Integer NOT NULL
)
/

-- Create indexes for table Zarzady

CREATE INDEX "IX_Jest_zarzadzana_przez" ON "Zarzady" ("numer_spoldzielni_PK")
/

-- Add keys for table Zarzady

ALTER TABLE "Zarzady" ADD CONSTRAINT "numer_zarzadu_PK" PRIMARY KEY ("numer_zarzadu_PK")
/

-- Table Bloki

CREATE TABLE "Bloki"(
  "numer_bloku_PK" Integer NOT NULL,
  "ilosc_mieszkan" Integer NOT NULL,
  "numer_spoldzielni_PK" Integer NOT NULL,
  "Nr_adresu" Integer NOT NULL
)
/

-- Create indexes for table Bloki

CREATE INDEX "IX_Posiada_blok" ON "Bloki" ("numer_spoldzielni_PK")
/

CREATE INDEX "IX_Relationship17" ON "Bloki" ("Nr_adresu")
/

-- Add keys for table Bloki

ALTER TABLE "Bloki" ADD CONSTRAINT "numer_bloku_PK" PRIMARY KEY ("numer_bloku_PK")
/

-- Table Mieszkania

CREATE TABLE "Mieszkania"(
  "numer_mieszkania_PK" Integer NOT NULL,
  "ilosc_pokoi" Integer NOT NULL,
  "ilosc_lazienek" Integer NOT NULL,
  "numer_bloku_PK" Integer NOT NULL
)
/

-- Add keys for table Mieszkania

ALTER TABLE "Mieszkania" ADD CONSTRAINT "numer_mieszkani_PK" PRIMARY KEY ("numer_mieszkania_PK")
/

-- Table DzialkiBudowlane

CREATE TABLE "DzialkiBudowlane"(
  "numer_dzialki_PK" Integer NOT NULL,
  "ksiega_wieczysta" Char(1 ) NOT NULL,
  "powierzchnia" Float,
  "media" Varchar2(256 ),
  "garaz" Char(1 ),
  "numer_spoldzielni_PK" Integer NOT NULL,
  "Nr_adresu" Integer NOT NULL
)
/

-- Create indexes for table DzialkiBudowlane

CREATE INDEX "IX_Posiada_dzialke" ON "DzialkiBudowlane" ("numer_spoldzielni_PK")
/

CREATE INDEX "IX_Relationship14" ON "DzialkiBudowlane" ("Nr_adresu")
/

-- Add keys for table DzialkiBudowlane

ALTER TABLE "DzialkiBudowlane" ADD CONSTRAINT "numer_dzialki_PK" PRIMARY KEY ("numer_dzialki_PK")
/

-- Table Pracownicy

CREATE TABLE "Pracownicy"(
  "numer_pracownika_PK" Integer NOT NULL,
  "umowa_podpisana" Date NOT NULL,
  "umowa_rozwiazana" Date,
  "plec" Char(1 ) NOT NULL,
  "PESEL" Char(10 ),
  "numer_telefonu" Varchar2(12 ),
  "data_urodzenia" Date,
  "email_pracownika" Varchar2(512 ),
  "imie" Varchar2(64 ) NOT NULL,
  "nazwisko" Varchar2(64 ) NOT NULL,
  "numer_spoldzielni_PK" Integer NOT NULL,
  "Nr_stanowiska" Integer NOT NULL,
  "Nr_adresu" Integer NOT NULL,
  "Nr_umowy" Integer NOT NULL
)
/

-- Create indexes for table Pracownicy

CREATE INDEX "IX_Zatrudnia" ON "Pracownicy" ("numer_spoldzielni_PK")
/

CREATE INDEX "IX_Relationship10" ON "Pracownicy" ("Nr_stanowiska")
/

CREATE INDEX "IX_Relationship11" ON "Pracownicy" ("Nr_adresu")
/

CREATE INDEX "IX_Relationship3" ON "Pracownicy" ("Nr_umowy")
/

-- Add keys for table Pracownicy

ALTER TABLE "Pracownicy" ADD CONSTRAINT "numer_pracownika_PK" PRIMARY KEY ("numer_pracownika_PK")
/

-- Table Klienci

CREATE TABLE "Klienci"(
  "numer_klienta_PK" Integer NOT NULL,
  "imie" Varchar2(64 ) NOT NULL,
  "nazwisko" Varchar2(64 ) NOT NULL,
  "numer_telefonu" Varchar2(12 ),
  "PESEL" Char(11 ),
  "plec" Char(1 ) NOT NULL,
  "numer_mieszkania_PK" Integer,
  "numer_domu_PK" Integer,
  "numer_spoldzielni_PK" Integer NOT NULL,
  "numer_bloku_PK" Integer,
  "Nr_adresu" Integer NOT NULL,
  "Nr_umowy" Integer NOT NULL,
  "data_urodzenia" Date
)
/

-- Create indexes for table Klienci

CREATE INDEX "IX_Zamieszkuje_mieszkanie" ON "Klienci" ("numer_mieszkania_PK")
/

CREATE INDEX "IX_Zameszkuje_Dom" ON "Klienci" ("numer_domu_PK")
/

CREATE INDEX "IX_Posiada_umowe" ON "Klienci" ("numer_spoldzielni_PK")
/

CREATE INDEX "IX_Jest_zamieszkiwany" ON "Klienci" ("numer_bloku_PK")
/

CREATE INDEX "IX_Relationship18" ON "Klienci" ("Nr_adresu")
/

CREATE INDEX "IX_Relationship4" ON "Klienci" ("Nr_umowy")
/

-- Add keys for table Klienci

ALTER TABLE "Klienci" ADD CONSTRAINT "numer_klienta_PK" PRIMARY KEY ("numer_klienta_PK")
/

-- Table StronyInternetowe

CREATE TABLE "StronyInternetowe"(
  "numer_strony_PK" Integer NOT NULL,
  "adres_url" Varchar2(256 ) NOT NULL,
  "numer_spoldzielni_PK" Integer NOT NULL
)
/

-- Create indexes for table StronyInternetowe

CREATE INDEX "IX_Posiada_strone" ON "StronyInternetowe" ("numer_spoldzielni_PK")
/

-- Add keys for table StronyInternetowe

ALTER TABLE "StronyInternetowe" ADD CONSTRAINT "numer_strony_PK" PRIMARY KEY ("numer_strony_PK")
/

-- Table DomyJednorodzinne

CREATE TABLE "DomyJednorodzinne"(
  "numer_domu_PK" Integer NOT NULL,
  "powierzchnia" Float NOT NULL,
  "ilosc_pieter" Integer NOT NULL,
  "ilosc_pokoi" Integer,
  "ilosc_lazienek" Integer,
  "numer_spoldzielni_PK" Integer NOT NULL,
  "Nr_adresu" Integer NOT NULL
)
/

-- Create indexes for table DomyJednorodzinne

CREATE INDEX "IX_Posiada_dom" ON "DomyJednorodzinne" ("numer_spoldzielni_PK")
/

CREATE INDEX "IX_Relationship16" ON "DomyJednorodzinne" ("Nr_adresu")
/

-- Add keys for table DomyJednorodzinne

ALTER TABLE "DomyJednorodzinne" ADD CONSTRAINT "numer_domu_PK" PRIMARY KEY ("numer_domu_PK")
/

-- Table PracownicySprzatajacy

CREATE TABLE "PracownicySprzatajacy"(
  "numer_pracownika_PK" Integer NOT NULL,
  "sprzatane_bloki" Varchar2(512 ) NOT NULL
)
/

-- Add keys for table PracownicySprzatajacy

ALTER TABLE "PracownicySprzatajacy" ADD CONSTRAINT "Unique_Identifier5" PRIMARY KEY ("numer_pracownika_PK")
/

-- Table PracownicyKsiegowosci

CREATE TABLE "PracownicyKsiegowosci"(
  "numer_pracownika_PK" Integer NOT NULL,
  "Poziom" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table PracownicyKsiegowosci

ALTER TABLE "PracownicyKsiegowosci" ADD CONSTRAINT "Unique_Identifier6" PRIMARY KEY ("numer_pracownika_PK")
/

-- Table and Columns comments section

COMMENT ON COLUMN "PracownicyKsiegowosci"."Poziom" IS 'Określa stopień Księgowego (Młodszy/Zwykły/Starszy/Główny Księgowy)'
/

-- Table PracowncyAdministracji

CREATE TABLE "PracowncyAdministracji"(
  "numer_pracownika_PK" Integer NOT NULL,
  "Poziom" Varchar2(30 ) NOT NULL,
  "zarzadane_domy" Varchar2(512 ),
  "zarzadzane domy" Varchar2(512 )
)
/

-- Add keys for table PracowncyAdministracji

ALTER TABLE "PracowncyAdministracji" ADD CONSTRAINT "Unique_Identifier7" PRIMARY KEY ("numer_pracownika_PK")
/

-- Table and Columns comments section

COMMENT ON COLUMN "PracowncyAdministracji"."Poziom" IS 'Mówi o Poziomie Pracownika Administracji.'
/

-- Table PracownicyAdministracji_Blok

CREATE TABLE "PracownicyAdministracji_Blok"(
  "numer_bloku_PK" Integer NOT NULL,
  "numer_pracownika_PK" Integer NOT NULL
)
/

-- Table PracownicyAdministracji_DomJednorodzinny

CREATE TABLE "PracownicyAdministracji_DomJednorodzinny"(
  "numer_domu_PK" Integer NOT NULL,
  "numer_pracownika_PK" Integer NOT NULL
)
/

-- Table PracownicySprzatajacy_Blok

CREATE TABLE "PracownicySprzatajacy_Blok"(
  "numer_bloku_PK" Integer NOT NULL,
  "numer_pracownika_PK" Integer NOT NULL
)
/

-- Table Adresy

CREATE TABLE "Adresy"(
  "Nr_adresu" Integer NOT NULL,
  "Miasto" Varchar2(20 ) NOT NULL,
  "Ulica" Varchar2(30 ) NOT NULL,
  "Nr_lokalu" Varchar2(4 ) NOT NULL,
  "Nr_poczty" Integer NOT NULL
)
/

-- Create indexes for table Adresy

CREATE INDEX "IX_Relationship5" ON "Adresy" ("Nr_poczty")
/

-- Add keys for table Adresy

ALTER TABLE "Adresy" ADD CONSTRAINT "PK_Adresy" PRIMARY KEY ("Nr_adresu")
/

-- Table and Columns comments section

COMMENT ON COLUMN "Adresy"."Nr_adresu" IS 'Unikatowy identyfikator adresu (kllucz główny).'
/
COMMENT ON COLUMN "Adresy"."Miasto" IS 'Miasto'
/
COMMENT ON COLUMN "Adresy"."Ulica" IS 'Ulica'
/
COMMENT ON COLUMN "Adresy"."Nr_lokalu" IS 'Numer lokalu.'
/

-- Table Administratorzy

CREATE TABLE "Administratorzy"(
  "Nr_administratora" Integer NOT NULL,
  "Imie" Varchar2(20 ) NOT NULL,
  "Nazwisko" Varchar2(30 ) NOT NULL,
  "Rozpoczecie_pracy" Date NOT NULL,
  "Zakonczenie_pracy" Date,
  "numer_strony_PK" Integer NOT NULL
)
/

-- Create indexes for table Administratorzy

CREATE INDEX "IX_Relationship3" ON "Administratorzy" ("numer_strony_PK")
/

-- Add keys for table Administratorzy

ALTER TABLE "Administratorzy" ADD CONSTRAINT "PK_Administratorzy" PRIMARY KEY ("Nr_administratora")
/

-- Table and Columns comments section

COMMENT ON TABLE "Administratorzy" IS 'Relacja Administratorzy'
/
COMMENT ON COLUMN "Administratorzy"."Nr_administratora" IS 'Unikatowy identyfikator Administratora.'
/
COMMENT ON COLUMN "Administratorzy"."Imie" IS 'Imię Administratora'
/
COMMENT ON COLUMN "Administratorzy"."Nazwisko" IS 'nazwisko Administratora'
/
COMMENT ON COLUMN "Administratorzy"."Rozpoczecie_pracy" IS 'Data rozpoczęcia pracy jako Administrator.'
/
COMMENT ON COLUMN "Administratorzy"."Zakonczenie_pracy" IS 'Data zakończenia pracy jako Administrator'
/

-- Table Poczty

CREATE TABLE "Poczty"(
  "Nr_poczty" Integer NOT NULL,
  "Kod_poczty" Char(6 ) NOT NULL,
  "Poczta" Varchar2(20 ) NOT NULL
)
/

-- Add keys for table Poczty

ALTER TABLE "Poczty" ADD CONSTRAINT "PK_Poczty" PRIMARY KEY ("Nr_poczty")
/

ALTER TABLE "Poczty" ADD CONSTRAINT "Kod_poczty" UNIQUE ("Kod_poczty")
/

-- Table and Columns comments section

COMMENT ON TABLE "Poczty" IS 'Relacja słownikowa poczty.'
/
COMMENT ON COLUMN "Poczty"."Nr_poczty" IS 'Unikatowy identyfikator poczty'
/
COMMENT ON COLUMN "Poczty"."Kod_poczty" IS 'Kod danej poczty '
/
COMMENT ON COLUMN "Poczty"."Poczta" IS 'Lokalizacja poczty'
/

-- Table CzlonkowieZarzadu

CREATE TABLE "CzlonkowieZarzadu"(
  "Nr_czlonka" Integer NOT NULL,
  "Imie" Varchar2(20 ) NOT NULL,
  "Nazwisko" Varchar2(30 ) NOT NULL,
  "numer_zarzadu_PK" Integer NOT NULL,
  "Nr_roli" Integer NOT NULL
)
/

-- Create indexes for table CzlonkowieZarzadu

CREATE INDEX "IX_Relationship6" ON "CzlonkowieZarzadu" ("numer_zarzadu_PK")
/

CREATE INDEX "IX_Relationship9" ON "CzlonkowieZarzadu" ("Nr_roli")
/

-- Add keys for table CzlonkowieZarzadu

ALTER TABLE "CzlonkowieZarzadu" ADD CONSTRAINT "PK_CzlonkowieZarzadu" PRIMARY KEY ("Nr_czlonka")
/

-- Table and Columns comments section

COMMENT ON TABLE "CzlonkowieZarzadu" IS 'Relacja Członkowie Zarządu. '
/
COMMENT ON COLUMN "CzlonkowieZarzadu"."Nr_czlonka" IS 'Unikatowy identyfikator członka zarządu'
/
COMMENT ON COLUMN "CzlonkowieZarzadu"."Imie" IS 'Imię członka zarządu'
/
COMMENT ON COLUMN "CzlonkowieZarzadu"."Nazwisko" IS 'Nazwisko członka zarządu'
/

-- Table Role

CREATE TABLE "Role"(
  "Nr_roli" Integer NOT NULL,
  "Nazwa" Varchar2(20 ) NOT NULL,
  "Opis" Varchar2(400 ) NOT NULL
)
/

-- Add keys for table Role

ALTER TABLE "Role" ADD CONSTRAINT "PK_Role" PRIMARY KEY ("Nr_roli")
/

-- Table and Columns comments section

COMMENT ON TABLE "Role" IS 'Opisuje pełnioną rolę przez Członka Zarządu.'
/
COMMENT ON COLUMN "Role"."Nr_roli" IS 'Unikalny identyfikator pełnionej roli.'
/
COMMENT ON COLUMN "Role"."Nazwa" IS 'Nazwa pełnionej roli'
/
COMMENT ON COLUMN "Role"."Opis" IS 'Opis pełnionej roli'
/

-- Table Stanowiska

CREATE TABLE "Stanowiska"(
  "Nr_stanowiska" Integer NOT NULL,
  "Nazwa" Varchar2(20 ) NOT NULL,
  "Opis" Varchar2(450 ) NOT NULL
)
/

-- Add keys for table Stanowiska

ALTER TABLE "Stanowiska" ADD CONSTRAINT "PK_Stanowiska" PRIMARY KEY ("Nr_stanowiska")
/

-- Table and Columns comments section

COMMENT ON COLUMN "Stanowiska"."Nr_stanowiska" IS 'Unikalny identyfikator stanowiska'
/
COMMENT ON COLUMN "Stanowiska"."Nazwa" IS 'Nazwa pełnionego stanowiska'
/
COMMENT ON COLUMN "Stanowiska"."Opis" IS 'Opis pełnionego stanowiska'
/

-- Table Wynagrodzenia

CREATE TABLE "Wynagrodzenia"(
  "Nr_wynagrodzenia" Integer NOT NULL,
  "Data" Date NOT NULL,
  "Kwota_podstawowa" Number(8,2) NOT NULL,
  "Kowta_dodatkowa" Number(8,2),
  "numer_pracownika_PK" Integer NOT NULL
)
/

-- Create indexes for table Wynagrodzenia

CREATE INDEX "IX_Relationship12" ON "Wynagrodzenia" ("numer_pracownika_PK")
/

-- Add keys for table Wynagrodzenia

ALTER TABLE "Wynagrodzenia" ADD CONSTRAINT "PK_Wynagrodzenia" PRIMARY KEY ("Nr_wynagrodzenia")
/

-- Table and Columns comments section

COMMENT ON TABLE "Wynagrodzenia" IS 'Wynagrodzenie pracownika'
/
COMMENT ON COLUMN "Wynagrodzenia"."Nr_wynagrodzenia" IS 'Unikalny identyfiaktor wynagrodzenia'
/
COMMENT ON COLUMN "Wynagrodzenia"."Data" IS 'Data wypłaty wynagrodzenia dla pracownika'
/
COMMENT ON COLUMN "Wynagrodzenia"."Kwota_podstawowa" IS 'Wartosć wypłacanego wynagrodzenia podstawowego'
/
COMMENT ON COLUMN "Wynagrodzenia"."Kowta_dodatkowa" IS 'Wartość wypłacanej kwoty dodatkowej'
/

-- Table DaneNiejawne

CREATE TABLE "DaneNiejawne"(
  "Nr_uprawnien" Integer NOT NULL,
  "Data_waznosci" Date NOT NULL,
  "Opis" Varchar2(450 ) NOT NULL,
  "numer_pracownika_PK" Integer NOT NULL
)
/

-- Create indexes for table DaneNiejawne

CREATE INDEX "IX_Relationship13" ON "DaneNiejawne" ("numer_pracownika_PK")
/

-- Add keys for table DaneNiejawne

ALTER TABLE "DaneNiejawne" ADD CONSTRAINT "PK_DaneNiejawne" PRIMARY KEY ("Nr_uprawnien")
/

-- Table and Columns comments section

COMMENT ON TABLE "DaneNiejawne" IS 'Relacja opisująca Dane Niejawne (finansowe) niedostępne dla pozostałych pracowników.'
/
COMMENT ON COLUMN "DaneNiejawne"."Nr_uprawnien" IS 'Unikatowy identyfikator upranień do danych niejawnych Księgowego'
/
COMMENT ON COLUMN "DaneNiejawne"."Data_waznosci" IS 'Data ważności uzyskanych uprawnień'
/
COMMENT ON COLUMN "DaneNiejawne"."Opis" IS 'Opis uzyskanych upranwnień, do jakich danych ma dostęp (finansowych)'
/

-- Table Umowy

CREATE TABLE "Umowy"(
  "Nr_umowy" Integer NOT NULL,
  "Data_rozpoczecia" Date NOT NULL,
  "Data_zakonczenia" Date,
  "Opis" Varchar2(800 ) NOT NULL
)
/

-- Add keys for table Umowy

ALTER TABLE "Umowy" ADD CONSTRAINT "PK_Umowy" PRIMARY KEY ("Nr_umowy")
/

-- Table and Columns comments section

COMMENT ON COLUMN "Umowy"."Nr_umowy" IS 'Unikatowy numer identyfikujący umowę'
/
COMMENT ON COLUMN "Umowy"."Data_rozpoczecia" IS 'Data wejścia umowy w życie'
/
COMMENT ON COLUMN "Umowy"."Data_zakonczenia" IS 'Data zakończenia obowiązywania umowy'
/
COMMENT ON COLUMN "Umowy"."Opis" IS 'Treść umowy, precyzująca jej rodzaj, formę, warunki itp.'
/

-- Trigger for sequence NrSpoldzielniSeq for column numer_spoldzielni_PK in table SpoldzielnieMieszkaniowe ---------
CREATE OR REPLACE TRIGGER "ts_SpoldzielnieMieszkaniowe_NrSpoldzielniSeq" BEFORE INSERT
ON "SpoldzielnieMieszkaniowe" FOR EACH ROW
BEGIN
  :new."numer_spoldzielni_PK" := "NrSpoldzielniSeq".nextval;
END;
/
CREATE OR REPLACE TRIGGER "tsu_SpoldzielnieMieszkaniowe_NrSpoldzielniSeq" AFTER UPDATE OF "numer_spoldzielni_PK"
ON "SpoldzielnieMieszkaniowe" FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column "numer_spoldzielni_PK" in table "SpoldzielnieMieszkaniowe" as it uses sequence.');
END;
/

-- Trigger for sequence NrZarzaduSeq for column numer_zarzadu_PK in table Zarzady ---------
CREATE OR REPLACE TRIGGER "ts_Zarzady_NrZarzaduSeq" BEFORE INSERT
ON "Zarzady" FOR EACH ROW
BEGIN
  :new."numer_zarzadu_PK" := "NrZarzaduSeq".nextval;
END;
/
CREATE OR REPLACE TRIGGER "tsu_Zarzady_NrZarzaduSeq" AFTER UPDATE OF "numer_zarzadu_PK"
ON "Zarzady" FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column "numer_zarzadu_PK" in table "Zarzady" as it uses sequence.');
END;
/

-- Trigger for sequence NrBlokuSeq for column numer_bloku_PK in table Bloki ---------
CREATE OR REPLACE TRIGGER "ts_Bloki_NrBlokuSeq" BEFORE INSERT
ON "Bloki" FOR EACH ROW
BEGIN
  :new."numer_bloku_PK" := "NrBlokuSeq".nextval;
END;
/
CREATE OR REPLACE TRIGGER "tsu_Bloki_NrBlokuSeq" AFTER UPDATE OF "numer_bloku_PK"
ON "Bloki" FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column "numer_bloku_PK" in table "Bloki" as it uses sequence.');
END;
/

-- Trigger for sequence NrMieszkaniaSeq for column numer_mieszkania_PK in table Mieszkania ---------
CREATE OR REPLACE TRIGGER "ts_Mieszkania_NrMieszkaniaSeq" BEFORE INSERT
ON "Mieszkania" FOR EACH ROW
BEGIN
  :new."numer_mieszkania_PK" := "NrMieszkaniaSeq".nextval;
END;
/
CREATE OR REPLACE TRIGGER "tsu_Mieszkania_NrMieszkaniaSeq" AFTER UPDATE OF "numer_mieszkania_PK"
ON "Mieszkania" FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column "numer_mieszkania_PK" in table "Mieszkania" as it uses sequence.');
END;
/

-- Trigger for sequence NrDzialkiSeq for column numer_dzialki_PK in table DzialkiBudowlane ---------
CREATE OR REPLACE TRIGGER "ts_DzialkiBudowlane_NrDzialkiSeq" BEFORE INSERT
ON "DzialkiBudowlane" FOR EACH ROW
BEGIN
  :new."numer_dzialki_PK" := "NrDzialkiSeq".nextval;
END;
/
CREATE OR REPLACE TRIGGER "tsu_DzialkiBudowlane_NrDzialkiSeq" AFTER UPDATE OF "numer_dzialki_PK"
ON "DzialkiBudowlane" FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column "numer_dzialki_PK" in table "DzialkiBudowlane" as it uses sequence.');
END;
/

-- Trigger for sequence NrPracownikaSeq for column numer_pracownika_PK in table Pracownicy ---------
CREATE OR REPLACE TRIGGER "ts_Pracownicy_NrPracownikaSeq" BEFORE INSERT
ON "Pracownicy" FOR EACH ROW
BEGIN
  :new."numer_pracownika_PK" := "NrPracownikaSeq".nextval;
END;
/
CREATE OR REPLACE TRIGGER "tsu_Pracownicy_NrPracownikaSeq" AFTER UPDATE OF "numer_pracownika_PK"
ON "Pracownicy" FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column "numer_pracownika_PK" in table "Pracownicy" as it uses sequence.');
END;
/

-- Trigger for sequence NrKlientaSeq for column numer_klienta_PK in table Klienci ---------
CREATE OR REPLACE TRIGGER "ts_Klienci_NrKlientaSeq" BEFORE INSERT
ON "Klienci" FOR EACH ROW
BEGIN
  :new."numer_klienta_PK" := "NrKlientaSeq".nextval;
END;
/
CREATE OR REPLACE TRIGGER "tsu_Klienci_NrKlientaSeq" AFTER UPDATE OF "numer_klienta_PK"
ON "Klienci" FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column "numer_klienta_PK" in table "Klienci" as it uses sequence.');
END;
/

-- Trigger for sequence NrStronySeq for column numer_strony_PK in table StronyInternetowe ---------
CREATE OR REPLACE TRIGGER "ts_StronyInternetowe_NrStronySeq" BEFORE INSERT
ON "StronyInternetowe" FOR EACH ROW
BEGIN
  :new."numer_strony_PK" := "NrStronySeq".nextval;
END;
/
CREATE OR REPLACE TRIGGER "tsu_StronyInternetowe_NrStronySeq" AFTER UPDATE OF "numer_strony_PK"
ON "StronyInternetowe" FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column "numer_strony_PK" in table "StronyInternetowe" as it uses sequence.');
END;
/

-- Trigger for sequence NrDomuSeq for column numer_domu_PK in table DomyJednorodzinne ---------
CREATE OR REPLACE TRIGGER "ts_DomyJednorodzinne_NrDomuSeq" BEFORE INSERT
ON "DomyJednorodzinne" FOR EACH ROW
BEGIN
  :new."numer_domu_PK" := "NrDomuSeq".nextval;
END;
/
CREATE OR REPLACE TRIGGER "tsu_DomyJednorodzinne_NrDomuSeq" AFTER UPDATE OF "numer_domu_PK"
ON "DomyJednorodzinne" FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column "numer_domu_PK" in table "DomyJednorodzinne" as it uses sequence.');
END;
/

-- Trigger for sequence NrAdresuSeq for column Nr_adresu in table Adresy ---------
CREATE OR REPLACE TRIGGER "ts_Adresy_NrAdresuSeq" BEFORE INSERT
ON "Adresy" FOR EACH ROW
BEGIN
  :new."Nr_adresu" := "NrAdresuSeq".nextval;
END;
/
CREATE OR REPLACE TRIGGER "tsu_Adresy_NrAdresuSeq" AFTER UPDATE OF "Nr_adresu"
ON "Adresy" FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column "Nr_adresu" in table "Adresy" as it uses sequence.');
END;
/

-- Trigger for sequence NrAdministratoraSeq for column Nr_administratora in table Administratorzy ---------
CREATE OR REPLACE TRIGGER "ts_Administratorzy_NrAdministratoraSeq" BEFORE INSERT
ON "Administratorzy" FOR EACH ROW
BEGIN
  :new."Nr_administratora" := "NrAdministratoraSeq".nextval;
END;
/
CREATE OR REPLACE TRIGGER "tsu_Administratorzy_NrAdministratoraSeq" AFTER UPDATE OF "Nr_administratora"
ON "Administratorzy" FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column "Nr_administratora" in table "Administratorzy" as it uses sequence.');
END;
/

-- Trigger for sequence NrPocztySeq for column Nr_poczty in table Poczty ---------
CREATE OR REPLACE TRIGGER "ts_Poczty_NrPocztySeq" BEFORE INSERT
ON "Poczty" FOR EACH ROW
BEGIN
  :new."Nr_poczty" := "NrPocztySeq".nextval;
END;
/
CREATE OR REPLACE TRIGGER "tsu_Poczty_NrPocztySeq" AFTER UPDATE OF "Nr_poczty"
ON "Poczty" FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column "Nr_poczty" in table "Poczty" as it uses sequence.');
END;
/

-- Trigger for sequence NrCzlonkaSeq for column Nr_czlonka in table CzlonkowieZarzadu ---------
CREATE OR REPLACE TRIGGER "ts_CzlonkowieZarzadu_NrCzlonkaSeq" BEFORE INSERT
ON "CzlonkowieZarzadu" FOR EACH ROW
BEGIN
  :new."Nr_czlonka" := "NrCzlonkaSeq".nextval;
END;
/
CREATE OR REPLACE TRIGGER "tsu_CzlonkowieZarzadu_NrCzlonkaSeq" AFTER UPDATE OF "Nr_czlonka"
ON "CzlonkowieZarzadu" FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column "Nr_czlonka" in table "CzlonkowieZarzadu" as it uses sequence.');
END;
/

-- Trigger for sequence NrRoliSeq for column Nr_roli in table Role ---------
CREATE OR REPLACE TRIGGER "ts_Role_NrRoliSeq" BEFORE INSERT
ON "Role" FOR EACH ROW
BEGIN
  :new."Nr_roli" := "NrRoliSeq".nextval;
END;
/
CREATE OR REPLACE TRIGGER "tsu_Role_NrRoliSeq" AFTER UPDATE OF "Nr_roli"
ON "Role" FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column "Nr_roli" in table "Role" as it uses sequence.');
END;
/

-- Trigger for sequence NrUprawnienSeq for column Nr_uprawnien in table DaneNiejawne ---------
CREATE OR REPLACE TRIGGER "ts_DaneNiejawne_NrUprawnienSeq" BEFORE INSERT
ON "DaneNiejawne" FOR EACH ROW
BEGIN
  :new."Nr_uprawnien" := "NrUprawnienSeq".nextval;
END;
/
CREATE OR REPLACE TRIGGER "tsu_DaneNiejawne_NrUprawnienSeq" AFTER UPDATE OF "Nr_uprawnien"
ON "DaneNiejawne" FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column "Nr_uprawnien" in table "DaneNiejawne" as it uses sequence.');
END;
/


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE "Zarzady" ADD CONSTRAINT "Jest_zarzadzana_przez" FOREIGN KEY ("numer_spoldzielni_PK") REFERENCES "SpoldzielnieMieszkaniowe" ("numer_spoldzielni_PK")
/



ALTER TABLE "StronyInternetowe" ADD CONSTRAINT "Posiada_strone" FOREIGN KEY ("numer_spoldzielni_PK") REFERENCES "SpoldzielnieMieszkaniowe" ("numer_spoldzielni_PK")
/



ALTER TABLE "Klienci" ADD CONSTRAINT "Zamieszkuje_mieszkanie" FOREIGN KEY ("numer_mieszkania_PK") REFERENCES "Mieszkania" ("numer_mieszkania_PK")
/



ALTER TABLE "DzialkiBudowlane" ADD CONSTRAINT "Posiada_dzialke" FOREIGN KEY ("numer_spoldzielni_PK") REFERENCES "SpoldzielnieMieszkaniowe" ("numer_spoldzielni_PK")
/



ALTER TABLE "DomyJednorodzinne" ADD CONSTRAINT "Posiada_dom" FOREIGN KEY ("numer_spoldzielni_PK") REFERENCES "SpoldzielnieMieszkaniowe" ("numer_spoldzielni_PK")
/



ALTER TABLE "Pracownicy" ADD CONSTRAINT "Zatrudnia" FOREIGN KEY ("numer_spoldzielni_PK") REFERENCES "SpoldzielnieMieszkaniowe" ("numer_spoldzielni_PK")
/



ALTER TABLE "Mieszkania" ADD CONSTRAINT "Zawiera_mieszkania" FOREIGN KEY ("numer_bloku_PK") REFERENCES "Bloki" ("numer_bloku_PK")
/



ALTER TABLE "Bloki" ADD CONSTRAINT "Posiada_blok" FOREIGN KEY ("numer_spoldzielni_PK") REFERENCES "SpoldzielnieMieszkaniowe" ("numer_spoldzielni_PK")
/



ALTER TABLE "Klienci" ADD CONSTRAINT "Zameszkuje_Dom" FOREIGN KEY ("numer_domu_PK") REFERENCES "DomyJednorodzinne" ("numer_domu_PK")
/



ALTER TABLE "Klienci" ADD CONSTRAINT "Posiada_umowe" FOREIGN KEY ("numer_spoldzielni_PK") REFERENCES "SpoldzielnieMieszkaniowe" ("numer_spoldzielni_PK")
/



ALTER TABLE "Klienci" ADD CONSTRAINT "Jest_zamieszkiwany" FOREIGN KEY ("numer_bloku_PK") REFERENCES "Bloki" ("numer_bloku_PK")
/



ALTER TABLE "Administratorzy" ADD CONSTRAINT "Posiada_administratora" FOREIGN KEY ("numer_strony_PK") REFERENCES "StronyInternetowe" ("numer_strony_PK")
/



ALTER TABLE "SpoldzielnieMieszkaniowe" ADD CONSTRAINT "Spoldzielnia_ma_adres" FOREIGN KEY ("Nr_adresu") REFERENCES "Adresy" ("Nr_adresu")
/



ALTER TABLE "Adresy" ADD CONSTRAINT "Adres_posiada_poczte" FOREIGN KEY ("Nr_poczty") REFERENCES "Poczty" ("Nr_poczty")
/



ALTER TABLE "CzlonkowieZarzadu" ADD CONSTRAINT "Posiada_czlonkow" FOREIGN KEY ("numer_zarzadu_PK") REFERENCES "Zarzady" ("numer_zarzadu_PK")
/



ALTER TABLE "CzlonkowieZarzadu" ADD CONSTRAINT "Pelni_role" FOREIGN KEY ("Nr_roli") REFERENCES "Role" ("Nr_roli")
/



ALTER TABLE "Pracownicy" ADD CONSTRAINT "Pracownik_posiada_stanowisko" FOREIGN KEY ("Nr_stanowiska") REFERENCES "Stanowiska" ("Nr_stanowiska")
/



ALTER TABLE "Pracownicy" ADD CONSTRAINT "Pracownik_posiada_adres" FOREIGN KEY ("Nr_adresu") REFERENCES "Adresy" ("Nr_adresu")
/



ALTER TABLE "Wynagrodzenia" ADD CONSTRAINT "Pracownik_posiada_wynagrodzenie" FOREIGN KEY ("numer_pracownika_PK") REFERENCES "Pracownicy" ("numer_pracownika_PK")
/



ALTER TABLE "DaneNiejawne" ADD CONSTRAINT "PracownikKsiegowosci_posiada_dostep_do_danych_niejawnych" FOREIGN KEY ("numer_pracownika_PK") REFERENCES "PracownicyKsiegowosci" ("numer_pracownika_PK")
/



ALTER TABLE "DzialkiBudowlane" ADD CONSTRAINT "DzialkaBudowlana_posiada_adres" FOREIGN KEY ("Nr_adresu") REFERENCES "Adresy" ("Nr_adresu")
/



ALTER TABLE "DomyJednorodzinne" ADD CONSTRAINT "DomJednorodzinny_posiada_adres" FOREIGN KEY ("Nr_adresu") REFERENCES "Adresy" ("Nr_adresu")
/



ALTER TABLE "Bloki" ADD CONSTRAINT "Blok_posiada_adres" FOREIGN KEY ("Nr_adresu") REFERENCES "Adresy" ("Nr_adresu")
/



ALTER TABLE "Klienci" ADD CONSTRAINT "Klient_posiada_adres" FOREIGN KEY ("Nr_adresu") REFERENCES "Adresy" ("Nr_adresu")
/



ALTER TABLE "Pracownicy" ADD CONSTRAINT "Pracownik_posiada_umowe" FOREIGN KEY ("Nr_umowy") REFERENCES "Umowy" ("Nr_umowy")
/



ALTER TABLE "Klienci" ADD CONSTRAINT "Klient_posiada_umowe" FOREIGN KEY ("Nr_umowy") REFERENCES "Umowy" ("Nr_umowy")
/





