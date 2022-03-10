-- Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(*), YEAR(`enrolment_date`) AS `enrolment_year`
FROM `students`
GROUP BY `enrolment_year`;

-- Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(*) AS `teachers`, `office_address` 
FROM `teachers`
GROUP BY `office_address`;

--  Calcolare la media dei voti di ogni appello d'esame

SELECT `exam_id`, ROUND(AVG(`vote`))
FROM `exam_student`
GROUP BY `exam_id`;

--  Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT COUNT(`name`) AS `tot_deegree`, `department_id`  
FROM `degrees`
GROUP BY `department_id`;