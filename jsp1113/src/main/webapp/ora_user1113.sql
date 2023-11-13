desc board;

select * from member where id='aaa' and pw='1111'
;

select * from board;

select row_number() over (order by bno) rnum, a.* from board a;

--row_number()
select * from 
(select row_number() over (order by bno) rnum, a.* from board a)
where rnum>=11 and rnum<=20
;

select * from (select row_number() over (order by bno) rnum, a.* from board a) where rnum>=11 and rnum<=20
;

--rownum
select * from 
(select rownum rnum, a.* from
(select * from board order by bno asc) a )
where rnum >=11 and rnum<=20
;

select * from (select rownum rnum, a.* from (select * from board order by bno asc) a ) where rnum >=11 and rnum<=20
;

select * from board order by bno asc;

select rownum rnum, a.* from
(select * from board order by bno asc) a
;

select * from 
(select rownum rnum, a.* from
(select * from board order by bno asc) a )
where rnum >=11 and rnum<=20
;

select * from board order by bno desc;

select max(bno) from board;

insert into board values(board_seq.nextval,'btitle','bcontent',sysdate,'id',board_seq.currval,0,0,1,bfile)





