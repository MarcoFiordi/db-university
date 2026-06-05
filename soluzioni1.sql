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

/*QUERY CON JOIN*/
/*Selezionare tutti gli studenti iscritti al corso di laurea in economia*/
SELECT `students`.*
FROM `students`
	JOIN `degrees`
    ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = 'corso di laurea in Economia';

/*Selezionare tutti i Corsi di Laurea Magistrale del dipartimento di Neuroscienze*/
SELECT `degrees`.*
FROM `degrees`
	JOIN `departments`
    ON `degrees`.`department_id` = `departments`.`id`
WHERE `degrees`.`level` = 'magistrale' 
AND `departments`.`name` = 'Dipartimento di Neuroscienze';

/*Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)*/
SELECT `courses`.*
FROM `courses`
	JOIN `course_teacher`
	ON `courses`.`id` = `course_teacher`.`course_id`
		JOIN `teachers`
        ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`id` = 44;

/*Seleziona tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo 
dipartimento, in ordine alfabetico per cognome e nome*/
SELECT `students`.*, `degrees`.*, `departments`.*  
FROM `students`
	JOIN `degrees`
    ON `students`.`degree_id` = `degrees`.`id`
		JOIN `departments`
        ON `degrees`.`department_id` = `departments`.`id`
        ORDER BY `students`.`surname`, `students`.`name`;
        
/*Selezionare tutti i corsi di laurea con i realtivi corsi e isegnanti*/
SELECT `degrees`.`name`, `courses`.`name`, `teachers`.`name`, `teachers`.`surname` 
FROM `degrees`
	JOIN `courses`
    ON `courses`.`degree_id` = `degrees`.`id`
		JOIN `course_teacher`
		ON `course_teacher`.`course_id` = `courses`.`id`
			JOIN `teachers`
            ON `course_teacher`.`teacher_id` = `teachers`.`id`;
            
/*Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)*/
SELECT DISTINCT `teachers`.* 
FROM `teachers`
	JOIN `course_teacher`
    ON `teachers`.`id` = `course_teacher`.`teacher_id`
		JOIN `courses`
        ON `courses`.`id` = `course_teacher`.`course_id`
			JOIN `degrees`
            ON `degrees`.`id` = `courses`.`degree_id`
				JOIN `departments`
                ON `departments`.`id` = `degrees`.`department_id`
                WHERE `departments`.`name` LIKE '%MATEMATICA%';
                
                
 /*QUERY CON GROUP BY*/               
/*Contare quanti iscritti ci sono stati ogni anno*/
SELECT `students`.`enrolment_date`, COUNT(*)
FROM `students`
GROUP BY `students`.`enrolment_date`;

/*Contare gli insegnanti che hanno l'ufficio nello stesso edificio*/
SELECT `office_address`, COUNT(*) 
FROM `teachers`
GROUP BY `office_address`;





    
        








