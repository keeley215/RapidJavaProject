<%-- 
    Document   : Rapid2
    Created on : Feb 7, 2018, 6:46:11 PM
    Author     : ginger
 ?chapterNo=1&questionNo=1
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "rapid.Rapid" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id= "rapidID" class= "rapid.Rapid" scope= "session">
</jsp:useBean>
<%rapidID.setChapterNum(request.getParameter("chapterNo"));%>
<%rapidID.setQuestionNum(request.getParameter("questionNo"));%>
<%rapidID.check();%>

<!DOCTYPE html>
<style> form, th { border: 1px solid goldenrod; border-spacing: 1px; width: 50%}
    table, td { background: #6193cb; width: 50%; text-align: center; color: white}
    font.hinter {color: white}
</style>
<html>
    <head>
        <title>Multiple-Choice Question</title>
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
        <table><td><b>Multiple-Choice Question Chapter <%out.print(rapidID.getChapterNum());%> Question <%out.print(rapidID.getQuestionNum());%></b></td></table>
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
                        if(l!= null && l.equals(rapidID.getAnswer())){
                        out.println("Correct! <img src=\"https://liveexample.pearsoncmg.com/selftest/js/correct.jpg\" alt=\"Wrong\" height=\"20\" width=\"20\">");
                        rapidID.storeRadioAnswer(l, 1);
                        }
                        else if(l != null){
                            out.println("Incorrect! <img src=\"https://liveexample.pearsoncmg.com/selftest/js/wrong.jpg\" alt=\"Wrong\" height=\"20\" width=\"20\">"
                                    + "<br>The Correct answer is " + rapidID.getAnswer());
                            rapidID.storeRadioAnswer(l, 0);
                        }
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
                        int length = rapidID.getAnswer().length();
                        String[] l = request.getParameterValues("choice");
                        if(l != null){
                            StringBuilder temp = new StringBuilder();
                             for (int i = 0; i < l.length; i++) {
                                temp.append(l[i]);
                            }
                             String t = temp.toString();
                              if (l != null && t.equals(rapidID.getAnswer())) {
                                out.println("Correct! <img src=\"https://liveexample.pearsoncmg.com/selftest/js/correct.jpg\" alt=\"Wrong\" height=\"20\" width=\"20\">");
                                rapidID.storeCBAnswers(t, 1);
                            } else if (l != null) {
                                out.println("Incorrect.<img src=\"https://liveexample.pearsoncmg.com/selftest/js/wrong.jpg\" alt=\"Wrong\" height=\"20\" width=\"20\"><br>");
                                out.println("The correct answer is " + rapidID.getAnswer() + ".");
                                rapidID.storeCBAnswers(t, 0);
                            }
                        }
                        }
                %>
            </p>
            <input type ="submit" onclick="checkAns();" value = "Check My Answer">
            <p id="test" style="display:none"><%=rapidID.getChecker()%></p>
        </form>
        <br>
    </center>
        <% if(!rapidID.getHint().equals("")){
            out.println("Hint <input type=\"checkbox\" id=\"hint\" onclick=\"hint()\">");
            out.println("<p id=\"text\" style=\"display:none\">" + rapidID.getHint() + "</p>");
        }%>
</body>
</html>