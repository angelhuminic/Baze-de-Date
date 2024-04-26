CREATE SEQUENCE secventa_masina
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100
NOCYCLE;

CREATE TABLE "Accesorii_disponibile" (
    id_accesoriu NUMBER PRIMARY KEY,
    nume_accesoriu VARCHAR2(255),
    pret NUMBER,
    model_corespondent VARCHAR2(255)
);


CREATE TABLE Merch (
    id_merch NUMBER PRIMARY KEY,
    nume_merch VARCHAR2(255),
    pret_merch NUMBER
);


CREATE TABLE Discount (
    id_discount NUMBER PRIMARY KEY,
    nume_discount VARCHAR2(255),
    valoare_discount NUMBER
);


CREATE TABLE "Servicii de intretinere" (
    id_serviciu NUMBER PRIMARY KEY,
    nume_serviciu VARCHAR2(255),
    pret_serviciu NUMBER,
    durata_serviciu NUMBER
);


CREATE TABLE "Servicii de asistenta rutiera" (
    id_serviciuar NUMBER PRIMARY KEY,
    nume_serviciuar VARCHAR2(255),
    pret_serviciuar NUMBER
);


CREATE TABLE "Serviciu de mobilitate" (
    id_servicium NUMBER PRIMARY KEY,
    nume_servicium VARCHAR2(255),
    masina_disponibila VARCHAR(255),
    pret_servicium NUMBER
);


CREATE TABLE "Activitati pentru clienti" (
    id_activitate NUMBER PRIMARY KEY,
    nume_activitate VARCHAR2(255),
    durata_activitate NUMBER,
    pret_activitate NUMBER,
    id_oras NUMBER,
    FOREIGN KEY (id_oras) REFERENCES Orase(id_oras)
);


CREATE TABLE Orase (
    id_oras NUMBER PRIMARY KEY,
    tara VARCHAR2(255)
);

CREATE TABLE Vanzator (
    id_vanzator NUMBER PRIMARY KEY,
    nume VARCHAR2(255),
    prenume VARCHAR2(255),
    numar_telefon VARCHAR2(10),
    email VARCHAR2(255),
    id_client NUMBER
    FOREIGN KEY (id_client) REFERENCES Client(id_client)
);


CREATE TABLE Client (
    id_client NUMBER PRIMARY KEY,
    nume VARCHAR2(255),
    prenume VARCHAR2(255),
    numar_telefon VARCHAR2(10),
    email VARCHAR2(255),
    masini_achizitionate NUMBER,
    id_masina NUMBER,
    id_merch NUMBER,
    id_accesoriu NUMBER,
    id_serviciuar NUMBER,
    id_servicium NUMBER,
    id_activitate NUMBER,
    id_serviciu NUMBER,
    FOREIGN KEY (id_merch) REFERENCES Client(id_merch)
    FOREIGN KEY (id_accesoriu) REFERENCES "Accesorii_disponibile"(id_accesoriu)
    FOREIGN KEY (id_serviciuar) REFERENCES "Servicii de asistenta rutiera"(id_serviciuar)
    FOREIGN KEY (id_servicium) REFERENCES "Serviciu de mobilitate"(id_servicium)
    FOREIGN KEY (id_activitate) REFERENCES "Activitati pentru clienti"(id_activitate)
    FOREIGN KEY (id_serviciu) REFERENCES "Servicii de intretinere"(id_serviciu)
);


CREATE TABLE Firma (
    id_firma NUMBER PRIMARY KEY,
    nume_firma VARCHAR2(255),
    email_firma VARCHAR2(255),
    CUI VARCHAR2(12),
    oras_firma VARCHAR2(255),
    id_serviciuar NUMBER,
    id_servicium NUMBER,
    FOREIGN KEY (id_serviciuar) REFERENCES "Servicii de asistenta rutiera"(id_serviciuar)
    FOREIGN KEY (id_servicium) REFERENCES "Serviciu de mobilitate"(id_servicium)
);


CREATE TABLE "Piese de schimb" (
    id_piesa NUMBER PRIMARY KEY,
    nume_piesa VARCHAR2(255),
    pret_piesa NUMBER,
    model_corespunzator VARCHAR2(255),
    id_masina NUMBER;
    FOREIGN KEY (id_masina) REFERENCES Masina(id_masina)
);


CREATE TABLE Masina (
    id_masina NUMBER PRIMARY KEY,
    marca VARCHAR2(255),
    modell VARCHAR2(255),
    an_de_fabricatie NUMBER,
    pret NUMBER,
    id_discount NUMBER,
    id_vanzator NUMBER,
    id_firma NUMBER,
    FOREIGN KEY (id_discount) REFERENCES Discount(id_discount),
    FOREIGN KEY (id_vanzator) REFERENCES Vanzator(id_vanzator),
    FOREIGN KEY (id_firma) REFERENCES Firma(id_firma)
);


CREATE TABLE PieseMasina (
    id_pies_masina NUMBER PRIMARY KEY,
    id_piesa NUMBER,
    id_masina NUMBER,
    FOREIGN KEY (id_piesa) REFERENCES "Piese de schimb"(id_piesa),
    FOREIGN KEY (id_masina) REFERENCES Masina(id_masina)
);


CREATE TABLE MotorsportTeam (
    id_echipa NUMBER PRIMARY KEY,
    nume_echipa VARCHAR2(255),
    buget_echipa NUMBER(10, 2),
    numar_angajati_echipa NUMBER,
    id_masina NUMBER,
    FOREIGN KEY (id_masina) REFERENCES Masina(id_masina)
);


CREATE TABLE Piloti (
    id_pilot NUMBER PRIMARY KEY,
    nume_pilot VARCHAR2(255),
    prenume_pilot VARCHAR2(255),
    experienta NUMBER,
    salariu NUMBER(10,2),
    id_echipa NUMBER,
    FOREIGN KEY (id_echipa) REFERENCES MotorsportTeam(id_echipa)
);

INSERT INTO "Accesorii_disponibile"
VALUES 
    (1, 'Splitter fata', 9000, 'Porsche 911');

INSERT INTO "Accesorii_disponibile" 
VALUES 
    (2, 'Spoiler spate', 10500, 'Porsche 911');

INSERT INTO "Accesorii_disponibile" 
VALUES 
    (3, 'Roll-cage', 50000, 'Porsche 911');

INSERT INTO "Accesorii_disponibile" 
VALUES 
    (4, 'Shark-fin', 5000, 'Porsche 911');

INSERT INTO "Accesorii_disponibile" 
VALUES 
    (5, 'Widebody kit', 99000, 'Porsche 911');



INSERT INTO Merch 
VALUES 
    (1, 'Tricou', 100);

INSERT INTO Merch 
VALUES 
    (2, 'Hanorac', 150);

INSERT INTO Merch 
VALUES 
    (3, 'Sapca', 80);

INSERT INTO Merch 
VALUES 
    (4, 'Cana', 50);

INSERT INTO Merch 
VALUES 
    (5, 'Breloc', 40);


INSERT INTO Discount 
VALUES 
    (1, 'Discount pentru veteranii de razboi', 15);

INSERT INTO Discount 
VALUES 
    (2, 'Discount pentru cadre didactice', 10);

INSERT INTO Discount 
VALUES 
    (3, 'Discount pentru angajatii showroom-ului', 10);

INSERT INTO Discount 
VALUES 
    (4, 'Discount pentru pilotii de curse', 20);

INSERT INTO Discount 
VALUES 
    (5, 'Discount de Craciun', 10);



INSERT INTO "Servicii de intretinere" 
VALUES 
    (1, 'Schimb de ulei', 1000, 120);

INSERT INTO "Servicii de intretinere" 
VALUES 
    (2, 'Inlocuire filtre', 3000, 200);

INSERT INTO "Servicii de intretinere" 
VALUES 
    (3, 'Schimb de cauciucuri', 600, 30);

INSERT INTO "Servicii de intretinere" 
VALUES 
    (4, 'Geometrie roti', 800, 30);

INSERT INTO "Servicii de intretinere" 
VALUES 
    (5, 'Revizie', 2000, 600);


INSERT INTO "Servicii de asistenta rutiera" 
VALUES 
    (1, 'Remorcare vehicul', 750);

INSERT INTO "Servicii de asistenta rutiera" 
VALUES 
    (2, 'Vulcanizare mobila', 200);

INSERT INTO "Servicii de asistenta rutiera" 
VALUES 
    (3, 'Platforma', 1000);

INSERT INTO "Servicii de asistenta rutiera" 
VALUES 
    (4, 'Alimentare mobila', 800);

INSERT INTO "Servicii de asistenta rutiera" 
VALUES 
    (5, 'Incarcare baterie', 100);




INSERT INTO "Serviciu de mobilitate" 
VALUES 
    (1, 'Inchiriere masina', 'Porsche Cayenne', 1000);

INSERT INTO "Serviciu de mobilitate" 
VALUES 
    (2, 'Inchiriere masina', 'Porsche Macan', 1100);

INSERT INTO "Serviciu de mobilitate" 
VALUES 
    (3, 'Inchiriere masina', 'Porsche Taycan', 1600);

INSERT INTO "Serviciu de mobilitate" 
VALUES 
    (4, 'Inchiriere masina', 'Porsche 911', 2500);

INSERT INTO "Serviciu de mobilitate" 
VALUES 
    (5, 'Transport cu sofer', 'Porsche Panamera Sport Turismo', 800);
    
INSERT INTO "Serviciu de mobilitate" 
VALUES 
    (6, 'Transport cu sofer', 'Porsche Panamera Long Version', 950);
    
INSERT INTO "Serviciu de mobilitate" 
VALUES 
    (7, 'Transport cu sofer', 'Porsche Cayenne Turbo S', 850);
    
    INSERT INTO "Serviciu de mobilitate" 
VALUES 
    (8, 'Transport copil', 'Porsche Cayenne E-hybrid', 2000);




INSERT INTO Orase 
VALUES 
    (1, 'Romania');

INSERT INTO Orase 
VALUES 
    (2, 'Franta');

INSERT INTO Orase 
VALUES 
    (3, 'Italia');

INSERT INTO Orase 
VALUES 
    (4, 'Germania');

INSERT INTO Orase 
VALUES 
    (5, 'Spania');
    
INSERT INTO Orase 
VALUES 
    (6, 'USA');
    
    INSERT INTO Orase 
VALUES 
    (7, 'Singapore');
    
    INSERT INTO Orase 
VALUES 
    (8, 'Romania');
    
    INSERT INTO Orase 
VALUES 
    (9, 'Romania');



INSERT INTO "Activitati pentru clienti" 
VALUES 
    (1, 'Turul bisericilor din Moldova', 5, 5000, 1);

INSERT INTO "Activitati pentru clienti" 
VALUES 
    (2, 'Mers la mare', 4, 4000, 8);

INSERT INTO "Activitati pentru clienti" 
VALUES 
    (3, 'Urcat pe munte', 3, 3000, 9);

INSERT INTO "Activitati pentru clienti" 
VALUES 
    (4, 'Paul Ricard F1 GP', 5, 6000, 2);

INSERT INTO "Activitati pentru clienti" 
VALUES 
    (5, 'Monza F1 GP', 7, 10000, 3);
    
INSERT INTO "Activitati pentru clienti" 
VALUES 
    (6, 'Nurburgring Tour', 6, 10000, 4);
    
INSERT INTO "Activitati pentru clienti" 
VALUES 
    (7, 'Catalunya F1 GP', 4, 7500, 5);
    
INSERT INTO "Activitati pentru clienti" 
VALUES 
    (8, 'Texas F1 GP', 6, 21000, 6);
    
INSERT INTO "Activitati pentru clienti" 
VALUES 
    (9, 'Singapore F1 GP', 7, 38000, 7);
    
INSERT INTO "Activitati pentru clienti" 
VALUES 
    (10, 'CanonBall Run', 7, 32000, 6);




INSERT INTO Client 
VALUES 
    (1, 'Man', 'Ion', '0700000000', 'man.ion@email.com', 3, 1, 3, 2, 4, 2, 1, 3);

INSERT INTO Client 
VALUES 
    (2, 'Man', 'Alexandru', '0700000001', 'man.alex@email.com', 2, 2, 3, 2, 4, 2, 1, 3);

INSERT INTO Client 
VALUES 
    (3, 'Man', 'George', '0700000002', 'man.george@email.com', 2, 3, 3, 2, 4, 2, 1, 3);

INSERT INTO Client 
VALUES 
    (4, 'Woman', 'Cristina', '0700000003', 'woman.cristina@email.com', 1, 4, 3, 2, 4, 2, 1, 3);

INSERT INTO Client 
VALUES 
    (5, 'Woman', 'Ana', '0700000004', 'woman.Ana@email.com', 1, 5, 3, 2, 4, 2, 1, 3);
    
INSERT INTO Client 
VALUES 
    (6, 'Man', 'John', '0700000005', 'man.john@email.com', 1, 3, 3, 2, 4, 2, 1, 3);
    
INSERT INTO Client 
VALUES 
    (7, 'Man', 'Paul', '0700000006', 'man.paul@email.com', 1, 3, 3, 2, 4, 2, 1, 3);
    
INSERT INTO Client 
VALUES 
    (8, 'Man', 'David', '0700000007', 'man.david@email.com', 3, 6, 3, 2, 4, 2, 1, 3);
    
INSERT INTO Client 
VALUES 
    (9, 'Man', 'Andrei', '0700000008', 'man.andrei@email.com', 2, 4, 3, 2, 4, 2, 1, 3);
    
INSERT INTO Client 
VALUES 
    (10, 'Man', 'Angel', '0700000009', 'man.angel@email.com', 6, 6, 3, 2, 4, 2, 1, 3);
    
INSERT INTO Client 
VALUES 
    (11, 'Man', 'Angel', '0700000009', 'man.angel@email.com', 9, 6, 3, 2, 4, 2, 1, 3);

INSERT INTO Client 
VALUES 
    (12, 'Man', 'Angel', '0700000009', 'man.angel@email.com', 11, 6, 3, 2, 4, 2, 1, 3);
    
INSERT INTO Client 
VALUES 
    (13, 'Woman', 'Andreea', '0700000018', 'man.andrei@email.com', 12,5, 3, 2, 4, 2, 1, 3);



INSERT INTO Vanzator 
VALUES 
    (1, 'Vlad', 'Alexandru', '0799999995', 'vlad.alexandru@example.com', 1);

INSERT INTO Vanzator 
VALUES 
    (2, 'Ionescu', 'Maria', '0799999996', 'maria.ionescu@example.com', 2);

INSERT INTO Vanzator 
VALUES 
    (3, 'Popa', 'Andrei', '0799999997', 'andrei.popa@example.com', 3);

INSERT INTO Vanzator 
VALUES 
    (4, 'Georgescu', 'Ana', '0799999998', 'ana.georgescu@example.com', 4);

INSERT INTO Vanzator 
VALUES 
    (5, 'Popovici', 'Robert', '0799999999', 'cristian.popovici@example.com', 8);

INSERT INTO Vanzator 
VALUES 
    (6, 'Popovici', 'Robert', '0799999999', 'cristian.popovici@example.com', 10);

INSERT INTO Vanzator 
VALUES 
    (7, 'Ionescu', 'Maria', '0799999996', 'maria.ionescu@example.com', 7);

INSERT INTO Vanzator 
VALUES 
    (8, 'Vlad', 'Alexandru', '0799999995', 'vlad.alexandru@example.com', 6);

INSERT INTO Vanzator 
VALUES 
    (9, 'Popa', 'Andrei', '0799999997', 'andrei.popa@example.com', 5);

INSERT INTO Vanzator 
VALUES 
    (10, 'Popa', 'Andrei', '0799999997', 'andrei.popa@example.com', 9);
    
INSERT INTO Vanzator 
VALUES 
    (11, 'Popa', 'Andrei', '0799999997', 'andrei.popa@example.com', 11);

INSERT INTO Vanzator 
VALUES 
    (12, 'Popa', 'Andrei', '0799999997', 'andrei.popa@example.com', 12);




INSERT INTO Firma 
VALUES 
    (1, 'RaceBox', 'contact@racebox.com', '123456789', 'Bucuresti', 4, 2);

INSERT INTO Firma 
VALUES 
    (2, 'Cluj-Napoca Rally Team', 'office@cjrt.com', '987654321', 'Cluj-Napoca', 2, 3);

INSERT INTO Firma 
VALUES 
    (3, 'Custom Tuning', 'info@customtuning.com', '456789123', 'Bucuresti', 3, 1);

INSERT INTO Firma 
VALUES 
    (4, 'MegaCar', 'contact@megacar.com', '789123456', 'Constanta', 5, 4);

INSERT INTO Firma 
VALUES 
    (5, 'AutoTech', 'info@autotech.com', '321654987', 'Iasi', 1, 5);

INSERT INTO Firma 
VALUES 
    (6, 'ServiceExpert', 'office@serviceexpert.com', '654987321', 'Brasov', 3, 2);

INSERT INTO Firma 
VALUES 
    (7, 'Automobili', 'contact@automobili.com', '789456123', 'Brasov', 4, 3);

INSERT INTO Firma 
VALUES 
    (8, 'Vivacy', 'info@carfix.com', '123789456', 'Bucuresti', 5, 1);

INSERT INTO Firma 
VALUES 
    (9, 'AutoMaster', 'contact@automaster.com', '456123789', 'Cluj-Napoca', 1, 4);

INSERT INTO Firma 
VALUES 
    (10, 'CarTech', 'info@cartech.com', '987321654', 'Bucuresti', 2, 5);


INSERT INTO Masina
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', 'Macan S', 2023, 79000, 2, 1, 3);

INSERT INTO Masina 
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', 'Macan GTS', 2023, 95000, 1, 2, 2);

INSERT INTO Masina 
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', 'Taycan 4S', 2023, 140000, 1, 3, 1);

INSERT INTO Masina 
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', 'Taycan Sport Turismo', 2023, 130000, 3, 4, 4);

INSERT INTO Masina 
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', 'Cayenne Coupe', 2023, 125000, 5, 5, 5);

INSERT INTO Masina 
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', '911 GT2 RS', 2023, 325000, 4, 6, 7);

INSERT INTO Masina 
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', 'Cayenne Turbo S', 2023, 158000, 2, 2, 7);

INSERT INTO Masina 
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', 'Panamera GTS', 2023, 158000, 3, 3, 8);

INSERT INTO Masina 
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', '911 Turbo S', 2023, 270000, 4, 6, 7);

INSERT INTO Masina 
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', 'Panamera Sport Turismo E-hybrid', 2023, 128000, 5, 5, 10);
    
INSERT INTO Masina 
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', '911 GT3 RS', 2024, 368000, 4, 6, 1);
    
INSERT INTO Masina 
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', '911 GTS', 2022, 188000, 2, 2, 7);
    
    
INSERT INTO Masina 
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', 'Panamera Sport E-hybrid', 2021, 159500, 5, 5, 2);
    
INSERT INTO Masina 
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', '911 GT3 R', 2020, 488000, 4, 2, 1);
    
INSERT INTO Masina 
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', '911 GT2 MR', 2020, 695000, 4, 8, 3);
    
INSERT INTO Masina 
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', 'Cayman GT4', 2022, 200000, 4, 8, 2);
    
INSERT INTO Masina 
VALUES 
    (secventa_masina.NEXTVAL, 'Porsche', 'Cayman GTS 4.0', 2021, 162490, 4, 7, 5);



INSERT INTO "Piese de schimb" 
VALUES 
    (1, 'Discuri de frana ceramice', 91000, 'Porsche 911', 6);

INSERT INTO "Piese de schimb" 
VALUES 
    (2, 'Turbina performance', 41000, 'Porsche 911', 9);

INSERT INTO "Piese de schimb" 
VALUES 
    (3, 'Brat suspensie', 2300, 'Porsche Macan', 1);

INSERT INTO "Piese de schimb" 
VALUES 
    (4, 'Sistem entertainment', 6500, 'Porsche Macan', 2);

INSERT INTO "Piese de schimb" 
VALUES 
    (5, 'Filtru de aer', 800, 'Porsche Taycan', 3);

INSERT INTO "Piese de schimb" 
VALUES 
    (6, 'Invertor', 6700, 'Porsche Taycan', 4);

INSERT INTO "Piese de schimb" 
VALUES 
    (7, 'Lant de distributie', 3000, 'Porsche Cayenne', 5);

INSERT INTO "Piese de schimb" 
VALUES 
    (8, 'Far Matrix Led', 7000, 'Porsche Cayenne', 7);

INSERT INTO "Piese de schimb" 
VALUES 
    (9, 'Filtru de ulei', 600, 'Porsche Panamera', 8);

INSERT INTO "Piese de schimb" 
VALUES 
    (10, 'Ambreiaj', 9000, 'Porsche Panamera', 10);

INSERT INTO "Piese de schimb" 
VALUES 
    (11, 'Evacuare SportPlus', 8000, 'Porsche 911', 21);

INSERT INTO "Piese de schimb" 
VALUES 
    (12, 'Banda LED', 850, 'Porsche 911', 22);
    
INSERT INTO "Piese de schimb" 
VALUES 
    (13, 'Scaune ComfortPlus', 4500, 'Porsche Panamera', 23);
    
INSERT INTO "Piese de schimb" 
VALUES 
    (14, 'Capota din carbon forjat', 8750, 'Porsche 911', 21);
    
    

INSERT INTO PieseMasina (id_piesa_masina, id_piesa, id_masina)
VALUES 
	(1, 1, 26);

INSERT INTO PieseMasina (id_piesa_masina, id_piesa, id_masina)
VALUES 
	(2, 2, 29);

INSERT INTO PieseMasina (id_piesa_masina, id_piesa, id_masina)
VALUES 
	(3, 3, 21);

INSERT INTO PieseMasina (id_piesa_masina, id_piesa, id_masina)
VALUES 
	(4, 4, 22);

INSERT INTO PieseMasina (id_piesa_masina, id_piesa, id_masina)
VALUES 
	(5, 5, 23);

INSERT INTO PieseMasina (id_piesa_masina, id_piesa, id_masina)
VALUES 
	(6, 6, 24);

INSERT INTO PieseMasina (id_piesa_masina, id_piesa, id_masina)
VALUES 
	(7, 7, 25);

INSERT INTO PieseMasina (id_piesa_masina, id_piesa, id_masina)
VALUES 
	(8, 8, 27);

INSERT INTO PieseMasina (id_piesa_masina, id_piesa, id_masina)
VALUES 
	(9, 9, 28);

INSERT INTO PieseMasina (id_piesa_masina, id_piesa, id_masina)
VALUES 
	(10, 10, 30);
    
    
    
INSERT INTO MotorsportTeam 
VALUES
    (1, 'Porsche Team A', 2000000.00, 30, 6);
    
INSERT INTO MotorsportTeam 
VALUES
    (5, 'Porsche Team A', 2000000.00, 30, 42);
    
INSERT INTO MotorsportTeam 
VALUES
    (2, 'Porsche Team B', 2000000.00, 30, 9);
    
INSERT INTO MotorsportTeam 
VALUES
    (6, 'Porsche Team B', 2000000.00, 30, 22);
    
INSERT INTO MotorsportTeam 
VALUES
    (3, 'Porsche Team C', 2000000.00, 30, 21);
    
INSERT INTO MotorsportTeam 
VALUES
    (7, 'Porsche Team C', 2000000.00, 30, 41);

INSERT INTO MotorsportTeam 
VALUES
    (4, 'Porsche Team D', 2000000.00, 30, 43);

INSERT INTO MotorsportTeam 
VALUES
    (8, 'Porsche Team D', 2000000.00, 30, 44);


INSERT INTO Piloti
VALUES
    (1, 'Ten', 'Angel', 10, 250000, 5);
    
INSERT INTO Piloti
VALUES
    (2, 'Best', 'George', 8, 180000, 1)
    
INSERT INTO Piloti
VALUES
    (3, 'Glock', 'Timo', 9, 200000, 2)

INSERT INTO Piloti
VALUES
    (4, 'Russell', 'George', 9, 220000, 4)
    
INSERT INTO Piloti
VALUES
    (5, 'Verstappen', 'Max', 10, 250000, 7)
    
INSERT INTO Piloti
VALUES
    (6, 'Gasly', 'Pierre', 9, 215000, 8)
    
INSERT INTO Piloti
VALUES
    (7, 'Zhou', 'Guanyu', 8, 210000, 6)
    
INSERT INTO Piloti
VALUES
    (8, 'Ricciardo', 'Daniel', 9, 245000, 3)

