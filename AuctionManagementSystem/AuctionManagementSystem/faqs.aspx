<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="faqs.aspx.cs" Inherits="AuctionManagementSystem.faqs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <style>
        .ca{
		background:#fff;
        width:1000px;
        padding:20px;
		font-family:Lucida Fax;
        margin-left:15%;
	}
         .ca strong {
            font-family:'Adobe Gothic Std';
         }
         .ca p{
             font-family:'Gill Sans MT';
             font-size:15px;
             margin-left:3%;
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
	            <div class="ca">
                <center>  <h1>FAQs</h1></center>
		        <hr />
                    <strong>1.What is Bidde.com all about ? What is the concept?</strong>
                    <p>Bidderboy.com is an unique online auction platform since 2011 that allows you to BID on branded products and gives you a change to WIN products at few rupees. It’s a kind of fun bargain deals and online shopping. 
                    </p>
                    
                    <strong>2.Who can participate in bidder.com online auctions?</strong>
                    <p>Any one above 18+ years of age can sign up and participate in bidderboy auctions. Users from outside india / abroad can also join Bidderboy.com but they will have to pay additional shipping charges for International Shipping.</p>
                    
                    <strong>3.How does Bidder.com auctions work?</strong>
                    <p>Registered Bidderboy users compete each other to win items. The price of the item starts at Rs.0/- and the auction clock starts counting down. Each time a bid is placed, the price of the item increases by a set amount and the auction clock's time gets reset. Once you place a bid, you’re in the lead until the auction clock runs out or someone else places a bid. When the auction clock reaches 00:00 and no more bids are received, the auction is over and the last person who bids wins the auction. winning price and winner's user ID is shown over that closed auction.</p>
                    
                    <strong>4.How can I start bidding on bidder.com auctions?</strong>
                    <p>Getting started is very easy . First, create an account by clicking on the SIGN UP button on homepage, then, purchase any bid credits package by clicking on the TOP-UP CREDITS button. Finally, join an auction that is running live on LIVE AUCTION page by clicking on the BID button. wait till timer reaches 0:0 if you are a last bidder and clock runs out, you are a winner!</p>
                    
                    <strong>5.How long does a bidder.com auction last?</strong>
                    <p>There is no pre-determined end time for auctions. An auction closes after the last person bids and /or the auction clock runs out. It also gets PAUSED if pre-defined auction hours for the day are runs out. It will resume on next day at pre-defined RESUME time.in case of any technical issues or server downtime an auction will go to PAUSED mode automatically.</p>
                    
                    <strong>6.Does each BID have the same price increment?</strong>
                    <p>o, depending on the MRP of the product, there will be a price increment of 10 paisa INR to 50 paisa INR per bid. you can check this rate of price increment around any running auction. Costly products will have higher price increment and vice versa.</p>
                    
                    <strong>7.What type of products does bidder.com put here for auctions?</strong>
                    <p>Basically seller can put painting and sclupture of various category Bidder.com Credit packages and everything else whatever latest trends in and most wanted by youngsters.</p>
                    
                    <strong>8.Can I open more than one account on bidder.com?</strong>
                    <p>No. it is illegal to operate multiple accounts by single user. Our system monitors your IP address and MAC address. If you are found violating this rule, we will terminate your account permanently and your unused credits will be void.</p>
	            </div>
                
        </asp:Panel>
    
    <div class="mid">
		<hr>
		<img src="poster.jpg">			
	</div>
        </body>
</asp:Content>
