using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace timetable_workshop
{
    public partial class adminCourse : System.Web.UI.Page
    {
        Timetable_proEntities ent = new Timetable_proEntities();
        Random rnd = new Random();
        string nl = Environment.NewLine;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            Image2.ImageUrl = "~/Properties/details.png";
            string firstname = Request.QueryString["profilename"];
            string lastname = Request.QueryString["id"];
            var whichAdmin = ent.Admins.Where(x => x.Name == firstname).FirstOrDefault();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //e.Row.Cells[1].Width = 1;
            e.Row.Cells[0].Width = 1;
            //e.Row.Cells[4].Width = 75;
            //e.Row.Cells[5].Width = 1;
            int gcolumn = GridView1.Columns.Count;

            for (int i = 1; i < gcolumn; i++)
            {
                e.Row.Cells[i].Width = 500;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(DropDownList1.SelectedValue);


            var slot = ent.Slots.Where(x => x.Subject_Lecturer.Course_Subject.Course_ID == id);
            LabelCourse.Text = "This schedule for course " + slot.FirstOrDefault().Subject_Lecturer.Course_Subject.Course.Name;
            var index = slot.ToArray();

            for (int j = 0; j < GridView1.Rows.Count; j++)
            {
                for (int k = 1; k < GridView1.Columns.Count; k++)
                {
                    GridView1.Rows[j].Cells[k].Text = "";
                }
            }


            if (slot.Count() == 0)
            {
                MessageBox.Show("Kelas ini tidak ade jadual !", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            for (int j = 0; j < GridView1.Rows.Count; j++)
            {
                for (int k = 1; k < GridView1.Columns.Count; k++)
                {

                    for (int i = 0; i < index.Count(); i++)
                    {
                        if (index[i].Timetable_ID == j + 1)
                        {
                            if (index[i].Number == k)
                            {
                                //MessageBox.Show(index[p].Number.ToString());
                                GridView1.Rows[j].Cells[k].Text = index[i].Subject_Lecturer.Lecturer.Name + "<br/>" + index[i].Subject_Lecturer.Course_Subject.Subject.Name + "<br/>" + index[i].Subject_Lecturer.Type.Name + "<br/>" + index[i].Room.Name;
                            }
                        }
                    }
                }
            }
        }

        protected void ButtonGenerate_Click(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            var whichAdmin = ent.Admins.Where(x => x.email == email).FirstOrDefault();
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

        protected void ButtonCourse_Click(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            var whichAdmin = ent.Admins.Where(x => x.email == email).FirstOrDefault();
            Response.Redirect("adminCourse.aspx?profilename=" + whichAdmin.Name + "&id=" + whichAdmin.ID);
        }

        protected void ButtonPDF_Click(object sender, EventArgs e)
        {

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

        protected void Button2_Click(object sender, EventArgs e)
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
    }
}