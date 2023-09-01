create table tp_board (
	tp_b_no number(7) primary key,
	tp_b_id varchar2(10 char) not null,
	tp_b_writer varchar2(10 char) not null,
	tp_b_title varchar2(50 char) not null,
	tp_b_txt varchar2(300 char) not null,
	tp_b_photo varchar2(500 char),
	tp_b_when date not null,
	tp_b_notice varchar2(1 char) not null,
	tp_b_imp varchar2(1 char) not null, 
	tp_b_rCount number(10) not null,
	tp_b_view number(10) not null,
	tp_b_like number(10) not null,
	foreign key (tp_b_id) references tp_member (tp_m_id) on delete cascade
);
create sequence tp_board_seq;

select * from TP_BOARD order by tp_b_no desc;
--tp_b_notice : 해당 글이 공지인지 아닌지 (공지면 1, 아니면 0)
-- 회원 탈퇴하면 작성했던 게시글 삭제되게

delete from tp_board where tp_b_title like '%0%' and tp_b_notice = 1;

select * from (
		select rownum as rn, tp_b_no, tp_b_writer, tp_b_title, tp_b_txt,
		tp_b_photo, tp_b_when, tp_b_notice, tp_b_imp, tp_b_view, tp_b_like
		from ( select * from tp_board where (tp_b_txt like '%나츄르%') and tp_b_notice = 1 order by
		tp_b_when desc ))
		where rn >= 1 and rn <= 10;
		
select * from (
	select rownum as rn, tp_b_no, tp_b_writer, tp_b_title, tp_b_txt, tp_b_photo, 
	tp_b_when, tp_b_notice, tp_b_imp, tp_b_view, tp_b_like from (
		select * from tp_board where (tp_b_txt like '%%') and tp_b_notice = 1 order by tp_b_when desc ))
		where rn >= 21 and rn <= 30;
		
select count(*) from tp_board where tp_b_notice = 1
select * from tp_board where tp_b_notice = 1 order by tp_b_no desc 

insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지124','항상 큰대회만 나가면 이러더라', sysdate, 0, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는 니가124','못해서 그래', sysdate, 0, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만...124','나츄르로 우승하고 싶은걸', sysdate, 0, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team','관리자', '킹킹치만...124','나츄르로는 티어권이 답이 없는걸...', sysdate, 0, 0, 0, 0, 0);

insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함1','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는1','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만1','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만1','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서1','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함2','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는2','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만2','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만2','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서2','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함3','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는3','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만3','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만3','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서3','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함4','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는4','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만4','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만4','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서4','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함5','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는5','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만5','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만5','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서5','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함6','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는6','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만6','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만6','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서6','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함7','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는7','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만7','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만7','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서7','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함8','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는8','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만8','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만8','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서8','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함9','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는9','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만9','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만9','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서9','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함0','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는0','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만0','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만0','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서0','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함11','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는11','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만11','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만11','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서11','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함22','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는22','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만22','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만22','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서22','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함33','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는33','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만33','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만33','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서33','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함44','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는44','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만44','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만44','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서44','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함55','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는55','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만55','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만55','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서55','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함66','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는66','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만66','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만66','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서66','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함77','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는77','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만77','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만77','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서77','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함88','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는88','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만88','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만88','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서88','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함99','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는99','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만99','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만99','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서99','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함00','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는00','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만00','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만00','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서00','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함111','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는111','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만111','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만111','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서111','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함222','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는222','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만222','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만222','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서222','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함333','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는333','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만333','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만333','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서333','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함444','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는444','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만444','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만444','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서444','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함555','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는555','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만555','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만555','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서555','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함666','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는666','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만666','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만666','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서666','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함777','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는777','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만777','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만777','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서777','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함888','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는888','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만888','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만888','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서888','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함999','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는999','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만999','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만999','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서999','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함000','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는000','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만000','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만000','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서000','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함12','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는12','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만12','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만12','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서12','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함13','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는13','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만13','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만13','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서13','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함14','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는14','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만14','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만14','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서14','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함15','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는15','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만15','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만15','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서15','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함16','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는16','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만16','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만16','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서16','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함17','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는17','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만17','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만17','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서17','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함18','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는18','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만18','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만18','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서18','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함19','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는19','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만19','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만19','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서19','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함20','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는20','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만20','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만20','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서20','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '공지함21','항상 큰대회만 나가면 이러더라', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when,  tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그거는21','니가 못해서 그래', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '킹치만21','나츄르로 우승하고 싶은걸', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '하지만21','나츄르로는 티어권이 답이 없는걸...', sysdate, 1, 0, 0, 0, 0);
insert into tp_board (tp_b_no, tp_b_id, tp_b_writer, tp_b_title, tp_b_txt, tp_b_when, tp_b_notice, tp_b_imp, tp_b_rCount, tp_b_view, tp_b_like)
values (tp_board_seq.nextval, 'team', '관리자', '그래서21','나츄르 루닉할까봐', sysdate, 1, 0, 0, 0, 0);

drop table tp_board cascade constraint purge;
drop sequence tp_board_seq ;

select * from (`
	select rownum as rn, tp_b_no, tp_b_writer, tp_b_title, tp_b_txt, tp_b_photo, tp_b_when, tp_b_notice, 
	tp_b_imp, tp_b_view, tp_b_like from (
		select * from tp_board 
				order by tp_b_when desc )) 
					where rn = 22 and tp_b_notice = 1;

create table tp_reply (
	tp_r_no number(4) primary key,
	tp_r_b_no number(4) not null,
	tp_r_id varchar2(10 char) not null,
	tp_r_writer varchar2(10 char) not null,
	tp_r_text varchar2(256 char) not null,
	tp_r_date date not null,
	tp_r_edit varchar2(5 char),
	foreign key (tp_r_id) references tp_member (tp_m_id) on delete cascade
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







