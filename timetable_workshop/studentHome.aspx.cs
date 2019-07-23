using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace timetable_workshop
{
    public partial class studentHome : System.Web.UI.Page
    {
        Timetable_proEntities ent = new Timetable_proEntities();
        Random rnd = new Random();
        string nl = Environment.NewLine;
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            var whichStud = ent.Students.Where(x => x.Email == email).FirstOrDefault();
            Label1.Text = "Hi welcome ! " + whichStud.Name;
            Label2.Text = "Your class is " + whichStud.Course.Name;
            Image1.ImageUrl = "~/Properties/student/" + whichStud.Image;
            Image2.ImageUrl = "~/Properties/details.png";

            int id = whichStud.ID;
            var stud = ent.Students.FirstOrDefault(x => x.ID == id);
            var slot = ent.Slots.Where(x => x.Course.Students.FirstOrDefault().ID == id);

            var index = slot.ToArray();

            for (int j = 0; j < GridView1.Rows.Count; j++)
            {
                for (int k = 1; k < GridView1.Columns.Count; k++)
                {
                    GridView1.Rows[j].Cells[k].Text = "";
                }
            }

            for (int j = 0; j < GridView1.Rows.Count; j++)
            {
                for (int k = 1; k < GridView1.Columns.Count; k++)
                {
                    for (int i = 0; i < slot.Count(); i++)
                    {
                        if (index[i].Timetable_ID == j + 1)
                        {
                            if (index[i].Number == k)
                            {
                                //System.Windows.Forms.MessageBox.Show(index[i].Number.ToString());
                                GridView1.Rows[j].Cells[k].Text = index[i].Subject_Lecturer.Lecturer.Name + "<br />" + index[i].Subject_Lecturer.Course_Subject.Subject.Name + "<br />" + index[i].Subject_Lecturer.Type.Name + "<br />" + index[i].Room.Name + "<br />" + index[i].Course.Name;
                            }

                        }
                    }


                }
            }

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("studentHome.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            var whichStud = ent.Students.Where(x => x.Email == email).FirstOrDefault();
            //Response.Redirect("WebFormEditProfileAdmin.aspx?profilename=" + whichAdmin.Name + "&id=" + whichAdmin.ID);
            Response.Redirect("studentProfile.aspx?profilename=" + whichStud.Name + "&id=" + whichStud.ID);
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //studentProfile
        }
        protected void Button1_Click(object sender, EventArgs e)
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

        
    }
}