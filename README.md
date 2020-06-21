# ASP.NET
设备管理系统
1.功能需求：
(1)	员工分系统管理人(也是一般员工)及一般员工，所有人员都可进行设备保管。人员均需编列于特定部门中，如财务部或销售部，一般企业部门名称请自订。
(2)	所有人员使用系统需先行登陆，并按人员身份呈现不同首页。
(3)	只有系统管理人可作A.部门，B.设备及C.人员的ＣＲＵＤ；其他人员只能进行各项查询。
(4)	一般查询：设备查询时能分别按下列条件查询，包含设备编号、设备名称、购入日期（年度）、存放位置、设备负责人姓名、部门名称。
(5)	管理人查询：除了前项查询功能外，尚需包含部门查询及人员查询。
2.数据库设计要求：
(1)	设备信息：设备编号(PK)、设备名称、设备规格、设备图片(1张)、价格、购入日期、存放位置、设备负责人(FK)。
(2)	部门信息：部门代号(PK)、部门名称、部门主管(FK)。
(3)	员工信息：人员编号(PK)（作为登陆用）、密码、姓名、联络电话、是否为管理人、部门代号 (FK)。
(4)	需有Ｅ－Ｒ图设计，并请合理设计上述数据型态及限制。
(5)	数据库需使用VS2017自带的SQL Express。
(6)	各项命名均需使用英文，如设备数据表可使用Equipment，员工可使用Employee，部门可使用Department。所有字段名亦同。英文使用请用意译。
