DROP TABLE IF EXISTS tblDelivery;
DROP TABLE IF EXISTS tblPayment;
DROP TABLE IF EXISTS tblProductRating;
DROP TABLE IF EXISTS tblShoppingCart;
DROP TABLE IF EXISTS tblRating;
DROP TABLE IF EXISTS tblProduct;
DROP TABLE IF EXISTS tblType;
DROP TABLE IF EXISTS tblCategory;
DROP TABLE IF EXISTS tblUser;
DROP TABLE IF EXISTS tblRights;
DROP TABLE IF EXISTS tblIngredient;
DROP TABLE IF EXISTS tblRecipeStep;
DROP TABLE IF EXISTS tblRecipe;

-- Rights and User SQL from author @LuxJoghurt (Pedro Ribeiro Costa)

CREATE TABLE tblRights(
    idRight INT NOT NULL AUTO_INCREMENT,
    dtRight VARCHAR(6) NOT NULL,
    PRIMARY KEY (idRight)
);

INSERT INTO tblRights (idRight, dtRight)
VALUES (1, 'Admin'),
       (2, 'Staff'),
       (3, 'User');


CREATE TABLE tblUser(
    idUsername VARCHAR(10) UNIQUE NOT NULL,
    dtFirstName VARCHAR(40) NOT NULL,
    dtLastName VARCHAR(40) NOT NULL,
    dtPassword VARCHAR(80) NOT NULL,
    dtEmail VARCHAR(50) NOT NULL,
    dtTelephone VARCHAR(15),
    dtPLZ VARCHAR(6) NOT NULL,
    dtHouseNR VARCHAR(3) NOT NULL,
    dtStreet VARCHAR(35) NOT NULL,
    dtCountry VARCHAR(5) NOT NULL,
    fiRight INT NOT NULL,
    PRIMARY KEY (idUsername),
    FOREIGN KEY (fiRight) REFERENCES tblRights (idRight) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblUser
VALUES  ('admin', 'Admin', 'Admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin@admin.lu', '621 345 345', '1234', '3', 'Am Seif', '/', 1),
        ('staff' , 'Staff', 'Staff', '1562206543da764123c21bd524674f0a8aaf49c8a89744c97352fe677f7e4006', 'staff@staff.lu', '691 567 567', '1234', '3', 'Am Seif', '/', 2),
        ('user', 'User', 'User', '04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', 'user@user.lu', '621 788 897', '1234', '3', 'Am Seif', '/', 3),
        ('ribpe261', 'Pedro', 'Ribeiro Costa', 'd9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e', 'ribpe261@school.lu', '691 522 129', '1940', '274', 'route de Longwy', '/', 1),
        ('frith033', 'Thibaut', 'Friederici', 'd9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e', 'frith033@school.lu', '691 703 747', '6724', '13', 'Rue des Foyers', '/', 1),
        ('friti725', 'Tim', 'Frisch', 'd9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e', 'friti725@school.lu', '621 816 424', '6183', '39', 'rue de ecole', '/', 1),
        ('guoka342', 'Guo', 'Kaidi', 'd9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e', 'guoka342@school.lu', '661520300', '3429', '12', 'route de Burange', '/', 1),
        ('gammi625', 'Mihails', 'Gamass', 'd9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e', 'gammi625@school.lu', '691 879 699', '8380', '13', 'Rue de la Gare', '/', 1);