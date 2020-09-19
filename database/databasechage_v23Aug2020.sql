drop table if exists `roles`;
create table `roles` (
id int(11) auto_increment not null,
role_name NVARCHAR(255),
primary key (Id) 
);

drop table if exists `users`;
create table `users` (
id int(11) auto_increment not null,
created_at datetime default (now()),
username NVARCHAR(255),
password NVARCHAR(255),
password_salt NVARCHAR(255),
last_ip NVARCHAR(255),
last_logged datetime,
role_id INT(11),
foreign key (role_id) references roles(id),
primary key (id)
);

drop table if exists `event_log_access`;
create table `event_log_access`(
id int(11) auto_increment not null,
created_at datetime default (now()),
ip NVARCHAR(255),
api_url NVARCHAR(255),
api_method NVARCHAR(20),
primary key (id)
);

drop table if exists `http_exception_access`;
create  table `http_exception_access` (
id int(11) auto_increment not null,
created_at datetime default (now()),
ip NVARCHAR(255),
api_url NVARCHAR(255),
api_method NVARCHAR(20),
api_error TEXT,
api_status int(11),
primary key (id)
);

drop table if exists `tags`;
create table `tags` (
 id int(11) auto_increment not null,
 created_at datetime default (now()),
 name nvarchar(255),
 description text,
 is_active bool not null default(1),
 primary key (id)
);

drop table if exists `categories`;
create table `categories`(
 id int(11) auto_increment not null,
 created_at datetime default (now()),
 name nvarchar(255),
 description text,
 is_active bool default(1),
 primary key (id)
);

drop table if exists `blogs`;
create table `blogs` (
  id int(11) auto_increment not null,
  created_at datetime default (now()),
  updated_at datetime default (now()),
  title nvarchar(2000),
  sub_title nvarchar(3000),
  content text,
  images text,
  status tinyint default(0),
  primary key (id)
);

drop table if exists `blog_category_mapping`;
create table `blog_category_mapping` (
  id int(11) auto_increment not null,
  blog_id int not null,
  category_id int not null,
  primary key (id),
  foreign key (blog_id) references blogs(id),
  foreign key (category_id) references categories(id),
  unique key unique_blog_category(blog_id, category_id)
);

drop table if exists `blog_tag_mapping`;
create table `blog_tag_mapping` (
  id int(11) auto_increment not null,
  blog_id int not null,
  tag_id int not null,
  primary key (id),
  foreign key (blog_id) references blogs(id),
  foreign key (tag_id) references tags(id),
  unique key unique_blog_tag(blog_id, tag_id)
);

drop table if exists `blog_comment`;
create table `blog_comment` (
  id int(11) auto_increment not null,
  created_at datetime default (now()),
  updated_at datetime default (now()),
  content text,
  username nvarchar(500),
  ip nvarchar(255),
  token nvarchar(1000),
  blog_id int,
  status tinyint,
  primary key (id),
  foreign key (blog_id) references blogs(id)
);

drop table if exists `blog_like`;
create table `blog_like` (
  id int(11) auto_increment not null,
  created_at datetime default (now()),
  updated_at datetime default (now()),
  ip nvarchar(255),
  token nvarchar(1000),
  blog_id int,
  status tinyint,
  primary key (id),
  foreign key (blog_id) references blogs(id)
);

drop table if exists `blog_view`;
create table `blog_view` (
  id int(11) auto_increment not null,
  created_at datetime default (now()),
  updated_at datetime default (now()),
  ip nvarchar(255),
  token nvarchar(1000),
  blog_id int,
  primary key (id),
  foreign key (blog_id) references blogs(id)
);
