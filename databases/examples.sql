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

/*Q6        WHERE*/
  SELECT * 
    FROM supplier 
   WHERE supcity = 'San Francisco';

/*Q7        AND*/
  SELECT * 
    FROM supplier 
   WHERE supcity = 'San Francisco'
     AND supstatus > 80;
/*-Q8        BETWEEN AND*/
  SELECT * 
    FROM supplier 
   WHERE supstatus BETWEEN 10 AND 80;

/*Q9        IN*/
  SELECT prodnr, prodname  
    FROM product 
   WHERE prodtype in ('white', 'sparkling');

/*Q10       LIKE*/
  SELECT * 
    FROM product 
   WHERE prodname LIKE '%ar_on%';

/*Q11       IS NUL*/
  SELECT * 
    FROM supplier 
   WHERE supstatus IS NULL;

/*Q12*/
  SELECT COUNT(*) 
    FROM supplies;

  SELECT COUNT(*) 
    FROM product 
   WHERE prodtype = 'white' ;
/*-Q14       COUNT*/
  SELECT COUNT(DISTINCT supnr) 
    FROM supplies;

/*Q21       GROUP BY HAVING*/
  SELECT AVG(quantity), SUM(quantity), COUNT(prodnr) ,prodnr 
    FROM po_line 
GROUP BY prodnr;

/*Q22       GROUP BY HAVING*/
  SELECT AVG(quantity), SUM(quantity), COUNT(prodnr) ,prodnr 
    FROM po_line 
GROUP BY prodnr 
  HAVING COUNT(*) >= 3;

/*Q23       ORDER BY ASC, DESC*/
  SELECT COUNT(prodnr) ,prodnr 
    FROM po_line
GROUP BY prodnr ORDER BY COUNT(prodnr) ASC;

/*Q24*/
/*Q25 FROM table t*/
  SELECT r.supnr, s.supnr 
    FROM supplier r, supplies s;

/*Q26       FROM this s, that t   WHERE s.key = t.key;*/
  SELECT DISTINCT r.supnr, r.supname,  s.prodnr 
    FROM supplier r, supplies s 
   WHERE s.supnr = r.supnr;

/*Q27*/
  SELECT DISTINCT s.*, r.supname 
    FROM supplier AS r 
         INNER JOIN supplies AS s 
         ON (r.supnr = s.supnr) ;

  /*LECT DISTINCT s.*, r.supname */
    FROM supplier AS r
         INNER JOIN supplies AS s
         ON (r.supnr = s.supnr) \g

  /*LECT DISTINCT s.*, r.supname */
    FROM supplier AS r
         INNER JOIN supplies AS s
         ON (r.supnr = s.supnr) \G

/*-Q28       a INNER JOIN b ON a.i = b.i*/
  SELECT DISTINCT s.prodnr, r.supname 
    FROM supplier AS r
         INNER JOIN supplies AS s
         ON (r.supnr = s.supnr) \g

/*Q29       LEFT OUTER JOIN*/
  SELECT DISTINCT s.prodnr, r.supname 
    FROM supplier AS r 
         LEFT OUTER JOIN supplies AS s
         ON (r.supnr = s.supnr) \g

/*Q30       RIGHT OUTER JOIN*/
  SELECT DISTINCT s.prodnr, r.supname 
    FROM supplier AS r 
         RIGHT OUTER JOIN supplies AS s
         ON (r.supnr = s.supnr) \g

/*Q31       FULL OUTER JOIN*/
  SELECT DISTINCT s.prodnr, r.supname 
    FROM supplier AS r
         LEFT OUTER JOIN supplies AS s
         ON (r.supnr = s.supnr)
         UNION
           SELECT DISTINCT s.prodnr, r.supname 
             FROM supplier AS r
                  RIGHT OUTER JOIN supplies AS s
                  ON (r.supnr = s.supnr)\g

/*Q32       SELECT a.# FROM a, b, c WHERE a.i = b.i AND b.j = c.j AND c.# = '#'*/
  SELECT DISTINCT r.supname
    FROM supplier r, supplies s, product p 
   WHERE s.supnr = r.supnr
     AND s.prodnr = p.prodnr
     AND p.prodtype = 'ROSE';

/*Q33       SUM(b.@) WHERE a.i = b.i GROUP BY a.#*/
  SELECT p.prodnr, p.prodname, SUM(pol.quantity) 
    FROM product p, po_line pol 
   WHERE p.prodnr = pol.prodnr 
GROUP BY p.prodnr;

/*Q34       SELECT * FROM a WHERE i = (SELECT i FROM b WHERE j = '#')*/
  SELECT supname 
    FROM supplier 
   WHERE supnr = 
         ( SELECT supnr 
             FROM purchase_order 
            WHERE ponr = '1560');

/*Q36       SELECT FROM WHERE i IN (SELECT i FROM WHERE)*/
  SELECT supname 
    FROM supplier 
   WHERE supnr
      IN ( SELECT supnr 
             FROM supplies 
            WHERE prodnr = '0178');

/*Q37       SELECT FROM WHERE i = (SELECT COUNT(*) FROM WHERE)*/
  SELECT p.prodnr 
    FROM product p 
   WHERE 1 < 
         ( SELECT COUNT(*) 
             FROM po_line pol 
            WHERE p.prodnr = pol.prodnr);

/*Q42       SELECT FROM WHERE i >= ALL (SELECT FROM WHERE)          ALL*/
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

/*Q43       SELECT FROM WHERE i >= ANY (SELECT FROM WHERE)          ANY*/
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
