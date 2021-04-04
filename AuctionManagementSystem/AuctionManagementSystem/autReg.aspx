<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="autReg.aspx.cs" Inherits="AuctionManagementSystem.autReg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<style>
	body{
		background:#dcf808;	
	}
	h1{
	font-family: Showcard Gothic;	
	}
	
	.row{
        background:#fff;
        border-radius:30px;
	}
	.register{
	font-family: cursive;
	padding: 20px;
	border: solid 8px #000033;
	border-radius:30px;
	}
	.register input[type="text"],input[type="email"],input[type="tel"],input[type="password"],input[type="numeric"]{
	border: none;
	border-bottom: solid 2px;
	width:100%;
	font-size:15px;
	padding-top: 5%;
	padding-bottom: 5%;
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
        margin-top:40px;
    border:2px solid;
    border-radius:20px;
    }
    .slider image{
        width:900px;
        border-radius:20px;
    }
	.auto-style1 {
        width: 396px;
    }
	</style>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validation()">
    <table>
        <tr>
            <td>
                <center><h1>Register Here</h1></center>
		<center><div class="row">
			<div class="register">
				<table><asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
						<tr>
							<td class="auto-style1"><asp:TextBox ID="txtFname" runat="server" placeHolder="Enter First Name" required></asp:TextBox></td>
						</tr>
						
						<tr>
							<td class="auto-style1"><asp:TextBox ID="txtLname" runat="server" placeHolder="Enter Last Name" required></asp:TextBox></td>
						</tr>
						<tr>
							<td class="auto-style1"><asp:TextBox ID="txtEmail" runat="server" placeHolder="Enter email id" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required ></asp:TextBox></td>
						</tr>
						
						<tr>
							<td class="auto-style1"><asp:TextBox ID="txtContact" runat="server" placeHolder="Enter Contact No" required pattern="[0-9]{10}"></asp:TextBox></td>
						</tr>
						
						<tr>
							<td class="auto-style1">
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" placeholder="enter address" Width="279px"></asp:TextBox>
                            </td>
						</tr>
						<tr>
							<td style="margin-top: 5px;" class="auto-style1"><asp:RadioButton ID="rbtMale" Text="Male" runat="server"  GroupName="Gender" Checked="True"></asp:RadioButton><asp:RadioButton ID="rbtFemale" runat="server" Text="Female" GroupName="Gender"></asp:RadioButton></td>
						</tr>
						<tr>
							<td class="auto-style1"><p>City :    <asp:DropDownList ID="dropdowncity" runat="server" required>
                                <asp:ListItem>Surat</asp:ListItem>
                                <asp:ListItem>Mumbai</asp:ListItem>
                                <asp:ListItem>Goa</asp:ListItem>
                                <asp:ListItem>Banglore</asp:ListItem>
                                <asp:ListItem>Delhi</asp:ListItem>
                                <asp:ListItem>Jaipur</asp:ListItem>
                                <asp:ListItem>Kolkata</asp:ListItem>
                                <asp:ListItem>Mysore</asp:ListItem>
                                <asp:ListItem>Chennai</asp:ListItem>
                                <asp:ListItem>Hydrabad</asp:ListItem>
                                </asp:DropDownList></p></td>
						</tr>
                        <tr>
                            <td style="margin-top: 5px;" class="auto-style1"><asp:RadioButton ID="rbtAuctioneer" Text="Auctioneer" runat="server" GroupName="Role" Checked="True" ></asp:RadioButton><asp:RadioButton ID="rbtSeller" runat="server" Text="Seller" GroupName="Role" ></asp:RadioButton> </td>
                        </tr>
                        <tr>
							<td class="auto-style1"><asp:TextBox ID="txtPass" runat="server" placeHolder="Enter Password" required TextMode="Password"></asp:TextBox></td>
						</tr>
						<tr>
							<td class="auto-style1">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass" ControlToValidate="txtRepass" ErrorMessage="password not match" ForeColor="Red"></asp:CompareValidator>
                                <asp:TextBox ID="txtRepass" runat="server" placeHolder="Re-Enter Password" required TextMode="Password"></asp:TextBox></td>
						</tr>
						<tr>
							<td class="auto-style1"><asp:Button ID="btn_next" runat="server" Text="SUBMIT" OnClick="Button1_Click"></asp:Button></td>
						</tr>
				</table>
			</div>		
		        </div></center>
            </td>
            <td>
                <div class="slider"><img src="" name="image" height="600"/></div>
            </td>
        </tr>
    </table>
		
    </form>
    <script type="text/javascript">

        function validation() {
            var fname = document.getElementById('txtFname').value;

            if (fname=='') {
                alert('all fields required');
            }
            return false;
        }

    </script>
    <script type="text/javascript">
        var i = 0;
        var images = [];
        var time = 2000;

        images[0] = 's1.png';
        images[1] = 's2.jpg';
        images[2] = 's3.jpg';
        images[3] = 'poster.jpg';
        images[4] = 's4.jpg';
        images[5] = 's5.jpg';


        function slider() {
            document.image.src = images[i];
            if (i < images.length - 1) {
                i++;
            }
            else {
                i = 0;
            }

            setTimeout("slider()", time);
            // body...

        }
        window.onload = slider;
</script>
</body>
</html>
</asp:Content>
