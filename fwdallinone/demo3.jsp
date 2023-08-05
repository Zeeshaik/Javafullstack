<%@ page contentType="text/html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"  %>
<html>  
<body bgcolor=lightblue>  
<form   method=post     action=demo3.jsp>  
    <select  name="combo1"> 
      <option value="sam">sam 
      <option value="tom">tom
         </select>
<input   type=submit>
</form>
<c:set var="s" value="${param.combo1}" />
<c:out value="${s}"/>
<br> 

<c:if test="${s eq 'sam'  }">
   <c:out value="Good Morning...SAM!"  />
</c:if>

<c:if test="${s=='tom'}" >  
  <c:out value=" How Are You?....TOM!"  />  
</c:if>
</body>  
</html>  