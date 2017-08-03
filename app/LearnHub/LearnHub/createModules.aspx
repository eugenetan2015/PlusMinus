﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="createModules.aspx.cs" Inherits="LearnHub.createModules" %>

<%@ Import Namespace="LearnHub.AppCode.entity" %>
<%@ Import Namespace="LearnHub.AppCode.dao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
    <link href="/Scripts/footable.bootstrap.min.css" rel="stylesheet" />
    <script src="/Scripts/footable.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $('.input-daterange').datepicker({
                autoclose: true
            });
        });

        $(function () {
            $('.input-group.date').datepicker({
                calendarWeeks: true,
                todayHighlight: true,
                autoclose: true
            });
        });


        jQuery(function ($) {
            $('.table').footable({
                "paging": {
                    "size": 5 <%--Change how many rows per page--%>
                },
                "filtering": {
                    "position": "left"
                }
            });
        });

    </script>
    <style>
        .pagination li > a,
        .pagination li > span,
        .pagination li > a:focus, .pagination .disabled > a,
        .pagination .disabled > a:hover,
        .pagination .disabled > a:focus,
        .pagination .disabled > span {
            background-color: white;
            color: black;
        }

            .pagination li > a:hover {
                background-color: #96a8ba;
            }

        .pagination > .active > a,
        .pagination > .active > span,
        .pagination > .active > a:hover,
        .pagination > .active > span:hover,
        .pagination > .active > a:focus,
        .pagination > .active > span:focus {
            background-color: #576777;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>Create Module</h1>
        <div class="verticalLine"></div>
    </div>

    <div class="container">
        <form class="form-horizontal" runat="server">
            <fieldset>
                <legend>Input new module information </legend>
                <div class="form-group required">
                    <strong>
                        <%--Compulsory/Leadership/Professional--%>
                        <asp:Label ID="moduleTypeLabel" runat="server" CssClass="col-lg-2 control-label" Text="Module Category"></asp:Label></strong>
                    <div class="col-lg-5">
                        <asp:DropDownList ID="moduleType" runat="server" CssClass="form-control" placeholder="Choose Category *" DataSourceID="SqlDataSourceCourseCategory" DataTextField="category" DataValueField="categoryID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceCourseCategory" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Elearn_courseCategory]"></asp:SqlDataSource>
                    </div>
                </div>

                <div class="form-group required">
                    <strong>
                        <asp:Label ID="nameOfModuleLabel" runat="server" CssClass="col-lg-2 control-label" Text="Name of Module"></asp:Label></strong>
                    <div class="col-lg-5">
                        <asp:TextBox ID="nameOfModuleInput" runat="server" CssClass="form-control" placeholder="Module Name"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group required">
                    <strong>
                        <asp:Label ID="descriptionModuleLabel" runat="server" CssClass="col-lg-2 control-label" Text="Description of Module"></asp:Label></strong>
                    <div class="col-lg-5">
                        <asp:TextBox ID="descriptionModuleInput" TextMode="multiline" Columns="50" Rows="5" runat="server" CssClass="form-control" placeholder="Enter module description"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group required">
                    <strong>
                        <asp:Label ID="hoursLabel" runat="server" CssClass="col-lg-2 control-label" Text="Learning Hours"></asp:Label></strong>
                    <div class="col-lg-5">
                        <div class="input-group">
                            <asp:TextBox ID="hoursInput" runat="server" CssClass="form-control" placeholder="No. of Hours"></asp:TextBox>
                            <span class="input-group-addon">hours </span>
                        </div>
                    </div>
                </div>

                <%--Date--%>
                
                <div class="form-group required">
                    <strong>
                        <asp:Label ID="dateLabel" runat="server" CssClass="col-lg-2 control-label" Text="Date to Display"></asp:Label></strong>

                    <div class="col-lg-5">
                        <div class="input-daterange input-group" id="datepicker">
                            <asp:TextBox ID="fromDateInput" runat="server" CssClass="form-control" placeholder="MM/DD/YYYY"></asp:TextBox>
                            <span class="input-group-addon">to</span>
                            <asp:TextBox ID="toDateInput" runat="server" CssClass="form-control" placeholder="MM/DD/YYYY"></asp:TextBox>
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i>
                            </span>
                        </div>
                    </div>
                    <br />

                </div>
                

                <%--Preq--%>
                <div class="form-group">
                    <strong>
                        <asp:Label ID="preqModuleLabel" runat="server" CssClass="col-lg-2 control-label" Text="Module Pre-requisite"></asp:Label></strong>
                    <div class="col-lg-5">
                        <%--<table class="table table-striped table-hover" data-paging="true" data-sorting="true" data-filtering="true">
                            <thead>
                                <tr>
                                    <th data-filterable="false" data-sortable="false">Select</th>
                                    <th>Module Name</th>
                                    <th>Module Category</th>
                                    <th data-filterable="false" data-sortable="false"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Course_elearnDAO ceDAO = new Course_elearnDAO();
                                    List<Course_elearn> availablePrereq = ceDAO.viewAvailablePrerequisiteCourses();
                                    foreach (Course_elearn ce in availablePrereq)
                                    {
                                 %>
                                <tr>
                                <td>
                                    <input type="checkbox" id="chkPreReq" name="prerequisites" value="<%= ce.getCourseID(); %>" runat="server" />
                                </td>
                                <%
                                        //Response.Write($"<td><input type=\"checkbox\" id=\"chkPrereq\" name=\"prerequisites\" value=\"{ce.getCourseID()}\" runat=\"server\" /></td>");
                                        Response.Write($"<td>{ce.getCourseName()}</td>");
                                        string category = ceDAO.getCourseCategoryByID(ce.getCategoryID());
                                        Response.Write($"<td>{category}</td>");
                                        Response.Write("<td><a target=\"_blank\" href=\"viewModuleInfo.aspx?id=" + ce.getCourseID() + "\"><span class=\"glyphicon glyphicon-menu-right\"></span> View Info</a></td>");
                                        Response.Write("</tr>");

                                %>
                                    </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>--%>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Elearn_course] ec INNER JOIN [Elearn_courseCategory] ecc ON ec.categoryID = ecc.categoryID WHERE ec.status='Open' and ec.start_date &lt;= getDate()"></asp:SqlDataSource>
                        <asp:GridView ID="gvPrereq" runat="server" AutoGenerateColumns="False" DataKeyNames="elearn_courseID,categoryID1" DataSourceID="SqlDataSource1" AllowPaging="True" CssClass="table table-striped table-hover" GridLines="None">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkboxPrereq" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="elearn_courseName" HeaderText="Module Name" SortExpression="elearn_courseName" />
                                <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
                                <asp:BoundField DataField="elearn_courseID" Visible="False" />
                                <asp:HyperLinkField DataNavigateUrlFields="elearn_courseID" DataNavigateUrlFormatString="viewModuleInfo.aspx?id={0}" Target="_blank" Text="View Details" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <%-- No external vendors based on latest requirement as of 24th July
                <div class="form-group">
                    <strong>
                        <asp:Label ID="courseProviderLabel" runat="server" CssClass="col-lg-2 control-label" Text="Course Provider"></asp:Label></strong>
                    <div class="col-lg-10">
                        <div class="radio">
                            <label>
                                <asp:RadioButtonList ID="courseProvider" runat="server" Enabled="True">
                                    <asp:ListItem id="in" runat="server" Value="inhouse" Text="In house" />
                                    <asp:ListItem id="ex" runat="server" Value="external" Text="External" />
                                </asp:RadioButtonList>
                            </label>
                        </div>
                    </div>
                    

                    <%--Empty label for formatting purposes%>
                    <asp:Label ID="empty1" runat="server" CssClass="col-lg-2 control-label" Text=""></asp:Label>
                    <div class="col-lg-5">
                        <asp:TextBox ID="externalCourseProvider" runat="server" CssClass="form-control" placeholder="If external, please specify"></asp:TextBox>
                    </div>
                </div>
                --%>

                <div class="form-group">
                    <br />
                    <div class="wrapper">
                        <asp:Button ID="submitBtn" CssClass="btn btn-primary" runat="server" Text="Submit" data-toggle="modal" href="#submitModal" OnClientClick="return false;" />
                    </div>
                </div>

                <%--Modal for Submission Confirmation--%>
                <div id="submitModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title"><b>Create new module</b></h4>
                            </div>
                            <%--Modal Content--%>
                            <div class="modal-body">
                                <div class="wrapper">
                                    <h4>Are you sure you want to submit?</h4>
                                    <br />
                                    <asp:Button ID="cfmSubmit" CssClass="btn btn-primary" runat="server" OnClick="submitBtn_Click" Text="Submit" />
                                    <asp:Button ID="Button2" CssClass="btn btn-default" runat="server" class="close" data-dismiss="modal" Text="Go Back" />
                                    <%--Redirect to viewModuleInfo of newly created course--%>
                                    <br />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </fieldset>
        </form>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
