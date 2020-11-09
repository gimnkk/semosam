<%@page import="com.semosam.dto.courseDTO"%>
<%@page import="com.semosam.dao.courseDAO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	boolean resultC = false;

	try {
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		courseDTO dto = new courseDTO();
		Enumeration files = multi.getFileNames();
	
		String file = (String) files.nextElement();
		File courseImage = multi.getFile(file);
		
		dto.setCourseimage(courseImage.getName());
		dto.setTitle(multi.getParameter("title"));
		dto.setCategory(multi.getParameter("category"));
		dto.setDifficulty(multi.getParameter("difficulty"));
		dto.setMaxppl(Integer.parseInt(multi.getParameter("maxppl")));
		dto.setAddress(multi.getParameter("address"));
		dto.setContent(multi.getParameter("content"));
		dto.setNotice(multi.getParameter("notice"));
		courseDAO daoC = new courseDAO();
		resultC = daoC.insertCourse(dto, email);
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<body>
	<%
		String msg = "수업등록에 실패 하였습니다.";
		String location = "document.referrer";
		if (resultC) {
			msg = "수업등록을 하였습니다.";
			location = "/JSP_PROJECT/board/teacher/teacherContent.jsp";
		}
	%>
	<script type="text/javascript">
		alert("<%=msg%>");
		location.href =	'<%=location%>';
	</script>
</body>
</html>