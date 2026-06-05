/*Selezionare gli studenti nati nel 1990 (160)*/
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
WHERE `courses`.`period` = 'I semestre' 
	AND `courses`.`year` = '1';

/*Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
20/06/2020 (21)
*/
SELECT `exams`.*
FROM `exams`
WHERE `exams`.`hour` > '14:00:00' 
	AND `exams`.`date` = '2020-06-20';

/*Selezionare tutti i corsi di laurea magistrale*/
SELECT `degrees`.*
FROM `degrees`
WHERE `degrees`.`level` = 'magistrale';

/*Da quanti dipartimenti è composta l'università? (12)*/
SELECT COUNT(*)
FROM `departments`;

/*Quanti sono gli insegnanti che non hanno un numero di telefono*/
SELECT COUNT(*)
FROM `teachers`
WHERE `teachers`.`phone`IS NULL;

