select * from test
--------
--멤버 테이블 사업자등록번호추가 , 아이디 UNIQUE 추가--
--기업회원 테이블 일단 사용 X (유저테이블 롤값으로 BUIS), 채용등록 상세 테이블, 
	--지원자이력서열람-------------------------------
    --사업자번호 SEQ 삭제--
    --사용자이력서열람------
    --- 사업자번호 SEQ >> 회원번호 SEQ
    --유저멤버 생일 date >> varchar변경 폼넘어갈때 400오류뜸
-----------------------유저 테이블---------------------------
DROP SEQUENCE MEMBERSEQ;
DROP TABLE USER_MEMBER CASCADE CONSTRAINTS PURGE;

CREATE SEQUENCE MEMBERSEQ;

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
DELETE FROM USER_MEMBER WHERE MEMBER_NO_SEQ = 21;

SELECT * FROM USER_MEMBER;
SELECT * FROM USER_MEMBER WHERE MEMBER_ID = 'user123'
DELETE FROM USER_MEMBER WHERE MEMBER_NO_SEQ = 10;

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

CREATE SEQUENCE RESUMESEQ;
CREATE TABLE USER_RESUME(
    RESUME_NO_SEQ NUMBER PRIMARY KEY,                   --이력서번호SEQ
    MEMBER_NO_SEQ NUMBER REFERENCES USER_MEMBER,        --회원번호SEQ
    RESUME_TITLE VARCHAR2(500),                          --이력서제목
    RESUME_DATE DATE NOT NULL                           --이력서작성일
);

INSERT INTO USER_RESUME VALUES(RESUMESEQ.NEXTVAL,1,'ㅇㅇㅇ의 이력서입니다',SYSDATE);

SELECT * FROM USER_RESUME;


--------------------------이력서 상세--------------------------

DROP TABLE USER_RESUME_DETAIL CASCADE CONSTRAINTS PURGE;

CREATE TABLE USER_RESUME_DETAIL(
    RESUME_NO_SEQ NUMBER REFERENCES USER_RESUME,    --FK 이력서번호SEQ 
    MEMBER_NO_SEQ NUMBER REFERENCES USER_MEMBER,    --FK 회원번호SEQ
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
    RSSUME_SELF_ONE_TITLE VARCHAR2(600),             --자소서제목1
    RSSUME_SELF_ONE_CONTENT VARCHAR2(2000),          --자소서내용1
    RSSUME_SELF_TWO_TITLE VARCHAR2(600),             --자소서제목2
    RSSUME_SELF_TWO_CONTENT VARCHAR2(2000)           --자소서제목3
);

INSERT INTO USER_RESUME_DETAIL VALUES(1,1,'/image/사진.jpg','Y','육군','병장','2012-04','2014-01','고등학교','KH고등학교','2009','졸업','1종보통','경찰청','2015-01',NULL,NULL,NULL,NULL,NULL,NULL,'자소서제목','자기소개서입니다',NULL,NULL);


SELECT * FROM USER_RESUME_DETAIL;

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
   HIRE_WORKDDAY VARCHAR2(100), --근무요일
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
	FAQ_NO_SEQ INT NOT NULL AUTO_INCREMENT PRIMARY KEY, --글번호SEQ
	FAQ_TITLE VARCHAR(300), --제목
	FAQ_CONTENT VARCHAR(2000), --내용
	FAQ_ID VARCHAR(100) --아이디(ADMIN)
	);
	

