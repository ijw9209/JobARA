select * from test
--------
--멤버 테이블 사업자등록번호추가 , 아이디 UNIQUE 추가--
--기업회원 테이블 일단 사용 X (유저테이블 롤값으로 BUIS), 채용등록 상세 테이블, 
	--지원자이력서열람-------------------------------
    --사업자번호 SEQ 삭제--
    --사용자이력서열람------
    --- 사업자번호 SEQ >> 회원번호 SEQ
    --유저멤버 생일 date >> varchar변경 폼넘어갈때 400오류뜸
    --회사정보 테이블 추가
    --이력서 테이블 title 빼고 이력서상세테이블에 title 추가
-----------------------유저 테이블---------------------------
DROP SEQUENCE MEMBERSEQ;
DROP TABLE USER_MEMBER CASCADE CONSTRAINTS PURGE;

CREATE SEQUENCE MEMBERSEQ
START WITH 127 
INCREMENT BY 1;

CREATE TABLE USER_MEMBER(
     MEMBER_NO_SEQ NUMBER PRIMARY KEY,          --회원번호
     MEMBER_ID VARCHAR2(100) NOT NULL UNIQUE,   --아이디
     MEMBER_PW VARCHAR2(100) NOT NULL,          --비밀번호
     MEMBER_NAME VARCHAR2(100) NOT NULL,        --이름
     MEMBER_BIRTH VARCHAR2(100) NOT NULL,                --생일
     MEMBER_ADDR VARCHAR2(300) NOT NULL,        --주소
     MEMBER_TEL VARCHAR2(300) NOT NULL,         --전화번호
     MEMBER_EMAIL VARCHAR2(300) NOT NULL,       --이메일
     MEMBER_ENABLED VARCHAR2(2) NOT NULL CONSTRAINT enabled_ck CHECK (MEMBER_ENABLED IN ('Y','N')), --가입여부 Y/N
     MEMBER_GENDER VARCHAR2(50) NOT NULL,    --성별
     MEMBER_POINT NUMBER,                   --포인트
     MEMBER_REGDATE DATE,                   --가입일
     MEMBER_ROLE VARCHAR(50) NOT NULL,      --등급(USER/ADMIN/BUIS)
     MEMBER_BUIS_NUM NUMBER					--사업자 등록번호
);

INSERT INTO USER_MEMBER VALUES(MEMBERSEQ.NEXTVAL,'user1','user1','홍길동','93-03-03','경기도 고양시 일산동구','010-1234-5678','123abc@naver.com','Y','남성','1000',SYSDATE,'USER');
INSERT INTO USER_MEMBER VALUES(MEMBERSEQ.NEXTVAL,'admin','admin','이순신','92-01-01','서울시 강남구','010-5678-8765','azxcvb@naver.com','Y','남성','1000',SYSDATE,'ADMIN');
DELETE FROM USER_MEMBER WHERE MEMBER_NO_SEQ = 36;

SELECT * FROM USER_MEMBER ORDER BY MEMBER_NO_SEQ;
SELECT * FROM USER_MEMBER WHERE MEMBER_ID = 'user123'
DELETE FROM USER_MEMBER WHERE MEMBER_NO_SEQ = 55;
SELECT * FROM USER_MEMBER WHERE MEMBER_NO_SEQ = 35;

SELECT COUNT(*) FROM USER_MEMBER WHERE MEMBER_REGDATE <= '2019-01-31' AND MEMBER_REGDATE >= '2019-01-01' AND MEMBER_ROLE = 'ROLE_USER'; 
SELECT COUNT(*) FROM USER_MEMBER WHERE MEMBER_REGDATE <= '2019-02-28' AND MEMBER_REGDATE >= '2019-02-01' AND MEMBER_ROLE = 'ROLE_USER';

----------------기업회원 테이블 일단 사용 X---------------------------------
DROP SEQUENCE BUISSEQ;
DROP TABLE BUISNESS_MEMBER CASCADE CONSTRAINTS PURGE;


CREATE SEQUENCE BUISSEQ;
CREATE TABLE BUISNESS_MEMBER(
     BUIS_NO_SEQ NUMBER PRIMARY KEY,          --사업자회원번호SEQ
     BUIS_NUM NUMBER,                         --사업자등록번호
     BUIS_ID VARCHAR2(100) NOT NULL,          --아이디
     BUIS_PW VARCHAR2(100) NOT NULL,          --비밀번호
     BUIS_NAME VARCHAR2(100) NOT NULL,        --이름
     BUIS_BIRTH DATE NOT NULL,                --생일
     BUIS_ADDR VARCHAR2(300) NOT NULL,        --주소
     BUIS_TEL VARCHAR2(300) NOT NULL,         --전화번호
     BUIS_EMAIL VARCHAR2(300) NOT NULL,       --이메일
     BUIS_ENABLED VARCHAR2(2) NOT NULL CONSTRAINT BUIS_enabled_ck CHECK (BUIS_ENABLED IN ('Y','N')), --가입여부 Y/N
     BUIS_GENDER VARCHAR2(50) NOT NULL,    --성별
     BUIS_POINT NUMBER,                   --포인트
     BUIS_REGDATE DATE,                   --가입일
     BUIS_ROLE VARCHAR(50) NOT NULL       --등급(BUISNESS)
);

INSERT INTO BUISNESS_MEMBER VALUES(BUISSEQ.NEXTVAL,123456789,'aaaa','aaaa','사업자','89-01-01','서울시 강남구 역삼동','010-5444-1234','adbc@naver.com','Y','남성',1000,SYSDATE,'BUISNESS');


SELECT * FROM BUISNESS_MEMBER;

----------------유저 이력서 작성---------------------
DROP SEQUENCE RESUMESEQ;
DROP TABLE USER_RESUME CASCADE CONSTRAINTS PURGE;

CREATE SEQUENCE RESUMESEQ
START WITH 3 
INCREMENT BY 1;
CREATE TABLE USER_RESUME(
    RESUME_NO_SEQ NUMBER PRIMARY KEY,                   --이력서번호SEQ
    MEMBER_NO_SEQ NUMBER REFERENCES USER_MEMBER,        --회원번호SEQ
    RESUME_DATE DATE NOT NULL                           --이력서작성일
);

INSERT INTO USER_RESUME VALUES(RESUMESEQ.NEXTVAL,54,SYSDATE);

SELECT RESUME_NO_SEQ,MEMBER_NO_SEQ,TO_CHAR(RESUME_DATE,'YYYY-MM-DD') FROM USER_RESUME WHERE MEMBER_NO_SEQ = 54
SELECT TO_CHAR(RESUME_DATE,'YYYY-MM-DD') reg, D.* FROM USER_RESUME U , USER_RESUME_DETAIL D
WHERE U.RESUME_NO_SEQ = D.RESUME_NO_SEQ;

SELECT TO_CHAR(RESUME_DATE,'YYYY-MM-DD') reg, D.* FROM USER_RESUME U , USER_RESUME_DETAIL D
  WHERE U.RESUME_NO_SEQ = D.RESUME_NO_SEQ
  
SELECT * FROM USER_RESUME;



--------------------------이력서 상세--------------------------

DROP TABLE USER_RESUME_DETAIL CASCADE CONSTRAINTS PURGE;

CREATE TABLE USER_RESUME_DETAIL(
    RESUME_NO_SEQ NUMBER REFERENCES USER_RESUME,    --FK 이력서번호SEQ 
    MEMBER_NO_SEQ NUMBER REFERENCES USER_MEMBER,    --FK 회원번호SEQ
    RESUME_TITLE VARCHAR2(500),                     --이력서제목
    RESUME_PHOTO VARCHAR2(2000),                    --사진URL
    RESUME_MILITARY_CHK VARCHAR2(100) CONSTRAINT MILITARY_CHK CHECK (RESUME_MILITARY_CHK IN ('Y','N')), --병역여부 Y/N
    RESUME_MILITARY_GROUP VARCHAR2(100),             --군별
    RESUME_MILITARY_LASTCLASS VARCHAR2(100),         --제대계급
    RESUME_MILITARY_STARTDAY VARCHAR2(100),          --입대일  
    RESUME_MILITARY_ENDDAY VARCHAR2(100),            --제대일
    RESUME_FINAL_EDU VARCHAR2(300),                  --최종학력
    RESUME_SCHOOLNAME VARCHAR2(100),                 --학교명
    RESUME_GRADUATED_YEAR VARCHAR2(100),             --졸업년도
    RESUME_GRADUATED_STATE VARCHAR2(100),            --졸업상태(졸업/졸업예정/재학중)
    RESUME_CRTI_ONE_NAME VARCHAR2(100),              --자격증1
    RESUME_CRTI_ONE_ISSUE VARCHAR2(100),             --자격증발행처1
    RESUME_CRTI_ONE_DAY VARCHAR2(100),               --자격증취득일1
    RESUME_CRTI_TWO_NAME VARCHAR2(100),              --자격증2
    RESUME_CRTI_TWO_ISSUE VARCHAR2(100),             --자격증발행처2        
    RESUME_CRTI_TWO_DAY VARCHAR2(100),               --자격증취득일2
    RESUME_CRTI_THREE_NAME VARCHAR2(100),            --자격증3
    RESUME_CRTI_THREE_ISSUE VARCHAR2(100),           --자격증발행처3
    RESUME_CRTI_THREE_DAY VARCHAR2(100),             --자격증취득일3
    RESUME_SELF_ONE_TITLE VARCHAR2(600),             --자소서제목1
    RESUME_SELF_ONE_CONTENT VARCHAR2(2000),          --자소서내용1
    RESUME_SELF_TWO_TITLE VARCHAR2(600),             --자소서제목2
    RESUME_SELF_TWO_CONTENT VARCHAR2(2000)           --자소서제목3
);

INSERT INTO USER_RESUME_DETAIL VALUES(2,54,'이재웅의 이력서입니다.','/image/사진.jpg','Y','육군','병장','2012-04','2014-01','고등학교','KH고등학교','2009','졸업','1종보통','경찰청','2015-01',NULL,NULL,NULL,NULL,NULL,NULL,'자소서제목','자기소개서입니다',NULL,NULL);

SELECT COUNT(*) FROM USER_RESUME_DETAIL WHERE MEMBER_NO_SEQ = 54;


SELECT D.* , ROWNUM
FROM(SELECT *
FROM USER_RESUME_DETAIL WHERE MEMBER_NO_SEQ = 54 ORDER BY RESUME_NO_SEQ) D
WHERE ROWNUM = 1; 

SELECT * FROM USER_RESUME_DETAIL WHERE MEMBER_NO_SEQ = 54 AND RESUME_NO_SEQ = 1;
SELECT * FROM USER_RESUME_DETAIL;

DELETE FROM USER_RESUME_DETAIL WHERE RESUME_NO_SEQ = 4;
--------------------이력서 희망 근무조건--------------------------

DROP TABLE USER_RESUME_HOPE CASCADE CONSTRAINTS PURGE;


CREATE TABLE USER_RESUME_HOPE(
    RESUME_NO_SEQ NUMBER REFERENCES USER_RESUME,    --FK 이력서번호SEQ 
    MEMBER_NO_SEQ NUMBER REFERENCES USER_MEMBER,    --FK 회원번호SEQ
    HOPE_EMPLOYFORM VARCHAR2(100),                  --고용형태(정규직,계약직 같은거)
    HOPE_SALARY VARCHAR2(100),                      --희망연봉
    HOPE_AFTERINTERVIEW VARCHAR2(10) CONSTRAINT HOPE_AFTERINTERVIEW_CHK CHECK (HOPE_AFTERINTERVIEW IN ('Y','N')), --면접후 결정(Y/N)
    HOPE_ADDR_ONE VARCHAR2(100),                    --희망근무지1
    HOPE_ADDR_TWO VARCHAR2(100),                    --희망근무지2
    HOPE_ADDR_THREE VARCHAR2(100),                  --희망근무지3
    HOPE_DUTY_KEYWORD_ONE VARCHAR2(300),            --직무산업키워드1
    HOPE_DUTY_KEYWORD_TWO VARCHAR2(300),            --직무산업키워드2
    HOPE_DUTY_KEYWORD_THREE VARCHAR2(300),          --직무산업키워드3
    HOPE_DUTY_KEYWORD_FOUR VARCHAR2(300),           --직무산업키워드4
    HOPE_DUTY_KEYWORD_FIVE VARCHAR2(300)            --직무산업키워드5
);

INSERT INTO USER_RESUME_HOPE VALUES(1,1,'정규직','2400','Y','서울시전체','경기도 고양시',NULL,'웹프로그래머','웹프로그래머,JAVA,JSP,AJAX','응용프로그래머',NULL,NULL);

SELECT * FROM USER_RESUME_HOPE;

----------------------이력서 경력--------------------------

DROP SEQUENCE CAREERSEQ;
DROP TABLE USER_RESUME_CAREER CASCADE CONSTRAINTS PURGE;

CREATE SEQUENCE CAREERSEQ;
CREATE TABLE USER_RESUME_CAREER(
    CAREER_NO_SEQ NUMBER PRIMARY KEY,               --경력번호
    RESUME_NO_SEQ NUMBER REFERENCES USER_RESUME,    --FK 이력서번호SEQ 
    MEMBER_NO_SEQ NUMBER REFERENCES USER_MEMBER,    --FK 회원번호SEQ
    CAREER_ENT VARCHAR2(300),                       --회사명
    CAREER_DEPT VARCHAR2(200),                      --부서명
    CAREER_STARTDAY VARCHAR2(100),                  --입사년월
    CAREER_ENDDAY VARCHAR2(100),                    --퇴사년월
    CAREER_IN_OFFICE VARCHAR2(10) CONSTRAINT CAREER_IN_OFFICE_CHK CHECK (CAREER_IN_OFFICE IN ('Y','N')), --재직중(Y/N)
    CAREER_POSITION VARCHAR2(300),                  --직급/직책
    CAREER_DUTY VARCHAR2(300),                      --직무
    CAREER_SALARY VARCHAR2(100)                     --연봉
);

INSERT INTO USER_RESUME_CAREER VALUES(CAREERSEQ.NEXTVAL,1,1,'KH정보교육원','인사팀','2012-04','2014-03','N','대리','채용','2600');

SELECT * FROM USER_RESUME_CAREER;



-----------채용등록 상세 테이블-------------

DROP TABLE BUIS_HIRE_ENROLL CASCADE CONSTRAINTS PURGE;
DROP SEQUENCE HIRESEQ;

CREATE SEQUENCE HIRESEQ;
CREATE TABLE BUIS_HIRE_ENROLL (
   HIRE_NO_SEQ NUMBER PRIMARY KEY, --채용등록번호SEQ
   MEMBER_NO_SEQ NUMBER REFERENCES USER_MEMBER (MEMBER_NO_SEQ), --사업자테이블 사업자번호 SEQ 참조키 
   HIRE_RECRUIT_NAME VARCHAR2(100), --모집분야명
   HIRE_COMPANY_TITLE VARCHAR2(100),	--회사이름
   HIRE_CAREER VARCHAR2(500) CONSTRAINT hire_career_ck  CHECK (HIRE_CAREER IN('신입','경력','무관')),--경력여부(신입,경력,경력무관)
   HIRE_TASK VARCHAR2(500), --담당업무
   HIRE_DEPART VARCHAR2(500), --근무부서
   HIRE_POSITION VARCHAR2(500), --직급/직책
   HIRE_PREFER VARCHAR2(100) CONSTRAINT hire_prefer_ck CHECK(HIRE_PREFER IN('Y','N')), --우대조건(Y,N)
   HIRE_PREFER_CONTENT VARCHAR2(1000), --우대조건내용
   HIRE_EDU VARCHAR2(500), --학력
   HIRE_GENDER VARCHAR2(200) CONSTRAINT hire_gender_ck CHECK(HIRE_GENDER IN('남자','여자','무관')), --성별(여자,남자,무관)
   HIRE_SALARY VARCHAR2(500), --급여
   HIRE_AGE VARCHAR2(100) NOT NULL, --연령
   HIRE_SECTOR VARCHAR2(500), --업종
   HIRE_ADDR VARCHAR2(500), --근무지주소
   HIRE_LATITUDE VARCHAR2(500), --근무지주소위도
   HIRE_LONGITUDE VARCHAR2(500), --근무지주소경도
   HIRE_WORKDAY VARCHAR2(100), --근무요일
   HIRE_WORKTIME VARCHAR2(100), --근무시간
   HIRE_STARTDAY VARCHAR2(100), --접수시작일(SYSDATE)
   HIRE_ENDDAY VARCHAR2(100), --접수마감일
   HIRE_MODE VARCHAR2(100), --접수방법
   HIRE_MANAGER_NAME VARCHAR2(100), --담당자이름
   HIRE_MANAGER_TEL VARCHAR2(100), --담당자전화번호
   HIRE_MANAGER_EMAIL VARCHAR2(100), --담당자이메일
   HIRE_ENT_TEL VARCHAR2(100) --회사전화번호
   );
      
   INSERT INTO BUIS_HIRE_ENROLL VALUES
    (HIRESEQ.NEXTVAL,1,'IT','신입','노동','개발','노동자','Y','일 잘 하는 사람','대졸','남자','2,000,000','20~30','청소','서울',
    '10','20','월~금','09~18',SYSDATE,'31-12-2019','양식','하준성','0000','HYD','0000'
    );
    
    SELECT * FROM BUIS_HIRE_ENROLL;
	SELECT COUNT(*) FROM BUIS_HIRE_ENROLL WHERE MEMBER_NO_SEQ = 1;
 ----------------------------고객센터----------------------------
   
   DROP TABLE CUSTOMER_SERVICE CASCADE CONSTRAINTS PURGE;
   DROP SEQUENCE CUSTOMERSEQ;
   
   CREATE SEQUENCE CUSTOMERSEQ;
   
   CREATE TABLE CUSTOMER_SERVICE(
       CUSTOMER_NO_SEQ NUMBER PRIMARY KEY, --질문글번호SEQ
       MEMBER_NO_SEQ NUMBER REFERENCES USER_MEMBER(MEMBER_NO_SEQ), --회원번호SEQ
       CUSTOMER_TITLE VARCHAR2(500) NOT NULL, --제목
       CUSTOMER_CONTENT VARCHAR2(2000) NOT NULL, --내용
       CUSTOMER_REGDATE DATE NOT NULL, --작성시간
       CUSTOMER_EMAIL VARCHAR2(100) --이메일
       );
       
    INSERT INTO CUSTOMER_SERVICE VALUES
    (CUSTOMERSEQ.NEXTVAL,1,'이거 어떻게 함','어떻게 해요',SYSDATE,'HYD');
    INSERT INTO CUSTOMER_SERVICE VALUES(CUSTOMERSEQ.NEXTVAL, 37, '안녕', '아아아ㅏㄴ녕', SYSDATE, 'user1@naver.com');
    SELECT * FROM CUSTOMER_SERVICE;
    
    -----------------------------고객센터관리자답변--------------------------
    
    DROP TABLE ADMIN_ANSWER CASCADE CONSTRAINTS PURGE;
    
    CREATE TABLE ADMIN_ANSWER(
        CUSTOMER_NO_SEQ NUMBER REFERENCES CUSTOMER_SERVICE(CUSTOMER_NO_SEQ), --질문글번호SEQ
        ADMIN_ANSWER_TITLE VARCHAR2(500) NOT NULL, --답변제목
        ADMIN_ANSWER_CONTENT VARCHAR2(2000) NOT NULL, --답변내용
        ADMIN_REGDATE DATE NOT NULL --답변시간
        );
        
    INSERT INTO ADMIN_ANSWER VALUES
    (1,'그렇게 하면됨','그렇게 하면되요',SYSDATE);
    
    SELECT * FROM ADMIN_ANSWER;
    
    
    ---------------------------------지원자이력서열람-------------------------------
    --사업자번호 SEQ 삭제--
    DROP TABLE VOLUNTEER_RESUME_READ CASCADE CONSTRAINTS PURGE;
    
    CREATE TABLE VOLUNTEER_RESUME_READ(
        RESUME_NO_SEQ NUMBER NOT NULL REFERENCES USER_RESUME(RESUME_NO_SEQ), --이력서번호SEQ
        MEMBER_NO_SEQ NUMBER NOT NULL REFERENCES USER_MEMBER(MEMBER_NO_SEQ), --회원번호SEQ
        HIRE_NO_SEQ NUMBER NOT NULL REFERENCES BUIS_HIRE_ENROLL(HIRE_NO_SEQ), --채용등록번호SEQ
        VOLUNTEER_RATING VARCHAR2(100) NOT NULL --지원자평가
        );
        
    INSERT INTO VOLUNTEER_RESUME_READ VALUES
        (1,1,1,1,'쉣');
        
    SELECT * FROM VOLUNTEER_RESUME_READ;
        
        
    -------------------------------사용자이력서열람----------------------------------
    --- 사업자번호 SEQ >> 회원번호 SEQ
    DROP TABLE BUIS_RESUME_READ CASCADE CONSTRAINTS PURGE;
    
    CREATE TABLE BUIS_RESUME_READ(
        MEMBER_NO_SEQ NUMBER NOT NULL REFERENCES USER_MEMBER(MEMBER_NO_SEQ), --회원번호 SEQ
        RESUME_NO_SEQ NUMBER NOT NULL REFERENCES USER_RESUME(RESUME_NO_SEQ) --이력서번호SEQ
        );
        
    INSERT INTO RESUME_NO_SEQ VALUES
    (1,1);
    
    SELECT * FROM RESUME_NO_SEQ;
----------------------------------개인목표설정----------------------------------

DROP SEQUENCE USERGOALSEQ;
DROP TABLE USER_GOAL CASCADE CONSTRAINTS PURGE;

CREATE SEQUENCE USERGOALSEQ;
CREATE TABLE USER_GOAL(                     --개인목표설정테이블
    GOAL_NO_SEQ NUMBER PRIMARY KEY,         --목표번호 SEQ
    MEMBER_NO_SEQ NUMBER REFERENCES USER_MEMBER(MEMBER_NO_SEQ),     --회원번호SEQ
    GOAL_TITLE VARCHAR2(200) NOT NULL,      --목표제목
    GOAL_CONTENT VARCHAR2(1000) NOT NULL,   --목표내용
    GOAL_STARTDAY VARCHAR2(200) NOT NULL,            --목표시작일
    GOAL_LASTDAY VARCHAR2(200) NOT NULL,    --목표완료일
    GOAL_REGDATE DATE NOT NULL,             --목표등록일
    GOAL_URL VARCHAR2(1000) NOT NULL        --목표 URL    
    );
    
INSERT INTO USER_GOAL VALUES(USERGOALSEQ.NEXTVAL,1,'할수있다!!','자바스크립트,SPRING MVC공부하기',SYSDATE,'19/10/24',SYSDATE,'AAAAAA'); 
INSERT INTO USER_GOAL VALUES(USERGOALSEQ.NEXTVAL,1,'백엔드개발자로..','JAVA공부하기',SYSDATE,'19/10/31',SYSDATE,'AAAAAA'); 

SELECT * FROM USER_GOAL;

-----------------------회사정보--------------------------
DROP SEQUENCE COMPANYNOSEQ;
DROP TABLE COMPANY_INFO CASCADE CONSTRAINTS PURGE;

CREATE SEQUENCE COMPANYNOSEQ
START WITH 49 
INCREMENT BY 1;
CREATE TABLE COMPANY_INFO(
	MEMBER_NO_SEQ NUMBER REFERENCES USER_MEMBER(MEMBER_NO_SEQ),		--회원번호 FK
	COMPANY_NO_SEQ NUMBER PRIMARY KEY,	--회사정보 번호 SEQ
	COMPANY_TITLE VARCHAR2(200),	  --회사 이름
	COMPANY_NAME VARCHAR2(200),		  --대표이름
	COMPANY_CATE VARCHAR2(500),	      --회사 카테고리/업종
	COMPANY_CAPITAL VARCHAR2(500),    --회사 자본금
	COMPANY_TAKE VARCHAR2(500),		  --회사 매출액
	COMPANY_REGDATE VARCHAR2(500),    --회사 설립일
	COMPANY_ALL_PEOPLE VARCHAR2(100), --회사 사원수
	COMPANY_SALRAY VARCHAR2(500),  	  --회사 평균연봉
	COMPANY_URL VARCHAR2(500),		  --회사 URL
	COMPANY_LOGO_URL VARCHAR2(500)	  --회사로고 URL
);
--INSERT INTO COMPANY_INFO VALUES(24,COMPANYNOSEQ.NEXTVAL,'(주)손오공','손오공','IT/솔루션','20억','1억5천만원','00-01-01','031-1234-5678','60','2400~2600만원','http://www.inbus.co.kr/','/resources/image/company_logo1.gif');
--INSERT INTO COMPANY_INFO VALUES(95,COMPANYNOSEQ.NEXTVAL,'(주)손오공','손오공','IT/솔루션','20억','1억5천만원','00-01-01','031-1234-5678','60','2400~2600만원','http://www.inbus.co.kr/','/resources/image/');
INSERT INTO COMPANY_INFO VALUES(1,COMPANYNOSEQ.NEXTVAL,'한국농수산식품유통공사','이병호','유통/무역/운송','683억 3천만원','90억 1천만원','1967-12-01','684','대졸초임 3,444만원','http://www.at.or.kr/','/resources/image/company_logo1.gif');
INSERT INTO COMPANY_INFO VALUES(3,COMPANYNOSEQ.NEXTVAL,'(주)이머니','이인복','은행/금융업','8억 3000만원','149억 4천만원','2003-06-11','36','4,675','http://www.x1.co.kr','/resources/image/company_logo2.jpg');
INSERT INTO COMPANY_INFO VALUES(4,COMPANYNOSEQ.NEXTVAL,'(주)기아자동차','박한우/최준영','제조/화학',NULL,NULL,'1944-01-01',NULL,'5,616','http://career.kia.com/kfront/main.do','/resources/image/company_logo3.jpg');
INSERT INTO COMPANY_INFO VALUES(5,COMPANYNOSEQ.NEXTVAL,'(주)우아한형제들','김봉진','IT/웹/통신','1억 8만원','3,129억 5천만','2011-03-10','734','회사내규에 따름','http://www.woowahan.com','/resources/image/company_logo4.png');
INSERT INTO COMPANY_INFO VALUES(6,COMPANYNOSEQ.NEXTVAL,'㈜오리온','이경재','제조/화학','197억 6천만원','1조 9,269억','2017-06-01','1773','회사내규에 따름','http://www.orionworld.com/','/resources/image/company_logo5.jpg');
INSERT INTO COMPANY_INFO VALUES(7,COMPANYNOSEQ.NEXTVAL,'(주)큐로컴','조중기','IT/웹/통신',NULL,NULL,'1997-04-25','65','회사내규에 따름','http://www.curocom.com','/resources/image/company_logo6.jpg');
INSERT INTO COMPANY_INFO VALUES(8,COMPANYNOSEQ.NEXTVAL,'현대무벡스','진정호,현기봉','IT/웹/통신','72억 9천만원','1,347억 3천만원','2005-07-01','302','5,279','http://www.hyundaimovex.com','/resources/image/non_company_logo.png');
INSERT INTO COMPANY_INFO VALUES(9,COMPANYNOSEQ.NEXTVAL,'한국정보통신(주)','권순배','IT/웹/통신','194억원','3739억','1986-01-01','248','3,800','http://www.kicc.co.kr/','/resources/image/company_logo7.jpg');
INSERT INTO COMPANY_INFO VALUES(10,COMPANYNOSEQ.NEXTVAL,'(주)하나금융티아이','유시완','IT/웹/통신','1,000억원','1664억원','1990-08-30','750','4,781','https://www.hanati.co.kr','/resources/image/company_logo8.png');
INSERT INTO COMPANY_INFO VALUES(11,COMPANYNOSEQ.NEXTVAL,'(주)엔디에스','김중원','IT/웹/통신','63억원','1,032억 7천만원','1993-01-08','381','4,874','http://nds.nongshim.co.kr','/resources/image/company_logo9.png');
INSERT INTO COMPANY_INFO VALUES(12,COMPANYNOSEQ.NEXTVAL,'(주)퀄리소프트','변유신','IT/웹/통신','500만원','2억 3,352만원','2014-09-12','6','면접후 결정','http://www.qualisoft.co.kr','/resources/image/non_company_logo.png');
INSERT INTO COMPANY_INFO VALUES(13,COMPANYNOSEQ.NEXTVAL,'KCC정보통신(주)','권혁상/이상현','IT/웹/통신','30억원','1,011억 3천만원','1967-10-12','405','회사내규에 따름','http://www.kcc.co.kr','/resources/image/company_logo10.jpg');
INSERT INTO COMPANY_INFO VALUES(14,COMPANYNOSEQ.NEXTVAL,'(주)마이셀럽스','신지현','미디어/디자인','41억원','6억 9천만원','2014-11-05','50','3,210','https://www.mycelebs.com/','/resources/image/company_logo11.png');
INSERT INTO COMPANY_INFO VALUES(15,COMPANYNOSEQ.NEXTVAL,'갤럭시아커뮤니케이션즈(주)','김용광','IT/웹/통신','196억 1천만원','813억 8천만원','1994-10-05','120','4,000','http://www.galaxiacommunications.co.kr','/resources/image/company_logo12.png');
INSERT INTO COMPANY_INFO VALUES(16,COMPANYNOSEQ.NEXTVAL,'엠비아이솔루션','김범수/오윤석','IT/웹/통신',NULL,NULL,'2016-02-22','31','2,900','https://happytalk.io','/resources/image/non_company_logo.png');
INSERT INTO COMPANY_INFO VALUES(17,COMPANYNOSEQ.NEXTVAL,'(주)티머니','김태극','IT/웹/통신','594억 7천만원','2500억','2003-10-06','258','5,616','http://www.tmoney.co.kr','/resources/image/company_logo13.jpg');
INSERT INTO COMPANY_INFO VALUES(18,COMPANYNOSEQ.NEXTVAL,'세아상역(주)','하정수','유통/무역/운송','242억 1천만원','1조 7,658억원','1986-03-06','882','4,520','http://www.sae-a.com','/resources/image/company_logo14.png');
INSERT INTO COMPANY_INFO VALUES(19,COMPANYNOSEQ.NEXTVAL,'수협은행','이동빈','은행/금융업','6,600억원','1조 4,983억원','2016-12-01','1728','4,400','http://www.suhyup-bank.com','/resources/image/company_logo15.jpg');
INSERT INTO COMPANY_INFO VALUES(20,COMPANYNOSEQ.NEXTVAL,'안랩','권치중','IT/웹/통신','51억8천만원','1565억5천만원','1995-03-18','1169','5,237','http://www.ahnlab.com','/resources/image/company_logo16.png');
INSERT INTO COMPANY_INFO VALUES(21,COMPANYNOSEQ.NEXTVAL,'(주)마이다스아이티','정승식','IT/웹/통신','20억 2천만원','721억 5천만원','2000-09-01','371','4,300','http://www.midasit.com','/resources/image/company_logo17.jpg');
INSERT INTO COMPANY_INFO VALUES(22,COMPANYNOSEQ.NEXTVAL,'스몰빌','박세환','미디어/디자인','900만원','1억6604만원','2010-09-15','4',null,null,'/resources/image/non_company_logo.png');
INSERT INTO COMPANY_INFO VALUES(23,COMPANYNOSEQ.NEXTVAL,'뮤직엔닷컴','오재명','IT/웹/통신','8000만원','4억3천만원','2006-04-01','7',null,'http://musicen.com','/resources/image/non_company_logo.png');
INSERT INTO COMPANY_INFO VALUES(24,COMPANYNOSEQ.NEXTVAL,'대한적십자사','박경서','의료/제약/복지','1990억1천만원','6440억3천만원','1948-10-27','3479','5,414','http://www.redcross.or.kr','/resources/image/company_logo18.jpg');
INSERT INTO COMPANY_INFO VALUES(25,COMPANYNOSEQ.NEXTVAL,'건국대학교병원','한설희','의료/제약/복지',null,null,'1931-01-01','2400',null,'http://www.kuh.ac.kr/bin/main/main.asp','/resources/image/company_logo19.png');
INSERT INTO COMPANY_INFO VALUES(26,COMPANYNOSEQ.NEXTVAL,'대교','박수완','의료/제약/복지','521억원','8207억원','1976-07-09','2547','4,073','http://www.daekyo.com','/resources/image/company_logo19.png');
--서울 관악구 보라매동 729-28 대교타워
INSERT INTO COMPANY_INFO VALUES(27,COMPANYNOSEQ.NEXTVAL,'더이앤엠','이승환,신환률','미디어/디자인','91억8천만원','271억4천만원','2002-07-01','93',null,'http://www.theenm.com','/resources/image/company_logo20.png');
--서울특별시 강남구 논현로 842 (신사동) 압구정빌딩 8층
INSERT INTO COMPANY_INFO VALUES(28,COMPANYNOSEQ.NEXTVAL,'엔씨소프트','김택진','IT/웹/통신','100억원','1조7587억원','1997-03-11','3378','5,416','http://kr.ncsoft.com','/resources/image/company_logo21.jpg');
--경기 성남시 분당구 삼평동 668번지
INSERT INTO COMPANY_INFO VALUES(29,COMPANYNOSEQ.NEXTVAL,'액토즈소프트','구오하이빈','IT/웹/통신',null,null,'1996-10-29','100',null,'http://www.actoz.com','/resources/image/non_company_logo.png');
--서울 강남구 역삼동 706-19 아이콘역삼빌딩 15층
INSERT INTO COMPANY_INFO VALUES(30,COMPANYNOSEQ.NEXTVAL,'모리스','문윤호','유통/무역/운송','2억8800만원',null,'1997-10-10','68',null,'http://www.morris.co.kr','/resources/image/company_logo22.jpg');
--인천 미추홀구 도화동 952번지 모리스빌딩 (주)모리스
INSERT INTO COMPANY_INFO VALUES(31,COMPANYNOSEQ.NEXTVAL,'한세실업','김익환','유통/무역/운송','200억원','1조3166억원','2009-01-06','624','6,607','http://www.hansae.com','/resources/image/company_logo23.jpg');
--서울 영등포구 여의도동 정우빌딩
INSERT INTO COMPANY_INFO VALUES(32,COMPANYNOSEQ.NEXTVAL,'디쉐어','현승원','IT/웹/통신','5000만원','500억','2011-01-06','800',null,'http://www.dshare.co.kr/','/resources/image/non_company_logo.png');
--서울 송파구 올림픽로 300 (신천동, 롯데월드타워앤드롯데월드몰) 35층 디쉐어
INSERT INTO COMPANY_INFO VALUES(33,COMPANYNOSEQ.NEXTVAL,'원익그룹','이현덕,이재경','IT/웹/통신','206억원','6490억원','2016-01-01','1306','5,742','http://www.ips.co.kr','/resources/image/non_company_logo.png');
--경기 평택시 진위면 진위산단로 75 (청호리) (주)원익아이피에스
INSERT INTO COMPANY_INFO VALUES(34,COMPANYNOSEQ.NEXTVAL,'지학사','권병일,권준구','미디어/디자인','11억원','450억원','1965-08-26','200','3,813','http://www.jihak.co.kr','/resources/image/company_logo24.jpg'); 
--서울 마포구 동교동 180-20
INSERT INTO COMPANY_INFO VALUES(35,COMPANYNOSEQ.NEXTVAL,'유진기업','최종성','건설업','385억6천만원','7809억8천만원','1984-06-13','669','5,247','https://www.eugenegroup.co.kr/','/resources/image/company_logo25.jpg');
--서울 영등포구 국제금융로 24 (여의도동, 유진빌딩) 유진빌딩

---일단여기까지..---
INSERT INTO COMPANY_INFO VALUES(38,COMPANYNOSEQ.NEXTVAL,'삼원에스앤디','오철,김태열','건설업','26억원','1423억원','1982-04-25','184',null,'http://www.samwonsd.co.kr','/resources/image/company_logo26.jpg');
--서울 서초구 서초동 1631-6번지
INSERT INTO COMPANY_INFO VALUES(39,COMPANYNOSEQ.NEXTVAL,'엠씨넥스','민동욱','미디어/디자인','86억1천만원','6276억4천만원','2004-12-22','438',null,'http://www.mcnex.com','/resources/image/company_logo27.jpg');
--서울 금천구 가산동 60-18 한신 IT 타워 2차 11층
INSERT INTO COMPANY_INFO VALUES(40,COMPANYNOSEQ.NEXTVAL,'넷케이티아이','김성용','미디어/디자인','10억원','817억8천만원','2006-05-04','164',null,'http://www.netkti.co.kr','/resources/image/non_company_logo.png');
--경기 성남시 분당구 운중로 135 (운중동, 더원스퀘어)7-10층
INSERT INTO COMPANY_INFO VALUES(41,COMPANYNOSEQ.NEXTVAL,'귀뚜라미','이영수','제조/화학','166억8천만원','1452억1천만원','1963-09-30','230',null,'http://www.bac.co.kr','/resources/image/non_company_logo.png');
--서울 강서구 화곡6동 1094번지
INSERT INTO COMPANY_INFO VALUES(42,COMPANYNOSEQ.NEXTVAL,'비에이치아이','우종인,조원래','제조/화학','130억원','2060억8천만원','1998-06-12','397','5,750','http://www.bhi.co.kr','/resources/image/company_logo28.png');
--서울 강남구 대치2동 942-1
INSERT INTO COMPANY_INFO VALUES(43,COMPANYNOSEQ.NEXTVAL,'FHIKOREA','신상용','유통/무역/운송','1억원','72억3천만원','2007-06-27','10',null,'http://www.fhikorea.com','/resources/image/non_company_logo.png');
--서울 강남구 논현동 166-6 미래빌딩2층
INSERT INTO COMPANY_INFO VALUES(44,COMPANYNOSEQ.NEXTVAL,'동원개발','장복만','건설업','454억원','6078억9천만원','1978-03-31','201',null,'http://www.dongwonapt.co.kr','/resources/image/company_logo29.jpg');
--부산 수영구 수영로 754 (민락동, 센텀비스타동원) 9층
INSERT INTO COMPANY_INFO VALUES(45,COMPANYNOSEQ.NEXTVAL,'신화푸드','김지연','서비스업','2억원','1700억원','1998-07-30','1600',null,'http://shinhwaifood.co.kr','/resources/image/company_logo30.jpg');
--경기 성남시 분당구 서현동 195-2번지 푸드빌3층
INSERT INTO COMPANY_INFO VALUES(46,COMPANYNOSEQ.NEXTVAL,'오피스디포코리아','송지헌','유통/무역/운송','77억1천만원','1030억원','1998-01-01','400',null,'http://www.officedepot.co.kr','/resources/image/company_logo31.jpg');
--서울 강남구 언주로 711 (논현동, 건설회관) 10층 오피스디포코리아
SELECT * FROM COMPANY_INFO WHERE MEMBER_NO_SEQ = 42;
SELECT * FROM COMPANY_INFO ORDER BY COMPANY_NO_SEQ;
DELETE FROM COMPANY_INFO WHERE COMPANY_NO_SEQ = 49;

SELECT * FROM (SELECT * FROM COMPANY_INFO) WHERE ROWNUM <=20 

SELECT * FROM USER_MEMBER U,COMPANY_INFO C;

SELECT MEMBER_ADDR FROM USER_MEMBER WHERE MEMBER_NO_SEQ = 1;

SELECT MEMBER_ADDR FROM USER_MEMBER U , COMPANY_INFO C
WHERE U.MEMBER_NO_SEQ = C.MEMBER_NO_SEQ
AND COMPANY_NO_SEQ = 1;

SELECT * FROM COMPANY_INFO WHERE MEMBER_NO_SEQ = 1;
SELECT * FROM COMPANY_INFO
	WHERE COMPANY_CATE = '서비스업'
------------------------------------------------------------------------------------------

				--MYSQL --

------------------------------------------------------------------------------------------

DROP TABLE PASSER_SELF;

CREATE TABLE PASSER_SELF(
	PASSER_NO_SEQ INT NOT NULL AUTO_INCREMENT PRIMARY KEY, --글번호SEQ
	PASSER_DATE VARCHAR(200), --합격년도
	PASSER_ENT VARCHAR(100), --기업
	PASSER_DUTY VARCHAR(100), --직무
	PASSER_INFO VARCHAR(400), --합격자정보
	EXPERT_EVAL VARCHAR(100), --전문가 자소서 총평 
	EXPERT_RATING INT, --평점
	EXPERT_CONTENT VARCHAR(200), --전문가 자소서 내용
	PASSER_Q_ONE VARCHAR(200), --자소서질문1
	PASSER_A_ONE VARCHAR(200), --자소서답변1
	PASSER_Q_TWO VARCHAR(200), --자소서질문2
	PASSER_A_TWO VARCHAR(200) --자소서답변2	
	);

DROP TABLE FAQ;

CREATE TABLE FAQ(
	FAQ_NO_SEQ NUMBER PRIMARY KEY, --글번호SEQ
	FAQ_TITLE VARCHAR2(300), --제목
	FAQ_CONTENT VARCHAR2(2000), --내용
	FAQ_ID VARCHAR2(100) --아이디(ADMIN)
	);
	
	
	
	INSERT INTO FAQ VALUES(1, '소셜로 가입한 계정을 잡아라 자체 계정으로 전환이 가능하가요?', '불가능합니다.', 'ADMIN');
	

