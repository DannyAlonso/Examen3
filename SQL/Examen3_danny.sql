create database peajes

use peajes

create table Usuarios
(
Id_Usuario int identity primary key, 
Usuario varchar(50),
Clave varchar (30),
Nombre varchar(50),
Apellido varchar(50)
constraint UQ_Usuario unique (Usuario)
)


create table Veiculo
(
Id_Placa int identity primary key,
NumPlaca varchar(6),
Monto money default 0
constraint UQ_NumPlaca unique(NumPlaca)
Constraint FK_Id_Placa foreign key(Id_Placa ) references Usuarios (Id_Usuario)
)


create table imfo
(
Codi_Imfo int identity primary key, 
Monto money,
Iva float,
Total money
Constraint FK_Codi_Imfo foreign key(Codi_Imfo ) references Veiculo (Id_Placa),
Constraint FK_Codi_Imform foreign key(Codi_Imfo ) references Usuarios (Id_Usuario)
)

-----------------------------------------------------------------------------------------------------------
create procedure ValidarUsuario
@Usuario varchar(50),
@Clave varchar(30)
as
begin
select Usuario, Clave, Nombre, Apellido from Usuarios where Usuario = @Usuario and Clave = @Clave
end
-----------------------------------------------------------------------------------------------------------
CREATE procedure ConsultaUsuario
as
begin
select Id_Usuario, Usuario, Clave, Nombre, Apellido from Usuarios
end

-----------------------------------------------------------------------------------------------------------
create procedure InsertarUsuario
@Usuario varchar (50)='NG',
@Clave varchar(30)='NG',
@Nombre nvarchar(50)='NG',
@Apellido varchar(50)='NG'
as
begin
insert into Usuarios (Usuario,Clave,Nombre,Apellido) values (@Usuario,@Clave,@Nombre,@Apellido)
end
-----------------------------------------------------------------------------------------------------------
create procedure BorrarUsuario
@Nombre nvarchar (50)
as
begin
   delete Usuarios where Nombre = @Nombre
end
-----------------------------------------------------------------------------------------------------------
create procedure ActualizarUsuario
@Codigo int,
@Usuario varchar (50),
@Clave varchar(50),
@Nombre nvarchar(20),
@Apellidos varchar(4)
as
begin
update Usuarios set Usuario=@Usuario,Clave=@Clave,Nombre=@Nombre,Apellido=@Apellidos
where Id_Usuario=@Codigo 
end
-----------------------------------------------------------------------------------------------------------
exec ActualizarUsuario 
exec InsertarUsuario 'Rosa@gmail.com','1111','Rosa','Barboza Calderon'
select Nombre, Correo, Tipo, Clave from Usuarios where correo ='danny@gmail.com' and clave='8888'
exec ConsultaUsuario
exec BorrarUsuario 1
-----------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------
CREATE procedure ConsultaVeiculo
as
begin
select Id_Placa, NumPlaca,Monto from Veiculo
end

-----------------------------------------------------------------------------------------------------------
create procedure InsertarVeiculo
@NumPlaca varchar (6)='NG',
@Monto money 
as
begin
insert into Veiculo (NumPlaca,Monto) values (@NumPlaca,@Monto)
end
-----------------------------------------------------------------------------------------------------------
create procedure BorrarVeiculo
@NumPlaca varchar (6)
as
begin
   delete Veiculo where NumPlaca = @NumPlaca
end
-----------------------------------------------------------------------------------------------------------
create procedure ActualizarVeiculo
@Codigo int,
@NumPlaca varchar (6),
@Monto money
as
begin
update Veiculo set NumPlaca=@Numplaca, Monto=@Monto
where Id_Placa=@Codigo 
end
-----------------------------------------------------------------------------------------------------------
create procedure ConsultaVeiculoFiltro
@NumPlaca varchar(6)
---@codigo int //con la de abajo 
as
begin
select Id_Placa, NumPlaca, Monto from Veiculo
where NumPlaca like '%'+ @NumPlaca +'%'
--where id = @codigo// una opcion
end

-----------------------------------------------------------------------------------------------------------



exec ConsultaVeiculoFiltro '592431'
exec ActualizarVeiculo 
exec InsertarVeiculo '592431','1000'
select Nombre, Correo, Tipo, Clave from Usuarios where correo ='danny@gmail.com' and clave='8888'
exec ConsultaVeiculo
exec BorrarVeiculo 1


select u.Nombre, u.Apellido, v.NumPlaca, v.Monto, i.Iva, i.Total
from Imfo i 
inner join Usuarios u on u.Id_Usuario = i.Codi_Imfo 
inner join Veiculo v on v.Id_Placa = i.Codi_Imfo 
