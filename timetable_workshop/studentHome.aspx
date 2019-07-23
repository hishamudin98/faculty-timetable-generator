<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentHome.aspx.cs" Inherits="timetable_workshop.studentHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Student</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style type="text/css" >
        .auto-style1 {
            margin-left: 40px;

        }
        .img{
            float:right;
        }
        
        .democontainer {
            width: 400px ;
            max-width: 100% ;
            margin-left: auto ;
            margin-right: auto ;
        }
        .auto-style2 {
            margin-left: 240px;
        }
        .body{
            height: 200%;
            background-repeat:repeat;
            background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
            background-size:auto;

            padding: 25px;
        }
        .auto-style3 {
            margin-left: 1100px;
        }
        .landScape
        { 
            width: 100%; 
            height: 100%; 
            margin: 0% 0% 0% 0%; 
            filter: progid:DXImageTransform.Microsoft.BasicImage(Rotation=3);
}
    </style>
</head>
<body class="body">
    
    
    
    <form id="form1" runat="server">
        <div class="w3-blue-grey">
        <asp:Button ID="Button5" CssClass="w3-bar-item w3-button" runat="server" Text="Home" Font-Size="Large" OnClick="Button5_Click" />
        <asp:Button ID="Button4" CssClass="w3-bar-item w3-button" runat="server" Text="Profile" Font-Size="Large" OnClick="Button4_Click" />
        <asp:Button ID="Button3" CssClass="w3-bar-item w3-button" runat="server" OnClientClick="printDiv('printablediv')" Text="Download Timetable PDF" Font-Size="Large" OnClick="Button3_Click" />
        <asp:Button ID="Button1" CssClass="w3-bar-item w3-button" runat="server" Text="Log Out" Font-Size="Large" OnClick="Button1_Click" />

        
        </div>
        <br />
    <br />
        
        <div id="printablediv">
            <div class="auto-style1">
            
            <div class="democontainer">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Image ID="Image1" runat="server" Width="118px" BorderStyle="Groove" Height="134px" />
            </div>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <asp:Label ID="Label1" runat="server" Font-Bold="True"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Font-Bold="True"></asp:Label>
            <br />
            <br />
            
        </div>
            <div >
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="Black" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
                    <asp:TemplateField HeaderText="1" ItemStyle-HorizontalAlign="Center"></asp:TemplateField>
                    <asp:TemplateField HeaderText="2" ItemStyle-HorizontalAlign="Center"></asp:TemplateField>
                    <asp:TemplateField HeaderText="3" ItemStyle-HorizontalAlign="Center"></asp:TemplateField>
                    <asp:TemplateField HeaderText="4" ItemStyle-HorizontalAlign="Center"></asp:TemplateField>
                    <asp:TemplateField HeaderText="5" ItemStyle-HorizontalAlign="Center"></asp:TemplateField>
                    <asp:TemplateField HeaderText="6" ItemStyle-HorizontalAlign="Center"></asp:TemplateField>
                    <asp:TemplateField HeaderText="7" ItemStyle-HorizontalAlign="Center"></asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Timetable_proConnectionString %>" SelectCommand="SELECT * FROM [Timetable]"></asp:SqlDataSource>
            <br />
        </div>
     </div>
        
        
        <div class="auto-style2">
            <br />
            <br />
        </div>
        <div >
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Image ID="Image2" runat="server" Width="400px" Height="200px" />
        </div>
    </form>
</body>
</html>
<script>
	function printDiv(divID) {
            //Get the HTML of div
        var divElements = document.getElementById(divID).innerHTML;
        //divElements.border = 2;
            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML o"<br />"y
        document.body.innerHTML = divElements;

            //Print Page
            window.print();

            //Restore orignal HTML
            document.body.innerHTML = oldPage;


        }
    </script>