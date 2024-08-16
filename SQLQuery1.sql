use MyAcademy

-- 1.������� ������� ���������� ������� �Software Development�.

select COUNT(*) as TeachersNum 
from Teachers t
join Departments d on t.Id = d.FacultyId
where d.Name ='Software Development'

--2. ������� ������� ������, �� ���� �������� �Dave McQueen�

select Count(*) as numLectures from Lectures l
join Lectures lg on l.TeacherId = lg.Id

go

--3. ������� ������� ������, �� ����������� � ������� �D201�.

SELECT COUNT(*) as countLectures from Lectures 
where LectureRoom = 'D201'



--4. ������� ����� �������� �� ������� ������, �� ����������� � ���.

SELECT l.Lectureroom as classroom, count(gl.id) as LecturesCount from Lectures l
join GroupsLectures gl on l.Id = gl.LectureId
GROUP by l.LectureRoom;


--5. ������� ������� ��������, �� �������� ������ ��������� �Jack Underhill�.

--SELECT * from Student


--6. ������� ������� ������ ���������� ���������� Computer Science.


select AVG(salary) as avgSalary  
from Teachers
join Departments on Teachers.Id = Departments.Id
join Faculties on Departments.FacultyId = Faculties.Id
where Faculties.Name = 'Computer Science'


--7. ������� �������� �� ����������� ������� �������� ����� ��� ����.

--select * Student from 

--8. ������� ������� ���� ������������ ������.

select avg(financing) as avgFinance from Departments

--9. ������� ���� ����� ���������� �� ������� ������� ���� ��������.

select Name, surName,count(distinct SubjectId) as disciplineCount  from Teachers
join Lectures on Teachers.Id = Lectures.TeacherId
group by Teachers.Name, Teachers.Surname
order by disciplineCount desc;

--10. ������� ������� ������ ����� �������� �����.

Select COUNT(GroupsLectures.Dayofweek), GroupsLectures.dayofweek from GroupsLectures
join Lectures on GroupsLectures.LectureId = Lectures.Id
group by GroupsLectures.dayofweek

--11. ������� ������ �������� �� ������� ������, �� ������ � ��� ���������.

select LectureRoom, count(distinct Departments.Id) as departmentCount from Lectures
join Subjects on Lectures.SubjectId = Subjects.Id
join Departments on Subjects.Id = Departments.Id
group by Lectures.LectureRoom


SELECT Lectures.LectureRoom AS RoomNumber, COUNT(DISTINCT Groups.DepartmentId) AS DepartmentCount
FROM Lectures 
JOIN GroupsLectures ON lectures.Id = GroupsLectures.LectureId
JOIN Groups  ON GroupsLectures.GroupId = Groups.Id
GROUP BY Lectures.LectureRoom;



--12.������� ����� ���������� �� ������� ��������, �� �� ��� ���������.

select faculties.Name as facultyName, count(distinct Subjects.Id) as subjectCount from Faculties
join Departments on Faculties.Id = Departments.FacultyId
join Groups on Departments.Id = Groups.DepartmentId
join GroupsLectures on Groups.Id = GroupsLectures.GroupId
join Lectures on GroupsLectures.LectureId = Lectures.Id
join Subjects on Lectures.SubjectId = Subjects.Id
group by Faculties.Name

--13. ������� ������� ������ ��� ����� ���� ��������-��������

select Teachers.Name,Lectures.LectureRoom ,count(Lectures.Id) as LectureCount from Lectures
join Teachers on Lectures.TeacherId = Teachers.Id
join GroupsLectures on Lectures.Id = GroupsLectures.LectureId
group by Teachers.Name, Lectures.LectureRoom, Lectures.Id






