<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
          rel="stylesheet">
    <style>
        span{
            font-size: 20px;
            color: #886b19;
            padding-left: 5px;
        }
        .father {
            margin: 0 auto;
            margin-left: 4px;
            width: 99%;
            padding-left:0;
            display: flex;
            justify-content: space-between;
            align-items: center;/*文字居中*/
        }
        .father .divleft {
            display: flex;
            width: 50%;
            height: 500px;
            align-items: center;
            border:1px solid #4e555b;
        }
        .father .divright {
            display: flex;
            align-items: center;
            margin-right: 10px;
            background-color: #FFFFFF;
            border:1px solid #4e555b;
        }

        .query-form {
            padding-top: 15px;
            background-color: #fff;
            padding-left: 15px;
            margin-bottom: 10px;
        }

        .panel-heading{
            padding-top: 15px;
            background-color: #fff;
            padding-left: 15px;
            margin-bottom: 10px;
        }

        .header{
            margin-top: 2px;
            margin-left: 5px;
            border: 3px solid #e7e6e6;
            box-shadow: 0px 0px 10px #ccc;
            height: 54px;
            display: flex;
            align-items: center;
        }
        .main-content .row{
            margin-left: 5px !important;
        }
        .col-sm-5,.col-sm-6{
            margin-top: 5px;
            border: 1px solid #e7e6e6;
            box-shadow: 0px 0px 10px #ccc;
        }

    </style>
</head>
<body>
<div class="header">
    <span>欢迎登录到网上书店后台管理系统</span>
</div>
<div class="main-content">
    <div class="row">
        <div class="col-sm-5 col-md-6">
            <div class="panel-heading no-collapse text-center" style="font-size:20px">图书一周销售情况
                <div id="container" style="height: 480px;width:550px;margin-right: 2px;margin-top:5px;"></div>
            </div>
        </div>
        <div class="col-sm-5 col-md-6">
            <div class="panel-heading no-collapse text-center" style="font-size:20px">图书分类销售情况</div>
            <div id="container2" style="height: 480px;width:550px;margin-right: 2px;margin-top:5px;"></div>
        </div>
    </div>

</div>
<script src="../../js/echarts.min.js" type="text/javascript"></script>
<script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    var option;
    option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },
        toolbox: {
            feature: {
                dataView: { show: true, readOnly: false },
                magicType: { show: true, type: ['line', 'bar'] },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        legend: {
            data: ['星期', '数量', '销售总额']
        },
        xAxis: [
            {
                type: 'category',
                data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                axisPointer: {
                    type: 'shadow'
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '数量',
                min: 0,
                max: 250,
                interval: 50,
                axisLabel: {
                    formatter: '{value} '
                }
            },
            {
                type: 'value',
                name: '销售总额',
                min: 0,
                max: 2500,
                interval: 500,
                axisLabel: {
                    formatter: '{value} '
                }
            }
        ],
        series: [
            {
                name: '星期',
                type: 'bar',
                data: [
                    2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3
                ]
            },
            {
                name: '数量',
                type: 'bar',
                data: [
                    2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3
                ]
            },
            {
                name: '销售总额',
                type: 'line',
                yAxisIndex: 1,
                data: [200, 220, 330, 450, 630, 1020, 2030, 2340, 2300, 1650, 1200, 620]
            }
        ]
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }



    //    第二个
    var dom2 = document.getElementById("container2");
    var myChart2 = echarts.init(dom2);
    var app2 = {};

    var option2;



    option2 = {
        tooltip: {
            trigger: 'item'
        },
        legend: {
            top: '5%',
            left: 'center'
        },
        series: [
            {
                name: '销售数量',
                type: 'pie',
                radius: ['40%', '70%'],
                avoidLabelOverlap: false,
                label: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    label: {
                        show: true,
                        fontSize: '40',
                        fontWeight: 'bold'
                    }
                },
                labelLine: {
                    show: false
                },
                data: [
                    { value: 1048, name: '分类C001' },
                    { value: 735, name: '分类C002' },
                    { value: 580, name: '分类C003' },
                    { value: 484, name: '分类C004' },
                    { value: 300, name: '分类C005' }
                ]
            }
        ]
    };

    if (option2 && typeof option2 === 'object') {
        myChart2.setOption(option2);
    }
</script>
</body>
</html>
