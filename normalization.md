# Principles of Normalization:

## 1st Normal Form (1NF):
* Each cell should be single-valued (atomicity)
* Entries in a column are of same type
* Rows should be uniquely identified (have a primary key)
* No duplicated rows or columns

## 2nd Normal Form (2NF):
* Table is in 1NF
* Table has no partial dependency; all non-key attributes are fully dependent on primary key

## 3rd Normal Form (3NF):
* Table is in 2NF
* Table has no transitive partial dependency

