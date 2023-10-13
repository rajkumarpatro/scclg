using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for UploadImage
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class UploadImage : System.Web.Services.WebService
{

    public UploadImage()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string UploadFile(HttpPostedFileBase aUploadedFile)
    {
        var vReturnImagePath = string.Empty;
        if (aUploadedFile.ContentLength > 0)
        {
            var vFileName = Path.GetFileNameWithoutExtension(aUploadedFile.FileName);
            var vExtension = Path.GetExtension(aUploadedFile.FileName);

            string sImageName = vFileName + DateTime.Now.ToString("YYYYMMDDHHMMSS");

            var vImageSavePath = Server.MapPath("~/UpImages/") + sImageName + vExtension;
            //sImageName = sImageName + vExtension;  
            vReturnImagePath = "~/UpImages/" + sImageName + vExtension;
            var path = vImageSavePath;

            // Saving Image in Original Mode  
            aUploadedFile.SaveAs(path);
            var vImageLength = new FileInfo(path).Length;
            //here to add Image Path to You Database ,  
            //TempData["message"] = string.Format("Image was Added Successfully");
        }
        return Convert.ToString(vReturnImagePath);
    }

}
