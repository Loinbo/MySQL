有一个商店的数据，记录客户及购物情况，有以下三个表组成：

- 商品goods(商品编号goods_id，商品名goods_name, 单价unitprice, 商品类别category, 供应商provider)
	create database if not exists shop charset = utf8;
	use shop;
	
	create table if not exists goods(
	goods_id int primary key auto_increment comment'商品编号',
	goods_name varchar(30) not null comment'商品名',
	unitprice double default 0 comment'单价',
	category varchar(20) default '' comment '商品类别',
	provider varchar(30) default '' comment '供应商' 
	);	
	
- 客户customer(客户号customer_id,姓名name,住址address,邮箱email,性别sex，身份证card_id)

	create table if not exists customer(
	customer_id int primary key auto_increment comment'客户号',
	name varchar(20) not null comment'姓名',
	address varchar(150) default '' comment '住址',
	email varchar(64) unique comment'邮箱',
	sex enum('男','nv') not null comment'性别',
	card_id char(18) unique comment'身份证'
	);

- 购买purchase(购买订单号order_id,客户号customer_ id,商品号goods_ id,购买数量nums)
	create table if not exists purchase (
	order_id int primary key auto_increment comment'购买订单号',
	customer_id int comment'客户号',
	goods_id int comment'商品号',
	nums int default 0 comment'购买数量',
	foreign key (customer_id) references customer(customer_id),
	foreign key (goods_id) references goods(goods_id)
	);

要求：

- 每个表的主外键
- 客户的姓名不能为空值
- 邮箱不能重复
- 客户的性别(男，女)