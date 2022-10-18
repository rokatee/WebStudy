SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 기존 테이블 제거
DROP TABLE TBL_MEMBER PURGE;
--==>> Table TBL_MEMBER이(가) 삭제되었습니다.

--○ 테이블 생성(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)    NOT NULL
, TEL   VARCHAR2(40)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);

--○ 기존 시퀀스 제거
DROP SEQUENCE MEMBERSEQ;
--==>> Sequence MEMBERSEQ이(가) 삭제되었습니다.

--○ 시퀀스 생성
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ이(가) 생성되었습니다.

--○ 샘플 데이터 입력
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '조현하', '010-1111-1111')
;
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '임시연', '010-2222-2222')
;
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '최나윤', '010-3333-3333')
;
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '반보영', '010-4444-4444')
;
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '장현성', '010-5555-5555')
;
--==>> 1 행 이(가) 삽입되었습니다. * 5

SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> 한 줄 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
--==>>
/*
1	조현하	010-1111-1111
2	임시연	010-2222-2222
3	최나윤	010-3333-3333
4	반보영	010-4444-4444
5	장현성	010-5555-5555
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료

--○ 인원 수 확인
SELECT COUNT(*) AS COUNT 
FROM TBL_MEMBER;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;
--==>> 5

--○ 회원 정보 검색(SID)
SELECT SID, NAME, TEL
FROM TBL_MEMBER 
WHERE SID='1';
--> 한 줄 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID='1'
;
--==>> 1	조현하	010-1111-1111

--○ 회원 정보 수정
UPDATE TBL_MEMBER
SET NAME='고연수', TEL='010-1110-1110'
WHERE SID='1';
--> 한 줄 구성
UPDATE TBL_MEMBER SET NAME='고연수', TEL='010-1110-1110' WHERE SID=1
;
--==>> 1 행 이(가) 업데이트되었습니다.

--○ 롤백
ROLLBACK;
--==>> 롤백 완료.

--○ 회원 데이터 삭제 쿼리문 구성
DELETE 
FROM TBL_MEMBER
WHERE SID=1;
--> 한 줄 구성
DELETE FROM TBL_MEMBER WHERE SID=1
;
--==>> 1 행 이(가) 삭제되었습니다.

--○ 롤백
ROLLBACK;
--==>> 롤백 완료.

--○ 기존 테이블 제거
DROP TABLE TBL_SCORE;
--==>> Table TBL_SCORE이(가) 삭제되었습니다.

--○ 테이블 생성
CREATE TABLE TBL_MEMBERSCORE
( SID   NUMBER
, KOR   NUMBER(3)
, ENG   NUMBER(3)
, MAT   NUMBER(3)
, CONSTRAINT MEMBERSCORE_SID_PK PRIMARY KEY(SID)
, CONSTRAINT MEMBERSCORE_KOR_CK CHECK(KOR BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_ENG_CK CHECK(ENG BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_MAT_CK CHECK(MAT BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_SID_FK FOREIGN KEY(SID)
             REFERENCES TBL_MEMBER(SID)
);
--==>> Table TBL_MEMBERSCORE이(가) 생성되었습니다.

--○ 샘플 데이터 입력
INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES(1, 90, 80, 70)
;
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT SID, KOR, ENG, MAT 
FROM TBL_MEMBERSCORE;
--==>> 1	90	80	70

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 성적 입력 인원 수 확인
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERSCORE;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE
;
--==>> 1

--○ 성적 데이터 검색(SID)
SELECT SID, KOR, ENG, MAT
FROM TBL_MEMBERSCORE
WHERE SID=1;
--> 한 줄 구성
SELECT SID, KOR, ENG, MAT FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>> 1	90	80	70

--○ 성적 데이터 수정
UPDATE TBL_MEMBERSCORE
SET KOR=99, ENG=99, MAT=99
WHERE SID=1;
--> 한 줄 구성
UPDATE TBL_MEMBERSCORE SET KOR=99, ENG=99, MAT=99 WHERE SID=1
;
--==>> 1 행 이(가) 업데이트되었습니다.

--○ 확인
SELECT SID, KOR, ENG, MAT
FROM TBL_MEMBERSCORE;
--==>> 1	99	99	99

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 성적 정보 삭제
DELETE
FROM TBL_MEMBERSCORE
WHERE SID=1;
--> 한 줄 구성
DELETE FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>> 1 행 이(가) 삭제되었습니다.

--○ 롤백
ROLLBACK;
--==>> 롤백 완료.

--○ 전체 데이터 조회 쿼리문 구성 (SID, NAME, TEL, KOR, ENG, MAT)
SELECT M.SID, M.NAME, M.TEL, S.KOR, S.ENG, S.MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID;
--==>> 1	조현하	010-1111-1111	99	99	99

--○ 전체 정보 조회 쿼리문 구성 → 기능개선 LEFT JOIN
SELECT M.SID, M.NAME, M.TEL
     , S.KOR, S.ENG, S.MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
--==>>
/*
1	조현하	010-1111-1111	99	  99	99
2	임시연	010-2222-2222  			
3	최나윤	010-3333-3333			
4	반보영	010-4444-4444			
5	장현성	010-5555-5555			
*/

--○ 전체 정보 조회 쿼리문 구성 → 기능개선 LEFT JOIN → 기능 개선 NVL
--   0 대신 -1을 넣은 이유? → 0점이 있을 수 있기 때문
SELECT M.SID, M.NAME, M.TEL
     , NVL(S.KOR, -1) AS KOR
     , NVL(S.ENG, -1) AS ENG
     , NVL(S.MAT, -1) AS MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
--==>>
/*
1	조현하	010-1111-1111	99	99	99
2	임시연	010-2222-2222	-1	-1	-1
3	최나윤	010-3333-3333	-1	-1	-1
4	반보영	010-4444-4444	-1	-1	-1
5	장현성	010-5555-5555	-1	-1	-1
*/

--○ 전체 데이터 조회 전용 뷰(VIEW_MEMBERSCORE) 생성
CREATE OR REPLACE VIEW VIEW_MEMBERSCORE
AS
SELECT M.SID, M.NAME, M.TEL
     , NVL(S.KOR, -1) AS KOR
     , NVL(S.ENG, -1) AS ENG
     , NVL(S.MAT, -1) AS MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
--==>> View VIEW_MEMBERSCORE이(가) 생성되었습니다.

--○ 생성한 뷰(VIEW_MEMBERSCORE)를 활용한 리스트 조회
--   (번호, 이름, 국어점수, 영어점수, 수학점수, 총점, 평균, 석차)
SELECT SID, NAME, KOR, ENG, MAT
     , (KOR + ENG + MAT) AS TOT
     , ROUND( ( (KOR + ENG + MAT)/3.0),1) AS AVG
     , RANK() OVER(ORDER BY (KOR + ENG + MAT) DESC) AS RANK
FROM VIEW_MEMBERSCORE
ORDER BY SID;
--> 한 줄 구성
SELECT SID, NAME, KOR, ENG, MAT, (KOR + ENG + MAT) AS TOT, ROUND( ( (KOR + ENG + MAT)/3.0),1) AS AVG, RANK() OVER(ORDER BY (KOR + ENG + MAT) DESC) AS RANK FROM VIEW_MEMBERSCORE ORDER BY SID
;
--==>>
/*
1	조현하	99	99	99	297	99	1
2	임시연	-1	-1	-1	-3	-1	2
3	최나윤	-1	-1	-1	-3	-1	2
4	반보영	-1	-1	-1	-3	-1	2
5	장현성	-1	-1	-1	-3	-1	2
*/
/*
       SID NAME        KOR        ENG        MAT        TOT        AVG        RANK
---------- ----------- ---------- ---------- ---------- ---------- ---------- ----------
         1 조현하      99         99         99         297        99         1
         2 임시연      -1         -1         -1         -3         -1         2
         3 최나윤      -1         -1         -1         -3         -1         2
         4 반보영      -1         -1         -1         -3         -1         2
         5 장현성      -1         -1         -1         -3         -1         2
*/

--○ 생성한 뷰(VIEW_MEMBERSCORE)를 활용한 번호 검색
SELECT SID, NAME, KOR, ENG, MAT
FROM VIEW_MEMBERSCORE
WHERE SID = 1;
--> 한 줄 구성
SELECT SID, NAME, KOR, ENG, MAT FROM VIEW_MEMBERSCORE WHERE SID = 1
;
--==>> 1	조현하	99	99	99

--○ 자식테이블의 참조데이터 레코드 수 확인
SELECT COUNT(*) AS COUNT
FROM VIEW_MEMBERSCORE
WHERE SID=1;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM VIEW_MEMBERSCORE WHERE SID=1
;
--==>> 1






