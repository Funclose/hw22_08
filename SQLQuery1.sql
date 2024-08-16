use MyAcademy

-- 1.Вивести кількість викладачів кафедри «Software Development».

select COUNT(*) as TeachersNum 
from Teachers t
join Departments d on t.Id = d.FacultyId
where d.Name ='Software Development'

--2. Вивести кількість лекцій, які читає викладач “Dave McQueen”

select Count(*) as numLectures from Lectures l
join Lectures lg on l.TeacherId = lg.Id

go

--3. Вивести кількість занять, які проводяться в аудиторії “D201”.

SELECT COUNT(*) as countLectures from Lectures 
where LectureRoom = 'D201'



--4. Вивести назви аудиторій та кількість лекцій, що проводяться в них.

SELECT l.Lectureroom as classroom, count(gl.id) as LecturesCount from Lectures l
join GroupsLectures gl on l.Id = gl.LectureId
GROUP by l.LectureRoom;


--5. Вивести кількість студентів, які відвідують лекції викладача “Jack Underhill”.

--SELECT * from Student


--6. Вивести середню ставку викладачів факультету Computer Science.


select AVG(salary) as avgSalary  
from Teachers
join Departments on Teachers.Id = Departments.Id
join Faculties on Departments.FacultyId = Faculties.Id
where Faculties.Name = 'Computer Science'


--7. Вивести мінімальну та максимальну кількість студентів серед усіх груп.

--select * Student from 

--8. Вивести середній фонд фінансування кафедр.

select avg(financing) as avgFinance from Departments

--9. Вивести повні імена викладачів та кількість читаних ними дисциплін.

select Name, surName,count(distinct SubjectId) as disciplineCount  from Teachers
join Lectures on Teachers.Id = Lectures.TeacherId
group by Teachers.Name, Teachers.Surname
order by disciplineCount desc;

--10. Вивести кількість лекцій щодня протягом тижня.

Select COUNT(GroupsLectures.Dayofweek), GroupsLectures.dayofweek from GroupsLectures
join Lectures on GroupsLectures.LectureId = Lectures.Id
group by GroupsLectures.dayofweek

--11. Вивести номери аудиторій та кількість кафедр, чиї лекції в них читаються.

select LectureRoom, count(distinct Departments.Id) as departmentCount from Lectures
join Subjects on Lectures.SubjectId = Subjects.Id
join Departments on Subjects.Id = Departments.Id
group by Lectures.LectureRoom


SELECT Lectures.LectureRoom AS RoomNumber, COUNT(DISTINCT Groups.DepartmentId) AS DepartmentCount
FROM Lectures 
JOIN GroupsLectures ON lectures.Id = GroupsLectures.LectureId
JOIN Groups  ON GroupsLectures.GroupId = Groups.Id
GROUP BY Lectures.LectureRoom;



--12.Вивести назви факультетів та кількість дисциплін, які на них читаються.

select faculties.Name as facultyName, count(distinct Subjects.Id) as subjectCount from Faculties
join Departments on Faculties.Id = Departments.FacultyId
join Groups on Departments.Id = Groups.DepartmentId
join GroupsLectures on Groups.Id = GroupsLectures.GroupId
join Lectures on GroupsLectures.LectureId = Lectures.Id
join Subjects on Lectures.SubjectId = Subjects.Id
group by Faculties.Name

--13. Вивести кількість лекцій для кожної пари викладач-аудиторія

select Teachers.Name,Lectures.LectureRoom ,count(Lectures.Id) as LectureCount from Lectures
join Teachers on Lectures.TeacherId = Teachers.Id
join GroupsLectures on Lectures.Id = GroupsLectures.LectureId
group by Teachers.Name, Lectures.LectureRoom, Lectures.Id






