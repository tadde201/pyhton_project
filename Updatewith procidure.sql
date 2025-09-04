 create proc Updates3(@id int,@name varchar(20))
 as
 begin 
  update [dbo].[aa]
  set id=@id
  where name=@name
  end
  select * from [dbo].[aa]
  exec Updates3 678,'Lemma'

  create proc updatename(@id int,@name varchar(40))
  as
  begin
  update [dbo].[aa]
  set name=@name
  where id=@id
  end
  select * from [dbo].[aa]
  exec updatename  6,'Tigist'
  select id,name, len(name) as lengh from aa
  where len(name)>5