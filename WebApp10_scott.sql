SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_SCORE;

--�� ���� ���̺� ���
DROP TABLE TBL_SCORE PURGE;
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.

--�� ���� ������ ���
DROP SEQUENCE SCORESEQ;
--==>> Sequence SCORESEQ��(��) �����Ǿ����ϴ�.

--�� �ǽ��� ���̺� ����
CREATE TABLE TBL_SCORE
( SID   NUMBER
, NAME  VARCHAR2(30)    NOT NULL
, KOR   NUMBER
, ENG   NUMBER
, MAT   NUMBER
, CONSTRAINT SCORE_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.

--�� �ǽ��� ������ ����
CREATE SEQUENCE SCORESEQ;
--==>> Sequence SCORESEQ��(��) �����Ǿ����ϴ�.

--�� ������ �Է� ����
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)
VALUES(SCORESEQ.NEXTVAL, '���¹�', '90', '80', '70');
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)
VALUES(SCORESEQ.NEXTVAL, '������', '90', '88', '70');
--> �� �� ����
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '���¹�', '90', '80', '70')
;
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '������', '90', '88', '70')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� ���̺� ������ ��ü ��ȸ ������ ����
SELECT SID, NAME, KOR, ENG, MAT
     , (KOR + ENG + MAT) AS TOT
     , ROUND(((KOR + ENG + MAT)/3.0),1) AS AVG
FROM TBL_SCORE ORDER BY SID;
--> �� �� ����
SELECT SID, NAME, KOR, ENG, MAT, (KOR + ENG + MAT) AS TOT, ROUND(((KOR + ENG + MAT)/3.0),1) AS AVG FROM TBL_SCORE ORDER BY SID
;
--==>> 1	���¹�	90	80	70

--�� �ο� �� Ȯ�� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_SCORE;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_SCORE
;
--==>> 1

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�