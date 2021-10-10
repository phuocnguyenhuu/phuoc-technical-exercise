<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="io.github.phuocnguyenhuu.model.Helper,io.github.phuocnguyenhuu.model.Tweet,java.util.ArrayList,io.github.phuocnguyenhuu.vo.tweet_vo,java.util.Iterator" %>   
<%@ include file="layouts/header.jsp" %>
<%
	Tweet air = new Tweet();

	/* Delete - it is not necessary. So I commented code
	if(request.getParameter("delete") != null){
		String trnId = (String) request.getParameter("delete");
		air.Delete(trnId);
	}
	*/
	
	if(request.getParameter("retweet") != null){
		String content = (String) request.getParameter("retweet");
		String userName = (String) session.getAttribute("user_name");		
		air.ReTweet(userName, content);
	}	

	ArrayList<tweet_vo> tweetList = new ArrayList<tweet_vo>();
	tweetList = air.getAll();
	Iterator tweetIterator = tweetList.iterator();
%>
<div class="text-right">
	<a class="btn btn-success" href="Add.jsp">Tweet</a>
</div>
<br>
<div class="box successfully_purschase_ticket">
	<h2 class="box_title">All status on Twitter Page</h2>
	<table class="table table-bordered">
		<tr>
			<td wide="50">Username</td>
			<td>Content</td>
			<td>Actions</td>
		</tr>
		<%
			while(tweetIterator.hasNext()){
				tweet_vo a = (tweet_vo) tweetIterator.next();
		%>
			<tr>
				<td><%= a.getCode() %></td>				
				<td><%= a.getContent() %></td>
				
				<%-- <td><a href="?delete=<%= a.getId() %>" class="btn btn-sm btn-danger">Delete</a></td> --%>
				<td><a href="?retweet=<%= a.getContent() %>" class="btn btn-sm btn-danger">Re-tweet</a></td>
			</tr>
			<%
		}
		%>
		
	</table>
</div>
<%@ include file="layouts/footer.jsp" %>