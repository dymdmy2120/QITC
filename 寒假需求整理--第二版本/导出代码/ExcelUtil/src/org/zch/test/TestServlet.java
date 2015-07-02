package org.zch.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.zch.bean.Student;
import org.zch.bean.Teacher;
import org.zch.util.ExportUtil;

public class TestServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Teacher> testList = new ArrayList<Teacher>();
		for(int i=0; i<10; i++) {
			Teacher t = new Teacher();
			t.setId(i);
			t.setName("java " + i);
			testList.add(t);
		}
		
		String excelPath = this.getServletContext().getRealPath("") + "/WEB-INF/classes/export.xml";
System.out.println(excelPath);
		ExportUtil export = new ExportUtil(excelPath);
		export.buildExcel(testList, "teacher", "E://a.xls");
		response.setContentType("application/msexcel;charset=GBK");
		 response.setHeader("Content-Disposition", "attachment;filename=\""
		            + new String("a.xls".getBytes(), "ISO8859-1") + "\"");
		ExportUtil.export("E://a.xls", response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
}
