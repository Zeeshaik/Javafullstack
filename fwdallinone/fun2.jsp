  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:if test="${pageContext.request.method=='POST'}">            

            <c:set var="string" value="${param.string}"/>
            <font size="5" color="green">
                <c:if test="${param.case=='upper'}">

                    <c:out value="${fn:toUpperCase(string)}"/>

                </c:if>
                <c:if test="${param.case=='lower'}">

                    <c:out value="${fn:toLowerCase(string)}"/>

                </font>
            </c:if>
        </c:if>