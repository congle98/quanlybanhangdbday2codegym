create database quanlybanhangday2jamescodegym;
use quanlybanhangday2jamescodegym;
create table customer (
                          customer_id int primary key auto_increment,
                          customer_name varchar(50),
                          customer_age int
);

create table ordertable (
                            order_id int primary key auto_increment,
                            customer_id int,
                            order_date date,
                            order_totalPrice double,
                            foreign key (customer_id) references customer(customer_id)
);
create table product (
                         product_id int primary key auto_increment,
                         product_name varchar(50),
                         product_price double
);
create table orderdetail (
                             order_id int,
                             product_id int,
                             order_detailQTY varchar(50),
                             foreign key (order_id) references ordertable(order_id),
                             foreign key (product_id) references product(product_id),
                             primary key (order_id,product_id)
);
insert into Customer(customer_id,customer_name,customer_age)
values (1,'Minh Quan',10);
insert into Customer(customer_id,customer_name,customer_age)
values (2,'Ngoc Oanh',20);
insert into Customer(customer_id,customer_name,customer_age)
values (3,'Hong Ha',50);

insert into ordertable (order_id,customer_id,order_date,order_totalPrice)
values (1,1,3/21/2006,Null);
insert into ordertable (order_id,customer_id,order_date,order_totalPrice)
values (2,2,3/23/2006,Null);
insert into ordertable (order_id,customer_id,order_date,order_totalPrice)
values (3,1,3/16/2006,Null);

insert into product (product_id,product_name,product_price)
values (1,'May Giat',3);
insert into product (product_id,product_name,product_price)
values (2,'Tu Giat',5);
insert into product (product_id,product_name,product_price)
values (3,'Dieu Hoa',7);
insert into product (product_id,product_name,product_price)
values (4,'Quat',1);
insert into product (product_id,product_name,product_price)
values (5,'Bep Dien',2);

insert into orderdetail (order_id,product_id,order_detailQTY)
values (1,1,3);
insert into orderdetail (order_id,product_id,order_detailQTY)
values (1,3,7);
insert into orderdetail (order_id,product_id,order_detailQTY)
values (1,4,2);
insert into orderdetail (order_id,product_id,order_detailQTY)
values (2,1,1);
insert into orderdetail (order_id,product_id,order_detailQTY)
values (3,1,8);
insert into orderdetail (order_id,product_id,order_detailQTY)
values (2,5,4);
insert into orderdetail (order_id,product_id,order_detailQTY)
values (2,3,3);

select order_id,order_date,order_totalPrice from ordertable;

select customer_name, product_name
from customer join ordertable on customer.customer_id = ordertable.customer_id
join orderdetail on ordertable.order_id =  orderdetail.order_id
join product on orderdetail.product_id = product.product_id;

select ordertable.order_id, order_date,(order_detailQty*product_price) as resulPrice
from ordertable join orderdetail on ordertable.order_id =  orderdetail.order_id
join product on orderdetail.product_id = product.product_id;