<%@ Page Title="" Language="C#" MasterPageFile="~/indexseller.Master" AutoEventWireup="true" CodeBehind="additem.aspx.cs" Inherits="AuctionManagementSystem.additem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<style>
		body{
			background:orange;
		}
		h1{
			font-family: monospace;
			}
		.item td{
			padding: 15px;
		}
		.item td input[type='text']{
			border: none;
			padding: 15px;
			width: 200px;
			border-radius: 2px;
		}
		.item td input[type='submit']{
			padding: 10px;
			width: 220px;
			border-radius: 10px;
			font-size: 18px;
		}
		.row{
			background: gold;
			width: 270px;
			padding: 20px;
			border-radius: 30px;
		}
		.item td input[type='submit']:hover{
			transition: .5s;
			background: teal;
		}
    .upimg img{
        width:180px;
        height:150px;
        border:2px solid black;
    }
    .slider {
    border:2px solid;
    border-radius:20px;
    }
    .slider image{
        width:900px;
        border-radius:20px;
    }
    .space {
        width:100px;
    }
    select {
        padding:10px;
    }
    .upimg img{
        width:180px;
        height:140px;
        border:2px solid black;
        border-radius:8px;
    }
	</style>
</head>
<body>
    <table>
            <tr>
                <td class="space">

                </td>
                <td>
                     <center><h1>ADD ITEM</h1></center>
            <center><div class="row"> 
			<div class="item">
				<table>
						<tr>
							<td><asp:TextBox ID="txtItem" runat="server" placeHolder="Item Name" required></asp:TextBox></td>
						</tr>
						<tr>
							<td><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Categoryname" DataValueField="Categoryname" required Width="229px"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:amsdb %>" SelectCommand="SELECT [Categoryname] FROM [tblCategory]"></asp:SqlDataSource>
                            </td>
						</tr>
						<tr> <td class="upimg">
                                <center>     <asp:Image ID="Image1" runat="server"/>
                                </center>
                                    </td>
						</tr>
                         <tr>
							<td><asp:FileUpload ID="itemImg" runat="server" required Width="221px"></asp:FileUpload></td>
						</tr>						
						<tr>
							<td><asp:TextBox ID="txtDesc" runat="server" placeHolder="Item Description" TextMode="MultiLine" Width="218px" required></asp:TextBox></td>
						</tr>
						<tr>
							<td><asp:Button ID="btnAdd" runat="server" Text="ADD" OnClick="btnAdd_Click" /></td>
						</tr>
				</table>
		</div>
       </div></center>
                    
                </td>
                <td class="space">

                </td>
                <td>
                    <div class="slider"><img src="poster.jpg" /></div>
                </td>
            </tr>
    </table>
           
</body>
</html>
</asp:Content>

