SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_SCORE;

--○ 기존 테이블 드랍
DROP TABLE TBL_SCORE PURGE;
--==>> Table TBL_SCORE이(가) 삭제되었습니다.

--○ 기존 시퀀스 드랍
DROP SEQUENCE SCORESEQ;
--==>> Sequence SCORESEQ이(가) 삭제되었습니다.

--○ 실습용 테이블 생성
CREATE TABLE TBL_SCORE
( SID   NUMBER
, NAME  VARCHAR2(30)    NOT NULL
, KOR   NUMBER
, ENG   NUMBER
, MAT   NUMBER
, CONSTRAINT SCORE_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_SCORE이(가) 생성되었습니다.

--○ 실습용 시퀀스 생성
CREATE SEQUENCE SCORESEQ;
--==>> Sequence SCORESEQ이(가) 생성되었습니다.

--○ 데이터 입력 구문
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)
VALUES(SCORESEQ.NEXTVAL, '김태민', '90', '80', '70');
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)
VALUES(SCORESEQ.NEXTVAL, '민찬우', '90', '88', '70');
--> 한 줄 구성
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '김태민', '90', '80', '70')
;
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '민찬우', '90', '88', '70')
;
--==>> 1 행 이(가) 삽입되었습니다.

--○ 테이블 데이터 전체 조회 쿼리문 구성
SELECT SID, NAME, KOR, ENG, MAT
     , (KOR + ENG + MAT) AS TOT
     , ROUND(((KOR + ENG + MAT)/3.0),1) AS AVG
FROM TBL_SCORE ORDER BY SID;
--> 한 줄 구성
SELECT SID, NAME, KOR, ENG, MAT, (KOR + ENG + MAT) AS TOT, ROUND(((KOR + ENG + MAT)/3.0),1) AS AVG FROM TBL_SCORE ORDER BY SID
;
--==>> 1	김태민	90	80	70

--○ 인원 수 확인 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_SCORE;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_SCORE
;
--==>> 1

--○ 커밋
COMMIT;
--==>> 커밋 완료