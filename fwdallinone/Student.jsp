<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %><%@ taglib uri="http://java.sun.com/jstl/xml" prefix="x" %>
<html>
  <head>
    <title>For Each Examples</title>
  </head>

  <body>
    <c:import var="students" url="Student.xml" />

    <x:parse var="doc" xml="${students}" />

    <table border="1">
      <tr>
        <th>First</th>

        <th>Last</th>

        <th>Points</th>

        <th>Letter</th>
      </tr>

      <x:forEach var="student" select="$doc/students/student">
        <tr>
          <td>
            <x:out select="name/first" />
          </td>

          <td>
            <x:out select="name/last" />
          </td>

          <td>
            <x:out select="grade/points" />
          </td>

          <td>
            <x:out select="grade/letter" />
          </td>
        </tr>
      </x:forEach>
    </table>
  </body>
</html>
