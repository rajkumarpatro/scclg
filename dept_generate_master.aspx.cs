using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dept_generate_master : System.Web.UI.Page
{
    sql_operations sql_op = new sql_operations();
    SqlParameter[] sp = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                if (Session["iamuser"] == null)
                {
                    Response.Redirect("CLogin.aspx");
                    
                }
                else
                {
                    FillGrid();
                }
            }
            catch
            {
                Response.Redirect("CLogin.aspx");
            }
        }
    }
    protected void FillGrid()
    {
        try
        {
            dept_grid.DataSource = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT [PAGE_ID] ,[PAGE_NAME],[MOBILE_NO],[DEPARTMENT_PASSWORD] FROM [TBL_COLLEGE_PAGE] where show='Yes' order by [PAGE_NAME]");
            dept_grid.DataBind();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Fill Grid<br>" + ee.Message + "')", true);
        }
    }
    protected void btn_main_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }
        
   
    protected void imgbtn_edit_Click(object sender, EventArgs e)
    {
        try
        {

            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            string pageid = dept_grid.DataKeys[gvrow.RowIndex].Values["PAGE_ID"].ToString();

            TextBox txt_editmobile = gvrow.FindControl("txt_mobile") as TextBox;
            TextBox txt_editpassword = gvrow.FindControl("txt_password") as TextBox;

            string str_update = @"UPDATE [TBL_COLLEGE_PAGE] SET [MOBILE_NO] = @MOBILE_NO,[DEPARTMENT_PASSWORD] = @DEPARTMENT_PASSWORD WHERE PAGE_ID=@PAGE_ID";

            sp = new SqlParameter[3];

            sp[0] = new SqlParameter("@MOBILE_NO", SqlDbType.NVarChar, 10);
            sp[0].Value = Server.HtmlEncode(txt_editmobile.Text);

            sp[1] = new SqlParameter("@DEPARTMENT_PASSWORD", SqlDbType.NVarChar, 50);
            sp[1].Value = Server.HtmlEncode(txt_editpassword.Text);

            sp[2] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
            sp[2].Value = Convert.ToInt32(pageid);

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Updated Successfully')", true);
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Update "+ee.Message+"')", true);
        }
    }

}