<%-- 
    Document   : OneQuestion
    Created on : Feb 6, 2018, 10:26:13 PM
    Author     : Tiffany
 ?chapterNo=1&questionNo=1
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "rapid.Rapid" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id= "rapidID" class= "rapid.Rapid" scope= "application">
</jsp:useBean>
<%rapidID.setChapterNo(request.getParameter("chapterNo"));%>
<%rapidID.setQuestionNo(request.getParameter("questionNo"));%>
<%rapidID.check();%>

<!DOCTYPE html>
<style> form, th { border: 1px solid goldenrod; border-spacing: 1px; width: 50%}
    table, td { background: #6193cb; width: 50%; text-align: center; color: white}
    font.hinter {color: white}
</style>
<html>
    <head>
        <title>Multiple-Choice Question by Tiffany Tran</title>
        <script>
            function checkAns() {
                var text = document.getElementById("test");
                text.style.display = "block";
            }
            
            function hint() {
                var checkBox = document.getElementById("hint");
                text.style.display = "block";

                if (checkBox.checked === true) {
                    text.style.display = "block";
                } else {
                    text.style.display = "none";
                }
            }
        </script>
    </head>
    <body>
    <center>
        <table><td><b>Multiple-Choice Question Chapter <%out.print(rapidID.getChapterNo());%> Question <%out.print(rapidID.getQuestionNo());%></b></td></table>
        <%rapidID.check();%>
        <form method="post"> 
            <p align="left" style="margin-left: 40px">

                <font size="4"><%= rapidID.getQuestion()%></font><br></br>
                <%
                    if (rapidID.getAnswer().length() == 1) {
                        if (rapidID.getChoiceA().length() != 0) {
                            out.println("<input type=\"radio\" name=\"Sin\" value=\"a\"> A. " + rapidID.getChoiceA() + "<br>");
                        }
                        if (rapidID.getChoiceB().length() != 0) {
                            out.println("<input type=\"radio\" name=\"Sin\" value=\"b\"> B. " + rapidID.getChoiceB() + "<br>");
                        }
                        if (rapidID.getChoiceC().length() != 0) {
                            out.println("<input type=\"radio\" name=\"Sin\" value=\"c\"> C. " + rapidID.getChoiceC() + "<br>");
                        }
                        if (rapidID.getChoiceD().length() != 0) {
                            out.println("<input type=\"radio\" name=\"Sin\" value=\"d\"> D. " + rapidID.getChoiceD() + "<br>");
                        }
                        if (rapidID.getChoiceE().length() != 0) {
                            out.println("<input type=\"radio\" name=\"Sin\" value=\"e\"> E. " + rapidID.getChoiceE() + "<br>");
                        }
                        String l = request.getParameter("Sin");
                        out.println(l);
                    } else {
                        if (rapidID.getChoiceA().length() != 0) {
                            out.println("<input type=\"checkbox\" name=\"choice\" value=\"a\"> A. " + rapidID.getChoiceA() + "<br>");
                        }
                        if (rapidID.getChoiceB().length() != 0) {
                            out.println("<input type=\"checkbox\" name=\"choice\" value=\"b\"> B. " + rapidID.getChoiceB() + "<br>");
                        }
                        if (rapidID.getChoiceC().length() != 0) {
                            out.println("<input type=\"checkbox\" name=\"choice\" value=\"c\"> C. " + rapidID.getChoiceC() + "<br>");
                        }
                        if (rapidID.getChoiceD().length() != 0) {
                            out.println("<input type=\"checkbox\" name=\"choice\" value=\"d\"> D. " + rapidID.getChoiceD() + "<br>");
                        }
                        if (rapidID.getChoiceE().length() != 0) {
                            out.println("<input type=\"checkbox\" name=\"choice\" value=\"e\"> E. " + rapidID.getChoiceE() + "<br>");
                        }
                        out.println("<br><input id=\"submit\" type =\"submit\" onclick=\"checkAns();\"><p id=\"test\" style=\"display:none\">" + rapidID.getAnswer() + "</p>");
                    }
                %>
            </p>
        </form>
        <br>
        <input type ="submit" onclick="checkAns();">
        <p id="test" style="display:none"><%=rapidID.getChecker()%></p>
    </center>
Hint <input type="checkbox" id="hint" onclick="hint()">
    <p id="text" style="display:none"><%= rapidID.getHint()%></p>
    
</body>
</html>