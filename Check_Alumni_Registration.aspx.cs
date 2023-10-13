using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Check_Alumni_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
                  
                   if (Session["iamuser"] != null)
                   {
                       GetRecord();
                   }
                   else
                   {
                       Response.Redirect("clogin.aspx");
                   }
                 
    }
    protected void btn_main_menu_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }
    protected void GetRecord()
    {
        try
        {
            string str_query = @"SELECT [A_ID]
      ,[NAME]
      ,[FATHER]
      ,[COURSE]
      ,[PASSOUTYEAR]
      ,[DEPARTMENT]
      ,[DESIGNATION]
      ,[PLACE]
      ,[MOBILE_NO]
      ,[EMAIL_ID]
      ,[ADDRESS]
      ,[PHOTO]
  FROM [dbo].[TBL_ALUMNI_REGISTRATION] ORDER BY A_ID";

            DataTable dt_record = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            s_feedback.DataSource = dt_record;
            s_feedback.DataBind();
        }
        catch (Exception ee)
        {
            lbl_msg.Text = "Error - " + ee.Message;
        }
    }

    protected void imgbtn_delete_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndelete.NamingContainer;
            lbl_id.Text = s_feedback.DataKeys[gvrow.RowIndex].Values["A_ID"].ToString();

            string str_delete = "Delete from TBL_ALUMNI_REGISTRATION Where A_ID=@A_ID";

            SqlParameter[] sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@A_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(lbl_id.Text);

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete, sp);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Deleted Successfully')", true);

           
            GetRecord();

        }
        catch (Exception ee)
        {
            lbl_msg.Text = "Error - " + ee.Message;
        }
    }
}


    
    

    

    
