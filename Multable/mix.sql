查询工资高于500或岗位为MANAGER的雇员，同时还要满足他们的姓名首字母为大写的J
mysql> select ename,job,sal from emp
    -> where (sal > 500 or job = 'MANEGER')
    -> and ename like 'J%';

按照部门号升序而雇员的工资降序排序
mysql> select deptno,sal,ename from emp
    -> order by deptno asc ,sal desc;

使用年薪进行降序排序
mysql> select ename,(sal*12+ifnull(comm,0))
    -> total from emp
    -> order by total desc;

显示工资最高的员工的名字和工作岗位	
mysql> select ename,job,sal from emp where sal = (select max(sal) from emp);
	
显示工资高于平均工资的员工信息	
mysql> select ename,sal from emp
    -> where sal>(select avg(sal) from emp);	
	
显示每个部门的平均工资和最高工资
mysql> select format(avg(sal),0)savg ,max(sal),deptno
    -> from emp
    -> group by deptno;
	
显示平均工资低于2000的部门号和它的平均工资
mysql> select deptno ,avg(sal) savg
    -> from emp
    -> group by deptno
    -> having savg<2000;

显示每种岗位的雇员总数，平均工资
mysql> select job,count(*),avg(sal)
    -> from emp
    -> group by job;
	
显示雇员名、雇员工资以及所在部门的名字
上面的数据来自EMP和DEPT表，要联合查询	
select emp.ename,sal,dept.dname,
from emp,dept
where emp.deptno = dept.deptno;
	
显示部门号为10的部门名，员工名和工资	
mysql> select ename, sal,dname 
    -> from EMP, DEPT 
    -> where EMP.deptno=DEPT.deptno 
    -> and DEPT.deptno	
	
显示各个员工的姓名，工资，及工资级别	
mysql> select ename, sal, grade 
    -> from EMP, SALGRADE 
    -> where EMP.sal between losal and hisal;	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	