select * from member;

select * from member
where id='aaa' and pw='1111'
;

select * from board;

--board

select * from board;

-- sum 글자들어간 bcontent 출력

select * from board
where bcontent like '%sum%'
order by bno;

select rownum , a.* 
from (select * from board where bcontent like '%sum%' order by bno ) a
where rownum >=11 and rownum <=20
;

select * from
(
select row_number() over(order by bno) as rnum, a.*
from board a
where bcontent like '%sum%'
) b
where b.rnum>=11 and b.rnum<=20
;













