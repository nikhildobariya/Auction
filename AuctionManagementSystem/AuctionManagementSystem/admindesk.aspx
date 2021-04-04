<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admindesk.aspx.cs" Inherits="AuctionManagementSystem.admindesk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html>
<head>
	<title></title>
	<style type="text/css">
		.admin {
			padding: 10px;
			margin-right: 60px;
			margin-left: 250px;
			margin-top: 30px;
		}
		.admin table{
			background: silver;
			padding: 20px;
		}
		.admin td{
			background: gold;
			padding: 20px;
			font-family: monospace;
		}

	</style>
</head>
<body>
	<center>
	<div class="admin">
		<table>
			<tr>
				<td><div class="s">
		<center><h2>TOTAL SELLERS</h2>
		<h3><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></h3></center>
		</div></td>
		<td><div class="s">
		<center><h2>TOTAL AUCTION ITEMS</h2>
		<h3><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></h3></center>
		</div></td>
		<td>
			<div class="s">
		<center><h2>TOTAL AUCTIONEER</h2>
		<h3><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h3></center>
		</div>
		</td>
			</tr>
		</table>
	</div>
        <img src="poster.jpg">
</center>

</body>
</html>
</asp:Content>
