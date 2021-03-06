-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.*
FROM `degrees` 
JOIN `students` 
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

--Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT `degrees`.*
FROM `departments`
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';

--Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `courses`.`name` AS 'course name', `teachers`.`id` AS 'teacher id'
FROM `teachers`
JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses`
ON `courses`.`id`= `course_teacher`.`course_id`
WHERE `teachers`.`id` = 44;

--Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui 
--sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `students`.`surname`, `students`.`name`, `degrees`.`name` AS 'Degree', `departments`.`name` AS 'Department name'
FROM `departments`
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
JOIN `students`
ON `degrees`.`id` = `students`.`degree_id`
ORDER BY `students`.`surname`, `students`.`name`;

--Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `degrees`.`name` AS 'Degree name', `courses`.`name` AS 'Course name', `teachers`.*
FROM `degrees`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`;

--Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT DISTINCT `teachers`.*, `departments`.`name` AS 'Department name'
FROM `departments`
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `departments`.`name` = 'Dipartimento di Matematica';

--BONUS: Selezionare per ogni studente quanti tentativi d???esame ha sostenuto per
--superare ciascuno dei suoi esami

SELECT `students`.`name`, `students`.`surname`, IF(COUNT(`courses`.`name`)>1, 'pi?? di un tentativo', 'primo tentativo') AS 'how_many_attemps', `courses`.`name` AS 'Course name', COUNT(`courses`.`name`) AS 'Student Attemps'
FROM `students`
JOIN `exam_student`
ON `students`.`id` = `exam_student`.`student_id`
JOIN `exams`
ON `exams`.`id` = `exam_student`.`exam_id`
JOIN `courses`
ON `courses`.`id` = `exams`.`course_id`
GROUP BY `students`.`name`, `students`.`surname`, `courses`.`name`