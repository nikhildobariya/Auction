<%@ Page Title="" Language="C#" MasterPageFile="~/indexseller.Master" AutoEventWireup="true" CodeBehind="contactusseller.aspx.cs" Inherits="AuctionManagementSystem.contactusseller" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
	width:300px;
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
        margin-top:70px;
    border:2px solid;
    border-radius:20px;
    }
    .slider image{
        width:900px;
        height:400px;
        border-radius:20px;
    }
	</style>
<body>
    
    <table>
        <tr>
            <td>
                <center><h1>Contact us</h1>
                </center>
		<center><div class="row">
			<div class="register">
				<table>
						<tr>
							<td><asp:TextBox ID="txtname" runat="server" placeHolder="Enter Name" required></asp:TextBox></td>
						</tr>
						<tr>
							<td><asp:TextBox ID="txtEmail" runat="server" placeHolder="Enter email id" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required ></asp:TextBox></td>
						</tr>
						
						<tr>
							<td><asp:TextBox ID="txtContact" runat="server" placeHolder="Enter Contact No" required pattern="[0-9]{10}"></asp:TextBox></td>
						</tr>
                        <tr>
							<td><asp:TextBox ID="txtsubject" runat="server" placeHolder="Enter Subject" required></asp:TextBox></td>
						</tr>
                        <tr>
							<td><asp:TextBox ID="txtMessage" runat="server" placeHolder="Enter your message" required TextMode="MultiLine" Height="86px" Width="288px"></asp:TextBox></td>
						</tr>
                    	<tr>
							<td><asp:Button ID="btn_next" runat="server" Text="SUBMIT"></asp:Button></td>
						</tr>
				</table>
			</div>		
		        </div></center>
            </td>
            <td>
                <div class="slider"><img src="" name="image" /></div>
            </td>
        </tr>
    </table>
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
</asp:Content>
