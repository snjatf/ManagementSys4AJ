﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NetworkMap.aspx.cs" Inherits="WebPages.UnitManage.NetworkMap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>网络安全图</title>
    <script type="text/javascript">
        var options=<%=strJSON%>;
    </script>
</head>
<body>
    <!--Step:1 Prepare a dom for ECharts which (must) has size (width & hight)-->
    <!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->
    <div id="main" style="height:1500px;width:2800px;border:1px solid #ccc;padding:10px;overflow-y:auto;"></div>
    
    <!--Step:2 Import echarts.js-->
    <!--Step:2 引入echarts.js-->
    <script src="../assets/echarts/www/js/echarts.js"></script>

    <script type="text/javascript">
    // Step:3 conifg ECharts's path, link to echarts.js from current page.
    // Step:3 为模块加载器配置echarts的路径，从当前页面链接到echarts.js，定义所需图表路径
    require.config({
        paths: {
            echarts: '../assets/echarts/www/js'
        }
    });

    var netMapOp = {
        title: {
            text: '湖北荆力工程总承包有限责任公司安全网络图'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{b}: {c}"
        },
        toolbox: {
            show: true,
            feature: {
                mark: { show: false },
                dataView: { show: false, readOnly: false },
                restore: { show: false },
                saveAsImage: { show: true }
            }
        },
        calculable: false,

        series: [
            {
                name: '树图',
                type: 'tree',
                orient: 'vertical',  // vertical horizontal
                rootLocation: { x: 'center', y: 50 }, // 根节点位置  {x: 'center',y: 10}
                layerPadding:100,
                nodePadding: 5,
                symbol: 'curve',//curve rectangle
                symbolSize: [150,35],
                itemStyle: {
                    normal: {
                        label: {
                            show: true,
                            position: 'inside',
                            textStyle: {
                                color: '#111',
                                fontSize: 10,
                                fontWeight: 'bolder'
                            }
                        },
                        lineStyle: {
                            color: '#000',
                            width: 1,
                            type: 'broken' // 'curve'|'broken'|'solid'|'dotted'|'dashed'
                        }
                    },
                    emphasis: {
                        label: {
                            show: true
                        }
                    }
                },
                data: options
            }
        ]
    };

    // Step:4 require echarts and use it in the callback.
    // Step:4 动态加载echarts然后在回调函数中开始使用，注意保持按需加载结构定义图表路径
    require(
        [
            'echarts',
            'echarts/chart/bar',
            'echarts/chart/line',
            'echarts/chart/map',
             'echarts/chart/tree'
        ],


        function (ec) {
            //--- 折柱 ---
            var myChart = ec.init(document.getElementById('main'));
            myChart.setOption(netMapOp);
        });
    </script>
</body>
</html>
