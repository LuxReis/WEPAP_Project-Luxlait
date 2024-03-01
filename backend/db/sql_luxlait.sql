CREATE TABLE tblUser(
    idUsername VARCHAR(10) UNIQUE,
    dtPassword VARCHAR(40) NOT NULL,
    dtEmail VARCHAR(50) NOT NULL,
    dtTelephone VARCHAR(9),
    dtPLZ VAR(6) NOT NULL,
    dtHouseNR VARCHAR(3) NOT NULL,
    dtStreet VARCHAR(15) NOT NULL,
    dtCountry VARCHAR(50) NOT NULL,
    PRIMARY KEY (idUsername)
);

CREATE TABLE tblProduct(
    idProduct INT NOT NULL AUTO_INCREMENT,
    dtProduct
);