<p align="center">
  <img align="center" width="100px" height="100px" src="src/logo.png">
  <h1 align="center">Relational Database<h3 align="center"> 👨‍💻</h3>
</p>

### DDL - DATA DEFINITION LANGUAGE

<details>
  <summary>
    CREATE
  </summary>
  <ul>
<li>

#### CREATE TABLE [table_name];
```
CREATE TABLE [table_name] (
  [attribute_name] [attribute_type],
  [attribute_name2] [attribute_type]
);
```
##### Example
```
CREATE TABLE tb_estado (
  cod_estado CHAR(2) NOT NULL,
  desc_estado VARCHAR2(35) NOT NULL
);
```

</li>
<li>

#### CREATE SEQUENCE [sequence_name];
```
CREATE SEQUENCE [sequence_name]
  START WITH [start_sequence_value]
  INCREMENT BY [increment_sequence_value];
```
##### Example
```
CREATE SEQUENCE sq_tipo_titulo
  START WITH 1
  INCREMENT BY 1;
```

</li>
<li>

#### CREATE INDEX [index_name]
```
CREATE INDEX [index_name] ON [table_name] (attribute_name);
```
##### Example
```
CREATE INDEX idx_socio ON tb_socio (nome);
```

</li>
<li>

#### CREATE CONSTRAINT [constraint_name];

</li>
</details>

<details>
  <summary>
    ALTER
  </summary>

#### ALTER TABLE [table_name];

[ADD, RENAME, MODIFY, DROP COLUMN];

#### ALTER SEQUENCE [sequence_name];

#### ALTER INDEX [index_name];

#### ALTER CONSTRAINT [constraint_name]

</details>

<details>
  <summary>
    DROP
  </summary>
  <h5>DROP TABLE [table_name];</h5>
  
  <h5>DROP SEQUENCE [sequence_name];</h5>

  <h5>DROP INDEX [index_name];</h5>

  <h5>DROP CONSTRAINT [constraint_name];</h5>
</details>

</ul>

### DML - DATA MANIPULATION LANGUAGE

<details>
  <summary>
    INSERT INTO
  </summary>

INSERT INTO [tablename] ([COLUMN NAME], [COLUMN NAME2]) VALUES ([COLUMN NAME VALUE], [COLUMN NAME2 VALUE]);

</details>

<details>
  <summary>
    UPDATE
  </summary>

UPDATE [tablename] SET [columnname] = [columnnamevalue] WHERE [columnname2] = [columnname2value];

UPDATE [tablename] SET [columnname] = [columnnamevalue];

</details>
<details>
  <summary>
    DELETE FROM
  </summary>

DELETE FROM [tablename] WHERE [columnname] = [columnnamevalue];

DELETE FROM [tablename];

</details>
