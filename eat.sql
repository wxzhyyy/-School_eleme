drop table if exists Relationship_4;

drop table if exists address;

drop table if exists admin;

drop table if exists mangzhe;

drop table if exists mangzheproduct;

drop table if exists message1;

drop table if exists message2;

drop table if exists message3;

drop table if exists order1;

drop table if exists orderxiangqing;

drop table if exists people;

drop table if exists pingjiabiao;

drop table if exists product_information;

drop table if exists rider;

drop table if exists store;

drop table if exists xianshicuxiao;

drop table if exists youhuiquan;

/*==============================================================*/
/* Table: Relationship_4                                        */
/*==============================================================*/
create table Relationship_4
(
   yhq_id               int not null,
   order_id             int not null,
   primary key (yhq_id, order_id)
);

/*==============================================================*/
/* Table: address                                               */
/*==============================================================*/
create table address
(
   address_id           int not null auto_increment,
   people_id            int,
   address_sheng        varchar(50) not null,
   address_shi          varchar(50) not null,
   address_qu           varchar(50) not null,
   address_xiangxi      varchar(200) not null,
   address_lxr          varchar(50) not null,
   address_phone        varchar(20) not null,
   primary key (address_id)
);

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   admin_id             int not null auto_increment,
   admin_name           varchar(50) not null,
   admin_pwd            varchar(50) not null,
   primary key (admin_id)
);

/*==============================================================*/
/* Table: mangzhe                                               */
/*==============================================================*/
create table mangzhe
(
   mz_id                int not null auto_increment,
   mz_neirong           varchar(200) not null,
   mz_ablecount         float(10) not null,
   mz_zhekou            float(10) not null,
   mz_starttime         date not null,
   mz_endtime           date not null,
   primary key (mz_id)
);

/*==============================================================*/
/* Table: mangzheproduct                                        */
/*==============================================================*/
create table mangzheproduct
(
   product_id           varchar(50) not null,
   mz_id                int not null,
   primary key (product_id, mz_id)
);

/*==============================================================*/
/* Table: message1                                              */
/*==============================================================*/
create table message1
(
   admin_id             int not null,
   rider_id             int not null,
   message1_neirong     varchar(200),
   primary key (admin_id, rider_id)
);

/*==============================================================*/
/* Table: message2                                              */
/*==============================================================*/
create table message2
(
   admin_id             int not null,
   people_id            int not null,
   message2_neirong     varchar(200),
   primary key (admin_id, people_id)
);

/*==============================================================*/
/* Table: message3                                              */
/*==============================================================*/
create table message3
(
   stroe_id             int not null,
   admin_id             int not null,
   message3_neirong     varchar(200),
   primary key (stroe_id, admin_id)
);

/*==============================================================*/
/* Table: order1                                                */
/*==============================================================*/
create table order1
(
   order_id             int not null auto_increment,
   rider_id             int,
   people_id            int,
   start_price          float(10) not null,
   end_price            float(10) not null,
   use_yhqid            varchar(50),
   request_arrive_time  date not null,
   address_id           varchar(50) not null,
   order_state          varchar(50) not null,
   primary key (order_id)
);

/*==============================================================*/
/* Table: orderxiangqing                                        */
/*==============================================================*/
create table orderxiangqing
(
   order_id             int not null,
   product_id           varchar(50) not null,
   mz_id                int not null,
   order_count          float(10) not null,
   order_price          float(10) not null,
   order_zhekou         float(10) not null,
   primary key (order_id, product_id, mz_id)
);

/*==============================================================*/
/* Table: people                                                */
/*==============================================================*/
create table people
(
   people_id            int not null auto_increment,
   people_name          varchar(50) not null,
   people_sex           varchar(10) not null,
   people_pwd           varchar(50) not null,
   people_phone         varchar(50) not null,
   people_mail          varchar(50) not null,
   people_city          varchar(50) not null,
   people_starttime     date not null,
   huiyuan              bool not null,
   hy_endtime           date not null,
   primary key (people_id)
);

/*==============================================================*/
/* Table: pingjiabiao                                           */
/*==============================================================*/
create table pingjiabiao
(
   people_id            int not null,
   order_id             int not null,
   pingjia_neirong      varchar(200) not null,
   pingjia_time         date not null,
   pingjia_star         int not null,
   pingjia_ph           varchar(50),
   primary key (people_id, order_id)
);

/*==============================================================*/
/* Table: product_information                                   */
/*==============================================================*/
create table product_information
(
   product_id           int not null auto_increment,
   stroe_id             int,
   product_name         varchar(50) not null,
   product_price        float(10) not null,
   product_price_hy     float(10) not null,
   product_count        float(10) not null,
   product_xiangqing    varchar(200),
   month_sell_count     int not null,
   primary key (product_id)
);

/*==============================================================*/
/* Table: rider                                                 */
/*==============================================================*/
create table rider
(
   rider_id             int not null auto_increment,
   rider_name           varchar(50) not null,
   rider_sex            varchar(10) not null,
   rider_phone          varchar(50) not null,
   primary key (rider_id)
);

/*==============================================================*/
/* Table: store                                                 */
/*==============================================================*/
create table store
(
   stroe_id             int not null auto_increment,
   store_name           varchar(50) not null,
   store_address        varchar(50) not null,
   stroe_phone          varchar(50) not null,
   primary key (stroe_id)
);

/*==============================================================*/
/* Table: xianshicuxiao                                         */
/*==============================================================*/
create table xianshicuxiao
(
   cx_id                int not null auto_increment,
   product_id           varchar(50),
   cx_price             float(10) not null,
   cx_count             float(10) not null,
   cx_starttime         date not null,
   cs_endtime           date not null,
   primary key (cx_id)
);

/*==============================================================*/
/* Table: youhuiquan                                            */
/*==============================================================*/
create table youhuiquan
(
   yhq_id               int not null auto_increment,
   yhq_neirong          varchar(200) not null,
   yhq_ableprice        float(10) not null,
   yhq_jian             float(10) not null,
   yhq_starttime        date not null,
   yhq_endtime          date not null,
   primary key (yhq_id)
);

alter table Relationship_4 add constraint FK_Relationship_4 foreign key (yhq_id)
      references youhuiquan (yhq_id) on delete restrict on update restrict;

alter table Relationship_4 add constraint FK_Relationship_5 foreign key (order_id)
      references order1 (order_id) on delete restrict on update restrict;

alter table address add constraint FK_Relationship_2 foreign key (people_id)
      references people (people_id) on delete restrict on update restrict;

alter table mangzheproduct add constraint FK_mangzheproduct foreign key (product_id)
      references product_information (product_id) on delete restrict on update restrict;

alter table mangzheproduct add constraint FK_mangzheproduct2 foreign key (mz_id)
      references mangzhe (mz_id) on delete restrict on update restrict;

alter table message1 add constraint FK_message1 foreign key (admin_id)
      references admin (admin_id) on delete restrict on update restrict;

alter table message1 add constraint FK_message2 foreign key (rider_id)
      references rider (rider_id) on delete restrict on update restrict;

alter table message2 add constraint FK_message5 foreign key (admin_id)
      references admin (admin_id) on delete restrict on update restrict;

alter table message2 add constraint FK_message6 foreign key (people_id)
      references people (people_id) on delete restrict on update restrict;

alter table message3 add constraint FK_message3 foreign key (stroe_id)
      references store (stroe_id) on delete restrict on update restrict;

alter table message3 add constraint FK_message4 foreign key (admin_id)
      references admin (admin_id) on delete restrict on update restrict;

alter table order1 add constraint FK_Relationship_3 foreign key (people_id)
      references people (people_id) on delete restrict on update restrict;

alter table order1 add constraint FK_paisong foreign key (rider_id)
      references rider (rider_id) on delete restrict on update restrict;

alter table orderxiangqing add constraint FK_orderxiangqing foreign key (order_id)
      references order1 (order_id) on delete restrict on update restrict;

alter table orderxiangqing add constraint FK_orderxiangqing2 foreign key (product_id)
      references product_information (product_id) on delete restrict on update restrict;

alter table orderxiangqing add constraint FK_orderxiangqing3 foreign key (mz_id)
      references mangzhe (mz_id) on delete restrict on update restrict;

alter table pingjiabiao add constraint FK_pingjiabiao foreign key (people_id)
      references people (people_id) on delete restrict on update restrict;

alter table pingjiabiao add constraint FK_pingjiabiao2 foreign key (order_id)
      references order1 (order_id) on delete restrict on update restrict;

alter table product_information add constraint FK_Relationship_7 foreign key (stroe_id)
      references store (stroe_id) on delete restrict on update restrict;

alter table xianshicuxiao add constraint FK_Relationship_6 foreign key (product_id)
      references product_information (product_id) on delete restrict on update restrict;
