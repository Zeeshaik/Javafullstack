<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql"%>

<html>
<head>
<title>Updating a database using the sql:update tag</title>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/test" user="root" password="root"
	scope="session" />
</head>
<body>
<h3>This is example of update query using JSTL SQL Tags.</h3>
<form method="post">
<table>
	<tr>
		<td>User ID</td>
		<td><input type="text" name="uid"></td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="text" name="pwd"></td>
	</tr>
	<tr>
		<td>Enter First Name</td>
		<td><input type="text" name="fname"></td>
	</tr>
	<tr>
		<td>Enter Last Name</td>
		<td><input type="text" name="lname"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="submit"></td>
	</tr>
</table>
</form>
<c:if test="${pageContext.request.method=='POST'}">
	<c:catch var="exception">
		<sql:update dataSource="${dataSource}" var="updatedTable">
    INSERT INTO users VALUES (?, ?, ?, ?)
    <sql:param value="${param.uid}" />
			<sql:param value="${param.pwd}" />
			<sql:param value="${param.fname}" />
			<sql:param value="${param.lname}" />
		</sql:update>
		<c:if test="${updatedTable>=1}">
			<font size="5" color='green'> Congratulations ! Data inserted
			successfully.</font>
		</c:if>
	</c:catch>
	<c:if test="${exception!=null}">
		<c:out value="Unable to insert data in database." />
	</c:if>
</c:if>
</body>
</html>