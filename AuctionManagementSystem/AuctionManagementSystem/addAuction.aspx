<%@ Page Title="" Language="C#" MasterPageFile="~/indexseller.Master" AutoEventWireup="true" CodeBehind="addAuction.aspx.cs" Inherits="AuctionManagementSystem.addAuction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
	body{
		background:#f6af05;	
	}
	h1{
	font-family: Showcard Gothic;	
	}
        .space {
            width:470px;
        }
	
	.row{
        background:#fff;
        border-radius:30px;
	}
	.register{
	font-family:Halvar;
	padding: 20px;
	border: solid 8px #000033;
	border-radius:30px;
	}
	.register input[type="text"],input[type="email"],input[type="tel"],input[type="password"],input[type="numeric"],input[type='date']{
	border: none;
	border-bottom: solid 2px;
	width:300px;
	font-size:15px;
	padding-top: 5%;
	padding-bottom: 5%;
    font-family:'Lithos Pro';

	}
	.register input[type="radio"]{
	margin: 10px;
	}
	.register input[type="submit"]{
	border: none;
	margin-top:10px;
	width: 100%;
	height: 30px;
	background: teal;
	border-radius:10px;
	border-bottom: solid 3px #000;
	}
	.register input[type="submit"]:HOVER {
	background: yellow;
	-webkit-box-shadow:rgba(0,0,0,0.5) 5px 5px 8px;
	}
    .slider {
        margin-top:70px;
    border:2px solid;
    border-radius:20px;
    }
    .slider image{
        width:900px;
        border-radius:20px;
    }
	    .auto-style1 {
            height: 33px;
        }
        .register img {
            width:200px;
            height:200px;
            border-radius:10px;
            border:2px solid black;
        }
        .hide {
            display:none;
        }
	</style>
<body>
    
    <table>
        <tr>
            <td class="space">

            </td>
            <td>
                <center><h1><asp:Label ID="Label1" runat="server" Text="ADD AUCTION"></asp:Label></h1>
                </center>
		<center><div class="row">
			<div class="register">
				<table>
						<tr>
							<td><center>
                                <asp:Image ID="iImg" runat="server"></asp:Image></center></td>
						</tr>
						<tr>
							<td class="auto-style1"><asp:TextBox ID="txtItemname" runat="server" placeHolder="Enter Item" required ReadOnly="True"></asp:TextBox></td>
						</tr>
						
						<tr>
							<td><asp:TextBox ID="txtBidprice" runat="server" placeHolder="Enter Initial Price" required pattern="[0-9]{1,10}"></asp:TextBox></td>
						</tr>
                        <tr>
                            <td class="hide"><asp:TextBox ID="txtcdate" runat="server"></asp:TextBox></td>
							<td>Start Date <asp:TextBox ID="txtSdate" runat="server" placeHolder="Enter Start Date" required TextMode="Date" Width="294px"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="choose valid date!!" ControlToValidate="txtSdate" Operator="GreaterThanEqual" Type="Date" ControlToCompare="txtcdate" Font-Bold="False" Font-Italic="False" Font-Names="Agency FB" ForeColor="Red"></asp:CompareValidator></td>
						</tr>
                        <tr>
							<td>End Date   
                                <asp:TextBox ID="txtEdate" runat="server" placeHolder="Enter End Date" required TextMode="Date" Width="291px"></asp:TextBox><asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="choose date greater than start date!!" ControlToCompare="txtSdate" ControlToValidate="txtEdate" Operator="GreaterThanEqual" Type="Date" Font-Names="Agency FB" ForeColor="Red"></asp:CompareValidator></td>
						</tr>
                    	<tr>
							<td><asp:Button ID="btn_addauction" runat="server" Text="ADD TO AUCTION" OnClick="btn_addauction_Click"></asp:Button></td>
						</tr>
				</table>
			</div>		
		        </div></center>
            </td>
            <td class="space"></td>
        </tr>
    </table>
		
    
</body>
</asp:Content>
