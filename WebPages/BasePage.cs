﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using N_Bers.Business.BLL;
using N_Bers.Business.Model;
namespace WebPages
{
    public class BasePage : System.Web.UI.Page
    {
        ValidAccessBLL validAccess = new ValidAccessBLL();

        public string buttonJson = "";
        protected void Page_Init(object sender, EventArgs e)
        {
            UserModel user=(UserModel)Session[BaseConst.USERSESSION];
            String nodeid=Request.QueryString["nodeid"];
            //1、验证页面权限
           if(!validAccess.validPage(user.id.ToString(),nodeid))
           {
               Response.Redirect("../error/404.html");
           }
            //2、验证按钮权限
           buttonJson = validAccess.getButton(user.id.ToString(), nodeid);
        }
    }
}