<%@ Page Title="" Language="C#" MasterPageFile="~/MenuPrincipal.Master" AutoEventWireup="true" CodeBehind="BorUsu.aspx.cs" Inherits="Examen_3_DannyAlosoCastroBarboza.BorUsu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/wrap.css" rel="stylesheet" />
    <link href="css/tablagrid.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="titulo"><p class="titulo">Borrar Usuario </p>
     </div>
    <div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_Usuario" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." Height="51px" Width="1132px">
        <Columns>
            <asp:BoundField DataField="Id_Usuario" HeaderText="Id_Usuario" ReadOnly="True" SortExpression="Id_Usuario" />
            <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
            <asp:BoundField DataField="Clave" HeaderText="Clave" SortExpression="Clave" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
        </Columns>
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:peajesConnectionString1 %>" DeleteCommand="DELETE FROM [Usuarios] WHERE [Id_Usuario] = @Id_Usuario" InsertCommand="INSERT INTO [Usuarios] ([Usuario], [Clave], [Nombre], [Apellido]) VALUES (@Usuario, @Clave, @Nombre, @Apellido)" ProviderName="<%$ ConnectionStrings:peajesConnectionString1.ProviderName %>" SelectCommand="SELECT [Id_Usuario], [Usuario], [Clave], [Nombre], [Apellido] FROM [Usuarios]" UpdateCommand="UPDATE [Usuarios] SET [Usuario] = @Usuario, [Clave] = @Clave, [Nombre] = @Nombre, [Apellido] = @Apellido WHERE [Id_Usuario] = @Id_Usuario">
        <DeleteParameters>
            <asp:Parameter Name="Id_Usuario" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Usuario" Type="String" />
            <asp:Parameter Name="Clave" Type="String" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Apellido" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Usuario" Type="String" />
            <asp:Parameter Name="Clave" Type="String" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Apellido" Type="String" />
            <asp:Parameter Name="Id_Usuario" Type="Int32" />
        </UpdateParameters>   
    </asp:SqlDataSource>
                  <div class="wrap-agregar" >   
                <div class="titulo">
   
   <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">  Nombre: <asp:TextBox  ID="Tnombre" class="input100" placeholder="Digite el nombre" runat="server"> </asp:TextBox></p></h2></div>
     
     

    <div class="container-login100-form-btn">
    <asp:Button ID="Bingresar" runat="server" class="login100-form-btn" Text="Borrar Usuario" OnClick="Bingresar_Click" />
                </div>
    
     <asp:Label ID="Lmensaje" Class="lmensaje" runat="server" ></asp:Label>        
              </div>
      </div> 
</asp:Content>
