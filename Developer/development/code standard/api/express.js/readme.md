[![Express Logo](https://i.cloudup.com/zfY6lL7eFa-3000x3000.png)](http://expressjs.com/)

  Fast, unopinionated, minimalist web framework for [Node.js](http://nodejs.org).

  [![NPM Version][npm-version-image]][npm-url]
  
## Before start

### 1. Install yarn

```console
$ npm install yarn -g
```

### 2. Create Database

1. Install [postgresql v.13](https://www.postgresql.org/download/) 
2. Create database
```sql
$ CREATE DATABASE aims-dms-db;
```
### 3. Database migrate
```console
$ npx sequelize-cli db:migrate  
```
### 4. Database seed
```console
$ npx sequelize-cli db:seed:all  
```



## Start development server

  After finished all prerequisite

```console
$ yarn install
```

  Start the server:

```console
$ yarn start
```

[npm-url]: https://npmjs.org/package/express
[npm-version-image]: https://badgen.net/npm/v/express
