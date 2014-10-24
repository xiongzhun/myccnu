<%--通知列表里获得AJAX通知--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="life.lose.MyLoseEntity" %>
<%@ page import="life.lose.ManageLose" %>
<%
	// 将请求、响应的编码均设置为UTF-8（防止中文乱码）
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String want = request.getParameter("want");
	int begin = Integer.parseInt(request.getParameter("begin"));
	try {
		List<MyLoseEntity> loseEntities = ManageLose.search_page(begin, want);
		if (loseEntities.size() > 0) {
%>
<div class="ui header">以下是包含了<%=want%>关键字的失物招领信息,看看有没有你想要的?</div>
<%
	for (MyLoseEntity one : loseEntities) {
%>
<div class="ui piled segment" id="<%=one.getId()%>">
	<%--描述--%>
	<h4><%=one.getMyDes()%>
	</h4>
	<hr>
	<%--发布时间--%>
	<div class="ui tiny labeled icon button">
		<%=one.getMyDate()%><i class="icon time"></i>
	</div>
	<%--失物地点--%>
	<%
		if(!one.getMyLocation().equals("")){
	%>
	<div class="ui right tiny labeled icon button">
		<i class="icon location"></i><%=one.getMyLocation()%>
	</div>
	<%
		}
	%>
	<%--联系方式--%>
	<%
		if(!one.getMyPhone().equals("")){
	%>
	<div class="ui right tiny labeled icon button" onclick="toCall(this)">
		<i class="icon mobile"></i>
		<%=one.getMyPhone()%>
	</div>
	<%
		}
	%>
	<%--目前状态--%>
	<div class="ui tiny labeled icon button" onclick="completeOne(this);">
		<%=one.stateString()%><i class="icon refresh"></i>
	</div>
	<%--失物还是招领--%>
	<div class="ui tiny labeled icon button">
		<%=one.loseOrUpdateChinese()%><i class="icon <%=one.loseOrUpdateGl()%>"></i>
	</div>
	<%--是否是今天的--%>
	<%
		if (one.today()) {
	%>
	<button class="ui tiny button">Today</button>
	<%
		}
	%>
</div>
<%
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
		return;
	}
%>