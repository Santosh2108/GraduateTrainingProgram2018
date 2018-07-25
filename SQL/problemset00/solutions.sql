-- ProblemSet<00>,July <25> <2018>
-- Submission by <sai.s.kumar.gopagoni@accenture.comd> 

1)Select the Employee with the top three salaries
Select * from EMPLOYEE order by SALARY desc limit 3;
A142|TARA CUMMINGS|D04|99475|A187
A132|PAUL VINCENT|D01|94791|A120
A128|ADAM WAYNE|D05|94324|A165

Record Count-3

2)Select the Employee with the least salary
Select * from EMPLOYEE WHERE SALARY=(select MIN(Salary) from EMPLOYEE);
A111|JOHN HELLEN|D01|15380|A120

Record Count-1

3)Select the Employee who does not have a manager in the department table
Select * from EMPLOYEE WHERE MANAGERID not in(Select E_ID from EMPLOYEE e inner join Dept d where d.dep_id=e.dep_id);
A178|BRUCE WILLS|D03|66861|A298
A120|TIM ARCHER|D01|48834|A298
A187|ADAM JUSTIN|D02|80543|A298
A187|ROBERT SWIFT|D04|27700|A298
A165|NATASHA STEVENS|D05|31377|A298

Record Count-5

4)Select the Employee who is also a Manager
 Select * from EMPLOYEE e inner join employee e1 where e.e_id=e1.MANAGERID;
A178|BRUCE WILLS|D03|66861|A298|A156|
A120|TIM ARCHER|D01|48834|A298|A111|
A187|ADAM JUSTIN|D02|80543|A298|A116|
A165|NATASHA STEVENS|D05|31377|A298|A128|

Record Count -4

5)Select the Empolyee who is a Manager and has least salary
 Select name,MIN(SALARY) from(Select * from EMPLOYEE e inner join employee e1 where e.e_id=e1.MANAGERID);
ROBERT SWIFT|27700
Record Count-1

6)Select the total number of Employees in Communications departments
Select Count(*) From EMPLOYEE WHERE DEP_ID in(select DEP_ID from DEPT where DEPName='COMMUNICATIONS');
6
Record Count-1

7)Select the Employee in Finance Department who has the top salary
 Select name,Max(SALARY) from EMPLOYEE WHERE DEP_ID in (select DEP_ID from DEPT where DEPNAME='FINANCE');
ADAM WAYNE|94324
Record Count-1

8)Select the Employee in product depatment who has the least salary
 Select name,Min(SALARY) from EMPLOYEE WHERE DEP_ID in (select DEP_ID from DEPT where DEPNAME='PRODUCT');
NICK MARTIN|50174
Record Count-1

9)Select the count of Empolyees in Health with maximum salary
 Select Count(*),Max(SALARY) from EMPLOYEE WHERE DEP_ID in (select DEP_ID from DEPT where DEPNAME='HEALTH');
6|94791
Record Count-1

10)Select the Employees who report to Natasha Stevens
select * from employee where managerid in(select e_id from employee e inner join dept d where d.dep_id=e.dep_id and depmanager='NATASHA STEVENS');
A128|ADAM WAYNE|D05|94324|A165
A129|JOSEPH ANGELIN|D05|44280|A165
Record Count-2

11)Display the Employee name,Employee count,Dep name,Dept manager in the Health department
select e.name,count(e.name),d.depname,d.depmanager from employee e inner join dept d where e.dep_id=d.dep_id and depname='HEALTH';
JOHN HELLEN|6|HEALTH|TIM ARCHER
Record Count-1

12)Display the Department id,Employee ids and Manager ids for the Communications department
Select d.dep_id,e.e_id,e.managerid from employee e inner join dept d where e.dep_id=d.dep_id and depname='COMMUNICATIONS';
D02|A116|A187
D02|A121|A187
D02|A133|A187
D02|A187|A298
D02|A194|A187
D02|A198|A187

Record Count-6

13)Select the Average Expenses for Each dept with Dept id and Dept name
 select d.dep_id,avg(e.salary) as average,d.depname from employee e inner join dept d where e.dep_id=d.dep_id group by e.dep_id;
D01|54527.6666666667|HEALTH
D02|48271.3333333333|COMMUNICATIONS
D03|58517.5|PRODUCT
D04|51913.3333333333|INSURANCE
D05|56660.3333333333|FINANCE

Record Count-5

14)Select the total expense for the department finance
select sum(salary) as total from employee e inner join dept d where e.dep_id=d.dep_id and d.depname='FINANCE';
169981
Record Count-1

15)Select the department which spends the least with Dept id and Dept manager name
Select d.dep_id,d.depname,sum(e.salary) as sum from employee e join dept d on e.dep_id=d.dep_id group by d.dep_id,d.depname order by sum limit 1;
D03|PRODUCT|117035
Record Count-1

16)Select the count of Employees in each department
Select count(*),d.depname from employee e inner join dept d on e.dep_id=d.dep_id group by d.depname;
Select count(*),d.depname from employee e inner join dept d on e.dep_id=d.dep_id group by d.depname;
6|COMMUNICATIONS
3|FINANCE
6|HEALTH
3|INSURANCE
2|PRODUCT

Record Count-5

17)Select the count of Employees in each department having salary <10000
Select count(*),d.depname from employee e inner join dept d on e.dep_id=d.dep_id where e.salary<10000 group by d.depname;

Record Count:0

18)Select the total number of Employees in Dept id D04
 select count(*),d.depname from employee e inner join dept d on e.dep_id=d.dep_id where d.dep_id='D04' group by d.dep_id;
3|INSURANCE

Record Count-1

19)Select all department details of the Department with Maximum Employees
 Select max(count),depname,dep_id,depmanager from(select count(*) as count,d.depname,d.dep_id,d.depmanager from employee e inner join dept d on d.dep_id=e.dep_id group by e.dep_id);
6|HEALTH|D01|TIM ARCHER

Record Count-1

20)Select the Employees who has Tim Cook as their manager
select e.name from employee e join dept d on e.dep_id=d.dep_id where d.depmanager='TIM COOK' and e.name!='TIM COOK';

Record Count-0







