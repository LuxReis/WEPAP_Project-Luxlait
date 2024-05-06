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
        <li><a href="#xampp">Heroku</a></li>
        <li><a href="#database">Database</a></li>
        <li><a href="#overview">Overview database</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

The project is a school project, that are created by six students from Lycée des Arts et Métiers. 
It is about web project for Luxlait. 
The project will be hosted by Heroku and use the database JawsDB MySQL. 
Here you can find a functionial website about Luxlait.
You can buy products from Luxlait with it, show recept to make your own Luxlait products, show information about the products, giving feedback and etc...

<img src="https://i.imgur.com/jbAGnkN.jpeg" alt="Luxlait Website example">

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

### Heroku (Web server/hosting)

You need a Heroku account and set it up
* Follow those steps to set up Heroku
    * Links: https://devcenter.heroku.com/start

You also need the php Buildpack. It should be added automaticly but if not follow this link: https://elements.heroku.com/buildpacks/heroku/heroku-buildpack-php

### Database

You need to use JawsDB MySQl
* Follow those steps
    * Links: https://devcenter.heroku.com/articles/jawsdb

This is the connection to the database. You normaly dont have to change anything with the connection code because it is connected with heroku
and it should managing everything automatic but if it doesnt connect to your database you need to change that:
<img src="https://i.imgur.com/dUaeQKH.png" alt="Luxlait JawsDB">
  ```sh
  <?php
    // Get JAWSDB_URL from environment variables
    $url = getenv('JAWSDB_URL'); //here you need the change if it doesnt apply automaticly (copy the name from attached as ... and paste it before the _URL)
    $dbparts = parse_url($url);

    // Extract connection details
    $hostname = $dbparts['host'];
    $username = $dbparts['user'];
    $password = $dbparts['pass'];
    $database = ltrim($dbparts['path'], '/');
  ?>
  ```

### Overview database
To have a overview from database you need MYSQL Workbench or similair programs.
  * MySQL Link: https://dev.mysql.com/doc/workbench/en/wb-installing.html

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
* Formica Luca - forlu102@school.lu

Project Link: [https://github.com/LuxReis/WEPAP_Project-Luxlait](https://github.com/LuxReis/WEPAP_Project-Luxlait)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [ReadMe Template](https://github.com/othneildrew/Best-README-Template)
* [w3school](https://www.w3schools.com)
* [LAM](https://www.artsetmetiers.lu)
* [Luxlait orginal](https://www.luxlait.lu/en/homepage/)
* [Heroku](https://dashboard.heroku.com/apps)

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
