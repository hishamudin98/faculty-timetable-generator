<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addNewAdmin.aspx.cs" Inherits="timetable_workshop.addNewAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Admin </title>
    <link href="StyleSheet1.css" rel="stylesheet" />

    <script src="JavaScript.js"></script>
    <link href="css/bootstrap-grid.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
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
         .auto-style1 {
             height: 45px;
         }
         .auto-style2 {
             left: 0px;
             top: 0px;
         }
        </style>
</head>
<body class="body">
    <form id="form1" runat="server" class="form-signin">
        <div class="w3-blue-grey">
            <asp:Button ID="ButtonGenerate" class="w3-bar-item w3-button" runat="server" Text="Generate Timetable" Font-Size="Medium" OnClick="ButtonGenerate_Click" />
            <asp:Button ID="ButtonLect" class="w3-bar-item w3-button" runat="server" Text="Check Lecturer Timetable" Font-Size="Medium" OnClick="ButtonLect_Click" />
            <asp:Button ID="ButtonRoom" class="w3-bar-item w3-button" runat="server" Text="Check Room Timetable" Font-Size="Medium" OnClick="ButtonRoom_Click" />
             <asp:Button ID="ButtonCourse" class="w3-bar-item w3-button" runat="server" Text="Check Course Timetable" Font-Size="Medium" OnClick="ButtonCourse_Click" />
          
            <asp:Button ID="ButtonProfile" class="w3-bar-item w3-button" runat="server" Text="Profile" Font-Size="Medium" OnClick="ButtonProfile_Click" />
            <asp:Button ID="ButtonAdd" class="w3-bar-item w3-button" runat="server" Text="Add Admin" Font-Size="Medium" OnClick="ButtonAdd_Click"  />
            <asp:Button ID="ButtonLogout" class="w3-bar-item w3-button float-right" runat="server" Text="Log Out" Font-Bold="False" Font-Size="Medium" OnClick="ButtonLogout_Click" />
        </div>
    <br />
        <div class="container">
                <div class="card card-container" style="max-width:600px ">

                    <div>
                        <asp:Image ID="ImageProfile" style="width:150px;height:150px" class="profile-img-card"  runat="server" ImageUrl="~/Properties/avatar_2x.png" />
            
                        
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="300px" />
                        &nbsp;<asp:Button ID="Button1" runat="server" Text="Upload" Width="100px" OnClick="Button1_Click" />
                        &nbsp;

                        <asp:Label ID="Label5" runat="server" Visible="False"></asp:Label>

                        <br />

                        </div>
           
                    <p><asp:Label ID="Label2" runat="server" Text="Name :"></asp:Label><asp:TextBox ID="TextBoxName" runat="server" ></asp:TextBox></p> 
                    <p><asp:Label ID="Label1" runat="server" Text="Email :"></asp:Label><asp:TextBox ID="TextBoxEmail" runat="server" CssClass="auto-style2" ></asp:TextBox></p>
                    <p><asp:Label ID="Label3" runat="server" Text="Password :"></asp:Label><asp:TextBox ID="TextBoxPw" runat="server" type="password"></asp:TextBox></p>
                    <p class="auto-style1"><asp:Label ID="Label4" runat="server" Text="Role :"></asp:Label><asp:RadioButton ID="RadioButton1" runat="server" Text="Admin" />&nbsp;<asp:RadioButton ID="RadioButton2" runat="server" Text="Lecturer"/>&nbsp;<asp:RadioButton ID="RadioButton3" runat="server" Text="Student"/></p>
                    
                    <p><asp:Button ID="Button2"  CssClass="btn btn-lg btn-primary btn-block btn-signin" runat="server" Text="Confirm" OnClick="Button2_Click" />&nbsp;<asp:Button ID="Button3"  CssClass="btn btn-lg btn-primary btn-block btn-danger" runat="server" Text="Cancel" OnClick="Button3_Click" />&nbsp;</p>
                    <p>&nbsp;</p>
                    
                </div><!-- /card-container -->
            </div><!-- /container -->
    </form>
</body>
</html>
