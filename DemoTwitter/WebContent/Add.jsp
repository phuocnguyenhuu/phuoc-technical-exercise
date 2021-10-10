<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="io.github.phuocnguyenhuu.model.Helper" %>
<%@ page import="io.github.phuocnguyenhuu.model.User" %>
<%@ page import="io.github.phuocnguyenhuu.model.Tweet" %>
<%@ page import="java.util.*" %>
<%
	String message = "";
	if(request.getParameter("createTweet") != null){
		String userName = (String) session.getAttribute("user_name");
		Tweet tweet = new Tweet();
		tweet.content = (String) request.getParameter("content");
		tweet.code = userName;
		
		
		tweet.Save();
		message = "Tweeter Created";
		
	}
%>
<%@ include file="layouts/header.jsp" %>
<div class="signpage">
<% if(!message.equals("")){ %>
	<div class="alert alert-info"><p><%= message %></p></div>
	<% } %>
	<form class="register_form" action="<%= Helper.baseUrl %>Add.jsp" method="post">
		
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-sm-offset-3">
				<div class="rs_form_box">
					<h3 class="form_section_title">
						Input your tweet!
					</h3>
					<div class="input-group">
						<label>What you are thinking?</label>
						<input type="text" name="content" class="form-controller">
					</div>
					
				</div>

			</div>
			<div class="col-xs-12 col-sm-12 text-center">
				<div class="rs_btn_group">
					<button class="btn btn-default pull-left" name="createTweet" value="submit" type="submit">Save</button>
					<button class="btn btn-default pull-left" name="comeback" value="submit" type="submit">Comeback</button>
				</div>
			</div>
		</div>
	</form>
</div>
<%@ include file="layouts/footer.jsp" %>