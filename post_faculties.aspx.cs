using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.IO;
using System.Data.SqlClient;

public partial class update_news : System.Web.UI.Page
{
    sql_operations sql_op = new sql_operations();
    SqlParameter[] sp = null;
    string saveLocation;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                if (Session["iamuser"] == null)
                {
                    Response.Redirect("science_login.aspx");
                }
                else
                {
                    generateFacultyId();

                    //FillGrid();

                    string str_department = @"SELECT [PAGE_ID] ,[PAGE_NAME],[MOBILE_NO],[DEPARTMENT_PASSWORD] FROM [TBL_COLLEGE_PAGE] order by [PAGE_NAME]";
                    DataTable dt_department = new DataTable();
                    dt_department = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_department);

                    ddl_department.DataSource = dt_department;
                    ddl_department.DataTextField = "PAGE_NAME";
                    ddl_department.DataValueField = "PAGE_NAME";
                    ddl_department.DataBind();

                    ddl_department_search.DataSource = dt_department;
                    ddl_department_search.DataTextField = "PAGE_NAME";
                    ddl_department_search.DataValueField = "PAGE_NAME";
                    ddl_department_search.DataBind();

                    ddl_department_search.Items.Insert(0, new ListItem("Select", "0"));

                    //FillAchievementGrid();

                    txt_name.Focus();

                    if (Session["iamuser"].ToString() != "scdurg")
                    {
                        string pageid = Session["iamuser"].ToString();
                        string str_query = "select PAGE_ID,PAGE_HEAD_ID,PAGE_NAME,PASSWORD from TBL_SCD_PAGE where PAGE_ID=" + pageid + "";
                        DataTable dt_data = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

                        ddl_department.SelectedValue = dt_data.Rows[0]["PAGE_NAME"].ToString();
                        ddl_department.Enabled = false;

                        ddl_department_search.SelectedValue = dt_data.Rows[0]["PAGE_NAME"].ToString();
                        ddl_department_search.Enabled = false;
                        FillGrid();
                    }
                }
            }
            catch
            {
                Response.Redirect("science_login.aspx");
            }
        }
    }

    protected void generateFacultyId()
    {
        string str = "select IIf(max(faculty_id) Is Null,0,max(faculty_id))+1 from tbl_Faculty";
        object obj = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, str);

        lbl_Id.Text = "" + obj;
    }

    protected void GetFacultyProfile()
    {
        if(lbl_Id.Text!="")
        {
            DataTable dtfacultyprofile = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT faculty_profile FROM TBL_FACULTY WHERE faculty_id=" + lbl_Id.Text + "");
            if (dtfacultyprofile.Rows.Count > 0)
            {
                txt_description.Content = Server.HtmlDecode(dtfacultyprofile.Rows[0]["faculty_profile"].ToString());
            }
        }
    }

    protected void imgbtn_biodata_delete_Click(object sender, EventArgs e)
    {
        try
        {
            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            string profileid = gv_biodata.DataKeys[gvrow.RowIndex].Values["AchievementID"].ToString();
            string path = gv_biodata.DataKeys[gvrow.RowIndex].Values["attachment"].ToString();

            string str_eventdelete = "select Attachment from tbl_faculties_achievements where AchievementID=" + profileid + "";
            DataTable dt_event = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_eventdelete);

            string actual_path = Server.MapPath(path);
            FileInfo file = new FileInfo(actual_path);
            if (file.Exists)//check file exsit or not
            {
                file.Delete();
            }


            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "delete from tbl_faculties_achievements where AchievementID=" + profileid);
            FillAchievementGrid();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", "alert('Profile deleted successfully!!');", true);

        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error while selecting <br>" + ee.Message;
        }
    }
    protected void imgbtn_edit_Click(object sender, EventArgs e)
    {
        try
        {
            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            string facultiesid = news_Grid.DataKeys[gvrow.RowIndex].Values["faculty_id"].ToString();
            
            string path = news_Grid.DataKeys[gvrow.RowIndex].Values["filepath"].ToString();

            lbl_Id.Text = facultiesid;
            txt_name.Text = gvrow.Cells[2].Text.ToString();
            txt_qualification.Text = gvrow.Cells[3].Text.ToString();
            txt_designation.Text = gvrow.Cells[4].Text.ToString();
            txt_mobileno.Text = gvrow.Cells[5].Text.ToString();
            ddl_type.Text = gvrow.Cells[6].Text.ToString();
            ddl_department.Text = gvrow.Cells[7].Text.ToString();
            txt_password.Text = gvrow.Cells[8].Text.ToString();
            ddl_user_status.Text = gvrow.Cells[9].Text.ToString();
            GetFacultyProfile();
            Label1.Text = path;
            chk_new.Visible = true;
            FileUpload1.Visible = false;
            FillAchievementGrid();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error while selecting <br>" + ee.Message;
        }
    }
    protected void imgbtn_delete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndelete.NamingContainer;

            string facultiesid = news_Grid.DataKeys[gvrow.RowIndex].Values["faculty_id"].ToString();

            string str_eventdelete1 = "select filepath from tbl_Faculty where faculty_id=" + Convert.ToInt32(facultiesid) + "";
            DataTable dt_event1 = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_eventdelete1);

            for (int i = 0; i < dt_event1.Rows.Count; i++)
            {
                if (dt_event1.Rows[i]["filepath"].ToString() != "")
                {
                    string path = Server.MapPath(dt_event1.Rows[i]["filepath"].ToString());
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "delete from tbl_Faculty where faculty_id=" + Convert.ToInt32(facultiesid) + "");
            FillGrid();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error while deleting<br>" + ee.Message;
        }
    }
    protected void FillGrid()
    {
        try
        {
            string str_where = "";
            if (ddl_department_search.SelectedValue != "0")
            {
                str_where = " where faculty_department='" + ddl_department_search.Text + "'";
            }
            
            news_Grid.DataSource = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT [faculty_id], [faculty_name] , [faculty_qualification] , [faculty_designation] , [faculty_mobile] ,faculty_type ,faculty_department ,faculty_order ,user_type,faculty_password,Status, [filepath] FROM [tbl_Faculty] "+str_where+ " order by [faculty_order]");
            news_Grid.DataBind();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this,this.GetType(),"","alert('Error in Fill Grid<br>"+ee.Message+"')",true);
        }
    }

    protected void GenerateAchievementID()
    {
        try
        {
            string str = "select IIf(max(AchievementID) Is Null,0,max(AchievementID))+1 from tbl_faculties_achievements";
            object obj = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, str);

            lbl_aid.Text = "" + obj;
        }
        catch (Exception ee)
        {
 
        }
    }
    protected void btn_setorder_Click(object sender, EventArgs e)
    {
        try
        {
            if (news_Grid.Rows.Count > 0)
            {
                int j = 0;
                for (int i = 0; i < news_Grid.Rows.Count; i++)
                {

                    string reorder = ((TextBox)news_Grid.Rows[i].FindControl("txt_order")).Text;
                    string facultyid = news_Grid.DataKeys[i].Values["faculty_id"].ToString();

                    if (reorder != "")
                    {
                        string str_insert = @"UPDATE [tbl_Faculty] SET [faculty_order] = @faculty_order WHERE [faculty_id] = @faculty_id";

                        sp = new SqlParameter[2];

                        sp[0] = new SqlParameter("@faculty_order", SqlDbType.Int);
                        sp[0].Value = Convert.ToInt32(reorder);

                        sp[1] = new SqlParameter("@faculty_id", SqlDbType.Int);
                        sp[1].Value = Convert.ToInt32(facultyid);

                        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);

                        j++;
                    }
                }

                if (j != 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('" + j.ToString() + " Records Updated')", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('No Records Found to Re-Order')", true);
            }
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error while set order<br>" + ee.Message;
        }
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        try
        {
            int flag = validateThis();
            if (flag == 1)
            {
                int allok = 0;
                if (Label1.Text == "0")
                {
                    string picname = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string picext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();
                    if (picext == ".jpg" || picext == ".jpeg" || picext == ".png")
                    {
                        saveLocation = "newsData" + "/F" + lbl_Id.Text.ToString() + picext;
                        FileUpload1.PostedFile.SaveAs(MapPath(saveLocation));
                        Label1.Text = saveLocation.ToString();
                    }
                    else
                    {
                        allok = 1;
                    }
                }
                else
                {
                    saveLocation = Label1.Text;
                }

                #region Process Save or Update
                DataTable dtFaculty = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select * from tbl_Faculty where faculty_id=" + Convert.ToInt32(lbl_Id.Text) + " ");

                if (dtFaculty.Rows.Count > 0)
                {
                    string str_update = @"UPDATE [dbo].[tbl_Faculty] set [faculty_name] = @faculty_name ,[faculty_qualification] = @faculty_qualification,
            [faculty_designation]=@faculty_designation, [faculty_mobile] = @faculty_mobile ,[faculty_type] = @faculty_type ,
            [faculty_department] = @faculty_department, [faculty_order]=@faculty_order, [filepath] = @filepath, 
        [faculty_password]=@faculty_password, [Status]= @Status, [user_type]=@user_type,faculty_profile=@faculty_profile WHERE [faculty_id] = @faculty_id";
                    sp = new SqlParameter[13];


                    sp[0] = new SqlParameter("@faculty_name", SqlDbType.NVarChar, 150);
                    sp[0].Value = Server.HtmlEncode(txt_name.Text);

                    sp[1] = new SqlParameter("@faculty_qualification", SqlDbType.NVarChar, 150);
                    sp[1].Value = Server.HtmlEncode(txt_qualification.Text);

                    sp[2] = new SqlParameter("@faculty_designation", SqlDbType.NVarChar, -1);
                    sp[2].Value = Server.HtmlEncode(txt_designation.Text);

                    sp[3] = new SqlParameter("@faculty_mobile", SqlDbType.NVarChar, 150);
                    sp[3].Value = Server.HtmlEncode(txt_mobileno.Text);

                    sp[4] = new SqlParameter("@faculty_type", SqlDbType.NVarChar, 150);
                    sp[4].Value = Server.HtmlEncode(ddl_type.SelectedValue);

                    sp[5] = new SqlParameter("@faculty_department", SqlDbType.NVarChar, 150);
                    sp[5].Value = Server.HtmlEncode(ddl_department.SelectedValue);

                    sp[6] = new SqlParameter("@faculty_order", SqlDbType.Int);
                    sp[6].Value = 1;

                    sp[7] = new SqlParameter("@filepath", SqlDbType.NVarChar, 150);
                    sp[7].Value = Server.HtmlEncode(saveLocation);

                    sp[8] = new SqlParameter("@faculty_password", SqlDbType.NVarChar, 30);
                    sp[8].Value = Server.HtmlEncode(txt_password.Text);

                    sp[9] = new SqlParameter("@Status", SqlDbType.NVarChar, 10);
                    sp[9].Value = Server.HtmlEncode(ddl_user_status.SelectedValue);

                    sp[10] = new SqlParameter("@user_type", SqlDbType.NVarChar, 6);
                    sp[10].Value = Server.HtmlEncode("User");

                    sp[11] = new SqlParameter("@faculty_profile", SqlDbType.NVarChar, -1);
                    sp[11].Value = Server.HtmlEncode(txt_description.Content);

                    sp[12] = new SqlParameter("@faculty_id", SqlDbType.Int);
                    sp[12].Value = Convert.ToInt32(lbl_Id.Text);


                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Update Successfully')", true);
                    ClearMyPage();
                   

                }
                else
                {
                    
                    int faculty_id = sql_op.generate_id_sql("SELECT ISNULL(MAX(faculty_id),0) FROM tbl_Faculty");

                    string str_insert = @"INSERT INTO [dbo].[tbl_Faculty]([faculty_id],[faculty_name],[faculty_qualification],
                            [faculty_designation],[faculty_mobile],[faculty_type],[faculty_department],[faculty_order],[filepath],[faculty_password], [Status], [user_type],faculty_profile)
                        VALUES (@faculty_id,@faculty_name,@faculty_qualification,@faculty_designation,@faculty_mobile,
                                @faculty_type,@faculty_department,@faculty_order,@filepath,@faculty_password,@Status,@user_type,@faculty_profile)";

                    sp = new SqlParameter[13];

                    sp[0] = new SqlParameter("@faculty_id", SqlDbType.Int);
                    sp[0].Value = faculty_id;

                    sp[1] = new SqlParameter("@faculty_name", SqlDbType.NVarChar, 150);
                    sp[1].Value = Server.HtmlEncode(txt_name.Text);

                    sp[2] = new SqlParameter("@faculty_qualification", SqlDbType.NVarChar, 150);
                    sp[2].Value = Server.HtmlEncode(txt_qualification.Text);

                    sp[3] = new SqlParameter("@faculty_designation", SqlDbType.NVarChar, -1);
                    sp[3].Value = Server.HtmlEncode(txt_designation.Text);

                    sp[4] = new SqlParameter("@faculty_mobile", SqlDbType.NVarChar, 10);
                    sp[4].Value = Server.HtmlEncode(txt_mobileno.Text);

                    sp[5] = new SqlParameter("@faculty_type", SqlDbType.NVarChar, 150);
                    sp[5].Value = Server.HtmlEncode(ddl_type.SelectedValue);

                    sp[6] = new SqlParameter("@faculty_department", SqlDbType.NVarChar, 150);
                    sp[6].Value = Server.HtmlEncode(ddl_department.SelectedValue);

                    sp[7] = new SqlParameter("@faculty_order", SqlDbType.Int);
                    sp[7].Value = 1;

                    sp[8] = new SqlParameter("@filepath", SqlDbType.NVarChar, 150);
                    sp[8].Value = Server.HtmlEncode(saveLocation);

                    sp[9] = new SqlParameter("@faculty_password", SqlDbType.NVarChar, 30);
                    sp[9].Value = Server.HtmlEncode(txt_password.Text);

                    sp[10] = new SqlParameter("@Status", SqlDbType.NVarChar, 10);
                    sp[10].Value = Server.HtmlEncode(ddl_user_status.SelectedValue);

                    sp[11] = new SqlParameter("@user_type", SqlDbType.NVarChar, 6);
                    sp[11].Value = Server.HtmlEncode("User");

                    sp[12] = new SqlParameter("@faculty_profile", SqlDbType.NVarChar, -1);
                    sp[12].Value = Server.HtmlEncode(txt_description.Content);

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Insert Successfully')", true);
                    ClearMyPage(); 

                }
                
                #endregion
            }

        }
        catch (Exception ex)
        {
            lblInfo.Text = ex.Message;
        }
    }

    protected void ClearMyPage()
    {
        generateFacultyId();
        GenerateAchievementID();
        txt_description.Content = "";
        txtAchievement.Text = "";
        txt_designation.Text = "";
        txt_mobileno.Text = "";
        txt_name.Text = "";
        txt_password.Text = "";
        txt_qualification.Text = "";
        lblInfo.Text = "";
        Label1.Text = "0";
        chk_new.Visible = false;
        FileUpload1.Visible = true;
        FillAchievementGrid();
    }
    protected int validateThis()
    {
        if (txt_name.Text == "")
        {
            lblInfo.Text = "Error : Enter Faculty or Staff Name";
            return (0);
        }
        else if (txt_qualification.Text == "")
        {
            lblInfo.Text = "Error : Enter Qualification";
            return (0);
        }

        else if (txt_designation.Text == "")
        {
            lblInfo.Text = "Error : Enter Designation";
            return (0);
        }

        else if (txt_mobileno.Text == "")
        {
            lblInfo.Text = "Error : Enter Mobile No.";
            return (0);
        }
        else if (!FileUpload1.HasFile && Label1.Text == "0")
        {
            lblInfo.Text = "Error : File Required";
            return (0);
        }
        else
        {
            return (1);
        }
    }

    protected void chk_new_CheckedChanged(object sender, EventArgs e)
    {
        if (chk_new.Checked == true)
        {
            chk_new.Visible = false;
            FileUpload1.Visible = true;
            Label1.Text = "0";
        }
    }

    protected void imgAchievementSave_Click(object sender, ImageClickEventArgs e)
    {
        string achievement = txtAchievement.Text;
        if (String.IsNullOrEmpty(achievement))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", "alert('Please enter profile caption!!');", true);
            txtAchievement.Focus();
            return;
        }
        else if (!fileAttachment.HasFile && imglbl.Text == "0")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", "alert('Please enter profile caption!!');", true);
            return;
        }
        else if (gv_biodata.Rows.Count > 0) 
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", "alert('You can enter only one biodata!!');", true);
            return;
        }
        else
        {
            int AchievementID = sql_op.generate_id_sql("SELECT ISNULL(MAX(AchievementID),0) FROM tbl_faculties_achievements");
            string picname = System.IO.Path.GetFileName(fileAttachment.PostedFile.FileName);
            string picext = System.IO.Path.GetExtension(fileAttachment.PostedFile.FileName).ToLower();
            if (picext == ".pdf")
            {
                saveLocation = "Faculty" + "/achievement_" + AchievementID.ToString() + picext;
                fileAttachment.PostedFile.SaveAs(MapPath(saveLocation));
                imglbl.Text = saveLocation.ToString();
            }

            string str_insert = @"INSERT INTO [dbo].[tbl_faculties_achievements]([AchievementID],[FacultyID],[AchievementDetail],[Attachment])
                        VALUES (@AchievementID,@FacultyID,@AchievementDetail,@Attachment)";

            sp = new SqlParameter[4];

            sp[0] = new SqlParameter("@AchievementID", SqlDbType.Int);
            sp[0].Value = AchievementID;

            sp[1] = new SqlParameter("@FacultyID", SqlDbType.Int);
            sp[1].Value = Convert.ToInt32(lbl_Id.Text);

            sp[2] = new SqlParameter("@AchievementDetail", SqlDbType.NVarChar, 150);
            sp[2].Value = Server.HtmlEncode(txtAchievement.Text);

            sp[3] = new SqlParameter("@Attachment", SqlDbType.NVarChar, -1);
            sp[3].Value = Server.HtmlEncode(imglbl.Text);

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Update Successfully')", true);
            FillAchievementGrid();

            Clear();
        }

       

    }

    private void Clear()
    {
        GenerateAchievementID();
        txtAchievement.Text = "";
        imglbl.Text = "0";
    }

    private void FillAchievementGrid()
    {


        DataTable dt = new DataTable();

        dt = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select AchievementID,AchievementDetail as achievements,AchievementYear as achievementyear,Attachment from tbl_faculties_achievements where FacultyID = " + lbl_Id.Text + "");

        gv_biodata.DataSource = dt;
        gv_biodata.DataBind();
        //conn.Close();
    }
    

    protected void ddl_department_search_SelectedIndexChanged1(object sender, EventArgs e)
    {
        FillGrid();
    }
    
}
