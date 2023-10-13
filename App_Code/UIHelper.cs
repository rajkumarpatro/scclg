using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for UIHelper
/// </summary>
public class UIHelper
{
    static string[] MONTHS = { "JAN", "FEB", "MAR", "APR", "MAY", "JUNE", "JULY", "AUG", "SEPT", "OCT", "NOV", "DEC" };

    static string[] BLOOD_GROUPS = { "Select (चुनिये)", "Not Known (नही पता)", "A+", "B+", "A-", "B-", "AB+", "AB-", "O+", "O-", };
    static string[] STATES = { "Chhattisgarh", "Andhra Pradesh", "Madhya Pradesh", "Telangana" };

    static string[] GENDER = { "MALE (पुरुष)", "FEMALE (महिला)", "तृतीय लिंग (Third Gender)" };
    //static string[] GENDER = { "FEMALE (महिला)" };
    static string[] MARITALSTATUS = { "UNMARRIED", "MARRIED" };
    static string[] RELIGION = { "Select (चुनिये)", "Hindu (हिन्दू)", "Muslim (मुस्लिम)", "Sikh (सिक्ख)", "Christn. (ईसाई)", "Boudh (बौद्ध)", "Parsi (पारसी)", "Jain (जैन)" };
    static string[] CATEGORY = { "Select (चुनिये)", "GENERAL (सामान्य)", "SC (अनुसूचित जाति)", "ST (अनुसूचित जनजाति)", "OBC (ओ.बी.सी.)" };
    static string[] YESNO = { "NO", "YES" };
    static string[] GROUP = { "GROUP A", "GROUP B" };
    static string[] RURALURBAN = { "Rural (ग्रामीण)", "Urban (शहरी)" };

    static string[] BANKNAME = { "Select Your Bank",
                                   "Allahabad Bank",
                                    "Andhra Bank",
                                    "Axis Bank",
                                    "Bandhan Bank",
                                    "Bank of Baroda",
                                    "Bank of India",
                                    "Bank of Maharashtra",
                                    "Canara Bank",
                                    "Central Bank of India",
                                    "Corporation Bank",
                                    "Chhattisgarh Rajya Gramin Bank",
                                    "Dena Bank",
                                    "HDFC Bank",
                                    "Indian Bank",
                                    "Indian Overseas Bank",
                                    "ICICI Bank",
                                    "Industrial Development Bank OF india (IDBI Bank)",
                                    "Karnataka Bank",
                                    "Kotak mahindra Bank",
                                    "Oriental Bank of Commerce",
                                    "Punjab & Sind Bank",
                                    "Punjab National Bank",
                                    "Syndicate Bank",
                                    "State Bank of India",
                                    "UCO Bank",
                                    "Union Bank of India",
                                    "United Bank of India",
                                    "Vijaya Bank",
                                    "Yes Bank"};

    private static Random random = new Random();
    public static string RandomString(int length)
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        return new string(Enumerable.Repeat(chars, length)
          .Select(s => s[random.Next(s.Length)]).ToArray());
    }

    public UIHelper()
    {
        //
        // TODO: Add constructor logic here
        //

    }

    public string encrypt(string encryptString)
    {
        try
        {
            string EncryptionKey = "ravisolutions89";
            byte[] clearBytes = Encoding.Unicode.GetBytes(encryptString);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {  
            0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76  
        });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    encryptString = Convert.ToBase64String(ms.ToArray());
                }
            }
            return encryptString;
        }
        catch (Exception ee)
        {
            return ("");
        }
    }

    public string Decrypt(string cipherText)
    {
        try
        {
            string EncryptionKey = "ravisolutions89";
            cipherText = cipherText.Replace(" ", "+");
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {  
            0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76  
        });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }
        catch (Exception ee)
        {
            return ("");
        }
    }

    public void setMaritalStatus(DropDownList marital)
    {
        /** Set Blood Group */
        for (int i = 0; i < UIHelper.MARITALSTATUS.Length; i++)
        {
            marital.Items.Add(new ListItem(UIHelper.MARITALSTATUS[i], UIHelper.MARITALSTATUS[i]));
        }
    }

    public void setUnit(DropDownList unit)
    {
        DataTable dt_unit = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select unit_id,unit_name from tbl_UnitMaster");
        unit.Items.Clear();
        for (int i = 0; i < dt_unit.Rows.Count; i++)
        {
            unit.Items.Add(new ListItem(dt_unit.Rows[i]["unit_name"].ToString(), dt_unit.Rows[i]["unit_id"].ToString()));
        }
        //admissionclass.Items.Insert(0, new ListItem("Select", "0"));
    }

    public void setAdmissionAllClass(DropDownList admissionclass)
    {
        DataTable dt_coursetype = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select CourseId,CourseName from tbl_material_classes");
        admissionclass.Items.Clear();
        for (int i = 0; i < dt_coursetype.Rows.Count; i++)
        {
            admissionclass.Items.Add(new ListItem(dt_coursetype.Rows[i]["CourseName"].ToString(), dt_coursetype.Rows[i]["CourseId"].ToString()));
        }
        admissionclass.Items.Insert(0, new ListItem("Select", "0"));
    }

    public void setDate(DropDownList day, DropDownList month, DropDownList year)
    {
        /** Set Day */
        for (int i = 1; i <= 31; i++)
        {
            day.Items.Add(new ListItem("" + i, "" + i));
        }

        /** Set Month */
        for (int i = 0; i < UIHelper.MONTHS.Length; i++)
        {
            month.Items.Add(new ListItem(UIHelper.MONTHS[i], "" + (i + 1)));
        }

        /** Set Year */
        for (int i = 1930; i <= DateTime.Now.Year; i++)
        {
            year.Items.Add(new ListItem("" + i, "" + i));
        }
    }

    public void setCategory(DropDownList category)
    {
        /** Set Relationship */
        for (int i = 0; i < UIHelper.CATEGORY.Length; i++)
        {
            category.Items.Add(new ListItem(UIHelper.CATEGORY[i], UIHelper.CATEGORY[i]));
        }
    }

    public void setPassingYear(DropDownList year)
    {
        /** Set Relationship */
        for (int i = 2008; i <= DateTime.Now.Year; i++)
        {
            year.Items.Add(new ListItem("" + i, "" + i));
        }
    }

    public void setReligion(DropDownList religion)
    {
        /** Set Relationship */
        for (int i = 0; i < UIHelper.RELIGION.Length; i++)
        {
            religion.Items.Add(new ListItem(UIHelper.RELIGION[i], UIHelper.RELIGION[i]));
        }
    }

    public void setBloodGroup(DropDownList bloodGroup)
    {
        /** Set Blood Group */
        for (int i = 0; i < UIHelper.BLOOD_GROUPS.Length; i++)
        {
            bloodGroup.Items.Add(new ListItem(UIHelper.BLOOD_GROUPS[i], UIHelper.BLOOD_GROUPS[i]));
        }
    }

    public void setBankName(DropDownList bankname)
    {
        /** Set Blood Group */
        for (int i = 0; i < UIHelper.BANKNAME.Length; i++)
        {
            bankname.Items.Add(new ListItem(UIHelper.BANKNAME[i], UIHelper.BANKNAME[i]));
        }
    }

    public void setRuralUrban(DropDownList ruralurban)
    {
        /** Set Blood Group */
        for (int i = 0; i < UIHelper.RURALURBAN.Length; i++)
        {
            ruralurban.Items.Add(new ListItem(UIHelper.RURALURBAN[i], UIHelper.RURALURBAN[i]));
        }
    }

    public void setAdmissionClass(DropDownList admissionclass, string CourseType)
    {
        DataTable dt_coursetype = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select CourseId,CourseName from tbl_material_classes where CourseType='" + CourseType + "'");
        admissionclass.Items.Clear();
        for (int i = 0; i < dt_coursetype.Rows.Count; i++)
        {
            admissionclass.Items.Add(new ListItem(dt_coursetype.Rows[i]["CourseName"].ToString(), dt_coursetype.Rows[i]["CourseId"].ToString()));
        }
        admissionclass.Items.Insert(0, new ListItem("Select", "0"));
    }

    public void setAdmissionEnabledClass(DropDownList admissionclass, string CourseType)
    {
        DataTable dt_coursetype = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select CourseId,CourseName from tbl_material_classes where CourseEnable='Yes' and CourseType='" + CourseType + "'");
        admissionclass.Items.Clear();
        for (int i = 0; i < dt_coursetype.Rows.Count; i++)
        {
            admissionclass.Items.Add(new ListItem(dt_coursetype.Rows[i]["CourseName"].ToString(), dt_coursetype.Rows[i]["CourseId"].ToString()));
        }
        admissionclass.Items.Insert(0, new ListItem("Select", "0"));
    }

    public void setAdmissionClassType(DropDownList admissionclass)
    {
        DataTable dt_coursetype = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select distinct(CourseType) from tbl_material_classes where CourseEnable='Yes' order by CourseType desc");
        for (int i = 0; i < dt_coursetype.Rows.Count; i++)
        {
            admissionclass.Items.Add(new ListItem(dt_coursetype.Rows[i]["CourseType"].ToString(), dt_coursetype.Rows[i]["CourseType"].ToString()));
        }
    }

    public void setStates(DropDownList states)
    {
        /** Set States */
        for (int i = 0; i < UIHelper.STATES.Length; i++)
        {
            states.Items.Add(new ListItem(UIHelper.STATES[i], UIHelper.STATES[i]));
        }
    }

    public void setGender(DropDownList gender)
    {
        /** Set Gender */
        for (int i = 0; i < UIHelper.GENDER.Length; i++)
        {
            gender.Items.Add(new ListItem(UIHelper.GENDER[i], UIHelper.GENDER[i]));
        }
    }

    public void setYesNo(DropDownList yesno)
    {
        /** Set Gender */
        for (int i = 0; i < UIHelper.YESNO.Length; i++)
        {
            yesno.Items.Add(new ListItem(UIHelper.YESNO[i], UIHelper.YESNO[i]));
        }
    }

    public void setGroup(DropDownList group)
    {
        /** Set Gender */
        for (int i = 0; i < UIHelper.GROUP.Length; i++)
        {
            group.Items.Add(new ListItem(UIHelper.GROUP[i], UIHelper.GROUP[i]));
        }
    }

    public void setAge(DropDownList age)
    {
        /** Set Relationship */
        for (int i = 15; i <= 40; i++)
        {
            age.Items.Add(new ListItem("" + i, "" + i));
        }

        age.Items.Insert(0, new ListItem("Select", "0"));
    }

    public void setMonth(DropDownList months)
    {
        /** Set Relationship */
        for (int i = 0; i <= 11; i++)
        {
            months.Items.Add(new ListItem("" + i, "" + i));
        }

        //months.Items.Insert(0, new ListItem("Select", "0"));
    }

    public void setDays(DropDownList dayss)
    {
        /** Set Relationship */
        for (int i = 0; i <= 30; i++)
        {
            dayss.Items.Add(new ListItem("" + i, "" + i));
        }

        //dayss.Items.Insert(0, new ListItem("Select", "0"));
    }

    public void GetDistrict(DropDownList district)
    {
        DataTable dt_dist = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT [DIST_ID] ,[DIST_NAME] FROM [dbo].[TBL_DISTRICT]");
        district.DataSource = dt_dist;
        district.DataTextField = "DIST_NAME";
        district.DataValueField = "DIST_ID";
        district.DataBind();
    }
}