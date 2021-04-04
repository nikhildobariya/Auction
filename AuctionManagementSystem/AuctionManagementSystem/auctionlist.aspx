<%@ Page Title="" Language="C#" MasterPageFile="~/indexseller.Master" AutoEventWireup="true" CodeBehind="auctionlist.aspx.cs" Inherits="AuctionManagementSystem.auctionlist" %>
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
           width: 1000px;
           height:500px;
           background:white;
           overflow-y:scroll;
       }
      .list table {
           padding:30px;
           width:auto;
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
           width:120px;
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
   </style>
    <body>
      <center>
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
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("itemimg") %>'/>
			                                    </td>
			                                    <td>
                                                    <div class="inner">
                                                    <table >
                                                        <tr><th><asp:Label ID="Label1" runat="server" Text="Item"></asp:Label></th><th><asp:Label ID="Label3" runat="server" Text="Inital Price"></asp:Label></th><th><asp:Label ID="Label2" runat="server" Text="Start Date"></asp:Label></th><th><asp:Label ID="Label4" runat="server" Text="End Date"></asp:Label></th><th colspan="2"><asp:Label ID="Label5" runat="server" Text="Actions"></asp:Label></th></tr>
                                                        <tr><td><%#Eval("Name") %></td><td><%#Eval("InitPrice") %></td><td><%#Convert.ToDateTime(Eval("startdate")).ToShortDateString() %></td><td><%#Convert.ToDateTime(Eval("enddate")).ToShortDateString() %></td>
                                                            <td class="r"><a  href="removeitem.aspx?id=<%#Eval("aid") %>&msg=al">Remove</a></td>
                                                            <td class="u"><a  href="addauction.aspx?id=<%#Eval("aid") %>&msg=u">Update</a></td>
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
  </body>
</asp:Content>
