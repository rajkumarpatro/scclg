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
using System.Data.SqlClient;
using System.IO;
using System.Data.SqlClient;

public partial class ScienceSubMenu : System.Web.UI.Page
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
                    DataTable dt_category = new DataTable();
                    dt_category = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT [PAGE_HEAD_ID],[PAGE_HEAD_NAME] FROM [TBL_SCD_PAGE_HEAD] ORDER BY REORDER");
                    ddl_category.DataSource = dt_category;
                    ddl_category.DataTextField = "PAGE_HEAD_NAME";
                    ddl_category.DataValueField = "PAGE_HEAD_ID";
                    ddl_category.DataBind();
                    ddl_category.Items.Insert(0, new ListItem("Select", "0"));

                    CheckLinkDescription();
                }
            }
            catch
            {
                Response.Redirect("science_login.aspx");
            }
        }
    }
    protected void ddl_link_description_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckLinkDescription();
    }
    protected void CheckLinkDescription()
    {
        if (ddl_link_description.SelectedValue == "Description")
        {
            dv_url.Visible = false;
        }
        else
        {
            dv_url.Visible = true;
        }
    }
    protected void FillGrid()
    {
        try
        {
            SqlParameter[] sp1 = new SqlParameter[2];
            sp1[0] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
            sp1[0].Value = Convert.ToInt32(ddl_category.SelectedValue);

            string str_query = @"SELECT  TBL_SCD_PAGE.PAGE_ID, TBL_SCD_PAGE.PAGE_NAME, TBL_SCD_PAGE.PAGE_HEAD_ID, TBL_SCD_PAGE_HEAD.PAGE_HEAD_NAME, TBL_SCD_PAGE.SHOW,SUB_MENU,IS_DEPARTMENT, TBL_SCD_PAGE.REORDER ,TBL_SCD_PAGE.IS_LINK,TBL_SCD_PAGE.LINK_URL, PASSWORD 
                                    FROM TBL_SCD_PAGE_HEAD INNER JOIN TBL_SCD_PAGE ON TBL_SCD_PAGE_HEAD.PAGE_HEAD_ID = TBL_SCD_PAGE.PAGE_HEAD_ID where TBL_SCD_PAGE.PAGE_HEAD_ID=" + ddl_category.SelectedValue + " order by TBL_SCD_PAGE.REORDER ,[PAGE_NAME]";
            DataTable dt_details = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            news_Grid.DataSource = dt_details;
            news_Grid.DataBind();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this,this.GetType(),"","alert('Error in Fill Grid<br>"+ee.Message+"')",true);
        }
    }

    protected bool CheckPageNameExist(string pagename)
    {
        object pageexist = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "SELECT PAGE_ID FROM TBL_SCD_PAGE  WHERE PAGE_NAME='"+ pagename + "'");
        if (pageexist == null)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    protected void ddl_category_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillGrid();
    }

    protected void lnk_show_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lnkupdate = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)lnkupdate.NamingContainer;
            string str_enabledisable = "";
            if (lnkupdate.Text == "Yes")
            {
                str_enabledisable = "No";
            }
            else
            {
                str_enabledisable = "Yes";
            }

            string str_update = @"UPDATE TBL_SCD_PAGE SET SHOW=@SHOW WHERE PAGE_ID=@PAGE_ID";
            SqlParameter[] sp = new SqlParameter[2];

            sp[0] = new SqlParameter("@SHOW", SqlDbType.NVarChar, 3);
            sp[0].Value = str_enabledisable;

            sp[1] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
            sp[1].Value = Convert.ToInt32(news_Grid.DataKeys[gvrow.RowIndex].Values["PAGE_ID"].ToString());

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Updated Successfully')", true);

            FillGrid();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Show " + ee.Message + "')", true);
        }
    }
    protected void lnk_submenu_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lnk_submenuupdate = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)lnk_submenuupdate.NamingContainer;
            string str_enabledisable = "";
            if (lnk_submenuupdate.Text == "Yes")
            {
                str_enabledisable = "No";
            }
            else
            {
                str_enabledisable = "Yes";
            }

            string str_update = @"UPDATE TBL_SCD_PAGE SET SUB_MENU=@SUB_MENU WHERE PAGE_ID=@PAGE_ID";
            SqlParameter[] sp = new SqlParameter[2];

            sp[0] = new SqlParameter("@SUB_MENU", SqlDbType.NVarChar, 3);
            sp[0].Value = str_enabledisable;

            sp[1] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
            sp[1].Value = Convert.ToInt32(news_Grid.DataKeys[gvrow.RowIndex].Values["PAGE_ID"].ToString());

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Updated Successfully')", true);

            FillGrid();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Show " + ee.Message + "')", true);
        }
    }
    protected void lnk_department_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lnk_department = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)lnk_department.NamingContainer;
            string str_enabledisable = "";
            if (lnk_department.Text == "Yes")
            {
                str_enabledisable = "No";
            }
            else
            {
                str_enabledisable = "Yes";
            }

            string str_update = @"UPDATE TBL_SCD_PAGE SET IS_DEPARTMENT=@IS_DEPARTMENT WHERE PAGE_ID=@PAGE_ID";
            SqlParameter[] sp = new SqlParameter[2];

            sp[0] = new SqlParameter("@IS_DEPARTMENT", SqlDbType.NVarChar, 3);
            sp[0].Value = str_enabledisable;

            sp[1] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
            sp[1].Value = Convert.ToInt32(news_Grid.DataKeys[gvrow.RowIndex].Values["PAGE_ID"].ToString());

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Updated Successfully')", true);

            FillGrid();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Show " + ee.Message + "')", true);
        }
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        try
        {
            int flag = validateThis();
            if (flag == 1)
            {

                #region Process Save or Update
                

                if (lbl_Id.Text!="")
                {
                    string str_update = @"UPDATE [TBL_SCD_PAGE] set [PAGE_HEAD_ID]=@PAGE_HEAD_ID,[PAGE_NAME]=@PAGE_NAME,SHOW=@SHOW,[SUB_MENU]=@SUB_MENU,IS_DEPARTMENT=@IS_DEPARTMENT,IS_LINK=@IS_LINK,LINK_URL=@LINK_URL,PASSWORD=@PASSWORD WHERE [PAGE_ID] = @PAGE_ID";
                       
                        sp = new SqlParameter[9];

                        sp[0] = new SqlParameter("@PAGE_HEAD_ID", SqlDbType.Int);
                        sp[0].Value = Convert.ToInt32(ddl_category.SelectedValue);

                        sp[1] = new SqlParameter("@PAGE_NAME", SqlDbType.NVarChar, 200);
                        sp[1].Value = Server.HtmlEncode(txt_name.Text);                        

                        sp[2] = new SqlParameter("@SHOW", SqlDbType.NVarChar,3);
                        sp[2].Value = Server.HtmlEncode(ddl_show.SelectedValue);

                        sp[3] = new SqlParameter("@SUB_MENU", SqlDbType.NVarChar, 3);
                        sp[3].Value = Server.HtmlEncode(ddl_submenu.SelectedValue);                                                

                        sp[4] = new SqlParameter("@IS_DEPARTMENT", SqlDbType.NVarChar, 3);
                        sp[4].Value = Server.HtmlEncode(ddl_isdepartment.SelectedValue);

                        sp[5] = new SqlParameter("@IS_LINK", SqlDbType.NVarChar, 20);
                        sp[5].Value = Server.HtmlEncode(ddl_link_description.SelectedValue);

                        sp[6] = new SqlParameter("@LINK_URL", SqlDbType.NVarChar, 500);
                        sp[6].Value = (txtURL.Text == "" ? "-" : txtURL.Text);

                        sp[7] = new SqlParameter("@PASSWORD", SqlDbType.NVarChar, 50);
                        sp[7].Value = (txt_password.Text == "" ? "" : txt_password.Text);

                        sp[8] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
                        sp[8].Value = Convert.ToInt32(lbl_Id.Text);


                        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Update Successfully')", true);
                        ClearMyPage();   
                   

                }
                else
                {
                    if (CheckPageNameExist(txt_name.Text) == true)
                    {
                        lblInfo.Text = "Error : Page with this name is already exist in this website";
                        return;
                    }
                    else
                    {
                        int PAGE_ID = sql_op.generate_id_sql("SELECT ISNULL(MAX(PAGE_ID),0) FROM TBL_SCD_PAGE");
                        string str_insert = @"INSERT INTO [TBL_SCD_PAGE]([PAGE_ID],[PAGE_NAME],[PAGE_HEAD_ID],[SHOW],SUB_MENU,[REORDER],IS_DEPARTMENT,IS_LINK,LINK_URL,PASSWORD)
                                        VALUES (@PAGE_ID,@PAGE_NAME,@PAGE_HEAD_ID,@SHOW,@SUB_MENU,@REORDER,@IS_DEPARTMENT,@IS_LINK,@LINK_URL,@PASSWORD)";

                        sp = new SqlParameter[10];

                        sp[0] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
                        sp[0].Value = PAGE_ID;

                        sp[1] = new SqlParameter("@PAGE_NAME", SqlDbType.NVarChar, 200);
                        sp[1].Value = Server.HtmlEncode(txt_name.Text);

                        sp[2] = new SqlParameter("@PAGE_HEAD_ID", SqlDbType.Int);
                        sp[2].Value = Convert.ToInt32(ddl_category.SelectedValue);

                        sp[3] = new SqlParameter("@SHOW", SqlDbType.NVarChar, 3);
                        sp[3].Value = Server.HtmlEncode(ddl_show.SelectedValue);

                        sp[4] = new SqlParameter("@SUB_MENU", SqlDbType.NVarChar, 3);
                        sp[4].Value = Server.HtmlEncode(ddl_submenu.SelectedValue);

                        sp[5] = new SqlParameter("@REORDER", SqlDbType.Int);
                        sp[5].Value = 1;

                        sp[6] = new SqlParameter("@IS_DEPARTMENT", SqlDbType.NVarChar, 3);
                        sp[6].Value = Server.HtmlEncode(ddl_isdepartment.SelectedValue);

                        sp[7] = new SqlParameter("@IS_LINK", SqlDbType.NVarChar, 50);
                        sp[7].Value = Server.HtmlEncode(ddl_link_description.SelectedValue);

                        sp[8] = new SqlParameter("@LINK_URL", SqlDbType.NVarChar, 500);
                        sp[8].Value = (txtURL.Text == "" ? "-" : txtURL.Text);

                        sp[9] = new SqlParameter("@PASSWORD", SqlDbType.NVarChar, 50);
                        sp[9].Value = (txt_password.Text == "" ? "" : txt_password.Text);

                        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Insert Successfully')", true);
                        ClearMyPage();
                    }
                    
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
        try
        {
            
            txt_name.Text = "";
            lbl_Id.Text = "";
            lblInfo.Text = "";
            txtURL.Text = "";
            txt_password.Text = "";
            CheckLinkDescription();
            FillGrid();            
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in ClearMyPage<br>" + ee.Message + "')", true);
        }
    }

    protected int validateThis()
    {
        if (txt_name.Text == "")
        {
            lblInfo.Text = "Error : Enter Menu Name";
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

            string newsid = news_Grid.DataKeys[gvrow.RowIndex].Values["PAGE_ID"].ToString();
           
            sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(newsid);

            string str_delete_news = "DELETE FROM TBL_SCD_PAGE WHERE PAGE_ID=@PAGE_ID";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete_news, sp);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('SubMenu Delete Successfully')", true);

            ClearMyPage(); 
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

            ImageButton btndelete = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndelete.NamingContainer;
            lbl_Id.Text = news_Grid.DataKeys[gvrow.RowIndex].Values["PAGE_ID"].ToString();

            ddl_category.SelectedValue = news_Grid.DataKeys[gvrow.RowIndex].Values["PAGE_HEAD_ID"].ToString();
                        
            txt_name.Text = gvrow.Cells[4].Text.ToString();

            string show = ((LinkButton)news_Grid.Rows[gvrow.RowIndex].FindControl("lnk_show")).Text;
            ddl_show.SelectedValue = show;

            string submenu = ((LinkButton)news_Grid.Rows[gvrow.RowIndex].FindControl("lnk_submenu")).Text;
            ddl_submenu.SelectedValue = submenu;

            string isdepartment = ((LinkButton)news_Grid.Rows[gvrow.RowIndex].FindControl("lnk_department")).Text;
            ddl_isdepartment.SelectedValue = isdepartment;

            ddl_link_description.SelectedValue = gvrow.Cells[9].Text.ToString();
            txtURL.Text = gvrow.Cells[10].Text.ToString();
            txt_password.Text = (gvrow.Cells[11].Text.ToString()== "&nbsp;" ? null: gvrow.Cells[11].Text.ToString());
            CheckLinkDescription();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error while edit news<br>" + ee.Message;
        }
    }

   
    protected void btn_recent_Click(object sender, EventArgs e)
    {
        Response.Redirect("SubMenu.aspx");
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
                    string pageid = news_Grid.DataKeys[i].Values["PAGE_ID"].ToString();

                    if (reorder != "")
                    {
                        string str_insert = @"UPDATE [TBL_SCD_PAGE] SET [REORDER] = @REORDER WHERE [PAGE_ID] = @PAGE_ID";

                        sp = new SqlParameter[2];

                        sp[0] = new SqlParameter("@REORDER", SqlDbType.Int);
                        sp[0].Value = Convert.ToInt32(reorder);

                        sp[1] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
                        sp[1].Value = Convert.ToInt32(pageid);

                        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
                        j++;
                    }
                }

                if (j != 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('"+j.ToString()+" Records Updated')", true);
                    FillGrid();
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
}
