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
using System.Net.Mail;


public partial class sendmail : System.Web.UI.Page
{
    string user_name, mail_from, contact, address, message, mail_body, subject_;
    protected void Page_Load(object sender, EventArgs e)
    {
        user_name = Request.Form["myName"];
        address = Request.Form["myAddress"];
        contact = Request.Form["myMobile"];
        mail_from = Request.Form["myEmail"];
        message = Request.Form["myMessage"];


        //user_name = "rajkumar";
        //mail_from = "rajkumar.patro@gmail.com";
        //contact = "8109752754";
        //message = "this is just a testing";
        //address = "Sector6";


        try
        {
            MailMessage mm = new MailMessage();
            SmtpClient smtp = new SmtpClient();
            mm.From = new MailAddress(mail_from);
            mm.To.Add(new MailAddress("contact@ajaynidaan.com"));
            mm.Bcc.Add(new MailAddress("rktj.rajkumar89@gmail.com"));
            mm.Subject = "Dr. Sahu Bio Classes : Enquiry through e-Mail :" + user_name + ", Contact No. :" + contact;

            mail_body = "<html><body><table width='100%' cellpadding='0' cellspacing='0' border='1'>";
            mail_body = mail_body + "<tr><td width='30%' align='Center' height='22' style='padding-left:10px;font-family:Arial; font-weight:bold;' colspan='2'>Enquiry through Email</td></tr>";
            mail_body = mail_body + "<tr><td width='30%' height='22' style='padding-left:10px;font-family:Arial'>Address</td><td style='padding-left:10px;'>" + address + "</td></tr>";
            mail_body = mail_body + "<tr><td width='30%' height='22' style='padding-left:10px;font-family:Arial'>Name</td><td style='padding-left:10px;'>" + user_name + "</td></tr>";
            mail_body = mail_body + "<tr><td width='30%' height='22' style='padding-left:10px;font-family:Arial'>Contact No.</td><td style='padding-left:10px;'>" + contact + "</td></tr>";
            mail_body = mail_body + "<tr><td width='30%' height='22' style='padding-left:10px;font-family:Arial'>Email ID</td><td style='padding-left:10px;'>" + mail_from + "</td></tr>";
            mail_body = mail_body + "<tr><td width='30%' height='22' style='padding-left:10px;font-family:Arial'>Message</td><td style='padding-left:10px;'>" + message + "</td></tr>";
            mail_body = mail_body + "</table></body></html>";

            mm.Body = mail_body;
            mm.IsBodyHtml = true;
            smtp.Host = "smtp.gmail.com"; //You can add this in the webconfig
            smtp.EnableSsl = true;
            System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();


            NetworkCred.UserName = "bhilaieducationmail@gmail.com";
            //NetworkCred.UserName = "rktj.rajkumar89@gmail.com";
            NetworkCred.Password = "bhilaieducation123456";

            smtp.UseDefaultCredentials = true;
            //if (FileUpload1.HasFile)
            //{
            //    mm.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, FileUpload1.FileName));
            //}
            smtp.Credentials = NetworkCred;
            smtp.Port = 587; //this is Gmail port for e-mail
            smtp.Send(mm);//send an e-mail

            //Response.Redirect("http://www.ajaynidaan.com");

        }
        catch (Exception ee)
        {
            Label1.Text = ee.Message;
        }

    }
}
