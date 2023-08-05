<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql"%>

<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/test" user="root" password="root" />

<html>
<head>
<title>Query Example</title>
</head>
<body>
<sql:query var="users" dataSource="${dataSource}">
select* from users;
</sql:query>

<table border=1>
	<c:forEach var="row" items="${users.rows}">
		<tr>
			<td><c:out value="${row.uid}" /></td>
			<td><c:out value="${row.pwd}" /></td>
			<td><c:out value="${row.fname}" /></td>
			<td><c:out value="${row.lname}" /></td>
			
		</tr>
	</c:forEach>
</table>
</body>
</html>