using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace timetable_workshop
{
    public partial class lecturerHome : System.Web.UI.Page
    {
        Timetable_proEntities ent = new Timetable_proEntities();
        Random rnd = new Random();
        string nl = Environment.NewLine;
        protected void Page_Load(object sender, EventArgs e)
        {

            //HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //HttpContext.Current.Response.Cache.SetNoServerCaching();
            //HttpContext.Current.Response.Cache.SetNoStore();
            //Session.Abandon();

            string email = Session["email"].ToString();
            var whichLect = ent.Lecturers.Where(x => x.Email == email).FirstOrDefault();
            Label1.Text = "Hi welcome ! " + whichLect.Name;

            var countLect = ent.View_KiraSub.Where(x => x.ID == whichLect.ID);
            int kiraSub = countLect.Count();
            var tt = countLect.ToList().ToArray();

            Label3.Text = "";
            //if (kiraSub == 0)
            //{
            //    //Label2.Text = "Your subject is " + whichLect.Subject_Lecturer.FirstOrDefault().Course_Subject.Subject.Name;
            //    //Label3.Text = "Subject Name : " + whichLect.Subject_Lecturer.FirstOrDefault().Course_Subject.Subject.Name + " (" + whichLect.Subject_Lecturer.FirstOrDefault().Course_Subject.Course.Name + ")";
            //    MessageBox.Show("Pelajar ini !", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //    return;
            //}
            if (kiraSub < 2)
            {
                //Label2.Text = "Your subject is " + whichLect.Subject_Lecturer.FirstOrDefault().Course_Subject.Subject.Name;
                Label2.Text = "Subject Name : " + whichLect.Subject_Lecturer.FirstOrDefault().Course_Subject.Subject.Name + " (" + whichLect.Subject_Lecturer.FirstOrDefault().Course_Subject.Course.Name + ")";
            }
            else
            {
                Label2.Text = "Your subject is : ";
                for (int i = 0; i < kiraSub; i++)
                {
                    Label3.Visible = true;
                    //MessageBox.Show(tt[i].Name + " " + tt[i].type);
                    //Label4.Text = (i+1) + ") " + tt[i].Name;
                    Label3.Text += (i + 1) + ") " + tt[i].Name + " (" + tt[i].Expr3 + ")" + "<br />";
                }
            }

            //if (kiraSub < 2)
            //{
            //    Label2.Text = "Your subject is " + whichLect.Subject_Lecturer.FirstOrDefault().Course_Subject.Subject.Name;
            //}
            //else
            //{

            //    for (int i = 0; i < kiraSub; i++)
            //    {
            //        //MessageBox.Show(tt[i].Name + " " + tt[i].type);
            //        Label2.Text = "Your subject is " + tt[0].Name + " and " + tt[1].Name;
            //    }
            //}
            
            //Image1.ImageUrl = "~/Properties/Resources/" + whichLect.Image;
            Image1.ImageUrl = "~/Properties/lecturer/" + whichLect.Image;
            Image2.ImageUrl = "~/Properties/details.png";


            int id = whichLect.ID;
            //var stud = ent.Students.FirstOrDefault(x => x.ID == id);

            var slot = ent.Slots.Where(x => x.Subject_Lecturer.Lecturer.ID == id); //whichLect.Subject_Lecturer.FirstOrDefault().Subject.Name
            //MessageBox.Show(slot.Count().ToString());
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
                                GridView1.Rows[j].Cells[k].Text = index[i].Subject_Lecturer.Course_Subject.Subject.Name + "<br />" + index[i].Subject_Lecturer.Type.Name + "<br />" + index[i].Room.Name + "<br />" + index[i].Course.Name;
                            }

                        }
                    }


                }
            }
        }

        protected void ButtonHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("lecturerHome.aspx");
        }

        protected void ButtonProfile_Click(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            var whichLect = ent.Lecturers.Where(x => x.Email == email).FirstOrDefault();
            //Response.Redirect("WebFormEditProfileAdmin.aspx?profilename=" + whichAdmin.Name + "&id=" + whichAdmin.ID);
            Response.Redirect("lecturerProfile.aspx?profilename=" + whichLect.Name + "&id=" + whichLect.ID);
        }

        protected void ButtonPDF_Click(object sender, EventArgs e)
        {
            //takde
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
            
            //Response.Cache.SetAllowResponseInBrowserHistory(bool allow);
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