<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="AuctionManagementSystem.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html>
<head>
	<title></title>
	<style type="text/css">
			body{
                color:black;
			}

			.loginBox{
				padding-left: 20px;
				padding-right: 20px;
				width: 350px;
				height: 400px;
				background: rgba(0,0,0,0.3);
				color: #fff;
                margin-left:500px;
                margin-top:40px;
				box-sizing: border-box;
				border-radius: 8px; 
				-webkit-box-shadow:rgba(0,0,0,0.5) 5px 5px 10px;
			}

			h1{
				text-align: center;
			}

			.loginBox p{
				font-weight: bold;
				font-family: Copperplate Gothic;
			}

			.loginBox input{
				width: 100%;
				margin-bottom: 20px;
			}

			.loginBox input[type="text"],input[type="password"]{
				border: none;
				border-bottom: solid 2px #fff;
				outline: none;
				background: rgba(0,0,0,0);
				font-size: 20px;
				border-radius: 5px;
			}
			.loginBox input[type="submit"]{
				border: none;
				font-size: 20px;
				padding: 5px;
				background: #ffffff;
				color: #f54309;
				border-radius: 30px;
				border-bottom: solid 2px #f54309;
				border-right: solid 2px #f54309;
				-webkit-box-shadow:rgba(0,0,0,0.5) 5px 5px 8px;
				font-family:'Adobe Gothic Std';
			}
			.loginBox input[type="submit"]:HOVER{
				background: black;
				color: #ffffff;
				border-bottom:solid 3px #fff;
				border-right: solid 3px #fff;
				transition: 600ms;
			}
	</style>
</head>
<body>
	<div class="loginBox">
        
		<h1>LOGIN HERE</h1>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
		<form action="" method="post" runat="server">
			<p>Email Id</p>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="enter user name" required="required" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"></asp:TextBox>
			<p>Password</p>
            <asp:TextBox ID="txtPasswd" runat="server" placeholder="enter password" required="required" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
		</form>
	</div>
</body>
</html>
</asp:Content>
