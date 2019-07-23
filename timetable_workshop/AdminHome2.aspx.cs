using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace timetable_workshop
{
    public partial class AdminHome2 : System.Web.UI.Page
    {
        Timetable_proEntities ent = new Timetable_proEntities();
        Random rnd = new Random();
        string nl = Environment.NewLine;
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            var whichAdmin = ent.Admins.Where(x => x.email == email).FirstOrDefault();
            Image2.ImageUrl = "~/Properties/details.png";
            Label1.Text = whichAdmin.Name;

            var allroom = ent.Rooms.ToList();
            var alllect = ent.Lecturers.ToList();
            LabelTotalClass.Text = "Total amount of room and lab in FTMK is " + allroom.Count().ToString();
            LabelTotalLecturer.Text = "Total lecturer for FTMK is " + alllect.Count().ToString();

            var slot = ent.Slots.ToList();
            string firstname = Request.QueryString["profilename"];
            //string lastname = Request.QueryString["id"];
            var whichAdmin1 = ent.Admins.Where(x => x.Name == firstname).FirstOrDefault();
            DropDownList1.Enabled = true;
            if (!slot.Any())
            {
                Button1.Enabled = true;
                DropDownList1.Enabled = true;
            }
            else if (slot.Count() == 227)
            {
                Button1.Enabled = false;
                DropDownList1.Enabled = false;
            }
            else
            {
                Button1.Enabled = true;
                DropDownList1.Enabled = true;
            }

            GridView1.Visible = false;
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

        protected void ButtonProfile_Click(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            var whichAdmin = ent.Admins.Where(x => x.email == email).FirstOrDefault();
            Response.Redirect("adminProfile.aspx?profilename=" + whichAdmin.Name + "&id=" + whichAdmin.ID);
        }

        protected void ButtonPDF_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            var whichAdmin = ent.Admins.Where(x => x.email == email).FirstOrDefault();
            Response.Redirect("addNewAdmin.aspx?profilename=" + whichAdmin.Name + "&id=" + whichAdmin.ID);
        }

        protected void ButtonLogOut_Click(object sender, EventArgs e)
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
            var lecturerRooms = ent.Rooms.Where(x => x.Type_ID == 1).ToList().ToArray();
            var roomLab = ent.Rooms.Where(x => x.Type_ID == 2).ToList().ToArray();

            // dit
            if (DropDownList1.SelectedValue == "DIT")
            {
                if (MessageBox.Show("Do you want to generate timetable for DIT", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
                {
                    //DIT
                    var sub1DITnoLab = ent.View_1DIT.Where(x => x.Name.Contains("1 DIT") && x.CodeName.StartsWith("DIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub2DITnoLab = ent.View_1DIT.Where(x => x.Name.Contains("2 DIT") && x.CodeName.StartsWith("DIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();

                    var sub1DITLab = ent.View_1DIT.Where(x => x.Name.Contains("1 DIT") && x.CodeName.StartsWith("DIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub2DITLab = ent.View_1DIT.Where(x => x.Name.Contains("2 DIT") && x.CodeName.StartsWith("DIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();


                    ArrayList arrayList = new ArrayList();

                    for (int l = 0; l < sub2DITLab.Count(); l++)
                    {
                        //DIT
                        if (l < sub1DITnoLab.Count())
                        {
                            arrayList.Add(sub1DITnoLab[l]);
                        }
                        if (l < sub2DITnoLab.Count())
                        {
                            arrayList.Add(sub2DITnoLab[l]);
                        }
                        if (l < sub1DITLab.Count())
                        {
                            arrayList.Add(sub1DITLab[l]);
                        }
                        if (l < sub2DITLab.Count())
                        {
                            arrayList.Add(sub2DITLab[l]);
                        }
                        
                    }
                    //MessageBox.Show(arrayList.Count.ToString());
                    var kira = ent.Slots.ToList();
                    
                    int i = 0;

                    for (int j = 0; j < GridView1.Rows.Count; j++)
                    {
                        for (int k = 1; k < GridView1.Columns.Count; k++)
                        {
                            if (i < arrayList.Count)
                            {

                                var excludeIsnin = new HashSet<int>();
                                var excludeSelasa = new HashSet<int>();
                                var excludeRabu = new HashSet<int>();
                                var excludeKhamis = new HashSet<int>();
                                var excludeJumaat = new HashSet<int>();

                                var excludeRoomLecturer = new HashSet<int>();
                                var excludeRoomLab = new HashSet<int>();

                                Slot newSlot = new Slot();
                                newSlot.ID = kira.Count() + 1;

                                if (arrayList[i].ToString().Contains("1 DIT"))
                                {
                                    newSlot.Course_ID = 1;
                                    
                                    //1dit
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());
                                        //var lectroom = ent.Slots.Where(x => x.Room_ID == lecturerRooms[rangelect].ID && x.Number == k && x.Timetable_ID == j).ToList();
                                        //if (lectroom.Any())
                                        //{

                                        //}
                                        //for (int z = 0; z < lectroom.Count(); z++)
                                        //{
                                        //    excludeRoomLecturer.Add(lectroom[z].Room_ID.Value);
                                        //}

                                        //var range = Enumerable.Range(1, roomLab.Count()).Where(x => !excludeRoomLecturer.Contains(x));
                                        //int index = rnd.Next(1, roomLab.Count() - excludeRoomLecturer.Count);

                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;
                                        
                                        if (arrayList[i].ToString().Contains("DISCRETE MATHEMATICS"))
                                        {
                                            newSlot.Lect_Sub_ID = 253;
                                        }
                                        else if (arrayList[i].ToString().Contains("WEB PROGRAMMING"))
                                        {
                                            newSlot.Lect_Sub_ID = 255;
                                        }
                                        else if (arrayList[i].ToString().Contains("PROGRAMMING II"))
                                        {
                                            newSlot.Lect_Sub_ID = 282;
                                        }
                                        else if (arrayList[i].ToString().Contains("SYSTEM ANALYSIS AND DESIGN"))
                                        {
                                            newSlot.Lect_Sub_ID = 259;
                                        }
                                        else if (arrayList[i].ToString().Contains("OPERATING SYSTEM"))
                                        {
                                            newSlot.Lect_Sub_ID = 261;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;
                                        if (arrayList[i].ToString().Contains("DISCRETE MATHEMATICS"))
                                        {
                                            newSlot.Lect_Sub_ID = 254;
                                        }
                                        else if (arrayList[i].ToString().Contains("WEB PROGRAMMING"))
                                        {
                                            newSlot.Lect_Sub_ID = 256;
                                        }
                                        else if (arrayList[i].ToString().Contains("PROGRAMMING II"))
                                        {
                                            newSlot.Lect_Sub_ID = 283;
                                        }
                                        else if (arrayList[i].ToString().Contains("SYSTEM ANALYSIS AND DESIGN"))
                                        {
                                            newSlot.Lect_Sub_ID = 260;
                                        }
                                        else if (arrayList[i].ToString().Contains("OPERATING SYSTEM"))
                                        {
                                            newSlot.Lect_Sub_ID = 262;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 1).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 1).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 1).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 1).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 1).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }
                                else if (arrayList[i].ToString().Contains("2 DIT"))
                                {
                                    newSlot.Course_ID = 2;

                                    //2dit
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());
                                        //var lectroom = ent.Slots.Where(x => x.Room_ID == lecturerRooms[rangelect].ID && x.Number == k && x.Timetable_ID == j).ToList();
                                        //if (lectroom.Any())
                                        //{

                                        //}
                                        //for (int z = 0; z < lectroom.Count(); z++)
                                        //{
                                        //    excludeRoomLecturer.Add(lectroom[z].Room_ID.Value);
                                        //}

                                        //var range = Enumerable.Range(1, roomLab.Count()).Where(x => !excludeRoomLecturer.Contains(x));
                                        //int index = rnd.Next(1, roomLab.Count() - excludeRoomLecturer.Count);

                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("LINEAR ALGEBRA AND NUMERICAL METHODS"))
                                        {
                                            newSlot.Lect_Sub_ID = 264;
                                        }
                                        else if (arrayList[i].ToString().Contains("APPLIED STATISTICS"))
                                        {
                                            newSlot.Lect_Sub_ID = 266;
                                        }
                                        else if (arrayList[i].ToString().Contains("ARTIFICIAL INTELLIGENCE"))
                                        {
                                            newSlot.Lect_Sub_ID = 268;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA STRUCTURE AND ALGORITHM"))
                                        {
                                            newSlot.Lect_Sub_ID = 270;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE ENGINEERING"))
                                        {
                                            newSlot.Lect_Sub_ID = 272;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE ADMINISTRATION"))
                                        {
                                            newSlot.Lect_Sub_ID = 274;
                                        }
                                        else if (arrayList[i].ToString().Contains("BASIC NETWORKING"))
                                        {
                                            newSlot.Lect_Sub_ID = 276;
                                        }
                                        else if (arrayList[i].ToString().Contains("IMPLEMENTING AND ADMINISTERING ACTIVE DIRECTORY"))
                                        {
                                            newSlot.Lect_Sub_ID = 278;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;

                                        if (arrayList[i].ToString().Contains("LINEAR ALGEBRA AND NUMERICAL METHODS"))
                                        {
                                            newSlot.Lect_Sub_ID = 265;
                                        }
                                        else if (arrayList[i].ToString().Contains("APPLIED STATISTICS"))
                                        {
                                            newSlot.Lect_Sub_ID = 267;
                                        }
                                        else if (arrayList[i].ToString().Contains("ARTIFICIAL INTELLIGENCE"))
                                        {
                                            newSlot.Lect_Sub_ID = 269;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA STRUCTURE AND ALGORITHM"))
                                        {
                                            newSlot.Lect_Sub_ID = 271;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE ENGINEERING"))
                                        {
                                            newSlot.Lect_Sub_ID = 273;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE ADMINISTRATION"))
                                        {
                                            newSlot.Lect_Sub_ID = 275;
                                        }
                                        else if (arrayList[i].ToString().Contains("BASIC NETWORKING"))
                                        {
                                            newSlot.Lect_Sub_ID = 277;
                                        }
                                        else if (arrayList[i].ToString().Contains("IMPLEMENTING AND ADMINISTERING ACTIVE DIRECTORY"))
                                        {
                                            newSlot.Lect_Sub_ID = 279;
                                        }
                                        else if (arrayList[i].ToString().Contains("SYSTEM DEVELOPMENT WORKSHOP"))
                                        {
                                            newSlot.Lect_Sub_ID = 280;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 2).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 2).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 2).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 2).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 2).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                } 

                            }
                            i++;
                        }
                    }


                }

                MessageBox.Show("The data has been saved", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);

                DropDownList1.Items[0].Enabled = false;
            }

            // bitc
            else if (DropDownList1.SelectedValue == "BITC")
            {
                if (MessageBox.Show("Do you want to generate timetable for BITC", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
                {
                    //1 BITC
                    var sub1BITCnoLab = ent.View_1DIT.Where(x => x.Name.Contains("1 BITC") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub1BITCLab = ent.View_1DIT.Where(x => x.Name.Contains("1 BITC") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();

                    //2 BITC
                    var sub2BITCnoLab = ent.View_1DIT.Where(x => x.Name.Contains("2 BITC") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub2BITCLab = ent.View_1DIT.Where(x => x.Name.Contains("2 BITC") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();

                    //3 BITC
                    var sub3BITCnoLab = ent.View_1DIT.Where(x => x.Name.Contains("3 BITC") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub3BITCLab = ent.View_1DIT.Where(x => x.Name.Contains("3 BITC") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();



                    ArrayList arrayList = new ArrayList();

                    for (int l = 0; l < sub1BITCnoLab.Count(); l++)
                    {
                        if (l < sub1BITCnoLab.Count())
                        {
                            arrayList.Add(sub1BITCnoLab[l]);
                        }
                        if (l < sub2BITCnoLab.Count())
                        {
                            arrayList.Add(sub2BITCnoLab[l]);
                        }
                        if (l < sub3BITCnoLab.Count())
                        {
                            arrayList.Add(sub3BITCnoLab[l]);
                        }

                        if (l < sub1BITCLab.Count())
                        {
                            arrayList.Add(sub1BITCLab[l]);
                        }
                        if (l < sub2BITCLab.Count())
                        {
                            arrayList.Add(sub2BITCLab[l]);
                        }
                        if (l < sub3BITCLab.Count())
                        {
                            arrayList.Add(sub3BITCLab[l]);
                        }

                    }
                    //MessageBox.Show(arrayList.Count.ToString());
                    var kira = ent.Slots.ToList();

                    int i = 0;

                    for (int j = 0; j < GridView1.Rows.Count; j++)
                    {
                        for (int k = 1; k < GridView1.Columns.Count; k++)
                        {
                            if (i < arrayList.Count)
                            {

                                var excludeIsnin = new HashSet<int>();
                                var excludeSelasa = new HashSet<int>();
                                var excludeRabu = new HashSet<int>();
                                var excludeKhamis = new HashSet<int>();
                                var excludeJumaat = new HashSet<int>();

                                var excludeRoomLecturer = new HashSet<int>();
                                var excludeRoomLab = new HashSet<int>();

                                Slot newSlot = new Slot();
                                newSlot.ID = kira.Count() + 1;

                                if (arrayList[i].ToString().Contains("1 BITC"))
                                {
                                    newSlot.Course_ID = 4;

                                    //1dit
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());
                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("CALCULUS AND NUMERICAL METHODS"))
                                        {
                                            newSlot.Lect_Sub_ID = 1;
                                        }
                                        else if (arrayList[i].ToString().Contains("WEB APPLICATION DEVELOPMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 3;
                                        }
                                        else if (arrayList[i].ToString().Contains("HUMAN-COMPUTER INTERACTION"))
                                        {
                                            newSlot.Lect_Sub_ID = 5;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA STRUCTURE AND ALGORITHM"))
                                        {
                                            newSlot.Lect_Sub_ID = 7;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE"))
                                        {
                                            newSlot.Lect_Sub_ID = 9;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA COMMUNICATION AND NETWORKING"))
                                        {
                                            newSlot.Lect_Sub_ID = 11;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;
                                        if (arrayList[i].ToString().Contains("CALCULUS AND NUMERICAL METHODS"))
                                        {
                                            newSlot.Lect_Sub_ID = 2;
                                        }
                                        else if (arrayList[i].ToString().Contains("WEB APPLICATION DEVELOPMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 4;
                                        }
                                        else if (arrayList[i].ToString().Contains("HUMAN-COMPUTER INTERACTION"))
                                        {
                                            newSlot.Lect_Sub_ID = 6;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA STRUCTURE AND ALGORITHM"))
                                        {
                                            newSlot.Lect_Sub_ID = 8;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE"))
                                        {
                                            newSlot.Lect_Sub_ID = 10;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA COMMUNICATION AND NETWORKING"))
                                        {
                                            newSlot.Lect_Sub_ID = 12;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 4).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 4).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 4).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 4).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 4).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }
                                else if (arrayList[i].ToString().Contains("2 BITC"))
                                {
                                    newSlot.Course_ID = 5;

                                    //2 bitc
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());
                                        
                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("ARTIFICIAL INTELLIGENCE"))
                                        {
                                            newSlot.Lect_Sub_ID = 18;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE ENGINEERING"))
                                        {
                                            newSlot.Lect_Sub_ID = 20;
                                        }
                                        else if (arrayList[i].ToString().Contains("WIDE AREA NETWORK"))
                                        {
                                            newSlot.Lect_Sub_ID = 22;
                                        }
                                        else if (arrayList[i].ToString().Contains("NETWORK ANALYSIS AND DESIGN"))
                                        {
                                            newSlot.Lect_Sub_ID = 24;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;

                                        if (arrayList[i].ToString().Contains("ARTIFICIAL INTELLIGENCE"))
                                        {
                                            newSlot.Lect_Sub_ID = 19;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE ENGINEERING"))
                                        {
                                            newSlot.Lect_Sub_ID = 21;
                                        }
                                        else if (arrayList[i].ToString().Contains("WIDE AREA NETWORK"))
                                        {
                                            newSlot.Lect_Sub_ID = 23;
                                        }
                                        else if (arrayList[i].ToString().Contains("NETWORK ANALYSIS AND DESIGN"))
                                        {
                                            newSlot.Lect_Sub_ID = 25;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 5).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 5).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 5).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 5).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 5).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }
                                else if (arrayList[i].ToString().Contains("3 BITC"))
                                {
                                    newSlot.Course_ID = 6;

                                    //3 bitc
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());

                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("INTERNET TECHNOLOGY"))
                                        {
                                            newSlot.Lect_Sub_ID = 28;
                                        }
                                        else if (arrayList[i].ToString().Contains("MULTIMEDIA NETWORKING"))
                                        {
                                            newSlot.Lect_Sub_ID = 30;
                                        }
                                        else if (arrayList[i].ToString().Contains("FIBER OPTIC"))
                                        {
                                            newSlot.Lect_Sub_ID = 32;
                                        }
                                        else if (arrayList[i].ToString().Contains("INFORMATION TECHNOLOGY AND NETWORKING SECURITY"))
                                        {
                                            newSlot.Lect_Sub_ID = 34;
                                        }
                                        else if (arrayList[i].ToString().Contains("TCP/IP PROGRAMMING"))
                                        {
                                            newSlot.Lect_Sub_ID = 36;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;

                                        if (arrayList[i].ToString().Contains("INTERNET TECHNOLOGY"))
                                        {
                                            newSlot.Lect_Sub_ID = 29;
                                        }
                                        else if (arrayList[i].ToString().Contains("MULTIMEDIA NETWORKING"))
                                        {
                                            newSlot.Lect_Sub_ID = 31;
                                        }
                                        else if (arrayList[i].ToString().Contains("FIBER OPTIC"))
                                        {
                                            newSlot.Lect_Sub_ID = 33;
                                        }
                                        else if (arrayList[i].ToString().Contains("INFORMATION TECHNOLOGY AND NETWORKING SECURITY"))
                                        {
                                            newSlot.Lect_Sub_ID = 35;
                                        }
                                        else if (arrayList[i].ToString().Contains("TCP/IP PROGRAMMING"))
                                        {
                                            newSlot.Lect_Sub_ID = 37;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 6).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 6).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 6).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 6).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 6).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }

                            }
                            i++;
                        }
                    }


                }

                MessageBox.Show("The data has been saved", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);

                DropDownList1.Items[1].Enabled = false;
            }

            // bitd
            else if (DropDownList1.SelectedValue == "BITD")
            {
                if (MessageBox.Show("Do you want to generate timetable for BITD", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
                {
                    //1 BITD
                    var sub1BITDnoLab = ent.View_1DIT.Where(x => x.Name.Contains("1 BITD") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub1BITDLab = ent.View_1DIT.Where(x => x.Name.Contains("1 BITD") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    //2 BITD
                    var sub2BITDnoLab = ent.View_1DIT.Where(x => x.Name.Contains("2 BITD") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub2BITDLab = ent.View_1DIT.Where(x => x.Name.Contains("2 BITD") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    //3 BITD
                    var sub3BITDnoLab = ent.View_1DIT.Where(x => x.Name.Contains("3 BITD") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub3BITDLab = ent.View_1DIT.Where(x => x.Name.Contains("3 BITD") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();



                    ArrayList arrayList = new ArrayList();

                    for (int l = 0; l < sub2BITDnoLab.Count(); l++)
                    {
                        if (l < sub1BITDnoLab.Count())
                        {
                            arrayList.Add(sub1BITDnoLab[l]);
                        }
                        if (l < sub2BITDnoLab.Count())
                        {
                            arrayList.Add(sub2BITDnoLab[l]);
                        }
                        if (l < sub3BITDnoLab.Count())
                        {
                            arrayList.Add(sub3BITDnoLab[l]);
                        }
                        if (l < sub1BITDLab.Count())
                        {
                            arrayList.Add(sub1BITDLab[l]);
                        }
                        if (l < sub2BITDLab.Count())
                        {
                            arrayList.Add(sub2BITDLab[l]);
                        }
                        if (l < sub3BITDLab.Count())
                        {
                            arrayList.Add(sub3BITDLab[l]);
                        }
                        
                        
                    }
                    //MessageBox.Show(arrayList.Count.ToString());
                    var kira = ent.Slots.ToList();

                    int i = 0;

                    for (int j = 0; j < GridView1.Rows.Count; j++)
                    {
                        for (int k = 1; k < GridView1.Columns.Count; k++)
                        {
                            if (i < arrayList.Count)
                            {

                                var excludeIsnin = new HashSet<int>();
                                var excludeSelasa = new HashSet<int>();
                                var excludeRabu = new HashSet<int>();
                                var excludeKhamis = new HashSet<int>();
                                var excludeJumaat = new HashSet<int>();

                                var excludeRoomLecturer = new HashSet<int>();
                                var excludeRoomLab = new HashSet<int>();

                                Slot newSlot = new Slot();
                                newSlot.ID = kira.Count() + 1;

                                if (arrayList[i].ToString().Contains("1 BITD"))
                                {
                                    newSlot.Course_ID = 7;

                                    //1dit
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());
                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("CALCULUS AND NUMERICAL METHODS"))
                                        {
                                            newSlot.Lect_Sub_ID = 39;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA STRUCTURE AND ALGORITHM"))
                                        {
                                            newSlot.Lect_Sub_ID = 41;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE"))
                                        {
                                            newSlot.Lect_Sub_ID = 43;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE ENGINEERING"))
                                        {
                                            newSlot.Lect_Sub_ID = 45;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;
                                        if (arrayList[i].ToString().Contains("CALCULUS AND NUMERICAL METHODS"))
                                        {
                                            newSlot.Lect_Sub_ID = 40;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA STRUCTURE AND ALGORITHM"))
                                        {
                                            newSlot.Lect_Sub_ID = 42;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE"))
                                        {
                                            newSlot.Lect_Sub_ID = 44;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE ENGINEERING"))
                                        {
                                            newSlot.Lect_Sub_ID = 46;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 7).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 7).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 7).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 7).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 7).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }
                                else if (arrayList[i].ToString().Contains("2 BITD"))
                                {
                                    newSlot.Course_ID = 8;

                                    //2 bitd
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());

                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("ARTIFICIAL INTELLIGENCE"))
                                        {
                                            newSlot.Lect_Sub_ID = 52;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE REQUIREMENT AND DESIGN"))
                                        {
                                            newSlot.Lect_Sub_ID = 54;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE ADMINISTRATION"))
                                        {
                                            newSlot.Lect_Sub_ID = 56;
                                        }
                                        else if (arrayList[i].ToString().Contains("OBJECT ORIENTED PROGRAMMING"))
                                        {
                                            newSlot.Lect_Sub_ID = 58;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA COMMUNICATION AND NETWORKING"))
                                        {
                                            newSlot.Lect_Sub_ID = 60;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;

                                        if (arrayList[i].ToString().Contains("ARTIFICIAL INTELLIGENCE"))
                                        {
                                            newSlot.Lect_Sub_ID = 53;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE REQUIREMENT AND DESIGN"))
                                        {
                                            newSlot.Lect_Sub_ID = 55;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE ADMINISTRATION"))
                                        {
                                            newSlot.Lect_Sub_ID = 57;
                                        }
                                        else if (arrayList[i].ToString().Contains("OBJECT ORIENTED PROGRAMMING"))
                                        {
                                            newSlot.Lect_Sub_ID = 59;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA COMMUNICATION AND NETWORKING"))
                                        {
                                            newSlot.Lect_Sub_ID = 61;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 8).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 8).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 8).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 8).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 8).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }
                                else if (arrayList[i].ToString().Contains("3 BITD"))
                                {
                                    newSlot.Course_ID = 9;

                                    //3 bitd
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());

                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("WEB APPLICATION DEVELOPMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 64;
                                        }
                                        else if (arrayList[i].ToString().Contains("STRATEGIC INFORMATION SYSTEM PLANNING"))
                                        {
                                            newSlot.Lect_Sub_ID = 66;
                                        }
                                        else if (arrayList[i].ToString().Contains("MULTIMEDIA DATABASE"))
                                        {
                                            newSlot.Lect_Sub_ID = 68;
                                        }
                                        else if (arrayList[i].ToString().Contains("ADVANCED DATABASE PROGRAMMING"))
                                        {
                                            newSlot.Lect_Sub_ID = 70;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;

                                        if (arrayList[i].ToString().Contains("WEB APPLICATION DEVELOPMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 65;
                                        }
                                        else if (arrayList[i].ToString().Contains("STRATEGIC INFORMATION SYSTEM PLANNING"))
                                        {
                                            newSlot.Lect_Sub_ID = 67;
                                        }
                                        else if (arrayList[i].ToString().Contains("MULTIMEDIA DATABASE"))
                                        {
                                            newSlot.Lect_Sub_ID = 69;
                                        }
                                        else if (arrayList[i].ToString().Contains("ADVANCED DATABASE PROGRAMMING"))
                                        {
                                            newSlot.Lect_Sub_ID = 71;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 9).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 9).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 9).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 9).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 9).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }

                            }
                            i++;
                        }
                    }


                }

                MessageBox.Show("The data has been saved", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);

                DropDownList1.Items[2].Enabled = false;
            }

            // bite
            else if (DropDownList1.SelectedValue == "BITE")
            {
                if (MessageBox.Show("Do you want to generate timetable for BITE", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
                {
                    //1 BITE
                    var sub1BITEnoLab = ent.View_1DIT.Where(x => x.Name.Contains("1 BITE") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub1BITELab = ent.View_1DIT.Where(x => x.Name.Contains("1 BITE") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    //2 BITE
                    var sub2BITEnoLab = ent.View_1DIT.Where(x => x.Name.Contains("2 BITE") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub2BITELab = ent.View_1DIT.Where(x => x.Name.Contains("2 BITE") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    //3 BITE
                    var sub3BITEnoLab = ent.View_1DIT.Where(x => x.Name.Contains("3 BITE") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub3BITELab = ent.View_1DIT.Where(x => x.Name.Contains("3 BITE") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();




                    ArrayList arrayList = new ArrayList();

                    for (int l = 0; l < sub2BITEnoLab.Count(); l++)
                    {
                        if (l < sub1BITEnoLab.Count())
                        {
                            arrayList.Add(sub1BITEnoLab[l]);
                        }
                        if (l < sub2BITEnoLab.Count())
                        {
                            arrayList.Add(sub2BITEnoLab[l]);
                        }
                        if (l < sub3BITEnoLab.Count())
                        {
                            arrayList.Add(sub3BITEnoLab[l]);
                        }

                        if (l < sub1BITELab.Count())
                        {
                            arrayList.Add(sub1BITELab[l]);
                        }
                        if (l < sub2BITELab.Count())
                        {
                            arrayList.Add(sub2BITELab[l]);
                        }
                        if (l < sub3BITELab.Count())
                        {
                            arrayList.Add(sub3BITELab[l]);
                        }
                        
                       


                    }
                    //MessageBox.Show(arrayList.Count.ToString());
                    var kira = ent.Slots.ToList();

                    int i = 0;

                    for (int j = 0; j < GridView1.Rows.Count; j++)
                    {
                        for (int k = 1; k < GridView1.Columns.Count; k++)
                        {
                            if (i < arrayList.Count)
                            {

                                var excludeIsnin = new HashSet<int>();
                                var excludeSelasa = new HashSet<int>();
                                var excludeRabu = new HashSet<int>();
                                var excludeKhamis = new HashSet<int>();
                                var excludeJumaat = new HashSet<int>();

                                var excludeRoomLecturer = new HashSet<int>();
                                var excludeRoomLab = new HashSet<int>();

                                Slot newSlot = new Slot();
                                newSlot.ID = kira.Count() + 1;

                                if (arrayList[i].ToString().Contains("1 BITE"))
                                {
                                    newSlot.Course_ID = 10;

                                    //1 bite
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());
                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("GAME PROGRAMMING II"))
                                        {
                                            newSlot.Lect_Sub_ID = 74;
                                        }
                                        else if (arrayList[i].ToString().Contains("CALCULUS AND NUMERICAL METHODS"))
                                        {
                                            newSlot.Lect_Sub_ID = 78;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE"))
                                        {
                                            newSlot.Lect_Sub_ID = 80;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;
                                        if (arrayList[i].ToString().Contains("GAME PROGRAMMING II"))
                                        {
                                            newSlot.Lect_Sub_ID = 75;
                                        }
                                        else if (arrayList[i].ToString().Contains("CALCULUS AND NUMERICAL METHODS"))
                                        {
                                            newSlot.Lect_Sub_ID = 79;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE"))
                                        {
                                            newSlot.Lect_Sub_ID = 81;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 10).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 10).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 10).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 10).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 10).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }
                                else if (arrayList[i].ToString().Contains("2 BITE"))
                                {
                                    newSlot.Course_ID = 11;

                                    //2 bite
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());

                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("ARTIFICIAL INTELLIGENCE FOR GAMES"))
                                        {
                                            newSlot.Lect_Sub_ID = 85;
                                        }
                                        else if (arrayList[i].ToString().Contains("INTERACTIVE 3D ANIMATION"))
                                        {
                                            newSlot.Lect_Sub_ID = 87;
                                        }
                                        else if (arrayList[i].ToString().Contains("AUDIO VIDEO PRODUCTION FOR GAME"))
                                        {
                                            newSlot.Lect_Sub_ID = 89;
                                        }
                                        else if (arrayList[i].ToString().Contains("GAMEPLAY"))
                                        {
                                            newSlot.Lect_Sub_ID = 91;
                                        }
                                        else if (arrayList[i].ToString().Contains("STATISTICS AND PROBABILITY"))
                                        {
                                            newSlot.Lect_Sub_ID = 93;
                                        }
                                        else if (arrayList[i].ToString().Contains("HUMAN-COMPUTER INTERACTION"))
                                        {
                                            newSlot.Lect_Sub_ID = 95;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;

                                        if (arrayList[i].ToString().Contains("ARTIFICIAL INTELLIGENCE FOR GAMES"))
                                        {
                                            newSlot.Lect_Sub_ID = 86;
                                        }
                                        else if (arrayList[i].ToString().Contains("INTERACTIVE 3D ANIMATION"))
                                        {
                                            newSlot.Lect_Sub_ID = 88;
                                        }
                                        else if (arrayList[i].ToString().Contains("AUDIO VIDEO PRODUCTION FOR GAME"))
                                        {
                                            newSlot.Lect_Sub_ID = 90;
                                        }
                                        else if (arrayList[i].ToString().Contains("GAMEPLAY"))
                                        {
                                            newSlot.Lect_Sub_ID = 92;
                                        }
                                        else if (arrayList[i].ToString().Contains("STATISTICS AND PROBABILITY"))
                                        {
                                            newSlot.Lect_Sub_ID = 94;
                                        }
                                        else if (arrayList[i].ToString().Contains("HUMAN-COMPUTER INTERACTION"))
                                        {
                                            newSlot.Lect_Sub_ID = 96;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 11).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 11).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 11).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 11).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 11).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }
                                else if (arrayList[i].ToString().Contains("3 BITE"))
                                {
                                    newSlot.Course_ID = 12;

                                    //3 bite
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());

                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("3D GAME DEVELOPMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 97;
                                        }
                                        else if (arrayList[i].ToString().Contains("GAME PHYSICS"))
                                        {
                                            newSlot.Lect_Sub_ID = 99;
                                        }
                                        else if (arrayList[i].ToString().Contains("GAME PROJECT MANAGEMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 101;
                                        }
                                        else if (arrayList[i].ToString().Contains("GAME MECHANICS"))
                                        {
                                            newSlot.Lect_Sub_ID = 103;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;

                                        if (arrayList[i].ToString().Contains("3D GAME DEVELOPMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 98;
                                        }
                                        else if (arrayList[i].ToString().Contains("GAME PHYSICS"))
                                        {
                                            newSlot.Lect_Sub_ID = 100;
                                        }
                                        else if (arrayList[i].ToString().Contains("GAME PROJECT MANAGEMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 102;
                                        }
                                        else if (arrayList[i].ToString().Contains("GAME MECHANICS"))
                                        {
                                            newSlot.Lect_Sub_ID = 104;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 12).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 12).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 12).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 12).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 12).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }

                            }
                            i++;
                        }
                    }


                }

                MessageBox.Show("The data has been saved", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);

                DropDownList1.Items[3].Enabled = false;
            }

            // biti
            else if (DropDownList1.SelectedValue == "BITI")
            {
                if (MessageBox.Show("Do you want to generate timetable for BITI", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
                {
                    //1 BITI
                    var sub1BITInoLab = ent.View_1DIT.Where(x => x.Name.Contains("1 BITI") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub1BITILab = ent.View_1DIT.Where(x => x.Name.Contains("1 BITI") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    //2 BITI
                    var sub2BITInoLab = ent.View_1DIT.Where(x => x.Name.Contains("2 BITI") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub2BITILab = ent.View_1DIT.Where(x => x.Name.Contains("2 BITI") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    //3 BITI
                    var sub3BITInoLab = ent.View_1DIT.Where(x => x.Name.Contains("3 BITI") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub3BITILab = ent.View_1DIT.Where(x => x.Name.Contains("3 BITI") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();




                    ArrayList arrayList = new ArrayList();

                    for (int l = 0; l < sub1BITInoLab.Count(); l++)
                    {
                        if (l < sub1BITInoLab.Count())
                        {
                            arrayList.Add(sub1BITInoLab[l]);
                        }
                        if (l < sub2BITInoLab.Count())
                        {
                            arrayList.Add(sub2BITInoLab[l]);
                        }
                        if (l < sub3BITInoLab.Count())
                        {
                            arrayList.Add(sub3BITInoLab[l]);
                        }

                        if (l < sub1BITILab.Count())
                        {
                            arrayList.Add(sub1BITILab[l]);
                        }
                        if (l < sub2BITILab.Count())
                        {
                            arrayList.Add(sub2BITILab[l]);
                        }

                        if (l < sub3BITILab.Count())
                        {
                            arrayList.Add(sub3BITILab[l]);
                        }

                    }
                    //MessageBox.Show(arrayList.Count.ToString());
                    var kira = ent.Slots.ToList();

                    int i = 0;

                    for (int j = 0; j < GridView1.Rows.Count; j++)
                    {
                        for (int k = 1; k < GridView1.Columns.Count; k++)
                        {
                            if (i < arrayList.Count)
                            {

                                var excludeIsnin = new HashSet<int>();
                                var excludeSelasa = new HashSet<int>();
                                var excludeRabu = new HashSet<int>();
                                var excludeKhamis = new HashSet<int>();
                                var excludeJumaat = new HashSet<int>();

                                var excludeRoomLecturer = new HashSet<int>();
                                var excludeRoomLab = new HashSet<int>();

                                Slot newSlot = new Slot();
                                newSlot.ID = kira.Count() + 1;

                                if (arrayList[i].ToString().Contains("1 BITI"))
                                {
                                    newSlot.Course_ID = 13;

                                    //1 biti
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());
                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("ARTIFICIAL INTELLIGENCE"))
                                        {
                                            newSlot.Lect_Sub_ID = 106;
                                        }
                                        else if (arrayList[i].ToString().Contains("CALCULUS AND NUMERICAL METHODS"))
                                        {
                                            newSlot.Lect_Sub_ID = 108;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA STRUCTURE AND ALGORITHM"))
                                        {
                                            newSlot.Lect_Sub_ID = 110;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE"))
                                        {
                                            newSlot.Lect_Sub_ID = 112;
                                        }
                                        else if (arrayList[i].ToString().Contains("OPERATING SYSTEM"))
                                        {
                                            newSlot.Lect_Sub_ID = 114;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA COMMUNICATION AND NETWORKING"))
                                        {
                                            newSlot.Lect_Sub_ID = 116;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;
                                        if (arrayList[i].ToString().Contains("ARTIFICIAL INTELLIGENCE"))
                                        {
                                            newSlot.Lect_Sub_ID = 107;
                                        }
                                        else if (arrayList[i].ToString().Contains("CALCULUS AND NUMERICAL METHODS"))
                                        {
                                            newSlot.Lect_Sub_ID = 109;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA STRUCTURE AND ALGORITHM"))
                                        {
                                            newSlot.Lect_Sub_ID = 111;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE"))
                                        {
                                            newSlot.Lect_Sub_ID = 113;
                                        }
                                        else if (arrayList[i].ToString().Contains("OPERATING SYSTEM"))
                                        {
                                            newSlot.Lect_Sub_ID = 115;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA COMMUNICATION AND NETWORKING"))
                                        {
                                            newSlot.Lect_Sub_ID = 117;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 13).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 13).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 13).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 13).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 13).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }
                                else if (arrayList[i].ToString().Contains("2 BITI"))
                                {
                                    newSlot.Course_ID = 14;

                                    //2 biti
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());

                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("LOGIC PROGRAMMING"))
                                        {
                                            newSlot.Lect_Sub_ID = 123;
                                        }
                                        else if (arrayList[i].ToString().Contains("KNOWLEDGE BASED SYSTEM"))
                                        {
                                            newSlot.Lect_Sub_ID = 125;
                                        }
                                        else if (arrayList[i].ToString().Contains("MACHINE LEARNING"))
                                        {
                                            newSlot.Lect_Sub_ID = 127;
                                        }
                                        else if (arrayList[i].ToString().Contains("ARTIFICIAL INTELLIGENCE IN ROBOTIC AND AUTOMATION"))
                                        {
                                            newSlot.Lect_Sub_ID = 129;
                                        }
                                        else if (arrayList[i].ToString().Contains("HUMAN-COMPUTER INTERACTION"))
                                        {
                                            newSlot.Lect_Sub_ID = 131;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE ENGINEERING"))
                                        {
                                            newSlot.Lect_Sub_ID = 133;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;

                                        if (arrayList[i].ToString().Contains("LOGIC PROGRAMMING"))
                                        {
                                            newSlot.Lect_Sub_ID = 124;
                                        }
                                        else if (arrayList[i].ToString().Contains("KNOWLEDGE BASED SYSTEM"))
                                        {
                                            newSlot.Lect_Sub_ID = 126;
                                        }
                                        else if (arrayList[i].ToString().Contains("MACHINE LEARNING"))
                                        {
                                            newSlot.Lect_Sub_ID = 128;
                                        }
                                        else if (arrayList[i].ToString().Contains("ARTIFICIAL INTELLIGENCE IN ROBOTIC AND AUTOMATION"))
                                        {
                                            newSlot.Lect_Sub_ID = 130;
                                        }
                                        else if (arrayList[i].ToString().Contains("HUMAN-COMPUTER INTERACTION"))
                                        {
                                            newSlot.Lect_Sub_ID = 132;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE ENGINEERING"))
                                        {
                                            newSlot.Lect_Sub_ID = 134;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 14).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 14).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 14).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 14).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 14).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }
                                else if (arrayList[i].ToString().Contains("3 BITI"))
                                {
                                    newSlot.Course_ID = 15;

                                    //3 biti
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());

                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("INTELLIGENT AGENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 137;
                                        }
                                        else if (arrayList[i].ToString().Contains("EVOLUTIONARY COMPUTING"))
                                        {
                                            newSlot.Lect_Sub_ID = 139;
                                        }
                                        else if (arrayList[i].ToString().Contains("IMAGE PROCESSING AND PATTERN RECOGNITION"))
                                        {
                                            newSlot.Lect_Sub_ID = 141;
                                        }
                                        else if (arrayList[i].ToString().Contains("ARTIFICIAL INTELLIGENCE PROJECT MANAGEMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 143;
                                        }
                                        else if (arrayList[i].ToString().Contains("INFORMATION TECHNOLOGY SECURITY"))
                                        {
                                            newSlot.Lect_Sub_ID = 145;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;

                                        if (arrayList[i].ToString().Contains("INTELLIGENT AGENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 138;
                                        }
                                        else if (arrayList[i].ToString().Contains("EVOLUTIONARY COMPUTING"))
                                        {
                                            newSlot.Lect_Sub_ID = 140;
                                        }
                                        else if (arrayList[i].ToString().Contains("IMAGE PROCESSING AND PATTERN RECOGNITION"))
                                        {
                                            newSlot.Lect_Sub_ID = 142;
                                        }
                                        else if (arrayList[i].ToString().Contains("ARTIFICIAL INTELLIGENCE PROJECT MANAGEMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 144;
                                        }
                                        else if (arrayList[i].ToString().Contains("INFORMATION TECHNOLOGY SECURITY"))
                                        {
                                            newSlot.Lect_Sub_ID = 146;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 15).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 15).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 15).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 15).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 15).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }

                            }
                            i++;
                        }
                    }


                }

                MessageBox.Show("The data has been saved", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);

                DropDownList1.Items[4].Enabled = false;
            }

            // bitm
            else if (DropDownList1.SelectedValue == "BITM")
            {
                if (MessageBox.Show("Do you want to generate timetable for BITM", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
                {
                    //1 BITM
                    var sub1BITMnoLab = ent.View_1DIT.Where(x => x.Name.Contains("1 BITM") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub1BITMLab = ent.View_1DIT.Where(x => x.Name.Contains("1 BITM") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    //2 BITM
                    var sub2BITMnoLab = ent.View_1DIT.Where(x => x.Name.Contains("2 BITM") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub2BITMLab = ent.View_1DIT.Where(x => x.Name.Contains("2 BITM") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    //3 BITM
                    var sub3BITMnoLab = ent.View_1DIT.Where(x => x.Name.Contains("3 BITM") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub3BITMLab = ent.View_1DIT.Where(x => x.Name.Contains("3 BITM") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();




                    ArrayList arrayList = new ArrayList();

                    for (int l = 0; l < sub1BITMnoLab.Count(); l++)
                    {
                        if (l < sub1BITMnoLab.Count())
                        {
                            arrayList.Add(sub1BITMnoLab[l]);
                        }
                        if (l < sub2BITMnoLab.Count())
                        {
                            arrayList.Add(sub2BITMnoLab[l]);
                        }
                        if (l < sub3BITMnoLab.Count())
                        {
                            arrayList.Add(sub3BITMnoLab[l]);
                        }
                        if (l < sub1BITMLab.Count())
                        {
                            arrayList.Add(sub1BITMLab[l]);
                        }
                        if (l < sub2BITMLab.Count())
                        {
                            arrayList.Add(sub2BITMLab[l]);
                        }
                        if (l < sub3BITMLab.Count())
                        {
                            arrayList.Add(sub3BITMLab[l]);
                        }
                        
                        
                    }
                    //MessageBox.Show(arrayList.Count.ToString());
                    var kira = ent.Slots.ToList();

                    int i = 0;

                    for (int j = 0; j < GridView1.Rows.Count; j++)
                    {
                        for (int k = 1; k < GridView1.Columns.Count; k++)
                        {
                            if (i < arrayList.Count)
                            {

                                var excludeIsnin = new HashSet<int>();
                                var excludeSelasa = new HashSet<int>();
                                var excludeRabu = new HashSet<int>();
                                var excludeKhamis = new HashSet<int>();
                                var excludeJumaat = new HashSet<int>();

                                var excludeRoomLecturer = new HashSet<int>();
                                var excludeRoomLab = new HashSet<int>();

                                Slot newSlot = new Slot();
                                newSlot.ID = kira.Count() + 1;

                                if (arrayList[i].ToString().Contains("1 BITM"))
                                {
                                    newSlot.Course_ID = 16;

                                    //1 bitm
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());
                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("CALCULUS AND NUMERICAL METHODS"))
                                        {
                                            newSlot.Lect_Sub_ID = 148;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA STRUCTURE AND ALGORITHM"))
                                        {
                                            newSlot.Lect_Sub_ID = 152;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE"))
                                        {
                                            newSlot.Lect_Sub_ID = 154;
                                        }
                                        else if (arrayList[i].ToString().Contains("OPERATING SYSTEM"))
                                        {
                                            newSlot.Lect_Sub_ID = 156;
                                        }
                                        else if (arrayList[i].ToString().Contains("INTERACTIVE MEDIA AUTHORING"))
                                        {
                                            newSlot.Lect_Sub_ID = 150;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;
                                        if (arrayList[i].ToString().Contains("CALCULUS AND NUMERICAL METHODS"))
                                        {
                                            newSlot.Lect_Sub_ID = 149;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA STRUCTURE AND ALGORITHM"))
                                        {
                                            newSlot.Lect_Sub_ID = 153;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE"))
                                        {
                                            newSlot.Lect_Sub_ID = 155;
                                        }
                                        else if (arrayList[i].ToString().Contains("OPERATING SYSTEM"))
                                        {
                                            newSlot.Lect_Sub_ID = 157;
                                        }
                                        else if (arrayList[i].ToString().Contains("INTERACTIVE MEDIA AUTHORING"))
                                        {
                                            newSlot.Lect_Sub_ID = 151;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 16).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 16).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 16).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 16).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 16).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }
                                else if (arrayList[i].ToString().Contains("2 BITM"))
                                {
                                    newSlot.Course_ID = 17;

                                    //2 bitm
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());

                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("STATISTICS AND PROBABILITY"))
                                        {
                                            newSlot.Lect_Sub_ID = 165;
                                        }
                                        else if (arrayList[i].ToString().Contains("HUMAN-COMPUTER INTERACTION"))
                                        {
                                            newSlot.Lect_Sub_ID = 167;
                                        }
                                        else if (arrayList[i].ToString().Contains("INTERACTIVE COMPUTER GRAPHICS"))
                                        {
                                            newSlot.Lect_Sub_ID = 169;
                                        }
                                        else if (arrayList[i].ToString().Contains("OBJECT ORIENTED PROGRAMMING"))
                                        {
                                            newSlot.Lect_Sub_ID = 171;
                                        }
                                        else if (arrayList[i].ToString().Contains("INTERNET TECHNOLOGY"))
                                        {
                                            newSlot.Lect_Sub_ID = 173;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;

                                        if (arrayList[i].ToString().Contains("STATISTICS AND PROBABILITY"))
                                        {
                                            newSlot.Lect_Sub_ID = 166;
                                        }
                                        else if (arrayList[i].ToString().Contains("HUMAN-COMPUTER INTERACTION"))
                                        {
                                            newSlot.Lect_Sub_ID = 168;
                                        }
                                        else if (arrayList[i].ToString().Contains("INTERACTIVE COMPUTER GRAPHICS"))
                                        {
                                            newSlot.Lect_Sub_ID = 170;
                                        }
                                        else if (arrayList[i].ToString().Contains("OBJECT ORIENTED PROGRAMMING"))
                                        {
                                            newSlot.Lect_Sub_ID = 172;
                                        }
                                        else if (arrayList[i].ToString().Contains("INTERNET TECHNOLOGY"))
                                        {
                                            newSlot.Lect_Sub_ID = 174;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 17).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 17).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 17).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 17).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 17).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }
                                else if (arrayList[i].ToString().Contains("3 BITM"))
                                {
                                    newSlot.Course_ID = 18;

                                    //3 bitm
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());

                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("MOTION GRAPHICS"))
                                        {
                                            newSlot.Lect_Sub_ID = 176;
                                        }
                                        else if (arrayList[i].ToString().Contains("VIRTUAL REALITY TECHNOLOGY"))
                                        {
                                            newSlot.Lect_Sub_ID = 178;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE REQUIREMENT AND DESIGN"))
                                        {
                                            newSlot.Lect_Sub_ID = 180;
                                        }
                                        else if (arrayList[i].ToString().Contains("MOBILE APPLICATION DEVELOPMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 182;
                                        }
                                        else if (arrayList[i].ToString().Contains("INFORMATION TECHNOLOGY SECURITY"))
                                        {
                                            newSlot.Lect_Sub_ID = 184;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;

                                        if (arrayList[i].ToString().Contains("MOTION GRAPHICS"))
                                        {
                                            newSlot.Lect_Sub_ID = 177;
                                        }
                                        else if (arrayList[i].ToString().Contains("VIRTUAL REALITY TECHNOLOGY"))
                                        {
                                            newSlot.Lect_Sub_ID = 179;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE REQUIREMENT AND DESIGN"))
                                        {
                                            newSlot.Lect_Sub_ID = 181;
                                        }
                                        else if (arrayList[i].ToString().Contains("MOBILE APPLICATION DEVELOPMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 183;
                                        }
                                        else if (arrayList[i].ToString().Contains("INFORMATION TECHNOLOGY SECURITY"))
                                        {
                                            newSlot.Lect_Sub_ID = 185;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 18).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 18).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 18).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 18).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 18).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }

                            }
                            i++;
                        }
                    }


                }

                MessageBox.Show("The data has been saved", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);

                DropDownList1.Items[5].Enabled = false;
            }

            // bits
            else if (DropDownList1.SelectedValue == "BITS")
            {
                if (MessageBox.Show("Do you want to generate timetable for BITS", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
                {
                    //1 BITS
                    var sub1BITSnoLab = ent.View_1DIT.Where(x => x.Name.Contains("1 BITS") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub1BITSLab = ent.View_1DIT.Where(x => x.Name.Contains("1 BITS") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    //2 BITS
                    var sub2BITSnoLab = ent.View_1DIT.Where(x => x.Name.Contains("2 BITS") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub2BITSLab = ent.View_1DIT.Where(x => x.Name.Contains("2 BITS") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    //3 BITS
                    var sub3BITSnoLab = ent.View_1DIT.Where(x => x.Name.Contains("3 BITS") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub3BITSLab = ent.View_1DIT.Where(x => x.Name.Contains("3 BITS") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();




                    ArrayList arrayList = new ArrayList();

                    for (int l = 0; l < sub2BITSnoLab.Count(); l++)
                    {
                        if (l < sub1BITSnoLab.Count())
                        {
                            arrayList.Add(sub1BITSnoLab[l]);
                        }
                        if (l < sub2BITSnoLab.Count())
                        {
                            arrayList.Add(sub2BITSnoLab[l]);
                        }
                        if (l < sub3BITSnoLab.Count())
                        {
                            arrayList.Add(sub3BITSnoLab[l]);
                        }
                        if (l < sub1BITSLab.Count())
                        {
                            arrayList.Add(sub1BITSLab[l]);
                        }
                        if (l < sub2BITSLab.Count())
                        {
                            arrayList.Add(sub2BITSLab[l]);
                        }
                        if (l < sub3BITSLab.Count())
                        {
                            arrayList.Add(sub3BITSLab[l]);
                        }
                        
                        


                    }
                    //MessageBox.Show(arrayList.Count.ToString());
                    var kira = ent.Slots.ToList();

                    int i = 0;

                    for (int j = 0; j < GridView1.Rows.Count; j++)
                    {
                        for (int k = 1; k < GridView1.Columns.Count; k++)
                        {
                            if (i < arrayList.Count)
                            {

                                var excludeIsnin = new HashSet<int>();
                                var excludeSelasa = new HashSet<int>();
                                var excludeRabu = new HashSet<int>();
                                var excludeKhamis = new HashSet<int>();
                                var excludeJumaat = new HashSet<int>();

                                var excludeRoomLecturer = new HashSet<int>();
                                var excludeRoomLab = new HashSet<int>();

                                Slot newSlot = new Slot();
                                newSlot.ID = kira.Count() + 1;

                                if (arrayList[i].ToString().Contains("1 BITS"))
                                {
                                    newSlot.Course_ID = 19;

                                    //1 bits
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());
                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("CALCULUS AND NUMERICAL METHODS"))
                                        {
                                            newSlot.Lect_Sub_ID = 186;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA STRUCTURE AND ALGORITHM"))
                                        {
                                            newSlot.Lect_Sub_ID = 188;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE"))
                                        {
                                            newSlot.Lect_Sub_ID = 190;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE ENGINEERING"))
                                        {
                                            newSlot.Lect_Sub_ID = 192;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;
                                        if (arrayList[i].ToString().Contains("CALCULUS AND NUMERICAL METHODS"))
                                        {
                                            newSlot.Lect_Sub_ID = 187;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA STRUCTURE AND ALGORITHM"))
                                        {
                                            newSlot.Lect_Sub_ID = 189;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE"))
                                        {
                                            newSlot.Lect_Sub_ID = 191;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE ENGINEERING"))
                                        {
                                            newSlot.Lect_Sub_ID = 193;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 19).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 19).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 19).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 19).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 19).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }
                                else if (arrayList[i].ToString().Contains("2 BITS"))
                                {
                                    newSlot.Course_ID = 20;

                                    //2 bits
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());

                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("ARTIFICIAL INTELLIGENCE"))
                                        {
                                            newSlot.Lect_Sub_ID = 199;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE REQUIREMENT AND DESIGN"))
                                        {
                                            newSlot.Lect_Sub_ID = 201;
                                        }
                                        else if (arrayList[i].ToString().Contains("OBJECT ORIENTED PROGRAMMING"))
                                        {
                                            newSlot.Lect_Sub_ID = 203;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE VERIFICATION AND VALIDATION"))
                                        {
                                            newSlot.Lect_Sub_ID = 205;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA COMMUNICATION AND NETWORKING"))
                                        {
                                            newSlot.Lect_Sub_ID = 207;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;

                                        if (arrayList[i].ToString().Contains("ARTIFICIAL INTELLIGENCE"))
                                        {
                                            newSlot.Lect_Sub_ID = 200;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE REQUIREMENT AND DESIGN"))
                                        {
                                            newSlot.Lect_Sub_ID = 202;
                                        }
                                        else if (arrayList[i].ToString().Contains("OBJECT ORIENTED PROGRAMMING"))
                                        {
                                            newSlot.Lect_Sub_ID = 204;
                                        }
                                        else if (arrayList[i].ToString().Contains("SOFTWARE VERIFICATION AND VALIDATION"))
                                        {
                                            newSlot.Lect_Sub_ID = 206;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA COMMUNICATION AND NETWORKING"))
                                        {
                                            newSlot.Lect_Sub_ID = 208;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 20).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 20).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 20).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 20).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 20).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }
                                else if (arrayList[i].ToString().Contains("3 BITS"))
                                {
                                    newSlot.Course_ID = 21;

                                    //3 bits
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());

                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("WEB APPLICATION DEVELOPMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 211;
                                        }
                                        else if (arrayList[i].ToString().Contains("STRATEGIC INFORMATION SYSTEM PLANNING"))
                                        {
                                            newSlot.Lect_Sub_ID = 213;
                                        }
                                        else if (arrayList[i].ToString().Contains("SPECIAL TOPIC IN SOFTWARE ENGINEERING"))
                                        {
                                            newSlot.Lect_Sub_ID = 215;
                                        }
                                        else if (arrayList[i].ToString().Contains("MOBILE APPLICATION DEVELOPMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 217;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;

                                        if (arrayList[i].ToString().Contains("WEB APPLICATION DEVELOPMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 212;
                                        }
                                        else if (arrayList[i].ToString().Contains("STRATEGIC INFORMATION SYSTEM PLANNING"))
                                        {
                                            newSlot.Lect_Sub_ID = 214;
                                        }
                                        else if (arrayList[i].ToString().Contains("SPECIAL TOPIC IN SOFTWARE ENGINEERING"))
                                        {
                                            newSlot.Lect_Sub_ID = 216;
                                        }
                                        else if (arrayList[i].ToString().Contains("MOBILE APPLICATION DEVELOPMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 218;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 21).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 21).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 21).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 21).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 21).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }

                            }
                            i++;
                        }
                    }


                }

                MessageBox.Show("The data has been saved", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);

                DropDownList1.Items[6].Enabled = false;
            }


            // bitz
            else if (DropDownList1.SelectedValue == "BITZ")
            {
                if (MessageBox.Show("Do you want to generate timetable for BITZ", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
                {
                    //1 BITZ
                    var sub1BITZnoLab = ent.View_1DIT.Where(x => x.Name.Contains("1 BITZ") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub1BITZLab = ent.View_1DIT.Where(x => x.Name.Contains("1 BITZ") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    //2 BITZ
                    var sub2BITZnoLab = ent.View_1DIT.Where(x => x.Name.Contains("2 BITZ") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub2BITZLab = ent.View_1DIT.Where(x => x.Name.Contains("2 BITZ") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    //3 BITZ
                    var sub3BITZnoLab = ent.View_1DIT.Where(x => x.Name.Contains("3 BITZ") && x.CodeName.StartsWith("BIT") && x.TypeID == 1).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();
                    var sub3BITZLab = ent.View_1DIT.Where(x => x.Name.Contains("3 BITZ") && x.CodeName.StartsWith("BIT") && x.TypeID == 2).Select(x => x.SubjectName + nl + x.Name + nl + x.TypeName).ToList().ToArray();




                    ArrayList arrayList = new ArrayList();

                    for (int l = 0; l < sub1BITZnoLab.Count(); l++)
                    {
                        if (l < sub1BITZnoLab.Count())
                        {
                            arrayList.Add(sub1BITZnoLab[l]);
                        }
                        if (l < sub2BITZnoLab.Count())
                        {
                            arrayList.Add(sub2BITZnoLab[l]);
                        }
                        if (l < sub3BITZnoLab.Count())
                        {
                            arrayList.Add(sub3BITZnoLab[l]);
                        }
                        if (l < sub1BITZLab.Count())
                        {
                            arrayList.Add(sub1BITZLab[l]);
                        }
                        if (l < sub2BITZLab.Count())
                        {
                            arrayList.Add(sub2BITZLab[l]);
                        }
                        if (l < sub3BITZLab.Count())
                        {
                            arrayList.Add(sub3BITZLab[l]);
                        }
                    }
                        

                    //MessageBox.Show(arrayList.Count.ToString());
                    var kira = ent.Slots.ToList();

                    int i = 0;

                    for (int j = 0; j < GridView1.Rows.Count; j++)
                    {
                        for (int k = 1; k < GridView1.Columns.Count; k++)
                        {
                            if (i < arrayList.Count)
                            {

                                var excludeIsnin = new HashSet<int>();
                                var excludeSelasa = new HashSet<int>();
                                var excludeRabu = new HashSet<int>();
                                var excludeKhamis = new HashSet<int>();
                                var excludeJumaat = new HashSet<int>();

                                var excludeRoomLecturer = new HashSet<int>();
                                var excludeRoomLab = new HashSet<int>();

                                Slot newSlot = new Slot();
                                newSlot.ID = kira.Count() + 1;

                                if (arrayList[i].ToString().Contains("1 BITZ"))
                                {
                                    newSlot.Course_ID = 22;

                                    //1 bitz
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());
                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("CALCULUS AND NUMERICAL METHODS"))
                                        {
                                            newSlot.Lect_Sub_ID = 220;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA STRUCTURE AND ALGORITHM"))
                                        {
                                            newSlot.Lect_Sub_ID = 224;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE"))
                                        {
                                            newSlot.Lect_Sub_ID = 226;
                                        }
                                        else if (arrayList[i].ToString().Contains("HUMAN-COMPUTER INTERACTION"))
                                        {
                                            newSlot.Lect_Sub_ID = 222;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA COMMUNICATION AND NETWORKING"))
                                        {
                                            newSlot.Lect_Sub_ID = 228;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;

                                        if (arrayList[i].ToString().Contains("CALCULUS AND NUMERICAL METHODS"))
                                        {
                                            newSlot.Lect_Sub_ID = 221;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA STRUCTURE AND ALGORITHM"))
                                        {
                                            newSlot.Lect_Sub_ID = 225;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATABASE"))
                                        {
                                            newSlot.Lect_Sub_ID = 227;
                                        }
                                        else if (arrayList[i].ToString().Contains("HUMAN-COMPUTER INTERACTION"))
                                        {
                                            newSlot.Lect_Sub_ID = 223;
                                        }
                                        else if (arrayList[i].ToString().Contains("DATA COMMUNICATION AND NETWORKING"))
                                        {
                                            newSlot.Lect_Sub_ID = 229;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 22).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 22).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 22).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 22).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 22).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }
                                else if (arrayList[i].ToString().Contains("2 BITZ"))
                                {
                                    newSlot.Course_ID = 23;

                                    //2 bitz
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());

                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("SOFTWARE ENGINEERING"))
                                        {
                                            newSlot.Lect_Sub_ID = 233;
                                        }
                                        else if (arrayList[i].ToString().Contains("OBJECT ORIENTED PROGRAMMING"))
                                        {
                                            newSlot.Lect_Sub_ID = 235;
                                        }
                                        else if (arrayList[i].ToString().Contains("NETWORK SECURITY INFRASTRUCTURE AND DESIGN"))
                                        {
                                            newSlot.Lect_Sub_ID = 237;
                                        }
                                        else if (arrayList[i].ToString().Contains("PHYSICAL SECURITY AND ELECTRONIC SURVEILLANCE"))
                                        {
                                            newSlot.Lect_Sub_ID = 239;
                                        }
                                        else if (arrayList[i].ToString().Contains("CYBER LAW AND SECURITY POLICY"))
                                        {
                                            newSlot.Lect_Sub_ID = 241;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;

                                        if (arrayList[i].ToString().Contains("SOFTWARE ENGINEERING"))
                                        {
                                            newSlot.Lect_Sub_ID = 234;
                                        }
                                        else if (arrayList[i].ToString().Contains("OBJECT ORIENTED PROGRAMMING"))
                                        {
                                            newSlot.Lect_Sub_ID = 236;
                                        }
                                        else if (arrayList[i].ToString().Contains("NETWORK SECURITY INFRASTRUCTURE AND DESIGN"))
                                        {
                                            newSlot.Lect_Sub_ID = 238;
                                        }
                                        else if (arrayList[i].ToString().Contains("PHYSICAL SECURITY AND ELECTRONIC SURVEILLANCE"))
                                        {
                                            newSlot.Lect_Sub_ID = 240;
                                        }
                                        else if (arrayList[i].ToString().Contains("CYBER LAW AND SECURITY POLICY"))
                                        {
                                            newSlot.Lect_Sub_ID = 242;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 23).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 23).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 23).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 23).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 23).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }
                                else if (arrayList[i].ToString().Contains("3 BITZ"))
                                {
                                    newSlot.Course_ID = 24;

                                    //3 bitz
                                    if (arrayList[i].ToString().Contains("Lecturer"))
                                    {
                                        int rangelect = rnd.Next(lecturerRooms.Count());

                                        newSlot.Room_ID = lecturerRooms[rangelect].ID;

                                        if (arrayList[i].ToString().Contains("DIGITAL FORENSIC"))
                                        {
                                            newSlot.Lect_Sub_ID = 243;
                                        }
                                        else if (arrayList[i].ToString().Contains("WATERMARKING AND STEGANOGRAPHY"))
                                        {
                                            newSlot.Lect_Sub_ID = 245;
                                        }
                                        else if (arrayList[i].ToString().Contains("COMPUTER AUDIT AND RISK MANAGEMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 247;
                                        }
                                        else if (arrayList[i].ToString().Contains("HACKING TECHNIQUES AND PREVENTION"))
                                        {
                                            newSlot.Lect_Sub_ID = 249;
                                        }

                                    }

                                    if (arrayList[i].ToString().Contains("Lab"))
                                    {
                                        //MessageBox.Show(arrayList[i].ToString());
                                        int rangelab = rnd.Next(roomLab.Count());
                                        newSlot.Room_ID = roomLab[rangelab].ID;

                                        if (arrayList[i].ToString().Contains("DIGITAL FORENSIC"))
                                        {
                                            newSlot.Lect_Sub_ID = 244;
                                        }
                                        else if (arrayList[i].ToString().Contains("WATERMARKING AND STEGANOGRAPHY"))
                                        {
                                            newSlot.Lect_Sub_ID = 246;
                                        }
                                        else if (arrayList[i].ToString().Contains("COMPUTER AUDIT AND RISK MANAGEMENT"))
                                        {
                                            newSlot.Lect_Sub_ID = 248;
                                        }
                                        else if (arrayList[i].ToString().Contains("HACKING TECHNIQUES AND PREVENTION"))
                                        {
                                            newSlot.Lect_Sub_ID = 250;
                                        }
                                    }
                                    var slots2 = ent.Slots.ToList();

                                    // day
                                    if (j == 0) // hari isnin
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 1;

                                        var isnin = slots2.Where(x => x.Timetable_ID == 1 && x.Course_ID == 24).ToList();
                                        for (int z = 0; z < isnin.Count(); z++)
                                        {
                                            excludeIsnin.Add(isnin[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeIsnin.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeIsnin.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 1) // hari selasa
                                    {

                                        // hari
                                        newSlot.Timetable_ID = 2;

                                        var selasa = slots2.Where(x => x.Timetable_ID == 2 && x.Course_ID == 24).ToList();
                                        for (int z = 0; z < selasa.Count(); z++)
                                        {
                                            excludeSelasa.Add(selasa[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeSelasa.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeSelasa.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 2) // hari rabu
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 3;

                                        var rabu = slots2.Where(x => x.Timetable_ID == 3 && x.Course_ID == 24).ToList();
                                        for (int z = 0; z < rabu.Count(); z++)
                                        {
                                            excludeRabu.Add(rabu[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeRabu.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeRabu.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else if (j == 3) // hari khamis
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 4;

                                        var khamis = slots2.Where(x => x.Timetable_ID == 4 && x.Course_ID == 24).ToList();
                                        for (int z = 0; z < khamis.Count(); z++)
                                        {
                                            excludeKhamis.Add(khamis[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeKhamis.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeKhamis.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }
                                    else // hari jumaat
                                    {
                                        // hari
                                        newSlot.Timetable_ID = 5;

                                        var jumaat = slots2.Where(x => x.Timetable_ID == 5 && x.Course_ID == 24).ToList();
                                        for (int z = 0; z < jumaat.Count(); z++)
                                        {
                                            excludeJumaat.Add(jumaat[z].Number.Value);
                                        }

                                        var range = Enumerable.Range(1, 7).Where(x => !excludeJumaat.Contains(x));
                                        int index = rnd.Next(1, 7 - excludeJumaat.Count);

                                        newSlot.Number = range.ElementAt(index);
                                    }

                                    ent.Slots.Add(newSlot);
                                    ent.SaveChanges();
                                }

                            }
                            i++;
                        }
                    }


                }

                MessageBox.Show("The data has been saved", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);

                DropDownList1.Items[7].Enabled = false;
            }
        }

        protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Are you sure you want to clear all the data ?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                var allslot = ent.Slots.ToList();
                SqlCommand cmd;
                SqlConnection con;
                con = new SqlConnection("Server = .\\SQLEXPRESS; Initial Catalog = Timetable_pro; Integrated Security = True");
                con.Open();
                string strSql = "TRUNCATE TABLE Slot";
                cmd = new SqlCommand(strSql, con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Success cleared", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);

                for (int j = 0; j < GridView1.Rows.Count; j++)
                {
                    for (int k = 1; k < GridView1.Columns.Count; k++)
                    {
                        GridView1.Rows[j].Cells[k].Text = "";
                    }
                }

                Button1.Enabled = true;
            }
        }
    }
}