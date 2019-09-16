insert into bookmark(member_id, site_CODE)
			values('dongpee@hanmail.net','1')
insert into bookmark(member_id, site_CODE)
			values('dongpee@hanmail.net','6')
insert into bookmark(member_id, site_CODE)
			values('dongpee@hanmail.net','11')
insert into bookmark(member_id, site_CODE)
			values('dongpee@hanmail.net','16')			
insert into bookmark(member_id, site_CODE)
			values('dongpee@hanmail.net','21')	

select * from site order by conver(int,code) desc
select * from member
select * from memberroles
insert into memberroles(rolename, memberid, defaultrole) values('ROLE_USER', 'test101', 'false');

select * from member
insert into memberroles(rolename, memberid, defaultrole) values('ROLE_USER','dongpee@hanmail.net','true');


select * from assESSMENT
DROP VIEW ASS_VIEW
select * from ass_view where search = ''

SELECT N.*
CREATE VIEW ASS_VIEW
AS
(SELECT S.CODE, S.NAME, S.ADDRESS, S.GOOD, S.CATEGORY, S.SRC, S.CONTENT, A.KIND, A.COMMENT, S.BOOKCOUNT, S.SEARCH, s.regdate
FROM SITE S LEFT OUTER JOIN ASSESSMENT A
ON S.CODE = A.SITECODE
) AS N
