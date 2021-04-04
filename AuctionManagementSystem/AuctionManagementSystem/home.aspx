<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="AuctionManagementSystem.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .ca{
		background:#fff;
		height: 650px;
        width:1295px;
        padding:20px;
		overflow: scroll;
		font-family:Lucida Fax; 
		font-weight: bold;
	}

	.outer td{
		padding:15px;
		width: inherit;
		border: 5px solid #09717c;
        border-radius:8px;
		background: #17c2bd;
		-webkit-box-shadow:rgba(0,0,0,0.5) 5px 5px 10px;
	}
	.outer input[type='button']{
		padding: 10px;
		border: none;
        width:100%;
		border-radius: 10px;
		background: #15bec3;
		color: white;
		font-weight: bold;
	}
	.outer input[type='button']:hover{
		background: #18e22f;
		color: black;
	}
	.outer img{
		width: 200px;
		height: 200px;
		border: 2px soild gray;
		border-radius: 10px;
	}
	    .inner td {
	        border: none;
            font-family: Bahnschrift;
	    }
    </style>
    <body>
        <asp:Panel ID="Panel1" runat="server">
         <center>
	<div class="ca">
      <h1>WINNER OF THE AUCTIONS</h1>
		
		<table class="outer">
			<tr><th></th></tr>
			<tr>
                
           
           <asp:Repeater ID="Repeater1" runat="server">

               <HeaderTemplate></HeaderTemplate>
                
               <ItemTemplate>

                    <td>
				        <center><img src='<%#Eval("itemimg") %>'></center>
                        <br />
                        <div >
				            <table class="inner">
                                <tr><td>Name:</td><td><%#Eval("Name") %></td></tr>
                                <tr><td>Initial Price:</td><td><%#Eval("InitPrice") %></td></tr>
                                <tr><td>Sold Price:</td><td><%#Eval("bidprice") %></td></tr>
                                <tr><td>WINNER USER:</td><td><%#Eval("Email")%></td></tr>
				            </table>
                            </div>
				         </td>

                </ItemTemplate>

               <FooterTemplate></FooterTemplate>

           </asp:Repeater>
                

			</tr>
		</table>
		
	</div>
    </center>
        </asp:Panel>
    
    <div class="mid">

		<hr>
		<img src="poster.jpg">			
	</div>
        </body>
</asp:Content>
