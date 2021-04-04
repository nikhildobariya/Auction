<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="AuctionManagementSystem.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html>
<head>
	<title></title>
	<style type="text/css">
		.pro
		{
			background: silver;
			margin-top: 70px;
			margin-left: 430px;
			margin-right: 80px;
			padding: 20px;
		}
		h2{
			padding: 10px;
		}
	    input[type="text"],[type="password"] {
            border:none;
            font-size:15px;
            background:none;
            border-bottom:3px solid black;
	    }
		.pro table{
			background: gold;
			padding: 20px;
			font-family: monospace;
			font-size: 22px;
		}
		.pro td{
			padding: 10px;
		}
		.pro input[type='submit']{
			border: none;
			padding: 10px;
			font-size: 18px;
		} 
		.chpasswd{
			background: gold;
			margin-top: 10px;
			margin-left: 435px;
			margin-right: 80px;
		}
		.chpasswd table{
			background: silver;
			padding: 20px;
			font-family: monospace;
			font-size: 22px;
		}
		.chpasswd td{
			padding: 10px;
		}
		.chpasswd input[type='submit']{
			border: none;
			padding: 10px;
			font-size: 18px;
		}

	</style>
</head>
<body>
    <form runat="server"> 
        <center>
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            <div class="chpasswd">
		<h2>Change Password</h2>
		<table>
			<tr><td>Old Password</td><td><asp:TextBox ID="txtoldPass" runat="server" TextMode="Password" required></asp:TextBox></td></tr>
			<tr><td>New Password</td><td><asp:TextBox ID="txtnewPass" runat="server" TextMode="Password" required></asp:TextBox></td></tr>
			<tr><td>Re-Enter Password</td><td><asp:TextBox ID="txtrePass" runat="server" TextMode="Password" requires></asp:TextBox></td></tr>
            <tr><td><asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="password not matched" ControlToCompare="txtnewPass" ControlToValidate="txtrePass"></asp:CompareValidator></td></tr>
		</table>
		<br>
		<center><asp:Button runat="server" Text="SUBMIT" OnClick="Unnamed1_Click" ></asp:Button></center>
		
	</div>
        </asp:Panel>
        </center>
	<center>
	<div class="pro">
		<h2>PROFILE INFORMATION</h2>
		<table>
			<tr><td>First Name</td><td><asp:Label ID="lblfn" runat="server" Text="Label"></asp:Label><asp:TextBox ID="txtfn" runat="server" Visible="False" required></asp:TextBox></td></tr>
			<tr><td>Last Name</td><td><asp:Label ID="lblln" runat="server" Text="Label"></asp:Label><asp:TextBox ID="txtln" runat="server" Visible="False" required></asp:TextBox></td></tr>
			<tr><td>Contact No</td><td><asp:Label ID="lblcn" runat="server" Text="Label"></asp:Label><asp:TextBox ID="txtcn" runat="server" Visible="false" required></asp:TextBox></td></tr>
			<tr><td>Email Id</td><td><asp:Label ID="lblemail" runat="server" Text="Label"></asp:Label><asp:TextBox ID="txtemail" runat="server" Visible="False" required></asp:TextBox></td></tr>
			<tr><td>Address</td><td><asp:TextBox ID="txtaddress" runat="server" Text="" ReadOnly TextMode="MultiLine"></asp:TextBox></td></tr>
			<tr><td>City</td><td><asp:Label ID="lblcity" runat="server" Text="Label"></asp:Label><asp:DropDownList ID="DropDowncity" runat="server" Visible="False">
                <asp:ListItem>Surat</asp:ListItem>
                <asp:ListItem>Mumbai</asp:ListItem>
                <asp:ListItem>Rajkot</asp:ListItem>
                <asp:ListItem>Goa</asp:ListItem>
                <asp:ListItem>Puna</asp:ListItem>
                <asp:ListItem>Mysore</asp:ListItem>
                <asp:ListItem>Kolkata</asp:ListItem>
                <asp:ListItem>Delhi</asp:ListItem>
                <asp:ListItem>Chennai</asp:ListItem>
                <asp:ListItem></asp:ListItem>
                <asp:ListItem></asp:ListItem>
                </asp:DropDownList></td></tr>
			<tr><td><asp:Button ID="btncp" runat="server" Text="CHANGE PASSWORD" OnClick="btncp_Click"></asp:Button></td><td><asp:Button ID="btnupdate" runat="server" Text="UPDATE" Visible="False" OnClick="btnupdate_Click"></asp:Button><asp:Button ID="btnup" runat="server" Text="UPDATE PROFILE" OnClick="btnup_Click"></asp:Button></td></tr>
		</table>
	</div>
        </center>
   </form>
	
</center>
</body>
</html>
</asp:Content>
