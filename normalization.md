# _Principles of Normalization_:

### 1st Normal Form (1NF):
* Each cell should be single-valued (atomicity)
* Entries in a column are of same type
* Rows should be uniquely identified (have a primary key)
* No duplicated rows or columns

### 2nd Normal Form (2NF):
* Table is in 1NF
* Table has no partial dependency; all non-key attributes are fully dependent on primary key

### 3rd Normal Form (3NF):
* Table is in 2NF
* Table has no transitive partial dependency


## User Entity:

### 1st Normal Form:
In the User's table/entity, 1st NF is violated if;
- A user has more than one phone number
- A user can have multiple roles (guest, host)

To resolve this, entities named "PhoneNumbers", "Roles" and "UserRoles" have been derived from the User entity, to ensure atomicity


### 2nd Normal Form:
The User's table has no partial dependency, hence it is in 2NF.

### 3rd Normal Form:
The User's table has no transitive partial dependency, hence it is in 3NF.



## Property Entity:

### 1st Normal Form:
In the Property's table/entity;
- All attributes contain atomic values
- There are no duplicates

Therefore, the property entity is already in 1NF.


### 2nd Normal Form:
The Property's table has no partial dependency, hence it is in 2NF.

### 3rd Normal Form:
The Property's table has no transitive partial dependency, hence it is in 3NF.


## Booking Entity:

### 1st Normal Form:
In the Booking's table/entity;
- All attributes contain atomic values
- There are no duplicates

Therefore, the booking entity is already in 1NF.


### 2nd Normal Form:
The Booking's table has no partial dependency, hence it is in 2NF.

### 3rd Normal Form:
The Booking's table has no transitive partial dependency, hence it is in 3NF.


## Payment Entity:

### 1st Normal Form:
In the Payment's table/entity;
- All attributes contain atomic values
- There are no duplicates

Therefore, the payment entity is already in 1NF.


### 2nd Normal Form:
The Payment's table has no partial dependency, hence it is in 2NF.

### 3rd Normal Form:
The Payment's table has no transitive partial dependency, hence it is in 3NF.


