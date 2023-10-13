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

    SqlParameter[] sp = null;
   
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
                    DataTable dt_department = new DataTable();
                    dt_department = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select department_id,department_name from tbl_department order by department_id");

                    ddl_department.DataSource = dt_department;
                    ddl_department.DataTextField = "department_name";
                    ddl_department.DataValueField = "department_id";
                    ddl_department.DataBind();

                    ddl_department.Items.Insert(0, new ListItem("Select Department", "0"));

                    GetTopics();
                    CheckTopicStatus();
                    CheckTopicEdit();
                    for (int i = 1; i <= 30; i++)
                    {
                        ddl_order.Items.Add(i.ToString());
                    }
                }
            }
            catch
            {
                Response.Redirect("CLogin.aspx");
            }
        }
    }

    protected void CheckTopicEdit()
    {
        if (chk_edit.Checked == true)
        {
            span_topic.Visible = true;
        }
        else
        {
            span_topic.Visible = false;
        }
    }

    protected void btn_Save_Click(object sender, ImageClickEventArgs e)
    {
        int flag = validateThis();
        if (flag == 1)
        {
            try
            {
                #region Process Save or Update
                if (txt_topics.Visible == true)
                {
                    int topic_id = GenerateTopicId();

                    string str_insert = @"INSERT INTO [dbo].[tbl_department_topic]([department_id],[topic_id],[topic_name],[topic_order])VALUES (@department_id,@topic_id,@topic_name,@topic_order)";

                    sp = new SqlParameter[4];

                    sp[0] = new SqlParameter("@department_id", SqlDbType.Int);
                    sp[0].Value = Server.HtmlEncode(ddl_department.SelectedValue);

                    sp[1] = new SqlParameter("@topic_id", SqlDbType.Int);
                    sp[1].Value = Convert.ToInt32(topic_id);
                    
                    sp[2] = new SqlParameter("@topic_name", SqlDbType.NVarChar, 150);
                    sp[2].Value = Server.HtmlEncode(txt_topics.Text);

                    sp[3] = new SqlParameter("@topic_order", SqlDbType.Int);
                    sp[3].Value = Convert.ToInt32(ddl_order.SelectedValue);                    

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);



                    string str_insertt = @"INSERT INTO [dbo].[tbl_department_details]([department_id],[topic_id],[department_description])VALUES (@department_id,@topic_id,@department_description)";

                    sp = new SqlParameter[3];

                    sp[0] = new SqlParameter("@department_id", SqlDbType.Int);
                    sp[0].Value = Server.HtmlEncode(ddl_department.SelectedValue);

                    sp[1] = new SqlParameter("@topic_id", SqlDbType.Int);
                    sp[1].Value = Convert.ToInt32(topic_id);

                    sp[2] = new SqlParameter("@department_description", SqlDbType.NVarChar, -1);
                    sp[2].Value = Server.HtmlEncode(txt_description.Content);



                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insertt, sp);
                   

                   


                }
                else
                {
                    string str_update = @"UPDATE [dbo].[tbl_department_details] set [department_description] = @department_description  WHERE [department_id]=@department_id and [topic_id] = @topic_id";

                    sp = new SqlParameter[3];

                    sp[0] = new SqlParameter("@department_description", SqlDbType.NVarChar, -1);
                    sp[0].Value = Server.HtmlEncode(txt_description.Content);

                    sp[1] = new SqlParameter("@department_id", SqlDbType.Int);
                    sp[1].Value = Server.HtmlEncode(ddl_department.SelectedValue);

                    sp[2] = new SqlParameter("@topic_id", SqlDbType.Int);
                    sp[2].Value = Server.HtmlEncode(ddl_topic.SelectedValue);

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
                }

                Response.Redirect("post_department.aspx");
                #endregion
            }
            catch (Exception ee)
            {
               
            }
        }
    }

    

    protected int GenerateTopicId()
    {
        string str = "select max(topic_id) from tbl_department_topic where department_id=" + ddl_department.SelectedValue + "";
        return(sql_op.generate_id_sql(str));

    }

    protected int validateThis()
    {
        if (ddl_department.SelectedValue == "0")
        {
            lblInfo.Text = "Error : Please select any Department then proceed...";
            return (0);
        }
        else if (chk_new.Checked==true && txt_topics.Text == "")
        {
            lblInfo.Text = "Error : Please Enter New Topic";
            return (0);
        }
        else if (chk_new.Checked == false && ddl_topic.SelectedValue == "0")
        {
            lblInfo.Text = "Error : Please select any Topic then proceed...";
            return (0);
        }
        else if (txt_description.Content == "")
        {
            lblInfo.Text = "Error : Please Enter Description";
            return (0);
        }
        else
        {
            return (1);
        }
    }


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }

        
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_department.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //string url = "post_department_photo.aspx?p_id=" + lbl_Id.Text;
        //string s = "window.open('" + url + "', 'popup_window', 'width=800,height=600, resizable=yes, location=center,scrollbars=yes');";
        //ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }

    protected void btn_events_Click(object sender, EventArgs e)
    {
        Response.Redirect("Post-Department-Events.aspx");
    }
    protected void ddl_department_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetTopics();
    }

    protected void GetTopics()
    {
        try
        {
            ddl_topic.DataSource = null;
            ddl_topic.DataBind();

            DataTable dt_topics = new DataTable();
            dt_topics = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select topic_id,topic_name, topic_order from tbl_department_topic where department_id=" + ddl_department.SelectedValue + " order by topic_order, topic_id");

            ddl_topic.DataSource = dt_topics;
            ddl_topic.DataTextField = "topic_name";
            ddl_topic.DataValueField = "topic_id";
            ddl_topic.DataBind();

            ddl_topic.Items.Insert(0, new ListItem("Select Topic", "0"));

            gv_topic.DataSource = dt_topics;
            gv_topic.DataBind();

            //GetDescription();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Get Topics";
        }
    }
    protected void chk_new_CheckedChanged(object sender, EventArgs e)
    {
        CheckTopicStatus();
    }

    protected void CheckTopicStatus()
    {
        if (chk_new.Checked == true)
        {
            txt_topics.Visible = true;
            ddl_topic.Visible = false;
        }
        else
        {
            txt_topics.Visible = false;
            ddl_topic.Visible = true;
        }
    }
    protected void ddl_topic_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetDescription();
    }

    protected void GetDescription()
    {
        try
        {
            string str_query = "select department_description from tbl_department_details where department_id=" + ddl_department.SelectedValue + " and topic_id=" + ddl_topic.SelectedValue + "";
            DataTable dt_data = new DataTable();

            dt_data = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);
            if (dt_data.Rows.Count > 0)
            {
                txt_description.Content =Server.HtmlDecode(dt_data.Rows[0]["department_description"].ToString());
            }
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in Getting Details<br>" + ee.Message;
        }
    }
    protected void chk_edit_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddl_department.SelectedValue == "0")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Please Select Department')", true);
                chk_edit.Checked = false;
            }
            else
            {
                if (chk_edit.Checked == true)
                {
                    span_topic.Visible = true;
                }
                else
                {
                    span_topic.Visible = false;
                }
            }
        }
        catch (Exception ee)
        {
            
        }
    }
    protected void imgbtn_edit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btnedit = sender as ImageButton;
            GridViewRow row = (GridViewRow)btnedit.NamingContainer;

            lbl_topic_id.Text = row.Cells[0].Text;
            txt_edittopic.Text = row.Cells[1].Text;
            ddl_order.Text = row.Cells[2].Text;
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in Edit Topic Details<br>" + ee.Message;
        }
    }
    protected void imgbtn_enquiry_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow row = (GridViewRow)btndelete.NamingContainer;

            string str_delete = "delete from tbl_department_topic where topic_id=" + Convert.ToInt32(row.Cells[0].Text) + " and department_id=" + Convert.ToInt32(ddl_department.SelectedValue) + "";
            sql_op.perform_sql_operation(str_delete);

            string str_delete1 = "delete from tbl_department_details where topic_id=" + Convert.ToInt32(row.Cells[0].Text) + " and department_id=" + Convert.ToInt32(ddl_department.SelectedValue) + "";
            sql_op.perform_sql_operation(str_delete1);

            GetTopics();
            span_topic.Visible = false;
            chk_edit.Checked = false;
            txt_edittopic.Text = "";
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in Delete Topic Details<br>" + ee.Message;
        }
    }
    protected void btn_Edittopic_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string str_edit = "update tbl_department_topic set topic_name='" + Server.HtmlEncode(txt_edittopic.Text) + "', topic_order=" + Convert.ToInt32(ddl_order.Text) + " where topic_id=" + Convert.ToInt32(lbl_topic_id.Text) + " and department_id="+Convert.ToInt32(ddl_department.SelectedValue)+"";
            sql_op.perform_sql_operation(str_edit);

            GetTopics();
            span_topic.Visible = false;
            chk_edit.Checked = false;
            txt_edittopic.Text = "";
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in Delete Topic Details<br>" + ee.Message;
        }
    }
    protected void btn_ok_Click(object sender, ImageClickEventArgs e)
    {
        span_topic.Visible = false;
        chk_edit.Checked = false;
    }

   
}
