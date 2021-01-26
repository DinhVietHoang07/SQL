CREATE TABLE Or_ID(
Name varchar(100),
Card_ID int,
description varchar(50),
Subscription_type varchar(77),
Tel int,
Date_ID datetime
)
GO
DROP TABLE Or_ID
GO

INSERT INTO Or_ID(Name,Card_ID,Description,Subscription_type,Tel,Date_ID) VALUES ('NGUYEN NGUYET NGA',123456789,'HA NOI','TRA TRUOC',123456789,12/12/02)
GO

SELECT * FROM Or_ID
GO
