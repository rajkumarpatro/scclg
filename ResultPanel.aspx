<%@ Page Language="C#" MasterPageFile="~/Home_Page.master" AutoEventWireup="true" CodeFile="ResultPanel.aspx.cs" Inherits="CPanel" Title="Control Panel " %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrap-title-page">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h1 class="ui-title-page">Welcome to Autonomous Cell</h1>
                </div>
            </div>
        </div>
        <!-- end container-->
    </div>
    <!-- end wrap-title-page -->
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a href="ChangeResultPassword.aspx" class="btn btn-danger">Change Password</a>&nbsp;
                <a href="Post-Result.aspx" class="btn btn-danger">Result</a>&nbsp;
                <a href="AutonoumousNotice.aspx" class="btn btn-danger">Notifications</a>&nbsp;
                <a href="post-admitcard.aspx" class="btn btn-danger">Post Admit Card</a>&nbsp;
                <a href="Post-Educational-Program.aspx" class="btn btn-danger">Syllabus</a>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-4">
                
            </div>
        </div>
        <br />
        <h6>For Autonomous Cell</h6>
        <div class="row">
            <div class="col-md-12">
                <a href="post_questionpaper.aspx" class="btn btn-info">Previous Question Paper</a>&nbsp;
                        <a href="post_assignment.aspx" class="btn btn-info">Assignment & Question Paper</a>&nbsp;
                        <a href="poststudentsassignments.aspx" class="btn btn-info">Download Student Assignment</a>&nbsp;
                        <%--<a href="post_event_photos.aspx" class="btn btn-info">Download Exam Answer</a>&nbsp;--%>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <a href="Check_Alumni_Registration.aspx" class="btn btn-success">Alumni Registration</a>&nbsp;
                        <a href="post_feedback_from_alumni.aspx" class="btn btn-success">Alumini Feedback</a>&nbsp;
                        <a href="post_parents_feedback_form.aspx" class="btn btn-success">Feedback from Parents</a>&nbsp;
                        <a href="post_students_feedback_form.aspx" class="btn btn-success">Students Feedback</a>&nbsp;
                        <a href="post_students_feedback_form_about_Teachers.aspx" class="btn btn-success">Teacher Feedback</a>
            </div>
        </div>
        <br />
    </div>
</asp:Content>

