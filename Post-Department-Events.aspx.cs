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
using System.Data.SqlClient;



using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;



public partial class update_news : System.Web.UI.Page
{
    sql_operations sql_op = new sql_operations();
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    //SqlConnection conn2 = new SqlConnection(ConfigurationManager.AppSettings["connect1"]);
    string saveLocation;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {            
            try
            {
                if (Session["iamuser"]==null)
                {
                    Response.Redirect("CLogin.aspx");
                }
                else
                {
                    lbl_user.Text = "Hello " + Session["iamuser"].ToString();

                    txt_date.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    for (int i = 1; i <= 100; i++)
                    {
                        ddl_order.Items.Add(i.ToString());
                    }

                    DataTable dt_department = new DataTable();
                    dt_department = sql_op.get_datatable("select department_id,department_name from tbl_department order by department_id");

                    ddl_department.DataSource = dt_department;
                    ddl_department.DataTextField = "department_name";
                    ddl_department.DataValueField = "department_id";
                    ddl_department.DataBind();

                    ddl_department.Items.Insert(0, new ListItem("Select Department", "0"));

                    //fill_grid();
                }
            }
            catch
            {
                Response.Redirect("CLogin.aspx");
            }
        }
    }

    


    protected void btn_Save_Click(object sender, ImageClickEventArgs e)
    {
        int flag = validateThis();
        if (flag == 1)
        {
            if (Label1.Text == "0")
            {
                string picname = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                string picext = picname;
                int namelength;
                namelength = picname.Length;
                int index = picname.IndexOf(".");
                int sub_length = namelength - index;


                //picname = picname.Substring(0, namelength - 4);
                namelength = picname.Length;
                //picext = picext.Substring(namelength, 4);
                picext = picname.Substring(index, sub_length);
                picname = lbl_Id.Text.ToString();
                saveLocation = Server.MapPath("Department/"+ddl_department.SelectedValue+"_" + lbl_Id.Text.ToString() + picext);
                //FileUpload1.PostedFile.SaveAs(MapPath(saveLocation));

                Stream strm = FileUpload1.PostedFile.InputStream;
                var targetFile = saveLocation;
                //Based on scalefactor image size will vary

                sql_op.GenerateThumbnails(0.5, strm, targetFile);
                //sql_op.GenerateThumbnails(1, strm, targetFile);

                saveLocation = "Department/" + ddl_department.SelectedValue + "_" + lbl_Id.Text.ToString() + picext;

            }
            else
            {
                saveLocation = Label1.Text;
            }

            #region Process Save or Update
            OleDbDataAdapter adptExists = new OleDbDataAdapter("select department_id from tbl_department_event where event_id=" + Convert.ToInt32(lbl_Id.Text) + " and department_id="+ddl_department.SelectedValue+"", conn);
            DataSet dsExists = new DataSet();
            adptExists.Fill(dsExists, "tblExists");
            if (dsExists != null && dsExists.Tables.Count > 0 && dsExists.Tables["tblExists"].Rows.Count > 0)
            {
                conn.Open();
                OleDbCommand cmdupdate = new OleDbCommand("update tbl_department_event set event_name='" + txt_Title.Text.ToString() + "',event_date='" + txt_date.Text + "',event_venue='" + txt_venue.Text + "',event_pic='" + saveLocation + "',event_description=@description, event_order=" + ddl_order.Text + " where event_id=" + lbl_Id.Text + " and department_id=" + ddl_department.SelectedValue + "", conn);
                cmdupdate.Parameters.AddWithValue("@description",txt_description.Content);
                cmdupdate.ExecuteNonQuery();
                conn.Close();
                WebLog.SqlOperation().Update_log("An event updated in " + ddl_department.SelectedItem.Text + " Department", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Update", "Photogallery.aspx");
            }
            else
            {
                conn.Open();
                OleDbCommand cmdsave = new OleDbCommand("insert into tbl_department_event values(" + Convert.ToInt32(ddl_department.SelectedValue) + "," + Convert.ToInt32(lbl_Id.Text) + ",'" + txt_Title.Text.ToString() + "','" + txt_date.Text + "','" + txt_venue.Text + "','" + saveLocation + "',@description, " + ddl_order.Text + ")", conn);
                cmdsave.Parameters.AddWithValue("@description", txt_description.Content);
                cmdsave.ExecuteNonQuery();
                conn.Close();
                WebLog.SqlOperation().Update_log("An event added in " + ddl_department.SelectedItem.Text + " Department", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Insert", "IQAC.aspx");
            }
            Response.Redirect("Post-Department-Events.aspx");
            #endregion
        }
    }

    

    protected void generateId()
    {
        try
        {
            string str = "select max(event_id) from tbl_department_event where department_id="+ddl_department.SelectedValue+"";
            lbl_Id.Text = (sql_op.generate_id(str)).ToString();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in generateId "+ee.Message;
        }
    }

    protected int validateThis()
    {
        if (ddl_department.SelectedValue == "0")
        {
            lblInfo.Text = "Please any Department then proceed";
            return (0);
        }
        else if (txt_Title.Text == "")
        {
            lblInfo.Text = "Error : Event Name Required";
            return (0);
        }
        else if (txt_date.Text == "")
        {
            lblInfo.Text = "Error : Date Required";
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

    protected void fill_grid()
    {
        try
        {
            OleDbDataAdapter adpt_fill = new OleDbDataAdapter("SELECT [event_id] as [ID], [event_name] as [Event], event_date as [Date], [event_venue] as [Venue], [event_pic] as [Pic], event_order as [Order] FROM [tbl_department_event] where department_id="+ddl_department.SelectedValue+" ORDER BY event_order asc, [event_id] DESC", conn);
            DataSet ds_fill = new DataSet();
            adpt_fill.Fill(ds_fill,"tbl_fill");

            news_Grid.DataSource = ds_fill.Tables["tbl_fill"];
            news_Grid.DataBind();

            generateId();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in fill_grid<br>"+ee.Message;
        }
    }


    protected void news_Grid_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            GridViewRow row = news_Grid.SelectedRow;
            lbl_Id.Text = row.Cells[1].Text.ToString();
            txt_Title.Text = row.Cells[2].Text.ToString();
            txt_date.Text = row.Cells[3].Text.ToString();
            txt_venue.Text = row.Cells[4].Text.ToString();
            Label1.Text = row.Cells[5].Text.ToString();


            OleDbDataAdapter adpt_des = new OleDbDataAdapter("select event_description from tbl_department_event where event_id=" + lbl_Id.Text + " and department_id="+ddl_department.SelectedValue+"", conn);
            DataSet ds_des = new DataSet();
            adpt_des.Fill(ds_des, "tbl_des");

            txt_description.Content = ds_des.Tables["tbl_des"].Rows[0][0].ToString();

            FileUpload1.Visible = false;
            chk_new.Visible = true;

            ddl_order.Text = row.Cells[6].Text.ToString();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in select " + ee.Message;
        }
    }

    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }

        
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Post-Department-Events.aspx");
    }
    protected void chk_new_CheckedChanged(object sender, EventArgs e)
    {
        if (chk_new.Checked == true)
        {
            FileUpload1.Visible = true;
            chk_new.Visible = false;

            Label1.Text = "0";
        }
    }
    protected void img_del_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string str = "delete from tbl_department_event where event_id=" + lbl_Id.Text + " and department_id="+ddl_department.SelectedValue+"";
            sql_op.perform_sql_operation(str);

            string str2 = "delete from tbl_department_photos where event_id=" + lbl_Id.Text + " and department_id=" + ddl_department.SelectedValue + "";
            sql_op.perform_sql_operation(str2);

            WebLog.SqlOperation().Update_log("Activity:"+txt_Title.Text+" deleted from  "+ddl_department.SelectedItem.Text+" Department", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Delete", "index.aspx");

            Response.Redirect("Post-Department-Events.aspx");
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error on delete record<br>" + ee.Message;
        }

        
    }
    
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (ddl_department.SelectedValue == "0")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Please any Department then proceed')", true);
        }
        else
        {
            string url = "post_department_photo.aspx?p_id=" + lbl_Id.Text + "&d_id=" + ddl_department.SelectedValue;
            string s = "window.open('" + url + "', 'popup_window', 'width=800,height=600, resizable=yes, location=center,scrollbars=yes');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
        }
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }
    protected void ddl_department_SelectedIndexChanged(object sender, EventArgs e)
    {
        fill_grid();
    }
    protected void img_back_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_department.aspx");
    }
}
