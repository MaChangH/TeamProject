create table tp_board (
	tp_b_no number(7) primary key,
	tp_b_writer varchar2(10 char) not null,
	tp_b_title varchar2(50 char) not null,
	tp_b_txt varchar2(300 char) not null,
	tp_b_photo varchar2(500 char),
	tp_b_when date not null,
	tp_b_notice varchar2(1 char) not null,
	tp_b_imp varchar2(1 char) not null, 
	tp_b_view number(10) not null,
	tp_b_like number(10) not null,
	foreign key (tp_b_writer) references tp_member (tp_m_nick) on delete cascade
);
create sequence tp_board_seq;

select * from TP_BOARD
--tp_b_notice : 해당 글이 공지인지 아닌지 (공지면 1, 아니면 0)
-- 회원 탈퇴하면 작성했던 게시글 삭제되게

select * from (
		select rownum as rn, tp_b_no, tp_b_writer, tp_b_title, tp_b_txt,
		tp_b_photo, tp_b_when, tp_b_notice, tp_b_imp, tp_b_view, tp_b_like
		from ( select * from tp_board where (tp_b_txt like '%지수%') order by
		tp_b_when desc ))
		where rn >= 1 and rn <= 10 and tp_b_notice = 0;
		
select * from (
	select rownum as rn, tp_b_no, tp_b_writer, tp_b_title, tp_b_txt, tp_b_photo, 
	tp_b_when, tp_b_notice, tp_b_imp, tp_b_view, tp_b_like from (
		select * from tp_board where (tp_b_txt like '%%') and tp_b_notice = 1 order by tp_b_when desc ))
		where rn >= 21 and rn <= 30;
		
select count(*) from tp_board where tp_b_notice = 1
select * from tp_board where tp_b_notice = 1 order by tp_b_no desc 

insert into tp_board (tp_b_no, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, '트기', '솔직히 유희왕','굉장히 어렵습니다',  sysdate, 0, 0, 0, 0)
insert into tp_board (tp_b_no, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, '트기', '이선수','나츄르만 잘합니다',  sysdate, 0, 0, 0, 0)
insert into tp_board (tp_b_no, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, '트기', '진정한 듀얼리스트는','왠벽한 패가 아니면 승부를 하지 않는다',  sysdate, 0, 0, 0, 0)
insert into tp_board (tp_b_no, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, '트기', '나 진짜','나츄르까지 하는거보면 전생에 드루이드였음',  sysdate, 0, 0, 0, 0)


drop table tp_board cascade constraint purge;
drop sequence tp_board_seq ;

select * from (
	select rownum as rn, tp_b_no, tp_b_writer, tp_b_title, tp_b_txt, tp_b_photo, tp_b_when, tp_b_notice, 
	tp_b_imp, tp_b_view, tp_b_like from (
		select * from tp_board 
				order by tp_b_when desc )) 
					where rn = 22 and tp_b_notice = 1;

create table tp_reply (
	tp_r_no number(4) primary key,
	tp_r_b_no number(4) not null,
	tp_r_writer varchar2(10 char) not null,
	tp_r_text varchar2(256 char) not null,
	tp_r_date date not null,
	tp_r_edit varchar2(5 char),
	foreign key (tp_r_writer) references tp_member (tp_m_nick) on delete cascade
);
create sequence tp_reply_seq;

select * from TP_reply

drop table tp_reply cascade constraint purge;
drop sequence tp_reply_seq ;

-- 회원 탈퇴하면 작성했던 댓글 삭제되게

create table tp_member (
	tp_m_id varchar2(20 char) primary key,
	tp_m_pw varchar2(20 char) not null,
	tp_m_nick varchar2(12 char) unique not null,
	tp_m_name varchar2(10 char) not null, 
	tp_m_addr varchar2(100 char) not null,
	tp_m_photo varchar2(200 char) not null,
	tp_m_role number(1) not null,
	tp_m_point number(5) not null,
	tp_m_loginNum number(5) not null,
	tp_m_firstLogin number(8) not null 
);
select * from tp_member;

drop table tp_member cascade constraint purge

-- role이 1이면 관리자, 0이면 일반회원 / 회원가입 할 때는 선택 없이 무조건 0으로 가입되게
-- loginNum : 하루에 몇 번 로그인 했는지
-- firstLogin : 하루의 첫 로그인 시간이 언제인지

-- 관리자용 계정
insert into tp_member values('team', '1', '관리자', '관리자', '팀프로젝트', '1.jpg', 1, 100, 0, 20230101);


update tp_member set tp_m_point = 500 where tp_m_id = 'team';


create table tp_like (
	tp_l_no number(7) primary key,
	tp_l_b_no number(7) not null,
	tp_l_m_id varchar2(20 char) not null,
	foreign key (tp_l_b_no) references tp_board (tp_b_no) on delete cascade
);
-- 게시글 삭제하면 해당 게시글의 좋아요 역시 삭제되게
create sequence tp_like_seq;

select * from tp_like order by tp_l_b_no;

drop table tp_like cascade constraint purge


-- 1. tp_member
-- 2. tp_reply
-- 3. tp_board 순서대로 create 하기


