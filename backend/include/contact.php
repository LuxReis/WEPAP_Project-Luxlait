<?php
      $staffMembers = [
          [
            'name' => 'Guo Kaidi',
            'email' => 'guoka342@school.lu',
            'profile' => 'profil.png',
            'role' => 'Head Chef'
          ],
          [
            'name' => 'Ribeiro Costa Pedro',
            'email' => 'ribpe261@school.lu',
            'profile' => 'profil.png',
            'role' => 'IT Administrator'
          ],
          [
            'name' => 'Frisch Tim',
            'email' => 'friti725@school.lu',
            'profile' => 'profil.png',
            'role' => 'IT Administrator'
          ],
          [
            'name' => 'Friederici Thibaut',
            'email' => 'frith033@school.lu',
            'profile' => 'profil.png',
            'role' => 'IT Administrator'
          ],
          [
            'name' => 'Gamass Mihails',
            'email' => 'gammi625@school.lu',
            'profile' => 'profil.png',
            'role' => 'IT Administrator'
          ],
          [
            'name' => 'Formica Luca',
            'email' => 'forlu102@school.lu',
            'profile' => 'profil.png',
            'role' => 'IT Administrator'
          ]
      ];
      
      $staffJson = json_encode($staffMembers);
      echo $staffJson;
?>