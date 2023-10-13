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

public partial class downloads : System.Web.UI.Page
{
    sql_operations op = new sql_operations();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["title"] != null)
        {
            this.Title = Request.QueryString["title"].ToString();
            if (!IsPostBack)
            {
                lbl_title.Text = Request.QueryString["title"].ToString();
                GetRecord(lbl_title.Text);
            }
        }
    }

    protected void GetRecord(string dpage)
    {
        string str_select = "SELECT downloads.Description, downloads.filepath,D_date FROM downloads where downloads.D_page='" + dpage.ToString() + "' order by downloads.D_id";

        DataSet ds_select = op.get_dataset(str_select);

        grid_record.DataSource=ds_select.Tables[0];
        grid_record.DataBind();

        //Attribute to show the Plus Minus Button.
        //grid_record.HeaderRow.Cells[0].Attributes["CssClass"] = "expand";

        //Attribute to hide column in Phone.
        //grid_record.HeaderRow.Cells[2].Attributes["CssClass"] = "phone";
        //grid_record.HeaderRow.Cells[3].Attributes["CssClass"] = "phone";
        //grid_record.HeaderRow.TableSection = TableRowSection.TableHeader;
        grid_record.Visible = true;

    }


}
