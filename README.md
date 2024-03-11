<a name="readme-top"></a>

<!-- Template used from https://github.com/othneildrew/Best-README-Template -->
<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/LuxReis/WEPAP_Project-Luxlait">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNbROHIx3uWlCuQAwwnUfaax5Z36WtUlQJV2kslheyAA&s" alt="Luxlait Logo" width="300" height="200">
  </a>

<h2 align="center">WEPAP_Project-LuxLait</h2>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#xampp">Web Server / XAMPP</a></li>
        <li><a href="#database">Database</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

The project is a school project, that are created by five students from Lycée des Arts et Métiers. It is about web project for Luxlait. Here you can find a functionial website about Luxlait.
You can buy products from Luxlait with it, show recept to make your own Luxlait products, show information about the products, giving feedback and etc...

<img src="https://cdn.discordapp.com/attachments/758231362057666570/1216781704505852045/image.png?ex=6601a345&is=65ef2e45&hm=1ff213388576a4f2f3d57cc2bff6b609637e03bcd9141d5c66d69b171793b0cc&" alt="Luxlait Website example">

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![HTML][HTML.js]][HTML-url]
* [![CSS][CSS.js]][CSS-url]
* [![JavaScript][JavaScript.js]][JavaScript-url]
* [![PHP][PHP.io]][PHP-url]
* [![SQL][SQL.io]][SQL-url]
* [![Bootstrap][Bootstrap.com]][Bootstrap-url]
* [![JQuery][JQuery.com]][JQuery-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To get started with it you first need to download the "Code" and unzip it.

### Web Server / XAMPP 

You can put the website in a website server like Apache or you use XAMPP for it.
* Follow those steps to set up Apache server
    * For Windows: https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Install-Apache-Web-Server-24-Windows-10-ServerRoot-Error
    * For Windows with CMD: https://httpd.apache.org/docs/2.4/platform/windows.html
    * For Linux (Ubuntu): https://ubuntu.com/tutorials/install-and-configure-apache#1-overview

* Turn on the Apache and MySQL moduls
<p><img src="https://cdn.discordapp.com/attachments/758231362057666570/1216790970033504326/image.png?ex=6601abe6&is=65ef36e6&hm=f2a082cd9bf938e3cdde7f51ecb9b741340ae2d7c5572f344a2c782e05a687e3&" alt="xampp"></p>
  
* Put the files in the folders for the website server or in xampp in the htdocs folder
<p><img src="https://cdn.discordapp.com/attachments/758231362057666570/1216790927046344786/image.png?ex=6601abdb&is=65ef36db&hm=7f8154f34083bf53d39f3ade9882f2cf42ebdbf99c9c66d88992b90e9d1ec19c&" alt="htdocs from xampp"></p>

### Database

You need a database
* Follow those steps
    * For Windows: https://www.wikihow.com/Install-phpMyAdmin-on-Your-Windows-PC
    * For Linux (Ubuntu): https://ubuntu.com/server/docs/how-to-install-and-configure-phpmyadmin


This is the connection to the database. Those X has to be replace with the connection informations.
* Change the db_credentials file
  ```sh
  <?php
    define('DB_HOST', 'XXX.XXX.XXX.XXX'); // set database host (normally localhost)
    define('DB_USER', 'XXXXXXXX'); 	// set database user
    define('DB_PASSWORD', 'XXXXXXXXXXXX'); // set database password
    define('DB_NAME', 'XXXXXXX'); // set database name 
  ?>
  ```

After that you need to upload all sql file from "backend/db" to the database
<p><img src="https://cdn.discordapp.com/attachments/1131226423898685480/1216794815153574071/image.png?ex=6601af7a&is=65ef3a7a&hm=b5b57da443d03b56ec35f964b51aa620059359a6217414208e710df68dcc2df4&" alt="phpmyadmin"></p>

   <p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/Luxlait`)
3. Commit your Changes (`git commit -m 'Add some Luxlait'`)
4. Push to the Branch (`git push origin feature/Luxlait`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

* Kaidi GUO - guoka342@school.lu
* Tim Frisch - friti725@school.lu
* Thibaut Friederici - frith033@school.lu
* Pedro Ribeiro Costa - ribpe261@school.lu
* Mihails Gamass - gammi625@school.lu

Project Link: [https://github.com/LuxReis/WEPAP_Project-Luxlait](https://github.com/LuxReis/WEPAP_Project-Luxlait)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [ReadMe Template](https://github.com/othneildrew/Best-README-Template)
* [w3school](https://www.w3schools.com)
* [LAM](https://www.artsetmetiers.lu)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/LuxReis/WEPAP_Project-Luxlait.svg?style=for-the-badge
[contributors-url]: https://github.com/LuxReis/WEPAP_Project-Luxlait/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/LuxReis/WEPAP_Project-Luxlait.svg?style=for-the-badge
[forks-url]: https://github.com/LuxReis/WEPAP_Project-Luxlait/network/members
[stars-shield]: https://img.shields.io/github/stars/LuxReis/WEPAP_Project-Luxlait.svg?style=for-the-badge
[stars-url]: https://github.com/LuxReis/WEPAP_Project-Luxlait/stargazers
[issues-shield]: https://img.shields.io/github/issues/LuxReis/WEPAP_Project-Luxlait.svg?style=for-the-badge
[issues-url]: https://github.com/LuxReis/WEPAP_Project-Luxlait/issues
[license-shield]: https://img.shields.io/github/license/LuxReis/WEPAP_Project-Luxlait.svg?style=for-the-badge
[license-url]: https://github.com/LuxReis/WEPAP_Project-Luxlait/blob/master/LICENSE.txt
[HTML.js]: https://img.shields.io/badge/HTML-withe?style=for-the-badge&logo=html&color=orange
[HTML-url]: https://html.com
[CSS.js]: https://img.shields.io/badge/CSS-withe?style=for-the-badge&logo=CSS&color=blue
[CSS-url]: https://wiki.selfhtml.org/wiki/CSS
[JavaScript.js]: https://img.shields.io/badge/JavaScript-withe?style=for-the-badge&logo=javascript
[JavaScript-url]: https://www.javascript.com
[PHP.io]: https://img.shields.io/badge/PHP-withe?style=for-the-badge&logo=PHP&color=grey
[PHP-url]: https://www.php.net
[SQL.io]: https://img.shields.io/badge/SQL-withe?style=for-the-badge&logo=SQL&color=grey
[SQL-url]: https://sql.sh
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 
