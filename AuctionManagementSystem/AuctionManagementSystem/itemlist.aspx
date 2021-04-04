<%@ Page Title="" Language="C#" MasterPageFile="~/indexseller.Master" AutoEventWireup="true" CodeBehind="itemlist.aspx.cs" Inherits="AuctionManagementSystem.itemlist" EnableEventValidation="false"%>
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
           width: 840px;
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
           margin-left:430px;
       }
        .search input[type='submit'] {
               border-radius:5px;        
               font-size:20px;
               padding:10px;
           }
       .st {
           border:none;
           font-size:20px;
           margin-left:400px;
           padding:10px;
           border-radius:5px;
       }
   </style>
  <body>
      <div class="search">
          <table>
              <tr>
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
                                                        <tr><th><asp:Label ID="Label1" runat="server" Text="Item Name"></asp:Label></th><th colspan="2"><asp:Label ID="Label3" runat="server" Text="Category"></asp:Label></th></tr>
                                                        <tr><td><%#Eval("Name") %></td><td colspan="2"><%#Eval("categoryname") %></td></tr>
                                                        <tr><td>
                                                            <a href="addAuction.aspx?id=<%#Eval("Iid") %>">Add To Auction</a>
                                                            </td>
                                                            <td class="r"><a  href="removeitem.aspx?id=<%#Eval("Iid") %>&msg=il">Remove</a></td>
                                                            <td class="u"><a  href="additem.aspx?id=<%#Eval("Iid") %>&msg=u">Update</a></td>
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
