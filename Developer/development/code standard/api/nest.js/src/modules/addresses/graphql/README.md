Address Module for GraphQL

This module is the general module for users who have to keep data about addresses or locations

Entity: Address -> id, fullname, address, postcode, province, district, subDistrict, phone number, email, isDefault, createdAt, updatedAt, deletedAt, user (relations)

Features:

- Create - create a new address from the input arguments into the database
- FindAll - find all addresses in the database and return as a list of Address entities
- FindOne - find an address by id from the database and return as Address entity
- Remove - remove an address from the database

\*\*All features are working with User Module
