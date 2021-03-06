<%@ page import="life.jobs.ManageJob" %>
<%@ page import="tool.Tool" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%--通知列表--%>
<%--
  Created by Intellij IDEA.
  User: WuHaoLin
  Date: 2/21/14
  Time: 3:01 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link href="../../lib/css/semantic.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../lib/css/main.css">
    <title>最新家教信息</title>

</head>
<body>
<div class="ui stackable three column page grid">

    <%--默认拿出前changeCount通知--%>
    <jsp:include page="GetAJAXServlet.jsp">
        <jsp:param name="target" value="<%=ManageJob.TARGET_PrivateTeacher%>"/>
        <jsp:param name="begin" value="0"/>
    </jsp:include>

    <%=Tool.makeAjaxLoadMoreBtnHtml()%>

    <div class="ui divider horizontal icon inverted"><i class="icon smile"></i></div>

    <div class="column">
        <div class="ui divided selection list inverted">
            <%--咨询电话--%>
            <div class="item">
                <i class="phone icon circular inverted black"></i>

                <div class="content">
                    <a class="header">81881616、67868534</a>

                    <div class="description">质询电话
                    </div>
                </div>
            </div>

            <%--咨询地点--%>
            <div class="item">
                <i class="location icon circular inverted teal"></i>

                <div class="content">
                    <a class="header">大学生活动中心207办公室</a>

                    <div class="description">咨询地点
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    <%
    Map<String,Object> params=new HashMap<>(1);
    params.put("target",ManageJob.TARGET_PrivateTeacher);
    %>
    <%=Tool.makeAJAXLoadMoreJS("GetAJAXServlet.jsp",params)%>
</script>
<jsp:include page="searchBox.jsp"/>

<script src="../../lib/js/jquery.min.js"></script>
<script src="../../lib/js/semantic.min.js"></script>
<script src="../../lib/js/main.js"></script>
</body>
</html>
