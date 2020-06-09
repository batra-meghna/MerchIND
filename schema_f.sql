drop database if exists bech_de;
select CONCAT("Creating database","   ","bech_de!") as Process;
create database bech_de;
use bech_de;

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    phone VARCHAR(10) NOT NULL,
    f_name VARCHAR(255) NOT NULL,
    l_name VARCHAR(255) NOT NULL,

    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE messages(
     id INTEGER AUTO_INCREMENT PRIMARY KEY,
     sender_id INTEGER NOT NULL,
     receiver_id INTEGER NOT NULL,
     content VARCHAR(2000) NOT NULL,
     FOREIGN KEY(sender_id) REFERENCES users(id),
     FOREIGN KEY(receiver_id) REFERENCES users(id) 

);
CREATE TABLE items (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(2000) NOT NULL,
    price INTEGER NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    seller_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(seller_id) REFERENCES users(id)
);


CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE
  
);

INSERT into tags (tag_name) values ("heavy_use"),("moderate_use"),("lightly_used"),("new"),("books"),("bicycle"),("lab_uniform"),("stationary"),("utilities");

CREATE TABLE item_tags (
    item_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(item_id) REFERENCES items(id) ON DELETE CASCADE,
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(item_id, tag_id)
);


CREATE TABLE ratings(
	user_id INTEGER NOT NULL PRIMARY KEY,
	likes_no INTEGER DEFAULT 0,
	dislikes_no INTEGER DEFAULT 0,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

