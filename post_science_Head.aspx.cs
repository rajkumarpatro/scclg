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

public partial class post_science_Head : System.Web.UI.Page
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
                    Response.Redirect("science_login.aspx");
                }
                else
                {
                    for (int i = 1; i <= 20; i++)
                    {
                        ddl_order.Items.Add(i.ToString());
                    }

                    clearmy();
                }
            }
            catch
            {
                Response.Redirect("science_login.aspx");
            }
        }
    }

    protected void FillGrid()
    {
        try
        {

            string str_query = "SELECT [PAGE_HEAD_ID] ,[PAGE_HEAD_NAME],[SHOW],[REORDER] FROM [TBL_SCD_PAGE_HEAD] order by REORDER,[PAGE_HEAD_ID]";
            DataTable dt_details = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            news_Grid.DataSource = dt_details;
            news_Grid.DataBind();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this,this.GetType(),"","alert('Error in Fill Grid<br>"+ee.Message+"')",true);
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
                    string pageid = news_Grid.DataKeys[i].Values["PAGE_HEAD_ID"].ToString();

                    if (reorder != "")
                    {
                        string str_insert = @"UPDATE [TBL_SCD_PAGE_HEAD] SET [REORDER] = @REORDER WHERE [PAGE_HEAD_ID] = @PAGE_HEAD_ID";

                        sp = new SqlParameter[2];

                        sp[0] = new SqlParameter("@REORDER", SqlDbType.Int);
                        sp[0].Value = Convert.ToInt32(reorder);

                        sp[1] = new SqlParameter("@PAGE_HEAD_ID", SqlDbType.Int);
                        sp[1].Value = Convert.ToInt32(pageid);

                        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
                        
                        j++;
                    }
                }

                if (j != 0)
                {
                    FillGrid();
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
    protected void btn_recent_Click(object sender, EventArgs e)
    {
        Response.Redirect("Page-Head.aspx");
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
                    string str_update = @"UPDATE [TBL_SCD_PAGE_HEAD] set [PAGE_HEAD_NAME]=@PAGE_HEAD_NAME,[SHOW]=@SHOW,[REORDER]=@REORDER WHERE [PAGE_HEAD_ID] = @PAGE_HEAD_ID";
                       
                        sp = new SqlParameter[4];

                        sp[0] = new SqlParameter("@PAGE_HEAD_NAME", SqlDbType.NVarChar, 200);
                        sp[0].Value = Server.HtmlEncode(txt_name.Text);

                        sp[1] = new SqlParameter("@SHOW", SqlDbType.NVarChar, 3);
                        sp[1].Value = Server.HtmlEncode(ddl_show.SelectedValue);

                        sp[2] = new SqlParameter("@REORDER", SqlDbType.Int);
                        sp[2].Value = Server.HtmlEncode(ddl_order.SelectedValue);

                        sp[3] = new SqlParameter("@PAGE_HEAD_ID", SqlDbType.Int);
                        sp[3].Value = Convert.ToInt32(lbl_Id.Text);


                        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Update Successfully')", true);
                        clearmy();  
                   

                }
                else
                {
                    
                    int PAGE_HEAD_ID = sql_op.generate_id_sql("SELECT ISNULL(MAX(PAGE_HEAD_ID),0) FROM TBL_SCD_PAGE_HEAD");
                    string str_insert = @"INSERT INTO [TBL_SCD_PAGE_HEAD]([PAGE_HEAD_ID],[PAGE_HEAD_NAME],[SHOW],[REORDER])
                        VALUES (@PAGE_HEAD_ID,@PAGE_HEAD_NAME,@SHOW,@REORDER)";

                    sp = new SqlParameter[4];

                    sp[0] = new SqlParameter("@PAGE_HEAD_ID", SqlDbType.Int);
                    sp[0].Value = PAGE_HEAD_ID;

                    sp[1] = new SqlParameter("@PAGE_HEAD_NAME", SqlDbType.NVarChar, 200);
                    sp[1].Value = Server.HtmlEncode(txt_name.Text);

                    sp[2] = new SqlParameter("@SHOW", SqlDbType.NVarChar, 3);
                    sp[2].Value = Server.HtmlEncode(ddl_show.SelectedValue);

                    sp[3] = new SqlParameter("@REORDER", SqlDbType.Int);
                    sp[3].Value = Server.HtmlEncode(ddl_order.SelectedValue);

                   

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
        txt_name.Text = "";
        FillGrid();
        lbl_Id.Text = "";
        lblInfo.Text = "";

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

            string newsid = news_Grid.DataKeys[gvrow.RowIndex].Values["PAGE_HEAD_ID"].ToString();
           
            sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@PAGE_HEAD_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(newsid);

            string str_delete_news = "DELETE FROM TBL_SCD_PAGE_HEAD WHERE PAGE_HEAD_ID=@PAGE_HEAD_ID";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete_news, sp);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Menu Delete Successfully')", true);

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

            string newsid = news_Grid.DataKeys[gvrow.RowIndex].Values["PAGE_HEAD_ID"].ToString();
            lbl_Id.Text = newsid;
            txt_name.Text = gvrow.Cells[2].Text.ToString();
            ddl_order.SelectedValue = news_Grid.DataKeys[gvrow.RowIndex].Values["REORDER"].ToString();
            ddl_show.SelectedValue = news_Grid.DataKeys[gvrow.RowIndex].Values["SHOW"].ToString();
            
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error while edit news<br>" + ee.Message;
        }
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

            string str_update = @"UPDATE TBL_SCD_PAGE_HEAD SET SHOW=@SHOW WHERE PAGE_HEAD_ID=@PAGE_HEAD_ID";
            SqlParameter[] sp = new SqlParameter[2];

            sp[0] = new SqlParameter("@SHOW", SqlDbType.NVarChar, 3);
            sp[0].Value = str_enabledisable;

            sp[1] = new SqlParameter("@PAGE_HEAD_ID", SqlDbType.Int);
            sp[1].Value = Convert.ToInt32(news_Grid.DataKeys[gvrow.RowIndex].Values["PAGE_HEAD_ID"].ToString());

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Updated Successfully')", true);

            FillGrid();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Show "+ee.Message+"')", true);
        }
    }
}
