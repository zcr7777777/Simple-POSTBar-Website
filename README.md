# 说明
本网站除了贴吧功能（在blackboard目录下）还有一个简易的在线选课（根目录下）可以删掉<br>
语言：VBScript ClassicASP<br>
由于网站十分简易，有大量安全漏洞，仅供学习参考<br>
需要搭配数据库使用，本人测试的是MySQL，使用ODBC连接，系统DSN名称signclass，64位Unicode驱动，localhost:3360<br>
以下是表数据，可根据需要调整，前两个是选课记录用的，可以不要<br>
Table: class_a1 Columns: student_name tinytext student_grade tinyint student_class tinyint<br>
Table: class_a2 Columns: student_name tinytext student_grade tinyint student_class tinyint<br>
Table: bregister Columns: uid tinytext pwd tinytext mailname tinytext<br>
Table: blackboard Columns: tuid varchar(20) unsigned tinyint text mediumtext time bigint tid int<br>
有做的不够好的地方欢迎探讨
