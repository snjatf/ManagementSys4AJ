﻿using System;
using Wonder4.Map.Extensions;
using Wonder4.Map.Extensions.DAL;
using N_Bers.Business.Model;
using System.Collections.Generic;
using System.Text;

namespace N_Bers.Business.BLL
{
    public class MenuBLL : IBusinessBLL<MenuModel>
    {
        public int Delete(MenuModel t)
        {
            return t.Delete() ;
        }

        public MenuModel GetModel(int id)
        {
            List<MenuModel> list = DoQuery(" id = " + id);
            return list.Count > 0 ? list[0] : null;
        }

        public int Insert(MenuModel t)
        {
            return t.Insert();
        }

        public List<MenuModel> DoQuery(string strfilter)
        {
            string queryStr = "select * from nbers_node where 1=1";
            if (!string.IsNullOrEmpty(strfilter))
            {
                queryStr = queryStr.Replace("1=1",strfilter);
            }
            return CPQuery.From(queryStr).ToList<MenuModel>();
        }

        public int Update(MenuModel t)
        {
            return t.Update();
        }

        /// <summary>
        /// 验证页面权限
        /// </summary>
        /// <param name="user"></param>
        /// <param name="menu"></param>
        /// <returns></returns>
        public bool CheckPageMenu(UserModel user, MenuModel menu)
        {
            List<MenuModel> list = DoQuery("id in (select node_id from nbers_access where node_id="+menu.id+" and role_id in(select id from nbers_role where id in (select role_id from nbers_role_user where user_id="+user.id+")) )");
            if (list.Count > 0)
            {
                return true;
            }
            else 
            {
                return false;
            } 
        }
        /// <summary>
        /// 获取用户的一级菜单
        /// </summary>
        /// <returns></returns>
        public List<MenuModel> getParentMenus(UserModel user)
        {
            return DoQuery("parentId=0 and group_id=0 ");
          //  return Query("parentId=0 and group_id=0 and id in (select node_id from nbers_access where role_id in (select role_id from nbers_role_user where user_id='" + user.id + "') )");
        }
        /// <summary>
        /// 获取用户的所有子菜单
        /// </summary>
        /// <returns></returns>
        public List<MenuModel> getSubMenus(UserModel user)
        {
            return DoQuery("parentId!=0 and group_id=0 ");
            //return Query("parentId!=0 and group_id=0 and id in (select node_id from nbers_access where role_id in (select role_id from nbers_role_user where user_id='" + user.id + "') )");
        }
        /// <summary>
        /// 获取用户的某个页面的按钮权限json字符串
        /// </summary>
        /// <param name="user"></param>
        /// <param name="parentNodeId"></param>
        /// <returns></returns>
        public String getButtonMenus(UserModel user,MenuModel node)
        {
            //String buttonMenusString="[{ line: true },";
            //StringBuilder buttonMenusString = new StringBuilder("[{ line: true },");
            //List<MenuModel> list = DoQuery("parentId=" + node.id + " and group_id=1 and id in (select node_id from nbers_access where role_id in (select role_id from nbers_role_user where user_id='" + user.id + "')) order by sortCode asc");
            ////当前用户是否管理员 管理员直接显示所有菜单
            //bool isAdmin = Core.Public.IsAdmin();

            //foreach (MenuModel menu in list)
            //{
            //    buttonMenusString.Append(string.Concat("{ text: '",menu.name,"', click: ItemClick, icon: '",menu.icon,"' },{ line: true },"));              
            //}

            //buttonMenusString.Append("]");
            //return buttonMenusString.ToString() ;
            String buttonMenusString = "[{ line: true },";
            List<MenuModel> list = DoQuery("parentId=" + node.id + " and group_id=1 and id in (select node_id from nbers_access where role_id in (select role_id from nbers_role_user where user_id='" + user.id + "')) order by sortCode asc");
            //当前用户是否管理员 管理员直接显示所有菜单
            bool isAdmin = Core.Public.IsAdmin();

            //foreach (MenuModel menu in list)
            //{
            //    if (menu.name.Equals("新增") && isAdmin)
            //        buttonMenusString += "{ text: '新增', click: AddItem, icon: 'add' },{ line: true },";
            //    if (menu.name.Equals("编辑") && isAdmin)
            //        buttonMenusString += "{ text: '编辑', click: EditItem, icon: 'modify' },{ line: true },";
            //     if(menu.name.Equals("删除") && isAdmin)
            //        buttonMenusString+="{ text: '删除', click: deleteRow, img: '../assets/lib/ligerUI/skins/icons/delete.gif' },{ line: true },";
            //}
            buttonMenusString += "{ text: '新增', click: AddItem, icon: 'add' },{ line: true },";
            buttonMenusString += "{ text: '编辑', click: EditItem, icon: 'modify' },{ line: true },";
            buttonMenusString += "{ text: '删除', click: deleteRow, img: '../assets/lib/ligerUI/skins/icons/delete.gif' },{ line: true },";
            buttonMenusString += "]";
            return buttonMenusString;
        }
        /// <summary>
        /// 通过角色Id得到menu列表
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public List<MenuModel> getByUserId(int userId) {
            List<MenuModel> list = DoQuery(" id in (select node_id from nbers_access where role_id in (select role_id from nbers_role_user where user_id="+userId+"))");
            return list;
        }
        public List<MenuModel> getByRoleId(int roleId) {
            List<MenuModel> list = DoQuery(" id in (select node_id from nbers_access where role_id="+roleId+")");
            return list;
        }

        #region 菜单加载 作废
        /// <summary>
        /// 菜单根目录内部类
        /// </summary>
        private class menu
        {
            public string text;
            public bool isexpand;
            public List<menuChildren> children;
        }
        /// <summary>
        ///  菜单二级目录内部类
        /// </summary>
        private class menuChildren
        {
            public string url;
            public string text;
        }
        /// <summary>
        /// 根据用户id获得菜单的json
        /// </summary>
        /// <param name="userid">用户Id</param>
        /// <returns>二级菜单indexdata的json数据</returns>
        public string getMenu(UserModel user) 
        {
            ////查询到的userid拥有的一级目录列表MenuModel
            //List<MenuModel> rootList = Query(" pid=0 and group_id=0 and id in (select node_id from nbers_access where role_id in (select role_id from nbers_role_user where user_id='"+user.id+"') )");
            ////菜单实际需要转成json的列表
            //List<menu> menus = new List<menu>();
            ////用循环addmenu到list中
            //foreach (MenuModel m in rootList)
            //{
            //    menu root = new menu();
            //    root.text = m.title;
            //    root.isexpand = false;
            //    List<menuChildren> menuchildren=new List<menuChildren>();
            //    //查询到userid拥有的二级目录列表MenuList
            //    List<MenuModel> MenuModelChildren = Query(" pid=" + m.id + " and group_id=0 and id in (select node_id from nbers_access where role_id in (select role_id from nbers_role_user where user_id='" + user.id + "') )");
            //    foreach (MenuModel MenuModelChild in MenuModelChildren)
            //    {
            //        menuChildren menuchild=new menuChildren();
            //        menuchild.text=MenuModelChild.title;
            //        menuchild.url = MenuModelChild.url;
            //        menuchildren.Add(menuchild);
            //    }
            //    root.children = menuchildren;
            //    menus.Add(root);
            //}
            //return JsonExtensions.ToJson(menus);
            return null;
        }
		public int DeleteByIDs(string ids)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}