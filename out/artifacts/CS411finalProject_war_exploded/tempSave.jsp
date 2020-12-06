<%--
  Created by IntelliJ IDEA.
  User: Peter
  Date: 2020/12/1
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Save</title>
</head>
<body>
<%
    int position = Integer.parseInt(request.getParameter("position"));
    System.out.println(position);
    if (position == 1) {
        session.setAttribute("addCPU", request.getParameter("addCPU"));
        session.setAttribute("addCPUname", request.getParameter("addCPUname"));
    }

    if (position == 4) {
        session.setAttribute("addMB", request.getParameter("addMB"));
        session.setAttribute("addMBname", request.getParameter("addMBname"));
//        session.setAttribute("addMBsocket", request.getParameter("addMBsocket"));
    }

    if (position == 14) {
        session.setAttribute("addCooler", request.getParameter("addCooler"));
        session.setAttribute("addCoolername", request.getParameter("addCoolername"));
    }

    if (position == 6) {
        if (request.getParameter("addMemory1") != null) {
            session.setAttribute("addMemory", request.getParameter("addMemory1"));
            session.setAttribute("addMemoryname", request.getParameter("addMemory1name"));
            System.out.println("1");
        } else if (session.getAttribute("addMemory") != null) {
            if (!session.getAttribute("addMemory").equals("-1")) {
                position = 7;
                System.out.println("2");
            } else {
                session.setAttribute("addMemory", request.getParameter("addMemory"));
                session.setAttribute("addMemoryname", request.getParameter("addMemoryname"));
                System.out.println("3");
            }
        } else {
            session.setAttribute("addMemory", request.getParameter("addMemory"));
            session.setAttribute("addMemoryname", request.getParameter("addMemoryname"));
            System.out.println("4");
        }
    }

    if (position == 7) {
        if (request.getParameter("addMemory2") != null) {
            session.setAttribute("addMemory", request.getParameter("addMemory2"));
            session.setAttribute("addMemoryname", request.getParameter("addMemory2name"));
        } else {
            session.setAttribute("addMemory2", request.getParameter("addMemory"));
            session.setAttribute("addMemory2name", request.getParameter("addMemoryname"));
        }
    }

    if (position == 8) {
        if (request.getParameter("addStorage1") != null) {
            session.setAttribute("addStorage", request.getParameter("addStorage1"));
            session.setAttribute("addStoragename", request.getParameter("addStorage1name"));
        } else if (session.getAttribute("addStorage") != null) {
            if (!session.getAttribute("addStorage").equals("-1")) {
                position = 9;
            } else {
                session.setAttribute("addStorage", request.getParameter("addStorage"));
                session.setAttribute("addStoragename", request.getParameter("addStoragename"));
            }
        } else {
            session.setAttribute("addStorage", request.getParameter("addStorage"));
            session.setAttribute("addStoragename", request.getParameter("addStoragename"));
        }
    }

    if (position == 9) {
        if (request.getParameter("addStorage2") != null) {
            session.setAttribute("addStorage2", request.getParameter("addStorage2"));
            session.setAttribute("addStorage2name", request.getParameter("addStorage2name"));
        } else if (session.getAttribute("addStorage2") != null) {
            if (!session.getAttribute("addStorage2").equals("-1")) {
                position = 10;
            } else {
                session.setAttribute("addStorage2", request.getParameter("addStorage"));
                session.setAttribute("addStorage2name", request.getParameter("addStoragename"));
            }
        } else {
            session.setAttribute("addStorage2", request.getParameter("addStorage"));
            session.setAttribute("addStorage2name", request.getParameter("addStoragename"));
        }
    }

    if (position == 10) {
        if (request.getParameter("addStorage3") != null) {
            session.setAttribute("addStorage3", request.getParameter("addStorage3"));
            session.setAttribute("addStorage3name", request.getParameter("addStorage3name"));
        } else if (session.getAttribute("addStorage3") != null) {
            if (!session.getAttribute("addStorage3").equals("-1")) {
                position = 11;
            } else {
                session.setAttribute("addStorage3", request.getParameter("addStorage"));
                session.setAttribute("addStorage3name", request.getParameter("addStoragename"));
            }
        } else {
            session.setAttribute("addStorage3", request.getParameter("addStorage"));
            session.setAttribute("addStorage3name", request.getParameter("addStoragename"));
        }
    }

    if (position == 11) {
        if (request.getParameter("addStorage4") != null) {
            session.setAttribute("addStorage4", request.getParameter("addStorage4"));
            session.setAttribute("addStorage4name", request.getParameter("addStorage4name"));
        } else if (session.getAttribute("addStorage4") != null) {
            if (!session.getAttribute("addStorage4").equals("-1")) {
                position = 12;
            } else {
                session.setAttribute("addStorage4", request.getParameter("addStorage"));
                session.setAttribute("addStorage4name", request.getParameter("addStoragename"));
            }
        } else {
            session.setAttribute("addStorage4", request.getParameter("addStorage"));
            session.setAttribute("addStorage4name", request.getParameter("addStoragename"));
        }
    }

    if (position == 12) {
        if (request.getParameter("addStorage5") != null) {
            session.setAttribute("addStorage5", request.getParameter("addStorage5"));
            session.setAttribute("addStorage5name", request.getParameter("addStorage5name"));
        } else if (session.getAttribute("addStorage5") != null) {
            if (!session.getAttribute("addStorage5").equals("-1")) {
                position = 13;
            } else {
                session.setAttribute("addStorage5", request.getParameter("addStorage"));
                session.setAttribute("addStorage5name", request.getParameter("addStoragename"));
            }
        } else {
            session.setAttribute("addStorage5", request.getParameter("addStorage"));
            session.setAttribute("addStorage5name", request.getParameter("addStoragename"));
        }
    }

    if (position == 13) {
        if (request.getParameter("addStorage6") != null) {
            session.setAttribute("addStorage6", request.getParameter("addStorage6"));
            session.setAttribute("addStorage6name", request.getParameter("addStorage6name"));
        } else {
            session.setAttribute("addStorage6", request.getParameter("addStorage"));
            session.setAttribute("addStorage6name", request.getParameter("addStoragename"));
        }
    }

    if (position == 2) {
        if (request.getParameter("addGPU1") != null) {
            session.setAttribute("addGPU", request.getParameter("addGPU1"));
            session.setAttribute("addGPUname", request.getParameter("addGPU1name"));
        } else if (session.getAttribute("addGPU") != null) {
            if (!session.getAttribute("addGPU").equals("-1")) {
                position = 3;
            } else {
                session.setAttribute("addGPU", request.getParameter("addGPU"));
                session.setAttribute("addGPUname", request.getParameter("addGPUname"));
            }
        } else {
            session.setAttribute("addGPU", request.getParameter("addGPU"));
            session.setAttribute("addGPUname", request.getParameter("addGPUname"));
        }
    }

    if (position == 3) {
        if (request.getParameter("addGPU2") != null) {
            session.setAttribute("addGPU", request.getParameter("addGPU2"));
            session.setAttribute("addGPUname", request.getParameter("addGPU2name"));
        } else {
            session.setAttribute("addGPU2", request.getParameter("addGPU"));
            session.setAttribute("addGPU2name", request.getParameter("addGPUname"));
        }
    }

    if (position == 5) {
        session.setAttribute("addCase", request.getParameter("addCase"));
        session.setAttribute("addCasename", request.getParameter("addCasename"));
    }

    if (position == 15) {
        session.setAttribute("addPS", request.getParameter("addPS"));
        session.setAttribute("addPSname", request.getParameter("addPSname"));
    }
%>


<jsp:forward page="userShowall.jsp"></jsp:forward>


</body>
</html>
