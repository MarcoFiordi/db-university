/*Selezionare gli studenti nati nel 1990 (190)*/
SELECT *
FROM `students`
WHERE `students`.`date_of_birth` LIKE '1990%';

/*Seleziona tutti i corsi che valgono più di 10 crediti*/
SELECT *
FROM `courses`
WHERE `cfu` > 10;

/*Seleziona tutti gli studenti che hanno più di 30 anni*/
SELECT `students`.*
FROM `students`
WHERE `students`.`date_of_birth` < '1996-01-01';

/*Seleziona tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286) */
SELECT `courses`.*
FROM `courses`
WHERE `courses`.`period` = 'I semestre' AND `courses`.`year` = '1';

