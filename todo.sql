todolist=# create table todos (id SERIAL PRIMARY KEY, title varchar(256), details bit varying(1000), created_at timestamp, completed_at timestamp);

                                          ^
todolist=# insert into todos (title) VALUES ('basileus');
INSERT 0 1
todolist=# select * from todos;
 id |  title   | details | created_at | completed_at 
----+----------+---------+------------+--------------
  1 | basileus |         |            | 
(1 row)

                                                          ^
todolist=# insert into todos (created_at) VALUES ('now()');
INSERT 0 1
todolist=# insert into todos (completed_at) VALUES ('now()');
INSERT 0 1
                                            ^
todolist=# select * from todos;
 id |  title   | details |        created_at         |        completed_at        
----+----------+---------+---------------------------+----------------------------
  1 | basileus |         |                           | 
  2 |          |         | 2017-06-27 15:44:19.08234 | 
  3 |          |         |                           | 2017-06-27 15:44:56.730896
(3 rows)

todolist=# insert into todos (title, created_at, completed_at) VALUES ('Donovan', 'now()', 'now()');
INSERT 0 1
todolist=# select * from todos;
 id |  title   | details |         created_at         |        completed_at        
----+----------+---------+----------------------------+----------------------------
  1 | basileus |         |                            | 
  2 |          |         | 2017-06-27 15:44:19.08234  | 
  3 |          |         |                            | 2017-06-27 15:44:56.730896
  4 | Donovan  |         | 2017-06-27 15:53:56.932922 | 2017-06-27 15:53:56.932922
(4 rows)

todolist=# alter table todos add priority integer;
ALTER TABLE
todolist=# select * from todos;
 id |  title   | details |         created_at         |        completed_at        | priority 
----+----------+---------+----------------------------+----------------------------+----------
  1 | basileus |         |                            |                            |         
  2 |          |         | 2017-06-27 15:44:19.08234  |                            |         
  3 |          |         |                            | 2017-06-27 15:44:56.730896 |         
  4 | Donovan  |         | 2017-06-27 15:53:56.932922 | 2017-06-27 15:53:56.932922 |         
(4 rows)

todolist=# insert into todos (title, created_at, priority) VALUES ('complete reading', 'now()', 2);
INSERT 0 1
todolist=# insert into todos (title, created_at, priority) VALUES ('complete homework', 'now()', 1);
INSERT 0 1
todolist=# insert into todos (title, created_at, priority) VALUES ('feed the child', 'now()', 1);
INSERT 0 1
todolist=# insert into todos (title, created_at, priority) VALUES ('excercise', 'now()', 4);
INSERT 0 1
todolist=# insert into todos (title, created_at, priority) VALUES ('sleep', 'now()', 5);
INSERT 0 1
todolist=# select * from todos;
 id |       title       | details |         created_at         |        completed_at        | priority 
----+-------------------+---------+----------------------------+----------------------------+----------
  1 | basileus          |         |                            |                            |         
  2 |                   |         | 2017-06-27 15:44:19.08234  |                            |         
  3 |                   |         |                            | 2017-06-27 15:44:56.730896 |         
  4 | Donovan           |         | 2017-06-27 15:53:56.932922 | 2017-06-27 15:53:56.932922 |         
  5 | complete reading  |         | 2017-06-27 22:09:36.52405  |                            |        2
  6 | complete homework |         | 2017-06-27 22:10:05.364362 |                            |        1
  7 | feed the child    |         | 2017-06-27 22:10:39.052075 |                            |        1
  8 | excercise         |         | 2017-06-27 22:11:02.546881 |                            |        4
  9 | sleep             |         | 2017-06-27 22:11:37.979402 |                            |        5
(9 rows)


todolist=# select title from todos where priority = 1;
       title       
-------------------
 complete homework
 feed the child
(2 rows)

todolist=# update todos set completed_at = 'now()' where priority = 1;
UPDATE 2
todolist=# select * from todos;
 id |       title       | details |         created_at         |        completed_at        | priority 
----+-------------------+---------+----------------------------+----------------------------+----------
  1 | basileus          |         |                            |                            |         
  2 |                   |         | 2017-06-27 15:44:19.08234  |                            |         
  3 |                   |         |                            | 2017-06-27 15:44:56.730896 |         
  4 | Donovan           |         | 2017-06-27 15:53:56.932922 | 2017-06-27 15:53:56.932922 |         
  5 | complete reading  |         | 2017-06-27 22:09:36.52405  |                            |        2
  8 | excercise         |         | 2017-06-27 22:11:02.546881 |                            |        4
  9 | sleep             |         | 2017-06-27 22:11:37.979402 |                            |        5
  6 | complete homework |         | 2017-06-27 22:10:05.364362 | 2017-06-28 14:11:32.781754 |        1
  7 | feed the child    |         | 2017-06-27 22:10:39.052075 | 2017-06-28 14:11:32.781754 |        1
(9 rows)

todolist=# select from todos where completed_at is NULL;
--
(5 rows)

todolist=# select * from todos;
 id |       title       | details |         created_at         |        completed_at        | priority 
----+-------------------+---------+----------------------------+----------------------------+----------
  1 | basileus          |         |                            |                            |         
  2 |                   |         | 2017-06-27 15:44:19.08234  |                            |         
  3 |                   |         |                            | 2017-06-27 15:44:56.730896 |         
  4 | Donovan           |         | 2017-06-27 15:53:56.932922 | 2017-06-27 15:53:56.932922 |         
  5 | complete reading  |         | 2017-06-27 22:09:36.52405  |                            |        2
  8 | excercise         |         | 2017-06-27 22:11:02.546881 |                            |        4
  9 | sleep             |         | 2017-06-27 22:11:37.979402 |                            |        5
  6 | complete homework |         | 2017-06-27 22:10:05.364362 | 2017-06-28 14:11:32.781754 |        1
  7 | feed the child    |         | 2017-06-27 22:10:39.052075 | 2017-06-28 14:11:32.781754 |        1
(9 rows)

todolist=# 

todolist=# delete from todos where completed_at is NOT NULL;
DELETE 4
todolist=# select * from todos;
 id |      title       | details |         created_at         | completed_at | priority 
----+------------------+---------+----------------------------+--------------+----------
  1 | basileus         |         |                            |              |         
  2 |                  |         | 2017-06-27 15:44:19.08234  |              |         
  5 | complete reading |         | 2017-06-27 22:09:36.52405  |              |        2
  8 | excercise        |         | 2017-06-27 22:11:02.546881 |              |        4
  9 | sleep            |         | 2017-06-27 22:11:37.979402 |              |        5
(5 rows)

todolist=# 