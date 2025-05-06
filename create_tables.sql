
CREATE TABLE Category (
    category_id INTEGER PRIMARY KEY,
    nom VARCHAR2(255)
);


CREATE TABLE Supplier (
    supplier_id INTEGER PRIMARY KEY,
    nom VARCHAR2(255) NOT NULL,
    contact_info VARCHAR2(255)
);


CREATE TABLE Produit (
    produit_id INTEGER PRIMARY KEY,
    nom VARCHAR2(255) NOT NULL,
    category_id INTEGER,
    supplier_id INTEGER,
    price NUMBER(10,2) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);


CREATE TABLE Inventaire (
    inventaire_id INTEGER PRIMARY KEY,
    produit_id INTEGER NOT NULL,
    quantite INTEGER NOT NULL,
    location VARCHAR2(255) NOT NULL,
    FOREIGN KEY (produit_id) REFERENCES Produit(produit_id)
);


CREATE TABLE Ordre_Achat (
    ordre_id INTEGER PRIMARY KEY,
    supplier_id INTEGER NOT NULL,
    ordre_date DATE,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);


CREATE TABLE Detail_Achat (
    detail_id INTEGER PRIMARY KEY,
    ordre_id INTEGER NOT NULL,
    produit_id INTEGER NOT NULL,
    quantite INTEGER,
    price_unit NUMBER(10, 2),
    FOREIGN KEY (ordre_id) REFERENCES Ordre_Achat(ordre_id),
    FOREIGN KEY (produit_id) REFERENCES Produit(produit_id)
);

-- =============================
-- Insertion des catégories
-- =============================
INSERT INTO Category (category_id, nom)
VALUES (1, 'Électrique');

INSERT INTO Category (category_id, nom)
VALUES (2, 'Acoustique');

INSERT INTO Category (category_id, nom)
VALUES (3, 'Basse');

-- =============================
-- Insertion des fournisseurs
-- =============================
INSERT INTO Supplier (supplier_id, nom, contact_info)
VALUES (1, 'Gibson', 'contact@gibson.com');

INSERT INTO Supplier (supplier_id, nom, contact_info)
VALUES (2, 'Fender', 'support@fender.com');

INSERT INTO Supplier (supplier_id, nom, contact_info)
VALUES (3, 'Jackson', 'info@jacksonguitars.com');

-- =============================
-- Insertion des produits Gibson
-- =============================
INSERT INTO Produit (produit_id, nom, category_id, supplier_id, price)
VALUES (1, 'Les Paul Standard', 1, 1, 3499.99);

INSERT INTO Produit (produit_id, nom, category_id, supplier_id, price)
VALUES (2, 'SG Standard', 1, 1, 2299.99);

INSERT INTO Produit (produit_id, nom, category_id, supplier_id, price)
VALUES (3, 'Hummingbird Original', 2, 1, 4199.99);

-- =============================
-- Insertion des produits Fender
-- =============================
INSERT INTO Produit (produit_id, nom, category_id, supplier_id, price)
VALUES (4, 'Stratocaster American Pro II', 1, 2, 1899.99);

INSERT INTO Produit (produit_id, nom, category_id, supplier_id, price)
VALUES (5, 'Telecaster Deluxe', 1, 2, 1799.99);

INSERT INTO Produit (produit_id, nom, category_id, supplier_id, price)
VALUES (6, 'Jazz Bass', 3, 2, 1699.99);

-- =============================
-- Insertion des produits Jackson
-- =============================
INSERT INTO Produit (produit_id, nom, category_id, supplier_id, price)
VALUES (7, 'Soloist SLX DX', 1, 3, 1199.99);

INSERT INTO Produit (produit_id, nom, category_id, supplier_id, price)
VALUES (8, 'Dinky DK2', 1, 3, 999.99);

INSERT INTO Produit (produit_id, nom, category_id, supplier_id, price)
VALUES (9, 'Concert Bass CBXNT IV', 3, 3, 899.99);


