/*USFULL COMMANDS*/
    SHOW DATABASES;
     USE database;
    SHOW TABLES;
    SHOW COLUMNS FROM table;
    SHOW CREATE TABLE table \G  --display table recipe

/*SELECT statements.
  SELECT <column>...    
    FROM <table>; 
*/
  SELECT supname
    FROM supplier;

  SELECT supname, supcity
    FROM supplier;

  SELECT DISTINCT supnr         --DISTINCT keyword only shows unique entries 
    FROM purchase_order;

/*SELECT operations
  SELECT <column><arithmetic_operation> AS <tmp_name>
    FROM <table>
*/
  SELECT deliv_period/30 AS month_deliv_period 
    FROM supplies;

/* WHERE filters
  SELECT <column>...
    FROM <table>
   WHERE <field><condition>

         Conditions          explanation
         =================== ======================
         > >= = <= < <>      <> means not equal to
         AND OR NOT
         IN 
         IS NULL
         LIKE '_r%'          wildcards.
                             _ one character
                             % zero to * characters   
         BETWEEN ... AND ...
*/
  SELECT * 
    FROM supplier 
   WHERE supcity = 'San Francisco';

  SELECT * 
    FROM supplier 
   WHERE supcity = 'San Francisco'
     AND supstatus > 80;

  SELECT * 
    FROM supplier 
   WHERE supstatus BETWEEN 10 AND 80;

  SELECT prodnr, prodname  
    FROM product 
   WHERE prodtype in ('white', 'sparkling');

  SELECT * 
    FROM product 
   WHERE prodname LIKE '%ar_on%';

  SELECT * 
    FROM supplier 
   WHERE supstatus IS NULL;

/* COUNT AVG SUM 
  SELECT <FUNC>(<column>...)
    FROM <table>
   WHERE / GROUP BY ... HAVING
*/
  SELECT COUNT(*) 
    FROM supplies;

  SELECT COUNT(*) 
    FROM product 
   WHERE prodtype = 'white' ;

  SELECT COUNT(DISTINCT supnr) 
    FROM supplies;

  SELECT AVG(quantity), SUM(quantity), COUNT(prodnr) ,prodnr 
    FROM po_line 
GROUP BY prodnr;

  SELECT AVG(quantity), SUM(quantity), COUNT(prodnr) ,prodnr 
    FROM po_line 
GROUP BY prodnr 
  HAVING COUNT(*) >= 3;

/* ORDER BY*/
  SELECT COUNT(prodnr) ,prodnr 
    FROM po_line
GROUP BY prodnr ORDER BY COUNT(prodnr) ASC;

/*SELECT FROM multiple tables
  SELECT <table>.<column>,  <alias>.<column>
    FROM <table> AS <alias>, <table> AS <alias>
*/
  SELECT r.supnr, s.supnr 
    FROM supplier AS r, supplies AS s;

  SELECT DISTINCT r.supnr, r.supname,  s.prodnr 
    FROM supplier AS r, supplies AS s 
   WHERE s.supnr = r.supnr;

/*  JOIN operations
  SELECT <alias>.<table>
    FROM <table> AS <alias>
   INNER JOIN <table> AS <alias>
         ON (<alias>.<column> = <alias>.<column>)
*/
  SELECT DISTINCT s.*, r.supname 
    FROM supplier AS r 
   INNER JOIN supplies AS s 
         ON (r.supnr = s.supnr);

  SELECT DISTINCT s.prodnr, r.supname 
    FROM supplier AS r 
    LEFT OUTER JOIN supplies AS s
         ON (r.supnr = s.supnr) \g

  SELECT DISTINCT s.prodnr, r.supname 
    FROM supplier AS r 
   RIGHT OUTER JOIN supplies AS s
         ON (r.supnr = s.supnr) \G

/*FULL OUTER JOIN*/
  SELECT DISTINCT s.prodnr, r.supname 
    FROM supplier AS r
    LEFT OUTER JOIN supplies AS s
         ON (r.supnr = s.supnr)
         UNION
           SELECT DISTINCT s.prodnr, r.supname 
             FROM supplier AS r
                  RIGHT OUTER JOIN supplies AS s
                  ON (r.supnr = s.supnr)\g


/*NESTING ANY ALL*/
  SELECT supname 
    FROM supplier 
   WHERE supnr = 
         ( SELECT supnr 
             FROM purchase_order 
            WHERE ponr = '1560');

  SELECT supname 
    FROM supplier 
   WHERE supnr
      IN ( SELECT supnr 
             FROM supplies 
            WHERE prodnr = '0668'
              AND purchase_price >= ALL
                  ( SELECT purchase_price
                      FROM supplies 
                     WHERE prodnr = '0668'));

  SELECT supname 
    FROM supplier 
   WHERE supnr
      IN ( SELECT supnr
             FROM supplies 
            WHERE prodnr = '0178'
              AND purchase_price > ANY
                  ( SELECT purchase_price 
                      FROM supplies 
                     WHERE prodnr = '0178'));
