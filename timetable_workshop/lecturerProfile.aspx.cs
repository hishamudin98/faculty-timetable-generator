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
    public partial class lecturerProfile : System.Web.UI.Page
    {
        Timetable_proEntities ent = new Timetable_proEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            string firstname = Request.QueryString["profilename"];
            string lastname = Request.QueryString["id"];
            var whichLect = ent.Lecturers.Where(x => x.Name == firstname).FirstOrDefault();
            //string pass = CalculateMD5Hash(whichLect.Password);
            TextBoxEmail.Text = whichLect.Email;
            TextBoxName.Text = whichLect.Name;
            TextBoxPw.Text = whichLect.Password;

            //ImageProfile.ImageUrl = "~/Properties/Resources/" + whichLect.Image;
            ImageProfile.ImageUrl = "~/Properties/lecturer/" + whichLect.Image;

            TextBoxEmail.Enabled = false;
            Label5.Text = whichLect.Image.ToString();

            RadioButton1.Enabled = false;
            RadioButton2.Enabled = false;
            RadioButton3.Enabled = false;

            if (whichLect.RoleID == 1)
            {
                RadioButton1.Checked = true;
            }
            else if (whichLect.RoleID == 2)
            {
                RadioButton2.Checked = true;
            }
            else
            {
                RadioButton3.Checked = true;
            }
            if (whichLect.Gender == "M")
            {
                RadioButton4.Checked = true;
            }
            else
            {
                RadioButton5.Checked = true;
            }
        }

        protected void ButtonUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {

                string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string path = Server.MapPath("/Properties/lecturer/" + FileName);

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
            //string lastname = Request.QueryString["id"];
            var whichLect = ent.Lecturers.Where(x => x.Name == firstname).FirstOrDefault();

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
                whichLect.Name = name;
                whichLect.Password = CalculateMD5Hash(pw);
                whichLect.Image = Label5.Text;
                if (RadioButton4.Checked)
                {
                    whichLect.Gender = "M";
                }
                else
                {
                    whichLect.Gender = "F";
                }
                ent.SaveChanges();
                //MessageBox.Show(value, "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                MessageBox.Show("Changes has been saved!", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                //Response.Redirect("AdminWeb.aspx");


                //var whichAdmin = ent.Admins.Where(x => x.Name == firstname).FirstOrDefault();
                Response.Redirect("lecturerHome.aspx");
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
                Response.Redirect("lecturerHome.aspx");
            }
        }

        protected void ButtonHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("lecturerHome.aspx");
        }

        protected void ButtonProfile_Click(object sender, EventArgs e)
        {
            string firstname = Request.QueryString["profilename"];
            string lastname = Request.QueryString["id"];
            var whichLect = ent.Lecturers.Where(x => x.Name == firstname).FirstOrDefault();
            //Response.Redirect("WebFormEditProfileAdmin.aspx?profilename=" + whichAdmin.Name + "&id=" + whichAdmin.ID);
            Response.Redirect("lecturerProfile.aspx?profilename=" + whichLect.Name + "&id=" + whichLect.ID);
        }

        protected void ButtonPDF_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Go homepage to print the timetable pdf", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
            Response.Redirect("lecturerHome.aspx");
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

        protected void RadioButton4_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton5.Checked = false;
        }

        protected void RadioButton5_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton4.Checked = false;
        }
    }
}