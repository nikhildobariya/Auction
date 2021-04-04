<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="addcategory.aspx.cs" Inherits="AuctionManagementSystem.addcategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html>
<head>
	<title></title>
	<style type="text/css">
		.cat{
			background: #0094ff;
			margin-top: 80px;
			font-family: monospace;
			font-size: 30px;
			padding: 30px;
			margin-left: 350px;
			margin-right: 150px;
			border-radius: 30px;
		}
		.cat input[type='text']{
			border: none;
			font-size: 28px;
			margin-left: 20px;
		}
		.cat input[type='submit']{
			margin-top: 10px;
			font-size: 30px;
			width: 200px;
			border-radius: 10px;
			font-family: monospace;
		}
	    .grid {
            margin-top:10px;
            padding:40px;
            margin-left:500px;
	    }
	        .grid table {
                padding:30px;
                font-size:40px;
                text-align:center;
	        }
	        .grid th {
                font-family:monospace;
                padding:20px;
    	        }
	        .grid td {
                font-size:18px;

	        }
	</style>
</head>
<body>
	<center>
		<div class="cat">
			<table>
				<tr><td>Enter Category Name:</td><td><asp:TextBox ID="txtCate" runat="server" required></asp:TextBox></td></tr>
			</table>
			<center><asp:Button ID="btnAdd" runat="server" Text="ADD" OnClick="btnAdd_Click"></asp:Button></center>
		</div>
		<div class="grid">
            <table>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <center><table>
                                <tr><th>CATEGORY LIST</th></tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr><td><%#Eval("Categoryname")%></td></tr>
                            <tr><td><hr /></td></tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table></center>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                </table>
      </div>
	</center>
</body>
</html>
</asp:Content>
