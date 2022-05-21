create table COUNTRY
(
    ID     NUMBER(38)    not null
        constraint PK_COUNTRY
            primary key,
    NAME   VARCHAR2(250) not null,
    CODE   VARCHAR2(110),
    ACTIVE NUMBER(1)
)
/

comment on table COUNTRY is 'Keeps Country Information'
/

comment on column COUNTRY.NAME is 'Country name'
/

comment on column COUNTRY.CODE is 'Country Code'
/

comment on column COUNTRY.ACTIVE is 'true is active false is pasive'
/

INSERT INTO COUNTRY (ID, NAME, CODE, ACTIVE) VALUES (1, 'Turkey', '+90', 1);
INSERT INTO COUNTRY (ID, NAME, CODE, ACTIVE) VALUES (2, 'UK', '+44', 1);
INSERT INTO COUNTRY (ID, NAME, CODE, ACTIVE) VALUES (3, 'Germany', '+32', 1);
INSERT INTO COUNTRY (ID, NAME, CODE, ACTIVE) VALUES (4, 'Holland', '+23', 1);
INSERT INTO COUNTRY (ID, NAME, CODE, ACTIVE) VALUES (5, 'Albenia', '+421', 1);
INSERT INTO COUNTRY (ID, NAME, CODE, ACTIVE) VALUES (6, 'Canada', '+14', 1);
INSERT INTO COUNTRY (ID, NAME, CODE, ACTIVE) VALUES (7, 'USA', '+1', 1);
INSERT INTO COUNTRY (ID, NAME, CODE, ACTIVE) VALUES (8, 'France', '+29', 1);
INSERT INTO COUNTRY (ID, NAME, CODE, ACTIVE) VALUES (9, 'China', '+13', 1);
INSERT INTO COUNTRY (ID, NAME, CODE, ACTIVE) VALUES (11, 'Japan', '+31', 1);
/
create table REGION
(
    ID         NUMBER(38)    not null
        constraint PK_REGION
            primary key,
    NAME       VARCHAR2(250) not null,
    CODE       VARCHAR2(110),
    ACTIVE     NUMBER(1),
    COUNTRY_ID NUMBER(38)
        constraint FK_REGION__COUNTRY_ID
            references COUNTRY
)
/

comment on table REGION is 'Keeps Region Information'
/

comment on column REGION.NAME is 'Region name'
/

comment on column REGION.CODE is 'Region code'
/

comment on column REGION.ACTIVE is 'true is active false is pasive'
/

INSERT INTO REGION (ID, NAME, CODE, ACTIVE, COUNTRY_ID) VALUES (1, 'Vospoiqua', 'SE6', 1, 2);
INSERT INTO REGION (ID, NAME, CODE, ACTIVE, COUNTRY_ID) VALUES (2, 'Bothiusal', 'CH5', 1, 3);
INSERT INTO REGION (ID, NAME, CODE, ACTIVE, COUNTRY_ID) VALUES (3, 'Luwhijan', 'ST5', 1, 4);
INSERT INTO REGION (ID, NAME, CODE, ACTIVE, COUNTRY_ID) VALUES (4, 'Iaprijan', 'CV23', 1, 5);
INSERT INTO REGION (ID, NAME, CODE, ACTIVE, COUNTRY_ID) VALUES (5, 'Cleacor', 'LE7 ', 1, 1);
INSERT INTO REGION (ID, NAME, CODE, ACTIVE, COUNTRY_ID) VALUES (6, 'Spayye', 'HA6 ', 1, 2);
INSERT INTO REGION (ID, NAME, CODE, ACTIVE, COUNTRY_ID) VALUES (7, 'Cambridgeshire', 'JA7', 1, 1);
INSERT INTO REGION (ID, NAME, CODE, ACTIVE, COUNTRY_ID) VALUES (8, 'Oskos', 'LL59 ', 1, 2);
INSERT INTO REGION (ID, NAME, CODE, ACTIVE, COUNTRY_ID) VALUES (9, 'Utryae', 'TS27 ', 1, 3);
INSERT INTO REGION (ID, NAME, CODE, ACTIVE, COUNTRY_ID) VALUES (11, 'Gleik Frye', 'BN25 ', 1, 4);
/
create table CITY
(
    ID         NUMBER(38)    not null
        constraint PK_CITY
            primary key,
    NAME       VARCHAR2(250) not null,
    PLATE_CODE VARCHAR2(50),
    ACTIVE     NUMBER(1),
    COUNTRY_ID NUMBER(38)
        constraint FK_CITY__COUNTRY_ID
            references COUNTRY,
    REGION_ID  NUMBER(38)
        constraint FK_CITY__REGION_ID
            references REGION
)
/

comment on table CITY is 'Keeps City Information'
/

comment on column CITY.NAME is 'City name'
/

comment on column CITY.PLATE_CODE is 'City Plate Code'
/

comment on column CITY.ACTIVE is 'true is active false is pasive'
/

INSERT INTO CITY (ID, NAME, PLATE_CODE, ACTIVE, COUNTRY_ID, REGION_ID) VALUES (1, 'Eqrisstin', 'GHC6091', 1, 2, 4);
INSERT INTO CITY (ID, NAME, PLATE_CODE, ACTIVE, COUNTRY_ID, REGION_ID) VALUES (2, 'Crobert', '7RX771', 1, 3, 3);
INSERT INTO CITY (ID, NAME, PLATE_CODE, ACTIVE, COUNTRY_ID, REGION_ID) VALUES (3, 'Ekhertin', 'KVF0429', 1, 4, 2);
INSERT INTO CITY (ID, NAME, PLATE_CODE, ACTIVE, COUNTRY_ID, REGION_ID) VALUES (4, 'Huunbridge', 'G50HKS', 0, 5, 1);
INSERT INTO CITY (ID, NAME, PLATE_CODE, ACTIVE, COUNTRY_ID, REGION_ID) VALUES (5, 'Zrose', '7FPS290', 1, 4, 9);
INSERT INTO CITY (ID, NAME, PLATE_CODE, ACTIVE, COUNTRY_ID, REGION_ID) VALUES (6, 'Aklita', '6AWK668', 0, 3, 8);
INSERT INTO CITY (ID, NAME, PLATE_CODE, ACTIVE, COUNTRY_ID, REGION_ID) VALUES (7, 'Uzlerton', 'BB8927', 0, 5, 7);
INSERT INTO CITY (ID, NAME, PLATE_CODE, ACTIVE, COUNTRY_ID, REGION_ID) VALUES (8, 'Egowood', 'AJC9434', 0, 6, 6);
INSERT INTO CITY (ID, NAME, PLATE_CODE, ACTIVE, COUNTRY_ID, REGION_ID) VALUES (9, 'Olkron', '244EJD', 1, 7, 4);
INSERT INTO CITY (ID, NAME, PLATE_CODE, ACTIVE, COUNTRY_ID, REGION_ID) VALUES (11, 'Pheims', 'CHT2727', 1, 8, 3);
/
create table DISTRICT
(
    ID      NUMBER(38)    not null
        constraint PK_DISTRICT
            primary key,
    NAME    VARCHAR2(250) not null,
    ACTIVE  NUMBER(1),
    CITY_ID NUMBER(38)
        constraint FK_DISTRICT__CITY_ID
            references CITY
)
/

comment on table DISTRICT is 'Keeps District Information'
/

comment on column DISTRICT.NAME is 'District name'
/

comment on column DISTRICT.ACTIVE is 'true is active false is pasive'
/

INSERT INTO DISTRICT (ID, NAME, ACTIVE, CITY_ID) VALUES (1, 'Thraic Acre', 1, null);
INSERT INTO DISTRICT (ID, NAME, ACTIVE, CITY_ID) VALUES (2, 'East Meost', 1, null);
INSERT INTO DISTRICT (ID, NAME, ACTIVE, CITY_ID) VALUES (3, 'Hulzad Bazaar', 1, null);
INSERT INTO DISTRICT (ID, NAME, ACTIVE, CITY_ID) VALUES (4, 'Lower West Pudgest', 1, null);
INSERT INTO DISTRICT (ID, NAME, ACTIVE, CITY_ID) VALUES (5, 'Upper East Sneris', 1, null);
INSERT INTO DISTRICT (ID, NAME, ACTIVE, CITY_ID) VALUES (6, 'Lower Yoffeb', 1, null);
INSERT INTO DISTRICT (ID, NAME, ACTIVE, CITY_ID) VALUES (7, 'Upper West Nuffat', 1, null);
INSERT INTO DISTRICT (ID, NAME, ACTIVE, CITY_ID) VALUES (8, 'Upper North Buppac', 1, null);
INSERT INTO DISTRICT (ID, NAME, ACTIVE, CITY_ID) VALUES (9, 'Drianittialf West', 1, null);
INSERT INTO DISTRICT (ID, NAME, ACTIVE, CITY_ID) VALUES (11, 'Malleakweol Square', 1, null);
/
create table ADDRESS1
(
    ID           NUMBER(38) not null
        constraint PK_ADDRESS1
            primary key,
    ADDRESS1_LINE VARCHAR2(4000),
    COUNTRY_ID   NUMBER(38)
        constraint FK_ADDRESS1__COUNTRY_ID
            references COUNTRY,
    CITY_ID      NUMBER(38)
        constraint FK_ADDRESS1__CITY_ID
            references CITY,
    DISTRICT_ID  NUMBER(38)
        constraint FK_ADDRESS1__DISTRICT_ID
            references DISTRICT
)
/

comment on table ADDRESS1 is 'Keeps ADDRESS1 Information'
/

comment on column ADDRESS1.ADDRESS1_LINE is 'Detailed ADDRESS1 Description'
/

INSERT INTO ADDRESS1 (ID, ADDRESS1_LINE, COUNTRY_ID, CITY_ID, DISTRICT_ID) VALUES (1, '"2 Orchardleigh Avenue, Enfield",EN3 5BE', 1, 2, 6);
INSERT INTO ADDRESS1 (ID, ADDRESS1_LINE, COUNTRY_ID, CITY_ID, DISTRICT_ID) VALUES (2, '"4 Sellwood Drive, Barnet",EN5 2RJ', 2, 3, 4);
INSERT INTO ADDRESS1 (ID, ADDRESS1_LINE, COUNTRY_ID, CITY_ID, DISTRICT_ID) VALUES (3, '"32 Upshire Road, Waltham Abbey",EN9 3NR', 2, 3, 4);
INSERT INTO ADDRESS1 (ID, ADDRESS1_LINE, COUNTRY_ID, CITY_ID, DISTRICT_ID) VALUES (4, '"17 Bridle Close, Hoddesdon",EN11 9QA', 1, 2, 5);
INSERT INTO ADDRESS1 (ID, ADDRESS1_LINE, COUNTRY_ID, CITY_ID, DISTRICT_ID) VALUES (5, '"21 Brampton Close, Cheshunt",EN7 6HZ', 1, 4, 6);
INSERT INTO ADDRESS1 (ID, ADDRESS1_LINE, COUNTRY_ID, CITY_ID, DISTRICT_ID) VALUES (6, '"60 Theobalds Lane, Waltham Cross",EN8 8RS', 3, 2, 1);
INSERT INTO ADDRESS1 (ID, ADDRESS1_LINE, COUNTRY_ID, CITY_ID, DISTRICT_ID) VALUES (7, '"6 St Marys Court, Potters Bar",EN6 1ST', 2, 2, 4);
INSERT INTO ADDRESS1 (ID, ADDRESS1_LINE, COUNTRY_ID, CITY_ID, DISTRICT_ID) VALUES (8, '"41 Lordship Road, Cheshunt",EN7 5DR', 3, 2, 5);
INSERT INTO ADDRESS1 (ID, ADDRESS1_LINE, COUNTRY_ID, CITY_ID, DISTRICT_ID) VALUES (9, '"Flat 1, Elmwood House, 2 Crescent Road, Enfield",EN2 7AR', 2, 4, 6);
INSERT INTO ADDRESS1 (ID, ADDRESS1_LINE, COUNTRY_ID, CITY_ID, DISTRICT_ID) VALUES (11, '"11 Rendlesham Road, Enfield",EN2 0TS', 3, 2, 6);
/
create table EMPLOYEE_TITLE_TYPE
(
    ID          NUMBER(38)    not null
        constraint PK_EMPLOYEE_TITLE_TYPE
            primary key,
    DESCRIPTION VARCHAR2(250) not null
)
/

comment on table EMPLOYEE_TITLE_TYPE is 'Keeps Employee Title'
/

comment on column EMPLOYEE_TITLE_TYPE.DESCRIPTION is 'Employee Title Description'
/

INSERT INTO EMPLOYEE_TITLE_TYPE (ID, DESCRIPTION) VALUES (1, 'Delivery');
INSERT INTO EMPLOYEE_TITLE_TYPE (ID, DESCRIPTION) VALUES (2, 'Store');
/
create table EMPLOYEE
(
    ID                NUMBER(38)   not null
        constraint PK_EMPLOYEE
            primary key,
    CITIZEN_NUMBER    VARCHAR2(50) not null
        constraint UX_EMPLOYEE__CITIZEN_NUMBER
            unique,
    FIRST_NAME        VARCHAR2(250),
    LAST_NAME         VARCHAR2(250),
    PHONE_NUMBER      VARCHAR2(20),
    EMPLOYEE_TITLE_ID NUMBER(38)
        constraint FK_EMPLOYEE__EMPLOYEE_TI_87_ID
            references EMPLOYEE_TITLE_TYPE,
    ADDRESS1_ID        NUMBER(38)
        constraint FK_EMPLOYEE__ADDRESS1_ID
            references ADDRESS1
)
/

comment on table EMPLOYEE is 'Keeps Employee Information'
/

comment on column EMPLOYEE.CITIZEN_NUMBER is 'Employee unique citizen number'
/

comment on column EMPLOYEE.FIRST_NAME is 'Employee First Name'
/

comment on column EMPLOYEE.LAST_NAME is 'Employee Last Name'
/

comment on column EMPLOYEE.PHONE_NUMBER is 'Employee Phone Number'
/

INSERT INTO EMPLOYEE (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMPLOYEE_TITLE_ID, ADDRESS1_ID) VALUES (1, '7015064	', 'Yasemin', 'Braun', '(384) 733-9531', 1, 3);
INSERT INTO EMPLOYEE (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMPLOYEE_TITLE_ID, ADDRESS1_ID) VALUES (2, '5191970', 'Lucio', 'Jerde', '(889) 792-6338', 1, 2);
INSERT INTO EMPLOYEE (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMPLOYEE_TITLE_ID, ADDRESS1_ID) VALUES (3, '5724495	', 'Branson', 'Botsford', '(441) 425-8165', 2, 4);
INSERT INTO EMPLOYEE (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMPLOYEE_TITLE_ID, ADDRESS1_ID) VALUES (4, '4955646	', 'Carey', 'Bins', '(337) 371-1223', 2, 5);
INSERT INTO EMPLOYEE (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMPLOYEE_TITLE_ID, ADDRESS1_ID) VALUES (5, '2839384', 'Brannon', 'Collier', '(800) 473-1780', 2, 6);
INSERT INTO EMPLOYEE (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMPLOYEE_TITLE_ID, ADDRESS1_ID) VALUES (6, '5748609', 'Imogene', 'Hills', '(337) 371-1223', 1, 7);
INSERT INTO EMPLOYEE (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMPLOYEE_TITLE_ID, ADDRESS1_ID) VALUES (7, '6911471', 'Renner', 'BMW','(714) 933-4297', 2, 8);
INSERT INTO EMPLOYEE (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMPLOYEE_TITLE_ID, ADDRESS1_ID) VALUES (8, '5632737', 'Edwin', 'Abernathy', '(240) 609-6053', 1, 9);
INSERT INTO EMPLOYEE (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMPLOYEE_TITLE_ID, ADDRESS1_ID) VALUES (9, '1517046', 'Peter', 'Nienow', '(465) 316-2613', 2, 2);
INSERT INTO EMPLOYEE (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMPLOYEE_TITLE_ID, ADDRESS1_ID) VALUES (11, '5470179', 'Peggie', 'Runolfsson', '(849) 783-2370', 1, 1);
/
create table SUPPLIER
(
    ID   NUMBER(38)    not null
        constraint PK_SUPPLIER
            primary key,
    NAME VARCHAR2(250) not null
)
/

comment on table SUPPLIER is 'Keeps Supplier Information'
/

comment on column SUPPLIER.NAME is 'Supplier name'
/

INSERT INTO SUPPLIER (ID, NAME) VALUES (1, 'Croatian Springs');
INSERT INTO SUPPLIER (ID, NAME) VALUES (2, 'International Seychelles');

/
create table JHI_STORE
(
    ID         NUMBER(38)    not null
        constraint PK_JHI_STORE
            primary key,
    NAME       VARCHAR2(250) not null,
    ADDRESS1_ID NUMBER(38)
        constraint FK_JHI_STORE__ADDRESS1_ID
            references ADDRESS1
)
/

comment on table JHI_STORE is 'Keeps Store Information'
/

comment on column JHI_STORE.NAME is 'Store name'
/

INSERT INTO JHI_STORE (ID, NAME, ADDRESS1_ID) VALUES (1, 'Collection', 4);
INSERT INTO JHI_STORE (ID, NAME, ADDRESS1_ID) VALUES (2, 'Collection', 9);
INSERT INTO JHI_STORE (ID, NAME, ADDRESS1_ID) VALUES (3, 'Administrator', 4);

/
create table CUSTOMER
(
    ID             NUMBER(38)   not null
        constraint PK_CUSTOMER
            primary key,
    CITIZEN_NUMBER VARCHAR2(50) not null
        constraint UX_CUSTOMER__CITIZEN_NUMBER
            unique,
    FIRST_NAME     VARCHAR2(250),
    LAST_NAME      VARCHAR2(250),
    PHONE_NUMBER   VARCHAR2(20)
)
/

comment on table CUSTOMER is 'Keeps Customer Information'
/

comment on column CUSTOMER.CITIZEN_NUMBER is 'Customer unique citizen number'
/

comment on column CUSTOMER.FIRST_NAME is 'Customer First Name'
/

comment on column CUSTOMER.LAST_NAME is 'Customer Last Name'
/

comment on column CUSTOMER.PHONE_NUMBER is 'Customer Phone Number'
/

INSERT INTO CUSTOMER (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER) VALUES (1, '8750321', 'Aubrey', 'Miller', '(307) 594-9413');
INSERT INTO CUSTOMER (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER) VALUES (2, '8506988', 'Jessy', 'Fadel', '(242) 728-9849');
INSERT INTO CUSTOMER (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER) VALUES (3, '1895181', 'Cleo', 'Ledner', '(916) 762-8834');
INSERT INTO CUSTOMER (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER) VALUES (4, '7074964', 'Marisa', 'Schmeler', '(997) 631-0727');
INSERT INTO CUSTOMER (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER) VALUES (5, '6663515', 'Bailey', 'Pouros', '(258) 653-4645');
INSERT INTO CUSTOMER (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER) VALUES (6, 'copying', 'Elmore', 'Schroeder', '(979) 726-6576');
INSERT INTO CUSTOMER (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER) VALUES (7, '3120797', 'Mazie', 'Dach', '(533) 772-9811');
INSERT INTO CUSTOMER (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER) VALUES (8, '7268205', 'Grace', 'Murazik', '(325) 962-8763');
INSERT INTO CUSTOMER (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER) VALUES (9, '7247569', 'Santina', 'Heaney', '(321) 433-0817');
INSERT INTO CUSTOMER (ID, CITIZEN_NUMBER, FIRST_NAME, LAST_NAME, PHONE_NUMBER) VALUES (11, '5065141', 'Casey', 'Marks', '(929) 626-9225');
/
create table DEPARTMENT
(
    ID         NUMBER(38)    not null
        constraint PK_DEPARTMENT
            primary key,
    NAME       VARCHAR2(250) not null,
    ADDRESS1_ID NUMBER(38)
        constraint FK_DEPARTMENT__ADDRESS1_ID
            references ADDRESS1
)
/

comment on table DEPARTMENT is 'Keeps Department Information'
/

INSERT INTO DEPARTMENT (ID, NAME, ADDRESS1_ID) VALUES (1, 'Collection', 7);
INSERT INTO DEPARTMENT (ID, NAME, ADDRESS1_ID) VALUES (2, 'Delivery', 6);

/
create table REL_SUPPLIER__STORE
(
    STORE_ID    NUMBER(38) not null
        constraint FK_REL_SUPPLIE__STORE_79_ID
            references JHI_STORE,
    SUPPLIER_ID NUMBER(38) not null
        constraint FK_REL_SUPPLIE__SUPPLIER_3E_ID
            references SUPPLIER,
    primary key (SUPPLIER_ID, STORE_ID)
)

/
create table REL_JHI_STORE__EMPLOYEE
(
    EMPLOYEE_ID  NUMBER(38) not null
        constraint FK_REL_JHI_STO__EMPLOYEE_B5_ID
            references EMPLOYEE,
    JHI_STORE_ID NUMBER(38) not null
        constraint FK_REL_JHI_STO__JHI_STOR_ED_ID
            references JHI_STORE,
    primary key (JHI_STORE_ID, EMPLOYEE_ID)
)
/

INSERT INTO REL_JHI_STORE__EMPLOYEE (EMPLOYEE_ID, JHI_STORE_ID) VALUES (1, 1);
INSERT INTO REL_JHI_STORE__EMPLOYEE (EMPLOYEE_ID, JHI_STORE_ID) VALUES (7, 2);
INSERT INTO REL_JHI_STORE__EMPLOYEE (EMPLOYEE_ID, JHI_STORE_ID) VALUES (3, 3);
INSERT INTO REL_JHI_STORE__EMPLOYEE (EMPLOYEE_ID, JHI_STORE_ID) VALUES (2, 3);
INSERT INTO REL_JHI_STORE__EMPLOYEE (EMPLOYEE_ID, JHI_STORE_ID) VALUES (7, 2);
INSERT INTO REL_JHI_STORE__EMPLOYEE (EMPLOYEE_ID, JHI_STORE_ID) VALUES (8, 1);
INSERT INTO REL_JHI_STORE__EMPLOYEE (EMPLOYEE_ID, JHI_STORE_ID) VALUES (11, 3);
INSERT INTO REL_JHI_STORE__EMPLOYEE (EMPLOYEE_ID, JHI_STORE_ID) VALUES (8, 2);
INSERT INTO REL_JHI_STORE__EMPLOYEE (EMPLOYEE_ID, JHI_STORE_ID) VALUES (2, 1);
INSERT INTO REL_JHI_STORE__EMPLOYEE (EMPLOYEE_ID, JHI_STORE_ID) VALUES (5, 1);
/
create table REL_DEPARTMENT__EMPLOYEE
(
    EMPLOYEE_ID   NUMBER(38) not null
        constraint FK_REL_DEPARTM__EMPLOYEE_98_ID
            references EMPLOYEE,
    DEPARTMENT_ID NUMBER(38) not null
        constraint FK_REL_DEPARTM__DEPARTME_7E_ID
            references DEPARTMENT,
    primary key (DEPARTMENT_ID, EMPLOYEE_ID)
)
/

INSERT INTO REL_DEPARTMENT__EMPLOYEE (EMPLOYEE_ID, DEPARTMENT_ID) VALUES (7, 1);
INSERT INTO REL_DEPARTMENT__EMPLOYEE (EMPLOYEE_ID, DEPARTMENT_ID) VALUES (6, 2);
INSERT INTO REL_DEPARTMENT__EMPLOYEE (EMPLOYEE_ID, DEPARTMENT_ID) VALUES (8, 2);
INSERT INTO REL_DEPARTMENT__EMPLOYEE (EMPLOYEE_ID, DEPARTMENT_ID) VALUES (5, 2);
INSERT INTO REL_DEPARTMENT__EMPLOYEE (EMPLOYEE_ID, DEPARTMENT_ID) VALUES (11, 1);
INSERT INTO REL_DEPARTMENT__EMPLOYEE (EMPLOYEE_ID, DEPARTMENT_ID) VALUES (4, 2);
INSERT INTO REL_DEPARTMENT__EMPLOYEE (EMPLOYEE_ID, DEPARTMENT_ID) VALUES (3, 2);
INSERT INTO REL_DEPARTMENT__EMPLOYEE (EMPLOYEE_ID, DEPARTMENT_ID) VALUES (9, 1);
INSERT INTO REL_DEPARTMENT__EMPLOYEE (EMPLOYEE_ID, DEPARTMENT_ID) VALUES (2, 1);
INSERT INTO REL_DEPARTMENT__EMPLOYEE (EMPLOYEE_ID, DEPARTMENT_ID) VALUES (1, 2);
/
create table REL_SUPPLIER__STORE
(
    STORE_ID    NUMBER(38) not null
        constraint FK_REL_SUPPLIE__STORE_79_ID
            references JHI_STORE,
    SUPPLIER_ID NUMBER(38) not null
        constraint FK_REL_SUPPLIE__SUPPLIER_3E_ID
            references SUPPLIER,
    primary key (SUPPLIER_ID, STORE_ID)
)
/
create table REL_CUSTOMER__ADDRESS1
(
    ADDRESS1_ID  NUMBER(38) not null
        constraint FK_REL_CUSTOME__ADDRESS1_68_ID
            references ADDRESS1,
    CUSTOMER_ID NUMBER(38) not null
        constraint FK_REL_CUSTOME__CUSTOMER_50_ID
            references CUSTOMER,
    primary key (CUSTOMER_ID, ADDRESS1_ID)
)
/

INSERT INTO REL_CUSTOMER__ADDRESS1 (ADDRESS1_ID, CUSTOMER_ID) VALUES (8, 9);
INSERT INTO REL_CUSTOMER__ADDRESS1 (ADDRESS1_ID, CUSTOMER_ID) VALUES (7, 8);
INSERT INTO REL_CUSTOMER__ADDRESS1 (ADDRESS1_ID, CUSTOMER_ID) VALUES (6, 7);
INSERT INTO REL_CUSTOMER__ADDRESS1 (ADDRESS1_ID, CUSTOMER_ID) VALUES (5, 6);
INSERT INTO REL_CUSTOMER__ADDRESS1 (ADDRESS1_ID, CUSTOMER_ID) VALUES (4, 5);
INSERT INTO REL_CUSTOMER__ADDRESS1 (ADDRESS1_ID, CUSTOMER_ID) VALUES (2, 4);
INSERT INTO REL_CUSTOMER__ADDRESS1 (ADDRESS1_ID, CUSTOMER_ID) VALUES (3, 3);
INSERT INTO REL_CUSTOMER__ADDRESS1 (ADDRESS1_ID, CUSTOMER_ID) VALUES (1, 2);
INSERT INTO REL_CUSTOMER__ADDRESS1 (ADDRESS1_ID, CUSTOMER_ID) VALUES (1, 1);
INSERT INTO REL_CUSTOMER__ADDRESS1 (ADDRESS1_ID, CUSTOMER_ID) VALUES (2, 11);
/
create table SALE
(
    ID            NUMBER(38) not null
        constraint PK_SALE
            primary key,
    NOTE          VARCHAR2(4000),
    CUSTOMER_ID   NUMBER(38)
        constraint FK_SALE__CUSTOMER_ID
            references CUSTOMER,
    EMPLOYEE_ID   NUMBER(38)
        constraint FK_SALE__EMPLOYEE_ID
            references EMPLOYEE,
    ADDRESS1_ID    NUMBER(38)
        constraint FK_SALE__ADDRESS1_ID
            references ADDRESS1,
    STORE_ID      NUMBER(38)
        constraint FK_SALE__STORE_ID
            references JHI_STORE,
    DEPARTMENT_ID NUMBER(38)
        constraint FK_SALE__DEPARTMENT_ID
            references DEPARTMENT
)
/

comment on table SALE is 'Keeps Purchase Information'
/

comment on column SALE.NOTE is 'Sale Notes'
/

INSERT INTO SALE (ID, NOTE, CUSTOMER_ID, EMPLOYEE_ID, ADDRESS1_ID, STORE_ID, DEPARTMENT_ID) VALUES (1, 'experiences auxiliary AGP', 2, 5, 4, 1, 2);
INSERT INTO SALE (ID, NOTE, CUSTOMER_ID, EMPLOYEE_ID, ADDRESS1_ID, STORE_ID, DEPARTMENT_ID) VALUES (2, 'generate', 3, 6, 3, 2, 2);
INSERT INTO SALE (ID, NOTE, CUSTOMER_ID, EMPLOYEE_ID, ADDRESS1_ID, STORE_ID, DEPARTMENT_ID) VALUES (3, 'Buckinghamshire', 4, 7, 6, 2, 2);
INSERT INTO SALE (ID, NOTE, CUSTOMER_ID, EMPLOYEE_ID, ADDRESS1_ID, STORE_ID, DEPARTMENT_ID) VALUES (4, 'Colorado Incredible', 5, 5, 4, 1, 1);
INSERT INTO SALE (ID, NOTE, CUSTOMER_ID, EMPLOYEE_ID, ADDRESS1_ID, STORE_ID, DEPARTMENT_ID) VALUES (5, 'Dynamic Pound', 3, 7, 6, 2, 2);
INSERT INTO SALE (ID, NOTE, CUSTOMER_ID, EMPLOYEE_ID, ADDRESS1_ID, STORE_ID, DEPARTMENT_ID) VALUES (6, 'archive payment', 2, 6, 5, 1, 2);
INSERT INTO SALE (ID, NOTE, CUSTOMER_ID, EMPLOYEE_ID, ADDRESS1_ID, STORE_ID, DEPARTMENT_ID) VALUES (7, 'Borders', 1, 3, 4, 1, 2);
INSERT INTO SALE (ID, NOTE, CUSTOMER_ID, EMPLOYEE_ID, ADDRESS1_ID, STORE_ID, DEPARTMENT_ID) VALUES (8, 'sexy', 2, 7, 5, 1, 2);
INSERT INTO SALE (ID, NOTE, CUSTOMER_ID, EMPLOYEE_ID, ADDRESS1_ID, STORE_ID, DEPARTMENT_ID) VALUES (9, 'Cheese', 1, 9, 6, 2, 2);
INSERT INTO SALE (ID, NOTE, CUSTOMER_ID, EMPLOYEE_ID, ADDRESS1_ID, STORE_ID, DEPARTMENT_ID) VALUES (11, 'microchip Ecuador', 11, 4, 3, 1, 2);
/
create table PRODUCT_CATEGORY
(
    ID          NUMBER(38)    not null
        constraint PK_PRODUCT_CATEGORY
            primary key,
    NAME        VARCHAR2(250) not null,
    DESCRIPTION VARCHAR2(4000)
)
/

comment on table PRODUCT_CATEGORY is 'Keeps Product Category Information'
/

comment on column PRODUCT_CATEGORY.NAME is 'Product Category name'
/

comment on column PRODUCT_CATEGORY.DESCRIPTION is 'Product Category Description'
/

INSERT INTO PRODUCT_CATEGORY (ID, NAME, DESCRIPTION) VALUES (1, 'furniture', 'furniture');
INSERT INTO PRODUCT_CATEGORY (ID, NAME, DESCRIPTION) VALUES (2, 'carpets', 'carpets');
INSERT INTO PRODUCT_CATEGORY (ID, NAME, DESCRIPTION) VALUES (3, 'lamps', 'lamps');
INSERT INTO PRODUCT_CATEGORY (ID, NAME, DESCRIPTION) VALUES (4, 'rugs', 'rugs');
/
create table DELIVERY_LOCATION_TYPE
(
    ID          NUMBER(38)    not null
        constraint PK_DELIVERY_LOCATION_TYPE
            primary key,
    DESCRIPTION VARCHAR2(110) not null
)
/

comment on table DELIVERY_LOCATION_TYPE is 'Keeps Delivery Location for Products'
/

comment on column DELIVERY_LOCATION_TYPE.DESCRIPTION is 'Delivery Location Type Description'
/

INSERT INTO DELIVERY_LOCATION_TYPE (ID, DESCRIPTION) VALUES (1, 'delivery');
INSERT INTO DELIVERY_LOCATION_TYPE (ID, DESCRIPTION) VALUES (2, 'collection in the store');
/
create table PRODUCT
(
    ID                        NUMBER(38)    not null
        constraint PK_PRODUCT
            primary key,
    NAME                      VARCHAR2(250) not null,
    DESCRIPTION               VARCHAR2(4000),
    HEIGHT                    FLOAT(24),
    WIDTH                     FLOAT(24),
    DEPTH                     FLOAT(24),
    WEIGTH                    FLOAT(24),
    PRICE                     FLOAT(24),
    PRODUCT_CATEGORY_ID       NUMBER(38)
        constraint FK_PRODUCT__PRODUCT_CATE_5F_ID
            references PRODUCT_CATEGORY,
    DELIVERY_LOCATION_TYPE_ID NUMBER(38)
        constraint FK_PRODUCT__DELIVERY_LOC_19_ID
            references DELIVERY_LOCATION_TYPE
)
/

comment on column PRODUCT.NAME is 'Product name'
/

comment on column PRODUCT.DESCRIPTION is 'Product Description'
/

comment on column PRODUCT.HEIGHT is 'Product height'
/

comment on column PRODUCT.WIDTH is 'Product width'
/

comment on column PRODUCT.DEPTH is 'Product depth'
/

comment on column PRODUCT.WEIGTH is 'Product weight'
/

comment on column PRODUCT.PRICE is 'Product price'
/

INSERT INTO PRODUCT (ID, NAME, DESCRIPTION, HEIGHT, WIDTH, DEPTH, WEIGTH, PRICE, PRODUCT_CATEGORY_ID, DELIVERY_LOCATION_TYPE_ID) VALUES (1, 'sofa', 'sofa 3', 57374, 81236, 38757, 32433, 90460, 1, 1);
INSERT INTO PRODUCT (ID, NAME, DESCRIPTION, HEIGHT, WIDTH, DEPTH, WEIGTH, PRICE, PRODUCT_CATEGORY_ID, DELIVERY_LOCATION_TYPE_ID) VALUES (2, 'navigate wireless Handmade', 'Dynamic Pound withdrawal', 88209, 64964, 8294, 93728, 44573, 1, 2);
INSERT INTO PRODUCT (ID, NAME, DESCRIPTION, HEIGHT, WIDTH, DEPTH, WEIGTH, PRICE, PRODUCT_CATEGORY_ID, DELIVERY_LOCATION_TYPE_ID) VALUES (3, 'Steel', 'withdrawal models partnerships', 94707, 54662, 46442, 91158, 85179, 2, 2);
INSERT INTO PRODUCT (ID, NAME, DESCRIPTION, HEIGHT, WIDTH, DEPTH, WEIGTH, PRICE, PRODUCT_CATEGORY_ID, DELIVERY_LOCATION_TYPE_ID) VALUES (4, 'intermediate initiative Generic', 'Lao', 29161, 69325, 4329, 4184, 16473, 4, 1);
INSERT INTO PRODUCT (ID, NAME, DESCRIPTION, HEIGHT, WIDTH, DEPTH, WEIGTH, PRICE, PRODUCT_CATEGORY_ID, DELIVERY_LOCATION_TYPE_ID) VALUES (5, 'Wooden', 'Identity throughput Village', 95487, 35518, 58781, 89275, 20505, 3, 2);
INSERT INTO PRODUCT (ID, NAME, DESCRIPTION, HEIGHT, WIDTH, DEPTH, WEIGTH, PRICE, PRODUCT_CATEGORY_ID, DELIVERY_LOCATION_TYPE_ID) VALUES (6, 'Sports COM Implementation', 'Cape', 27546, 52784, 27331, 47574, 66238, 3, 1);
INSERT INTO PRODUCT (ID, NAME, DESCRIPTION, HEIGHT, WIDTH, DEPTH, WEIGTH, PRICE, PRODUCT_CATEGORY_ID, DELIVERY_LOCATION_TYPE_ID) VALUES (7, 'Rubber Chips', 'Keyboard', 88935, 46377, 5902, 8723, 20319, 3, 1);
INSERT INTO PRODUCT (ID, NAME, DESCRIPTION, HEIGHT, WIDTH, DEPTH, WEIGTH, PRICE, PRODUCT_CATEGORY_ID, DELIVERY_LOCATION_TYPE_ID) VALUES (8, 'SMS', 'methodical', 83666, 68319, 16934, 78950, 33734, 3, 1);
INSERT INTO PRODUCT (ID, NAME, DESCRIPTION, HEIGHT, WIDTH, DEPTH, WEIGTH, PRICE, PRODUCT_CATEGORY_ID, DELIVERY_LOCATION_TYPE_ID) VALUES (9, 'multi-byte Underpass project', 'Computer Arizona mobile', 44119, 86012, 25082, 95618, 19864, 1, 1);
INSERT INTO PRODUCT (ID, NAME, DESCRIPTION, HEIGHT, WIDTH, DEPTH, WEIGTH, PRICE, PRODUCT_CATEGORY_ID, DELIVERY_LOCATION_TYPE_ID) VALUES (11, 'wireless sticky Harbors', 'Customer', 62316, 4460, 6748, 26451, 87985, 2, 2);

create table REL_SALE__PRODUCT
(
    PRODUCT_ID NUMBER(38) not null
        constraint FK_REL_SALE__P__PRODUCT_16_ID
            references PRODUCT,
    SALE_ID    NUMBER(38) not null
        constraint FK_REL_SALE__PRODUCT__SALE_ID
            references SALE,
    primary key (SALE_ID, PRODUCT_ID)
)
/

INSERT INTO REL_SALE__PRODUCT (PRODUCT_ID, SALE_ID) VALUES (1, 9);
INSERT INTO REL_SALE__PRODUCT (PRODUCT_ID, SALE_ID) VALUES (2, 11);
