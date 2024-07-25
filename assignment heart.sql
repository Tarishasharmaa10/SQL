USE practice
SHOW CREATE TABLE heart_1_
CREATE TABLE heart (
  sr_no smallint(6) NOT NULL,
  age tinyint(4) NOT NULL,
  sex tinyint(4) DEFAULT NULL,
  chestpain varchar(20) NOT NULL,
  restbp smallint(6) NOT NULL,
  chol smallint(6) NOT NULL,
  fbs tinyint(4) DEFAULT NULL,
  restecg tinyint(4) DEFAULT NULL,
  maxhr smallint(6) NOT NULL,
  exang tinyint(4) DEFAULT NULL,
  oldpeak decimal(20,6) DEFAULT NULL,
  slope tinyint(4) NOT NULL,
  ca varchar(10) DEFAULT NULL,
  thal varchar(10) NOT NULL,
  ahd varchar(10) NOT NULL
)


INSERT INTO heart SELECT * FROM heart_1_

SELECT * FROM heart