SELECT USER
FROM DUAL;

DESC TBL_BOARD;
/*
�̸�       ��?       ����             
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
            V_CONTENT := '���İ� �丮�� ���õ� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.50';
            V_NAME := '��';
            V_EMAIL := 'apple' || V_CNT || 'kim@test.com';
            V_SUBJECT := '���';
        ELSIF ( MOD(V_CNT, 3) = 0 ) THEN
            V_PWD := 'java003$';
            V_CONTENT := '������ ���Ŀ� ���õ� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.54';
            V_NAME := '��';
            V_EMAIL := 'test' || V_CNT || 'choi@test.com';
            V_SUBJECT := '�м�';    
        ELSIF ( MOD(V_CNT, 7) = 0 ) THEN
            V_PWD := 'java004$';
            V_CONTENT := '�̿�� �ǰ��� ���õ� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.56';
            V_NAME := '��';
            V_EMAIL := 'study' || V_CNT || 'han@test.com';
            V_SUBJECT := '��Ȱ';
        ELSE    
            V_PWD := 'java005$';
            V_CONTENT := '���Ӱ� ������ ���õ� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.59';
            V_NAME := '��';
            V_EMAIL := 'morning' || V_CNT || 'go@test.com';
            V_SUBJECT := '����';            
        END IF;
        
        V_NAME := V_NAME || '�浿' || LTRIM(TO_CHAR(V_CNT));
        V_SUBJECT := V_SUBJECT || ' �о� �Խù� ' || LTRIM(TO_CHAR(V_CNT));
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
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_BOARD
ORDER BY NUM DESC;

COMMIT;
--==>> Ŀ�� �Ϸ�.