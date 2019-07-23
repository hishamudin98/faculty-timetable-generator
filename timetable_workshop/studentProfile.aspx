<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentProfile.aspx.cs" Inherits="timetable_workshop.studentProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile Student </title>
    <script src="JavaScript.js"></script>
    <link href="css/bootstrap-grid.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style type="text/css">
        .auto-style1 {
            left: 0px;
            top: -22px;
            height: 50px;
        }
        /*
 * Specific styles of signin component
 */
/*
 * General styles
 */
        body{
            height: 200%;
            background-repeat:repeat;
            background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
            background-size:auto;

            padding: 25px;
        }

        .card-container.card {
            max-width: 350px;
            padding: 40px 40px;
        }

        .btn {
            font-weight: 700;
            height: 36px;
            -moz-user-select: none;
            -webkit-user-select: none;
            user-select: none;
            cursor: default;
        }

/*
 * Card component
 */
    .card {
        background-color: #F7F7F7;
        /* just in case there no content*/
        padding: 20px 25px 30px;
        margin: 0 auto 25px;
        margin-top: 50px;
        /* shadows and rounded borders */
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        border-radius: 2px;
        -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    }

    .profile-img-card {
        width: 96px;
        height: 96px;
        margin: 0 auto 10px;
        display: block;
        -moz-border-radius: 50%;
        -webkit-border-radius: 50%;
        border-radius: 50%;
    }

/*
 * Form styles
 */
    .profile-name-card {
        font-size: 16px;
        font-weight: bold;
        text-align: center;
        margin: 10px 0 0;
        min-height: 1em;
    }

    .reauth-email {
        display: block;
        color: #404040;
        line-height: 2;
        margin-bottom: 10px;
        font-size: 14px;
        text-align: center;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
            -moz-box-sizing: border-box;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
    }

    .form-signin #inputEmail,
    .form-signin #inputPassword {
        direction: ltr;
        height: 44px;
        font-size: 16px;
    }

    .form-signin input[type=email],
    .form-signin input[type=password],
    .form-signin input[type=text],
    .form-signin button {
        width: 100%;
        display: block;
        margin-bottom: 10px;
        z-index: 1;
        position: relative;
        -moz-box-sizing: border-box;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
    }

    .form-signin .form-control:focus {
        border-color: rgb(104, 145, 162);
        outline: 0;
        -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
    }

    .btn.btn-signin {
        /*background-color: #4d90fe; */
        background-color: rgb(104, 145, 162);
        /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
        padding: 0px;
        font-weight: 700;
        font-size: 14px;
        height: 36px;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        border-radius: 3px;
        border: none;
        -o-transition: all 0.218s;
        -moz-transition: all 0.218s;
        -webkit-transition: all 0.218s;
        transition: all 0.218s;
    }

    .btn.btn-signin:hover,
    .btn.btn-signin:active,
    .btn.btn-signin:focus {
        background-color: rgb(12, 97, 33);
    }

    .forgot-password {
    color: rgb(104, 145, 162);
    }

    .forgot-password:hover,
    .forgot-password:active,
    .forgot-password:focus {
        color: rgb(12, 97, 33);
    }

        
    </style>
</head>
<body>
    <form id="form1" runat="server" class="form-signin">
        <div class="w3-blue-grey">
            <asp:Button ID="ButtonHome" CssClass="w3-bar-item w3-button" runat="server" Text="Home" Font-Size="Large" OnClick="ButtonHome_Click" />
            <asp:Button ID="ButtonProfile" CssClass="w3-bar-item w3-button" runat="server" Text="Profile" Font-Size="Large" OnClick="ButtonProfile_Click" />
            <asp:Button ID="ButtonPDF" CssClass="w3-bar-item w3-button" runat="server" Text="Download Timetable PDF" Font-Size="Large" OnClick="ButtonPDF_Click" />
            <asp:Button ID="ButtonLogout" CssClass="w3-bar-item w3-button" runat="server" Text="Log Out" Font-Size="Large" OnClick="ButtonLogout_Click" />
            
        </div>
        <div class="container">
                <div class="card card-container" style="max-width:600px ">
            
                
                
                    <div>
                        <asp:Image ID="ImageProfile" style="width:150px;height:150px" class="profile-img-card"  runat="server" ImageUrl="~/Properties/avatar_2x.png" />
            
                        
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="300px" />
                        &nbsp;<asp:Button ID="ButtonUpload" runat="server" Text="Upload" Width="100px" OnClick="ButtonUpload_Click" />
                        &nbsp;

                        <asp:Label ID="Label5" runat="server" Text="Label" Visible="False"></asp:Label>

                        <br />

                        </div>
           
                    <p><asp:Label ID="Label2" runat="server" Text="Name :"></asp:Label><asp:TextBox ID="TextBoxName" runat="server" ></asp:TextBox></p> 
                    <p><asp:Label ID="Label1" runat="server" Text="Email :"></asp:Label><asp:TextBox ID="TextBoxEmail" runat="server" CssClass="auto-style2" ></asp:TextBox></p>
                    <p><asp:Label ID="Label3" runat="server" Text="Password :"></asp:Label><asp:TextBox ID="TextBoxPw" runat="server" type="password" ></asp:TextBox></p>
                    <p class="auto-style1"><asp:Label ID="Label4" runat="server" Text="Role :"></asp:Label><asp:RadioButton ID="RadioButton1" runat="server" Text="Admin" />&nbsp;<asp:RadioButton ID="RadioButton2" runat="server" Text="Lecturer"/>&nbsp;<asp:RadioButton ID="RadioButton3" runat="server" Text="Student"/></p>
                    <p class="auto-style1">
                        <asp:Label ID="Label6" runat="server" Text="Gender :"></asp:Label>
                        <asp:RadioButton ID="RadioButton4" runat="server" Text="Male" OnCheckedChanged="RadioButton4_CheckedChanged" />
                        <asp:RadioButton ID="RadioButton5" runat="server" Text="Female" OnCheckedChanged="RadioButton5_CheckedChanged" />
                    </p>
                    
                    <p><asp:Button ID="ButtonSave"  CssClass="btn btn-lg btn-primary btn-block btn-signin" runat="server" Text="Save Changes" OnClick="ButtonSave_Click" />&nbsp;<asp:Button ID="ButtonCancel"  CssClass="btn btn-lg btn-primary btn-block btn-danger" runat="server" Text="Cancel" OnClick="ButtonCancel_Click"  />&nbsp;</p>
                    <p>&nbsp;</p>
                    
                </div><!-- /card-container -->
            </div><!-- /container -->
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
