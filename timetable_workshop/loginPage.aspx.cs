using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace timetable_workshop
{
    public partial class loginPage : System.Web.UI.Page
    {
        Timetable_proEntities ent = new Timetable_proEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "";
        }

        protected void TextBoxEmail_TextChanged(object sender, EventArgs e)
        {
            var whichEmailAdmin = ent.Admins.Where(x => x.email == TextBoxEmail.Text).FirstOrDefault();
            var whichEmailLect = ent.Lecturers.Where(x => x.Email == TextBoxEmail.Text).FirstOrDefault();
            var whichEmailStud = ent.Students.Where(x => x.Email == TextBoxEmail.Text).FirstOrDefault();

            if (whichEmailAdmin == null && whichEmailLect == null && whichEmailStud == null)
            {
                MessageBox.Show("Wrong Email", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                ImageProfile.ImageUrl = "~/Properties/admin/avatar_2x.png";
                Label1.Text = "";
                return;
            }
            else
            {
                if (whichEmailAdmin != null)
                {
                    ImageProfile.ImageUrl = "~/Properties/admin/" + whichEmailAdmin.image;
                    Label1.Text = "Hi " + whichEmailAdmin.Name + ", Welcome !";
                }
                else if (whichEmailLect != null)
                {
                    ImageProfile.ImageUrl = "~/Properties/lecturer/" + whichEmailLect.Image;
                    Label1.Text = "Hi " + whichEmailLect.Name + ", Welcome !";
                    
                    
                }
                else
                {
                    ImageProfile.ImageUrl = "~/Properties/student/" + whichEmailStud.Image;
                    //MessageBox.Show(whichEmail2.Image);
                    Label1.Text = "Hi " + whichEmailStud.Name + ", Welcome !";
                }

            }
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string pass = CalculateMD5Hash(TextBoxPw.Text);

            var whichEmailAdmin = ent.Admins.Where(x => x.email == TextBoxEmail.Text && x.password == pass).FirstOrDefault();
            var whichEmailLect = ent.Lecturers.Where(x => x.Email == TextBoxEmail.Text && x.Password == TextBoxPw.Text).FirstOrDefault();
            var whichEmailStud = ent.Students.Where(x => x.Email == TextBoxEmail.Text && x.Password == TextBoxPw.Text).FirstOrDefault();

            if (string.IsNullOrEmpty(TextBoxEmail.Text) || string.IsNullOrEmpty(TextBoxPw.Text))
            {
                MessageBox.Show("Please fill all the fields !", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            else if (whichEmailAdmin == null && whichEmailLect == null && whichEmailStud == null)
            {
                MessageBox.Show("Please fill the correct email and password", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);

                return;
            }
            else
            {
                if (whichEmailAdmin != null)
                {
                    Session["email"] = TextBoxEmail.Text;
                    Session["pw"] = TextBoxPw.Text;
                    //FormsAuthentication.Authenticate(Session["email"].ToString(), Session["pw"].ToString());
                    
                    if(whichEmailAdmin.email == Session["email"].ToString())
                    {
                        Response.Redirect("adminHome.aspx");
                    }
                        
                }
                else if (whichEmailLect != null)
                {
                    Session["email"] = TextBoxEmail.Text.ToString();
                    Session["pw"] = TextBoxPw.Text.ToString();
                    //FormsAuthentication.Authenticate
                    Response.Redirect("lecturerHome.aspx");
                }
                else
                {
                    Session["email"] = TextBoxEmail.Text.ToString();
                    Session["pw"] = TextBoxPw.Text.ToString();
                    Response.Redirect("studentHome.aspx");
                }

            }


        }

        private string CalculateMD5Hash(string password)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] encrypt;
            UTF8Encoding encode = new UTF8Encoding();
            //encrypt the given password string into Encrypted data  
            encrypt = md5.ComputeHash(encode.GetBytes(password));
            StringBuilder encryptdata = new StringBuilder();
            //Create a new string by using the encrypted data  
            for (int i = 0; i < encrypt.Length; i++)
            {
                encryptdata.Append(encrypt[i].ToString("x2"));
            }
            return encryptdata.ToString();
        }
    }
}