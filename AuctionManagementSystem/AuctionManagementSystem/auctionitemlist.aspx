<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="auctionitemlist.aspx.cs" Inherits="AuctionManagementSystem.auctionitemlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
       .space {
           width:300px;
       }
       .list img{
		width: 180px;
		height: 150px;
		border-radius: 10px;
        border:2px solid #5e435f;
	    }
       .list {
           width: 1100px;
           height:500px;
           background:white;
           overflow-y:scroll;
       }
      .list table {
           padding:30px;
           width:600px;
       }
       .outer{
           padding:15px;
       }
       .inner th {
           padding:10px;
           background:gold;
           border-radius:2px;
           font-family:Candara;
           font-size:20px;
       }
       .inner table td {
           padding:15px;
           text-align:center;
           font-family:'Century Gothic';
       }
       .inner a{
           padding:10px;
           border:2px solid silver;
           font-weight:bold;
           font-family:'Adobe Fan Heiti Std';

       }
       .inner a:hover{
           background:silver;
           color:black;
           transition:.6s;
           border:2px solid white;
       }
       .r a:hover{
           background:#e94f4f;
           transition:.6s;
           border:2px solid white;
       }
       .u a:hover {
        background:#1ca4e0;
           transition:.6s;
           border:2px solid white;

       }
        .slider {
            margin-top:200px;
            border-radius:20px;
    }
    .slider image{
        width:1320px;
        height:300px;
        border-radius:20px;
    }
       .search {
           margin-top:20px;
           margin-left:150px;
       }
        .search input[type='submit'] {
               border-radius:5px;        
               font-size:20px;
               padding:10px;
           }
        .search input[type='submit']:hover {
                border:none;
               background:#d9cece;
                border-radius:5px;        
               font-size:20px;
               padding:10px;
           }
       .st {
           border:none;
           font-size:20px;
           margin-left:250px;
           padding:10px;
           border-radius:5px;
       }
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
		background: #28eeb7;
		-webkit-box-shadow:rgba(0,0,0,0.5) 5px 5px 10px;
	}
	.outer input[type='button']{
		padding: 10px;
		border: none;
        width:100%;
		border-radius: 10px;
		background: #1888ac;
		color: white;
		font-weight: bold;
	}
	.outer input[type='button']:hover{
		background: #aea2a2;
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
      <div class="search">
          <table>
              <tr>
                  <td>
                      <asp:Button ID="btnCa" runat="server" Text="Current Auction" OnClick="btnCa_Click" /></td>
                  <td>
                      <asp:Button ID="btnUa" runat="server" Text="Upcoming Auction" OnClick="btnUa_Click" /></td>
                  <td>
                      <asp:Button ID="btnCla" runat="server" Text="Closed Auction" OnClick="btnCla_Click" /></td>
                  <td>
                      <asp:DropDownList ID="DropDowncate" runat="server" Class="st" DataSourceID="SqlDataSource1" DataTextField="Categoryname" DataValueField="Categoryname"></asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:amsdb %>" SelectCommand="SELECT [Categoryname] FROM [tblCategory]"></asp:SqlDataSource>
                  </td>
                  <td><asp:Button ID="btnSearch" runat="server" Text="SEARCH" OnClick="btnSearch_Click" /></td>
              </tr>
              </table>
      </div>
      <center>
          <br />
          <asp:Panel ID="pnupcoming" runat="server" Visible="False">
              <center>
	<div class="ca">
      <h1>Upcoming Auction</h1>
		
		<table class="outer">
			<tr><th></th></tr>
			<tr>
                
           
           <asp:Repeater ID="Repeater3" runat="server">

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
          </asp:Panel>
          <asp:Panel ID="pnclosed" runat="server" Visible="False">
              <div class="ca">
      <h1>Closed Auction</h1>
		
		<table class="outer">
			<tr><th></th></tr>
			<tr>
                
           
           <asp:Repeater ID="Repeater2" runat="server">

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
                                <tr><td>Sold Price:</td><td><%#Eval("maxprice") %></td></tr>
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
    <asp:Panel ID="pncurrent" runat="server" Visible="False">
                    <center>
	<div class="ca">
      <h1>Current Auction</h1>
		
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
                                <tr><td>Last Bid Price:</td><td><%#Eval("maxprice") %></td></tr>
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
                </asp:Panel>
         <asp:Panel ID="itemlist" runat="server">
      <table>
          <tr>
              <td class="space">

              </td>
              <td class="space">

              </td>
              <td class="item">
                  <div class="list">
                      <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                        
                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                          <Columns>
                              <asp:TemplateField>
                                  <ItemTemplate>
                                      <table>
		                                    <tr>
			                                    <td class="outer">
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("itemImg") %>'/>
			                                    </td>
			                                    <td>
                                                    <div class="inner">
                                                    <table >
                                                        <tr><th><asp:Label ID="Label1" runat="server" Text="Item Name"></asp:Label></th><th><asp:Label ID="Label3" runat="server" Text="Category"></asp:Label></th><th><asp:Label ID="lbl" runat="server" Text="Email"></asp:Label></th><th><asp:Label ID="Label2" runat="server" Text="Initprice"></asp:Label></th><th><asp:Label ID="Label4" runat="server" Text="Startdate"></asp:Label></th><th><asp:Label ID="Label5" runat="server" Text="Enddate"></asp:Label></th><th><asp:Label ID="Label6" runat="server" Text="Status"></asp:Label></th><th><asp:Label ID="Label7" runat="server" Text="Actions"></asp:Label></th></tr>
                                                        <tr><td><%#Eval("Name") %></td><td><%#Eval("categoryname") %></td><td><%#Eval("Email") %></td><td><%#Eval("Initprice") %></td><td><%#Eval("Startdate") %></td><td><%#Eval("Enddate") %></td><td><%#Eval("Status")%></td>
                                                            <td class="r"><a href="activedeactive.aspx?id=<%#Eval("aid")%>&msg=item">ACTIVE/DEACTIVE</a></td>
                                                        </tr>
                                                    </table>
                                                        </div>
			                                    </td>
		                                    </tr>
	                                </table>       
                                          </div>
                                  </ItemTemplate>
                              </asp:TemplateField>
                          </Columns>
                          <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                          <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                          <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                          <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                          <SortedAscendingCellStyle BackColor="#F7F7F7" />
                          <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                          <SortedDescendingCellStyle BackColor="#E5E5E5" />
                          <SortedDescendingHeaderStyle BackColor="#242121" />
                      </asp:GridView>
                  </div>
              </td>
              <td class="space">

              </td>
              <td class="space">

              </td>
          </tr>
      </table>
          <div class="slider"><img src="poster.jpg" /></div>
          </center>
      </asp:Panel>
  </body>
</asp:Content>
