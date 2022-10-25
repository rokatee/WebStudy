SELECT USER
FROM DUAL;

DESC TBL_BOARD;
/*
이름       널?       유형             
-------- -------- -------------- 
NUM      NOT NULL NUMBER(9)      
NAME     NOT NULL VARCHAR2(30)   
PWD      NOT NULL VARCHAR2(20)   
EMAIL             VARCHAR2(50)   
SUBJECT  NOT NULL VARCHAR2(100)  
CONTENT  NOT NULL VARCHAR2(4000) 
IPADDR            VARCHAR2(20)   
HITCOUNT NOT NULL NUMBER         
CREATED  NOT NULL DATE  
*/

DECLARE
    V_CNT       NUMBER(9)       := 1;
    V_NAME      VARCHAR2(30);
    V_PWD       VARCHAR2(20);
    V_EMAIL     VARCHAR2(50);
    V_SUBJECT   VARCHAR2(100);
    V_CONTENT   VARCHAR2(4000);
    V_IPADDR    VARCHAR2(20);
    V_HITCOUNT  NUMBER;
    V_CREATED   DATE;
BEGIN
    LOOP
        EXIT WHEN V_CNT > 769;
        
        V_CNT := V_CNT + 1;
        
        IF ( MOD(V_CNT, 5) = 0 ) THEN
            V_PWD := 'java002$';
            V_CONTENT := '음식과 요리에 관련된 내용물 작성';
            V_IPADDR := '211.238.142.50';
            V_NAME := '김';
            V_EMAIL := 'apple' || V_CNT || 'kim@test.com';
            V_SUBJECT := '취미';
        ELSIF ( MOD(V_CNT, 3) = 0 ) THEN
            V_PWD := 'java003$';
            V_CONTENT := '날씨와 기후에 관련된 내용물 작성';
            V_IPADDR := '211.238.142.54';
            V_NAME := '최';
            V_EMAIL := 'test' || V_CNT || 'choi@test.com';
            V_SUBJECT := '분석';    
        ELSIF ( MOD(V_CNT, 7) = 0 ) THEN
            V_PWD := 'java004$';
            V_CONTENT := '미용과 건강에 관련된 내용물 작성';
            V_IPADDR := '211.238.142.56';
            V_NAME := '한';
            V_EMAIL := 'study' || V_CNT || 'han@test.com';
            V_SUBJECT := '생활';
        ELSE    
            V_PWD := 'java005$';
            V_CONTENT := '게임과 오락에 관련된 내용물 작성';
            V_IPADDR := '211.238.142.59';
            V_NAME := '고';
            V_EMAIL := 'morning' || V_CNT || 'go@test.com';
            V_SUBJECT := '여가';            
        END IF;
        
        V_NAME := V_NAME || '길동' || LTRIM(TO_CHAR(V_CNT));
        V_SUBJECT := V_SUBJECT || ' 분야 게시물 ' || LTRIM(TO_CHAR(V_CNT));
        V_CREATED := TO_DATE('2022-06-10', 'YYYY-MM-DD');
        
        IF ( MOD(V_CNT, 2) = 0 ) THEN
            V_HITCOUNT := 16 + V_CNT;
        ELSIF ( MOD(V_CNT, 3) = 0 ) THEN
            V_HITCOUNT := 30 + V_CNT;
        ELSIF ( MOD(V_CNT, 4) = 0 ) THEN
            V_HITCOUNT := 14 + V_CNT;
        ELSE
            V_HITCOUNT := 42 + V_CNT;
        END IF;
        
        INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
        VALUES(V_CNT, V_NAME, V_PWD, V_EMAIL, V_SUBJECT, V_CONTENT, V_IPADDR, V_HITCOUNT, V_CREATED);
        
    END LOOP;

END;
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_BOARD
ORDER BY NUM DESC;

COMMIT;
--==>> 커밋 완료.