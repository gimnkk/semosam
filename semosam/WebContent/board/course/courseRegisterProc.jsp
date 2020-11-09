<%@page import="com.semosam.dto.courseDTO"%>
<%@page import="com.semosam.dao.courseDAO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.semosam.dao.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String email = (String) session.getAttribute("idKey");

	String realFolder = "";
	String saveFoleder = "uploadFile";
	String encType = "EUC-KR";
	int maxSize = 10 * 1024 * 1024;

	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFoleder);

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
			new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();

	String file = (String) files.nextElement();
	File teacherImage = multi.getFile(file);
	
	courseDTO dto = new courseDTO();

	String filename = (String) files.nextElement();
	File courseImage = multi.getFile(filename);
	dto.setCourseimage(courseImage.getName());
	dto.setTitle(multi.getParameter("title"));
	dto.setCategory(multi.getParameter("category"));
	dto.setDifficulty(multi.getParameter("difficulty"));
	dto.setMaxppl(Integer.parseInt(multi.getParameter("maxppl")));
	dto.setAddress(multi.getParameter("address"));
	dto.setContent(multi.getParameter("content"));
	dto.setNotice(multi.getParameter("notice"));
	courseDAO cDao = new courseDAO();
	boolean resultC = cDao.insertCourse(dto, email);
%>

<body>
	<%
		String msg = "������Ͽ� ���� �Ͽ����ϴ�.";
		String location = "document.referrer";
		if (resultC) {
			msg = "��������� �Ͽ����ϴ�.";
			location = "/JSP_PROJECT/board/scheduleRegister.jsp";
		}
	%>
	<script type="text/javascript">
	alert("<%=msg%>");
		location.href =	<%=location%>;
	</script>
</body>
</html>