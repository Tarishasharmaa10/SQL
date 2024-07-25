#################### TABLE :01: ADVERTISING1 ####################
###################                          #################

USE ASSIGNMENTS
SHOW TABLES
SHOW CREATE TABLE advertising
CREATE TABLE advertising1(
  _ varchar(10) NOT NULL,
  tv decimal(20,6) NOT NULL,
  radio decimal(20,6) DEFAULT NULL,
  newspaper decimal(20,6) NOT NULL,
  sales decimal(20,6) NOT NULL
) 
INSERT INTO advertising1 SELECT * FROM advertising
SELECT * FROM advertising1

## ASSIGNMENT QUESTIONS ##

#1# USING SELECT ON COUNT, MIN, MAX, AVG, ROUND ##

## ROUND ##
SELECT SR_NO,ROUND(TV),RADIO FROM ADVERTISING1 WHERE ROUND(TV) > 200 
## MAX , MIN ##
SELECT MAX(TV) ,MIN(RADIO) FROM ADVERTISING1
## MIN ##
SELECT MIN(RADIO) FROM ADVERTISING1
## AVG , COUNT ##
SELECT AVG(SALES),COUNT(RADIO) FROM ADVERTISING1 WHERE Radio >24
## COUNT ##
SELECT COUNT(RADIO) FROM advertising1 WHERE RADIO>24 


#2# ALIAS  (AS) ##

SELECT MAX(RADIO) AS RADIO_MAX FROM advertising1

#3# LIMIT AND OFFSET AND ROW FIRST ##

SELECT * FROM advertising1 LIMIT 2 OFFSET 5 

SELECT * FROM advertising1 
FETCH  FIRST 2 ROWS ONLY   

#4# WHERE (AND ,OR , NOT) ##

SELECT * FROM ADVERTISING1 WHERE TV AND RADIO > 20 

SELECT * FROM ADVERTISING1 WHERE TV OR RADIO > 20 

SELECT * FROM ADVERTISING1 WHERE  NOT TV > 20 

#5# ORDER BY , GROUP BY ##

SELECT * FROM advertising1 ORDER BY TV

SELECT * FROM advertising1 ORDER BY SALES DESC

SELECT COUNT(RADIO),RADIO FROM advertising1
GROUP BY RADIO

#6# UNION AND UNION ALL

SELECT _TV_ FROM advertising
UNION
SELECT TV FROM advertising1

SELECT _TV_ FROM advertising
UNION ALL
SELECT TV FROM advertising1

#7# CASE STATEMENT ##  

SELECT *,
CASE
WHEN SALES > 15 AND SALES <25 THEN "ABOVE AVERAGE"
WHEN SALES < 15 THEN "BELOW AVERAGE"
ELSE "GOOD SALES"
END AS SALES_ANALYSE
FROM advertising1 

#8# ANY , ALL ##

SELECT * FROM ADVERTISING1
WHERE NEWSPAPER > ANY(SELECT RADIO FROM advertising1 WHERE RADIO>40)

SELECT * FROM ADVERTISING1
WHERE NEWSPAPER > ALL(SELECT RADIO FROM advertising1 WHERE RADIO>40)

###################### TABLE :02: CREDIT1 #######################
######################                    ########################

USE assignments
SELECT * FROM CREDIT
SHOW CREATE TABLE CREDIT
CREATE TABLE credit1(
  SR_NO VARCHAR(50) NOT NULL,income decimal(20,6) NOT NULL,
  limit_ smallint NOT NULL,rating smallint NOT NULL,
  cards  tinyint NOT NULL,age tinyint NOT NULL,
  education tinyint NOT NULL,gender varchar(10) NOT NULL,
  student varchar(10) NOT NULL,married varchar(10) NOT NULL,
  ethnicity varchar(20) NOT NULL,
  balance smallint DEFAULT NULL
) 
INSERT INTO credit1 SELECT * FROM credit
SELECT * FROM credit1

### ASSIGNMENTS QUESTIONS ###

#1# ROUND,MAX,MIN,AVG,COUNT #

SELECT ROUND(income),MAX(LIMIT_),MIN(CARDS),AVG(AGE),COUNT(EDUCATION) 
FROM CREDIT1

#2# UNION AND UNION ALL

SELECT _CARDS_ FROM CREDIT
UNION
SELECT CARDS FROM CREDIT1

SELECT _CARDS_ FROM CREDIT
UNION ALL
SELECT CARDS FROM CREDIT1

#3# CASE , ALIAS #

SELECT *,
CASE
WHEN RATING>500 THEN "GOOD RATING."
WHEN RATING<500 THEN "AVERAGE RATING."
WHEN RATING<=200 THEN "BELOW AVERAGE RATING."
END AS RATING_ANALYSE
FROM credit1

#4# ORDER BY,GROUP BY,LIMIT,OFFSET, ROW FIRST #

SELECT * FROM CREDIT1
GROUP BY CARDS
ORDER BY AGE DESC
LIMIT 5 OFFSET 2

#5# FIRST ROWS , AND #

SELECT * FROM CREDIT1 WHERE CARDS >2 AND AGE > 2
FETCH FIRST 5 ROWS ONLY 

#6# ANY , OR #

SELECT RATING FROM CREDIT1
WHERE BALANCE > ANY (SELECT BALANCE FROM CREDIT1 WHERE CARDS>3 OR AGE >34)

#7# ALL , NOT #
 
SELECT ALL INCOME,LIMIT_ FROM CREDIT1
WHERE  NOT  RATING>300


##################### TABLE :03: INCOME1 #####################
#####################                    #####################

USE ASSIGNMENTS
SELECT * FROM income
SHOW CREATE TABLE income
CREATE TABLE income1 (
  _ varchar(10) NOT NULL,
  education tinyint(4) NOT NULL,
  income decimal(20,6) NOT NULL
) 
INSERT INTO income1 SELECT * FROM income
SELECT * FROM income1

## ASSIGNMENTS QUESTIONS ##

#1# ROUND,MAX,MIN,AVG,COUNT #

SELECT ROUND(_income_),MAX(_income_),MIN(_education_),
AVG(_income_),COUNT(_education_) 
FROM income1

#2# UNION AND UNION ALL #

SELECT _EDUCATION_ FROM INCOME1 
UNION
SELECT EDUCATION FROM INCOME

SELECT _EDUCATION_ FROM INCOME1 
UNION ALL
SELECT EDUCATION FROM INCOME

#3# CASE , ALIAS #

SELECT *,
CASE
WHEN _INCOME_>25 THEN "GOOD INCOME."
WHEN _INCOME_<25 THEN "AVERAGE INCOME."
WHEN _INCOME_<=20 THEN "BELOW INCOME."
END AS INCOME_ANALYSE
FROM INCOME1

#4# ORDER BY,GROUP BY,LIMIT,OFFSET, ROW FIRST #

SELECT * FROM INCOME1
GROUP BY _EDUCATION_
ORDER BY _INCOME_ DESC
LIMIT 5 OFFSET 2

#5# FIRST ROWS , AND #

SELECT * FROM INCOME1 WHERE _EDUCATION_ >10 AND _INCOME_>20
FETCH FIRST 5 ROWS ONLY 

#6# ANY , OR #

SELECT _EDUCATION_ FROM INCOME1
WHERE _INCOME_>ANY(
SELECT _INCOME_ FROM INCOME1 _ WHERE _EDUCATION_>10 OR _>34)

#7# ALL , NOT #
 
SELECT ALL _INCOME_ FROM INCOME1
WHERE  NOT _EDUCATION_>10


##################### TABLE :04: COLLEGE2 ####################
#####################                     #####################

USE ASSIGNMENTS
SELECT * FROM COLLEGE1
SHOW CREATE TABLE COLLEGE1
CREATE TABLE college2 (
  _ varchar(50) NOT NULL,
  private varchar(10) NOT NULL,
  apps mediumint(9) NOT NULL,
  accept smallint(6) NOT NULL,
  enroll smallint(6) NOT NULL,
  top10perc tinyint(4) NOT NULL,
  top25perc tinyint(4) NOT NULL,
  f_undergrad smallint(6) NOT NULL,
  p_undergrad smallint(6) NOT NULL,
  outstate smallint(6) NOT NULL,
  room_board smallint(6) NOT NULL,
  books smallint(6) NOT NULL,
  personal smallint(6) NOT NULL,
  phd tinyint(4) NOT NULL,
  terminal tinyint(4) NOT NULL,
  s_f_ratio decimal(20,6) NOT NULL,
  perc_alumni tinyint(4) DEFAULT NULL,
  expend mediumint(9) NOT NULL,
  grad_rate tinyint(4) NOT NULL
) 
INSERT INTO COLLEGE2 SELECT * FROM COLLEGE1
SELECT * FROM COLLEGE2

## ASSIGNMENTS QUESTIONS ##

#1# ROUND,MAX,MIN,AVG,COUNT #

SELECT ROUND(p_undergrad),MAX(top25perc),MIN(phd),
AVG(terminal),COUNT(personal) 
FROM college2

#2# UNION AND UNION ALL

SELECT TOP10PERC FROM COLLEGE2
UNION
SELECT TOP10PERC FROM COLLEGE1

SELECT TOP10PERC FROM COLLEGE2
UNION ALL
SELECT TOP10PERC FROM COLLEGE1

#3# CASE , ALIAS #

SELECT *,
CASE
WHEN _INCOME_>25 THEN "GOOD INCOME."
WHEN _INCOME_<25 THEN "AVERAGE INCOME."
WHEN _INCOME_<=20 THEN "BELOW INCOME."
END AS INCOME_ANALYSE
FROM INCOME1

#4# ORDER BY,GROUP BY,LIMIT,OFFSET, ROW FIRST #

SELECT * FROM INCOME1
GROUP BY _EDUCATION_
ORDER BY _INCOME_ DESC
LIMIT 5 OFFSET 2

#5# FIRST ROWS , AND #

SELECT * FROM INCOME1 WHERE _EDUCATION_ >10 AND _INCOME_>20
FETCH FIRST 5 ROWS ONLY 

#6# ANY , OR #

SELECT _EDUCATION_ FROM INCOME1
WHERE _INCOME_>ANY(
SELECT _INCOME_ FROM INCOME1 _ WHERE _EDUCATION_>10 OR _>34)

#7# ALL , NOT #
 
SELECT ALL _INCOME_ FROM INCOME1
WHERE  NOT _EDUCATION_>10



################### TABLE :05: CH10EX11 #######################
###################                     #########################

SHOW CREATE TABLE ch10ex11
SELECT * FROM ch10ex11
CREATE TABLE ch10eX (
  _0 varchar(20) NOT NULL,_1 varchar(20) NOT NULL,
  _2 varchar(20) NOT NULL,_3 varchar(20) NOT NULL,
  _4 varchar(20) NOT NULL,_5 varchar(20) NOT NULL,
  _6 varchar(20) NOT NULL,_7 varchar(20) NOT NULL,
  _8 varchar(20) NOT NULL,_9 varchar(20) NOT NULL,
  _10 varchar(20) NOT NULL,_11 varchar(20) NOT NULL,
  _12 varchar(20) NOT NULL,_13 varchar(20) NOT NULL,
  _14 varchar(20) NOT NULL,_15 varchar(20) NOT NULL,
  _16 varchar(20) NOT NULL,_17 varchar(20) NOT NULL,
  _18 varchar(20) NOT NULL,_19 varchar(20) NOT NULL,
  _20 varchar(20) NOT NULL,_21 varchar(20) NOT NULL,
  _22 varchar(20) NOT NULL,_23 varchar(20) NOT NULL,
  _24 varchar(20) NOT NULL,_25 varchar(20) NOT NULL,
  _26 varchar(20) NOT NULL,_27 varchar(20) NOT NULL,
  _28 varchar(20) NOT NULL,_29 varchar(20) NOT NULL,
  _30 varchar(20) NOT NULL,_31 varchar(20) NOT NULL,
  _32 varchar(20) NOT NULL,_33 varchar(20) NOT NULL,
  _34 varchar(20) NOT NULL,_35 varchar(20) NOT NULL,
  _36 varchar(20) NOT NULL,_37 varchar(20) NOT NULL,
  _38 varchar(20) NOT NULL,_39 varchar(20) NOT NULL
) 
INSERT INTO ch10eX SELECT * FROM CH10EX11
SELECT * FROM CH10EX

## ASSIGNMENTS QUESTIONS ##

#1# ROUND,MAX,MIN,AVG,COUNT #

SELECT ROUND(_0),MAX(_1),MIN(_2),
AVG(_3),COUNT(_4) 
FROM CH10EX

#2# UNION AND UNION ALL

SELECT _0 FROM CH10EX
UNION
SELECT _0_9619334 FROM CH10EX11

SELECT _0 FROM CH10EX
UNION ALL
SELECT _0_9619334 FROM CH10EX11

#3# CASE , ALIAS #

SELECT *,
CASE
WHEN _5 < 0 THEN "-ve value"
WHEN _5 >0 THEN "+ve value"
END AS value_ANALYSE
FROM ch10ex

#4# ORDER BY,GROUP BY,LIMIT,OFFSET, ROW FIRST #

SELECT * FROM CH10EX
GROUP BY _3
ORDER BY _8 DESC
LIMIT 5 OFFSET 2

#5# FIRST ROWS , AND #

SELECT * FROM CH10EX
FETCH FIRST 5 ROWS ONLY 

#6# ANY , OR #

SELECT _6 FROM CH10EX
WHERE _0>ANY(
SELECT _0 FROM CH10EX WHERE _0 >0 OR _0>1)

#7# ALL , NOT #
 
SELECT ALL _0,_1,_2 FROM ch10ex
WHERE  NOT _0>0

################### TABLE :06: EMPSALES1 #################################
###################                      #########################################

USE assignments
SELECT * FROM empsales
SHOW CREATE TABLE empsales
CREATE TABLE empsales1 (
  emp_id int(11) NOT NULL AUTO_INCREMENT,
  firstname varchar(20) NOT NULL,
  lastname varchar(20) NOT NULL,
  education varchar(20) NOT NULL,
  job_role varchar(30) NOT NULL,
  dept_id tinyint(4) NOT NULL,
  gender varchar(10) NOT NULL,
  maritalstatus varchar(10) NOT NULL,
  yearlyincome mediumint(9) NOT NULL,
  monthlyincome smallint(6) NOT NULL,
  sales decimal(20,6) NOT NULL,
  businesstravel varchar(20) NOT NULL,
  department varchar(30) NOT NULL,
  PRIMARY KEY (emp_id)
) 
INSERT INTO empsales1 SELECT * FROM empsales
SELECT * FROM EMPSALES1

## ASSIGNMENTS QUESTIONS ##

#1# ROUND,MAX,MIN,AVG,COUNT #

SELECT ROUND(sales),MAX(monthlyincome),MIN(yearlyincome),
AVG(sales),COUNT(dept_id) 
FROM empsales1

#2# UNION AND UNION ALL

SELECT DEPT_ID FROM EMPSALES1
UNION
SELECT DEPT_ID FROM EMPSALES

SELECT DEPT_ID FROM EMPSALES1
UNION ALL
SELECT DEPT_ID FROM EMPSALES

#3# CASE , ALIAS #

SELECT *,
CASE
WHEN monthlyincome >= 5000 THEN "good income"
WHEN monthlyincome <5000 AND monthlyincome >2000 THEN "average income"
ELSE "low income"
END AS income_ANALYSE
FROM empsales1

#4# ORDER BY,GROUP BY,LIMIT,OFFSET, ROW FIRST #

SELECT * FROM empsales1
GROUP BY gender
ORDER BY sales DESC
LIMIT 5 OFFSET 1

#5# FIRST ROWS , AND #

SELECT * FROM empsales1
FETCH FIRST 4 ROWS ONLY 

#6# ANY , OR #

SELECT education FROM empsales1
WHERE dept_id>ANY(
SELECT dept_id FROM empsales1 WHERE dept_id >1 OR dept_id>3)

#7# ALL , NOT #
 
SELECT ALL firstname,lastname,job_role FROM empsales1
WHERE  NOT monthlyincome>2000


################## TABLE :07: INCOME_2 ############################ 
##################                     ###########################

USE ASSIGNMENTS
SELECT * FROM income2
SHOW CREATE TABLE income2
CREATE TABLE income_2 (
  SR_NO varchar(10) NOT NULL,
  education decimal(20,6) NOT NULL,
  seniority decimal(20,6) NOT NULL,
  income decimal(20,6) NOT NULL
) 
INSERT INTO income_2 SELECT * FROM income2
SELECT * FROM INCOME_2

## ASSIGNMENTS QUESTIONS ##

#1# ROUND,MAX,MIN,AVG,COUNT #

SELECT ROUND(education),MAX(seniority),MIN(income),
AVG(education),COUNT(income) 
FROM income_2

#2# UNION AND UNION ALL

SELECT EDUCATION FROM INCOME_2
UNION
SELECT _EDUCATION_ FROM INCOME2

SELECT EDUCATION FROM INCOME_2
UNION ALL
SELECT _EDUCATION_ FROM INCOME2

#3# CASE , ALIAS #

SELECT *,
CASE
WHEN INCOME>90 THEN "GOOD INCOME."
WHEN INCOME<50 THEN "AVERAGE INCOME."
WHEN INCOME<=30 THEN "BELOW INCOME."
END AS INCOME_ANALYSE
FROM INCOME_2

#4# ORDER BY,GROUP BY,LIMIT,OFFSET, ROW FIRST #

SELECT * FROM INCOME_2
GROUP BY EDUCATION
ORDER BY SENIORITY DESC
LIMIT 5 OFFSET 2

#5# FIRST ROWS , AND #

SELECT * FROM INCOME_2 WHERE EDUCATION>10 AND INCOME>90
FETCH FIRST 5 ROWS ONLY 

#6# ANY , OR #

SELECT EDUCATION FROM INCOME_2
WHERE INCOME>ANY(
SELECT INCOME FROM INCOME_2 WHERE EDUCATION>10 OR SR_NO>34)

#7# ALL , NOT #
 
SELECT ALL INCOME FROM INCOME_2
WHERE  NOT EDUCATION>10

