<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminCourse.aspx.cs" Inherits="timetable_workshop.adminCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Check Course</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-grid.min.css" rel="stylesheet" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
            height: 200%;
            background-repeat:repeat;
            background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
            background-size:auto;
            margin-bottom:130px;
            padding: 25px;
        }
        </style>
</head>
<body class="body">
    
    <form id="form1" runat="server">
        <div class="w3-blue-grey">
            <asp:Button ID="ButtonGenerate" class="w3-bar-item w3-button" runat="server" Text="Generate Timetable" Font-Size="Medium" OnClick="ButtonGenerate_Click" />
            <asp:Button ID="ButtonLect" class="w3-bar-item w3-button" runat="server" Text="Check Lecturer Timetable" Font-Size="Medium" OnClick="ButtonLect_Click" />
            <asp:Button ID="ButtonRoom" class="w3-bar-item w3-button" runat="server" Text="Check Room Timetable" Font-Size="Medium" OnClick="ButtonRoom_Click" />
            
            <asp:Button ID="ButtonCourse" class="w3-bar-item w3-button" runat="server" Text="Check Course Timetable" Font-Size="Medium" OnClick="ButtonCourse_Click" />
          
            <asp:Button ID="ButtonPDF" class="w3-bar-item w3-button" runat="server" Text="Print to PDF" Font-Size="Medium" OnClientClick="printDiv('printablediv')" OnClick="ButtonPDF_Click" />
            <asp:Button ID="ButtonProfile" class="w3-bar-item w3-button" runat="server" Text="Profile" Font-Size="Medium" OnClick="ButtonProfile_Click" />
            <asp:Button ID="ButtonAdd" class="w3-bar-item w3-button" runat="server" Text="Add Admin" Font-Size="Medium" OnClick="ButtonAdd_Click" />
            <asp:Button ID="Button2" class="w3-bar-item w3-button float-right" runat="server" Text="Log Out" Font-Bold="False" OnClick="Button2_Click" Font-Size="Medium" />
        </div>
        <br />

        <div id="printablediv">
            <div >
                <br />
                <asp:Label ID="Label1" runat="server" Text="Course Name : "></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="246px" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Timetable_proConnectionString3 %>" SelectCommand="SELECT * FROM [Course]"></asp:SqlDataSource>
                <br />
                <br />
                <asp:Label ID="LabelCourse" runat="server" Font-Bold="True"></asp:Label>
                <br />
                <br />
            </div>
            <br />
            <div id="div_print">
            <asp:GridView ID="GridView1" NullDisplayText=" " runat="server" AutoGenerateColumns="False" BackColor="Black" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
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
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" HorizontalAlign="Center" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Timetable_proConnectionString %>" SelectCommand="SELECT [Day] FROM [Timetable]"></asp:SqlDataSource>
            <br />
        </div>
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