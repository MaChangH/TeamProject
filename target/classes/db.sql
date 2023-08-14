create table tp_board (
	tp_b_no number(7) primary key,
	tp_b_writer varchar2(15 char) not null,
	tp_b_title varchar2(50 char) not null,
	tp_b_txt varchar2(300 char) not null,
	tp_b_photo varchar2(500 char),
	tp_b_when date not null,
	tp_b_notice varchar2(1 char) not null,
	tp_b_view number(10) not null,
	tp_b_like number(10) not null
);

create sequence tp_board_seq;

insert into tp_board (tp_b_no, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when) values(tp_board_seq.nextval, '트기', '안녕안녕', '진짜 안녕안녕 나는 지수야', sysdate);
insert into tp_board (tp_b_no, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when) values(tp_board_seq.nextval, '테스트1', '테스트용 글', '테스트용 게시글의 내용', sysdate);
insert into tp_board (tp_b_no, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when) values(tp_board_seq.nextval, '테스트a', 'test', 'text for test', sysdate);

insert into tp_board values (tp_board_seq.nextval, 'writer', 'tp_b_title','text for test','tp_b_photo',  sysdate, 1 ,1,1)

drop table tp_board cascade constraint purge
drop table tp_reply cascade constraint purge
drop sequence tp_board_seq 
drop sequence tp_reply_seq 

select * from TP_BOARD


create table tp_reply (
	tp_r_no number(4) primary key,
	tp_r_b_no number(4) not null,
	tp_r_writer varchar2(10 char) not null,
	tp_r_text varchar2(256 char) not null,
	tp_r_date date not null,
	tp_r_edit varchar2(5 char)
);

create sequence tp_reply_seq;
select * from TP_reply


create table tp_member (
	tp_m_id varchar2(20 char) primary key,
	tp_m_pw varchar2(20 char) not null,
	tp_m_nick varchar2(12 char) not null,
	tp_m_name varchar2(10 char) not null,
	tp_m_addr varchar2(100 char) not null,
	tp_m_photo varchar2(200 char) not null,
	tp_m_role number(1) not null
);

drop table tp_member cascade constraint purge

-- role이 1이면 관리자, 0이면 일반회원 / 회원가입 할 때는 선택 없이 무조건 0으로 가입되게

-- 관리자용 계정
insert into tp_member values('team', '1', '관리자', '관리자', '팀프로젝트', '1.jpg', 1);


select * from tp_member;


create table tp_like (
	tp_l_no number(7) primary key,
	tp_l_b_no number(7) not null,
	tp_l_m_id varchar2(20 char) not null,
	foreign key (tp_l_b_no) references tp_board (tp_b_no) on delete cascade
);

create sequence tp_like_seq;
drop table tp_like cascade constraint purge
select * from tp_like order by tp_l_b_no;

insert into tp_board values (tp_board_seq.nextval, 'writer', 'tp_b_title','text for test','tp_b_photo',  sysdate, 1 ,1,1)

