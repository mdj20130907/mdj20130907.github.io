### PHP Data Objects (PDO)
- https://www.php.net/manual/en/book.pdo.php

### Connections and Connection management
- Connecting to MySQL: DSN
- Handling connection errors: PDOException
- Closing a connection: set null
- Persistent connections: $dbh = new PDO('mysql:host=localhost;dbname=test', $user, $pass, [PDO::ATTR_PERSISTENT => true,]);

### Transactions and auto-commit
- transactions: Atomicity, Consistency, Isolation and Durability (ACID)
- PDO::beginTransaction() / PDO::commit() / PDO::rollBack()

### Prepared statements and stored procedures
- prepared statements: compiled template for the SQL
- The query only needs to be parsed (or prepared) once / The parameters to prepared statements don't need to be quoted
- placeholder must be used in the place of the whole value

- stored procedure
- output parameter
- input/output parameter

### Errors and error handling
- $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

### Large Objects (LOBs)

### The PDO class

### The PDOStatement class

### The PDOException class

### MySQL Functions (PDO_MYSQL)
