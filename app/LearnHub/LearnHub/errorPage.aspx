﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="errorPage.aspx.cs" Inherits="LearnHub.errorPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
        <div class="container">
                    <h1><p class="text-danger">Oops! Page not found.</p></h1>
        <div class="verticalLine"></div>
            <div class="wrapper">
            <img src="img/warning.png" style='width: 20%;' border="0"/>
        <h3>This page is not available or you do not have the authorization to view this page. </h3>   
                </div>
        <br /><br />
            <a href='javascript:history.go(-1)'><span class="glyphicon glyphicon-menu-left"></span>&nbsp; Go Back To Previous Page</a>


    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
