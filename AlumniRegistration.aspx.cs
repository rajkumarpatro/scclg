using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Configuration;
using System.Data;



public partial class AlumniRegistration : System.Web.UI.Page
{
    sql_operations op = new sql_operations();
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connect1"]);
    string saveLocation;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int j=0;
            for (int i = 2010; i <= Convert.ToInt32(DateTime.Now.ToString("yyyy")); i++)
            {
                ddl_passout_year.Items.Insert(j, new ListItem(i.ToString(), i.ToString()));
                j++;
            }
        }
    } 

    protected void btn_submit_Click(object sender, EventArgs e)
    
    {
        try
        {
        
            int allok = 0;
            
            string picname = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
            if (picname != "")
            {
                string picext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();

                if (picext == ".jpg" || picext == ".jpeg" || picext == ".png")
                {
                    saveLocation = Server.MapPath("alumni/" + lbl_Id.Text.ToString() + picext);
                    //FileUpload1.PostedFile.SaveAs(MapPath(saveLocation));

                    Stream strm = FileUpload1.PostedFile.InputStream;
                    var targetFile = saveLocation;
                    //Based on scalefactor image size will vary
                    op.GenerateThumbnails(0.5, strm, targetFile);

                    saveLocation = "alumni/" + lbl_Id.Text.ToString() + picext;

                }
                else
                {
                    allok = 1;
                }
            }
            else
            {
                saveLocation = "images/no.jpg";
            }

            if (allok == 0)
            {
                #region Process Save or Update

                string str_insert = @"INSERT INTO [dbo].[TBL_ALUMNI_REGISTRATION]
                                   ([A_ID]
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
                                   ,[PHOTO])
                             VALUES
                                   (@A_ID
                                   ,@NAME
                                   ,@FATHER
                                   ,@COURSE
                                   ,@PASSOUTYEAR
                                   ,@DEPARTMENT
                                   ,@DESIGNATION
                                   ,@PLACE
                                   ,@MOBILE_NO
                                   ,@EMAIL_ID
                                   ,@ADDRESS
                                   ,@PHOTO)";

                SqlParameter[] sp = new SqlParameter[12];

                sp[0] = new SqlParameter("@A_ID", SqlDbType.Int);
                sp[0].Value = Convert.ToInt32(op.generate_id_sql("select ISNULL(max(A_ID),0) from TBL_ALUMNI_REGISTRATION").ToString());

                sp[1] = new SqlParameter("@NAME", SqlDbType.NVarChar, 150);
                sp[1].Value = Server.HtmlEncode(txt_Name.Text.ToString());

                sp[2] = new SqlParameter("@FATHER", SqlDbType.NVarChar, 150);
                sp[2].Value = Server.HtmlEncode(txt_father.Text);

                sp[3] = new SqlParameter("@COURSE", SqlDbType.NVarChar, 60);
                sp[3].Value = Server.HtmlEncode(ddl_course.SelectedValue);

                sp[4] = new SqlParameter("@PASSOUTYEAR", SqlDbType.Int);
                sp[4].Value = Convert.ToInt32(ddl_passout_year.SelectedValue);

                sp[5] = new SqlParameter("@DEPARTMENT", SqlDbType.NVarChar, 60);
                sp[5].Value = Server.HtmlEncode(txt_department.Text);

                sp[6] = new SqlParameter("@DESIGNATION", SqlDbType.NVarChar, 60);
                sp[6].Value = Server.HtmlEncode(txt_designation.Text);

                sp[7] = new SqlParameter("@PLACE", SqlDbType.NVarChar, 60);
                sp[7].Value = Server.HtmlEncode(txt_place.Text);

                sp[8] = new SqlParameter("@MOBILE_NO", SqlDbType.NVarChar, 10);
                sp[8].Value = Server.HtmlEncode(txt_mobile.Text);

                sp[9] = new SqlParameter("@EMAIL_ID", SqlDbType.NVarChar, -1);
                sp[9].Value = Server.HtmlEncode(txt_email.Text);

                sp[10] = new SqlParameter("@ADDRESS", SqlDbType.NVarChar, -1);
                sp[10].Value = Server.HtmlEncode(txt_address.Text);

                sp[11] = new SqlParameter("@PHOTO", SqlDbType.NVarChar, 200);
                sp[11].Value = Server.HtmlEncode(saveLocation);

                SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);

                Response.Redirect("thanks.aspx");

                #endregion
            }

        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in Save Process " + ee.Message;
        }
    }
}
