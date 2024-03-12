DROP TABLE IF EXISTS tblCountry;
DROP TABLE IF EXISTS tblRights;
DROP TABLE IF EXISTS tblUser;
DROP TABLE IF EXISTS tblProduct;
DROP TABLE IF EXISTS tblType;
DROP TABLE IF EXISTS tblCategory;



CREATE TABLE tblCountry(
    idCountry VARCHAR(5) NOT NULL,
    dtCountry VARCHAR(50) NOT NULL,
    dtPhoneCode INT,
    dtImage VARCHAR(200),
    PRIMARY KEY (idCountry)
);

INSERT INTO tblCountry (idCountry, dtCountry, dtPhoneCode, dtImage)
VALUES  ('AF', 'Afghanistan', 93, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_the_Taliban.svg/270px-Flag_of_the_Taliban.svg.png'),
        ('AX', 'Aland Islands', 358, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Flag_of_%C3%85land.svg/188px-Flag_of_%C3%85land.svg.png'),
        ('AL', 'Albania', 355, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Flag_of_Albania.svg/188px-Flag_of_Albania.svg.png'),
        ('DZ', 'Algeria', 213, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Flag_of_Algeria.svg/188px-Flag_of_Algeria.svg.png'),
        ('AS', 'American Samoa', 1684, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Flag_of_American_Samoa.svg/195px-Flag_of_American_Samoa.svg.png'),
        ('AD', 'Andorra', 376, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Flag_of_Andorra.svg/188px-Flag_of_Andorra.svg.png'),
        ('AO', 'Angola', 244, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Flag_of_Angola.svg/188px-Flag_of_Angola.svg.png'),
        ('AI', 'Anguilla', 1264, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Flag_of_Anguilla.svg/195px-Flag_of_Anguilla.svg.png'),
        ('AQ', 'Antarctica', 672, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Proposed_flag_of_Antarctica_%28Graham_Bartram%29.svg/2560px-Proposed_flag_of_Antarctica_%28Graham_Bartram%29.svg.png'),
        ('AG', 'Antigua and Barbuda', 1268, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Flag_of_Antigua_and_Barbuda.svg/188px-Flag_of_Antigua_and_Barbuda.svg.png'),
        ('AR', 'Argentina', 54, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Argentina.svg/188px-Flag_of_Argentina.svg.png'),
        ('AM', 'Armenia', 374, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Flag_of_Armenia.svg/188px-Flag_of_Armenia.svg.png'),
        ('AW', 'Aruba', 297, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Flag_of_Aruba.svg/188px-Flag_of_Aruba.svg.png'),
        ('AU', 'Australia', 61, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/188px-Flag_of_Australia_%28converted%29.svg.png'),
        ('AT', 'Austria', 43, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_Austria.svg/188px-Flag_of_Austria.svg.png'),
        ('AZ', 'Azerbaijan', 994, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Flag_of_Azerbaijan.svg/188px-Flag_of_Azerbaijan.svg.png'),
        ('BS', 'Bahamas', 1242, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Flag_of_the_Bahamas.svg/188px-Flag_of_the_Bahamas.svg.png'),
        ('BH', 'Bahrain', 973, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Flag_of_Bahrain.svg/188px-Flag_of_Bahrain.svg.png'),
        ('BD', 'Bangladesh', 880, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Flag_of_Bangladesh.svg/188px-Flag_of_Bangladesh.svg.png'),
        ('BB', 'Barbados', 1246, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Flag_of_Barbados.svg/188px-Flag_of_Barbados.svg.png'),
        ('BY', 'Belarus', 375, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Flag_of_Belarus.svg/188px-Flag_of_Belarus.svg.png'),
        ('BE', 'Belgium', 32, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Belgium.svg/188px-Flag_of_Belgium.svg.png'),
        ('BZ', 'Belize', 501, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Flag_of_Belize.svg/188px-Flag_of_Belize.svg.png'),
        ('BJ', 'Benin', 229, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Flag_of_Benin.svg/188px-Flag_of_Benin.svg.png'),
        ('BM', 'Bermuda', 1441, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Flag_of_Bermuda.svg/195px-Flag_of_Bermuda.svg.png'),
        ('BT', 'Bhutan', 975, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Flag_of_Bhutan.svg/188px-Flag_of_Bhutan.svg.png'),
        ('BO', 'Bolivia', 591, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Flag_of_Bolivia.svg/188px-Flag_of_Bolivia.svg.png'),
        ('BQ', 'Bonaire, Sint Eustatius and Saba', 599, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Flag_of_Bonaire.svg/188px-Flag_of_Bonaire.svg.png'),
        ('BA', 'Bosnia and Herzegovina', 387, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Flag_of_Bosnia_and_Herzegovina.svg/195px-Flag_of_Bosnia_and_Herzegovina.svg.png'),
        ('BW', 'Botswana', 267, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_Botswana.svg/188px-Flag_of_Botswana.svg.png'),
        ('BV', 'Bouvet Island', 55, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Norway.svg/188px-Flag_of_Norway.svg.png'),
        ('BR', 'Brazil', 55, 'https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Flag_of_Brazil.svg/188px-Flag_of_Brazil.svg.png'),
        ('IO', 'British Indian Ocean Territory', 246, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_the_Commissioner_of_the_British_Indian_Ocean_Territory.svg/195px-Flag_of_the_Commissioner_of_the_British_Indian_Ocean_Territory.svg.png'),
        ('BN', 'Brunei Darussalam', 673, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Flag_of_Brunei.svg/188px-Flag_of_Brunei.svg.png'),
        ('BG', 'Bulgaria', 359, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Bulgaria.svg/188px-Flag_of_Bulgaria.svg.png'),
        ('BF', 'Burkina Faso', 226, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Flag_of_Burkina_Faso.svg/188px-Flag_of_Burkina_Faso.svg.png'),
        ('BI', 'Burundi', 257, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Flag_of_Burundi.svg/188px-Flag_of_Burundi.svg.png'),
        ('KH', 'Cambodia', 855, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_Cambodia.svg/188px-Flag_of_Cambodia.svg.png'),
        ('CM', 'Cameroon', 237, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Flag_of_Cameroon.svg/188px-Flag_of_Cameroon.svg.png'),
        ('CA', 'Canada', 1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/188px-Flag_of_Canada_%28Pantone%29.svg.png'),
        ('CV', 'Cape Verde', 238, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Flag_of_Cape_Verde.svg/188px-Flag_of_Cape_Verde.svg.png'),
        ('KY', 'Cayman Islands', 1345, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Flag_of_the_Cayman_Islands.svg/195px-Flag_of_the_Cayman_Islands.svg.png'),
        ('CF', 'Central African Republic', 236, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Flag_of_the_Central_African_Republic.svg/188px-Flag_of_the_Central_African_Republic.svg.png'),
        ('TD', 'Chad', 235, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Flag_of_Chad.svg/188px-Flag_of_Chad.svg.png'),
        ('CL', 'Chile', 56, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Flag_of_Chile.svg/188px-Flag_of_Chile.svg.png'),
        ('CN', 'China', 86, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/188px-Flag_of_the_People%27s_Republic_of_China.svg.png'),
        ('CX', 'Christmas Island', 61, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Flag_of_Christmas_Island.svg/195px-Flag_of_Christmas_Island.svg.png'),
        ('CC', 'Cocos (Keeling) Islands', 672, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Flag_of_the_Cocos_%28Keeling%29_Islands.svg/195px-Flag_of_the_Cocos_%28Keeling%29_Islands.svg.png'),
        ('CO', 'Colombia', 57, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Colombia.svg/188px-Flag_of_Colombia.svg.png'),
        ('KM', 'Comoros', 269, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Flag_of_the_Comoros.svg/188px-Flag_of_the_Comoros.svg.png'),
        ('CG', 'Congo', 242, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Flag_of_the_Democratic_Republic_of_the_Congo.svg/188px-Flag_of_the_Democratic_Republic_of_the_Congo.svg.png'),
        ('CD', 'Congo, Democratic Republic of the Congo', 242, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Flag_of_the_Democratic_Republic_of_the_Congo.svg/188px-Flag_of_the_Democratic_Republic_of_the_Congo.svg.png'),
        ('CK', 'Cook Islands', 682, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Flag_of_the_Cook_Islands.svg/188px-Flag_of_the_Cook_Islands.svg.png'),
        ('CR', 'Costa Rica', 506, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Flag_of_Costa_Rica.svg/188px-Flag_of_Costa_Rica.svg.png'),
        ('CI', 'Cote D""Ivoire', 225, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_C%C3%B4te_d%27Ivoire.svg/188px-Flag_of_C%C3%B4te_d%27Ivoire.svg.png'),
        ('HR', 'Croatia', 385, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Flag_of_Croatia.svg/188px-Flag_of_Croatia.svg.png'),
        ('CU', 'Cuba', 53, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Flag_of_Cuba.svg/188px-Flag_of_Cuba.svg.png'),
        ('CW', 'Curacao', 599, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Flag_of_Cura%C3%A7ao.svg/188px-Flag_of_Cura%C3%A7ao.svg.png'),
        ('CY', 'Cyprus', 357, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Flag_of_Cyprus.svg/188px-Flag_of_Cyprus.svg.png'),
        ('CZ', 'Czech Republic', 420, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_Czech_Republic.svg/188px-Flag_of_the_Czech_Republic.svg.png'),
        ('DK', 'Denmark', 45, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Flag_of_Denmark.svg/180px-Flag_of_Denmark.svg.png'),
        ('DJ', 'Djibouti', 253, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Flag_of_Djibouti.svg/188px-Flag_of_Djibouti.svg.png'),
        ('DM', 'Dominica', 1767, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Flag_of_Dominica.svg/188px-Flag_of_Dominica.svg.png'),
        ('DO', 'Dominican Republic', 1809, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Flag_of_the_Dominican_Republic.svg/188px-Flag_of_the_Dominican_Republic.svg.png'),
        ('EC', 'Ecuador', 593, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Flag_of_Ecuador.svg/188px-Flag_of_Ecuador.svg.png'),
        ('EG', 'Egypt', 20, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/188px-Flag_of_Egypt.svg.png'),
        ('SV', 'El Salvador', 503, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Flag_of_El_Salvador.svg/270px-Flag_of_El_Salvador.svg.png'),
        ('GQ', 'Equatorial Guinea', 240, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Flag_of_Equatorial_Guinea.svg/188px-Flag_of_Equatorial_Guinea.svg.png'),
        ('ER', 'Eritrea', 291, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Flag_of_Eritrea.svg/188px-Flag_of_Eritrea.svg.png'),
        ('EE', 'Estonia', 372, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Flag_of_Estonia.svg/188px-Flag_of_Estonia.svg.png'),
        ('ET', 'Ethiopia', 251, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Flag_of_Ethiopia.svg/188px-Flag_of_Ethiopia.svg.png'),
        ('FK', 'Falkland Islands (Malvinas)', 500, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_the_Falkland_Islands.svg/195px-Flag_of_the_Falkland_Islands.svg.png'),
        ('FO', 'Faroe Islands', 298, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Flag_of_the_Faroe_Islands.svg/188px-Flag_of_the_Faroe_Islands.svg.png'),
        ('FJ', 'Fiji', 679, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Fiji.svg/188px-Flag_of_Fiji.svg.png'),
        ('FI', 'Finland', 358, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_Finland.svg/188px-Flag_of_Finland.svg.png'),
        ('FR', 'France', 33, 'https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Flag_of_France.svg/188px-Flag_of_France.svg.png'),
        ('GF', 'French Guiana', 594, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Coat_of_arms_of_French_Guiana%2C_according_to_the_original_displayed_at_the_Museum_Franconie%2C_at_Cayenne.svg/180px-Coat_of_arms_of_French_Guiana%2C_according_to_the_original_displayed_at_the_Museum_Franconie%2C_at_Cayenne.svg.png'),
        ('PF', 'French Polynesia', 689, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Flag_of_French_Polynesia.svg/188px-Flag_of_French_Polynesia.svg.png'),
        ('TF', 'French Southern Territories', 262, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Flag_of_the_French_Southern_and_Antarctic_Lands.svg/188px-Flag_of_the_French_Southern_and_Antarctic_Lands.svg.png'),
        ('GA', 'Gabon', 241, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Flag_of_Gabon.svg/188px-Flag_of_Gabon.svg.png'),
        ('GM', 'Gambia', 220, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Flag_of_The_Gambia.svg/188px-Flag_of_The_Gambia.svg.png'),
        ('GE', 'Georgia', 995, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Flag_of_Georgia.svg/188px-Flag_of_Georgia.svg.png'),
        ('DE', 'Germany', 49, 'https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Flag_of_Germany.svg/188px-Flag_of_Germany.svg.png'),
        ('GH', 'Ghana', 233, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Flag_of_Ghana.svg/188px-Flag_of_Ghana.svg.png'),
        ('GI', 'Gibraltar', 350, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Flag_of_Gibraltar.svg/195px-Flag_of_Gibraltar.svg.png'),
        ('GR', 'Greece', 30, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Greece.svg/188px-Flag_of_Greece.svg.png'),
        ('GL', 'Greenland', 299, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_Greenland.svg/195px-Flag_of_Greenland.svg.png'),
        ('GD', 'Grenada', 1473, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_Grenada.svg/188px-Flag_of_Grenada.svg.png'),
        ('GP', 'Guadeloupe', 590, 'https://upload.wikimedia.org/wikipedia/en/thumb/2/2f/Guadaloupe_logo.svg/135px-Guadaloupe_logo.svg.png'),
        ('GU', 'Guam', 1671, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Flag_of_Guam.svg/195px-Flag_of_Guam.svg.png'),
        ('GT', 'Guatemala', 502, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Flag_of_Guatemala.svg/188px-Flag_of_Guatemala.svg.png'),
        ('GG', 'Guernsey', 44, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_Guernsey.svg/188px-Flag_of_Guernsey.svg.png'),
        ('GN', 'Guinea', 224, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Flag_of_Guinea.svg/188px-Flag_of_Guinea.svg.png'),
        ('GW', 'Guinea-Bissau', 245, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Flag_of_Guinea-Bissau.svg/188px-Flag_of_Guinea-Bissau.svg.png'),
        ('GY', 'Guyana', 592, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Flag_of_Guyana.svg/188px-Flag_of_Guyana.svg.png'),
        ('HT', 'Haiti', 509, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Flag_of_Haiti.svg/188px-Flag_of_Haiti.svg.png'),
        ('HM', 'Heard Island and Mcdonald Islands', 0, 'https://flagpedia.net/data/flags/w580/hm.png'),
        ('VA', 'Holy See (Vatican City State)', 39, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Flag_of_the_Vatican_City_%282023%E2%80%93present%29.svg/188px-Flag_of_the_Vatican_City_%282023%E2%80%93present%29.svg.png'),
        ('HN', 'Honduras', 504, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Flag_of_Honduras.svg/188px-Flag_of_Honduras.svg.png'),
        ('HK', 'Hong Kong', 852, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Flag_of_Hong_Kong.svg/188px-Flag_of_Hong_Kong.svg.png'),
        ('HU', 'Hungary', 36, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Flag_of_Hungary.svg/188px-Flag_of_Hungary.svg.png'),
        ('IS', 'Iceland', 354, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Flag_of_Iceland.svg/188px-Flag_of_Iceland.svg.png'),
        ('IN', 'India', 91, 'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/188px-Flag_of_India.svg.png'),
        ('ID', 'Indonesia', 62, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Flag_of_Indonesia.svg/188px-Flag_of_Indonesia.svg.png'),
        ('IR', 'Iran', 98, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Flag_of_Iran.svg/188px-Flag_of_Iran.svg.png'),
        ('IQ', 'Iraq', 964, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Flag_of_Iraq.svg/188px-Flag_of_Iraq.svg.png'),
        ('IE', 'Ireland', 353, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Flag_of_Ireland.svg/1200px-Flag_of_Ireland.svg.png'),
        ('IM', 'Isle of Man', 44, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_the_Isle_of_Man.svg/210px-Flag_of_the_Isle_of_Man.svg.png'),
        ('IL', 'Israel', 972, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Flag_of_Israel.svg/188px-Flag_of_Israel.svg.png'),
        ('IT', 'Italy', 39, 'https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/188px-Flag_of_Italy.svg.png'),
        ('JM', 'Jamaica', 1876, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Flag_of_Jamaica.svg/188px-Flag_of_Jamaica.svg.png'),
        ('JP', 'Japan', 81, 'https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/188px-Flag_of_Japan.svg.png'),
        ('JE', 'Jersey', 44, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Flag_of_Jersey.svg/188px-Flag_of_Jersey.svg.png'),
        ('JO', 'Jordan', 962, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Flag_of_Jordan.svg/188px-Flag_of_Jordan.svg.png'),
        ('KZ', 'Kazakhstan', 7, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Flag_of_Kazakhstan_%28President_of_Kazakhstan_website%29.svg/203px-Flag_of_Kazakhstan_%28President_of_Kazakhstan_website%29.svg.png'),
        ('KE', 'Kenya', 254, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Flag_of_Kenya.svg/188px-Flag_of_Kenya.svg.png'),
        ('KI', 'Kiribati', 686, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Flag_of_Kiribati.svg/188px-Flag_of_Kiribati.svg.png'),
        ('KP', 'Korea, North', 850, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Flag_of_North_Korea.svg/188px-Flag_of_North_Korea.svg.png'),
        ('KR', 'Korea, South', 82, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/188px-Flag_of_South_Korea.svg.png'),
        ('XK', 'Kosovo', 383, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Flag_of_Kosovo.svg/188px-Flag_of_Kosovo.svg.png'),
        ('KW', 'Kuwait', 965, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Flag_of_Kuwait.svg/188px-Flag_of_Kuwait.svg.png'),
        ('KG', 'Kyrgyzstan', 996, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Flag_of_Kyrgyzstan.svg/188px-Flag_of_Kyrgyzstan.svg.png'),
        ('LA', 'Lao People""s Democratic Republic', 856, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Flag_of_Laos.svg/188px-Flag_of_Laos.svg.png'),
        ('LV', 'Latvia', 371, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Flag_of_Latvia.svg/188px-Flag_of_Latvia.svg.png'),
        ('LB', 'Lebanon', 961, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Flag_of_Lebanon.svg/188px-Flag_of_Lebanon.svg.png'),
        ('LS', 'Lesotho', 266, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Flag_of_Lesotho.svg/188px-Flag_of_Lesotho.svg.png'),
        ('LR', 'Liberia', 231, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Flag_of_Liberia.svg/188px-Flag_of_Liberia.svg.png'),
        ('LY', 'Libya', 218, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Libya.svg/188px-Flag_of_Libya.svg.png'),
        ('LI', 'Liechtenstein', 423, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Flag_of_Liechtenstein.svg/188px-Flag_of_Liechtenstein.svg.png'),
        ('LT', 'Lithuania', 370, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Flag_of_Lithuania.svg/188px-Flag_of_Lithuania.svg.png'),
        ('LU', 'Luxembourg', 352, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Flag_of_Luxembourg.svg/188px-Flag_of_Luxembourg.svg.png'),
        ('MO', 'Macao', 853, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Flag_of_Macau.svg/188px-Flag_of_Macau.svg.png'),
        ('MK', 'Macedonia, the Former Yugoslav Republic of', 389, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flag_of_North_Macedonia.svg/188px-Flag_of_North_Macedonia.svg.png'),
        ('MG', 'Madagascar', 261, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_Madagascar.svg/188px-Flag_of_Madagascar.svg.png'),
        ('MW', 'Malawi', 265, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Flag_of_Malawi.svg/188px-Flag_of_Malawi.svg.png'),
        ('MY', 'Malaysia', 60, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Flag_of_Malaysia.svg/188px-Flag_of_Malaysia.svg.png'),
        ('MV', 'Maldives', 960, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Flag_of_Maldives.svg/188px-Flag_of_Maldives.svg.png'),
        ('ML', 'Mali', 223, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Flag_of_Mali.svg/188px-Flag_of_Mali.svg.png'),
        ('MT', 'Malta', 356, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Flag_of_Malta.svg/188px-Flag_of_Malta.svg.png'),
        ('MH', 'Marshall Islands', 692, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Flag_of_the_Marshall_Islands.svg/188px-Flag_of_the_Marshall_Islands.svg.png'),
        ('MQ', 'Martinique', 596, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Flag-of-Martinique.svg/188px-Flag-of-Martinique.svg.png'),
        ('MR', 'Mauritania', 222, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Flag_of_Mauritania.svg/188px-Flag_of_Mauritania.svg.png'),
        ('MU', 'Mauritius', 230, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Flag_of_Mauritius.svg/188px-Flag_of_Mauritius.svg.png'),
        ('YT', 'Mayotte', 262, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Coat_of_Arms_of_Mayotte.PNG/195px-Coat_of_Arms_of_Mayotte.PNG'),
        ('MX', 'Mexico', 52, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Flag_of_Mexico.svg/188px-Flag_of_Mexico.svg.png'),
        ('FM', 'Micronesia, Federated States of', 691, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Flag_of_the_Federated_States_of_Micronesia.svg/375px-Flag_of_the_Federated_States_of_Micronesia.svg.png'),
        ('MD', 'Moldova, Republic of', 373, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Flag_of_Moldova.svg/188px-Flag_of_Moldova.svg.png'),
        ('MC', 'Monaco', 377, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Flag_of_Monaco.svg/180px-Flag_of_Monaco.svg.png'),
        ('MN', 'Mongolia', 976, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Flag_of_Mongolia.svg/188px-Flag_of_Mongolia.svg.png'),
        ('ME', 'Montenegro', 382, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Flag_of_Montenegro.svg/188px-Flag_of_Montenegro.svg.png'),
        ('MS', 'Montserrat', 1664, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Flag_of_Montserrat.svg/195px-Flag_of_Montserrat.svg.png'),
        ('MA', 'Morocco', 212, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Flag_of_Morocco.svg/188px-Flag_of_Morocco.svg.png'),
        ('MZ', 'Mozambique', 258, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Flag_of_Mozambique.svg/188px-Flag_of_Mozambique.svg.png'),
        ('MM', 'Myanmar', 95, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Flag_of_Myanmar.svg/188px-Flag_of_Myanmar.svg.png'),
        ('NA', 'Namibia', 264, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Flag_of_Namibia.svg/188px-Flag_of_Namibia.svg.png'),
        ('NR', 'Nauru', 674, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Flag_of_Nauru.svg/188px-Flag_of_Nauru.svg.png'),
        ('NP', 'Nepal', 977, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Flag_of_Nepal.svg/143px-Flag_of_Nepal.svg.png'),
        ('NL', 'Netherlands', 31, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/188px-Flag_of_the_Netherlands.svg.png'),
        ('AN', 'Netherlands Antilles', 599, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Flag_of_the_Netherlands_Antilles_%281959%E2%80%931986%29.svg/188px-Flag_of_the_Netherlands_Antilles_%281959%E2%80%931986%29.svg.png'),
        ('NC', 'New Caledonia', 687, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Flags_of_New_Caledonia.svg/263px-Flags_of_New_Caledonia.svg.png'),
        ('NZ', 'New Zealand', 64, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Flag_of_New_Zealand.svg/188px-Flag_of_New_Zealand.svg.png'),
        ('NI', 'Nicaragua', 505, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Flag_of_Nicaragua.svg/188px-Flag_of_Nicaragua.svg.png'),
        ('NE', 'Niger', 227, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Flag_of_Niger.svg/150px-Flag_of_Niger.svg.png'),
        ('NG', 'Nigeria', 234, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flag_of_Nigeria.svg/195px-Flag_of_Nigeria.svg.png'),
        ('NU', 'Niue', 683, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Flag_of_Niue.svg/188px-Flag_of_Niue.svg.png'),
        ('NF', 'Norfolk Island', 672, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Flag_of_Norfolk_Island.svg/195px-Flag_of_Norfolk_Island.svg.png'),
        ('MP', 'Northern Mariana Islands', 1670, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Flag_of_the_Northern_Mariana_Islands.svg/195px-Flag_of_the_Northern_Mariana_Islands.svg.png'),
        ('NO', 'Norway', 47, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Norway.svg/188px-Flag_of_Norway.svg.png'),
        ('OM', 'Oman', 968, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Flag_of_Oman.svg/188px-Flag_of_Oman.svg.png'),
        ('PK', 'Pakistan', 92, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Flag_of_Pakistan.svg/188px-Flag_of_Pakistan.svg.png'),
        ('PW', 'Palau', 680, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Flag_of_Palau.svg/188px-Flag_of_Palau.svg.png'),
        ('PS', 'Palestinian Territory, Occupied', 970, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Flag_of_Palestine.svg/383px-Flag_of_Palestine.svg.png'),
        ('PA', 'Panama', 507, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Flag_of_Panama.svg/188px-Flag_of_Panama.svg.png'),
        ('PG', 'Papua New Guinea', 675, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Flag_of_Papua_New_Guinea.svg/188px-Flag_of_Papua_New_Guinea.svg.png'),
        ('PY', 'Paraguay', 595, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Flag_of_Paraguay.svg/188px-Flag_of_Paraguay.svg.png'),
        ('PE', 'Peru', 51, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Flag_of_Peru.svg/188px-Flag_of_Peru.svg.png'),
        ('PH', 'Philippines', 63, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Flag_of_the_Philippines.svg/195px-Flag_of_the_Philippines.svg.png'),
        ('PN', 'Pitcairn', 64, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_the_Pitcairn_Islands.svg/195px-Flag_of_the_Pitcairn_Islands.svg.png'),
        ('PL', 'Poland', 48, 'https://upload.wikimedia.org/wikipedia/en/thumb/1/12/Flag_of_Poland.svg/188px-Flag_of_Poland.svg.png'),
        ('PT', 'Portugal', 351, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/188px-Flag_of_Portugal.svg.png'),
        ('PR', 'Puerto Rico', 1787, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Flag_of_Puerto_Rico.svg/188px-Flag_of_Puerto_Rico.svg.png'),
        ('QA', 'Qatar', 974, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Qatar.svg/203px-Flag_of_Qatar.svg.png'),
        ('RE', 'Reunion', 262, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Proposed_flag_of_R%C3%A9union_%28VAR%29.svg/300px-Proposed_flag_of_R%C3%A9union_%28VAR%29.svg.png'),
        ('RO', 'Romania', 40, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Flag_of_Romania.svg/188px-Flag_of_Romania.svg.png'),
        ('RU', 'Russian Federation', 7, 'https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Flag_of_Russia.svg/188px-Flag_of_Russia.svg.png'),
        ('RW', 'Rwanda', 250, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Flag_of_Rwanda.svg/188px-Flag_of_Rwanda.svg.png'),
        ('BL', 'Saint Barthelemy', 590, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Flag_of_Saint_Barth%C3%A9lemy_%28local%29.svg/300px-Flag_of_Saint_Barth%C3%A9lemy_%28local%29.svg.png'),
        ('SH', 'Saint Helena', 290, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Flag_of_Saint_Helena.svg/195px-Flag_of_Saint_Helena.svg.png'),
        ('KN', 'Saint Kitts and Nevis', 1869, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Saint_Kitts_and_Nevis.svg/383px-Flag_of_Saint_Kitts_and_Nevis.svg.png'),
        ('LC', 'Saint Lucia', 1758, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Flag_of_Saint_Lucia.svg/188px-Flag_of_Saint_Lucia.svg.png'),
        ('MF', 'Saint Martin', 590, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Local_flag_of_the_Collectivity_of_Saint_Martin.svg/300px-Local_flag_of_the_Collectivity_of_Saint_Martin.svg.png'),
        ('PM', 'Saint Pierre and Miquelon', 508, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Armoiries_SaintPierreetMiquelon.svg/165px-Armoiries_SaintPierreetMiquelon.svg.png'),
        ('VC', 'Saint Vincent and the Grenadines', 1784, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Flag_of_Saint_Vincent_and_the_Grenadines.svg/270px-Flag_of_Saint_Vincent_and_the_Grenadines.svg.png'),
        ('WS', 'Samoa', 684, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Flag_of_Samoa.svg/188px-Flag_of_Samoa.svg.png'),
        ('SM', 'San Marino', 378, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Flag_of_San_Marino.svg/188px-Flag_of_San_Marino.svg.png'),
        ('ST', 'Sao Tome and Principe', 239, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Flag_of_S%C3%A3o_Tom%C3%A9_and_Pr%C3%ADncipe.svg/188px-Flag_of_S%C3%A3o_Tom%C3%A9_and_Pr%C3%ADncipe.svg.png'),
        ('SA', 'Saudi Arabia', 966, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Flag_of_Saudi_Arabia.svg/188px-Flag_of_Saudi_Arabia.svg.png'),
        ('SN', 'Senegal', 221, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Flag_of_Senegal.svg/188px-Flag_of_Senegal.svg.png'),
        ('RS', 'Serbia', 381, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Flag_of_Serbia.svg/188px-Flag_of_Serbia.svg.png'),
        ('CS', 'Serbia and Montenegro', 381, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Flag_of_Serbia_and_Montenegro_%281992%E2%80%932006%29.svg/225px-Flag_of_Serbia_and_Montenegro_%281992%E2%80%932006%29.svg.png'),
        ('SC', 'Seychelles', 248, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Flag_of_Seychelles.svg/188px-Flag_of_Seychelles.svg.png'),
        ('SL', 'Sierra Leone', 232, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Flag_of_Sierra_Leone.svg/188px-Flag_of_Sierra_Leone.svg.png'),
        ('SG', 'Singapore', 65, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Flag_of_Singapore.svg/188px-Flag_of_Singapore.svg.png'),
        ('SX', 'Sint Maarten', 721, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Flag_of_Sint_Maarten.svg/188px-Flag_of_Sint_Maarten.svg.png'),
        ('SK', 'Slovakia', 421, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Flag_of_Slovakia.svg/188px-Flag_of_Slovakia.svg.png'),
        ('SI', 'Slovenia', 386, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Flag_of_Slovenia.svg/188px-Flag_of_Slovenia.svg.png'),
        ('SB', 'Solomon Islands', 677, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Flag_of_the_Solomon_Islands.svg/188px-Flag_of_the_Solomon_Islands.svg.png'),
        ('SO', 'Somalia', 252, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Flag_of_Somalia.svg/188px-Flag_of_Somalia.svg.png'),
        ('ZA', 'South Africa', 27, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Flag_of_South_Africa.svg/188px-Flag_of_South_Africa.svg.png'),
        ('GS', 'South Georgia and the South Sandwich Islands', 500, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Flag_of_South_Georgia_and_the_South_Sandwich_Islands.svg/195px-Flag_of_South_Georgia_and_the_South_Sandwich_Islands.svg.png'),
        ('SS', 'South Sudan', 211, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Flag_of_South_Sudan.svg/188px-Flag_of_South_Sudan.svg.png'),
        ('ES', 'Spain', 34, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Bandera_de_Espa%C3%B1a.svg/188px-Bandera_de_Espa%C3%B1a.svg.png'),
        ('LK', 'Sri Lanka', 94, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Flag_of_Sri_Lanka.svg/188px-Flag_of_Sri_Lanka.svg.png'),
        ('SD', 'Sudan', 249, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Flag_of_Sudan.svg/188px-Flag_of_Sudan.svg.png'),
        ('SR', 'Suriname', 597, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Flag_of_Suriname.svg/188px-Flag_of_Suriname.svg.png'),
        ('SJ', 'Svalbard and Jan Mayen', 47, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Norway.svg/188px-Flag_of_Norway.svg.png'),
        ('SZ', 'Swaziland', 268, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Flag_of_Eswatini.svg/188px-Flag_of_Eswatini.svg.png'),
        ('SE', 'Sweden', 46, 'https://upload.wikimedia.org/wikipedia/en/thumb/4/4c/Flag_of_Sweden.svg/188px-Flag_of_Sweden.svg.png'),
        ('CH', 'Switzerland', 41, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Flag_of_Switzerland_%28Pantone%29.svg/188px-Flag_of_Switzerland_%28Pantone%29.svg.png'),
        ('SY', 'Syria', 963, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Flag_of_Syria.svg/300px-Flag_of_Syria.svg.png'),
        ('TW', 'Taiwan, Province of China', 886, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Flag_of_the_Republic_of_China.svg/188px-Flag_of_the_Republic_of_China.svg.png'),
        ('TJ', 'Tajikistan', 992, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Flag_of_Tajikistan.svg/188px-Flag_of_Tajikistan.svg.png'),
        ('TZ', 'Tanzania, United Republic of', 255, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Flag_of_Tanzania.svg/125px-Flag_of_Tanzania.svg.png'),
        ('TH', 'Thailand', 66, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_Thailand.svg/125px-Flag_of_Thailand.svg.png'),
        ('TL', 'Timor-Leste', 670, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Flag_of_East_Timor.svg/188px-Flag_of_East_Timor.svg.png'),
        ('TG', 'Togo', 228, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Flag_of_Togo.svg/188px-Flag_of_Togo.svg.png'),
        ('TK', 'Tokelau', 690, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Flag_of_Tokelau.svg/188px-Flag_of_Tokelau.svg.png'),
        ('TO', 'Tonga', 676, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Tonga.svg/188px-Flag_of_Tonga.svg.png'),
        ('TT', 'Trinidad and Tobago', 1868, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Flag_of_Trinidad_and_Tobago.svg/188px-Flag_of_Trinidad_and_Tobago.svg.png'),
        ('TN', 'Tunisia', 216, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Flag_of_Tunisia.svg/188px-Flag_of_Tunisia.svg.png'),
        ('TR', 'Turkey', 90, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Flag_of_Turkey.svg/188px-Flag_of_Turkey.svg.png'),
        ('TM', 'Turkmenistan', 7370, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Flag_of_Turkmenistan.svg/180px-Flag_of_Turkmenistan.svg.png'),
        ('TC', 'Turks and Caicos Islands', 1649, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Flag_of_the_Turks_and_Caicos_Islands.svg/195px-Flag_of_the_Turks_and_Caicos_Islands.svg.png'),
        ('TV', 'Tuvalu', 688, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Flag_of_Tuvalu.svg/188px-Flag_of_Tuvalu.svg.png'),
        ('UG', 'Uganda', 256, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Flag_of_Uganda.svg/188px-Flag_of_Uganda.svg.png'),
        ('UA', 'Ukraine', 380, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Flag_of_Ukraine.svg/188px-Flag_of_Ukraine.svg.png'),
        ('AE', 'United Arab Emirates', 971, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/188px-Flag_of_the_United_Arab_Emirates.svg.png'),
        ('GB', 'United Kingdom', 44, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/188px-Flag_of_the_United_Kingdom_%281-2%29.svg.png'),
        ('US', 'United States', 1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg/188px-Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg.png'),
        ('UM', 'United States Minor Outlying Islands', 1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg/188px-Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg.png'),
        ('UY', 'Uruguay', 598, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Uruguay.svg/188px-Flag_of_Uruguay.svg.png'),
        ('UZ', 'Uzbekistan', 998, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Flag_of_Uzbekistan.svg/188px-Flag_of_Uzbekistan.svg.png'),
        ('VU', 'Vanuatu', 678, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_Vanuatu.svg/188px-Flag_of_Vanuatu.svg.png'),
        ('VE', 'Venezuela', 58, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Flag_of_Venezuela.svg/188px-Flag_of_Venezuela.svg.png'),
        ('VN', 'Vietnam', 84, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/188px-Flag_of_Vietnam.svg.png'),
        ('VG', 'Virgin Islands, British', 1284, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Flag_of_the_British_Virgin_Islands.svg/195px-Flag_of_the_British_Virgin_Islands.svg.png'),
        ('VI', 'Virgin Islands, U.s.', 1340, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Flag_of_the_United_States_Virgin_Islands.svg/188px-Flag_of_the_United_States_Virgin_Islands.svg.png'),
        ('WF', 'Wallis and Futuna', 681, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Flag_of_Wallis_and_Futuna.svg/195px-Flag_of_Wallis_and_Futuna.svg.png'),
        ('EH', 'Western Sahara', 212, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Flag_of_the_Sahrawi_Arab_Democratic_Republic.svg/300px-Flag_of_the_Sahrawi_Arab_Democratic_Republic.svg.png'),
        ('YE', 'Yemen', 967, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Flag_of_Zimbabwe.svg/188px-Flag_of_Zimbabwe.svg.png'),
        ('ZM', 'Zambia', 260, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Flag_of_Zambia.svg/188px-Flag_of_Zambia.svg.png'),
        ('ZW', 'Zimbabwe', 263, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Flag_of_Zimbabwe.svg/188px-Flag_of_Zimbabwe.svg.png');



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
    idUsername VARCHAR(10) UNIQUE,
    dtFirstName VARCHAR(40) NOT NULL,
    dtLastName VARCHAR(40) NOT NULL,
    dtPassword VARCHAR(60) NOT NULL,
    dtEmail VARCHAR(50) NOT NULL,
    dtTelephone VARCHAR(9),
    dtPLZ VARCHAR(6) NOT NULL,
    dtHouseNR VARCHAR(3) NOT NULL,
    dtStreet VARCHAR(15) NOT NULL,
    fiCountry VARCHAR(5) NOT NULL,
    fiRight INT NOT NULL,
    PRIMARY KEY (idUsername),
    FOREIGN KEY (fiCountry) REFERENCES tblCountry (idCountry),
    FOREIGN KEY (fiRight) REFERENCES tblRights (idRight)
);

INSERT INTO tblUser (idUsername, dtFirstName, dtLastName, dtPassword, dtEmail, dtTelephone, dtPLZ, dtHouseNR, dtStreet, fiCountry, fiRight)
VALUES  ('admin', 'Admin', 'Admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin@admin.lu', '621 345 345', '1234', '3', 'Am Seif', 'LU', 1),
        ('staff' , 'Staff', 'Staff', '1562206543da764123c21bd524674f0a8aaf49c8a89744c97352fe677f7e4006', 'staff@staff.lu', '691 567 567', '1234', '3', 'Am Seif', 'LU', 2),
        ('user', 'User', 'User', '04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', 'user@user.lu', '621 788 897', '1234', '3', 'Am Seif', 'LU', 3),
        ('ribpe261', 'Pedro', 'Ribeiro Costa', 'd9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e', 'ribpe261@school.lu', '691 522 129', '1940', '274', 'route de Longwy', 'PT', 1),
        ('frith033', 'Thibaut', 'Friederici', 'd9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e', 'frith033@school.lu', '691 703 747', '6724', '13', 'Rue des Foyers', 'LU', 1),
        ('friti725', 'Tim', 'Frisch', 'd9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e', 'friti725@school.lu', '621 816 424', '6183', '39', 'rue de ecole', 'LU', 1),
        ('guoka342', 'Guo', 'Kaidi', 'd9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e', 'guoka342@school.lu', '661520300', '3429', '12', 'route de Burange', 'LU', 1),
        ('gammi625', 'Mihails', 'Gamass', 'd9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e', 'gammi625@school.lu', '691 879 699', '8380', '13', 'Rue de la Gare', 'LU', 1);



CREATE TABLE tblCategory (
    idCategory INT NOT NULL AUTO_INCREMENT,
    dtName VARCHAR(100) NOT NULL,
    PRIMARY KEY (idCategory)
);

INSERT INTO tblCategory (dtName)
VALUES  ('Milk and dairy drinks'), 
        ('Fermented Milks'),
        ('Butters'),
        ('Creams'),
        ('Fresh cheeses'),
        ('Cheeses'),
        ('Yaourts'),
        ('Dairy desserts'),
        ('Ice cream'),
        ('Biscuits');

CREATE TABLE tblType(
    idType INT NOT NULL AUTO_INCREMENT,
    dtType VARCHAR(50) NOT NULL,
    dtDescription VARCHAR(1400) NOT NULL,
    dtImage VARCHAR(200),
    fiCategory INT NOT NULL,
    PRIMARY KEY (idType),
    FOREIGN KEY (fiCategory) REFERENCES tblCategory (idCategory)
);

INSERT INTO tblType (dtType, dtDescription, dtImage, fiCategory)
VALUES ('Fresh Milk','At Luxlait, we have chosen to use a process called microfiltration. Microfiltered milk stays fresh longer while retaining its taste and nutritional properties.','https://www.luxlait.lu/wp-content/uploads/2021/10/Lait-frais-3.5-1L_1_HD_OK_-1-336x1024.png',1),
       ('UHT Milk','UHT milk can be stored for several months at room temperature, given that its packaging is closed. After opening, it should be placed in the refrigerator and consumed quickly. UHT milk has the longest shelf-life.','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait-UHT-1.5-1L_1_HD_OK-526x1536.png',1),
       ('Lactose-free milk','Discover the first 0% lactose milk with 100% luxembourgish milk. This quality product doesn""t just taste good but also has a long shelf life.','https://www.luxlait.lu/wp-content/uploads/2020/10/Lait_UHT_O-lactose_-540x1536.png',1),
       ('Organic Milk','Luxlait organic milk is available in two versions: fresh microfiltered milk, for optimal preservation of the taste and semi-skimmed UHT milk that you can store for several months at room temperature.','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait-UHT-Bio-3.png',1),
       ('Fresh Chocolate Milk','The creamy whole milk and rich taste of cocoa have made our chocolate milk a real bestseller.','https://www.luxlait.lu/wp-content/uploads/2020/05/Lait-choco-frais_1L_face-330x1024.png',1),
       ('Shakers','Our shakers are available in 8 different flavours. The 25cl format and lid make them perfect to enjoy on the go.','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-2b43c425-e38f-4d79-b6bd-d3b837c4085e.png',1),
       ('Funny drink','Our Funny Drink is a fresh and fruity drink with 0% fat. Enriched with vitamins it has all the benefits of milk and a fresh orange juice.','https://www.luxlait.lu/wp-content/uploads/2019/09/Funny-drink-orange-1.png',1),
       ('Egg Nog','Our egg nog is a creamy winter speciality with vanilla and non-alcoholic rum aroma. You can enjoy it hot or cold at any moment of the day. Tip for the adults: Add some rum for a festive drink.','https://www.luxlait.lu/wp-content/uploads/2019/09/Egg-nog-frais-0.75L_5_HD_OK_-600x1536.png',1),
       
       ('Fremented milk','The smooth and tasty recipe of Luxlait fermented milk has received a great feedback from all consumers. For more than 30 years, this tasty and slightly acidic drink has been the number one seller in Europe.','https://www.luxlait.lu/wp-content/uploads/2020/05/Lait-Fermente%CC%81-1L_face-2-e1641394646525-768x1214.png',2),
       ('Lassi','Mango Lassi, born of Indian and Pakistani culinary traditions, is a testament to the love of flavours that define their heritage. Born in the Punjab Region of north India an eastern Pakistan, this exquisite drink is a harmonious marriage of the two nations’ passion for culture and taste. Whether enjoyed on busy street corners, in the tranquillity of homes or as a cherished offering on festive occasions, it reflects the essence of unity and conviviality that define the Pakistani and Indian communities. Luxlait Mango Lassi takes this traditional yoghurt recipe and creates a delicious, refreshing, smooth drink. Offering a glass of Lassi is not just a gesture of refreshment; it is a deeply rooted expression of hospitality. It symbolises the generosity and warmth that define the spirit of Indian and Pakistani communities.','https://www.luxlait.lu/wp-content/uploads/2024/01/TT-1000-Base-WEB-2.png',2),
       ('Laben Beldi','Traditionally, the milk is whisked in a “Garba” for several hours, to obtain fermented milk. The Laben Beldi is then poured into a terracotta jug. This is covered with a wet Hessian cloth in order to preserve the freshness of the Laben as long as possible. At Luxlait we reproduce this traditional recipe from the Hauts Plateaux of the Atlas Mountains as faithfully as possible.','https://www.luxlait.lu/wp-content/uploads/2021/02/55190-Laben_1L-web-e1612252447339.png',2),
       ('Raïb','Raib will go perfectly with your oriental dishes and will allow you to make light and digestible smoothies and milkshakes.','https://www.luxlait.lu/wp-content/uploads/2019/09/55140_RAIB_1L_Face-so.png',2), 
       ('Raïbi','Raïbi is a fermented drink that has been created in Morocco in the 60s but has since then become popular in other countries, too. The Luxlait Raïbi is particularly creamy and to be considered as the healthiest option on the market. It""s a drink for the whole family: Kids love to freeze and make ice cream of it while adults will think back of their childhood or stay in Marocco.','https://www.luxlait.lu/wp-content/uploads/2019/09/Raibi-1L-2.png',2),
       ('Kefir','An ancestral drink from the nomads of the Caucasus mountains. Thanks to its specific fermentation, fresh milk is transformed into a slightly acidic, fresh and creamy drink. Its ferments contribute to well-being due to its natural action on the intestinal flora.','https://www.luxlait.lu/wp-content/uploads/2019/09/Kefir-face-1.png',2),

       ('Garlic Herb Butter','For your barbecues, meat dishes or however you prefer: choose the Luxlait Garlic herb butter. Made with traditional “Rose” butter from Luxembourg (PDO) and garnished with parsley and garlic.','https://www.luxlait.lu/wp-content/uploads/2022/06/Beurre-ail-et-fines-herbes_2_HD_-1024x303.png',3),
       ('Rose Butter','Unlike industrial butter, the cream is left maturing after being pasteurised by adding carefully selected lactic acid bacteria. That""s when the unique taste of our butter develops. Finely churned in a traditional process, the cream becomes smooth to obtain its final appearance: “Beurre Rose” butter.','https://www.luxlait.lu/wp-content/uploads/2019/09/beurre-rose-250g-1.png',3),
       ('Specialities with butter','Even kept in the refrigerator, our table butters are always ready to spread! Thanks to a mixture of butter and rapeseed oil, they can be used immediately. Our “light” version has up to half the fat content of conventional butter','https://www.luxlait.lu/wp-content/uploads/2019/10/Beurre_light-face-e1570526818637-1024x502.png',3),

       ('Liquid fresh cream','Luxlait liquid creams are ideal for preparing sauces, accompanying fruit or making cakes. Their hold when whipped with a hand or electric whisk enable them to be incorporated as a garnish or as an ingredient to enhance your dishes and desserts. Liquid fresh cream is not subjected to any treatment other than pasteurisation (neither ripening nor sterilisation). With its excellent whipping properties, it is the queen of Chantilly or whipped cream (in this case, it must be 36% fat cream).','https://www.luxlait.lu/wp-content/uploads/2019/09/Cr%C3%A8me-fraiche-36-1L_2_HD_ok_-334x1024.png',4),
       ('UHT liquide cream','UHT liquid creams are ideal for making sauces, soups and desserts or simply plain to accompany fruit. They are suitable for cooking, but cannot be whipped (except 35% fat cream). They also provide a binding agent for culinary preparations and smoothness for all dishes.','https://www.luxlait.lu/wp-content/uploads/2020/05/Cr%C3%A8me-UHT-35-1L-384x1024.png',4),
       ('Coffee cream','This small portion of cream lessens the natural bitterness of the coffee and adds a special sweetness that cannot be obtained from milk. In short, the essential plus for all lovers of coffee with cream','https://www.luxlait.lu/wp-content/uploads/2020/05/Coffee-Cream-Dosette_75g.png',4),
       ('Sour cream','Thick and creamy, you won""t be able to resist the delicacy of the Luxlait fresh creams. You will appreciate their excellent cooking performance and softness. Their qualities to bind sauces, garnish dishes and provide tasty toppings will delight food lovers. Their practical formats, as well as their binding power will make your daily cooking easier.','https://www.luxlait.lu/wp-content/uploads/2019/09/Cr%C3%A8me-fraiche-epaisse-250g_Site-1024x798.png',4),

       ('Organic Faisselle','Our organic faisselle is a fresh cheese made of organic, pasteurized full fat milk. Its name comes from the French word faisselle, designating the sieve in which the faisselle is put to drain. All production steps are manual, from the moulding with a ladle to the closing of the pots. You can use our faisselle both in your sweet and savoury dishes or simply enjoy it with some honey, jam or a fruit coulis.','https://www.luxlait.lu/wp-content/uploads/2022/05/FaisselleBio_Face-1-1024x680.png',5),
       ('Cottage cheese','Thanks to its melting texture and its curds of creamy fresh cheese, Luxlait cottage cheese was awarded adistinction in the “Superior Taste” competition. Luxlait cottage cheese occupies a special place in the fresh cheese landscape. Often eaten on bread, seasoned with salt, pepper and herbs, it is ideal for your savoury or sweet recipes. It is high in protein and low in fat.','https://www.luxlait.lu/wp-content/uploads/2019/09/cottage-cheese-250g_Site-1024x807.png',5),
       ('Soft white cheese','Luxlait fresh cheeses are prepared according to the traditional recipe and from simple ingredients: milk and a touch of cream (only in cream cheese). It can be used in all kinds of savoury or sweet dishes.','https://www.luxlait.lu/wp-content/uploads/2019/09/fromage-blanc-maigre-250g_Site-1024x793.png',5),
       ('Brach','Luxlait Brach is made from pasteurised whole milk to which lactic ferments have been added. Historically, it was used in Luxembourg cooking in times of famine, particularly as an accompaniment to the famous “Gequellte Gromper” (baked potato). Brach is timeless and has remained an essential product in Luxembourg households.','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait-caill%C3%A9-250g_Site-1024x800.png',5),

       ('Organic Brie','Our Brie cheese is made of 100% organic Luxembourg milk. Discover its soft taste on a cheese platter, in a sandwich or in a savoury dish.','https://www.luxlait.lu/wp-content/uploads/2022/06/Brie_2_HD_-1024x996.png',6),
       ('Beer Cheese','The unique character of our cheese lies in the texture, roundness and fruitiness of a mature cheese, combined with the caramelised notes of the sublimely roasted malt of Battin Brune beer.','https://www.luxlait.lu/wp-content/uploads/2019/10/Gamme-fromage-battin-e1587383900682-1024x658.png',6),
       ('Grated Emmental','During the production and maturing of our Luxlait Emmental, our master cheesemakers select specific ferments that allow the formation of holes in the cheese when it matures in a warm cellar. This controlled process also gives Luxlait Emmental its characteristic fruity taste','https://www.luxlait.lu/wp-content/uploads/2019/10/56404_Emmental-rape-748x1024.png',6),
       ('Cheese slices','For well-filled sandwiches or cold or hot snacks, Luxlait cheeses have their own character and will meet everyone""s needs.','https://www.luxlait.lu/wp-content/uploads/2019/09/Emmental-706x1024.png',6),
       ('Kachkéis','Known as one of the monuments of Luxembourg gastronomy, Kachkéis is produced in a traditional way, without melting salts, colourings or preservatives. This authentic cheese comes in different forms. Indeed, it is possible to enjoy it cold, hot, cooked or even accompanied with a piece of bread with a dab of mustard.','https://www.luxlait.lu/wp-content/uploads/2019/09/Kachkeis_250_traditionnel_Face_Site-1024x655.png',6),
       ('Crème de Chapelain','Luxlait Crème de Chapelain offer a range of characteristic flavours for the whole family. Its creamy, smooth and homogeneous texture gives way to generous gourmet sandwiches.','https://www.luxlait.lu/wp-content/uploads/2019/09/Cremes-Chapelain-nature.png',6),

       ('Summer yoghurt','With the arrival of fine weather, Luxlait is reinventing itself and launching an innovative new range of three new summer yoghurts with new flavours! The well balanced combination of fruit, spices and fruit juices provides an original sensation of freshness. The flavours on offer, such as Yuzu & Green Tea, Mango & Turmeric or Cactus & Lime are very trendy and will delight the taste buds seeking novelty and quality. Faithful to its principles, the Luxembourg Yoghurt summer range is preservative-free and made with natural flavours. Taste them and give rein to your senses…','https://www.luxlait.lu/wp-content/uploads/2020/05/ete-mangue-1024x684.png',7),
       ('Yoghurt','The “Luxembourg yoghurt” range demonstrates Luxlait""s expertise in yoghurts. Their packaging in the form of a duo-pack and family pot are perfectly adapted to all current consumption patterns.','https://www.luxlait.lu/wp-content/uploads/2019/10/Fraise-1024x684.png',7),
       ('Winter yoghurt','Comforting and tasty in winter.','https://www.luxlait.lu/wp-content/uploads/2019/09/Hiver-sp%C3%A9culoos-1024x684.png',7),
       ('Funny yoghurt','Funny Yoghurt is a fruit-flavoured yoghurt for children. The fruit it contains has been blended, which makes it easier to eat.It will accompany your child as he grows and harden his bones! Rich in calcium, phosphorus and vitamins, it is a nourishing yoghurt that provides him with everything he needs.','https://www.luxlait.lu/wp-content/uploads/2019/09/Funny-banane-1024x600.png',7),
       ('Organic Yoghurt','Made without preservatives from milk, fruit and sugar, certified by the European Union""s organic label. Organic yoghurts are preservative-free. Thanks to our new recipe, the natural organic yoghurt is now stirred. This gives it a new, creamier and smoother texture to prolong your enjoyment. Go on, taste it!','https://www.luxlait.lu/wp-content/uploads/2020/05/Bio-nature-1024x684.png',7),
       ('0% Yoghurt','It is a fresh yoghurt with good melt-in-the-mouth fruit, without added sugar and fat.With its light texture and low acidity, it is a pleasant and refreshing product.It contains yoghurt lactic acid bacteria, which strengthen our digestive system: Straptococcus Thermophilus and Lactobacillus Bulgaricus. In addition, being rich in calcium, a pot of yoghurt meets 45% of the recommended daily intake. So, why deprive yourself?','https://www.luxlait.lu/wp-content/uploads/2019/09/0-museli_-1024x684.png',7),
       ('Cream yoghurt','Rich and creamy, creamy yoghurt is the dessert of gourmets. At any time of the day, let yourself be tempted by this smooth cream, subtly accompanied by real pieces of fruit or fine chocolate shavings, such as with the stracciatella creamy yoghurt. This is a rich preparation with 10% fat, rich in calcium and protein, enriched with cream, which will allow you to fill up with energy.','https://www.luxlait.lu/wp-content/uploads/2019/09/Satin%C3%A9-fruits-des-bois-1024x571.png',7),
    
       ('White cheese & fruits','Combining the sweetness of a creamy white cheese and a bed of gourmet fruit. The range of 4 flavours is suitable for everyday enjoyment','https://www.luxlait.lu/wp-content/uploads/2019/10/56115-fromage-blanc-abricot_Site-1024x526.png',8),
       ('Dessert','This authentic dessert made of white cheese with vanilla is placed on a bed of fruit and guarantees you a pleasant break.','https://www.luxlait.lu/wp-content/uploads/2020/05/56091-dessert-cerise_Site-1024x595.png',8),
       ('Fit wellness snack','A creamy fresh cheese combined with the delicacy of fruit. A range of 5 tasty flavours, to be enjoyed as a dessert or as a snack.','https://www.luxlait.lu/wp-content/uploads/2019/09/56155_fit-pomme-four_Site-1024x559.png',8),
       ('Greek-style yoghurt','Greek-style yoghurt is a traditional thick, creamy and tasty dairy product. It is available in four flavours: plain, honey, strawberry and peach & passionfruit.','https://www.luxlait.lu/wp-content/uploads/2019/09/54250-Yaourt-%C3%A0-la-grecque_site-1024x541.png',8),

       ('Cornets','According to taste, covered in a crunchy cocoa sauce with toasted hazelnuts dark chocolate flakes or strawberry puree.','https://www.luxlait.lu/wp-content/uploads/2019/08/Multipack-vanille_3_HD_-1024x805.png',9),
       ('Ice Cream Stick','Give yourself a refreshing break with Luxlait Ice Cream Sticks Available in chocolate, hazelnut and pistachio.','https://www.luxlait.lu/wp-content/uploads/2019/08/Noisette-Choco_3_HD_-1024x770.png',9),
       ('Ice cream tubs','Do you prefer ice cream or sorbet? For our ice cream tubs we chose only the best ingredients and lots of fruit! Let the intense taste and colorful packagings seduce you.','https://www.luxlait.lu/wp-content/uploads/2019/08/Glace-Luxlait-Vanille-853x1024.png',9),
       ('Miniatures','The fine crunchy shell is a perfect taster to enjoy the smooth vanilla, pistachio, raspberry, coconut and praline ice cream.','https://www.luxlait.lu/wp-content/uploads/2019/08/Miniatures-Framboise-simple_Dessus-1024x644.png',9),
       ('Water Sticks','You now don""t need to look elsewhere, Luxlait Ice Cream has developed a range of water-based ice sticks. The sticks are available in several flavours of orange, lemon and coca.','https://www.luxlait.lu/wp-content/uploads/2019/08/Watersticks-Mutlipack-Orange_2_HD_-1024x818.png',9),
       ('Frozen Yoghurt','To produce our Frozen Yoghurt, we use yoghurt instead of cream. Yoghurt contains less fat which makes it healthier. The 200ml pack with its integrated spoon is perfect for taking anywhere. Several flavours: strawberry, peach/passion fruit, salted butterscotch with pecan, vanilla and raspberry. Several flavours are also available in the 1 liter format.','https://www.luxlait.lu/wp-content/uploads/2019/09/Frozen-Yogurt-Caramel-1.png',9),
       ('Minicups','Luxlait minicups are individual portions composed of a creamy ice cream in a variety of flavours. As a snack or dessert, Luxlait minicups are ideal for a little gourmet break!','https://www.luxlait.lu/wp-content/uploads/2019/08/Minicups-Mutlipack-Fraise_3_HD_-1024x998.png',9),
       ('Organic Ice cream','Organic milk ice cream.','https://www.luxlait.lu/wp-content/uploads/2019/09/glace_bio_vanille.png',9),
       ('Fine crème','This fine and delicate composition will make you melt, spoonful after spoonful','https://www.luxlait.lu/wp-content/uploads/2019/10/FC_Chocolat.png',9),
       ('Dame blanche','With Luxlait Dame Blanche, you will find an essential classic … The refinement of this dessert will awaken your sensitivity. The intensity of the chocolate sauce mixed with the purity of the vanilla ice cream will make you melt with pleasure …','https://www.luxlait.lu/wp-content/uploads/2019/08/Boite-dame-blanche_BR-1024x824.png',9),
       ('Ice Cream Cake','The Lingot Vanille with its Bourbon vanilla intensity, the Brazilian cake made with a creamyvanilla-flavoured ice cream with such a melting praline heart, and the Christmas Log to enjoy during the Christmas season.','https://www.luxlait.lu/wp-content/uploads/2019/08/Lingot_Dessus-web-1024x509.png',9),

       ('Sablés','Biscuits with Luxlait “Rose” butter.','https://www.luxlait.lu/wp-content/uploads/2019/09/Site1-2-1024x267.png',10),
       ('Mini Sablés','Mini-biscuits with Luxlait "Rose" butter in different flavours','https://www.luxlait.lu/wp-content/uploads/2019/09/Minisables-Miel-Sesame-1024x1024.png',10),
       ('Galettes','Biscuits with Luxlait "Rose" butter.','https://www.luxlait.lu/wp-content/uploads/2019/09/Site1-1-1024x270.png',10),
       ('Choco Splits','Cookies with Luxlait "Rose" butter and dark chocolate chips.','https://www.luxlait.lu/wp-content/uploads/2019/09/Site1-1024x373.png',10);



CREATE TABLE tblProduct (
    idProduct INT NOT NULL AUTO_INCREMENT,
    dtProduct VARCHAR(100),
    dtMetricUnit VARCHAR(10),
    dtPrice DOUBLE NOT NULL,
    dtFat VARCHAR(5),
    dtImage VARCHAR(200) NOT NULL,
    dtPackage VARCHAR(25),
    fiType INT NOT NULL,
    PRIMARY KEY (idProduct),
    FOREIGN KEY (fiType) REFERENCES tblType (idType)
);

INSERT INTO tblProduct (dtProduct, dtMetricUnit, dtPrice, dtFat, dtImage, dtPackage, fiType)
VALUES  ('Fresh milk','1L',2.17,'3.5%','https://www.luxlait.lu/wp-content/uploads/2021/10/Lait-frais-3.5-1L_1_HD_OK_-1.png',NULL,1),
        ('Fresh milk','0.5L',0.99,'3.5%','https://www.luxlait.lu/wp-content/uploads/2021/10/Lait-frais-3.5-500ML_1_HD_OK_.png',NULL,1),
        ('Fresh milk','1L',1.97,'1.5%','https://www.luxlait.lu/wp-content/uploads/2021/10/Lait-frais-1.5-1L_1_HD_OK_.png',NULL,1),

        ('UHT whole milk','1L',1.63,'3.5%','https://www.luxlait.lu/wp-content/uploads/2021/10/Lait-Uht-3.5-1L_1_HD_OK.png',NULL,2),
        ('UHT semi-skimmed milk','1L',1.95,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait-UHT-1.5-1L_1_HD_OK.png',NULL,2),
        ('UHT skimmed milk','1L',2.17,'0%','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait_UHT_0_Sans-ombre.png',NULL,2),
        ('UHT whole milk','0.25L',1.08,'3.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-e3319160-1730-4a68-88e9-fb658ab1af6c.png',NULL,2),
        ('UHT organic milk','1L',2.05,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait-UHT-Bio-3.png',NULL,2),
        ('UHT lactose-free milk','1L',2.02,'1.5%','https://www.luxlait.lu/wp-content/uploads/2020/10/Lait_UHT_O-lactose_.png',NULL,2),
        
        ('Lacto-free milk','1L',1.91,'0%','https://www.luxlait.lu/wp-content/uploads/2020/10/Lait_UHT_O-lactose_.png',NULL,3),

        ('UHT milk','1L',2.05,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait-UHT-Bio-3.png',NULL,4),
        ('Fresh milk','1L',2.27,'3,5%','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait-frais-Bio-3.png',NULL,4), 
        ('Fresh milk','0.25L',0.69,'3,5%','https://www.luxlait.lu/wp-content/uploads/2019/09/TR-250-BiO_Face-1.png',NULL,4),

        ('Fresh Chocolate Milk','0.25L', 1.30, '3.5%','https://www.luxlait.lu/wp-content/uploads/2020/05/Lait-choco-Frais_250ML_face.png',NULL,5),
        ('Fresh Chocolate Milk','0.5L', 1.74, '3.5%','https://www.luxlait.lu/wp-content/uploads/2020/05/Lait-choco-frais_500ML-face.png',NULL,5),
        ('Fresh Chocolate Milk','1L', 3.09, '3.5%','https://www.luxlait.lu/wp-content/uploads/2020/05/Lait-choco-frais_1L_face.png',NULL,5),
       
        ('UHT milk','0.25L',1.08,'3.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-e3319160-1730-4a68-88e9-fb658ab1af6c.png',NULL,6),
        ('Fresh Chocolate Milk','0.25L', 1.46, '3.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-2b43c425-e38f-4d79-b6bd-d3b837c4085e.png',NULL,6),
        ('Vanilla Milk','0.25L',1.55,'1.6%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-f1d1e562-501e-4582-8ee4-bdb66c8fb7f5.png',NULL,6),
        ('Cafe Latte Cappuccino','0.25L',1.33,'2.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-8f1d2794-ffe6-40ef-b154-f88fad4e979f.png',NULL,6),
        ('Cafe Latte Caramel','0.25L',1.33,'2.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-cbd9712f-7224-49f1-bc29-3a781e6a1735.png',NULL,6),
        ('Cafe Latte Espresso','0.25L',1.33,'2.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-970ce447-1a8d-46a8-ab8f-c03602da6ea9.png',NULL,6),
        ('Milky strawberry','0.25L',1.33,'1%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-93c66a66-0d56-4122-a7a1-93d6d3e55a9a.png',NULL,6),
        ('Milky banana','0.25L',1.33,'1%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-73bc5a36-1681-49b1-9b38-f3631faddad9.png',NULL,6),

        ('Tropical','0.7L', 2.55, '0.1%','https://www.luxlait.lu/wp-content/uploads/2019/09/Funny-drink-tropical-1.png',NULL,7),
        ('Orange','0.7L', 2.55, '0.1%','https://www.luxlait.lu/wp-content/uploads/2019/09/Funny-drink-orange-1.png',NULL,7),

        ('Egg Nog','0.7L', 1.30, '3.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/Egg-nog-frais-0.75L_5_HD_OK_.png',NULL,8),


        ('Fermented milk','1L', 2.13,'1.5%','https://www.luxlait.lu/wp-content/uploads/2020/05/Lait-Fermente%CC%81-1L_face-2-e1641394646525.png',NULL,9),

        ('Lassi Mango','1L', 2.13,NULL,'https://www.luxlait.lu/wp-content/uploads/2024/01/TT-1000-Base-WEB.png',NULL,10),
        
        ('Laben Beldi','1L', 2.13,'1.6%','https://www.luxlait.lu/wp-content/uploads/2021/01/55190-Laben_1L-web2.png',NULL,11),
        
        ('Curd Milk','1L', 2.13,'2.6%','https://www.luxlait.lu/wp-content/uploads/2019/09/55140_RAIB_1L_Face-so.png',NULL,12),
        
        ('Pomegranate','1L', 2.08,'1.6%','https://www.luxlait.lu/wp-content/uploads/2019/09/Raibi-1L-1.png',NULL,13),
        ('Pomegranate','0.5L', 1.05,'1.6%','https://www.luxlait.lu/wp-content/uploads/2019/09/Raibi-05L.png',NULL,13),
        ('Pistachio','1L', 2.08,'1.6%','https://www.luxlait.lu/wp-content/uploads/2020/04/Rabi-pistache-V2_1_HD_.png',NULL,13),
        ('Pistachio','0.5L', 1.05,'1.6%','https://www.luxlait.lu/wp-content/uploads/2020/04/Raibi-Pistache-500ml_Face-Ombre-ok-site.png',NULL,13),
        ('Mango','1L', 2.08,'1.6%','https://www.luxlait.lu/wp-content/uploads/2020/04/Raibi-Mangue-Dummy_face-ok-site.png',NULL,13),
        ('Mango','0.5L', 1.05,'1.6%','https://www.luxlait.lu/wp-content/uploads/2020/04/Raibi-Mangue-Dummy_500ML_Face-ok-site.png',NULL,13),
        
        ('Plain','0.5L', 1.18,'1.6%','https://www.luxlait.lu/wp-content/uploads/2019/09/Kefir-face-1.png',NULL,14),
        ('Vanilla','0.5L', 1.28,'1.6%','https://www.luxlait.lu/wp-content/uploads/2019/09/Kefir-vanille-1.png',NULL,14),
        ('Blueberry','0.5L', 1.37,'1.6%','https://www.luxlait.lu/wp-content/uploads/2019/10/Kefir-Myrtille-face-500ml-e1570538615163.png',NULL,14),


        ('Garlic Herb Butter','125g', 3.16,NULL,'https://www.luxlait.lu/wp-content/uploads/2022/06/Beurre-ail-et-fines-herbes_2_HD_.png',NULL,15),

        ('Rose Butter','10g',0.18,'80%','https://www.luxlait.lu/wp-content/uploads/2019/10/Beurre10g.png','Plastic Tray',16),
        ('Rose Butter','125g',3.18,'80%','https://www.luxlait.lu/wp-content/uploads/2019/09/beurre-rose-125g-1.png','Aluminium packaging',16),
        ('Rose Butter','250g',3.85,'80%','https://www.luxlait.lu/wp-content/uploads/2019/09/beurre-rose-250g-1.png','Aluminium packaging',16),
        ('Rose Butter','250g',4.39,'80%','https://www.luxlait.lu/wp-content/uploads/2019/09/beurre-rose-250g-barquette-1.png','Plastic tray',16),
        ('Rose Butter','500g',7.67,'80%','https://www.luxlait.lu/wp-content/uploads/2019/09/beurre-rose-500g-1.png','Aluminium packaging',16),

        ('Spreadable','250g',4.33,'80%','https://www.luxlait.lu/wp-content/uploads/2019/10/Beurre_tartinable-face-e1570526858659.png','Plastic tray',17),
        ('Light','250g',4.03,'40%','https://www.luxlait.lu/wp-content/uploads/2019/10/Beurre_light-face-e1570526818637.png','Plastic tray',17),
        ('Semi-salted','250g',4.03,'75%','https://www.luxlait.lu/wp-content/uploads/2019/10/Beurre_demi-sel-face-e1570526892868.png','Plastic tray',17),


        ('Liquid fresh cream','0.25L',2.18,'33%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cr%C3%A8me-250ml_face.png',NULL,18),
        ('Liquid fresh cream','0.5L',4.50,'36%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cr%C3%A8me-fraiche-36-0.250L_1_HD_ok_.png',NULL,18),         
        ('Liquid fresh cream','1L',7.25,'36%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cr%C3%A8me-fraiche-36-1L_2_HD_ok_.png',NULL,18),  
        
        ('Whipping Cream','1L',7.25,'35%','https://www.luxlait.lu/wp-content/uploads/2020/05/Cr%C3%A8me-UHT-35-1L.png',NULL,19), 
        ('Smooth','0.2',2.04,'12%','https://www.luxlait.lu/wp-content/uploads/2019/09/cre%CC%80me-200ml-face-12.png',NULL,19),
        ('Whole','0.2L',1.80,'30%','https://www.luxlait.lu/wp-content/uploads/2019/09/cre%CC%80me-200ml-face-30.png',NULL,19), 
        ('Culinary Cream','1L',12.04,'18%','https://www.luxlait.lu/wp-content/uploads/2019/09/Creme-culinaire_Face.png',NULL,19),

        ('Coffee cream','10g',0.07,NULL,'https://www.luxlait.lu/wp-content/uploads/2020/05/Coffee-Cream-Dosette_75g.png',NULL,20),

        ('Thick','250g',3.40,'33%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cr%C3%A8me-fraiche-epaisse-250g_Site.png',NULL,21),
        ('Thick','500g',6.52,'33%','https://www.luxlait.lu/wp-content/uploads/2019/09/cr%C3%A8me-fraiche-epaisse-500g_Site.png',NULL,21),
        ('Light','250g',3.40,'33%','https://www.luxlait.lu/wp-content/uploads/2019/09/cr%C3%A8me-fraiche-250g_Site.png',NULL,21),
        ('French style','250g',3.40,'33%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cr%C3%A8me-fraiche-%C3%A0-la-fr-250g_Site.png',NULL,21),


        ('Organic faisselle','2x100g',4.69,'6%','https://www.luxlait.lu/wp-content/uploads/2022/05/FaisselleBio_Face-1.png',NULL,22),

        ('Cottage cheese','450g',5.04,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/09/cottage-cheese-250g_Site.png',NULL,23),
        ('Cottage cheese','225g',3.04,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/09/cottage-cheese-500g_Site.png',NULL,23),

        ('Light','250g',2.54,'0.2%','https://www.luxlait.lu/wp-content/uploads/2019/09/fromage-blanc-maigre-250g_Site.png',NULL,24),
        ('Light','500g',5.10,'0.2%','https://www.luxlait.lu/wp-content/uploads/2019/09/Fromage-blanc-maigre-500g_Site.png',NULL,24),
        ('With cream','250g',2.25,'9.2%','https://www.luxlait.lu/wp-content/uploads/2019/09/Fromage-frais-250g_Site.png',NULL,24),
        ('With cream','500g',5.12,'9.2%','https://www.luxlait.lu/wp-content/uploads/2019/09/fromage-blanc-500g_Site.png',NULL,24),

        ('Brach','250g',2.07,'3.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait-caill%C3%A9-250g_Site.png',NULL,25),


        ('Organic brie','150g',4.30,NULL,'https://www.luxlait.lu/wp-content/uploads/2022/06/Brie_2_HD_.png',NULL,26),

        ('Beer Cheese','140g',3.78,'48%','https://www.luxlait.lu/wp-content/uploads/2020/05/fromage-battin.png',NULL,27),

        ('Grated Emmental','200g',3.28,'31%','https://www.luxlait.lu/wp-content/uploads/2019/10/56404_Emmental-rape.png',NULL,28),

        ('Emmental','170g',4.05,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/09/Emmental.png',NULL,29),
        ('Chapelain','170g',4.05,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/09/Chapelain.png',NULL,29),
        ('Gouda','170g',4.05,NULL,'https://www.luxlait.lu/wp-content/uploads/2020/05/gouda.png',NULL,29),
        ('Gouda Light','170g',4.05,NULL,'https://www.luxlait.lu/wp-content/uploads/2020/05/gouda-light_.png',NULL,29),
        ('Edamer','170g',4.05,NULL,'https://www.luxlait.lu/wp-content/uploads/2020/05/Edamer.png',NULL,29),
        ('Abbaye','170g',4.05,NULL,'https://www.luxlait.lu/wp-content/uploads/2020/05/Abbaye.png',NULL,29),
        ('Lactose-free emmental','170g',3.85,NULL,'https://www.luxlait.lu/wp-content/uploads/2020/05/Emmental-0-lactose.png',NULL,29),
        ('Lactose-free gouda','170g',3.85,NULL,'https://www.luxlait.lu/wp-content/uploads/2020/05/gouda-0-lactose.png',NULL,29),

        ('Plain','250g',4.30,'40%','https://www.luxlait.lu/wp-content/uploads/2019/09/Kachkeis_250_traditionnel_Face_Site.png','Tub',30),
        ('With herbs','250g',4.30,'40%','https://www.luxlait.lu/wp-content/uploads/2019/09/Kachkeis_FinesHerbes_Face_Site.png','Tub',30),
        ('Low fat','250g',3.65,'0.1%','https://www.luxlait.lu/wp-content/uploads/2019/09/Kachkeis_maigre_Face_Site.png','Tub',30),
        ('Plain','100g',2.23,'40%','https://www.luxlait.lu/wp-content/uploads/2019/09/Kachkeis_100g_traditionnel_Face_Site.png','Tub',30),
        ('Low fat slab','250g',4.50,'0.1%','https://www.luxlait.lu/wp-content/uploads/2019/09/Kachke%CC%81is-saucisse-maigre-250g.png','Roll',30),
        ('Low fat slab','500g',5.60,'0.1%','https://www.luxlait.lu/wp-content/uploads/2019/09/Kachke%CC%81is-saucisse-maigre-500.png','Roll',30),

        ('Plain',NULL,2.78,'34%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cremes-Chapelain-nature.png',NULL,31),
        ('Sweet pepper & pimento',NULL,2.89,'34%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cra%CC%88me-de-chapelain-Poivron-Piment.png',NULL,31),
        ('Italian flavour',NULL,2.98,'34%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cra%CC%88me-de-chapelain-Saveur-Italienne.png',NULL,31),
        ('With black truffle from the Périgord',NULL,3.12,'34%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cra%CC%88me-de-Chapelain-O%CC%88-la-Truffe.png',NULL,31),


        ('Lime - Cactus','2x125g',2.15,'1.6%','https://www.luxlait.lu/wp-content/uploads/2020/05/ete-citron.png',NULL,32),
        ('Mango - Turmeric','2x125g',2.15,'1.6%','https://www.luxlait.lu/wp-content/uploads/2020/05/ete-mangue.png',NULL,32),
        ('Yuzu - Green Tea','2x125g',2.15,'1.5%','https://www.luxlait.lu/wp-content/uploads/2020/05/ete-yuzu.png',NULL,32),

        ('Pineapple','2x125g',2.04,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/Ananas.png',NULL,33),
        ('Pineapple','500g',3.24,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/Ananas-500g.png','Pot',33),
        ('Cherry','2x125g',2.04,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/cerise.png',NULL,33),
        ('Lemon','2x125g',2.04,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/citron.png',NULL,33),
        ('Strawberry','2x125g',2.04,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/Fraise.png',NULL,33),
        ('Strawberry','500g',3.24,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/Fraise-500g.png','Pot',33),
        ('Raspberry','2x125g',2.04,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/framboise.png',NULL,33),
        ('Blueberry','2x125g',2.04,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/myrtille.png',NULL,33),
        ('Peach','2x125g',2.04,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/p%C3%AAche.png',NULL,33),
        ('Peach passion fruit','500g',3.24,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/p%C3%AAche-et-fruit-de-la-passion-500g.png','Pot',33),
        ('Rhubarb','2x125g',2.04,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/Rhubarbbe.png',NULL,33),
        ('Vanilla','2x125g',2.04,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/Vanille.png',NULL,33),
        ('Vanilla','500g',3.24,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/Vanille-500g.png','Pot',33),
        ('Strawberry - 6 seeds','2x125g',2.04,'1.6%','https://www.luxlait.lu/wp-content/uploads/2019/10/Fraise-graine.png',NULL,33),
        ('Plain','2x125g',2.04,'3.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/nature.png',NULL,33),
        ('Plain','500g',3.24,'3.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/Nature-500-g.png','Pot',33),
        ('Hazelnut','2x125g',2.04,'3.7%','https://www.luxlait.lu/wp-content/uploads/2019/10/Noisette.png',NULL,33),
        ('Pina Colada','2x125g',2.04,'2.7%','https://www.luxlait.lu/wp-content/uploads/2019/10/Pina-colada.png',NULL,33),
        ('Plain stirred','8x125g',4.69,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/Multipack-nature.png',NULL,33),
        ('Fruit variety pack','8x125g',4.69,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/10/Multipack-fruit%C3%A9.png',NULL,33),

        ('Speculoos','2x125g',2.15,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/Hiver-sp%C3%A9culoos.png',NULL,34),
        ('Mandarin cheesecake','2x125g',2.15,'1.6%','https://www.luxlait.lu/wp-content/uploads/2019/09/hiver-fromage-blanc.png',NULL,34),
        ('Honey - Walnut','2x125g',2.15,'2.3%','https://www.luxlait.lu/wp-content/uploads/2019/09/Hiver-Noix.png',NULL,34),

        ('Apricot','2x125g',2.08,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/Funny-abricot.png',NULL,35),
        ('Banana','2x125g',2.08,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/Funny-banane.png',NULL,35),
        ('Strawberry','2x125g',2.08,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/Funny-fraise.png',NULL,35),

        ('Plain','2x125g',2.18,'3.5%','https://www.luxlait.lu/wp-content/uploads/2020/05/Bio-nature.png',NULL,36),
        ('Strawberry','2x125g',2.18,'2.8%','https://www.luxlait.lu/wp-content/uploads/2020/05/Bio-fraise.png',NULL,36),
        ('Peach','2x125g',2.18,'2.8%','https://www.luxlait.lu/wp-content/uploads/2020/05/Bio-p%C3%AAche.png',NULL,36),
        ('Vanilla','2x125g',2.18,'2.9%','https://www.luxlait.lu/wp-content/uploads/2020/05/Bio-vanille.png',NULL,36),

        ('Apricot','2x125g',1.94,'0.1%','https://www.luxlait.lu/wp-content/uploads/2019/09/0-abricot.png',NULL,37),
        ('Strawberry','2x125g',1.94,'0.1%','https://www.luxlait.lu/wp-content/uploads/2019/09/0-fraise_.png',NULL,37),
        ('Fruits of the forest','2x125g',1.94,'0.1%','https://www.luxlait.lu/wp-content/uploads/2019/09/0-fruits-des-bois_.png',NULL,37),
        ('Museli','2x125g',1.94,'0.4%','https://www.luxlait.lu/wp-content/uploads/2019/09/0-museli_.png',NULL,37),
        ('Plain','2x125g',1.94,'0.1%','https://www.luxlait.lu/wp-content/uploads/2019/09/0-nature_.png',NULL,37),

        ('Strawberry','2x125g',2.25,'10%','https://www.luxlait.lu/wp-content/uploads/2019/09/satin%C3%A9-fraise.png',NULL,38),
        ('Fruits of the forest','2x125g',2.25,'10%','https://www.luxlait.lu/wp-content/uploads/2019/09/Satin%C3%A9-fruits-des-bois.png',NULL,38),
        ('Stracciatella','2x125g',2.25,'11.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/satin%C3%A9-chocolat.png',NULL,38),
        ('Fruits of the orchard','2x125g',2.25,'10%','https://www.luxlait.lu/wp-content/uploads/2019/09/Satin%C3%A9-fruits-verger.png',NULL,38),
        ('Lemon','2x125g',2.25,'10%','https://www.luxlait.lu/wp-content/uploads/2019/09/Satin%C3%A9-citron.png',NULL,38),
        ('Vanilla','2x125g',2.25,'10%','https://www.luxlait.lu/wp-content/uploads/2019/09/satin%C3%A9-vanille.png',NULL,38),


        ('White cheese & strawberry','150g',1.64,'5%','https://www.luxlait.lu/wp-content/uploads/2019/10/56114-Fromage-blanc-fraise_Site.png',NULL,39),
        ('White cheese & apricot','150g',1.64,'5%','https://www.luxlait.lu/wp-content/uploads/2019/10/56115-fromage-blanc-abricot_Site.png',NULL,39),
        ('White cheese & pear','150g',1.64,'5%','https://www.luxlait.lu/wp-content/uploads/2019/10/56116-fromage-blanc-poires_Site.png',NULL,39),
        ('White cheese & fruits of the forest','150g',1.64,'5%','https://www.luxlait.lu/wp-content/uploads/2019/10/56117-fromahe-blanc-fruits-des-bois_Site.png',NULL,39),

        ('Pineapple','150g',1.52,'6%','https://www.luxlait.lu/wp-content/uploads/2020/05/56093-Dessert-ananas_Site.png',NULL,40),
        ('Cherry','150g',1.52,'6%','https://www.luxlait.lu/wp-content/uploads/2020/05/56091-dessert-cerise_Site.png',NULL,40),
        ('Strawberry','150g',1.52,'6%','https://www.luxlait.lu/wp-content/uploads/2020/05/56090-dessert-fraise_Site.png',NULL,40),

        ('Strawberry','125g',1.52,'5%','https://www.luxlait.lu/wp-content/uploads/2019/09/56151_fit-fraise_Site.png',NULL,41),
        ('Blueberry','125g',1.52,'5%','https://www.luxlait.lu/wp-content/uploads/2019/09/56150_fit-myrtille_Site.png',NULL,41),
        ('Caramelised baked apple','125g',1.52,'5%','https://www.luxlait.lu/wp-content/uploads/2019/09/56155_fit-pomme-four_Site.png',NULL,41),
        ('Vanilla','125g',1.52,'5%','https://www.luxlait.lu/wp-content/uploads/2019/09/56152_Fit-vanille_Site.png',NULL,41),

        ('Greek Style Yogurt Plain','150g',1.45,'12.2%','https://www.luxlait.lu/wp-content/uploads/2019/09/54250-Yaourt-%C3%A0-la-grecque_site.png',NULL,42),
        ('Greek Style Yogurt Honey','150g',1.45,'10%','https://www.luxlait.lu/wp-content/uploads/2019/09/54251-Yaourt-%C3%A0-la-grecque-miel_Site.png',NULL,42),
        ('Greek Style Yogurt Plain','1kg',9.67,'10%','https://www.luxlait.lu/wp-content/uploads/2019/09/Yaourt_grec.png',NULL,42),
        ('Greek Style Yogurt Strawberry','1kg',10.13,'8%','https://www.luxlait.lu/wp-content/uploads/2019/09/Yaourt-%C3%A0-la-grecque-fraise_2_HD_.png',NULL,42),
        ('Greek Style Yogurt Peach & Passionfruit','1kg',10.13,'8%','https://www.luxlait.lu/wp-content/uploads/2020/05/Yaourt-a%CC%80-la-grecque-pe%CC%80che-passion_2_HD_.png',NULL,42),


        ('Strawberry','6×77,5g',9.16,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Multipack-fraise_2_HD_ombre_-e1618404133243.png',NULL,43),
        ('Vanilla & coffee','6×73,5g',9.16,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Multipac-moka_2_HD_ombre_-e1618405784501.png',NULL,43),
        ('Hazelnut','6×76,5g',9.16,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Multipack-noisette_2_HD_ombre_-e1618405919467.png',NULL,43),
        ('Vanilla','6×76,5g',9.16,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Multipack-vanille_2_HD_ombre_-e1618405992152.png',NULL,43),
        ('Chocolate','6×77,5g',9.16,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Multipack-chocolat_2_HD_ombre_-e1618406300972.png',NULL,43),
        ('Lime sorbet','6×75,5g',9.16,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Multipack-citron_2_HD_ombre_-e1618406689731.png',NULL,43),

        ('Hazelnut','6x80ml',7.75,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Noisette-Choco_3_HD_.png',NULL,44),
        ('Pistachio','6x94ml',7.75,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Noisette-Choco_2_HD_.png',NULL,44),
        ('Vanilla','6x80ml',7.75,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Noisette-Choco_1_HD_.png',NULL,44),

        ('Vanilla ice cream','475ml',12.35,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Glace-Luxlait-Vanille.png',NULL,45),
        ('Strawberry ice cream','475ml',12.35,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Glace-Luxlait-Fraise.png',NULL,45),
        ('Pistachio ice cream','475ml',12.35,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Glace-Luxlait-Pistache.png',NULL,45),
        ('Chocolate ice cream','475ml',12.35,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Glace-Luxlait-Chocolat.png',NULL,45),
        ('Coffee ice cream','475ml',12.35,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Glace-Luxlait-Cafe.png',NULL,45),
        ('Mango passion fruit sorbet','475ml',12.35,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Glace-Luxlait-Sorbet-Mangue-Passion.png',NULL,45),
        ('Lemon sorbet','475ml',12.35,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Glace-Luxlait-Sorbet-Citron.png',NULL,45),
        ('Raspberry sorbet','475ml',12.35,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Glace-Luxlait-Sorbet-Framboise.png',NULL,45),
        ('Egg Nog ice cream','475ml',12.35,NULL,'https://www.luxlait.lu/wp-content/uploads/2022/03/Glace-Egg-Nog-dummy.png',NULL,45),
        ('Sorbet Crémant Rosé Brut Poll-Fabaire','475ml',12.35,NULL,'https://www.luxlait.lu/wp-content/uploads/2023/11/Sorbet-Cre%CC%81mant_1_.png',NULL,45),

        ('Coconut','10 iced pralines',2.50,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Miniatures-Coco-simple_Dessus.png',NULL,46),
        ('Raspberry','10 iced pralines',2.50,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Miniatures-Framboise-simple_Dessus.png',NULL,46),
        ('Pistachio','10 iced pralines',2.50,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Miniatures-Pistache-simple_Dessus.png',NULL,46),
        ('Praline','10 iced pralines',2.50,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Miniatures-Pralin%C3%A9-simple_Dessus.png',NULL,46),
        ('Vanilla','10 iced pralines',2.50,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Miniatures-Vanille-simple_Dessus.png',NULL,46),

        ('Lemon','6x80ml',7.15,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Watersticks-Mutlipack-Citron_2_HD_.png',NULL,47),
        ('Cola','6x80ml',7.15,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Watersticks-Mutlipack-Cola_2_HD_.png',NULL,47),
        ('Orange','6x80ml',7.15,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/08/Watersticks-Mutlipack-Orange_2_HD_.png',NULL,47),

        ('','',,'','',NULL,48),
        ('','',,'','',NULL,48),
        ('','',,'','',NULL,48),


      



CREATE TABLE tblRecipe(){
    idRecipe INT NOT NULL AUTO_INCREMENT,
    dtName VARCHAR(50) NOT NULL,
    dtDescription VARCHAR(200) NOT NULL
};

CREATE TABLE tblIngredient(){
    idIngredient INT NOT NULL AUTO_INCREMENT,
    dtName VARCHAR(50) NOT NULL
};

CREATE TABLE tblPreparation(){
    idPreparation INT NOT NULL AUTO_INCREMENT,
    dtName VARCHAR(50) NOT NULL,
    dtPreparationTime INT NOT NULL
};


