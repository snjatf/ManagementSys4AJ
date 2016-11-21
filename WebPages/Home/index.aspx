﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebPages.Home.index" %>

<!DOCTYPE html>

<html lang="zh-CN">
<head>
    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <%--<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">--%>
    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <%--<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>--%>
    <script src="../assets/js/jquery-1.11.1.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <%--<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>--%>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
        .index_list {
            width: 100%;
        }

            .index_list li {
                width: 100%;
            }

                .index_list li a {
                    color: #777;
                    text-decoration: none;
                }

                    .index_list li a:hover {
                        color: #333;
                        text-decoration: none;
                    }

        .myspan {
            float: right;
        }

            .myspan a {
                color: #ffffff;
                text-decoration: none;
            }

                .myspan a:hover {
                    color: #333;
                    text-decoration: none;
                }

        .carousel-inner .item img {
            width: 900px;
            height: 350px;
        }

        .thumbnail > img {
            height: 245px;
        }

        .footer {
            text-align: center;
            padding: 15px 0;
            line-height: 25px;
        }
        .public_tips {
        margin-top:-10px;
        }
        .tips_weather {
        width: 43%;
    text-align: right;
    float:left;
        margin-bottom: 5px;
        }
    </style>
   <script type="text/javascript">
       function findWeather() {
           var cityUrl = 'http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js';
           $.getScript(cityUrl, function (script, textStatus, jqXHR) {
               var citytq = remote_ip_info.city;// 获取城市
               var url = "http://php.weather.sina.com.cn/iframe/index/w_cl.php?code=js&city=" + citytq + "&day=0&dfc=3";
               $.ajax({
                   url: url,
                   dataType: "script",
                   scriptCharset: "gbk",
                   success: function (data) {
                       var _w = window.SWther.w[citytq][0];
                       var _f = _w.f1 + "_0.png";
                       if (new Date().getHours() > 17) {
                           _f = _w.f2 + "_1.png";
                       }
                       var img = "<img width='16px' height='16px' src='http://i2.sinaimg.cn/dy/main/weather/weatherplugin/wthIco/20_20/" + _f
                       + "' />";
                       var tq ="今日天气预报： "+ citytq + " " + img + " " + _w.s1 + " " + _w.t1 + "℃～" + _w.t2 + "℃  " + _w.d1 + _w.p1 + "级";
                       //#weather自己修改,天气样式自己打断点调试
                       $('div.tips_weather').html(tq);
                   }
               });
           });
       }

       $(function () {
           findWeather();
       });
   </script>
</head>
<body style="padding-top: 0;">
    <div class="container">
        <div class="div_logo">
        </div>
        <nav class="navbar navbar-default " role="navigation" style="margin-bottom: 15px;">
            <!-- We use the fluid option here to avoid overriding the fixed width of a normal container within the narrow content columns. -->
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-7">
                        <span class="sr-only">菜单</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">荆力总包
                    </a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-7">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">首页</a></li>
                        <li><a href="#">安全稽查</a></li>
                        <li><a href="#">安全网络图</a></li>
                        <li><a href="#">规章制度</a></li>
                        <li><a href="#">上级来文</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
        </nav>
        <div class="public_tips">
            <marquee style="width:57%;float:left;" scrollamount="5"><font color="red">重要公告：</font>2016-11-20 在**地区举行年度总结大会，请全体员工务必参与，不得缺席...</marquee> 
            <div class="tips_weather"></div>
        </div>
    </div>


    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="../upfiles/201611/img/1.jpg" alt="...">
                            <div class="carousel-caption">
                                这是是关于图片的摘要......
                            </div>
                        </div>
                        <div class="item">
                            <img src="../upfiles/201611/img/2.png" alt="...">
                            <div class="carousel-caption">
                                这是是关于图片的摘要......
                            </div>
                        </div>
                        <div class="item">
                            <img src="../upfiles/201611/img/3.jpg" alt="...">
                            <div class="carousel-caption">
                                这是是关于图片的摘要......
                            </div>
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-md-5">
                <div class="panel panel-primary">
                    <!-- Default panel contents -->
                    <div class="panel-heading" style="font-weight: bold">安 · 全 · 网 · 络 · 图</div>
                    <div class="panel-body">
                        <div>
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x250" alt="..." src="../upfiles/201611/img/netmap.jpg">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--     -->
        <div class="row">
            <div class="col-md-5">
                <div class="panel panel-primary" style="margin-bottom: 10px">
                    <!-- Default panel contents -->
                    <div class="panel-heading">安 · 全 · 稽 · 查<span class="myspan"><a href="news_list.aspx?news_type=安全稽查" target="_blank">更多>></a></span></div>
                    <div class="panel-body" style="padding-left: 0;">
                        <ul class="index_list">
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">李克强在第六次全国妇女儿童工作会议上强调...  <span class="myspan">[2016-09-21]</span></a> </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时...  <span class="myspan">[2016-09-21]</span> </a></li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时<span class="myspan">[2016-09-21]</span></a> </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时 <span class="myspan">[2016-09-21]</span></a>  </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时  <span class="myspan">[2016-09-21]</span></a>  </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时  <span class="myspan">[2016-09-21]</span></a> </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="panel panel-primary" style="margin-bottom: 10px">
                    <!-- Default panel contents -->
                    <div class="panel-heading">安 · 全 · 稽 · 查<span class="myspan"><a href="" target="_blank">更多>></a></span></div>
                    <div class="panel-body">
                        <ul class="index_list">
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">李克强在第六次全国妇女儿童工作会议上强调...  <span class="myspan">[2016-09-21]</span></a> </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时...  <span class="myspan">[2016-09-21]</span> </a></li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时<span class="myspan">[2016-09-21]</span></a> </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时 <span class="myspan">[2016-09-21]</span></a>  </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时  <span class="myspan">[2016-09-21]</span></a>  </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时  <span class="myspan">[2016-09-21]</span></a> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-5">
                <div class="panel panel-primary" style="margin-bottom: 10px">
                    <!-- Default panel contents -->
                    <div class="panel-heading">安 · 全 · 稽 · 查<span class="myspan"><a href="" target="_blank">更多>></a></span></div>
                    <div class="panel-body" style="padding-left: 0;">
                        <ul class="index_list">
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">李克强在第六次全国妇女儿童工作会议上强调...  <span class="myspan">[2016-09-21]</span></a> </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时...  <span class="myspan">[2016-09-21]</span> </a></li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时<span class="myspan">[2016-09-21]</span></a> </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时 <span class="myspan">[2016-09-21]</span></a>  </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时  <span class="myspan">[2016-09-21]</span></a>  </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时  <span class="myspan">[2016-09-21]</span></a> </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="panel panel-primary" style="margin-bottom: 10px">
                    <!-- Default panel contents -->
                    <div class="panel-heading">安 · 全 · 稽 · 查<span class="myspan"><a href="" target="_blank">更多>></a></span></div>
                    <div class="panel-body">
                        <ul class="index_list">
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">李克强在第六次全国妇女儿童工作会议上强调...  <span class="myspan">[2016-09-21]</span></a> </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时...  <span class="myspan">[2016-09-21]</span> </a></li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时<span class="myspan">[2016-09-21]</span></a> </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时 <span class="myspan">[2016-09-21]</span></a>  </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时  <span class="myspan">[2016-09-21]</span></a>  </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时  <span class="myspan">[2016-09-21]</span></a> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-5">
                <div class="panel panel-primary" style="margin-bottom: 10px">
                    <!-- Default panel contents -->
                    <div class="panel-heading">安 · 全 · 稽 · 查<span class="myspan"><a href="" target="_blank">更多>></a></span></div>
                    <div class="panel-body" style="padding-left: 0;">
                        <ul class="index_list">
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">李克强在第六次全国妇女儿童工作会议上强调...  <span class="myspan">[2016-09-21]</span></a> </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时...  <span class="myspan">[2016-09-21]</span> </a></li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时<span class="myspan">[2016-09-21]</span></a> </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时 <span class="myspan">[2016-09-21]</span></a>  </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时  <span class="myspan">[2016-09-21]</span></a>  </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时  <span class="myspan">[2016-09-21]</span></a> </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="panel panel-primary" style="margin-bottom: 10px">
                    <!-- Default panel contents -->
                    <div class="panel-heading">安 · 全 · 稽 · 查<span class="myspan"><a href="" target="_blank">更多>></a></span></div>
                    <div class="panel-body">
                        <ul class="index_list">
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">李克强在第六次全国妇女儿童工作会议上强调...  <span class="myspan">[2016-09-21]</span></a> </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时...  <span class="myspan">[2016-09-21]</span> </a></li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时<span class="myspan">[2016-09-21]</span></a> </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时 <span class="myspan">[2016-09-21]</span></a>  </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时  <span class="myspan">[2016-09-21]</span></a>  </li>
                            <li><a href="http://news.china.com.cn/world/2016-11/19/content_39740545.htm">习近平：中厄深化互利共赢合作恰逢其时  <span class="myspan">[2016-09-21]</span></a> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--页脚--%>
    <div class="container footer">
        Copyright©2016 荆力总包版权所有     地址：荆州**　 邮编：123456</br>
            鄂ICP备05003329号  鄂公网安备 42050202000133号 
    </div>
</body>
</html>
