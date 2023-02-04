with t1 as
(select employee_id,experience, sum(salary) over(partition by experience order by salary, employee_id) as sum1 from candidates),
senior_can as(select employee_id,experience,sum1 from t1 where experience='senior' and sum1<70000),
junior_can as(select employee_id,experience,sum1 from t1 where experience='junior' and sum1<70000-(select ifnull(max(sum1),0) from senior_can)),
t2 as (select 'Senior' as experience, count(employee_id) as accepted_candidates from senior_can
union
select 'Junior' as experience, count(employee_id) as accepted_candidates from junior_can)
select case when experience='Junior' then accepted_candidates  end as Juniors,
case when experience='Senior' then accepted_candidates  end as SEniors from t2 group by experience
