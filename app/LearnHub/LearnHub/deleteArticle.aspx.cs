﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using LearnHub.AppCode.dao;
using LearnHub.AppCode.entity;
using System.Collections;

namespace LearnHub
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User currentUser = (User)Session["currentUser"];
            if (currentUser == null)
            {
                Response.Redirect("Login.aspx");
            }
            
            if (Request.QueryString["id"] != null )
            {
                Boolean authenticate = authenticateAccess(currentUser);
                if (!authenticate)
                {
                    Response.Redirect("errorPage.aspx");
                }
                else
                {
                    //TestimonialDAO tdao = new TestimonialDAO();
                    string id = Request.QueryString["id"];
                    int id_num = Convert.ToInt32(id);
                    ArticleDAO adao = new ArticleDAO();
                    Article toDelete = adao.getArticleById(id_num);
                    adao.deactivateArticle(id_num);

                    //set audit
                    setAudit(currentUser, "articles", "delete", id, "deleted article title: " + toDelete.article_name);

                    Response.Redirect("manageArticles.aspx");
                }
            }
            else
            {
                Response.Redirect("errorPage.aspx");
            }
        }
        protected void setAudit(User u, string functionModified, string operation, string id_of_function, string remarks)
        {
            //set audit
            Audit a = new Audit();
            AuditDAO aDAO = new AuditDAO();
            a.userID = u.getUserID();
            a.functionModified = functionModified;
            a.operation = operation;
            a.id_of_function = id_of_function;
            a.dateModified = DateTime.Now;
            a.remarks = remarks;
            aDAO.createAudit(a);
        }
        protected Boolean authenticateAccess(User currentUser)
        {
            Boolean toReturn = false;
            ArrayList roles = currentUser.getRoles();
            if (roles.Contains("superuser") || roles.Contains("content creator"))
            {
                toReturn = true;
            }
            return toReturn;
        }
    }
}