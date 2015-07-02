package org.zch.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;


/**
 * 
 * @author zch
 *导出和excel的工具类
 */
public class ExportUtil {
	
	private String excelPath;
	
	public ExportUtil(String excelPath) {
		this.excelPath = excelPath;
	}
	
	
	/**
	 * 
	 * @param data 要生成excel的数据集合
	 * @param titles	生成excel文件的标题
	 * @param targetPath	生成excel的目标路径
	 * 保证导出的标题行与数据对应，那么保持标题行的列名和
	 * bean的get方法的顺序一致
	 */
	public void buildExcel(List<?> data, String titles, String targetPath) {

		String[] content = readXML(titles, excelPath);
		
		//声明一个工作簿
		HSSFWorkbook workbook = new HSSFWorkbook();
		//声明一个表格
		HSSFSheet sheet = workbook.createSheet();
		//设置表格宽度
		sheet.setDefaultColumnWidth(15);
	
		//生成标题行
		HSSFRow titleRow = sheet.createRow(0);
		for(int i=0; i<content.length; i++) {
			HSSFCell titleCell = titleRow.createCell(i);
			titleCell.setCellValue(content[i]);
		}
		
		//生成数据行
		for(int i=1; i<data.size(); i++) {
			HSSFRow dataRow = sheet.createRow(i);
			Class clazz = data.get(i).getClass();
			Method[] method = clazz.getDeclaredMethods();
			int index = 0;
			for(int j=0; j<method.length; j++) {
				String name = method[j].getName().substring(0, 3);
				if(name != null && name.equals("get")) {
					HSSFCell dataCell = dataRow.createCell(index);
					index ++;
					try {
						Object value = method[j].invoke(data.get(i));
						dataCell.setCellValue(value.toString());
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalArgumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		
		
		try {
			FileOutputStream fos = new FileOutputStream(targetPath);
			workbook.write(fos);
			fos.flush();
			fos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private String[] readXML(String name, String excelPath) {
		SAXReader reader = new SAXReader();
		Document doc = null;
		String[] content = null;
		try {
			doc = reader.read(new File(excelPath));
			Element root = doc.getRootElement();
			List<Element> elements = root.elements("project");
			for(int i=0; i<elements.size(); i++) {
				Element ele = elements.get(i);
				String proName = ele.attributeValue("name");
				if(proName.equals(name)) {
					List<Element> eles = ele.elements();
					content = new String[eles.size()];
					for(int j=0; j<eles.size(); j++) {
						content[j] = eles.get(j).getText();
					}
				}
			}
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		return content;
	}
	
	/**
	 * 
	 * @param originalPath	文件存在的路径
	 * @param response	response对象
	 * 使用下载前要先配置response的属性
	 * response.setContentType和response.setHeader
	 * 例如下载excel设置response.setContentType("application/msexcel;charset=GBK");
	 */
	public static void export (String originalPath, HttpServletResponse response) {
		FileInputStream fis = null;
		ServletOutputStream  out = null;
		
		try {
			fis = new FileInputStream(originalPath);
			out = response.getOutputStream();
			out.flush();
			int read = 0;
			while(fis != null && (read = fis.read()) != -1) {
				out.write(read);
			}
			out.flush();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				fis.close();
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
