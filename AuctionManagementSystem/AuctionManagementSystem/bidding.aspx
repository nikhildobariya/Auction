<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="bidding.aspx.cs" Inherits="AuctionManagementSystem.bidding" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html>
<head>
	<title></title>
	<style type="text/css">

	    body {
            background:#0de85b;
	    }		
		.img img{
			width:550px;
			height: 390px;
			border-radius: 10px;
		}
		.d1{
			background: gold;
			padding: 40px;
			margin-right: 100px;
			margin-left: 100px;
			margin-top: 60px;
			border-radius: 3px;
			margin-bottom: 60px;
		}
	    .txtdesc{
            background:none;
            font-size:22px;
            color:white;
            border:none;
	    }
		.item{
			padding: 40px;
			border-radius: 10px;
			background:#800800;
			color: white;
			font-family: monospace;
		}
		.item table{
			font-size: 25px;
		}
		.item td{
			padding: 10px;
		}
		.bid{
			margin-top: 10px;
			background: #800829;
			border-radius: 10px;
			padding: 10px;
			color: white;
            width:100%;
		}
		.bid td{
			padding: 4px;
			font-size: 27px;
			font-family: monospace;
		}
		.bid td input[type='text']{
			padding: 11px;
			width: 300px;
			border: none;
			border-radius: 5px;
			font-size: 20px;
		}
		.bid td input[type='submit']{
			font-size: 20px;
			padding: 11px;
			border:none;
			width: 200px;
			border-radius: 5px;
		}
		.bid td input[type='submit']:hover{
			background: #5ed71d;
			transition: .4s;
			color: white;
		}
	    .seller {
            width:100%;
	    }
		.seller table{
			margin-top: 20px;
			background: #d7103b;
			padding: 20px;
			border-radius: 20px;
		}
		.seller td{
			padding: 5px;
			font-size: 25px;
			font-family: monospace;
		}
		.info table{
			background: #ebdfdf;
			color: black;
		}
	    
	</style>
</head>
<body>
	<div class="d1">
        <form id="Form1" runat="server">
		<center>
		<table>
			<tr>
			<td>
				<div class="img">
					<asp:Image ID="Image1" runat="server"></asp:Image>
				</div>
			</td>
			<td>
				<div class="item">
					<center><h3>ITEM INFO</h3></center>
				<table>
					<tr><td>Name :</td><td><asp:Label ID="lblItem" runat="server" Text="Label"></asp:Label></td></tr>
					<tr><td>Category :</td><td><asp:Label ID="lblcate" runat="server" Text="Label"></asp:Label></td></tr>
					<tr><td>Initial Price :</td><td><asp:Label ID="lblinitprice" runat="server" Text="Label"></asp:Label></td></tr>	
                    <tr><td>Description </td><td><asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" ReadOnly Class="txtdesc" Height="38px" Width="178px"></asp:TextBox></td></tr>
					<tr><td>Last Bid: </td><td><asp:Label ID="lbllastprice" runat="server" Text="Label"></asp:Label></td></tr>
                    <tr><td>Last Bid Time:</td><td><asp:Label ID="lbltime" runat="server" Text="Label"></asp:Label></td></tr>
				</table>
			</div>
			</td>
		</tr>
		</table>
		<div class="bid">
        
      	<table>
			<tr>
				<td>
					<p>Enter Your Bid Price:</p>
				</td>
				<td>
					<asp:TextBox ID="txtBidprice" runat="server"></asp:TextBox>
				</td>
				<td>
					<asp:Button ID="Button1" runat="server" Text="Place Bid"></asp:Button>
				</td>
			</tr>
		</table>
        </form>
	</div>
	<div class="seller">
		<table>
			<tr>
				<td>
					<center><h3>SELLER INFORMATION</h3></center>
					<div class="info">
					<table>
						<tr><td>Name:</td><td><asp:Label ID="lblsname" runat="server" Text="Label"></asp:Label></td></tr>
						<tr><td>Email:</td><td><asp:Label ID="lblemaill" runat="server" Text="Label"></asp:Label></td></tr>
						<tr><td>Contact No:</td><td><asp:Label ID="lblcno" runat="server" Text="Label"></asp:Label></td></tr>
                        <tr><td>City:</td><td><asp:Label ID="lblcity" runat="server" Text="Label"></asp:Label></td></tr>
						
					</table>
					</div>
				</td>
			</tr>
		</table>
	</div>
		</center>
	</div>
	

</body>
</html>
</asp:Content>
