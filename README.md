# Foodioo => persional project

Foodioo (will update after) is a Distribution Management System app built with Flutter, a team university project (team size: 3).

## Features

Use with a social app. 
Can book a food.
Can view location of user nearby

## Tech Stack

**Client:** Flutter (APP) -  Blade engine (WEB)

**Server:** GoLang - RestAPI - AWS

**State Management:** Bloc 

**Project Architecture:** MVVM

## Installation

- Clone the project

- Go to the project directory and run these commands:




```bash
  flutter pub get
  
  dart run build_runner clean

  dart run build_runner build --delete-conflicting-outputs
  
  flutter run --release
```


 - Generate icons and images routing: 


```bash

  dart run build_runner build

```

- Generate icons and images with custom gen tool by run cmd with .sh files


```

  ./icons-gen.sh
  ./images-gen.sh

```

## LICENSE

```
Copyright (C) 2024 Đoàn Minh Hiếu - All Rights Reserved.

THE CONTENTS OF THIS PROJECT ARE PROPRIETARY AND CONFIDENTIAL.
UNAUTHORIZED COPYING, TRANSFERRING OR REPRODUCTION OF THE CONTENTS OF THIS PROJECT, VIA ANY MEDIUM IS STRICTLY PROHIBITED.

The receipt or possession of the source code and/or any parts thereof does not convey or imply any right to use them
for any purpose other than the purpose for which they were provided to you.

The software is provided "AS IS", without warranty of any kind, express or implied, including but not limited to
the warranties of merchantability, fitness for a particular purpose and non infringement.
In no event shall the authors or copyright holders be liable for any claim, damages or other liability,
whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software
or the use or other dealings in the software.

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
```