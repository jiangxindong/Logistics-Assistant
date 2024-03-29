<%@ page import="pers.geolo.logisticsassistant.entity.User" %>
<%@ page import="pers.geolo.logisticsassistant.value.UserType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>我要发货-物流助手</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/ready.css">
    <link rel="stylesheet" href="assets/css/demo.css">

    <script type="text/javascript">
        function changeInputStatus() {
            var x = document.getElementsByClassName("form-control");
            var i;
            for (i = 0; i < x.length; i++) {
                console.log(x[i].id);
                if (x[i].id !== "username") {
                    x[i].disabled = false;
                }
            }
        }
        function typeChange() {
            changeInputStatus();
            document.getElementById("username").disabled = false;
            return false;
        }
    </script>
    <script src="assets/js/PermissionCheck.js"></script>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        user = new User();
    }
%>
<div id="stateTag" style="display: none;"><%=user.getUsername()%></div>
<div id="identity" style="display: none;"><%=user.getUserType()%></div>
<div class="wrapper">
    <div class="main-header">
        <div class="logo-header">
            <a href="index" class="logo">
                物流助手
            </a>
        </div>
        <nav class="navbar navbar-header navbar-expand-lg" style="margin-top:10px;">
            <div class="container-fluid" >
                <form class="navbar-left navbar-form nav-search mr-md-3" action="">
                    <div class="input-group">
                        <input type="text" placeholder="Search ..." class="form-control">
                        <div class="input-group-append">
								<span class="input-group-text">
									<i class="la la-search search-icon"></i>
								</span>
                        </div>
                    </div>
                </form>
                <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">

                    <div id="login_or_register" class="btn-group" role="group" aria-label="...">
                        <a href="login" class="btn btn-default">登录</a>
                        <a href="register" class="btn btn-default">注册</a>
                    </div>
                    <li id="profileLi" class="nav-item dropdown">
                        <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#"
                           aria-expanded="false">
                            <img src="assets/img/profile.jpg" alt="user-img" width="36"
                                 class="img-circle">
                            <span><%=user.getUsername()%></span></span>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li>
                                <!-- 右上用户信息列表 -->
                                <div class="user-box">
                                    <div class="u-img">
                                        <img src="assets/img/profile.jpg" alt="user">
                                    </div>
                                    <div class="u-text">
                                        <h4><%=user.getUsername()%>
                                        </h4>
                                        <p class="text-muted"><%=user.getEmail()%>
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="profile"><i class="ti-user"></i>我的资料</a>
                            <a class="dropdown-item" href="message"></i>我的消息</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="logout"><i class="fa fa-power-off"></i>注销登录</a>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <!-- 左侧导航栏 -->
    <div class="sidebar" id="sidebar">
        <div class="scrollbar-inner sidebar-wrapper">
            <div class="user">
                <div class="photo">
                    <img src="assets/img/profile.jpg">
                </div>
                <div class="info">
                    <a class="" data-toggle="collapse" href="#collapseExample" aria-expanded="true">
							<span>
								<%=user.getUsername()%>
								<span class="user-level">
                                    <%
                                        if (user.getUserType() == UserType.DRIVER) {
                                            out.println("司机");
                                        } else if (user.getUserType() == UserType.SHIPPER) {
                                            out.println("货主");
                                        } else {
                                            out.println("未定义");
                                        }
                                    %>
                                </span>
								<span class="caret"></span>
							</span>
                    </a>
                    <div class="clearfix"></div>

                    <div class="collapse in" id="collapseExample" aria-expanded="true" style="">
                        <ul class="nav">
                            <li>
                                <a href="profile">
                                    <span class="link-collapse">我的资料</span>
                                </a>
                            </li>
                            <li>
                                <a href="message">
                                    <span class="link-collapse">我的消息</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <ul class="nav">
                <li class="nav-item active">
                    <a href="index">
                        <i class="la la-dashboard"></i>
                        <p>主页</p>
                        <!-- <span class="badge badge-count">5</span> -->
                    </a>
                </li>
                <li class="nav-item shippers">
                    <a href="myPublish">
                        <i class="la la-table"></i>
                        <p>我的发布</p>
                    </a>
                </li>
                <li class="nav-item shippers">
                    <a href="publish">
                        <i class="la la-keyboard-o"></i>
                        <p>我要发货</p>
                    </a>
                </li>
                <li class="nav-item drivers">
                    <a href="allPublished">
                        <i class="la la-car"></i>
                        <p>我要接单</p>
                    </a>
                </li>
                <li class="nav-item drivers">
                    <a href="myRequest">
                        <i class="la la-bell"></i>
                        <p>我的请求</p>
                    </a>
                </li>
                <li class="nav-item drivers">
                    <a href="tradeOrder">
                        <i class="la la-font"></i>
                        <p>我的订单</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <script> permissionCheck();</script>
    <!-- main-panel -->
    <div class="main-panel">
        <div class="content">
            <div class="container-fluid">
                <!-- 表单 -->
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h6>用户信息</h6>
                        </div>
                        <form method="post">
                            <div class="card-body">
                                <input type="text" name="id" value=<%= user.getId()%> hidden>
                                <div class="form-group form-inline">
                                    <label class="col-md-2 col-form-label"><strong>用户名:</strong></label>
                                    <div class="col-md-9 p-0">
                                        <input type="text" name="username" id="username"
                                               class="form-control input-full"
                                               value=<%= user.getUsername()%> disabled>
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="col-md-2 col-form-label"><strong>密码:</strong></label>
                                    <div class="col-md-9 p-0">
                                        <input type="password" name="password"
                                               class="form-control input-full"
                                               value=<%= user.getPassword()%>  disabled>
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="col-md-2 col-form-label"><strong>邮箱:</strong></label>
                                    <div class="col-md-9 p-0">
                                        <input type="email" name="email"
                                               class="form-control input-full"
                                               value=<%= user.getEmail()%>  disabled>

                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="col-md-2 col-form-label"><strong>用户类型:</strong></label>
                                    <div class="col-md-9 p-0">
                                        <input type="text" name="userType"
                                               class="form-control input-full"
                                               value=<%= user.getUserType()%>  disabled>
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="col-md-2 col-form-label"><strong>真实姓名:</strong></label>
                                    <div class="col-md-9 p-0">
                                        <input type="text" name="realName"
                                               class="form-control input-full"
                                               value=<%= user.getRealName()%> disabled>
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="col-md-2 col-form-label"><strong>电话号码:</strong></label>
                                    <div class="col-md-9 p-0">
                                        <input type="number" name="telephone"
                                               class="form-control input-full"
                                               value=<%= user.getTelephone()%> disabled>
                                    </div>
                                </div>
                                <!-- 司机属性 -->
                                <div class="form-group form-inline">
                                    <label class="col-md-2 col-form-label"><strong>车辆类型:</strong></label>
                                    <div class="col-md-9 p-0">
                                        <input type="text" name="vehicleType"
                                               class="form-control input-full"
                                               value=<%= user.getVehicleType()%> disabled>
                                        <%--<select class="form-control" disabled="disabled">--%>
                                            <%--<%--%>
                                                <%--out.println("<option></option>");--%>
                                            <%--%>--%>
                                            <%----%>
                                            <%--<option>2</option>--%>
                                            <%--<option>3</option>--%>
                                            <%--<option>4</option>--%>
                                            <%--<option>5</option>--%>
                                        <%--</select>--%>
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="col-md-2 col-form-label"><strong>车牌号码:</strong></label>
                                    <div class="col-md-9 p-0">
                                        <input type="text" name="licensePlateNumber"
                                               class="form-control input-full"
                                               value=<%= user.getLicensePlateNumber()%> disabled>
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="col-md-2 col-form-label"><strong>运输类型:</strong></label>
                                    <div class="col-md-9 p-0">
                                        <input type="text" name="transportableType"
                                               class="form-control input-full"
                                               value=<%= user.getTransportableType()%> disabled>
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="col-md-2 col-form-label"><strong>地址:</strong></label>
                                    <div class="col-md-9 p-0">
                                        <input type="text" name="address"
                                               class="form-control input-full"
                                               value=<%= user.getAddress()%> disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="button" align="center">
                                <button type="button" class="btn btn-warning"
                                        onclick="changeInputStatus()">编辑信息
                                </button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <!--<button type="button" class="btn btn-success">保存修改-->
                                <!--</button>-->
                                <input type="submit" onclick="typeChange()" class="btn btn-success" value="保存修改">
                                <div><br></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script src="assets/js/core/jquery.3.2.1.min.js"></script>
<script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="assets/js/core/popper.min.js"></script>
<script src="assets/js/core/bootstrap.min.js"></script>
<script src="assets/js/plugin/chartist/chartist.min.js"></script>
<script src="assets/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
<script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="assets/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="assets/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="assets/js/plugin/chart-circle/circles.min.js"></script>
<script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="assets/js/ready.min.js"></script>
</html>