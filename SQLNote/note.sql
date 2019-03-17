便签应用数据库模型

create database if not exists not charset = utf8 collate utf8_bin; //区分大小写

use database;

1.便签模型

1.1 便签表

create table if not exists memo(
id int primary key auto_increment comment'便签编号',
title varchar(30) comment'标题',
content varchar(200) not null comment'内容',
is_private bit(1) comment'是否隐私，0为非私密,1为私密'，
background enum('red','black','grey','blue') comment'背景',  //set可以同时选择多项
remind enum('是','否') comment '是否提醒', //用bit(1)更节省空间
create_time datetime comment'创建时间',
modify_time timestamp comment'修改时间',
remind_time datetime comment'提醒时间',
belong_group int comment'分组编号'  //('study','work','life')
);

2.便签组模型

2.1 便签组

create table if not exists memo_group(
id int primary key auto_increment comment'分组编号',
group_name varchar(10) not null comment'组名称', 
create_time datetime comment'创建时间',
modify_time timestamp comment'修改时间',
foreign key id references memo(belong_group)
);

3.便签分享模型

3.1便签分享表

create table if not exists memo_share(
id int primary key auto_increment comment'分享编号',
memo_id int not null auto_increment comment'标签编号',
share_remark varchar(30) default "" comment'分享备注',
share_time timestamp comment'分享时间',
foreign key memo_id references memo(id)
);
















