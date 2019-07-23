using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace timetable_workshop
{
    public partial class studentProfile : System.Web.UI.Page
    {
        Timetable_proEntities ent = new Timetable_proEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            string firstname = Request.QueryString["profilename"];
            string lastname = Request.QueryString["id"];
            var whichStud = ent.Students.Where(x => x.Name == firstname).FirstOrDefault();
            //string pass = CalculateMD5Hash(whichStud.Password);
            TextBoxEmail.Text = whichStud.Email;
            TextBoxName.Text = whichStud.Name;
            TextBoxPw.Text = whichStud.Password;

            //ImageProfile.ImageUrl = "~/Properties/Resources/Image student/" + whichStud.Image;
            ImageProfile.ImageUrl = "~/Properties/student/" + whichStud.Image;

            TextBoxEmail.Enabled = false;
            Label5.Text = whichStud.Image.ToString();

            RadioButton1.Enabled = false;
            RadioButton2.Enabled = false;
            RadioButton3.Enabled = false;


            if (whichStud.RoleID == 1)
            {
                RadioButton1.Checked = true;
            }
            else if (whichStud.RoleID == 2)
            {
                RadioButton2.Checked = true;
            }
            else
            {
                RadioButton3.Checked = true;
            }

            if (whichStud.Gender == "M")
            {
                RadioButton4.Checked = true;
            }
            else
            {
                RadioButton5.Checked = true;
            }
        }

        protected void ButtonHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("studentHome.aspx");
        }

        protected void ButtonProfile_Click(object sender, EventArgs e)
        {
            string firstname = Request.QueryString["profilename"];
            string lastname = Request.QueryString["id"];
            var whichStud = ent.Students.Where(x => x.Name == firstname).FirstOrDefault();
            //Response.Redirect("WebFormEditProfileAdmin.aspx?profilename=" + whichAdmin.Name + "&id=" + whichAdmin.ID);
            Response.Redirect("studentProfile.aspx?profilename=" + whichStud.Name + "&id=" + whichStud.ID);
        }

        protected void ButtonPDF_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Go homepage to print the timetable pdf", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
            Response.Redirect("loginPage.aspx");
        }

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Do you really want to logout?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                Session.Abandon();
                Session.Clear();
                Session.RemoveAll();
                Response.Redirect("loginPage.aspx");
                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            }
        }

        protected void ButtonUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {

                string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string path = Server.MapPath("/Properties/student/" + FileName);

                //ImageProfile.ImageUrl = "~/Properties/" + FileName;
                Label5.Text = FileName.ToString();
                FileUpload1.SaveAs(path);
            }
            else
            {
                MessageBox.Show("Please browse the image first before click upload!", "Information", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            string firstname = Request.QueryString["profilename"];
            string lastname = Request.QueryString["id"];
            var whichStud = ent.Students.Where(x => x.Name == firstname).FirstOrDefault();

            //string email = Request.Form["TextBoxEmail"];
            string name = Request.Form["TextBoxName"];
            string pw = Request.Form["TextBoxPw"];

            string chars = "!@#$%^";
            bool isspecial = false;

            foreach (var item in pw)
            {
                if (chars.Contains(item))
                {
                    isspecial = true;
                }
            }

            if (string.IsNullOrEmpty(TextBoxEmail.Text) || string.IsNullOrEmpty(TextBoxName.Text) || string.IsNullOrEmpty(TextBoxPw.Text))
            {
                MessageBox.Show("Please fill all the fields", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (pw.Length < 6)
            {
                MessageBox.Show("Password must be at least 6 characters !", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (!pw.Any(x => char.IsUpper(x)))
            {
                MessageBox.Show("Password must be at 1 upper !", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (!pw.Any(x => char.IsDigit(x)))
            {
                MessageBox.Show("Password must be at l digit !", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (!isspecial)
            {
                MessageBox.Show("Password must be at l special !", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (MessageBox.Show("Do you really want to save?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                whichStud.Name = name;
                whichStud.Password = CalculateMD5Hash(pw);
                whichStud.Image = Label5.Text;
                if (RadioButton4.Checked)
                {
                    whichStud.Gender = "M";
                }
                else
                {
                    whichStud.Gender = "F";
                }

                ent.SaveChanges();
                //MessageBox.Show(value, "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                MessageBox.Show("Changes has been saved!", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                //Response.Redirect("AdminWeb.aspx");


                //var whichAdmin = ent.Admins.Where(x => x.Name == firstname).FirstOrDefault();
                Response.Redirect("studentHome.aspx");
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

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Really do you want to cancel?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                Response.Redirect("studentHome.aspx");
            }
        }

        protected void RadioButton5_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton4.Checked = false;
        }

        protected void RadioButton4_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton5.Checked = false;
        }
    }
}