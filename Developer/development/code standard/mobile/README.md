# Sennalabs Flutter Template
##### This is repository for flutter template of sennalabs, You guys can clone this repository and make enhancement to this repository by making features upon your requirement.
## Folder Structure
- ios
  ios native files folder with contain ios native files for flutter runner engine

- android
  Android native files folder with contain Android native files for flutter runner engine

- libs
  This folder contain features of dart files and flutter widgets by using feature driving folder structure
    - config
      this folder will contains files for config in app in theses files
    - core
      this folder contain core feature of apps will be reused or will be use as main service for app.
        - api
          this folder contain api client for calling third party service such as back-end api, other service api.
        - cubit/bloc
          this folder contain main cubit/bloc service which use in whole app can be used once or multiple times.
        - enum
          this folder contain reuse enum files.
        - extension
          this folder contain dart files which will be used to extend some class type or service
        - hive
          this folder contain hive dart files for this projects
        - models
          this folder contain model dart files for this projects
        - override
          this folder contain override dart files for overriding some dart or flutter library files.
        - services
          this folder contain services dart files for this projects
        - theme
          this folder contain theme dart files for this projects
        - widgets
          this folder contain widgets dart files for this projects which will be used multiple times
    - features
      this folder contain app features dart files so in this folder gonna have each feature folder that will handle follow each feature.
        - example
          this folder is example feature folder so in real use you can naming this folder deplend on what feature you are developing
            - cubit/bloc
              this folder contain feature cubit/bloc file which use in this feature only will contain business login here.
            - screen
              this folder contain screen of example feature dart files no business in this file .
            - widgets
              this folder contain widgets of example feature dart files only no business in this file .
    - main.dart
      this file is entry dart files for initialise app at first run.
