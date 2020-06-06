/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.firstwebapp;

import com.mycompany.dao.inter.UserDaoInter;
import com.mycompany.entity.User;
import com.mycompany.main.Contex;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author virtu
 */
@WebServlet(name = "UserServlet", urlPatterns = {"/UserServlet"})
public class UserServlet extends HttpServlet {

    private UserDaoInter userDao=Contex.instanceUserDao();
    
 
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id=Integer.valueOf(request.getParameter("id"));
        String name=request.getParameter("name");
        String surname=request.getParameter("surname");
        
        System.out.println("name: "+name);
        System.out.println("surname: "+surname);
        
        User user=userDao.getById(id);
        
        user.setName(name);
        user.setSurname(surname);
        
        userDao.updateUser(user);
        
        response.sendRedirect("user.jsp");
        
    }

    
}
