<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="upcomingauction.aspx.cs" Inherits="AuctionManagementSystem.upcomingauction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!DOCTYPE html>
<html>
<head>
	<title>auction</title>
	<style type="text/css">
	body{
		
		overflow: scroll;
	}

	.ca{
		background:white;
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
		background: gold;
		-webkit-box-shadow:rgba(0,0,0,0.5) 5px 5px 10px;
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
</head>
<body>
    <center>
	<div class="ca">
      <h1>Upcoming Auction</h1>
		
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
                                <tr><td>Category:</td><td><%#Eval("categoryname") %></td></tr>
                                <tr><td>Initial Price:</td><td><%#Eval("InitPrice") %></td></tr>
                                <tr><td>Start Date:</td><td><%# Convert.ToDateTime(Eval("startdate")).ToShortDateString()%></td></tr>
                                <tr><td>End Date:</td><td><%#Convert.ToDateTime(Eval("enddate")).ToShortDateString()%></td></tr>
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
</body>
</html>
</asp:Content>
