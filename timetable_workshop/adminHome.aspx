<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminHome.aspx.cs" Inherits="timetable_workshop.adminHome" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Home Admin </title>
    


    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-grid.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <style type="text/css">
        .img{
            float:right;
        }
        
        .democontainer {
            width: 400px ;
            max-width: 100% ;
            margin-left: auto ;
            margin-right: auto ;
        }
        .body{
            height: auto;
            background-repeat:repeat;
            background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
            background-size:auto;
            margin-bottom:130px;
            padding: 25px;
        }
        .auto-style1 {
            margin-top: 0px;
        }
        .auto-style5 {
            width: 1270px;
            text-align: center;
        }
        .auto-style6 {
            margin-left: 440px;
        }
    </style>
    
</head>
<body class="body">
    
    <form id="form1" runat="server">

        <div class="w3-blue-grey">
            <asp:Button ID="ButtonGenerate" class="w3-bar-item w3-button" runat="server" Text="Generate Timetable" Font-Size="Medium" OnClick="ButtonGenerate_Click" Width="199px" />
            <asp:Button ID="ButtonGenerate2" class="w3-bar-item w3-button" runat="server" Text="Generate Timetable 2" Font-Size="Medium" OnClick="ButtonHome2_Click" Width="243px" />
            <asp:Button ID="ButtonLect" class="w3-bar-item w3-button" runat="server" Text="Check Lecturer Timetable" Font-Size="Medium" OnClick="ButtonLect_Click" Width="243px" />
            <asp:Button ID="ButtonRoom" class="w3-bar-item w3-button" runat="server" Text="Check Room Timetable" Font-Size="Medium" OnClick="ButtonRoom_Click" Width="223px" />        
            <asp:Button ID="ButtonCourse" class="w3-bar-item w3-button" runat="server" Text="Check Course Timetable" Font-Size="Medium" OnClick="ButtonCourse_Click" Width="235px" />
            <asp:Button ID="ButtonPDF" class="w3-bar-item w3-button" runat="server" Text="Print to PDF" Font-Size="Medium" OnClientClick="printDiv('printablediv')" OnClick="ButtonPDF_Click" Width="132px" />
            <asp:Button ID="ButtonProfile" class="w3-bar-item w3-button" runat="server" Text="Profile" Font-Size="Medium" OnClick="ButtonProfile_Click" Width="87px" />
            <asp:Button ID="ButtonAdd" class="w3-bar-item w3-button" runat="server" Text="Add Admin" Font-Size="Medium" OnClick="ButtonAdd_Click" Width="121px" />
            <asp:Button ID="ButtonLogOut" class="w3-bar-item w3-button float-right" runat="server" Text="Log Out" Font-Bold="False" OnClick="ButtonLogOut_Click" Font-Size="Medium" Width="103px" />
        </div>
        <br />
        
        <div id="printablediv">
            <br />

            <div>
                Welcome Admin !&nbsp;
                <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Label ID="LabelTotalClass" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
                <br />
                <br />
                <asp:Label ID="LabelTotalLecturer" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
                <br />
                <br />
        
            
            <div class="auto-style5">
                <asp:Button ID="Button1" runat="server" Font-Bold="True" OnClick="Button1_Click" Text="Generate for lecture" Width="246px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button4" runat="server" Font-Bold="True" OnClick="Button2_Click" Text="Generate for lab 1" Width="246px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button5" runat="server" Font-Bold="True" OnClick="Button5_Click" Text="Generate for lab 2" Width="246px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Font-Bold="True"  OnClick="Button3_Click" Text="Clear all data in database" />
                    <br />
            </div>
                <br />
        <div class="auto-style6" >
            
            <asp:Image ID="Image2" runat="server" Width="400px" Height="200px" />
        </div>
                <br />
            </div>
            <div>
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="Black" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" CssClass="auto-style1" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound1" Width="1200px" Visible="False">
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
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Timetable_proConnectionString3 %>" SelectCommand="SELECT [Day] FROM [Timetable]"></asp:SqlDataSource>
                
                <br />
                
            </div>
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
