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
    public partial class addNewAdmin : System.Web.UI.Page
    {
        Timetable_proEntities ent = new Timetable_proEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            string firstname = Request.QueryString["profilename"];
            string lastname = Request.QueryString["id"];
            var whichAdmin = ent.Admins.Where(x => x.Name == firstname).FirstOrDefault();

            RadioButton1.Checked = true;

            RadioButton2.Enabled = false;
            RadioButton3.Enabled = false;
        }

        protected void ButtonGenerate_Click(object sender, EventArgs e)
        {
            string firstname = Request.QueryString["profilename"];
            string lastname = Request.QueryString["id"];
            var whichAdmin = ent.Admins.Where(x => x.Name == firstname).FirstOrDefault();
            Response.Redirect("adminHome.aspx?profilename=" + whichAdmin.Name + "&id=" + whichAdmin.ID);
        }

        protected void ButtonLect_Click(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            var whichAdmin = ent.Admins.Where(x => x.email == email).FirstOrDefault();
            Response.Redirect("adminLecturer.aspx?profilename=" + whichAdmin.Name + "&id=" + whichAdmin.ID);
        }

        protected void ButtonRoom_Click(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            var whichAdmin = ent.Admins.Where(x => x.email == email).FirstOrDefault();
            Response.Redirect("adminRoom.aspx?profilename=" + whichAdmin.Name + "&id=" + whichAdmin.ID);
        }

        protected void ButtonProfile_Click(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            var whichAdmin = ent.Admins.Where(x => x.email == email).FirstOrDefault();
            Response.Redirect("adminProfile.aspx?profilename=" + whichAdmin.Name + "&id=" + whichAdmin.ID);
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            var whichAdmin = ent.Admins.Where(x => x.email == email).FirstOrDefault();
            Response.Redirect("addNewAdmin.aspx?profilename=" + whichAdmin.Name + "&id=" + whichAdmin.ID);
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {

                string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string path = Server.MapPath("/Properties/admin/" + FileName);
                ImageProfile.ImageUrl = "~/Properties/admin/" + FileName;
                Label5.Text = FileName.ToString();
                FileUpload1.SaveAs(path);
            }
            else
            {
                MessageBox.Show("Please browse the image first before click upload!", "Information", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string firstname = Request.QueryString["profilename"];
            string lastname = Request.QueryString["id"];
            var alladmin = ent.Admins.ToList();
            var whichAdmin = ent.Admins.Where(x => x.Name == firstname).FirstOrDefault();
            string email = Request.Form["TextBoxEmail"];
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

            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
            }
            catch (Exception)
            {

                MessageBox.Show("Email address must be in a valid format, e.g. x@x.x", "Wrong format", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                TextBoxEmail.Focus();
                return;
            }

            if(whichAdmin.email == email)
            {
                MessageBox.Show("Email address has been existed", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                TextBoxEmail.Focus();
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
                Admin newadmin = new Admin();
                newadmin.ID = alladmin.Count() + 1;
                newadmin.email = email;
                newadmin.Name = name;
                newadmin.password = CalculateMD5Hash(pw);
                newadmin.RoleID = 1;
                newadmin.image = Label5.Text;

                ent.Admins.Add(newadmin);
                ent.SaveChanges();
                //MessageBox.Show(value, "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                MessageBox.Show("New admin has been added!", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Response.Redirect("adminHome.aspx?profilename=" + whichAdmin.Name + "&id=" + whichAdmin.ID);
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string firstname = Request.QueryString["profilename"];
            string lastname = Request.QueryString["id"];
            var whichAdmin = ent.Admins.Where(x => x.Name == firstname).FirstOrDefault();

            if (MessageBox.Show("Do you really want to homepage?", "Information", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                Response.Redirect("adminHome.aspx?profilename=" + whichAdmin.Name + "&id=" + whichAdmin.ID);
            }
        }
        private string CalculateMD5Hash(string password)
        {
            MD5 md5 = System.Security.Cryptography.MD5.Create();
            byte[] getbyte = System.Text.Encoding.ASCII.GetBytes(password);
            byte[] hash = md5.ComputeHash(getbyte);

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("x2"));
            }
            return sb.ToString();
        }

        protected void ButtonCourse_Click(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            var whichAdmin = ent.Admins.Where(x => x.email == email).FirstOrDefault();
            Response.Redirect("adminCourse.aspx?profilename=" + whichAdmin.Name + "&id=" + whichAdmin.ID);
        }
    }
}