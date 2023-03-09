CREATE DATABASE simplechat;
USE simplechat;

CREATE TABLE users(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) DEFAULT NULL,
phone VARCHAR(255) NOT NULL UNIQUE,
profil_picture VARCHAR(255) DEFAULT NULL,
password VARCHAR(255) NOT NULL,
role VARCHAR(255) NOT NULL
);

CREATE TABLE group_chats(
id INT AUTO_INCREMENT PRIMARY KEY,
group_name VARCHAR(255) NOT NULL,
group_picture VARCHAR(255) DEFAULT NULL
);

CREATE TABLE group_members(
group_id INT NOT NULL,
user_id INT NOT NULL,
FOREIGN KEY (group_id) REFERENCES group_chats(id),
FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE messages(
id INT AUTO_INCREMENT PRIMARY KEY,
message VARCHAR(255) NOT NULL,
image_url VARCHAR(255) DEFAULT NULL,
message_status VARCHAR(255) NOT NULL,
user_id_sender INT NOT NULL,
user_id_receiver INT DEFAULT NULL,
group_id INT DEFAULT NULL,
FOREIGN KEY (user_id_sender) REFERENCES users(id),
FOREIGN KEY (user_id_receiver) REFERENCES users(id),
FOREIGN KEY (group_id) REFERENCES group_chats(id)
);

-- HAPUS TABLE --
DROP TABLE messages;
DROP TABLE group_members;
DROP TABLE group_chats;
DROP TABLE users;

-- CREATE DATA --
-- users --
INSERT INTO users (phone,name,password,role) VALUES ('admin','Admin','admin123','admin');
INSERT INTO users (phone,name,password,role) VALUES ('08123456','Fauzi','123','member');
INSERT INTO users (phone,name,password,role) VALUES ('08123457','Joko','123','member');
-- group_chats --
INSERT INTO group_chats (group_name,group_picture) 
VALUES ('KARYAWAN','https://bprbkk-karangmalang.com/data/foto-berita/51455-pegawai-png-2.png');
-- messagges --
-- 1 to 1
INSERT INTO messages (message,image_url,message_status,user_id_sender,user_id_receiver) 
VALUES ('halo joko apa kabar','','sent',2,4);
INSERT INTO messages (message,image_url,message_status,user_id_sender,user_id_receiver) 
VALUES ('','https://marketplace.canva.com/EAE8vy3ug1o/1/0/1600w/canva-good-morning-instagram-post-vD94ud4DLAU.jpg','pending',2,4);


-- Show Table --
SELECT * FROM users;
SELECT * FROM group_chats;
SELECT * FROM group_members;
SELECT * FROM messages;

-- PENJELASAN DARI SCHEMA ADALAH SEBAGAI BERIKUT :

-- Schema ini mempunyai 4 table users,messagges,group_members dan group_chats
-- table user memiliki dua role yaitu admin dan member yang nantinya akan tertulis di kolom role pada table users
-- saat ingin mendaftar sebagai member wajib menulis nomor telpon dan membuat password baru, untuk nama opsional contoh:
INSERT INTO users (phone,name,password,role) VALUES ('08123459','SOFYAN','12345','member');
-- saat ingin mengedit data,untuk role dan id tidak boleh diubah contoh :
UPDATE users SET phone='08123458',name='Fauzi Sofyan',password='123' WHERE phone='08123459';
-- saat admin ingin menghapus member 
DELETE FROM users WHERE phone='08123458';

-- saat member ingin mengirim chat 1 to 1 maka akan tercatat id pengirim dan penerima beserta text dan status nya
-- sedangkan group_id nya dikosongkan
INSERT INTO messages (message,image_url,message_status,user_id_sender,user_id_receiver) 
VALUES ('halo joko apa kabar','','sent',2,4);
-- saat joko membuka chat 1 to 1 nya maka otomatis status nya akan terganti/terupdate menjadi read
UPDATE messages SET message_status='read' WHERE id=1;
-- semua chat antara FAUZI dan JOKO akan ditampilkan berdasarkan status sent atau read, sedangkan pending
-- hanya akan ditampilkan pada akun pengirim
SELECT * FROM messages WHERE id=1 AND (message_status='read' OR message_status='sent');

-- untuk group_chat admin dapat membuat sebuah group chat dimana semua membernya bisa saling chat secara public
INSERT INTO group_chats (group_name,group_picture) 
VALUES ('KARYAWAN','https://bprbkk-karangmalang.com/data/foto-berita/51455-pegawai-png-2.png');

-- untuk menambahkan member kedalam group chat sebagai berikut
INSERT INTO group_members (group_id,user_id) VALUES (1,2);
INSERT INTO group_members (group_id,user_id) VALUES (1,4);

-- untuk menghapus anggota dari group tersebut maka admin dapat melakukan
DELETE FROM group_members WHERE group_id=1 AND user_id=4;

-- untuk menulis chat public di ddalam group yang kosongkan adalah user_id_receiver diganti dengan id group
INSERT INTO messages (message,image_url,message_status,user_id_sender,group_id) 
VALUES ('hai group saya fauzi salam kenal','','sent',2,1);

-- di dalam group chat hanya menampilkan message dengan status sent/read kemudian group id tersebut
SELECT * FROM messages WHERE group_id=1 AND (message_status='read'OR message_status='sent');

-- Saya memilih menggunakan SQL karena banyaknya relasi yang dibutuhkan tiap table sehingga mudah untuk mengaturdan mengolah datanya



