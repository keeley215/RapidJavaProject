package rapid;

import java.sql.*;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Ginger
 */
public class Rapid {

    static String chapterNum = "1", sectionNum = "1";
    static String question = "", choiceA = "", choiceB = "", choiceC = "",
            choiceD = "", choiceE = "", answer = "", hint = "", selectedAnswer = "",
            randomWord = "", randomWord2 = "", questionNum = "";
    static String checker = "not working";
    private static PreparedStatement check;
    private static Connection conn;

    public Rapid() {
        conn = null;
        initializeJdbc();
    }

    public static void check() {
        try {
            check = conn.prepareStatement("Select * from johansen.intro11equiz where chapterNo = ? and questionNo = ?");

            check.setString(1, chapterNum);
            check.setString(2, questionNum);

            ResultSet result = check.executeQuery();
            if (result.next()) {
                chapterNum = result.getString(1);
                sectionNum = result.getString(2);
                question = result.getString(3);
                choiceA = result.getString(4);
                choiceB = result.getString(5);
                choiceC = result.getString(6);
                choiceD = result.getString(7);
                choiceE = result.getString(8);
                answer = result.getString(9);
                hint = result.getString(10);
            }

            System.out.println(question);
        } catch (Exception ex) {
            System.out.println(ex + " in check method");
        }
    }

    private static void initializeJdbc() {
        conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded");
            
            //local server
            //conn = DriverManager.getConnection("jdbc:mysql://localhost/javabook", "scott", "tiger");
            //liang server
            conn = DriverManager.getConnection("jdbc:mysql://35.185.94.191/johansen", "johansen", "tiger");

            System.out.println("Database connected");

        } catch (Exception x) {
            System.out.println(x + " when initializing the Database");
        }
    }

    public static void storeRadioAnswer(String answer, int num) {
        int a = 0, b = 0, c = 0, d = 0, e = 0;
        switch (answer) {
            case "a":
                a = 1;
                break;
            case "b":
                b = 1;
                break;
            case "c":
                c = 1;
                break;
            case "d":
                d = 1;
                break;
            case "e":
                e = 1;
                break;
        }
        java.util.Date date = new java.util.Date();
        java.sql.Timestamp sqlTime = new java.sql.Timestamp(date.getTime());
        try {
            check = conn.prepareStatement("Insert into johansen.intro11e(chapterNo, "
                    + "questionNo, isCorrect, time, hostname, answerA, "
                    + "answerB, answerC, answerD, answerE) values "
                    + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            check.setString(1, chapterNum);
            check.setString(2, questionNum);
            check.setInt(3, num);
            check.setTimestamp(4, sqlTime);
            check.setString(5, "johansen");
            check.setInt(6, a);
            check.setInt(7, b);
            check.setInt(8, c);
            check.setInt(9, d);
            check.setInt(10, e);
            check.executeUpdate();

        } catch (Exception ex) {
            System.out.println(ex + "Storing Radio Buttons");
        }
    }

    public static void storeCBAnswers(String answer, int num) {
        int a = 0, b = 0, c = 0, d = 0, e = 0;
        for (int i = 0; i < answer.length(); i++) {
            switch (answer.charAt(i)) {
                case 'a':
                    a = 1;
                    break;
                case 'b':
                    b = 1;
                    break;
                case 'c':
                    c = 1;
                    break;
                case 'd':
                    d = 1;
                    break;
                case 'e':
                    e = 1;
                    break;
            }
        }

        java.util.Date date = new java.util.Date();
        java.sql.Timestamp sqlTime = new java.sql.Timestamp(date.getTime());
        try {
            check = conn.prepareStatement("Insert into johansen.intro11e(chapterNo, "
                    + "questionNo, isCorrect, time, hostname, answerA, "
                    + "answerB, answerC, answerD, answerE) values "
                    + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            check.setString(1, chapterNum);
            check.setString(2, questionNum);
            check.setInt(3, num);
            check.setTimestamp(4, sqlTime);
            check.setString(5, "johansen");
            check.setInt(6, a);
            check.setInt(7, b);
            check.setInt(8, c);
            check.setInt(9, d);
            check.setInt(10, e);
            check.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex + "Storing Check Box Answers");
        }
    }
    
    public String getChecker() {
        return checker;
    }

    public void setChecker(String t) {
        checker = t;
    }

    public String getChapterNum() {
        return chapterNum;
    }

    public void setChapterNum(String t) {
        chapterNum = t;
    }

    public String getSectionNum() {
        return sectionNum;
    }

    public void setSectionNum(String t) {
        sectionNum = t;
    }

    public String getQuestionNum() {
        return questionNum;
    }

    public void setQuestionNum(String t) {
        questionNum = t;
    }

    public void formatQuestion() {
        String s = question;
        int[] temp1 = new int[2];
        int counter = 0;
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == '\"') {
                temp1[counter] = i;
                counter++;
            }
        }
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String t) {
        question = t;
    }

    public String getChoiceA() {
        return choiceA;
    }

    public void setChoiceA(String a) {
        choiceA = a;
    }

    public String getChoiceB() {
        return choiceB;
    }

    public void setChoiceB(String b) {
        choiceA = b;
    }

    public String getChoiceC() {
        return choiceC;
    }

    public void setChoiceC(String c) {
        choiceC = c;
    }

    public String getChoiceD() {
        return choiceD;
    }

    public void setChoiceD(String d) {
        choiceD = d;
    }

    public String getChoiceE() {
        return choiceE;
    }

    public void setChoiceE(String e) {
        choiceE = e;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String a) {
        answer = a;
    }

    public String getHint() {
        return hint;
    }

    public void setHint(String t) {
        hint = t;
    }
}
