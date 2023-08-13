create table tp_board (
	tp_b_no number(7) primary key,
	tp_b_writer varchar2(10 char) not null,
	tp_b_title varchar2(50 char) not null,
	tp_b_txt varchar2(300 char) not null,
	tp_b_photo varchar2(500 char),
	tp_b_when date not null,
	tp_b_notice varchar2(1 char) not null,	
	tp_b_view number(10) not null,
	tp_b_like number(10) not null,
	foreign key (tp_b_writer) references tp_member (tp_m_nick) on delete cascade
);

--tp_b_notice : 해당 글이 공지인지 아닌지 (공지면 1, 아니면 0)
-- 회원 탈퇴하면 작성했던 게시글 삭제되게

create sequence tp_board_seq;

insert into tp_board (tp_b_no, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when) values(tp_board_seq.nextval, '트기', '안녕안녕', '진짜 안녕안녕 나는 지수야', sysdate);
insert into tp_board (tp_b_no, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when) values(tp_board_seq.nextval, '테스트1', '테스트용 글', '테스트용 게시글의 내용', sysdate);
insert into tp_board (tp_b_no, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when) values(tp_board_seq.nextval, '테스트a', 'test', 'text for test', sysdate);

insert into tp_board values (tp_board_seq.nextval, 'writer', 'tp_b_title','text for test','tp_b_photo',  sysdate, 1 ,1,1)

drop table tp_board cascade constraint purge;
drop table tp_reply cascade constraint purge;
drop sequence tp_board_seq ;
drop sequence tp_reply_seq ;

select * from TP_BOARD


create table tp_reply (
	tp_r_no number(4) primary key,
	tp_r_b_no number(4) not null,
	tp_r_writer varchar2(10 char) not null,
	tp_r_text varchar2(256 char) not null,
	tp_r_date date not null,
	tp_r_edit varchar2(5 char),
	foreign key (tp_r_writer) references tp_member (tp_m_nick) on delete cascade
);

-- 회원 탈퇴하면 작성했던 댓글 삭제되게

create sequence tp_reply_seq;
select * from TP_reply


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

drop table tp_member cascade constraint purge

-- role이 1이면 관리자, 0이면 일반회원 / 회원가입 할 때는 선택 없이 무조건 0으로 가입되게
-- loginNum : 하루에 몇 번 로그인 했는지
-- firstLogin : 하루의 첫 로그인 시간이 언제인지

-- 관리자용 계정
insert into tp_member values('team', '1', '관리자', '관리자', '팀프로젝트', '1.jpg', 1, 100, 0, 20230101);


select * from tp_member;


create table tp_like (
	tp_l_no number(7) primary key,
	tp_l_b_no number(7) not null,
	tp_l_m_id varchar2(20 char) not null,
	foreign key (tp_l_b_no) references tp_board (tp_b_no) on delete cascade
);
-- 게시글 삭제하면 해당 게시글의 좋아요 역시 삭제되게

create sequence tp_like_seq;
drop table tp_like cascade constraint purge
select * from tp_like order by tp_l_b_no;



