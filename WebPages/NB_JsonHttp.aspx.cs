﻿using N_Bers.Business.BLL;
using N_Bers.Business.Core;
using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Wonder4.Map.Extensions;

namespace WebPages
{
    public partial class NB_JsonHttp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ( null == Session[BaseConst.USERSESSION] || string.IsNullOrEmpty(Session[BaseConst.USERSESSION].ToString()))
            {
                Response.ContentType = "text/html";
                Response.Clear();
                Response.Write((new MyHttpResult(false,"登陆超时，请重新登陆！")).ToString());
                Response.End();
            }
            string oprType, onlyPara,onlyPara2,retJsonStr=string.Empty;
            oprType = Request.QueryString["oprtype"];
            onlyPara = Request.QueryString["strkey"];
            onlyPara2 = Request.QueryString["strkey2"];
            switch (oprType.ToUpper())
            {
                case "GETMENU":
                    retJsonStr = GetMenu();
                    break;
                case "GETUSERS":
                    retJsonStr = GetUsers(getPostStr());
                    break;
                case "GETUNITS":
                    retJsonStr = GetUnits(onlyPara);
                    break;
                case "GETUNITS4TREE":
                    retJsonStr = GetUnits4Tree(onlyPara);
                    break;
                case "GETUNITS4NETMAP":
                    retJsonStr = GetUnits4NetMap(onlyPara);
                    break;
                case "ADDUNIT":
                    retJsonStr = AddUnit(getPostStr());
                    break;
                case "DELETEUNITS":
                    retJsonStr = DeleteUnits(onlyPara);
                    break;
                case "GETFIRSTLEVELUNIT":
                    retJsonStr = GetFirstLevelUnit(onlyPara);
                    break;
                case "GETUNITMODEL":
                    retJsonStr = GetUnitModel(onlyPara);
                    break;
                case "GETPARENTMENUSBYJSON":
                    retJsonStr = getParentMenusByJson();
                    break;
                case "GETSUBMENUSBYJSON":
                    retJsonStr = getSubMenusByJson();
                    break;
                case "GETALLMENUS":
                    retJsonStr = getAllMenus();
                    break;
                case "DELETEMENU":
                    retJsonStr = deleteMenu(onlyPara);
                    break;
                case "GETMENUBYID":
                    retJsonStr = getMenuById(onlyPara);
                    break;
                case "ADDMENU":
                    retJsonStr = addMenu(getPostStr());
                    break;
                case "CHANGEPWD":
                    retJsonStr = changePwd(onlyPara);
                    break;
                case "GETUSERINFO":
                    retJsonStr = GetUserInfo(onlyPara);
                    break;
                case "UPDATEUSER":
                    retJsonStr = UpdateUser(getPostStr());
                    break;
                case "SAVENODE":
                    retJsonStr = SaveNode(getPostStr());
                    break;
                case "GETROLES":
                    retJsonStr = getRoles();
                    break;
                case "GETROLEMENUBYROLEID":
                    retJsonStr = getRoleMenuByRoleId(onlyPara);
                    break;
                case "DELETEROLE":
                    retJsonStr = deleteRole(onlyPara);
                    break;
                case "ADDROLE":
                    retJsonStr = addRole(onlyPara,getPostStr());
                    break;
                case "GETSTATIONLIST":
                    retJsonStr = GetStationList(getPostStr());
                    break;
                case "GETROLE":
                    retJsonStr = GetRole();
                    break;
                case "GETSTATIONLIST4GRID":
                    retJsonStr = GetStationList4Grid(getPostStr());
                    break;
                case "DELETEUSERS":
                    retJsonStr = DeleteUsers(onlyPara);
                    break;
                case "GETFILES4GRID":
                    retJsonStr = GetFiles4Grid(onlyPara);
                    break;
                case "SAVEARTICLE":
                    retJsonStr = SaveArticle(getPostStr());
                    break;
                case "GETARTICLE4GRID":
                    retJsonStr = GetArticle4Grid(onlyPara);
                    break;
                case "DELETEARTICLES":
                    retJsonStr = DeleteArticles(onlyPara);
                    break;
                case "GETNETMAPNODE":
                    retJsonStr = GetNetMapNode(onlyPara);
                    break;
                case "TEST":
                    retJsonStr = test();
                    break;
                case "GETUSERROLES":
                    retJsonStr=getUserRoles(onlyPara);
                    break;
                case "ADDUSERROLE":
                    retJsonStr = addUserRole(onlyPara, onlyPara2);
                    break;
                case "DELETEMAPNODE":
                    retJsonStr = DeleteMapNode(onlyPara);
                    break;
                case "GETALLPARENT":
                    retJsonStr = getAllParent();
                    break;
                default:                
                    break;
            }
            Response.ContentType = "text/HTML";
            Response.Clear();
            Response.Write(retJsonStr);
            Response.End();
        }

        private string DeleteMapNode(string onlyPara)
        {
            if (string.IsNullOrEmpty(onlyPara))
            {
                return JsonExtensions.ToJson(new MyHttpResult
                {
                    result = false,
                    msg = "提交数据错误！"
                });
            }
            Guid nodeguid = new Guid(onlyPara);
            NetMapModel nmm = (new NetMapBLL()).GetModelByGuid(nodeguid);
            return JsonExtensions.ToJson(new MyHttpResult
            {
                result = nmm.Delete() > 0 ? true : false,
                msg = "删除节点成功！"
            });
            
        }

        private string GetNetMapNode(string onlyPara)
        {
            return new MyHttpResult(true, (new NetMapBLL()).GetModelByGuid(new Guid(onlyPara))).ToString();
        }

        private string SaveNode(string node_json)
        {
            if (string.IsNullOrEmpty(node_json))
            {
                return JsonExtensions.ToJson(new MyHttpResult
                {
                    result = false,
                    msg = "提交数据错误！"
                });
            }
            NetMapModel new_model = JsonExtensions.FromJson<NetMapModel>(node_json);
            NetMapModel old_model = (new NetMapBLL()).GetModelByGuid(new_model.node_guid);
            if (null == old_model)
            {
                return JsonExtensions.ToJson(new MyHttpResult
                {
                    result = new_model.Insert() > 0 ? true : false,
                    msg = "新增节点成功！"
                });
            }

            old_model.name = new_model.name;
            old_model.auditor = new_model.auditor;
            old_model.station_name = new_model.station_name;
            old_model.sort_order = new_model.sort_order;

            return JsonExtensions.ToJson(new MyHttpResult
            {
                result = old_model.Update() > 0 ? true : false,
                msg = "修改节点成功！"
            });
        }

        private string GetUnits4NetMap(string onlyPara)
        {
            List<NetMapModel> list = (new NetMapBLL()).DoQuery("1=1 ORDER BY parentguid,sort_order");
            return JsonExtensions.ToJson(list);
        }

        private string test()
        {
            //3594D3FA - 7C87 - 43C3 - 90DD - 820A2E8052AE
            //07193C51 - 5530 - 4F3F - 9208 - 6E59746962CC
            //90B4FE32 - 708B - 4405 - ABC6 - FC01D98D4B7A
            string[] parentid = {
                "3594D3FA-7C87-43C3-90DD-820A2E8052AE",
                "07193C51-5530-4F3F-9208-6E59746962CC",
                "90B4FE32-708B-4405-ABC6-FC01D98D4B7A" };
            NetMapModel nmm = new NetMapModel();
            for (int i = 0; i < 3; i++)
            {
                nmm.node_guid = Guid.NewGuid();
                nmm.parentguid = new Guid(parentid[i]);
                nmm.name = "岗位——" + i.ToString();
                nmm.auditor = "dengxy";
                nmm.Insert();
            }
            return (new MyHttpResult(true, "")).ToString();
        }

        private string DeleteArticles(string ids)
        {
            var result = (new ArticleBLL()).DeleteByIDs(ids);
            if (result>0)
            {
                return (new MyHttpResult(true, "删除成功，共删除"+result+"条数据！")).ToString();
            }
            else
            {
                return (new MyHttpResult(false, "删除失败，请联系管理员！")).ToString();
            }
            
            
        }

        private string GetArticle4Grid(string onlyPara)
        {
            var fileList = (new ArticleBLL()).DoQuery(" art_type='" + onlyPara + "'");
            var grid = new
            {
                Rows = fileList,
                Total = fileList.Count
            };
            return JsonExtensions.ToJson(grid);
        }

        private string SaveArticle(string input)
        {
            if (string.IsNullOrEmpty(input))
            {
                return new MyHttpResult(false, "入参不符合要求").ToString();
            }
            
            ArticleModel artM = JsonExtensions.FromJson<ArticleModel>(input);

            MyHttpResult myRtn;
            if (artM.id==0)
            {
                var user = (UserModel)Public.User_Info;
                artM.createby = user.id;
                artM.create_user = user.nickname;
                artM.create_date = DateTime.Now;
                myRtn = new MyHttpResult(artM.Insert() > 0 ? true : false, "");
            }
            else
            {
                myRtn = new MyHttpResult(artM.Update() > 0 ? true : false, "");
            }
            return myRtn.ToString();
        }

        /// <summary>
        /// 根据文件分类来获取文件数据 by wonder4 2016年11月5日14:27:32
        /// </summary>
        /// <param name="onlyPara"></param>
        /// <returns></returns>
        private string GetFiles4Grid(string onlyPara)
        {
            var fileList = (new AttachmentsBLL()).DoQuery(" DocType='"+onlyPara+"'");
            var grid = new {
                Rows= fileList,
                Total=fileList.Count
            };
            return JsonExtensions.ToJson(grid);
        }

        private string DeleteUsers(string onlyPara)
        {
            return (new MyHttpResult
            {
                result = true,
                msg = "操作成功，共删除 " + (new MyUserBLL()).DeleteByIDs(onlyPara) + " 条数据。",
            }).ToString();
        }

        private string GetStationList4Grid(string filter)
        {
            filter = "unit_type=2";
            var list = (new MyUnitBLL()).DoQuery(filter);
            var grid =new  {
                Rows=list,
                Total=list.Count()
            };
            return JsonExtensions.ToJson(grid);
        }

        private string GetRole()
        {
            return new MyHttpResult(true, (new MenuBLL()).DoQuery("")).ToString();
        }

        /// <summary>
        /// 获取岗位
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        private string GetStationList(string filter)
        {
           filter = "unit_type=2";
            var data = (new MyUnitBLL()).DoQuery(filter);
            return (new MyHttpResult(true, data)).ToString();
        }

        /// <summary>
        /// 修改个人资料
        /// </summary>
        /// <returns></returns>
        private string UpdateUser(string user_json)
        {
            if (string.IsNullOrEmpty(user_json))
            {
                return JsonExtensions.ToJson(new MyHttpResult
                {
                    result = false,
                    msg = "提交数据错误！"
                });
            }
            UserModel new_model = JsonExtensions.FromJson<UserModel>(user_json);
            UserModel old_model = (new MyUserBLL()).GetModel(new_model.id);
            if (null== old_model)
            {
                new_model.password = string.IsNullOrEmpty(new_model.password) ? "123456" : new_model.password;
                new_model.password = AesHelper.MD5Encrypt(new_model.password);
                return JsonExtensions.ToJson(new MyHttpResult
                {
                    result = new_model.Insert()>0?true:false,
                    msg = "新增用户成功！"
                });
            }

            old_model.nickname = new_model.nickname;
            old_model.email = new_model.email;
            old_model.phone = new_model.phone;
            old_model.type_id = new_model.type_id;
            old_model.info = new_model.info;
            old_model.unit_id = new_model.unit_id;

            return JsonExtensions.ToJson(new MyHttpResult
            {
                result = old_model.Update()>0?true:false,
                msg = "修改用户资料成功！"
            });

        }

        /// <summary>
        /// 获取当前用户信息 add by wonder4 2016年10月31日22:33:55
        /// </summary>
        /// <returns></returns>
        private string GetUserInfo(string user_id)
        {
            int userid;
            if (string.IsNullOrEmpty(user_id))
            {
                userid= ((UserModel)Public.User_Info).id;
            }
            else
            {
                userid = Convert.ToInt32(user_id);
            }

            return (new MyHttpResult(true, (new MyUserBLL()).GetModel(userid))).ToString();
        }

        /// <summary>
        /// 用户修改密码 by wonder4 2016年10月31日21:38:04
        /// </summary>
        /// <returns></returns>
        private string changePwd(string new_pwd)
        {
            UserModel model = (UserModel)Public.User_Info;
            model.password = AesHelper.MD5Encrypt(new_pwd);
            //model.update_time = Public.GetDateTime;

            return (new MyHttpResult(model.Update()>0?true:false,"密码修改成功！")).ToString();
        }

        private string DeleteUnits(string onlyPara)
        {
            return (new MyHttpResult
            {
                result = true,
                msg = "操作成功，共删除 " + (new MyUnitBLL()).DeleteByIDs(onlyPara) + " 条数据。",
            }).ToString();
        }



        private string GetFirstLevelUnit(string spid)
        {
            spid = string.IsNullOrEmpty(spid) ? "0" : spid;
            List<BusinessUnitModel> buList = (new MyUnitBLL()).DoQuery(" ISNULL(unit_type,0) in("+ spid+")");
            return (new MyHttpResult(true,buList)).ToString();
        }

        #region 获取采用Post方式Send过来的值
        /// <summary>
        /// 功能：获取采用Post方式Send过来的值
        /// </summary>
        private string getPostStr()
        {
            string requestMsg;
            using (StreamReader sr = new StreamReader(Request.InputStream))
            {
                requestMsg = sr.ReadLine();
            }
            return requestMsg;
        }
        #endregion

        private string AddUnit(string input)
        {
            if (string.IsNullOrEmpty(input))
            {
                return JsonExtensions.ToJson(new MyHttpResult
                {
                    result = false,
                    msg = "提交数据错误！"
                });
            }
            BusinessUnitModel bu = JsonExtensions.FromJson<BusinessUnitModel>(input);

            var userid =((UserModel)Session[BaseConst.USERSESSION]).id;
            bu.createby = Convert.ToInt32(1);
            bu.createon = DateTime.Now;

            int iResult;
            if (bu.id == 0)//新增id=0
            {
                iResult = bu.Insert();
            }
            else
            {
                iResult = bu.Update();
            }

            return JsonExtensions.ToJson(new MyHttpResult
            {
                result = iResult > 0 ? true : false,
            });
        }

        private string GetUnits(string filter)
        {
            List<BusinessUnitModel> list = (new MyUnitBLL()).DoQuery("unit_type=1");
            var grid = new
            {
                Rows = list,
                Total = list.Count
            };
            return JsonExtensions.ToJson(grid);
        }

        private string GetUnits4Tree(string filter)
        {
            List<BusinessUnitModel> list = (new MyUnitBLL()).DoQuery(filter);
            return (new MyHttpResult(true, list)).ToString();
        }

        private string GetUsers(string filter)
        {
            string unit_id = Request.Form["unit_id"];
            string page = Request.Form["page"];
            string pagesize = Request.Form["pagesize"];
            string sortname = Request.Form["sortname"];
            string sortorder = Request.Form["sortorder"];
            string txt_filter = Request.Form["txt_filter"];

            StringBuilder strWhere = new StringBuilder("1=1");
            if (!string.IsNullOrEmpty(unit_id) && !unit_id.Equals("1"))//工程局的id是1 点击其他部门、岗位时需要先找到当前的孩子
            {
                strWhere.Append(string.Format(@" and unit_id in(SELECT bu2.id FROM dbo.nbers_businessunit bu1 JOIN dbo.nbers_businessunit 
                bu2 ON bu1.id=bu2.pid WHERE bu1.id={0} UNION SELECT id FROM dbo.nbers_businessunit WHERE id={0})", unit_id));
            }
            if (!string.IsNullOrEmpty(page))
            {
                int startid = (Convert.ToInt32(page) - 1) * (Convert.ToInt32(pagesize));
                int endid = Convert.ToInt32(page)* (Convert.ToInt32(pagesize));
                strWhere.Append(string.Format(" and rid BETWEEN {0} AND {1}", startid,endid));
            }
            if (!string.IsNullOrEmpty(sortname))
            {
                strWhere.Append(string.Format("order by {0} {1}",sortname,sortorder));
            }
            if (!string.IsNullOrEmpty(txt_filter))
            {
                strWhere.Append(string.Format("and nickname LIKE '%{0}%' OR account LIKE '%{0}%'", txt_filter));
            }


            List<UserModel> list = (new MyUserBLL()).DoQuery(strWhere.ToString());
            var grid = new
            {
                Rows = list,
                Total = list.Count
            };
            return JsonExtensions.ToJson(grid);
        }

        private string GetMenu()
        {
            List<MenuModel> list = (new MenuBLL()).DoQuery("");
            var grid = new
            {
                Rows = list,
                Total = list.Count
            };
            return JsonExtensions.ToJson(grid);
        }

        private string GetUnitModel(string id)
        {
            int iid = Convert.ToInt32(id);
            return JsonExtensions.ToJson((new MyUnitBLL()).GetModel(iid));
        }


        /// <summary>
        /// 获取用户一级菜单的json，给sidebarData
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        private string getParentMenusByJson()
        {
            UserModel user = new UserModel();
            user.id = 1;//后面替换成参数
            return (new MyHttpResult(true, (new MenuBLL()).getParentMenus(user))).ToString();
        }

        /// <summary>
        /// 获取用户所有子菜单的json，给navigateData
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        private string getSubMenusByJson()
        {
            UserModel user = new UserModel();
            user.id = 1;
            return (new MyHttpResult(true, (new MenuBLL()).getSubMenus(user))).ToString();
        }

        /// <summary>
        /// 获取Menu列表传给MenuIndex显示
        /// </summary>
        /// <returns></returns>
        public string getAllMenus()
        {
            List<MenuModel> menulist= new MenuBLL().DoQuery("order by sortCode asc");
            MenuModel root=new MenuModel();
            root.parentId=-1;
            root.id=0;
            root.name="根节点";
            root.enable="1";
            root.group_id="0";
            menulist.Add(root);
            return new MyHttpResult(true, menulist).ToString();
        }

        /// <summary>
        /// 通过Id得到菜单
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string getMenuById(string id)
        {
            MenuModel menu = (new MenuBLL()).GetModel(int.Parse(id));
            return (new MyHttpResult(true,menu)).ToString();
        }

        /// <summary>
        /// 通过json获取传过来的MenuModel，执行Add或Update
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public string addMenu(string input)
        {
            if (string.IsNullOrEmpty(input))
            {
                return JsonExtensions.ToJson(new MyHttpResult
                {
                    result = false,
                    msg = "提交数据错误！"
                });
            }
            MenuModel menu = JsonExtensions.FromJson<MenuModel>(input);
            int iResult;
            if (menu.id == 0)
            {
                iResult = menu.Insert();
            }
            else
            {
                iResult = menu.Update();
            }
            return JsonExtensions.ToJson(new MyHttpResult
            {
                result = iResult > 0 ? true : false,
            });
        }

        /// <summary>
        /// 删除菜单
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string deleteMenu(String id)
        {
            if (String.Empty != id)
            {
                MenuModel menu = new MenuModel();
                menu.id = int.Parse(id);
                int i = (new MenuBLL()).Delete(menu);
                return i.ToString();
            }
            else
            {
                return "0";
            }
        }

        public string getRoles()
        {
            var grid = new {
                Rows = new RoleBLL().DoQuery(""),
                Total = new RoleBLL().DoQuery("").Count
            };
            return new MyHttpResult(true, grid).ToString();
        }
        public string getRoleMenuByRoleId(string id)
        {
            //1.获取角色实体
            RoleBLL rolebll = new RoleBLL();
            RoleModel model = rolebll.GetModel(int.Parse(id));
            //2.获取角色权限
            MenuBLL menubll = new MenuBLL();
            List<MenuModel> menuList = menubll.getByRoleId(int.Parse(id));
            var data=new{
                         Role=model,
                         Auth = menuList
                     };

            return (new MyHttpResult(true, data)).ToString();//data由Role和Accesslist组成
        }
        public string deleteRole(string id) {
            if (String.Empty != id)
            {
                RoleModel model = new RoleModel();
                model.id = int.Parse(id);
                int i = (new RoleBLL()).Delete(model);
                return new MyHttpResult(true,i.ToString()).ToString();
            }
            else
            {
                return new MyHttpResult(false, "0").ToString();
            }
        }
        /// <summary>
        /// Role实体和权限字符串
        /// </summary>
        /// <param name="auth"></param>
        /// <param name="json"></param>
        /// <returns></returns>
        public string addRole(string auth,string json) {
            
            if (string.IsNullOrEmpty(json)) {
                return new MyHttpResult(false, "提交数据错误！").ToString();
            }
            RoleModel model = JsonExtensions.FromJson<RoleModel>(json);
            int result;
            //1.判断是新增角色还是编辑角色
            if (model.id == 0)//新增
            {
                //1.新增角色
                result = model.Insert();
                //2.获得该实体的ID
                model.id=(new RoleBLL()).getByMax().id;
            }
            else {//编辑
                result = model.Update();
            }
            //2.删除该角色的所有权限
            AccessBLL accessbll = new AccessBLL();
            accessbll.deleteByRoleId(model.id.ToString());
            //3.insert所有权限
            if (!string.IsNullOrEmpty(auth)) {
                foreach (string roleAuth in auth.Split(",".ToCharArray())) {
                    if (roleAuth != "")
                    {
                        AccessModel accessModel = new AccessModel();
                        accessModel.node_id = int.Parse(roleAuth);
                        accessModel.role_id = model.id;
                        result = accessModel.Insert();
                    }
                }
            }
            return new MyHttpResult(result > 0 ? true : false, "").ToString();
        }
        /// <summary>
        /// 根据用户编号获得角色列表字符串
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public string getUserRoles(string userid) {
            RoleUserBLL roleuserbll = new RoleUserBLL();
            List<RoleModel> roleList = roleuserbll.getRoleByUser(userid);
            string rolestr="";
            for(int i=0;i<roleList.Count;i++){
                if(i==roleList.Count-1){
                    rolestr+=roleList[i].id;
                }else{
                    rolestr+=roleList[i].id+";";
                }
            }
            return new MyHttpResult(true, rolestr,"").ToString();
        }

        public string addUserRole(string userid, string roleids) {
            RoleUserBLL roleuserbll=new RoleUserBLL();
            int result = 0;
            //1.delete all roles by userid 
            result=roleuserbll.deleteRolesByUserid(userid);
            //2.add all roles according to params ‘roleids’
            foreach (string roleid in roleids.Split(";".ToCharArray()))
            {
                if (roleid != "")
                {
                    RoleUserModel roleuser = new RoleUserModel();
                    roleuser.role_id = int.Parse(roleid);
                    roleuser.user_id = int.Parse(userid);
                    result=roleuser.Insert();
                }
            }
            return new MyHttpResult(result > 0 ? true : false, "").ToString();
        }

        public string getAllParent() {
            List<MenuModel> list = new MenuBLL().getAllParent();
            var nodes="[";
            foreach (MenuModel model in list) {
                string node = "{id :" + model.id + ",text :'" + model.name + "'},";
                nodes += node;
            }
            nodes += "]";
            return new MyHttpResult(true, nodes, "").ToString();
            
        }
    }
}