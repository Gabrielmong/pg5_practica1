<%@ Page 
    Language="C#"
    AutoEventWireup="true"
    EnableEventValidation = "false"
    CodeBehind="infoEmpleado.aspx.cs"
    Inherits="pg5_practica1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 90vh">
            <div style="display: flex; flex-direction: row; align-items: center; justify-content: center">
            <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; margin-right: 3rem">
                <asp:HiddenField runat="server" ID="hf_Control" />
                <div class ="Jumbotron">
                    <h3>Agregar un Empleado</h3>
                </div>
                <p>Codigo</p>
                <asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox>
                <p>Nombre</p>
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <p>Salario Bruto</p>
                <asp:TextBox ID="txtBruto" runat="server"></asp:TextBox>
                <p>Salario Neto</p>
                <asp:TextBox ID="txtNeto" runat="server"></asp:TextBox>
                <p>Deducciones</p>
                <asp:TextBox ID="txtDeducciones" runat="server"></asp:TextBox>
            <div>
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="handleSave" style="margin-top: 1rem;"/>
            </div>
            </div>
            <div>
                 <h3>Datos Del empleado</h3>
            <asp:GridView  DataKeyNames="codigo" ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:Panel ID="Panel1" runat="server" Visible="false">
                <div style="display: flex; flex-direction: column; align-items: center;">
                    <p>Codigo</p>
                    <asp:TextBox ID="txtCodigo2" runat="server" ReadOnly="true"></asp:TextBox>
                    <p>Nombre</p>
                    <asp:TextBox ID="txtNombre2" runat="server" ReadOnly="true"></asp:TextBox>
                    <p>Salario Bruto</p>
                    <asp:TextBox ID="txtBruto2" runat="server" ReadOnly="true"></asp:TextBox>
                    <p>Salario Neto</p>
                    <asp:TextBox ID="txtNeto2" runat="server" ReadOnly="true"></asp:TextBox>
                    <p>Deducciones</p>
                    <asp:TextBox ID="txtDeducciones2" runat="server" ReadOnly="true"></asp:TextBox>
                    <div style="margin-top: 1rem;">
                        <asp:Button ID="btnCerrar" runat="server" Text="Cerrar" OnClick="handleClose" />
                        <asp:Button ID="btnBorrar" runat="server" Text="Borrar" OnClick="handleDelete" />
                    </div>
                </div>
            </asp:Panel>
            </div>
        </div>
        </div>
        
    </form>
</body>
</html>
