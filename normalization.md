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
- A user has more tan one phone number
- A user can have multiple roles (guest, host)

To resolve this, entities named "PhoneNumbers", "Roles" and "UserRoles" have een derived from the User entity.

| User    
----------------
| January  | $250    |
| February | $80     |
| March    | $420    |


