
ALTER TABLE APPLICATION_MANAGER.CUSTOM_SETTING DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.CUSTOM_SETTING CASCADE CONSTRAINTS;

--
-- CUSTOM_SETTING  (Table) 
--
--  Dependencies: 
--   INSTALLATION (Table)
--
--   Count: 19 rows
CREATE TABLE APPLICATION_MANAGER.CUSTOM_SETTING
(
  CUSTOM_SETTING_ID  INTEGER                    NOT NULL,
  INSTALLATION_ID    INTEGER                    NOT NULL,
  SETTING_NAME       VARCHAR2(400 BYTE)         NOT NULL,
  SETTING_VALUE      VARCHAR2(400 BYTE)         NOT NULL,
  DATE_CREATED       DATE                       NOT NULL,
  ACTIVE_IND         INTEGER                    DEFAULT 1                     NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE APPLICATION_MANAGER.ERROR_LOG DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.ERROR_LOG CASCADE CONSTRAINTS;

--
-- ERROR_LOG  (Table) 
--
--  Dependencies: 
--   INSTALLATION (Table)
--
--   Count: 0 rows
CREATE TABLE APPLICATION_MANAGER.ERROR_LOG
(
  ERROR_LOG_ID           INTEGER                NOT NULL,
  INSTALLATION_ID        INTEGER                NOT NULL,
  ERRORING_TEMPLATE      VARCHAR2(4000 BYTE)        NULL,
  ERRORING_QUERYSTRING   VARCHAR2(4000 BYTE)        NULL,
  HTTP_REFERER           VARCHAR2(4000 BYTE)        NULL,
  USERNAME               VARCHAR2(400 BYTE)         NULL,
  REMOTE_ADDRESS         VARCHAR2(4000 BYTE)        NULL,
  USER_BROWSER           VARCHAR2(4000 BYTE)        NULL,
  ERROR_WEB_DATETIME     DATE                       NULL,
  ERROR_SQL_DATETIME     DATE                       NULL,
  DIAGNOSTICS            CLOB                       NULL,
  APPLICATION_VARIABLES  CLOB                       NULL,
  ATTRIBUTES_VARIABLES   CLOB                       NULL,
  CGI_VARIABLES          CLOB                       NULL,
  CLIENT_VARIABLES       CLOB                       NULL,
  FORM_VARIABLES         CLOB                       NULL,
  URL_VARIABLES          CLOB                       NULL,
  ERROR_VARIABLES        CLOB                       NULL,
  LOCAL_VARIABLES        CLOB                       NULL,
  REQUEST_VARIABLES      CLOB                       NULL
)
TABLESPACE USER2
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
LOB (DIAGNOSTICS) STORE AS 
      ( TABLESPACE  USER2 
        ENABLE      STORAGE IN ROW
        CHUNK       16384
        PCTVERSION  10
        NOCACHE
        STORAGE    (
                    INITIAL          64K
                    MINEXTENTS       1
                    MAXEXTENTS       2147483645
                    PCTINCREASE      0
                    FREELISTS        1
                    FREELIST GROUPS  1
                    BUFFER_POOL      DEFAULT
                   )
      )
  LOB (APPLICATION_VARIABLES) STORE AS 
      ( TABLESPACE  USER2 
        ENABLE      STORAGE IN ROW
        CHUNK       16384
        PCTVERSION  10
        NOCACHE
        STORAGE    (
                    INITIAL          64K
                    MINEXTENTS       1
                    MAXEXTENTS       2147483645
                    PCTINCREASE      0
                    FREELISTS        1
                    FREELIST GROUPS  1
                    BUFFER_POOL      DEFAULT
                   )
      )
  LOB (ATTRIBUTES_VARIABLES) STORE AS 
      ( TABLESPACE  USER2 
        ENABLE      STORAGE IN ROW
        CHUNK       16384
        PCTVERSION  10
        NOCACHE
        STORAGE    (
                    INITIAL          64K
                    MINEXTENTS       1
                    MAXEXTENTS       2147483645
                    PCTINCREASE      0
                    FREELISTS        1
                    FREELIST GROUPS  1
                    BUFFER_POOL      DEFAULT
                   )
      )
  LOB (CGI_VARIABLES) STORE AS 
      ( TABLESPACE  USER2 
        ENABLE      STORAGE IN ROW
        CHUNK       16384
        PCTVERSION  10
        NOCACHE
        STORAGE    (
                    INITIAL          64K
                    MINEXTENTS       1
                    MAXEXTENTS       2147483645
                    PCTINCREASE      0
                    FREELISTS        1
                    FREELIST GROUPS  1
                    BUFFER_POOL      DEFAULT
                   )
      )
  LOB (CLIENT_VARIABLES) STORE AS 
      ( TABLESPACE  USER2 
        ENABLE      STORAGE IN ROW
        CHUNK       16384
        PCTVERSION  10
        NOCACHE
        STORAGE    (
                    INITIAL          64K
                    MINEXTENTS       1
                    MAXEXTENTS       2147483645
                    PCTINCREASE      0
                    FREELISTS        1
                    FREELIST GROUPS  1
                    BUFFER_POOL      DEFAULT
                   )
      )
  LOB (FORM_VARIABLES) STORE AS 
      ( TABLESPACE  USER2 
        ENABLE      STORAGE IN ROW
        CHUNK       16384
        PCTVERSION  10
        NOCACHE
        STORAGE    (
                    INITIAL          64K
                    MINEXTENTS       1
                    MAXEXTENTS       2147483645
                    PCTINCREASE      0
                    FREELISTS        1
                    FREELIST GROUPS  1
                    BUFFER_POOL      DEFAULT
                   )
      )
  LOB (URL_VARIABLES) STORE AS 
      ( TABLESPACE  USER2 
        ENABLE      STORAGE IN ROW
        CHUNK       16384
        PCTVERSION  10
        NOCACHE
        STORAGE    (
                    INITIAL          64K
                    MINEXTENTS       1
                    MAXEXTENTS       2147483645
                    PCTINCREASE      0
                    FREELISTS        1
                    FREELIST GROUPS  1
                    BUFFER_POOL      DEFAULT
                   )
      )
  LOB (ERROR_VARIABLES) STORE AS 
      ( TABLESPACE  USER2 
        ENABLE      STORAGE IN ROW
        CHUNK       16384
        PCTVERSION  10
        NOCACHE
        STORAGE    (
                    INITIAL          64K
                    MINEXTENTS       1
                    MAXEXTENTS       2147483645
                    PCTINCREASE      0
                    FREELISTS        1
                    FREELIST GROUPS  1
                    BUFFER_POOL      DEFAULT
                   )
      )
  LOB (LOCAL_VARIABLES) STORE AS 
      ( TABLESPACE  USER2 
        ENABLE      STORAGE IN ROW
        CHUNK       16384
        PCTVERSION  10
        NOCACHE
        STORAGE    (
                    INITIAL          64K
                    MINEXTENTS       1
                    MAXEXTENTS       2147483645
                    PCTINCREASE      0
                    FREELISTS        1
                    FREELIST GROUPS  1
                    BUFFER_POOL      DEFAULT
                   )
      )
  LOB (REQUEST_VARIABLES) STORE AS 
      ( TABLESPACE  USER2 
        ENABLE      STORAGE IN ROW
        CHUNK       16384
        PCTVERSION  10
        NOCACHE
        STORAGE    (
                    INITIAL          64K
                    MINEXTENTS       1
                    MAXEXTENTS       2147483645
                    PCTINCREASE      0
                    FREELISTS        1
                    FREELIST GROUPS  1
                    BUFFER_POOL      DEFAULT
                   )
      )
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE APPLICATION_MANAGER.INSTALLATION DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.INSTALLATION CASCADE CONSTRAINTS;

--
-- INSTALLATION  (Table) 
--
--  Dependencies: 
--   PRODUCT (Table)
--   REF_EMAIL_SERVER (Table)
--   REF_ENVIRONMENT (Table)
--   REF_HOST_SERVER (Table)
--
--   Count: 22 rows
CREATE TABLE APPLICATION_MANAGER.INSTALLATION
(
  INSTALLATION_ID             INTEGER           NOT NULL,
  PRODUCT_ID                  INTEGER           NOT NULL,
  ENVIRONMENT_ID              INTEGER           NOT NULL,
  HOST_SERVER_ID              INTEGER           NOT NULL,
  EMAIL_SERVER_ID             INTEGER           NOT NULL,
  DATE_CREATED                DATE              NOT NULL,
  ACTIVE_IND                  INTEGER           DEFAULT 1                     NOT NULL,
  APPLICATION_NAME            VARCHAR2(400 BYTE) NOT NULL,
  ERROR_HANDLING_ENABLED_IND  INTEGER           DEFAULT 1                     NOT NULL,
  DATE_UPDATED                DATE                  NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON COLUMN APPLICATION_MANAGER.INSTALLATION.ACTIVE_IND IS 'If this field is set to 0, the product will show Product.inactive_link and then stop.';

COMMENT ON COLUMN APPLICATION_MANAGER.INSTALLATION.APPLICATION_NAME IS 'This field is auto-populated as a result of changes to a number of fields.';


ALTER TABLE APPLICATION_MANAGER.INSTALLATION_URL DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.INSTALLATION_URL CASCADE CONSTRAINTS;

--
-- INSTALLATION_URL  (Table) 
--
--  Dependencies: 
--   INSTALLATION (Table)
--
--   Count: 26 rows
CREATE TABLE APPLICATION_MANAGER.INSTALLATION_URL
(
  INSTALLATION_URL_ID  NUMBER                   NOT NULL,
  INSTALLATION_ID      NUMBER                   NOT NULL,
  URL_TO_BASE          VARCHAR2(4000 BYTE)      NOT NULL,
  ACTIVE_IND           NUMBER                   DEFAULT 1                     NOT NULL,
  DATE_CREATED         DATE                     NOT NULL,
  DATE_UPDATED         DATE                         NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


DROP TABLE APPLICATION_MANAGER.LAST_UPDATED CASCADE CONSTRAINTS;

--
-- LAST_UPDATED  (Table) 
--
--   Count: 2 rows
CREATE TABLE APPLICATION_MANAGER.LAST_UPDATED
(
  LAST_UPDATED  DATE                            NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE APPLICATION_MANAGER.L_INSTALLATION_SUPPORTING_DB DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.L_INSTALLATION_SUPPORTING_DB CASCADE CONSTRAINTS;

--
-- L_INSTALLATION_SUPPORTING_DB  (Table) 
--
--  Dependencies: 
--   INSTALLATION (Table)
--   REF_DATABASE_SERVER (Table)
--   SUPPORTING_DATABASE (Table)
--
--   Count: 2 rows
CREATE TABLE APPLICATION_MANAGER.L_INSTALLATION_SUPPORTING_DB
(
  L_I_S_D_ID              INTEGER                   NULL,
  INSTALLATION_ID         INTEGER               NOT NULL,
  SUPPORTING_DATABASE_ID  INTEGER               NOT NULL,
  DATABASE_SERVER_ID      INTEGER               NOT NULL,
  DATASOURCE_NAME         VARCHAR2(400 BYTE)    NOT NULL,
  DATE_CREATED            DATE                  NOT NULL,
  ACTIVE_IND              INTEGER               DEFAULT 1                     NOT NULL,
  DATABASE_TYPE_ID        INTEGER               DEFAULT 1                         NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE APPLICATION_MANAGER.L_INSTALLATION_SUPPORT_CONTACT DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.L_INSTALLATION_SUPPORT_CONTACT CASCADE CONSTRAINTS;

--
-- L_INSTALLATION_SUPPORT_CONTACT  (Table) 
--
--  Dependencies: 
--   INSTALLATION (Table)
--   SUPPORT_CONTACT_INFO (Table)
--
--   Count: 62 rows
CREATE TABLE APPLICATION_MANAGER.L_INSTALLATION_SUPPORT_CONTACT
(
  L_I_S_C_ID               INTEGER              NOT NULL,
  INSTALLATION_ID          INTEGER              NOT NULL,
  SUPPORT_CONTACT_INFO_ID  INTEGER              NOT NULL,
  DATE_CREATED             DATE                 NOT NULL,
  SORT_ORDER               INTEGER                  NULL,
  ACTIVE_IND               INTEGER              DEFAULT 1                     NOT NULL,
  SEND_EMAIL_IND           INTEGER              DEFAULT 1                     NOT NULL,
  NOTES                    VARCHAR2(400 BYTE)       NULL,
  DISPLAY_CONTACT_IND      NUMBER               DEFAULT 0                         NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE APPLICATION_MANAGER.PRODUCT DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.PRODUCT CASCADE CONSTRAINTS;

--
-- PRODUCT  (Table) 
--
--   Count: 8 rows
CREATE TABLE APPLICATION_MANAGER.PRODUCT
(
  PRODUCT_ID                      INTEGER       NOT NULL,
  PRODUCT_NAME                    VARCHAR2(4000 BYTE) NOT NULL,
  BROWSER_NAVIGATION_ENABLED_IND  INTEGER       DEFAULT 1                     NOT NULL,
  INACTIVE_LINK                   VARCHAR2(400 BYTE) DEFAULT 'pag_system_unavailable.cfm' NOT NULL,
  DATE_CREATED                    DATE          NOT NULL,
  ACTIVE_IND                      INTEGER       DEFAULT 1                     NOT NULL,
  APPLICATIONTIMEOUT              FLOAT(126)    DEFAULT 0.04166666666665      NOT NULL,
  CLIENTMANAGEMENT                VARCHAR2(3 BYTE) DEFAULT 'no'     NULL,
  CLIENTSTORAGE                   VARCHAR2(100 BYTE) DEFAULT 'registry'     NULL,
  SCRIPTPROTECT                   VARCHAR2(100 BYTE) DEFAULT '0,1,0,0'     NULL,
  SESSIONMANAGEMENT               VARCHAR2(3 BYTE) DEFAULT 'no'     NULL,
  SESSIONTIMEOUT                  FLOAT(126)    DEFAULT 0.04166666666665      NOT NULL,
  SETCLIENTCOOKIES                VARCHAR2(3 BYTE) DEFAULT 'yes'     NULL,
  SETDOMAINCOOKIES                VARCHAR2(3 BYTE) DEFAULT 'no'     NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE APPLICATION_MANAGER.PRODUCT_VERSION DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.PRODUCT_VERSION CASCADE CONSTRAINTS;

--
-- PRODUCT_VERSION  (Table) 
--
--  Dependencies: 
--   INSTALLATION (Table)
--
--   Count: 4 rows
CREATE TABLE APPLICATION_MANAGER.PRODUCT_VERSION
(
  PRODUCT_VERSION_ID          INTEGER           NOT NULL,
  INSTALLATION_ID             INTEGER           NOT NULL,
  PRODUCT_RELEASE_VERSION     VARCHAR2(400 BYTE)     NULL,
  SUBVERSION_RELEASE_VERSION  VARCHAR2(400 BYTE)     NULL,
  DATE_CREATED                DATE              NOT NULL,
  ACTIVE_IND                  INTEGER           DEFAULT 1                     NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE APPLICATION_MANAGER.REF_DATABASE_SERVER DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.REF_DATABASE_SERVER CASCADE CONSTRAINTS;

--
-- REF_DATABASE_SERVER  (Table) 
--
--   Count: 3 rows
CREATE TABLE APPLICATION_MANAGER.REF_DATABASE_SERVER
(
  DATABASE_SERVER_ID    INTEGER                 NOT NULL,
  DATABASE_SERVER_NAME  VARCHAR2(400 BYTE)      NOT NULL,
  SORT_ORDER            INTEGER                 NOT NULL,
  ACTIVE_IND            INTEGER                 DEFAULT 1                     NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE APPLICATION_MANAGER.REF_DATABASE_TYPE DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.REF_DATABASE_TYPE CASCADE CONSTRAINTS;

--
-- REF_DATABASE_TYPE  (Table) 
--
--   Count: 1 rows
CREATE TABLE APPLICATION_MANAGER.REF_DATABASE_TYPE
(
  DATABASE_TYPE_ID    INTEGER                   NOT NULL,
  DATABASE_TYPE_NAME  VARCHAR2(400 BYTE)        NOT NULL,
  SORT_ORDER          INTEGER                       NULL,
  ACTIVE_IND          INTEGER                   DEFAULT 1                     NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE APPLICATION_MANAGER.REF_EMAIL_SERVER DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.REF_EMAIL_SERVER CASCADE CONSTRAINTS;

--
-- REF_EMAIL_SERVER  (Table) 
--
--   Count: 1 rows
CREATE TABLE APPLICATION_MANAGER.REF_EMAIL_SERVER
(
  EMAIL_SERVER_ID    INTEGER                    NOT NULL,
  EMAIL_SERVER_NAME  VARCHAR2(400 BYTE)         NOT NULL,
  SORT_ORDER         INTEGER                    NOT NULL,
  ACTIVE_IND         INTEGER                    DEFAULT 1                     NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE APPLICATION_MANAGER.REF_ENVIRONMENT DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.REF_ENVIRONMENT CASCADE CONSTRAINTS;

--
-- REF_ENVIRONMENT  (Table) 
--
--   Count: 4 rows
CREATE TABLE APPLICATION_MANAGER.REF_ENVIRONMENT
(
  ENVIRONMENT_ID    INTEGER                     NOT NULL,
  ENVIRONMENT_NAME  VARCHAR2(400 BYTE)          NOT NULL,
  SORT_ORDER        INTEGER                         NULL,
  ACTIVE_IND        INTEGER                     DEFAULT 1                     NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE APPLICATION_MANAGER.REF_HOST_SERVER DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.REF_HOST_SERVER CASCADE CONSTRAINTS;

--
-- REF_HOST_SERVER  (Table) 
--
--   Count: 1 rows
CREATE TABLE APPLICATION_MANAGER.REF_HOST_SERVER
(
  HOST_SERVER_ID    INTEGER                     NOT NULL,
  HOST_SERVER_NAME  VARCHAR2(400 BYTE)          NOT NULL,
  SORT_ORDER        INTEGER                     NOT NULL,
  ACTIVE_IND        INTEGER                     DEFAULT 1                     NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE APPLICATION_MANAGER.REF_SUPPORT_CONTACT_TYPE DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.REF_SUPPORT_CONTACT_TYPE CASCADE CONSTRAINTS;

--
-- REF_SUPPORT_CONTACT_TYPE  (Table) 
--
--   Count: 4 rows
CREATE TABLE APPLICATION_MANAGER.REF_SUPPORT_CONTACT_TYPE
(
  SUPPORT_CONTACT_TYPE_ID    INTEGER            NOT NULL,
  SUPPORT_CONTACT_TYPE_NAME  VARCHAR2(400 BYTE) NOT NULL,
  SORT_ORDER                 INTEGER            NOT NULL,
  ACTIVE_IND                 INTEGER            DEFAULT 1                     NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE APPLICATION_MANAGER.SORTER DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.SORTER CASCADE CONSTRAINTS;

--
-- SORTER  (Table) 
--
--   Count: 3 rows
CREATE TABLE APPLICATION_MANAGER.SORTER
(
  SORTER_ID              INTEGER                NOT NULL,
  ID_OF_SORTED_COLUMN    INTEGER                NOT NULL,
  TEXT_OF_SORTED_COLUMN  VARCHAR2(4000 BYTE)        NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE APPLICATION_MANAGER.SUPPORTING_DATABASE DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.SUPPORTING_DATABASE CASCADE CONSTRAINTS;

--
-- SUPPORTING_DATABASE  (Table) 
--
--   Count: 2 rows
CREATE TABLE APPLICATION_MANAGER.SUPPORTING_DATABASE
(
  SUPPORTING_DATABASE_ID  INTEGER               NOT NULL,
  DATABASE_NAME           VARCHAR2(400 BYTE)    NOT NULL,
  DATASOURCE_DESCRIPTION  VARCHAR2(400 BYTE)    NOT NULL,
  DATE_CREATED            DATE                  NOT NULL,
  ACTIVE_IND              INTEGER               DEFAULT 1                     NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE APPLICATION_MANAGER.SUPPORT_CONTACT_INFO DROP PRIMARY KEY CASCADE;
DROP TABLE APPLICATION_MANAGER.SUPPORT_CONTACT_INFO CASCADE CONSTRAINTS;

--
-- SUPPORT_CONTACT_INFO  (Table) 
--
--  Dependencies: 
--   REF_SUPPORT_CONTACT_TYPE (Table)
--
--   Count: 3 rows
CREATE TABLE APPLICATION_MANAGER.SUPPORT_CONTACT_INFO
(
  SUPPORT_CONTACT_INFO_ID  INTEGER              NOT NULL,
  SUPPORT_CONTACT_TYPE_ID  INTEGER              NOT NULL,
  LAST_NAME                VARCHAR2(400 BYTE)       NULL,
  FIRST_NAME               VARCHAR2(400 BYTE)       NULL,
  PHONE                    VARCHAR2(400 BYTE)       NULL,
  EMAIL                    VARCHAR2(400 BYTE)       NULL,
  DATE_CREATED             DATE                 NOT NULL,
  ACTIVE_IND               INTEGER              DEFAULT 1                     NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


--
-- CUSTOM_SETTING_PK  (Index) 
--
--  Dependencies: 
--   CUSTOM_SETTING (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.CUSTOM_SETTING_PK ON APPLICATION_MANAGER.CUSTOM_SETTING
(CUSTOM_SETTING_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- ERROR_LOG_PK  (Index) 
--
--  Dependencies: 
--   ERROR_LOG (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.ERROR_LOG_PK ON APPLICATION_MANAGER.ERROR_LOG
(ERROR_LOG_ID)
LOGGING
TABLESPACE USER2
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- INSTALLATION_PK  (Index) 
--
--  Dependencies: 
--   INSTALLATION (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.INSTALLATION_PK ON APPLICATION_MANAGER.INSTALLATION
(INSTALLATION_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- INSTALLATION_URL_PK  (Index) 
--
--  Dependencies: 
--   INSTALLATION_URL (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.INSTALLATION_URL_PK ON APPLICATION_MANAGER.INSTALLATION_URL
(INSTALLATION_URL_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- INSTALLATION_URL_UK1  (Index) 
--
--  Dependencies: 
--   INSTALLATION_URL (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.INSTALLATION_URL_UK1 ON APPLICATION_MANAGER.INSTALLATION_URL
(URL_TO_BASE)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- L_INSTALLATION_SUPPORTING_PK  (Index) 
--
--  Dependencies: 
--   L_INSTALLATION_SUPPORTING_DB (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.L_INSTALLATION_SUPPORTING_PK ON APPLICATION_MANAGER.L_INSTALLATION_SUPPORTING_DB
(L_I_S_D_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- L_INSTALLATION_SUPPORT_CO_PK  (Index) 
--
--  Dependencies: 
--   L_INSTALLATION_SUPPORT_CONTACT (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.L_INSTALLATION_SUPPORT_CO_PK ON APPLICATION_MANAGER.L_INSTALLATION_SUPPORT_CONTACT
(L_I_S_C_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- PRODUCT_PK  (Index) 
--
--  Dependencies: 
--   PRODUCT (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.PRODUCT_PK ON APPLICATION_MANAGER.PRODUCT
(PRODUCT_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- PRODUCT_VERSION_PK  (Index) 
--
--  Dependencies: 
--   PRODUCT_VERSION (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.PRODUCT_VERSION_PK ON APPLICATION_MANAGER.PRODUCT_VERSION
(PRODUCT_VERSION_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- REF_DATABASE_SERVER_PK  (Index) 
--
--  Dependencies: 
--   REF_DATABASE_SERVER (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.REF_DATABASE_SERVER_PK ON APPLICATION_MANAGER.REF_DATABASE_SERVER
(DATABASE_SERVER_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- REF_DATABASE_TYPE_PK  (Index) 
--
--  Dependencies: 
--   REF_DATABASE_TYPE (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.REF_DATABASE_TYPE_PK ON APPLICATION_MANAGER.REF_DATABASE_TYPE
(DATABASE_TYPE_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- REF_EMAIL_SERVER_PK  (Index) 
--
--  Dependencies: 
--   REF_EMAIL_SERVER (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.REF_EMAIL_SERVER_PK ON APPLICATION_MANAGER.REF_EMAIL_SERVER
(EMAIL_SERVER_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- REF_ENVIRONMENT_PK  (Index) 
--
--  Dependencies: 
--   REF_ENVIRONMENT (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.REF_ENVIRONMENT_PK ON APPLICATION_MANAGER.REF_ENVIRONMENT
(ENVIRONMENT_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- REF_HOST_SERVER_PK  (Index) 
--
--  Dependencies: 
--   REF_HOST_SERVER (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.REF_HOST_SERVER_PK ON APPLICATION_MANAGER.REF_HOST_SERVER
(HOST_SERVER_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- REF_SUPPORT_CONTACT_TYPE_PK  (Index) 
--
--  Dependencies: 
--   REF_SUPPORT_CONTACT_TYPE (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.REF_SUPPORT_CONTACT_TYPE_PK ON APPLICATION_MANAGER.REF_SUPPORT_CONTACT_TYPE
(SUPPORT_CONTACT_TYPE_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- SORTER_PK  (Index) 
--
--  Dependencies: 
--   SORTER (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.SORTER_PK ON APPLICATION_MANAGER.SORTER
(SORTER_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- SUPPORTING_DATABASE_PK  (Index) 
--
--  Dependencies: 
--   SUPPORTING_DATABASE (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.SUPPORTING_DATABASE_PK ON APPLICATION_MANAGER.SUPPORTING_DATABASE
(SUPPORTING_DATABASE_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- SUPPORT_CONTACT_INFO_PK  (Index) 
--
--  Dependencies: 
--   SUPPORT_CONTACT_INFO (Table)
--
CREATE UNIQUE INDEX APPLICATION_MANAGER.SUPPORT_CONTACT_INFO_PK ON APPLICATION_MANAGER.SUPPORT_CONTACT_INFO
(SUPPORT_CONTACT_INFO_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


--
-- DELETE_CUSTOM_SETTING  (Trigger) 
--
--  Dependencies: 
--   CUSTOM_SETTING (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.DELETE_Custom_Setting BEFORE DELETE ON Custom_Setting
FOR EACH ROW
BEGIN
	--Do not allow deletes.
	RAISE_APPLICATION_ERROR(-20000, 'To assist in error diagnosis, hard deletes are prohibited. Instead, please soft delete the intended record by setting active_ind to 0.'); 
END;
/
SHOW ERRORS;



--
-- DELETE_INSTALLATION  (Trigger) 
--
--  Dependencies: 
--   INSTALLATION (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.DELETE_INSTALLATION BEFORE DELETE ON APPLICATION_MANAGER.INSTALLATION 
FOR EACH ROW
BEGIN
	--Do not allow deletes.
	RAISE_APPLICATION_ERROR(-20000, 'To assist in error diagnosis, hard deletes are prohibited. Instead, please soft delete the intended record by setting active_ind to 0.'); 
END;
/
SHOW ERRORS;



--
-- DELETE_INSTALLATION_URL  (Trigger) 
--
--  Dependencies: 
--   INSTALLATION_URL (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.DELETE_INSTALLATION_URL BEFORE DELETE ON APPLICATION_MANAGER.INSTALLATION_URL 
FOR EACH ROW
BEGIN
	--Do not allow deletes.
	RAISE_APPLICATION_ERROR(-20000, 'To assist in error diagnosis, hard deletes are prohibited. Instead, please soft delete the intended record by setting active_ind to 0.'); 
END;
/
SHOW ERRORS;



--
-- DELETE_LAST_UPDATED  (Trigger) 
--
--  Dependencies: 
--   LAST_UPDATED (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.DELETE_Last_Updated BEFORE DELETE ON Last_Updated
FOR EACH ROW
BEGIN
	--Do not allow deletes.
	RAISE_APPLICATION_ERROR(-20000, 'Are you crazy? This table must always have exactly one record at all times. Do not delete it!'); 
END;
/
SHOW ERRORS;



--
-- DELETE_L_I_S_C  (Trigger) 
--
--  Dependencies: 
--   L_INSTALLATION_SUPPORT_CONTACT (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.DELETE_L_I_S_C BEFORE DELETE ON APPLICATION_MANAGER.L_INSTALLATION_SUPPORT_CONTACT 
FOR EACH ROW
BEGIN
	--Do not allow deletes.
	RAISE_APPLICATION_ERROR(-20000, 'To assist in error diagnosis, hard deletes are prohibited. Instead, please soft delete the intended record by setting active_ind to 0.'); 
END;
/
SHOW ERRORS;



--
-- DELETE_L_I_S_D  (Trigger) 
--
--  Dependencies: 
--   L_INSTALLATION_SUPPORTING_DB (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.DELETE_L_I_S_D BEFORE DELETE ON APPLICATION_MANAGER.L_INSTALLATION_SUPPORTING_DB 
FOR EACH ROW
BEGIN
	--Do not allow deletes.
	RAISE_APPLICATION_ERROR(-20000, 'To assist in error diagnosis, hard deletes are prohibited. Instead, please soft delete the intended record by setting active_ind to 0.'); 
END;
/
SHOW ERRORS;



--
-- DELETE_PRODUCT  (Trigger) 
--
--  Dependencies: 
--   PRODUCT (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.DELETE_PRODUCT BEFORE DELETE ON APPLICATION_MANAGER.PRODUCT 
FOR EACH ROW
BEGIN
	--Do not allow deletes.
	RAISE_APPLICATION_ERROR(-20000, 'To assist in error diagnosis, hard deletes are prohibited. Instead, please soft delete the intended record by setting active_ind to 0.'); 
END;
/
SHOW ERRORS;



--
-- DELETE_PRODUCT_VERSION  (Trigger) 
--
--  Dependencies: 
--   PRODUCT_VERSION (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.DELETE_Product_Version BEFORE DELETE ON Product_Version
FOR EACH ROW
BEGIN
	--Do not allow deletes.
	RAISE_APPLICATION_ERROR(-20000, 'The Product_Version table keeps an archive of different product versions and what date that version was/is active. Therefore, you may not delete Product_Version records. Instead, create a new record with the latest information.'); 
END;
/
SHOW ERRORS;



--
-- DELETE_REF_DATABASE_SERVER  (Trigger) 
--
--  Dependencies: 
--   REF_DATABASE_SERVER (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.DELETE_REF_Database_Server BEFORE DELETE ON REF_Database_Server
FOR EACH ROW
BEGIN
	--Do not allow deletes.
	RAISE_APPLICATION_ERROR(-20000, 'To assist in error diagnosis, hard deletes are prohibited. Instead, please soft delete the intended record by setting active_ind to 0.'); 
END;
/
SHOW ERRORS;



--
-- DELETE_REF_DATABASE_TYPE  (Trigger) 
--
--  Dependencies: 
--   REF_DATABASE_TYPE (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.DELETE_REF_Database_Type BEFORE DELETE ON REF_Database_Type
FOR EACH ROW
BEGIN
	--Do not allow deletes.
	RAISE_APPLICATION_ERROR(-20000, 'To assist in error diagnosis, hard deletes are prohibited. Instead, please soft delete the intended record by setting active_ind to 0.'); 
END;
/
SHOW ERRORS;



--
-- DELETE_REF_EMAIL_SERVER  (Trigger) 
--
--  Dependencies: 
--   REF_EMAIL_SERVER (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.DELETE_REF_Email_Server BEFORE DELETE ON REF_Email_Server
FOR EACH ROW
BEGIN
	--Do not allow deletes.
	RAISE_APPLICATION_ERROR(-20000, 'To assist in error diagnosis, hard deletes are prohibited. Instead, please soft delete the intended record by setting active_ind to 0.'); 
END;
/
SHOW ERRORS;



--
-- DELETE_REF_ENVIRONMENT  (Trigger) 
--
--  Dependencies: 
--   REF_ENVIRONMENT (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.DELETE_REF_Environment BEFORE DELETE ON REF_Environment
FOR EACH ROW
BEGIN
	--Do not allow deletes.
	RAISE_APPLICATION_ERROR(-20000, 'To assist in error diagnosis, hard deletes are prohibited. Instead, please soft delete the intended record by setting active_ind to 0.'); 
END;
/
SHOW ERRORS;



--
-- DELETE_REF_HOST_SERVER  (Trigger) 
--
--  Dependencies: 
--   REF_HOST_SERVER (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.DELETE_REF_Host_Server BEFORE DELETE ON REF_Host_Server
FOR EACH ROW
BEGIN
	--Do not allow deletes.
	RAISE_APPLICATION_ERROR(-20000, 'To assist in error diagnosis, hard deletes are prohibited. Instead, please soft delete the intended record by setting active_ind to 0.'); 
END;
/
SHOW ERRORS;



--
-- DELETE_REF_S_CONTACT_TYPE  (Trigger) 
--
--  Dependencies: 
--   REF_SUPPORT_CONTACT_TYPE (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.DELETE_REF_S_Contact_Type BEFORE DELETE ON REF_Support_Contact_Type
FOR EACH ROW
BEGIN
	--Do not allow deletes.
	RAISE_APPLICATION_ERROR(-20000, 'To assist in error diagnosis, hard deletes are prohibited. Instead, please soft delete the intended record by setting active_ind to 0.'); 
END;
/
SHOW ERRORS;



--
-- DELETE_SUPPORTING_DATABASE  (Trigger) 
--
--  Dependencies: 
--   SUPPORTING_DATABASE (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.DELETE_Supporting_Database BEFORE DELETE ON Supporting_Database
FOR EACH ROW
BEGIN
	--Do not allow deletes.
	RAISE_APPLICATION_ERROR(-20000, 'To assist in error diagnosis, hard deletes are prohibited. Instead, please soft delete the intended record by setting active_ind to 0.'); 
END;
/
SHOW ERRORS;



--
-- DELETE_SUPPORT_CONTACT_INFO  (Trigger) 
--
--  Dependencies: 
--   SUPPORT_CONTACT_INFO (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.DELETE_SUPPORT_CONTACT_INFO BEFORE DELETE ON APPLICATION_MANAGER.SUPPORT_CONTACT_INFO 
FOR EACH ROW
BEGIN
	--Do not allow deletes.
	RAISE_APPLICATION_ERROR(-20000, 'To assist in error diagnosis, hard deletes are prohibited. Instead, please soft delete the intended record by setting active_ind to 0.'); 
END;
/
SHOW ERRORS;



--
-- INS_CUSTOM_SETTING  (Trigger) 
--
--  Dependencies: 
--   CUSTOM_SETTING (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.INS_CUSTOM_SETTING BEFORE INSERT ON APPLICATION_MANAGER.CUSTOM_SETTING 
FOR EACH ROW
DECLARE
	v_redundancy_check Custom_Setting.custom_setting_id%TYPE;
BEGIN

	--trim name of new setting
	:new.setting_name := TRIM(:new.setting_name);
	
	--don't let user enter a record for a variable that starts with a number
	IF LENGTH(TRIM(TRANSLATE(LPAD(:new.setting_name,1), ' +-.0123456789',' '))) IS NULL THEN
		RAISE_APPLICATION_ERROR(-20000, 'ColdFusion does not allow variable names to begin with numbers, so the entry for ' || :new.setting_name || ' cannot be allowed.');
	END IF;

	--check to see if a variable by the same name already exists for the installation
	--SELECT COUNT(*) AS count1
	--INTO v_redundancy_check
	--FROM Custom_Setting
	--WHERE installation_id=:new.installation_id
	--	AND setting_name=:new.setting_name;

	--if the new variable already exists for this installation, throw an error telling the user to update the existing record rather than inserting a redundant record
	--IF v_redundancy_check!=0 THEN
	--	RAISE_APPLICATION_ERROR(-20000, 'This installation already has the variable ' || :new.setting_name || '. If necessary, please update the value of this record instead of creating a new, redundant, record.'); 
	--END IF;

	SELECT CUSTOM_SETTING_SEQ.nextval
	INTO :new.CUSTOM_SETTING_ID
	FROM dual;

	--disregard any date_created value supplied by user/query and substitute server's sysdate
	:new.date_created := sysdate;

	--Trigger a refresh of the relevant installation name
	sp_Refresh_Installation(
		p_installation_id => :new.installation_id,
		p_custom_setting_id => :new.custom_setting_id
	);
END;
/
SHOW ERRORS;



--
-- INS_INSTALLATION  (Trigger) 
--
--  Dependencies: 
--   INSTALLATION (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.INS_INSTALLATION BEFORE INSERT ON APPLICATION_MANAGER.INSTALLATION 
FOR EACH ROW
DECLARE
	--set primary keys of some supporting tables to variables
	v_application_name varchar2(4000);
	v_redundancy_check Installation.installation_id%TYPE;
BEGIN

	/*--check to see if a variable by the same name already exists for the installation
	SELECT COUNT(*) AS count1
	INTO v_redundancy_check
	FROM Installation
	WHERE url_to_base=:new.url_to_base;

	--if the new variable already exists for this installation, throw an error telling the user to update the existing record rather than inserting a redundant record
	IF v_redundancy_check!=0 THEN
		RAISE_APPLICATION_ERROR(-20000, 'An installation has already been linked to the url base ' || :new.url_to_base || '. Please check that you are entering the correct url, or update the existing record if necessary.'); 
	END IF;*/

	SELECT Installation_SEQ.nextval
	INTO :new.installation_id
	FROM dual;

	--smush all our variables together into v_application_name
	SELECT product_name || ':inst_' || :new.installation_id || '_date_' || to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') || 
		'_vers_0_env_' || :new.environment_id || '_host_' || :new.host_server_id || 
		'_email_' || :new.email_server_id || '_lc_0_ldb_0_cust_0' application_name
	INTO v_application_name
	FROM Product
	WHERE product_id=:new.product_id;

	--now disregard whatever value user supplied for application_name and instead substitute the value of v_application_name
	:new.application_name := v_application_name;

	--disregard the date_created value supplied by user/query and substitute server's sysdate
	:new.date_created := sysdate;

	-- Updates field (Last_Updated.last_updated) that tips applications to check if its installation settings may have been altered
	SP_UPDATE_LAST_UPDATED();
END;
/
SHOW ERRORS;



--
-- INS_INSTALLATION_URL  (Trigger) 
--
--  Dependencies: 
--   INSTALLATION_URL (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.INS_INSTALLATION_URL BEFORE INSERT ON APPLICATION_MANAGER.INSTALLATION_URL 
FOR EACH ROW
BEGIN
	SELECT INSTALLATION_URL_SEQ.nextval
	INTO :new.INSTALLATION_URL_ID
	FROM dual;
  
	SELECT sysdate
	INTO :new.date_created
	FROM Dual;

	-- Updates field (Last_Updated.last_updated) that tips applications to check if its installation settings may have been altered
	SP_UPDATE_LAST_UPDATED();
  
END;
/
SHOW ERRORS;



--
-- INS_L_I_S_C  (Trigger) 
--
--  Dependencies: 
--   L_INSTALLATION_SUPPORT_CONTACT (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.INS_L_I_S_C BEFORE INSERT ON APPLICATION_MANAGER.L_INSTALLATION_SUPPORT_CONTACT 
FOR EACH ROW
BEGIN
	SELECT L_I_S_C_SEQ.nextval
	INTO :new.l_i_s_c_id
	FROM dual;
	
	--disregard any date_created value supplied by user/query and substitute server's sysdate
	:new.date_created := sysdate;
	
	--Trigger a refresh of the relevant installation name
	sp_Refresh_Installation(
		p_installation_id => :new.installation_id,
		p_l_i_s_c_id => :new.l_i_s_c_id
	);
END;
/
SHOW ERRORS;



--
-- INS_L_I_S_D  (Trigger) 
--
--  Dependencies: 
--   L_INSTALLATION_SUPPORTING_DB (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.INS_L_I_S_D BEFORE INSERT ON L_Installation_Supporting_DB
FOR EACH ROW
BEGIN
	SELECT L_I_S_D_seq.nextval
	INTO :new.l_i_s_d_id
	FROM dual;
	
	--disregard any date_created value supplied by user/query and substitute server's sysdate
	:new.date_created := sysdate;
	
	--Trigger a refresh of the relevant installation name
	sp_Refresh_Installation(
		p_installation_id => :new.installation_id,
		p_l_i_s_d_id => :new.l_i_s_d_id
	);
END;
/
SHOW ERRORS;



--
-- INS_PRODUCT  (Trigger) 
--
--  Dependencies: 
--   PRODUCT (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.INS_PRODUCT BEFORE INSERT ON APPLICATION_MANAGER.PRODUCT 
FOR EACH ROW
BEGIN
  SELECT PRODUCT_SEQ.nextval
  INTO :new.PRODUCT_ID
  FROM dual;

  --disregard the date_created value supplied by user/query and substitute server's sysdate
  :new.date_created := sysdate;
END;
/
SHOW ERRORS;



--
-- INS_PRODUCT_VERSION  (Trigger) 
--
--  Dependencies: 
--   PRODUCT_VERSION (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.INS_PRODUCT_VERSION BEFORE INSERT ON APPLICATION_MANAGER.PRODUCT_VERSION 
FOR EACH ROW
BEGIN 
	SELECT PRODUCT_VERSION_SEQ.nextval
	INTO :new.PRODUCT_VERSION_ID
	FROM Dual;
	
	--disregard any date_created value supplied by user/query and substitute server's sysdate
	:new.date_created := sysdate;
	
	--Becase an installation can have only one product version at a time, 
	--disable all the old Product_Version records for the affected installation 
	--(but don't disable the new Product_Version record!).
	--UPDATE Product_Version
	--SET active_ind=0
	--WHERE installation_id=:new.installation_id
	--	AND product_version_id!=:new.product_version_id;
	
	--Trigger a refresh of the relevant installation name
	sp_Refresh_Installation(
		p_installation_id => :new.installation_id,
		p_product_version_id => :new.product_version_id
	);
END;
/
SHOW ERRORS;



--
-- INS_REF_DATABASE_SERVER  (Trigger) 
--
--  Dependencies: 
--   REF_DATABASE_SERVER (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.INS_REF_DATABASE_SERVER BEFORE INSERT ON APPLICATION_MANAGER.REF_DATABASE_SERVER 
FOR EACH ROW
BEGIN
  SELECT REF_DATABASE_SERVER_SEQ.nextval
  INTO :new.DATABASE_SERVER_ID
  FROM dual;
END;
/
SHOW ERRORS;



--
-- INS_REF_DATABASE_TYPE  (Trigger) 
--
--  Dependencies: 
--   REF_DATABASE_TYPE (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.INS_REF_DATABASE_TYPE BEFORE INSERT ON APPLICATION_MANAGER.REF_DATABASE_TYPE 
FOR EACH ROW
BEGIN
  SELECT REF_DATABASE_TYPE_SEQ.nextval
  INTO :new.DATABASE_TYPE_ID
  FROM dual;
END;
/
SHOW ERRORS;



--
-- INS_REF_EMAIL_SERVER  (Trigger) 
--
--  Dependencies: 
--   REF_EMAIL_SERVER (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.INS_REF_EMAIL_SERVER BEFORE INSERT ON APPLICATION_MANAGER.REF_EMAIL_SERVER 
FOR EACH ROW
BEGIN
  SELECT REF_EMAIL_SERVER_SEQ.nextval
  INTO :new.EMAIL_SERVER_ID
  FROM dual;
END;
/
SHOW ERRORS;



--
-- INS_REF_ENVIRONMENT  (Trigger) 
--
--  Dependencies: 
--   REF_ENVIRONMENT (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.INS_REF_ENVIRONMENT BEFORE INSERT ON APPLICATION_MANAGER.REF_ENVIRONMENT 
FOR EACH ROW
BEGIN
  SELECT REF_ENVIRONMENT_SEQ.nextval
  INTO :new.ENVIRONMENT_ID
  FROM dual;
END;
/
SHOW ERRORS;



--
-- INS_REF_HOST_SERVER  (Trigger) 
--
--  Dependencies: 
--   REF_HOST_SERVER (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.INS_REF_HOST_SERVER BEFORE INSERT ON APPLICATION_MANAGER.REF_HOST_SERVER 
FOR EACH ROW
BEGIN
  SELECT REF_HOST_SERVER_SEQ.nextval
  INTO :new.HOST_SERVER_ID
  FROM dual;
END;
/
SHOW ERRORS;



--
-- INS_REF_SUPPORT_CONTACT_TYPE  (Trigger) 
--
--  Dependencies: 
--   REF_SUPPORT_CONTACT_TYPE (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.INS_REF_SUPPORT_CONTACT_TYPE BEFORE INSERT ON APPLICATION_MANAGER.REF_SUPPORT_CONTACT_TYPE 
FOR EACH ROW
BEGIN
  SELECT REF_SUPPORT_CONTACT_TYPE_SEQ.nextval
  INTO :new.SUPPORT_CONTACT_TYPE_ID
  FROM dual;
END;
/
SHOW ERRORS;



--
-- INS_SORTER  (Trigger) 
--
--  Dependencies: 
--   SORTER (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.INS_SORTER BEFORE INSERT ON APPLICATION_MANAGER.SORTER 
FOR EACH ROW
BEGIN
  SELECT SORTER_SEQ.nextval
  INTO :new.SORTER_ID
  FROM dual;
END;
/
SHOW ERRORS;



--
-- INS_SUPPORTING_DATABASE  (Trigger) 
--
--  Dependencies: 
--   SUPPORTING_DATABASE (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.INS_SUPPORTING_DATABASE BEFORE INSERT ON APPLICATION_MANAGER.SUPPORTING_DATABASE 
FOR EACH ROW
BEGIN
  SELECT SUPPORTING_DATABASE_SEQ.nextval
  INTO :new.SUPPORTING_DATABASE_ID
  FROM dual; 

  --disregard the date_created value supplied by user/query and substitute server's sysdate
  :new.date_created := sysdate;
END;
/
SHOW ERRORS;



--
-- INS_SUPPORT_CONTACT_INFO  (Trigger) 
--
--  Dependencies: 
--   SUPPORT_CONTACT_INFO (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.INS_SUPPORT_CONTACT_INFO BEFORE INSERT ON APPLICATION_MANAGER.SUPPORT_CONTACT_INFO FOR EACH ROW
BEGIN
	SELECT SUPPORT_CONTACT_INFO_SEQ.nextval
	INTO :new.support_contact_info_id
	FROM dual; 

	--disregard the date_created value supplied by user/query and substitute server's sysdate
	:new.date_created := sysdate;
END;
/
SHOW ERRORS;



--
-- UPDATE_CUSTOM_SETTING  (Trigger) 
--
--  Dependencies: 
--   CUSTOM_SETTING (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.UPDATE_CUSTOM_SETTING AFTER UPDATE ON APPLICATION_MANAGER.CUSTOM_SETTING 
FOR EACH ROW
BEGIN
	--Trigger a refresh of the new record's corresponding installation name
	sp_Refresh_Installation(
		p_installation_id => :new.installation_id,
		p_custom_setting_id => :new.custom_setting_id
	);

	--In the event that a record's installation_id is updated, trigger a 
	--refresh of the old record's corresponding installation name.
	--So this happens only if :old.installation_id is not the same as :new.installation_id
	IF :old.installation_id!=:new.installation_id THEN
		sp_Refresh_Installation(
			p_installation_id => :old.installation_id,
			p_custom_setting_id => :new.custom_setting_id
		);
	END IF;
END;
/
SHOW ERRORS;



--
-- UPDATE_INSTALLATION  (Trigger) 
--
--  Dependencies: 
--   INSTALLATION (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.UPDATE_INSTALLATION BEFORE UPDATE ON APPLICATION_MANAGER.INSTALLATION 
FOR EACH ROW
DECLARE
	--set primary keys of some supporting tables to variables
	v_application_name varchar2(4000);
	v_product_version_id varchar2(4000);
	v_l_i_s_c_id varchar2(4000);
	v_l_i_s_d_id varchar2(4000);
	v_custom_setting_id varchar2(4000);
BEGIN

	IF :new.application_name NOT LIKE '%_env_%' OR :new.active_ind!=:old.active_ind OR :new.error_handling_enabled_ind!=:old.error_handling_enabled_ind OR :new.email_server_id!=:old.email_server_id THEN
		--set primary keys of some supporting tables to variables
		SELECT COUNT(*) AS count1
		INTO v_product_version_id
		FROM Product_Version
		WHERE active_ind=1
			AND installation_id=:new.installation_id;
	
		SELECT COUNT(*) AS count1
		INTO v_l_i_s_c_id
		FROM L_Installation_Support_Contact
		WHERE active_ind=1
			AND installation_id=:new.installation_id;
	
		SELECT COUNT(*) AS count1
		INTO v_l_i_s_d_id
		FROM L_Installation_Supporting_DB
		WHERE active_ind=1
			AND installation_id=:new.installation_id;
	
		SELECT COUNT(*) AS count1
		INTO v_custom_setting_id
		FROM Custom_Setting
		WHERE Custom_Setting.active_ind=1
			AND installation_id=:new.installation_id;

		--set primary keys of some supporting tables to variables
		IF v_product_version_id!=0 THEN 
			SELECT MAX(product_version_id) product_version_id
			INTO v_product_version_id
			FROM Product_Version
			WHERE active_ind=1
				AND installation_id=:new.installation_id
			GROUP BY installation_id;
		END IF;
		
		IF v_l_i_s_c_id!=0 THEN 
			SELECT MAX(l_i_s_c_id) l_i_s_c_id
			INTO v_l_i_s_c_id
			FROM L_Installation_Support_Contact
			WHERE active_ind=1
				AND installation_id=:new.installation_id
			GROUP BY installation_id;
		END IF;
		
		IF v_l_i_s_d_id!=0 THEN 
			SELECT MAX(l_i_s_d_id) l_i_s_d_id
			INTO v_l_i_s_d_id
			FROM L_Installation_Supporting_DB
			WHERE active_ind=1
				AND installation_id=:new.installation_id
			GROUP BY installation_id;
		END IF;
		
		IF v_custom_setting_id!=0 THEN 
			SELECT MAX(custom_setting_id) AS custom_setting_id
			INTO v_custom_setting_id
			FROM Custom_Setting
			WHERE Custom_Setting.active_ind=1
				AND installation_id=:new.installation_id
			GROUP BY installation_id;
		END IF;
	
		--smush all our variables together into v_application_name
		SELECT product_name || ':inst_' || :new.installation_id || '_date_' || to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') || 
			'_vers_' || v_product_version_id || '_env_' || :new.environment_id || '_host_' || :new.host_server_id || 
			'_email_' || :new.email_server_id || '_lc_' || v_l_i_s_c_id || '_ldb_' || v_l_i_s_d_id || 
			'_cust_' || v_custom_setting_id application_name
		INTO v_application_name
		FROM Product
		WHERE product_id=:new.product_id;

		--now disregard whatever value user supplied for application_name and instead substitute the value of v_application_name
		:new.application_name := v_application_name;
	END IF;
	
	--disregard the date_updated value supplied by user/query and substitute server's sysdate
	:new.date_updated := sysdate;

	-- Updates field (Last_Updated.last_updated) that tips applications to check if its installation settings may have been altered
	SP_UPDATE_LAST_UPDATED();
END;
/
SHOW ERRORS;



--
-- UPDATE_INSTALLATION_URL  (Trigger) 
--
--  Dependencies: 
--   INSTALLATION_URL (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.UPDATE_INSTALLATION_URL BEFORE UPDATE ON APPLICATION_MANAGER.INSTALLATION_URL 
FOR EACH ROW
BEGIN
	SELECT sysdate
	INTO :new.date_updated
	FROM Dual;

	-- Updates field (Last_Updated.last_updated) that tips applications to check if its installation settings may have been altered
	SP_UPDATE_LAST_UPDATED();
END;
/
SHOW ERRORS;



--
-- UPDATE_L_I_S_C  (Trigger) 
--
--  Dependencies: 
--   L_INSTALLATION_SUPPORT_CONTACT (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.UPDATE_L_I_S_C AFTER UPDATE ON APPLICATION_MANAGER.L_INSTALLATION_SUPPORT_CONTACT 
FOR EACH ROW
BEGIN
	--Trigger a refresh of the new record's corresponding installation name
	sp_Refresh_Installation(
		p_installation_id => :new.installation_id,
		p_l_i_s_c_id => :new.l_i_s_c_id
	);

	--In the event that a record's installation_id is updated, trigger a 
	--refresh of the old record's corresponding installation name.
	--So this happens only if :old.installation_id is not the same as :new.installation_id
	IF :old.installation_id!=:new.installation_id THEN
		sp_Refresh_Installation(
			p_installation_id => :old.installation_id,
			p_l_i_s_c_id => :new.l_i_s_c_id
		);
	END IF;
END;
/
SHOW ERRORS;



--
-- UPDATE_L_I_S_D  (Trigger) 
--
--  Dependencies: 
--   L_INSTALLATION_SUPPORTING_DB (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.UPDATE_L_I_S_D AFTER UPDATE ON APPLICATION_MANAGER.L_INSTALLATION_SUPPORTING_DB 
FOR EACH ROW
BEGIN
	--Trigger a refresh of the new record's corresponding installation name
	sp_Refresh_Installation(
		p_installation_id => :new.installation_id,
		p_l_i_s_d_id => :new.l_i_s_d_id
	);

	--In the event that a record's installation_id is updated, trigger a 
	--refresh of the old record's corresponding installation name.
	--So this happens only if :old.installation_id is not the same as :new.installation_id
	IF :old.installation_id!=:new.installation_id THEN
		sp_Refresh_Installation(
			p_installation_id => :old.installation_id,
			p_l_i_s_d_id => :new.l_i_s_d_id
		);
	END IF;
END;
/
SHOW ERRORS;



--
-- UPDATE_PRODUCT  (Trigger) 
--
--  Dependencies: 
--   PRODUCT (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.UPDATE_PRODUCT BEFORE UPDATE ON APPLICATION_MANAGER.PRODUCT 
FOR EACH ROW
BEGIN
	-- Updates field (Last_Updated.last_updated) that tips applications to check if its installation settings may have been altered
	SP_UPDATE_LAST_UPDATED();
        
END;
/
SHOW ERRORS;



--
-- UPDATE_PRODUCT_VERSION  (Trigger) 
--
--  Dependencies: 
--   PRODUCT_VERSION (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.UPDATE_Product_Version BEFORE UPDATE ON Product_Version
FOR EACH ROW
BEGIN
	--if the user is attempting to update any column except active_ind, let's give them a piece of our mind 
	IF :new.installation_id!= :old.installation_id OR :new.product_release_version!= :old.product_release_version OR :new.subversion_release_version!= :old.subversion_release_version OR :new.date_created!= :old.date_created THEN
		RAISE_APPLICATION_ERROR(-20000, 'The Product_Version table keeps an archive of different product versions and what date that version was/is active. Therefore, you may not update Product_Version except to deactivate an old record.'); 
	END IF;
END;
/
SHOW ERRORS;



--
-- UPDATE_REF_EMAIL_SERVER  (Trigger) 
--
--  Dependencies: 
--   REF_EMAIL_SERVER (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.UPDATE_REF_EMAIL_SERVER AFTER UPDATE ON APPLICATION_MANAGER.REF_EMAIL_SERVER 
FOR EACH ROW
BEGIN
  
  --Trigger a refresh of the relevant installation name
  sp_Refresh_by_email_server_id(:new.email_server_id);
END;
/
SHOW ERRORS;



--
-- UPDATE_REF_ENVIRONMENT  (Trigger) 
--
--  Dependencies: 
--   REF_ENVIRONMENT (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.UPDATE_REF_Environment AFTER UPDATE ON REF_Environment
FOR EACH ROW
BEGIN
  
  --Trigger a refresh of the relevant installation name
  sp_Refresh_by_environment_id(:new.environment_id);
END;
/
SHOW ERRORS;



--
-- UPDATE_REF_HOST_SERVER  (Trigger) 
--
--  Dependencies: 
--   REF_HOST_SERVER (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER.UPDATE_REF_Host_Server AFTER UPDATE ON REF_Host_Server
FOR EACH ROW
BEGIN
  
  --Trigger a refresh of the relevant installation name
  sp_Refresh_by_host_server_id(:new.host_server_id);
END;
/
SHOW ERRORS;



--
-- INS_ERROR_LOG  (Trigger) 
--
--  Dependencies: 
--   ERROR_LOG (Table)
--
CREATE OR REPLACE TRIGGER APPLICATION_MANAGER."INS_ERROR_LOG" 
 BEFORE INSERT ON APPLICATION_MANAGER.ERROR_LOG 
FOR EACH ROW
BEGIN
  SELECT ERROR_LOG_SEQ.nextval
  INTO :new.ERROR_LOG_ID
  FROM dual;

  --disregard the error_sql_datetime value supplied by user/query and substitute server's sysdate
  :new.error_sql_datetime := sysdate;
END;
/
SHOW ERRORS;



-- 
-- Non Foreign Key Constraints for Table CUSTOM_SETTING 
-- 
ALTER TABLE APPLICATION_MANAGER.CUSTOM_SETTING ADD (
  CONSTRAINT CUSTOM_SETTING_PK PRIMARY KEY (CUSTOM_SETTING_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


-- 
-- Non Foreign Key Constraints for Table ERROR_LOG 
-- 
ALTER TABLE APPLICATION_MANAGER.ERROR_LOG ADD (
  CONSTRAINT ERROR_LOG_PK PRIMARY KEY (ERROR_LOG_ID)
    USING INDEX 
    TABLESPACE USER2
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
                FREELISTS        1
                FREELIST GROUPS  1
               ));


-- 
-- Non Foreign Key Constraints for Table INSTALLATION 
-- 
ALTER TABLE APPLICATION_MANAGER.INSTALLATION ADD (
  CONSTRAINT INSTALLATION_PK PRIMARY KEY (INSTALLATION_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


-- 
-- Non Foreign Key Constraints for Table INSTALLATION_URL 
-- 
ALTER TABLE APPLICATION_MANAGER.INSTALLATION_URL ADD (
  CONSTRAINT INSTALLATION_URL_PK PRIMARY KEY (INSTALLATION_URL_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));

ALTER TABLE APPLICATION_MANAGER.INSTALLATION_URL ADD (
  CONSTRAINT INSTALLATION_URL_UK1 UNIQUE (URL_TO_BASE)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


-- 
-- Non Foreign Key Constraints for Table L_INSTALLATION_SUPPORTING_DB 
-- 
ALTER TABLE APPLICATION_MANAGER.L_INSTALLATION_SUPPORTING_DB ADD (
  CONSTRAINT L_INSTALLATION_SUPPORTING_PK PRIMARY KEY (L_I_S_D_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


-- 
-- Non Foreign Key Constraints for Table L_INSTALLATION_SUPPORT_CONTACT 
-- 
ALTER TABLE APPLICATION_MANAGER.L_INSTALLATION_SUPPORT_CONTACT ADD (
  CONSTRAINT L_INSTALLATION_SUPPORT_CO_PK PRIMARY KEY (L_I_S_C_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


-- 
-- Non Foreign Key Constraints for Table PRODUCT 
-- 
ALTER TABLE APPLICATION_MANAGER.PRODUCT ADD (
  CONSTRAINT PRODUCT_PK PRIMARY KEY (PRODUCT_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


-- 
-- Non Foreign Key Constraints for Table PRODUCT_VERSION 
-- 
ALTER TABLE APPLICATION_MANAGER.PRODUCT_VERSION ADD (
  CONSTRAINT PRODUCT_VERSION_PK PRIMARY KEY (PRODUCT_VERSION_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


-- 
-- Non Foreign Key Constraints for Table REF_DATABASE_SERVER 
-- 
ALTER TABLE APPLICATION_MANAGER.REF_DATABASE_SERVER ADD (
  CONSTRAINT REF_DATABASE_SERVER_PK PRIMARY KEY (DATABASE_SERVER_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


-- 
-- Non Foreign Key Constraints for Table REF_DATABASE_TYPE 
-- 
ALTER TABLE APPLICATION_MANAGER.REF_DATABASE_TYPE ADD (
  CONSTRAINT REF_DATABASE_TYPE_PK PRIMARY KEY (DATABASE_TYPE_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


-- 
-- Non Foreign Key Constraints for Table REF_EMAIL_SERVER 
-- 
ALTER TABLE APPLICATION_MANAGER.REF_EMAIL_SERVER ADD (
  CONSTRAINT REF_EMAIL_SERVER_PK PRIMARY KEY (EMAIL_SERVER_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


-- 
-- Non Foreign Key Constraints for Table REF_ENVIRONMENT 
-- 
ALTER TABLE APPLICATION_MANAGER.REF_ENVIRONMENT ADD (
  CONSTRAINT REF_ENVIRONMENT_PK PRIMARY KEY (ENVIRONMENT_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


-- 
-- Non Foreign Key Constraints for Table REF_HOST_SERVER 
-- 
ALTER TABLE APPLICATION_MANAGER.REF_HOST_SERVER ADD (
  CONSTRAINT REF_HOST_SERVER_PK PRIMARY KEY (HOST_SERVER_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


-- 
-- Non Foreign Key Constraints for Table REF_SUPPORT_CONTACT_TYPE 
-- 
ALTER TABLE APPLICATION_MANAGER.REF_SUPPORT_CONTACT_TYPE ADD (
  CONSTRAINT REF_SUPPORT_CONTACT_TYPE_PK PRIMARY KEY (SUPPORT_CONTACT_TYPE_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


-- 
-- Non Foreign Key Constraints for Table SORTER 
-- 
ALTER TABLE APPLICATION_MANAGER.SORTER ADD (
  CONSTRAINT SORTER_PK PRIMARY KEY (SORTER_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


-- 
-- Non Foreign Key Constraints for Table SUPPORTING_DATABASE 
-- 
ALTER TABLE APPLICATION_MANAGER.SUPPORTING_DATABASE ADD (
  CONSTRAINT SUPPORTING_DATABASE_PK PRIMARY KEY (SUPPORTING_DATABASE_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


-- 
-- Non Foreign Key Constraints for Table SUPPORT_CONTACT_INFO 
-- 
ALTER TABLE APPLICATION_MANAGER.SUPPORT_CONTACT_INFO ADD (
  CONSTRAINT SUPPORT_CONTACT_INFO_PK PRIMARY KEY (SUPPORT_CONTACT_INFO_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


-- 
-- Foreign Key Constraints for Table CUSTOM_SETTING 
-- 
ALTER TABLE APPLICATION_MANAGER.CUSTOM_SETTING ADD (
  CONSTRAINT CUSTOM_SETTING_INSTALLATI_FK1 FOREIGN KEY (INSTALLATION_ID) 
    REFERENCES APPLICATION_MANAGER.INSTALLATION (INSTALLATION_ID));


-- 
-- Foreign Key Constraints for Table ERROR_LOG 
-- 
ALTER TABLE APPLICATION_MANAGER.ERROR_LOG ADD (
  CONSTRAINT ERROR_LOG_INSTALLATION_FK1 FOREIGN KEY (INSTALLATION_ID) 
    REFERENCES APPLICATION_MANAGER.INSTALLATION (INSTALLATION_ID));


-- 
-- Foreign Key Constraints for Table INSTALLATION 
-- 
ALTER TABLE APPLICATION_MANAGER.INSTALLATION ADD (
  CONSTRAINT INSTALLATION_PRODUCT_FK1 FOREIGN KEY (PRODUCT_ID) 
    REFERENCES APPLICATION_MANAGER.PRODUCT (PRODUCT_ID));

ALTER TABLE APPLICATION_MANAGER.INSTALLATION ADD (
  CONSTRAINT INSTALLATION_REF_EMAIL_SE_FK1 FOREIGN KEY (EMAIL_SERVER_ID) 
    REFERENCES APPLICATION_MANAGER.REF_EMAIL_SERVER (EMAIL_SERVER_ID));

ALTER TABLE APPLICATION_MANAGER.INSTALLATION ADD (
  CONSTRAINT INSTALLATION_REF_ENVIRONM_FK1 FOREIGN KEY (ENVIRONMENT_ID) 
    REFERENCES APPLICATION_MANAGER.REF_ENVIRONMENT (ENVIRONMENT_ID));

ALTER TABLE APPLICATION_MANAGER.INSTALLATION ADD (
  CONSTRAINT INSTALLATION_REF_HOST_SER_FK1 FOREIGN KEY (HOST_SERVER_ID) 
    REFERENCES APPLICATION_MANAGER.REF_HOST_SERVER (HOST_SERVER_ID));


-- 
-- Foreign Key Constraints for Table INSTALLATION_URL 
-- 
ALTER TABLE APPLICATION_MANAGER.INSTALLATION_URL ADD (
  CONSTRAINT INSTALLATION_URL_INSTALLA_FK1 FOREIGN KEY (INSTALLATION_ID) 
    REFERENCES APPLICATION_MANAGER.INSTALLATION (INSTALLATION_ID));


-- 
-- Foreign Key Constraints for Table L_INSTALLATION_SUPPORTING_DB 
-- 
ALTER TABLE APPLICATION_MANAGER.L_INSTALLATION_SUPPORTING_DB ADD (
  CONSTRAINT L_INSTALLATION_SUPPORTING_FK1 FOREIGN KEY (INSTALLATION_ID) 
    REFERENCES APPLICATION_MANAGER.INSTALLATION (INSTALLATION_ID));

ALTER TABLE APPLICATION_MANAGER.L_INSTALLATION_SUPPORTING_DB ADD (
  CONSTRAINT L_INSTALLATION_SUPPORTING_FK2 FOREIGN KEY (DATABASE_SERVER_ID) 
    REFERENCES APPLICATION_MANAGER.REF_DATABASE_SERVER (DATABASE_SERVER_ID));

ALTER TABLE APPLICATION_MANAGER.L_INSTALLATION_SUPPORTING_DB ADD (
  CONSTRAINT L_INSTALLATION_SUPPORTING_FK3 FOREIGN KEY (SUPPORTING_DATABASE_ID) 
    REFERENCES APPLICATION_MANAGER.SUPPORTING_DATABASE (SUPPORTING_DATABASE_ID));


-- 
-- Foreign Key Constraints for Table L_INSTALLATION_SUPPORT_CONTACT 
-- 
ALTER TABLE APPLICATION_MANAGER.L_INSTALLATION_SUPPORT_CONTACT ADD (
  CONSTRAINT L_INSTALLATION_SUPPORT_CO_FK1 FOREIGN KEY (INSTALLATION_ID) 
    REFERENCES APPLICATION_MANAGER.INSTALLATION (INSTALLATION_ID));

ALTER TABLE APPLICATION_MANAGER.L_INSTALLATION_SUPPORT_CONTACT ADD (
  CONSTRAINT L_INSTALLATION_SUPPORT_CO_FK2 FOREIGN KEY (SUPPORT_CONTACT_INFO_ID) 
    REFERENCES APPLICATION_MANAGER.SUPPORT_CONTACT_INFO (SUPPORT_CONTACT_INFO_ID));


-- 
-- Foreign Key Constraints for Table PRODUCT_VERSION 
-- 
ALTER TABLE APPLICATION_MANAGER.PRODUCT_VERSION ADD (
  CONSTRAINT PRODUCT_VERSION_INSTALLAT_FK1 FOREIGN KEY (INSTALLATION_ID) 
    REFERENCES APPLICATION_MANAGER.INSTALLATION (INSTALLATION_ID));


-- 
-- Foreign Key Constraints for Table SUPPORT_CONTACT_INFO 
-- 
ALTER TABLE APPLICATION_MANAGER.SUPPORT_CONTACT_INFO ADD (
  CONSTRAINT SUPPORT_CONTACT_INFO_REF__FK1 FOREIGN KEY (SUPPORT_CONTACT_TYPE_ID) 
    REFERENCES APPLICATION_MANAGER.REF_SUPPORT_CONTACT_TYPE (SUPPORT_CONTACT_TYPE_ID));



