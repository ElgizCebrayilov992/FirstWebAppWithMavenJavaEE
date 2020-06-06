<%-- 
    Document   : user
    Created on : May 30, 2020, 8:23:21 PM
    Author     : virtu
--%>

<%@page import="com.mycompany.entity.User"%>
<%@page import="com.mycompany.main.Contex"%>
<%@page import="com.mycompany.dao.inter.UserDaoInter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        UserDaoInter userDao=Contex.instanceUserDao();
        
if (request.getParameter("save")!=null&&request.getParameter("save").equals("Save")) {
    int id=Integer.valueOf(request.getParameter("id"));
        String name=request.getParameter("name");
        String surname=request.getParameter("surname");
        System.out.println("name: "+name);
        System.out.println("surname: "+surname);
        
        User user=userDao.getById(id);
        
        user.setName(name);
        user.setSurname(surname);
        
        userDao.updateUser(user);
        
        
    }
        User u=userDao.getById(5);


       %>
       <div>
           <form action="user.jsp"  method="POST">
               <input type="hidden" name="id" value="<%=u.getId()%>"/>
           <label for="name">name: </label>
       <input type="text" name="name" value="<%=u.getName()%>"/>
       <br>
       <label for="surname">surname: </label>
       <input type="text" name="surname" value="<%=u.getSurname()%>"/>
       <input type="submit" name="save" value="Save"/>
       </form>
              </div>
        
        
    </body>
</html>
