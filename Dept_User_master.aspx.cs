using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dept_User_master : System.Web.UI.Page
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
                    Response.Redirect("Department_Login.aspx");
                    
                }
                else
                {
                    lbl_user.Text = Session["iamuser"].ToString();
                    sp = new SqlParameter[1];
                    sp[0] = new SqlParameter("@MOBILE_NO", SqlDbType.Int);
                    sp[0].Value = Server.HtmlEncode(lbl_user.Text);


                    DataTable dtLogin = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select [PAGE_ID],[U_Status] from TBL_COLLEGE_PAGE where MOBILE_NO='" + lbl_user.Text + "'");
                    if (dtLogin.Rows.Count == 1)
                    {
                        if (dtLogin.Rows[0]["U_Status"].ToString() != "Block")
                        {
                            
                            Session.Add("iamuser", dtLogin.Rows[0]["PAGE_ID"].ToString());
                            //Response.Redirect("Department_panel.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Blocked by Admin')", true);
                        }
                    }


                    lbl_det_id.Text = Session["iamuser"].ToString();
                    clearmy();
                }
            }
            catch
            {
                Response.Redirect("Department_Login.aspx");
            }
        }
    }
    protected void FillGrid()
    {
        try
        {
            dept_grid.DataSource = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT [PAGE_ID] ,[MOBILE_NO],[DEPARTMENT_PASSWORD] FROM [TBL_COLLEGE_PAGE] where MOBILE_NO='" + lbl_user.Text + "' order by [PAGE_ID]");
            dept_grid.DataBind();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Fill Grid<br>" + ee.Message + "')", true);
        }
    }
    protected void btn_main_Click(object sender, EventArgs e)
    {
        Response.Redirect("Department_panel.aspx");
    }
    protected void btn_login_Click(object sender, EventArgs e)
    {

        try
        {
            int flag = validateThis();
            if (flag == 1)
            {
                

                #region Process Save or Update


                if (lbl_Id.Text != "")
                {
                    
                    

                    string str_update = @"UPDATE [TBL_COLLEGE_PAGE] SET [MOBILE_NO] = @MOBILE_NO,[DEPARTMENT_PASSWORD] = @DEPARTMENT_PASSWORD WHERE PAGE_ID=@PAGE_ID";

                    sp = new SqlParameter[3];

                    sp[0] = new SqlParameter("@MOBILE_NO", SqlDbType.NVarChar, 10);
                    sp[0].Value = Server.HtmlEncode(txt_mobile.Text);

                    sp[1] = new SqlParameter("@DEPARTMENT_PASSWORD", SqlDbType.NVarChar, 50);
                    sp[1].Value = Server.HtmlEncode(txt_Password.Text);

                    sp[2] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
                    sp[2].Value = Convert.ToInt32(lbl_det_id.Text);

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Updated Successfully')", true);
                    clearmy();

                }
                else
                {
                   
                    

                    string str_insert = @"INSERT INTO [TBL_COLLEGE_PAGE]([PAGE_ID],[MOBILE_NO],[DEPARTMENT_PASSWORD],[U_Status])
                        VALUES (@PAGE_ID,@MOBILE_NO,@DEPARTMENT_PASSWORD,'Active')";

                    sp = new SqlParameter[3];

                    sp[0] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
                    sp[0].Value = lbl_det_id.Text;

                    sp[1] = new SqlParameter("@DEPARTMENT_PASSWORD", SqlDbType.NVarChar, 50);
                    sp[1].Value = Server.HtmlEncode(txt_Password.Text);

                    sp[2] = new SqlParameter("@MOBILE_NO", SqlDbType.NVarChar, 10);
                    sp[2].Value = Server.HtmlEncode(txt_mobile.Text);



                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Insert Successfully')", true);
                    clearmy();
                }

                #endregion
            }

        }
        catch (Exception ex)
        {
            lblInfo.Text = ex.Message;
        }
    }
    protected void clearmy()
    {
        lbl_Id.Text = "";
        txt_Password.Text = "";
        txt_mobile.Text = "";
        FillGrid();
        lbl_Id.Text = "";
        lblInfo.Text = "";

    }
    protected int validateThis()
    {
        if (txt_mobile.Text == "")
        {
            lblInfo.Text = "Error : Enter Mobile Number";
            return (0);
        }
        else if (txt_Password.Text == "")
        {
            lblInfo.Text = "Error : Enter Password";
            return (0);
        }
        else
        {
            return (1);
        }
    }
    protected void imgbtn_delete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            string newsid = dept_grid.DataKeys[gvrow.RowIndex].Values["PAGE_ID"].ToString();

            sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(newsid);

            string str_delete_news = "DELETE FROM TBL_COLLEGE_PAGE WHERE PAGE_ID=@PAGE_ID";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete_news, sp);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Delete Successfully')", true);

            clearmy();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Delete News<br>" + ee.Message;
        }
    }
    protected void imgbtn_edit_Click(object sender, EventArgs e)
    {
        try
        {

            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            string newsid = dept_grid.DataKeys[gvrow.RowIndex].Values["PAGE_ID"].ToString();
            lbl_Id.Text = newsid;
            txt_mobile.Text = gvrow.Cells[2].Text.ToString();
            txt_Password.Text = gvrow.Cells[3].Text.ToString();
            

        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error while edit news<br>" + ee.Message;
        }
    }

}