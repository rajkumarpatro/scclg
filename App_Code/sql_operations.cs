using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.Net.Mail;
using System.Data.SqlClient;


using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;



/// <summary>
/// Summary description for sql_operations
/// </summary>
/// 

public class sql_operations
{
    OleDbConnection conn1 = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    SqlConnection conn2 = new SqlConnection(ConfigurationManager.AppSettings["connect1"]);

	public sql_operations()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void GenerateThumbnails(double scaleFactor, Stream sourcePath, string targetPath)
    {
        using (var image = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = (int)(image.Width * scaleFactor);
            var newHeight = (int)(image.Height * scaleFactor);
            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(image, imageRectangle);
            thumbnailImg.Save(targetPath, image.RawFormat);
        }
    }

    public void GenerateFixedSizeImage(int NewWidthR, int NewHeightR, Stream sourcePath, string targetPath)
    {
        using (var image = System.Drawing.Image.FromStream(sourcePath))
        {
            var thumbnailImg = new Bitmap(NewWidthR, NewHeightR);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, NewWidthR, NewHeightR);
            thumbGraph.DrawImage(image, imageRectangle);
            thumbnailImg.Save(targetPath, image.RawFormat);
        }
    }

    public DataSet get_dataset(string str_query)
    {
        OleDbDataAdapter adpt = new OleDbDataAdapter(str_query, conn1);
        DataSet ds = new DataSet();
        adpt.Fill(ds, "tbl_dataset");

        return ds;
    }

    public DataTable get_datatable(string str_query)
    {
        OleDbDataAdapter adpt = new OleDbDataAdapter(str_query, conn1);
        DataSet ds = new DataSet();
        adpt.Fill(ds, "tbl_dataset");

        return ds.Tables[0];
    }


    public void perform_sql_operation_sql(string query_str)
    {
        try
        {
            conn2.Open();
            SqlCommand cmd = new SqlCommand(query_str, conn2);
            cmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            throw;
        }
        finally
        {
            conn2.Close();
        }
    }

    public bool check_exist_sql(string quer)
    {
        SqlCommand cmd = new SqlCommand(quer, conn2);
        conn2.Open();
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
                return true;
            else
                return false;
        }
        catch
        {
            throw;
        }
        finally
        {
            conn2.Close();
        }
    }

    public int generate_id_sql(string query_str)
    {
        try
        {
            conn2.Open();

            DataTable dt_id = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, query_str);
            return (Convert.ToInt32(dt_id.Rows[0][0].ToString()) + 1);
        }
        catch (Exception ee)
        {
            throw;
        }
        finally
        {
            conn2.Close();
        }
    }

    public void perform_sql_operation(string query_str)
    {
        try
        {
            conn1.Open();
            OleDbCommand cmd = new OleDbCommand(query_str,conn1);
            cmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            throw;
        }
        finally
        {
            conn1.Close();
        }
    }

    //This Function is used for Update Log

    public void Update_log(string updatedetails, string updatedate, string updateadmin, string updateaction, string updatelink)
    {
        try
        {
            if (conn1.State != ConnectionState.Open)
            {
                conn1.Open();
            }
            OleDbCommand cmd = new OleDbCommand("insert into tbl_site_updates values("+generate_update_log_Id()+",'"+updatedetails+"','"+updatedate+"','"+updateadmin+"','"+updateaction+"','"+updatelink+"')", conn1);
            cmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            throw;
        }
        finally
        {
            conn1.Close();
        }
    }

    public bool check_exist(string quer)
    {
        OleDbCommand cmd = new OleDbCommand(quer, conn1);
        conn1.Open();
        try
        {
            OleDbDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
                return true;
            else
                return false;
        }
        catch
        {
            throw;
        }
        finally
        {
            conn1.Close();
        }
    }

    //This funtion is used for generate update log id

    public int generate_update_log_Id()
    {
        try
        {
            if (conn1.State != ConnectionState.Open)
            {
                conn1.Open();
            }
            OleDbDataAdapter adptCheck = new OleDbDataAdapter("select max(update_id) from tbl_site_updates", conn1);
            DataSet dsCheck = new DataSet();
            adptCheck.Fill(dsCheck, "tblCheck");

            if (dsCheck.Tables["tblCheck"].Rows[0][0].ToString() == "")
            {
                return (1);
            }
            else
            {
                return (Convert.ToInt32(dsCheck.Tables["tblCheck"].Rows[0][0]) + 1);
            }
        }
        catch (Exception ee)
        {
            throw;
        }
        finally
        {
            //conn1.Close();
        }
    }



    public void send_mail(string str_subject, string str_msg, string str_to, string str_cc, string str_bcc)
    {
        try
        {
            conn1.Open();
            OleDbDataAdapter adpt_select = new OleDbDataAdapter("select * from  tbl_mailsetting", conn1);
            DataSet ds_select = new DataSet();
            adpt_select.Fill(ds_select, "tbl_select");

            MailMessage mm = new MailMessage();
            SmtpClient smtp = new SmtpClient();

            mm.From = new MailAddress(ds_select.Tables["tbl_select"].Rows[0][0].ToString());
            mm.To.Add(str_to.ToString());
            if (str_cc == "1")
            {
                if (ds_select.Tables["tbl_select"].Rows[0][2].ToString() != "")
                {
                    mm.CC.Add(ds_select.Tables["tbl_select"].Rows[0][2].ToString());
                }
            }

            if (str_bcc == "1")
            {
                if (ds_select.Tables["tbl_select"].Rows[0][3].ToString()!="")
                {
                    mm.Bcc.Add(ds_select.Tables["tbl_select"].Rows[0][3].ToString());
                }
            }
            //mm.Bcc.Add(new MailAddress("rktj.rajkumar89@gmail.com"));
            mm.Subject = str_subject.ToString();

            mm.Body = str_msg.ToString();
            mm.IsBodyHtml = true;

            smtp.Host = "smtp.gmail.com"; //You can add this in the webconfig

            smtp.EnableSsl = true;

            System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();

            NetworkCred.UserName = ds_select.Tables["tbl_select"].Rows[0][0].ToString();
            NetworkCred.Password = ds_select.Tables["tbl_select"].Rows[0][1].ToString();

            smtp.UseDefaultCredentials = false;
            //if (FileUpload1.HasFile)
            //{
            //    mm.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, FileUpload1.FileName));
            //}
            smtp.Credentials = NetworkCred;
            smtp.Port = 587; //this is Gmail port for e-mail
            smtp.Send(mm);//send an e-mail
        }
        catch (Exception ee)
        {
            throw;
        }
        finally
        {
            conn1.Close();
        }
    }

    public int generate_id(string query_str)
    {
        try
        {
            conn1.Open();

            OleDbDataAdapter adpt_generate_id = new OleDbDataAdapter(query_str,conn1);
            DataSet ds_generate_id = new DataSet();
            adpt_generate_id.Fill(ds_generate_id, "tbl_generate_id");

            if (ds_generate_id.Tables["tbl_generate_id"].Rows.Count > 0 && ds_generate_id.Tables["tbl_generate_id"].Rows[0][0].ToString() != "")
            {
                return (Convert.ToInt32(ds_generate_id.Tables["tbl_generate_id"].Rows[0][0].ToString()) + 1);
            }
            else
            {
                return (1);
            }
        }
        catch (Exception ee)
        {
            throw;
        }
        finally
        {
            conn1.Close();
        }
    }


}
