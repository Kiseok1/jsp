--2--
select rownum, bno,btitle,bcontent,bdate from board
order by bno;

select * from 
(
select row_number() over (order by bno desc) as rnum, bno, btitle, bcontent, bdate from board
)
where rnum>=11 and rnum<=20;

select * from (select row_number() over (order by bno desc) as rnum, bno, btitle, bcontent, bdate from board)where rnum>=81and rnum<=90;

--3--
--제목+내용
select * from 
(
select row_number() over (order by bno desc) as rnum, bno, btitle, bcontent, bdate from board
where btitle like '%sum%' or bcontent like '%sum%'
)
where rnum>=11 and rnum<=20;

--제목
select * from 
(
select row_number() over (order by bno desc) as rnum, bno, btitle, bcontent, bdate from board
where btitle like '%sum%' 
)
where rnum>=11 and rnum<=20;

--내용
select * from 
(
select row_number() over (order by bno desc) as rnum, bno, btitle, bcontent, bdate from board
where  bcontent like '%sum%'
)
where rnum>=11 and rnum<=20;

--이클립스 console에서 가져옴
select * from (select row_number() over (order by bno desc) as rnum, bno, btitle, bcontent, bdate from board where bcontent like '%sum%')where rnum>=31and rnum<=40;


select row_number() over(order by bno) as rnum, bno, btitle, bcontent, bdate from board;

select bno,btitle,bcontent,bdate from
(select row_number() over(order by bno) as rnum, bno, btitle, bcontent, bdate from board)
where rnum>=11 and rnum<=20;

--4--
--이클립스 console에서 가져옴
select bno,btitle,bcontent,bdate from(select row_number() over(order by bno) as rnum, bno, btitle, bcontent, bdate from board)where rnum>=81 and rnum<=90;

--7--
select * from board
where bno=1;

--8--














