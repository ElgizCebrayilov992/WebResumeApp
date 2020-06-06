<%-- 
    Document   : user
    Created on : May 30, 2020, 8:23:21 PM
    Author     : virtu
--%>

<%@page import="com.mycompany.entity.User"%>
<%@page import="com.mycompany.main.Contex"%>
<%@page import="com.mycompany.dao.inter.UserDaoInter"%>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table,th,td{
                border: 1px solid red;
            }


        </style>
    </head>
    <body>
        <% 
        UserDaoInter userDao=Contex.instanceUserDao();
        String name=request.getParameter("name");
        String surname=request.getParameter("surname");
            Integer birthPlaceId=null;
            if (birthPlaceId!=null){
                birthPlaceId=Integer.parseInt(request.getParameter("pid"));

            }
        List<User> list=userDao.getAll(name,surname,birthPlaceId);

       %>
       <div>
           <form action="user.jsp" method="POST">
               <input type="hidden" name="id" value=""/>
           <label for="name">name: </label>
       <input type="text" name="name" value=""/>
       <br>
       <label for="surname">surname: </label>
       <input type="text" name="surname" value=""/>
       <input type="submit" name="search" value="Search"/>
       </form>
              </div>
        <div>
            <table>
                <thead>
                <tr>
                <th>Name</th>
                <th>Surname</th>
                <th>BirthPlace</th>
                </tr>

                </thead>
                <tbody>
                <%
                    for (User u: list) {


                %>
                <tr>
                    <td><%=u.getName()%></td>
                    <td><%=u.getSurname()%></td>
                    <td><%=u.getNationality().getNationality()%></td>
                </tr>
                <%}%>
                </tbody>
            </table>



        </div>
        
    </body>
</html>
